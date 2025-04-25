   PROGRAM


 INCLUDE('ABPOPUP.INC') 


   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE

   MAP
     MODULE('ALIS8_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('ALIS8002.CLW')
Main1                  PROCEDURE   !Start module
     END
     MODULE('ALIS8072.CLW')
UpdateBilling1         PROCEDURE   !Form Billing
     END
            URLHandler(unsigned, STRING)
            MODULE('winstuff')
                ShellExecute(UNSIGNED,LONG,*CSTRING,LONG,*CSTRING,SIGNED),UNSIGNED,PASCAL,RAW,NAME('SHELLEXECUTEA')
            END
            MODULE('')
              SLEEP(LONG),PASCAL
            END
            MODULE('CW_API')
              MkDir(*cstring),signed,raw,name('_mkdir')
           .
           INCLUDE('CWUTIL.INC'),ONCE
           MODULE('CLACom API')
              CenterNonMDIWindow(LONG ParentWin,LONG MyWin),DLL,PASCAL,NAME('_Func001@8')
              CheckIfSmallFonts(),SHORT,DLL,PASCAL,NAME('_Func006@0')
              CLAFindWindow(*CSTRING WinClass,*CSTRING WinTitle),SHORT,RAW,DLL,PROC,PASCAL,NAME('_Func008@8')
              ClearVariable(*CSTRING,LONG,LONG),RAW,DLL,PASCAL,NAME('_Func110@12')
              ClrBuf(SHORT),DLL,PASCAL,NAME('_Func017@4')
              ClrRecvBuf(SHORT),DLL,PASCAL,NAME('_Func023@4')
              ClrTransBuf(SHORT),DLL,PASCAL,NAME('_Func011@4')
              ComDelay(LONG hWnd,SHORT tics),SHORT,DLL,PASCAL,PROC,NAME('_Func012@8')
              ComGetb(SHORT,*CSTRING),SHORT,RAW,DLL,PASCAL,NAME('_Func013@8')
              ComGetbFilter(SHORT,*CSTRING),SHORT,RAW,DLL,PASCAL,NAME('_Func014@8')
              ComGetBlock(SHORT,*CSTRING,SHORT),SHORT,RAW,DLL,PASCAL,NAME('_Func015@12')
              ComGetc(SHORT),SHORT,DLL,PASCAL,NAME('_Func009@4')
              ComGetd(SHORT port,LONG hWnd,SHORT secs),SHORT,DLL,PASCAL,NAME('_Func018@12')
              ComGets(SHORT,*CSTRING,BYTE),SHORT,RAW,DLL,PASCAL,NAME('_Func111@12')
              ComPutb(SHORT,*CSTRING,SHORT),RAW,DLL,PASCAL,NAME('_Func010@12')
              ComPutc(SHORT,BYTE),DLL,PASCAL,NAME('_Func025@8')
              ComPuts(SHORT,*CSTRING),RAW,DLL,PASCAL,NAME('_Func072@8')
              DisplayErrors(SHORT port,LONG hWnd),DLL,PASCAL,NAME('_Func032@8')
              DisplayPortError(SHORT error),DLL,PASCAL,NAME('_Func034@4')
              Dtr(SHORT port,SHORT how),DLL,PASCAL,NAME('_Func038@8')
              GetCommParams(SHORT,*GROUP),SHORT,RAW,DLL,PROC,PASCAL,NAME('_Func039@8')
              GetConnectSpeed(*CSTRING),LONG,RAW,DLL,PASCAL,NAME('_Func040@4')
              GetParentWindow(LONG hWnd),LONG,DLL,PASCAL,NAME('_Func044@4')
              GetWindowsPort(SHORT),SHORT,DLL,PASCAL,NAME('_Func048@4')
              InitPort(SHORT,LONG,SHORT,SHORT,SHORT),SHORT,DLL,PROC,PASCAL,NAME('_Func115@20')
              Iscd(SHORT),SHORT,DLL,PASCAL,NAME('_Func052@4')
              ModemHangUp(SHORT),DLL,PASCAL,NAME('_Func055@4')
              ModemPuts(SHORT,*CSTRING),RAW,DLL,PASCAL,NAME('_Func056@8')
              ModemStat(SHORT),BYTE,DLL,PASCAL,NAME('_Func057@4')
              RecvCount(SHORT),SHORT,DLL,PASCAL,NAME('_Func058@4')
              ResetPort(SHORT port,LONG hWnd),SHORT,DLL,PROC,PASCAL,NAME('_Func059@8')
              Rts(SHORT,SHORT),DLL,PASCAL,NAME('_Func061@8')
              SetFlowControl(SHORT,SHORT,SHORT,SHORT),DLL,PASCAL,NAME('_Func071@16')
              SetPort(SHORT port,LONG hWnd),SHORT,DLL,PASCAL,NAME('_Func026@8')
              SetPortEx(SHORT,LONG,SHORT,SHORT,SHORT,SHORT,SHORT),SHORT,DLL,PASCAL,NAME('_Func073@28')
              SetReceiveNotify(SHORT port,LONG hWnd,SHORT bytes),SHORT,DLL,PASCAL,NAME('_Func077@12')
              StrWord(*CSTRING,*CSTRING),SHORT,RAW,DLL,PASCAL,NAME('_Func084@8')
              SuspendReceiveNotify(SHORT,SHORT),DLL,PASCAL,NAME('_Func085@8')
           END
     
           MODULE('Windows API')
              ClaGetDeskTopWindow(),LONG,DLL,PASCAL,NAME('GETDESKTOPWINDOW')
              ClaShellExecute(LONG,*CSTRING,*CSTRING,*CSTRING,*CSTRING,LONG),LONG,PROC,DLL,RAW,PASCAL,NAME('ShellExecuteA')
              ClaCallNextHookEx(LONG,LONG,LONG,LONG),LONG,DLL,PASCAL,NAME('CALLNEXTHOOKEX')
              ClaCallWindowProc(LONG,LONG,LONG,LONG,LONG),LONG,DLL,PASCAL,NAME('CALLWINDOWPROCA')
              ClaCopyFile(*CSTRING,*CSTRING,SHORT),SHORT,PROC,DLL,RAW,PASCAL,NAME('CopyFileA')
              ClaCreateEvent(<*GROUP>,SIGNED,SIGNED,<*CSTRING>),UNSIGNED,RAW,PROC,DLL,PASCAL,NAME('CreateEventA')
              ClaCreateThread(<*GROUP>,ULONG,ULONG,LONG,ULONG,*ULONG),UNSIGNED,RAW,DLL,PASCAL
              ClaDefWindowProc(LONG,LONG,LONG,LONG),LONG,DLL,PASCAL,NAME('DEFWINDOWPROCA')
              ClaDeleteFile(*CSTRING),SHORT,PROC,DLL,RAW,PASCAL,NAME('DeleteFileA')
              ClaEnableWindow(LONG,SHORT),DLL,PASCAL,NAME('ENABLEWINDOW')
              ClaFindCloseChangeNotification(UNSIGNED),SIGNED,PROC,DLL,PASCAL
              ClaFindFirstChangeNotification(*CSTRING,SIGNED,ULONG),UNSIGNED,RAW,DLL,PASCAL,NAME('FindFirstChangeNotificationA')
              ClaFindNextChangeNotification(UNSIGNED),SIGNED,PROC,DLL,PASCAL
              ClaFlashWindow(LONG,SHORT),DLL,PASCAL,NAME('FLASHWINDOW')
              ClaGetCurrentProcess(),LONG,DLL,PASCAL,NAME('GETCURRENTPROCESS')
              ClaGetCurrentThread(),LONG,DLL,PASCAL,NAME('GETCURRENTTHREAD')
              ClaGetCurrentThreadId(),LONG,DLL,PASCAL,NAME('GETCURRENTTHREADID')
              ClaMoveFile(*CSTRING,*CSTRING),SHORT,PROC,DLL,RAW,PASCAL,NAME('MoveFileA')
              ClaPostMessage(LONG,LONG,LONG,LONG),SHORT,DLL,PROC,PASCAL,NAME('POSTMESSAGEA')
              ClaResumeThread(UNSIGNED),ULONG,PROC,DLL,PASCAL
              ClaSetEvent(UNSIGNED),SIGNED,PROC,DLL,PASCAL
              ClaSetThreadPriority(UNSIGNED,SIGNED),SIGNED,PROC,DLL,PASCAL
              ClaSetWindowLong(LONG,LONG,LONG),LONG,DLL,PASCAL,NAME('SETWINDOWLONGA')
              ClaSetWindowsHookEx(LONG,LONG,LONG,LONG),LONG,DLL,PASCAL,NAME('SETWINDOWSHOOKEXA')
              ClaUnHookWindowsHookEx(LONG),DLL,PASCAL,NAME('UNHOOKWINDOWSHOOKEX')
              ClaWaitForSingleObject(UNSIGNED,ULONG),ULONG,PROC,DLL,PASCAL
           END
     
     
   END

gloVirus             LONG
gloPDFPrinter        STRING(128)
gloLoginSort         LONG
gloReportFormatCML   LONG
gloRecompileChangeTest LONG
gloFrom              LONG
gloTo                LONG
PAT:BillingVerified  STRING(2)
gloPlateBarcodeWidth BYTE
gloPlateName3Ypos    BYTE
gloPlateName2Ypos    BYTE
gloPlateBarcode3Ypos BYTE
gloPlateBarcode2Ypos BYTE
gloPlateBarcodeHeight SHORT
gloDebug             BYTE
gloPlateNameFont     BYTE
gloPlateNameRotation BYTE
gloPlateBarcodeRotation BYTE
gloPlateDateYpos     BYTE
gloPlateDateXpos     BYTE
gloPlateNameYpos     BYTE
gloPlateNameXpos     BYTE
gloPlateBarcodeYpos  BYTE
gloPlateBarcodeXpos  BYTE
gloLabelYpos         BYTE
gloLabelXpos         BYTE
gloMonitoringLoginTest BYTE
gloThreadedReturn    ULONG
gloPrinterStatus     ULONG
gloDocBody           STRING(8192)
gloDocSubject        STRING(80)
locUpdate            STRING(20)
gloResultsPrinter    STRING(128)
gloFaxPrinter        STRING(128)
gloShippingLabelPrinter STRING(128)
gloSet               BYTE
gloTestType          BYTE
gloListFont          STRING(32)
gloListFontSize      SHORT
gloListFontStyle     LONG
gloListFontColor     LONG
gloListBgColor       LONG
gloListSelectedFGColor LONG
gloListSelectedBGColor LONG
gloWallpaper         STRING(48)
gloClientControl     BYTE
gloPasscode          ULONG
gloPermissions       ULONG
gloFileName          STRING(128)
gloFileName1         STRING(128)
gloFileName2         STRING(128)
gloFileName3         STRING(128)
gloFileName4         STRING(128)
gloFileName5         STRING(128)
gloPatient           LONG
gloAddOn             BYTE
gloCloseExceptions   BYTE
gloOK                BYTE
gloInitials          STRING(3)
gloAdminAccess       BYTE
gloAccessPatient     BYTE
gloEditPatient       BYTE
gloAccessBilling     BYTE
gloBillingLetterDays USHORT
gloEditBilling       BYTE
gloEditResults       BYTE
gloTabFileName       STRING(30)
gloPanelNumber       STRING(9)
gloReportFileName    STRING(64)
gloBillingFileName   STRING(64)
gloTypeDescription   STRING(5),DIM(11)
gloTypeBGColor       ULONG,DIM(3)
gloTypeFGColor       ULONG,DIM(3)
gloClientNumber      LONG
gloPatientNumber     LONG
gloLowLimit          LONG(200000)
gloHighLimit         LONG(899999)
gloPreview           BYTE
gloDoc               ULONG
gloTitle             STRING(24)
gloSupressNotifcation BYTE
gloGraphGrid         USHORT
gloGraphWidth        USHORT
gloLetterNumber      BYTE
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
Cli_panl             FILE,DRIVER('TOPSPEED'),NAME('..\data\Cli_panl.tps'),PRE(CP),BINDABLE,CREATE,THREAD !                    
ORDER_KEY                KEY(CP:Client,CP:Panel),NOCASE,OPT,PRIMARY !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Panel                       STRING(9)                      !                    
Description                 STRING(64)                     !                    
Fee                         DECIMAL(7,2)                   !                    
IgE                         LONG                           !                    
IgG                         LONG                           !                    
IgG4                        LONG                           !                    
Mix                         LONG                           !                    
TotalIgE                    LONG                           !                    
Tests                       LONG                           !                    
SpareLong                   LONG                           !                    
SpareString                 STRING(32)                     !                    
                         END
                     END                       

ClientPanelTests     FILE,DRIVER('MEMORY'),PRE(CPT),CREATE,BINDABLE,THREAD !Used in Review Notifactions
OrderKey                 KEY(CPT:Client,CPT:Panel),DUP,NOCASE,OPT !                    
CodeKey                  KEY(CPT:Client,CPT:Panel,CPT:Code),NOCASE !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Panel                       STRING(9)                      !                    
Description                 STRING(40)                     !                    
Code                        STRING(5)                      !                    
TestTypes                   STRING(16)                     !                    
                         END
                     END                       

PanelReview          FILE,DRIVER('MEMORY'),PRE(PR),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PR:Client,PR:Panels),NOCASE,OPT !                    
maxKey                   KEY(PR:MaxLinesPerPanel),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Panels                      BYTE                           !                    
Tests                       USHORT                         !                    
MaxTestsPerPanel            BYTE                           !                    
MaxLinesPerPanel            BYTE                           !                    
                         END
                     END                       

