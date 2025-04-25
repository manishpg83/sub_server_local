

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE
   INCLUDE('MENUStyle.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8072.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8073.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8074.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8075.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                     END


mdlSelectNotes   BYTE,DIM(8)
!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for C:\C6\ALIS2\Alis8\am8.dct
!!! </summary>
Main PROCEDURE 

MenuStyleMgr MenuStyleManager
EnhancedFocusManager EnhancedFocusClassType
AppFrame             APPLICATION('Billing'),AT(,,505,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),RESIZE,CENTER, |
  ICON('WAFRAME.ICO'),MAX,STATUS(-1,80,120,45),SYSTEM,IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&File'),USE(?FileMenu)
                           ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Edit'),USE(?EditMenu)
                           ITEM('Cu&t'),USE(?Cut),MSG('Cut Selection To Clipboard'),STD(STD:Cut)
                           ITEM('&Copy'),USE(?Copy),MSG('Copy Selection To Clipboard'),STD(STD:Copy)
                           ITEM('&Paste'),USE(?Paste),MSG('Paste From Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Browse'),USE(?BrowseMenu)
                           ITEM('Browse the Billing file'),USE(?BrowseBilling),MSG('Browse Billing')
                           ITEM('Browse the NameList file'),USE(?BrowseNameList),MSG('Browse NameList')
                         END
                         MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?HelpMenu)
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('Provides general instructions on using help'), |
  STD(STD:HelpOnHelp)
                         END
                       END
                       TOOLBAR,AT(0,0,505,16),USE(?Toolbar)
                         BUTTON,AT(4,6,14,14),USE(?Toolbar:Top, Toolbar:Top),ICON('WAVCRFIRST.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'First Page')
                         BUTTON,AT(18,6,14,14),USE(?Toolbar:PageUp, Toolbar:PageUp),ICON('WAVCRPRIOR.ICO'),DISABLE, |
  FLAT,TIP('Go to the Prior Page')
                         BUTTON,AT(32,6,14,14),USE(?Toolbar:Up, Toolbar:Up),ICON('WAVCRUP.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'Prior Record')
                         BUTTON,AT(46,6,14,14),USE(?Toolbar:Locate, Toolbar:Locate),ICON('WAFIND.ICO'),DISABLE,FLAT, |
  TIP('Locate record')
                         BUTTON,AT(60,6,14,14),USE(?Toolbar:Down, Toolbar:Down),ICON('WAVCRDOWN.ICO'),DISABLE,FLAT, |
  TIP('Go to the Next Record')
                         BUTTON,AT(74,6,14,14),USE(?Toolbar:PageDown, Toolbar:PageDown),ICON('WAVCRNEXT.ICO'),DISABLE, |
  FLAT,TIP('Go to the Next Page')
                         BUTTON,AT(88,6,14,14),USE(?Toolbar:Bottom, Toolbar:Bottom),ICON('WAVCRLAST.ICO'),DISABLE,FLAT, |
  TIP('Go to the Last Page')
                         BUTTON,AT(102,6,14,14),USE(?Toolbar:Select, Toolbar:Select),ICON('WAMARK.ICO'),DISABLE,FLAT, |
  TIP('Select This Record')
                         BUTTON,AT(116,6,14,14),USE(?Toolbar:Insert, Toolbar:Insert),ICON('WAINSERT.ICO'),DISABLE,FLAT, |
  TIP('Insert a New Record')
                         BUTTON,AT(130,6,14,14),USE(?Toolbar:Change, Toolbar:Change),ICON('WACHANGE.ICO'),DISABLE,FLAT, |
  TIP('Edit This Record')
                         BUTTON,AT(144,6,14,14),USE(?Toolbar:Delete, Toolbar:Delete),ICON('WADELETE.ICO'),DISABLE,FLAT, |
  TIP('Delete This Record')
                         BUTTON,AT(158,6,14,14),USE(?Toolbar:History, Toolbar:History),ICON('WADITTO.ICO'),DISABLE, |
  FLAT,TIP('Previous value')
                         BUTTON,AT(172,6,14,14),USE(?Toolbar:Help, Toolbar:Help),ICON('WAVCRHELP.ICO'),DISABLE,FLAT, |
  TIP('Get Help')
                       END
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?BrowseBilling
    START(BrowseBilling, 050000)
  OF ?BrowseNameList
    START(BrowseNameList, 050000)
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',AppFrame)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
      MenuStyleMgr.Init(?Menubar)
      MenuStyleMgr.SuspendRefresh()
      MenuStyleMgr.SetThemeColors('XPLunaSilver')
      MenuStyleMgr.SetImageBar(False)
      MenuStyleMgr.ApplyTheme()
      MenuStyleMgr.Refresh(TRUE)
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
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
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
    OF ?Toolbar:Top
    OROF ?Toolbar:PageUp
    OROF ?Toolbar:Up
    OROF ?Toolbar:Locate
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:Select
    OROF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
    OROF ?Toolbar:History
    OROF ?Toolbar:Help
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
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
      START(BrowseBilling,050000)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Billing file
!!! </summary>
BrowseBilling PROCEDURE 

CurrentTab           STRING(80)                            !
locName              STRING(32)                            !
BRW1::View:Browse    VIEW(Billing)
                       PROJECT(BILL:Accession)
                       PROJECT(BILL:DateFax1)
                       PROJECT(BILL:Invoice)
                       PROJECT(BILL:QB)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BILL:Accession         LIKE(BILL:Accession)           !List box control field - type derived from field
BILL:Accession_Style   LONG                           !Field style
locName                LIKE(locName)                  !List box control field - type derived from local data
locName_Style          LONG                           !Field style
BILL:DateFax1          LIKE(BILL:DateFax1)            !List box control field - type derived from field
BILL:DateFax1_Style    LONG                           !Field style
BILL:Invoice           LIKE(BILL:Invoice)             !Browse hot field - type derived from field
BILL:QB                LIKE(BILL:QB)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),VSCROLL,GRAY,IMM,MDI,HLP('BrowseBilling')
                       SHEET,AT(0,0,452,287),USE(?currentTab)
                         TAB('Patient'),USE(?TAB1)
                           LIST,AT(34,28,242,241),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold),HVSCROLL,COLOR(,COLOR:White, |
  COLOR:Blue),FORMAT('40C(2)|MY~Accession~C(1)@p### ###p@119L(2)|MY~Name~C(0)@s32@50L(2' & |
  ')|MY~Date~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Billing file'),TRN
                           BUTTON('&View'),AT(55,314,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                           BUTTON('New'),AT(395,116,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                           BUTTON('&Change'),AT(395,157,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                           BUTTON('&Delete'),AT(395,74,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                           BUTTON('&Close'),AT(420,290,70,25),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                         END
                         TAB('Manage'),USE(?TAB2)
                           ENTRY(@n3),AT(124,237),USE(gloBillingLetterDays),RIGHT(2)
                           STRING('Days Between Letters'),AT(37,240,84),USE(?STRING1),RIGHT,TRN
                           BUTTON('Letter Report'),AT(198,49,107),USE(?ButtonLetterReport)
                           BUTTON('Summary Report'),AT(199,67,107),USE(?ButtonsummaryReport)
                         END
                       END
                       BUTTON('&Help'),AT(3,307,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Convert'),AT(389,228),USE(?BUTTON1),HIDE
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
Next                   PROCEDURE(),BYTE,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseBilling')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locName',locName)                         ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:NameList.Open                            ! File NameList used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Billing,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?currentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:QB for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,BILL:qbKey) ! Add the sort order for BILL:qbKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,BILL:QB,1,BRW1)       ! Initialize the browse locator using  using key: BILL:qbKey , BILL:QB
  BRW1.AddField(BILL:Accession,BRW1.Q.BILL:Accession) ! Field BILL:Accession is a hot field or requires assignment from browse
  BRW1.AddField(locName,BRW1.Q.locName)           ! Field locName is a hot field or requires assignment from browse
  BRW1.AddField(BILL:DateFax1,BRW1.Q.BILL:DateFax1) ! Field BILL:DateFax1 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Invoice,BRW1.Q.BILL:Invoice) ! Field BILL:Invoice is a hot field or requires assignment from browse
  BRW1.AddField(BILL:QB,BRW1.Q.BILL:QB)           ! Field BILL:QB is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','BrowseBilling',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
   0{PROP:Wallpaper} = gloWallpaper
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
    Relate:Billing.Close
    Relate:NameList.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
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
    UpdateBilling
    ReturnValue = GlobalResponse
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
    OF ?BUTTON1
      ThisWindow.Update
      GlobalRequest = InsertRecord
      CONVERT()
      ThisWindow.Reset
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.Next PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  !get next
  ReturnValue = PARENT.Next()
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.BILL:Accession_Style = 0 ! 
  SELF.Q.locName_Style = 0 ! 
  SELF.Q.BILL:DateFax1_Style = 0 ! 


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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
    NAM:Number = BILL:Invoice
    GET(NameList,NAM:OrderKey)
    locName = NAM:Name
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the NameList file
!!! </summary>
BrowseNameList PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(NameList)
                       PROJECT(NAM:Number)
                       PROJECT(NAM:Contact)
                       PROJECT(NAM:Name)
                       PROJECT(NAM:Address1)
                       PROJECT(NAM:Address2)
                       PROJECT(NAM:City)
                       PROJECT(NAM:State)
                       PROJECT(NAM:OldZipCode)
                       PROJECT(NAM:Country)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
NAM:Number             LIKE(NAM:Number)               !List box control field - type derived from field
NAM:Contact            LIKE(NAM:Contact)              !List box control field - type derived from field
NAM:Name               LIKE(NAM:Name)                 !List box control field - type derived from field
NAM:Address1           LIKE(NAM:Address1)             !List box control field - type derived from field
NAM:Address2           LIKE(NAM:Address2)             !List box control field - type derived from field
NAM:City               LIKE(NAM:City)                 !List box control field - type derived from field
NAM:State              LIKE(NAM:State)                !List box control field - type derived from field
NAM:OldZipCode         LIKE(NAM:OldZipCode)           !List box control field - type derived from field
NAM:Country            LIKE(NAM:Country)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the NameList file'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('BrowseNameList'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('56L(2)|M~Number~L(2)@p###-###-###' & |
  '#p@80L(2)|M~Contact~L(2)@s24@80L(2)|M~Name~L(2)@s32@80L(2)|M~Address 1~L(2)@s32@80L(' & |
  '2)|M~Address 2~L(2)@s32@80L(2)|M~City~L(2)@s20@24L(2)|M~State~L(2)@s2@52L(2)|M~Posta' & |
  'l Code~L(2)@s12@80L(2)|M~Country~L(2)@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he NameList file')
                       BUTTON('&View'),AT(142,158,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(195,158,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(248,158,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(301,158,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) OrderKey'),USE(?Tab:2)
                           BUTTON('Select Billing'),AT(8,158,118,14),USE(?SelectBilling),LEFT,ICON('WAPARENT.ICO'),FLAT, |
  MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&2) ContactKey'),USE(?Tab:3)
                         END
                         TAB('&3) NameKey'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepRealClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
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
  GlobalErrors.SetProcedureName('BrowseNameList')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('NAM:OldZipCode',NAM:OldZipCode)           ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:NameList.Open                            ! File NameList used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:NameList,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon NAM:Contact for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,NAM:ContactKey) ! Add the sort order for NAM:ContactKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,NAM:Contact,1,BRW1)   ! Initialize the browse locator using  using key: NAM:ContactKey , NAM:Contact
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon NAM:Name for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,NAM:NameKey) ! Add the sort order for NAM:NameKey for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,NAM:Name,1,BRW1)      ! Initialize the browse locator using  using key: NAM:NameKey , NAM:Name
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon NAM:Number for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,NAM:OrderKey) ! Add the sort order for NAM:OrderKey for sort order 3
  BRW1.AddRange(NAM:Number,Relate:NameList,Relate:Billing) ! Add file relationship range limit for sort order 3
  BRW1.AddField(NAM:Number,BRW1.Q.NAM:Number)     ! Field NAM:Number is a hot field or requires assignment from browse
  BRW1.AddField(NAM:Contact,BRW1.Q.NAM:Contact)   ! Field NAM:Contact is a hot field or requires assignment from browse
  BRW1.AddField(NAM:Name,BRW1.Q.NAM:Name)         ! Field NAM:Name is a hot field or requires assignment from browse
  BRW1.AddField(NAM:Address1,BRW1.Q.NAM:Address1) ! Field NAM:Address1 is a hot field or requires assignment from browse
  BRW1.AddField(NAM:Address2,BRW1.Q.NAM:Address2) ! Field NAM:Address2 is a hot field or requires assignment from browse
  BRW1.AddField(NAM:City,BRW1.Q.NAM:City)         ! Field NAM:City is a hot field or requires assignment from browse
  BRW1.AddField(NAM:State,BRW1.Q.NAM:State)       ! Field NAM:State is a hot field or requires assignment from browse
  BRW1.AddField(NAM:OldZipCode,BRW1.Q.NAM:OldZipCode) ! Field NAM:OldZipCode is a hot field or requires assignment from browse
  BRW1.AddField(NAM:Country,BRW1.Q.NAM:Country)   ! Field NAM:Country is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('BrowseNameList',QuickWindow)      ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','BrowseNameList',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,9,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:Billing.Close
    Relate:NameList.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('BrowseNameList',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateNameList
    ReturnValue = GlobalResponse
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
    OF ?SelectBilling
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectBilling()
      ThisWindow.Reset
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
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>2,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>2,1,NewOrder+1))
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
!!! Select a Billing Record
!!! </summary>
SelectBilling PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Billing)
                       PROJECT(BILL:Invoice)
                       PROJECT(BILL:Accession)
                       PROJECT(BILL:NameList)
                       PROJECT(BILL:DateFax1)
                       PROJECT(BILL:Letter1)
                       PROJECT(BILL:Letter2)
                       PROJECT(BILL:Letter3)
                       PROJECT(BILL:Letter4)
                       PROJECT(BILL:Letter5)
                       PROJECT(BILL:LastNamePatient)
                       PROJECT(BILL:FirstNamePatient)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BILL:Invoice           LIKE(BILL:Invoice)             !List box control field - type derived from field
