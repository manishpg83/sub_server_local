

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8045.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Supplies
!!! </summary>
UpdateSupplies PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::SUP:Record  LIKE(SUP:RECORD),THREAD
QuickWindow          WINDOW('Supplies'),AT(120,40,357,165),FONT('Arial',11,COLOR:Black,FONT:regular),RESIZE,ICON('Allermetrix.ico'), |
  GRAY,IMM,MDI,HLP('UpdateSupplies'),SYSTEM
                       BUTTON('Delete'),AT(273,17,70,25),USE(?DeleteButton),LEFT,ICON('SteelDelete.ico'),TRN
                       PROMPT('Quantity:'),AT(8,62),USE(?SUP:Quantity:Prompt),TRN
                       ENTRY(@n6),AT(61,62,27,10),USE(SUP:Quantity),RIGHT(2)
                       SPIN(@d1),AT(61,76,70,10),USE(SUP:ShipDate),HVSCROLL
                       BUTTON('Today'),AT(132,76,39,10),USE(?TodayButton),TRN
                       STRING('Ship Date:'),AT(8,76),USE(?String1),TRN
                       PROMPT('Shipped Via:'),AT(8,90),USE(?SUP:ShippedVia:Prompt),TRN
                       ENTRY(@s12),AT(61,90,58,10),USE(SUP:ShippedVia)
                       PROMPT('Tracking:'),AT(8,104),USE(?SUP:Tracking:Prompt),TRN
                       ENTRY(@s32),AT(61,104,139,10),USE(SUP:Tracking)
                       PROMPT('Note:'),AT(8,118),USE(?SUP:Note:Prompt),TRN
                       ENTRY(@s64),AT(61,118,282,10),USE(SUP:Note)
                       PROMPT('Date:'),AT(8,34),USE(?SUP:Date:Prompt),TRN
                       ENTRY(@d17),AT(61,34,52,10),USE(SUP:Date)
                       PROMPT('Initials:'),AT(8,48),USE(?SUP:Initials:Prompt),TRN
                       ENTRY(@s3),AT(61,48,28,10),USE(SUP:Initials),UPR
                       BUTTON('Done'),AT(273,89,70,25),USE(?OK),LEFT,ICON('SteelCheck.ico'),DEFAULT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(273,17,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(273,53,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(273,89,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(273,53,70,25),USE(?Cancel),LEFT,ICON('SteelCancel.ico'),MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(250,0,70,25),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@p### ###p),AT(60,20),USE(SUP:Client),FONT(,,,FONT:bold),TRN
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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
  CASE SELF.Request
  OF ChangeRecord OROF DeleteRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & SUP:Date & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSupplies')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DeleteButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SUP:Record,History::SUP:Record)
  SELF.AddHistoryField(?SUP:Quantity,6)
  SELF.AddHistoryField(?SUP:ShipDate,2)
  SELF.AddHistoryField(?SUP:ShippedVia,7)
  SELF.AddHistoryField(?SUP:Tracking,8)
  SELF.AddHistoryField(?SUP:Note,9)
  SELF.AddHistoryField(?SUP:Date,3)
  SELF.AddHistoryField(?SUP:Initials,5)
  SELF.AddHistoryField(?SUP:Client,4)
  SELF.AddUpdateFile(Access:Supplies)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Supplies.Open                                     ! File Supplies used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Supplies
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
    DISABLE(?DeleteButton)
    ?SUP:Quantity{PROP:ReadOnly} = True
    ?SUP:ShipDate{PROP:ReadOnly} = True
    DISABLE(?TodayButton)
    ?SUP:ShippedVia{PROP:ReadOnly} = True
    ?SUP:Tracking{PROP:ReadOnly} = True
    ?SUP:Note{PROP:ReadOnly} = True
    ?SUP:Date{PROP:ReadOnly} = True
    ?SUP:Initials{PROP:ReadOnly} = True
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
    Relate:Supplies.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  SUP:Client = CLI:Number
  SUP:Date = TODAY()
  SUP:ShippedVia = ''
  SUP:Tracking = ''
  SUP:Note = ''
  SUP:Initials = gloInitials
  SUP:Quantity = CLI:SUPPLY
  SUP:ShipDate = 0
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
    OF ?TodayButton
      SUP:ShipDate = TODAY()
      DISPLAY(?SUP:ShipDate)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?DeleteButton
      ThisWindow.Update
      DELETE(Supplies)
      POST(EVENT:CloseWindow)
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


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF SUP:ShipDate
    SUP:Shipped = 1
  ELSE
    SUP:Shipped = 0
  .
  ReturnValue = PARENT.TakeCompleted()
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


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      SELECT(?SUP:Quantity)
      DISPLAY()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