Docs                 FILE,DRIVER('TOPSPEED'),NAME('..\data\Docs.TPS'),PRE(DOC),BINDABLE,THREAD !                    
OrderKey                 KEY(DOC:Number),NOCASE,PRIMARY    !By Doc Number       
SubjectKey               KEY(DOC:Subject),DUP,NOCASE       !by Doc Subject      
Body                        MEMO(8192)                     !                    
Record                   RECORD,PRE()
Number                      ULONG                          !                    
Subject                     STRING(40)                     !                    
                         END
                     END                       

Text                 FILE,DRIVER('ASCII'),NAME(gloFileName),PRE(TXT),BINDABLE,CREATE,THREAD !                    
Record                   RECORD,PRE()
Text                        STRING(2048)                   !                    
                         END
                     END                       

plates               FILE,DRIVER('TOPSPEED'),NAME('..\data\plates.tps'),PRE(PLT),BINDABLE,THREAD !                    
DATE_KEY                 KEY(PLT:DATE,PLT:TYPE),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
DATE                        LONG                           !                    
TYPE                        BYTE                           !                    
FILENAME                    STRING(10)                     !                    
                         END
                     END                       

template             FILE,DRIVER('TOPSPEED'),NAME('..\data\template.tps'),PRE(TPL),BINDABLE,THREAD !                    
KeyType                  KEY(TPL:Type,TPL:Set,-TPL:Relation,TPL:Position),DUP,NOCASE !                    
Record                   RECORD,PRE()
Type                        BYTE                           !                    
Set                         BYTE                           !                    
Position                    USHORT                         !                    
Relation                    STRING(1)                      !                    
Code                        STRING(5)                      !                    
Barcode                     DECIMAL(7)                     !                    
Source                      USHORT                         !                    
                         END
                     END                       

Setup                FILE,DRIVER('TOPSPEED'),NAME('..\data\Setup.tps'),PRE(SU),BINDABLE,CREATE,THREAD !                    
Record                   RECORD,PRE()
Days1                       LONG                           !                    
Days2                       LONG                           !                    
Days3                       LONG                           !                    
Days4                       LONG                           !                    
Attributes                  LONG                           !                    
Spare                       STRING(32)                     !                    
Spare2                      STRING(32)                     !                    
SpareLong                   LONG                           !                    
SpareLong2                  LONG                           !                    
                         END
                     END                       

wpSetup              FILE,DRIVER('TOPSPEED'),NAME('..\data\wpSetup.tps'),PRE(wpS),BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Label                       STRING(20),DIM(9)              !                    
Wells                       USHORT,DIM(9)                  !                    
FirstWell                   BYTE,DIM(9)                    !                    
FirstSource                 BYTE,DIM(9)                    !                    
Sort                        STRING(1)                      !                    
UsedType                    BYTE,DIM(9)                    !                    
                         END
                     END                       

Monitor              FILE,DRIVER('TOPSPEED'),NAME(gloFileName),PRE(MON),BINDABLE,CREATE,THREAD !                    
ORDERKEY                 KEY(MON:PATIENT),NOCASE,OPT       !                    
STATUSKEY                KEY(MON:STATUS,-MON:SORT,MON:PATIENT),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
SORT                        BYTE                           !                    
Spanish                     BYTE                           !                    
PATIENT                     LONG                           !                    
TYPE                        STRING(1)                      !                    
NAME                        STRING(32)                     !                    
LoginDate                   DATE                           !                    
STATUS                      STRING(1)                      !                    
Attributes                  LONG                           !                    
INITIALS                    STRING(2)                      !                    
TIME                        LONG                           !                    
Client                      LONG                           !                    
COUNT                       SHORT,DIM(9)                   !                    
WORKPOOLED                  SHORT,DIM(9)                   !                    
AGE                         BYTE                           !                    
SIGNATURE                   BYTE                           !                    
VOLUME                      SHORT,DIM(3)                   !                    
SerumReceived               DECIMAL(5,1)                   !                    
Needed                      DECIMAL(5,1),DIM(3)            !                    
POSITION                    SHORT                          !                    
LABELS                      BYTE                           !                    
                         END
                     END                       

SpecimenReceived     FILE,DRIVER('TOPSPEED'),NAME('..\data\SpecimenReceived.tps'),PRE(SR),BINDABLE,CREATE,THREAD !                    
OrderKey                 KEY(SR:Date,SR:Patient),NOCASE,OPT !                    
Record                   RECORD,PRE()
Date                        DATE                           !                    
Patient                     LONG                           !                    
Spanish                     BYTE                           !                    
Client                      LONG                           !                    
ClientName                  STRING(32)                     !                    
PatientName                 STRING(32)                     !                    
eMailed                     BYTE                           !                    
                         END
                     END                       

Botanical            FILE,DRIVER('TOPSPEED'),NAME('..\data\botanical.tps'),PRE(BOT),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(BOT:Code),NOCASE,OPT          !                    
Record                   RECORD,PRE()
Code                        STRING(5)                      !                    
Description                 STRING(20)                     !                    
                         END
                     END                       

Rast                 FILE,DRIVER('TOPSPEED'),NAME('..\data\Rast.tps'),PRE(RST),BINDABLE,THREAD !                    
ORDER_KEY                KEY(RST:NUMBER),NOCASE,OPT        !                    
DESCRIPT_KEY             KEY(RST:DESCRIPTION),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
NUMBER                      STRING(5)                      !                    
DESCRIPTION                 STRING(40)                     !                    
sDescription                STRING(40)                     !                    
ShortDescription            STRING(20)                     !                    
FAMILY                      STRING(40)                     !                    
TRIBE                       STRING(40)                     !                    
GENUS                       STRING(40)                     !                    
SPECIES                     STRING(40)                     !                    
FeeLevel                    BYTE                           !                    
Lot                         SHORT                          !                    
ExpMonth                    BYTE                           !                    
ExpYear                     BYTE                           !                    
                         END
                     END                       

Panels               FILE,DRIVER('TOPSPEED'),NAME('..\data\NewPanels.tps'),PRE(PAN),BINDABLE,THREAD !                    
ORDER_KEY                KEY(PAN:Number),NOCASE,OPT        !                    
Record                   RECORD,PRE()
Number                      STRING(9)                      !                    
Description                 STRING(64)                     !                    
Fee                         DECIMAL(7,2)                   !                    
IgE                         LONG                           !                    
IgG                         LONG                           !                    
IgG4                        LONG                           !                    
Mix                         LONG                           !                    
TotalIgE                    LONG                           !                    
Tests                       SHORT                          !                    
SpareLong                   LONG                           !                    
SpareString                 STRING(32)                     !                    
                         END
                     END                       

Pnl_test             FILE,DRIVER('TOPSPEED'),NAME('..\data\Pnl_test.tps'),PRE(PT),BINDABLE,THREAD !                    
ORDER_KEY                KEY(PT:PANEL,PT:CODE,PT:TYPE),NOCASE,OPT !                    
Record                   RECORD,PRE()
PANEL                       STRING(9)                      !                    
CODE                        STRING(7)                      !                    
TYPE                        BYTE                           !                    
                         END
                     END                       

