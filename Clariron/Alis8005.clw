

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8005.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8080.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Panels file
!!! </summary>
Panels PROCEDURE 

CurrentTab           STRING(80)                            !
locTestCount         SHORT                                 !
BRW1::View:Browse    VIEW(Panels)
                       PROJECT(PAN:Number)
                       PROJECT(PAN:Description)
                       PROJECT(PAN:IgE)
                       PROJECT(PAN:IgG)
                       PROJECT(PAN:IgG4)
                       PROJECT(PAN:Mix)
                       PROJECT(PAN:TotalIgE)
                       PROJECT(PAN:Tests)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PAN:Number             LIKE(PAN:Number)               !List box control field - type derived from field
PAN:Number_Style       LONG                           !Field style
PAN:Description        LIKE(PAN:Description)          !List box control field - type derived from field
PAN:Description_Style  LONG                           !Field style
PAN:IgE                LIKE(PAN:IgE)                  !List box control field - type derived from field
PAN:IgE_Style          LONG                           !Field style
PAN:IgG                LIKE(PAN:IgG)                  !List box control field - type derived from field
PAN:IgG_Style          LONG                           !Field style
PAN:IgG4               LIKE(PAN:IgG4)                 !List box control field - type derived from field
PAN:IgG4_Style         LONG                           !Field style
PAN:Mix                LIKE(PAN:Mix)                  !List box control field - type derived from field
PAN:Mix_Style          LONG                           !Field style
PAN:TotalIgE           LIKE(PAN:TotalIgE)             !List box control field - type derived from field
PAN:TotalIgE_Style     LONG                           !Field style
PAN:Tests              LIKE(PAN:Tests)                !List box control field - type derived from field
PAN:Tests_Style        LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Standard Panels'),AT(0,0,511,340),FONT('Arial',11,,FONT:regular),RESIZE,GRAY,IMM,MDI, |
  HLP('Panels')
                       LIST,AT(6,13,348,304),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold),VSCROLL,COLOR(,COLOR:Blue, |
  COLOR:White),FORMAT('40L(2)|MY~Panel~@s9@170L(2)|MY~Description~@s64@21L(2)|MY~IgE~L(' & |
  '1)@n3@22L(2)|MY~IgG~L(1)@n3@23L(2)|MY~IgG4~L(1)@n3@18L(2)|MY~Mix~L(1)@n3@22L(2)|MY~T' & |
  'IgE~L(1)@n3@36R(2)|MY~Count~C(0)@n3@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Panels file'), |
  TRN
                       BUTTON('&Select'),AT(420,60,70,25),USE(?Select:2),FONT(,,,FONT:bold),LEFT,ICON('WASELECT.ICO'), |
  MSG('Select the Record'),TIP('Select the Record')
                       STRING('All Panels'),AT(427,247),USE(?String1),FONT(,18,,FONT:bold),TRN
                       BUTTON('&Insert'),AT(420,100,70,25),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  FLAT,MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&Change'),AT(420,148,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('WACHANGE.ICO'), |
  DEFAULT,FLAT,MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(420,124,70,25),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('WADELETE.ICO'), |
  FLAT,MSG('Delete the Record'),TIP('Delete the Record')
                       BUTTON('View Tests'),AT(420,208,70,25),USE(?BrowsePnl_test),FONT(,,,FONT:bold),LEFT,ICON('SteelView.ico'), |
  MSG('View Child File'),TIP('View Child File'),TRN
                       BUTTON('Done'),AT(420,280,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('BUTTON.JPG'),AT(420,208,70,25),USE(?Image2)
                       IMAGE('BUTTON.JPG'),AT(420,280,70,25),USE(?Image1)
                       BUTTON('&Help'),AT(0,326,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Export Panels'),AT(420,12,70,25),USE(?BUTTON1),FONT(,,,FONT:bold),LEFT,ICON(ICON:Connect)
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
SetQueueRecord         PROCEDURE(),DERIVED
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
  ?Browse:1{PROPSTYLE:FontName, 1}      = gloListFont
  ?Browse:1{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?Browse:1{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Panels')
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
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                              ! File Panels used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Panels,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon PAN:Number for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PAN:ORDER_KEY) ! Add the sort order for PAN:ORDER_KEY for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PAN:Number,1,BRW1)    ! Initialize the browse locator using  using key: PAN:ORDER_KEY , PAN:Number
  BRW1.AddField(PAN:Number,BRW1.Q.PAN:Number)     ! Field PAN:Number is a hot field or requires assignment from browse
  BRW1.AddField(PAN:Description,BRW1.Q.PAN:Description) ! Field PAN:Description is a hot field or requires assignment from browse
  BRW1.AddField(PAN:IgE,BRW1.Q.PAN:IgE)           ! Field PAN:IgE is a hot field or requires assignment from browse
  BRW1.AddField(PAN:IgG,BRW1.Q.PAN:IgG)           ! Field PAN:IgG is a hot field or requires assignment from browse
  BRW1.AddField(PAN:IgG4,BRW1.Q.PAN:IgG4)         ! Field PAN:IgG4 is a hot field or requires assignment from browse
  BRW1.AddField(PAN:Mix,BRW1.Q.PAN:Mix)           ! Field PAN:Mix is a hot field or requires assignment from browse
  BRW1.AddField(PAN:TotalIgE,BRW1.Q.PAN:TotalIgE) ! Field PAN:TotalIgE is a hot field or requires assignment from browse
  BRW1.AddField(PAN:Tests,BRW1.Q.PAN:Tests)       ! Field PAN:Tests is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','Panels',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,16,LFM_CFile,LFM_CFile.Record)
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
    Relate:Panels.Close
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
  CLI:Number = 0
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePanels
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
    OF ?BrowsePnl_test
      gloPanelNumber = PAN:Number
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BrowsePnl_test
      ThisWindow.Update
      locTestCount = PanelTestTable(PAN:Number)
      ThisWindow.Reset
    OF ?BUTTON1
      ThisWindow.Update
      exportTables()
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
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PAN:Number_Style = 1 ! 
  SELF.Q.PAN:Description_Style = 1 ! 
  SELF.Q.PAN:IgE_Style = 1 ! 
  SELF.Q.PAN:IgG_Style = 1 ! 
  SELF.Q.PAN:IgG4_Style = 1 ! 
  SELF.Q.PAN:Mix_Style = 1 ! 
  SELF.Q.PAN:TotalIgE_Style = 1 ! 
  SELF.Q.PAN:Tests_Style = 1 ! 


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

