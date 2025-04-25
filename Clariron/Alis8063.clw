

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8063.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8064.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PanelReview file
!!! </summary>
ClientPanelReview PROCEDURE 

CurrentTab           STRING(80)                            !
locTestCount         BYTE                                  !
locLineCount         BYTE                                  !
ActionMessage        CSTRING(40)                           !
locPanels            USHORT                                !
locTests             ULONG                                 !
locWaitTime          LONG                                  !
BRW1::View:Browse    VIEW(PanelReview)
                       PROJECT(PR:Client)
                       PROJECT(PR:Panels)
                       PROJECT(PR:Tests)
                       PROJECT(PR:MaxTestsPerPanel)
                       PROJECT(PR:MaxLinesPerPanel)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PR:Client              LIKE(PR:Client)                !List box control field - type derived from field
PR:Panels              LIKE(PR:Panels)                !List box control field - type derived from field
PR:Tests               LIKE(PR:Tests)                 !List box control field - type derived from field
PR:MaxTestsPerPanel    LIKE(PR:MaxTestsPerPanel)      !List box control field - type derived from field
PR:MaxLinesPerPanel    LIKE(PR:MaxLinesPerPanel)      !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Client Panel Review Letters'),AT(0,0,505,315),FONT('Arial',11,,FONT:regular),RESIZE, |
  ICON('Allermetrix.ico'),GRAY,IMM,HLP('ClientPanelReview'),SYSTEM
                       ENTRY(@P### ###P),AT(284,54,60,14),USE(gloLowLimit),FONT(,14,,FONT:bold),RIGHT(2)
                       ENTRY(@P### ###P),AT(284,72,60,14),USE(gloHighLimit),FONT(,14,,FONT:bold),RIGHT(2)
                       BUTTON('Print Range'),AT(210,72,61,14),USE(?ButtonPrintRange)
                       LIST,AT(0,-3,190,318),USE(?Browse:1),HVSCROLL,ALRT(0004h),FORMAT('62R(2)|M~Client~C(0)@' & |
  'p### ###p@28R(2)|M~Panels~C(0)@n3@28R(2)|M~Total~C(0)@n6@21R(2)|M~Max~C(0)@n3@80R(2)' & |
  '|M~Lines~C(0)@n3@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the PanelReview file')
                       BUTTON('Build Tables'),AT(210,54,61,14),USE(?ButtonBuildTables),SKIP
                       STRING(@n6),AT(244,0,93,14),USE(locPanels),FONT(,14,,FONT:bold),RIGHT,TRN
                       STRING('Panels'),AT(344,0),USE(?String4),FONT(,14),LEFT,TRN
                       STRING(@n13),AT(210,14,129,13),USE(locTests),FONT(,14,,FONT:bold),RIGHT,TRN
                       STRING('Tests'),AT(344,14),USE(?String5),FONT(,14),LEFT,TRN
                       STRING(@P### ###P),AT(210,0),USE(PR:Client),FONT(,14,,FONT:bold),TRN
                       STRING('From'),AT(354,54,37,10),USE(?String6),LEFT,TRN
                       STRING('To'),AT(354,72,37,10),USE(?String7),LEFT,TRN
                       CHECK('Preview'),AT(210,90,61,14),USE(gloPreview),FONT(,,,FONT:bold),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('0','1')
                       CHECK('Suppress Notice'),AT(210,108,90,14),USE(gloSupressNotifcation),FONT(,,,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN,VALUE('1','0')
                       BUTTON('&Select'),AT(198,34,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       STRING('Done'),AT(214,18,61,23),USE(?StringDone),FONT(,24,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  LEFT,HIDE,TRN
                       ENTRY(@s24),AT(210,128,193,14),USE(gloTitle),FONT(,14,,FONT:bold)
                       BUTTON('&Close'),AT(338,248,65,25),USE(?Close),LEFT,ICON('WACLOSE.ICO'),MSG('Close Window'), |
  TIP('Close Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
BuildTables ROUTINE
      locPanels = 0
      locTests = 0
      CLOSE(ClientPanelTests)
      CREATE(ClientPanelTests)
      OPEN(ClientPanelTests)
      
      CLOSE(PanelReview)
      CREATE(PanelReview)
      OPEN(PanelReview)
      
       CLI:NUMBER = gloLowLimit
      
      SET(CLI:ORDER_KEY,CLI:ORDER_KEY)
      IF ERRORCODE() THEN stop('SET CLI:  ' & error()).
      LOOP
        NEXT(Client)
        IF ERRORCODE() THEN BREAK.
        IF  CLI:NUMBER > gloHighLimit THEN BREAK.
        CLEAR(PR:Record)
        PR:Client = CLI:NUMBER
        ADD(PanelReview)
        IF ERRORCODE() THEN stop('PR: ' & error()).
        CLEAR(CP:Panel)
        CP:CLIENT = CLI:NUMBER
        SET(CP:ORDER_KEY,CP:ORDER_KEY)
        LOOP
          NEXT(Cli_Panl)
          IF ERRORCODE() OR CP:CLIENT <> CLI:NUMBER  THEN BREAK.
          locPanels += PR:Panels
          locTests += PR:Tests
        ! 
          PR:Panels += 1
          CLEAR(PT:Record)
          PT:PANEL = CP:PANEL
          SET(PT:ORDER_KEY,PT:ORDER_KEY)
          locTestCount = 0
          locLineCount = 0
          LOOP                                                              
            NEXT(Pnl_Test)
            IF ERRORCODE() OR PT:PANEL <> CP:PANEL  THEN BREAK.
            DISPLAY()
            PR:Tests +=1
            locTestCount += 1
            CPT:Code =  PT:CODE
            CPT:Client = CLI:NUMBER
            CPT:Panel =  CP:PANEL
            GET(ClientPanelTests,CPT:CodeKey)
            IF ERRORCODE()
              RST:NUMBER = PT:CODE
              GET(Rast,RST:ORDER_KEY)
              IF ERRORCODE()
                STOP(CP:CLIENT & ' ' & CP:PANEL & ' ' &  PT:CODE & ' ' & ERROR())
              ELSE
                CPT:TestTypes =   gloTypeDescription[PT:TYPE]
                CPT:Description = RST:DESCRIPTION
                CPT:Client =  CLI:NUMBER
                CPT:Panel =   CP:PANEL
                CPT:TestTypes = gloTypeDescription[PT:TYPE]
                ADD(ClientPanelTests)
                locLineCount += 1
                IF ERRORCODE() THEN stop('CPT: ' & error()).
              .
            ELSE
              CPT:TestTypes =  CLIP(CPT:TestTypes)  & ' ' & gloTypeDescription[PT:TYPE]
              PUT(ClientPanelTests)
            .
          .
          IF locLineCount > PR:MaxLinesPerPanel THEN  PR:MaxLinesPerPanel = locLineCount.
          IF locTestCount > PR:MaxTestsPerPanel THEN  PR:MaxTestsPerPanel = locTestCount.
          PUT(PanelReview)
          locLineCount = 0
          locTestCount = 0
        .
        PUT(PanelReview)
      .


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ClientPanelReview')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?gloLowLimit
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
  Relate:Cli_panl.Open                            ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:PanelReview.Open                         ! File PanelReview used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                            ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  IF ~gloTitle
    gloTitle = 'Panel Notification'
  .
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PanelReview,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon PR:Client for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PR:OrderKey) ! Add the sort order for PR:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PR:Client,1,BRW1)     ! Initialize the browse locator using  using key: PR:OrderKey , PR:Client
  BRW1.AddField(PR:Client,BRW1.Q.PR:Client)       ! Field PR:Client is a hot field or requires assignment from browse
  BRW1.AddField(PR:Panels,BRW1.Q.PR:Panels)       ! Field PR:Panels is a hot field or requires assignment from browse
  BRW1.AddField(PR:Tests,BRW1.Q.PR:Tests)         ! Field PR:Tests is a hot field or requires assignment from browse
  BRW1.AddField(PR:MaxTestsPerPanel,BRW1.Q.PR:MaxTestsPerPanel) ! Field PR:MaxTestsPerPanel is a hot field or requires assignment from browse
  BRW1.AddField(PR:MaxLinesPerPanel,BRW1.Q.PR:MaxLinesPerPanel) ! Field PR:MaxLinesPerPanel is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','ClientPanelReview',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,5,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  BRW1.ResetQueue(1)
  BRW1.PostNewSelection
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
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:PanelReview.Close
    Relate:Pnl_test.Close
    Relate:Rast.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
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
    OF ?ButtonBuildTables
      HIDE(?StringDone)
      DO BuildTables
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ButtonPrintRange
      ThisWindow.Update
      HIDE(?StringDone)
      PR:Client =  gloLowLimit
      SET(PR:OrderKey,PR:OrderKey)
      LOOP
        NEXT(PanelReview)
        IF ERRORCODE() OR PR:Client > gloHighLimit THEN BREAK.
        gloClientNumber = PR:Client
        CLI:Number = gloClientNumber
        GET(Client,CLI:ORDER_KEY)
        DISPLAY()
        locWaitTime = 1000 * PR:Panels
        PrintPanelReview
        SLEEP(locWaitTime)
      .
      UNHIDE(?StringDone)
      DISPLAY()
    OF ?ButtonBuildTables
      ThisWindow.Update
      BRW1.ResetQueue(1)
      BRW1.PostNewSelection
      UNHIDE(?StringDone)
      DISPLAY()
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:AlertKey
        HIDE(?StringDone)
        BRW1.UpdateBuffer
        CLEAR(CLI:Record)
        gloClientNumber = PR:Client
        CLI:Number = PR:Client
        GET(Client,CLI:ORDER_KEY)
        ClientPanelTest
        PrintPanelReview
        UNHIDE(?StringDone)
        DISPLAY()
    END
  END
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