Client               FILE,DRIVER('TOPSPEED'),NAME('..\data\Client.tps'),PRE(CLI),BINDABLE,THREAD !                    
ORDER_KEY                KEY(CLI:NUMBER),NOCASE,OPT        !                    
NAME_KEY                 KEY(CLI:LAST),DUP,NOCASE,OPT      !                    
HOLD_KEY                 KEY(CLI:HOLD),DUP,NOCASE,OPT      !                    
ZIP_NDX                  INDEX(CLI:ZIP)                    !                    
SALES_NDX                INDEX(CLI:SALESMAN,CLI:ZIP)       !                    
Record                   RECORD,PRE()
NUMBER                      LONG                           !                    
BILLING                     LONG                           !                    
LAST                        STRING(25)                     !                    
FIRST                       STRING(20)                     !                    
DEGREE                      STRING(5)                      !                    
Language                    STRING(1)                      !                    
ADDRESS1                    STRING(35)                     !                    
ADDRESS2                    STRING(35)                     !                    
CITY                        STRING(20)                     !                    
STATE                       STRING(2)                      !                    
ZIP                         STRING(10)                     !                    
CONTACT                     STRING(24)                     !                    
PHONE                       STRING(20)                     !                    
FAX                         STRING(20)                     !                    
Email                       STRING(60)                     !                    
Physician1                  STRING(40)                     !                    
Physician2                  STRING(40)                     !                    
Physician3                  STRING(40)                     !                    
Physician4                  STRING(40)                     !USED TO EXTEND eMAIL
ULONG8                      STRING(40)                     !                    
License1                    STRING(20)                     !                    
License2                    STRING(20)                     !                    
License3                    STRING(20)                     !                    
License4                    STRING(20)                     !                    
Country                     STRING(20)                     !                    
UPIN1                       STRING(20)                     !                    
UPIN2                       STRING(20)                     !                    
UPIN3                       STRING(20)                     !                    
UPIN4                       STRING(20)                     !                    
FedExNumber                 STRING(20)                     !                    
CLIA                        STRING(10)                     !clia                
MEDICAID                    STRING(9)                      !                    
BOTANICAL                   STRING(5)                      !                    
COURIER                     BYTE                           !                    
SUPPLY                      SHORT                          !                    
FOLLOW                      BYTE                           !                    
FOLLOW1                     STRING(255)                    !                    
FOLLOW2                     STRING(255)                    !                    
INVOICE                     BYTE                           !                    
REPORT                      STRING(1)                      !                    
FaxReport                   BYTE                           !                    
EmailReport                 BYTE                           !                    
Postal                      STRING(1)                      !                    
REPORTS                     BYTE                           !                    
ConsolidateReports          BYTE                           !                    
Pickup                      BYTE                           !                    
PATIENT_INFO                BYTE                           !                    
FeeL1E                      DECIMAL(5,2)                   !                    
FeeL2E                      DECIMAL(5,2)                   !                    
FeeL3E                      DECIMAL(5,2)                   !                    
FeeL4E                      DECIMAL(5,2)                   !                    
FeeL5E                      DECIMAL(5,2)                   !                    
FeeL1G                      DECIMAL(5,2)                   !                    
FeeL2G                      DECIMAL(5,2)                   !                    
FeeL3G                      DECIMAL(5,2)                   !                    
FeeL4G                      DECIMAL(5,2)                   !                    
FeeL5G                      DECIMAL(5,2)                   !                    
FeeL1G4                     DECIMAL(5,2)                   !                    
FeeL2G4                     DECIMAL(5,2)                   !                    
FeeL3G4                     DECIMAL(5,2)                   !                    
FeeL4G4                     DECIMAL(5,2)                   !                    
FeeL5G4                     DECIMAL(5,2)                   !                    
FeeL1T                      DECIMAL(5,2)                   !                    
FeeL2T                      DECIMAL(5,2)                   !                    
FeeL3T                      DECIMAL(5,2)                   !                    
FeeL4T                      DECIMAL(5,2)                   !                    
FeeL5T                      DECIMAL(5,2)                   !                    
SALESMAN                    STRING(3)                      !                    
Diet                        BYTE                           !                    
HOLD                        BYTE                           !                    
CLASS                       BYTE                           !                    
IMPORT                      STRING(1)                      !                    
ReportFormatCML             STRING(1)                      !                    
TESTCOMMENT                 BYTE                           !                    
Sex                         STRING(1)                      !                    
HL7                         STRING(1)                      !                    
NEW3                        STRING(1)                      !                    
                         END
                     END                       

Phone                FILE,DRIVER('TOPSPEED'),PRE(PHO),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PHO:Client),DUP,NOCASE,OPT    !                    
PhoneKey                 KEY(PHO:Phone),NOCASE,OPT         !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Phone                       DECIMAL(10)                    !                    
Note                        STRING(20)                     !                    
                         END
                     END                       

Physicians           FILE,DRIVER('TOPSPEED'),NAME('..\data\Physicians.tps'),PRE(PHY),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PHY:Client,PHY:Last),DUP,NOCASE !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Physician                   STRING(40)                     !                    
Upin                        STRING(20)                     !                    
License                     STRING(20)                     !                    
First                       STRING(32)                     !                    
Last                        STRING(32)                     !                    
                         END
                     END                       

Login                FILE,DRIVER('TOPSPEED'),NAME('..\data\Login.tps'),PRE(LI),CREATE,BINDABLE,THREAD !                    
STATUSKEY                KEY(LI:STATUS),DUP                !                    
DATEKEY                  KEY(LI:DATE,LI:INVOICE),DUP       !                    
Record                   RECORD,PRE()
INVOICE                     LONG                           !                    
STATUS                      STRING(1)                      !                    
DATE                        LONG                           !                    
                         END
                     END                       

LogInPanels          FILE,DRIVER('MEMORY'),NAME('LogInPanels'),PRE(LP),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(LP:PanelNumber),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
PanelNumber                 STRING(9)                      !                    
PanelDescription            STRING(24)                     !                    
IgECount                    USHORT                         !                    
VolumeIgE                   USHORT                         !                    
IgGCount                    USHORT                         !                    
VolumeIgG4                  USHORT                         !                    
IgG4Count                   USHORT                         !                    
VolumeIgG                   USHORT                         !                    
                         END
                     END                       

LogInPanelTests      FILE,DRIVER('MEMORY'),NAME('LogInPanelTests'),PRE(LPT),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(LPT:Panel,LPT:TYPE,LPT:CODE),NOCASE,PRIMARY !                    
RemoveDupsKey            KEY(LPT:CODE,LPT:TYPE),NOCASE     !                    
Record                   RECORD,PRE()
Panel                       STRING(9)                      !                    
CODE                        STRING(7)                      !                    
TYPE                        BYTE                           !                    
TypeDescription             STRING(4)                      !                    
TestDescription             STRING(30)                     !                    
                         END
                     END                       

LogInTests           FILE,DRIVER('MEMORY'),PRE(LT),CREATE,BINDABLE,THREAD !                    
CodeKey                  KEY(LT:Code),NOCASE,OPT,PRIMARY   !                    
IndexKey                 KEY(LT:Page,LT:Index),NOCASE      !                    
Record                   RECORD,PRE()
Page                        BYTE                           !                    
Index                       USHORT                         !                    
Code                        STRING(4)                      !                    
Description                 STRING(20)                     !                    
                         END
                     END                       

Log                  FILE,DRIVER('MEMORY'),PRE(LOG),BINDABLE,CREATE,THREAD !                    
OrderKey                 KEY(LOG:Page,LOG:CheckBox),DUP,NOCASE,OPT !                    
RequestAlpha             KEY(LOG:Sort,LOG:Description),DUP,NOCASE !                    
RequestKey               KEY(LOG:Sort,LOG:CheckBox),DUP,NOCASE,OPT !                    
AlphaKey                 KEY(LOG:Description),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Sort                        BYTE                           !                    
Code                        STRING(4)                      !                    
Description                 STRING(20)                     !                    
IgE                         STRING(1)                      !                    
IgG                         STRING(1)                      !                    
IgG4                        STRING(1)                      !                    
Page                        BYTE                           !                    
CheckBox                    BYTE                           !                    
locLowLimit                 SHORT                          !                    
locHighLimit                SHORT                          !                    
                         END
                     END                       

Patient              FILE,DRIVER('TOPSPEED'),NAME('..\data\Patient.tps'),PRE(Pat),BINDABLE,THREAD !                    
ORDER_KEY                KEY(Pat:LAST,Pat:FIRST,Pat:DATE),DUP,NOCASE !                    
INVOICE_KEY              KEY(Pat:INVOICE)                  !                    
DATE_KEY                 KEY(Pat:DATE,Pat:INVOICE),DUP     !                    
ACCESS_KEY               KEY(Pat:ACCESSION)                !                    
CLIENT_KEY               KEY(Pat:CLIENT,Pat:DATE),DUP      !                    
SHIP_KEY                 KEY(Pat:BILLED),DUP               !                    
Record                   RECORD,PRE()
ENTERED_BY                  STRING(2)                      !                    
VERIFIED_BY                 STRING(2)                      !                    
CLIENT                      LONG                           !                    
LAST                        STRING(20)                     !                    
FIRST                       STRING(15)                     !                    
INVOICE                     LONG                           !                    
DATE                        LONG                           !                    
STATUS                      STRING(1)                      !                    
RESULTS                     STRING(1)                      !                    
SUPPLIES                    STRING(1)                      !                    
SIGNATURE                   STRING(1)                      !                    
DUPLICATE                   STRING(1)                      !                    
AGE                         BYTE                           !                    
AGE_TYPE                    STRING(1)                      !                    
SEX                         STRING(1)                      !                    
COLLECTION                  LONG                           !                    
CLIENT_ID                   STRING(15)                     !                    
ACCESSION                   LONG                           !                    
BILLING                     STRING(1)                      !                    
CreditCard                  BYTE                           !                    
BILLED                      LONG                           !                    
VOLUME1                     DECIMAL(5,1)                   !                    
VOLUME2                     DECIMAL(5,1)                   !                    
Volume3                     DECIMAL(5,1)                   !                    
Volume4                     DECIMAL(5,1)                   !                    
Volume5                     DECIMAL(5,1)                   !                    
VOLUME                      DECIMAL(5,1)                   !                    
NEEDED                      DECIMAL(5,1)                   !                    
SpecimenType                SHORT                          !                    
DOB                         LONG                           !                    
Attributes                  LONG                           !                    
HSA4                        LONG                           !                    
IGE                         DECIMAL(3,2)                   !                    
IGG                         DECIMAL(3,2)                   !                    
IG4                         DECIMAL(3,2)                   !                    
ReportLanguage              STRING(1)                      !                    
CONTACT                     LONG                           !                    
FOLLOWUP                    STRING(1)                      !                    
Notes                       STRING(255)                    !                    
InHouseComments             STRING(255)                    !                    
AmendedReport               STRING(1)                      !                    
HL7                         STRING(1)                      !                    
SPARE3                      STRING(1)                      !                    
                         END
                     END                       

