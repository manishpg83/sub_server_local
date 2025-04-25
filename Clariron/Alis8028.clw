

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8028.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form plates
!!! </summary>
Updateplates PROCEDURE 

CurrentTab           STRING(80)                            !
locPlateNumber       STRING(13)                            !
ActionMessage        CSTRING(40)                           !
locPrinterError      STRING(32)                            !
EnhancedFocusManager EnhancedFocusClassType
History::PLT:Record  LIKE(PLT:RECORD),THREAD
QuickWindow          WINDOW('Form plates'),AT(,,257,136),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('Updateplates'),SYSTEM
                       BUTTON('&OK'),AT(195,108,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(125,108,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(38,122,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       PROMPT('DATE:'),AT(76,26),USE(?PLT:DATE:Prompt),TRN
                       ENTRY(@d1),AT(129,26,64,10),USE(PLT:DATE),RIGHT(1)
                       PROMPT('TYPE:'),AT(76,41),USE(?PLT:TYPE:Prompt),TRN
                       ENTRY(@n3),AT(129,41,40,10),USE(PLT:TYPE),RIGHT(1)
                       PROMPT('FILENAME:'),AT(76,54),USE(?PLT:FILENAME:Prompt),TRN
                       ENTRY(@s9),AT(129,54,45,10),USE(PLT:FILENAME)
                       BUTTON('Print Label'),AT(66,76,48),USE(?ButtonPrint)
                       STRING(@s32),AT(115,78,129,11),USE(locPrinterError),FONT('Microsoft Sans Serif',,COLOR:Red, |
  FONT:bold)
                       BUTTON('Read In'),AT(178,54,48,11),USE(?ButtonReadIn)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    CLOSE(Text)
    REMOVE('labels.txt')
    gloFileName = 'labels.txt'
  GlobalErrors.SetProcedureName('Updateplates')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OK
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PLT:Record,History::PLT:Record)
  SELF.AddHistoryField(?PLT:DATE,1)
  SELF.AddHistoryField(?PLT:TYPE,2)
  SELF.AddHistoryField(?PLT:FILENAME,3)
  SELF.AddUpdateFile(Access:plates)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Text.Open                                         ! File Text used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                                       ! File plates used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:plates
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PLT:DATE{PROP:ReadOnly} = True
    ?PLT:TYPE{PROP:ReadOnly} = True
    ?PLT:FILENAME{PROP:ReadOnly} = True
    DISABLE(?ButtonPrint)
    DISABLE(?ButtonReadIn)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Updateplates',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  gloPrinterStatus  = ModemStat(CommPort)
  Rts(CommPort,1)
  Dtr(CommPort,1)
  CommStatus = ModemStat(CommPort)
  IF BAND(CommStatus,020h)
    DTR = True
  ELSE
    DTR = False
  .
  IF BAND(CommStatus,010h)
   CTS = True
  ELSE
    CTS = False
  .
  IF ~DTR OR ~CTS
    locPrinterError = 'No Printer DTR=' & DTR & '  CTS=' & CTS
  ELSE
    ENABLE(?ButtonPrint)
  .
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'»',8)
  EnhancedFocusManager.DisableControlType(CREATE:Radio)
  EnhancedFocusManager.DisableControlType(CREATE:Check)
  EnhancedFocusManager.DisableControlType(CREATE:Combo)
  EnhancedFocusManager.DisableControlType(CREATE:List)
  EnhancedFocusManager.DisableControlType(CREATE:DropCombo)
  EnhancedFocusManager.DisableControlType(CREATE:DropList)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Text.Close
    Relate:plates.Close
  END
  IF SELF.Opened
    INIMgr.Update('Updateplates',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ButtonPrint
      ThisWindow.Update
      locPlateNumber = '1' & SUB(PLT:FILENAME,1,5) & '-' & SUB(PLT:FILENAME,7,1) & ' ' & CLIP(gloTypeDescription[PLT:Type])
      TXT:Text = 'N<10>B' & gloPlateBarcodeXpos & ',' & gloPlateBarcodeYpos & ',' & gloPlateBarcodeRotation & ',3,3,6,' & gloPlateBarcodeHeight  & ',N,"' & CLIP(locPlateNumber) & '"<10>'
      ADD(Text)
      TXT:Text = 'A' & gloPlateNameXpos & ',' & gloPlateNameYpos & ',' & gloPlateNameRotation & ',4,1,1,N,"' & CLIP(locPlateNumber) & '"<10>'
      ADD(Text)
      CLOSE(Text)
      !    SLEEP(1000)
      !    RUN('NOTEPAD.exe labels.txt') 
      IF DTR AND CTS
        InitStr = 'N<10>B' & gloPlateBarcodeXpos & ',' & gloPlateBarcodeYpos & ',' & gloPlateBarcodeRotation & ',3,3,6,' & gloPlateBarcodeHeight  & ',N,"' & CLIP(locPlateNumber) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A' & gloPlateNameXpos & ',' & gloPlateNameYpos & ',' & gloPlateNameRotation & ',4,1,1,N,"' & CLIP(locPlateNumber) & '"<10>P1<10>'
        ComPuts(CommPort,InitStr)
      ELSE
        STOP('No Printer DTR=' & DTR & '  CTS=' & CTS)
      .
      !  InitStr = 'A' & gloPlateDateXpos & ',' & gloPlateDateYpos & ',0,3,1,1,N,"' & FORMAT(PLT:Date,@D1) & '"<10>P1<10>'
      !  ComPuts(CommPort,InitStr)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  EnhancedFocusManager.TakeEvent()
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

