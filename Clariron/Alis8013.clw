

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8013.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8070.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Test file
!!! </summary>
PatientTests PROCEDURE (prmPatient)

SAV:Panel            STRING(9)                             !
locTotal             LONG                                  !
locHSA               BYTE(0)                               !
locTotalIgE          BYTE(0)                               !
Sort                 STRING(4),DIM(524)                    !
CodeSort             QUEUE,PRE(CS)                         !
Code                 STRING(4)                             !
Sort                 LONG                                  !
                     END                                   !
locOverride          BYTE                                  !
CurrentTab           STRING(80)                            !
locNeedDOB           BYTE                                  !
locEditPanel         BYTE                                  !
locTestType          STRING(5)                             !
locClientName        STRING(20)                            !
locPatient           LONG                                  !
locVolumeReceived    ULONG                                 !
locIgECountDiscreet  SHORT                                 !
locIgG4CountDiscreet SHORT                                 !
locIgGCountDiscreet  SHORT                                 !
locCounts            BYTE,DIM(3)                           !
locPanelTest         BYTE,DIM(3)                           !
locPanel             STRING(9)                             !
locPanelStatus       STRING(1)                             !
locSidePanelCountIgE BYTE                                  !
locSidePanelCountIgG BYTE                                  !
locSidePanelCountIgG4 BYTE                                 !
locSTypes STRING('IVGIVMIgM')
locSType  STRING(3),DIM(3),OVER(locSTypes)
BRW1::View:Browse    VIEW(Test)
                       PROJECT(TST:STATUS)
                       PROJECT(TST:CODE)
                       PROJECT(TST:Score)
                       PROJECT(TST:COUNT)
                       PROJECT(TST:Percentile)
                       PROJECT(TST:RANGE)
                       PROJECT(TST:TYPE)
                       PROJECT(TST:INVOICE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TST:STATUS             LIKE(TST:STATUS)               !List box control field - type derived from field
TST:STATUS_NormalFG    LONG                           !Normal forground color
TST:STATUS_NormalBG    LONG                           !Normal background color
TST:STATUS_SelectedFG  LONG                           !Selected forground color
TST:STATUS_SelectedBG  LONG                           !Selected background color
TST:STATUS_Style       LONG                           !Field style
TST:CODE               LIKE(TST:CODE)                 !List box control field - type derived from field
TST:CODE_NormalFG      LONG                           !Normal forground color
TST:CODE_NormalBG      LONG                           !Normal background color
TST:CODE_SelectedFG    LONG                           !Selected forground color
TST:CODE_SelectedBG    LONG                           !Selected background color
TST:CODE_Style         LONG                           !Field style
RST:DESCRIPTION        LIKE(RST:DESCRIPTION)          !List box control field - type derived from field
RST:DESCRIPTION_NormalFG LONG                         !Normal forground color
RST:DESCRIPTION_NormalBG LONG                         !Normal background color
RST:DESCRIPTION_SelectedFG LONG                       !Selected forground color
RST:DESCRIPTION_SelectedBG LONG                       !Selected background color
RST:DESCRIPTION_Style  LONG                           !Field style
locTestType            LIKE(locTestType)              !List box control field - type derived from local data
locTestType_NormalFG   LONG                           !Normal forground color
locTestType_NormalBG   LONG                           !Normal background color
locTestType_SelectedFG LONG                           !Selected forground color
locTestType_SelectedBG LONG                           !Selected background color
locTestType_Style      LONG                           !Field style
TST:Score              LIKE(TST:Score)                !List box control field - type derived from field
TST:Score_NormalFG     LONG                           !Normal forground color
TST:Score_NormalBG     LONG                           !Normal background color
TST:Score_SelectedFG   LONG                           !Selected forground color
TST:Score_SelectedBG   LONG                           !Selected background color
TST:Score_Style        LONG                           !Field style
TST:COUNT              LIKE(TST:COUNT)                !List box control field - type derived from field
TST:COUNT_NormalFG     LONG                           !Normal forground color
TST:COUNT_NormalBG     LONG                           !Normal background color
TST:COUNT_SelectedFG   LONG                           !Selected forground color
TST:COUNT_SelectedBG   LONG                           !Selected background color
TST:COUNT_Style        LONG                           !Field style
TST:Percentile         LIKE(TST:Percentile)           !List box control field - type derived from field
TST:Percentile_NormalFG LONG                          !Normal forground color
TST:Percentile_NormalBG LONG                          !Normal background color
TST:Percentile_SelectedFG LONG                        !Selected forground color
TST:Percentile_SelectedBG LONG                        !Selected background color
TST:Percentile_Style   LONG                           !Field style
TST:RANGE              LIKE(TST:RANGE)                !List box control field - type derived from field
TST:RANGE_NormalFG     LONG                           !Normal forground color
TST:RANGE_NormalBG     LONG                           !Normal background color
TST:RANGE_SelectedFG   LONG                           !Selected forground color
TST:RANGE_SelectedBG   LONG                           !Selected background color
TST:RANGE_Style        LONG                           !Field style
TST:TYPE               LIKE(TST:TYPE)                 !List box control field - type derived from field
TST:TYPE_NormalFG      LONG                           !Normal forground color
TST:TYPE_NormalBG      LONG                           !Normal background color
TST:TYPE_SelectedFG    LONG                           !Selected forground color
TST:TYPE_SelectedBG    LONG                           !Selected background color
TST:TYPE_Style         LONG                           !Field style
TST:INVOICE            LIKE(TST:INVOICE)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(LogInPanelTests)
                       PROJECT(LPT:CODE)
                       PROJECT(LPT:TypeDescription)
                       PROJECT(LPT:TestDescription)
                       PROJECT(LPT:TYPE)
                       PROJECT(LPT:Panel)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LPT:CODE               LIKE(LPT:CODE)                 !List box control field - type derived from field
LPT:CODE_NormalFG      LONG                           !Normal forground color
LPT:CODE_NormalBG      LONG                           !Normal background color
LPT:CODE_SelectedFG    LONG                           !Selected forground color
LPT:CODE_SelectedBG    LONG                           !Selected background color
LPT:TypeDescription    LIKE(LPT:TypeDescription)      !List box control field - type derived from field
LPT:TypeDescription_NormalFG LONG                     !Normal forground color
LPT:TypeDescription_NormalBG LONG                     !Normal background color
LPT:TypeDescription_SelectedFG LONG                   !Selected forground color
LPT:TypeDescription_SelectedBG LONG                   !Selected background color
LPT:TestDescription    LIKE(LPT:TestDescription)      !List box control field - type derived from field
LPT:TestDescription_NormalFG LONG                     !Normal forground color
LPT:TestDescription_NormalBG LONG                     !Normal background color
LPT:TestDescription_SelectedFG LONG                   !Selected forground color
LPT:TestDescription_SelectedBG LONG                   !Selected background color
LPT:TYPE               LIKE(LPT:TYPE)                 !List box control field - type derived from field
LPT:TYPE_NormalFG      LONG                           !Normal forground color
LPT:TYPE_NormalBG      LONG                           !Normal background color
LPT:TYPE_SelectedFG    LONG                           !Selected forground color
LPT:TYPE_SelectedBG    LONG                           !Selected background color
LPT:Panel              LIKE(LPT:Panel)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW3::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW3::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW3::PopupChoice    SIGNED                       ! Popup current choice
BRW3::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW3::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,510,340),FONT('Arial',11,,FONT:regular),CURSOR(CURSOR:SizeNWSE),GRAY,MDI,HLP('PatientTests')
                       BUTTON('&Edit View'),AT(424,96,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       STRING(@n3B),AT(2,14,30,11),USE(locSidePanelCountIgE),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Red)
                       STRING(@s20),AT(226,3),USE(Pat:LAST),FONT(,,COLOR:Aqua,FONT:bold,CHARSET:ANSI),LEFT,TRN
                       STRING(@n_6),AT(116,3,42),USE(Pat:INVOICE),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Client:'),AT(325,3),USE(?String4),TRN
                       STRING(@s15),AT(160,3),USE(Pat:FIRST),FONT(,,COLOR:Aqua,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                       STRING(@s40),AT(349,3,149,10),USE(locClientName),FONT(,,COLOR:Aqua,FONT:bold,CHARSET:ANSI), |
  TRN
                       CHECK('Edit / Delete Panels'),AT(382,328,83,13),USE(locEditPanel),FONT(,,,FONT:bold),ICON(ICON:None), |
  HIDE,TRN
                       IMAGE('BUTTON.JPG'),AT(424,96,70,25),USE(?Image2)
                       BUTTON('Add Panel'),AT(122,319,39,21),USE(?AddPanel),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  HIDE
                       IMAGE('BUTTON.JPG'),AT(424,289,70,24),USE(?Image1)
                       BUTTON('&Select'),AT(424,256,70,25),USE(?Select:2),FONT(,,,FONT:bold),LEFT,ICON('WorkPool.png'), |
  MSG('Select the Record'),TIP('Select the Record'),TRN
                       BUTTON('&Insert'),AT(424,128,70,25),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  MSG('Insert a Record'),TIP('Insert a Record'),TRN
                       BUTTON('&Delete'),AT(424,64,70,25),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  MSG('Delete the Record'),TIP('Delete the Record'),TRN
                       LIST,AT(2,26,109,307),USE(?List),FONT(,8),FORMAT('28L(2)|M*~CODE~@s7@16L(2)|M*~Type~C(0' & |
  ')@s4@120L(2)|M*~Test Description~@s30@12R(2)|M*~TYPE~L@n3@'),FROM(Queue:Browse),IMM,MSG('Browsing Records')
                       BUTTON('Button 8'),AT(294,324,52,16),USE(?Button8),HIDE
                       STRING('Patient Tests'),AT(20,2),USE(?String6),FONT(,16,COLOR:Aqua,FONT:bold,CHARSET:ANSI), |
  TRN
                       BUTTON('Done'),AT(424,289,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       BUTTON('&Help'),AT(148,324,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@n3B),AT(66,14,30,11),USE(locSidePanelCountIgG),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Blue)
                       STRING(@n3B),AT(34,14,30,11),USE(locSidePanelCountIgG4),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Yellow)
                       LIST,AT(116,16,280,300),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,FORMAT('28C(2)|M*Y~St' & |
  'atus~L(2)@s1@40L(2)|M*Y~Code~@s9@107L(2)|M*Y~Description~@s40@27C(2)|M*Y~Type~C(0)@s' & |
  '5@25C|M*Y~Score~@s3@32R(2)|M*Y~Conc~C(3)@n8.2@16R(2)|M*Y~%~C(1)@n3@36L(3)|M*Y@s9@1R|M*Y@n1@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the Test file'),TRN
                       PANEL,AT(116,16,264,301),USE(?Panel1)
                       STRING(@pIgE  <<#p),AT(424,25,50,12),USE(locCounts[1]),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT(2),COLOR(COLOR:Red)
                       STRING(@n3b),AT(474,25,33,12),USE(locIgECountDiscreet),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Red)
                       STRING(@p IgG4 <<# p),AT(424,35,50,12),USE(locCounts[3],,?locCounts_3:2),FONT(,14,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),RIGHT,COLOR(COLOR:Yellow)
                       STRING(@n3b),AT(474,35,33,12),USE(locIgG4CountDiscreet),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Yellow)
                       STRING(@p  IgG   <<# p),AT(424,49,50,12),USE(locCounts[2]),FONT(,14,COLOR:White,FONT:bold, |
  CHARSET:ANSI),RIGHT,COLOR(COLOR:Blue)
                       STRING(@n3b),AT(474,49,33,12),USE(locIgGCountDiscreet),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Blue)
                       BUTTON('Sendouts'),AT(424,192,70,25),USE(?SendoutButton),FONT(,,,FONT:bold),LEFT,ICON('SteelCircl' & |
  'eArrow.ico'),HIDE,TRN
                       BUTTON('Break Panel'),AT(424,224,70,25),USE(?BUTTONBreakPanel),FONT(,,,FONT:bold),LEFT,ICON('WorkPool.png'), |
  TRN
                       CHECK('Allow Edit/Delete'),AT(424,88),USE(locOverride),FONT(,,,FONT:regular),HIDE,TRN,VALUE('1', |
  '0')
                       BUTTON('Add Multiple'),AT(424,160,70,25),USE(?ButtonMultiAdd),FONT(,,,FONT:bold),LEFT,ICON('WIZINS.ICO'), |
  TRN
                       IMAGE('button.jpg'),AT(424,160,70,25),USE(?IMAGE3)
                       IMAGE('button.jpg'),AT(424,64,70,25),USE(?IMAGE4)
                       IMAGE('button.jpg'),AT(424,128,70,25),USE(?IMAGE5)
                       STRING(@n1),AT(474,13,33,12),USE(locTotal),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI),RIGHT(5), |
  COLOR(COLOR:Red)
                       STRING('Total IgE'),AT(424,13,50,12),USE(locCounts[1],,?locCounts_1:2),FONT(,14,COLOR:White, |
  FONT:bold,CHARSET:ANSI),RIGHT(2),COLOR(COLOR:Red)
                       BUTTON('ZeroTests'),AT(436,316),USE(?BUTTONClear),HIDE
                     END