Patient4Week         FILE,DRIVER('MEMORY'),PRE(PAT4),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PAT4:Last,PAT4:DOB),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Last                        STRING(20)                     !                    
First                       STRING(15)                     !                    
Date                        LONG                           !                    
Number                      LONG                           !                    
DOB                         LONG                           !                    
                         END
                     END                       

FollowUp             FILE,DRIVER('TOPSPEED'),NAME('..\data\FollowUp.tps'),PRE(FU),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(FU:Client),DUP,NOCASE,OPT     !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
ClientName                  STRING(40)                     !                    
                         END
                     END                       

PatientName          FILE,DRIVER('MEMORY'),PRE(PN),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PN:Last,PN:First,-PN:Invoice),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Invoice                     LONG                           !                    
Date                        LONG                           !                    
Last                        STRING(20)                     !                    
First                       STRING(15)                     !                    
Status                      STRING(1)                      !                    
Age                         BYTE                           !                    
AgeType                     STRING(1)                      !                    
Number                      LONG                           !                    
ClientName                  STRING(40)                     !                    
                         END
                     END                       

Test                 FILE,DRIVER('TOPSPEED'),NAME('..\data\Test.tps'),PRE(TST),BINDABLE,CREATE,THREAD !                    
ORDER_KEY                KEY(TST:INVOICE,TST:TYPE,TST:CODE) !                    
STATUS_KEY               KEY(TST:STATUS,TST:INVOICE),DUP   !                    
Record                   RECORD,PRE()
INVOICE                     LONG                           !                    
ORDER                       SHORT                          !                    
CODE                        STRING(9)                      !                    
TYPE                        BYTE                           !                    
RANGE                       STRING(9)                      !                    
COUNT                       DECIMAL(9,2)                   !                    
Score                       STRING(3)                      !                    
STATUS                      STRING(1)                      !                    
MODIFIER                    STRING(1)                      !                    
FEE                         DECIMAL(7,2)                   !                    
Percentile                  LONG                           !                    
                         END
                     END                       

AddTests             FILE,DRIVER('TOPSPEED'),NAME('..\Data\AddTests.tps'),PRE(AT),CREATE,BINDABLE,THREAD !                    
locOrder                 KEY(AT:Patient,AT:Code,AT:Type),NOCASE !                    
Record                   RECORD,PRE()
Code                        STRING(9)                      !                    
Patient                     LONG                           !                    
Type                        BYTE                           !                    
                         END
                     END                       

Normals              FILE,DRIVER('TOPSPEED'),NAME('..\data\Normals.tps'),PRE(NOR),BINDABLE,THREAD !                    
Record                   RECORD,PRE()
CutOffDate                  DATE                           !                    
E0                          STRING(20)                     !                    
EE                          STRING(20)                     !                    
E1                          STRING(20)                     !                    
E2                          STRING(20)                     !                    
E3                          STRING(20)                     !                    
E4                          STRING(20)                     !                    
E5                          STRING(20)                     !                    
E6                          STRING(20)                     !                    
OffScaleHiE                 STRING(20)                     !                    
OffScaleLowE                STRING(20)                     !                    
G0                          STRING(20)                     !                    
GE                          STRING(20)                     !                    
G1                          STRING(20)                     !                    
G2                          STRING(20)                     !                    
G3                          STRING(20)                     !                    
G4                          STRING(20)                     !                    
G5                          STRING(20)                     !                    
G6                          STRING(20)                     !                    
OffScaleHiG                 STRING(20)                     !                    
OffScaleLowG                STRING(20)                     !                    
G40                         STRING(20)                     !                    
G4E                         STRING(20)                     !                    
G41                         STRING(20)                     !                    
G42                         STRING(20)                     !                    
G43                         STRING(20)                     !                    
G44                         STRING(20)                     !                    
G45                         STRING(20)                     !                    
G46                         STRING(20)                     !                    
OffScaleHiG4                STRING(20)                     !                    
OffScaleLowG4               STRING(20)                     !                    
SG40                        STRING(20)                     !                    
SG41                        STRING(20)                     !                    
SG42                        STRING(20)                     !                    
SG43                        STRING(20)                     !                    
SG44                        STRING(20)                     !                    
SG45                        STRING(20)                     !                    
OffScaleHiSG4               STRING(20)                     !                    
OffScaleLowSG4              STRING(20)                     !                    
SE0                         STRING(20)                     !                    
SEE                         STRING(20)                     !                    
SE1                         STRING(20)                     !                    
SE2                         STRING(20)                     !                    
SE3                         STRING(20)                     !                    
SE4                         STRING(20)                     !                    
SE5                         STRING(20)                     !                    
SE6                         STRING(20)                     !                    
OffScaleHiSE                STRING(20)                     !                    
OffScaleLowSE               STRING(20)                     !                    
SC0                         STRING(20)                     !                    
SCE                         STRING(20)                     !                    
SC1                         STRING(20)                     !                    
SG0                         STRING(20)                     !                    
SGE                         STRING(20)                     !                    
SG1                         STRING(20)                     !                    
ST0                         STRING(20)                     !                    
STE                         STRING(20)                     !                    
ST1                         STRING(20)                     !                    
SR0                         STRING(20)                     !                    
SRE                         STRING(20)                     !                    
SR1                         STRING(20)                     !                    
                         END
                     END                       

Salesman             FILE,DRIVER('TOPSPEED'),NAME('..\data\salesman.tps'),PRE(SM),BINDABLE,THREAD !                    
OrderKey                 KEY(SM:Initials),NOCASE,OPT       !                    
Record                   RECORD,PRE()
Initials                    STRING(3)                      !                    
                         END
                     END                       

Specialty            FILE,DRIVER('TOPSPEED'),NAME('..\data\specialty.tps'),PRE(SPY),BINDABLE,THREAD !                    
OrderKey                 KEY(SPY:Number),NOCASE,OPT        !                    
DisplayKey               KEY(SPY:Description),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Number                      BYTE                           !                    
Description                 STRING(20)                     !                    
                         END
                     END                       

Courier              FILE,DRIVER('TOPSPEED'),NAME('..\data\courier.tps'),PRE(COU),BINDABLE,THREAD !                    
OrderKey                 KEY(COU:Number),NOCASE,OPT        !                    
DisplayKey               KEY(COU:Description),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Number                      BYTE                           !                    
Description                 STRING(20)                     !                    
                         END
                     END                       

Supplies             FILE,DRIVER('TOPSPEED'),NAME('..\data\Supplies.TPS'),PRE(SUP),CREATE,BINDABLE !                    
ClientKey                KEY(SUP:Client,SUP:Shipped,-SUP:ShipDate),DUP,NOCASE,OPT !                    
FindUnShippedKey         KEY(SUP:Shipped),DUP,NOCASE       !                    
Record                   RECORD,PRE()
Shipped                     BYTE                           !Used for sort order, unshipped at top
ShipDate                    DATE                           !                    
Date                        DATE                           !                    
Client                      LONG                           !                    
Initials                    STRING(3)                      !                    
Quantity                    USHORT                         !                    
ShippedVia                  STRING(12)                     !                    
Tracking                    STRING(32)                     !                    
Note                        STRING(64)                     !                    
                         END
                     END                       

PickUp               FILE,DRIVER('TOPSPEED'),NAME('..\data\PickUp.tps'),PRE(PU),CREATE,BINDABLE,THREAD !                    
DateKey                  KEY(PU:Received,PU:Date),DUP,NOCASE,OPT !                    
ClientKey                KEY(PU:Client,PU:Received,PU:Date),DUP,NOCASE,OPT !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Date                        DATE                           !                    
Received                    BYTE                           !                    
ContactName                 STRING(20)                     !                    
Inititals                   STRING(3)                      !                    
Note                        STRING(20)                     !                    
                         END
                     END                       

SendOuts             FILE,DRIVER('TOPSPEED'),NAME('..\Data\SendOuts.tps'),PRE(SO),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(SO:Patient),NOCASE,OPT,PRIMARY !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Date                        LONG                           !                    
                         END
                     END                       

GAM                  FILE,DRIVER('TOPSPEED'),NAME('..\data\GAM.tps'),PRE(GAM),BINDABLE,THREAD !                    
OrderKey                 KEY(GAM:Type,GAM:AgeType,GAM:Age),NOCASE,OPT,PRIMARY !                    
Record                   RECORD,PRE()
AgeType                     STRING(1)                      !                    
Age                         BYTE                           !                    
Type                        BYTE                           !                    
LowerRange                  SHORT                          !                    
UpperRange                  SHORT                          !                    
                         END
                     END                       

PCodes               FILE,DRIVER('TOPSPEED'),OWNER('gW5x2WaP9S'),ENCRYPT,NAME('..\data\Codes.TPS'),PRE(PC),BINDABLE !                    
OrderKey                 KEY(PC:Initials),NOCASE,PRIMARY   !                    
CodeKey                  KEY(PC:PassCode),OPT              !                    
Record                   RECORD,PRE()
Initials                    STRING(3)                      !                    
PassCode                    STRING(20)                     !                    
Permissions                 ULONG                          !                    
                         END
                     END                       

Exceptions           FILE,DRIVER('TOPSPEED'),NAME('..\data\exceptions.tps'),PRE(EXC),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(EXC:Patient),DUP,NOCASE,OPT   !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Client                      LONG                           !                    
PatientStatus               STRING(1)                      !                    
Age                         STRING(1)                      !                    
StatusW                     STRING(1)                      !                    
StatusL                     STRING(1)                      !                    
StatusQ                     STRING(1)                      !                    
StatusC                     STRING(1)                      !                    
StatusH                     STRING(1)                      !Held                
StatusX                     STRING(1)                      !Spare               
StatusY                     STRING(1)                      !Spare               
StatusZ                     STRING(1)                      !Spare               
Attributes                  ULONG                          !Not Used            
                         END
                     END                       

EventsTable          FILE,DRIVER('MEMORY'),PRE(ET),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
EventNumber                 LONG                           !                    
FiledNumber                 LONG                           !                    
Keys                        LONG                           !                    
Client                      LONG                           !                    
                         END
                     END                       

Online               FILE,DRIVER('TOPSPEED'),NAME('..\data\Online.tps'),PRE(OL),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Date                        DATE                           !                    
Time                        TIME                           !                    
Number                      ULONG                          !                    
PCAE                        BYTE                           !                    
                         END
                     END                       

Upload               FILE,DRIVER('MEMORY'),PRE(UP),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(UP:PCAE),DUP,NOCASE,OPT       !                    
Record                   RECORD,PRE()
Number                      ULONG                          !                    
PCAE                        BYTE                           !                    
                         END
                     END                       

