

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8076.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8074.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
BillingAddRecord PROCEDURE 

locPatientName       STRING(32)                            !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Add Patient to Billing'),AT(,,319,161),FONT('Arial',11,,FONT:regular),GRAY,SYSTEM
                       BUTTON('&Add Patient'),AT(158,61,53,14),USE(?OkButton),DEFAULT,HIDE
                       BUTTON('&Close'),AT(225,112,53,14),USE(?CancelButton),STD(STD:Close)
                       ENTRY(@n_6),AT(64,6),USE(Pat:ACCESSION),FONT(,12,,FONT:bold),RIGHT(2)
                       STRING('Accession'),AT(26,7),USE(?STRING1),TRN
                       STRING(@p### ###p),AT(65,24),USE(Pat:INVOICE),TRN
                       STRING(@s32),AT(65,42,156),USE(locPatientName),TRN
                       STRING(@p### ###p),AT(112,24,34,10),USE(Pat:CLIENT),TRN
                       STRING('Client'),AT(118,15),USE(?STRING2),TRN
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
CreateRecord  ROUTINE
  IF Pat:ACCESSION < 100000 THEN EXIT.
      
  BILL:Accession = Pat:ACCESSION
  BILL:Invoice = Pat:ACCESSION
  GET(Billing,BILL:patKey)  
  CLEAR(BILL:Record)
  BILL:Invoice = Pat:INVOICE
  BILL:Accession = Pat:INVOICE
  BILL:LastNamePatient = Pat:LAST
  BILL:FirstNamePatient = Pat:FIRST
 ! BILL:Date = Pat:DATE
 ! BILL:DrawDate = Pat:COLLECTION
  ! BILL:GenderPatient = Pat:SEX
  BILL:Client = Pat:CLIENT
  BILL:VerifiedBy = Pat:VERIFIED_BY
  BILL:Description = 'Allergy Tesing Performed on Blood'
  CASE Pat:BILLING
  OF 'C'
    BILL:FeeType = 5
  OF 'P'
    BILL:FeeType = 6
  OF 'I'
    BILL:FeeType = 1
  OF 'M'
    BILL:FeeType = 3
  OF 'A'
    BILL:FeeType = 4
  OF 'E'
    BILL:FeeType = 0
  .
 

  ADD(Billing)
  IF ~ERRORCODE() THEN AddBillingItems.
  gloPatientNumber = BILL:Accession
  POST(EVENT:CloseWindow)
  

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  CLEAR(PAT:Record)
  CLEAR(BILL:Record)
    
  GlobalErrors.SetProcedureName('BillingAddRecord')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:BillingItems.Open                                 ! File BillingItems used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('BillingAddRecord',Window)                  ! Restore window settings from non-volatile store
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
    Relate:Billing.Close
    Relate:BillingItems.Close
    Relate:Patient.Close
  END
  IF SELF.Opened
    INIMgr.Update('BillingAddRecord',Window)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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
    OF ?Pat:ACCESSION
      IF Pat:ACCESSION > 99999
        GET(Patient,Pat:ACCESS_KEY)
        IF ERRORCODE()
          CLEAR(Pat:Record)  
        .
        SELECT(?Pat:ACCESSION)
        locPatientName = CLIP(Pat:LAST) & ', ' & Pat:FIRST
        BILL:Accession = Pat:ACCESSION
        BILL:Invoice = Pat:ACCESSION
        GET(Billing,BILL:patKey)
        IF ERRORCODE()
          UNHIDE(?OkButton)
        ELSE
          STOP('Already has Billing Record')
        .
        DISPLAY()
      .
    END
  ReturnValue = PARENT.TakeAccepted()
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


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?OkButton
      DO CreateRecord
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Payments file
!!! </summary>
BillingPayments PROCEDURE 

CurrentTab           STRING(80)                            !
locTotal             DECIMAL(7,2)                          !
locDate              LONG                                  !
BRW1::View:Browse    VIEW(Payments)
                       PROJECT(Pay:Date)
                       PROJECT(Pay:Invoice)
                       PROJECT(Pay:Type)
                       PROJECT(Pay:Amount)
                       PROJECT(Pay:Reference)
                       PROJECT(Pay:Note)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pay:Date               LIKE(Pay:Date)                 !List box control field - type derived from field
Pay:Invoice            LIKE(Pay:Invoice)              !List box control field - type derived from field
Pay:Type               LIKE(Pay:Type)                 !List box control field - type derived from field
Pay:Amount             LIKE(Pay:Amount)               !List box control field - type derived from field
Pay:Reference          LIKE(Pay:Reference)            !List box control field - type derived from field
Pay:Note               LIKE(Pay:Note)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Payments'),AT(,,492,260),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('BillingPayments'),SYSTEM
                       LIST,AT(9,0,440,204),USE(?Browse:1),FONT(,10),HVSCROLL,FORMAT('54R(2)|M~Date~C(0)@d17@5' & |
  '6R(2)|M~Patient~C(0)@p### ###p@47L(2)|M~Type~@s16@48D(18)|M~Amount~C(0)@n-10.2@80L(2' & |
  ')|M~Reference~@s32@80L(2)|M~Note~@s255@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the' & |
  ' Payments file')
                       BUTTON('&Select'),AT(68,213,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(121,213,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(173,213,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(227,213,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(280,213,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,438,204),USE(?CurrentTab)
                       END
                       BUTTON('&Close'),AT(231,233,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(284,233,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@n-10.2),AT(399,214),USE(locTotal),FONT(,12,,FONT:bold),RIGHT(2)
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepRealClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()               ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
   gloFrom = TODAY()
   gloTo = TODAY()
   GetDateRange
  GlobalErrors.SetProcedureName('BillingPayments')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Payments.Open                            ! File Payments used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Payments,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon Pay:Date for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pay:DateKey) ! Add the sort order for Pay:DateKey for sort order 1
  BRW1.AddRange(Pay:Date,gloFrom,gloTo)           ! Add 'range of values' range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pay:Date,1,BRW1)      ! Initialize the browse locator using  using key: Pay:DateKey , Pay:Date
  BRW1.AddField(Pay:Date,BRW1.Q.Pay:Date)         ! Field Pay:Date is a hot field or requires assignment from browse
  BRW1.AddField(Pay:Invoice,BRW1.Q.Pay:Invoice)   ! Field Pay:Invoice is a hot field or requires assignment from browse
  BRW1.AddField(Pay:Type,BRW1.Q.Pay:Type)         ! Field Pay:Type is a hot field or requires assignment from browse
  BRW1.AddField(Pay:Amount,BRW1.Q.Pay:Amount)     ! Field Pay:Amount is a hot field or requires assignment from browse
  BRW1.AddField(Pay:Reference,BRW1.Q.Pay:Reference) ! Field Pay:Reference is a hot field or requires assignment from browse
  BRW1.AddField(Pay:Note,BRW1.Q.Pay:Note)         ! Field Pay:Note is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('BillingPayments',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','BillingPayments',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:WallPaper} = gloWallpaper
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
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
    Relate:Payments.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('BillingPayments',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePayments
    ReturnValue = GlobalResponse
  END
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
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


BRW1.ResetFromView PROCEDURE

locTotal:Sum         REAL                                  ! Sum variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Payments.SetQuickScan(1)
  SELF.Reset
  IF SELF.UseMRP
     IF SELF.View{PROP:IPRequestCount} = 0
          SELF.View{PROP:IPRequestCount} = 60
     END
  END
  LOOP
    IF SELF.UseMRP
       IF SELF.View{PROP:IPRequestCount} = 0
            SELF.View{PROP:IPRequestCount} = 60
       END
    END
    CASE SELF.Next()
    OF Level:Notify
      BREAK
    OF Level:Fatal
      SETCURSOR()
      RETURN
    END
    SELF.SetQueueRecord
    locTotal:Sum += Pay:Amount
  END
  SELF.View{PROP:IPRequestCount} = 0
  locTotal = locTotal:Sum
  PARENT.ResetFromView
  Relate:Payments.SetQuickScan(0)
  SETCURSOR()


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW1::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW1.TakeNewSelection PROCEDURE

  CODE
  IF BRW1::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW1::PopupTextExt = ''
        BRW1::PopupChoiceExec = True
        BRW1::FormatManager.MakePopup(BRW1::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW1::PopupTextExt = '|-|' & CLIP(BRW1::PopupTextExt)
        END
        BRW1::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW1::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW1::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW1::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW1::PopupChoiceOn AND BRW1::PopupChoiceExec THEN
     BRW1::PopupChoiceExec = False
     BRW1::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW1::PopupTextExt)
     IF BRW1::FormatManager.DispatchChoice(BRW1::PopupChoice)
     ELSE
     END
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Payments
!!! </summary>
UpdatePayments PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::Pay:Record  LIKE(Pay:RECORD),THREAD
QuickWindow          WINDOW('Form Payments'),AT(,,358,182),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdatePayments'),SYSTEM
                       SHEET,AT(4,4,350,156),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoice:'),AT(8,20),USE(?Pay:Invoice:Prompt),TRN
                           ENTRY(@n13),AT(61,20,56,10),USE(Pay:Invoice),RIGHT(1)
                           PROMPT('Type:'),AT(8,34),USE(?Pay:Type:Prompt),TRN
                           ENTRY(@s16),AT(61,34,68,10),USE(Pay:Type)
                           PROMPT('Date:'),AT(8,48),USE(?Pay:Date:Prompt),TRN
                           ENTRY(@d17),AT(61,48,104,10),USE(Pay:Date)
                           PROMPT('Amount:'),AT(8,62),USE(?Pay:Amount:Prompt),TRN
                           ENTRY(@n-10.2),AT(61,62,48,10),USE(Pay:Amount),DECIMAL(12)
                           PROMPT('Reference:'),AT(8,76),USE(?Pay:Reference:Prompt),TRN
                           ENTRY(@s32),AT(61,76,132,10),USE(Pay:Reference)
                           PROMPT('Applied:'),AT(8,90),USE(?Pay:Applied:Prompt),TRN
                           ENTRY(@n-10.2),AT(61,90,48,10),USE(Pay:Applied),DECIMAL(12)
                           PROMPT('Apply To:'),AT(8,104),USE(?Pay:ApplyTo:Prompt),TRN
                           ENTRY(@s32),AT(61,104,132,10),USE(Pay:ApplyTo)
                           PROMPT('Adjustment:'),AT(8,118),USE(?Pay:Adjustment:Prompt),TRN
                           ENTRY(@n-10.2),AT(61,118,48,10),USE(Pay:Adjustment),DECIMAL(12)
                           PROMPT('Note:'),AT(8,132),USE(?Pay:Note:Prompt),TRN
                           ENTRY(@s255),AT(61,132,289,10),USE(Pay:Note)
                           PROMPT('Attributes:'),AT(8,146),USE(?Pay:Attributes:Prompt),TRN
                           ENTRY(@n13),AT(61,146,56,10),USE(Pay:Attributes),RIGHT(1)
                         END
                       END
                       BUTTON('&OK'),AT(199,164,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(252,164,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(305,164,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePayments')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pay:Invoice:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pay:Record,History::Pay:Record)
  SELF.AddHistoryField(?Pay:Invoice,1)
  SELF.AddHistoryField(?Pay:Type,2)
  SELF.AddHistoryField(?Pay:Date,3)
  SELF.AddHistoryField(?Pay:Amount,4)
  SELF.AddHistoryField(?Pay:Reference,5)
  SELF.AddHistoryField(?Pay:Applied,6)
  SELF.AddHistoryField(?Pay:ApplyTo,7)
  SELF.AddHistoryField(?Pay:Adjustment,8)
  SELF.AddHistoryField(?Pay:Note,9)
  SELF.AddHistoryField(?Pay:Attributes,10)
  SELF.AddUpdateFile(Access:Payments)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Payments.Open                                     ! File Payments used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Payments
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
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Pay:Invoice{PROP:ReadOnly} = True
    ?Pay:Type{PROP:ReadOnly} = True
    ?Pay:Date{PROP:ReadOnly} = True
    ?Pay:Amount{PROP:ReadOnly} = True
    ?Pay:Reference{PROP:ReadOnly} = True
    ?Pay:Applied{PROP:ReadOnly} = True
    ?Pay:ApplyTo{PROP:ReadOnly} = True
    ?Pay:Adjustment{PROP:ReadOnly} = True
    ?Pay:Note{PROP:ReadOnly} = True
    ?Pay:Attributes{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdatePayments',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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
    Relate:Payments.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdatePayments',QuickWindow)            ! Save window data to non-volatile store
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

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
GetDateRange PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Enter From To'),AT(,,228,132),FONT('Arial',11,,FONT:regular),RESIZE,GRAY,MDI,SYSTEM
                       BUTTON('&OK'),AT(159,94,47,14),USE(?OkButton),LEFT,ICON('WAOk.ico'),DEFAULT,STD(STD:Close)
                       BUTTON('&Cancel'),AT(105,94,47,14),USE(?CancelButton),LEFT,ICON('WACancel.ico'),STD(STD:Close)
                       ENTRY(@d1),AT(76,25),USE(gloFrom)
                       ENTRY(@d1),AT(76,43),USE(gloTo)
                       STRING('From:'),AT(44,25,24),USE(?STRING1),RIGHT
                       STRING('To:'),AT(47,44,24),USE(?STRING2),RIGHT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('GetDateRange')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GetDateRange',Window)                      ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  0{PROP:WallPaper} = gloWallpaper
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
  IF SELF.Opened
    INIMgr.Update('GetDateRange',Window)                   ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
faxTalk PROCEDURE 

 MAP
INCLUDE('OCX.CLW')
SelectOleServer FUNCTION(OleQ PickQ),STRING
END
ResultQ    QUEUE,PRE(RQ)                      !Queue to hold return from OLEDIRECTORY
Name         CSTRING(64)
CLSID        CSTRING(64)
ProgID       CSTRING(64)
           END 
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('OLE Demo'),AT(,,313,158),RESIZE,GRAY,TIMER(1)
                       MENUBAR,USE(?MENUBAR2)
                         MENU('&Clarion App'),USE(?MENU4)
                           ITEM('&Deactivate Object'),USE(?DeactOLE)
                         END
                       END
                       OLE,AT(0,1,313,157),USE(?AnyOLEObject),AUTOSIZE,COMPATIBILITY(01H)
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

  RQ:Name = 'fax talk'
  RQ:CLSID = '{{49EC7778-D69F-4EA7-9A34-DB008122734D}'
  RQ:ProgID = 'FaxTalk.API'
  !  OLEDIRECTORY(ResultQ,0)     !Get list of installed OLE Servers & put it in ResultQ

  ?AnyOLEObject{PROP:Create} = ResultQ
    stop(?AnyOLEObject{PROP:Ctrl})
    stop(?AnyOLEObject{PROP:OLE})
    stop(?AnyOLEObject{PROP:LastEventName})
  DISPLAY
  ACCEPT
   IF FIELD() = ?DeactOLE
      POST(EVENT:CloseWindow)
  . .
!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('faxTalk')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('faxTalk',Window)                           ! Restore window settings from non-volatile store
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
  IF SELF.Opened
    INIMgr.Update('faxTalk',Window)                        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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

SelectOleServer PROCEDURE(OleQ PickQ)
OLEwindow WINDOW('Choose OLE Server'),AT(,,122,159),CENTER,SYSTEM,GRAY
       LIST,AT(11,8,100,120),USE(?List),HVSCROLL, |
        FORMAT('146L~Name~@s64@135L~CLSID~@s64@20L~ProgID~@s64@'),FROM(PickQ)
       BUTTON('Select'),AT(42,134),USE(?Select)
      END
CODE
 OPEN(OLEwindow)
 SELECT(?List,1)
 ACCEPT
 CASE ACCEPTED()
 OF ?Select
  GET(PickQ,CHOICE(?List))
  IF ERRORCODE() THEN STOP(ERROR()) END
  POST(EVENT:CloseWindow)
 END
 END
 RETURN(PickQ.ProgID)
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
testLogin PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(0,0,678,406),FONT('Arial Narrow',8),GRAY,MDI
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('testLogin')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('testLogin',Window)                         ! Restore window settings from non-volatile store
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
  IF SELF.Opened
    INIMgr.Update('testLogin',Window)                      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
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

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ExportInsurance      PROCEDURE                             ! Declare Procedure
Relationship  STRING(32),DIM(4)   
locUndoBilledDate    LONG                                  !
locExportLimit       LONG                                  !
locStatusLowLimit    LONG                                  !
locStatusHighLimit   LONG                                  !
locHighLimit         LONG                                  !
locLowLimit          LONG                                  !
locExportHighLimit   LONG                                  !
locExportLowLimit    LONG                                  !
locIgA               LONG                                  !
locTIgA              STRING(20)                            !
locSuffix            STRING(1)                             !
SAV:Code  STRING(6)
SAV:Score STRING(3)
SAV:Type  BYTE
SAV:Conc  DECIMAL(9,2)
SAV:Status STRING(1)
SAV:Physician STRING(40)
locIgE   BYTE
locIgG   BYTE
locIgG4  BYTE
locSerumRemaining LONG
locStartDate    LONG
locEndDate    LONG
FileName  STRING(128)
locFee    DECIMAL(7,2)
locFees    DECIMAL(7,2),DIM(11,9)
locDue  STRING(8)                                   
locClient STRING(8)
locClientName STRING(64)
locMemo STRING(64)
locTIgE LONG
locLevel LONG
locType LONG
locQty LONG
locDescription  STRING(32)
locDebug  LONG
locClientID STRING(32)
locBillingType  LONG,DIM(5)
locTotalCharged DECIMAL(7,2)
locPayerID STRING(16)

locCRLF STRING(7)


locSCText STRING(1024) 
locCSQty DECIMAL(7,2)
locCSFee DECIMAL(7,2)       
locSCTotal DECIMAL(7,2)


      
locLineNumber        LONG                                  !
locLength            LONG                                  !
locModifier          STRING(6)                             !
locServiceDate       STRING(8)                             !
locServiceCodes      LONG,DIM(11,9)                        !
locServiceCode       LONG                                  !


  CODE
  SHARE(Fees)
  locLineNumber = 0 
  IF Pat:COLLECTION AND Pat:BILLING <> 'I'
    IF INSTRING('Add On',Pat:InHouseComments )
      locServiceDate = FORMAT(Pat:Date,@d12) 
    ELSE
      locServiceDate = FORMAT(Pat:COLLECTION,@d12)  
    .
  ELSE
    locServiceDate = FORMAT(Pat:Date,@d12)           
  .   
  locTotalCharged = 0
  gloFileName =  '.\ChangeCare\' & Pat:INVOICE & '.txt'   
  SHARE(Rast)
  CREATE(Text)
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN EXPORT INSURANCE: ' & ERROR()).
 !! SERVICE INFORMATION   
    FEE:Client = 999990
    GET(Fees,FEE:OrderKey)  
    IF ERRORCODE() 
      STOP('FEE: ' & ERROR())
      RETURN
    .  
    IF FEE:Virus = 0
      FEE:Virus = 50
      PUT(FEES)
    .
  IF locIgA
    locType = 7
    locLevel = 7
    Pat:BILLING = 'P' 
    locClient = CLI:BILLING & '-4'
    locMemo = 'Patient Bill'

    EL:Billing = 4
    locQty = 1
    locDescription = 'Gluten IgA'
    locFee = FEE:PANEL260S145 
    locSuffix = 'P'
    DO AddCSV 
    locSuffix = ''
  .            
  locServiceCodes[1,1] = 86003  ! Routine IgE'
  locServiceCodes[1,2] = 86001  ! Routine IgG'
  locServiceCodes[1,3] = 86001  ! Routine IgG4'
  locServiceCodes[2,1] = 86003  ! Insects, Hymenoptera IgE'
  locServiceCodes[2,2] = 86001  ! Insects, Hymenoptera IgG'
  locServiceCodes[2,3] = 86001  ! Insects, Hymenoptera IgG4'
  locServiceCodes[3,1] = 86005  ! Mix IgE'
  locServiceCodes[3,2] = 86005  ! Mix IgG'
  locServiceCodes[3,3] = 86005  ! Mix IgG4'
  locServiceCodes[4,1] = 86003  ! Occupational IgE'
  locServiceCodes[4,2] = 86001  ! Occupational IgG'
  locServiceCodes[4,3] = 86001  ! Occupational IgG4'
  locServiceCodes[5,1] = 86003  ! Chem/Drug IgE'
  locServiceCodes[5,2] = 86001  ! Chem/Drug IgG'
  locServiceCodes[5,3] = 86001  ! Chem/Drug IgG4'
  locServiceCodes[8,1] = 86003  ! Component IgE'
  locServiceCodes[8,2] = 86001  ! Component IgG'
  locServiceCodes[8,3] = 86001  ! Component IgG4' 
  locServiceCodes[9,7] = 86769  ! Viral IgG' 
  locServiceCodes[9,8] = 86769  ! Viral IgM' 
  locServiceCodes[10,7] = 86769  ! Viral IgG' 
  locServiceCodes[10,8] = 86769  ! Viral IgM' 
  locServiceCodes[11,7] = 86769  ! Viral IgG' 
  locServiceCodes[11,8] = 86769  ! Viral IgM'          
  
  locFees[1,1] = FEE:IGE
  locFees[1,2] = FEE:IGG
  locFees[1,3] = FEE:IGG4
  locFees[2,1] = FEE:HYIGE
  locFees[2,2] = FEE:HYIGG
  locFees[2,3] = FEE:HYIGG4
  locFees[3,1] = FEE:MXIGE
  locFees[3,2] = FEE:MXIGE
  locFees[3,3] = FEE:MXIGE
  locFees[4,1] = FEE:OCCIGE
  locFees[4,2] = FEE:OCCIGG
  locFees[4,3] = FEE:OCCIGG4
  locFees[5,1] = FEE:CHEMIGE            
  locFees[5,2] = FEE:CHEMIGG            
  locFees[5,3] = FEE:CHEMIGG4  
  locFees[9,7] = FEE:Virus           
  locFees[9,8] = FEE:Virus            
  locFees[10,7] = FEE:Virus           
  locFees[10,8] = FEE:Virus            
  locFees[11,7] = FEE:Virus           
  locFees[11,8] = FEE:Virus 
  
  
 OMIT('XXXX')  
  locDescription[1,1] = 'Routine IgE'
  locDescription[1,2] = 'Routine IgG'
  locDescription[1,3] = 'Routine IgG4'
  locDescription[2,1] = 'Insects, Hymenoptera IgE'
  locDescription[2,2] = 'Insects, Hymenoptera IgG'
  locDescription[2,3] = 'Insects, Hymenoptera IgG4'
  locDescription[3,1] = 'Mix IgE'
  locDescription[3,2] = 'Mix IgG'
  locDescription[3,3] = 'Mix IgG4'
  locDescription[4,1] = 'Occupational IgE'
  locDescription[4,2] = 'Occupational IgG'
  locDescription[4,3] = 'Occupational IgG4'
  locDescription[5,1] = 'Chem/Drug IgE'
  locDescription[5,2] = 'Chem/Drug IgG'
  locDescription[5,3] = 'Chem/Drug IgG4'
  locDescription[8,1] = 'Component IgE'
  locDescription[8,2] = 'Component IgG'
  locDescription[8,3] = 'Component IgG4'   
  
 XXXX

  Relationship[1] = 'Self'
  Relationship[2] = 'Spouse'
  Relationship[3] = 'Dependant'
  Relationship[4] = 'Other'
 

  TXT:Text = 'ISA*00*          *00*          *ZZ*SUBMITTER      *ZZ*650202059      *150720*1325*^*00501*000000001*0*P*:'
  ADD(Text)
  TXT:Text = 'GS*HC*SUBMITTER*650202059*' & FORMAT(TODAY(),@D12) & '*1325*1*X*005010X222A1'
  ADD(Text)
  TXT:Text = 'ST*837*0001*005010X222A1'
  ADD(Text)
  TXT:Text = 'BHT*0019*00*6595*' & FORMAT(TODAY(),@D12) & '*1325*CH'
  ADD(Text)
  TXT:Text = 'NM1*41*2*Allermetrix*****46*205180'
  ADD(Text)
  TXT:Text = 'PER*IC**TE*6155994100'
  ADD(Text)
  TXT:Text = 'NM1*40*2*CAPARIO*****46*650202059'
  ADD(Text)
  TXT:Text = 'HL*1**20*1'
  ADD(Text)
  TXT:Text = 'PRV*BI*PXC*291U00000X'
  ADD(Text)
  TXT:Text = 'NM1*85*2*Allermetrix*****XX*1396790119'
  ADD(Text)
  TXT:Text = 'N3*400 Sugartree Lane Ste 510'
  ADD(Text)
  TXT:Text = 'N4*Franklin*TN*370649998'
  ADD(Text)
  TXT:Text = 'REF*EI*204571262'
  ADD(Text)
  TXT:Text = 'HL*2*1*22*0'
  ADD(Text)
  TXT:Text = 'SBR*P*18*******MB'
  ADD(Text) 
  
  !    PATIENT INFO  
  BILL:Accession = Pat:INVOICE
  GET(Billing,BILL:patKey) 
  IF ERRORCODE() THEN STOP('EI BILL ' & Pat:INVOICE & ': ' & ERROR()).
  CLM:Patient = Pat:INVOICE
  GET(Claims,CLM:OrderKey)
  IF ERRORCODE() THEN STOP('EI CLM ' & Pat:INVOICE & ': ' & ERROR()).


  TXT:Text = 'NM1*IL*1*' & CLIP(Pat:LAST) & '*' & CLIP(PAT:FIRST) & '****MI*' & CLIP(CLM:MemberID)
  ADD(Text)
  TXT:Text = 'N3*' & CLIP(BILL:AddressPatient) 
  ADD(Text)
  TXT:Text = 'N4*' & CLIP(BILL:CITYPATIENT) & '*' & CLIP(BILL:STATEPATIENT) & '*' & CLIP(BILL:POSTALPATIENT) 
  ADD(Text)
  TXT:Text = 'DMG*D8*' & FORMAT(pat:DOB,@d12) & '*' & PAT:SEX 
  ADD(Text)
  TXT:Text = 'NM1*PR*2*' & CLIP(CLM:PlanName) & '*****PI*' & CLIP(CLM:PlanID)
  ADD(Text) 
  SHARE(Test)  
  CLOSE(ExportIns)
  CREATE(ExportIns)
  OPEN(ExportIns)
  locTIgE = 0 
  locTotalCharged = 0
  
  TST:Invoice = PAT:Invoice  
  TST:Type = 0
  TST:Code = '' 
  SET(TST:Order_Key,TST:Order_Key)
  LOOP UNTIL EOF(TEST)
    NEXT(Test)    
  !  TXT:Text = TST:CODE & '-' & TST:TYPE & ' total: ' & locTotalCharged
  !  ADD(Text)

    IF TST:Invoice <> PAT:Invoice THEN  BREAK.
    IF TST:Status = 'X' THEN CYCLE.
    IF TST:Type = 0 THEN CYCLE.

    IF locDebug THEN STOP(TST:CODE & ', ' & TST:TYPE & ', ' & TST:INVOICE). 
    IF gloTestCodeStartsWith2 = 'S1'
      locLevel = 7     
      locType = 7
  !    locTotalCharged += FEE:PANEL260  
      IF TST:Code = 'S130' 
        locFee = FEE:PANEL260
        locServiceCode = 86255
        locQty = 1    
        locTotalCharged +=  locFee
        DO AddServiceCode
      .     
      IF TST:Code = 'S114' 
        locFee = FEE:PANEL260
        locServiceCode = 83516
        locQty = 4 
        locTotalCharged += (locQty * locFee)
        DO AddServiceCode
        locTotalCharged += FEE:TIGA 
        locDescription = 'Total IgA'
        locFee = FEE:TIGA 
        locServiceCode = 82784
        locQty = 1  
        locTotalCharged += (locQty * locFee)
        DO AddServiceCode
      .
      CYCLE
    ELSIF SUB(TST:Code,1,3) = '100' 
      IF ~locTIgE   
        locTIgE = TRUE
        locTotalCharged += FEE:TIGE 
        locFee = FEE:TIGE 
        locServiceCode = 82785
        locQty = 1 
        DO AddServiceCode
      .    
    ELSE
      IF (TST:Type = 2 OR TST:Type = 3) AND (CLM:PlanID = '61101' OR CLM:PlanID = 'BS030' OR CLM:PlanID = '61102' OR CLM:PlanID = '67300' OR CLM:PlanID = '34818' OR CLM:PlanID = '61115' OR CLM:PlanID = 'L0200') THEN CYCLE.
      RST:Number = TST:Code
      GET(Rast,RST:ORDER_KEY)   
      IF ERRORCODE()
        STOP('RAST: ' & ERROR() & ', ' & TST:Code & ', PAT: ' & PAT:Invoice)
        CYCLE
      .   
      IF RST:FeeLevel < 1 OR RST:FeeLevel > 11
        CYCLE
      .   
      locQty = 1
      locServiceCode = locServiceCodes[RST:FeeLevel,TST:Type]
      locFee = locFees[RST:FeeLevel,TST:Type]  
      locTotalCharged += locFee
      DO AddServiceCode
  . .  
  
  
  
  locSCText = ''
  locQty = 0
  locFee = 0
  locSCTotal = 0
  
  locModifier = ''
  SET(ExportIns,1)   
  IF ERRORCODE() THEN STOP('SET EI: ' & ERROR()).
  LOOP 
    NEXT(ExportIns) 
    IF ERRORCODE() THEN BREAK.  
    IF EI:ServiceCode = 86769 THEN CYCLE.
    DO AddCSV 
 !   locModifier = ':59'
  .  
   
  EI:ServiceCode = 86769
  GET(ExportIns,EI:OrderKey)   
  IF ~ERRORCODE()  
    LOOP I# = 1 TO EI:Qty
      DO AddCSV  
 !     locModifier = ':59'
  . .  
  
 
  
  
  
  locTotalCharged = 0
  SET(ExportIns,1)   
  IF ERRORCODE() THEN STOP('SET EI: ' & ERROR()).
  LOOP 
    NEXT(ExportIns) 
    IF ERRORCODE() THEN BREAK.
    IF (Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A') AND CLM:PlanID <> 'SB971'
      IF CLM:PlanID = 'SB890' AND EI:Qty > 62 AND  EI:ServiceCode = 86003 
        EI:Qty = 62
      ELSE
        IF EI:ServiceCode = 86003 AND EI:Qty > 62 THEN EI:Qty = 62;PUT(ExportIns).
        IF EI:ServiceCode = 86001 AND EI:Qty > 20 THEN EI:Qty = 20;PUT(ExportIns).
        IF EI:ServiceCode = 86005 AND EI:Qty > 2  THEN EI:Qty = 2;PUT(ExportIns).
    . .
    
    locTotalCharged += (EI:Fee * EI:Qty)
  .
 
  
  TXT:Text = 'CLM*' & PAT:INVOICE & '*' & LEFT(FORMAT(locSCTotal,@n_7.2)) & '***81:B:1*Y*A*Y*Y*P'
  ADD(Text)  


 ! TXT:Text = 'REF*EA*MRN'  
 ! ADD(Text)
  TXT:Text = 'REF*X4*44D1053766'
  ADD(Text)
  TXT:Text = 'HI*ABK:' & CLIP(CLM:DiagCode1) 
  ADD(Text)
  TXT:Text = 'NM1*DN*1*' & CLIP(CLM:Physician) & '****XX*'  & CLIP(CLM:NPI) 
  ADD(Text)
  
  locSCText = CLIP(locSCText) & '<13,10>SE*43*0001<13,10>'
  locSCText = CLIP(locSCText) & 'GE*1*1<13,10>'
  locSCText = CLIP(locSCText) & 'IEA*1*000000001'
  TXT:Text = CLIP(locSCText)
  ADD(Text)
  CLOSE(Text) 
  CLOSE(Test) 
  CLOSE(Rast) 
 
AddCSV ROUTINE  

!  TXT:Text =  locQty & ',' & locFee & ',' & (locQty * locFee) & ',"' & LEFT(FORMAT(PAT:Date,@d1)) & '","' & LEFT(locDue) & '"'
!  ADD(Text)  
  locLineNumber +=1   
  TXT:Text = CLIP(locCRLF) & 'LX*' & locLineNumber 
  locCRLF = '<13,10>'
  locSCText = CLIP(locSCText) & TXT:Text
! TXT:Text = 'SV1*HC: Qty=' & locQty &  ' fee=' & locFee & ' LVL=' &  locLevel & ', type=' & locType & ' SVC=' & locServiceCode & '* amt=' & (locQty * locFee) & '*UN*' & locQty & '***' & locLineNumber   & locDescription
  IF EI:ServiceCode =  82785 THEN  EI:Qty = 1.
  IF EI:ServiceCode = 86005 ! Mix
    TXT:Text = 'SV1*HC:' & EI:ServiceCode & ':59*' & (EI:Qty * EI:Fee) & '*UN*' & EI:Qty & '***1'
  !  locModifier = ':59'
  ELSIF EI:ServiceCode = 86769   
    TXT:Text = 'SV1*HC:' & EI:ServiceCode & '*' & EI:Fee & '*UN*1***1'
  ELSE 
    IF (EI:ServiceCode = 86001 OR EI:ServiceCode = 86003) AND (EI:FEE * EI:Qty = 0)
      EI:Fee = 20
      TXT:Text = 'SV1*HC:' & EI:ServiceCode & '*' & (EI:Qty * 20) & '*UN*' & EI:Qty & '***1'
    ELSE
      TXT:Text = 'SV1*HC:' & EI:ServiceCode & '*' & (EI:Qty * EI:Fee) & '*UN*' & EI:Qty & '***1'
    .
  .
  locSCTotal +=  (EI:Qty * EI:Fee)

  locSCText = CLIP(locSCText) & '<13,10>' & TXT:Text
  locSCText = CLIP(locSCText) & '<13,10>DTP*472*D8*' & locServiceDate
  locSCText = CLIP(locSCText) & '<13,10>REF*6R*' & locLineNumber 
  
  EXIT
  
  
  
  
  TXT:Text = 'DTP*472*D8*' & locServiceDate
  ADD(Text)
  TXT:Text = 'REF*6R*' & locLineNumber
  ADD(Text) 
  FLUSH(Text)

 
AddServiceCode  ROUTINE 
  
        EI:ServiceCode = locServiceCode 
        GET(ExportIns,EI:OrderKey)
        IF ERRORCODE()      
          EI:ServiceCode = locServiceCode
          EI:FEE = locFee  
          EI:Qty = locQty 
          EI:ServiceCode = locServiceCode 
          ADD(ExportIns) 
          IF ERRORCODE() THEN STOP('EI ADD: ' & ERROR()).
        ELSE         
          EI:Qty += locQty 
          PUT(ExportIns) 
          IF ERRORCODE() THEN STOP('EI PUT: ' & ERROR()).
        .      
   !     STOP(locTotalCharged & ', ' & locServiceCode & ', ' & RECORDS(ExportIns))