BRW3::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW3::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW3                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
ResetFromView          PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW3::Sort0:Locator  StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

PanelQ               QUEUE,PRE(PNLQ)
Number               STRING(9)                             !
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
CheckPanel ROUTINE
      LP:PanelNumber = TST:CODE
      GET(LogInPanels,LP:OrderKey)
      IF ~ERRORCODE() THEN EXIT.
      LP:PanelNumber = TST:CODE
      ADD(LogInPanels)
      CLEAR(PT:Record)
      PT:PANEL = LP:PanelNumber
      SET(PT:ORDER_KEY,PT:ORDER_KEY)
      LOOP
        NEXT(Pnl_Test)
        IF PT:PANEL <> LP:PanelNumber OR ERRORCODE() THEN BREAK.
        LPT:Panel = PT:PANEL
        LPT:CODE = PT:CODE
        LPT:TYPE = PT:TYPE
        LPT:TypeDescription = gloTypeDescription[LPT:TYPE]
        RST:NUMBER = PT:CODE
        GET(Rast,RST:ORDER_KEY)
        IF ERRORCODE()
          LPT:TestDescription = 'RAST ' & TST:Code & ' ' & ERROR()
        ELSE
          LPT:TestDescription = RST:DESCRIPTION
        .
        IF INRANGE(LPT:TYPE,1,3)
          IF SUB(LPT:CODE,1,3) = '100' THEN locNeedDOB = TRUE.
        .
        ADD(LogInPanelTests)
      .    
      IF  INRANGE(TST:CODE,'260','270') THEN UNHIDE(?SendoutButton).   
    