ToDo                 FILE,DRIVER('TOPSPEED'),NAME('..\data\ToDo.tps'),PRE(ToD),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(ToD:ID),NOCASE                !                    
DateKey                  KEY(ToD:Due),DUP,NOCASE           !                    
ForKey                   KEY(ToD:For,ToD:Due),DUP,NOCASE   !                    
DupKey                   KEY(ToD:Patient,ToD:Attributes),NOCASE !Eliminates Duplicates
Record                   RECORD,PRE()
ID                          ULONG                          !                    
Description                 STRING(64)                     !                    
Patient                     LONG                           !                    
Client                      LONG                           !                    
Date                        DATE                           !                    
Due                         DATE                           !                    
For                         STRING(3)                      !                    
EnteredBy                   STRING(3)                      !                    
Attributes                  ULONG                          !                    
                         END
                     END                       

ResultsSendout       FILE,DRIVER('TOPSPEED'),NAME('..\data\ResultsSendout.tps'),PRE(RS),BINDABLE,CREATE,THREAD !                    
OrderKey                 KEY(RS:Patient),DUP,NOCASE        !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Code                        STRING(4),DIM(12)              !                    
Type                        BYTE,DIM(12)                   !                    
TypeText                    STRING(4),DIM(12)              !                    
EnteredBy                   STRING(3),DIM(2)               !                    
Score                       STRING(20),DIM(2,12)           !                    
TextResult                  STRING(8),DIM(2,12)            !                    
OutRangeHi                  BYTE,DIM(2,12)                 !                    
OutRangeLow                 BYTE,DIM(2,12)                 !                    
                         END
                     END                       

PDF                  FILE,DRIVER('TOPSPEED'),NAME('..\data\pdf.tps'),PRE(PDF),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PDF:PDF),NOCASE               !                    
Record                   RECORD,PRE()
PDF                         STRING(8)                      !                    
                         END
                     END                       

Billing              FILE,DRIVER('TOPSPEED'),NAME('..\data\billing.tps'),PRE(BILL),CREATE,BINDABLE,THREAD !                    
DateKey                  KEY(BILL:DateFax1),DUP,NOCASE     !                    
OrderKey                 KEY(BILL:LastNamePatient,BILL:FirstNamePatient),NOCASE,OPT !                    
qbKey                    KEY(BILL:QB),DUP,NOCASE           !                    
patKey                   KEY(BILL:Accession),DUP,NOCASE    !                    
NextLetterKey            KEY(BILL:NextLetter),DUP,NOCASE,OPT !                    
Comment                     MEMO(1000)                     !                    
Record                   RECORD,PRE()
Invoice                     LONG                           !                    
Status                      STRING(2)                      !                    
Selected                    LONG                           !                    
AccountType                 LONG                           !                    
Accession                   ULONG                          !                    
QB                          STRING(16)                     !                    
InsuranceQB                 STRING(16)                     !                    
PatientQB                   STRING(16)                     !                    
NameList                    ULONG                          !                    
Client                      LONG                           !                    
Physician                   STRING(40)                     !                    
Spare                       DECIMAL(10)                    !Added for 500258    
DateFax1                    DATE                           !                    
DateFax2                    DATE                           !                    
Description                 STRING(40)                     !                    
LastNamePatient             STRING(24)                     !                    
FirstNamePatient            STRING(24)                     !                    
SalutationPatient           STRING(4)                      !                    
AddressPatient              STRING(32)                     !                    
Address2Patient             STRING(32)                     !                    
Contact                     STRING(32)                     !                    
CityPatient                 STRING(16)                     !                    
StatePatient                STRING(2)                      !                    
PostalPatient               STRING(10)                     !                    
emailPatient                STRING(64)                     !                    
PhonePatient                STRING(20)                     !                    
PhoneAltPatient             STRING(20)                     !                    
CovidPostDate               DATE                           !                    
ClientRequestCheckmarks     STRING(8)                      !                    
RelationshipToInsured       LONG                           !                    
ConditionRelatedTo          STRING(1),DIM(3)               !                    
IdInsured                   STRING(32)                     !                    
PlanName                    STRING(64)                     !                    
PolicyGroupInsured          STRING(32)                     !                    
AnotherPlan                 LONG                           !Yes No?             
LastNameInsured             STRING(32)                     !                    
FirstNameInsured            STRING(32)                     !                    
AddressInsured              STRING(32)                     !                    
CityInsured                 STRING(32)                     !                    
StateInsured                STRING(2)                      !                    
PostalInsured               STRING(32)                     !                    
EmailInsured                STRING(64)                     !                    
PhoneAltInsured             STRING(20)                     !                    
PhoneInsured                STRING(20)                     !                    
DoBInsured                  DATE                           !                    
GenderInsured               STRING(8)                      !                    
PlanNameInsured             STRING(64)                     !                    
OtherPlanName               STRING(64)                     !                    
LastNameOther               STRING(32)                     !                    
FirstNameOther              STRING(32)                     !                    
Letter1                     DATE                           !                    
Letter2                     DATE                           !                    
Letter3                     DATE                           !                    
Letter4                     DATE                           !                    
Letter5                     DATE                           !                    
NextLetter                  DATE                           !                    
LastLetter                  DATE                           !                    
LetterNotes                 SHORT                          !                    
FeeType                     LONG                           !                    
Network                     ULONG                          !                    
InsuranceBilled             DECIMAL(7,2)                   !                    
InsurancePaid               STRING(8)                      !                    
InsuranceAdj                DECIMAL(7,2)                   !                    
PatientFeeAmount            DECIMAL(7,2)                   !                    
PatientAdj                  DECIMAL(7,2)                   !                    
OtherAdj                    DECIMAL(7,2)                   !                    
PatientResponsibility       DECIMAL(7,2)                   !                    
Payments                    DECIMAL(7,2)                   !                    
OutStanding                 DECIMAL(7,2)                   !                    
Attribute                   ULONG                          !                    
WriteOff                    ULONG                          !                    
PaymentPlan                 STRING(2)                      !                    
LetterComment               STRING(255)                    !                    
Relationship                STRING(8)                      !                    
Guarantor                   STRING(16)                     !                    
GuarantorName               STRING(32)                     !                    
GuarantorAddress2           STRING(32)                     !                    
Phone                       DECIMAL(11)                    !                    
PhoneAlt                    DECIMAL(11)                    !                    
Condition                   STRING(16)                     !                    
DateIllness                 DATE                           !                    
DoV                         DATE                           !                    
Vacination                  SHORT                          !                    
Diagnosis                   DECIMAL(10)                    !                    
ICD                         BYTE                           !                    
CovID                       ULONG                          !                    
Account                     DECIMAL(10)                    !                    
Assignment                  BYTE                           !                    
Provider                    DECIMAL(12)                    !                    
VerifiedBy                  STRING(3)                      !                    
VerifiedBy2                 STRING(3)                      !                    
                         END
                     END                       

NameList             FILE,DRIVER('TOPSPEED'),NAME('..\data\NameList.tps'),PRE(NAM),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(NAM:Number),DUP,NOCASE        !                    
ContactKey               KEY(NAM:Contact),DUP,NOCASE       !                    
NameKey                  KEY(NAM:Name),DUP,NOCASE          !                    
Record                   RECORD,PRE()
Number                      DECIMAL(11)                    !                    
Contact                     STRING(24)                     !                    
Name                        STRING(32)                     !                    
Address1                    STRING(32)                     !                    
Address2                    STRING(32)                     !                    
City                        STRING(20)                     !                    
State                       STRING(2)                      !                    
OldZipCode                  STRING(5),NAME('Zip=N(5,0)')   !Use PostalCode      
Country                     STRING(20)                     !                    
Email                       STRING(40)                     !                    
Website                     STRING(40)                     !                    
Type                        STRING(1)                      !                    
PricingLevel                BYTE                           !                    
Terms                       STRING(12)                     !                    
CreditCard                  STRING(20)                     !                    
Exp                         STRING(4)                      !                    
Language                    BYTE                           !                    
DeliveryCharge              BYTE                           !                    
DeliveryAmount              DECIMAL(5,2)                   !                    
Campaign                    LONG                           !                    
Date                        LONG                           !                    
LastContactDate             DATE                           !                    
LastContactType             SHORT                          !                    
Count                       ULONG                          !                    
Amount                      DECIMAL(7,2)                   !                    
Postalcode                  STRING(20)                     !                    
Mobile                      STRING(20)                     !                    
Field3                      STRING(60)                     !                    
Field4                      STRING(60)                     !                    
NonTaxableYN                STRING(1)                      !                    
YesNo2                      STRING(1)                      !                    
For                         STRING(6)                      !                    
Note                        STRING(250)                    !                    
                         END
                     END                       

Payments             FILE,DRIVER('TOPSPEED'),NAME('..\data\payments.tps'),PRE(Pay),CREATE,BINDABLE,THREAD !                    
DateKey                  KEY(Pay:Date),DUP,NOCASE          !                    
OrderKey                 KEY(Pay:Invoice,Pay:Date),DUP,NOCASE !                    
Record                   RECORD,PRE()
Invoice                     ULONG                          !                    
Type                        STRING(16)                     !                    
Date                        DATE                           !                    
Amount                      DECIMAL(7,2)                   !                    
Reference                   STRING(32)                     !                    
Applied                     DECIMAL(7,2)                   !                    
ApplyTo                     STRING(32)                     !                    
Adjustment                  DECIMAL(7,2)                   !                    
Note                        STRING(255)                    !                    
Attributes                  ULONG                          !                    
                         END
                     END                       

Insurance            FILE,DRIVER('TOPSPEED'),NAME('..\data\Insurance.tps'),PRE(Ins),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(Ins:Accession,Ins:From),DUP,NOCASE !                    
Record                   RECORD,PRE()
Accession                   LONG                           !                    
From                        DATE                           !                    
Too                         DATE                           !                    
Place                       STRING(2)                      !                    
CPT                         LONG                           !                    
Modifier                    STRING(1)                      !                    
Charges                     DECIMAL(7,2)                   !                    
Units                       SHORT                          !                    
EPSDT                       BYTE                           !                    
QualID                      DECIMAL(12)                    !                    
Provider                    DECIMAL(12)                    !                    
                         END
                     END                       

Providers            FILE,DRIVER('TOPSPEED'),NAME('..\data\Providers.tps'),PRE(Pro),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Number                      STRING(16)                     !                    
Group                       STRING(16)                     !                    
Description                 STRING(20)                     !                    
                         END
                     END                       

PayType              FILE,DRIVER('TOPSPEED'),NAME('..\data\payType.tps'),PRE(Pay1),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Type                        STRING(16)                     !                    
                         END
                     END                       

