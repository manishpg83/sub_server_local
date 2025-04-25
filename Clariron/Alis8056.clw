

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8056.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Phone
!!! </summary>
UpdatePhone PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::PHO:Record  LIKE(PHO:RECORD),THREAD
QuickWindow          WINDOW('Edit Phone'),AT(,,233,109),FONT('Arial',11,COLOR:Black,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdatePhysician'),SYSTEM
                       PROMPT('Phone:'),AT(50,30),USE(?PHO:Phone:Prompt),TRN
                       ENTRY(@p###-###-####p),AT(76,30,64,10),USE(PHO:Phone),LEFT(2)
                       PROMPT('Note:'),AT(56,44),USE(?PHO:Note:Prompt),TRN
                       ENTRY(@s20),AT(76,44,97,10),USE(PHO:Note)
                       BUTTON('Done'),AT(144,78,70,25),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,MSG('Accept data' & |
  ' and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(22,78,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(144,78,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(22,78,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(1,0,43,15),USE(?Help),FONT('Arila',11),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE, |
  MSG('See Help Window'),STD(STD:Help),TIP('See Help Window')
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
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Change Status'
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePhone')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PHO:Phone:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PHO:Record,History::PHO:Record)
  SELF.AddHistoryField(?PHO:Phone,2)
  SELF.AddHistoryField(?PHO:Note,3)
  SELF.AddUpdateFile(Access:Phone)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Phone.SetOpenRelated()
  Relate:Phone.Open                                        ! File Phone used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Phone
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
    ?PHO:Phone{PROP:ReadOnly} = True
    ?PHO:Note{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePhone',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:Phone.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePhone',QuickWindow)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  PHO:Client = CLI:Number
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

