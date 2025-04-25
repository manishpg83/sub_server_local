

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8039.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Monitor
!!! </summary>
Updatemonitor PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::MON:Record  LIKE(MON:RECORD),THREAD
QuickWindow          WINDOW('Work Pool Status'),AT(,,426,302),FONT('Arial',11,COLOR:Black,FONT:regular),RESIZE, |
  CENTER,GRAY,IMM,MDI,HLP('Updatemonitor'),SYSTEM
                       PROMPT('AGE:'),AT(74,32),USE(?MON:AGE:Prompt),TRN
                       ENTRY(@n3),AT(92,32,40,10),USE(MON:AGE),RIGHT(1)
                       PROMPT('SERUM RECEIVED:'),AT(23,48),USE(?MON:SERUMRECEIVED:Prompt),TRN
                       ENTRY(@n-8.1),AT(92,48,40,10),USE(MON:SerumReceived),DECIMAL(8)
                       PROMPT('SERUM NEEDED:'),AT(30,64),USE(?MON:SERUMNEEDED:Prompt),TRN
                       ENTRY(@n-8.1),AT(92,64,40,10),USE(MON:Needed[1]),DECIMAL(8)
                       STRING('IgG'),AT(186,48),USE(?String2),TRN
                       PROMPT('COUNT:'),AT(216,18),USE(?MON:COUNT:Prompt),TRN
                       ENTRY(@n-7),AT(210,32,40,10),USE(MON:COUNT[1]),RIGHT(1)
                       STRING('IgE'),AT(186,32),USE(?String1),TRN
                       PROMPT('WORKPOOLED:'),AT(262,18),USE(?MON:WORKPOOLED:Prompt),TRN
                       ENTRY(@n-7),AT(268,32,40,10),USE(MON:WORKPOOLED[1]),RIGHT(1)
                       ENTRY(@n-7),AT(210,48,40,10),USE(MON:COUNT[2]),RIGHT(1)
                       ENTRY(@n-7),AT(268,48,40,10),USE(MON:WORKPOOLED[2]),RIGHT(1)
                       ENTRY(@n-7),AT(268,64,40,10),USE(MON:WORKPOOLED[3]),RIGHT(1)
                       STRING('IgG4'),AT(186,64),USE(?String3),TRN
                       ENTRY(@n-7),AT(210,64,40,10),USE(MON:COUNT[3]),RIGHT(1)
                       BUTTON('Done'),AT(268,162,70,25),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(178,162,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(16,118,70,25),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
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
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Change Status'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Updatemonitor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?MON:AGE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(MON:Record,History::MON:Record)
  SELF.AddHistoryField(?MON:AGE,14)
  SELF.AddHistoryField(?MON:SerumReceived,17)
  SELF.AddUpdateFile(Access:Monitor)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Monitor.Open                                      ! File Monitor used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Monitor
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?MON:AGE{PROP:ReadOnly} = True
    ?MON:SerumReceived{PROP:ReadOnly} = True
    ?MON:Needed_1{PROP:ReadOnly} = True
    ?MON:COUNT_1{PROP:ReadOnly} = True
    ?MON:WORKPOOLED_1{PROP:ReadOnly} = True
    ?MON:COUNT_2{PROP:ReadOnly} = True
    ?MON:WORKPOOLED_2{PROP:ReadOnly} = True
    ?MON:WORKPOOLED_3{PROP:ReadOnly} = True
    ?MON:COUNT_3{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Updatemonitor',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
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
    Relate:Monitor.Close
  END
  IF SELF.Opened
    INIMgr.Update('Updatemonitor',QuickWindow)             ! Save window data to non-volatile store
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

