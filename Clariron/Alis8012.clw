

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8012.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8011.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Test
!!! </summary>
UpdateTest PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
locTestDescription   STRING(40)                            !
locMessage           STRING(32)                            !
locClientName        STRING(40)                            !
EnhancedFocusManager EnhancedFocusClassType
History::TST:Record  LIKE(TST:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,510,340),FONT('Arial',11,,FONT:regular),GRAY,MDI,HLP('UpdateTest')
                       ENTRY(@s9),AT(172,52,40,10),USE(TST:CODE),UPR
                       ENTRY(@S3),AT(172,66,40,10),USE(TST:Score),RIGHT(2)
                       ENTRY(@s9),AT(172,80,40,10),USE(TST:RANGE)
                       ENTRY(@n-13.2),AT(173,96,39,10),USE(TST:COUNT),DECIMAL(12)
                       PANEL,AT(6,128,400,29),USE(?Panel3),BEVEL(-1,-1)
                       OPTION('Type'),AT(14,132,392,18),USE(TST:TYPE),FONT(,,,FONT:bold)
                         RADIO('IgE'),AT(38,138,36,11),USE(?TST:TYPE:Radio1),COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('1')
                         RADIO('IgG'),AT(77,138,36,11),USE(?TST:TYPE:Radio2),COLOR(COLOR:Yellow),ICON(ICON:None),TRN, |
  VALUE('2')
                         RADIO('IgG4'),AT(116,138,36,11),USE(?TST:TYPE:Radio3),COLOR(COLOR:Blue),ICON(ICON:None),TRN, |
  VALUE('3')
                         RADIO('TIgG'),AT(155,138,36,11),USE(?TST:TYPE:Radio4),ICON(ICON:None),TRN,VALUE('4')
                         RADIO('TIgA'),AT(194,138,36,11),USE(?TST:TYPE:Radio5),ICON(ICON:None),TRN,VALUE('5')
                         RADIO('TIgM'),AT(233,139,36,11),USE(?TST:TYPE:Radio6),ICON(ICON:None),TRN,VALUE('6')
                         RADIO('Panel'),AT(350,139,36,11),USE(?TST:TYPE:Radio0),ICON(ICON:None),TRN,VALUE('0')
                         RADIO('IVG'),AT(272,139,36,11),USE(?TST:TYPE:Radio7),ICON(ICON:None),TRN,VALUE('7')
                         RADIO('IVM'),AT(311,139,36,11),USE(?TST:TYPE:Radio8),ICON(ICON:None),TRN,VALUE('8')
                       END
                       OPTION('Status'),AT(80,206,286,38),USE(TST:STATUS,,?TST:STATUS:2),FONT(,,,FONT:bold)
                         RADIO('Login'),AT(84,214,62,11),USE(?TST:STATUS:Radio1),COLOR(COLOR:Yellow),ICON(ICON:None), |
  TRN,VALUE('L')
                         RADIO('Workpooled'),AT(154,214,62,11),USE(?TST:STATUS:Radio2),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('W')
                         RADIO('QNS'),AT(84,228,62,11),USE(?TST:STATUS:Radio3),COLOR(COLOR:Aqua),ICON(ICON:None),TRN, |
  VALUE('Q')
                         RADIO('Backordered'),AT(154,228),USE(?TST:STATUS:Radio4),ICON(ICON:None),TRN,VALUE('B')
                         RADIO('Released'),AT(224,228,62,11),USE(?TST:STATUS:Radio6),ICON(ICON:None),TRN,VALUE('R')
                         RADIO('Complete'),AT(224,214,62,11),USE(?TST:STATUS:Radio5),ICON(ICON:None),TRN,VALUE('C')
                         RADIO('eXclude'),AT(294,214,62,11),USE(?TST:STATUS:Radio7),ICON(ICON:None),TRN,VALUE('X')
                       END
                       BUTTON('Lookup Panels'),AT(420,104,70,25),USE(?PanelLookup),FONT(,,,FONT:bold),TRN
                       STRING(@n06),AT(172,38),USE(TST:INVOICE),FONT(,,COLOR:White,FONT:bold),TRN
                       BUTTON('Client Panels'),AT(420,152,70,25),USE(?LookupclientPanels),FONT(,,,FONT:bold),TRN
                       BUTTON('Panel Tests'),AT(420,200,70,25),USE(?PanelTestsButton),FONT(,,,FONT:bold),HIDE,TRN
                       IMAGE('button.jpg'),AT(420,200,70,25),USE(?PanelTestImage),HIDE
                       IMAGE('button.jpg'),AT(420,248,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(112,36,110,89),USE(?Image8)
                       BUTTON('Done'),AT(420,290,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'),DEFAULT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window'),TRN
                       STRING(@s40),AT(226,52),USE(locTestDescription),FONT(,14,,FONT:bold,CHARSET:ANSI),TRN
                       STRING('Invalid Test Type for this Test Code'),AT(146,158,140,10),USE(?InvalidMessage),FONT(, |
  12,COLOR:Red,FONT:bold,CHARSET:ANSI),COLOR(COLOR:White),HIDE,TRN
                       STRING('Patient:'),AT(144,38),USE(?String2),FONT(,,COLOR:White,FONT:bold),TRN
                       PROMPT('Test Code:'),AT(130,52),USE(?TST:CODE:Prompt),FONT(,,,FONT:bold),TRN
                       STRING('Type'),AT(18,136),USE(?String6),FONT(,,COLOR:Blue,FONT:bold),TRN
                       STRING('Status'),AT(58,220),USE(?String5),FONT(,,COLOR:Blue,FONT:bold),TRN
                       PROMPT('Score:'),AT(146,68),USE(?TST:Score:Prompt),FONT(,,,FONT:bold),TRN
                       PROMPT('Concentration:'),AT(116,96),USE(?TST:COUNT:Prompt),FONT(,,,FONT:bold),TRN
                       PANEL,AT(52,192,321,65),USE(?Panel2),BEVEL(-1,-1)
                       STRING(@s40),AT(334,8),USE(locClientName),TRN
                       STRING('Patient Test Record'),AT(228,18),USE(?String11),FONT(,16,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s32),AT(6,4),USE(locMessage),TRN
                       IMAGE('button.jpg'),AT(6,128,400,29),USE(?Image7)
                       IMAGE('button.jpg'),AT(52,192,321,65),USE(?Image6)
                       IMAGE('button.jpg'),AT(420,152,70,25),USE(?Image4)
                       IMAGE('button.jpg'),AT(420,104,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image1)
                       STRING('Client'),AT(284,8),USE(?String8),TRN
                       BUTTON('&Cancel'),AT(420,248,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(0,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       ENTRY(@n3),AT(172,110),USE(TST:Percentile)
                       STRING('Percentile'),AT(136,112),USE(?STRING1),FONT(,,COLOR:White,FONT:regular),TRN
                       BUTTON('Score 1'),AT(0,16),USE(?BUTTON1),HIDE
                       BUTTON('Score 2'),AT(0,36,41,14),USE(?BUTTON2),HIDE
                       BUTTON('Score 3'),AT(0,56,41,14),USE(?BUTTON3),HIDE
                       BUTTON('Score 4'),AT(0,76,41,14),USE(?BUTTON4),HIDE
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
CheckTestType       ROUTINE
  IF LEN(CLIP(TST:Code)) < 3 THEN EXIT.
  HIDE(?InvalidMessage)
  HIDE(?PanelTestsButton,?PanelTestImage)
  locTestDescription = ''
    PAN:Number = TST:CODE
    GET(Panels,PAN:Order_Key)
    IF ERRORCODE()
      CP:CLIENT = PAT:Client
      CP:PANEL = TST:CODE
      GET(Cli_Panl,CP:ORDER_KEY)
      IF ERRORCODE()
        locTestDescription = ERROR()
      ELSE
        locTestDescription = CP:DESCRIPTION
        HIDE(?PanelTestsButton,?PanelTestImage)
      .
    ELSE
      locTestDescription = Pan:DESCRIPTION
      UNHIDE(?PanelTestsButton,?PanelTestImage)
      HIDE(?InvalidMessage)
      TST:TYPE = 0
      DISPLAY()
      EXIT
    .
    IF LEN(CLIP(TST:Code)) < 4 THEN EXIT.
    RST:NUMBER = TST:CODE
    GET(Rast,RST:ORDER_KEY)
    IF ERRORCODE()
      UNHIDE(?InvalidMessage)
      locTestDescription = ERROR()
    ELSE
      HIDE(?InvalidMessage)
      IF ~INRANGE(TST:TYPE,1,8) THEN TST:TYPE = 1.
      locTestDescription = RST:DESCRIPTION
      SETCLIPBOARD(RST:DESCRIPTION)
      DISPLAY()
      EXIT
    .
    UNHIDE(?InvalidMessage)

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
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateTest')
  ! IF ~(TST:STATUS = 'L' OR TST:STATUS = 'V') THEN GlobalRequest =  ViewRecord.
  ALIAS()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  EXECUTE SELF.Request
    locMessage = 'New Record'
    locMessage = 'Edit record'
    locMessage = 'Remove Record'
    locMessage = 'Select a Record'
    locMessage = 'Process a Record'
    locMessage = 'View Only'
    locMessage = 'save record'
  .
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TST:CODE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(TST:Record,History::TST:Record)
  SELF.AddHistoryField(?TST:CODE,3)
  SELF.AddHistoryField(?TST:Score,7)
  SELF.AddHistoryField(?TST:RANGE,5)
  SELF.AddHistoryField(?TST:COUNT,6)
  SELF.AddHistoryField(?TST:TYPE,4)
  SELF.AddHistoryField(?TST:STATUS:2,8)
  SELF.AddHistoryField(?TST:INVOICE,1)
  SELF.AddHistoryField(?TST:Percentile,11)
  SELF.AddUpdateFile(Access:Test)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Test
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
    ?TST:CODE{PROP:ReadOnly} = True
    ?TST:Score{PROP:ReadOnly} = True
    ?TST:RANGE{PROP:ReadOnly} = True
    ?TST:COUNT{PROP:ReadOnly} = True
    ?TST:STATUS:2{PROP:ReadOnly} = True
    DISABLE(?PanelLookup)
    DISABLE(?LookupclientPanels)
    DISABLE(?PanelTestsButton)
    ?TST:Percentile{PROP:ReadOnly} = True
    DISABLE(?BUTTON1)
    DISABLE(?BUTTON2)
    DISABLE(?BUTTON3)
    DISABLE(?BUTTON4)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  IF TST:STATUS = 'C' AND ~TST:COUNT AND ~TST:RANGE THEN DISABLE(?OK).
  DO CheckTestType
  
  
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
    Relate:Panels.Close
    Relate:Patient.Close
    Relate:Rast.Close
    Relate:Test.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  TST:STATUS = 'L'
  TST:TYPE = ''
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
    IF ACCEPTED() THEN DO CheckTestType.
    
    CASE ACCEPTED()
    OF ?PanelTestsButton
      gloPanelNumber = TST:Code
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?TST:CODE
      DO CheckTestType
    OF ?TST:RANGE
      IF TST:STATUS = 'C' AND ~TST:COUNT AND ~TST:RANGE THEN DISABLE(?OK) ELSE ENABLE(?OK).
    OF ?TST:COUNT
      IF TST:STATUS = 'C' AND ~TST:COUNT AND ~TST:RANGE THEN DISABLE(?OK) ELSE ENABLE(?OK).
    OF ?TST:STATUS:2
      IF TST:STATUS = 'C' AND ~TST:COUNT AND ~TST:RANGE THEN DISABLE(?OK) ELSE ENABLE(?OK).
    OF ?PanelLookup
      ThisWindow.Update
      GlobalRequest = SelectRecord
      Panels()
      ThisWindow.Reset
      IF GlobalResponse = RequestCompleted
        TST:CODE = Pan:NUMBER
        TST:TYPE = 0
        locTestDescription = Pan:DESCRIPTION
        DISPLAY()
      .
    OF ?LookupclientPanels
      ThisWindow.Update
      GlobalRequest = SelectRecord
      ClientPanels()
      ThisWindow.Reset
      IF GlobalResponse = RequestCompleted
        TST:CODE = CP:PANEL
        TST:TYPE = 0
        locTestDescription = CP:DESCRIPTION
        DISPLAY()
      .
    OF ?PanelTestsButton
      ThisWindow.Update
      PanelTestTable(TST:CODE)
      ThisWindow.Reset
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?BUTTON1
      ThisWindow.Update
      ! Score 1 E = .05-0.19 G = 5-8  g4=1.8-2.9
      IF TST:TYPE = 1
        TST:COUNT = RANDOM(5,19) / 100
      ELSIF TST:TYPE = 2 
        TST:COUNT = RANDOM(500,800) / 100
      ELSIF TST:TYPE = 3 
        TST:COUNT = RANDOM(18,29) / 10
      .
      TST:Score = '1'
      PUT(Test)
      POST(EVENT:CloseWindow)
    OF ?BUTTON2
      ThisWindow.Update
      ! Score 2  .2 - .79   9-15  3-5.4
      IF TST:TYPE = 1
        TST:COUNT = RANDOM(2,79) / 100
      ELSIF TST:TYPE = 2 
        TST:COUNT = RANDOM(900,1500) / 100
      ELSIF TST:TYPE = 3 
        TST:COUNT = RANDOM(30,54) / 10
      .
      TST:Score = '2'
      PUT(Test)
      POST(EVENT:CloseWindow)
    OF ?BUTTON3
      ThisWindow.Update
      ! Score 3
      IF TST:TYPE = 1
        TST:COUNT = RANDOM(8,260) / 100
      ELSIF TST:TYPE = 2 
        TST:COUNT = RANDOM(1500,2700) / 100
      ELSIF TST:TYPE = 3 
        TST:COUNT = RANDOM(55,104) / 10
      .
      TST:Score = '3'
      PUT(Test)
      POST(EVENT:CloseWindow)
    OF ?BUTTON4
      ThisWindow.Update
      ! Score 4
      IF TST:TYPE = 1
        TST:COUNT = RANDOM(27,139) / 100
      ELSIF TST:TYPE = 2 
        TST:COUNT = RANDOM(2750,4700) / 100
      ELSIF TST:TYPE = 3
        TST:COUNT = RANDOM(105,205) / 10
      .
      TST:Score = '4'
      PUT(Test)
      POST(EVENT:CloseWindow) 
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
      IF ~TST:Type
        UNHIDE(?PanelTestsButton,?PanelTestImage)
      .
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