Fees                 FILE,DRIVER('TOPSPEED'),NAME('..\data\fees.tps'),PRE(FEE),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(FEE:Client),NOCASE            !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
TIgE                        DECIMAL(7,2)                   !                    
TIgG                        DECIMAL(7,2)                   !                    
TIgA                        DECIMAL(7,2)                   !                    
TIgM                        DECIMAL(7,2)                   !                    
IgE                         DECIMAL(7,2)                   !                    
IgG                         DECIMAL(7,2)                   !                    
IgG4                        DECIMAL(7,2)                   !                    
mxIgE                       DECIMAL(7,2)                   !                    
mxIgG                       DECIMAL(7,2)                   !                    
mxIgG4                      DECIMAL(7,2)                   !                    
hyIgE                       DECIMAL(7,2)                   !                    
hyIgG                       DECIMAL(7,2)                   !                    
hyIgG4                      DECIMAL(7,2)                   !                    
occIgE                      DECIMAL(7,2)                   !                    
occIgG                      DECIMAL(7,2)                   !                    
occIgG4                     DECIMAL(7,2)                   !                    
chemIgE                     DECIMAL(7,2)                   !                    
chemIgG                     DECIMAL(7,2)                   !                    
chemIgG4                    DECIMAL(7,2)                   !                    
Panel260                    DECIMAL(7,2)                   !                    
Panel260S145                DECIMAL(7,2)                   !                    
Panel270                    DECIMAL(7,2)                   !                    
ComponentIgE                DECIMAL(7,2)                   !                    
ComponentIgG                DECIMAL(7,2)                   !                    
ComponentIgG4               DECIMAL(7,2)                   !                    
Virus                       DECIMAL(7,2)                   !                    
New2                        DECIMAL(7,2)                   !                    
Type                        STRING(1)                      !                    
                         END
                     END                       

BillingItems         FILE,DRIVER('TOPSPEED'),NAME('..\Data\BillingItems.tps'),PRE(BI),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(BI:Patient),DUP,NOCASE        !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Qty                         LONG                           !                    
Description                 STRING(32)                     !                    
Price                       DECIMAL(7,2)                   !                    
Attributes                  ULONG                          !                    
                         END
                     END                       

BillingReadIn        FILE,DRIVER('MEMORY'),PRE(BRI),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(BRI:Patient),NOCASE           !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
                         END
                     END                       

VerifyPatient        FILE,DRIVER('MEMORY'),PRE(VP),CREATE,BINDABLE,THREAD !                    
CodeKey                  KEY(VP:Code),DUP,NOCASE           !                    
OrderKey                 KEY(VP:Order),DUP,NOCASE          !                    
Record                   RECORD,PRE()
Order                       LONG                           !                    
Code                        STRING(8)                      !                    
Description                 STRING(32)                     !                    
IgE                         LONG                           !                    
IgG                         LONG                           !                    
IgG4                        LONG                           !                    
saveIgE                     LONG                           !                    
saveIgG4                    LONG                           !                    
saveIgG                     LONG                           !                    
                         END
                     END                       

DeleteTests          FILE,DRIVER('TOPSPEED'),RECLAIM,NAME('..\data\DeleteTests.tps'),PRE(DT),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(DT:Patient,DT:Code,DT:Type),DUP,NOCASE !                    
Record                   RECORD,PRE()
Code                        STRING(4)                      !                    
Patient                     LONG                           !                    
Type                        BYTE                           !                    
                         END
                     END                       

TestMem              FILE,DRIVER('TOPSPEED'),NAME('..\data\TestNew.tps'),PRE(TM),BINDABLE,CREATE,THREAD !                    
ORDER_KEY                KEY(TM:INVOICE,TM:TYPE,TM:CODE)   !                    
STATUS_KEY               KEY(TM:STATUS,TM:INVOICE),DUP     !                    
Record                   RECORD,PRE()
INVOICE                     LONG                           !                    
ORDER                       SHORT                          !                    
CODE                        STRING(9)                      !                    
TYPE                        BYTE                           !                    
RANGE                       STRING(9)                      !                    
COUNT                       DECIMAL(9,2)                   !                    
Score                       STRING(3)                      !                    
STATUS                      STRING(1)                      !                    
MODIFIER                    STRING(1)                      !                    
FEE                         DECIMAL(7,2)                   !                    
DATE                        LONG                           !                    
                         END
                     END                       

Service              FILE,DRIVER('MEMORY'),PRE(Ser),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(Ser:Patient),DUP,NOCASE       !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Month                       BYTE                           !                    
Day                         BYTE                           !                    
Year                        BYTE                           !                    
PlaceOfService              BYTE                           !                    
CTP                         STRING(16)                     !                    
DiagPointer                 STRING(1)                      !                    
Charges                     DECIMAL(7,2)                   !                    
Units                       BYTE                           !                    
                         END
                     END                       

ExportList           FILE,DRIVER('MEMORY'),PRE(EL),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(EL:Status,EL:Assession),NOCASE !                    
BilledKey                KEY(EL:BilledDate),DUP,NOCASE     !                    
Record                   RECORD,PRE()
Status                      LONG                           !                    
FaxDates                    BYTE                           !                    
Assession                   STRING(10)                     !                    
Date                        DATE                           !                    
BilledDate                  LONG                           !                    
Last                        STRING(32)                     !                    
First                       STRING(32)                     !                    
Client                      STRING(8)                      !                    
Billing                     LONG                           !                    
Verified                    STRING(1)                      !                    
                         END
                     END                       

MedicareTests        FILE,DRIVER('MEMORY'),PRE(MT),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(MT:Patient,MT:Type),DUP,NOCASE !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Code                        STRING(9)                      !                    
Type                        LONG                           !                    
                         END
                     END                       

payers               FILE,DRIVER('TOPSPEED'),NAME('..\data\payers.tps'),PRE(PA),CREATE,BINDABLE,THREAD !                    
PayerKey                 KEY(PA:Payer),DUP,NOCASE          !                    
OrderKey                 KEY(PA:Payer),NOCASE              !                    
Record                   RECORD,PRE()
ID                          STRING(16)                     !                    
Payer                       STRING(64)                     !                    
                         END
                     END                       

Claims               FILE,DRIVER('TOPSPEED'),NAME('..\data\Claims.tps'),PRE(CLM),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(CLM:Patient),DUP,NOCASE       !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Client                      LONG                           !                    
PatientAccountNumber        STRING(32)                     !                    
ReferingProvider            STRING(32)                     !                    
PlanID                      STRING(32)                     !                    
PayerID                     STRING(32)                     !                    
PlanName                    STRING(64)                     !                    
BPAddress1                  STRING(32)                     !                    
PBAddress2                  STRING(20)                     !                    
BPAddress3                  STRING(20)                     !                    
DiagCode1                   STRING(32)                     !                    
DiagCode2                   STRING(32)                     !                    
DiagCode3                   STRING(32)                     !                    
Physician                   STRING(32)                     !                    
NPI                         STRING(32)                     !                    
MemberID                    STRING(32)                     !                    
PlanID2                     STRING(32)                     !                    
PlanName2                   STRING(64)                     !                    
MemberID2                   STRING(32)                     !                    
PlanType                    STRING(32)                     !                    
Unused5                     STRING(32)                     !                    
Unused4                     STRING(32)                     !                    
ClientBillingID             STRING(32)                     !                    
OrderNumber                 STRING(32)                     !                    
Barcode                     STRING(32)                     !                    
                         END
                     END                       

ChangeCare           FILE,DRIVER('TOPSPEED'),NAME('..\data\ChangeCare.tps'),PRE(CC),CREATE,BINDABLE,THREAD !LIst of claims uploaded to changecare
OrderKey                 KEY(CC:Patient),NOCASE            !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
Date                        DATE                           !                    
Time                        TIME                           !                    
Verified                    LONG                           !                    
                         END
                     END                       

Temp                 FILE,DRIVER('TOPSPEED'),PRE(TMP),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(TMP:Client,TMP:Last),DUP,NOCASE !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Physician                   STRING(40)                     !                    
NPI                         STRING(20)                     !                    
Degree                      STRING(20)                     !                    
First                       STRING(32)                     !                    
Last                        STRING(32)                     !                    
                         END
                     END                       

ExportIns            FILE,DRIVER('MEMORY'),PRE(EI),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(EI:ServiceCode),NOCASE        !                    
Record                   RECORD,PRE()
ServiceCode                 LONG                           !                    
Fee                         DECIMAL(7,2)                   !                    
Qty                         LONG                           !                    
                         END
                     END                       

DiagnosticCodes      FILE,DRIVER('TOPSPEED'),NAME('..\data\DiagnosticCodes.tps'),PRE(DC),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(DC:Code),NOCASE               !                    
Record                   RECORD,PRE()
Code                        STRING(16)                     !                    
                         END
                     END                       

Accession            FILE,DRIVER('MEMORY'),PRE(ACC),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(ACC:Number),NOCASE            !                    
Record                   RECORD,PRE()
Number                      LONG                           !                    
                         END
                     END                       

RequestForms         FILE,DRIVER('TOPSPEED'),NAME('..\data\RequestForms.tps'),PRE(RF),CREATE,BINDABLE,THREAD !                    
DateKey                  KEY(RF:Date,RF:Accession),DUP,NOCASE !                    
OrderKey                 KEY(RF:Accession),NOCASE          !                    
Record                   RECORD,PRE()
Accession                   LONG                           !                    
Date                        DATE                           !                    
Sequence                    LONG                           !                    
                         END
                     END                       

ExportCovid          FILE,DRIVER('TOPSPEED'),PRE(EC),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(EC:State,EC:Accession,EC:TestCode,EC:TestType),NOCASE !                    
Record                   RECORD,PRE()
Accession                   LONG                           !                    
State                       STRING(2)                      !                    
TestCode                    STRING(4)                      !                    
TestType                    LONG                           !                    
Result                      STRING(8)                      !                    
Score                       STRING(3)                      !                    
                         END
                     END                       

CovidOrders          FILE,DRIVER('TOPSPEED'),NAME('..\data\CovidOrders.tps'),PRE(Cov),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(Cov:id),NOCASE,PRIMARY        !                    
Record                   RECORD,PRE()
id                          LONG                           !                    
Accession                   LONG                           !                    
Date                        STRING(10)                     !                    
LastName                    STRING(32)                     !                    
FirstName                   STRING(32)                     !                    
Address1                    STRING(32)                     !                    
Address2                    STRING(32)                     !                    
City                        STRING(20)                     !                    
State                       STRING(2)                      !                    
Zip                         STRING(10)                     !                    
Phone                       STRING(20)                     !                    
DOB                         DATE                           !                    
Sex                         LONG                           !                    
Race                        LONG                           !                    
Ethnicity                   LONG                           !                    
email                       STRING(64)                     !                    
Insurance                   STRING(20)                     !                    
Payer                       STRING(20)                     !                    
MemberID                    STRING(20)                     !                    
VaxBrand                    LONG                           !                    
dov                         STRING(10)                     !                    
vaccinated                  LONG                           !                    
status                      LONG                           !                    
                         END
                     END                       

