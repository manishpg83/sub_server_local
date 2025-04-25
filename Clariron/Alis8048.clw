

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8048.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form PickUp
!!! </summary>
UpdatePickUp PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::PU:Record   LIKE(PU:RECORD),THREAD
QuickWindow          WINDOW('Schedule Pickup'),AT(6,57,329,136),FONT('Arial',11,COLOR:Black,FONT:regular),RESIZE, |
  ICON('Allermetrix.ico'),GRAY,IMM,MDI,HLP('UpdatePickUp'),SYSTEM
                       ENTRY(@s20),AT(62,67,111,12),USE(PU:ContactName),CAP
                       ENTRY(@s3),AT(62,10,40,12),USE(PU:Inititals),UPR
                       BUTTON('Delete'),AT(244,24,70,25),USE(?DeleteButton),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  TRN
                       SPIN(@d1),AT(62,32,66,12),USE(PU:Date),HVSCROLL
                       CHECK('Received'),AT(140,32,61,12),USE(PU:Received),FONT(,,,FONT:bold,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('1','0')
                       BUTTON('Done'),AT(244,92,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'),DEFAULT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(244,24,70,25),USE(?Image4)
                       IMAGE('button.jpg'),AT(244,58,70,25),USE(?Image2)
                       BUTTON('&Cancel'),AT(244,58,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       PROMPT('Date'),AT(24,30,33,10),USE(?DatePrompt),RIGHT,TRN
                       PROMPT('Contact Name:'),AT(8,71),USE(?PU:ContactName:Prompt),TRN
                       ENTRY(@s20),AT(62,87,114,12),USE(PU:Note)
                       IMAGE('button.jpg'),AT(140,32,61,12),USE(?Image3)
                       IMAGE('button.jpg'),AT(244,92,70,25),USE(?Image1)
                       PROMPT('Note'),AT(42,87),USE(?Prompt4),TRN
                       PROMPT('Initials:'),AT(36,12),USE(?PU:Inititals:Prompt),TRN
                       STRING(@p### ###p),AT(61,51),USE(PU:Client),FONT(,,,FONT:bold),TRN
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
InsertAction           PROCEDURE(),BYTE,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
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
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Change Status'
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePickUp')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PU:ContactName
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PU:Record,History::PU:Record)
  SELF.AddHistoryField(?PU:ContactName,4)
  SELF.AddHistoryField(?PU:Inititals,5)
  SELF.AddHistoryField(?PU:Date,2)
  SELF.AddHistoryField(?PU:Received,3)
  SELF.AddHistoryField(?PU:Note,6)
  SELF.AddHistoryField(?PU:Client,1)
  SELF.AddUpdateFile(Access:PickUp)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PickUp.Open                                       ! File PickUp used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PickUp
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
    ?PU:ContactName{PROP:ReadOnly} = True
    ?PU:Inititals{PROP:ReadOnly} = True
    DISABLE(?DeleteButton)
    ?PU:Date{PROP:ReadOnly} = True
    ?PU:Received{PROP:ReadOnly} = True
    ?PU:Note{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
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


ThisWindow.InsertAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  PU:Inititals = gloInitials
  ReturnValue = PARENT.InsertAction()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:PickUp.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  PU:Date = TODAY()
  PU:Inititals = gloInitials
  PU:Client = CLI:Number
  PU:Received = 0
  PU:ContactName = ''
  PU:Note = ''
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
    OF ?DeleteButton
      DELETE(PickUp)
      POST(EVENT:CloseWindow)
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