BILL:Accession         LIKE(BILL:Accession)           !List box control field - type derived from field
BILL:NameList          LIKE(BILL:NameList)            !List box control field - type derived from field
BILL:DateFax1          LIKE(BILL:DateFax1)            !List box control field - type derived from field
BILL:Letter1           LIKE(BILL:Letter1)             !List box control field - type derived from field
BILL:Letter2           LIKE(BILL:Letter2)             !List box control field - type derived from field
BILL:Letter3           LIKE(BILL:Letter3)             !List box control field - type derived from field
BILL:Letter4           LIKE(BILL:Letter4)             !List box control field - type derived from field
BILL:Letter5           LIKE(BILL:Letter5)             !List box control field - type derived from field
BILL:LastNamePatient   LIKE(BILL:LastNamePatient)     !Browse key field - type derived from field
BILL:FirstNamePatient  LIKE(BILL:FirstNamePatient)    !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Select a Billing Record'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectBilling'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('36L(2)|M~Invoice~L(2)@p### ###p@4' & |
  '0L(2)|M~Accession~L(2)@p### ###p@56R(2)|M~Name List~C(0)@n13@80R(2)|M~Date~C(0)@d17@' & |
  '80R(2)|M~Letter 1~C(0)@d17@80R(2)|M~Letter 2~C(0)@d17@80R(2)|M~Letter 3~C(0)@d17@80R' & |
  '(2)|M~Letter 4~C(0)@d17@80R(2)|M~Letter 5~C(0)@d17@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Billing file')
                       BUTTON('&Select'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) OrderKey'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
  GlobalErrors.SetProcedureName('SelectBilling')
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
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Billing,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:LastNamePatient for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,BILL:OrderKey) ! Add the sort order for BILL:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,BILL:LastNamePatient,1,BRW1) ! Initialize the browse locator using  using key: BILL:OrderKey , BILL:LastNamePatient
  BRW1.AddField(BILL:Invoice,BRW1.Q.BILL:Invoice) ! Field BILL:Invoice is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Accession,BRW1.Q.BILL:Accession) ! Field BILL:Accession is a hot field or requires assignment from browse
  BRW1.AddField(BILL:NameList,BRW1.Q.BILL:NameList) ! Field BILL:NameList is a hot field or requires assignment from browse
  BRW1.AddField(BILL:DateFax1,BRW1.Q.BILL:DateFax1) ! Field BILL:DateFax1 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Letter1,BRW1.Q.BILL:Letter1) ! Field BILL:Letter1 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Letter2,BRW1.Q.BILL:Letter2) ! Field BILL:Letter2 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Letter3,BRW1.Q.BILL:Letter3) ! Field BILL:Letter3 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Letter4,BRW1.Q.BILL:Letter4) ! Field BILL:Letter4 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Letter5,BRW1.Q.BILL:Letter5) ! Field BILL:Letter5 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:LastNamePatient,BRW1.Q.BILL:LastNamePatient) ! Field BILL:LastNamePatient is a hot field or requires assignment from browse
  BRW1.AddField(BILL:FirstNamePatient,BRW1.Q.BILL:FirstNamePatient) ! Field BILL:FirstNamePatient is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('SelectBilling',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','SelectBilling',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,9,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:Billing.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('SelectBilling',QuickWindow)             ! Save window data to non-volatile store
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
!!! Form NameList
!!! </summary>
UpdateNameList PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::NAM:Record  LIKE(NAM:RECORD),THREAD
QuickWindow          WINDOW('Form NameList'),AT(,,358,182),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateNameList'),SYSTEM
                       SHEET,AT(4,4,350,156),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Number:'),AT(8,20),USE(?NAM:Number:Prompt),TRN
                           ENTRY(@p###-###-####p),AT(84,20,56,10),USE(NAM:Number),LEFT(1)
                           PROMPT('Contact:'),AT(8,34),USE(?NAM:Contact:Prompt),TRN
                           ENTRY(@s24),AT(84,34,100,10),USE(NAM:Contact)
                           PROMPT('Name:'),AT(8,48),USE(?NAM:Name:Prompt),TRN
                           ENTRY(@s32),AT(84,48,132,10),USE(NAM:Name)
                           PROMPT('Address 1:'),AT(8,62),USE(?NAM:Address1:Prompt),TRN
                           ENTRY(@s32),AT(84,62,132,10),USE(NAM:Address1)
                           PROMPT('Address 2:'),AT(8,76),USE(?NAM:Address2:Prompt),TRN
                           ENTRY(@s32),AT(84,76,132,10),USE(NAM:Address2)
                           PROMPT('City:'),AT(8,90),USE(?NAM:City:Prompt),TRN
                           ENTRY(@s20),AT(84,90,84,10),USE(NAM:City)
                           PROMPT('State:'),AT(8,104),USE(?NAM:State:Prompt),TRN
                           ENTRY(@s2),AT(84,104,40,10),USE(NAM:State)
                           PROMPT('Postal Code'),AT(8,118),USE(?NAM:OldZipCode:Prompt),TRN
                           ENTRY(@s12),AT(84,118,52,10),USE(NAM:OldZipCode),MSG('Use PostalCode'),TIP('Use PostalCode')
                           PROMPT('Country:'),AT(8,132),USE(?NAM:Country:Prompt),TRN
                           ENTRY(@s20),AT(84,132,84,10),USE(NAM:Country)
                           PROMPT('Email:'),AT(8,146),USE(?NAM:Email:Prompt),TRN
                           ENTRY(@s40),AT(84,146,164,10),USE(NAM:Email)
                         END
                         TAB('&2) General (cont.)'),USE(?Tab:2)
                           PROMPT('Website:'),AT(8,20),USE(?NAM:Website:Prompt),TRN
                           ENTRY(@s40),AT(84,20,164,10),USE(NAM:Website)
                           PROMPT('Type:'),AT(8,34),USE(?NAM:Type:Prompt),TRN
                           ENTRY(@s1),AT(84,34,40,10),USE(NAM:Type)
                           PROMPT('Pricing Level:'),AT(8,48),USE(?NAM:PricingLevel:Prompt),TRN
                           ENTRY(@n3),AT(84,48,40,10),USE(NAM:PricingLevel)
                           PROMPT('Terms:'),AT(8,62),USE(?NAM:Terms:Prompt),TRN
                           ENTRY(@s12),AT(84,62,52,10),USE(NAM:Terms)
                           PROMPT('Credit Card:'),AT(8,76),USE(?NAM:CreditCard:Prompt),TRN
                           ENTRY(@s20),AT(84,76,84,10),USE(NAM:CreditCard)
                           PROMPT('Exp:'),AT(8,90),USE(?NAM:Exp:Prompt),TRN
                           ENTRY(@s4),AT(84,90,40,10),USE(NAM:Exp)
                           PROMPT('Language:'),AT(8,104),USE(?NAM:Language:Prompt),TRN
                           ENTRY(@n3),AT(84,104,40,10),USE(NAM:Language)
                           PROMPT('Delivery Charge:'),AT(8,118),USE(?NAM:DeliveryCharge:Prompt),TRN
                           ENTRY(@n3),AT(84,118,40,10),USE(NAM:DeliveryCharge)
                           PROMPT('Delivery Amount:'),AT(8,132),USE(?NAM:DeliveryAmount:Prompt),TRN
                           ENTRY(@n-7.2),AT(84,132,40,10),USE(NAM:DeliveryAmount),DECIMAL(12)
                           PROMPT('Campaign:'),AT(8,146),USE(?NAM:Campaign:Prompt),TRN
                           ENTRY(@n-14),AT(84,146,64,10),USE(NAM:Campaign),RIGHT(1)
                         END
                         TAB('&3) General (cont. 2)'),USE(?Tab:3)
                           PROMPT('Date:'),AT(8,20),USE(?NAM:Date:Prompt),TRN
                           ENTRY(@d1),AT(84,20,104,10),USE(NAM:Date),RIGHT(1)
                           PROMPT('Last Contact Date:'),AT(8,34),USE(?NAM:LastContactDate:Prompt),TRN
                           ENTRY(@d17),AT(84,34,104,10),USE(NAM:LastContactDate)
                           PROMPT('Last Contact Type:'),AT(8,48),USE(?NAM:LastContactType:Prompt),TRN
                           ENTRY(@n-7),AT(84,48,40,10),USE(NAM:LastContactType),RIGHT(1)
                           PROMPT('Count:'),AT(8,62),USE(?NAM:Count:Prompt),TRN
                           ENTRY(@n13),AT(84,62,56,10),USE(NAM:Count)
                           PROMPT('Amount:'),AT(8,76),USE(?NAM:Amount:Prompt),TRN
                           ENTRY(@n-10.2),AT(84,76,48,10),USE(NAM:Amount),DECIMAL(12)
                           PROMPT('Postal Code:'),AT(8,90),USE(?NAM:Postalcode:Prompt),TRN
                           ENTRY(@s20),AT(84,90,84,10),USE(NAM:Postalcode)
                           PROMPT('Mobile:'),AT(8,104),USE(?NAM:Mobile:Prompt),TRN
                           ENTRY(@s20),AT(84,104,84,10),USE(NAM:Mobile)
                           PROMPT('Field 3:'),AT(8,118),USE(?NAM:Field3:Prompt),TRN
                           ENTRY(@s60),AT(84,118,244,10),USE(NAM:Field3)
                           PROMPT('Field 4:'),AT(8,132),USE(?NAM:Field4:Prompt),TRN
                           ENTRY(@s60),AT(84,132,244,10),USE(NAM:Field4)
                           PROMPT('Non Taxable YN:'),AT(8,146),USE(?NAM:NonTaxableYN:Prompt),TRN
                           ENTRY(@s1),AT(84,146,40,10),USE(NAM:NonTaxableYN)
                         END
                         TAB('&4) General (cont. 3)'),USE(?Tab:4)
                           PROMPT('For:'),AT(8,32),USE(?NAM:For:Prompt),TRN
                           ENTRY(@s6),AT(84,32,40,10),USE(NAM:For)
                           PROMPT('Note:'),AT(8,46),USE(?NAM:Note:Prompt),TRN
                           ENTRY(@s250),AT(84,46,266,10),USE(NAM:Note)
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
  GlobalErrors.SetProcedureName('UpdateNameList')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?NAM:Number:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NAM:Record,History::NAM:Record)
  SELF.AddHistoryField(?NAM:Number,1)
  SELF.AddHistoryField(?NAM:Contact,2)
  SELF.AddHistoryField(?NAM:Name,3)
  SELF.AddHistoryField(?NAM:Address1,4)
  SELF.AddHistoryField(?NAM:Address2,5)
  SELF.AddHistoryField(?NAM:City,6)
  SELF.AddHistoryField(?NAM:State,7)
  SELF.AddHistoryField(?NAM:OldZipCode,8)
  SELF.AddHistoryField(?NAM:Country,9)
  SELF.AddHistoryField(?NAM:Email,10)
  SELF.AddHistoryField(?NAM:Website,11)
  SELF.AddHistoryField(?NAM:Type,12)
  SELF.AddHistoryField(?NAM:PricingLevel,13)
  SELF.AddHistoryField(?NAM:Terms,14)
  SELF.AddHistoryField(?NAM:CreditCard,15)
  SELF.AddHistoryField(?NAM:Exp,16)
  SELF.AddHistoryField(?NAM:Language,17)
  SELF.AddHistoryField(?NAM:DeliveryCharge,18)
  SELF.AddHistoryField(?NAM:DeliveryAmount,19)
  SELF.AddHistoryField(?NAM:Campaign,20)
  SELF.AddHistoryField(?NAM:Date,21)
  SELF.AddHistoryField(?NAM:LastContactDate,22)
  SELF.AddHistoryField(?NAM:LastContactType,23)
  SELF.AddHistoryField(?NAM:Count,24)
  SELF.AddHistoryField(?NAM:Amount,25)
  SELF.AddHistoryField(?NAM:Postalcode,26)
  SELF.AddHistoryField(?NAM:Mobile,27)
  SELF.AddHistoryField(?NAM:Field3,28)
  SELF.AddHistoryField(?NAM:Field4,29)
  SELF.AddHistoryField(?NAM:NonTaxableYN,30)
  SELF.AddHistoryField(?NAM:For,32)
  SELF.AddHistoryField(?NAM:Note,33)
  SELF.AddUpdateFile(Access:NameList)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:NameList.Open                                     ! File NameList used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:NameList
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
    ?NAM:Number{PROP:ReadOnly} = True
    ?NAM:Contact{PROP:ReadOnly} = True
    ?NAM:Name{PROP:ReadOnly} = True
    ?NAM:Address1{PROP:ReadOnly} = True
    ?NAM:Address2{PROP:ReadOnly} = True
    ?NAM:City{PROP:ReadOnly} = True
    ?NAM:State{PROP:ReadOnly} = True
    ?NAM:OldZipCode{PROP:ReadOnly} = True
    ?NAM:Country{PROP:ReadOnly} = True
    ?NAM:Email{PROP:ReadOnly} = True
    ?NAM:Website{PROP:ReadOnly} = True
    ?NAM:Type{PROP:ReadOnly} = True
    ?NAM:PricingLevel{PROP:ReadOnly} = True
    ?NAM:Terms{PROP:ReadOnly} = True
    ?NAM:CreditCard{PROP:ReadOnly} = True
    ?NAM:Exp{PROP:ReadOnly} = True
    ?NAM:Language{PROP:ReadOnly} = True
    ?NAM:DeliveryCharge{PROP:ReadOnly} = True
    ?NAM:DeliveryAmount{PROP:ReadOnly} = True
    ?NAM:Campaign{PROP:ReadOnly} = True
    ?NAM:Date{PROP:ReadOnly} = True
    ?NAM:LastContactDate{PROP:ReadOnly} = True
    ?NAM:LastContactType{PROP:ReadOnly} = True
    ?NAM:Count{PROP:ReadOnly} = True
    ?NAM:Amount{PROP:ReadOnly} = True
    ?NAM:Postalcode{PROP:ReadOnly} = True
    ?NAM:Mobile{PROP:ReadOnly} = True
    ?NAM:Field3{PROP:ReadOnly} = True
    ?NAM:Field4{PROP:ReadOnly} = True
    ?NAM:NonTaxableYN{PROP:ReadOnly} = True
    ?NAM:For{PROP:ReadOnly} = True
    ?NAM:Note{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateNameList',QuickWindow)               ! Restore window settings from non-volatile store
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
    Relate:NameList.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateNameList',QuickWindow)            ! Save window data to non-volatile store
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
!!! Browse the Patient file
!!! </summary>
AssessionLookup PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Patient)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:LAST)
                       PROJECT(Pat:FIRST)
                       PROJECT(Pat:ACCESSION)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:BILLED)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pat:INVOICE            LIKE(Pat:INVOICE)              !List box control field - type derived from field