PrintList            FILE,DRIVER('TOPSPEED'),NAME('..\data\PrintList.tps'),PRE(PL),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PL:Patient),NOCASE            !                    
Record                   RECORD,PRE()
Patient                     LONG                           !                    
                         END
                     END                       

PatientList          FILE,DRIVER('TOPSPEED'),NAME('..\data\PatientList'),PRE(PatL),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(PatL:Accession),NOCASE        !                    
Record                   RECORD,PRE()
Accession                   LONG                           !                    
                         END
                     END                       

CPL                  FILE,DRIVER('TOPSPEED'),NAME('..\data\CPL.tps'),PRE(CPL),CREATE,BINDABLE,THREAD !                    
Record                   RECORD,PRE()
Accession                   LONG                           !                    
                         END
                     END                       

NewPanels            FILE,DRIVER('TOPSPEED'),NAME('..\data\NewPanel.tps'),PRE(NP),CREATE,BINDABLE,THREAD !                    
Order_Key                KEY(NP:Number),NOCASE,OPT         !                    
Record                   RECORD,PRE()
Number                      STRING(9)                      !                    
Description                 STRING(64)                     !                    
Fee                         DECIMAL(7,2)                   !                    
IgE                         LONG                           !                    
IgG                         LONG                           !                    
IgG4                        LONG                           !                    
Mix                         LONG                           !                    
TotalIgE                    LONG                           !                    
Tests                       LONG                           !                    
SpareLong                   LONG                           !                    
SpareString                 STRING(32)                     !                    
                         END
                     END                       

HL7                  FILE,DRIVER('TOPSPEED'),NAME('..\data\HL7.tps'),PRE(HL7),CREATE,BINDABLE,THREAD !                    
OrderKey                 KEY(HL7:Client,HL7:Accession),NOCASE !                    
Record                   RECORD,PRE()
Client                      LONG                           !                    
Accession                   LONG                           !                    
                         END
                     END                       

!endregion


!// List Format Manager declaration -------------------------------------START-

LFM_CFile            FILE,PRE(CFG),CREATE,DRIVER('TopSpeed'),THREAD,NAME('Formats.FDB')
key_Main               KEY(+CFG:AppName,+CFG:ProcId,+CFG:UserId,+CFG:CtrlId,+CFG:FormatId),OPT,NOCASE
Record                 RECORD,PRE()
AppName                  STRING(30)                        ! Procedure identifier
ProcId                   STRING(30)                        ! Procedure identifier
UserId                   SHORT                             ! User identifier
CtrlId                   SHORT                             ! Control identifier
FormatId                 SHORT                             ! Format identifier
FormatName               STRING(30)                        ! Format name
Flag                     BYTE                              ! Default/current flag
Format                   STRING(5120)                      ! Format buffer
VarLine                  STRING(2048)                      ! Variable buffer
                       END
                     END

!// List Format Manager declaration ---------------------------------------END-
gloPatientNotes STRING(127),DIM(2),OVER(PAT:Notes)
gloInhouseNotes STRING(199),OVER(Pat:InHouseComments)
gloPatientDates LONG,DIM(63),OVER(Pat:InHouseComments)
gloTotalEConc   DECIMAL(7,2)

gloTestCodeStartsWith1  STRING(1),OVER(TST:Code)  ! Gets First char of tst:code rather than using sub(tst:code,1,1)
gloTestCodeStartsWith2  STRING(2),OVER(TST:Code)
gloTestCodeStartsWith3  STRING(3),OVER(TST:Code)
gloTestCodeStartsWith4  STRING(4),OVER(TST:Code)

TYPE:IgE             EQUATE(1)
TYPE:IgG             EQUATE(2)
TYPE:IgG4            EQUATE(3)
TYPE:TIgG            EQUATE(4)
TYPE:TIgA            EQUATE(5)
TYPE:TIgM            EQUATE(6) 
TYPE:IVG             EQUATE(7) 
TYPE:IVM             EQUATE(8) 
TYPE:Panel           EQUATE(10)
TYPE:Error           EQUATE(11)

TIGE:Complete        EQUATE(8)
TIGE:Follow          EQUATE(4)
TIGE:Final           EQUATE(16)

PANEL:Client         EQUATE(1)
PANEL:Standard       EQUATE(0)

LABEL:Serum1  EQUATE(1)
LABEL:Serum2  EQUATE(2)
LABEL:Serum3  EQUATE(4)

DTR             BYTE
CTS             BYTE
ONESTOPBIT      EQUATE(1)
NOPARITY        EQUATE(0)



gloReverseLookup     STRING(1)
Capfile              CSTRING(255)
CommPort             SHORT
gloPort              SHORT
ParentWin            USHORT
InitStr              CSTRING(256)
CommPortError        SHORT
CommStatus           SHORT

ONLINE:Patient       EQUATE(1)
ONLINE:Client        EQUATE(2)
ONLINE:Add           EQUATE(4)
ONLINE:Change        EQUATE(8)

ACCESS:Admin          EQUATE(1)
ACCESS:Clients        EQUATE(2)
ACCESS:EditClients    EQUATE(4)
ACCESS:Patients       EQUATE(8)
ACCESS:EditPatients   EQUATE(16)
ACCESS:PatientLogIn   EQUATE(32)
ACCESS:Verify         EQUATE(64)
ACCESS:Workpool       EQUATE(128)
ACCESS:ReadInResults  EQUATE(256)
ACCESS:PrintResults   EQUATE(512)
ACCESS:ViewResults    EQUATE(1024)
ACCESS:Database       EQUATE(2048)
ACCESS:Analysis       EQUATE(4096)
ACCESS:Financials     EQUATE(8192)
ACCESS:WebPassword    EQUATE(16384)

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

CLIENT:Postal_Y        EQUATE('Y')
CLIENT:English_E       EQUATE('E')
CLIENT:Spanish_S       EQUATE('S')
CLIENT:LanguageBoth_B  EQUATE('B')

CLIENT:Fax             EQUATE(2)
CLIENT:Email           EQUATE(8)
CLIENT:Followup        EQUATE(16)
CLIENT:OnHold          EQUATE(32)
CLIENT:Consolidate     EQUATE(64)

DOC:Page2              EQUATE(1)  ! page = Page Number - 1
DOC:Page3              EQUATE(2)
DOC:Page4              EQUATE(3)
DOC:Text               EQUATE(8)  ! 0 = RTF
DOC:Email              EQUATE(8)
DOC:Spanish            EQUATE(16)
DOC:Female             EQUATE(32)
DOC:Dust               EQUATE(256)
DOC:Food               EQUATE(512)
DOC:Mold               EQUATE(1024)
DOC:Pollen             EQUATE(2048)
DOC:Results            EQUATE(4096)
DOC:Confirmation       EQUATE(8192) 
DOC:Supplies           EQUATE(16384)
DOC:SignatureRequest   EQUATE(32768)
DOC:CreditCard         EQUATE(65536)
DOC:Confidentiality    EQUATE(131072)
DOC:FaxCover           EQUATE(262144)
DOC:AllowEdit          EQUATE(1073741824)
DOC:IncludeTest        EQUATE(2147483648) ! INCLUDE PATIENT TESTS IN DOCUMENT  
DOC:DocFilename        EQUATE(0BFFFFFFFH)     ! MASK ALLOW EDIT

DOC:PageNumber        EQUATE(7)     ! NUMBER MASK
DOC:DocNumber         EQUATE(0FF0h) ! DOC NUMBER MASK


PAT:AgeNeeded          EQUATE(1)


! Patients Status Exceprions

EX:Complete  EQUATE(1)
EX:Login     EQUATE(2)
EX:WorkPool  EQUATE(4)
EX:QNS       EQUATE(8)
EX:Age       EQUATE(16)
EX:Held      EQUATE(32)


CLI:OVERULONG8 ULONG,DIM(8),OVER(CLI:ULONG8)

CLI:FollowupDate LONG,OVER(CLI:ULONG8)