BreakPanel    ROUTINE
 
  TST:Status = 'X'
  PUT(Test)
  LOOP
    CLEAR(TST:Record)
    GET(PanelQ,1)
    SAV:Panel = PNLQ:Number
    CLEAR(PT:Record)
    PT:PANEL  = PNLQ:Number
    SET(PT:ORDER_KEY,PT:ORDER_KEY)
    IF ERRORCODE() THEN STOP('PT SET: ' & ERROR()).
    LOOP UNTIL EOF(PNL_TEST)
      NEXT(PNL_TEST)
      IF PT:PANEL <> SAV:Panel OR ERRORCODE() THEN BREAK.
      IF ~PT:Type 
        PNLQ:Number = PT:Code
        ADD(PanelQ)
        CYCLE
      .
      TST:Type = PT:Type
      TST:Code = PT:Code
      TST:INVOICE = PAT:INVOICE
      TST:Status = 'L'
      ADD(Test)
      IF ERRORCODE() THEN STOP('TST ADD: ' & ERROR()).
    .
    TST:Invoice = PAT:INVOICE
    TST:Code = PNLQ:Number
    TST:Type = 0
    GET(Test,TST:Order_Key)
    DELETE(PanelQ)
    IF RECORDS(PanelQ) < 1 THEN BREAK.
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)
  .





ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  locPatient = prmPatient
  DISPLAY(?Pat:INVOICE)
  GlobalErrors.SetProcedureName('PatientTests')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Change:4
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locTestType',locTestType)                 ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Cli_panl.Open                            ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:LogInPanelTests.Open                     ! File LogInPanelTests used by this procedure, so make sure it's RelationManager is open
  Relate:LogInPanels.Open                         ! File LogInPanels used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                              ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                ! File Test used by this procedure, so make sure it's RelationManager is open
  Access:Pnl_test.UseFile                         ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Test,SELF) ! Initialize the browse manager
  BRW3.Init(?List,Queue:Browse.ViewPosition,BRW3::View:Browse,Queue:Browse,Relate:LogInPanelTests,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?List{Prop:LineHeight} = 6
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon TST:TYPE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,TST:ORDER_KEY) ! Add the sort order for TST:ORDER_KEY for sort order 1
  BRW1.AddRange(TST:INVOICE,locPatient)           ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,TST:TYPE,,BRW1)       ! Initialize the browse locator using  using key: TST:ORDER_KEY , TST:TYPE
  BRW1.AppendOrder('+TST:ORDER')                  ! Append an additional sort order
  BRW1.AddField(TST:STATUS,BRW1.Q.TST:STATUS)     ! Field TST:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(TST:CODE,BRW1.Q.TST:CODE)         ! Field TST:CODE is a hot field or requires assignment from browse
  BRW1.AddField(RST:DESCRIPTION,BRW1.Q.RST:DESCRIPTION) ! Field RST:DESCRIPTION is a hot field or requires assignment from browse
  BRW1.AddField(locTestType,BRW1.Q.locTestType)   ! Field locTestType is a hot field or requires assignment from browse
  BRW1.AddField(TST:Score,BRW1.Q.TST:Score)       ! Field TST:Score is a hot field or requires assignment from browse
  BRW1.AddField(TST:COUNT,BRW1.Q.TST:COUNT)       ! Field TST:COUNT is a hot field or requires assignment from browse
  BRW1.AddField(TST:Percentile,BRW1.Q.TST:Percentile) ! Field TST:Percentile is a hot field or requires assignment from browse
  BRW1.AddField(TST:RANGE,BRW1.Q.TST:RANGE)       ! Field TST:RANGE is a hot field or requires assignment from browse
  BRW1.AddField(TST:TYPE,BRW1.Q.TST:TYPE)         ! Field TST:TYPE is a hot field or requires assignment from browse
  BRW1.AddField(TST:INVOICE,BRW1.Q.TST:INVOICE)   ! Field TST:INVOICE is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse
  BRW3.AddSortOrder(,LPT:OrderKey)                ! Add the sort order for LPT:OrderKey for sort order 1
  BRW3.AddRange(LPT:Panel,locPanel)               ! Add single value range limit for sort order 1
  BRW3.AddLocator(BRW3::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW3::Sort0:Locator.Init(,LPT:TYPE,1,BRW3)      ! Initialize the browse locator using  using key: LPT:OrderKey , LPT:TYPE
  BRW3.AddField(LPT:CODE,BRW3.Q.LPT:CODE)         ! Field LPT:CODE is a hot field or requires assignment from browse
  BRW3.AddField(LPT:TypeDescription,BRW3.Q.LPT:TypeDescription) ! Field LPT:TypeDescription is a hot field or requires assignment from browse
  BRW3.AddField(LPT:TestDescription,BRW3.Q.LPT:TestDescription) ! Field LPT:TestDescription is a hot field or requires assignment from browse
  BRW3.AddField(LPT:TYPE,BRW3.Q.LPT:TYPE)         ! Field LPT:TYPE is a hot field or requires assignment from browse
  BRW3.AddField(LPT:Panel,BRW3.Q.LPT:Panel)       ! Field LPT:Panel is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW3.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW3.ToolbarItem.HelpButton = ?Help
  BRW3::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW3::FormatManager.Init('Alis8','PatientTests',1,?List,3,BRW3::PopupTextExt,Queue:Browse,20,LFM_CFile,LFM_CFile.Record)
  BRW3::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  DISPLAY(?Pat:INVOICE)
  CLEAR(MON:Count[])
  CLOSE(LogInPanels)
  CREATE(LogInPanels)
  IF ERRORCODE() THEN STOP('CREATE LP: ' & ERROR()).
  SHARE(LogInPanels)
  CLOSE(LogInPanelTests)
  CREATE(LogInPanelTests)
  IF ERRORCODE() THEN STOP('CREATE LPT: ' & ERROR()).
  SHARE(LogInPanelTests)
  IF ERRORCODE() THEN STOP('OPEN LPT: ' & ERROR()).
  MON:Count[1] = 0
  MON:Count[2] = 0
  MON:Count[3] = 0
  locTotal = 0
  SHARE(Test)
  
  CLEAR(TST:Record)
  TST:INVOICE = PAT:INVOICE
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  IF ERRORCODE() THEN STOP('TST SET: ' & ERROR()).
  LOOP
    NEXT(Test)
    IF TST:INVOICE <> PAT:INVOICE OR ERRORCODE() THEN BREAK.
    IF gloTestCodeStartsWith1 = 'S' 
      SO:Patient = TST:INVOICE
      SO:Date = Pat:DATE
      ADD(SendOuts)
      CYCLE
    .
    IF TST:code = '260' OR TST:code = '270'   
      SO:Patient = TST:INVOICE
      SO:Date = Pat:DATE
      ADD(SendOuts)
    .  
    IF INRANGE(TST:Type,1,6)
      IF SUB(TST:CODE,1,3) = '100'
        locTotal = 1
      ELSE
        MON:Count[TST:Type] += 1
      .
      LPT:Panel = '000000000'
      LPT:CODE = PT:CODE
      LPT:TYPE = PT:TYPE
      RST:NUMBER = TST:CODE
      GET(Rast,RST:ORDER_KEY)
      IF ERRORCODE()
        LPT:TestDescription = 'RAST ' & TST:Code & ' ' & ERROR()
      ELSE
        LPT:TestDescription = RST:DESCRIPTION
      .
      ADD(LogInPanelTests)
      IF TST:CODE = '100-1' THEN locNeedDOB = TRUE; CYCLE.
      IF TST:CODE = '100-5' THEN locNeedDOB = TRUE; CYCLE.
    ELSE
      IF TST:Type = 0 
        DO CheckPanel
        CYCLE
      .
    .
  .
     IF PAT:Status = 'L' OR PAT:Status = 'V'
       locCounts[TYPE:IgG4] = locIgG4CountDiscreet + locPanelTest[TYPE:IgG4]
       locCounts[TYPE:IgG]  = locIgGCountDiscreet  + locPanelTest[TYPE:IgG] 
       locCounts[TYPE:IgE]  = locIgECountDiscreet  + locPanelTest[TYPE:IgE] 
     ELSE
       locCounts[TYPE:IgG4] = locIgG4CountDiscreet 
       locCounts[TYPE:IgG]  = locIgGCountDiscreet 
       locCounts[TYPE:IgE]  = locIgECountDiscreet 
       locIgG4CountDiscreet = 0
       locIgGCountDiscreet = 0
       locIgECountDiscreet = 0
     .
   
     locIgGCountDiscreet  = MON:Count[TYPE:IgG] 
     locIgG4CountDiscreet = MON:Count[TYPE:IgG4]
     locIgECountDiscreet  = MON:Count[TYPE:IgE]
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
  BRW3::AutoSizeColumn.Init()
  BRW3::AutoSizeColumn.AddListBox(?List,Queue:Browse)
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
    Relate:LogInPanelTests.Close
    Relate:LogInPanels.Close
    Relate:Panels.Close
    Relate:Patient.Close
    Relate:Rast.Close
    Relate:Test.Close
  END
  ! List Format Manager destructor
  BRW3::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  BRW3::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
    IF ~TST:Type  AND TST:STATUS = 'X' AND ~locOverRide
      GlobalRequest = Request
      P# = PanelTestTable(TST:Code)
      ReturnValue = GlobalResponse
      RETURN ReturnValue
    .
    locEditPanel = FALSE
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateTest
    ReturnValue = GlobalResponse
  END
   SELECT(?Change:4)
   PRESSKEY(TabKey)
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
    OF ?SendoutButton
      SO:Patient = Pat:Invoice
    OF ?BUTTONBreakPanel
       BRW1.UpdateBuffer
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?locEditPanel
      SELECT(?)
    OF ?AddPanel
      ThisWindow.Update
      GlobalRequest = SelectRecord
      ClientPanels
      IF GlobalResponse = RequestCompleted
        TST:INVOICE = PAT:Invoice
        TST:CODE = CP:Panel
        TST:TYPE = 0
        TST:STATUS = 'L'
        ADD(Test)
        SELECT(?Browse:1)
        PRESSKEY(CtrlPgUp)
      .
    OF ?Insert:4
      ThisWindow.Update
      !   GlobalRequest = InsertRecord
      !    UpdateTest
      SELECT(?Change:4)
    OF ?Button8
      ThisWindow.Update
      LoginReview()
      ThisWindow.Reset
    OF ?SendoutButton
      ThisWindow.Update
      UpdateSendout()
      ThisWindow.Reset
      BRW3.ResetQueue(1)
      BRW3.PostNewSelection
    OF ?BUTTONBreakPanel
      ThisWindow.Update
      ThisWindow.Update
       IF TST:STATUS = 'L'
         PNLQ:Number = TST:Code
         ADD(PanelQ)
         DO BreakPanel    
         BRW1.ResetQueue(1)
       .
    OF ?ButtonMultiAdd
      ThisWindow.Update
      gloAddOn = 2
      gloPatient = Pat:Invoice
      START(LoginMain,25000)
      POST(EVENT:Closewindow)
    OF ?BUTTONClear
      ThisWindow.Update
      CLEAR(TST:Record)
      TST:INVOICE = PAT:INVOICE
      SET(TST:ORDER_KEY,TST:ORDER_KEY)
      IF ERRORCODE() THEN STOP('TST SET: ' & ERROR()).
      LOOP
        NEXT(Test)
        IF TST:INVOICE <> PAT:INVOICE OR ERRORCODE() THEN BREAK.
        TST:Score = '0'
        TST:COUNT = 0
        TST:STATUS = 'C'
        PUT(Test)
      .  
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
  IF BRW3::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
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
    CASE EVENT()
    OF EVENT:GainFocus
      SELECT(?Change:4)
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      SELECT(?Change:4)
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
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END


BRW1.ResetFromView PROCEDURE

TST:CODE:Cnt         LONG                                  ! Count variable for browse totals
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
    TST:CODE:Cnt += 1
  END
  SELF.View{PROP:IPRequestCount} = 0
  TST:CODE = TST:CODE:Cnt
  PARENT.ResetFromView
  Relate:Test.SetQuickScan(0)
  SETCURSOR()


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (TST:Status = 'L')
    SELF.Q.TST:STATUS_NormalFG = -1                        ! Set conditional color values for TST:STATUS
    SELF.Q.TST:STATUS_NormalBG = 12582911
    SELF.Q.TST:STATUS_SelectedFG = -1
    SELF.Q.TST:STATUS_SelectedBG = -1
    SELF.Q.TST:CODE_NormalFG = -1                          ! Set conditional color values for TST:CODE
    SELF.Q.TST:CODE_NormalBG = 12582911
    SELF.Q.TST:CODE_SelectedFG = -1
    SELF.Q.TST:CODE_SelectedBG = -1
    SELF.Q.RST:DESCRIPTION_NormalFG = -1                   ! Set conditional color values for RST:DESCRIPTION
    SELF.Q.RST:DESCRIPTION_NormalBG = 12582911
    SELF.Q.RST:DESCRIPTION_SelectedFG = -1
    SELF.Q.RST:DESCRIPTION_SelectedBG = -1
    SELF.Q.locTestType_NormalFG = -1                       ! Set conditional color values for locTestType
    SELF.Q.locTestType_NormalBG = 12582911
    SELF.Q.locTestType_SelectedFG = -1
    SELF.Q.locTestType_SelectedBG = -1
    SELF.Q.TST:Score_NormalFG = -1                         ! Set conditional color values for TST:Score
    SELF.Q.TST:Score_NormalBG = 12582911
    SELF.Q.TST:Score_SelectedFG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_NormalFG = -1                         ! Set conditional color values for TST:COUNT
    SELF.Q.TST:COUNT_NormalBG = 12582911
    SELF.Q.TST:COUNT_SelectedFG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
    SELF.Q.TST:Percentile_NormalFG = -1                    ! Set conditional color values for TST:Percentile
    SELF.Q.TST:Percentile_NormalBG = 12582911
    SELF.Q.TST:Percentile_SelectedFG = -1
    SELF.Q.TST:Percentile_SelectedBG = -1
    SELF.Q.TST:RANGE_NormalFG = -1                         ! Set conditional color values for TST:RANGE
    SELF.Q.TST:RANGE_NormalBG = 12582911
    SELF.Q.TST:RANGE_SelectedFG = -1
    SELF.Q.TST:RANGE_SelectedBG = -1
    SELF.Q.TST:TYPE_NormalFG = -1                          ! Set conditional color values for TST:TYPE
    SELF.Q.TST:TYPE_NormalBG = 12582911
    SELF.Q.TST:TYPE_SelectedFG = -1
    SELF.Q.TST:TYPE_SelectedBG = -1
  ELSIF (TST:Status = 'X')
    SELF.Q.TST:STATUS_NormalFG = 16777215                  ! Set conditional color values for TST:STATUS
    SELF.Q.TST:STATUS_NormalBG = -1
    SELF.Q.TST:STATUS_SelectedFG = -1
    SELF.Q.TST:STATUS_SelectedBG = -1
    SELF.Q.TST:CODE_NormalFG = 16777215                    ! Set conditional color values for TST:CODE
    SELF.Q.TST:CODE_NormalBG = -1
    SELF.Q.TST:CODE_SelectedFG = -1
    SELF.Q.TST:CODE_SelectedBG = -1
    SELF.Q.RST:DESCRIPTION_NormalFG = 16777215             ! Set conditional color values for RST:DESCRIPTION
    SELF.Q.RST:DESCRIPTION_NormalBG = -1
    SELF.Q.RST:DESCRIPTION_SelectedFG = -1
    SELF.Q.RST:DESCRIPTION_SelectedBG = -1
    SELF.Q.locTestType_NormalFG = 16777215                 ! Set conditional color values for locTestType
    SELF.Q.locTestType_NormalBG = -1
    SELF.Q.locTestType_SelectedFG = -1
    SELF.Q.locTestType_SelectedBG = -1
    SELF.Q.TST:Score_NormalFG = 16777215                   ! Set conditional color values for TST:Score
    SELF.Q.TST:Score_NormalBG = -1
    SELF.Q.TST:Score_SelectedFG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_NormalFG = 16777215                   ! Set conditional color values for TST:COUNT
    SELF.Q.TST:COUNT_NormalBG = -1
    SELF.Q.TST:COUNT_SelectedFG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
    SELF.Q.TST:Percentile_NormalFG = 16777215              ! Set conditional color values for TST:Percentile
    SELF.Q.TST:Percentile_NormalBG = -1
    SELF.Q.TST:Percentile_SelectedFG = -1
    SELF.Q.TST:Percentile_SelectedBG = -1
    SELF.Q.TST:RANGE_NormalFG = 16777215                   ! Set conditional color values for TST:RANGE
    SELF.Q.TST:RANGE_NormalBG = -1
    SELF.Q.TST:RANGE_SelectedFG = -1
    SELF.Q.TST:RANGE_SelectedBG = -1
    SELF.Q.TST:TYPE_NormalFG = 16777215                    ! Set conditional color values for TST:TYPE
    SELF.Q.TST:TYPE_NormalBG = -1
    SELF.Q.TST:TYPE_SelectedFG = -1
    SELF.Q.TST:TYPE_SelectedBG = -1
  ELSIF (TST:Status = 'W')
    SELF.Q.TST:STATUS_NormalFG = -1                        ! Set conditional color values for TST:STATUS
    SELF.Q.TST:STATUS_NormalBG = 11206570
    SELF.Q.TST:STATUS_SelectedFG = -1
    SELF.Q.TST:STATUS_SelectedBG = -1
    SELF.Q.TST:CODE_NormalFG = -1                          ! Set conditional color values for TST:CODE
    SELF.Q.TST:CODE_NormalBG = 11206570
    SELF.Q.TST:CODE_SelectedFG = -1
    SELF.Q.TST:CODE_SelectedBG = -1
    SELF.Q.RST:DESCRIPTION_NormalFG = -1                   ! Set conditional color values for RST:DESCRIPTION
    SELF.Q.RST:DESCRIPTION_NormalBG = 11206570
    SELF.Q.RST:DESCRIPTION_SelectedFG = -1
    SELF.Q.RST:DESCRIPTION_SelectedBG = -1
    SELF.Q.locTestType_NormalFG = -1                       ! Set conditional color values for locTestType
    SELF.Q.locTestType_NormalBG = 11206570
    SELF.Q.locTestType_SelectedFG = -1
    SELF.Q.locTestType_SelectedBG = -1
    SELF.Q.TST:Score_NormalFG = -1                         ! Set conditional color values for TST:Score
    SELF.Q.TST:Score_NormalBG = 11206570
    SELF.Q.TST:Score_SelectedFG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_NormalFG = -1                         ! Set conditional color values for TST:COUNT
    SELF.Q.TST:COUNT_NormalBG = 11206570
    SELF.Q.TST:COUNT_SelectedFG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
    SELF.Q.TST:Percentile_NormalFG = -1                    ! Set conditional color values for TST:Percentile
    SELF.Q.TST:Percentile_NormalBG = 11206570
    SELF.Q.TST:Percentile_SelectedFG = -1
    SELF.Q.TST:Percentile_SelectedBG = -1
    SELF.Q.TST:RANGE_NormalFG = -1                         ! Set conditional color values for TST:RANGE
    SELF.Q.TST:RANGE_NormalBG = 11206570
    SELF.Q.TST:RANGE_SelectedFG = -1
    SELF.Q.TST:RANGE_SelectedBG = -1
    SELF.Q.TST:TYPE_NormalFG = -1                          ! Set conditional color values for TST:TYPE
    SELF.Q.TST:TYPE_NormalBG = 11206570
    SELF.Q.TST:TYPE_SelectedFG = -1
    SELF.Q.TST:TYPE_SelectedBG = -1
  ELSIF (TST:Status = 'Q')
    SELF.Q.TST:STATUS_NormalFG = -1                        ! Set conditional color values for TST:STATUS
    SELF.Q.TST:STATUS_NormalBG = 16776960
    SELF.Q.TST:STATUS_SelectedFG = -1
    SELF.Q.TST:STATUS_SelectedBG = -1
    SELF.Q.TST:CODE_NormalFG = -1                          ! Set conditional color values for TST:CODE
    SELF.Q.TST:CODE_NormalBG = 16776960
    SELF.Q.TST:CODE_SelectedFG = -1
    SELF.Q.TST:CODE_SelectedBG = -1
    SELF.Q.RST:DESCRIPTION_NormalFG = -1                   ! Set conditional color values for RST:DESCRIPTION
    SELF.Q.RST:DESCRIPTION_NormalBG = 16776960
    SELF.Q.RST:DESCRIPTION_SelectedFG = -1
    SELF.Q.RST:DESCRIPTION_SelectedBG = -1
    SELF.Q.locTestType_NormalFG = -1                       ! Set conditional color values for locTestType
    SELF.Q.locTestType_NormalBG = 16776960
    SELF.Q.locTestType_SelectedFG = -1
    SELF.Q.locTestType_SelectedBG = -1
    SELF.Q.TST:Score_NormalFG = -1                         ! Set conditional color values for TST:Score
    SELF.Q.TST:Score_NormalBG = 16776960
    SELF.Q.TST:Score_SelectedFG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_NormalFG = -1                         ! Set conditional color values for TST:COUNT
    SELF.Q.TST:COUNT_NormalBG = 16776960
    SELF.Q.TST:COUNT_SelectedFG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
    SELF.Q.TST:Percentile_NormalFG = -1                    ! Set conditional color values for TST:Percentile
    SELF.Q.TST:Percentile_NormalBG = 16776960
    SELF.Q.TST:Percentile_SelectedFG = -1
    SELF.Q.TST:Percentile_SelectedBG = -1
    SELF.Q.TST:RANGE_NormalFG = -1                         ! Set conditional color values for TST:RANGE
    SELF.Q.TST:RANGE_NormalBG = 16776960
    SELF.Q.TST:RANGE_SelectedFG = -1
    SELF.Q.TST:RANGE_SelectedBG = -1
    SELF.Q.TST:TYPE_NormalFG = -1                          ! Set conditional color values for TST:TYPE
    SELF.Q.TST:TYPE_NormalBG = 16776960
    SELF.Q.TST:TYPE_SelectedFG = -1
    SELF.Q.TST:TYPE_SelectedBG = -1
  ELSE
    SELF.Q.TST:STATUS_NormalFG = -1                        ! Set color values for TST:STATUS
    SELF.Q.TST:STATUS_NormalBG = -1
    SELF.Q.TST:STATUS_SelectedFG = -1
    SELF.Q.TST:STATUS_SelectedBG = -1
    SELF.Q.TST:CODE_NormalFG = -1                          ! Set color values for TST:CODE
    SELF.Q.TST:CODE_NormalBG = -1
    SELF.Q.TST:CODE_SelectedFG = -1
    SELF.Q.TST:CODE_SelectedBG = -1
    SELF.Q.RST:DESCRIPTION_NormalFG = -1                   ! Set color values for RST:DESCRIPTION
    SELF.Q.RST:DESCRIPTION_NormalBG = -1
    SELF.Q.RST:DESCRIPTION_SelectedFG = -1
    SELF.Q.RST:DESCRIPTION_SelectedBG = -1
    SELF.Q.locTestType_NormalFG = -1                       ! Set color values for locTestType
    SELF.Q.locTestType_NormalBG = -1
    SELF.Q.locTestType_SelectedFG = -1
    SELF.Q.locTestType_SelectedBG = -1
    SELF.Q.TST:Score_NormalFG = -1                         ! Set color values for TST:Score
    SELF.Q.TST:Score_NormalBG = -1
    SELF.Q.TST:Score_SelectedFG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_NormalFG = -1                         ! Set color values for TST:COUNT
    SELF.Q.TST:COUNT_NormalBG = -1
    SELF.Q.TST:COUNT_SelectedFG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
    SELF.Q.TST:Percentile_NormalFG = -1                    ! Set color values for TST:Percentile
    SELF.Q.TST:Percentile_NormalBG = -1
    SELF.Q.TST:Percentile_SelectedFG = -1
    SELF.Q.TST:Percentile_SelectedBG = -1
    SELF.Q.TST:RANGE_NormalFG = -1                         ! Set color values for TST:RANGE
    SELF.Q.TST:RANGE_NormalBG = -1
    SELF.Q.TST:RANGE_SelectedFG = -1
    SELF.Q.TST:RANGE_SelectedBG = -1
    SELF.Q.TST:TYPE_NormalFG = -1                          ! Set color values for TST:TYPE
    SELF.Q.TST:TYPE_NormalBG = -1
    SELF.Q.TST:TYPE_SelectedFG = -1
    SELF.Q.TST:TYPE_SelectedBG = -1
  END
  SELF.Q.TST:STATUS_Style = 1 ! 
  SELF.Q.TST:CODE_Style = 1 ! 
  SELF.Q.RST:DESCRIPTION_Style = 1 ! 
  SELF.Q.locTestType_Style = 1 ! 
  SELF.Q.TST:Score_Style = 1 ! 
  SELF.Q.TST:COUNT_Style = 1 ! 
  SELF.Q.TST:Percentile_Style = 1 ! 
  SELF.Q.TST:RANGE_Style = 1 ! 
  SELF.Q.TST:TYPE_Style = 1 ! 
  IF TST:STATUS = 'C'
    IF TST:Score = '0'
      SELF.Q.TST:Score_NormalBG = -1
      SELF.Q.TST:COUNT_NormalBG = -1
    ELSIF TST:Score = '0/1'
      SELF.Q.TST:Score_NormalBG = 0D2FFD2H
      SELF.Q.TST:COUNT_NormalBG = 0D2FFD2H
    ELSE
      SELF.Q.TST:Score_NormalBG = 080FFFFH
      SELF.Q.TST:COUNT_NormalBG = 080FFFFH
    .
    IF SUB(TST:CODE,1,3) = '100' THEN locTotalIgE = 3.
  ELSE
    SELF.Q.TST:Score_NormalBG = -1
    SELF.Q.TST:COUNT_NormalBG = -1
    SELF.Q.TST:Score_SelectedBG = -1
    SELF.Q.TST:COUNT_SelectedBG = -1
  .
  IF INRANGE(TST:TYPE,1,3) AND TST:STATUS <> 'X'
    SELF.Q.locTestType_NormalBG = gloTypeBGColor[TST:TYPE]
    SELF.Q.locTestType_NormalFG = gloTypeFGColor[TST:TYPE]
  .
  


BRW1.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeKey()
  ! if ~tst:type and keycode() = MouseLeft then stop('1-' & tst:code).
  ! setkeycode(0)
  RETURN ReturnValue


BRW1.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  IF  FIELD() = ?Browse:1 ! AND KEYCODE() = MouseLeft    EVENT() = EVENT:Mouseup AND
    GET(Queue:Browse:1,CHOICE(?Browse:1))
    
    IF TST:TYPE = 0 
      locPanelStatus = TST:Status
      locPanel = TST:CODE
      BRW3.ResetQueue(1)
      BRW3.PostNewSelection
      UNHIDE(?locOverRide)
      UNHIDE(?List)
      IF TST:STATUS = 'L'
        UNHIDE(?BUTTONBreakPanel)
      ELSE
        HIDE(?BUTTONBreakPanel)  
      .
    ELSE
      HIDE(?locOverRide)
      HIDE(?List)
      HIDE(?BUTTONBreakPanel)  
      locSidePanelCountIgG4 = 0
      locSidePanelCountIgG = 0
      locSidePanelCountIgE = 0
    .
  .
  


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  locTestType = ''
  IF gloTestCodeStartsWith3 = '260' THEN UNHIDE(?SendoutButton).
  IF gloTestCodeStartsWith3 = '270' THEN UNHIDE(?SendoutButton).
  IF gloTestCodeStartsWith1 = 'S' THEN UNHIDE(?SendoutButton).
    RST:NUMBER = TST:Code
    GET(Rast,RST:Order_Key)
    IF INRANGE(TST:TYPE,1,8)
      RST:NUMBER = TST:CODE
      GET(Rast,RST:ORDER_KEY)
      IF INRANGE(TST:TYPE,1,3)
        locTestType = gloTypeDescription[TST:Type]
      ELSIF  gloTestCodeStartsWith1 = 'S' AND INRANGE(TST:CODE[4:4],'4','6')
        locTestType = locSType[VAL(TST:CODE[4:4]) - 51]
      ELSE !gloTestCodeStartsWith2 = 'S1'
        locTestType = gloTypeDescription[TST:Type]
      .
    ELSIF TST:TYPE = 0
     locTestType = ''
     Pan:NUMBER =  TST:CODE
     GET(Panels,Pan:ORDER_KEY)
     IF ERRORCODE()
       RST:DESCRIPTION = 'Not Found'
     ELSE
       RST:DESCRIPTION = Pan:DESCRIPTION
     .
    .  
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW3.ResetFromView PROCEDURE

locSidePanelCountIgE:Cnt LONG                              ! Count variable for browse totals
locSidePanelCountIgG:Cnt LONG                              ! Count variable for browse totals
locSidePanelCountIgG4:Cnt LONG                             ! Count variable for browse totals
  CODE
  SETCURSOR(Cursor:Wait)
  Relate:LogInPanelTests.SetQuickScan(1)
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
    IF LPT:TYPE = 1 AND SUB(LPT:CODE,1,3) = '100' THEN  locSidePanelCountIgE:Cnt -= 1.
    IF (LPT:Type = 1)
      locSidePanelCountIgE:Cnt += 1
    END
    IF (LPT:Type = 2  )
      locSidePanelCountIgG:Cnt += 1
    END
    IF (LPT:TYPE= 3 )
      locSidePanelCountIgG4:Cnt += 1
    END
  END
  SELF.View{PROP:IPRequestCount} = 0
  locSidePanelCountIgE = locSidePanelCountIgE:Cnt
  locSidePanelCountIgG = locSidePanelCountIgG:Cnt
  locSidePanelCountIgG4 = locSidePanelCountIgG4:Cnt
  PARENT.ResetFromView
  Relate:LogInPanelTests.SetQuickScan(0)
  SETCURSOR()


BRW3.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (LPT:Type = 1)
    SELF.Q.LPT:CODE_NormalFG = 16777215                    ! Set conditional color values for LPT:CODE
    SELF.Q.LPT:CODE_NormalBG = 255
    SELF.Q.LPT:CODE_SelectedFG = 255
    SELF.Q.LPT:CODE_SelectedBG = 16777215
    SELF.Q.LPT:TypeDescription_NormalFG = 16777215         ! Set conditional color values for LPT:TypeDescription
    SELF.Q.LPT:TypeDescription_NormalBG = 255
    SELF.Q.LPT:TypeDescription_SelectedFG = 255
    SELF.Q.LPT:TypeDescription_SelectedBG = 16777215
    SELF.Q.LPT:TestDescription_NormalFG = 16777215         ! Set conditional color values for LPT:TestDescription
    SELF.Q.LPT:TestDescription_NormalBG = 255
    SELF.Q.LPT:TestDescription_SelectedFG = 255
    SELF.Q.LPT:TestDescription_SelectedBG = 16777215
    SELF.Q.LPT:TYPE_NormalFG = 16777215                    ! Set conditional color values for LPT:TYPE
    SELF.Q.LPT:TYPE_NormalBG = 255
    SELF.Q.LPT:TYPE_SelectedFG = 255
    SELF.Q.LPT:TYPE_SelectedBG = 16777215
  ELSIF (LPT:Type = 2)
    SELF.Q.LPT:CODE_NormalFG = 0                           ! Set conditional color values for LPT:CODE
    SELF.Q.LPT:CODE_NormalBG = 65535
    SELF.Q.LPT:CODE_SelectedFG = 65535
    SELF.Q.LPT:CODE_SelectedBG = 0
    SELF.Q.LPT:TypeDescription_NormalFG = 0                ! Set conditional color values for LPT:TypeDescription
    SELF.Q.LPT:TypeDescription_NormalBG = 65535
    SELF.Q.LPT:TypeDescription_SelectedFG = 65535
    SELF.Q.LPT:TypeDescription_SelectedBG = 0
    SELF.Q.LPT:TestDescription_NormalFG = 0                ! Set conditional color values for LPT:TestDescription
    SELF.Q.LPT:TestDescription_NormalBG = 65535
    SELF.Q.LPT:TestDescription_SelectedFG = 65535
    SELF.Q.LPT:TestDescription_SelectedBG = 0
    SELF.Q.LPT:TYPE_NormalFG = 0                           ! Set conditional color values for LPT:TYPE
    SELF.Q.LPT:TYPE_NormalBG = 65535
    SELF.Q.LPT:TYPE_SelectedFG = 65535
    SELF.Q.LPT:TYPE_SelectedBG = 0
  ELSIF (LPT:Type = 3)
    SELF.Q.LPT:CODE_NormalFG = 16777215                    ! Set conditional color values for LPT:CODE
    SELF.Q.LPT:CODE_NormalBG = 16711680
    SELF.Q.LPT:CODE_SelectedFG = 16711680
    SELF.Q.LPT:CODE_SelectedBG = 16777215
    SELF.Q.LPT:TypeDescription_NormalFG = 16777215         ! Set conditional color values for LPT:TypeDescription
    SELF.Q.LPT:TypeDescription_NormalBG = 16711680
    SELF.Q.LPT:TypeDescription_SelectedFG = 16711680
    SELF.Q.LPT:TypeDescription_SelectedBG = 16777215
    SELF.Q.LPT:TestDescription_NormalFG = 16777215         ! Set conditional color values for LPT:TestDescription
    SELF.Q.LPT:TestDescription_NormalBG = 16711680
    SELF.Q.LPT:TestDescription_SelectedFG = 16711680
    SELF.Q.LPT:TestDescription_SelectedBG = 16777215
    SELF.Q.LPT:TYPE_NormalFG = 16777215                    ! Set conditional color values for LPT:TYPE
    SELF.Q.LPT:TYPE_NormalBG = 16711680
    SELF.Q.LPT:TYPE_SelectedFG = 16711680
    SELF.Q.LPT:TYPE_SelectedBG = 16777215
  ELSE
    SELF.Q.LPT:CODE_NormalFG = -1                          ! Set color values for LPT:CODE
    SELF.Q.LPT:CODE_NormalBG = -1
    SELF.Q.LPT:CODE_SelectedFG = -1
    SELF.Q.LPT:CODE_SelectedBG = -1
    SELF.Q.LPT:TypeDescription_NormalFG = -1               ! Set color values for LPT:TypeDescription
    SELF.Q.LPT:TypeDescription_NormalBG = -1
    SELF.Q.LPT:TypeDescription_SelectedFG = -1
    SELF.Q.LPT:TypeDescription_SelectedBG = -1
    SELF.Q.LPT:TestDescription_NormalFG = -1               ! Set color values for LPT:TestDescription
    SELF.Q.LPT:TestDescription_NormalBG = -1
    SELF.Q.LPT:TestDescription_SelectedFG = -1
    SELF.Q.LPT:TestDescription_SelectedBG = -1
    SELF.Q.LPT:TYPE_NormalFG = -1                          ! Set color values for LPT:TYPE
    SELF.Q.LPT:TYPE_NormalBG = -1
    SELF.Q.LPT:TYPE_SelectedFG = -1
    SELF.Q.LPT:TYPE_SelectedBG = -1
  END


BRW3.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW3::LastSortOrder <> NewOrder THEN
     BRW3::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW3::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW3.TakeNewSelection PROCEDURE

  CODE
  IF BRW3::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW3::PopupTextExt = ''
        BRW3::PopupChoiceExec = True
        BRW3::FormatManager.MakePopup(BRW3::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW3::PopupTextExt = '|-|' & CLIP(BRW3::PopupTextExt)
        END
        BRW3::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW3::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW3::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW3::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW3::PopupChoiceOn AND BRW3::PopupChoiceExec THEN
     BRW3::PopupChoiceExec = False
     BRW3::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW3::PopupTextExt)
     IF BRW3::FormatManager.DispatchChoice(BRW3::PopupChoice)
     ELSE
     END
  END


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

