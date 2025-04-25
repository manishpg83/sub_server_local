

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8010.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Cli_panl
!!! </summary>
UpdateCli_panl PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
locCount             SHORT                                 !
EnhancedFocusManager EnhancedFocusClassType
History::CP:Record   LIKE(CP:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),GRAY,MDI,HLP('UpdateCli_panl')
                       PANEL,AT(166,130,163,85),USE(?Panel1),BEVEL(-1,-2)
                       BUTTON('&OK'),AT(420,290,70,25),USE(?OK),LEFT,ICON('SteelCheck.ico'),DEFAULT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('BUTTON.JPG'),AT(167,130,162,85),USE(?Image4)
                       IMAGE('BUTTON.JPG'),AT(420,138,70,25),USE(?Image3)
                       IMAGE('BUTTON.JPG'),AT(420,196,70,25),USE(?Image2)
                       IMAGE('BUTTON.JPG'),AT(420,290,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(420,196,70,25),USE(?Cancel),LEFT,ICON('SteelCancel.ico'),MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(0,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING('Client Panel'),AT(162,106,162,13),USE(?String1),FONT(,16,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       BUTTON('Panel Tests'),AT(420,138,70,25),USE(?PanelTestsButton),TRN
                       PROMPT('Panel:'),AT(192,160,40,11),USE(?CP:PANEL:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@s9),AT(234,158,40,10),USE(CP:Panel)
                       PROMPT('Description:'),AT(168,174,64,11),USE(?CP:DESCRIPTION:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                       ENTRY(@s24),AT(234,172,84,10),USE(CP:Description)
                       PROMPT('Fee:'),AT(202,186,30,11),USE(?CP:FEE:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@n-10.2),AT(234,184,48,10),USE(CP:Fee),DECIMAL(12)
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
  GlobalErrors.SetProcedureName('UpdateCli_panl')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CP:Record,History::CP:Record)
  SELF.AddHistoryField(?CP:Panel,2)
  SELF.AddHistoryField(?CP:Description,3)
  SELF.AddHistoryField(?CP:Fee,4)
  SELF.AddUpdateFile(Access:Cli_panl)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Cli_panl
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
    DISABLE(?PanelTestsButton)
    ?CP:Panel{PROP:ReadOnly} = True
    ?CP:Description{PROP:ReadOnly} = True
    ?CP:Fee{PROP:ReadOnly} = True
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
    OF ?PanelTestsButton
      gloPanelNumber = CP:Panel
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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