Access:Cli_panl      &FileManager,THREAD                   ! FileManager for Cli_panl
Relate:Cli_panl      &RelationManager,THREAD               ! RelationManager for Cli_panl
Access:ClientPanelTests &FileManager,THREAD                ! FileManager for ClientPanelTests
Relate:ClientPanelTests &RelationManager,THREAD            ! RelationManager for ClientPanelTests
Access:PanelReview   &FileManager,THREAD                   ! FileManager for PanelReview
Relate:PanelReview   &RelationManager,THREAD               ! RelationManager for PanelReview
Access:Docs          &FileManager,THREAD                   ! FileManager for Docs
Relate:Docs          &RelationManager,THREAD               ! RelationManager for Docs
Access:Text          &FileManager,THREAD                   ! FileManager for Text
Relate:Text          &RelationManager,THREAD               ! RelationManager for Text
Access:plates        &FileManager,THREAD                   ! FileManager for plates
Relate:plates        &RelationManager,THREAD               ! RelationManager for plates
Access:template      &FileManager,THREAD                   ! FileManager for template
Relate:template      &RelationManager,THREAD               ! RelationManager for template
Access:Setup         &FileManager,THREAD                   ! FileManager for Setup
Relate:Setup         &RelationManager,THREAD               ! RelationManager for Setup
Access:wpSetup       &FileManager,THREAD                   ! FileManager for wpSetup
Relate:wpSetup       &RelationManager,THREAD               ! RelationManager for wpSetup
Access:Monitor       &FileManager,THREAD                   ! FileManager for Monitor
Relate:Monitor       &RelationManager,THREAD               ! RelationManager for Monitor
Access:SpecimenReceived &FileManager,THREAD                ! FileManager for SpecimenReceived
Relate:SpecimenReceived &RelationManager,THREAD            ! RelationManager for SpecimenReceived
Access:Botanical     &FileManager,THREAD                   ! FileManager for Botanical
Relate:Botanical     &RelationManager,THREAD               ! RelationManager for Botanical
Access:Rast          &FileManager,THREAD                   ! FileManager for Rast
Relate:Rast          &RelationManager,THREAD               ! RelationManager for Rast
Access:Panels        &FileManager,THREAD                   ! FileManager for Panels
Relate:Panels        &RelationManager,THREAD               ! RelationManager for Panels
Access:Pnl_test      &FileManager,THREAD                   ! FileManager for Pnl_test
Relate:Pnl_test      &RelationManager,THREAD               ! RelationManager for Pnl_test
Access:Client        &FileManager,THREAD                   ! FileManager for Client
Relate:Client        &RelationManager,THREAD               ! RelationManager for Client
Access:Phone         &FileManager,THREAD                   ! FileManager for Phone
Relate:Phone         &RelationManager,THREAD               ! RelationManager for Phone
Access:Physicians    &FileManager,THREAD                   ! FileManager for Physicians
Relate:Physicians    &RelationManager,THREAD               ! RelationManager for Physicians
Access:Login         &FileManager,THREAD                   ! FileManager for Login
Relate:Login         &RelationManager,THREAD               ! RelationManager for Login
Access:LogInPanels   &FileManager,THREAD                   ! FileManager for LogInPanels
Relate:LogInPanels   &RelationManager,THREAD               ! RelationManager for LogInPanels
Access:LogInPanelTests &FileManager,THREAD                 ! FileManager for LogInPanelTests
Relate:LogInPanelTests &RelationManager,THREAD             ! RelationManager for LogInPanelTests
Access:LogInTests    &FileManager,THREAD                   ! FileManager for LogInTests
Relate:LogInTests    &RelationManager,THREAD               ! RelationManager for LogInTests
Access:Log           &FileManager,THREAD                   ! FileManager for Log
Relate:Log           &RelationManager,THREAD               ! RelationManager for Log
Access:Patient       &FileManager,THREAD                   ! FileManager for Patient
Relate:Patient       &RelationManager,THREAD               ! RelationManager for Patient
Access:Patient4Week  &FileManager,THREAD                   ! FileManager for Patient4Week
Relate:Patient4Week  &RelationManager,THREAD               ! RelationManager for Patient4Week
Access:FollowUp      &FileManager,THREAD                   ! FileManager for FollowUp
Relate:FollowUp      &RelationManager,THREAD               ! RelationManager for FollowUp
Access:PatientName   &FileManager,THREAD                   ! FileManager for PatientName
Relate:PatientName   &RelationManager,THREAD               ! RelationManager for PatientName
Access:Test          &FileManager,THREAD                   ! FileManager for Test
Relate:Test          &RelationManager,THREAD               ! RelationManager for Test
Access:AddTests      &FileManager,THREAD                   ! FileManager for AddTests
Relate:AddTests      &RelationManager,THREAD               ! RelationManager for AddTests
Access:Normals       &FileManager,THREAD                   ! FileManager for Normals
Relate:Normals       &RelationManager,THREAD               ! RelationManager for Normals
Access:Salesman      &FileManager,THREAD                   ! FileManager for Salesman
Relate:Salesman      &RelationManager,THREAD               ! RelationManager for Salesman
Access:Specialty     &FileManager,THREAD                   ! FileManager for Specialty
Relate:Specialty     &RelationManager,THREAD               ! RelationManager for Specialty
Access:Courier       &FileManager,THREAD                   ! FileManager for Courier
Relate:Courier       &RelationManager,THREAD               ! RelationManager for Courier
Access:Supplies      &FileManager,THREAD                   ! FileManager for Supplies
Relate:Supplies      &RelationManager,THREAD               ! RelationManager for Supplies
Access:PickUp        &FileManager,THREAD                   ! FileManager for PickUp
Relate:PickUp        &RelationManager,THREAD               ! RelationManager for PickUp
Access:SendOuts      &FileManager,THREAD                   ! FileManager for SendOuts
Relate:SendOuts      &RelationManager,THREAD               ! RelationManager for SendOuts
Access:GAM           &FileManager,THREAD                   ! FileManager for GAM
Relate:GAM           &RelationManager,THREAD               ! RelationManager for GAM
Access:PCodes        &FileManager,THREAD                   ! FileManager for PCodes
Relate:PCodes        &RelationManager,THREAD               ! RelationManager for PCodes
Access:Exceptions    &FileManager,THREAD                   ! FileManager for Exceptions
Relate:Exceptions    &RelationManager,THREAD               ! RelationManager for Exceptions
Access:EventsTable   &FileManager,THREAD                   ! FileManager for EventsTable
Relate:EventsTable   &RelationManager,THREAD               ! RelationManager for EventsTable
Access:Online        &FileManager,THREAD                   ! FileManager for Online
Relate:Online        &RelationManager,THREAD               ! RelationManager for Online
Access:Upload        &FileManager,THREAD                   ! FileManager for Upload
Relate:Upload        &RelationManager,THREAD               ! RelationManager for Upload
Access:ToDo          &FileManager,THREAD                   ! FileManager for ToDo
Relate:ToDo          &RelationManager,THREAD               ! RelationManager for ToDo
Access:ResultsSendout &FileManager,THREAD                  ! FileManager for ResultsSendout
Relate:ResultsSendout &RelationManager,THREAD              ! RelationManager for ResultsSendout
Access:PDF           &FileManager,THREAD                   ! FileManager for PDF
Relate:PDF           &RelationManager,THREAD               ! RelationManager for PDF
Access:Billing       &FileManager,THREAD                   ! FileManager for Billing
Relate:Billing       &RelationManager,THREAD               ! RelationManager for Billing
Access:NameList      &FileManager,THREAD                   ! FileManager for NameList
Relate:NameList      &RelationManager,THREAD               ! RelationManager for NameList
Access:Payments      &FileManager,THREAD                   ! FileManager for Payments
Relate:Payments      &RelationManager,THREAD               ! RelationManager for Payments
Access:Insurance     &FileManager,THREAD                   ! FileManager for Insurance
Relate:Insurance     &RelationManager,THREAD               ! RelationManager for Insurance
Access:Providers     &FileManager,THREAD                   ! FileManager for Providers
Relate:Providers     &RelationManager,THREAD               ! RelationManager for Providers
Access:PayType       &FileManager,THREAD                   ! FileManager for PayType
Relate:PayType       &RelationManager,THREAD               ! RelationManager for PayType
Access:Fees          &FileManager,THREAD                   ! FileManager for Fees
Relate:Fees          &RelationManager,THREAD               ! RelationManager for Fees
Access:BillingItems  &FileManager,THREAD                   ! FileManager for BillingItems
Relate:BillingItems  &RelationManager,THREAD               ! RelationManager for BillingItems
Access:BillingReadIn &FileManager,THREAD                   ! FileManager for BillingReadIn
Relate:BillingReadIn &RelationManager,THREAD               ! RelationManager for BillingReadIn
Access:VerifyPatient &FileManager,THREAD                   ! FileManager for VerifyPatient
Relate:VerifyPatient &RelationManager,THREAD               ! RelationManager for VerifyPatient
Access:DeleteTests   &FileManager,THREAD                   ! FileManager for DeleteTests
Relate:DeleteTests   &RelationManager,THREAD               ! RelationManager for DeleteTests
Access:TestMem       &FileManager,THREAD                   ! FileManager for TestMem
Relate:TestMem       &RelationManager,THREAD               ! RelationManager for TestMem
Access:Service       &FileManager,THREAD                   ! FileManager for Service
Relate:Service       &RelationManager,THREAD               ! RelationManager for Service
Access:ExportList    &FileManager,THREAD                   ! FileManager for ExportList
Relate:ExportList    &RelationManager,THREAD               ! RelationManager for ExportList
Access:MedicareTests &FileManager,THREAD                   ! FileManager for MedicareTests
Relate:MedicareTests &RelationManager,THREAD               ! RelationManager for MedicareTests
Access:payers        &FileManager,THREAD                   ! FileManager for payers
Relate:payers        &RelationManager,THREAD               ! RelationManager for payers
Access:Claims        &FileManager,THREAD                   ! FileManager for Claims
Relate:Claims        &RelationManager,THREAD               ! RelationManager for Claims
Access:ChangeCare    &FileManager,THREAD                   ! FileManager for ChangeCare
Relate:ChangeCare    &RelationManager,THREAD               ! RelationManager for ChangeCare
Access:Temp          &FileManager,THREAD                   ! FileManager for Temp
Relate:Temp          &RelationManager,THREAD               ! RelationManager for Temp
Access:ExportIns     &FileManager,THREAD                   ! FileManager for ExportIns
Relate:ExportIns     &RelationManager,THREAD               ! RelationManager for ExportIns
Access:DiagnosticCodes &FileManager,THREAD                 ! FileManager for DiagnosticCodes
Relate:DiagnosticCodes &RelationManager,THREAD             ! RelationManager for DiagnosticCodes
Access:Accession     &FileManager,THREAD                   ! FileManager for Accession
Relate:Accession     &RelationManager,THREAD               ! RelationManager for Accession
Access:RequestForms  &FileManager,THREAD                   ! FileManager for RequestForms
Relate:RequestForms  &RelationManager,THREAD               ! RelationManager for RequestForms
Access:ExportCovid   &FileManager,THREAD                   ! FileManager for ExportCovid
Relate:ExportCovid   &RelationManager,THREAD               ! RelationManager for ExportCovid
Access:CovidOrders   &FileManager,THREAD                   ! FileManager for CovidOrders
Relate:CovidOrders   &RelationManager,THREAD               ! RelationManager for CovidOrders
Access:PrintList     &FileManager,THREAD                   ! FileManager for PrintList
Relate:PrintList     &RelationManager,THREAD               ! RelationManager for PrintList
Access:PatientList   &FileManager,THREAD                   ! FileManager for PatientList
Relate:PatientList   &RelationManager,THREAD               ! RelationManager for PatientList
Access:CPL           &FileManager,THREAD                   ! FileManager for CPL
Relate:CPL           &RelationManager,THREAD               ! RelationManager for CPL
Access:NewPanels     &FileManager,THREAD                   ! FileManager for NewPanels
Relate:NewPanels     &RelationManager,THREAD               ! RelationManager for NewPanels
Access:HL7           &FileManager,THREAD                   ! FileManager for HL7
Relate:HL7           &RelationManager,THREAD               ! RelationManager for HL7

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('ALIS.INI', NVD_INI)                         ! Configure INIManager to use INI file
  DctInit
  SYSTEM{PROP:Icon} = 'Allermetrix.ico'
  Main1
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher
    
URLHandler              PROCEDURE (wHandle, URL)                   ! Declare Procedure
URLBuffer            CSTRING(512)
EmptyString          CSTRING(254)
  CODE                                                          ! Begin processed code
    URLBuffer = CLIP(URL)
    EmptyString = ''
    x#=ShellExecute(whandle, 0, URLBuffer, 0, EmptyString, 1)


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

