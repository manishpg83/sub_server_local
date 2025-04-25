

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8006.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Panels
!!! </summary>
UpdatePanels PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::PAN:Record  LIKE(PAN:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),RESIZE,GRAY,MDI,HLP('UpdatePanels')
                       STRING('Panel Description'),AT(126,75,203,13),USE(?String1),FONT(,16,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       BUTTON('View Tests'),AT(420,156,70,26),USE(?Tests),FONT(,,,FONT:bold),TRN
                       BUTTON('&Done'),AT(420,290,70,26),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DEFAULT,MSG('Accept data and close the window'),TIP('Accept data and close the window'), |
  TRN
                       BUTTON('&Cancel'),AT(420,228,70,26),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       PROMPT('NUMBER:'),AT(99,140),USE(?Pan:NUMBER:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s9),AT(136,140,40,10),USE(PAN:Number),UPR
                       PROMPT('DESCRIPTION:'),AT(80,156),USE(?Pan:DESCRIPTION:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s64),AT(136,156,224,10),USE(PAN:Description)
                       PROMPT('FEE:'),AT(115,172),USE(?Pan:FEE:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n-10.2),AT(136,172,48,10),USE(PAN:Fee),DECIMAL(12)
                       PROMPT('TESTS:'),AT(106,188),USE(?Pan:TESTS:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n-7),AT(136,188,40,10),USE(PAN:Tests),RIGHT(1)
                       BUTTON('&Help'),AT(0,122,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       IMAGE('button.jpg'),AT(420,156,70,26),USE(?Image3)
                       IMAGE('button.jpg'),AT(420,290,70,26),USE(?Image2)
                       IMAGE('button.jpg'),AT(420,228,70,26),USE(?Image1)
                       IMAGE('button.jpg'),AT(52,106,328,121),USE(?Image4)
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
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePanels')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PAN:Record,History::PAN:Record)
  SELF.AddHistoryField(?PAN:Number,1)
  SELF.AddHistoryField(?PAN:Description,2)
  SELF.AddHistoryField(?PAN:Fee,3)
  SELF.AddHistoryField(?PAN:Tests,9)
  SELF.AddUpdateFile(Access:Panels)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Panels
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Tests)
    ?PAN:Number{PROP:ReadOnly} = True
    ?PAN:Description{PROP:ReadOnly} = True
    ?PAN:Fee{PROP:ReadOnly} = True
    ?PAN:Tests{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
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
    Relate:Cli_panl.Close
    Relate:Panels.Close
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
    CASE ACCEPTED()
    OF ?Tests
      gloPanelNumber = Pan:NUMBER
    OF ?PAN:Number
      ThisWindow.Update
      GET(Panels,Pan:ORDER_KEY)
      IF ~ERRORCODE()
        IF SELF.Request = InsertRecord THEN SELF.Request = ChangeRecord.
        UPDATE()
      .
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Tests
      ThisWindow.Update
      IF PAN:Number
        IF SELF.Request = InsertRecord
          IF Access:Panels.TryInsert() <> Level:Benign    !add the new Client record
            PUT(Panels)
          .
          SELF.Request = ChangeRecord
        .
        Pan:TESTS = PanelTestTable(PAN:Number)
      ELSE
        SELECT(?)
      .
      ThisWindow.Reset
      
      !
    OF ?OK
      ThisWindow.Update
      IF Access:Panels.TryInsert() <> Level:Benign    !add the new Client record
        PUT(Panels)
      .
      IF CLI:Number
        CP:CLIENT = CLI:Number
        CP:PANEL =  Pan:NUMBER
        CP:DESCRIPTION = Pan:DESCRIPTION
        IF Access:Cli_Panl.TryInsert() <> Level:Benign    !add the new Client record
          PUT(Cli_Panl)
        .
      .
      POST(Event:CloseWindow)                          !if add succeeds, close down
      
        
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

