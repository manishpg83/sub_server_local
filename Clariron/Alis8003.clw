

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8003.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8008.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Pnl_test
!!! </summary>
UpdatePnl_test PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
locDescription       STRING(20)                            !
TestRecord           GROUP,PRE(SAV)                        !
Panel                STRING(9)                             !
Code                 LIKE(PT:CODE)                         !
Type                 LIKE(PT:Type)                         !
Description          STRING(24)                            !
                     END                                   !
EnhancedFocusManager EnhancedFocusClassType
History::PT:Record   LIKE(PT:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),GRAY,MDI,HLP('UpdatePnl_test')
                       STRING('Panel Test'),AT(166,108,164,13),USE(?String2),FONT(,16,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       PROMPT('Code:'),AT(164,248),USE(?Pnl:CODE:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s7),AT(188,246,40,10),USE(PT:CODE),UPR
                       STRING(@s30),AT(232,246,199,16),USE(locDescription),FONT(,14,,FONT:bold),TRN
                       BUTTON('Lookup Test'),AT(164,262,76,15),USE(?LookupButton),FONT(,,,FONT:bold),TRN
                       OPTION,AT(174,124,144,96),USE(PT:TYPE),TRN
                         RADIO('Panel'),AT(180,134,130,16),USE(?PT:TYPE:Panel),FONT(,,,FONT:bold),ICON(ICON:None),TRN, |
  VALUE('0')
                         RADIO('IgE'),AT(180,154,61,16),USE(?Option1:Radio1),FONT(,,COLOR:Black,FONT:bold),COLOR(COLOR:Red), |
  ICON(ICON:None),TRN,VALUE('1')
                         RADIO('IgG'),AT(180,173,61,16),USE(?Pnl:TYPE:Radio2),FONT(,,COLOR:Black,FONT:bold),COLOR(COLOR:Blue), |
  ICON(ICON:None),TRN,VALUE('2')
                         RADIO('IgG4'),AT(180,192,61,16),USE(?Pnl:TYPE:Radio2:2),FONT(,,COLOR:Black,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN,VALUE('3')
                         RADIO('IVG'),AT(250,154,61,16),USE(?PT:TYPE:Radio4),ICON(ICON:None),TRN,VALUE('7')
                         RADIO('IVM'),AT(250,173,61,16),USE(?PT:TYPE:Radio5),ICON(ICON:None),TRN,VALUE('8')
                         RADIO('TIgA'),AT(250,192,61,16),USE(?PT:TYPE:Radio6),ICON(ICON:None),HIDE,TRN,VALUE('5')
                       END
                       BUTTON('&Done'),AT(420,290,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DEFAULT,MSG('Accept data and close the window'),TIP('Accept data and close the window'), |
  TRN
                       IMAGE('button.jpg'),AT(164,262,76,15),USE(?Image4)
                       IMAGE('button.jpg'),AT(166,102,164,138),USE(?Image3)
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(420,208,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(420,208,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(0,136,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
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

GetDescription  ROUTINE
  SELECT(?PT:CODE)
  IF ~PT:CODE OR PT:CODE = PT:PANEL
    locDescription = ''
    DISPLAY(?locDescription)
    DISPLAY()
    EXIT
  .
  PAN:Number = PT:CODE
  GET(Panels,PAN:Order_Key)
  IF ERRORCODE()
    IF PT:TYPE
      RST:NUMBER = PT:CODE
      GET(Rast,RST:ORDER_KEY)
      IF ERRORCODE()
        locDescription = ''
        PT:CODE = ''
      ELSE
        locDescription = RST:DESCRIPTION
      .
    ELSE
      PT:CODE = ''
      locDescription = ''
    .
  ELSE
    locDescription = PAN:DESCRIPTION
    PT:Type = 0
  .
  IF PT:TYPE
    ?lookupButton{PROP:Text} = 'Look Up Test'
  ELSE
    ?lookupButton{PROP:Text} = 'Look Up Panel'
  .
  DISPLAY()
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
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePnl_test')
  SAV:Panel = PAN:Number
  SAV:Description = PAN:Description
  SAV:Code = PT:CODE
  SAV:Type = PT:TYPE
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PT:Record,History::PT:Record)
  SELF.AddHistoryField(?PT:CODE,2)
  SELF.AddHistoryField(?PT:TYPE,3)
  SELF.AddUpdateFile(Access:Pnl_test)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Pnl_test
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
    ?PT:CODE{PROP:ReadOnly} = True
    DISABLE(?LookupButton)
    ?PT:TYPE{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:wallpaper} = gloWallpaper
  DO GetDescription
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
    Relate:Pnl_test.Close
    Relate:Rast.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  PT:TYPE = 1
    SAV:Type = 1
    SAV:Code = ''
  PARENT.PrimeFields


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
    CASE ACCEPTED()
    OF ?OK
      POST(EVENT:Completed)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?PT:CODE
      ThisWindow.Update
      DO GetDescription
    OF ?LookupButton
      ThisWindow.Update
      DO GetDescription
      ThisWindow.Reset
      IF ~PT:CODE
        globalRequest = SelectRecord
        IF PT:TYPE
          RastTable()
          IF globalResponse = RequestCompleted
            PT:CODE = RST:NUMBER
            locDescription = RST:Description
            ThisWindow.Reset
          .
        ELSE
          Panels
          IF globalResponse = RequestCompleted
            PT:CODE = PAN:Number
            PT:TYPE = 0
            locDescription = PAN:Description
            ThisWindow.Reset
      . . .
      
    OF ?PT:TYPE
      DO GetDescription
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
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