Pat:DATE               LIKE(Pat:DATE)                 !List box control field - type derived from field
Pat:LAST               LIKE(Pat:LAST)                 !List box control field - type derived from field
Pat:FIRST              LIKE(Pat:FIRST)                !List box control field - type derived from field
Pat:ACCESSION          LIKE(Pat:ACCESSION)            !Browse key field - type derived from field
Pat:CLIENT             LIKE(Pat:CLIENT)               !Browse key field - type derived from field
Pat:BILLED             LIKE(Pat:BILLED)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the Patient file'),AT(,,358,198),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('AssessionLookup'),SYSTEM
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('64R(2)|M~Assession~C(0)@n-14@64R(' & |
  '2)|M~Date~C(0)@D1@80L(2)|M~LAST~@s20@64L(2)|M~FIRST~@s15@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Patient file')
                       BUTTON('&Select'),AT(301,158,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) ORDER_KEY'),USE(?Tab:2)
                         END
                         TAB('&2) INVOICE_KEY'),USE(?Tab:3)
                         END
                         TAB('&3) DATE_KEY'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Close'),AT(252,180,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(305,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
BRW1::Sort4:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
BRW1::Sort5:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 6
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
  GlobalErrors.SetProcedureName('AssessionLookup')
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
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Payments.Open                            ! File Payments used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Patient,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:INVOICE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Pat:INVOICE_KEY) ! Add the sort order for Pat:INVOICE_KEY for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Pat:INVOICE,,BRW1)    ! Initialize the browse locator using  using key: Pat:INVOICE_KEY , Pat:INVOICE
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:DATE for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Pat:DATE_KEY) ! Add the sort order for Pat:DATE_KEY for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Pat:DATE,,BRW1)       ! Initialize the browse locator using  using key: Pat:DATE_KEY , Pat:DATE
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:ACCESSION for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,Pat:ACCESS_KEY) ! Add the sort order for Pat:ACCESS_KEY for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)            ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,Pat:ACCESSION,,BRW1)  ! Initialize the browse locator using  using key: Pat:ACCESS_KEY , Pat:ACCESSION
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:CLIENT for sort order 4
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,Pat:CLIENT_KEY) ! Add the sort order for Pat:CLIENT_KEY for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)            ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,Pat:CLIENT,,BRW1)     ! Initialize the browse locator using  using key: Pat:CLIENT_KEY , Pat:CLIENT
  BRW1::Sort5:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:BILLED for sort order 5
  BRW1.AddSortOrder(BRW1::Sort5:StepClass,Pat:SHIP_KEY) ! Add the sort order for Pat:SHIP_KEY for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)            ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,Pat:BILLED,,BRW1)     ! Initialize the browse locator using  using key: Pat:SHIP_KEY , Pat:BILLED
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Pat:LAST for sort order 6
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pat:ORDER_KEY) ! Add the sort order for Pat:ORDER_KEY for sort order 6
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 6
  BRW1::Sort0:Locator.Init(,Pat:LAST,1,BRW1)      ! Initialize the browse locator using  using key: Pat:ORDER_KEY , Pat:LAST
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)   ! Field Pat:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:DATE,BRW1.Q.Pat:DATE)         ! Field Pat:DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:LAST,BRW1.Q.Pat:LAST)         ! Field Pat:LAST is a hot field or requires assignment from browse
  BRW1.AddField(Pat:FIRST,BRW1.Q.Pat:FIRST)       ! Field Pat:FIRST is a hot field or requires assignment from browse
  BRW1.AddField(Pat:ACCESSION,BRW1.Q.Pat:ACCESSION) ! Field Pat:ACCESSION is a hot field or requires assignment from browse
  BRW1.AddField(Pat:CLIENT,BRW1.Q.Pat:CLIENT)     ! Field Pat:CLIENT is a hot field or requires assignment from browse
  BRW1.AddField(Pat:BILLED,BRW1.Q.Pat:BILLED)     ! Field Pat:BILLED is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('AssessionLookup',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','AssessionLookup',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,4,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:Patient.Close
    Relate:Payments.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('AssessionLookup',QuickWindow)           ! Save window data to non-volatile store
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSIF CHOICE(?CurrentTab) = 6
    RETURN SELF.SetSort(5,Force)
  ELSE
    RETURN SELF.SetSort(6,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>5,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>5,1,NewOrder+1))
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
!!! Form Billing
!!! </summary>
autoNumb PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::BILL:Record LIKE(BILL:RECORD),THREAD
QuickWindow          WINDOW('Form Billing'),AT(,,358,182),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('autoNumb'),SYSTEM
                       SHEET,AT(4,4,350,156),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Invoice:'),AT(8,20),USE(?BILL:Invoice:Prompt),TRN
                           ENTRY(@p### ###p),AT(80,20,40,10),USE(BILL:Invoice),RIGHT(1)
                           PROMPT('Accession:'),AT(8,34),USE(?BILL:Accession:Prompt),TRN
                           ENTRY(@p### ###p),AT(80,34,40,10),USE(BILL:Accession),RIGHT(1)
                           PROMPT('Name List:'),AT(8,48),USE(?BILL:NameList:Prompt),TRN
                           ENTRY(@n13),AT(80,48,56,10),USE(BILL:NameList),RIGHT(1)
                           PROMPT('Date:'),AT(8,62),USE(?BILL:Date:Prompt),TRN
                           ENTRY(@d17),AT(80,62,104,10),USE(BILL:DateFax1)
                           PROMPT('Letter 1:'),AT(8,76),USE(?BILL:Letter1:Prompt),TRN
                           ENTRY(@d17),AT(80,76,104,10),USE(BILL:Letter1)
                           PROMPT('Letter 2:'),AT(8,90),USE(?BILL:Letter2:Prompt),TRN
                           ENTRY(@d17),AT(80,90,104,10),USE(BILL:Letter2)
                           PROMPT('Letter 3:'),AT(8,104),USE(?BILL:Letter3:Prompt),TRN
                           ENTRY(@d17),AT(80,104,104,10),USE(BILL:Letter3)
                           PROMPT('Letter 4:'),AT(8,118),USE(?BILL:Letter4:Prompt),TRN
                           ENTRY(@d17),AT(80,118,104,10),USE(BILL:Letter4)
                           PROMPT('Letter 5:'),AT(8,132),USE(?BILL:Letter5:Prompt),TRN
                           ENTRY(@d17),AT(80,132,104,10),USE(BILL:Letter5)
                           PROMPT('Insurance Billed:'),AT(8,146),USE(?BILL:InsuranceBilled:Prompt),TRN
                           ENTRY(@n-10.2),AT(80,146,48,10),USE(BILL:InsuranceBilled),DECIMAL(12)
                         END
                         TAB('&2) General (cont.)'),USE(?Tab:2)
                           PROMPT('Insurance Paid:'),AT(8,20),USE(?BILL:InsurancePaid:Prompt),TRN
                           ENTRY(@n-10.2),AT(80,20,48,10),USE(BILL:InsurancePaid),DECIMAL(12)
                           PROMPT('Insurance Adj:'),AT(8,34),USE(?BILL:InsuranceAdj:Prompt),TRN
                           ENTRY(@n-10.2),AT(80,34,48,10),USE(BILL:InsuranceAdj),DECIMAL(12)
                           PROMPT('Other Adj:'),AT(8,48),USE(?BILL:OtherAdj:Prompt),TRN
                           ENTRY(@n-10.2),AT(80,48,48,10),USE(BILL:OtherAdj),DECIMAL(12)
                           PROMPT('Out Standing:'),AT(8,62),USE(?BILL:OutStanding:Prompt),TRN
                           ENTRY(@n-10.2),AT(80,62,48,10),USE(BILL:OutStanding),DECIMAL(12)
                           PROMPT('Attribute:'),AT(8,76),USE(?BILL:Attribute:Prompt),TRN
                           ENTRY(@n13),AT(80,76,56,10),USE(BILL:Attribute),RIGHT(1)
                           PROMPT('Payment Plan:'),AT(8,90),USE(?BILL:PaymentPlan:Prompt),TRN
                           ENTRY(@s2),AT(80,90,40,10),USE(BILL:PaymentPlan)
                         END
                         TAB('&3) Comment'),USE(?Tab:3)
                           PROMPT('Comment:'),AT(8,20),USE(?BILL:Comment:Prompt),TRN
                           ENTRY(@s255),AT(80,20,270,10),USE(BILL:Comment)
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
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('autoNumb')
    stop('i) ' & BILL:invoice)
    stop('gloRequest=' & GlobalRequest)
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?BILL:Invoice:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(BILL:Record,History::BILL:Record)
  SELF.AddHistoryField(?BILL:Invoice,1)
  SELF.AddHistoryField(?BILL:Accession,5)
  SELF.AddHistoryField(?BILL:NameList,9)
  SELF.AddHistoryField(?BILL:DateFax1,13)
  SELF.AddHistoryField(?BILL:Letter1,51)
  SELF.AddHistoryField(?BILL:Letter2,52)
  SELF.AddHistoryField(?BILL:Letter3,53)
  SELF.AddHistoryField(?BILL:Letter4,54)
  SELF.AddHistoryField(?BILL:Letter5,55)
  SELF.AddHistoryField(?BILL:InsuranceBilled,61)
  SELF.AddHistoryField(?BILL:InsurancePaid,62)
  SELF.AddHistoryField(?BILL:InsuranceAdj,63)
  SELF.AddHistoryField(?BILL:OtherAdj,66)
  SELF.AddHistoryField(?BILL:OutStanding,69)
  SELF.AddHistoryField(?BILL:Attribute,70)
  SELF.AddHistoryField(?BILL:PaymentPlan,72)
  SELF.AddHistoryField(?BILL:Comment,92)
  SELF.AddUpdateFile(Access:Billing)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
    stop('1) ' & BILL:invoice)
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Billing
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
    stop('2) ' & BILL:invoice)
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?BILL:Invoice{PROP:ReadOnly} = True
    ?BILL:Accession{PROP:ReadOnly} = True
    ?BILL:NameList{PROP:ReadOnly} = True
    ?BILL:DateFax1{PROP:ReadOnly} = True
    ?BILL:Letter1{PROP:ReadOnly} = True
    ?BILL:Letter2{PROP:ReadOnly} = True
    ?BILL:Letter3{PROP:ReadOnly} = True
    ?BILL:Letter4{PROP:ReadOnly} = True
    ?BILL:Letter5{PROP:ReadOnly} = True
    ?BILL:InsuranceBilled{PROP:ReadOnly} = True
    ?BILL:InsurancePaid{PROP:ReadOnly} = True
    ?BILL:InsuranceAdj{PROP:ReadOnly} = True
    ?BILL:OtherAdj{PROP:ReadOnly} = True
    ?BILL:OutStanding{PROP:ReadOnly} = True
    ?BILL:Attribute{PROP:ReadOnly} = True
    ?BILL:PaymentPlan{PROP:ReadOnly} = True
    ?BILL:Comment{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('autoNumb',QuickWindow)                     ! Restore window settings from non-volatile store
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
    Relate:Billing.Close
  END
  IF SELF.Opened
    INIMgr.Update('autoNumb',QuickWindow)                  ! Save window data to non-volatile store
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
!!! Form Payments
!!! </summary>
UpdatePayment PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
FDB8::View:FileDrop  VIEW(PayType)
                       PROJECT(Pay1:Type)
                     END
Queue:FileDrop       QUEUE                            !Queue declaration for browse/combo box using ?Pay:Type
Pay1:Type              LIKE(Pay1:Type)                !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
History::Pay:Record  LIKE(Pay:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),GRAY,IMM,MDI,HLP('UpdatePayment'), |
  SYSTEM
                       PROMPT('Date:'),AT(8,34),USE(?Pay:Date:Prompt),TRN
                       ENTRY(@d17),AT(61,34,48,10),USE(Pay:Date)
                       PROMPT('Amount:'),AT(8,48),USE(?Pay:Amount:Prompt),TRN
                       ENTRY(@n-10.2),AT(61,48,48,10),USE(Pay:Amount),RIGHT(2)
                       PROMPT('Note:'),AT(8,62),USE(?Pay:Note:Prompt),TRN
                       BUTTON('&OK'),AT(275,136,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(156,136,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(15,130,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       TEXT,AT(63,70,203),USE(Pay:Note)
                       BUTTON('Credit Card'),AT(124,47,65),USE(?ButtonCreditCard)
                       LIST,AT(124,34,,10),USE(Pay:Type),DROP(5),FORMAT('64L(2)|M~Type~L(0)@s16@'),FROM(Queue:FileDrop)
                       STRING(@p### ###p),AT(62,9),USE(Pay:Invoice)
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

FDB8                 CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop                !Reference to display queue
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
  GlobalErrors.SetProcedureName('UpdatePayment')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pay:Date:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pay:Record,History::Pay:Record)
  SELF.AddHistoryField(?Pay:Date,3)
  SELF.AddHistoryField(?Pay:Amount,4)
  SELF.AddHistoryField(?Pay:Note,9)
  SELF.AddHistoryField(?Pay:Type,2)
  SELF.AddHistoryField(?Pay:Invoice,1)
  SELF.AddUpdateFile(Access:Payments)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PayType.Open                                      ! File PayType used by this procedure, so make sure it's RelationManager is open
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
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?Pay:Date{PROP:ReadOnly} = True
    ?Pay:Amount{PROP:ReadOnly} = True
    DISABLE(?ButtonCreditCard)
    DISABLE(?Pay:Type)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  FDB8.Init(?Pay:Type,Queue:FileDrop.ViewPosition,FDB8::View:FileDrop,Queue:FileDrop,Relate:PayType,ThisWindow)
  FDB8.Q &= Queue:FileDrop
  FDB8.AddSortOrder()
  FDB8.AddField(Pay1:Type,FDB8.Q.Pay1:Type) !List box control field - type derived from field
  FDB8.AddUpdateField(Pay1:Type,Pay:Type)
  ThisWindow.AddItem(FDB8.WindowComponent)
  FDB8.DefaultFill = 0
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
    Relate:PayType.Close
    Relate:Payments.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  Pay:Date = TODAY()
  Pay:Invoice = BILL:Accession
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
    OF ?ButtonCreditCard
      ThisWindow.Update
      CreditCard()
      ThisWindow.Reset
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
!!! Form Billing
!!! </summary>
UpdateBilling1 PROCEDURE 

locVerifiedBy     STRING(2),OVER(Pat:IGE)
locItemTotal         DECIMAL(7,2)                          !
locAccountTypes      STRING('0=client<13,10>1=insurance<13,10>2=Medicaid<13,10>3=Medicare<13,10>4=Patient<13,10>5=Recall<13,10> {60}') !
locInsuranceType     STRING(16)                            !
locWindowInitialized LONG                                  !
locInsuranceNetwork  LONG                                  !
locClientName        STRING(32)                            !
locFeeTypeString     STRING(16)                            !
locFeeString         STRING(16),DIM(8)                     !
locFeeValues         LONG,DIM(8)                           !
Labels               STRING(32),DIM(8)                     !
locComponent         LONG,DIM(4)                           !
locTIgE              LONG                                  !
locTIgG              LONG                                  !
locTIgA              LONG                                  !
locTIgM              LONG                                  !
locRast              LONG,DIM(3)                           !
locMix               LONG,DIM(3)                           !
locHymenoptera       LONG,DIM(3)                           !
locOccupational      LONG,DIM(3)                           !
locChemical          LONG,DIM(3)                           !
locPanel260s145      LONG                                  !
locPanel260          LONG                                  !
locPanel270          LONG                                  !
locFees              DECIMAL(7,2)                          !
locCodeTotal         LONG                                  !
locGender            STRING(8)                             !
locAge               STRING(8)                             !
locAmountDue         DECIMAL(7,2)                          !
CurrentTab           LONG                                  !
locLetters           BYTE                                  !
locFeeType           LONG                                  !
locName              STRING(64)                            !
locLastPayment       DATE                                  !
locLastLetter        DATE                                  !
locPatientBillingAmount DECIMAL(7,2)                       !
locShowPaymentTotal  DECIMAL(7,2)                          !
locBalance           DECIMAL(7,2)                          !
locLetterDays        USHORT                                !
ActionMessage        CSTRING(40)                           !
BRW8::View:Browse    VIEW(Payments)
                       PROJECT(Pay:Date)
                       PROJECT(Pay:Type)
                       PROJECT(Pay:Amount)
                       PROJECT(Pay:Note)
                       PROJECT(Pay:Invoice)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pay:Date               LIKE(Pay:Date)                 !List box control field - type derived from field
Pay:Type               LIKE(Pay:Type)                 !List box control field - type derived from field
Pay:Amount             LIKE(Pay:Amount)               !List box control field - type derived from field
Pay:Note               LIKE(Pay:Note)                 !List box control field - type derived from field
Pay:Invoice            LIKE(Pay:Invoice)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW15::View:Browse   VIEW(Insurance)
                       PROJECT(Ins:From)
                       PROJECT(Ins:Too)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
Ins:From               LIKE(Ins:From)                 !List box control field - type derived from field
Ins:Too                LIKE(Ins:Too)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(BillingItems)
                       PROJECT(BI:Qty)
                       PROJECT(BI:Description)
                       PROJECT(BI:Price)
                       PROJECT(BI:Patient)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?List:5
BI:Qty                 LIKE(BI:Qty)                   !List box control field - type derived from field
BI:Description         LIKE(BI:Description)           !List box control field - type derived from field
BI:Price               LIKE(BI:Price)                 !List box control field - type derived from field
BI:Patient             LIKE(BI:Patient)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB14::View:FileDrop VIEW(Providers)
                       PROJECT(Pro:Description)
                     END
Queue:FileDrop:3     QUEUE                            !Queue declaration for browse/combo box using ?Pro:Description
Pro:Description        LIKE(Pro:Description)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
History::BILL:Record LIKE(BILL:RECORD),THREAD
BRW8::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW8::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW8::PopupChoice    SIGNED                       ! Popup current choice
BRW8::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW8::PopupChoiceExec BYTE(0)                     ! Popup executed
BRW15::FormatManager ListFormatManagerClass,THREAD ! LFM object
BRW15::PopupTextExt  STRING(1024)                 ! Extended popup text
BRW15::PopupChoice   SIGNED                       ! Popup current choice
BRW15::PopupChoiceOn BYTE(1)                      ! Popup on/off choice
BRW15::PopupChoiceExec BYTE(0)                    ! Popup executed
BRW12::FormatManager ListFormatManagerClass,THREAD ! LFM object
BRW12::PopupTextExt  STRING(1024)                 ! Extended popup text
BRW12::PopupChoice   SIGNED                       ! Popup current choice
BRW12::PopupChoiceOn BYTE(1)                      ! Popup on/off choice
BRW12::PopupChoiceExec BYTE(0)                    ! Popup executed
QuickWindow          WINDOW,AT(,,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),CENTER,GRAY,IMM,MDI,HLP('UpdateBilling')
                       SHEET,AT(-1,-1,465,194),USE(?CurrentTab),FONT(,,,FONT:regular),SPREAD
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Verified By:'),AT(12,32,55),USE(?Pat:IGE:Prompt),RIGHT,TRN
                           ENTRY(@s3),AT(70,32,22,10),USE(BILL:VerifiedBy),LEFT(2),UPR
                           ENTRY(@s3),AT(100,32,22,10),USE(BILL:VerifiedBy2),UPR
                           PROMPT('QB:'),AT(12,56,55),USE(?BILL:QB:Prompt),RIGHT,TRN
                           ENTRY(@s16),AT(68,56,95,10),USE(BILL:InsuranceQB),HIDE
                           PROMPT('Date:'),AT(12,72,55),USE(?BILL:Date:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(68,72,40,10),USE(BILL:DateFax1)
                           STRING('Description:'),AT(12,82,55),RIGHT,TRN
                           ENTRY(@s40),AT(68,82,214,10),USE(BILL:Description)
                           PROMPT('Comment:'),AT(10,120),USE(?BILL:Comment:Prompt),TRN
                           TEXT,AT(64,120,241),USE(BILL:Comment,,?BILL:Comment:2)
                           ENTRY(@n-14),AT(70,46,95,10),USE(BILL:PatientQB)
                         END
                         TAB('Patient'),USE(?Tab:Patient)
                           STRING('Last Name:'),AT(34,24,55),TRN
                           ENTRY(@s24),AT(92,20,104),USE(BILL:LastNamePatient)
                           ENTRY(@s24),AT(92,40),USE(BILL:FirstNamePatient,,?BILL:FirstNamePatient:2)
                           PROMPT('First Name:'),AT(34,43,55,10),USE(?BILL:FirstNamePatient:Prompt),TRN
                           OPTION('Gender'),AT(160,51,48,26),USE(BILL:ClientRequestCheckmarks),TRN
                             RADIO('Male'),AT(166,56,27),USE(?OPTION1:RADIO2),VALUE('M'),TRN
                             RADIO('Female'),AT(166,65,40),USE(?OPTION1:RADIO3),VALUE('F'),TRN
                           END
                           PROMPT('Address:'),AT(32,80,55),USE(?BILL:AddressPatient:Prompt),TRN
                           ENTRY(@s32),AT(92,80,139,11),USE(BILL:AddressPatient)
                           PROMPT('Postal Code,'),AT(8,97,43),USE(?BILL:PostalcodePatient:Prompt),TRN
                           ENTRY(@s10),AT(92,96,60,10),USE(BILL:PostalPatient)
                           PROMPT('City:'),AT(52,97),USE(?BILL:CityPatient:Prompt),TRN
                           ENTRY(@s20),AT(170,97,92,10),USE(BILL:CityPatient)
                           PROMPT('State:'),AT(68,97),USE(?BILL:StatePatient:Prompt),TRN
                           ENTRY(@s2),AT(276,97,25,10),USE(BILL:StatePatient)
                           PROMPT('Email:'),AT(34,115,55),USE(?BILL:EmailPatient:Prompt),TRN
                           ENTRY(@s64),AT(92,112,244,12),USE(BILL:emailPatient,,?BILL:emailPatient:2)
                           PROMPT('Phone:'),AT(34,131,55),USE(?BILL:PhonePatient:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(92,130,60,10),USE(BILL:PhonePatient),RIGHT(2)
                           PROMPT('Phone Alt:'),AT(34,147,55),USE(?BILL:PhoneAltPatient:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(92,146,60,10),USE(BILL:PhoneAltPatient),FONT(,,,FONT:regular), |
  RIGHT(2)
                           OPTION('Relationship to Insured'),AT(218,27,83),USE(BILL:RelationshipToInsured),BOXED,TRN
                             RADIO('Self'),AT(226,36),USE(?OPTION1:RADIO4),VALUE('1'),TRN
                             RADIO('Spouse'),AT(226,47),USE(?BILL:RELATIONSHIPTOINSURED:RADIO1),VALUE('2'),TRN
                             RADIO('Child'),AT(226,56),USE(?BILL:RELATIONSHIPTOINSURED:RADIO2),VALUE('3'),TRN
                             RADIO('Other'),AT(226,66),USE(?BILL:RELATIONSHIPTOINSURED:RADIO3),VALUE('4'),TRN
                           END
                           CHECK('Employment'),AT(306,47,69),USE(BILL:ConditionRelatedTo[1],,?BILL:ConditionRelatedTo:2), |
  VALUE('Y','N'),TRN
                           CHECK('Auto Accident'),AT(306,56,69),USE(BILL:ConditionRelatedTo[2]),VALUE('Y','N'),TRN
                           CHECK('Other Accident'),AT(306,66),USE(BILL:ConditionRelatedTo[3]),VALUE('Y','N'),TRN
                         END
                         TAB('Insured'),USE(?Tab:Insured)
                           STRING('Last Name:'),AT(32,40,55),TRN
                           ENTRY(@s24),AT(92,37,104),USE(?ENTRY1)
                           ENTRY(@s24),AT(92,52),USE(BILL:FirstNameInsured)
                           STRING('First Name:'),AT(30,55,55,10),USE(?STRING24),TRN
                           OPTION('Gender'),AT(205,53,48,26),USE(BILL:GenderInsured),TRN
                             RADIO('Male'),AT(212,57,27),USE(?OPTION1:RADIO2:2),VALUE('M'),TRN
                             RADIO('Female'),AT(211,67,40),USE(?OPTION1:RADIO3:2),VALUE('F'),TRN
                           END
                           PROMPT('Address:'),AT(32,84,55),USE(?BILL:AddressInsured:Prompt),TRN
                           ENTRY(@s32),AT(92,82,139,11),USE(BILL:AddressInsured)
                           PROMPT('Postal Code,'),AT(8,97,43),USE(?BILL:PostalcodeInsured:Prompt),TRN
                           ENTRY(@s10),AT(92,96,60,10),USE(BILL:PostalInsured)
                           PROMPT('City:'),AT(52,97),USE(?BILL:CityInsured:Prompt),TRN
                           ENTRY(@s20),AT(169,97,92,10),USE(BILL:CityInsured)
                           PROMPT('State:'),AT(68,97),USE(?BILL:StateInsured:Prompt),TRN
                           ENTRY(@s2),AT(276,97,25,10),USE(BILL:StateInsured)
                           PROMPT('Email:'),AT(33,115,55),USE(?BILL:EmailInsured:Prompt),TRN
                           ENTRY(@s64),AT(92,112,244,12),USE(BILL:emailPatient)
                           PROMPT('Phone:'),AT(33,131,55),USE(?BILL:PhoneInsured:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(92,130,60,10),USE(BILL:PhoneInsured),RIGHT(2)
                           PROMPT('Phone Alt:'),AT(33,147,55),USE(?BILL:PhoneAltInsured:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(92,146,60,10),USE(BILL:PhoneAltInsured),FONT(,,,FONT:regular), |
  RIGHT(2)
                           ENTRY(@s32),AT(92,22),USE(BILL:IdInsured)
                           PROMPT('Insured ID'),AT(32,25),USE(?PROMPT1),TRN
                           ENTRY(@d17),AT(92,67),USE(BILL:DoBInsured)
                           STRING('DoB'),AT(30,70),USE(?STRING26),TRN
                         END
                         TAB('Insurance'),USE(?Tab:Financial)
                           OPTION('Assignment'),AT(31,148,66,26),USE(BILL:Assignment,,?BILL:Assignment:2),FONT(,,,FONT:regular), |
  BOXED,TRN
                             RADIO('Yes'),AT(37,157),USE(?OPTION1:RADIO1),VALUE('1'),TRN
                             RADIO('No'),AT(73,156,23),USE(?BILL:ASSIGNMENT),VALUE('0'),TRN
                           END
                           STRING('Provider'),AT(29,119),USE(?STRING7),TRN
                           LIST,AT(28,129,,13),USE(Pro:Description),DROP(5),FORMAT('80L(2)|M~Description~L(0)@s20@'), |
  FROM(Queue:FileDrop:3)
                           LIST,AT(276,40,150,100),USE(?List:3),DECIMAL(12),FORMAT('40L(2)|M~From~L(0)@d17@40L(2)|' & |
  'M~To~L(0)@d17@'),FROM(Queue:Browse:2),IMM
                           BUTTON('&Insert'),AT(286,143,42,12),USE(?Insert:2)
                           BUTTON('&Change'),AT(328,143,42,12),USE(?Change:2)
                           BUTTON('&Delete'),AT(370,143,42,12),USE(?Delete:2)
                           ENTRY(@s64),AT(64,34),USE(BILL:PlanName)
                           STRING('Plan Name'),AT(22,36),USE(?STRING21),TRN
                           CHECK('Is there another plan?'),AT(64,68),USE(BILL:AnotherPlan),TRN,MSG('Yes No?')
                           ENTRY(@s32),AT(64,49),USE(BILL:PolicyGroupInsured)
                           STRING('Group / FECA'),AT(15,50),USE(?STRING25),TRN
                         END
                         TAB('Financial'),USE(?Tab:Financial:2)
                           PROMPT('Insurance Billed:'),AT(152,64,76),USE(?BILL:InsuranceBilled:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(232,64,48,10),USE(BILL:InsuranceBilled),RIGHT(2)
                           PROMPT('Insurance Paid:'),AT(152,97,76),USE(?BILL:InsurancePaid:Prompt),RIGHT,TRN
                           PROMPT('Insurance Adj:'),AT(152,80,76),USE(?BILL:InsuranceAdj:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(232,81,48,10),USE(BILL:InsuranceAdj),RIGHT(2)
                           ENTRY(@s8),AT(232,97,48,10),USE(BILL:InsurancePaid),RIGHT(2)
                           PROMPT('Patient Responsibility:'),AT(298,64,76),USE(?BILL:PatientResponsibility:Prompt),RIGHT, |
  TRN
                           ENTRY(@n-10.2),AT(378,64,48,10),USE(BILL:PatientResponsibility),RIGHT(2)
                           CHECK('Write Off'),AT(164,152,66),USE(BILL:WriteOff),COLOR(COLOR:Red),ICON(ICON:None),TRN
                           PROMPT('Patient Adj:'),AT(298,80,74),USE(?BILL:PatientAdj:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(378,81,48,10),USE(BILL:PatientAdj),RIGHT(2)
                           STRING(@n-10.2),AT(372,50,49,11),USE(BILL:PatientFeeAmount),FONT(,11,,FONT:regular),RIGHT, |
  TRN
                           STRING(@n-10.2),AT(372,99,49,11),USE(BILL:Payments),FONT(,11,,FONT:regular),RIGHT,TRN
                           STRING('Payments:'),AT(336,99),USE(?STRING1:2),TRN
                           LIST,AT(0,84,150,100),USE(?List:5),RIGHT(1),FORMAT('18C|M~Qty~@n3@97L(2)|M~Description~' & |
  'L(0)@s32@44L(2)|M~Price~L(1)@N-8.2@'),FROM(Queue:Browse:4),IMM
                           BUTTON('Refresh'),AT(0,69,82),USE(?ButtonRefresh)
                           OPTION('Fee Type'),AT(4,16,456,23),USE(BILL:FeeType),TRN
                             RADIO('Insurance'),AT(86,21,56),USE(?BILL:FeeType:Insurance),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('1')
                             RADIO('Client'),AT(144,21,56),USE(?BILL:FeeType:Client),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('0')
                             RADIO('Patient'),AT(201,21,56),USE(?BILL:FeeType:Patient),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('4')
                             RADIO('Medicare'),AT(257,21,56),USE(?BILL:FeeType:Medicare),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('3')
                             RADIO('Medicaid'),AT(316,21,56),USE(?BILL:FeeType:Medicaid),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('2')
                             RADIO('Evaluation'),AT(374,21,56),USE(?BILL:FeeType:Evaluation),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('6')
                           END
                           OPTION('Network'),AT(84,14,40,23),USE(BILL:Network),HIDE,TRN
                             RADIO('In Network'),AT(87,37,56),USE(?locInsuranceNetwork:InNetwork),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('1')
                             RADIO('Out of Network'),AT(87,50,56),USE(?locInsuranceNetwork:OutNetwork),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('2')
                             RADIO('Unknown'),AT(87,63,56),USE(?locInsuranceNetwork:Unknown),COLOR(COLOR:Red),ICON(ICON:None), |
  TRN,VALUE('0')
                           END
                           STRING(@s16),AT(221,51),USE(locInsuranceType),FONT(,,,FONT:bold),CENTER,TRN
                           ENTRY(@s1),AT(36,17,,9),USE(BILL:AccountType),CENTER
                           STRING(@n_6),AT(6,18,,11),USE(BILL:Client),TRN
                           BUTTON('Recall'),AT(164,166,66),USE(?ButtonRecall),HIDE
                           TEXT,AT(6,29,68,40),USE(locAccountTypes),FONT(,8),BOXED,HIDE
                         END
                         TAB('Payments'),USE(?Tab:Payments)
                           LIST,AT(14,32,332,146),USE(?List),VSCROLL,FORMAT('40L(2)|M~Date~L(0)@d17@E(00000000H,,0' & |
  '0FFFFFFH,00FF0000H)46L(2)|M~Type~L(0)@s16@44L(2)|M~Amount~D(12)@n-10.2@1020L(2)|M~No' & |
  'te~L(0)@s255@'),FROM(Queue:Browse),IMM,TRN
                           BUTTON('&Insert'),AT(366,83,42,12),USE(?Insert)
                           BUTTON('&Change'),AT(366,114,42,12),USE(?Change)
                           BUTTON('&Delete'),AT(366,54,42,12),USE(?Delete)
                           PANEL,AT(12,31,336,150),USE(?PANEL1),BEVEL(1)
                         END
                         TAB('Letters'),USE(?Tab:Letter)
                           PROMPT('Intial Letter:'),AT(218,25,96,7),USE(?BILL:Letter1:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,26,61,11),USE(BILL:Letter1)
                           PROMPT('2nd Notice:'),AT(218,39,96,7),USE(?BILL:Letter2:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,40,61,11),USE(BILL:Letter2)
                           PROMPT('Final Notice/Certified Letter:'),AT(218,50,96,7),USE(?BILL:Letter3:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,51,61,11),USE(BILL:Letter3)
                           PROMPT('Delinquent Notice:'),AT(218,64,96,7),USE(?BILL:Letter4:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,64,61,11),USE(BILL:Letter4)
                           PROMPT('Collection Notice:'),AT(218,78,96,7),USE(?BILL:Letter5:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,79,61,11),USE(BILL:Letter5)
                           BUTTON('Print'),AT(394,25,,12),USE(?BUTTONPrintLetter1)
                           BUTTON('Print'),AT(394,39,32,12),USE(?ButtonPrintLetter2)
                           BUTTON('Print'),AT(394,50,32,12),USE(?ButtonPrintLetter3)
                           BUTTON('Print'),AT(394,64,32,12),USE(?ButtonPrintLetter4)
                           BUTTON('Print'),AT(394,78,32,12),USE(?ButtonPrintLetter5)
                           CHECK('Please sent copy of insurance card'),AT(20,25,187,12),USE(mdlSelectNotes[1]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('1','0')
                           CHECK('Insurance applied to yearly deductible/co-insurance'),AT(20,39,187,12),USE(mdlSelectNotes[2]), |
  FONT(,,,FONT:regular),COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('2','0')
                           CHECK('Fee for service not covered by your insurance'),AT(20,50,187,12),USE(mdlSelectNotes[3]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('4','0')
                           CHECK('Non-network discount applied'),AT(20,64,187,12),USE(mdlSelectNotes[4]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('8','0')
                           CHECK('No coverage on the date of service'),AT(20,78,187,12),USE(mdlSelectNotes[5]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('16','0')
                           CHECK('payment for services sent to member/patient'),AT(20,88,187,12),USE(mdlSelectNotes[6]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('32','0')
                           CHECK('Balance Due amount will be applied to the credit card'),AT(20,103,187,12),USE(mdlSelectNotes[7]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('64','0')
                         END
                         TAB('Tests'),USE(?Tab:Test),HIDE
                           PROMPT('Totals'),AT(170,49),USE(?locCodeTotal:Prompt),TRN
                           STRING(@n3),AT(234,88),USE(locRast[1]),RIGHT,TRN
                           PROMPT('Standard'),AT(172,88),USE(?locRast:Prompt),TRN
                           PROMPT('Hymenoptera'),AT(172,98),USE(?locHymenoptera:Prompt),TRN
                           STRING(@n3),AT(234,98),USE(locHymenoptera[1]),RIGHT,TRN
                           PROMPT('Mix'),AT(172,110),USE(?locMix:Prompt),TRN
                           STRING(@n3),AT(234,110),USE(locMix[1]),RIGHT,TRN
                           PROMPT('Occupational'),AT(172,119),USE(?locOccupational:Prompt),TRN
                           STRING(@n3),AT(234,119),USE(locOccupational[1]),RIGHT,TRN
                           PROMPT('Chemical'),AT(172,128),USE(?locChemical:Prompt),TRN
                           STRING(@n3),AT(234,128),USE(locChemical[1]),RIGHT,TRN
                           STRING(@n3),AT(298,88),USE(locRast[2]),RIGHT,TRN
                           STRING(@n3),AT(298,98),USE(locHymenoptera[2]),RIGHT,TRN
                           STRING(@n3),AT(298,110),USE(locMix[2]),RIGHT,TRN
                           STRING(@n3),AT(298,119),USE(locOccupational[2]),RIGHT,TRN
                           STRING(@n3),AT(298,128),USE(locChemical[2]),RIGHT,TRN
                           STRING(@n3),AT(358,88),USE(locRast[3]),RIGHT,TRN
                           STRING(@n3),AT(358,98),USE(locHymenoptera[3]),RIGHT,TRN
                           STRING(@n3),AT(358,110),USE(locMix[3]),RIGHT,TRN
                           STRING(@n3),AT(358,119),USE(locOccupational[3]),RIGHT,TRN
                           STRING(@n3),AT(358,128),USE(locChemical[3],,?locChemical_3:2),RIGHT,TRN
                           STRING(@n$6.2),AT(216,49),USE(FEE:TIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(270,49),USE(FEE:TIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(328,49),USE(FEE:TIgA),RIGHT,TRN
                           STRING(@n$6.2),AT(380,49),USE(FEE:TIgM),RIGHT,TRN
                           STRING(@N$6.2),AT(252,88),USE(FEE:IgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,88),USE(FEE:IgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,88),USE(FEE:IgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,98),USE(FEE:mxIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,98),USE(FEE:mxIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,98),USE(FEE:mxIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,110),USE(FEE:hyIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,110),USE(FEE:hyIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,110),USE(FEE:hyIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,119),USE(FEE:occIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,119),USE(FEE:occIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,119),USE(FEE:occIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,128),USE(FEE:chemIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,128),USE(FEE:chemIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,128),USE(FEE:chemIgG4),RIGHT,TRN
                           STRING(@n3),AT(200,49),USE(locTIgE),RIGHT,TRN
                           STRING(@n3),AT(256,49),USE(locTIgG),RIGHT,TRN
                           STRING(@n3),AT(310,49),USE(locTIgA),RIGHT,TRN
                           STRING(@n3),AT(364,49),USE(locTIgM),RIGHT,TRN
                           STRING(@n-10.2),AT(368,177),USE(locFees),FONT(,12,,FONT:bold),RIGHT,TRN
                           STRING('TIgE'),AT(214,40,31),USE(?STRING8),CENTER,TRN
                           STRING('TIgG'),AT(268,40,31),USE(?STRING9),CENTER,TRN
                           STRING('TIgA'),AT(324,40,31),USE(?STRING10),CENTER,TRN
                           STRING('TIgM'),AT(374,40,31),USE(?STRING11),CENTER,TRN
                           STRING('IgE'),AT(244,74,24),USE(?STRING12),CENTER,TRN
                           STRING('IgG'),AT(306,74,24),USE(?STRING13),CENTER,TRN
                           STRING('IgG4'),AT(368,73,24),USE(?STRING14),CENTER,TRN
                           STRING('Panel 260'),AT(172,152,32),USE(?STRING15),TRN
                           STRING('Panel 270'),AT(172,177,32),USE(?STRING16),TRN
                           STRING(@n$6.2),AT(252,152),USE(FEE:Panel260),RIGHT,TRN
                           STRING(@n$6..2),AT(252,177),USE(FEE:Panel270),RIGHT,TRN
                           STRING('S145'),AT(172,161,32),USE(?STRING19),TRN
                           STRING(@n$6.2),AT(252,161),USE(FEE:Panel260S145),RIGHT,TRN
                           STRING(@n3),AT(234,152),USE(locPanel260),RIGHT,TRN
                           STRING(@n3),AT(234,161),USE(locPanel260s145),RIGHT,TRN
                           STRING(@n3),AT(234,177),USE(locPanel270),RIGHT,TRN
                           STRING('Component'),AT(172,137),USE(?STRING18),TRN
                           STRING(@n3),AT(234,137,19,10),USE(locComponent[1]),RIGHT,TRN
                           STRING(@n3),AT(298,137),USE(locComponent[2]),RIGHT,TRN
                           STRING(@n$6.2),AT(252,137),USE(FEE:ComponentIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(376,137),USE(FEE:ComponentIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(316,137),USE(FEE:ComponentIgG),RIGHT,TRN
                           STRING(@n3),AT(358,137),USE(locComponent[3]),RIGHT,TRN
                           BUTTON('Apply'),AT(418,176,44,11),USE(?ButtonApply2InsuranceBilled)
                           STRING(@n_6),AT(416,159,43),USE(FEE:Client),RIGHT,TRN
                           STRING(@n3),AT(442,147),USE(BILL:FeeType,,?BILL:FeeType:2),FONT(,,,FONT:regular),TRN
                           STRING(@n7.2),AT(316,178),USE(locItemTotal),TRN
                         END
                       END
                       BUTTON('&OK'),AT(420,290,70,25),USE(?BUTTON3),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WAOK.ICO'), |
  DEFAULT,FLAT,MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(320,290,70,25),USE(?BUTTON4),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       BUTTON('&Help'),AT(6,311,49,14),USE(?BUTTON5),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WAHELP.ICO'), |
  FLAT,HIDE,MSG('See Help Window'),STD(STD:Help),TIP('See Help Window')
                       STRING(@n-10.2),AT(362,256,59),USE(BILL:OutStanding),FONT(,14,,FONT:bold,CHARSET:DEFAULT), |
  RIGHT,TRN
                       STRING(@n-10.2),AT(359,228,62),USE(BILL:Payments,,?BILL:Payments:2),FONT(,14,,FONT:bold,CHARSET:DEFAULT), |
  RIGHT,TRN
                       STRING('Balance Due'),AT(303,256,57),USE(?STRING3:2),RIGHT,TRN
                       STRING('Payments'),AT(303,228,57),USE(?STRING2:2),RIGHT,TRN
                       STRING('Last Letter'),AT(35,242,50),USE(?STRING4),RIGHT,TRN
                       STRING(@d17B),AT(87,242,74),USE(BILL:LastLetter),FONT(,12,,FONT:bold,CHARSET:DEFAULT),LEFT, |
  TRN
                       STRING(@n-10.2),AT(358,216,63,12),USE(locAmountDue),FONT(,14,,FONT:bold,CHARSET:DEFAULT),RIGHT, |
  TRN
                       STRING('Invoice Total'),AT(303,216,57),USE(?STRING5),RIGHT,TRN
                       STRING(@s64),AT(87,202,407),USE(locName),FONT(,12,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING('Patient'),AT(35,202,50),USE(?STRING6),RIGHT,TRN
                       STRING(@s32),AT(87,228,183),USE(locClientName,,?locClientName:2),FONT(,12,,FONT:bold,CHARSET:DEFAULT), |
  TRN
                       STRING('Client:'),AT(35,228,50),USE(?STRING17),RIGHT,TRN
                       STRING(@d17b),AT(188,242,74),USE(BILL:NextLetter),FONT(,12,,FONT:bold,CHARSET:DEFAULT),LEFT, |
  TRN
                       STRING('Next:'),AT(165,242),USE(?StringNextLetter),TRN
                       STRING('Date of Service'),AT(34,216),USE(?STRING20),TRN
                       STRING(@d17b),AT(87,216),USE(BILL:DateFax2),TRN
                       BUTTON('Export'),AT(143,277),USE(?ButtonExport)
                       STRING('Fee Type'),AT(54,256),USE(?STRING22),TRN
                       STRING(@s16),AT(87,256),USE(locFeeTypeString),FONT(,,,FONT:bold),TRN
                       STRING(@s8),AT(371,242),USE(BILL:InsurancePaid,,?BILL:InsurancePaid:2),FONT(,14,,FONT:bold, |
  CHARSET:DEFAULT),RIGHT,TRN
                       STRING('Insurance Paid'),AT(311,242),USE(?STRING23),RIGHT,TRN
                     END

BRW8::LastSortOrder       BYTE
BRW15::LastSortOrder       BYTE
BRW12::LastSortOrder       BYTE
BRW8::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW15::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW12::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW15                CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW12                CLASS(BrowseClass)                    ! Browse using ?List:5
Q                      &Queue:Browse:4                !Reference to browse queue
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:3              !Reference to display queue
                     END

SAV:Namelist  LIKE(NAM:Record)
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
GetFees   ROUTINE
  FEE:Client = BILL:FeeType
  
  CASE locFeeType
  OF 1
    locFeeTypeString = 'In Network'
  OF 2
    locFeeTypeString = 'Out of Network'
  OF 3
    locFeeTypeString = 'Medicare'
  OF 4
    locFeeTypeString = 'Medicaid'
  OF 5
    locFeeTypeString = 'Client'
    FEE:Client = BILL:Client
  OF 6
    locFeeTypeString = 'Patient'
  OF 7
    locFeeTypeString = 'N/C Eval'
  .
  DISPLAY(?locFeeTypeString)
  GET(Fees,FEE:OrderKey)
 
  locTIgE = 0
  locTIgG = 0
  locTIgA = 0
  locTIgM = 0
  CLEAR(locRast)
  CLEAR(locMix)
  CLEAR(locHymenoptera)
  CLEAR(locOccupational)
  CLEAR(locChemical)
  CLEAR(locPanel260s145)
  CLEAR(locPanel260)
  CLEAR(locPanel270)
  CLEAR(locComponent)
  CLEAR(TST:Record)
  TST:INVOICE = BILL:Accession
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF ERRORCODE() OR TST:INVOICE <> BILL:Accession THEN BREAK.
    
    IF gloTestCodeStartsWith2 = 'S1'
      IF TST:CODE = 'S145'
        locPanel260s145 += 1
      ELSE
        locPanel260 += 1
      .
    ELSIF gloTestCodeStartsWith2 = 'S2'
      locPanel270 += 1
    ELSIF gloTestCodeStartsWith1 = 'S'
      locChemical[TST:TYPE] +=1
    ELSE
      CASE TST:Code
      OF '100'
        locTIgE = 1
      OF 'AAA'
        locTIgA = 1
      OF 'GGG'
        locTIgG = 1
      OF 'MMM'
        locTIgM = 1
      OF 'F359'
      OROF 'F360'
        locComponent[TST:TYPE] += 1
      OF 'EZ04'
      OROF 'EZ06'
      OROF 'EZ07'
      OROF 'EZ12'
      OROF 'FZ03'
      OROF 'FZ11'
      OROF 'FZ13'
      OROF 'GZ08'
      OROF 'HZ05'
      OROF 'MZ02'
      OROF 'MZ15'
      OROF 'TZ01'
      OROF 'TZ09'
      OROF 'TZ13'
      OROF 'WZ10'
        locMix[TST:TYPE] += 1
      OF 'I001'
      OROF 'I002'
      OROF 'I003'
      OROF 'I004'
      OROF 'I005'
        locHymenoptera[TST:TYPE] += 1
      OF 'K001'
      OROF 'K002'
      OROF 'K082'
        locOccupational[TST:TYPE] += 1
      ELSE
        locRast[TST:TYPE] += 1
  .  . .
  
    locFees = locTIgE * FEE:tIgE + locTIgG * FEE:tIgG + locTIgA * FEE:tIgA + locTIgM * FEE:tIgM + |
    locRast[1] * FEE:IgE + locRast[2] * FEE:IgG + locRast[3] * FEE:IgG4 + | 
    locMix[1] * FEE:mxIgE + locMix[2] * FEE:mxIgG + locMix[3] * FEE:mxIgG4 + |
    locHymenoptera[1] * FEE:hyIgE + locHymenoptera[2] * FEE:hyIgE + locHymenoptera[3] * FEE:hyIgE + |
    locOccupational[1] * FEE:occIgE + locOccupational[2] * FEE:occIgG + locOccupational[3] * FEE:occIgG4 + |
    locChemical[1] * FEE:chemIgE + locChemical[2] * FEE:chemIgG + locChemical[3] * FEE:chemIgG4 + |
    FEE:Panel260 * locPanel260 +  FEE:Panel260S145 * locPanel260s145 + FEE:Panel270 * locPanel270

      

      
    DISPLAY()     

Letters ROUTINE
  BILL:LetterNotes = mdlSelectNotes[1] + mdlSelectNotes[2] + mdlSelectNotes[3] + mdlSelectNotes[4] + mdlSelectNotes[5] + mdlSelectNotes[6] + mdlSelectNotes[7] 
  PUT(Billing)
  IF ERRORCODE() THEN STOP('BILL PUT: ' & ERROR()).
Totals  ROUTINE
  IF locWindowInitialized = 0 THEN EXIT.
  BILL:Payments = 0
  locLastPayment = 0
  locLastLetter = 0
  Pay:Invoice = BILL:Accession
  Pay:Date = 0
  SET(Pay:OrderKey,Pay:OrderKey)
  LOOP
    NEXT(Payments)
    IF Pay:Invoice <> BILL:Accession OR ERRORCODE() THEN BREAK.
    IF Pay:Type = 'Insurance' THEN CYCLE.
    BILL:Payments += Pay:Amount
    IF Pay:Date > locLastPayment THEN locLastPayment = Pay:Date.
  .

  locAmountDue = 0
  BI:Patient = BILL:Accession
  SET(BillingItems,BI:OrderKey)
  LOOP
    NEXT(BillingItems)
    IF ERRORCODE() OR BI:Patient <> BILL:Accession THEN BREAK.
    locAmountDue += BI:Qty * BI:Price
  .
  IF locAmountDue < .01 THEN locAmountDue = 0.
  
  IF BILL:Letter5 > 0
    BILL:LastLetter = BILL:Letter5
    locLetters = 5
  ELSIF BILL:Letter4 > 0
    BILL:LastLetter = BILL:Letter4
    locLetters = 4
  ELSIF BILL:Letter3 > 0
    BILL:LastLetter = BILL:Letter3
    locLetters = 3
  ELSIF BILL:Letter2 > 0
    BILL:LastLetter = BILL:Letter2
    locLetters = 2
  ELSIF BILL:Letter1 > 0
    BILL:LastLetter = BILL:Letter1
    locLetters = 1
  ELSE
    locLetters = 0
    BILL:LastLetter = 0
    BILL:NextLetter = 0
  .
  IF locLetters > 0  
    BILL:NextLetter = BILL:LastLetter + gloBillingLetterDays
  .
      UNHIDE(?BILL:PatientResponsibility:Prompt)
      UNHIDE(?BILL:PatientResponsibility)
      UNHIDE(?BILL:PatientAdj:Prompt)
      UNHIDE(?BILL:PatientAdj)
      UNHIDE(?BILL:Payments)
  !!    UNHIDE(?STRING1)
  
  UNHIDE(?BILL:InsuranceBilled)
  UNHIDE(?BILL:InsuranceAdj)
  UNHIDE(?BILL:InsurancePaid)
    
  Labels[1] = 'Insurance Billed:' 
  Labels[2] = 'Insurance Adj:' 
  Labels[3] = 'Insurance Paid:' 
  Labels[4] = 'Patient Responsibility:' 
  Labels[5] = 'Patient Adjust:' 
  Labels[6] = 'Payments:' 
  Labels[7] = '' 
  ?BILL:PatientResponsibility:Prompt{PROP:Text} = Labels[4];
  ?BILL:PatientAdj:Prompt{PROP:Text} = Labels[5];
  ENABLE(?BILL:InsuranceAdj) 
  ENABLE(?BILL:InsurancePaid)
  ENABLE(?BILL:PatientResponsibility) 
  HIDE(?BILL:Network)
  CASE BILL:FeeType 
  OF 6
    BILL:PatientResponsibility = 0
    BILL:InsuranceBilled = 0
    BILL:InsurancePaid = ''
    BILL:InsuranceAdj = 0
    locAmountDue = 0
    
  OF 0 ! Client
    locAmountDue = bill:PatientFeeAmount
    IF ~BILL:PatientResponsibility THEN BILL:PatientResponsibility = BILL:PatientFeeAmount.
    ?BILL:InsuranceBilled:Prompt{PROP:Text} = '';
    ?BILL:InsuranceAdj:Prompt{PROP:Text} = '';
    ?BILL:InsurancePaid:Prompt{PROP:Text} = '';
    HIDE(?BILL:InsuranceBilled)
    HIDE(?BILL:InsuranceAdj)
    HIDE(?BILL:InsurancePaid)
    ?BILL:PatientAdj:Prompt{PROP:Text} = 'Client Adjust:'
    ?BILL:PatientResponsibility:Prompt{PROP:Text} = 'Client Billed:'
    BILL:OutStanding =  BILL:PatientResponsibility - BILL:Payments  - BILL:PatientAdj 

  OF 4 ! patient
    IF BILL:AccountType = 4  ! no insurance
      BILL:PatientResponsibility = BILL:PatientFeeAmount
      BILL:OutStanding =  BILL:PatientResponsibility - BILL:Payments - BILL:PatientAdj
      ?BILL:InsuranceBilled:Prompt{PROP:Text} = '';
      ?BILL:InsuranceAdj:Prompt{PROP:Text} = '';
      ?BILL:InsurancePaid:Prompt{PROP:Text} = '';
      HIDE(?BILL:InsuranceBilled)
      HIDE(?BILL:InsuranceAdj)
      HIDE(?BILL:InsurancePaid)
    ELSIF BILL:Network = 2  ! Insurance Out of network => Patient Responsibility
      ?BILL:InsuranceBilled:Prompt{PROP:Text} = Labels[1];
      ?BILL:InsuranceAdj:Prompt{PROP:Text} = Labels[2];
      ?BILL:InsurancePaid:Prompt{PROP:Text} = Labels[3];
      IF ~BILL:PatientResponsibility THEN BILL:PatientResponsibility = BILL:PatientFeeAmount - BILL:InsurancePaid.
    .
    locAmountDue = BILL:PatientResponsibility
    BILL:OutStanding =  BILL:PatientResponsibility - BILL:Payments  - BILL:PatientAdj
  ELSE  ! Insurance
    IF BILL:InsurancePaid < .01 THEN BILL:InsurancePaid = ''.
    BILL:PatientResponsibility = 0
    BILL:PatientAdj = 0
    UNHIDE(?BILL:Network)
    BILL:InsuranceBilled = locAmountDue
    ?BILL:InsuranceBilled:Prompt{PROP:Text} = Labels[1];
    ?BILL:InsuranceAdj:Prompt{PROP:Text} = Labels[2];
    ?BILL:InsurancePaid:Prompt{PROP:Text} = Labels[3];
    BILL:OutStanding = BILL:InsuranceBilled - BILL:InsurancePaid
    IF BILL:FeeType = 2 OR  BILL:FeeType = 3
      BILL:InsuranceAdj = BILL:InsuranceBilled - BILL:InsurancePaid
      IF BILL:InsuranceAdj < 0 THEN BILL:InsuranceAdj = 0.
      HIDE(?BILL:PatientResponsibility:Prompt)
      HIDE(?BILL:PatientResponsibility)
      HIDE(?BILL:PatientAdj:Prompt)
      BILL:PatientAdj = 0
      BILL:InsuranceAdj = 0
      BILL:PatientResponsibility = 0
      BILL:Network = 0
      DISABLE(?BILL:InsuranceAdj)
      HIDE(?BILL:Network)
      HIDE(?BILL:PatientAdj)
      HIDE(?BILL:Payments)
  !!    HIDE(?STRING1)
    ELSIF BILL:Network = 0  ! unknown insurance type
     BILL:InsurancePaid = 0
     BILL:InsuranceAdj = 0 
     DISABLE(?BILL:InsurancePaid) 
     DISABLE(?BILL:PatientResponsibility) 
    ELSIF BILL:Network = 2  ! out of network
      IF LEN(CLIP(BILL:InsurancePaid)) > 1 AND ~BILL:InsuranceAdj
        BILL:InsuranceAdj = BILL:InsuranceBilled - BILL:PatientFeeAmount 
      .
      BILL:OutStanding = locAmountDue - BILL:InsurancePaid        
   .
  .
  IF BILL:OutStanding < 0 THEN BILL:OutStanding = 0.
  IF BILL:PatientResponsibility < 0 
    BILL:OutStanding = 0
    BILL:PatientResponsibility = 0
  .
  
  locInsuranceType = ''
  IF BILL:FeeType = 4 
    IF BILL:AccountType = 4 THEN locInsuranceType = 'No Insurance'
    ELSIF BILL:Network = 1  THEN locInsuranceType = 'In Network'
    ELSIF BILL:Network = 2 THEN locInsuranceType = 'Out of Network'
    .
  .
  DO Letters
  DISPLAY()

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                               ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage  ! Display status message in status bar
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  locVerifiedBy = BILL:VerifiedBy
  PUT(Patient)
  ReturnValue = PARENT.ChangeAction()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateBilling1')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:IGE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(BILL:Record,History::BILL:Record)
  SELF.AddHistoryField(?BILL:VerifiedBy,90)
  SELF.AddHistoryField(?BILL:VerifiedBy2,91)
  SELF.AddHistoryField(?BILL:InsuranceQB,7)
  SELF.AddHistoryField(?BILL:DateFax1,13)
  SELF.AddHistoryField(?BILL:Description,15)
  SELF.AddHistoryField(?BILL:Comment:2,92)
  SELF.AddHistoryField(?BILL:PatientQB,8)
  SELF.AddHistoryField(?BILL:LastNamePatient,16)
  SELF.AddHistoryField(?BILL:FirstNamePatient:2,17)
  SELF.AddHistoryField(?BILL:ClientRequestCheckmarks,29)
  SELF.AddHistoryField(?BILL:AddressPatient,19)
  SELF.AddHistoryField(?BILL:PostalPatient,24)
  SELF.AddHistoryField(?BILL:CityPatient,22)
  SELF.AddHistoryField(?BILL:StatePatient,23)
  SELF.AddHistoryField(?BILL:emailPatient:2,25)
  SELF.AddHistoryField(?BILL:PhonePatient,26)
  SELF.AddHistoryField(?BILL:PhoneAltPatient,27)
  SELF.AddHistoryField(?BILL:RelationshipToInsured,30)
  SELF.AddHistoryField(?BILL:FirstNameInsured,37)
  SELF.AddHistoryField(?BILL:GenderInsured,46)
  SELF.AddHistoryField(?BILL:AddressInsured,38)
  SELF.AddHistoryField(?BILL:PostalInsured,41)
  SELF.AddHistoryField(?BILL:CityInsured,39)
  SELF.AddHistoryField(?BILL:StateInsured,40)
  SELF.AddHistoryField(?BILL:emailPatient,25)
  SELF.AddHistoryField(?BILL:PhoneInsured,44)
  SELF.AddHistoryField(?BILL:PhoneAltInsured,43)
  SELF.AddHistoryField(?BILL:IdInsured,32)
  SELF.AddHistoryField(?BILL:DoBInsured,45)
  SELF.AddHistoryField(?BILL:Assignment:2,88)
  SELF.AddHistoryField(?BILL:PlanName,33)
  SELF.AddHistoryField(?BILL:AnotherPlan,35)
  SELF.AddHistoryField(?BILL:PolicyGroupInsured,34)
  SELF.AddHistoryField(?BILL:InsuranceBilled,61)
  SELF.AddHistoryField(?BILL:InsuranceAdj,63)
  SELF.AddHistoryField(?BILL:InsurancePaid,62)
  SELF.AddHistoryField(?BILL:PatientResponsibility,67)
  SELF.AddHistoryField(?BILL:WriteOff,71)
  SELF.AddHistoryField(?BILL:PatientAdj,65)
  SELF.AddHistoryField(?BILL:PatientFeeAmount,64)
  SELF.AddHistoryField(?BILL:Payments,68)
  SELF.AddHistoryField(?BILL:FeeType,59)
  SELF.AddHistoryField(?BILL:Network,60)
  SELF.AddHistoryField(?BILL:AccountType,4)
  SELF.AddHistoryField(?BILL:Client,10)
  SELF.AddHistoryField(?BILL:Letter1,51)
  SELF.AddHistoryField(?BILL:Letter2,52)
  SELF.AddHistoryField(?BILL:Letter3,53)
  SELF.AddHistoryField(?BILL:Letter4,54)
  SELF.AddHistoryField(?BILL:Letter5,55)
  SELF.AddHistoryField(?BILL:FeeType:2,59)
  SELF.AddHistoryField(?BILL:OutStanding,69)
  SELF.AddHistoryField(?BILL:Payments:2,68)
  SELF.AddHistoryField(?BILL:LastLetter,57)
  SELF.AddHistoryField(?BILL:NextLetter,56)
  SELF.AddHistoryField(?BILL:DateFax2,14)
  SELF.AddHistoryField(?BILL:InsurancePaid:2,62)
  SELF.AddUpdateFile(Access:Billing)
  SELF.AddItem(?BUTTON4,RequestCancelled)         ! Add the cancel control to the window manager
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:BillingItems.Open                        ! File BillingItems used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Fees.Open                                ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:Insurance.Open                           ! File Insurance used by this procedure, so make sure it's RelationManager is open
  Relate:Payments.Open                            ! File Payments used by this procedure, so make sure it's RelationManager is open
  Relate:Physicians.Open                          ! File Physicians used by this procedure, so make sure it's RelationManager is open
  Relate:Providers.Open                           ! File Providers used by this procedure, so make sure it's RelationManager is open
  Relate:Setup.Open                               ! File Setup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Billing
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None               ! Inserts not allowed
    SELF.DeleteAction = Delete:None               ! Deletes not allowed
    SELF.ChangeAction = Change:Caller             ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query ! Confirm cancel
    SELF.OkControl = ?BUTTON3
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:Payments,SELF) ! Initialize the browse manager
  BRW15.Init(?List:3,Queue:Browse:2.ViewPosition,BRW15::View:Browse,Queue:Browse:2,Relate:Insurance,SELF) ! Initialize the browse manager
  BRW12.Init(?List:5,Queue:Browse:4.ViewPosition,BRW12::View:Browse,Queue:Browse:4,Relate:BillingItems,SELF) ! Initialize the browse manager
  locFeeValues[1] = 1
  locFeeValues[2] = 2
  locFeeValues[3] = 3
  locFeeValues[4] = 4
  locFeeValues[5] = BILL:Client
  locFeeValues[6] = 6
  locFeeValues[7] = 7
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW8.Q &= Queue:Browse
  BRW8.AddSortOrder(,Pay:OrderKey)                ! Add the sort order for Pay:OrderKey for sort order 1
  BRW8.AddRange(Pay:Invoice,BILL:Accession)       ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,Pay:Date,1,BRW8)      ! Initialize the browse locator using  using key: Pay:OrderKey , Pay:Date
  BRW8.AddField(Pay:Date,BRW8.Q.Pay:Date)         ! Field Pay:Date is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Type,BRW8.Q.Pay:Type)         ! Field Pay:Type is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Amount,BRW8.Q.Pay:Amount)     ! Field Pay:Amount is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Note,BRW8.Q.Pay:Note)         ! Field Pay:Note is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Invoice,BRW8.Q.Pay:Invoice)   ! Field Pay:Invoice is a hot field or requires assignment from browse
  BRW15.Q &= Queue:Browse:2
  BRW15.AddSortOrder(,)                           ! Add the sort order for  for sort order 1
  BRW15.AddField(Ins:From,BRW15.Q.Ins:From)       ! Field Ins:From is a hot field or requires assignment from browse
  BRW15.AddField(Ins:Too,BRW15.Q.Ins:Too)         ! Field Ins:Too is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:4
  BRW12.AddSortOrder(,BI:OrderKey)                ! Add the sort order for BI:OrderKey for sort order 1
  BRW12.AddRange(BI:Patient,BILL:Accession)       ! Add single value range limit for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)          ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,BI:Patient,1,BRW12)  ! Initialize the browse locator using  using key: BI:OrderKey , BI:Patient
  BRW12.AddField(BI:Qty,BRW12.Q.BI:Qty)           ! Field BI:Qty is a hot field or requires assignment from browse
  BRW12.AddField(BI:Description,BRW12.Q.BI:Description) ! Field BI:Description is a hot field or requires assignment from browse
  BRW12.AddField(BI:Price,BRW12.Q.BI:Price)       ! Field BI:Price is a hot field or requires assignment from browse
  BRW12.AddField(BI:Patient,BRW12.Q.BI:Patient)   ! Field BI:Patient is a hot field or requires assignment from browse
  ToolBarForm.HelpButton=?BUTTON5
  SELF.AddItem(ToolbarForm)
  BRW8.AskProcedure = 1
  FDB14.Init(?Pro:Description,Queue:FileDrop:3.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop:3,Relate:Providers,ThisWindow)
  FDB14.Q &= Queue:FileDrop:3
  FDB14.AddSortOrder()
  FDB14.AddField(Pro:Description,FDB14.Q.Pro:Description) !List box control field - type derived from field
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  BRW8.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW8.ToolbarItem.HelpButton = ?BUTTON5
  BRW15.AddToolbarTarget(Toolbar)                 ! Browse accepts toolbar control
  BRW15.ToolbarItem.HelpButton = ?BUTTON5
  BRW12.AddToolbarTarget(Toolbar)                 ! Browse accepts toolbar control
  BRW12.ToolbarItem.HelpButton = ?BUTTON5
  BRW8::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW8::FormatManager.Init('Alis8','UpdateBilling1',1,?List,8,BRW8::PopupTextExt,Queue:Browse,4,LFM_CFile,LFM_CFile.Record)
  BRW8::FormatManager.BindInterface(,,,'ALIS.INI')
  BRW15::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW15::FormatManager.Init('Alis8','UpdateBilling1',1,?List:3,15,BRW15::PopupTextExt,Queue:Browse:2,2,LFM_CFile,LFM_CFile.Record)
  BRW15::FormatManager.BindInterface(,,,'ALIS.INI')
  BRW12::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW12::FormatManager.Init('Alis8','UpdateBilling1',1,?List:5,12,BRW12::PopupTextExt,Queue:Browse:4,3,LFM_CFile,LFM_CFile.Record)
  BRW12::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locWindowInitialized = 0
  Pat:INVOICE = BILL:Accession
  GET(Patient,Pat:INVOICE_KEY)
  
  
  IF Pat:SEX = 'M'
    locGender = 'Male'
  ELSE
    locGender = 'Female'  
  . 
  locName = Pat:Invoice & '   ' & CLIP(Pat:LAST) & ', ' & CLIP(Pat:FIRST) & '  ' & CLIP(locGender) & '  ' & CLIP(locAge)
  NAM:Number = BILL:Accession
  GET(NameList,NAM:OrderKey)
  IF ERRORCODE() 
    CLEAR(NAM:Record)
    NAM:Number = Pat:INVOICE
    ADD(NameList)
  .
  CLI:Number = PAT:Client
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE() 
    locClientName = 'CLIENT: ' & ERROR()
  ELSE
    IF CLI:FIRST
      locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      locClientName = CLI:LAST
    .
  .
  
  mdlSelectNotes[1] = BAND(BILL:LetterNotes,1)
  mdlSelectNotes[2] = BAND(BILL:LetterNotes,2)
  mdlSelectNotes[3] = BAND(BILL:LetterNotes,4)
  mdlSelectNotes[4] = BAND(BILL:LetterNotes,8)
  mdlSelectNotes[5] = BAND(BILL:LetterNotes,16)
  mdlSelectNotes[6] = BAND(BILL:LetterNotes,32)
  mdlSelectNotes[7] = BAND(BILL:LetterNotes,64)
  DO Totals
  BRW8::AutoSizeColumn.Init()
  BRW8::AutoSizeColumn.AddListBox(?List,Queue:Browse)
  BRW15::AutoSizeColumn.Init()
  BRW15::AutoSizeColumn.AddListBox(?List:3,Queue:Browse:2)
  BRW12::AutoSizeColumn.Init()
  BRW12::AutoSizeColumn.AddListBox(?List:5,Queue:Browse:4)
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
    Relate:Client.Close
    Relate:Fees.Close
    Relate:Insurance.Close
    Relate:Payments.Close
    Relate:Physicians.Close
    Relate:Providers.Close
    Relate:Setup.Close
  END
  ! List Format Manager destructor
  BRW8::FormatManager.Kill() 
  ! List Format Manager destructor
  BRW15::FormatManager.Kill() 
  ! List Format Manager destructor
  BRW12::FormatManager.Kill() 
  BRW8::AutoSizeColumn.Kill()
  BRW15::AutoSizeColumn.Kill()
  BRW12::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Pat:INVOICE = BILL:Accession                             ! Assign linking field value
  Access:Patient.Fetch(Pat:INVOICE_KEY)
  BI:Patient = BILL:Accession                              ! Assign linking field value
  Access:BillingItems.Fetch(BI:OrderKey)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePayment
    ReturnValue = GlobalResponse
  END
  DO Totals
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
    OF ?ButtonRefresh
      BILL:PatientResponsibility = 0
      BILL:InsuranceBilled = 0
      DISPLAY()
    OF ?BUTTONPrintLetter1
      BILL:Letter1 = TODAY()  
      DISPLAY(?BILL:Letter1)
      PUT(Billing)
    OF ?ButtonPrintLetter2
      BILL:Letter2 = TODAY()  
      DISPLAY(?BILL:Letter2)
      PUT(Billing)
    OF ?ButtonPrintLetter3
      BILL:Letter3 = TODAY()  
      DISPLAY(?BILL:Letter3)
      PUT(Billing)
    OF ?ButtonPrintLetter4
      BILL:Letter4 = TODAY()  
      DISPLAY(?BILL:Letter4)
      PUT(Billing)
    OF ?ButtonPrintLetter5
      BILL:Letter5 = TODAY()  
      DISPLAY(?BILL:Letter5)
      PUT(Billing)
    OF ?mdlSelectNotes_7
      DO Letters
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BILL:InsuranceBilled
      DO Totals
    OF ?BILL:InsuranceAdj
      DO Totals
    OF ?BILL:InsurancePaid
      UPDATE(?BILL:InsurancePaid)
      IF LEN(CLIP(BILL:InsurancePaid)) > 1 
        PAID$ = BILL:InsurancePaid
        BILL:InsurancePaid = FORMAT(PAID$,@N8.2)
        DISPLAY(?BILL:InsurancePaid)  
        IF BILL:FeeType = 1 
          BILL:FeeType = 4
          DISPLAY(?BILL:FeeType)
          IF BILL:Network = 2
            BILL:InsuranceAdj = BILL:InsuranceBilled - BILL:InsurancePaid
            BILL:PatientResponsibility = BILL:PatientFeeAmount - BILL:InsurancePaid
            IF BILL:PatientResponsibility < 0 THEN BILL:PatientResponsibility = 0.
            PUT(Billing)
            DISPLAY()
            AddBillingItems()
            BILL:InsurancePaid = FORMAT(PAID$,@N8.2)
            BRW12.ResetFromFile
          .
        .
      ELSE
        BILL:InsurancePaid = ''
      .
      DO Totals
    OF ?BILL:PatientResponsibility
      IF locWindowInitialized = 1
        BILL:FeeType = 4
        DO Totals
      .
    OF ?BILL:PatientAdj
      DO Totals
    OF ?ButtonRefresh
      ThisWindow.Update
      AddBillingItems()
      ThisWindow.Reset
      BRW12.ResetFromFile 
      DO Totals
    OF ?BILL:FeeType
      IF BILL:FeeType = 1
        UNHIDE(?BILL:Network)
      ELSE
        HIDE(?BILL:Network)
      .
      DO Totals
    OF ?BILL:Network
      UPDATE(?)
      DO Totals
      DO Totals
    OF ?BUTTONPrintLetter1
      ThisWindow.Update
      GlobalRequest = ChangeRecord
      Letters(1)
      ThisWindow.Reset
    OF ?ButtonPrintLetter2
      ThisWindow.Update
      Letters(2)
      ThisWindow.Reset
    OF ?ButtonPrintLetter3
      ThisWindow.Update
      Letters(3)
      ThisWindow.Reset
    OF ?ButtonPrintLetter4
      ThisWindow.Update
      Letters(4)
      ThisWindow.Reset
    OF ?ButtonPrintLetter5
      ThisWindow.Update
      Letters(5)
      ThisWindow.Reset
    OF ?mdlSelectNotes_1
      DO Letters 
    OF ?mdlSelectNotes_2
      DO Letters 
    OF ?mdlSelectNotes_3
      DO Letters 
    OF ?mdlSelectNotes_4
      DO Letters 
    OF ?mdlSelectNotes_5
      DO Letters 
    OF ?mdlSelectNotes_6
      DO Letters 
    OF ?mdlSelectNotes_7
      DO Letters 
    OF ?ButtonApply2InsuranceBilled
      ThisWindow.Update
      DO Totals
    OF ?BUTTON3
      ThisWindow.Update
      locWindowInitialized = 0
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ButtonExport
      ThisWindow.Update
      ExportInsurance()
      ThisWindow.Reset
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
  IF BRW8::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW15::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW12::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
      
    END
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
    OF ?BILL:FeeType:Insurance
       BILL:FeeType = 1
    OF ?BILL:FeeType:Client
      BILL:FeeType = 0
    OF ?BILL:FeeType:Patient
      BILL:FeeType = 4
    OF ?BILL:FeeType:Medicare
      BILL:FeeType = 3
    OF ?BILL:FeeType:Medicaid
      BILL:FeeType = 2
    OF ?BILL:FeeType:Evaluation
      BILL:FeeType = 6
    OF ?BILL:AccountType
      UNHIDE(?locAccountTypes)
    END
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
      locWindowInitialized = 1
      DO Totals
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW8.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Ask(Request)
  DO Totals
  RETURN ReturnValue


BRW8.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW8.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW8::LastSortOrder <> NewOrder THEN
     BRW8::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW8::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW8.TakeNewSelection PROCEDURE

  CODE
  IF BRW8::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW8::PopupTextExt = ''
        BRW8::PopupChoiceExec = True
        BRW8::FormatManager.MakePopup(BRW8::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW8::PopupTextExt = '|-|' & CLIP(BRW8::PopupTextExt)
        END
        BRW8::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW8::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW8::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW8::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW8::PopupChoiceOn AND BRW8::PopupChoiceExec THEN
     BRW8::PopupChoiceExec = False
     BRW8::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW8::PopupTextExt)
     IF BRW8::FormatManager.DispatchChoice(BRW8::PopupChoice)
     ELSE
     END
  END


BRW15.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW15::LastSortOrder <> NewOrder THEN
     BRW15::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW15::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW15.TakeNewSelection PROCEDURE

  CODE
  IF BRW15::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW15::PopupTextExt = ''
        BRW15::PopupChoiceExec = True
        BRW15::FormatManager.MakePopup(BRW15::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW15::PopupTextExt = '|-|' & CLIP(BRW15::PopupTextExt)
        END
        BRW15::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW15::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW15::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW15::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW15::PopupChoiceOn AND BRW15::PopupChoiceExec THEN
     BRW15::PopupChoiceExec = False
     BRW15::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW15::PopupTextExt)
     IF BRW15::FormatManager.DispatchChoice(BRW15::PopupChoice)
     ELSE
     END
  END


BRW12.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW12::LastSortOrder <> NewOrder THEN
     BRW12::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW12::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW12.TakeNewSelection PROCEDURE

  CODE
  IF BRW12::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW12::PopupTextExt = ''
        BRW12::PopupChoiceExec = True
        BRW12::FormatManager.MakePopup(BRW12::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW12::PopupTextExt = '|-|' & CLIP(BRW12::PopupTextExt)
        END
        BRW12::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW12::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW12::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW12::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW12::PopupChoiceOn AND BRW12::PopupChoiceExec THEN
     BRW12::PopupChoiceExec = False
     BRW12::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW12::PopupTextExt)
     IF BRW12::FormatManager.DispatchChoice(BRW12::PopupChoice)
     ELSE
     END
  END

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Billing
!!! </summary>
UpdateBilling PROCEDURE 

locVerifiedBy STRING(2),OVER(Pat:IGE)
locClientName        STRING(32)                            !
locFeeText           STRING(16),DIM(8)                     !
locFeeValues         LONG,DIM(8)                           !
locFeeString         STRING(16)                            !
Labels               STRING(32),DIM(8)                     !
locComponent         LONG,DIM(4)                           !
locTIgE              LONG                                  !
locTIgG              LONG                                  !
locTIgA              LONG                                  !
locTIgM              LONG                                  !
locRast              LONG,DIM(3)                           !
locMix               LONG,DIM(3)                           !
locHymenoptera       LONG,DIM(3)                           !
locOccupational      LONG,DIM(3)                           !
locChemical          LONG,DIM(3)                           !
locPanel260s145      LONG                                  !
locPanel260          LONG                                  !
locPanel270          LONG                                  !
locFees              DECIMAL(7,2)                          !
locCodeTotal         LONG                                  !
locGender            STRING(8)                             !
locAge               STRING(8)                             !
locAmountDue         DECIMAL(7,2)                          !
CurrentTab           LONG                                  !
locLetters           BYTE                                  !
locFeeType           LONG                                  !
locName              STRING(64)                            !
locLastPayment       DATE                                  !
locLastLetter        DATE                                  !
locPayments          DECIMAL(7,2)                          !
locPatientPayments   DECIMAL(7,2)                          !
locPatientBillingAmount DECIMAL(7,2)                       !
locShowPaymentTotal  DECIMAL(7,2)                          !
locBalance           DECIMAL(7,2)                          !
locLetterDays        USHORT                                !
ActionMessage        CSTRING(40)                           !
BRW8::View:Browse    VIEW(Payments)
                       PROJECT(Pay:Date)
                       PROJECT(Pay:Type)
                       PROJECT(Pay:Amount)
                       PROJECT(Pay:Note)
                       PROJECT(Pay:Invoice)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
Pay:Date               LIKE(Pay:Date)                 !List box control field - type derived from field
Pay:Type               LIKE(Pay:Type)                 !List box control field - type derived from field
Pay:Amount             LIKE(Pay:Amount)               !List box control field - type derived from field
Pay:Note               LIKE(Pay:Note)                 !List box control field - type derived from field
Pay:Invoice            LIKE(Pay:Invoice)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW15::View:Browse   VIEW(Insurance)
                       PROJECT(Ins:From)
                       PROJECT(Ins:Too)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
Ins:From               LIKE(Ins:From)                 !List box control field - type derived from field
Ins:Too                LIKE(Ins:Too)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW6::View:Browse    VIEW(Test)
                       PROJECT(TST:CODE)
                       PROJECT(TST:TYPE)
                       PROJECT(TST:STATUS)
                       PROJECT(TST:INVOICE)
                       JOIN(RST:ORDER_KEY,TST:CODE)
                         PROJECT(RST:DESCRIPTION)
                         PROJECT(RST:NUMBER)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
TST:CODE               LIKE(TST:CODE)                 !List box control field - type derived from field
TST:TYPE               LIKE(TST:TYPE)                 !List box control field - type derived from field
RST:DESCRIPTION        LIKE(RST:DESCRIPTION)          !List box control field - type derived from field
TST:STATUS             LIKE(TST:STATUS)               !List box control field - type derived from field
TST:INVOICE            LIKE(TST:INVOICE)              !Browse key field - type derived from field
RST:NUMBER             LIKE(RST:NUMBER)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW12::View:Browse   VIEW(BillingItems)
                       PROJECT(BI:Qty)
                       PROJECT(BI:Description)
                       PROJECT(BI:Price)
                       PROJECT(BI:Patient)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?List:5
BI:Qty                 LIKE(BI:Qty)                   !List box control field - type derived from field
BI:Description         LIKE(BI:Description)           !List box control field - type derived from field
BI:Price               LIKE(BI:Price)                 !List box control field - type derived from field
BI:Patient             LIKE(BI:Patient)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
FDB14::View:FileDrop VIEW(Providers)
                       PROJECT(Pro:Description)
                     END
Queue:FileDrop:3     QUEUE                            !Queue declaration for browse/combo box using ?Pro:Description
Pro:Description        LIKE(Pro:Description)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
History::BILL:Record LIKE(BILL:RECORD),THREAD
BRW8::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW8::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW8::PopupChoice    SIGNED                       ! Popup current choice
BRW8::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW8::PopupChoiceExec BYTE(0)                     ! Popup executed
BRW15::FormatManager ListFormatManagerClass,THREAD ! LFM object
BRW15::PopupTextExt  STRING(1024)                 ! Extended popup text
BRW15::PopupChoice   SIGNED                       ! Popup current choice
BRW15::PopupChoiceOn BYTE(1)                      ! Popup on/off choice
BRW15::PopupChoiceExec BYTE(0)                    ! Popup executed
BRW6::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW6::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW6::PopupChoice    SIGNED                       ! Popup current choice
BRW6::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW6::PopupChoiceExec BYTE(0)                     ! Popup executed
BRW12::FormatManager ListFormatManagerClass,THREAD ! LFM object
BRW12::PopupTextExt  STRING(1024)                 ! Extended popup text
BRW12::PopupChoice   SIGNED                       ! Popup current choice
BRW12::PopupChoiceOn BYTE(1)                      ! Popup on/off choice
BRW12::PopupChoiceExec BYTE(0)                    ! Popup executed
QuickWindow          WINDOW,AT(,,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),CENTER,GRAY,IMM,MDI,HLP('UpdateBilling')
                       SHEET,AT(-1,-1,465,194),USE(?CurrentTab),FONT(,,,FONT:regular),SPREAD
                         TAB('General'),USE(?Tab:1)
                           PROMPT('Verified By:'),AT(12,32,55),USE(?Pat:IGE:Prompt),RIGHT,TRN
                           ENTRY(@s3),AT(70,32,22,10),USE(BILL:VerifiedBy),LEFT(2),UPR
                           ENTRY(@s3),AT(100,32,22,10),USE(BILL:VerifiedBy2),UPR
                           PROMPT('QB:'),AT(12,56,55),USE(?BILL:QB:Prompt),RIGHT,TRN
                           ENTRY(@s16),AT(69,57,95,10),USE(BILL:InsuranceQB),HIDE
                           PROMPT('Date:'),AT(12,70,55),USE(?BILL:Date:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(69,70,40,10),USE(BILL:DateFax1)
                           ENTRY(@s32),AT(69,83,214,10),USE(BILL:Description)
                           PROMPT('Comment:'),AT(11,118),USE(?BILL:Comment:Prompt),TRN
                           TEXT,AT(65,121,241),USE(BILL:Comment,,?BILL:Comment:2)
                           PROMPT('Description:'),AT(12,83,55),USE(?BILL:Description:Prompt),RIGHT,TRN
                           PROMPT('Patient DoB'),AT(331,162,50),USE(?BILL:DoB:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(384,161,60,10),USE(BILL:CovidPostDate)
                           ENTRY(@n-14),AT(70,44,95,10),USE(BILL:PatientQB)
                         END
                         TAB('Contact'),USE(?Tab:Contact)
                           ENTRY(@s32),AT(95,45),USE(BILL:Contact)
                           PROMPT('Address 1:'),AT(33,62,55),USE(?NAM:Address1:Prompt),TRN
                           ENTRY(@s32),AT(95,63,139,11),USE(BILL:AddressPatient)
                           PROMPT('Address 2:'),AT(33,79,55),USE(?NAM:Address2:Prompt),TRN
                           ENTRY(@s32),AT(95,80,140,12),USE(BILL:AddressInsured)
                           PROMPT('Postal Code,'),AT(8,97,43),USE(?NAM:Postalcode:Prompt),TRN
                           ENTRY(@s10),AT(95,97,60,10),USE(BILL:PostalPatient)
                           PROMPT('City:'),AT(52,97),USE(?NAM:City:Prompt),TRN
                           ENTRY(@s20),AT(160,97,60,10),USE(BILL:CityPatient)
                           PROMPT('State:'),AT(68,97),USE(?NAM:State:Prompt),TRN
                           ENTRY(@s2),AT(228,97,25,10),USE(BILL:StatePatient)
                           PROMPT('Email:'),AT(33,114,55),USE(?NAM:Email:Prompt),TRN
                           ENTRY(@s40),AT(95,113,244,12),USE(BILL:emailPatient)
                           PROMPT('Phone:'),AT(33,130,55),USE(?BILL:Phone:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(94,129,60,10),USE(BILL:Phone),RIGHT(2)
                           PROMPT('Phone Alt:'),AT(33,148,55),USE(?BILL:PhoneAlt:Prompt),TRN
                           ENTRY(@P(###) ###-####P),AT(94,147,60,10),USE(BILL:PhoneAlt),FONT(,,,FONT:regular),RIGHT(2)
                           STRING('Name:'),AT(33,45,55),USE(?STRING21),TRN
                         END
                         TAB('Insurance'),USE(?Tab:Financial),HIDE
                           OPTION('Assignment'),AT(34,48,66,26),USE(BILL:Assignment,,?BILL:Assignment:2),FONT(,,,FONT:regular), |
  BOXED,TRN
                             RADIO('Yes'),AT(40,57),USE(?OPTION1:RADIO1),VALUE('1'),TRN
                             RADIO('No'),AT(76,56,23),USE(?BILL:ASSIGNMENT),VALUE('0'),TRN
                           END
                           STRING('Provider'),AT(30,86),USE(?STRING7),TRN
                           LIST,AT(30,108),USE(Pro:Description),DROP(5),FORMAT('80L(2)|M~Description~L(0)@s20@'),FROM(Queue:FileDrop:3)
                           LIST,AT(190,55,150,100),USE(?List:3),DECIMAL(12),FORMAT('40L(2)|M~From~L(0)@d17@40L(2)|' & |
  'M~To~L(0)@d17@'),FROM(Queue:Browse:2),IMM
                           BUTTON('&Insert'),AT(200,157,42,12),USE(?Insert:2)
                           BUTTON('&Change'),AT(242,157,42,12),USE(?Change:2)
                           BUTTON('&Delete'),AT(284,157,42,12),USE(?Delete:2)
                         END
                         TAB('Financial'),USE(?Tab:Financial:2)
                           PROMPT('Insurance Billed:'),AT(152,64,76),USE(?BILL:InsuranceBilled:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(232,64,48,10),USE(BILL:InsuranceBilled),RIGHT(2)
                           PROMPT('Insurance Paid:'),AT(152,97,76),USE(?BILL:InsurancePaid:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(232,97,48,10),USE(BILL:InsurancePaid),RIGHT(2)
                           PROMPT('Insurance Adj:'),AT(152,80,76),USE(?BILL:InsuranceAdj:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(232,81,48,10),USE(BILL:InsuranceAdj),RIGHT(2)
                           PROMPT('Patient Responsibility:'),AT(298,64,76),USE(?BILL:OtherAdj:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(378,64,48,10),USE(BILL:PatientResponsibility),RIGHT(2)
                           CHECK('Write Off'),AT(68,56,66),USE(BILL:WriteOff),ICON(ICON:None),TRN
                           PROMPT('Patient Adj:'),AT(299,80,74),USE(?BILL:PatientAdj:Prompt),RIGHT,TRN
                           ENTRY(@n-10.2),AT(378,81,48,10),USE(BILL:PatientAdj),RIGHT(2)
                           STRING(@n-10.2),AT(373,50,49,11),USE(locPatientBillingAmount),FONT(,11,,FONT:regular),RIGHT, |
  TRN
                           STRING(@n-10.2),AT(373,99,49,11),USE(locPatientPayments),FONT(,11,,FONT:regular),RIGHT,TRN
                           STRING('Payments:'),AT(337,99),USE(?STRING1),TRN
                           LIST,AT(0,84,150,100),USE(?List:5),RIGHT(1),FORMAT('18C|M~Qty~@n3@97L(2)|M~Description~' & |
  'L(0)@s32@44L(2)|M~Price~L(1)@N-8.2@'),FROM(Queue:Browse:4),IMM
                         END
                         TAB('Patient Payments'),USE(?Tab:Payments)
                           LIST,AT(14,32,332,146),USE(?List),VSCROLL,FORMAT('40L(2)|M~Date~L(0)@d17@E(00000000H,,0' & |
  '0FFFFFFH,00FF0000H)46L(2)|M~Type~L(0)@s16@44L(2)|M~Amount~D(12)@n-10.2@1020L(2)|M~No' & |
  'te~L(0)@s255@'),FROM(Queue:Browse),IMM,TRN
                           BUTTON('&Insert'),AT(366,83,42,12),USE(?Insert)
                           BUTTON('&Change'),AT(366,114,42,12),USE(?Change)
                           BUTTON('&Delete'),AT(366,53,42,12),USE(?Delete)
                           PANEL,AT(12,30,336,150),USE(?PANEL1),BEVEL(1)
                         END
                         TAB('Letters'),USE(?Tab:Letter)
                           PROMPT('Intial Letter:'),AT(218,25,96,7),USE(?BILL:Letter1:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,26,61,11),USE(BILL:Letter1)
                           PROMPT('2nd Notice:'),AT(218,39,96,7),USE(?BILL:Letter2:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,40,61,11),USE(BILL:Letter2)
                           PROMPT('Final Notice/Certified Letter:'),AT(218,50,96,7),USE(?BILL:Letter3:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,51,61,11),USE(BILL:Letter3)
                           PROMPT('Delinquent Notice:'),AT(218,64,96,7),USE(?BILL:Letter4:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,64,61,11),USE(BILL:Letter4)
                           PROMPT('Collection Notice:'),AT(218,77,96,7),USE(?BILL:Letter5:Prompt),RIGHT,TRN
                           ENTRY(@d17),AT(318,78,61,11),USE(BILL:Letter5)
                           BUTTON('Print'),AT(394,25,,12),USE(?BUTTONPrintLetter1)
                           BUTTON('Print'),AT(394,39,32,12),USE(?ButtonPrintLetter2)
                           BUTTON('Print'),AT(394,50,32,12),USE(?ButtonPrintLetter3)
                           BUTTON('Print'),AT(394,64,32,12),USE(?ButtonPrintLetter4)
                           BUTTON('Print'),AT(394,77,32,12),USE(?ButtonPrintLetter5)
                           CHECK('Please sent copy of insurance card'),AT(20,25,187,12),USE(mdlSelectNotes[1]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('1','0')
                           CHECK('Insurance applied to yearly deductible/co-insurance'),AT(20,39,187,12),USE(mdlSelectNotes[2]), |
  FONT(,,,FONT:regular),COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('2','0')
                           CHECK('Fee for service not covered by your insurance'),AT(20,50,187,12),USE(mdlSelectNotes[3]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('4','0')
                           CHECK('Non-network discount applied'),AT(20,64,187,12),USE(mdlSelectNotes[4]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('8','0')
                           CHECK('No coverage on the date of service'),AT(20,77,187,12),USE(mdlSelectNotes[5]),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('16','0')
                           CHECK('payment for services sent to member/patient'),AT(20,88,187,12),USE(mdlSelectNotes[6]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('32','0')
                           CHECK('Balance Due amount will be applied to the credit card'),AT(20,102,187,12),USE(mdlSelectNotes[7]), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('64','0')
                         END
                         TAB('Tests'),USE(?Tab:Test)
                           LIST,AT(6,36,150,151),USE(?List:2),FORMAT('36L(2)|M~Code~@s9@12L(2)|M@n3@160L(2)|M~Desc' & |
  'ription~@s40@0L(2)|M@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                           PROMPT('Totals'),AT(170,49),USE(?locCodeTotal:Prompt),TRN
                           STRING(@n3),AT(234,88),USE(locRast[1]),RIGHT,TRN
                           PROMPT('Standard'),AT(172,88),USE(?locRast:Prompt),TRN
                           PROMPT('Hymenoptera'),AT(172,98),USE(?locHymenoptera:Prompt),TRN
                           STRING(@n3),AT(234,98),USE(locHymenoptera[1]),RIGHT,TRN
                           PROMPT('Mix'),AT(172,109),USE(?locMix:Prompt),TRN
                           STRING(@n3),AT(234,109),USE(locMix[1]),RIGHT,TRN
                           PROMPT('Occupational'),AT(172,119),USE(?locOccupational:Prompt),TRN
                           STRING(@n3),AT(234,119),USE(locOccupational[1]),RIGHT,TRN
                           PROMPT('Chemical'),AT(172,128),USE(?locChemical:Prompt),TRN
                           STRING(@n3),AT(234,128),USE(locChemical[1]),RIGHT,TRN
                           STRING(@n3),AT(298,88),USE(locRast[2]),RIGHT,TRN
                           STRING(@n3),AT(298,98),USE(locHymenoptera[2]),RIGHT,TRN
                           STRING(@n3),AT(298,109),USE(locMix[2]),RIGHT,TRN
                           STRING(@n3),AT(298,119),USE(locOccupational[2]),RIGHT,TRN
                           STRING(@n3),AT(298,128),USE(locChemical[2]),RIGHT,TRN
                           STRING(@n3),AT(358,88),USE(locRast[3]),RIGHT,TRN
                           STRING(@n3),AT(358,98),USE(locHymenoptera[3]),RIGHT,TRN
                           STRING(@n3),AT(358,109),USE(locMix[3]),RIGHT,TRN
                           STRING(@n3),AT(358,119),USE(locOccupational[3]),RIGHT,TRN
                           STRING(@n3),AT(358,128),USE(locChemical[3],,?locChemical_3:2),RIGHT,TRN
                           STRING(@n$6.2),AT(216,49),USE(FEE:TIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(270,49),USE(FEE:TIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(328,49),USE(FEE:TIgA),RIGHT,TRN
                           STRING(@n$6.2),AT(380,49),USE(FEE:TIgM),RIGHT,TRN
                           STRING(@N$6.2),AT(252,88),USE(FEE:IgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,88),USE(FEE:IgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,88),USE(FEE:IgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,98),USE(FEE:mxIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,98),USE(FEE:mxIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,98),USE(FEE:mxIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,109),USE(FEE:hyIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,109),USE(FEE:hyIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,109),USE(FEE:hyIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,119),USE(FEE:occIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,119),USE(FEE:occIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,119),USE(FEE:occIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(252,128),USE(FEE:chemIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(316,128),USE(FEE:chemIgG),RIGHT,TRN
                           STRING(@n$6.2),AT(376,128),USE(FEE:chemIgG4),RIGHT,TRN
                           STRING(@n3),AT(200,49),USE(locTIgE),RIGHT,TRN
                           STRING(@n3),AT(256,49),USE(locTIgG),RIGHT,TRN
                           STRING(@n3),AT(310,49),USE(locTIgA),RIGHT,TRN
                           STRING(@n3),AT(364,49),USE(locTIgM),RIGHT,TRN
                           STRING(@n-10.2),AT(368,177),USE(locFees),FONT(,12,,FONT:bold),RIGHT,TRN
                           STRING('TIgE'),AT(214,40,31),USE(?STRING8),CENTER,TRN
                           STRING('TIgG'),AT(268,40,31),USE(?STRING9),CENTER,TRN
                           STRING('TIgA'),AT(324,40,31),USE(?STRING10),CENTER,TRN
                           STRING('TIgM'),AT(374,40,31),USE(?STRING11),CENTER,TRN
                           STRING('IgE'),AT(244,74,24),USE(?STRING12),CENTER,TRN
                           STRING('IgG'),AT(306,74,24),USE(?STRING13),CENTER,TRN
                           STRING('IgG4'),AT(368,73,24),USE(?STRING14),CENTER,TRN
                           STRING('Panel 260'),AT(172,152,32),USE(?STRING15),TRN
                           STRING('Panel 270'),AT(172,177,32),USE(?STRING16),TRN
                           STRING(@n$6.2),AT(252,152),USE(FEE:Panel260),RIGHT,TRN
                           STRING(@n$6..2),AT(252,177),USE(FEE:Panel270),RIGHT,TRN
                           STRING('S145'),AT(172,161,32),USE(?STRING19),TRN
                           STRING(@n$6.2),AT(252,161),USE(FEE:Panel260S145),RIGHT,TRN
                           STRING(@n3),AT(234,152),USE(locPanel260),RIGHT,TRN
                           STRING(@n3),AT(234,161),USE(locPanel260s145),RIGHT,TRN
                           STRING(@n3),AT(234,177),USE(locPanel270),RIGHT,TRN
                           STRING('Component'),AT(172,137),USE(?STRING18),TRN
                           STRING(@n3),AT(234,137,19,10),USE(locComponent[1]),RIGHT,TRN
                           STRING(@n3),AT(298,137),USE(locComponent[2]),RIGHT,TRN
                           STRING(@n$6.2),AT(252,137),USE(FEE:ComponentIgE),RIGHT,TRN
                           STRING(@n$6.2),AT(376,137),USE(FEE:ComponentIgG4),RIGHT,TRN
                           STRING(@n$6.2),AT(316,137),USE(FEE:ComponentIgG),RIGHT,TRN
                           STRING(@n3),AT(358,137),USE(locComponent[3]),RIGHT,TRN
                           BUTTON('Apply'),AT(418,176,44,11),USE(?ButtonApply2InsuranceBilled)
                           STRING(@n_6),AT(416,158,43),USE(FEE:Client),RIGHT,TRN
                           STRING(@n3),AT(443,147),USE(BILL:FeeType,,?BILL:FeeType:2),FONT(,,,FONT:regular),TRN
                         END
                       END
                       OPTION('Fee Type'),AT(3,14,456,23),USE(BILL:FeeType),HIDE,TRN
                         RADIO('In Network'),AT(27,19,56),USE(?BILL:FeeType:InNetwork),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('1')
                         RADIO('Out of Network'),AT(84,19,56),USE(?BILL:FeeType:OutNetwork),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('2')
                         RADIO('Client'),AT(142,19,56),USE(?BILL:FeeType:Client),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('5')
                         RADIO('Patient'),AT(200,19,56),USE(?BILL:FeeType:Patient),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('6')
                         RADIO('Medicare'),AT(257,19,56),USE(?BILL:FeeType:Medicare),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('3')
                         RADIO('Medicaid'),AT(314,19,56),USE(?BILL:FeeType:Medicaid),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('4')
                         RADIO('Evaluation'),AT(372,19,56),USE(?BILL:FeeType:Evaluation),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('8')
                       END
                       BUTTON('&OK'),AT(420,290,70,25),USE(?BUTTON3),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WAOK.ICO'), |
  DEFAULT,FLAT,MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(320,290,70,25),USE(?BUTTON4),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WACANCEL.ICO'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       BUTTON('&Help'),AT(6,311,49,14),USE(?BUTTON5),FONT('Arial',11,,,CHARSET:ANSI),LEFT,ICON('WAHELP.ICO'), |
  FLAT,HIDE,MSG('See Help Window'),STD(STD:Help),TIP('See Help Window')
                       STRING(@n-10.2),AT(320,248,95),USE(BILL:OutStanding),FONT(,24,,FONT:bold),RIGHT,TRN
                       STRING(@n-10.2),AT(320,230,95),USE(locPayments),FONT(,24,,FONT:bold),RIGHT,TRN
                       STRING('Outstanding'),AT(279,252,57),USE(?STRING3),TRN
                       STRING('Payments'),AT(279,233,57),USE(?STRING2),TRN
                       STRING('Last Letter'),AT(35,241,50),USE(?STRING4),RIGHT,TRN
                       STRING(@d17B),AT(87,241,74),USE(BILL:LastLetter),FONT(,14,,FONT:bold),LEFT,TRN
                       STRING(@n-10.2),AT(320,211,95),USE(locAmountDue),FONT(,24,,FONT:bold),RIGHT,TRN
                       STRING('Amount Due'),AT(279,215,57),USE(?STRING5),TRN
                       STRING(@s64),AT(87,202,407),USE(locName),FONT(,14,,FONT:bold),TRN
                       STRING('Patient'),AT(35,202,50),USE(?STRING6),RIGHT,TRN
                       STRING(@s32),AT(87,227,185),USE(locClientName,,?locClientName:2),FONT(,14,,FONT:bold),TRN
                       STRING('Client:'),AT(35,228,50),USE(?STRING17),RIGHT,TRN
                       STRING(@d17b),AT(188,241,74),USE(BILL:NextLetter),FONT(,14,,FONT:bold),LEFT,TRN
                       STRING('Next:'),AT(165,241),USE(?StringNextLetter),TRN
                       STRING('Date of Service'),AT(34,215),USE(?STRING20),TRN
                       STRING(@d17b),AT(87,215),USE(BILL:DateFax2),TRN
                       BUTTON('Export'),AT(143,277),USE(?ButtonExport)
                       STRING(@s16),AT(87,255),USE(locFeeString),FONT(,,,FONT:bold),TRN
                       STRING('Billing Type'),AT(47,255),USE(?STRING22),TRN
                     END

BRW8::LastSortOrder       BYTE
BRW15::LastSortOrder       BYTE
BRW6::LastSortOrder       BYTE
BRW12::LastSortOrder       BYTE
BRW8::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW15::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW6::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW12::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW15                CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW6                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW6::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW12                CLASS(BrowseClass)                    ! Browse using ?List:5
Q                      &Queue:Browse:4                !Reference to browse queue
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW12::Sort0:Locator StepLocatorClass                      ! Default Locator
FDB14                CLASS(FileDropClass)                  ! File drop manager
Q                      &Queue:FileDrop:3              !Reference to display queue
                     END

SAV:Namelist  LIKE(NAM:Record)
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

GetFees   ROUTINE
  locFeeValues[1] = 1
  locFeeValues[2] = 2
  locFeeValues[3] = 3
  locFeeValues[4] = 4
  locFeeValues[5] = BILL:Client
  locFeeValues[6] = 6
  locFeeValues[7] = 7
    
  locFeeText[8] = 'N/C Eval'
  locFeeText[1] = 'In Network'
  locFeeText[2] = 'Out of Network'
  locFeeText[3] = 'Medicare'
  locFeeText[4] = 'Medicaid'
  locFeeText[5] = 'Client'
  locFeeText[6] = 'Patient'
  locFeeText[7] = '????'
    
  FEE:Client = 1
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE()
    FEE:Client = 3
    GET(Fees,FEE:OrderKey)
    FEE:Client = 1
    ADD(Fees)
  .
  FEE:Client = 2
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE()
    FEE:Client = 3
    GET(Fees,FEE:OrderKey)
    FEE:Client = 2
    ADD(Fees)
  .
  FEE:Client = 4
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE()
    FEE:Client = 3
    GET(Fees,FEE:OrderKey)
    FEE:Client = 4
    ADD(Fees)
  .
  FEE:Client = 1
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE()
    FEE:Client = 3
    GET(Fees,FEE:OrderKey)
    FEE:Client = 1
    ADD(Fees)
  .
  IF BILL:FeeType = 0 THEN BILL:FeeType = 8. 
  IF BILL:FeeType = 5 THEN 
    BILL:FeeType = 5;
    locFeeString = 'Client' 
  ELSE
    locFeeType = BILL:FeeType
    locFeeString = locFeeText[BILL:FeeType]
  .
  FEE:Client = locFeeValues[BILL:FeeType]
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE() AND BILL:FeeType > 99999
    CLEAR(FEE:Record)
    FEE:Client  = BILL:Client
    ADD(Fees)
  .

  
  locTIgE = 0
  locTIgG = 0
  locTIgA = 0
  locTIgM = 0
  CLEAR(locRast)
  CLEAR(locMix)
  CLEAR(locHymenoptera)
  CLEAR(locOccupational)
  CLEAR(locChemical)
  CLEAR(locPanel260s145)
  CLEAR(locPanel260)
  CLEAR(locPanel270)
  CLEAR(locComponent)
  CLEAR(TST:Record)
  TST:INVOICE = BILL:Accession
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF ERRORCODE() OR TST:INVOICE <> BILL:Accession THEN BREAK.
    
    IF gloTestCodeStartsWith2 = 'S1'
      IF TST:CODE = 'S145'
        locPanel260s145 += 1
      ELSE
        locPanel260 += 1
      .
    ELSIF gloTestCodeStartsWith2 = 'S2'
      locPanel270 += 1
    ELSIF gloTestCodeStartsWith1 = 'S'
      locChemical[TST:TYPE] +=1
    ELSE
      CASE TST:Code
      OF '100'
        locTIgE = 1
      OF 'AAA'
        locTIgA = 1
      OF 'GGG'
        locTIgG = 1
      OF 'MMM'
        locTIgM = 1
      OF 'F359'
      OROF 'F360'
        locComponent[TST:TYPE] += 1
      OF 'EZ04'
      OROF 'EZ06'
      OROF 'EZ07'
      OROF 'EZ12'
      OROF 'FZ03'
      OROF 'FZ11'
      OROF 'FZ13'
      OROF 'GZ08'
      OROF 'HZ05'
      OROF 'MZ02'
      OROF 'MZ15'
      OROF 'TZ01'
      OROF 'TZ09'
      OROF 'TZ13'
      OROF 'WZ10'
        locMix[TST:TYPE] += 1
      OF 'I001'
      OROF 'I002'
      OROF 'I003'
      OROF 'I004'
      OROF 'I005'
        locHymenoptera[TST:TYPE] += 1
      OF 'K001'
      OROF 'K002'
      OROF 'K082'
        locOccupational[TST:TYPE] += 1
      ELSE
        locRast[TST:TYPE] += 1
  .  . .
  
    locFees = locTIgE * FEE:tIgE + locTIgG * FEE:tIgG + locTIgA * FEE:tIgA + locTIgM * FEE:tIgM + |
    locRast[1] * FEE:IgE + locRast[2] * FEE:IgG + locRast[3] * FEE:IgG4 + | 
    locMix[1] * FEE:mxIgE + locMix[2] * FEE:mxIgG + locMix[3] * FEE:mxIgG4 + |
    locHymenoptera[1] * FEE:hyIgE + locHymenoptera[2] * FEE:hyIgE + locHymenoptera[3] * FEE:hyIgE + |
    locOccupational[1] * FEE:occIgE + locOccupational[2] * FEE:occIgG + locOccupational[3] * FEE:occIgG4 + |
    locChemical[1] * FEE:chemIgE + locChemical[2] * FEE:chemIgG + locChemical[3] * FEE:chemIgG4 + |
    FEE:Panel260 * locPanel260 +  FEE:Panel260S145 * locPanel260s145 + FEE:Panel270 * locPanel270
    DISPLAY()     

Letters ROUTINE
  BILL:LetterNotes = mdlSelectNotes[1] + mdlSelectNotes[2] + mdlSelectNotes[3] + mdlSelectNotes[4] + mdlSelectNotes[5] + mdlSelectNotes[6] + mdlSelectNotes[7] 
  PUT(Billing)
  IF ERRORCODE() THEN STOP('BILL PUT: ' & ERROR()).
Totals  ROUTINE
   
  BILL:Payments = 0
  locLastPayment = 0
  locLastLetter = 0
  Pay:Invoice = BILL:Accession
  Pay:Date = 0
  SET(Pay:OrderKey,Pay:OrderKey)
  LOOP
    NEXT(Payments)
    IF Pay:Invoice <> BILL:Invoice OR ERRORCODE() THEN BREAK.
    IF Pay:Type = 'Insurance' THEN CYCLE.
    BILL:Payments += Pay:Amount
    IF Pay:Date > locLastPayment THEN locLastPayment = Pay:Date.
  .
    IF BILL:Letter5 > 0
      BILL:LastLetter = BILL:Letter5
      locLetters = 5
    ELSIF BILL:Letter4 > 0
      BILL:LastLetter = BILL:Letter4
      locLetters = 4
    ELSIF BILL:Letter3 > 0
      BILL:LastLetter = BILL:Letter3
      locLetters = 3
    ELSIF BILL:Letter2 > 0
      BILL:LastLetter = BILL:Letter2
      locLetters = 2
    ELSIF BILL:Letter1 > 0
      BILL:LastLetter = BILL:Letter1
      locLetters = 1
    ELSE
      locLetters = 0
      BILL:LastLetter = 0
      BILL:NextLetter = 0
    .
    IF locLetters > 0  
      BILL:NextLetter = BILL:LastLetter + gloBillingLetterDays.
  
  BILL:OutStanding = locAmountDue - BILL:Payments  
  Labels[1] = 'Insurance Billed:' 
  Labels[2] = 'Insurance Adj:' 
  Labels[3] = 'Insurance Paid:' 
  Labels[4] = 'Patient Responsibility:' 
  Labels[5] = 'Patient Adjust:' 
  Labels[6] = 'Payments:' 
  Labels[7] = '' 
  UNHIDE(?BILL:InsuranceBilled)
  UNHIDE(?BILL:InsuranceAdj)
  UNHIDE(?BILL:InsurancePaid)
  ?BILL:OtherAdj:Prompt{PROP:Text} = Labels[4];
  ?BILL:PatientAdj:Prompt{PROP:Text} = Labels[5];
  CASE BILL:FeeType 
  OF 5 ! Client
    ?BILL:InsuranceBilled:Prompt{PROP:Text} = '';
    ?BILL:InsuranceAdj:Prompt{PROP:Text} = '';
    ?BILL:InsurancePaid:Prompt{PROP:Text} = '';
    HIDE(?BILL:InsuranceBilled)
    HIDE(?BILL:InsuranceAdj)
    HIDE(?BILL:InsurancePaid)
    ?BILL:PatientAdj:Prompt{PROP:Text} = 'Client Adjust:'
    ?BILL:OtherAdj:Prompt{PROP:Text} = 'Client Billed:'
    locAmountDue = BILL:PatientResponsibility - BILL:PatientAdj 
    BILL:OutStanding = locAmountDue - BILL:Payments

  OF 6 ! patient
    IF BILL:InsurancePaid + BILL:InsuranceBilled  = 0
      ?BILL:InsuranceBilled:Prompt{PROP:Text} = '';
      ?BILL:InsuranceAdj:Prompt{PROP:Text} = '';
      ?BILL:InsurancePaid:Prompt{PROP:Text} = '';
      HIDE(?BILL:InsuranceBilled)
      HIDE(?BILL:InsuranceAdj)
      HIDE(?BILL:InsurancePaid)
      locAmountDue = BILL:PatientResponsibility - BILL:PatientAdj 
      BILL:OutStanding = locAmountDue - BILL:Payments

    ELSE  ! Insurance + Patient
      ?BILL:InsuranceBilled:Prompt{PROP:Text} = Labels[1];
      ?BILL:InsuranceAdj:Prompt{PROP:Text} = Labels[2];
      ?BILL:InsurancePaid:Prompt{PROP:Text} = Labels[3];
      locAmountDue = BILL:PatientResponsibility - BILL:InsurancePaid - BILL:PatientAdj 
      IF locAmountDue < 0 THEN locAmountDue = 0.
      BILL:OutStanding = locAmountDue - BILL:Payments
    .
  ELSE  ! Insurance
    ?BILL:InsuranceBilled:Prompt{PROP:Text} = Labels[1];
    ?BILL:InsuranceAdj:Prompt{PROP:Text} = Labels[2];
    ?BILL:InsurancePaid:Prompt{PROP:Text} = Labels[3];
    locAmountDue = BILL:InsuranceBilled - BILL:InsuranceAdj 
    BILL:Payments = BILL:InsurancePaid
    BILL:OutStanding = BILL:InsuranceBilled - BILL:InsurancePaid - BILL:InsuranceAdj 
  .

  DO Letters

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                               ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage  ! Display status message in status bar
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ChangeAction()
    STOP('CHANGEaCTION: ' & GlobalRequest)
    locVerifiedBy = BILL:VerifiedBy
    PUT(Patient)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalRequest = 2
  GlobalErrors.SetProcedureName('UpdateBilling')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:IGE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(BILL:Record,History::BILL:Record)
  SELF.AddHistoryField(?BILL:VerifiedBy,90)
  SELF.AddHistoryField(?BILL:VerifiedBy2,91)
  SELF.AddHistoryField(?BILL:InsuranceQB,7)
  SELF.AddHistoryField(?BILL:DateFax1,13)
  SELF.AddHistoryField(?BILL:Description,15)
  SELF.AddHistoryField(?BILL:Comment:2,92)
  SELF.AddHistoryField(?BILL:CovidPostDate,28)
  SELF.AddHistoryField(?BILL:PatientQB,8)
  SELF.AddHistoryField(?BILL:Contact,21)
  SELF.AddHistoryField(?BILL:AddressPatient,19)
  SELF.AddHistoryField(?BILL:AddressInsured,38)
  SELF.AddHistoryField(?BILL:PostalPatient,24)
  SELF.AddHistoryField(?BILL:CityPatient,22)
  SELF.AddHistoryField(?BILL:StatePatient,23)
  SELF.AddHistoryField(?BILL:emailPatient,25)
  SELF.AddHistoryField(?BILL:Phone,78)
  SELF.AddHistoryField(?BILL:PhoneAlt,79)
  SELF.AddHistoryField(?BILL:Assignment:2,88)
  SELF.AddHistoryField(?BILL:InsuranceBilled,61)
  SELF.AddHistoryField(?BILL:InsurancePaid,62)
  SELF.AddHistoryField(?BILL:InsuranceAdj,63)
  SELF.AddHistoryField(?BILL:PatientResponsibility,67)
  SELF.AddHistoryField(?BILL:WriteOff,71)
  SELF.AddHistoryField(?BILL:PatientAdj,65)
  SELF.AddHistoryField(?BILL:Letter1,51)
  SELF.AddHistoryField(?BILL:Letter2,52)
  SELF.AddHistoryField(?BILL:Letter3,53)
  SELF.AddHistoryField(?BILL:Letter4,54)
  SELF.AddHistoryField(?BILL:Letter5,55)
  SELF.AddHistoryField(?BILL:FeeType:2,59)
  SELF.AddHistoryField(?BILL:FeeType,59)
  SELF.AddHistoryField(?BILL:OutStanding,69)
  SELF.AddHistoryField(?BILL:LastLetter,57)
  SELF.AddHistoryField(?BILL:NextLetter,56)
  SELF.AddHistoryField(?BILL:DateFax2,14)
  SELF.AddUpdateFile(Access:Billing)
  SELF.AddItem(?BUTTON4,RequestCancelled)         ! Add the cancel control to the window manager
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:BillingItems.Open                        ! File BillingItems used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Fees.Open                                ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:Insurance.Open                           ! File Insurance used by this procedure, so make sure it's RelationManager is open
  Relate:NameList.Open                            ! File NameList used by this procedure, so make sure it's RelationManager is open
  Relate:Payments.Open                            ! File Payments used by this procedure, so make sure it's RelationManager is open
  Relate:Providers.Open                           ! File Providers used by this procedure, so make sure it's RelationManager is open
  Relate:Setup.Open                               ! File Setup used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Billing
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None               ! Inserts not allowed
    SELF.DeleteAction = Delete:None               ! Deletes not allowed
    SELF.ChangeAction = Change:Caller             ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query ! Confirm cancel
    SELF.OkControl = ?BUTTON3
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:Payments,SELF) ! Initialize the browse manager
  BRW15.Init(?List:3,Queue:Browse:2.ViewPosition,BRW15::View:Browse,Queue:Browse:2,Relate:Insurance,SELF) ! Initialize the browse manager
  BRW6.Init(?List:2,Queue:Browse:1.ViewPosition,BRW6::View:Browse,Queue:Browse:1,Relate:Test,SELF) ! Initialize the browse manager
  BRW12.Init(?List:5,Queue:Browse:4.ViewPosition,BRW12::View:Browse,Queue:Browse:4,Relate:BillingItems,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW8.Q &= Queue:Browse
  BRW8.AddSortOrder(,Pay:OrderKey)                ! Add the sort order for Pay:OrderKey for sort order 1
  BRW8.AddRange(Pay:Invoice,BILL:Accession)       ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,Pay:Date,1,BRW8)      ! Initialize the browse locator using  using key: Pay:OrderKey , Pay:Date
  BRW8.AddField(Pay:Date,BRW8.Q.Pay:Date)         ! Field Pay:Date is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Type,BRW8.Q.Pay:Type)         ! Field Pay:Type is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Amount,BRW8.Q.Pay:Amount)     ! Field Pay:Amount is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Note,BRW8.Q.Pay:Note)         ! Field Pay:Note is a hot field or requires assignment from browse
  BRW8.AddField(Pay:Invoice,BRW8.Q.Pay:Invoice)   ! Field Pay:Invoice is a hot field or requires assignment from browse
  BRW15.Q &= Queue:Browse:2
  BRW15.AddSortOrder(,)                           ! Add the sort order for  for sort order 1
  BRW15.AddField(Ins:From,BRW15.Q.Ins:From)       ! Field Ins:From is a hot field or requires assignment from browse
  BRW15.AddField(Ins:Too,BRW15.Q.Ins:Too)         ! Field Ins:Too is a hot field or requires assignment from browse
  BRW6.Q &= Queue:Browse:1
  BRW6.AddSortOrder(,TST:ORDER_KEY)               ! Add the sort order for TST:ORDER_KEY for sort order 1
  BRW6.AddRange(TST:INVOICE,Pat:INVOICE)          ! Add single value range limit for sort order 1
  BRW6.AddLocator(BRW6::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW6::Sort0:Locator.Init(,TST:TYPE,,BRW6)       ! Initialize the browse locator using  using key: TST:ORDER_KEY , TST:TYPE
  BRW6.SetFilter('(TST:Type > 0)')                ! Apply filter expression to browse
  BRW6.AddField(TST:CODE,BRW6.Q.TST:CODE)         ! Field TST:CODE is a hot field or requires assignment from browse
  BRW6.AddField(TST:TYPE,BRW6.Q.TST:TYPE)         ! Field TST:TYPE is a hot field or requires assignment from browse
  BRW6.AddField(RST:DESCRIPTION,BRW6.Q.RST:DESCRIPTION) ! Field RST:DESCRIPTION is a hot field or requires assignment from browse
  BRW6.AddField(TST:STATUS,BRW6.Q.TST:STATUS)     ! Field TST:STATUS is a hot field or requires assignment from browse
  BRW6.AddField(TST:INVOICE,BRW6.Q.TST:INVOICE)   ! Field TST:INVOICE is a hot field or requires assignment from browse
  BRW6.AddField(RST:NUMBER,BRW6.Q.RST:NUMBER)     ! Field RST:NUMBER is a hot field or requires assignment from browse
  BRW12.Q &= Queue:Browse:4
  BRW12.AddSortOrder(,BI:OrderKey)                ! Add the sort order for BI:OrderKey for sort order 1
  BRW12.AddRange(BI:Patient,BILL:Accession)       ! Add single value range limit for sort order 1
  BRW12.AddLocator(BRW12::Sort0:Locator)          ! Browse has a locator for sort order 1
  BRW12::Sort0:Locator.Init(,BI:Patient,1,BRW12)  ! Initialize the browse locator using  using key: BI:OrderKey , BI:Patient
  BRW12.AddField(BI:Qty,BRW12.Q.BI:Qty)           ! Field BI:Qty is a hot field or requires assignment from browse
  BRW12.AddField(BI:Description,BRW12.Q.BI:Description) ! Field BI:Description is a hot field or requires assignment from browse
  BRW12.AddField(BI:Price,BRW12.Q.BI:Price)       ! Field BI:Price is a hot field or requires assignment from browse
  BRW12.AddField(BI:Patient,BRW12.Q.BI:Patient)   ! Field BI:Patient is a hot field or requires assignment from browse
  ToolBarForm.HelpButton=?BUTTON5
  SELF.AddItem(ToolbarForm)
  BRW8.AskProcedure = 1
  FDB14.Init(?Pro:Description,Queue:FileDrop:3.ViewPosition,FDB14::View:FileDrop,Queue:FileDrop:3,Relate:Providers,ThisWindow)
  FDB14.Q &= Queue:FileDrop:3
  FDB14.AddSortOrder()
  FDB14.AddField(Pro:Description,FDB14.Q.Pro:Description) !List box control field - type derived from field
  ThisWindow.AddItem(FDB14.WindowComponent)
  FDB14.DefaultFill = 0
  BRW8.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW8.ToolbarItem.HelpButton = ?BUTTON5
  BRW15.AddToolbarTarget(Toolbar)                 ! Browse accepts toolbar control
  BRW15.ToolbarItem.HelpButton = ?BUTTON5
  BRW6.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW6.ToolbarItem.HelpButton = ?BUTTON5
  BRW12.AddToolbarTarget(Toolbar)                 ! Browse accepts toolbar control
  BRW12.ToolbarItem.HelpButton = ?BUTTON5
  BRW8::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW8::FormatManager.Init('Alis8','UpdateBilling',1,?List,8,BRW8::PopupTextExt,Queue:Browse,4,LFM_CFile,LFM_CFile.Record)
  BRW8::FormatManager.BindInterface(,,,'ALIS.INI')
  BRW15::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW15::FormatManager.Init('Alis8','UpdateBilling',1,?List:3,15,BRW15::PopupTextExt,Queue:Browse:2,2,LFM_CFile,LFM_CFile.Record)
  BRW15::FormatManager.BindInterface(,,,'ALIS.INI')
  BRW6::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW6::FormatManager.Init('Alis8','UpdateBilling',1,?List:2,6,BRW6::PopupTextExt,Queue:Browse:1,4,LFM_CFile,LFM_CFile.Record)
  BRW6::FormatManager.BindInterface(,,,'ALIS.INI')
  BRW12::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW12::FormatManager.Init('Alis8','UpdateBilling',1,?List:5,12,BRW12::PopupTextExt,Queue:Browse:4,3,LFM_CFile,LFM_CFile.Record)
  BRW12::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  Pat:INVOICE = BILL:Accession
  GET(Patient,Pat:INVOICE_KEY)
  
  
  IF Pat:SEX = 'M'
    locGender = 'Male'
  ELSE
    locGender = 'Female'  
  . 
  locName = Pat:Invoice & '   ' & CLIP(Pat:LAST) & ', ' & CLIP(Pat:FIRST) & '  ' & CLIP(locGender) & '  ' & CLIP(locAge)
  NAM:Number = BILL:Accession
  GET(NameList,NAM:OrderKey)
  IF ERRORCODE() 
    CLEAR(NAM:Record)
    NAM:Number = Pat:INVOICE
    ADD(NameList)
  .
  CLI:Number = PAT:Client
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE() 
    locClientName = 'CLIENT: ' & ERROR()
  ELSE
    IF CLI:FIRST
      locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      locClientName = CLI:LAST
    .
  .
  locFeeType = BILL:FeeType
  BILL:FeeType = 6
  DO GetFees
  locPatientBillingAmount = locFees  
  BILL:FeeType = locFeeType
  DO GetFees  
  mdlSelectNotes[1] = BAND(BILL:LetterNotes,1)
  mdlSelectNotes[2] = BAND(BILL:LetterNotes,2)
  mdlSelectNotes[3] = BAND(BILL:LetterNotes,4)
  mdlSelectNotes[4] = BAND(BILL:LetterNotes,8)
  mdlSelectNotes[5] = BAND(BILL:LetterNotes,16)
  mdlSelectNotes[6] = BAND(BILL:LetterNotes,32)
  mdlSelectNotes[7] = BAND(BILL:LetterNotes,64)
  DO Totals
  BRW8::AutoSizeColumn.Init()
  BRW8::AutoSizeColumn.AddListBox(?List,Queue:Browse)
  BRW15::AutoSizeColumn.Init()
  BRW15::AutoSizeColumn.AddListBox(?List:3,Queue:Browse:2)
  BRW6::AutoSizeColumn.Init()
  BRW6::AutoSizeColumn.AddListBox(?List:2,Queue:Browse:1)
  BRW12::AutoSizeColumn.Init()
  BRW12::AutoSizeColumn.AddListBox(?List:5,Queue:Browse:4)
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
    Relate:Client.Close
    Relate:Fees.Close
    Relate:Insurance.Close
    Relate:NameList.Close
    Relate:Payments.Close
    Relate:Providers.Close
    Relate:Setup.Close
    Relate:Test.Close
  END
  ! List Format Manager destructor
  BRW8::FormatManager.Kill() 
  ! List Format Manager destructor
  BRW15::FormatManager.Kill() 
  ! List Format Manager destructor
  BRW6::FormatManager.Kill() 
  ! List Format Manager destructor
  BRW12::FormatManager.Kill() 
  BRW8::AutoSizeColumn.Kill()
  BRW15::AutoSizeColumn.Kill()
  BRW6::AutoSizeColumn.Kill()
  BRW12::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  Pat:INVOICE = BILL:Accession                             ! Assign linking field value
  Access:Patient.Fetch(Pat:INVOICE_KEY)
  BI:Patient = BILL:Accession                              ! Assign linking field value
  Access:BillingItems.Fetch(BI:OrderKey)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePayment
    ReturnValue = GlobalResponse
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
    OF ?BUTTONPrintLetter1
      
      BILL:Letter1 = TODAY()  
      DISPLAY(?BILL:Letter1)
      PUT(Billing)
    OF ?ButtonPrintLetter2
      BILL:Letter2 = TODAY()  
      DISPLAY(?BILL:Letter2)
      PUT(Billing)
    OF ?ButtonPrintLetter3
      BILL:Letter3 = TODAY()  
      DISPLAY(?BILL:Letter3)
      PUT(Billing)
    OF ?ButtonPrintLetter4
      BILL:Letter4 = TODAY()  
      DISPLAY(?BILL:Letter4)
      PUT(Billing)
    OF ?ButtonPrintLetter5
      BILL:Letter5 = TODAY()  
      DISPLAY(?BILL:Letter5)
      PUT(Billing)
    OF ?mdlSelectNotes_7
      DO Letters
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BILL:InsuranceBilled
      DO Totals
    OF ?BILL:InsurancePaid
      IF BILL:InsurancePaid > 0
        BILL:FeeType = 6
        DISPLAY(?BILL:FeeType)
      .
      FEE:Client = BILL:FeeType 
      DO GetFees
      DO Totals
    OF ?BILL:InsuranceAdj
      DO Totals
    OF ?BILL:PatientResponsibility
      DO Totals
    OF ?BUTTONPrintLetter1
      ThisWindow.Update
      GlobalRequest = ChangeRecord
      Letters(1)
      ThisWindow.Reset
    OF ?ButtonPrintLetter2
      ThisWindow.Update
      Letters(2)
      ThisWindow.Reset
    OF ?ButtonPrintLetter3
      ThisWindow.Update
      Letters(3)
      ThisWindow.Reset
    OF ?ButtonPrintLetter4
      ThisWindow.Update
      Letters(4)
      ThisWindow.Reset
    OF ?ButtonPrintLetter5
      ThisWindow.Update
      Letters(5)
      ThisWindow.Reset
    OF ?mdlSelectNotes_1
      DO Letters 
    OF ?mdlSelectNotes_2
      DO Letters 
    OF ?mdlSelectNotes_3
      DO Letters 
    OF ?mdlSelectNotes_4
      DO Letters 
    OF ?mdlSelectNotes_5
      DO Letters 
    OF ?mdlSelectNotes_6
      DO Letters 
    OF ?mdlSelectNotes_7
      DO Letters 
    OF ?ButtonApply2InsuranceBilled
      ThisWindow.Update
      DO Totals
    OF ?BILL:FeeType
      UPDATE(?)
      DO GetFees
      DO Totals
    OF ?BUTTON3
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
  IF BRW8::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW15::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW6::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW12::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
      DISPLAY(?BILL:FeeType)
      CASE CHOICE()
      OF 4
      OROF 7
        UNHIDE(?BILL:FeeType)
      ELSE
        HIDE(?BILL:FeeType)
      .
      DISPLAY(?BILL:FeeType)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW8.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW8.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW8::LastSortOrder <> NewOrder THEN
     BRW8::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW8::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW8.TakeNewSelection PROCEDURE

  CODE
  IF BRW8::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW8::PopupTextExt = ''
        BRW8::PopupChoiceExec = True
        BRW8::FormatManager.MakePopup(BRW8::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW8::PopupTextExt = '|-|' & CLIP(BRW8::PopupTextExt)
        END
        BRW8::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW8::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW8::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW8::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW8::PopupChoiceOn AND BRW8::PopupChoiceExec THEN
     BRW8::PopupChoiceExec = False
     BRW8::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW8::PopupTextExt)
     IF BRW8::FormatManager.DispatchChoice(BRW8::PopupChoice)
     ELSE
     END
  END


BRW15.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW15::LastSortOrder <> NewOrder THEN
     BRW15::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW15::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW15.TakeNewSelection PROCEDURE

  CODE
  IF BRW15::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW15::PopupTextExt = ''
        BRW15::PopupChoiceExec = True
        BRW15::FormatManager.MakePopup(BRW15::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW15::PopupTextExt = '|-|' & CLIP(BRW15::PopupTextExt)
        END
        BRW15::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW15::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW15::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW15::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW15::PopupChoiceOn AND BRW15::PopupChoiceExec THEN
     BRW15::PopupChoiceExec = False
     BRW15::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW15::PopupTextExt)
     IF BRW15::FormatManager.DispatchChoice(BRW15::PopupChoice)
     ELSE
     END
  END


BRW6.ResetFromView PROCEDURE

locCodeTotal:Cnt     LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Test.SetQuickScan(1)
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
    locCodeTotal:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  locCodeTotal = locCodeTotal:Cnt
  PARENT.ResetFromView
  Relate:Test.SetQuickScan(0)
  SETCURSOR()


BRW6.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW6::LastSortOrder <> NewOrder THEN
     BRW6::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW6::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW6.TakeNewSelection PROCEDURE

  CODE
  IF BRW6::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW6::PopupTextExt = ''
        BRW6::PopupChoiceExec = True
        BRW6::FormatManager.MakePopup(BRW6::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW6::PopupTextExt = '|-|' & CLIP(BRW6::PopupTextExt)
        END
        BRW6::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW6::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW6::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW6::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW6::PopupChoiceOn AND BRW6::PopupChoiceExec THEN
     BRW6::PopupChoiceExec = False
     BRW6::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW6::PopupTextExt)
     IF BRW6::FormatManager.DispatchChoice(BRW6::PopupChoice)
     ELSE
     END
  END


BRW12.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW12::LastSortOrder <> NewOrder THEN
     BRW12::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW12::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW12.TakeNewSelection PROCEDURE

  CODE
  IF BRW12::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW12::PopupTextExt = ''
        BRW12::PopupChoiceExec = True
        BRW12::FormatManager.MakePopup(BRW12::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW12::PopupTextExt = '|-|' & CLIP(BRW12::PopupTextExt)
        END
        BRW12::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW12::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW12::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW12::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW12::PopupChoiceOn AND BRW12::PopupChoiceExec THEN
     BRW12::PopupChoiceExec = False
     BRW12::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW12::PopupTextExt)
     IF BRW12::FormatManager.DispatchChoice(BRW12::PopupChoice)
     ELSE
     END
  END

