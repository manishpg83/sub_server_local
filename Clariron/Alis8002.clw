

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('MENUStyle.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8008.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8029.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8030.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8032.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8037.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8038.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8040.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8041.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8044.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8062.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8063.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8068.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8071.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8074.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8077.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8078.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8079.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Start module
!!! </summary>
Main1 PROCEDURE 

locStarted           BYTE                                  !
locInitialized       BYTE                                  !
SAV:Permissions      ULONG                                 !
locPatientNotStarted BYTE                                  !
locXpos              SHORT                                 !
locYpos              SHORT                                 !
locWidth             SHORT                                 !
locHeight            SHORT                                 !
locToggleSkin        BYTE                                  !
locClientNotStarted  BYTE                                  !
MenuStyleMgr MenuStyleManager
EnhancedFocusManager EnhancedFocusClassType
AppFrame             APPLICATION('Jan 9, 2024'),AT(0,0,506,11),FONT('Arial',11,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  TILED,ALRT(MouseLeft),ICON('Allermetrix.ico'),MAX,SYSTEM,TIMER(100),IMM
                       MENUBAR,USE(?Menubar)
                         ITEM('Login'),AT(,,56),USE(?Login),FONT(,8,COLOR:Black,FONT:regular),LEFT(10),COLOR(00EAEAEAh, |
  COLOR:White,COLOR:Black),ICON(ICON:None)
                         MENU('Verify'),USE(?MENU1),COLOR(00EBE2E0h)
                           ITEM('Login'),USE(?Verify),FONT(,8,COLOR:Black,FONT:regular),COLOR(00EAEAEAh,COLOR:White,COLOR:Black)
                           ITEM('Billing'),USE(?Billing)
                         END
                         MENU('Workpool'),AT(,,56),USE(?Workpool),FONT(,8,COLOR:BTNTEXT,FONT:regular),LEFT(10),COLOR(00EAEAEAh, |
  COLOR:White,COLOR:Black),ICON(ICON:None)
                           ITEM('Monitor'),USE(?WorkpoolMonitor),FONT(,,,FONT:bold,CHARSET:ANSI),DISABLE
                           ITEM('Summary'),USE(?WorkpoolSummary)
                         END
                         MENU('Results'),AT(,,56),USE(?Results),FONT(,8,,FONT:regular),LEFT(10),COLOR(00EAEAEAh,COLOR:White, |
  COLOR:Black),ICON(ICON:None)
                           ITEM('Daily'),USE(?PrintResults)
                           ITEM('Single'),USE(?ResultsSingle)
                           ITEM('View'),USE(?ViewResults)
                           ITEM('Read In'),USE(?ReadInResults)
                           ITEM('Online Update'),USE(?ResultsOnlineUpdate)
                         END
                         MENU('Database '),AT(,,56),USE(?Tables),FONT(,8,,FONT:regular),LEFT(10),COLOR(00EAEAEAh,COLOR:White, |
  COLOR:Black),ICON(ICON:None)
                           ITEM('Client'),USE(?DatabaseClients)
                           ITEM('Patients'),USE(?DatabasePatients)
                           ITEM('Rast Lib'),USE(?RastLib)
                           ITEM('Panels'),USE(?Panels)
                           ITEM('Plate Setup'),USE(?DatabasePlateSetup)
                           ITEM('Plates'),USE(?TablesPlates)
                           ITEM('PassCode'),USE(?TablesPassCode)
                           ITEM('Documents'),USE(?DatabaseDocuments)
                           ITEM('Normals'),USE(?DatabaseNormals)
                           ITEM('Labels'),USE(?Labels)
                           ITEM('Request Forms'),USE(?RequestForms)
                         END
                         MENU('Misc'),AT(,,56),USE(?Misc),FONT(,8,,,CHARSET:DEFAULT),LEFT(10),COLOR(00EAEAEAh,COLOR:White, |
  COLOR:Black),ICON(ICON:None)
                           ITEM('Analysis'),USE(?Analysis),FONT(,8,,FONT:regular),COLOR(00EAEAEAh)
                           ITEM('Export'),USE(?Export)
                           ITEM('Find Insurance'),USE(?FindInsurance)
                           ITEM('Panel Notifications'),USE(?MiscPanelReview)
                           ITEM('Billing'),USE(?ITEM1)
                           ITEM('Billing Check'),USE(?BillingCheck)
                           ITEM('Make TestNew'),USE(?TestNew)
                           ITEM('List Physicians'),USE(?ListPhysicians)
                           ITEM('Mex Fees'),USE(?ITEM2)
                           ITEM('Read PDF'),USE(?ReadPDF)
                           ITEM('Export to Portal'),USE(?ITEM5)
                           ITEM('State Reports'),USE(?virus)
                           ITEM('Find Cov Results'),USE(?FindCovidResults)
                           ITEM('Print CoV Requests'),USE(?ITEM3)
                           ITEM('Import Covid Tests'),USE(?ImportCovidTests)
                           ITEM,USE(?SEPARATOR2),SEPARATOR
                           ITEM('Get Online Order'),USE(?ITEM4)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('Login CPL Patient'),USE(?Import_CPL)
                         END
                         MENU('&Window'),AT(,,56),USE(?WindowMenu),FONT(,8,,FONT:regular),LEFT(10),COLOR(00EAEAEAh, |
  COLOR:White,COLOR:Black),ICON(ICON:None),STD(STD:WindowList)
                           ITEM('Skin'),USE(?WindowSkin)
                           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
                         END
                         ITEM('Logon'),AT(,,56),USE(?Logon),FONT(,8,,FONT:regular),COLOR(00EAEAEAh,COLOR:White,COLOR:Black), |
  ICON(ICON:None)
                       END
                       TOOLBAR,AT(0,0,506,14),USE(?Toolbar)
                         BUTTON,AT(4,1,14,14),USE(?Toolbar:Top, Toolbar:Top),ICON('WAVCRFIRST.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'First Page')
                         BUTTON,AT(18,1,14,14),USE(?Toolbar:PageUp, Toolbar:PageUp),ICON('WAVCRPRIOR.ICO'),DISABLE, |
  FLAT,TIP('Go to the Prior Page')
                         BUTTON,AT(32,1,14,14),USE(?Toolbar:Up, Toolbar:Up),ICON('WAVCRUP.ICO'),DISABLE,FLAT,TIP('Go to the ' & |
  'Prior Record')
                         BUTTON,AT(60,1,14,14),USE(?Toolbar:Down, Toolbar:Down),ICON('WAVCRDOWN.ICO'),DISABLE,FLAT, |
  TIP('Go to the Next Record')
                         BUTTON,AT(74,1,14,14),USE(?Toolbar:PageDown, Toolbar:PageDown),ICON('WAVCRNEXT.ICO'),DISABLE, |
  FLAT,TIP('Go to the Next Page')
                         BUTTON,AT(88,1,14,14),USE(?Toolbar:Bottom, Toolbar:Bottom),ICON('WAVCRLAST.ICO'),DISABLE,FLAT, |
  TIP('Go to the Last Page')
                         BUTTON,AT(116,1,14,14),USE(?Toolbar:Insert, Toolbar:Insert),ICON('WAINSERT.ICO'),DISABLE,FLAT, |
  TIP('Insert a New Record')
                         BUTTON,AT(130,1,14,14),USE(?Toolbar:Change, Toolbar:Change),ICON('WACHANGE.ICO'),DISABLE,FLAT, |
  TIP('Edit This Record')
                         BUTTON,AT(144,1,14,14),USE(?Toolbar:Delete, Toolbar:Delete),ICON('WADELETE.ICO'),DISABLE,FLAT, |
  TIP('Delete This Record')
                       END
                     END

Report               REPORT,AT(1000,2000,7688,4250),PRE(RPT),PAPER(PAPER:A4),LANDSCAPE,FONT('Arial',10,,FONT:regular, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(1000,1000,7688,1000),USE(?Header)
                       END
Detail                 DETAIL,USE(?Detail)
                       END
                       FOOTER,AT(1000,6250,7688,1000),USE(?Footer)
                       END
                       FORM,AT(1000,1000,7688,6250),USE(?Form)
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
  CASE ACCEPTED()
  OF ?Login
    START(LoginMain, 25000)
  OF ?Logon
    gloPermissions = Passcode(1)
  END
Menu::MENU1 ROUTINE                                        ! Code for menu items on ?MENU1
  CASE ACCEPTED()
  OF ?Verify
    START(VerifyPatients, 25000)
  OF ?Billing
    GlobalRequest = ChangeRecord
    UpdatePatient(1)
  END
Menu::Workpool ROUTINE                                     ! Code for menu items on ?Workpool
  CASE ACCEPTED()
  OF ?WorkpoolMonitor
    START(Monitor, 25000)
  OF ?WorkpoolSummary
    START(MonitorTable, 25000)
  END
Menu::Results ROUTINE                                      ! Code for menu items on ?Results
  CASE ACCEPTED()
  OF ?PrintResults
    START(PatientReport, 25000)
  OF ?ResultsSingle
    START(PrintReport, 25000)
  OF ?ViewResults
     URLHandler(AppFrame{prop:handle},'file:///Z:/Results/Reports.HTML')
  OF ?ReadInResults
    START(ReadInResults, 25000)
  OF ?ResultsOnlineUpdate
    START(amxUpdate, 25000)
  END
Menu::Tables ROUTINE                                       ! Code for menu items on ?Tables
  CASE ACCEPTED()
  OF ?DatabaseClients
    START(Client, 25000)
  OF ?DatabasePatients
    START(Patients, 25000)
  OF ?RastLib
    START(RastTable, 25000)
  OF ?Panels
    gloPanelNumber = START(Panels, 25000)
  OF ?DatabasePlateSetup
    START(Templates, 25000)
  OF ?TablesPlates
    START(PlatesTable, 25000)
  OF ?TablesPassCode
    START(PassCodes, 25000)
  OF ?DatabaseDocuments
    START(Docs, 25000)
  OF ?DatabaseNormals
    Normals()
  OF ?Labels
    START(LabelSetup, 25000)
  OF ?RequestForms
    START(RequestForm, 25000)
  END
Menu::Misc ROUTINE                                         ! Code for menu items on ?Misc
  CASE ACCEPTED()
  OF ?Analysis
    START(Analysis, 25000)
  OF ?Export
    START(ExportBilling, 50000)
    !STOP('RETURNED')
  OF ?FindInsurance
    FindInsurance()
  OF ?MiscPanelReview
    ClientPanelReview()
  OF ?ITEM1
    START(Billing2, 25000)
  OF ?BillingCheck
    START(BillingCheck, 25000)
  OF ?TestNew
    MakeNewTest()
  OF ?ListPhysicians
    ListPhysicians()
  OF ?ITEM2
    BillingFees()
  OF ?ReadPDF
    ReadPDF()
    ! Read PDF
  OF ?ITEM5
    ExportUpdates(1111,2222)
  OF ?virus
    START(ExportCovid, 25000)
  OF ?FindCovidResults
    virus()
  OF ?ITEM3
    CovidRequestForm()
  OF ?ImportCovidTests
    ImportCovidTests()
  OF ?ITEM4
    GetOrders()
  OF ?Import_CPL
    GetOrderCPL()
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main1')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PCodes.Open                                       ! File PCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main1',AppFrame)                           ! Restore window settings from non-volatile store
!  billingfees()
  GETPOSITION(0,locXpos,locYpos,locWidth,locHeight)
  IF locWidth < 506 THEN locWidth = 506.
  IF locHeight < 341 then locHeight = 341.
  SETPOSITION(0,locXpos,locYpos,locWidth,locHeight)
  gloWallPaper           = GETINI('Skins','WallPaper','~Steel.jpg','alis.ini')
  gloListFont            = GETINI('Skins','ListFont','Arial','ALIS.INI')
  gloListFontSize        = GETINI('Skins','ListFontSize','11','ALIS.INI')
  gloListFontColor       = GETINI('Skins','ListFontColor',COLOR:Black,'ALIS.INI')
  gloListFontStyle       = GETINI('Skins','ListFontStyle',FONT:Bold,'ALIS.INI')
  gloListSelectedFGColor = GETINI('Skins','ListSelectedFGColor',COLOR:White,'ALIS.INI')
  gloListSelectedBGColor = GETINI('Skins','ListSelectedBGColor',COLOR:Blue,'ALIS.INI')
  gloListBgColor         = GETINI('Skins','ListBgColor','-1','ALIS.INI')
  gloTypeBGColor[TYPE:IgE]  = GETINI('Skins','TypeBGColorIgE',COLOR:Red,'ALIS.INI')
  gloTypeBGColor[TYPE:IgG]  = GETINI('Skins','TypeBGColorIgG',COLOR:Blue,'ALIS.INI')
  gloTypeBGColor[TYPE:IgG4] = GETINI('Skins','TypeBGColorIgG4',COLOR:Yellow,'ALIS.INI')
  gloTypeFGColor[TYPE:IgE]  = GETINI('Skins','TypeFGColorIgE',COLOR:White,'ALIS.INI')
  gloTypeFGColor[TYPE:IgG]  = GETINI('Skins','TypeFGColorIgG',COLOR:White,'ALIS.INI')
  gloTypeFGColor[TYPE:IgG4] = GETINI('Skins','TypeFGColorIgG4',COLOR:Black,'ALIS.INI')
  gloGraphGrid = 622 !GETINI('Graph','Grid',700,'ALIS.INI')
  gloGraphWidth = GETINI('Graph','Width',5600,'ALIS.INI')
  gloLabelXpos = GETINI('label','BarcodeXpos',25,'ALIS.INI')
  gloLabelYpos = GETINI('label','BarcodeYpos',70,'ALIS.INI')
  gloPlateBarcodeXpos = GETINI('label','PlateBarcodeXpos',30,'ALIS.INI')
  gloPlateBarcodeYpos = GETINI('label','PlateBarcodeYpos',1,'ALIS.INI')
  gloPlateBarcode2Ypos = GETINI('label','PlateBarcode2Ypos',100,'ALIS.INI')
  gloPlateBarcode3Ypos = GETINI('label','PlateBarcode3Ypos',150,'ALIS.INI')
  gloPlateNameXpos = GETINI('label','PlateNameXpos',1,'ALIS.INI')
  gloPlateNameYpos = GETINI('label','PlateNameYpos',120,'ALIS.INI')
  gloPlateName2Ypos = GETINI('label','PlateName2Ypos',140,'ALIS.INI')
  gloPlateName3Ypos = GETINI('label','PlateName3Ypos',190,'ALIS.INI')
  gloPlateNameFont = GETINI('label','PlateNameFont',3,'ALIS.INI')
  gloPlateDateYpos = GETINI('label','PlateDateYpos',180,'ALIS.INI')
  gloPlateBarcodeRotation = GETINI('label','PlateBarcodeRotation',0,'ALIS.INI')
  gloPlateNameRotation = GETINI('label','PlateNameRotation',3,'ALIS.INI')
  gloPlateBarcodeHeight = GETINI('label','PlateBarcodeHeight',70,'ALIS.INI')
  gloPlateBarcodeWidth = GETINI('label','PlateBarcodeWidth',2,'ALIS.INI')
  gloBillingLetterDays = GETINI('billing','LetterDays',30,'ALIS.INI')
  gloLoginSort = GETINI('login','LoginSort',2,'ALIS.INI')
  
  
    
  SELF.SetAlerts()
  gloPermissions =  0
  ?Toolbar{PROP:Wallpaper} = gloWallpaper
  gloTypeDescription[TYPE:IgE]   = 'IgE'
  gloTypeDescription[TYPE:IgG]   = 'IgG'
  gloTypeDescription[TYPE:IgG4]  = 'IgG4'
  gloTypeDescription[TYPE:IVG]  = 'IVG'
  gloTypeDescription[TYPE:IVM]  = 'IVM'
  gloTypeDescription[TYPE:TIgA]  = 'T IgA'
  gloTypeDescription[TYPE:Panel] = 'Panel'
  gloTypeDescription[TYPE:Error] = 'ERROR'
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
  IF SELF.FilesOpened
    Relate:PCodes.Close
  END
  IF SELF.Opened
    INIMgr.Update('Main1',AppFrame)                        ! Save window data to non-volatile store
  END
  
  
  
  PUTINI('Skins','WallPaper',gloWallpaper,'ALIS.INI')
  PUTINI('Skins','ListFont',gloListFont,'ALIS.INI')
  PUTINI('Skins','ListFontSize',gloListFontSize,'ALIS.INI')
  PUTINI('Skins','ListFontColor',gloListFontColor,'ALIS.INI')
  PUTINI('Skins','ListFontStyle',gloListFontStyle,'ALIS.INI')
  PUTINI('Skins','ListSelectedFGColor',gloListSelectedFGColor,'ALIS.INI')
  PUTINI('Skins','ListSelectedBGColor',gloListSelectedBGColor,'ALIS.INI')
  PUTINI('Skins','ListBgColor',gloListBgColor,'ALIS.INI')
  
  PUTINI('Skins','TypeColorIgE',gloTypeBGColor[TYPE:IgE],'ALIS.INI')
  PUTINI('Skins','TypeColorIgG',gloTypeBGColor[TYPE:IgG],'ALIS.INI')
  PUTINI('Skins','TypeColorIgG4',gloTypeBGColor[TYPE:IgG4],'ALIS.INI')
  PUTINI('Skins','TypeColorIgE',gloTypeFGColor[TYPE:IgE],'ALIS.INI')
  PUTINI('Skins','TypeColorIgG',gloTypeFGColor[TYPE:IgG],'ALIS.INI')
  PUTINI('Skins','TypeColorIgG4',gloTypeFGColor[TYPE:IgG4],'ALIS.INI')
  
  
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
    OROF ?Toolbar:Down
    OROF ?Toolbar:PageDown
    OROF ?Toolbar:Bottom
    OROF ?Toolbar:Insert
    OROF ?Toolbar:Change
    OROF ?Toolbar:Delete
      IF SYSTEM{PROP:Active} <> THREAD()
        POST(EVENT:Accepted,ACCEPTED(),SYSTEM{Prop:Active} )
        CYCLE
      END
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::MENU1                                       ! Process menu items on ?MENU1 menu
      DO Menu::Workpool                                    ! Process menu items on ?Workpool menu
      DO Menu::Results                                     ! Process menu items on ?Results menu
      DO Menu::Tables                                      ! Process menu items on ?Tables menu
      DO Menu::Misc                                        ! Process menu items on ?Misc menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
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
    OF EVENT:AlertKey
      IF INRANGE(MOUSEX(),400,500) AND INRANGE(MOUSEY(),280,320) THEN POST(EVENT:CloseWindow).
    OF EVENT:OpenWindow
      DISABLE(?Verify,?TablesPassCode)
      POST(EVENT:Accepted,?Logon)
      RUN('C:\xampp\apache\bin\httpd.exe',0)
    OF EVENT:Timer
  IF ~locInitialized
    ParentWin = Target{PROP:Handle}  ! Get App Frame ID, needed for COM port functions
    locInitialized = 1
    CommPort = 0
 !  CommPortError = SetPortEx(CommPort,ParentWin,locReceiveBufferSize,locTransmitBufferSize,locCTS,locXon,locDSR)      ! Try to open COM port
    CommPortError = SetPort(CommPort,ParentWin)
    IF ~CommPortError
      CommPortError = InitPort(CommPort,9600,NOPARITY,8,ONESTOPBIT)  
    .
    IF ~CommPortError
      gloPrinterStatus  = ModemStat(CommPort)
      Rts(CommPort,1)
      Dtr(CommPort,1)
    .
  .

   


      IF BAND(gloPermissions,ACCESS:Admin) AND SAV:Permissions <> gloPermissions
        ENABLE(?Verify,?TablesPassCode)
        UNHIDE(?TablesPassCode)
        ENABLE(?Analysis)
        gloPermissions = 0FFFFH
      ELSIF SAV:Permissions <> gloPermissions
        ENABLE(?Verify,?TablesPassCode)
        HIDE(?TablesPassCode)
        IF BAND(gloPermissions,ACCESS:Workpool)      THEN ENABLE(?Workpool) ELSE DISABLE(?Workpool).
        IF BAND(gloPermissions,ACCESS:Verify)        THEN ENABLE(?Verify) ELSE DISABLE(?Verify).
        IF BAND(gloPermissions,ACCESS:PrintResults)  THEN ENABLE(?PrintResults) ELSE DISABLE(?PrintResults); DISABLE(?ResultsSingle).
        IF BAND(gloPermissions,ACCESS:ViewResults)   THEN ENABLE(?ViewResults) ELSE DISABLE(?ViewResults).
        IF BAND(gloPermissions,ACCESS:ReadInResults) THEN ENABLE(?ReadInResults) ELSE DISABLE(?ReadInResults).
        IF BAND(gloPermissions,ACCESS:PatientLogIn)  THEN ENABLE(?Login) ELSE DISABLE(?Login).
        IF BAND(gloPermissions,ACCESS:Analysis)      THEN ENABLE(?Analysis) ELSE DISABLE(?Analysis).
        IF BAND(gloPermissions,ACCESS:Database)      THEN ENABLE(?Tables) ELSE DISABLE(?RastLib); DISABLE(?DatabasePlateSetup); DISABLE(?DatabaseDocuments); DISABLE(?TablesPlates); DISABLE(?Panels).
        IF BAND(gloPermissions,ACCESS:Clients+ACCESS:EditClients)   THEN ENABLE(?DatabaseClients) ELSE DISABLE(?DatabaseClients).
        IF BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN ENABLE(?DatabasePatients) ELSE DISABLE(?DatabasePatients).
      .
      SAV:Permissions = gloPermissions
      IF RECORDS(Exceptions)
        gloCloseExceptions = 0
      ELSE
        gloCloseExceptions = 1
      .
      IF locClientNotStarted=0 AND BAND(gloPermissions,ACCESS:Clients+ACCESS:EditClients)
        locClientNotStarted += 1
        IF locClientNotStarted > 1 then stop('client restart error').
        START(Client,25000)
      ELSIF locPatientNotStarted=0 AND locClientNotStarted=0 AND BAND(gloPermissions,ACCESS:Clients+ACCESS:EditPatients)
        locPatientNotStarted += 1
        IF locPatientNotStarted > 1 then stop('Patient restart error').
        START(Patients,25000)
      .

 OMIT('XXXX')
!ACCESS:Admin          EQUATE(1)
!ACCESS:Clients        EQUATE(2)
!ACCESS:EditClients    EQUATE(4)
!ACCESS:Patients       EQUATE(8)
!ACCESS:EditPatients   EQUATE(16)
!ACCESS:PatientLogIn   EQUATE(32)
!ACCESS:Verify         EQUATE(64)
!ACCESS:Workpool       EQUATE(128)
!ACCESS:ReadInResults  EQUATE(256)
!ACCESS:PrintResults   EQUATE(512)
!ACCESS:ViewResults    EQUATE(1024)
!ACCESS:Database       EQUATE(2048)
!ACCESS:Analysis       EQUATE(4096)
       MENUBAR,USE(?Menubar)
         ITEM('Verify'),USE(?Verify),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI),ICON('qkload.ico')
         ITEM,SEPARATOR
         MENU('Workpool'),USE(?Workpool),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI),ICON('Export.ico')
           ITEM('Monitor'),USE(?WorkpoolMonitor),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI)
           ITEM('Summary'),USE(?WorkpoolSummary)
         END
         ITEM,SEPARATOR
         MENU('Results'),USE(?Results),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI),ICON('wizopen.ico')
           ITEM('Daily'),USE(?PrintResults)
           ITEM('Single'),USE(?ResultsSingle)
           ITEM('View'),USE(?ViewResults)
           ITEM('Read In'),USE(?ReadInResults)
         END
         ITEM,SEPARATOR
         ITEM('Login'),USE(?Login),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI),ICON('Application.ico')
         ITEM,SEPARATOR
         ITEM,SEPARATOR
         MENU('Database '),USE(?Tables),DISABLE,FONT(,,,FONT:bold,CHARSET:ANSI),ICON('Addressbook.ico')
           ITEM('Client'),USE(?DatabaseClients)
           ITEM('Patients'),USE(?DatabasePatients)
           ITEM('Rast Lib'),USE(?RastLib)
           ITEM('Panels'),USE(?Panels)
           ITEM('Plate Setup'),USE(?DatabasePlateSetup)
           ITEM('Plates'),USE(?TablesPlates)
           ITEM('PassCode'),USE(?TablesPassCode)
           ITEM('Documents'),USE(?DatabaseDocuments)
         END
         ITEM('Analysis'),USE(?Analysis),DISABLE,ICON('WIZMARK.ICO')
         MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList),ICON('MATCH.ICO')
           ITEM('Skin'),USE(?WindowSkin)
           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
         END
         ITEM('Logon'),USE(?Logon),ICON('103_67.ico')

  XXXX
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

