

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8004.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Pnl_test file by Pnl:ORDER_KEY
!!! </summary>
PanelTestTable PROCEDURE (prmPanelNumber)

INCLUDE('ABFILE.INC')  
CurrentTab           STRING(80)                            !
locMessage           STRING(40)                            !
locDescription       STRING(40)                            !
locCount             SHORT                                 !
locTypeDescription   STRING(5)                             !
locPanelNumber       STRING(9)                             !
locTypeCount         BYTE,DIM(3)                           !
locTypeCountIgE      BYTE                                  !
locTypeCountIgG4     BYTE                                  !
locTypeCountIgG      BYTE                                  !
BRW1::View:Browse    VIEW(Pnl_test)
                       PROJECT(PT:CODE)
                       PROJECT(PT:PANEL)
                       PROJECT(PT:TYPE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PT:CODE                LIKE(PT:CODE)                  !List box control field - type derived from field
PT:CODE_NormalFG       LONG                           !Normal forground color
PT:CODE_NormalBG       LONG                           !Normal background color
PT:CODE_SelectedFG     LONG                           !Selected forground color
PT:CODE_SelectedBG     LONG                           !Selected background color
PT:CODE_Style          LONG                           !Field style
locTypeDescription     LIKE(locTypeDescription)       !List box control field - type derived from local data
locTypeDescription_NormalFG LONG                      !Normal forground color
locTypeDescription_NormalBG LONG                      !Normal background color
locTypeDescription_SelectedFG LONG                    !Selected forground color
locTypeDescription_SelectedBG LONG                    !Selected background color
locTypeDescription_Style LONG                         !Field style
locDescription         LIKE(locDescription)           !List box control field - type derived from local data
locDescription_NormalFG LONG                          !Normal forground color
locDescription_NormalBG LONG                          !Normal background color
locDescription_SelectedFG LONG                        !Selected forground color
locDescription_SelectedBG LONG                        !Selected background color
locDescription_Style   LONG                           !Field style
PT:PANEL               LIKE(PT:PANEL)                 !Browse key field - type derived from field
PT:TYPE                LIKE(PT:TYPE)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),GRAY,MDI,HLP('BrowsePnl_testByPnl:ORDER_KEY')
                       STRING('Panel Tests'),AT(96,8,154,16),USE(?String5),FONT(,18,,FONT:bold),CENTER,TRN
                       STRING('Panel:'),AT(96,26),USE(?String6),FONT(,,,FONT:bold),TRN
                       STRING(@s7),AT(118,26),USE(gloPanelNumber),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@s24),AT(154,26),USE(PAN:Description),FONT(,,,FONT:bold),TRN
                       STRING(@n-7),AT(420,268),USE(locCount),FONT(,,,FONT:bold),TRN
                       STRING('Tests'),AT(450,268),USE(?String4),FONT(,,,FONT:bold),TRN
                       LIST,AT(96,38,164,273),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),VSCROLL,COLOR(, |
  COLOR:Blue,COLOR:White),FORMAT('32L(2)|M*Y~Code~@s7@29L(2)|M*Y~Type~C(0)160L(2)|M*Y~D' & |
  'escription~@s40@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Pnl_test file'),TRN
                       PANEL,AT(96,38,164,273),USE(?Panel1)
                       BUTTON('&View'),AT(0,316,49,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('Add 1 Test'),AT(408,158,80,25),USE(?Insert:3),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  MSG('Insert a Record'),TIP('Insert a Record'),TRN
                       BUTTON('&Change'),AT(408,238,80,25),USE(?Change:3),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(408,202,80,25),USE(?Delete:3),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  MSG('Delete the Record'),TIP('Delete the Record'),TRN
                       BUTTON('Done'),AT(408,290,80,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('BUTTON.JPG'),AT(408,124,80,25),USE(?Image5)
                       IMAGE('BUTTON.JPG'),AT(408,202,80,25),USE(?Image4)
                       IMAGE('BUTTON.JPG'),AT(408,158,80,25),USE(?Image3)
                       IMAGE('BUTTON.JPG'),AT(408,238,80,25),USE(?Image2)
                       IMAGE('BUTTON.JPG'),AT(408,290,80,25),USE(?Image1)
                       BUTTON('&Help'),AT(408,106,80,25),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Add Multiple'),AT(408,124,80,25),USE(?AddMultipleTest),FONT(,,,FONT:bold),LEFT,ICON('SteelAddOn.ico'), |
  TRN
                       STRING(@pIgE   <<# p),AT(14,22,50,12),USE(locTypeCountIgE),FONT(,14,COLOR:White,FONT:bold, |
  CHARSET:ANSI),RIGHT,COLOR(COLOR:Red)
                       STRING(@p IgG4 <<# p),AT(14,34,50,12),USE(locTypeCountIgG4),FONT(,14,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),RIGHT,COLOR(COLOR:Yellow)
                       STRING(@p  IgG   <<# p),AT(14,46,50,12),USE(locTypeCountIgG),FONT(,14,COLOR:White,FONT:bold, |
  CHARSET:ANSI),RIGHT,COLOR(COLOR:Blue)
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
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()               ! Opens the window and starts an Accept Loop
  RETURN(locCount)

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
  GlobalErrors.SetProcedureName('PanelTestTable')
  locPanelNumber = prmPanelNumber
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String5
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locTypeDescription',locTypeDescription)   ! Added by: BrowseBox(ABC)
  BIND('locDescription',locDescription)           ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                              ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Pnl_test,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,PT:ORDER_KEY)                ! Add the sort order for PT:ORDER_KEY for sort order 1
  BRW1.AddRange(PT:PANEL,locPanelNumber)          ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PT:CODE,1,BRW1)       ! Initialize the browse locator using  using key: PT:ORDER_KEY , PT:CODE
  BRW1.AddField(PT:CODE,BRW1.Q.PT:CODE)           ! Field PT:CODE is a hot field or requires assignment from browse
  BRW1.AddField(locTypeDescription,BRW1.Q.locTypeDescription) ! Field locTypeDescription is a hot field or requires assignment from browse
  BRW1.AddField(locDescription,BRW1.Q.locDescription) ! Field locDescription is a hot field or requires assignment from browse
  BRW1.AddField(PT:PANEL,BRW1.Q.PT:PANEL)         ! Field PT:PANEL is a hot field or requires assignment from browse
  BRW1.AddField(PT:TYPE,BRW1.Q.PT:TYPE)           ! Field PT:TYPE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PanelTestTable',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,18,LFM_CFile,LFM_CFile.Record)
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
    Relate:Client.Close
    Relate:Panels.Close
    Relate:Rast.Close
    Relate:Test.Close
  
  
  Pan:TESTS = locCount
  PUT(Panels)
  IF ERRORCODE() THEN STOP('PUT PAN: ' & ERROR()).
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
    UpdatePnl_test
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
    OF ?AddMultipleTest
      ThisWindow.Update
      LoginTests(1)
      ThisWindow.Reset
      BRW1.ResetFromFile
      BRW1.ResetFromView
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


BRW1.ResetFromView PROCEDURE

locCount:Cnt         LONG                                  ! Count variable for browse totals
locTypeCountIgE:Cnt  LONG                                  ! Count variable for browse totals
locTypeCountIgG4:Cnt LONG                                  ! Count variable for browse totals
locTypeCountIgG:Cnt  LONG                                  ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:Pnl_test.SetQuickScan(1)
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
  IF PT:TYPE
    locCount:Cnt += 1
    IF (PT:TYPE = 1)
      locTypeCountIgE:Cnt += 1
    END
    IF (PT:TYPE = 3)
      locTypeCountIgG4:Cnt += 1
    END
    IF (PT:TYPE = 2)
      locTypeCountIgG:Cnt += 1
    END
  ELSIF PAT:Status = 'L' OR PAT:Status = 'V'
   Pan:NUMBER = PT:Code
   GET(Panels,Pan:ORDER_KEY)
   IF ~ERRORCODE() THEN locCount:Cnt += Pan:TESTS.
  .
  END
  SELF.View{PROP:IPRequestCount} = 0
  locCount = locCount:Cnt
  locTypeCountIgE = locTypeCountIgE:Cnt
  locTypeCountIgG4 = locTypeCountIgG4:Cnt
  locTypeCountIgG = locTypeCountIgG:Cnt
  PARENT.ResetFromView
  Relate:Pnl_test.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (PT:TYPE = 1)
    SELF.Q.PT:CODE_NormalFG = 16777215                     ! Set conditional color values for PT:CODE
    SELF.Q.PT:CODE_NormalBG = 255
    SELF.Q.PT:CODE_SelectedFG = 255
    SELF.Q.PT:CODE_SelectedBG = 16777215
    SELF.Q.locTypeDescription_NormalFG = 16777215          ! Set conditional color values for locTypeDescription
    SELF.Q.locTypeDescription_NormalBG = 255
    SELF.Q.locTypeDescription_SelectedFG = 255
    SELF.Q.locTypeDescription_SelectedBG = 16777215
    SELF.Q.locDescription_NormalFG = 16777215              ! Set conditional color values for locDescription
    SELF.Q.locDescription_NormalBG = 255
    SELF.Q.locDescription_SelectedFG = 255
    SELF.Q.locDescription_SelectedBG = 16777215
  ELSIF (PT:TYPE=2)
    SELF.Q.PT:CODE_NormalFG = 16777215                     ! Set conditional color values for PT:CODE
    SELF.Q.PT:CODE_NormalBG = 16711680
    SELF.Q.PT:CODE_SelectedFG = 16711680
    SELF.Q.PT:CODE_SelectedBG = 16777215
    SELF.Q.locTypeDescription_NormalFG = 16777215          ! Set conditional color values for locTypeDescription
    SELF.Q.locTypeDescription_NormalBG = 16711680
    SELF.Q.locTypeDescription_SelectedFG = 16711680
    SELF.Q.locTypeDescription_SelectedBG = 16777215
    SELF.Q.locDescription_NormalFG = 16777215              ! Set conditional color values for locDescription
    SELF.Q.locDescription_NormalBG = 16711680
    SELF.Q.locDescription_SelectedFG = 16711680
    SELF.Q.locDescription_SelectedBG = 16777215
  ELSIF (PT:TYPE= 3)
    SELF.Q.PT:CODE_NormalFG = 0                            ! Set conditional color values for PT:CODE
    SELF.Q.PT:CODE_NormalBG = 65535
    SELF.Q.PT:CODE_SelectedFG = 65535
    SELF.Q.PT:CODE_SelectedBG = 0
    SELF.Q.locTypeDescription_NormalFG = 0                 ! Set conditional color values for locTypeDescription
    SELF.Q.locTypeDescription_NormalBG = 65535
    SELF.Q.locTypeDescription_SelectedFG = 65535
    SELF.Q.locTypeDescription_SelectedBG = 0
    SELF.Q.locDescription_NormalFG = 0                     ! Set conditional color values for locDescription
    SELF.Q.locDescription_NormalBG = 65535
    SELF.Q.locDescription_SelectedFG = 65535
    SELF.Q.locDescription_SelectedBG = 0
  ELSE
    SELF.Q.PT:CODE_NormalFG = -1                           ! Set color values for PT:CODE
    SELF.Q.PT:CODE_NormalBG = -1
    SELF.Q.PT:CODE_SelectedFG = -1
    SELF.Q.PT:CODE_SelectedBG = -1
    SELF.Q.locTypeDescription_NormalFG = -1                ! Set color values for locTypeDescription
    SELF.Q.locTypeDescription_NormalBG = -1
    SELF.Q.locTypeDescription_SelectedFG = -1
    SELF.Q.locTypeDescription_SelectedBG = -1
    SELF.Q.locDescription_NormalFG = -1                    ! Set color values for locDescription
    SELF.Q.locDescription_NormalBG = -1
    SELF.Q.locDescription_SelectedFG = -1
    SELF.Q.locDescription_SelectedBG = -1
  END
  SELF.Q.PT:CODE_Style = 1 ! 
  SELF.Q.locTypeDescription_Style = 1 ! 
  SELF.Q.locDescription_Style = 1 ! 


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
  IF INRANGE(PT:TYPE,1,8)
    locTypeDescription = gloTypeDescription[PT:Type]
    RST:NUMBER =  PT:CODE
    GET(Rast,RST:ORDER_KEY)
    IF ERRORCODE()
      locDescription = ERROR()
    ELSE
      locDescription = RST:DESCRIPTION
    .
  ELSIF ~PT:TYPE
    PAN:Number = PT:CODE
    GET(Panels,Pan:ORDER_KEY)
    IF ERRORCODE()
      locDescription = ERROR()
    ELSE
      locDescription = RST:DESCRIPTION
      locTypeDescription = gloTypeDescription[TYPE:Panel]
    .
  ELSE
    locTypeDescription = gloTypeDescription[TYPE:Error]
  .
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

