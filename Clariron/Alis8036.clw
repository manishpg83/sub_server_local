

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE
   INCLUDE('abbreak.inc'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8036.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8038.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8043.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8080.INC'),ONCE        !Req'd for module callout resolution
                     END


gloLanguage   STRING(1)
gloPrinter   STRING(64)
gloTextFileName   STRING(64)
gloPassword   STRING(6)
TRange   DECIMAL(5,2),DIM(5,2)
gloFees   DECIMAL(5,2),DIM(4,5)
gloTotalSummary   BYTE
gloTotal   BYTE
gloSendout   BYTE
gloSendout100   BYTE
gloSendout200   BYTE
gloPeanutPanel   BYTE
gloOverride   BYTE
gloREPORTTITLE   STRING(26)
gloRPTNOTICE1   STRING(20)
gloRPTNOTICE2   STRING(20)
gloRPTNOTICE3   STRING(20)
gloSKIPQC   BYTE
gloReportdate   LONG
gloFaxIt   BYTE
gloLast   LONG
gloFirst   LONG
gloExport   BYTE
gloInvoice   BYTE
GlobalTotal   DECIMAL(7,2)
gloCLInum   LONG
gloDATE0   LONG
gloDate   LONG
gloBilledDate   LONG
gloTime   LONG
gloNote1   STRING(60)
gloNote2   STRING(60)
gloPatName   STRING(40)
gloClientName   STRING(35)
gloAddress1   STRING(35)
gloAddress2   STRING(40)
gloAddress3   STRING(40)
gloExportFile   STRING(22)
gloIgEInterp   BYTE
gloDIgEInterp   BYTE
gloIgGInterp   BYTE
gloIgG4Interp   BYTE
gloGAM   BYTE,DIM(3)
gloE   BYTE
gloG4   BYTE
gloG   BYTE
gloIGG   BYTE,DIM(4)
gloFood   BYTE
gloInhalant   BYTE
gloDust   BYTE
gloPollen   BYTE
gloMold   BYTE
gloAllercare   BYTE
gloIsFax   BYTE
gloIGG_Flag   BYTE
gloASR_Flag   BYTE
gloPATCollection   STRING(16)
gloGEETotal   DECIMAL(7,2)
gloFaxNumber   STRING(20)
Results   QUEUE,PRE(RES)
Sort   STRING(1)
Category   STRING(1)
Code   STRING(9)
Description   STRING(40)
Type   STRING(4)
Result   STRING(10)
Conc   STRING(14)
BAU   STRING(16)
Score   STRING(8)
Percentile   LONG
Status   STRING(1)
Panel   STRING(9)
Summary   BYTE
Fee   DECIMAL(5,2)
FeeLevel   BYTE
   END
gloTotalGConc   DECIMAL(7,2)
gloTotaLAConc   DECIMAL(7,2)
gloTotalMConc   DECIMAL(7,2)
gloTotalEConc   DECIMAL(7,2)
gloTotalEScore   STRING(7)
gloTotalERange   STRING(16)
gloTotalGScore   STRING(7)
gloTotalGRange   STRING(16)
gloTotalAScore   STRING(7)
gloTotalARange   STRING(16)
gloTotalMScore   STRING(7)
gloTotalMRange   STRING(16)
gloTE   BYTE
gloTG   BYTE
gloTA   BYTE
gloTM   BYTE
PatientReports   QUEUE,PRE(PR)
Invoice   LIKE(PAT:Invoice)
Client   LIKE(PAT:Client)
eMail   BYTE
Postal   BYTE
Fax   BYTE
FaxNumber   STRING(20)
Language   BYTE
FileName   STRING(20)
FollowUp   STRING(255)
Consolidate   BYTE
Sendout   BYTE
Reports   BYTE
ClientID   STRING(16)
HL7   LONG
   END
SAV:Patient   LONG
locOverWrite   BYTE
locTarget   BYTE,DIM(255)
locSource   BYTE,DIM(255)
locLength   USHORT
locSourcePosition   USHORT
locTargetPosition   USHORT
locPathZ   STRING(48)
EQ:Month                 EQUATE(1)
EQ:Year                  EQUATE(2)
EQ:NotTested             EQUATE(0)
EQ:Tested                EQUATE(4)
EQ:Normal                EQUATE(1)
EQ:Elevated              EQUATE(2)
EQ:Depressed             EQUATE(3)
EQ:FinalFollow           EQUATE(5)
EQ:OffScale              EQUATE(6)

WebPage    FILE,DRIVER('ASCII'),NAME(gloTextFileName),PRE(WP),CREATE
Record                   RECORD,PRE()
Text                        STRING(512)
                         END
                     END                       


Passwords   FILE,DRIVER('ASCII'),NAME('..\results\AddPass.bat'),PRE(PW),CREATE
Record                   RECORD,PRE()
Text                        STRING(512)
                         END
                     END                       

eMail   FILE,DRIVER('ASCII'),NAME('..\results\eMail.bat'),PRE(EM),CREATE
Record                   RECORD,PRE()
Text                        STRING(8192)
                         END
                     END                       
Merge   FILE,DRIVER('ASCII'),NAME(gloTextFileName),PRE(MG),CREATE
Record                   RECORD,PRE()
Text                        STRING(1024)
                         END
                     END                       
RAN     QUEUE,PRE(RAN)
Client    LONG
TIME      TIME
        .

locSourceText            STRING(255),OVER(locSource)
locTargetText            STRING(255),OVER(locTarget)
locInhalant   BYTE
locFoods      BYTE

Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Data    STRING(32)
        . .       
!!! <summary>
!!! Procedure not yet defined
!!! </summary>
EnglishResults PROCEDURE !Procedure not yet defined
  CODE
  GlobalErrors.ThrowMessage(Msg:ProcedureToDo,'EnglishResults') ! This procedure acts as a place holder for a procedure yet to be defined
  SETKEYCODE(0)
  GlobalResponse = RequestCancelled                        ! Request cancelled is the implied action
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
FaxCover PROCEDURE (prmAttributes)

locSenderPhoneNumber STRING(32)                            !
locMessage           STRING(84)                            !
locRecipientPhoneNumber STRING(32)                         !
locSenderFaxNumber   STRING(32)                            !
locrecipientFaxNumber STRING(32)                           !
locSender            STRING(32)                            !
locRecipient         STRING(32)                            !
locSubject           STRING(32)                            !
locPageRange         USHORT                                !
LOCdATE              DATE                                  !
locFooter            STRING(576)                           !
locRecipentCompany   STRING(32)                            !
locDisclaimer        STRING(2048)                          !
locFaxBody           STRING(4096)                          !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Fac Cover'),AT(,,189,99),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY,MDI
                       STRING('String 1'),AT(26,30),USE(?String1)
                     END

Report               REPORT('fax'),AT(1000,250,6500,10500),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,,FONT:regular, |
  CHARSET:ANSI),THOUS
HEADER                 DETAIL,AT(,,6469,3771),USE(?Header)
                         IMAGE('am.JPG'),AT(2000,10,2500,820),USE(?Image1)
                         BOX,AT(115,802,6300,350),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Facsimile Transmittal Cover Page'),AT(156,865,6250,156),USE(?String1),FONT(,10,,FONT:bold), |
  CENTER,TRN
                         BOX,AT(115,1375,6302,448),USE(?Box2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient'),AT(200,1400,708,167),USE(?StringRecipient:2),FONT(,8),TRN
                         STRING('Sender'),AT(3600,1400),USE(?StringSender),FONT(,8),TRN
                         LINE,AT(100,1550,6300,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING(@s32),AT(198,1625,2740,177),USE(locRecipient),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(3604,1625,2740,177),USE(locSender),FONT(,11,,FONT:bold),TRN
                         BOX,AT(115,1844,6302,448),USE(?Box3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Company'),AT(198,1854,1563,167),USE(?StringRecipient),FONT(,8),TRN
                         STRING('Date Sent'),AT(3604,1865,760,188),USE(?StringSender:2),FONT(,8),TRN
                         LINE,AT(94,2021,6300,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING(@s32),AT(198,2083,2740,177),USE(locRecipentCompany),FONT(,11,,FONT:bold),TRN
                         BOX,AT(115,2313,6302,448),USE(?Box3:2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Fax Number'),AT(198,2344,1563,167),USE(?StringRecipientFaxnumber),FONT(, |
  8),TRN
                         STRING('Sender Fax Number'),AT(3604,2354,1563,167),USE(?StringSenderFaxnumber),FONT(,8),TRN
                         LINE,AT(100,2510,6300,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING(@s32),AT(198,2542,2740,177),USE(locrecipientFaxNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(3604,2542,2740,177),USE(locSenderFaxNumber),FONT(,11,,FONT:bold),TRN
                         BOX,AT(115,2781,6302,448),USE(?Box3:3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Sender Phone Number'),AT(3604,2802,1563,167),USE(?StringSenderPhoneNumber),FONT(,8), |
  TRN
                         STRING('Recipient Phone Number'),AT(198,2813,1563,167),USE(?StringRecipientPhoneNumber),FONT(, |
  8),TRN
                         LINE,AT(104,2979,6300,0),USE(?Line3:3),COLOR(COLOR:Black)
                         STRING(@s32),AT(3604,3010,2740,177),USE(locSenderPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(198,3010,2740,177),USE(locRecipientPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING('Subject'),AT(198,3292,1563,167),USE(?StringSubject),FONT(,8),TRN
                         BOX,AT(94,3292,6302,448),USE(?Box3:4),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         LINE,AT(104,3438,6300,0),USE(?Line3:4),COLOR(COLOR:Black)
                         STRING(@s40),AT(198,3490,6146,177),USE(DOC:Subject),FONT(,11,,FONT:bold),TRN
                         STRING(@D4b),AT(3604,2083,2740,177),USE(LOCdATE),FONT(,11,,FONT:bold),TRN
                       END
Detail                 DETAIL,AT(,,6406,4406),USE(?Detail)
                         TEXT,AT(156,365,6250,4031),USE(locFaxBody),RTF(TEXT:Field),BOXED
                         STRING(@s84),AT(229,104,6281,208),USE(locMessage),TRN
                         BOX,AT(115,10,6302,4667),USE(?Box7),COLOR(COLOR:Black),LINEWIDTH(2),ROUND
                       END
                       FOOTER,AT(500,8700,7573,2698),USE(?Footer)
                         TEXT,AT(10,885,7531,1656),USE(locDisclaimer),FONT('Vrinda',8,,FONT:regular),RTF(TEXT:Field), |
  LEFT,BOXED,TRN
                         STRING('400 Sugartree Lane      Suite 510     Franklin, TN 37064'),AT(365,21,6948,208),USE(?String23), |
  CENTER,TRN
                         STRING('www.allermetrix.com'),AT(354,250,6948,208),USE(?String24),CENTER,TRN
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

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
GetNotice ROUTINE
    DOC:Number =  DOC:Confidentiality + BAND(prmAttributes,DOC:Spanish)
    GET(Docs,DOC:OrderKey)
    IF ~ERRORCODE()
      locDisclaimer = DOC:Body             
    .
    CLEAR(DOC:Record)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FaxCover')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  IF CLI:FIRST
    gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
  ELSE
    gloClientName = CLI:LAST
  .
  locSenderPhoneNumber = '877-992-4100'
  locRecipientPhoneNumber = CLI:PHONE
  locSenderFaxNumber = '615-599-4648'
  locrecipientFaxNumber = CLI:FAX
  locSender = 'Gary A. Kitos, Ph.D., HCLD'
  locRecipentCompany = gloClientName
  locRecipient = CLI:CONTACT
  locDate = TODAY()
  locFooter =  DOC:Body
  locPageRange = 0
  locMessage = '' ! LINE ABOVE DOC:Body
 

  CASE prmAttributes
  OF 0
    DO GetNotice
    DOC:Subject = 'Allermetrix'
    DOC:Body = ''
  
  OF 1 ! PATIENT RESULTS
    DO GetNotice
    DOC:Subject = 'Confidential Patient Results'
    DOC:Body = ''

  OF 2 ! PATIENT FAX COVER
    DO GetNotice
    DOC:Subject = 'Allermetrix RE: ' & Pat:INVOICE & ' ' & CLIP(Pat:LAST) & ', ' & Pat:FIRST
    DOC:Body = ''
  ELSE
    DOC:Number = BAND(prmAttributes,DOC:DocFilename)
    GET(Docs,DOC:OrderKey)
    IF ERRORCODE()
      CLEAR(DOC:Record)
      DOC:Subject = 'Allermetrix'
    .
  .
  IF BAND(prmAttributes,DOC:SignatureRequest)
    locMessage = 'RE: ' & Pat:INVOICE & ' ' & CLIP(Pat:LAST) & ', ' & Pat:FIRST
  .
  IF BAND(DOC:AllowEdit,prmAttributes)
    GlobalRequest = ChangeRecord
    gloDoc = DOC:AllowEdit
    UpdateDocs
    IF gloDoc <> RequestCompleted THEN STOP('NOT GOING TO PRINT'); POST(EVENT:CloseWindow);RETURN(0).
  .
  PRINTER{PROPPRINT:Device} = 'PDFill PDF&Image Writer'
  locFaxBody = CLIP(DOC:Body)
  OPEN(Report)
  PRINT(RPT:Header)
  PRINT(RPT:Detail)
  CLOSE(Report)
  POST(EVENT:CloseWindow)



!DOC:Page2              EQUATE(1)  ! page = Page Number - 1
!DOC:Page3              EQUATE(2)
!DOC:Page4              EQUATE(3)
!DOC:Text               EQUATE(8)  ! 0 = RTF
!DOC:Email              EQUATE(8)
!DOC:Spanish            EQUATE(16)
!DOC:Female             EQUATE(32)
!DOC:Dust               EQUATE(256)
!DOC:Food               EQUATE(512)
!DOC:Mold               EQUATE(1024)
!DOC:Pollen             EQUATE(2048)
!DOC:Results            EQUATE(4096)
!DOC:Confirmation       EQUATE(8192)
!DOC:Supplies           EQUATE(16384)
!DOC:SignatureRequest   EQUATE(32768)
!DOC:CreditCard         EQUATE(65536)
!DOC:Confidentiality    EQUATE(131072)
!DOC:FaxCover           EQUATE(262144)
!DOC:AllowEdit          EQUATE(1073741824)
!DOC:IncludeTest        EQUATE(2147483648) ! INCLUDE PATIENT TESTS IN DOCUMENT
!DOC:DocFilename        EQUATE(0BFFFH)     ! MASK ALLOW EDIT

  Do DefineListboxStyle
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
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
!!! All Daily
!!! </summary>
PatientReport PROCEDURE 

locFax               STRING(3)                             !
covPatients          LONG,DIM(99)                          !
locID                LONG                                  !
locCovid             LONG                                  !
locOutputName        STRING(192)                           !
FilesOpened          BYTE                                  !
locTimer             SHORT                                 !
locNumber            SHORT                                 !
locComma             STRING(1)                             !
locDisclaimer        STRING(2048)                          !
locLogo              STRING(6656)                          !
locPhraseGAM         STRING(78)                            !
locFirstRecordFound  BYTE                                  !
locFileExtension     STRING(5)                             !
locEmail             STRING(255)                           !
locFileName          STRING(80)                            !
locTargetFileName    STRING(64)                            !
locEncryptPDF        STRING(64)                            !
locPath              STRING(128)                           !
locPath2             STRING(128)                           !
locDate              DATE                                  !
locRecords           SHORT                                 !
SAV:Client           LONG                                  !
SAV:Patient          LONG                                  !
SAV:Status           STRING(1)                             !
locValidAttachment   BYTE                                  !
locAttachments       CSTRING(1024)                         !
locBodyE             STRING(128)                           !
locBodyS             STRING(512)                           !
locSubjectE          STRING(32)                            !
locSubjectS          STRING(128)                           !
locDisclaimerE       STRING(2048)                          !
locDisclaimerS       STRING(2048)                          !
locExceptions        BYTE                                  !
locStatus            STRING(1)                             !
locExceptionStatus   BYTE                                  !
locDetectedTIgE      BYTE                                  !
locDetectedGAM       BYTE                                  !
locDelay             LONG                                  !
locPrintProgressMessage STRING(64)                         !
locNumberNotFound    BYTE                                  !
AllFiles             QUEUE(File:queue),PRE(FIL)            !
                     END                                   !
BRW3::View:Browse    VIEW(Exceptions)
                       PROJECT(EXC:Patient)
                       PROJECT(EXC:Client)
                       PROJECT(EXC:PatientStatus)
                       PROJECT(EXC:Age)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List
EXC:Patient            LIKE(EXC:Patient)              !List box control field - type derived from field
EXC:Patient_NormalFG   LONG                           !Normal forground color
EXC:Patient_NormalBG   LONG                           !Normal background color
EXC:Patient_SelectedFG LONG                           !Selected forground color
EXC:Patient_SelectedBG LONG                           !Selected background color
EXC:Patient_Style      LONG                           !Field style
EXC:Client             LIKE(EXC:Client)               !List box control field - type derived from field
EXC:Client_NormalFG    LONG                           !Normal forground color
EXC:Client_NormalBG    LONG                           !Normal background color
EXC:Client_SelectedFG  LONG                           !Selected forground color
EXC:Client_SelectedBG  LONG                           !Selected background color
EXC:Client_Style       LONG                           !Field style
EXC:PatientStatus      LIKE(EXC:PatientStatus)        !List box control field - type derived from field
EXC:PatientStatus_NormalFG LONG                       !Normal forground color
EXC:PatientStatus_NormalBG LONG                       !Normal background color
EXC:PatientStatus_SelectedFG LONG                     !Selected forground color
EXC:PatientStatus_SelectedBG LONG                     !Selected background color
EXC:PatientStatus_Style LONG                          !Field style
EXC:Age                LIKE(EXC:Age)                  !List box control field - type derived from field
EXC:Age_NormalFG       LONG                           !Normal forground color
EXC:Age_NormalBG       LONG                           !Normal background color
EXC:Age_SelectedFG     LONG                           !Selected forground color
EXC:Age_SelectedBG     LONG                           !Selected background color
EXC:Age_Style          LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
Consolodate WINDOW('Consolodate'),AT(,,275,97),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
       STRING('Did you consolodate reports?'),AT(31,17),USE(?String1),TRN,FONT('Arial',16,COLOR:Red,FONT:bold,CHARSET:ANSI)
       BUTTON('No'),AT(40,46,71,26),USE(?No),LEFT,ICON(ICON:Hand),DEFAULT
       BUTTON('YES'),AT(161,46,71,26),USE(?Yes),LEFT,ICON(ICON:Tick)
     END


HTML           FILE,DRIVER('ASCII'),NAME(gloFileName),PRE(HTM),CREATE
RECORD            RECORD
Text              STRING(4096)
                  END
                END

Faxes   QUEUE,PRE(FX)
Client    LONG
Number    STRING(20)
       .
       

                    
BRW3::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW3::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW3::PopupChoice    SIGNED                       ! Popup current choice
BRW3::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW3::PopupChoiceExec BYTE(0)                     ! Popup executed
Window               WINDOW('Results'),AT(0,0,510,313),FONT('Arial',11,,FONT:regular),RESIZE,ICON('Allermetrix.ico'), |
  GRAY,MAX,MDI,SYSTEM,TIMER(1000),IMM
                       BUTTON('Get Patients'),AT(37,47,87,26),USE(?GetPatients),FONT(,,,FONT:bold),LEFT,ICON(ICON:JumpPage), |
  TRN
                       BUTTON('Create PDF'),AT(37,73,87,26),USE(?CreatePDF),FONT(,,,FONT:bold),LEFT,ICON('EXP_PDF.ICO'), |
  DISABLE,TRN
                       BUTTON('View Reports'),AT(37,99,87,26),USE(?ViewReports),FONT(,,,FONT:bold),LEFT,ICON('SteelView.ico'), |
  TRN
                       CHECK('Overwrite Existing'),AT(128,82,86,14),USE(locOverWrite),FONT(,,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('1','0')
                       BUTTON('Fax'),AT(37,234,87,26),USE(?FaxAll),FONT(,,,FONT:bold),TRN
                       BUTTON('Print Results'),AT(37,128,87,26),USE(?PrintPDF),FONT(,,,FONT:bold),LEFT,ICON('SteelPrinter.ico'), |
  DISABLE,TRN
                       BUTTON('Results Folder'),AT(37,153,87,26),USE(?ResultsFolder),FONT(,,,FONT:bold),LEFT,ICON('FILE.ICO'), |
  TRN
                       BUTTON('Encrypt'),AT(37,179,87,26),USE(?Encrypt),FONT(,,,FONT:bold),LEFT,ICON('SteelLock.ico'), |
  TRN
                       BUTTON('...'),AT(34,287,12,9),USE(?LookupFile),HIDE
                       STRING(@s128),AT(48,287),USE(locPath),FONT(,,,FONT:bold),TRN
                       BUTTON('eMail'),AT(37,206,87,26),USE(?eMail),FONT(,,,FONT:bold),LEFT,ICON('SteelEmail.ico'), |
  TRN
                       SPIN(@d1),AT(40,28,94,15),USE(locDate),FONT(,14,,FONT:bold,CHARSET:ANSI),CENTER,HVSCROLL
                       ENTRY(@s32),AT(199,4,131,12),USE(gloPDFPrinter)
                       ENTRY(@s64),AT(199,19,131,12),USE(gloResultsPrinter)
                       BUTTON('Close'),AT(396,264,87,26),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  TRN
                       STRING('A: Age Needed'),AT(462,2),USE(?String12),FONT(,,,FONT:bold),HIDE,TRN
                       STRING('S: Status'),AT(478,14),USE(?String10),FONT(,,,FONT:bold),HIDE,TRN
                       PROMPT('PDF Printer:'),AT(152,4),USE(?gloPrinter:Prompt),FONT(,,,FONT:bold),TRN
                       BUTTON('...'),AT(333,4,22,12),USE(?SelectPDFPrinter),FONT(,14,,FONT:bold,CHARSET:ANSI),TRN
                       BUTTON('Dn'),AT(356,220,27,36),USE(?Button13),HIDE,TRN
                       STRING('Date:'),AT(20,32),USE(?String2),FONT(,,,FONT:bold),TRN
                       STRING('Results Printer:'),AT(140,34),USE(?String8),FONT(,,,FONT:bold),TRN
                       BUTTON('...'),AT(333,19,22,12),USE(?SelectResultsPrinter),FONT(,14,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@p<<# PDF's Not Foundpb),AT(128,154),USE(locNumberNotFound),FONT('Arial',16,COLOR:Red, |
  FONT:bold,CHARSET:ANSI),TRN
                       STRING(@pDone, Number of Patients Found=<<#pb),AT(128,55,160,10),USE(locRecords),FONT('Arial', |
  10,,FONT:bold,CHARSET:ANSI),TRN
                       STRING(@PException=<#Pb),AT(374,2,92,10),USE(locExceptions),FONT('Arial',16,COLOR:Red,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       LIST,AT(384,16,92,240),USE(?List),FONT(,,COLOR:Black,,CHARSET:ANSI),FORMAT('34R|M*Y~Pat' & |
  'ient~L(2)@p### ###p@31R|M*Y~Client~L(2)@p### ###p@12C|M*Y~S~@s1@10C|M*Y~A~@s1@'),FROM(Queue:Browse:1), |
  HIDE,IMM,MSG('Browsing Records'),TRN
                       STRING(@s64),AT(126,74,219,11),USE(gloPDFPrinter,,?gloPDFPrinter:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  LEFT,TRN
                       STRING(@s64),AT(124,166,219,11),USE(gloResultsPrinter,,?gloResultsPrinter:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                       PANEL,AT(128,96,135,47),USE(?OverWritePanel),FILL(COLOR:Red),HIDE
                       STRING('Overwrite Enabled'),AT(144,112),USE(?OverWriteString),FONT(,18,COLOR:White,FONT:bold, |
  CHARSET:ANSI),HIDE,TRN
                       PANEL,AT(384,16,92,240),USE(?Panel1),HIDE
                       IMAGE('button.jpg'),AT(333,19,22,12),USE(?Image12)
                       IMAGE('button.jpg'),AT(333,4,22,12),USE(?Image11)
                       IMAGE('button.jpg'),AT(128,82,86,14),USE(?Image10)
                       IMAGE('button.jpg'),AT(37,47,87,26),USE(?Image9)
                       IMAGE('button.jpg'),AT(37,73,87,26),USE(?Image8)
                       IMAGE('button.jpg'),AT(37,99,87,26),USE(?Image7)
                       IMAGE('button.jpg'),AT(37,234,87,26),USE(?Image6),HIDE
                       IMAGE('button.jpg'),AT(37,128,87,26),USE(?Image5)
                       IMAGE('button.jpg'),AT(37,153,87,26),USE(?Image4)
                       IMAGE('button.jpg'),AT(37,179,87,26),USE(?Image3)
                       IMAGE('button.jpg'),AT(37,206,87,26),USE(?Image2)
                       IMAGE('button.jpg'),AT(396,264,87,26),USE(?Image1)
                       CHECK('Debug'),AT(3,81),USE(gloDebug),TRN
                       PROMPT('Timer:'),AT(211,224),USE(?locTimer:Prompt)
                       ENTRY(@n4),AT(234,224,26,10),USE(locTimer),RIGHT(1)
                     END

BRW3::LastSortOrder       BYTE
BRW3::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW3                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW3::Sort0:Locator  StepLocatorClass                      ! Default Locator
PathLookup           SelectFileClass

  CODE
  GlobalResponse = ThisWindow.Run()               ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = gloListFont
  ?List{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List{PROPSTYLE:FontStyle, 1}     = 400
  ?List{PROPSTYLE:TextColor, 1}     = -1
  ?List{PROPSTYLE:BackColor, 1}     = -1
  ?List{PROPSTYLE:TextSelected, 1}  = -1
  ?List{PROPSTYLE:BackSelected, 1}  = -1
  !------------------------------------
!---------------------------------------------------------------------------
Cover       ROUTINE
      gloReportFileName = LONGPATH('..\ResultsNoEncrypt\' & PR:CLIENT & '\')  
      locFileName = 'cover.PDF'
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',CLIP(gloReportFileName))
        STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH') <> CLIP(gloReportFileName)
        STOP(CLIP(gloReportFileName))
      .
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
        STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME') <> CLIP(locFileName)
        STOP(CLIP(locFileName))
      .   
      IF PR:Language = 16      
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & PR:CLIENT & '\' & PR:INVOICE & 's.PDF')
      ELSE
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & PR:CLIENT & '\' & PR:INVOICE & 'e.pdf')
      .  
      FaxCover(1)
      locFileName =  LONGPATH('..\ResultsNoEncrypt\' & PR:CLIENT & '\'  & 'cover.PDF')
      locOutputName =  LONGPATH('..\ResultsNoEncrypt\' & PR:CLIENT & '\' & 'fax.PDF')              
      IF FILEEXISTS(locFileName) THEN REMOVE(locFileName).  
      IF FILEEXISTS(locOutputName) THEN REMOVE(locOutputName).  
      locDelay = CLOCK() + 150
      LOOP WHILE CLOCK() < locDelay
        YIELD    
      .         
      FaxCover(1)
      locDelay = CLOCK() + 900
      LOOP WHILE CLOCK() < locDelay
        YIELD    
        IF FILEEXISTS(locFileName) THEN BREAK. 
      .              
      locDelay = CLOCK() + 250
      LOOP WHILE CLOCK() < locDelay
        YIELD    
      .              
            
            RUN('"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" MERGE ' & CLIP(locFileName) & ' ' & CLIP(gloReportFileName) & ' ' & CLIP(locOutputName),1) 
            
            locDelay = CLOCK() + 900
            LOOP WHILE CLOCK() < locDelay
              YIELD    
              IF FILEEXISTS(locOutputName) THEN BREAK. 
            .   
            locDelay = CLOCK() + 250
            LOOP WHILE CLOCK() < locDelay
              YIELD    
            .              
         
      !     REMOVE(locFileName)  
      ! RUN('print /D:HP Universial Fax Driver ' & locOutputName)       
      
      
      locFileName =  '..\ResultsNoEncrypt\' & PR:CLIENT & '\' & 'fax.PDF'
    !  RUN('acrord32.exe  /n /s /o ' & locFileName)   
AddPatient  ROUTINE
  CLEAR(PatientReports)
  PR:Invoice = PAT:INVOICE
  PR:Client = PAT:CLIENT
  PR:ClientID = Pat:CLIENT_ID
  locExceptionStatus = SetPatientStatus(PAT:INVOICE)
  DO GetClient
  DO CheckTests
  PUT(Patient)
  gloReportFileName = '..\Results\' & PAT:Client & '\'
  IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  gloReportFileName = '..\ResultsNoEncrypt\' & PAT:Client & '\'
  IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).  
  IF PAT:Status = 'C' AND ~BAND(locExceptionStatus,EX:Age)
    IF BAND(PR:Language,DOC:Spanish) OR PR:Client < 200000
        PR:FileName = PR:Client & '\' & PR:Invoice & 's.PDF'
    ELSE
      PR:FileName = PR:Client & '\' & PR:Invoice & 'e.pdf'
    .
    IF PR:Sendout AND EXISTS('..\ResultsNoEncrypt\' & PR:FileName)
  !    DIRECTORY(AllFiles, PATH('..\ResultsNoEncrypt\' & PR:FileName), 0 )  ! Gets File (FIL:) Attributes
  !    GET(AllFiles,1)
  !    IF FIL:Date <> TODAY()
        DELETE(SendOuts)
!      .
      EXIT
    .
    PR:HL7 = Pat:HL7
    ADD(PatientReports)
  ELSE
    CLEAR(ToD:ID,1)
    SET(ToD:OrderKey,ToD:OrderKey)
    PREVIOUS(ToDo)
    IF ERRORCODE()  
      IF ERRORCODE() = 33 
        ToD:ID = 0
       ELSE 
         STOP('PREV TODO: ' & ERROR())
     . .
     locNumber = ToD:ID + 1
     CLEAR(ToD:Record) 
     ToD:ID = locNumber
     ToD:Date = TODAY()
     ToD:Due = TODAY()
     ToD:Patient = PAT:INVOICE
     ToD:Client= PAT:CLIENT 
     ToD:Attributes = 1
     CASE PAT:STATUS
     OF 'I'
       EXIT
     OF 'H'
     OROF 'Q'
  !   OROF 'W'
  !   OROF 'L'
   !  OROF 'V'
       ToD:Attributes = 7
       ToD:Description = PAT:Invoice & ' Status = '  & PAT:STATUS & ' (Report print)'
       ADD(ToDo)
       IF ERRORCODE() 
         IF ERRORCODE() <> 40
           STOP('ADD TODO: ' & ERROR())
         .
       ELSE
         locExceptions += 1
       .
    .
    IF BAND(locExceptionStatus,EX:Age)
      ToD:Description = PAT:Invoice & ' Needs Age'  
      ADD(ToDo)
      IF ERRORCODE() 
        IF ERRORCODE() <> 40
          STOP('ADD TODO Exception: ' & ERROR())
        .
      ELSE
        locExceptions += 1
      .
    .
  .


  
!CHECK('Report Exception'),VALUE('1','0'),#ORDINAL(20)
!CHECK('QNS')VALUE('2','0'),#ORDINAL(21)
!CHECK('Patient')VALUE('4','0'),#ORDINAL(22)
!CHECK('Client')VALUE('8','0'),#ORDINAL(23)
!CHECK('Operations')VALUE('16','0'),#ORDINAL(24)
!CHECK('Sales')VALUE('32','0'),#ORDINAL(25)
!CHECK('Vendor')VALUE('64','0'),#ORDINAL(26)
!CHECK('Other')VALUE('128','0'),#ORDINAL(27)
  
  
  
!EX:Complete  EQUATE(1)
!EX:Login     EQUATE(2)
!EX:WorkPool  EQUATE(4)
!EX:QNS       EQUATE(8)
!EX:Age       EQUATE(16)
!EX:Held      EQUATE(32)         
CheckTests  ROUTINE
  locExceptionStatus = 0
  locDetectedTIgE = FALSE
  locDetectedGAM = FALSE
  gloTE = 1
  CLEAR(EXC:Record)
  gloPatient = PAT:Invoice
  SAV:Status = PAT:Status
  IF PAT:Status = 'Q'
    locExceptionStatus = BOR(locExceptionStatus,EX:QNS)
  .
  IF PAT:Status = 'H'
    locExceptionStatus = BOR(locExceptionStatus,EX:Held)
  .
  SHARE(Test)
  CLEAR(TST:Record)
  TST:INVOICE = PR:Invoice
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP UNTIL EOF(Test)
    NEXT(Test)
    IF TST:INVOICE <> PR:INVOICE OR ERRORCODE() THEN BREAK.
    IF gloTestCodeStartsWith1 = 'S' THEN PR:Sendout = TRUE; EXIT.
    IF INRANGE(TST:TYPE,4,6)
      locDetectedGAM = TRUE
      DO CheckAge
      CYCLE
    .
    IF SUB(TST:Code,1,3) = '100'
      IF BAND(gloTE,TIGE:Complete) OR gloTE = TIGE:Final THEN CYCLE.
      DO CheckAge
      locDetectedTIgE = TRUE
      CASE SUB(TST:Code,5,1)
      OF ''
      OROF '1'
      OROF '2'
        IF TST:Status = 'C'
          gloTE = TIGE:Complete !  TIGE:Complete EQUATE(8)
        ELSIF TST:Status = 'X'
          gloTE += 1            ! INITIALIZED TO 1, + 3 X'S = TIGE:Follow EQUATE(4), RESULTS WILL FOLLOW IF 100, 100-1 AND 100-2 ARE ALL 'X')
        .
      OF '3'
      OROF '4'
      OROF '5'
        IF TST:Status = 'C'     ! TIGE:Final EQUATE(16)
          gloTE = TIGE:Final
      . .
    .
  .
  CLOSE(Test)
  gloPatientNotes[2] = ''
!  IF locDetectedGAM
!    locPhraseGAM = 'IgG/IgA/IgM testing performed at Warde Medical Laboratory, Ann Arbor Michigan'
!  .
  IF BAND(gloTE,TIGE:Follow+TIGE:Final)
    IF BAND(gloTE,TIGE:Follow)
!      IF locDetectedGAM
!        gloPatientNotes[2] = CLIP(locPhraseGAM) & ', Total IgE Result to Follow'
!      ELSE
        gloPatientNotes[2] = 'Total IgE Result to Follow'
!      .
    ELSE
!      IF locDetectedGAM
!        gloPatientNotes[2] = CLIP(locPhraseGAM) & ', Final Total IgE Result'!
!      ELSE
        gloPatientNotes[2] = 'Final Total IgE Result'
!      .
    .
!   ELSIF locDetectedGAM
!    gloPatientNotes[2] = locPhraseGAM 
  .
  PUT(Patient)

CheckAge  ROUTINE
  IF BAND(locExceptionStatus,EX:Age) THEN EXIT.
  IF  ~PAT:Age OR ~PAT:Age_Type
    locExceptionStatus = BOR(locExceptionStatus,EX:Age)
  ELSE
    IF PAT:Age_Type = 'M'
      IF ~INRANGE(PAT:Age,1,11)
        locExceptionStatus = BOR(locExceptionStatus,EX:Age)
  . . .

Filter  ROUTINE ! filter follow up text (CR " ' ,)
  locLength = LEN(CLIP(locSourceText))
  locTargetPosition = 0
  locSourcePosition = 0
  LOOP locLength TIMES
    locSourcePosition += 1
    IF locSource[locSourcePosition] = 13 THEN CYCLE.
    IF locSource[locSourcePosition] = 10 THEN CYCLE.
    locTargetPosition += 1
    locTarget[locTargetPosition] = locSource[locSourcePosition]
  .



GetClient   ROUTINE
  CLI:Number = PAT:CLIENT
  GET(Client,CLI:ORDER_KEY)
  if errorcode() AND ERRORCODE() <> 52 then stop('Patient=' & PAT:INVOICE & ', Client=' & PAT:CLIENT & ': ' & error()).
  PR:eMail = CLI:EmailReport
  
  IF  CLI:Postal <> 'Y' THEN CLI:Postal = 'N'; PUT(Client).
  IF CLI:Postal = CLIENT:Postal_Y THEN PR:Postal = TRUE ELSE PR:Postal = FALSE.
  PR:Fax = CLI:FaxReport
  PR:FaxNumber = CLI:FAX
  gloLanguage = CLI:Language
  IF  CLI:Language = 'S'
    PR:Language = 16
  ELSE
    PR:Language = 0
  .
  PR:Reports = CLI:REPORTS
  PR:Consolidate = CLI:ConsolidateReports
  IF CLI:FOLLOW2
    locSourceText = CLI:FOLLOW2
    DO Filter
    PR:FollowUp = locTargetText
    locTargetText = ''
  ELSE
    PR:FollowUp = ''
  .
CreatePDF  ROUTINE
  gloReportFileName = '..\ResultsNoEncrypt\'
  IF ~EXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  DO GetClient
  gloPassword = PAT:Client
  gloTotal = 0
  gloDust = 0
  gloMold = 0
  gloPollen = 0
  gloFood = 0
  gloTotalSummary = 0
  gloSendout = FALSE
  gloSendout100 = FALSE
  gloSendout200 = FALSE   
  locEmail = ''
  locFax = ''
  IF CLI:FaxReport THEN locFax = 'Fax'.
  IF cli:EmailReport THEN locEmail = 'Email'.

  
  
    WP:Text =  '<br>Getting Data Patient: ' & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
    IF gloDebug THEN ADD(WebPage).
  
    IF Pat:CLIENT = 200249 
      BuildQueuesHotze(Pat:INVOICE)
      IF gloVirus
        BuildQueues(Pat:INVOICE) 
      .
    ELSE
      BuildQueues(Pat:INVOICE)
    .
    WP:Text =  '<br>GOT Data Patient: ' & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
    IF gloDebug THEN ADD(WebPage).
  PAT:INVOICE =  PR:Invoice
  GET(Patient,PAT:INVOICE_KEY)

  gloPatient = PR:Invoice
  gloReportFileName = '..\Results\' & PR:Client
  IF ~EXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client
  IF ~EXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  
  
    WP:Text =  '<br>Begin Create PDF Patient: ' & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
    IF gloDebug THEN ADD(WebPage). 

   
  IF gloLanguage = CLIENT:English_E OR gloSendout100 OR gloSendout200
    gloReportFileName = LONGPATH('..\ResultsNoEncrypt\' & PR:Client & '\')
    IF CLI:Language = 'S'
      locFileName = CLIP(PR:Invoice) & 's.PDF'
    ELSE
      locFileName = CLIP(PR:Invoice) & 'e.pdf' 
    .    
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',CLIP(gloReportFileName))
       STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
    .
    IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH') <> CLIP(gloReportFileName)
      STOP(CLIP(gloReportFileName))
    .


    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
    .
    IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME') <> CLIP(locFileName)
      STOP(CLIP(locFileName))
    .
 

    
    
 !~    stop(CLIP(gloReportFileName) & locFileName)
    IF FILEEXISTS(CLIP(gloReportFileName) & locFileName) AND (~locOverWrite) ! OR gloSendout OR gloSendout100 OR gloSendout200)
      WP:Text =  '<H2><SPAN CLASS="RED">PDF EXISTS NO PRINT : ' & PR:Invoice & '</SPAN>&EMSP; ' & FORMAT(CLOCK(),@T4) & '</H2>'
      IF gloDebug THEN ADD(WebPage).  
   !   stop(PR:Invoice & ': PDF exists')
      EXIT
    ELSE
      WP:Text =  '<br>Begin Print PDF Patient: ' & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
      IF gloDebug THEN ADD(WebPage).
      gloPatient = PR:Invoice     
      IF gloSendout100
        ResultsSendout100
        gloSendout100 = FALSE
        CLI:ReportFormatCML = '0'    
        OL:Date = TODAY()
        OL:Time = CLOCK()
        OL:Number = PR:Invoice
        OL:PCAE = 9
        ADD(Online)
      ELSIF gloSendout200
        ResultsSendout100
        gloSendout200 = FALSE
        CLI:ReportFormatCML = '0'
      ELSIF gloSendout
        ResultsSendout
        gloSendout = FALSE
        CLI:ReportFormatCML = '0'
      ELSE
      
        Pat:INVOICE = PR:Invoice
        IF gloVirus 
          ResultsPrint
        ELSIF Pat:CLIENT = 200249 AND ~gloVirus
          HotzeResults
        ELSIF CLI:ReportFormatCML = '1' OR CLI:ReportFormatCML = 'Y'
          cmlReport
        ELSE
          ResultsPrint
        .
        locDelay = CLOCK() + locTimer
        LOOP WHILE CLOCK() < locDelay
          YIELD
        .
      .
  !   stop(PR:Invoice & ' - ' & PR:Client)
      WP:Text =  '<br>DONE PRINTING PDF Patient: ' & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
      
      IF gloDebug THEN ADD(WebPage).
    .
    locID += 1
    locFileName =  LONGPATH('..\ResultsNoEncrypt\') & PR:Client & '\' & PR:Invoice & 'e.pdf'
    WP:Text = '<form action="file:///' & CLIP(locFileName) & '"><button id="p' & locID & '" onclick="pdf(' & locID & ')">PDF</button></form>'
    ADD(WebPage)
      SHARE(TEST)
      WP:Text = '<form action="https://dev.amxemr.com/cpl/alisReview.php" method="post">'
      ADD(WebPage)
      WP:Text = '<input type="hidden" name="assession" value="' & PR:Invoice  & '"/>'
      ADD(WebPage)
      WP:Text = '<input type="hidden" name="id" value="' & CLIP(PR:ClientID)  & '"/>'
      ADD(WebPage)
      locCovid = 0
      CLEAR(TST:Record)
      TST:INVOICE = PR:Invoice
      SET(TST:ORDER_KEY,TST:ORDER_KEY)
      LOOP UNTIL EOF(Test)
        NEXT(Test)
        IF TST:INVOICE <> PR:Invoice OR ERRORCODE() THEN BREAK.
        IF TST:STATUS <> 'C' THEN CYCLE.
        IF SUB(TST:CODE,1,1) = 'A'
          locCovid = 1
          BREAK
        .
        WP:Text = '<input type="hidden" name="test[]" value="' & CLIP(TST:Code) & '-' & TST:type & '-' & TST:COUNT & '-' & CLIP(TST:Score) & '"/>'
        ADD(WebPage)
        
      .
      CLOSE(TEST)
      IF locCovid = 0
        WP:Text = '<button id="h' & locID & '" onclick="html(' & locID & ')">HTML</button> </form>'
      ELSE
        WP:Text = '</form><button> </button> '
      .
      ADD(WebPage)
      WP:Text =  PR:Client & ' - ' & PR:Invoice & ' ' & CLIP(locEmail) & ' ' & CLIP(locFax) &   '<font color=red>' & CLIP(PR:FollowUp) & '</font><hr>'
      ADD(WebPage)
	

    locTargetFileName =  LONGPATH('..\Results\') & PR:Client & '\' & PR:Invoice & 'e.pdf'
    PW:Text = CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & PR:Client
    ADD(Passwords)
  .
  IF gloLanguage = CLIENT:Spanish_S OR gloLanguage = CLIENT:LanguageBoth_B
    gloLanguage = CLIENT:Spanish_S
    gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\'
    locFileName = CLIP(PR:Invoice) & 's.PDF'
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',LONGPATH(gloReportFileName))
       STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
    .
    IF ~FILEEXISTS(gloReportFileName) OR locOverWrite
      SpanishPDF
    .
    locDelay = CLOCK() + locTimer
    LOOP WHILE CLOCK() < locDelay
      YIELD
    .
    locFileName =  LONGPATH('..\ResultsNoEncrypt\') & PR:Client & '\' & PR:Invoice & 's.PDF'
    WP:Text =  '<a href="file:///' & CLIP(locFileName) & '">'  &  PR:Client & ' - ' & PR:Invoice  &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
    ADD(WebPage)  
    locTargetFileName =  LONGPATH('..\Results\') & PR:Client & '\' & PR:Invoice & 's.PDF'
    PW:Text = CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & PR:Client
    ADD(Passwords)
  .
  locDelay = CLOCK() + locTimer + 500
  LOOP WHILE CLOCK() < locDelay
    YIELD
    IF FILEEXISTS(locFileName) THEN BREAK.
  .  
  IF ~FILEEXISTS(locFileName) THEN STOP('PDF Not Found: ' &  locFileName).
  locFileName = ''
  PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
  

  


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PatientReport')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?GetPatients
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  locPath = LONGPATH('..\') 
  SELF.AddItem(?Cancel,RequestCancelled)          ! Add the cancel control to the window manager
  Relate:Cli_panl.Open                            ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Exceptions.Open                          ! File Exceptions used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                             ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                              ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:PrintList.Open                           ! File PrintList used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                            ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                ! File Test used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                              ! File plates used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                          ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
      IF TODAY() %7 = 1
        locDate = TODAY() - 4
      ELSIF TODAY() %7 = 2
        locDate = TODAY() - 4
      ELSE
        locDate = TODAY() - 2
      .
                                                                                                                         
  
  
  locTimer = GETINI('PrintReport','timer','200','PrintResults.INI')
  gloPDFPrinter = GETINI('PrintReport','PDFPRINTER','deskPDF','PrintResults.INI')
  gloResultsPrinter = GETINI('PrintReport','RESULTSPRINTER','','PrintResults.INI')
  
  BRW3.Init(?List,Queue:Browse:1.ViewPosition,BRW3::View:Browse,Queue:Browse:1,Relate:Exceptions,SELF) ! Initialize the browse manager
  SELF.Open(Window)                               ! Open window
  Do DefineListboxStyle
  BRW3.Q &= Queue:Browse:1
  BRW3.AddSortOrder(,EXC:OrderKey)                ! Add the sort order for EXC:OrderKey for sort order 1
  BRW3.AddLocator(BRW3::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW3::Sort0:Locator.Init(,EXC:Patient,1,BRW3)   ! Initialize the browse locator using  using key: EXC:OrderKey , EXC:Patient
  BRW3.AddField(EXC:Patient,BRW3.Q.EXC:Patient)   ! Field EXC:Patient is a hot field or requires assignment from browse
  BRW3.AddField(EXC:Client,BRW3.Q.EXC:Client)     ! Field EXC:Client is a hot field or requires assignment from browse
  BRW3.AddField(EXC:PatientStatus,BRW3.Q.EXC:PatientStatus) ! Field EXC:PatientStatus is a hot field or requires assignment from browse
  BRW3.AddField(EXC:Age,BRW3.Q.EXC:Age)           ! Field EXC:Age is a hot field or requires assignment from browse
  PathLookup.Init
  PathLookup.ClearOnCancel = True
  PathLookup.Flags=BOR(PathLookup.Flags,FILE:LongName) ! Allow long filenames
  PathLookup.Flags=BOR(PathLookup.Flags,FILE:Directory) ! Allow Directory Dialog
  PathLookup.SetMask('All Files','*.*')           ! Set the file mask
  PathLookup.WindowTitle='Select Path'
  BRW3.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW3::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW3::FormatManager.Init('Alis8','PatientReport',1,?List,3,BRW3::PopupTextExt,Queue:Browse:1,24,LFM_CFile,LFM_CFile.Record)
  BRW3::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  SET(Normals,1)
  NEXT(Normals)
  locOverWrite = 0
  locEncryptPDF = '"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" ENCRYPT' 
  BRW3::AutoSizeColumn.Init()
  BRW3::AutoSizeColumn.AddListBox(?List,Queue:Browse:1)
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:Exceptions.Close
    Relate:Normals.Close
    Relate:Online.Close
    Relate:PrintList.Close
    Relate:SendOuts.Close
    Relate:Test.Close
    Relate:ToDo.Close
    Relate:plates.Close
  END
  ! List Format Manager destructor
  BRW3::FormatManager.Kill() 
  BRW3::AutoSizeColumn.Kill()
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
    IF locRecords
      ENABLE(?CreatePDF)
      ENABLE(?PrintPDF)
    ELSE
      DISABLE(?CreatePDF)
      DISABLE(?PrintPDF)
    .
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?GetPatients
      ThisWindow.Update
      locExceptions = 0
      FREE(PatientReports)
      CLEAR(PAT:Record)
      PAT:DATE = locDate
     OPEN(PrintList)

 
      SET(PrintList)
      LOOP
        NEXT(PrintList)
        IF ERRORCODE() THEN BREAK.
        Pat:Invoice = PL:Patient
        GET(Patient,Pat:INVOICE_KEY)
        IF ERRORCODE() THEN CYCLE.

        DO AddPatient
      .
      CLOSE(PrintList)
      SET(SO:OrderKey,SO:OrderKey)
      LOOP
        NEXT(SendOuts)
        IF ERRORCODE() THEN BREAK.
        IF SO:Date + 2 > TODAY()  THEN CYCLE.
        PAT:INVOICE = SO:Patient
        GET(Patient,PAT:INVOICE_KEY)
        IF ~ERRORCODE() 
          DO AddPatient
        .
      .


      
      locRecords = RECORDS(PatientReports)
      IF locRecords
        ENABLE(?CreatePDF)
        ENABLE(?PrintPDF)
      .
      DISPLAY()
    OF ?CreatePDF
      ThisWindow.Update
      !Main LOOP, (code from REPORT.CLA)
      PRINTER{PROPPRINT:Device} = gloPDFPrinter
      locID = 0
      gloTextFileName = 'C:\Apps\Reports.html'
      CREATE(WebPage)
      OPEN(WebPage)
      WP:Text = '<html><head><style>'
      ADD(WebPage)      
      WP:Text = 'body{{font:700 1.1em Arial;}form,a{{display:inline-block;margin:0;}'
      ADD(WebPage)      
      WP:Text = 'hr{{margin:0;}button{{width:4em;background-color:#0f0;}'
       ADD(WebPage)      
      WP:Text = '</style></head><body>'
      ADD(WebPage)      
      WP:Text =  '<H1 STYLE="MARGIN-BOTTOM:0;PADDING-BOTTOM:0;">Clicked Create PDF '  & FORMAT(CLOCK(),@T4) & '</H1>'
      IF gloDebug THEN ADD(WebPage).
      
      IF gloPDFPrinter <> 'PDFill PDF&Image Writer'
        IF MESSAGE('Printer Not PDFill PDF&Image Writer, Continue?',,ICON:Question ,BUTTON:Yes+BUTTON:No,BUTTON:No) = BUTTON:No
          RETURN(0)
        .
      .
      
      CREATE(Passwords)
      OPEN(Passwords)
      PW:Text = 'ECHO ON'
      ADD(Passwords)
      PW:Text = 'CD ..\Results'
      ADD(Passwords)
      SORT(PatientReports,PR:Client,PR:Invoice)
      LOOP I# = 1 TO RECORDS(PatientReports)
        GET(PatientReports,I#)
        PAT:CLIENT = PR:Client
        PAT:INVOICE = PR:Invoice
        GET(Patient,PAT:INVOICE_KEY)
        WP:Text =  '<HR><H2 STYLE="MARGIN-BOTTOM:0;PADDING-BOTTOM:0;"> Create PDF: '   & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4) & '</H2>'
        IF gloDebug THEN ADD(WebPage).
        DO CreatePDF
        WP:Text =  '<br>Return from DO CreatePDF '  & PR:Invoice & ' ' & FORMAT(CLOCK(),@T4)
        IF gloDebug THEN ADD(WebPage).
        SLEEP(500)
      
      .
      PW:Text = 'CD ..\APPS'
      ADD(Passwords)
      PW:Text = 'EXIT'
      ADD(Passwords)
      CLOSE(Passwords)
      SLEEP(500)      
      locSubjectS = 'Allermetrix:  Le adjuntamos los resultados de las pruebas de alergia de su paciente'
      locSubjectE = 'Allermetrix Test Results'
      locBodyE = '<h3 style=\"color:#6CB0B9;\">Test Results Attached</h3>'
      SAV:Client = -1
      SAV:Patient = PR:Invoice
      WP:Text =  '<br>DONE Create PDF '  & FORMAT(CLOCK(),@T4)
      IF gloDebug THEN ADD(WebPage).
      WP:Text = '<script type="text/javascript">//<![CDATA[<10>function html(n){{document.getElementById(<39>h<39> + n).style.backgroundColor  = <39>#f00<39>;}<10>function pdf(n){{document.getElementById(<39>p<39> + n).style.backgroundColor  = <39>#f00<39>;}<10>//]]><10></script></body></html>'
      ADD(WebPage)
      CLOSE(WebPage)
      URLHandler(Window{prop:handle},'file:///C:/Apps/Reports.HTML') 
    OF ?ViewReports
      ThisWindow.Update
      URLHandler(Window{prop:handle},'file:///C:/Apps/Reports.HTML') 
    OF ?locOverWrite
      IF locOverWrite
        UNHIDE(?OverwritePanel,?OverwriteString)
      ELSE
        HIDE(?OverwritePanel,?OverwriteString)
      .
    OF ?FaxAll
      ThisWindow.Update
        HIDE(?FaxAll)
        LOOP I# = 1 TO RECORDS(PatientReports)
          GET(PatientReports,I#)
          IF ~PR:Fax THEN CYCLE.
          CLI:NUMBER = PR:Client
          GET(Client,CLI:ORDER_KEY)
          DO Cover
      !     STOP(PR:Client & ', ' & PR:Invoice)
          URLHandler(Window{prop:handle},'http://127.0.0.1/amx/cc.php?c=' & CLIP(PR:Client) & '&p=' & CLIP(PR:Invoice) & '&n=' & CLIP(PR:FaxNumber))
        .
        UNHIDE(?FaxAll)
      
      
      
      
      
      
      
      OMIT('XXX') ! OLD MERGE BUTTON 
      SAV:Client = 200032     ! SAV:Client is Client to consolodate
      gloTextFileName = '..\ResultsNoEncrypt\' & SAV:Client & '\merge.bat'
      CREATE(Merge)
      OPEN(Merge)
      MG:Text = 'Z:'
      ADD(Merge)
      MG:Text = 'CD ..\ResultsNoEncrypt\' & SAV:CLIENT
      ADD(Merge)
      MG:Text = ''
      SORT(PatientReports,PR:Client,PR:Invoice)
      locFirstRecordFound = FALSE
      LOOP I# = 1 TO RECORDS(PatientReports)
        GET(PatientReports,I#)
        OL:Date = TODAY()
        OL:Time = CLOCK()
        OL:Number = PR:Invoice
        OL:PCAE = 9 ! 1=PATIENT + 8=UPDATED
        ADD(Online)
        IF SAV:Client = PR:Client
          IF locFirstRecordFound             ! CONCATONATE TO EXISTING patients
            MG:Text = CLIP(MG:Text) & ' ' & PR:Invoice & locFileExtension   
          ELSE
            locFirstRecordFound = TRUE       ! INITIALIZE FIRST PATIENT FOR CONSOLODATION
            IF BAND(PR:Language,DOC:Spanish) OR PR:Client < 200000
              locFileExtension = 's.pdf'
            ELSE
              locFileExtension = 'e.pdf'
            .
            MG:Text = '..\pdfpg ' & PR:Invoice & locFileExtension
          .
        ELSE                               ! This client does not get consolodated
          IF locFirstRecordFound           ! Previous client gets consolodated, complete processing
            MG:Text = CLIP(MG:Text) & ' ' & SAV:Client & FORMAT(locDate,@D11) & '.pdf '
            ADD(Merge)
            MG:Text = 'ping -n 6 127.0.0.1>nul'
            ADD(Merge)
            MG:Text =   CLIP(locEncryptPDF) & SAV:Client & FORMAT(locDate,@D11) & '.pdf  ..\..\Results\' &   SAV:Client & FORMAT(locDate,@D11) & '.pdf -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & PR:Client
            ADD(Merge)
            MG:Text = 'ping -n 16 127.0.0.1>nul'
            ADD(Merge)
            CLOSE(Merge)
            RUN('cmd /c ' & CLIP(locPath) & '\ResultsNoEncrypt\' & SAV:Client & '\merge.bat')
            MG:Text = ''
            BREAK                          ! Only one gets processed, Exit loop
          .
        .
      .
      
      
       XXX
      
    OF ?PrintPDF
      ThisWindow.Update
      PRINTER{PROPPRINT:Device} = gloResultsPrinter
      
      IF gloResultsPrinter = 'PDFill PDF&Image Writer'
        IF MESSAGE('Results Printer is PDFill PDF&Image Writer, Continue?',,ICON:Question ,BUTTON:Yes+BUTTON:No,BUTTON:No) = BUTTON:No
          RETURN(0)
        .
      .
      locNumberNotFound = 0
      SAV:Client = -1
      SORT(PatientReports,PR:Client,PR:Invoice)
      LOOP I# = 1 TO locRecords
        GET(PatientReports,I#)
      !      IF PR:Fax OR PR:Postal
        IF PR:Postal
          locFileName =  '..\ResultsNoEncrypt\' & PR:FileName
          IF EXISTS(locFileName)
            locPrintProgressMessage = 'Printing PDF for: ' & PR:CLIENT & '-' & PR:INVOICE
            LOOP PR:Reports TIMES
              RUN('acrord32.exe /t ' & SHORTPATH(locFileName) & ' "' & CLIP(gloResultsPrinter) & '"' )
              locDelay = CLOCK() + 700
              LOOP WHILE CLOCK() < locDelay
                YIELD
            . .
          ELSE
            locNumberNotFound += 1
          .
        .
      
      .
      locFileName = 'Done'
      locPrintProgressMessage = ''
      DISPLAY()
      
      
      
      
    OF ?ResultsFolder
      ThisWindow.Update
      RUN('explorer ..\results')
    OF ?Encrypt
      ThisWindow.Update
            RUN('cmd /c ' & CLIP(locPath)  & 'Results\AddPass.bat',1)
            SETCLIPBOARD('cmd /c ' & CLIP(locPath)  & 'Results\AddPass.bat')
            LOOP I# = 1 TO RECORDS(PatientReports)
              GET(PatientReports,I#)
              OL:Date = TODAY()
              OL:Time = CLOCK()
              OL:Number = PR:Invoice
              OL:PCAE = 9 ! 1=PATIENT + 8=UPDATED
              ADD(Online)
            .
    OF ?LookupFile
      ThisWindow.Update
      locPath = PathLookup.Ask(1)
    OF ?eMail
      ThisWindow.Update
      gloFileName = CLIP(locPath) & 'Results\email.html'
      CREATE(HTML)
      OPEN(HTML)
      HTM:Text = '<!DOCTYPE html><head><title>Email Report</title><style></style></head><body>'
      ADD(HTML)
      locComma = ''
      locAttachments = ''
      locSubjectS = 'Allermetrix:  Le adjuntamos los resultados de las pruebas de alergia de su paciente'
      locBodyS = '<p  style="color:#20889A;">Le adjuntamos los resultados de las pruebas de alergia de su paciente. Si tiene alguna pregunta o desea m&#225s informaci&#243n&#44 comun�quese con nosotros por medio de este correo electr&#243nico.<p>C&#243mo abrir los archivos pdf de ' & CLI:NUMBER & '<p>Gracias.<p><br>Gary A. Kitos&#44 Ph.D.&#44 H.C.L.D.<br>Director del Laboratorio M&#233dico<br>Tel: 615-599-4100<br>Fax: 615-599-4648</p>'
      locBodyE = '<h3 style="color:#20889A;">Test Results Attached</h3>'
      locSubjectE = 'Allermetrix Test Results'
      CLEAR(DOC:Record)
      DOC:Number =  DOC:FaxCover  + DOC:Text
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locLogo = DOC:Body
      .   
      DOC:Number =  DOC:Confidentiality + DOC:Text
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locDisclaimerE = DOC:Body
      .
      DOC:Number =  DOC:Confidentiality + DOC:Text + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locDisclaimerS = DOC:Body
      .
      locValidAttachment = FALSE
      SORT(PatientReports,PR:Client,PR:Invoice)
      GET(PatientReports,1)
      SAV:Client = PR:Client
      HTM:Text = '<hr/>-' & PR:Client & '-<hr/>'   
      
      LOOP I# = 1 TO RECORDS(PatientReports)   
        GET(PatientReports,I#) 
        ADD(HTML)
        HTM:Text = '<p>Begin ' & PR:FileName
        CLI:NUMBER = PR:Client
        GET(Client,CLI:ORDER_KEY) 
      !       IF CLI:FaxReport
        IF ~CLI:EmailReport  
          HTM:Text = CLIP(HTM:Text) & ' SKIPPED'
          CYCLE
        .
        IF PR:Client = SAV:Client 
          IF EXISTS(CLIP(locPath) & 'Results\' & PR:FileName)
            IF PR:HL7 <> 1 
              locAttachments = CLIP(locAttachments) & locComma & 'file:///' & CLIP(locPath) & 'Results\' & PR:FileName    ! FIRST ATTACHMENT
              locComma = ','
              locValidAttachment = TRUE
              HTM:Text = CLIP(HTM:Text) & '<br/>' & PR:FileName & ' Attached'
            .
          ELSE
            HTM:Text = CLIP(HTM:Text) & '<br/>' & PR:FileName & ' PDF NOT FOUND'
            STOP('Missing PDF: ' & CLIP(locPath) & 'Results\' & PR:FileName)
          .       
          
        ELSE   
          IF locValidAttachment
            CLI:NUMBER = SAV:Client
            GET(Client,CLI:ORDER_KEY)
            locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3  & CLI:Physician2
            IF CLI:Language = 'S' OR CLI:NUMBER < 200000
              locBodyS = '<p  style="color:#20889A;">Le adjuntamos los resultados de las pruebas de alergia de su paciente. Si tiene alguna pregunta o desea m&#225s informaci&#243n&#44 comun�quese con nosotros por medio de este correo electr&#243nico.<p>C&#243mo abrir los archivos pdf de ' & CLI:NUMBER & '<p>Gracias.<p><br>Gary A. Kitos&#44 Ph.D.&#44 H.C.L.D.<br>Director del Laboratorio M&#233dico<br>Tel: 615-599-4100<br>Fax: 615-599-4648</p>'
              RUN(SHORTPATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectS) & ',body=''' & CLIP(locLogo) & CLIP(locBodyS) & CLIP(locDisclaimerS) & ''',attachment=''' & CLIP(locAttachments) & '''"')
            ELSE
              RUN(SHORTPATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=''' & CLIP(locLogo) & CLIP(locBodyE) & CLIP(locDisclaimerE) & ''',attachment=''' & CLIP(locAttachments) & '''"')
            .
            HTM:Text = CLIP(HTM:Text) & '<br/> Email generated,' & CLI:NUMBER & ': ' & locAttachments 
            locValidAttachment = FALSE
            locAttachments = ''
            locComma = ''
            CLI:NUMBER = PR:Client
            GET(Client,CLI:ORDER_KEY)
          .
          HTM:Text = CLIP(HTM:Text) & '<hr/>~' & PR:Client & '~<hr/>'
          IF EXISTS(CLIP(locPath) & 'Results\' & PR:FileName)
            IF PR:HL7 <> 1
              locAttachments = CLIP(locAttachments) & locComma & 'file:///' & CLIP(locPath) & 'Results\' & PR:FileName    ! FIRST ATTACHMENT
              locComma = ','
              locValidAttachment = TRUE
              HTM:Text = CLIP(HTM:Text) & '<br/>' &  PR:FileName & ': Attached'
            ELSE
              HTM:Text = CLIP(HTM:Text) & '<br/>' &  PR:FileName & ': Skipped'
            .
          ELSE
            HTM:Text = CLIP(HTM:Text) & '<br/>' & PR:FileName & ' PDF NOT FOUND'
            STOP('Missing PDF: ' & CLIP(locPath) & 'Results\' & PR:FileName)
          .  
          T# = CLOCK()
          LOOP 
            IF (CLOCK() - T#) > 50 THEN BREAK.
          .
        .
        SAV:Client = PR:Client    
      .        
      HTM:Text = CLIP(HTM:Text) & '<br/>LAST PATIENT<br/>'
      IF locValidAttachment 
        locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3  & CLI:Physician2
        IF CLI:Language = 'S' OR CLI:NUMBER < 200000
          locBodyS = '<p  style="color:#20889A;">Le adjuntamos los resultados de las pruebas de alergia de su paciente. Si tiene alguna pregunta o desea m&#225s informaci&#243n&#44 comun�quese con nosotros por medio de este correo electr&#243nico.<p>C&#243mo abrir los archivos pdf de ' & CLI:NUMBER & '<p>Gracias.<p><br>Gary A. Kitos&#44 Ph.D.&#44 H.C.L.D.<br>Director del Laboratorio M&#233dico<br>Tel: 615-599-4100<br>Fax: 615-599-4648</p>'
          RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectS) & ',body=''' & CLIP(locLogo) & CLIP(locBodyS) & CLIP(locDisclaimerS) & ''',attachment=''' & CLIP(locAttachments) & '''"')
        ELSE
          CLI:NUMBER = SAV:Client
          GET(Client,CLI:ORDER_KEY)
          locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3  & CLI:Physician2
          RUN(SHORTPATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=''' & CLIP(locLogo) & CLIP(locBodyE) & CLIP(locDisclaimerE) & ''',attachment=''' & CLIP(locAttachments) & '''"')
        .
        HTM:Text = CLIP(HTM:Text) & '<br/> Email generated,' & CLI:NUMBER & ': '  & locAttachments
      .
      HTM:Text = CLIP(HTM:Text) & '</body></html>'
      ADD(HTML)
      CLOSE(HTML)   
            
    OF ?SelectPDFPrinter
      ThisWindow.Update
      PRINTERDIALOG
      gloPDFPrinter = PRINTER{PROPPRINT:Device}
      DISPLAY()
      PUTINI('PrintReport','PDFPRINTER',gloPDFPrinter,'PrintResults.INI')     
    OF ?Button13
      ThisWindow.Update
      POST(EVENT:ScrollBottom,?List)
    OF ?SelectResultsPrinter
      ThisWindow.Update
      PRINTERDIALOG
      gloResultsPrinter = PRINTER{PROPPRINT:Device}
      DISPLAY()
      PUTINI('PrintReport','RESULTSPRINTER',gloResultsPrinter,'PrintResults.INI')
      
    OF ?locTimer
      PUTINI('PrintReport','timer',locTimer,'PrintResults.INI')
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
  IF BRW3::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW3.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.EXC:Patient_NormalFG = 255                        ! Set color values for EXC:Patient
  SELF.Q.EXC:Patient_NormalBG = -1
  SELF.Q.EXC:Patient_SelectedFG = 16777215
  SELF.Q.EXC:Patient_SelectedBG = 255
  SELF.Q.EXC:Client_NormalFG = 255                         ! Set color values for EXC:Client
  SELF.Q.EXC:Client_NormalBG = -1
  SELF.Q.EXC:Client_SelectedFG = 16777215
  SELF.Q.EXC:Client_SelectedBG = 255
  SELF.Q.EXC:PatientStatus_NormalFG = 255                  ! Set color values for EXC:PatientStatus
  SELF.Q.EXC:PatientStatus_NormalBG = -1
  SELF.Q.EXC:PatientStatus_SelectedFG = 16777215
  SELF.Q.EXC:PatientStatus_SelectedBG = 255
  SELF.Q.EXC:Age_NormalFG = 255                            ! Set color values for EXC:Age
  SELF.Q.EXC:Age_NormalBG = -1
  SELF.Q.EXC:Age_SelectedFG = 16777215
  SELF.Q.EXC:Age_SelectedBG = 255
  SELF.Q.EXC:Patient_Style = 0 ! 
  SELF.Q.EXC:Client_Style = 0 ! 
  SELF.Q.EXC:PatientStatus_Style = 0 ! 
  SELF.Q.EXC:Age_Style = 0 ! 


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
  IF KEYCODE() = MouseLeft2
    BRW3.UpdateBuffer
    PAT:INVOICE = EXC:Patient
    GET(Patient,PAT:INVOICE_KEY)
    IF ~ERRORCODE()
      GlobalRequest = ChangeRecord
      UpdatePatient(0)
    .
  .
  IF BRW3::PopupChoiceOn AND BRW3::PopupChoiceExec THEN
     BRW3::PopupChoiceExec = False
     BRW3::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW3::PopupTextExt)
     IF BRW3::FormatManager.DispatchChoice(BRW3::PopupChoice)
     ELSE
     END
  END

!!! <summary>
!!! Generated from procedure template - Window
!!! Single Patient
!!! </summary>
PrintReport PROCEDURE 

locAttachments       CSTRING(1024)                         !
locPassword          STRING(6)                             !
locPhraseGAM         STRING(78)                            !
locDetectedGAM       BYTE                                  !
locEmail             STRING(140)                           !
locOverWrite         BYTE                                  !
locFileName          STRING(192)                           !
locResultsFile       STRING(128)                           !
locOutputName        STRING(80)                            !
locTargetFileName    STRING(80)                            !
locEncryptPDF        STRING(80)                            !
locBodyE             STRING(64)                            !
locBodyS             STRING(512)                           !
locSubjectE          STRING(25)                            !
locSubjectS          STRING(74)                            !
locLanguage          STRING(7)                             !
locFollow            STRING(10)                            !
locDelay             LONG                                  !
locDetectedTIgE      BYTE                                  !
locExceptionMessage  STRING(20)                            !
locDisclaimer        STRING(2048)                          !
locLogo              STRING(6656)                          !
EnhancedFocusManager EnhancedFocusClassType
locDay    STRING(2)
locMonth  STRING(2)
locYear   STRING(4)
locClientName  STRING(40)

locPAT:First  BYTE,DIM(SIZE(PAT:First)),OVER(PAT:First)
locPAT:Last  BYTE,DIM(SIZE(PAT:Last)),OVER(PAT:Last)
locCLI:Name  BYTE,DIM(40),OVER(locClientName)
locCLI:Address1  BYTE,DIM(35),OVER(CLI:Address1)
locCLI:Address2  BYTE,DIM(35),OVER(CLI:Address2)

locIndex   SHORT
locLength  SHORT
locSkip    BYTE
locMaxPatient ULONG
locMinPatient ULONG
locCutDate    ULONG
                        
locToday LONG
locTo LONG
locFrom LONG

locUpdate BYTE
locPatientCount ULONG
locClientCount  ULONG
locDate STRING(10)
locDoB   STRING(10)
locStartDate LONG
QuickWindow          WINDOW,AT(0,0,510,340),FONT('Arial',11,,FONT:regular),GRAY,IMM,MDI,HLP('PrintReport'),SYSTEM, |
  TIMER(500)
                       PANEL,AT(102,24,297,175),USE(?Panel1)
                       ENTRY(@P### ###P),AT(182,72,37,10),USE(Pat:INVOICE),RIGHT(2)
                       BUTTON('Upload'),AT(9,232,75,25),USE(?ButtonUpload),FONT(,,,FONT:bold),HIDE
                       BUTTON('Create PDF'),AT(178,200,75,25),USE(?CreatePDF),FONT(,,,FONT:bold),LEFT,ICON('EXP_PDF.ICO')
                       BUTTON('View PDF'),AT(178,228,75,25),USE(?ViewPDF),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO')
                       BUTTON('Encrypt PDF'),AT(178,256,75,25),USE(?Encrypt),FONT(,,,FONT:bold),LEFT,ICON('secrecy.ico'), |
  HIDE
                       BUTTON('Print PDF'),AT(338,256,75,25),USE(?PrintPDFButton),FONT(,,,FONT:bold),LEFT,ICON('EXP_DOTM.ico')
                       BUTTON('Send eMail'),AT(338,228,75,25),USE(?eMail),FONT(,,,FONT:bold),LEFT,ICON('SENDPOST.ICO')
                       BUTTON('View Fax'),AT(260,201,75,25),USE(?ViewFax),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO')
                       BUTTON('Send Fax'),AT(9,200,75,25),USE(?SendFax),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO'), |
  HIDE
                       BUTTON('Fax Cover'),AT(9,134,75,25),USE(?FaxCover),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO'), |
  HIDE
                       BUTTON('Merge Fax'),AT(9,165,75,25),USE(?FaxMerge),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO'), |
  HIDE
                       BUTTON('Done'),AT(420,280,75,25),USE(?Ok),FONT(,,,FONT:bold),LEFT,ICON(ICON:Tick),MSG('Accept operation'), |
  TIP('Accept Operation')
                       STRING(@s100),AT(182,138,315,10),USE(locEmail),FONT(,,,FONT:bold),LEFT,TRN
                       STRING('eMail'),AT(158,138),USE(?String11),FONT(,,,FONT:bold),TRN
                       BUTTON('...'),AT(318,40,22,12),USE(?SelectPDFPrinter),FONT(,14,,FONT:bold,CHARSET:ANSI)
                       ENTRY(@s64),AT(182,56,131,10),USE(gloResultsPrinter)
                       BUTTON('...'),AT(318,56,22,12),USE(?SelectPDFPrinter:2),FONT(,14,,FONT:bold,CHARSET:ANSI)
                       PROMPT('Results Printer:'),AT(122,56),USE(?gloPrinter:Prompt:2),FONT(,,,FONT:bold),TRN
                       PROMPT('Fax Printer:'),AT(134,40),USE(?gloPrinter:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s32),AT(182,40,131,10),USE(gloFaxPrinter)
                       STRING('Patient:'),AT(150,72),USE(?String7),FONT(,,,FONT:bold),TRN
                       STRING('Patient Name'),AT(130,88),USE(?String4),FONT(,,,FONT:bold),TRN
                       STRING(@s20),AT(182,88),USE(Pat:LAST),FONT(,,,FONT:bold),TRN
                       STRING('Client'),AT(158,100),USE(?String5),FONT(,,,FONT:bold),TRN
                       STRING(@n06),AT(182,100),USE(Pat:CLIENT),FONT(,,,FONT:bold),TRN
                       STRING(@s25),AT(214,100),USE(CLI:LAST),FONT(,,,FONT:bold),TRN
                       STRING('Not Complete'),AT(182,182,91,16),USE(?NotComplete),FONT(,18,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  LEFT,HIDE,TRN
                       CHECK('Over Write Existing File'),AT(182,149),USE(locOverWrite),FONT(,,,FONT:bold),TRN,VALUE('1', |
  '0')
                       STRING(@s7),AT(182,112,105,10),USE(locLanguage),FONT('Arial',11,,FONT:bold,CHARSET:DEFAULT), |
  TRN
                       STRING(@s20),AT(182,162,141,13),USE(locExceptionMessage),FONT(,16,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING('Language'),AT(142,112),USE(?String8),FONT(,,,FONT:bold),TRN
                       BUTTON('&Cancel'),AT(112,176,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Help'),AT(120,232,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Fax'),AT(338,200,75,25),USE(?Fax),FONT(,,,FONT:bold),LEFT,ICON('SteelFax.ico')
                       STRING(@s20),AT(182,125,94),USE(CLI:FAX),FONT(,,,FONT:bold),TRN
                       STRING('Fax'),AT(165,125),USE(?FaxPrompt),FONT(,,,FONT:bold),TRN
                       IMAGE('WAOk.ICO'),AT(416,206),USE(?ImageFax),HIDE
                       IMAGE('WAOk.ICO'),AT(416,232,16,15),USE(?ImageEmail),HIDE
                       IMAGE('WAOk.ICO'),AT(416,256,16,15),USE(?ImagePostal),HIDE
                       STRING(@s128),AT(72,290,315,10),USE(locResultsFile),FONT(,,,FONT:bold),LEFT,TRN
                       BUTTON('Print Fax'),AT(9,260,75,25),USE(?FaxPrint),FONT(,,,FONT:bold),LEFT,ICON('WAVIEW.ICO'), |
  HIDE
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
CheckAge  ROUTINE
  IF  ~PAT:Age OR ~PAT:Age_Type
    locExceptionMessage = 'Age Needed'
  ELSE
    IF PAT:Age_Type = 'M'
      IF ~INRANGE(PAT:Age,1,11)
        locExceptionMessage = 'Age Needed'
  . . .


Wait ROUTINE 
  DISABLE(?CreatePDF,?Fax)
  locDelay = CLOCK() + 500
  LOOP WHILE CLOCK() < locDelay
    IF FILEEXISTS(gloReportFileName & '\' & locFileName) THEN BREAK.
    YIELD
  .
  ENABLE(?CreatePDF,?Fax)


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PrintReport')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Panel1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  gloFaxPrinter = GETINI('PrintReport','FAXPRINTER','HP Universial Fax Driver','PrintResults.INI')
  gloResultsPrinter = GETINI('PrintReport','RESULTSPRINTER','','PrintResults.INI')
  SHARE(Test)
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:Online.Close
   CLOSE(WebPage)
   CLOSE(Passwords)
   CLOSE(Test)
   PUTINI('Graph','Grid',gloGraphGrid,'ALIS.INI')
   PUTINI('Graph','Width',gloGraphWidth,'ALIS.INI')
  
  
  
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
    OF ?CreatePDF
!        STOP('STOP=' & gloOK)
        gloSendout = FALSE
        gloSendout100 = FALSE
        gloSendout200 = FALSE
        IF Pat:CLIENT = 200249
          BuildQueuesHotze(Pat:INVOICE)
        ELSE
          BuildQueues(Pat:INVOICE)
        .  

        PRINTER{PROPPRINT:Device} = gloPDFPrinter
        PAT:Status = 'C'
        PUT(Patient)
        gloPassword = Pat:CLIENT
        gloTotal = 0
        gloDust = 0
        gloMold = 0
        gloPollen = 0
        gloFood = 0
        gloTotalSummary = 0
        
   
  locPassword = PAT:Client
  IF (Pat:INVOICE > 599999 AND Pat:INVOICE < 600030) OR Pat:INVOICE > 600099
    locPassword = Pat:CLIENT_ID
  .
  gloPatient = Pat:INVOICE
  

  
  gloReportFileName = '..\Results\' & PAT:Client & '\'
  IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  gloReportFileName = '..\ResultsNoEncrypt\' & PAT:Client & '\'
  IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
  IF gloLanguage = CLIENT:English_E OR gloSendout  OR gloSendout100   OR gloSendout200
    gloReportFileName = '..\ResultsNoEncrypt\' & PAT:Client & '\'  
    IF CLI:Language = CLIENT:Spanish_S
      locFileName = CLIP(PAT:Invoice) & 's.PDF'
    ELSE
      locFileName = CLIP(PAT:Invoice) & 'e.PDF' 
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',LONGPATH(gloReportFileName))
       STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
    .
    
    IF FILEEXISTS(gloReportFileName & '\' & locFileName) AND ~locOverWrite
      STOP('File Exists: ' & gloReportFileName)
    ELSE   
      IF gloSendout100
        ResultsSendout100
        gloSendout100 = FALSE
        CLI:ReportFormatCML = '0'
      ELSIF gloSendout200
        ResultsSendout100
        gloSendout200 = FALSE
        CLI:ReportFormatCML = '0'
      ELSIF gloSendout
        ResultsSendout
        gloSendout = FALSE
        CLI:ReportFormatCML = '0'
      ELSE
   ! stop('result print else: ' & gloPatient)    
        IF gloVirus
          ResultsPrint
          DO Wait 
        ELSIF Pat:CLIENT = 200249
          HotzeResults
        ELSIF CLI:ReportFormatCML = '1' OR CLI:ReportFormatCML = 'Y'
          cmlReport
          DO Wait 
        ELSIF CLI:Language = 'S'
          SpanishPDF
          DO Wait 
        ELSE
        
!  stop('result print: ' & gloPatient)    
        
  recs# = RECORDS(Results) 
    IF TRUE !~gloOK 
          ResultsPrint
          
          DO Wait 
          gloOK = TRUE
        . 
        POST(EVENT:Completed) 
     .
        IF CLI:BILLING <> CLI:NUMBER
          gloBillingFileName = '..\ResultsNoEncrypt\' & CLI:BILLING & '\'
          IF ~FILEEXISTS(gloBillingFileName) THEN CREATEDIRECTORY(gloBillingFileName).          
        .
      .
    .
    WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PAT:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PAT:FollowUp) & '</font><p>'
    ADD(WebPage)
    PW:Text =   'EncryptPDF -i ..\ResultsNoEncrypt\' &   PAT:Client & '\' & PAT:Invoice & 'e.PDF -o .\' & PAT:Client & '\' & PAT:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
    ADD(Passwords)
    IF CLI:BILLING <> CLI:NUMBER
      PW:Text =   'EncryptPDF -i ..\ResultsNoEncrypt\' &   PAT:Client & '\' & PAT:Invoice & 'e.PDF -o .\' & CLI:BILLING & '\' & PAT:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
      ADD(Passwords)
    .
    PR:Language = gloLanguage
    PR:FileName = PR:Client & '\' & PR:Invoice & 'e.PDF'
    PUT(PatientReports)
  ELSIF gloLanguage = CLIENT:LanguageBoth_B
    gloLanguage = CLIENT:English_E
    
    gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\'    
    locFileName = CLIP(PR:Invoice) & 'e.PDF'
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',LONGPATH(gloReportFileName))
      GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH')
      STOP('Could not create registry DEFAULT_FOLDER_PATH BE' & LONGPATH(gloReportFileName))
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME BE: ' & LONGPATH(locFileName))
    .
    EnglishResults
    WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
    ADD(WebPage)
    PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 'e.PDF -o .\' & PR:Client & '\' & PR:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
    ADD(Passwords)
    IF CLI:BILLING <> CLI:NUMBER
      PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 'e.PDF -o .\' & CLI:BILLING & '\' & PR:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
      ADD(Passwords)
    .
    PR:Language = gloLanguage
    PR:FileName = PR:Client & '\' & PR:Invoice & 'e.PDF'
    PUT(PatientReports)
    gloLanguage = CLIENT:Spanish_S
    
    gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\'   
    locFileName = CLIP(PR:Invoice) & 's.PDF'
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',LONGPATH(gloReportFileName))
      GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH')
      STOP('Could not create registry DEFAULT_FOLDER_PATH BE' & LONGPATH(gloReportFileName))
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME BE: ' & LONGPATH(locFileName))
    .
   
    SpanishPDF
    WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
    ADD(WebPage)
    PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 's.PDF -o .\' & PR:Client & '\' & PR:Invoice & 's.PDF  -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
    ADD(Passwords)
    IF CLI:BILLING <> CLI:NUMBER
      PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 's.PDF -o .\' & CLI:BILLING & '\' & PR:Invoice & 's.PDF  -p -e 128 -l encrypt.log  -w 5994100 -u ' & CLIP(locPassword)
      ADD(Passwords)
    .
  ELSE
    gloLanguage = CLIENT:Spanish_S
    gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\'
    
    locFileName = CLIP(PR:Invoice) & 's.PDF'
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',LONGPATH(gloReportFileName))
      GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH')
      STOP('Could not create registry DEFAULT_FOLDER_PATH BE' & LONGPATH(gloReportFileName))
    .
    IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
      STOP('Could not create registry DEFAULT_FILENAME BE: ' & LONGPATH(locFileName))
    .

    IF FILEEXISTS(gloReportFileName) AND ~locOverWrite
      STOP('File Exists: ' & gloReportFileName)
    ELSE
      SpanishPDF
    .
  .   
  locDelay = CLOCK() + 500
    LOOP WHILE CLOCK() < locDelay
      YIELD
    .
 
  POST(EVENT:Accepted,?Encrypt)
  

      
      
    OF ?Fax
          DISABLE(?Fax)
         
          
      gloReportFileName = LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\')  
      locFileName = 'cover.PDF'
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',CLIP(gloReportFileName))
        STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH') <> CLIP(gloReportFileName)
        STOP(CLIP(gloReportFileName))
      .
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
        STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME') <> CLIP(locFileName)
        STOP(CLIP(locFileName))
      .   
      
          
          
          
          DISABLE(?FaxCover)
          DISABLE(?SendFax) 
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pat:INVOICE
      locExceptionMessage = ''
      GET(Patient,Pat:INVOICE_KEY)
      IF ERRORCODE() AND ERRORCODE() <> 52
        STOP('Patient Record:' & ERROR())
      ELSE
        gloPatient = Pat:INVOICE
        CLI:Number = Pat:CLIENT
        GET(Client,CLI:ORDER_KEY)
        if ERRORCODE() AND ERRORCODE() <> 52 then stop('Client Record:' & error()).
        IF PAT:Status = 'C' THEN HIDE(?NotComplete) ELSE UNHIDE(?NotComplete).
      
        locEmail = CLI:Email & CLI:Physician4 & CLI:Physician3 & CLI:Physician2
        IF CLI:Language = 'S'
          locLanguage = 'Spanish'
        ELSE
          locLanguage = 'English'
        .
        IF CLI:FOLLOW2
          locFollow = 'Follow Up'
        ELSE
          locFollow = ''
        .
        gloLanguage = CLI:Language 
        IF CLI:FaxReport > 0
          ?ImageFax{PROP:Hide} = FALSE
        .
        IF CLI:eMailReport > 0
          ?ImageEmail{PROP:Hide} = FALSE
        .
        IF CLI:Postal = 'Y'
          ?ImagePostal{PROP:Hide} = FALSE
        .
      .
      OL:Date = TODAY()
      OL:Time = CLOCK()
      OL:Number = PAT:Invoice
      OL:PCAE = 9 ! 1=PATIENT + 8=UPDATED
      ADD(Online)
      
      PR:Invoice =  Pat:INVOICE
      PR:Client =   Pat:CLIENT
      
      locDetectedTIgE = FALSE
      locDetectedGAM  = FALSE
      gloTE = 1
      
      gloPatient = PAT:Invoice
      CLEAR(TST:Record)
      TST:INVOICE = PAT:Invoice
      SET(TST:ORDER_KEY,TST:ORDER_KEY)
      LOOP UNTIL EOF(Test)
        NEXT(Test)
        IF TST:INVOICE <> PAT:Invoice OR ERRORCODE() THEN BREAK.
        IF INRANGE(TST:TYPE,4,6) AND  gloTestCodeStartsWith1 <> 'S'
         locDetectedGAM = TRUE
         DO CheckAge
         CYCLE
        .
        IF SUB(TST:Code,1,3) = '100'
          IF BAND(gloTE,TIGE:Complete) OR gloTE = TIGE:Final THEN CYCLE.
          DO CheckAge
          locDetectedTIgE = TRUE
          CASE SUB(TST:Code,5,1)
          OF ''
          OROF '1'
          OROF '2'
            IF TST:Status = 'C'
              gloTE = TIGE:Complete !  TIGE:Complete EQUATE(8)
            ELSIF TST:Status = 'X'
              gloTE += 1            ! INITIALIZED TO 1, + 3 X'S = TIGE:Follow EQUATE(4), RESULTS WILL FOLLOW IF 100, 100-1 AND 100-2 ARE ALL 'X')
            .
          OF '3'
          OROF '4'
          OROF '5'
            IF TST:Status = 'C'     ! TIGE:Final EQUATE(16)
              gloTE = TIGE:Final
          . .
        .
      .
      
      gloPatientNotes[2] = ''
      !      IF locDetectedGAM
      !        locPhraseGAM = 'IgG/IgA/IgM testing performed at Warde Medical Laboratory, Ann Arbor Michigan'!
      !      .
      IF BAND(gloTE,TIGE:Follow+TIGE:Final)
        IF BAND(gloTE,TIGE:Follow)                     
      !          IF locDetectedGAM
      !            gloPatientNotes[2] = CLIP(locPhraseGAM) & ', Total IgE Result to Follow'
      !          ELSE
            gloPatientNotes[2] = 'Total IgE Result to Follow'
      !          .
        ELSE
      !          IF locDetectedGAM
      !            gloPatientNotes[2] = CLIP(locPhraseGAM) & ', Final Total IgE Result'
      !          ELSE
            gloPatientNotes[2] = 'Final Total IgE Result'
      !          .
        .
      !      ELSIF locDetectedGAM
      !        gloPatientNotes[2] = locPhraseGAM
      .
      PUT(Patient)
      DISPLAY()
      !     stop('gloTE: ' & gloTE)
    OF ?ButtonUpload
      ThisWindow.Update
      IF CLI:Language = 'S'
        locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF'
        RUN('CMD /c pscp -p -v -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & CLIP(locFileName) & ' amx@amxemr.com:/home/amx/Z/ResultsNoEncrypt/' & PAT:Client & '/' & Pat:INVOICE & 's.PDF/ & PAUSE & EXIT',1 )   
      ELSE
        locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF'
        RUN('CMD /c pscp -p -v -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & CLIP(locFileName) & ' amx@amxemr.com:/home/amx/Z/ResultsNoEncrypt/' & PAT:Client & '/ & PAUSE & EXIT',1 )   
        SETCLIPBOARD('pscp -p -v -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & CLIP(locFileName) & ' amx@amxemr.com:/home/amx/Z/ResultsNoEncrypt/' & PAT:Client & '/ & PAUSE & EXIT')  
      .
      !RUN('CMD /c pscp -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & locFileName & ' amx@amxemr.com:/home/amx/Z/' & PAT:Client & '/Results/ & exit')   
      locLength = LEN(CLIP(PAT:First))
      LOOP locIndex = 1 TO locLength
        IF INRANGE(locPAT:First[locIndex],0,31) OR INRANGE(locPAT:First[locIndex],91,96) OR locPAT:First[locIndex] = 34  OR locPAT:First[locIndex] > 122
          locPAT:First[locIndex] = 32
        .
      .
      locLength = LEN(CLIP(PAT:Last))
      LOOP locIndex = 1 TO locLength
        IF INRANGE(locPAT:Last[locIndex],0,31) OR INRANGE(locPAT:Last[locIndex],91,96) OR locPAT:Last[locIndex] = 34  OR locPAT:Last[locIndex] > 122
          locPAT:First[locIndex] = 32
        .
      .
      locDay = FORMAT(DAY(PAT:Date),@N02)
      locMonth = FORMAT(MONTH(PAT:Date),@N02)
      locYear = FORMAT(YEAR(PAT:Date),@N04)
      locDate = locYear & '-' & locMonth & '-' & locDay
      
      locDay = FORMAT(DAY(PAT:DOB),@N02)
      locMonth = FORMAT(MONTH(PAT:DOB),@N02)
      locYear = FORMAT(YEAR(PAT:DOB),@N04)
      locDoB = locYear & '-' & locMonth & '-' & locDay
      gloFilename = '../buData/amxUpdate.SQL'
      CLOSE(Text)
      CREATE(Text)
      OPEN(Text)
      
      TXT:Text = 'INSERT INTO `amx_portal`.`Patient` (`Client`, `Patient`, `Date`, `Last`, `First`, `DoB`, `Age`, `Sex`, `Status`, `ClientID`, `Updated`) VALUES ("' & PAT:Client & '", "' & PAT:Invoice & '", "' & locDate & '", "' & CLIP(PAT:Last) & '", "' & CLIP(PAT:First) & '", "' & locDoB & '", "' & CLIP(PAT:Age)   & '", "' & CLIP(PAT:Sex) & '", "' & CLIP(PAT:Status) & '", "' & CLIP(PAT:Client_ID) & '", CURRENT_TIMESTAMP);'
      ADD(Text)
      IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
      TXT:Text = 'UPDATE `amx_portal`.`Patient` SET `Client`=' & PAT:Client  & ',`Patient`= "' & CLIP(PAT:Invoice) & '",`Date`= "' & locDate & '",`Last`= "' & CLIP(PAT:Last) & '",`First`= "' & CLIP(PAT:First) & '",`DoB`= "' & locDOB & '",`Age`= "' & CLIP(PAT:Age) & '",`Sex`= "' & CLIP(PAT:Sex) & '",`Status`= "' & CLIP(PAT:Status) & '",`ClientID`= "' & CLIP(PAT:Client_ID) & '",`Updated`= CURRENT_TIMESTAMP WHERE `Patient`= ' & PAT:Invoice & ';'
      ADD(Text)
      IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
      CLOSE(Text)
      RUN('CMD /c pscp  -v -pw 7oT9W6l7E3cS2ge4O1UXxdDi ..\budata\amxUpdate.SQL amx@amxemr.com:/home/amx/Z/buData/ & exit',1)   
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/update.php')   
    OF ?ViewPDF
      ThisWindow.Update
      CLI:Number = Pat:CLIENT
      GET(Client,CLI:ORDER_KEY)      
      IF CLI:Language = 'S'
        locFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF')
      ELSE
        locFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF')
      . 
      run('acrord32.exe ' & locFileName)
    OF ?Encrypt
      ThisWindow.Update
        locPassword = PAT:Client
        IF (Pat:INVOICE > 599999 AND Pat:INVOICE < 600030) OR Pat:INVOICE > 600099
          locPassword = Pat:CLIENT_ID
        .
        locEncryptPDF = '"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" ENCRYPT'
        IF CLI:Language = 'S'
          locFileName =  LONGPATH('..\ResultsNoEncrypt\') &  Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF'
          locTargetFileName =  LONGPATH('..\Results\') & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF'
          RUN('CMD /c ' & CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & CLIP(locPassword))
        ELSE
          locFileName =  LONGPATH('..\ResultsNoEncrypt\') & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF'
          locTargetFileName =  LONGPATH('..\Results\') & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF'          
          SETCLIPBOARD('CMD /c ' & CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -p -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & CLIP(locPassword))
          RUN('CMD /c ' & CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & CLIP(locPassword))
        .      
    OF ?PrintPDFButton
      ThisWindow.Update
      IF CLI:Language = 'S'
        locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf'
      ELSE
        locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf'
      .
      IF CLI:FaxReport
      !     FaxCover(0)
      .
      
      locDelay = CLOCK() + 200
      LOOP WHILE CLOCK() < locDelay
        YIELD
      .
      RUN('acrord32.exe  /n /s /h /o /t ' & SHORTPATH(locFileName) & ' "' & CLIP(gloResultsPrinter) & '"')
    OF ?eMail
      ThisWindow.Update
      gloReportFileName = LONGPATH('..\Results\' & PR:Client & '\')  
      DOC:Number =  DOC:Confidentiality + DOC:Text 
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locDisclaimer = DOC:Body
      .
      DOC:Number =  DOC:FaxCover  + DOC:Text 
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locLogo = DOC:Body
      .
      CLEAR(DOC:Record)
      
      
      IF CLI:Language = 'S'
        locSubjectS = 'Allermetrix:  Le adjuntamos los resultados de las pruebas de alergia de su paciente'
        locBodyS = 'Le adjuntamos los resultados de las pruebas de alergia de su paciente. Si tiene alguna pregunta o desea m&#225s informaci&#243n&#44 comun�quese con nosotros por medio de este correo electr&#243nico.<p>C&#243mo abrir los archivos pdf de ' & PAT:Client & '<p>Gracias.<p><br>Gary A. Kitos&#44 Ph.D.&#44 H.C.L.D.<br>Director del Laboratorio M&#233dico<br>Tel: 615-599-4100<br>Fax: 615-599-4648'
        locAttachments = 'file:///' & CLIP(gloReportFileName) & CLIP(PR:Invoice) & 's.PDF'
        RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectS) & ',body=''' & CLIP(locLogo) & CLIP(locBodyS) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
      ELSE        
        locSubjectE = 'Allermetrix Test Results'
        locBodyE = '<h3 style="color:#20889A;">Test Results Attached</h3>'
        locAttachments = 'file:///' & CLIP(gloReportFileName) & CLIP(PR:Invoice) & 'e.PDF'
        RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=''' & CLIP(locLogo) & CLIP(locBodyE) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
        RUN(PATH('C:\Program Files\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=''' & CLIP(locLogo) & CLIP(locBodyE) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
        SETCLIPBOARD(PATH('C:\Program Files\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=''' & CLIP(locLogo) & CLIP(locBodyE) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
      .
    OF ?ViewFax
      ThisWindow.Update
      locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF'
      RUN('acrord32.exe  /n /s /o ' & locFileName)
    OF ?SendFax
      ThisWindow.Update
      DISABLE(?SendFax)
      locOutputName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF' 
      STOP('print /D:HP Universial Fax Driver ' & locOutputName)
      RUN('print /D:HP Universial Fax Driver ' & locOutputName)     
      ENABLE(?SendFax)
    OF ?FaxCover
      ThisWindow.Update
      gloReportFileName = LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\')  
      locFileName = 'cover.PDF'
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH',CLIP(gloReportFileName))
        STOP('Could not create registry DEFAULT_FOLDER_PATH: ' & LONGPATH(gloReportFileName))    
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FOLDER_PATH') <> CLIP(gloReportFileName)
        STOP(CLIP(gloReportFileName))
      .
      IF PUTREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME',CLIP(locFileName))
        STOP('Could not create registry DEFAULT_FILENAME: ' & LONGPATH(locFileName))      
      .
      IF GETREG(REG_CURRENT_USER,'SOFTWARE\PlotSoft\Writer\OutputOption','DEFAULT_FILENAME') <> CLIP(locFileName)
        STOP(CLIP(locFileName))
      .  
      FaxRequest2(3)        
      !FaxCover(1)
          
      
    OF ?FaxMerge
      ThisWindow.Update
      IF CLI:Language = 'S'      
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF')
      ELSE
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF')
      .       
      locFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\'  & 'cover.PDF')
      locOutputName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF')              
      REMOVE(locOutputName)    
      
            DISABLE(?SendFax)     
            STOP('"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" MERGE ' & CLIP(locFileName) & ' ' & CLIP(gloReportFileName) & ' ' & CLIP(locOutputName)) 
            RUN('"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" MERGE ' & CLIP(locFileName) & ' ' & CLIP(gloReportFileName) & ' ' & CLIP(locOutputName)) 
            
            locDelay = CLOCK() + 2500
            LOOP WHILE CLOCK() < locDelay
              YIELD    
              IF FILEEXISTS(locOutputName) THEN BREAK. 
            .              
      
            ENABLE(?SendFax)
    OF ?SelectPDFPrinter
      ThisWindow.Update
      PRINTERDIALOG
      gloPDFPrinter = PRINTER{PROPPRINT:Device}
      DISPLAY()
      PUTINI('PrintReport','PDFPRINTER',gloPDFPrinter,'PrintResults.INI')
      
      
      
    OF ?SelectPDFPrinter:2
      ThisWindow.Update
      PRINTERDIALOG
      gloResultsPrinter = PRINTER{PROPPRINT:Device}
      DISPLAY()
      PUTINI('PrintReport','RESULTSPRINTER',gloResultsPrinter,'PrintResults.INI')
      
    OF ?Fax
      ThisWindow.Update
      FaxCover(1)
      ThisWindow.Reset
      DISABLE(?SendFax)   
      
      IF CLI:Language = 'S'      
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF')
      ELSE
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF')
      .       
      locFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\'  & 'cover.PDF')
      locOutputName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF')  
      IF FILEEXISTS(locFileName) THEN REMOVE(locFileName).  
      IF FILEEXISTS(locOutputName) THEN REMOVE(locOutputName).  
      locDelay = CLOCK() + 150
      LOOP WHILE CLOCK() < locDelay
        YIELD    
      .         
      FaxCover(1)
      locDelay = CLOCK() + 900
      LOOP WHILE CLOCK() < locDelay
        YIELD    
        IF FILEEXISTS(locFileName) THEN BREAK. 
      .              
      locDelay = CLOCK() + 250
      LOOP WHILE CLOCK() < locDelay
        YIELD    
      .              
            
            RUN('"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" MERGE ' & CLIP(locFileName) & ' ' & CLIP(gloReportFileName) & ' ' & CLIP(locOutputName),1) 
            
            locDelay = CLOCK() + 900
            LOOP WHILE CLOCK() < locDelay
              YIELD    
              IF FILEEXISTS(locOutputName) THEN BREAK. 
            .   
            locDelay = CLOCK() + 250
            LOOP WHILE CLOCK() < locDelay
              YIELD    
            .              
            ENABLE(?FaxMerge)
            ENABLE(?ViewFax)
            ENABLE(?SendFax)
            ENABLE(?Fax)      
      !     REMOVE(locFileName)  
      ! RUN('print /D:HP Universial Fax Driver ' & locOutputName)       
      
      
      locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF'
      RUN('acrord32.exe  /n /s /o ' & locFileName)   
      
      
    OF ?FaxPrint
      ThisWindow.Update
      RUN('acrord32.exe  /n /s /h /o /t fax.pdf "HP Universal Fax Driver"')
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
      PAT:Invoice = CLIPBOARD()
      IF ~INRANGE(Pat:INVOICE,100000,999999)
        PAT:Invoice = 0
      ELSE
        DISPLAY(?PAT:Invoice)
        POST(EVENT:Accepted,?PAT:Invoice)
      .
    OF EVENT:Timer
      
      IF CLI:Language = 'S'
        locResultsFile =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf'
      ELSE
        locResultsFile =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf'
      . 
      IF FILEEXISTS(locResultsFile)   
        ENABLE(?ViewPDF,?FaxMerge)
      ELSE  
      !  DISABLE(?ViewPDF,?FaxMerge)
      .   
      DISPLAY(?locResultsFile)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
BuildQueues          PROCEDURE  (prmPatient)               ! Declare Procedure
ReduceAmount         DECIMAL(7,2)                          !
locUnits             STRING(6),DIM(2,9)                    !
locNumber            LONG                                  !
locSpanish           LONG                                  !
locDetectedTotalE    BYTE                                  !
locType              BYTE                                  !
locMark              BYTE                                  !
GEEFEE               DECIMAL(7,2)                          !
Dupamount            DECIMAL(7,2)                          !
FollowUp             BYTE                                  !
locCML  BYTE 
locSelectUnits BYTE
locZero STRING(8),DIM(2)
locScore STRING(8),DIM(2,6)

    

Level                   BYTE
SAV:Panel   STRING(9)
SAV:CODE    STRING(9)
SAV:DESCRIPTION STRING(40)
locSTypes STRING('IgGIgAIgM')
locSType  STRING(3),DIM(3),OVER(locSTypes)

QueNS       QUEUE,PRE(QNS)
Type            STRING(9)
Code            STRING(9)
!Description     STRING(30)
Fee             DECIMAL(9,2)
!Note            STRING(12)

CML STRING(3),DIM(7)
            .
Window WINDOW('Collecting Patient Data'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
     END
FilesOpened     BYTE(0)

  CODE
  gloSendout = FALSE
  gloVirus = FALSE
  DO  OpenFiles
  SET(Normals,1)
  NEXT(Normals)
  OPEN(Window)
  SHARE(GAM)
 ! if errorcode() then stop(' Error opening setup #1,'&error()).
 ! set(Setup)
 ! next(setup)
 ! GET(Setup,1)
 ! if errorcode() then stop(' Error geting setup #1,'&error()).
 ! stop ('su:tige=' & su:tige)
  FREE(Results)            
  Pat:INVOICE = prmPatient
  GET(Patient,PAT:INVOICE_KEY) 
  IF ERRORCODE() THEN STOP('Pat: ' & ERROR()).
  CLI:NUMBER = Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)    
  IF ERRORCODE() THEN STOP('cli: ' & ERROR()). 
  gloDATE = TODAY()
  gloTIME = CLOCK()
  gloTotal = 0
  locZero[1] = '0'
    
  locScore[2][1] = 'I'
  locScore[2][2] = 'II'
  locScore[2][3] = 'III'
  locScore[2][4] = 'IV'
  locScore[2][5] = 'V'
  locScore[2][6] = 'VI'
    
  locScore[1][1] = '1'
  locScore[1][2] = '2'
  locScore[1][3] = '3'
  locScore[1][4] = '4'
  locScore[1][5] = '5'
  locScore[1][6] = '6'    
  
  locUnits[1][1] = ' kU/L'
  locUnits[1][2] = ' �g/mL'
  locUnits[1][3] = ' �g/mL'
  locUnits[1][4] = ''
  locUnits[1][5] = ''
  locUnits[1][6] = ''
  locUnits[1][7] = ' �g/mL'
  locUnits[1][8] = ' �g/mL'
  locUnits[2][1] = ''
  locUnits[2][2] = ''
  locUnits[2][3] = ''
  locUnits[2][4] = ''
  locUnits[2][5] = ''
  locUnits[2][6] = ''
  locUnits[2][7] = ''
  locUnits[2][8] = ''  
  
  locSelectUnits = 1
  IF INRANGE(Pat:CLIENT,500000,599999) AND (CLI:ReportFormatCML = '1' OR CLI:ReportFormatCML = 'Y')
    locSelectUnits = 2
  .
  locCML = 1
  IF INRANGE(Pat:CLIENT,500000,599999) AND (CLI:ReportFormatCML = '1' OR CLI:ReportFormatCML = 'Y')
    locCML = 2
  .

  locSpanish = FALSE
  IF CLI:NUMBER < 200000
    locSpanish = TRUE   
    locSelectUnits = 2
  .
      
 ! STOP(locSelectUnits & ', ' & locCML & ', ' & CLI:ReportFormatCML & ', ' & CLI:INVOICE )    
      
      
  gloTotalEConc = 0
  gloTotalEScore = ''
  locDetectedTotalE = FALSE
  gloE = 0
  gloG = 0
  gloG4 = 0
  gloTE = 0
  gloTG = 0
  gloTA = 0
  gloTM = 0
  CLEAR(gloGAM[])
  CLEAR(gloIGG[])
  FollowUp = FALSE
  IF INRANGE(CLI:NUMBER,800000,888887)
    gloAllercare = TRUE
  ELSE
    gloAllercare = FALSE
  .
  GAM:Age = PAT:Age
  GAM:AgeType = Pat:AGE_TYPE
  IF GAM:Age > 18
    GAM:Age = 18
  .
  SHARE(Test)
  CLEAR(TST:Record)
  TST:INVOICE = prmPatient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  IF ERRORCODE() THEN STOP('SET TST:' & ERROR()). 
  LOOP UNTIL EOF(Test)                          !Main LOOP - TEST
    NEXT(TEST)
    IF TST:INVOICE <> prmPatient THEN BREAK.
    IF UPPER(TST:Status) = 'X' THEN CYCLE.
    IF SUB(TST:Code,1,3) = '100'
      gloTotal = 1
      gloTE = EQ:Tested
      gloTotalEConc = TST:Count
      CYCLE  ! Exclude from Results Queue
    .          
    locZero[2] = 'Negative'
    locScore[2][1] = 'I'
    locUnits[2][7] = ''
    locUnits[2][8] = ''
    IF INRANGE(TST:TYPE,7,8) 
      gloVirus = TRUE 
      locZero[2] = '0'   
      locScore[2][1] = '1'
      locUnits[2][7] = ' �g/mL'
      locUnits[2][8] = ' �g/mL'
    .    
    CLEAR(Results)  
    RES:Percentile = TST:Percentile
    IF gloTestCodeStartsWith2 = 'S0'  THEN locCML = 1;gloSendout = TRUE.
    IF gloTestCodeStartsWith2 = 'S2'
      gloSendout200 = TRUE
      IF TST:RANGE AND ~TST:COUNT
        RES:Conc = TST:RANGE 
      ELSE 
        RES:Conc = FORMAT(TST:COUNT,@n_6.1) 
      .
      IF ~TST:Score
        IF TST:RANGE AND ~TST:COUNT
          TST:COUNT = TST:Range
        .
        IF TST:COUNT < 1
          RES:Score = locZero[1]
        ELSE
          RES:Score = '1'
        .
      ELSE
        IF TST:Score = '0'
          RES:Score = locZero[1]
        ELSIF TST:Score = '0/1'
          RES:Score =  '0/1'
        ELSE
         RES:Score = locScore[1][TST:Score]
        .
      .
      RES:TYPE = locSType[VAL(TST:CODE[4:4]) - 51]    ! CONVERT TO NUMERIC '4'=1 '5'=2 '6'=3 Indexes SType
   !   stop(TST:CODE[4:5] & ' 1- ' &  VAL(TST:CODE[4:5]) & ' 2- ' & VAL(TST:CODE[4:5]) - 51  & ' 3- ' & locSType[VAL(TST:CODE[4:5]) - 51]  )
      DO GetDescription
      ADD(Results)
      CYCLE
    ELSIF gloTestCodeStartsWith3 = 'S13'   ! Reticulin
      gloSendout100 = TRUE
      RES:Code = TST:CODE
      IF TST:RANGE
        RES:Conc = TST:RANGE  
      ELSE 
        RES:Conc = FORMAT(TST:Count,'@p1:<<#p')
      .
      IF ~TST:Score
        IF TST:RANGE AND ~TST:COUNT
          locMark = INSTRING(':',TST:RANGE,1)
          TST:COUNT = SUB(TST:RANGE,locMark+1,3)
        .
        IF TST:COUNT = 40
          RES:Score = '0/1'
        ELSIF TST:COUNT > 40
          RES:Score = '1'
        ELSE
          RES:Score = locZero[1]
        .
      ELSE
        IF TST:Score = '0'
          RES:Score = locZero[1]
        ELSIF TST:Score = '0/1'
          RES:Score =  '0/1'
        ELSE
         RES:Score = locScore[locSelectUnits][TST:Score]
        .

      .
      DO GetDescription
      ADD(Results)
      CYCLE


    ELSIF gloTestCodeStartsWith2 = 'S1'   ! Gliadin &  Transglutaminase
      gloSendout100 = TRUE
      RES:Code = TST:CODE
      RES:TYPE = locSType[VAL(TST:CODE[4:4]) - 51]    ! CONVERT TO NUMERIC '4'=1 '5'=2 '6'=3 Indexes SType
      IF TST:RANGE AND ~TST:COUNT
        RES:Conc = TST:RANGE  
      ELSE 
        RES:Conc = FORMAT(TST:COUNT,@n_6.1)  
      .
      IF ~TST:Score
        IF TST:RANGE AND ~TST:COUNT
          TST:COUNT = TST:Range
        .
        IF TST:COUNT < 20
          RES:Score = locZero[1]
        ELSIF TST:COUNT > 30
          RES:Score = '1'
        ELSE
          RES:Score = '1/0'
        .
      ELSE
        IF TST:Score = '0'
          RES:Score = locZero[1]
        ELSIF TST:Score = '0/1'
          RES:Score =  '0/1'
        ELSE
         RES:Score = locScore[1][TST:Score]
        .
      .    
      DO GetDescription
      ADD(Results)
      CYCLE
    ELSIF gloTestCodeStartsWith2 = 'S0'
      gloSendout = TRUE
      RES:Conc = TST:RANGE
    ELSE 
      IF TST:TYPE = 7
        RES:Score = TST:Score 
        IF TST:Count < 0.38
          RES:Conc = '< 0.38 �g/mL'
          IF TST:CODE = 'A099' OR TST:CODE = 'A100'
            RES:BAU = '< 7.11 BAU/mL'
          ELSIF TST:CODE = 'A101' OR TST:CODE = 'A102'
            RES:BAU = '< 2.72 BAU/mL'
          ELSIF TST:CODE = 'A103' OR TST:CODE = 'A104'
             RES:BAU = '< 6.90 BAU/mL'
          .
       ELSE 
          RES:Conc = FORMAT(TST:Count,@N_7.2) & locUnits[locSelectUnits][TST:Type]
          IF TST:count > 99.99 THEN RES:Conc = FORMAT(TST:Count,@N_4) & locUnits[locSelectUnits][TST:Type].
          IF TST:CODE = 'A099' OR TST:CODE = 'A100' ! OR TST:CODE = 'A199' OR TST:CODE = 'A200'
            RES:BAU = FORMAT(TST:Count * 18.71,@N_8.2) & ' BAU/mL'
            IF TST:count > 53.4 THEN RES:BAU = FORMAT(TST:Count * 18.71,@N_6) & ' BAU/mL'.
          ELSIF TST:CODE = 'A101' OR TST:CODE = 'A102' 
            RES:BAU = FORMAT(TST:Count * 7.17,@N_8.2) & ' BAU/mL'
            IF TST:count > 139.4 THEN RES:BAU = FORMAT(TST:Count * 18.71,@N_6) & ' BAU/mL'.
          ELSIF TST:CODE = 'A103' OR TST:CODE = 'A104' 
             RES:BAU = FORMAT(TST:Count * 18.16,@N_8.2) & ' BAU/mL'
             IF TST:count > 55 THEN RES:BAU = FORMAT(TST:Count * 18.71,@N_6) & ' BAU/mL'.
          .
          
        .
      ELSIF TST:TYPE = 8   
        RES:Score = TST:Score
        IF TST:Count < 0.5  
          RES:Conc = '< 0.50 �g/mL'
        ELSE 
          RES:Conc = FORMAT(TST:Count,@N_7.2) & locUnits[locSelectUnits][TST:Type]
        .
     ELSIF TST:Count < 0.04 AND gloTestCodeStartsWith1 <> 'S'
        IF TST:Type = Type:IgE
          IF locSpanish
            RES:Conc = FORMAT(TST:COUNT,@n_7.2) & locUnits[locSelectUnits][TST:Type]
          ELSE
            RES:Conc = CLIP(LEFT(NOR:OffScaleLowE))  & locUnits[locSelectUnits][TST:Type]
          .
        ELSIF TST:Type = Type:IgG
          RES:Conc = CLIP(LEFT(NOR:OffScaleLowG))  & locUnits[locSelectUnits][TST:Type]
        ELSIF TST:Type = Type:TIgG
          gloTotalGScore = TST:Range
          IF gloTotalGScore = '0'
            gloTG = EQ:Normal
          ELSE
            gloTG = EQ:Depressed
          .
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue
        ELSIF TST:Type = Type:TIgA
          gloTotalAScore = TST:Range
          IF gloTotalAScore = '0'
            gloTA = EQ:Normal
          ELSE
            gloTA = EQ:Depressed
          .
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue
        ELSIF TST:Type = Type:TIgM
          gloTotalMScore = TST:Range
          IF gloTotalMScore = '0'
            gloTM = EQ:Normal
          ELSE
            gloTM = EQ:Depressed
          .
          gloTM = EQ:Depressed
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue  
        ELSIF INRANGE(TST:TYPE,7,8) 
          RES:Conc = TST:COUNT & locUnits[locSelectUnits][TST:Type]
        ELSE
          RES:Conc = CLIP(LEFT(NOR:OffScaleLowG4)) & locUnits[locSelectUnits][TST:Type]
        .
      ELSIF TST:Count = 999
        IF TST:Type = Type:IgE
          RES:Conc = CLIP(LEFT(NOR:OffScaleHiE))   & locUnits[locSelectUnits][TST:Type]
        ELSIF TST:Type = Type:IgG
          RES:Conc = CLIP(LEFT(NOR:OffScaleHiG))  & locUnits[locSelectUnits][TST:Type]
        ELSE
          RES:Conc = CLIP(LEFT(NOR:OffScaleHiG4))  & locUnits[locSelectUnits][TST:Type]
        .
      ELSE  
        IF TST:Type = Type:TIgG
          gloTotalGScore = TST:Count
          GAM:Type = TST:Type
          GET(GAM,GAM:OrderKey)
          IF TST:Count > GAM:UpperRange
            gloTG = EQ:Elevated
            gloTotalSummary = TRUE
          ELSIF TST:Count < GAM:LowerRange
            gloTG = EQ:Depressed
            gloTotalSummary = TRUE
          ELSE
            gloTG = EQ:Normal
          .
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue
        ELSIF TST:Type = Type:TIgA
          gloTotalAScore = TST:Count
          GAM:Type = TST:Type
          GET(GAM,GAM:OrderKey)
          IF TST:Count > GAM:UpperRange
            gloTA = EQ:Elevated
            gloTotalSummary = TRUE
          ELSIF TST:Count < GAM:LowerRange
            gloTA = EQ:Depressed
            gloTotalSummary = TRUE
          ELSE
            gloTA = EQ:Normal
          .
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue
        ELSIF TST:Type = Type:TIgM
          gloTotalMScore = TST:Count
          GAM:Type = TST:Type
          GET(GAM,GAM:OrderKey)
          IF TST:Count > GAM:UpperRange
            gloTM = EQ:Elevated
            gloTotalSummary = TRUE
          ELSIF TST:Count < GAM:LowerRange
            gloTM = EQ:Depressed
            gloTotalSummary = TRUE
          ELSE
            gloTM = EQ:Normal
          .
          gloTotal = 1
          CYCLE  ! Exclude from Results Queue
        ELSE
          RES:Conc = FORMAT(TST:Count,@N7.2) & locUnits[locSelectUnits][TST:Type]   
        . 
      .
    .
    RES:Status = TST:Status
    RES:CODE = TST:CODE
    IF TST:Score = '0'
      RES:Score = locZero[locCML]
    ELSIF TST:Score = '0/1'
      RES:Score =  '0/1'
    ELSE
     RES:Score = locScore[locCML][TST:Score]
    .
    IF RES:Score = '0'
      RES:Summary = 0
    ELSE
      RES:Summary = 1
    .
    locType = TST:Type
    IF INRANGE(TST:TYPE,1,8)
      RES:TYPE = gloTypeDescription[TST:TYPE] 
    ELSE
      CYCLE
    .
    DO GetDescription
    
    DO AssignSort
    ADD(Results)
  .
  IF locDetectedTotalE AND ~gloTE
    gloTE = EQ:OffScale
  .
  CLOSE(Window)
  CLOSE(Test)
  DO CloseFiles




GetDescription ROUTINE
  RST:NUMBER = RES:CODE
  GET(RAST,RST:ORDER_KEY)
  IF ERRORCODE()
    RES:DESCRIPTION = RES:CODE & ': ' & ERROR()
  ELSE
    IF gloLanguage = 'E'
      RES:DESCRIPTION = CLIP(RST:Description)
    ELSE
      RES:DESCRIPTION = RST:sDescription
    .
  .
  IF INRANGE(RST:FeeLevel,1,5)
    RES:Fee = gloFees[locType,RST:FeeLevel]
  .
  RES:FeeLevel = RST:FeeLevel
  EXECUTE locType
  gloE = 1
  gloG = 1
  gloG4 = 1
  .
  


AssignSort  ROUTINE
  RES:Category = gloTestCodeStartsWith1
  CASE RES:Category   
  OF 'A'
     locNumber = SUB(TST:CODE,2,3) 
     IF locNumber >  102   
       RES:SORT = 5
       RES:Category = 'Z'
     ELSIF locNumber >  100  
       RES:SORT = 5
       RES:Category = 'Y'
     ELSE
       RES:SORT = 5 
       RES:Category = 'X'     
     .     
  OF 'F'
    RES:SORT = 3  ! Food
  OF 'E'
    RES:SORT = 2
    IF gloTestCodeStartsWith4 = 'EZ06'
      RES:Category = 'D'
    .
  OF 'H'
    RES:SORT = 2
    RES:Category = 'D'

  OF 'D'
  OROF 'M'
    RES:SORT = 2 ! Environmental
  OF 'I'
    CASE gloTestCodeStartsWith4
    OF 'I206'
    OROF 'I006'
      RES:SORT = 2
      RES:Category = 'D'
    ELSE
      RES:SORT = 4
    .
  OF 'G'
  OROF 'T'
  OROF 'W'
    RES:SORT = 1 ! Pollen
  ELSE
    RES:SORT = 4  ! Other
  .

Reduce  ROUTINE
  m# = 0
!--------------------------------------
OpenFiles  ROUTINE
  Access:Client.Open                                       ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Client.UseFile                                    ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Patient.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Patient.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.Open                                         ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.UseFile                                      ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Cli_panl.Open                                     ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Cli_panl.UseFile                                  ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Panels.Open                                       ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Panels.UseFile                                    ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Normals.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Normals.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:Client.Close
     Access:Patient.Close
     Access:Rast.Close
     Access:Cli_panl.Close
     Access:Panels.Close
     Access:Normals.Close
     FilesOpened = False
  END
!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
SpanishPDF PROCEDURE 

Progress:Thermometer BYTE                                  !
locSummary           BYTE                                  !
locPollen            STRING(20)                            !
locHeading           STRING(20)                            !
locAccount           LONG                                  !
locPatientText       STRING(512)                           !
SAV:Sort             BYTE                                  !
SAV:Type             STRING(4)                             !
SAV:Code             STRING(5)                             !
locAge               BYTE                                  !
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:Notes)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient'),AT(,,142,59),FONT('MS Sans Serif',8,,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3600,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8500,3448)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?String41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?String42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?String43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Tel�fono: 615-599-4100'),AT(6271,719,1458,156),USE(?String44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?String45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s24),AT(5125,1188,2792,292),USE(gloREPORTTITLE),FONT(,16,COLOR:Black,FONT:bold),CENTER(4), |
  TRN
                         LINE,AT(7917,3229,0,-2083),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3500,1906),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5125,1813,2792,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5115,1135,0,1729),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-365),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2083),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Numero Del Cliente'),AT(229,2521),USE(?String34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha De Colecci�n'),AT(2313,2521),USE(?String35),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Fecha Recibido'),AT(4031,2521),USE(?String36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha Reportado'),AT(5438,2521,1156,188),USE(?String37),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         STRING('Hora Imprimido'),AT(6938,2521,927,188),USE(?String38),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Nombre Del Paciente (Apellido, Nombre)'),AT(167,2167,2052,188),USE(?String29),FONT('Arial', |
  8,,FONT:underline),TRN
                         STRING('Sexo'),AT(7500,2167),USE(?String33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha De Naciemento'),AT(5406,2156,1146,188),USE(?String30:2),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         STRING(''),AT(5469,2135),USE(?String133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Edad'),AT(6927,2167),USE(?String32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('# DE RESULTADO'),AT(6042,1573,1042,188),USE(?String31),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('# De Identificaci�n'),AT(3833,2146,1146,188),USE(?String30),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         STRING(@s40),AT(208,2323,3333,146),USE(gloPatName)
                         STRING(@d2b),AT(5615,2323,729,156),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S16),AT(2313,2677,1063,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,146),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,156),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Nota:'),AT(365,2896),USE(?String39),FONT('Arial',8,,FONT:underline),TRN
                         TEXT,AT(1021,2896,6771,375),USE(Pat:Notes),BOXED
                         STRING('# DE CUENTA'),AT(6042,1906),USE(?String93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3500,1510,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5115,1510,2802,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3500,1708,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
Elevated               DETAIL,AT(10,,8302,240)
                         BOX,AT(6167,63,896,219),USE(?Box6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,52,479,219),USE(?Box5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2792,42,2698,219),USE(?Box4:6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,31,948,219),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(7146,52,542,229),USE(?Box18),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s4),AT(7177,83,479,208),USE(RES:Type,,?RES:Type:6),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Elevado'),AT(1740,52,677,219),USE(?Elevated:2),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2813,83),USE(RES:Description,,?RES:Description:12),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6177,94,875,208),USE(RES:Conc,,?RES:Conc:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>>'),AT(1375,63),USE(?String81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5688,83),USE(RES:Score,,?RES:Score:10),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
Normal                 DETAIL,AT(10,,8302,240)
                         BOX,AT(6167,42,896,219),USE(?Box6:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,42,479,219),USE(?Box5:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2792,42,2698,219),USE(?Box4:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,31,948,219),USE(?LevelBox:6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(7146,52,542,229),USE(?Box18),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s4),AT(7146,83,510,208),USE(RES:Type,,?RES:Type:7),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Normal'),AT(1750,52,677,219),USE(?Normal:3),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2833,63),USE(RES:Description,,?RES:Description:4),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6188,73,844,208),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s3),AT(5688,63),USE(RES:Score,,?RES:Score:4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
Equivocal              DETAIL,AT(10,,8302,240)
                         BOX,AT(6167,42,896,219),USE(?Box6:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,42,479,219),USE(?Box5:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2792,42,2698,219),USE(?Box4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,42,948,219),USE(?LevelBox:5),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(7146,52,542,229),USE(?Box18),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s4),AT(7135,83,542,208),USE(RES:Type),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equ�voco'),AT(1760,63,677,219),USE(?Equivocal:3),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2833,63),USE(RES:Description),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s7),AT(6177,52,865,208),USE(RES:Conc,,?RES:Conc:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>'),AT(1458,63),USE(?String81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5688,63),USE(RES:Score,,?RES:Score:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
Heading                DETAIL,AT(10,10,8302,292),TOGETHER
                         BOX,AT(667,10,2010,250),USE(?Box3:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING(@s24),AT(646,31,2031,240),USE(locHeading),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
PageBreak              DETAIL,AT(10,10,8302,146),PAGEAFTER(-1)
                       END
Text                   DETAIL,AT(-313,,8302,6000),PAGEAFTER(-1)
                         TEXT,AT(500,52,7688,5948),USE(DOC:Body),RTF(TEXT:Field),BOXED
                       END
Total                  DETAIL,AT(10,,8302,469)
                         BOX,AT(677,-10,1896,250),USE(?Box3:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Inmunoglobulina'),AT(917,0),USE(?locHeading:8),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(5542,271,896,219),USE(?Box16:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,271,2698,219),USE(?Box14),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6573,260,1052,229),USE(?Box15:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Nivel Normal'),AT(6594,281,1042,208),USE(?String71:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),TRN
                         STRING('Conc (kU/L)'),AT(5594,292,875,208),USE(?String72:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),TRN
                         STRING('Inmunoglobulina'),AT(3438,281,1438,208),USE(?String44:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
TElevated              DETAIL,AT(10,,8302,240)
                         BOX,AT(5563,63,896,219),USE(?Box6:4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2792,42,2698,219),USE(?Box4:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,31,948,219),USE(?LevelBox:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(6573,52,1052,229),USE(?Box18:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('>>'),AT(1396,31),USE(?String81:4),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s16),AT(6521,83),USE(gloTotalERange),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Elevado'),AT(1740,52,677,219),USE(?Elevated),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('IgE Total'),AT(2813,63,2635,208),USE(?RES:Description:2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5719,83),USE(gloTotalEScore,,?gloTotalScore:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                       END
TNormal                DETAIL,AT(10,,8302,240)
                         BOX,AT(5563,42,896,219),USE(?Box6:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2792,42,2698,219),USE(?Box4:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,31,948,219),USE(?LevelBox:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6573,52,1052,229),USE(?Box18:3),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('Normal'),AT(1750,52,677,219),USE(?Normal:2),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('IgE Total'),AT(2833,63,2646,208),USE(?RES:Description:5),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5729,63),USE(gloTotalEScore),FONT(,10,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING(@s16),AT(6521,94),USE(gloTotalERange,,?gloTotalRange:3),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
TEquivocal             DETAIL,AT(10,,8302,240)
                         BOX,AT(5563,42,896,219),USE(?Box6:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s16),AT(6521,52),USE(gloTotalERange,,?gloTotalRange:2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(2792,42,2698,219),USE(?Box4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(1625,42,948,219),USE(?LevelBox),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(6573,31,1052,229),USE(?Box18:4),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('Equ�voco'),AT(1760,63,677,219),USE(?Equivocal:2),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('IgE Total'),AT(2833,63,2625,208),USE(?RES:Description:6),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5719,63),USE(gloTotalEScore,,?gloTotalConc:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>'),AT(1500,42),USE(?String81),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                       END
SumHead                DETAIL,AT(10,10,8302,385),PAGEBEFORE(-1)
                         STRING('Resumen De Los Resultados Positivos'),AT(760,10,6594,354),USE(?locHeading),FONT(,16, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
SumSubHead             DETAIL,AT(10,10,8302,240)
                         BOX,AT(5615,42,479,219),USE(?Box5:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,42,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6177,42,740,229),USE(?Box18:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Alergenos Elevados'),AT(3469,63),USE(?RES:Description:11),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Clase'),AT(5667,63),USE(?RES:Score),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('Anticuerpo'),AT(6188,63,927,208),USE(?RES:Type),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                       END
SElevated              DETAIL,AT(10,10,8302,240)
                         BOX,AT(5615,42,479,219),USE(?Box5),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(2792,42,2698,219),USE(?Box4:4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6177,42,750,229),USE(?Box18:7),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s4),AT(6365,83),USE(RES:Type,,?RES:Type:2),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING(@s40),AT(2813,63),USE(RES:Description,,?RES:Description:13),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s3),AT(5688,63),USE(RES:Score,,?RES:Score:5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
SEquivocal             DETAIL,AT(10,10,8302,240)
                         BOX,AT(5615,42,479,219),USE(?Box5:5),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(2792,42,2698,219),USE(?Box4:4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6177,42,750,229),USE(?Box18:5),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s4),AT(6375,83),USE(RES:Type,,?RES:Type:5),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING(@s40),AT(2813,63),USE(RES:Description,,?RES:Description:14),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s3),AT(5688,63),USE(RES:Score,,?RES:Score:7),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
SubHeading             DETAIL,AT(10,10,8302,229),TOGETHER
                         BOX,AT(6167,10,896,219),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,10,2698,219),USE(?Box14),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(5615,10,479,219),USE(?Box15),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Clase'),AT(5667,33),USE(?String71),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Conc'),AT(6167,31,896,208),USE(?String72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(3438,21,1438,208),USE(locPollen),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
EInterp                DETAIL,AT(10,10,8302,2219)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,302,896,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2813,281,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(427,10,2063,250),USE(?Box3:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6167,531,896,219),USE(?BoxEinterpConc1:2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,542,479,219),USE(?BoxEinterpClass1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,542,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,742,2698,219),USE(?BoxEinterpDesc2:3),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(5615,742,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,731,896,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,942,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,931,896,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,961,2698,1208),USE(?BoxEinterpDesc4:3),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(5615,1142,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1131,896,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1342,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1331,896,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1542,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1531,896,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1742,479,219),USE(?BoxEinterpClass7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1731,896,219),USE(?BoxEinterpConc7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1942,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1931,896,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('6'),AT(5688,1952,313,208),USE(?StringEinterpClass8),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1958,906,208),USE(NOR:E6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equ�voco'),AT(2990,771,2365,208),USE(?StringEinterp2:3),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('0/1'),AT(5688,752,313,208),USE(?StringEinterpClass2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,760,906,208),USE(NOR:EE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,952,313,208),USE(?StringEinterpClass3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,958,906,208),USE(NOR:E1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Niveles Elevados De Anticuerpos 1-6'),AT(2854,1354,2667,208),USE(?StringEinterp4:2), |
  FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1152,313,208),USE(?StringEinterpClass4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1167,906,208),USE(NOR:E2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5688,1352,313,208),USE(?StringEinterpClass5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1365,906,208),USE(NOR:E3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5688,1552,313,208),USE(?StringEinterpClass6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1563,906,208),USE(NOR:E4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5688,1752,313,208),USE(?StringEinterpClass7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1760,906,208),USE(NOR:E5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Ning�n Anticuerpo Detectado'),AT(2990,563,2365,208),USE(?StringEinterp1),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s20),AT(6146,563,906,208),USE(NOR:E0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,208),USE(?StringEinterpClass1),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Resultados IgE Espec�ficos'),AT(438,31,2063,208),USE(?locHeading:5),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretaci�n'),AT(3031,302,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Clase'),AT(5677,313),USE(?RES:Score:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (kU/L)'),AT(6219,313,875,208),USE(?String72:6),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),TRN
                       END
G4Interp               DETAIL,AT(10,10,8302,2219)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,302,896,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2813,281,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(427,10,2063,250),USE(?Box3:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6167,531,896,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,542,479,219),USE(?BoxEinterpClass1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,542,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,742,2698,219),USE(?BoxEinterpDesc2:2),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(5615,742,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,731,896,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,942,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,931,896,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,961,2698,1208),USE(?BoxEinterpDesc4:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(5615,1142,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1131,896,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1342,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1331,896,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1542,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1531,896,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1742,479,219),USE(?BoxEinterpClass7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1731,896,219),USE(?BoxEinterpConc7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1942,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1931,896,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('6'),AT(5688,1952,313,208),USE(?StringEinterpClass8),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1958,906,208),USE(NOR:G46),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equ�voco'),AT(2990,771,2365,208),USE(?StringEinterp2:2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('0/1'),AT(5688,752,313,208),USE(?StringEinterpClass2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,760,906,208),USE(NOR:G4E),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,952,313,208),USE(?StringEinterpClass3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,958,906,208),USE(NOR:G41),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Niveles Elevados De Anticuerpos 1-6'),AT(2854,1354,2667,208),USE(?StringEinterp4:2), |
  FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1152,313,208),USE(?StringEinterpClass4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1167,906,208),USE(NOR:G42),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5688,1352,313,208),USE(?StringEinterpClass5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1365,906,208),USE(NOR:G43),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5688,1552,313,208),USE(?StringEinterpClass6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1563,906,208),USE(NOR:G44),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5688,1752,313,208),USE(?StringEinterpClass7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1760,906,208),USE(NOR:G45),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Ning�n Anticuerpo Detectado'),AT(2990,563,2365,208),USE(?StringEinterp1),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s20),AT(6146,563,906,208),USE(NOR:G40),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,208),USE(?StringEinterpClass1),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Resultados IgG4 Espec�ficos'),AT(438,31,2063,208),USE(?locHeading:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretaci�n'),AT(3031,302,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Clase'),AT(5677,313),USE(?RES:Score:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(6156,333,875,208),USE(?String72:7),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
GInterp                DETAIL,AT(10,10,8302,2219)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,302,896,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2813,281,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(427,10,2063,250),USE(?Box3:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6167,531,896,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,542,479,219),USE(?BoxEinterpClass1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,542,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,742,2698,219),USE(?BoxEinterpDesc2:2),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(5615,742,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,731,896,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,942,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,931,896,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2823,961,2698,1208),USE(?BoxEinterpDesc4:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(5615,1142,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1131,896,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1342,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1331,896,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1542,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1531,896,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1742,479,219),USE(?BoxEinterpClass7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1731,896,219),USE(?BoxEinterpConc7),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5615,1942,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,1931,896,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('6'),AT(5688,1952,313,208),USE(?StringEinterpClass8),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1958,906,208),USE(NOR:G6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equ�voco'),AT(2990,771,2365,208),USE(?StringEinterp2:2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('0/1'),AT(5688,752,313,208),USE(?StringEinterpClass2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,760,906,208),USE(NOR:GE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,952,313,208),USE(?StringEinterpClass3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,958,906,208),USE(NOR:G1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Niveles Elevados De Anticuerpos 1-6'),AT(2854,1354,2667,208),USE(?StringEinterp4:2), |
  FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1152,313,208),USE(?StringEinterpClass4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1167,906,208),USE(NOR:G2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5688,1352,313,208),USE(?StringEinterpClass5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1365,906,208),USE(NOR:G3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5688,1552,313,208),USE(?StringEinterpClass6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1563,906,208),USE(NOR:G4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5688,1752,313,208),USE(?StringEinterpClass7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6146,1760,906,208),USE(NOR:G5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Ning�n Anticuerpo Detectado'),AT(2990,563,2365,208),USE(?StringEinterp1),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s20),AT(6146,563,906,208),USE(NOR:G0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,208),USE(?StringEinterpClass1),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Resultados IgG Espec�ficos'),AT(438,31,2063,208),USE(?locHeading:10),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretaci�n'),AT(3031,302,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Clase'),AT(5677,313),USE(?RES:Score:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(6156,333,875,208),USE(?String72:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
TInterp                DETAIL,AT(-313,10,8302,2219)
                         BOX,AT(5583,302,1000,219),USE(?Box5:7),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6635,302,1000,219),USE(?Box16:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2813,302,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(740,10,2063,250),USE(?Box3:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2823,521,2698,219),USE(?BoxAge1),COLOR(COLOR:Black)
                         BOX,AT(2823,742,2698,219),USE(?BoxAge2),COLOR(COLOR:Black)
                         BOX,AT(2823,942,2698,219),USE(?BoxAge3),COLOR(COLOR:Black)
                         BOX,AT(2823,1142,2698,219),USE(?BoxAge4),COLOR(COLOR:Black)
                         BOX,AT(2823,1342,2698,219),USE(?BoxAge5),COLOR(COLOR:Black)
                         BOX,AT(6635,521,1000,219),USE(?BoxThigh1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5594,521,1000,219),USE(?BoxMedian1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6635,721,1000,219),USE(?BoxThigh12),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5594,721,1000,219),USE(?BoxMedian2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6635,921,1000,219),USE(?BoxThigh3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5594,921,1000,219),USE(?BoxMedian3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6635,1121,1000,219),USE(?BoxThigh4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5594,1121,1000,219),USE(?BoxMedian4),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6635,1321,1000,219),USE(?BoxThigh5),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(5594,1321,1000,219),USE(?BoxMedian5),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING('0-1'),AT(2990,563,2365,208),USE(?SrtingAge1),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('1-2'),AT(2990,763,2365,208),USE(?StringAge2),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('2-3'),AT(2990,963,2365,208),USE(?StringAge3),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('3-9'),AT(2990,1163,2365,208),USE(?StringAge4),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Adulto'),AT(2990,1363,2365,208),USE(?StringAge5),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('10.1'),AT(5917,719,313,208),USE(?StringEinterpClass2:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('49'),AT(6771,781,771,208),USE(?StringEinterpConc2:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('12.9'),AT(5917,948,313,208),USE(?StringEinterpClass3:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('45'),AT(6771,979,771,208),USE(?StringEinterpConc3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('14.4'),AT(5917,1135,313,208),USE(?StringEinterpClass4:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('52'),AT(6771,1188,771,208),USE(?StringEinterpConc4:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('20.4'),AT(5917,1354,313,208),USE(?StringEinterpClass5:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('87'),AT(6771,1365,771,208),USE(?StringEinterpConc5:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('29'),AT(6771,552,771,208),USE(?StringEinterpConc1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('6.6'),AT(5917,521,313,208),USE(?StringEinterpClass1:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Resultado IgE Total'),AT(927,31,1719,240),USE(?locHeading:7),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Edad (A�os)'),AT(3031,354,2240,208),USE(?RES:Description:10),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Mediana (IU/ml)'),AT(5615,354),USE(?RES:Score:9),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('95% (IU/ml)'),AT(6792,354,720,208),USE(?String72:4),FONT(,9,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
GInterpx               DETAIL,AT(10,10,8302,1229)
                         BOX,AT(6156,302,896,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2813,281,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(490,10,2146,250),USE(?Box3:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6167,531,896,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2813,542,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2813,740,2698,219),USE(?BoxEinterpDesc2),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(6167,731,896,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(6167,931,896,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),FILL(COLOR:White)
                         BOX,AT(2813,948,2698,219),USE(?BoxEinterpDesc4),COLOR(COLOR:Black),FILL(0080FFFFh)
                         STRING('Equ�voco'),AT(2990,771,2365,208),USE(?StringEinterp2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('2.0-5.4'),AT(6229,763,771,208),USE(?StringEinterpConc2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('5.5+'),AT(6229,963,771,208),USE(?StringEinterpConc3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Niveles Elevados De Anticuerpos'),AT(3042,969,2365,208),USE(?StringEinterp4),FONT(, |
  10,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Normal'),AT(2990,563,2365,208),USE(?StringEinterp1:2),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('<<2.0'),AT(6229,563,771,208),USE(?StringEinterpConc1),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Resultados IgG4 Espec�ficos'),AT(490,52,2135,208),USE(?locHeading:6),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretaci�n'),AT(2969,302,2281,208),USE(?RES:Description:8),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Conc (kU/L)'),AT(6208,302,875,208),USE(?String72:5),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),TRN
                       END
STotal                 DETAIL,AT(10,,8302,740)
                         BOX,AT(740,10,1896,250),USE(?Box3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Inmunoglobulina'),AT(1104,73,1125,156),USE(?locHeading:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(2792,271,2698,219),USE(?Box14),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('IgE Total'),AT(3438,292,1438,208),USE(?String44:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(2802,500,2698,219),USE(?Box14:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         STRING('Elevado'),AT(3469,531,1438,208),USE(?String44:4),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
PatientInfo            DETAIL,AT(10,10,8302,1531),PAGEBEFORE(-1)
                         STRING('Resumen De Los Resultados Positivos'),AT(760,21,6594,344),USE(?locHeading:4),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         TEXT,AT(1063,448,6771,1125),USE(locPatientText),BOXED
                       END
PatSubHead             DETAIL,AT(10,10,8302,240)
                         BOX,AT(2792,42,2698,219),USE(?Box4:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Alergenos Elevados'),AT(3469,63),USE(?RES:Description:7),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
PElevated              DETAIL,AT(10,10,8302,240)
                         BOX,AT(2792,42,2698,219),USE(?Box4:4),COLOR(COLOR:Black),FILL(COLOR:White)
                         STRING(@s40),AT(2813,63),USE(RES:Description,,?RES:Description:3),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(52,10,1521,125),USE(?String40),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Director del Laboratorio M�dico'),AT(52,125,1656,188),USE(?String40:2),FONT('Arial', |
  8,,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          CLASS(StepLongClass)                  ! Progress Manager
Init                   PROCEDURE(BYTE Controls)
                     END

FIRSTHEADER byte     !For sendout header/footer
OLDDETAIL  byte

MRL4_1  STRING(8)
MRL4_2  STRING(8)
MRL4_3  STRING(8)
MRL4_4  STRING(8)

Ptext   STRING(1024)
QCC_HEAD STRING(5)

Header   QUEUE,PRE(HD)    !save header fields for fax 7/19/00 NC
PatName    STRING(40)
Invoice    LONG
Client     LONG
BilledDate LONG
Age        BYTE
Age_Type   STRING(1)
Sex        STRING(1)
Client_ID  STRING(15)
Collection STRING(10)
PatDate    LONG
Date       LONG
Time       LONG
Note1      STRING(60)
Note2      STRING(60)
      .

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
  GlobalErrors.SetProcedureName('SpanishPDF')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SpanishPDF',ProgressWindow)                ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE,gloPatient)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  SET(Normals,1)
  NEXT(Normals)
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:Normals.Close
    Relate:Patient.Close
  END
  IF SELF.Opened
    INIMgr.Update('SpanishPDF',ProgressWindow)             ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
    SORT(Results,RES:Sort,RES:Category,RES:Description)

    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .
    TRange[1,1] = 6.6
    TRange[1,2] = 29
  
    TRange[2,1] = 10.1
    TRange[2,2] = 49
  
    TRange[3,1] = 12.9
    TRange[3,2] = 45
  
    TRange[4,1] = 14.4
    TRange[4,2] = 52
  
    TRange[5,1] = 20.4
    TRange[5,2] = 87
  
    IF Pat:AGE_TYPE = 'M'
      locAge = 1
    ELSIF Pat:AGE < 3
      locAge = 2
    ELSIF Pat:AGE < 4
      locAge = 3
    ELSIF Pat:AGE < 10
      locAge = 4
    ELSE
      locAge = 5
    .
    gloTotalERange = '<=' &  TRange[locAge,2]
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'No Proveido'
    .
    locAccount = CLI:Number
    locSummary = 0




    IF gloTotal
      IF ~INRANGE(gloTotalEConc,0,TRange[locAge,2])
        gloTotalSummary = 1
    . .
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        CASE RES:Status
        OF 'A'
        OROF 'Q'
        OROF 'B'
        OROF 'D'
          CYCLE
        .
        IF RES:Score = '0' THEN CYCLE.
        locSummary = 1
      .





    IF locSummary
      gloReportTitle = 'Resumen'

      PRINT(RPT:SumHead)
      IF gloTotalSummary
        PRINT(RPT:STotal)
        gloTotalSummary = FALSE
      .
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'P�lenes'
          OF 2
            locHeading = 'Alergenos Del Ambiente'
            locPollen = 'Alergenos Elevados'
          OF 3
            locHeading = 'Alimentos'
            locPollen = 'Alergenos Elevados'
          OF 4
            locHeading = 'Otros Alergenos'
            locPollen = 'Alergenos Elevados'
          .
          PRINT(RPT:Heading)
          PRINT(RPT:SumSubHead)
          SAV:Sort = RES:Sort
        .
        IF INRANGE(RES:Score,'1','6')
          PRINT(RPT:SElevated)
        ELSE
          PRINT(RPT:SEquivocal)
        .
      .
      PRINT(RPT:PageBreak)
    .

    gloReportTitle = 'Interpretaci�n'
    IF gloE THEN PRINT(RPT:EInterp).
    IF gloG THEN PRINT(RPT:GInterp).
    IF gloG4 THEN PRINT(RPT:G4Interp).
    IF gloTotal THEN PRINT(RPT:TInterp).
!    PRINT(RPT:ASR)
    PRINT(RPT:PageBreak)




! ___________________________________________________________________

    gloReportTitle = 'Resultados'
    IF gloTotal
      PRINT(RPT:Total)
      IF INRANGE(gloTotalEConc,0,TRange[locAge,2])
        IF gloTotalEConc < .2
          gloTotalEScore = '<0.20'
        ELSE
          gloTotalEScore = FORMAT(gloTotalEConc,@n7.2)
        .
        PRINT(RPT:TNormal)
      ELSE
        gloTotalEScore = FORMAT(gloTotalEConc,@n7.2)
        PRINT(RPT:TElevated)
      .
      gloTotal = 0
    .




      SAV:Sort = 9      ! Initalize to unused value
      SAV:Code = 'x'    ! Initalize to unused value
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        CASE RES:Status
        OF 'A'
        OROF 'Q'
        OROF 'B'
        OROF 'D'
          CYCLE
        .
        CASE RES:Sort
        OF 1
          IF RES:Summary
            gloPollen = 1
          .
        OF 2
          IF RES:Summary
            IF RES:Category = 'M'
              gloMold = 1
            ELSE
              gloDust = 1
            .
          .
        OF 3
          IF RES:Summary
            gloFood = 1
          .
        OF 4
          locHeading = 'Otros Alergenos'
          locPollen = 'Alergenos'
        .
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'P�lenes'
          OF 2
            locHeading = 'Alergenos Del Ambiente'
            locPollen = 'Alergenos'
          OF 3
            locHeading = 'Alimentos'
            locPollen = 'Alergenos'
          OF 4
            locHeading = 'Otros Alergenos'
            locPollen = 'Alergenos'
          .
          PRINT(RPT:Heading)
          IF RES:Sort > 1   ! polens handeled below
            PRINT(RPT:SubHeading)
          .
  
          SAV:Sort = RES:Sort
        .
        IF RES:Sort = 1 AND RES:Category <> SAV:Code   ! Pollen Categories G,T,W get subHeader
          CASE RES:Category
          OF 'G'
            locPollen = 'Hierbas'
          OF 'T'
            locPollen = 'Arboles'
          OF 'W'
            locPollen = 'Malas Hierbas'
          .
          PRINT(RPT:SubHeading)
          SAV:Code = RES:Category
        .
        CASE RES:Score
        OF '0'
          PRINT(RPT:Normal)
        OF '0/1'
          PRINT(RPT:Equivocal)
          locSummary = 1
        ELSE
          PRINT(RPT:Elevated)
          locSummary = 1
        .
      .

    IF locSummary
      PRINT(RPT:PageBreak)
      Report{PROP:NextPageNo} = 1
      locPatientText = 'Los resultados del laboratorio necesitan ser correlacionados a su historia clinica y s�ntomas cl�nicos antes de cualquier diagnosis.  Una prueba positive puede o no puede indicar una condici�n al�rgica y solamente su medico puede hacer esa determinaci�n.  La informaci�n de la evitaci�n presentada en este informe no constituye consejo medico y es para su informaci�n de character general solamente.  Consulte con el doctor si usted tiene algunas preocupaciones o preguntas especificas con respecto a la informaci�n.'
      gloReportTitle = 'Resumen Del Paciente'
      PRINT(RPT:PatientInfo)
      SAV:Code = 'x'
      SAV:Sort = 9

      gloReportTitle = 'Informaci�n Del Patiente'

      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        IF RES:Code = SAV:Code
          CYCLE
        .
        SAV:Code = RES:Code
        IF SAV:Sort <> RES:Sort
          locPollen = 'Error Sort=' & RES:Sort
          CASE RES:Sort
          OF 1
            locHeading = 'P�lenes'
          OF 2
            locHeading = 'Alergenos Del Ambiente'
            locPollen = 'Alergenos Elevados'
          OF 3
            locHeading = 'Alimentos'
            locPollen = 'Alergenos Elevados'
          OF 4
            locHeading = 'Otros Alergenos'
            locPollen = 'Alergenos Elevados'
          .
          PRINT(RPT:Heading)
          PRINT(RPT:PatSubHead)
          SAV:Sort = RES:Sort
        .
        PRINT(RPT:PElevated)
    . .








    gloReportTitle = 'Informaci�n Del Patiente'
    IF gloPollen
      DOC:Number = DOC:Pollen + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
    .
    IF gloDust
      DOC:Number = DOC:Dust + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
      DOC:Number = DOC:Dust + DOC:Page2 + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
    .
    IF gloMold
      DOC:Number = DOC:Mold + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
      DOC:Number = DOC:Mold  + DOC:Page2 + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
    .
    IF gloFood
      DOC:Number = DOC:Food + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
      DOC:Number = DOC:Food + DOC:Page2 + DOC:Spanish
      GET(Docs,DOC:OrderKey)
      PRINT(RPT:Text)
    .
                              
    OMIT('***')


  

  PRINT(RPT:Elevated)
  PRINT(RPT:Normal)
  PRINT(RPT:Equivocal)
  PRINT(RPT:Heading)
  PRINT(RPT:PageBreak)
  PRINT(RPT:Text)
  PRINT(RPT:Total)
  PRINT(RPT:TElevated)
  PRINT(RPT:TNormal)
  PRINT(RPT:TEquivocal)
  PRINT(RPT:SumHead)
  PRINT(RPT:SumSubHead)
  PRINT(RPT:SElevated)
  PRINT(RPT:SEquivocal)
  PRINT(RPT:SubHeading)
  PRINT(RPT:EInterp)
  PRINT(RPT:G4Interp)
  PRINT(RPT:GInterp)
  PRINT(RPT:TInterp)
  PRINT(RPT:GInterpx)
  PRINT(RPT:STotal)
  PRINT(RPT:PatientInfo)
  PRINT(RPT:PatSubHead)
  PRINT(RPT:PElevated)
  ***
  RETURN ReturnValue


ProgressMgr.Init PROCEDURE(BYTE Controls)

  CODE
  !START
  PARENT.Init(Controls)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
SignatureRequest PROCEDURE (prmReportTitle,prmAttributes)

ATTR:NumberMask  EQUATE(1111111110000000b)
ATTR:DocNumber   EQUATE(0000000001111111b)
ATTR:IncludeTest EQUATE(0000000100000000b)        
!                       1234123412341234

TYPEQ:Panel               EQUATE(1)
TYPEQ:IgE                 EQUATE(2)
TYPEQ:IgG                 EQUATE(3)
TYPEQ:IgG4                EQUATE(4)
TYPEQ:TIgE                EQUATE(2)
TYPEQ:TIgG                EQUATE(5)
TYPEQ:TIgA                EQUATE(6)
TYPEQ:TIgM                EQUATE(7)

Q    QUEUE,PRE(Q)
Code   LIKE(TST:CODE)
Type   BYTE,DIM(10)
     .
Progress:Thermometer BYTE                                  !
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Patient Report'),AT(0,0,8500,10500),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,COLOR:Black, |
  FONT:regular),THOUS
English                DETAIL,AT(63,208,8302,3646)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(prmReportTitle,,?English),FONT(,16,,FONT:bold),CENTER, |
  TRN
                         LINE,AT(7917,3302,0,-2156),USE(?Line20:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('IgE {10}IgG4        IgG {14}ID {21}Description'),AT(1469,3438),USE(?TypeHeaderString), |
  FONT(,,,FONT:bold),TRN
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2,,?gloAddress2:2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3,,?gloRPTNOTICE3:2),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3,,?gloAddress3:2),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-365),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3302,0,-2156),USE(?Line6:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7600,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7530,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName,,?gloPatName:2)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB,,?Pat:DOB:2),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:3),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT,,?Pat:CLIENT:3)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection,,?gloPATCollection:2)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE,,?Pat:AGE_TYPE:2)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate,,?gloDate:2),RIGHT(1)
                         TEXT,AT(125,2906,7792,427),USE(DOC:Body,,?English:3),FONT(,,COLOR:Red,,CHARSET:ANSI),RTF(TEXT:Field), |
  BOXED,TRN
                         STRING('Account#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName,,?gloClientName:2),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1,,?gloRPTNOTICE1:2),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1,,?gloAddress1:2),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber,,?English:2),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE,,?Pat:DATE:2),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT,,?Pat:CLIENT:2),RIGHT,TRN
                         LINE,AT(104,3300,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime,,?gloTime:2),RIGHT(1)
                       END
Discrete               DETAIL,AT(10,10,8302,208)
                         BOX,AT(4646,0,2698,200),USE(?Box4:7),COLOR(COLOR:Black)
                         BOX,AT(3667,0,677,198),USE(?Box4:8),COLOR(COLOR:Black)
                         STRING(@s40),AT(4719,10,2500,208),USE(RST:DESCRIPTION),FONT(,,,FONT:bold),LEFT,TRN
                         STRING(@s6),AT(3740,10),USE(Q:Code),LEFT,TRN
                         BOX,AT(1635,0,400,200),USE(?IgEBox),COLOR(COLOR:Black),FILL(008080FFh),HIDE
                         BOX,AT(2260,0,400,200),USE(?IgG4Box),COLOR(COLOR:Black),FILL(0080FF80h),HIDE
                         BOX,AT(2875,0,400,200),USE(?IgGBox),COLOR(COLOR:Black),FILL(0080FFFFh),HIDE
                         STRING('IgE'),AT(1708,10),USE(?IgEString),FONT(,,,FONT:bold),HIDE,TRN
                         STRING('IgG4'),AT(2300,10),USE(?IgG4String),FONT(,,,FONT:bold),HIDE,TRN
                         STRING('IgG'),AT(2940,10),USE(?IgGString),FONT(,,,FONT:bold),HIDE,TRN
                       END
Panel                  DETAIL,AT(10,10,8302,208)
                         BOX,AT(4646,0,2698,200),USE(?Box4:3),COLOR(COLOR:Black)
                         BOX,AT(3667,10,677,198),USE(?Box4:11),COLOR(COLOR:Black)
                         STRING(@s40),AT(4719,10,2500,208),USE(RST:DESCRIPTION,,?RST:Description:Panel),FONT(,,,FONT:bold), |
  LEFT,TRN
                         STRING(@s6),AT(3740,10),USE(Q:Code,,?Q:Code:Panel),LEFT,TRN
                       END
Signature              DETAIL,AT(10,10,8302,500)
                         STRING('Date:  _{21}'),AT(4823,281),USE(?String87),TRN
                         STRING('Signature:  _{52}'),AT(260,281),USE(?String86),TRN
                       END
Spanish                DETAIL,AT(10,240,8500,3448)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1:2)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?String41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?String42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?String43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Tel�fono: 615-599-4100'),AT(6271,719,1458,156),USE(?String44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?String45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s24),AT(5125,1188,2792,292),USE(prmReportTitle,,?Spanish),FONT(,16,,FONT:bold),CENTER(4), |
  TRN
                         LINE,AT(7917,3229,0,-2083),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3500,1906),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5125,1813,2792,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5115,1135,0,1729),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-365),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2083),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7600,2306,167,167),USE(Pat:SEX,,?Pat:SEX:2)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Numero Del Cliente'),AT(229,2521),USE(?String34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha De Colecci�n'),AT(2313,2521),USE(?String35),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Fecha Recibido'),AT(4031,2521),USE(?String36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha   '),AT(5438,2521,1156,188),USE(?String37),FONT('Arial',8,,FONT:underline),CENTER, |
  TRN
                         STRING('Tiempo '),AT(6938,2521,927,188),USE(?String38),FONT('Arial',8,,FONT:underline),CENTER, |
  TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Nombre Del Paciente (Apellido, Nombre)'),AT(167,2167,2052,188),USE(?String29),FONT('Arial', |
  8,,FONT:underline),TRN
                         STRING('Sexo'),AT(7500,2167),USE(?String33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Fecha De Naciemento'),AT(5406,2156,1146,188),USE(?String30:2),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         STRING(''),AT(5469,2135),USE(?String133),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Edad'),AT(6927,2167),USE(?String32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('# De Identificaci�n'),AT(3833,2146,1146,188),USE(?String30),FONT('Arial',8,,FONT:underline), |
  CENTER,TRN
                         STRING(@s40),AT(208,2323,3333,146),USE(gloPatName)
                         STRING(@d2b),AT(5615,2323,729,156),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S16),AT(2313,2677,1063,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,146),USE(Pat:AGE,,?Pat:AGE:2)
                         STRING(@s1),AT(7177,2302,156,156),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Nota:'),AT(365,2896),USE(?String39),FONT('Arial',8,,FONT:underline),TRN
                         TEXT,AT(1021,2896,6771,375),USE(DOC:Body),BOXED
                         STRING('# De Cuenta'),AT(5938,1906),USE(?String93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3500,1510,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5115,1510,2802,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3500,1708,1521,208),USE(gloRPTNOTICE2,,?gloRPTNOTICE2:2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(6875,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('SignatureRequest')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SignatureRequest',ProgressWindow)          ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  SHARE(Test)
  gloReportFileName = '..\Results\' & Pat:CLIENT & '\' & CLIP(prmReportTitle) & FORMAT(TODAY(),@D11)
  IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
  .
  gloDate = TODAY()
  gloTime = CLOCK()
  DOC:Number = BAND(prmAttributes,0F00FH) + DOC:SignatureRequest
  GET(Docs,DOC:OrderKey)
  IF ERRORCODE() THEN  STOP('Sig Req. Doc: ' & ERROR()).
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:Rast.Close
  END
  IF SELF.Opened
    INIMgr.Update('SignatureRequest',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
    IF gloPatient <> PAT:INVOICE THEN RETURN(0).
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .
  IF prmAttributes % 1
   PRINT(RPT:Spanish)
  ELSE
   PRINT(RPT:English)
  .
  CLEAR(TST:RECORD)
  IF BAND(prmAttributes,ATTR:IncludeTest)
    TST:INVOICE = PAT:Invoice
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP
      NEXT(Test)
      IF TST:INVOICE <> PAT:Invoice OR ERRORCODE()  THEN  BREAK.
      Q:CODE = TST:CODE
      GET(Q,Q:Code)
      IF ERRORCODE()
        CLEAR(Q:Type[])
        Q:Type[TST:Type+1] = 1
        ADD(Q,Q:Code)
  !      stop('ADD 1: ' & Q:Type[1] & ' 2:' & Q:Type[2] & ' 3:' & Q:Type[3] & ' 4:' & Q:Type[4] & ' 5:' & Q:Type[5])
      ELSE
        Q:Type[TST:Type+1] = 1
        PUT(Q)
 !       stop('PUT 1: ' & Q:Type[1] & ' 2:' & Q:Type[2] & ' 3:' & Q:Type[3] & ' 4:' & Q:Type[4] & ' 5:' & Q:Type[5])
      .
    .
!    STOP(RECORDS(Q))
    SORT(Q,Q:Code)
  
  OMIT('XXXX')
  
  PRINT(RPT:English)
  PRINT(RPT:Discrete)
  PRINT(RPT:Panel)
  PRINT(RPT:Signature)
  PRINT(RPT:Spanish)
  XXXX
  SETTARGET(REPORT)
    LOOP Q# = 1 TO RECORDS(Q)
      GET(Q,Q#)
      HIDE(?IgEBox,?IgGString)
  !       stop('GET 1: ' & Q:Type[1] & ' 2:' & Q:Type[2] & ' 3:' & Q:Type[3] & ' 4:' & Q:Type[4] & ' 5:' & Q:Type[5])
      RST:NUMBER = Q:Code
      GET(Rast,RST:ORDER_KEY)
      IF Q:Type[TYPEQ:Panel]
        PRINT(RPT:Panel)
      ELSE
        IF Q:Type[TYPEQ:IgE]
          UNHIDE(?IgEBox)
          UNHIDE(?IgEString)
        ELSE
          HIDE(?IgEBox)
          HIDE(?IgEString)
        .
        IF Q:Type[TYPEQ:IgG]
          UNHIDE(?IgGBox)
          UNHIDE(?IgGString)
        ELSE
          HIDE(?IgGBox)
          HIDE(?IgGString)
        .
        IF Q:Type[TYPEQ:IgG4]
          UNHIDE(?IgG4Box)
          UNHIDE(?IgG4String)
        ELSE
          HIDE(?IgG4Box)
          HIDE(?IgG4String)
        .
        PRINT(RPT:Discrete)
    . .
  ELSE
  !   STOP('TEST NOT INCLUDED')
  .
  IF BAND(prmAttributes,DOC:SignatureRequest) THEN  PRINT(RPT:Signature).
  CLOSE(Test)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Client File
!!! </summary>
SuppliesNotice PROCEDURE (prmReportTitle)

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Client)
                       PROJECT(CLI:NUMBER)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Client'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Client Report'),AT(0,850,8500,9646),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,COLOR:Black, |
  FONT:regular),THOUS
English                DETAIL,AT(73,198,8302,3646)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(prmReportTitle,,?English),FONT(,16,,FONT:bold),CENTER, |
  TRN
                         LINE,AT(7917,3302,0,-2156),USE(?Line20:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2,,?gloAddress2:2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3,,?gloRPTNOTICE3:2),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3,,?gloAddress3:2),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3302,0,-2156),USE(?Line6:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@D2),AT(3854,656,740,146),USE(gloDate,,?gloDate:2),RIGHT(1)
                         TEXT,AT(125,2229,7792,1104),USE(DOC:Body),FONT(,,COLOR:Red,,CHARSET:ANSI),RTF(TEXT:Field), |
  BOXED,TRN
                         STRING('Account#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName,,?gloClientName:2),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1,,?gloRPTNOTICE1:2),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1,,?gloAddress1:2),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber,,?English:2),TRN
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT,,?Pat:CLIENT:2),RIGHT,TRN
                         LINE,AT(104,3300,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('SuppliesNotice')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SuppliesNotice',ProgressWindow)            ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Client, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CLI:NUMBER)
  ThisReport.AddSortOrder(CLI:ORDER_KEY)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Client.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
  END
  IF SELF.Opened
    INIMgr.Update('SuppliesNotice',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:English)
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
SetPatientStatus PROCEDURE (prmPatient)

locExceptionStatus   BYTE                                  !
locTestCount         USHORT                                !
locDetectedTIgE      BYTE                                  !
locDetectedGAM       BYTE                                  !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(locExceptionStatus)

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
CheckAge  ROUTINE
  IF  ~PAT:Age OR ~PAT:Age_Type
    locExceptionStatus = BOR(locExceptionStatus,EX:Age)
  ELSE
    IF PAT:Age_Type = 'M'
      IF ~INRANGE(PAT:Age,1,11)
        locExceptionStatus = BOR(locExceptionStatus,EX:Age)
  . . .


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  if PAT:CLIENT = 666666 THEN RETURN('X').
  GlobalErrors.SetProcedureName('SetPatientStatus')
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
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
      locExceptionStatus = 0
        locDetectedTIgE = FALSE
        locDetectedGAM = FALSE
        gloTE = 0
         IF PAT:Invoice <> prmPatient
           PAT:Invoice = prmPatient
           GET(Patient,PAT:Invoice_Key)
           IF ERRORCODE() THEN STOP('Set Status, GET PAT:' & ERROR())
             POST(EVENT:CloseWindow)
             RETURN(0)
           .
         .
        IF PAT:Status = 'Q'
          IF CheckQns(Pat:INVOICE) THEN locExceptionStatus = BOR(locExceptionStatus,EX:QNS).
        .
        IF PAT:Status = 'H'
          locExceptionStatus = BOR(locExceptionStatus,EX:Held)
        .
        SHARE(Test)
        CLEAR(TST:Record)
        TST:INVOICE = prmPatient
        SET(TST:ORDER_KEY,TST:ORDER_KEY)
        IF ERRORCODE() THEN STOP('SET TST: ' & ERROR()).
        locTestCount = 0
        
        LOOP 
          NEXT(Test)
          IF TST:INVOICE <> prmPatient OR ERRORCODE() THEN BREAK.
          IF TST:Status = 'X' THEN CYCLE.
          IF gloTestCodeStartsWith1 = 'S'
            IF TST:Status = 'C'
              PAT:Status = 'C'
            ELSE
              PAT:Status = 'I'
              locTestCount = 0
              SO:Patient = TST:INVOICE
              GET(Sendouts,SO:OrderKey)
              IF ERRORCODE()
                SO:Date = Pat:DATE
                ADD(SendOuts)
              .
              CYCLE
            .
          .
          locTestCount += 1
          IF SUB(TST:Code,1,3) = '100'
            DO CheckAge
            locDetectedTIgE = TRUE
            IF TST:Status = 'C'
              IF SUB(TST:Code,5,1) > '2'
                gloTE = EQ:FinalFollow
              ELSE
                gloTE = EQ:Tested
              .
            .
          .
          IF ~(UPPER(TST:STATUS) = 'X' OR UPPER(TST:STATUS) = 'B' OR gloTestCodeStartsWith1 = 'S')
            CASE TST:Status
            OF 'L'
            OROF 'R'
              locExceptionStatus = BOR(locExceptionStatus,EX:Login)
            OF 'Q'
              locExceptionStatus = BOR(locExceptionStatus,EX:QNS)
            OF 'W'
              locExceptionStatus = BOR(locExceptionStatus,EX:WorkPool)
            OF 'C'
              locExceptionStatus = BOR(locExceptionStatus,EX:Complete)
            .
        . .
        IF BAND(locExceptionStatus,EX:Held)
          PAT:Status = 'H'
      !     ELSIF BAND(locExceptionStatus,EX:QNS)
      !       PAT:Status = 'Q'
        ELSIF BAND(locExceptionStatus,EX:Login)
          IF PAT:VERIFIED_BY
            PAT:Status = 'V'
          ELSE
            PAT:Status = 'L'
          .
        ELSIF BAND(locExceptionStatus,EX:WorkPool)
          PAT:Status = 'W'
        ELSIF locTestCount = 0
          IF gloTestCodeStartsWith1 = 'S' 
            PAT:Status = 'I'
          ELSE
            PAT:Status = 'I'
          .
        ELSE
          PAT:Status = 'C'
        .
        CLOSE(Test)
        POST(EVENT:CloseWindow)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Client File
!!! </summary>
PanelNotifacation PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Client)
                     END
CF3:View VIEW(Cli_panl).
CF3:Level BYTE,AUTO
ReportPageNumber     LONG,AUTO
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Client'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT,AT(0,2000,8500,7000),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
Header                 DETAIL,AT(240,240,8250,4146)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Panel Notification'),AT(5781,1188,2083,292),USE(?PanelReviw),FONT(,16,,FONT:bold), |
  CENTER,TRN
                         LINE,AT(7917,2146,0,-1000),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,0,1000),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         STRING('As required by by our licensure, we are sending you a listing of your current panels for'), |
  AT(479,2552,7198,260),USE(?String18),FONT(,12,,FONT:bold),TRN
                         STRING(' your review and approval.'),AT(479,2823,6302,260),USE(?String19),FONT(,12,,FONT:bold), |
  TRN
                         STRING('Gary A. Kitos, Ph.D., H.C.L.D., C.C.'),AT(4000,3208),USE(?String20),TRN
                         STRING('Medical Laboratory Director/General Partner'),AT(4000,3427),USE(?String21),TRN
                         STRING('gk@allermetrix.com'),AT(4000,3646),USE(?String22),TRN
                         STRING('877-992-4100'),AT(4000,3865),USE(?String23),TRN
                       END
Panels                 DETAIL,AT(302,10,8125,198),USE(?PanelDetail)
                         STRING(@s9),AT(1344,10),USE(CP:Panel),FONT(,12,,FONT:bold)
                         STRING(@s24),AT(2635,10),USE(CP:Description),FONT(,12,,FONT:bold)
                         STRING('Panel:'),AT(729,10),USE(?String29),FONT(,12,,FONT:bold),TRN
                       END
Tests                  DETAIL,AT(,,,219),USE(?TestDetail)
                       END
                       FOOTER,AT(0,9000,8500,1000)
                         STRING(@pPage ##p),AT(7146,292),USE(ReportPageNumber),FONT(,12,,FONT:bold)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

CF3:ViewManager      ViewManager
ThisReport           CLASS(ProcessClass)                   ! Process Manager
ChildProcessingStart   PROCEDURE(USHORT ChildRead),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

Previewer            PrintPreviewClass                     ! Print Previewer
BreakMgr             BreakManagerClass                     ! Break Manager
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PanelNotifacation')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BreakMgr.Init()
  BreakMgr.AddBreak()
  BreakMgr.AddLevel() !br
  BreakMgr.AddResetField(CP:Panel)
  SELF.AddItem(BreakMgr)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PanelNotifacation',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ThisReport.Init(Process:View, Relate:Client, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Client.SetQuickScan(1,Propagate:OneMany)
  CF3:ViewManager.Init(CF3:View,Relate:Cli_panl)
  CF3:ViewManager.AddSortOrder(CP:ORDER_KEY)
  CF3:ViewManager.AddRange(CP:Panel,Relate:Cli_panl,Relate:Client)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  CF3:Level = ThisReport.AddItem(CF3:ViewManager,1)   !Parent File:Client Child File:Cli_panl
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
  END
  IF SELF.Opened
    INIMgr.Update('PanelNotifacation',ProgressWindow)      ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    Report$?ReportPageNumber{PROP:PageNo} = True
  END
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.ChildProcessingStart PROCEDURE(USHORT ChildRead)

  CODE
  IF ChildRead = CF3:Level
     PRINT(RPT:Panels)
  END
  PARENT.ChildProcessingStart(ChildRead)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF SELF.ChildRead = CF3:Level
    SkipDetails = TRUE
    PRINT(RPT:Tests)
  END
  IF ~SkipDetails
    PRINT(RPT:Header)
  END
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Client File
!!! </summary>
PrintPanelReview PROCEDURE 

Progress:Thermometer BYTE                                  !
locTestType          STRING(12)                            !
locDoNotFilter       BYTE                                  !
lowLimit             LONG(199999)                          !
locHighLimit         LONG(899999)                          !
locKeep              STRING(1)                             !
locChange            STRING(1)                             !
locRows              BYTE                                  !
COLUMN2              QUEUE,PRE(C2)                         !
TestTypes            STRING(16)                            !
Description          STRING(40)                            !
                     END                                   !
Process:View         VIEW(Cli_panl)
                       PROJECT(CP:Client)
                       PROJECT(CP:Description)
                       PROJECT(CP:Panel)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Client'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('PanelsReview'),AT(0,3000,8500,7104),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,, |
  FONT:regular,CHARSET:ANSI),THOUS
                       HEADER,AT(250,0,8250,3000)
                         STRING(@s35),AT(479,1490),USE(gloAddress1)
                         STRING(@s40),AT(479,1281),USE(gloClientName)
                         IMAGE('am.jpg'),AT(100,250,3060,900),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s24),AT(5781,1188,2083,292),USE(gloTitle),FONT(,16,,FONT:bold),CENTER,TRN
                         STRING(@s35),AT(479,1698,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(479,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,0,1000),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s9),AT(6400,1573),USE(CP:Panel,,?CP:PANEL:2)
                         STRING('Panel'),AT(5917,1573),USE(?String42),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@n_6),AT(6833,1885,573,156),USE(CLI:NUMBER),RIGHT,TRN
                         STRING('As required by by our licensure, we are sending you a listing of your current panels for'), |
  AT(563,2292,7198,260),USE(?StringSentance1),FONT(,12,,FONT:bold),TRN
                         STRING(' your review and approval.'),AT(542,2500,6302,260),USE(?String19),FONT(,12,,FONT:bold), |
  TRN
                         STRING('Please sign and fax or mail this page back to Allermetrix (FAX: 615-599-4648, e' & |
  'mail gk@allermetrix.com)'),AT(542,2781),USE(?StringSentance3),TRN
                       END
Detail                 DETAIL,AT(250,,8198,250),USE(?PanelDetail)
                         STRING(@s9),AT(1656,10),USE(CP:Panel),FONT(,12,,FONT:bold)
                         STRING(@s24),AT(3104,10),USE(CP:Description),FONT(,12,,FONT:bold)
                         STRING('Panel:'),AT(417,10),USE(?String29),FONT(,12,,FONT:bold),TRN
                       END
Tests                  DETAIL,AT(250,,7344,135),USE(?TestDetail)
                         STRING(@s16),AT(1656,0),USE(CPT:TestTypes,,?CPT:TestTypes:2),RIGHT
                         STRING(@s40),AT(3104,0),USE(CPT:Description)
                       END
Tests2                 DETAIL,AT(,,8500,135),USE(?TestDetail:2)
                         STRING(@s16),AT(650,0),USE(CPT:TestTypes),RIGHT
                         STRING(@s40),AT(2042,0),USE(CPT:Description,,?CPT:Description:2)
                         STRING(@s16),AT(4000,0),USE(C2:TestTypes),RIGHT
                         STRING(@s40),AT(5385,0),USE(C2:Description)
                       END
PageBreak              DETAIL,AT(271,10,7667,604),USE(?PageBreak),PAGEAFTER(-1)
                         CHECK(' I have reviewed may panels and would like to keep them as they are currently set-up'), |
  AT(400,10),USE(locKeep)
                         CHECK('Please change my test panels as indicated'),AT(396,208),USE(locChange)
                         STRING('X'),AT(3281,354),USE(?StringX),FONT('Arial',18,,FONT:bold,CHARSET:ANSI),TRN
                         LINE,AT(3313,615,4292,0),USE(?LineSignature),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10300,7948,396),USE(?Footer)
                         STRING('Medical Laboratory Director/General Partner'),AT(63,188),USE(?String21),TRN
                         STRING('FAX: 615-599-4648'),AT(2917,188),USE(?String34),TRN
                         STRING('allermetrix.com'),AT(4823,188),USE(?String35),TRN
                         STRING('gk@allermetrix.com'),AT(4823,-10),USE(?String22),TRN
                         STRING('877-992-4100'),AT(2958,-10),USE(?String23),TRN
                         STRING(@pPage <<#p),AT(7260,52,700,135),USE(?locPageNumber),FONT('Arial',8,,FONT:regular), |
  PAGENO
                         STRING('Gary A. Kitos, Ph.D., H.C.L.D., C.C.'),AT(63,-10),USE(?String20),TRN
                       END
                     END
ThisWindow           CLASS(ReportManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
ProcessResultFiles     PROCEDURE(OutputFileQueue OutputFile),BYTE,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            CLASS(PrintPreviewClass)              ! Print Previewer
AskPrintPages          PROCEDURE(),BYTE,PROC,DERIVED
ProcessResultFiles     PROCEDURE(OutputFileQueue OutputFile),BYTE,DERIVED
                     END

BreakMgr             BreakManagerClass                     ! Break Manager
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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
  PARENT.Ask
  !


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PrintPanelReview')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:ClientPanelTests.Open                             ! File ClientPanelTests used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
   CLI:NUMBER = gloClientNumber
   GET(Client,CLI:ORDER_KEY)
  
   IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
  
  BreakMgr.Init()
  BreakMgr.AddBreak()
  BreakMgr.AddLevel() !PageBreakPanel
  SELF.AddItem(BreakMgr)
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintPanelReview',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Cli_panl, ?Progress:PctText, Progress:Thermometer, ProgressMgr, CP:Panel)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(CP:ORDER_KEY)
  ThisReport.AddRange(CP:Client,gloClientNumber)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Cli_panl.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = gloPreview
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:ClientPanelTests.Close
    Relate:Rast.Close
  END
  IF SELF.Opened
    INIMgr.Update('PrintPanelReview',ProgressWindow)       ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  !! IF gloPreview
    SETTARGET(Report)
    TARGET{PROP:Text} = 'PanelReview' & gloClientNumber
  !! .
  SETTARGET()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.ProcessResultFiles PROCEDURE(OutputFileQueue OutputFile)

ReturnValue          BYTE,AUTO

  CODE
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ReturnValue = PARENT.ProcessResultFiles(OutputFile)
  !!!!!!!!!!!!!!!!!!!
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  SETTARGET(Report)
  ?Image1{PROP:Text} = 'am.jpg'
  UNHIDE(?Image1)
  IF gloSupressNotifcation
    HIDE(?StringSentance1, ?StringSentance3)
    HIDE(?locKeep,?LineSignature)
  .
  SETTARGET()
  CPT:Client = CP:CLIENT
  CPT:Panel =  CP:PANEL
  SET(CPT:OrderKey,CPT:OrderKey)
  IF ERRORCODE() THEN STOP(' SET CPT: ' & ERROR() & ' ' & CP:CLIENT & ' ' & CP:PANEL) .
  C# = 0
  FREE(COLUMN2)
  R# = 0
  LOOP
    NEXT(ClientPanelTests)
    IF ERRORCODE() THEN BREAK.
!    stop(CPT:Client  & ' = ' &  CP:CLIENT  & ' . ' &   CPT:Panel  & ' = ' &  CP:PANEL & ' . ' &   CPT:Code & ' . ' &   CPT:TestTypes  & ' . ' &   CPT:Description)
    IF CPT:Panel <> CP:PANEL OR CPT:Client <> CP:CLIENT THEN BREAK.
    C# += 1
  .
  IF C# > 32 THEN
    locRows = 0
    CPT:Client = CP:CLIENT
    CPT:Panel =  CP:PANEL
    SET(CPT:OrderKey,CPT:OrderKey)
    LOOP 32 TIMES;NEXT(ClientPanelTests).
    LOOP
      NEXT(ClientPanelTests)
      IF ERRORCODE() OR  CPT:Panel <> CP:PANEL OR CPT:Client <> CP:CLIENT THEN BREAK.
      C2:TestTypes = CPT:TestTypes
      C2:Description = CPT:Description
      ADD(COLUMN2)
      locRows += 1
      IF locRows > 31 THEN BREAK.
    .
    IF C# > 96 THEN
      locRows = 0
      CPT:Client = CP:CLIENT
      CPT:Panel =  CP:PANEL
      SET(CPT:OrderKey,CPT:OrderKey)
      LOOP 32 TIMES;NEXT(ClientPanelTests).
      LOOP
        NEXT(ClientPanelTests)
        IF ERRORCODE() OR  CPT:Panel <> CP:PANEL OR CPT:Client <> CP:CLIENT THEN BREAK.
        C2:TestTypes = CPT:TestTypes
        C2:Description = CPT:Description
        ADD(COLUMN2)
        locRows += 1
        IF locRows > 31 THEN BREAK.
      .
      C2:TestTypes = ''
      C2:Description = ''
    .
    LOOP
      locRows += 1
      IF locRows > 31 THEN BREAK.
      C2:TestTypes = ''
      C2:Description = ''
      ADD(COLUMN2)
    .

  .
!  STOP(C# & ' . Test Found Total records in table=' &  RECORDS(ClientPanelTests) & ' . Panel=' &  CP:PANEL & ' .  Client=' &  CP:CLIENT)
  PRINT(RPT:Detail)
  CPT:Client = CP:CLIENT
  CPT:Panel =  CP:PANEL
  SET(CPT:OrderKey,CPT:OrderKey)
  IF ERRORCODE() THEN STOP('SET CPT: ' & ERROR() & ' ' & CP:CLIENT & ' ' & CP:PANEL) .
  locRows = 0
  LOOP
    NEXT(ClientPanelTests)
    IF ERRORCODE() OR CPT:Panel <> CP:PANEL OR CPT:Client <> CP:CLIENT THEN BREAK.
    R# += 1
    IF C# > 32 THEN
      GET(COLUMN2,R#)
      PRINT(RPT:Tests2)
       locRows += 1
       IF locRows > 31
         IF C# > 64
           CLEAR(CPT:Record)
           C2:TestTypes = ''
           C2:Description = ''
           PRINT(RPT:Tests)
           PRINT(RPT:Tests)
           PRINT(RPT:Tests)
         .

         C# -= 64
         LOOP 32 TIMES;NEXT(ClientPanelTests).
       .
    ELSE
       PRINT(RPT:Tests)
    .
  .
  PRINT(RPT:PageBreak)
  OMIT('XXXX')              
  PRINT(RPT:Detail)
  PRINT(RPT:Tests)
  PRINT(RPT:Tests2)
  PRINT(RPT:PageBreak)
  XXXX
  
  ?Image1{PROP:Text} = 'am.jpg'
  UNHIDE(?Image1)
  RETURN ReturnValue


Previewer.AskPrintPages PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.AskPrintPages()
  !!!!!!!!!!!!!!!!!!!
  RETURN ReturnValue


Previewer.ProcessResultFiles PROCEDURE(OutputFileQueue OutputFile)

ReturnValue          BYTE,AUTO

  CODE
    SETTARGET(Report)
    TARGET{PROP:Text} = 'PanelReview' & gloClientNumber
  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  ReturnValue = PARENT.ProcessResultFiles(OutputFile)
  !!!!!!!!!!!!!!!!!!!!!!
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  !report target setup
  
  
  
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
ResultsSendout PROCEDURE 

locPhysician         STRING(40)                            !
locComment           STRING(88)                            !
locPatientNote       STRING(127)                           !
Progress:Thermometer BYTE                                  !
locASR               LONG                                  !
locPosE              BYTE                                  !
locPosG4             BYTE                                  !
locE                 BYTE                                  !
locG4                BYTE                                  !
SAV:Type             STRING(4)                             !
locPatientText       STRING(512)                           !
locNoAbnormal        STRING(32)                            !
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient Sendouts'),AT(,,143,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3600,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,16,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2083),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-365),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2083),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(locPatientNote),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
SEInterp               DETAIL,AT(10,,8302,2229)
                         BOX,AT(719,0,2510,250),USE(?Box3:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2823,896,2698,1021),USE(?BoxEinterpDesc4:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(5615,300,479,219),USE(?Box5:8),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,300,969,208),USE(?Box16:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2823,300,2698,219),USE(?Box4:9),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,700,969,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black)
                         BOX,AT(5615,500,479,219),USE(?BoxEinterpClass1:2),COLOR(COLOR:Black)
                         BOX,AT(2823,500,2698,219),USE(?BoxEinterpDesc1:2),COLOR(COLOR:Black)
                         BOX,AT(2823,698,2698,219),USE(?BoxEinterpDesc2:2),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(5615,700,479,219),USE(?BoxEinterpClass2:2),COLOR(COLOR:Black)
                         BOX,AT(6156,500,969,219),USE(?BoxEinterpConc2:2),COLOR(COLOR:Black)
                         BOX,AT(5615,900,479,219),USE(?BoxEinterpClass3:2),COLOR(COLOR:Black)
                         BOX,AT(6156,900,969,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black)
                         BOX,AT(5615,1100,479,219),USE(?BoxEinterpClass4:2),COLOR(COLOR:Black)
                         BOX,AT(6156,1100,969,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black)
                         BOX,AT(5615,1300,479,219),USE(?BoxEinterpClass5:2),COLOR(COLOR:Black)
                         BOX,AT(6156,1300,969,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black)
                         BOX,AT(5615,1500,479,219),USE(?BoxEinterpClass6:2),COLOR(COLOR:Black)
                         BOX,AT(6156,1500,969,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black)
                         BOX,AT(5615,1700,479,219),USE(?BoxEinterpClass7:2),COLOR(COLOR:Black)
                         BOX,AT(6156,1700,969,219),USE(?BoxEinterpConc7),COLOR(COLOR:Black)
                         BOX,AT(5615,1900,479,219),USE(?BoxEinterpClass8:2),COLOR(COLOR:Black)
                         BOX,AT(6156,1900,969,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black)
                         STRING('Equivocal'),AT(2990,740,2365,177),USE(?SEinterp2:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/1'),AT(5688,740,313,156),USE(?SEinterpClass2:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,719,1031,156),USE(NOR:SEE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,927,313,156),USE(?SEinterpClass3:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,917,1031,156),USE(NOR:SE1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(3031,1115,2365,208),USE(?SEinterp4:3),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1115,313,156),USE(?SEinterpClass4:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1115,1031,156),USE(NOR:SE2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('3'),AT(5688,1344,313,156),USE(?SEinterpClass5:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1323,1031,156),USE(NOR:SE3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('4'),AT(5688,1542,313,156),USE(?SEinterpClass6:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1521,1031,156),USE(NOR:SE4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('5'),AT(5688,1740,313,156),USE(?SEinterpClass7:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('6'),AT(5688,1940,313,156),USE(?SEinterpClass8:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1719,1031,156),USE(NOR:SE5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1919,1031,156),USE(NOR:SE6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('No Antibody Detected'),AT(2990,531,2365,177),USE(?SEinterp1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,521,1031,156),USE(NOR:SE0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,156),USE(?SEinterpClass1:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('IgE Normal Range'),AT(833,31,2271,219),USE(?locHeading:6),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3115,344,2240,177),USE(?RES:Description:2),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5635,344,417,177),USE(?RES:Score:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (IU/mL)'),AT(6188,344,906,177),USE(?S72:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
SG4Interp              DETAIL,AT(10,10,8302,2198)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,302,969,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2823,302,2698,219),USE(?Box4:8),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(729,0,2510,250),USE(?Box3:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6156,500,969,219),USE(?BoxEinterpConc1:3),COLOR(COLOR:Black)
                         BOX,AT(5615,500,479,219),USE(?Boxg4interpClass1:3),COLOR(COLOR:Black)
                         BOX,AT(2823,500,2698,219),USE(?Boxg4interpDesc1),COLOR(COLOR:Black)
                         BOX,AT(5615,719,479,219),USE(?Boxg4interpClass3),COLOR(COLOR:Black)
                         BOX,AT(6156,719,969,219),USE(?Boxg4interpConc3),COLOR(COLOR:Black)
                         BOX,AT(2823,719,2698,1125),USE(?Boxg4interpDesc4:3),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(5615,938,479,219),USE(?Boxg4interpClass4),COLOR(COLOR:Black)
                         BOX,AT(6156,938,969,219),USE(?Boxg4interpConc4),COLOR(COLOR:Black)
                         BOX,AT(5615,1156,479,219),USE(?Boxg4interpClass5),COLOR(COLOR:Black)
                         BOX,AT(6156,1156,969,219),USE(?Boxg4interpConc5),COLOR(COLOR:Black)
                         BOX,AT(5615,1375,479,219),USE(?Boxg4interpClass6),COLOR(COLOR:Black)
                         BOX,AT(6156,1375,969,219),USE(?Boxg4interpConc6),COLOR(COLOR:Black)
                         BOX,AT(5615,1600,479,219),USE(?Boxg4interpClass7:3),COLOR(COLOR:Black)
                         BOX,AT(6156,1604,969,219),USE(?Boxg4interpConc7:2),COLOR(COLOR:Black)
                         STRING('1'),AT(5708,740,313,200),USE(?SEinterpClass3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,735,948,198),USE(NOR:SG41),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-5'),AT(2990,958,2365,208),USE(?SEinterp4:2),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5708,958,313,200),USE(?SEinterpClass4:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,955,948,198),USE(NOR:SG42),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5708,1177,313,200),USE(?SEinterpClass5:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1175,948,198),USE(NOR:SG43),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('4'),AT(5708,1396,313,200),USE(?SEinterpClass6:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1395,948,198),USE(NOR:SG44),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('5'),AT(5708,1625,313,200),USE(?SEinterpClass7:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1625,948,198),USE(NOR:SG45),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('No Antibody Detected'),AT(3021,521,2365,208),USE(?SEinterp1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,542,948,198),USE(NOR:SG40),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5708,542,313,200),USE(?SEinterpClass1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('IgG4 Normal Range'),AT(729,10,2510,250),USE(?locHeading:5),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3031,313,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,313,417,208),USE(?RES:Score:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(6188,323,885,208),USE(?S72:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Detail                 DETAIL,AT(,,8000,115),USE(?Detail)
                         LINE,AT(42,292,0,1000),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,1000),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(0,1000,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
NoAbnormal             DETAIL,AT(,,8000,729),USE(?Detail:2)
                         STRING('No Abnormal Laboratory Findings'),AT(94,177,7938,271),USE(?String123),FONT(,14,,FONT:bold), |
  CENTER,TRN
                       END
SumHead                DETAIL,AT(10,10,8302,385),PAGEBEFORE(-1)
                         STRING('Review of Positive Laboratory Findings'),AT(760,10,6594,354),USE(?locHeading),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
PosSubHead             DETAIL,AT(10,10,8302,240)
                         BOX,AT(5604,10,479,250),USE(?Box5:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?Box4:14),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(6177,0,542,250),USE(?Box18:6),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Elevated Allergen'),AT(3479,21,1177,208),USE(?RES:Description:7),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,21,396,208),USE(?RES:Score),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Type'),AT(6292,21),USE(?RES:Type),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       END
PosElevated            DETAIL,AT(10,10,8302,250)
                         BOX,AT(5604,0,479,219),USE(?Box5:7),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(2792,0,2698,219),USE(?Box4:12),COLOR(COLOR:Black)
                         BOX,AT(6177,0,542,229),USE(?Box18:9),COLOR(COLOR:Black)
                         STRING(@s4),AT(6292,31),USE(RES:Type,,?RES:Type:2),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s40),AT(2854,31),USE(RES:Description,,?RES:Description:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s3),AT(5698,31),USE(RES:Score,,?RES:Score:3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
PosEquivocal           DETAIL,AT(10,10,8302,250)
                         BOX,AT(5604,0,479,219),USE(?Box5:7),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(2792,0,2698,219),USE(?Box4:12),COLOR(COLOR:Black)
                         BOX,AT(6177,0,542,229),USE(?Box18:9),COLOR(COLOR:Black)
                         STRING(@s4),AT(6292,31),USE(RES:Type,,?RES:Type:7),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s40),AT(2854,31),USE(RES:Description,,?RES:Description:12),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s3),AT(5698,31),USE(RES:Score,,?RES:Score:5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
SG4Header              DETAIL,AT(10,10,8302,385)
                         BOX,AT(729,63,2510,250),USE(?Box3:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('IgG4 Immunoglobulin'),AT(729,64,2510,250),USE(?locHeading:2),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
SEHeader               DETAIL,AT(10,10,8302,385)
                         BOX,AT(729,63,2510,250),USE(?Box3:3),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('mRAST'),AT(729,64,2510,250),USE(?locHeading:2),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
SG4SubHeading          DETAIL,AT(10,10,8302,229)
                         BOX,AT(6167,10,896,219),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,10,2698,219),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(5635,10,479,219),USE(?Box15),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Class'),AT(5667,33),USE(?S71),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('ug/mL'),AT(6177,31,896,208),USE(?S72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Allergens'),AT(3438,21,1438,208),USE(?AllergensHead),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
SESubHeading           DETAIL,AT(10,10,8302,229)
                         BOX,AT(6167,10,896,219),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,10,2698,219),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(5635,10,479,219),USE(?Box15),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Class'),AT(5667,33),USE(?S71),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Conc(IU/mL)'),AT(6177,31,896,208),USE(?S72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Allergens'),AT(3438,21,1438,208),USE(?AllergensHead),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
Equivocal              DETAIL,AT(10,,8302,250)
                         BOX,AT(6167,0,896,219),USE(?Box6),COLOR(COLOR:Black)
                         BOX,AT(5635,0,479,219),USE(?Box5),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,219),USE(?Box4:2),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(7156,0,542,219),USE(?Box18:2),COLOR(COLOR:Black)
                         STRING(@s4),AT(7229,31,365,190),USE(RES:Type,,?RES:Type:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equivocal'),AT(1750,31,677,188),USE(?Equivocal),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,31,2500,188),USE(RES:Description,,?RES:Description:5),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6323,31,573,188),USE(RES:Conc,,?RES:Conc:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>'),AT(1229,0,333,240),USE(?S81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING(@s3),AT(5729,31,281,188),USE(RES:Score,,?RES:Score:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Elevated               DETAIL,AT(10,,8302,250)
                         BOX,AT(6167,0,896,219),USE(?Box6),COLOR(COLOR:Black)
                         BOX,AT(5635,0,479,219),USE(?Box5),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,219),USE(?Box4:2),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(7156,0,542,219),USE(?Box18:11),COLOR(COLOR:Black)
                         STRING(@s4),AT(7229,31,365,188),USE(RES:Type),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Elevated'),AT(1750,31,677,188),USE(?Elevated),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,31,2500,188),USE(RES:Description,,?RES:Description:11),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6323,31,573,188),USE(RES:Conc,,?RES:Conc:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>>'),AT(1229,0,333,240),USE(?S81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING(@s3),AT(5729,31,281,188),USE(RES:Score,,?RES:Score:10),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Normal                 DETAIL,AT(10,,8302,250)
                         BOX,AT(6167,0,896,219),USE(?Box6:3),COLOR(COLOR:Black)
                         BOX,AT(5635,0,479,219),USE(?Box5:3),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,219),USE(?Box4:3),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:3),COLOR(COLOR:Black)
                         BOX,AT(7156,0,542,219),USE(?Box18),COLOR(COLOR:Black)
                         STRING(@s4),AT(7333,31,365,208),USE(RES:Type,,?RES:Type:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Normal'),AT(1760,31,677,208),USE(?Normal:2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,31,2500,208),USE(RES:Description,,?RES:Description:4),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6323,31,573,208),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING(@s3),AT(5729,31,281,208),USE(RES:Score,,?RES:Score:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
PosHeader              DETAIL,AT(10,10,8302,469),PAGEBEFORE(-1)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:4),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
ASR                    DETAIL,AT(10,10,8302,833),USE(?DETAIL29),FONT(,8)
                         STRING('This test was developed and its performance characteristics determined by Aller' & |
  'metrix. It has not been cleared nor approved by the FDA.'),AT(698,10,7219,177),USE(?S198), |
  TRN
                         STRING('The laboratory is regulated under CLIA as qualified to perform high-complexity ' & |
  'testing.  This test is used for clinical purposes.'),AT(698,167,6875,177),USE(?S198:3), |
  TRN
                         STRING('It should not be regarded as investigational or for research.'),AT(698,323,6875,177), |
  USE(?S198:4),TRN
                       END
PageBreak              DETAIL,AT(10,10,8302,146),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10500,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(21,52,1427,125),USE(?String40),FONT('Arial',8),TRN
                         STRING('Medical Laboratory Director'),AT(21,156,1469,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7010,42,698,219),USE(?PageCount),FONT('Arial',10),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ResultsSendout')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ResultsSendout',ProgressWindow)            ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Normals.Close
    Relate:Patient.Close
    Relate:SendOuts.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsSendout',ProgressWindow)         ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
    gloReportTitle = 'Summary'
    locASR = FALSE
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .

  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .
    locPhysician = SUB(gloPatientNotes[1],1,40)
    locComment = SUB(gloPatientNotes[1],41,88)
    locPatientNote = CLIP(locPhysician) & ' ' & CLIP(locComment)
!Results   QUEUE,PRE(RES)
! RES:Sort      BYTE
! RES:Code      STRING(9)
! RES:Description   STRING(40)
! RES:Type      STRING(4)
! RES:Result    STRING(10)
! RES:Conc      STRING(7)
! RES:Score     STRING(3)
! RES:Status    STRING(1)
! RES:Panel     STRING(9)
! RES:Summary   BYTE
! RES:Fee       DECIMAL(5,2)
! RES:FeeLevel   BYTE
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)  
    IF SUB(RES:Code,1,2) = 'S0' THEN locASR = TRUE.
    IF RES:Type = 'IgG4' THEN locG4 = TRUE.
    IF RES:Type = 'IgE' THEN locE = TRUE.
    IF RES:Score = '0' THEN CYCLE.
    IF RES:Type = 'IgG4' THEN locPosG4 = TRUE.
    IF RES:Type = 'IgE' THEN locPosE = TRUE.
  .
  
  PRINT(RPT:PosHeader)
  SAV:Type = '-'
  SORT(Results,RES:Type,RES:Category,RES:Description)
  SAV:Type = '-'
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF RES:Type <> SAV:Type
      SAV:Type = RES:Type
      IF RES:Type = 'IgG4'
        PRINT(RPT:SG4Header)
        IF locPosG4
          PRINT(RPT:PosSubHead)
        ELSE
          PRINT(RPT:NoAbnormal)
        .
        
      ELSE
        PRINT(RPT:SEHeader)
        IF locPosE
          PRINT(RPT:PosSubHead)
        ELSE
          PRINT(RPT:NoAbnormal)
        .
      .
    .
    IF RES:Score = '0' OR RES:Score = 'Neg' THEN CYCLE.
    IF RES:Score = '0/1'
      PRINT(RPT:PosEquivocal)
    ELSE
      PRINT(RPT:PosElevated)
    .
  .

    PRINT(RPT:PageBreak)
    gloReportTitle = 'Interpretation'
    IF locE THEN PRINT(RPT:SEInterp).
    IF locG4 THEN PRINT(RPT:SG4Interp).
    IF locASR THEN PRINT(RPT:ASR).
    PRINT(RPT:PageBreak)
    gloReportTitle = 'Results'
  SAV:Type = '-'
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF RES:Type <> SAV:Type
      SAV:Type = RES:Type
      IF RES:Type = 'IgG4'
        PRINT(RPT:SG4Header)
        PRINT(RPT:SG4SubHeading)
        
      ELSE
        PRINT(RPT:SEHeader)
        PRINT(RPT:SESubHeading)
      .
    .
    IF RES:Score = '0' OR RES:Score = 'Neg' 
      PRINT(RPT:Normal)
    ELSIF RES:Score = '0/1'
      PRINT(RPT:Equivocal)
    ELSE
      PRINT(RPT:Elevated)
    .
  .
  SO:Patient = PAT:Invoice
  GET(SendOuts,SO:OrderKey)
  IF ~ERRORCODE() THEN DELETE(SendOuts).
  omit('XXXX')
  PRINT(RPT:SEInterp)
  PRINT(RPT:SG4Interp)
  PRINT(RPT:Detail)
  PRINT(RPT:NoAbnormal)
  PRINT(RPT:SumHead)
  PRINT(RPT:PosSubHead)
  PRINT(RPT:PosElevated)
  PRINT(RPT:PosEquivocal)
  PRINT(RPT:SG4Header)
  PRINT(RPT:SEHeader)
  PRINT(RPT:SG4SubHeading)
  PRINT(RPT:SESubHeading)
  PRINT(RPT:Equivocal)
  PRINT(RPT:Elevated)
  PRINT(RPT:Normal)
  PRINT(RPT:PosHeader)
  PRINT(RPT:ASR)
  PRINT(RPT:PageBreak)
  XXXX
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
CreatePDF PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Window'),AT(,,255,160),FONT('Arial',8,COLOR:Black,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,HLP('CreatePDF'),SYSTEM
                       BUTTON('&OK'),AT(107,131,70,25),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(181,131,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CreatePDF')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Ok
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CreatePDF',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    INIMgr.Update('CreatePDF',QuickWindow)                 ! Save window data to non-volatile store
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
        gloReportFileName = '..\ResultsNoEncrypt\'
        IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
        gloPassword = PAT:Client
        gloTotal = 0
        gloDust = 0
        gloMold = 0
        gloPollen = 0
        gloFood = 0
        gloTotalSummary = 0
        SAV:Patient = Pat:INVOICE
        gloSendout = FALSE
        BuildQueues(Pat:INVOICE)
        Pat:INVOICE =  SAV:Patient
        GET(Patient,Pat:INVOICE_KEY)
        IF Pat:DATE < NOR:CutOffDate
          EXC:Patient = EXC:Patient
          EXC:Client =  EXC:Client
          EXC:StatusX = 'D'
          ADD(Exceptions)
          RETURN(0)
        .                                           
      CLI:Number = Pat:CLIENT
      GET(Client,CLI:ORDER_KEY)
      if errorcode() AND ERRORCODE() <> 52 then stop('Patient=' & Pat:INVOICE & ', Client=' & Pat:CLIENT & ': ' & error()).
      PR:eMail = CLI:EmailReport
      IF  CLI:Postal = '1' THEN CLI:Postal = 'Y'; PUT(Client).
      IF  CLI:Postal = '0' THEN CLI:Postal = 'N'; PUT(Client).
      IF CLI:Postal = CLIENT:Postal_Y THEN PR:Postal = TRUE ELSE PR:Postal = FALSE.
      PR:Fax = CLI:FaxReport
      gloLanguage = CLI:Language
      PR:Language = gloLanguage
      PR:Consolidate = CLI:ConsolidateReports
        PR:FollowUp = ''
        gloPatient = SAV:Patient
        gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client
        IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
        IF gloLanguage = CLIENT:English_E OR gloSendout
          gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\' & PR:Invoice & 'e.PDF'
          IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
            STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
          .
          IF FILEEXISTS(gloReportFileName) AND ~locOverWrite
            STOP('File Exists: ' & gloReportFileName)
          ELSE
            IF gloSendout
              ResultsSendout
              gloSendout = FALSE
            ELSE
              EnglishResults
            .
          .
          WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
          ADD(WebPage)
          PW:Text =   'EncryptPDF -i ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 'e.PDF -o .\' & PR:Client & '\' & PR:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & PR:Client
          ADD(Passwords)
          PR:Language = gloLanguage
          PR:FileName = PR:Client & '\' & PR:Invoice & 'e.PDF'
          PUT(PatientReports)
        ELSIF gloLanguage = CLIENT:LanguageBoth_B
          gloLanguage = CLIENT:English_E
          gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\' & PR:Invoice & 'e.PDF'
          IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
            STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
          .
          EnglishResults
          WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
          ADD(WebPage)
          PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 'e.PDF -o .\' & PR:Client & '\' & PR:Invoice & 'e.PDF -p -e 128 -l encrypt.log  -w 5994100 -u ' & PR:Client
          ADD(Passwords)
          PR:Language = gloLanguage
          PR:FileName = PR:Client & '\' & PR:Invoice & 'e.PDF'
          PUT(PatientReports)
          gloLanguage = CLIENT:Spanish_S
          gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\' & PR:Invoice & 's.PDF'
          IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
            STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
          .
          SpanishPDF
          WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
          ADD(WebPage)
          PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice & 's.PDF -o .\' & PR:Client & '\' & PR:Invoice & 's.PDF  -p -e 128 -l encrypt.log  -w 5994100 -u ' & PR:Client
          ADD(Passwords)
       ELSE
          gloLanguage = CLIENT:Spanish_S
          gloReportFileName = '..\ResultsNoEncrypt\' & PR:Client & '\' & PR:Invoice & 's.PDF'
          IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
            STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
          .
          IF FILEEXISTS(gloReportFileName) AND ~locOverWrite
            STOP('File Exists: ' & gloReportFileName)
          ELSE
            SpanishPDF
          .
          WP:Text =  '<a href="file:///' & LONGPATH(gloReportFileName) & '">'  &  PR:Client & ' - ' &  SUB(gloReportFileName,28,7) &   '</a><font color=red>' & CLIP(PR:FollowUp) & '</font><p>'
          ADD(WebPage)
          PW:Text =   'EncryptPDF -i  ..\ResultsNoEncrypt\' &   PR:Client & '\' & PR:Invoice &  's.PDF -o .\' & PR:Client & '\' & PR:Invoice & 's.PDF  -p -e 128 -l encrypt.log  -w 5994100 -u ' & PR:Client
          ADD(Passwords)
          PR:Language = gloLanguage
          PR:FileName = PR:Client & '\' & PR:Invoice & 's.PDF'
          PUT(PatientReports)
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

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
ResultsSendout200 PROCEDURE 

locPhysician         STRING(40)                            !
locComment           STRING(88)                            !
locPatientNote       STRING(127)                           !
Progress:Thermometer BYTE                                  !
locCdPos             BYTE                                  !
locE                 BYTE                                  !
locPatientText       STRING(512)                           !
locNoAbnormal        STRING(32)                            !
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient Sendouts'),AT(,,143,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3600,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,16,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2083),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-365),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2083),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(locPatientNote),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
CdInterp               DETAIL,AT(10,10,8302,2219)
                         BOX,AT(5615,100,969,220),USE(?SCBox16:5),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2823,100,2698,220),USE(?SCBox4:9),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(5615,320,969,220),USE(?SCBoxEinterpConc1),COLOR(COLOR:Black)
                         BOX,AT(2823,320,2698,220),USE(?SCBoxEinterpDesc1:2),COLOR(COLOR:Black)
                         BOX,AT(5615,540,969,220),USE(?SCBoxEinterpConc1:2),COLOR(COLOR:Black)
                         BOX,AT(2823,540,2698,220),USE(?SCBoxEinterpDesc1:3),COLOR(COLOR:Black),FILL(0080FFFFh)
                         STRING(@s12),AT(5615,573),USE(NOR:SC1),CENTER,TRN
                         STRING('Positive (Antibody Detected)'),AT(3000,570,2365,177),USE(?SEinterp2:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Negative (Antibody Not Detected)'),AT(2990,350,2365,177),USE(?SEinterp1:2),FONT(,, |
  ,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s12),AT(5615,354),USE(NOR:SC0),CENTER,TRN
                         STRING('Interpretation'),AT(3115,130,2240,177),USE(?RES:Description:2),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Units (EIA)'),AT(5615,125,969,219),USE(?S72:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CdPosSubHead           DETAIL,AT(10,52,8302,250)
                         BOX,AT(6646,10,542,219),USE(?SCBox5:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(5604,0,969,250),USE(?SCBox5:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?SC:TypeBox),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Elevated Antigen'),AT(3479,31,1177,208),USE(?RES:Description:7),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Units (EIA)'),AT(5604,30,969,219),USE(?RES:Score),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Type'),AT(6740,31),USE(?StringType),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       END
CdPosElevated          DETAIL,AT(10,,8302,250)
                         BOX,AT(5604,0,969,250),USE(?SCBox5:ElvPos),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:ElvPos),COLOR(COLOR:Black)
                         BOX,AT(6646,0,542,250),USE(?SCBoxType:ElvPos),COLOR(COLOR:Black)
                         STRING(@s40),AT(2854,30),USE(RES:Description,,?RES:SCDescription:PosElv),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s12),AT(5604,30,969,219),USE(RES:Conc,,?RES:SCSCConc:EvlPos),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s4),AT(6646,31,542,219),USE(RES:Type,,?RES:SCSCType:PosElv),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CdHeader               DETAIL,AT(10,104,8302,260)
                         BOX,AT(730,0,2510,260),USE(?SCBox3:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(3)
                         STRING('Candida Antibodies'),AT(729,30,2510,200),USE(?locHeading:7),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
CdHeader2              DETAIL,AT(10,-10,8302,250)
                         BOX,AT(730,0,2510,250),USE(?SCBox3:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(4)
                         STRING('IgG, IgA and IgM Normals Range'),AT(729,30,2510,200),USE(?locHeading:8),FONT(,11,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
NoAbnormal             DETAIL,AT(,,8000,729),USE(?Detail:2)
                         STRING('No Abnormal Laboratory Findings'),AT(94,177,7938,271),USE(?String123),FONT(,14,,FONT:bold), |
  CENTER,TRN
                       END
PosHeader              DETAIL,AT(10,10,8302,469)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:4),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
CdSubHeading           DETAIL,AT(10,52,8302,250)
                         BOX,AT(5615,0,896,250),USE(?SCBox16:2),COLOR(COLOR:Black),FILL(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?SCBox14:4),COLOR(COLOR:Black),FILL(COLOR:Black)
                         STRING('Units (EIA)'),AT(5615,31,896,208),USE(?S72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Antigen'),AT(3438,21,1438,208),USE(?AllergensHead),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
CdEquivocal            DETAIL,AT(10,,8302,250)
                         BOX,AT(5615,0,896,250),USE(?SCBox6:2),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:2),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(00D2FFD2h)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:2),COLOR(COLOR:Black)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?RES:SCSCType:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equivocal'),AT(1750,40,677,200),USE(?Equivocal),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,40,2500,200),USE(RES:Description,,?RES:SCSCDescription:5),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc,,?RES:SCSCConc:Eqv),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>'),AT(1229,0,333,240),USE(?S81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                       END
CdElevated             DETAIL,AT(10,,8302,250)
                         BOX,AT(5615,0,896,250),USE(?SCBox6),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:2),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:2),COLOR(COLOR:Black),FILL(0080FFFFh)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:11),COLOR(COLOR:Black)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?SCRES:Type:Elv),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Elevated'),AT(1750,40,677,188),USE(?Elevated),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,40,2500,188),USE(RES:Description,,?RES:SCSCDescription:Elv),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc,,?RES:SCSCConc:Elv),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>>'),AT(1229,0,333,240),USE(?S81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                       END
CdNormal               DETAIL,AT(10,,8302,250)
                         BOX,AT(5615,0,896,250),USE(?SCBox6:3),COLOR(COLOR:Black)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:3),COLOR(COLOR:Black)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:3),COLOR(COLOR:Black)
                         BOX,AT(6646,0,542,250),USE(?SCBox18),COLOR(COLOR:Black)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?RES:SCSCType:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Normal'),AT(1760,40,677,208),USE(?Normal:2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,40,2500,208),USE(RES:Description,,?RES:SCSCDescription:4),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
PageBreak              DETAIL,AT(10,10,8302,146),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10500,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(21,52,1427,125),USE(?String40),FONT('Arial',8),TRN
                         STRING('Medical Laboratory Director'),AT(21,156,1469,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING('Testing performed at Warde Medical Laboratory, Ann Arbor Michigan'),AT(2167,156,3646, |
  208),USE(?String82:2),FONT('Arial',8),CENTER,TRN
                         STRING(@pPage <<#p),AT(7010,42,698,219),USE(?PageCount),FONT('Arial',10),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ResultsSendout200')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ResultsSendout200',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Normals.Close
    Relate:Patient.Close
    Relate:SendOuts.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsSendout200',ProgressWindow)      ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
      gloReportTitle = 'Summary'


    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .

  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .
    locPhysician = SUB(gloPatientNotes[1],1,40)
    locComment = SUB(gloPatientNotes[1],41,88)
    locPatientNote = CLIP(locPhysician) & ' ' & CLIP(locComment)
!Results   QUEUE,PRE(RES)
! RES:Sort      BYTE
! RES:Code      STRING(9)
! RES:Description   STRING(40)
! RES:Type      STRING(4)
! RES:Result    STRING(10)
! RES:Conc      STRING(7)
! RES:Score     STRING(3)
! RES:Status    STRING(1)
! RES:Panel     STRING(9)
! RES:Summary   BYTE
! RES:Fee       DECIMAL(5,2)
! RES:FeeLevel   BYTE
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF RES:Score = '0' THEN CYCLE.
    locCdPos = TRUE
    BREAK
  .
  PRINT(RPT:PosHeader)
  IF locCdPos
    PRINT(RPT:Cdheader)
    PRINT(RPT:CdPosSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF RES:Score = '0' THEN CYCLE.
      PRINT(RPT:CdPosElevated)
    .
  ELSE
    PRINT(RPT:Cdheader)
    PRINT(RPT:NoAbnormal)
  .
  PRINT(RPT:PageBreak)
  gloReportTitle = 'Interpretation'
  PRINT(RPT:Cdheader)
  PRINT(RPT:Cdheader2)
  PRINT(RPT:CdInterp)
  PRINT(RPT:PageBreak)
  gloReportTitle = 'Results'  
  PRINT(RPT:Cdheader)
  PRINT(RPT:CdSubHeading)
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF RES:Score = '0'
      PRINT(RPT:CdNormal)
    ELSE
      PRINT(RPT:CdElevated)
    .
  .
  SO:Patient = PAT:Invoice
  GET(SendOuts,SO:OrderKey)
  IF ~ERRORCODE() THEN DELETE(SendOuts).
  omit('XXXX')
  PRINT(RPT:CdInterp)
  PRINT(RPT:CdPosSubHead)
  PRINT(RPT:CdPosElevated)
  PRINT(RPT:CdHeader)
  PRINT(RPT:CdHeader2)
  PRINT(RPT:NoAbnormal)
  PRINT(RPT:PosHeader)
  PRINT(RPT:CdSubHeading)
  PRINT(RPT:CdEquivocal)
  PRINT(RPT:CdElevated)
  PRINT(RPT:CdNormal)
  PRINT(RPT:PageBreak)
  XXXX
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
ResultsPeanut PROCEDURE 

Progress:Thermometer BYTE                                  !
locIndicatorSA       STRING(2)                             !
locCdPos             BYTE                                  !
locE                 BYTE                                  !
locPatientText       STRING(512)                           !
locNoAbnormal        STRING(32)                            !
locRisk6             STRING(255)                           !
locDisclaimer        STRING(255)                           !
locIndicator10       STRING(2)                             !
locIndicator1        STRING(2)                             !
locTestCount         BYTE                                  !
locScore             DECIMAL(5,1)                          !
locThreshold         STRING(24)                            !
locSpecificActivity  DECIMAL(7,4)                          !
COLOR:Equivocal      EQUATE(0D2FFD2H)
COLOR:Positive       EQUATE(080FFFFH)

locIndicatorG006     STRING(12)
locIndicatorW006     STRING(12)
locIndicatorT146     STRING(12)
locIndicatorF317     STRING(12)
locIndicatorF203     STRING(12)
locIndicatorF201     STRING(12)
locIndicatorF017     STRING(12)
locIndicatorF103     STRING(12)
locIndicatorF202     STRING(12)
locIndicatorF010     STRING(12)
locIndicatorF018     STRING(12)
locIndicatorF020     STRING(12)
locIndicatorF095     STRING(12)
locIndicatorF013     STRING(12)
locIndicatorF359     STRING(12)
locIndicatorF360     STRING(12)
locIndicatorF372     STRING(12)

locG006     DECIMAL(5,2)
locW006     DECIMAL(5,2)
locT146     DECIMAL(5,2)
locF317     DECIMAL(5,2)
locF203     DECIMAL(5,2)
locF201     DECIMAL(5,2)
locF017     DECIMAL(5,2)
locF103     DECIMAL(5,2)
locF202     DECIMAL(5,2)
locF010     DECIMAL(5,2)
locF018     DECIMAL(5,2)
locF020     DECIMAL(5,2)
locF095     DECIMAL(5,2)
locF013     DECIMAL(5,2)
locF359     DECIMAL(5,2)
locF360     DECIMAL(5,2)
locF372     DECIMAL(5,2)

locNDX  SHORT

Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient Sendouts'),AT(,,143,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3604,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1271,2083,208),USE(gloREPORTTITLE),FONT(,12,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2082),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-364),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2082),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(gloPatientNotes[1]),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
PeanutInterp           DETAIL,AT(10,10,8302,3448),USE(?DETAIL1),FONT(,,,FONT:bold)
                         BOX,AT(1000,104,2500,250),USE(?PeanutBox1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@n6.2),AT(4146,104),USE(gloTotalEConc),TRN
                         BOX,AT(1000,354,2500,250),USE(?PeanutBoxF360),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,604,2500,250),USE(?PeanutBoxSA),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,854,2500,250),USE(?PeanutBoxF359),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1104,2500,250),USE(?PeanutBoxF372),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1354,2500,250),USE(?PeanutBoxThreshold),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1604,2500,250),USE(?PeanutBoxF013),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1854,2500,250),USE(?PeanutBoxF095),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2104,2500,250),USE(?PeanutBoxF020),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2354,2500,250),USE(?PeanutBoxF018),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,104,1708,250),USE(?PeanutBox21),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,354,1708,250),USE(?PeanutBoxF202),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,604,1708,250),USE(?PeanutBoxF103),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,854,1708,250),USE(?PeanutBoxF017),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1104,1708,250),USE(?PeanutBoxF201),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1354,1708,250),USE(?PeanutBoxF203),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1604,1708,250),USE(?PeanutBoxF317),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1854,1708,250),USE(?PeanutBoxF010),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2604,1708,250),USE(?PeanutBoxT146),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2854,1708,250),USE(?PeanutBoxW006),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,3104,1708,250),USE(?PeanutBoxG006),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@n6.4),AT(3531,615),USE(locSpecificActivity),TRN
                         STRING('True Peanut Risk Factors (IgE)'),AT(1104,130,2313,229),USE(?PeanutText1),FONT(,,COLOR:White, |
  ,CHARSET:ANSI),CENTER,TRN
                         STRING('Ara h 2'),AT(1104,375,2281,198),USE(?PeanutText2),TRN
                         STRING('Ara h 2  specific activity =>2% *'),AT(1104,625,2281,198),USE(?PeanutText3),TRN
                         STRING('Ara h 1'),AT(1104,875,2281,198),USE(?PeanutText4),TRN
                         STRING('Ara h 6'),AT(1104,1125,2281,198),USE(?PeanutText21),TRN
                         STRING('Peanut-HD'),AT(1104,1375,2281,198),USE(?PeanutText21:2),TRN
                         STRING('Peanut-HD =>15 kU/L '),AT(1104,1625,2281,198),USE(?PeanutText22),TRN
                         STRING('Peach (food)'),AT(1104,1875,2281,198),USE(?PeanutText23),TRN
                         STRING('Almond (Ara h 2 cross-reactive) '),AT(1104,2125,2281,198),USE(?PeanutText24),TRN
                         STRING('Brazil nut (Ara h 2 cross-reactive)'),AT(1104,2417,2281,198),USE(?PeanutText25),TRN
                         BOX,AT(5000,2354,1708,250),USE(?PeanutBox21:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Tree Nuts (IgE)'),AT(5042,125,1344,229),USE(?PeanutText27),FONT(,,COLOR:White),CENTER, |
  TRN
                         STRING('T IgE'),AT(3740,104),USE(?String99),TRN
                         STRING('Cashew'),AT(5104,375,1208,198),USE(?PeanutText28),TRN
                         STRING('Chestnut'),AT(5104,625,1208,198),USE(?PeanutText29),TRN
                         STRING(@s2),AT(125,625,823,208),USE(locIndicatorSA),RIGHT,TRN
                         STRING('Hazelnut /Filbert'),AT(5104,875,1208,198),USE(?PeanutText30),TRN
                         STRING('Pecan'),AT(5104,1125,1208,198),USE(?PeanutText31),TRN
                         STRING('Pistachio'),AT(5104,1375,1208,198),USE(?PeanutText32),TRN
                         STRING('Walnut, English'),AT(5104,1625,1208,198),USE(?PeanutText33),TRN
                         STRING('Sesame Seed'),AT(5104,1875,1208,198),USE(?PeanutText34),TRN
                         STRING('Cross Reacting Pollen'),AT(5031,2375,1604,198),USE(?PeanutText27:2),FONT(,,COLOR:White), |
  CENTER,TRN
                         STRING('Birch, River (tree)'),AT(5104,2624,1208,198),USE(?PeanutText41),TRN
                         STRING('Mugwort (weed)'),AT(5104,2874,1208,198),USE(?PeanutText42),TRN
                         STRING('Timothy (grass)'),AT(5104,3154,1208,198),USE(?PeanutText43),TRN
                         STRING(@s24),AT(83,1375,854,208),USE(locThreshold),RIGHT,TRN
                         STRING(@s12),AT(94,375,854,208),USE(locIndicatorF360,,?locIndicatorF360:2),RIGHT,TRN
                         STRING(@s12),AT(94,875,854,208),USE(locIndicatorF359),RIGHT,TRN
                         STRING(@s12),AT(94,1125,854,208),USE(locIndicatorF372),RIGHT,TRN
                         STRING(@s12),AT(83,1635,854,208),USE(locIndicatorF013),RIGHT,TRN
                         STRING(@s12),AT(94,1875,854,208),USE(locIndicatorF095),RIGHT,TRN
                         STRING(@s12),AT(94,2125,854,208),USE(locIndicatorF020),RIGHT,TRN
                         STRING(@s12),AT(94,2375,854,208),USE(locIndicatorF018),RIGHT,TRN
                         STRING(@s12),AT(3740,1875,1188,208),USE(locIndicatorF010),RIGHT,TRN
                         STRING(@s12),AT(3740,375,1188,208),USE(locIndicatorF202),RIGHT,TRN
                         STRING(@s12),AT(3740,625,1188,208),USE(locIndicatorF103),RIGHT,TRN
                         STRING(@s12),AT(3740,875,1188,208),USE(locIndicatorF017),RIGHT,TRN
                         STRING(@s12),AT(3740,1125,1188,208),USE(locIndicatorF201),RIGHT,TRN
                         STRING(@s12),AT(3740,1375,1188,208),USE(locIndicatorF203),RIGHT,TRN
                         STRING(@s12),AT(3740,1625,1188,208),USE(locIndicatorF317),RIGHT,TRN
                         STRING(@s12),AT(3719,2624,1188,208),USE(locIndicatorT146),RIGHT,TRN
                         STRING(@s12),AT(3688,2874,1188,208),USE(locIndicatorW006),RIGHT,TRN
                         STRING(@s12),AT(3708,3124,1188,208),USE(locIndicatorG006),RIGHT,TRN
                       END
Graph                  DETAIL,AT(104,0,7833,1031),USE(?Detail:Graph)
                         STRING('Laboratory assessment of risk for clinical reaction to peanut'),AT(948,0),USE(?String78), |
  FONT(,14,,FONT:bold),TRN
                         BOX,AT(865,354,700,448),USE(?BoxScore),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING(@n2),AT(6719,354),USE(locScore),FONT(,24,,FONT:bold),RIGHT(12)
                         STRING('/9'),AT(7260,354,458,427),USE(?String97),FONT(,24,,FONT:bold),LEFT,TRN
                         STRING('0 {14}1 {14}2 {14}3 {14}4 {14}5 {14}6 {14}7 {14}8 {14}9'),AT(823,813),USE(?String77), |
  FONT(,,,FONT:bold),LEFT,TRN
                         BOX,AT(865,354,5698,448),USE(?Box26),COLOR(COLOR:Black),LINEWIDTH(1)
                       END
Risk1                  DETAIL,AT(104,0,5802,250),USE(?Detail:Risk1)
                         STRING('Risk of true peanut allergy increases with elevated Ara h 2 sIgE concentration'),AT(550, |
  31),USE(?StringRisk1),TRN
                       END
Risk2                  DETAIL,AT(104,31,7885,250),USE(?Detail:Risk2)
                         STRING('Up to 50% of peanut allergic individuals develop clinical tree nut allergy'),AT(550, |
  31),USE(?StringRisk2),TRN
                       END
Risk3                  DETAIL,AT(104,31,,250),USE(?Detail:Risk3)
                         STRING('Risk of peanut anaphylaxis increases at peanut specific IgE levels above 15kU/L'), |
  AT(550,31),USE(?StringRisk3),TRN
                       END
Risk4                  DETAIL,AT(104,31,,250),USE(?Detail:Risk4)
                         STRING('Clinical peach allergy increases risk of true peanut allergy'),AT(550,31),USE(?StringRisk4), |
  TRN
                       END
Risk5                  DETAIL,AT(104,31,,250),USE(?Detail:Risk5)
                         STRING('True peanut allergic patients with positive tree nut allergy are at increased r' & |
  'isk of sesame seed allergy'),AT(550,31),USE(?StringRisk5),TRN
                       END
Risk6                  DETAIL,AT(104,31,,396),USE(?Detail:Risk6)
                         TEXT,AT(550,31,5000,354),USE(locRisk6),TRN
                       END
Disclaimer             DETAIL,AT(104,0,7833,531),USE(?Detail:Disclaimer)
                         TEXT,AT(550,31,6240,500),USE(locDisclaimer),FONT(,,,FONT:bold,CHARSET:ANSI)
                       END
PageBreak              DETAIL,AT(10,10,8302,146),USE(?DETAIL2),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10500,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(21,52,1427,125),USE(?String40),FONT('Arial',8),TRN
                         STRING('Medical Laboratory Director'),AT(21,156,1469,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7010,42,698,219),USE(?PageCount),FONT('Arial',10),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

GetResults  ROUTINE
  LOOP locNDX = 1 TO RECORDS(Results)
    GET(Results,locNDX)
 CASE RES:Code
 OF 'F317'
    locTestCount += 1
    locF317 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF317{PROP:Fill} = COLOR:Equivocal
      locIndicatorF317 = '>'
    ELSE
      ?PeanutBoxF317{PROP:Fill} = COLOR:Positive
      locIndicatorF317 = '>>'
      
    .
 OF 'T146'
    locTestCount += 1
    locT146 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxT146{PROP:Fill} = COLOR:Equivocal
      locIndicatorT146 = '>'
    ELSE
      ?PeanutBoxT146{PROP:Fill} = COLOR:Positive
      locIndicatorT146 = '>>'
      
    .
 OF 'W006'
    locTestCount += 1
    locW006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxW006{PROP:Fill} = COLOR:Equivocal
      locIndicatorW006 = '>'
    ELSE
      ?PeanutBoxW006{PROP:Fill} = COLOR:Positive
      locIndicatorW006 = '>>'
      
    .
 OF 'G006'
    locTestCount += 1
    locG006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxG006{PROP:Fill} = COLOR:Equivocal
      locIndicatorG006 = '>'
    ELSE
      ?PeanutBoxG006{PROP:Fill} = COLOR:Positive
      locIndicatorG006 = '>>'
      
    .









 OF 'F360'
    locTestCount += 1
    locF360 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF360{PROP:Fill} = COLOR:Equivocal
      locIndicatorF360 = '>'
    ELSE
      ?PeanutBoxF360{PROP:Fill} = COLOR:Positive
      locIndicatorF360 = '>>'
      locScore += 1
    .
 OF 'F359'
    locTestCount += 1
    locF359 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF359{PROP:Fill} = COLOR:Equivocal
      locIndicatorF359 = '>'
    ELSE
      ?PeanutBoxF359{PROP:Fill} = COLOR:Positive
      locIndicatorF359 = '>>'
      locScore += 1
    .
 OF 'F013'
    locTestCount += 1
    locF013 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF013{PROP:Fill} = COLOR:Equivocal
      locIndicatorF013 = '>'
    ELSE
      ?PeanutBoxF013{PROP:Fill} = COLOR:Positive
      locIndicatorF013 = '>>'
      locScore += 1
    .
 OF 'F095'
    locTestCount += 1
    locF095 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF095{PROP:Fill} = COLOR:Equivocal
      locIndicatorF095 = '>'
    ELSE
      ?PeanutBoxF095{PROP:Fill} = COLOR:Positive
      locIndicatorF095 = '>>'
      locScore += 1
    .
 OF 'F020'
    locTestCount += 1
    locF020 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF020{PROP:Fill} = COLOR:Equivocal
      locIndicatorF020 = '>'
    ELSE
      ?PeanutBoxF020{PROP:Fill} = COLOR:Positive
      locIndicatorF020 = '>>'
      locScore += 1
    .
 OF 'F018'
    locTestCount += 1
    locF018 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF018{PROP:Fill} = COLOR:Equivocal
      locIndicatorF018 = '>'
    ELSE
      ?PeanutBoxF018{PROP:Fill} = COLOR:Positive
      locIndicatorF018 = '>>'
      locScore += 1
    .
 OF 'F010'
    locTestCount += 1
    locF010 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF010{PROP:Fill} = COLOR:Equivocal
      locIndicatorF010 = '>'
    ELSE
      ?PeanutBoxF010{PROP:Fill} = COLOR:Positive
      locIndicatorF010 = '>>'
      locScore += 1
    .





 OF 'F202'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF202{PROP:Fill} = COLOR:Equivocal
      locIndicatorF202 = '>'
    ELSE
      ?PeanutBoxF202{PROP:Fill} = COLOR:Positive
      locIndicatorF202 = '>>'
      
    .
 OF 'F103'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF103{PROP:Fill} = COLOR:Equivocal
      locIndicatorF103 = '>'
    ELSE
      ?PeanutBoxF103{PROP:Fill} = COLOR:Positive
      locIndicatorF103 = '>>'
      
    .
 OF 'F017'
    locTestCount += 1
    locF017 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF017{PROP:Fill} = COLOR:Equivocal
      locIndicatorF017 = '>'
    ELSE
      ?PeanutBoxF017{PROP:Fill} = COLOR:Positive
      locIndicatorF017 = '>>'
      
    .
 OF 'F201'
    locTestCount += 1
    locF201 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF201{PROP:Fill} = COLOR:Equivocal
      locIndicatorF201 = '>'
    ELSE
      ?PeanutBoxF201{PROP:Fill} = COLOR:Positive
      locIndicatorF201 = '>>'
      
    .
 OF 'F203'
    locTestCount += 1
    locF203 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF203{PROP:Fill} = COLOR:Equivocal
      locIndicatorF203 = '>'
    ELSE
      ?PeanutBoxF203{PROP:Fill} = COLOR:Positive
      locIndicatorF203 = '>>'
      
    .
 OF 'F372'
    locTestCount += 1
    locF372 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF372{PROP:Fill} = COLOR:Equivocal
      locIndicatorF372 = '>'
    ELSE
      ?PeanutBoxF372{PROP:Fill} = COLOR:Positive
      locIndicatorF372 = '>>'
      
    .
 .
.

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
  IF gloTE <> EQ:Tested THEN RETURN(0).
  DO GetResults
  IF locTestCount < 16 THEN RETURN(0).
  GlobalErrors.SetProcedureName('ResultsPeanut')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ResultsPeanut',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Normals.Close
    Relate:SendOuts.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsPeanut',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
    gloReportTitle = 'Peanut Panel Summary'
    locRisk6 = 'Peanut positive with negative Ara h 1, Ara h 2, and peach results that have positive pollen results are at low risk of true peanut allergy'
    locDisclaimer = 'Laboratory results indicating low risk patients due not preclude the possiblity of the patients experiencing peanut reactions.  (see interpretation comments below)'

    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .
  gloPeanutPanel = TRUE
  SETTARGET(Report)
  locScore = 0
  DO GetResults

 locSpecificActivity = (locF360 / gloTotalEConc) * 100
 IF locSpecificActivity  > 2
   locIndicatorSA = '>>'
   ?PeanutBoxSA{PROP:Fill} = COLOR:Positive
   locScore += 1
 .
  IF locF013 > 14.99
        ?PeanutBoxThreshold{PROP:Fill} = COLOR:Positive
        locThreshold = '>>'
    locScore += 1
 .
  ?BoxScore{PROP:Width} = locScore * 622

! STOP(locTestCount)

  PRINT(RPT:Graph)

   IF locF360 > 0.04 
     PRINT(RPT:Risk1)
   .
   IF locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04 OR locF372 > 0.04
     PRINT(RPT:Risk2)
   .
   IF locF360 > 0.04
     PRINT(RPT:Risk3)
   .
   IF (locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
     PRINT(RPT:Risk4)
   .
   IF (locF013 > 0.04  OR locF360> 0.04  OR locF359> 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
     PRINT(RPT:Risk5)
   .
   IF (locF013> 0.04  ) and (locF359 < 0.05  and locF360 < 0.05   and locF095 < 0.05  ) and (locG006 > 0.04  OR locT146 > 0.04  OR locW006 > 0.04  )
     PRINT(RPT:Risk6)
   .
   PRINT(RPT:Disclaimer)
   PRINT(RPT:PeanutInterp)
   SETTARGET()




  omit('XXXX')
  PRINT(RPT:PeanutInterp)
  PRINT(RPT:Graph)
  PRINT(RPT:Risk1)
  PRINT(RPT:Risk2)
  PRINT(RPT:Risk3)
  PRINT(RPT:Risk4)
  PRINT(RPT:Risk5)
  PRINT(RPT:Risk6)
  PRINT(RPT:Disclaimer)
  PRINT(RPT:PageBreak)
  XXXX
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
VoidPDF PROCEDURE 

Progress:Thermometer BYTE                                  !
locTitlePDF          STRING(7)                             !
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(1000,2000,6500,7000),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,,FONT:regular, |
  CHARSET:ANSI),THOUS
                       HEADER,AT(250,250,8302,3448),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,16,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2082),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-364),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2082),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(gloPatientNotes[1]),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
DETAIL                 DETAIL,AT(-750,250,8292,3448),USE(?Footer)
                         STRING('VOID'),AT(3469,2021),USE(?STRING1),FONT(,48,,FONT:bold)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Open                   PROCEDURE(),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('VoidPDF')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('VoidPDF',ProgressWindow)                   ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
  END
  IF SELF.Opened
    INIMgr.Update('VoidPDF',ProgressWindow)                ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.Open PROCEDURE

  CODE
    locTitlePDF = PAT:INVOICE & 'e' 
    gloReportFileName = 'Z:\ResultsNoEncrypt\' & PAT:Client & '\' & PAT:Invoice & 'e.PDF'
    IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents',locTitlePDF,LONGPATH(gloReportFileName))
      STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
    .
    
    SETTARGET(Report)
    Report{PROPPRINT:Device}=gloPDFPrinter
    Report{PROP:Text} = locTitlePDF
    PRINTER{PROPPRINT:Device} = gloPDFPrinter
  PARENT.Open
    PRINTER{PROPPRINT:Device} = gloPDFPrinter
    Report{PROP:Text} = locTitlePDF
    Report{PROPPRINT:Device}=gloPDFPrinter


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .  
    gloDate = TODAY()
    gloTime = CLOCK()
    
  ReturnValue = PARENT.TakeRecord()
  Report{PROP:Text} = PAT:INVOICE & 'e.PDF' 
  PRINT(RPT:DETAIL)
  SETTARGET()  
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
HotzeResults PROCEDURE 

locPhysician         STRING(40)                            !
locComment           STRING(88)                            !
locPatientNote       STRING(127)                           !
Progress:Thermometer BYTE                                  !
locResultsCount      SHORT                                 !
locASR               CSTRING(1020)                         !
locSummary           BYTE                                  !
locPositive          BYTE(0)                               !
locTotalType         STRING(12)                            !
locPollen            STRING(20)                            !
locHeading           STRING(20)                            !
locFoodHeading       STRING(20)                            !
locAccount           LONG                                  !
locPatientText       STRING(512)                           !
SAV:Sort             STRING(1)                             !
SAV:Type             STRING(4)                             !
SAV:Code             STRING(5)                             !
SAV:Description      STRING(40)                            !
locAge               BYTE                                  !
locScoreGAM          STRING(4)                             !
locImmunoglobulin    STRING(10)                            !
locStatus            STRING(64)                            !
BAR:Padding         BYTE(15)




GRAPH:X      EQUATE(800)
GRAPH:Y      EQUATE(300)
GRAPH:H      EQUATE(400)
BAR:X        ULONG
BAR:Y        ULONG
BAR:W        ULONG
BAR:H        ULONG





locRisk6            STRING(255)
locDisclaimer            STRING(255)
locTestCount             BYTE
locScore                 DECIMAL(5,1)
locThreshold             STRING(24)
locSpecificActivity      DECIMAL(7,4)
locSpecificActivityString      STRING(8)
COLOR:Equivocal      EQUATE(0D2FFD2H)
COLOR:Positive       EQUATE(080FFFFH)

locNDX  SHORT

locIndicatorG006     STRING(12)
locIndicatorW006     STRING(12)
locIndicatorT146     STRING(12)
locIndicatorF317     STRING(12)
locIndicatorF203     STRING(12)
locIndicatorF201     STRING(12)
locIndicatorF017     STRING(12)
locIndicatorF103     STRING(12)
locIndicatorF202     STRING(12)
locIndicatorF010     STRING(12)
locIndicatorF018     STRING(12)
locIndicatorF020     STRING(12)
locIndicatorF095     STRING(12)
locIndicatorF013     STRING(12)
locIndicatorF359     STRING(12)
locIndicatorF360     STRING(12)
locIndicatorSA       STRING(12)
locG006     DECIMAL(5,2)
locW006     DECIMAL(5,2)
locT146     DECIMAL(5,2)
locF317     DECIMAL(5,2)
locF203     DECIMAL(5,2)
locF201     DECIMAL(5,2)
locF017     DECIMAL(5,2)
locF103     DECIMAL(5,2)
locF202     DECIMAL(5,2)
locF010     DECIMAL(5,2)
locF018     DECIMAL(5,2)
locF020     DECIMAL(5,2)
locF095     DECIMAL(5,2)
locF013     DECIMAL(5,2)
locF359     DECIMAL(5,2)
locF360     DECIMAL(5,2)
                    

Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient'),AT(,,288,140),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       STRING(@n_6),AT(132,24),USE(Pat:INVOICE),TRN
                       STRING(@s20),AT(134,34),USE(Pat:LAST),TRN
                       STRING(@s64),AT(66,58),USE(locStatus),FONT(,12,COLOR:Red,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       STRING(@pResults <<#pb),AT(109,84),USE(locResultsCount),TRN
                       STRING('Last Name'),AT(90,34),USE(?String6),TRN
                       STRING('Assession:'),AT(90,24),USE(?String4),TRN
                       PROGRESS,AT(8,128,111,12),USE(Progress:Thermometer),HIDE,RANGE(0,100)
                       STRING(''),AT(2,128,141,10),USE(?Progress:UserString),CENTER,HIDE
                       STRING(''),AT(2,128,141,10),USE(?Progress:PctText),CENTER,HIDE
                       BUTTON('Cancel'),AT(0,126,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE, |
  MSG('Cancel Report'),TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3604,8000,6900),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,12,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2082),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-364),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2082),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(locPatientNote),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
Head                   DETAIL,AT(10,10,8292,312),USE(?DETAIL23:3),PAGEBEFORE(-1)
                         STRING('Hotze Clinic Wellness Testing Results'),AT(760,10,6594,229),USE(?locHeading:3),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
InhalantHead           DETAIL,AT(10,10,8292,396),USE(?DETAIL23)
                         STRING('Increasing counts indicate increasing antibody level'),AT(812,94,6594,229),USE(?STRING4), |
  FONT(,8,,FONT:bold),CENTER
                       END
FoodHead               DETAIL,AT(10,10,8292,240),USE(?DETAIL23:2)
                         STRING('Classes [0]-[6] indicate increasing antibody levels'),AT(646,31,6594,198),USE(?STRING4:3), |
  FONT(,8,,FONT:bold),CENTER
                       END
saveFoodHeading        DETAIL,AT(10,10,8292,562),USE(?DETAIL1)
                         BOX,AT(719,63,2510,250),USE(?BoxFood3:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(979,83,1958,219),USE(locFoodHeading),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(2792,330,2650,219),USE(?Box:FoodDecription),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Description'),AT(2650,361,2600,208),USE(?String:FoodDescription),FONT(,9,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6200,330,896,219),USE(?Box:FoodConc),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Conc'),AT(6200,365,896,208),USE(?String:FoodConc),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5500,330,650,208),USE(?Box:FoodScore),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Class'),AT(5500,361,650,208),USE(?String:FoodClasss),FONT(,9,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(7156,333,542,219),USE(?Box:FoodType),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(7229,365,365,204),USE(?String:FoodType),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
InhalantHeading        DETAIL,AT(10,10,8292,562),USE(?DETAIL1:2)
                         BOX,AT(719,63,2510,250),USE(?Box3:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(979,83,1958,219),USE(locHeading),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(2792,330,2650,219),USE(?Box:Decription),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Description'),AT(2650,361,2600,208),USE(?String:Description),FONT(,9,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5500,330,896,219),USE(?Box:Conc),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Ab Counts'),AT(5500,365,896,208),USE(?String:Conc),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6456,333,542,219),USE(?Box:Type),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(6529,365,365,204),USE(?String:Type),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
FoodHeading            DETAIL,AT(10,10,8292,562),USE(?DETAIL1:3)
                         BOX,AT(719,63,2510,250),USE(?BoxFood3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(979,83,1958,219),USE(locFoodHeading,,?locFoodHeading:2),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(2792,330,2650,219),USE(?Box:FoodDecription:2),COLOR(COLOR:Black),FILL(COLOR:Black), |
  LINEWIDTH(1)
                         STRING('Description'),AT(2650,361,2600,208),USE(?String:FoodDescription:2),FONT(,9,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5500,330,650,208),USE(?Box:FoodScore:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Class'),AT(5500,361,650,208),USE(?String:FoodClasss:2),FONT(,9,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6200,333,542,219),USE(?Box:FoodType:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(6200,365,365,204),USE(?String:FoodType:2),FONT(,9,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
SaveInhalantHeading    DETAIL,AT(10,10,8292,562),USE(?DETAIL1:4)
                         BOX,AT(719,63,2510,250),USE(?Box3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(979,83,1958,219),USE(locHeading,,?locHeading:2),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(2792,330,2650,219),USE(?Box:Decription:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Description'),AT(2650,361,2600,208),USE(?String:Description:2),FONT(,9,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5500,122,650,416),USE(?Box:Score:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Therapeutic'),AT(5500,160,650,208),USE(?String:Treatment:2),FONT(,8,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5500,361,650,208),USE(?String:Classs:2),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6200,333,542,219),USE(?Box:Type:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(6200,365,365,204),USE(?String:Type:2),FONT(,9,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Food                   DETAIL,AT(10,0,8302,250),USE(?DETAIL20)
                         BOX,AT(2792,0,2650,219),USE(?Box:ResultDescription),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2792,31,2650,208),USE(RES:Description),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(5500,0,650,219),USE(?Box5:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s3),AT(5500,31,650,208),USE(RES:Score),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6200,10,542,219),USE(?Box18:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6200,31,365,204),USE(RES:Type,,?RES:Type:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Inhalant               DETAIL,AT(10,0,8302,250),USE(?DETAIL20:2)
                         BOX,AT(2792,0,2650,219),USE(?Box:ResultDescription:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2792,31,2650,208),USE(RES:Description,,?RES:Description:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5500,0,896,219),USE(?Box18),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s7),AT(5500,31,896,208),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6456,10,542,219),USE(?Box18:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6529,31,365,204),USE(RES:Type),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
Elevated               DETAIL,AT(10,0,8302,250),USE(?DETAIL19)
                         BOX,AT(6167,0,896,219),USE(?Box6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,0,479,219),USE(?Box5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,219),USE(?Box4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(7156,0,542,219),USE(?Box18:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Elevated'),AT(1750,31,677,208),USE(?Elevated),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,31,2500,208),USE(RES:Description,,?RES:Description:11),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6323,31,573,208),USE(RES:Conc,,?RES:Conc:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>>'),AT(1375,63),USE(?S81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5729,31,281,208),USE(RES:Score,,?RES:Score:10),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Equivocal              DETAIL,AT(10,10,8302,250),USE(?DETAIL21)
                         BOX,AT(2792,0,2698,219),USE(?Box4:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,0,896,219),USE(?Box6:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,0,479,219),USE(?Box5:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:5),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(7156,10,542,219),USE(?Box18:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equivocal'),AT(1792,31,677,208),USE(?Equivocal:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2865,31,2500,208),USE(RES:Description,,?RES:Description:3),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(6323,31,573,208),USE(RES:Conc,,?RES:Conc:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>'),AT(1458,63),USE(?S81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5729,31,281,208),USE(RES:Score,,?RES:Score:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
SubHeading             DETAIL,AT(10,10,8302,229),USE(?DETAIL22)
                         BOX,AT(6167,10,896,219),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,10,2698,219),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,10,479,219),USE(?Box15),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Class'),AT(5667,31),USE(?S71:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Conc'),AT(6177,31,896,208),USE(?S72:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(3438,21,1438,208),USE(locPollen),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Detail                 DETAIL,AT(0,0,8000,115),USE(?Detail)
                         LINE,AT(42,292,0,1000),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,1000),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(0,1000,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
SumSubHead             DETAIL,AT(10,10,8302,240),USE(?DETAIL24)
                         BOX,AT(5604,10,479,250),USE(?Box5:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Box4:14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,10,542,250),USE(?Box18:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Allergen'),AT(3479,21,1177,208),USE(?RES:Description:7),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,21,396,208),USE(?RES:Score:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Type'),AT(6292,21),USE(?RES:Type:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       END
SElevated              DETAIL,AT(10,10,8302,250),USE(?DETAIL25)
                         BOX,AT(5604,0,479,219),USE(?Box5:7),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,219),USE(?Box4:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6177,0,542,229),USE(?Box18:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6292,31),USE(RES:Type,,?RES:Type:7),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s40),AT(2854,31),USE(RES:Description,,?RES:Description:12),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s3),AT(5698,31),USE(RES:Score,,?RES:Score:5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
SEquivocal             DETAIL,AT(10,10,8302,250),USE(?DETAIL26)
                         BOX,AT(5604,0,479,219),USE(?Box5:9),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,219),USE(?Box4:13),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6177,0,542,219),USE(?Box18:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6281,21,354,208),USE(RES:Type,,?RES:Type:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING(@s40),AT(2833,21),USE(RES:Description,,?RES:Description:13),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s3),AT(5688,21,281,208),USE(RES:Score,,?RES:Score:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
STotalElevated         DETAIL,AT(0,0,8260,250),USE(?DETAIL27)
                         BOX,AT(1510,0,2698,250),USE(?Box14:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(2156,31,1438,167),USE(locTotalType,,?locTotalType:2),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(4198,0,2698,250),USE(?Box14:2),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('Elevated for Age'),AT(4677,31,1698,167),USE(?STRING1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER(6),TRN
                       END
STotalDepressed        DETAIL,AT(0,0,8260,250),USE(?DETAIL28)
                         BOX,AT(1510,0,2698,250),USE(?Box14:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(2156,42,1438,167),USE(locTotalType),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(4198,0,2698,250),USE(?Box14:5),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         STRING('Depressed for Age'),AT(4688,42,1698,167),USE(?STRING2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(00D2FFD2h),TRN
                       END
ASR                    DETAIL,AT(10,10,8302,833),USE(?DETAIL29),FONT(,8)
                         STRING('This test was developed and its performance characteristics determined by Aller' & |
  'metrix. It has not been cleared nor approved by the FDA.'),AT(698,10,7219,177),USE(?S198), |
  TRN
                         STRING('The laboratory is regulated under CLIA as qualified to perform high-complexity ' & |
  'testing.  This test is used for clinical purposes.'),AT(698,167,6875,177),USE(?S198:3), |
  TRN
                         STRING('It should not be regarded as investigational or for research.'),AT(698,323,6875,177), |
  USE(?S198:4),TRN
                         STRING('� *-HD (High Definition)�  indicates the reagent was prepared by fortifying ext' & |
  'ract with purified natural allergen protein.'),AT(740,635,7219,208),USE(?S198:2),TRN
                       END
PatSubHead             DETAIL,AT(10,0,8302,219),USE(?DETAIL31)
                         BOX,AT(2792,0,2698,219),USE(?Box4:16),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Allergen'),AT(3469,31,1177,188),USE(?RES:Description:17),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
PElevated              DETAIL,AT(10,0,8302,250),USE(?DETAIL32)
                         BOX,AT(2792,0,2698,219),USE(?Box4:17),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2958,31,2354,208),USE(RES:Description,,?D:8),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Text                   DETAIL,AT(10,10,8302,6000),USE(?DETAIL33),PAGEAFTER(-1)
                         TEXT,AT(31,21,7958,5948),USE(DOC:Body),FONT('Arial',,,,CHARSET:ANSI),RTF(TEXT:Field),LEFT, |
  BOXED,RESIZE
                       END
PeanutInterp           DETAIL,AT(10,10,8292,3396),USE(?DETAIL1:5),FONT(,,,FONT:bold)
                         BOX,AT(1000,104,2823,250),USE(?PeanutBox1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,354,2823,250),USE(?PeanutBoxF360),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,604,2823,250),USE(?PeanutBoxSA),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,854,2823,250),USE(?PeanutBoxF359),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1104,2823,250),USE(?PeanutBoxF013),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1354,2823,250),USE(?PeanutBoxThreshold),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1604,2823,250),USE(?PeanutBoxF095),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1854,2823,250),USE(?PeanutBoxF020),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2104,2823,250),USE(?PeanutBoxF018),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,104,2010,250),USE(?PeanutBox21),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,354,2010,250),USE(?PeanutBoxF202),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,604,2010,250),USE(?PeanutBoxF103),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,854,2010,250),USE(?PeanutBoxF017),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1104,2010,250),USE(?PeanutBoxF201),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1354,2010,250),USE(?PeanutBoxF203),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1604,2010,250),USE(?PeanutBoxF317),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1854,2010,250),USE(?PeanutBoxF010),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2604,2010,250),USE(?PeanutBoxT146),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2854,2010,250),USE(?PeanutBoxW006),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,3104,2010,250),USE(?PeanutBoxG006),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@S8),AT(3854,635,802),USE(locSpecificActivityString),TRN
                         STRING('True Peanut Risk Factors (IgE)'),AT(1104,130,2573,229),USE(?PeanutText1),FONT(,,COLOR:White, |
  ,CHARSET:ANSI),CENTER,TRN
                         STRING('1.  Ara h 2'),AT(1104,375,2281,198),USE(?PeanutText2),TRN
                         STRING('2.  Ara h 2  specific activity =>2% *'),AT(1104,625,2573,198),USE(?PeanutText3),TRN
                         STRING('3.  Ara h 1'),AT(1104,875,2281,198),USE(?PeanutText4),TRN
                         STRING('4.  Peanut-HD'),AT(1104,1125,2281,198),USE(?PeanutText21),TRN
                         STRING('5.  Peanut-HD =>15 kU/L '),AT(1104,1375,2281,198),USE(?PeanutText22),TRN
                         STRING('6.  Peach (food)'),AT(1104,1625,2281,198),USE(?PeanutText23),TRN
                         STRING('7.  Almond (Ara h 2 cross-reactive) '),AT(1104,1875,2573,198),USE(?PeanutText24),TRN
                         STRING('8.  Brazil Nut (Ara h 2 cross-reactive)'),AT(1104,2125,2601,198),USE(?PeanutText25), |
  TRN
                         BOX,AT(5000,2354,2010,250),USE(?PeanutBox21:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Tree Nuts (IgE)'),AT(5042,125,2000,229),USE(?PeanutText27),FONT(,,COLOR:White),CENTER, |
  TRN
                         STRING('Cashew'),AT(5104,375,1208,198),USE(?PeanutText28),TRN
                         STRING('Chestnut'),AT(5104,625,1208,198),USE(?PeanutText29),TRN
                         STRING(@s2),AT(583,625,344,208),USE(locIndicatorSA),RIGHT,TRN
                         STRING('Hazelnut /Filbert'),AT(5104,875,1208,198),USE(?PeanutText30),TRN
                         STRING('Pecan'),AT(5104,1125,1208,198),USE(?PeanutText31),TRN
                         STRING('Pistachio'),AT(5104,1375,1208,198),USE(?PeanutText32),TRN
                         STRING('Walnut, English'),AT(5104,1625,1208,198),USE(?PeanutText33),TRN
                         STRING('Sesame Seed'),AT(5104,1875,1208,198),USE(?PeanutText34),TRN
                         STRING('Cross Reacting Pollen (IgE)'),AT(5031,2375,2000,198),USE(?PeanutText27:2),FONT(,,COLOR:White), |
  CENTER,TRN
                         STRING('Birch, River (tree)'),AT(5104,2624,1208,198),USE(?PeanutText41),TRN
                         STRING('Mugwort (weed)'),AT(5104,2874,1208,198),USE(?PeanutText42),TRN
                         STRING('Timothy (grass)'),AT(5104,3154,1208,198),USE(?PeanutText43),TRN
                         STRING(@s2),AT(583,375,344,208),USE(locIndicatorF360,,?locIndicatorF360:2),RIGHT,TRN
                         STRING(@s2),AT(583,875,344,208),USE(locIndicatorF359),RIGHT,TRN
                         STRING(@s2),AT(583,1125,344,208),USE(locIndicatorF013),RIGHT,TRN
                         STRING(@s24),AT(583,1375,344,208),USE(locThreshold),RIGHT,TRN
                         STRING(@s2),AT(583,1635,344,208),USE(locIndicatorF095),RIGHT,TRN
                         STRING(@s2),AT(583,1875,344,208),USE(locIndicatorF020),RIGHT,TRN
                         STRING(@s2),AT(583,2104,344,208),USE(locIndicatorF018),RIGHT,TRN
                         STRING(@s2),AT(4583,1875,344,208),USE(locIndicatorF010),RIGHT,TRN
                         STRING(@s2),AT(4583,375,344,208),USE(locIndicatorF202),RIGHT,TRN
                         STRING(@s2),AT(4583,625,344,208),USE(locIndicatorF103),RIGHT,TRN
                         STRING(@s2),AT(4583,875,344,208),USE(locIndicatorF017),RIGHT,TRN
                         STRING(@s2),AT(4583,1125,344,208),USE(locIndicatorF201),RIGHT,TRN
                         STRING(@s2),AT(4573,1375,354,208),USE(locIndicatorF203),RIGHT,TRN
                         STRING(@s2),AT(4583,1625,344,208),USE(locIndicatorF317),RIGHT,TRN
                         STRING(@s2),AT(4583,2625,344,208),USE(locIndicatorT146),RIGHT,TRN
                         STRING(@s2),AT(4583,2875,344,208),USE(locIndicatorW006),RIGHT,TRN
                         STRING(@s2),AT(4583,3125,344,208),USE(locIndicatorG006),RIGHT,TRN
                         STRING('*-Specific activity (%)   = specific IgE Ara h 2 (kU/L) / Total IgE (kU/L)'),AT(729, |
  2437),USE(?PeanutFootNote:1),FONT(,8,,FONT:regular),TRN
                         STRING('( > indicates equivocal,    >> indicates elevated level )'),AT(2156,-100),USE(?PeanutFootNote:2), |
  FONT(,9,,FONT:regular),TRN
                       END
Graph                  DETAIL,AT(104,0,7823,1167),USE(?Detail:Graph),FONT(,10)
                         STRING('Laboratory Assessment of Risk for Clinical Reaction to Peanut'),AT(860,0,,281),USE(?String78), |
  FONT(,14,,FONT:bold),TRN
                         STRING(@n1),AT(6667,302,375),USE(locScore),FONT(,24,,FONT:bold),RIGHT
                         STRING(' / 8'),AT(6990,302,833,427),USE(?String97),FONT(,24,,FONT:bold),LEFT,TRN
                         IMAGE('Gradient.jpg'),AT(800,300,6000,400),USE(?GraphBar)
                         BOX,AT(800,300,6000,400),USE(?GraphBorder),COLOR(COLOR:Black),LINEWIDTH(10)
                         BOX,AT(800,300,5740,400),USE(?CoverGraph),COLOR(COLOR:White),FILL(COLOR:White),LINEWIDTH(1)
                         STRING('0 {17}1 {16}2 {16}3 {16}4 {16}5 {16}6 {16}7 {16}8'),AT(760,700,,167),USE(?String77), |
  FONT(,,,FONT:bold),LEFT,TRN
                         STRING('Number of Risk Factors'),AT(875,880,5562,500),USE(?STRING3),FONT(,,,FONT:bold),CENTER
                       END
Risk1                  DETAIL,AT(104,0,5802,250),USE(?Detail:Risk1)
                         STRING('Risk of true peanut allergy increases with elevated Ara h 2 sIgE concentration'),AT(550, |
  31),USE(?StringRisk1),TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk2                  DETAIL,AT(104,0,7885,250),USE(?Detail:Risk2)
                         STRING('Up to 50% of peanut allergic individuals develop clinical tree nut allergy'),AT(550, |
  0),USE(?StringRisk2),TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk3                  DETAIL,AT(104,0,,250),USE(?Detail:Risk3)
                         STRING('Risk of peanut anaphylaxis increases at peanut specific IgE levels above 15kU/L'), |
  AT(550,0),USE(?StringRisk3),TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk4                  DETAIL,AT(104,0,,250),USE(?Detail:Risk4)
                         STRING('Clinical peach allergy increases risk of true peanut allergy'),AT(550,0),USE(?StringRisk4), |
  TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk5                  DETAIL,AT(104,0,,250),USE(?Detail:Risk5)
                         STRING('True peanut allergic patients with positive tree nut allergy are at increased r' & |
  'isk of sesame seed allergy'),AT(550,0),USE(?StringRisk5),TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk6                  DETAIL,AT(104,0,,396),USE(?Detail:Risk6)
                         TEXT,AT(550,0,5000,354),USE(locRisk6),TRN
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Disclaimer             DETAIL,AT(104,0,7833,800),USE(?Detail:Disclaimer)
                         TEXT,AT(550,0,6240,500),USE(locDisclaimer),FONT(,,,FONT:bold,CHARSET:ANSI)
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
PageBreak              DETAIL,AT(10,10,8302,146),USE(?DETAIL34),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10500,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(21,52,1427,125),USE(?String40),FONT('Arial',8,,FONT:regular), |
  TRN
                         TEXT,AT(1667,0,5281,563),USE(locASR),FONT('Vrinda',7,,FONT:regular),BOXED
                         STRING('Medical Laboratory Director'),AT(21,156,1469,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7260,188,698,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
GetResults          ROUTINE!
  LOOP locNDX = 1 TO RECORDS(Results)
    GET(Results,locNDX)
    IF RES:Type <> 'IgE' THEN CYCLE.
 CASE RES:Code
 OF 'F317'
    locTestCount += 1
    locF317 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF317{PROP:Fill} = COLOR:Equivocal
      locIndicatorF317 = '>'
    ELSE
      ?PeanutBoxF317{PROP:Fill} = COLOR:Positive
      locIndicatorF317 = '>>'
      
    .
 OF 'T146'
    locTestCount += 1
    locT146 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxT146{PROP:Fill} = COLOR:Equivocal
      locIndicatorT146 = '>'
    ELSE
      ?PeanutBoxT146{PROP:Fill} = COLOR:Positive
      locIndicatorT146 = '>>'
    .
 OF 'W006'
    locTestCount += 1
    locW006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxW006{PROP:Fill} = COLOR:Equivocal
      locIndicatorW006 = '>'
    ELSE
      ?PeanutBoxW006{PROP:Fill} = COLOR:Positive
      locIndicatorW006 = '>>'
      
    .
 OF 'G006'
    locTestCount += 1
    locG006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxG006{PROP:Fill} = COLOR:Equivocal
      locIndicatorG006 = '>'
    ELSE
      ?PeanutBoxG006{PROP:Fill} = COLOR:Positive
      locIndicatorG006 = '>>'
      
    .

 OF 'F360'
    locTestCount += 1
    locF360 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF360{PROP:Fill} = COLOR:Equivocal
      locIndicatorF360 = '>'
    ELSE
      ?PeanutBoxF360{PROP:Fill} = COLOR:Positive
      locIndicatorF360 = '>>'
      locScore += 1
    .
 OF 'F359'
    locTestCount += 1
    locF359 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF359{PROP:Fill} = COLOR:Equivocal
      locIndicatorF359 = '>'
    ELSE
      ?PeanutBoxF359{PROP:Fill} = COLOR:Positive
      locIndicatorF359 = '>>'
      locScore += 1
    .
 OF 'F013'
    locTestCount += 1
    locF013 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF013{PROP:Fill} = COLOR:Equivocal
      locIndicatorF013 = '>'
    ELSE
      ?PeanutBoxF013{PROP:Fill} = COLOR:Positive
      locIndicatorF013 = '>>'
      locScore += 1
    .
 OF 'F095'
    locTestCount += 1
    locF095 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF095{PROP:Fill} = COLOR:Equivocal
      locIndicatorF095 = '>'
    ELSE
      ?PeanutBoxF095{PROP:Fill} = COLOR:Positive
      locIndicatorF095 = '>>'
      locScore += 1
    .
 OF 'F020'
    locTestCount += 1
    locF020 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF020{PROP:Fill} = COLOR:Equivocal
      locIndicatorF020 = '>'
    ELSE
      ?PeanutBoxF020{PROP:Fill} = COLOR:Positive
      locIndicatorF020 = '>>'
      locScore += 1
    .
 OF 'F018'
    locTestCount += 1
    locF018 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF018{PROP:Fill} = COLOR:Equivocal
      locIndicatorF018 = '>'
    ELSE
      ?PeanutBoxF018{PROP:Fill} = COLOR:Positive
      locIndicatorF018 = '>>'
      locScore += 1
    .
        
        
        
        
        
 OF 'F010'
    locTestCount += 1
    locF010 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF010{PROP:Fill} = COLOR:Equivocal
      locIndicatorF010 = '>'
    ELSE
      ?PeanutBoxF010{PROP:Fill} = COLOR:Positive
      locIndicatorF010 = '>>'
    .
 OF 'F202'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF202{PROP:Fill} = COLOR:Equivocal
      locIndicatorF202 = '>'
    ELSE
      ?PeanutBoxF202{PROP:Fill} = COLOR:Positive
      locIndicatorF202 = '>>'
      
    .
 OF 'F103'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF103{PROP:Fill} = COLOR:Equivocal
      locIndicatorF103 = '>'
    ELSE
      ?PeanutBoxF103{PROP:Fill} = COLOR:Positive
      locIndicatorF103 = '>>'
      
    .
 OF 'F017'
    locTestCount += 1
    locF017 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF017{PROP:Fill} = COLOR:Equivocal
      locIndicatorF017 = '>'
    ELSE
      ?PeanutBoxF017{PROP:Fill} = COLOR:Positive
      locIndicatorF017 = '>>'
      
    .
 OF 'F201'
    locTestCount += 1
    locF201 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF201{PROP:Fill} = COLOR:Equivocal
      locIndicatorF201 = '>'
    ELSE
      ?PeanutBoxF201{PROP:Fill} = COLOR:Positive
      locIndicatorF201 = '>>'
      
    .
 OF 'F203'
    locTestCount += 1
    locF203 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF203{PROP:Fill} = COLOR:Equivocal
      locIndicatorF203 = '>'
    ELSE
      ?PeanutBoxF203{PROP:Fill} = COLOR:Positive
      locIndicatorF203 = '>>'
      
    .
 .
.

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('HotzeResults')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:INVOICE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:GAM.Open                                          ! File GAM used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('HotzeResults',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE,gloPatient)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  SET(Normals,1)
  NEXT(Normals)
  locAccount = CLI:Number
  locSummary = 0
  locASR = 'This test was developed and its performance characteristics determined by Allermetrix. It has not been cleared nor approved by the FDA.  The laboratory is regulated under CLIA as qualified to perform high-complexity testing.  This test is used for clinical purposes.  It should not be regarded as investigational or for research.'
  
    Report{PROPPRINT:Device}=gloPDFPrinter
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .
        
    locPatientText = 'Laboratory results need to be correlated to your history and clinical symptoms prior to any diagnosis.  A positive test may, or, may not indicate an allergic condition and only your physician can make that determination.  The avoidance information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if you have any concerns, or, specific questions regarding the attached information.'
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .        
  
        
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .        
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:GAM.Close
    Relate:Normals.Close
  END
  IF SELF.Opened
    INIMgr.Update('HotzeResults',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  IF gloSendout THEN gloPatient = Pat:INVOICE; ResultsSendout.  
  
  gloFood = FALSE
  ! DO GetResults    
  SETTARGET()
    SETTARGET(Report)
    locPhysician = SUB(gloPatientNotes[1],1,40)
    locComment = SUB(gloPatientNotes[1],41,88)
    locPatientNote = CLIP(locPhysician) & ' ' & CLIP(locComment)    
     SAV:Sort = 0 
    IF gloInhalant 
      gloReportTitle = 'INHALANT RESULTS'
    ELSE
      gloReportTitle = 'FOOD RESULTS' 
      locFoodHeading = 'Food/Food Components'
      gloFood = TRUE
    .
    PRINT(RPT:Head)
    IF gloInhalant 
      PRINT(RPT:InhalantHead)  
      
    .
    SORT(Results,RES:Sort,RES:Description)
    locStatus = 'Printing Results'
    DISPLAY(?locStatus)
    gloPollen = 1
    gloMold = 1
    gloDust = 1
      locPollen = 'Not Initialized'
      locResultsCount = RECORDS(Results)
      SAV:Sort = 9      ! Initalize to unused value
      SAV:Code = 'x'    ! Initalize to unused value
      SAV:Sort = '+'
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        DISPLAY(?locResultsCount)
        locResultsCount -=1
        CASE RES:Status
        OF 'A'
        OROF 'Q'
        OROF 'B'
        OROF 'D'
          CYCLE
        .
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'Dust/Dust Components'
            PRINT(RPT:InhalantHeading)
          OF 2
            locHeading = 'Molds'
            PRINT(RPT:InhalantHeading)
          OF 3
            locHeading = 'Pollens'
            PRINT(RPT:InhalantHeading)
          OF 4
            IF locInhalant 
              PRINT(RPT:PageBreak)
            .
              gloReportTitle = 'FOOD RESULTS'   
              locFoodHeading = 'Food/Food Components'
              PRINT(RPT:FoodHead)
              PRINT(RPT:FoodHeading)
          .
          
          SAV:Sort = RES:Sort
        .
        if RES:Sort = 4
          PRINT(RPT:Food)
        ELSE
          PRINT(RPT:Inhalant)
        .
      .
    locStatus = 'Printing Patient Info'
    DISPLAY(?locStatus)
    gloReportTitle = 'Patient Info'
    locASR = ''
    IF locInhalant
      DOC:Number = DOC:Dust
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('DUST ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF locInhalant
      DOC:Number = DOC:Mold
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('MOLD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
      DOC:Number = DOC:Mold + DOC:Page2
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF locInhalant
      DOC:Number = DOC:Pollen
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('POLLEN: ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloFood
      DOC:Number = DOC:Food
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('FOOD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    PUT(Patient)
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)

    SETTARGET()











 OMIT('XXXX')
  PRINT(RPT:Head)
  PRINT(RPT:InhalantHead)
  PRINT(RPT:FoodHead)
  PRINT(RPT:saveFoodHeading)
  PRINT(RPT:InhalantHeading)
  PRINT(RPT:FoodHeading)
  PRINT(RPT:SaveInhalantHeading)
  PRINT(RPT:Food)
  PRINT(RPT:Inhalant)
  PRINT(RPT:Elevated)
  PRINT(RPT:Equivocal)
  PRINT(RPT:SubHeading)
  PRINT(RPT:Detail)
  PRINT(RPT:SumSubHead)
  PRINT(RPT:SElevated)
  PRINT(RPT:SEquivocal)
  PRINT(RPT:STotalElevated)
  PRINT(RPT:STotalDepressed)
  PRINT(RPT:ASR)
  PRINT(RPT:PatSubHead)
  PRINT(RPT:PElevated)
  PRINT(RPT:Text)
  PRINT(RPT:PeanutInterp)
  PRINT(RPT:Graph)
  PRINT(RPT:Risk1)
  PRINT(RPT:Risk2)
  PRINT(RPT:Risk3)
  PRINT(RPT:Risk4)
  PRINT(RPT:Risk5)
  PRINT(RPT:Risk6)
  PRINT(RPT:Disclaimer)
  PRINT(RPT:PageBreak)
  XXXX
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
BuildQueuesHotze     PROCEDURE  (prmPatient)               ! Declare Procedure
ReduceAmount         DECIMAL(7,2)                          !
locDetectedTotalE    BYTE                                  !
locType              BYTE                                  !
locMark              BYTE                                  !
GEEFEE               DECIMAL(7,2)                          !
Dupamount            DECIMAL(7,2)                          !
FollowUp             BYTE                                  !
Level   BYTE
SAV:Panel   STRING(9)
SAV:CODE    STRING(9)
SAV:DESCRIPTION STRING(40)
locSTypes STRING('IgGIgAIgM')
locSType  STRING(3),DIM(3),OVER(locSTypes)

QueNS       QUEUE,PRE(QNS)
Type            STRING(9)
Code            STRING(9)
!Description     STRING(30)
Fee             DECIMAL(9,2)
!Note            STRING(12)
            .
Window WINDOW('Collecting Patient Data'),AT(,,142,59),CENTER,TIMER(1),GRAY,DOUBLE
     END
FilesOpened     BYTE(0)

  CODE
  gloSendout = FALSE
  gloVirus = FALSE
  DO  OpenFiles
  SET(Normals)
  NEXT(Normals)
  FREE(Results)
  gloDATE = TODAY()
  gloTIME = CLOCK()

  gloTotal = 0

  locFoods = FALSE
  locInhalant = FALSE


  gloTotalEConc = 0
  gloTotalEScore = ''
  locDetectedTotalE = FALSE
  gloE = 0
  gloG = 0
  gloG4 = 0
  gloTE = 0
  gloTG = 0
  gloTA = 0
  gloTM = 0
  CLEAR(gloGAM[])
  CLEAR(gloIGG[])
  FollowUp = FALSE
  IF INRANGE(CLI:NUMBER,800000,888887)
    gloAllercare = TRUE
  ELSE
    gloAllercare = FALSE
  .
  GAM:Age = PAT:Age
  GAM:AgeType = Pat:AGE_TYPE
  IF GAM:Age > 18
    GAM:Age = 18
  .
  SHARE(Test)
  CLEAR(TST:Record)
  TST:INVOICE = prmPatient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  IF ERRORCODE() THEN STOP('SET TST:' & ERROR()).
  LOOP UNTIL EOF(Test)                          !Main LOOP - TEST
    NEXT(TEST)
    IF TST:INVOICE <> prmPatient THEN BREAK.
    IF UPPER(TST:Status) = 'X' THEN CYCLE.  
    IF gloTestCodeStartsWith2 = 'S0'
      gloSendout = TRUE
    .
    IF INRANGE(TST:TYPE,7,8) 
      gloVirus = TRUE 
    .
    IF SUB(TST:Code,1,3) = '100'
      gloTotal = 1
      gloTE = EQ:Tested
      gloTotalEConc = TST:Count
      CYCLE  ! Exclude from Results Queue
    .
    CLEAR(Results)
    
    IF TST:Count = 0 AND gloTestCodeStartsWith1 <> 'S'
      IF TST:Type = Type:IgE
        RES:Conc = NOR:OffScaleLowE
      ELSIF TST:Type = Type:IgG
        RES:Conc = NOR:OffScaleLowG
      ELSE
        RES:Conc = NOR:OffScaleLowG4
      .

    ELSE
      RES:Conc = FORMAT(ROUND(TST:Count,1),@N7)
    .
    RES:Status = TST:Status
    RES:CODE = TST:CODE
    RES:Score = TST:Score
    IF RES:Score = '0'
      RES:Summary = 0
    ELSE
      RES:Summary = 1
    .
    locType = TST:Type
    IF INRANGE(TST:TYPE,1,3)
      RES:TYPE = gloTypeDescription[TST:TYPE]
    ELSE
      CYCLE
    .
    DO GetDescription
    
    DO AssignSort 
    ADD(Results)
  .
  IF locDetectedTotalE AND ~gloTE
    gloTE = EQ:OffScale
  .
  CLOSE(Window)
  CLOSE(Test)
  DO CloseFiles




GetDescription ROUTINE
  RST:NUMBER = RES:CODE
  GET(RAST,RST:ORDER_KEY)
  IF ERRORCODE()
    RES:DESCRIPTION = RES:CODE & ': ' & ERROR()
  ELSE
    IF gloLanguage = 'E'
      RES:DESCRIPTION = RST:Description
    ELSE
      RES:DESCRIPTION = RST:sDescription
    .
  .
  IF INRANGE(RST:FeeLevel,1,5)
    RES:Fee = gloFees[locType,RST:FeeLevel]
  .
  RES:FeeLevel = RST:FeeLevel
  EXECUTE locType
  gloE = 1
  gloG = 1
  gloG4 = 1
  .


AssignSort  ROUTINE
  RES:Category = gloTestCodeStartsWith1
  CASE RES:Category
  OF 'F'
    RES:SORT = 4  ! Food
    gloFood = TRUE
  OF 'M'
    RES:SORT = 2
    locInhalant = TRUE

  OF 'D'
  OROF 'E'
  OROF 'H'
    RES:SORT = 1 ! Environmental
    RES:Category = 'D'
    gloInhalant = TRUE
      
  OF 'I'
    CASE gloTestCodeStartsWith4
    OF 'I206'
    OROF 'I006'
      RES:SORT = 1
      RES:Category = 'D'
      gloInhalant = TRUE
    .
  OF 'G'
  OROF 'T'
  OROF 'W'
    RES:SORT = 3 ! Pollen
    RES:Category = 'P'
    gloInhalant = TRUE
  .

!--------------------------------------
OpenFiles  ROUTINE
  Access:Client.Open                                       ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Client.UseFile                                    ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Patient.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Patient.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.Open                                         ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.UseFile                                      ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Cli_panl.Open                                     ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Cli_panl.UseFile                                  ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Panels.Open                                       ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Panels.UseFile                                    ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Normals.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Normals.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:Client.Close
     Access:Patient.Close
     Access:Rast.Close
     Access:Cli_panl.Close
     Access:Panels.Close
     Access:Normals.Close
     FilesOpened = False
  END
!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
cmlReport PROCEDURE 

locPatientNote       STRING(127)                           !
cmlComment           STRING(20)                            !
locComment           STRING(88)                            !
locPhysician         STRING(40)                            !
Progress:Thermometer BYTE                                  !
locClientPhone       STRING(12)                            !
locClientFax         STRING(12)                            !
locResultsCount      SHORT                                 !
locASR               CSTRING(1020)                         !
locSummary           BYTE                                  !
locPositive          BYTE(0)                               !
locTotalType         STRING(12)                            !
locPollen            STRING(20)                            !
locHeading           STRING(20)                            !
locAccount           LONG                                  !
locPatientText       STRING(512)                           !
SAV:Sort             STRING(1)                             !
SAV:Type             STRING(4)                             !
SAV:Code             STRING(5)                             !
SAV:Description      STRING(40)                            !
locAge               BYTE                                  !
locScoreGAM          STRING(4)                             !
locImmunoglobulin    STRING(10)                            !
locStatus            STRING(64)                            !
BAR:Padding         BYTE(15)




GRAPH:X      EQUATE(800)
GRAPH:Y      EQUATE(300)
GRAPH:H      EQUATE(400)
BAR:X        ULONG
BAR:Y        ULONG
BAR:W        ULONG
BAR:H        ULONG


locComment  STRING(64)


locRisk6            STRING(255)
locDisclaimer            STRING(255)
locTestCount             BYTE
locScore                 DECIMAL(5,1)
locThreshold             STRING(24)
locSpecificActivity      DECIMAL(7,4)
locSpecificActivityString      STRING(8)
COLOR:Equivocal      EQUATE(0D2FFD2H)
COLOR:Positive       EQUATE(080FFFFH)

locNDX  SHORT

locIndicatorG006     STRING(12)
locIndicatorW006     STRING(12)
locIndicatorT146     STRING(12)
locIndicatorF317     STRING(12)
locIndicatorF203     STRING(12)
locIndicatorF201     STRING(12)
locIndicatorF017     STRING(12)
locIndicatorF103     STRING(12)
locIndicatorF202     STRING(12)
locIndicatorF010     STRING(12)
locIndicatorF018     STRING(12)
locIndicatorF020     STRING(12)
locIndicatorF095     STRING(12)
locIndicatorF013     STRING(12)
locIndicatorF359     STRING(12)
locIndicatorF360     STRING(12)
locIndicatorF372     STRING(12)
locIndicatorSA       STRING(12)
locG006     DECIMAL(5,2)
locW006     DECIMAL(5,2)
locT146     DECIMAL(5,2)
locF317     DECIMAL(5,2)
locF203     DECIMAL(5,2)
locF201     DECIMAL(5,2)
locF017     DECIMAL(5,2)
locF103     DECIMAL(5,2)
locF202     DECIMAL(5,2)
locF010     DECIMAL(5,2)
locF018     DECIMAL(5,2)
locF020     DECIMAL(5,2)
locF095     DECIMAL(5,2)
locF013     DECIMAL(5,2)
locF359     DECIMAL(5,2)
locF360     DECIMAL(5,2)
locF372     DECIMAL(5,2)
                    
locDescription STRING(40)
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient'),AT(,,288,140),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       STRING(@n_6),AT(132,24),USE(Pat:INVOICE),TRN
                       STRING(@s20),AT(134,34),USE(Pat:LAST),TRN
                       STRING(@s64),AT(66,58),USE(locStatus),FONT(,12,COLOR:Red,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       STRING(@pResults <<#pb),AT(109,84),USE(locResultsCount),TRN
                       STRING('Last Name'),AT(90,34),USE(?String6),TRN
                       STRING('Assession:'),AT(90,24),USE(?String4),TRN
                       PROGRESS,AT(8,128,111,12),USE(Progress:Thermometer),HIDE,RANGE(0,100)
                       STRING(''),AT(2,128,141,10),USE(?Progress:UserString),CENTER,HIDE
                       STRING(''),AT(2,128,141,10),USE(?Progress:PctText),CENTER,HIDE
                       BUTTON('Cancel'),AT(0,126,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE, |
  MSG('Cancel Report'),TIP('Cancel Report')
                     END

Report               REPORT('cmlResults'),AT(200,2270,8000,6700),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(200,200,8292,1990),USE(?HEADER1)
                         IMAGE('amcml.JPG'),AT(52,52,1885,854),USE(?IMAGE2)
                         STRING('Suite 510'),AT(323,969,1615,167),USE(?S41),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(323,1135,1615,167),USE(?S42),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('877-992-4100'),AT(323,1302,1615,167),USE(?S43),FONT('Arial',8,,FONT:regular),TRN
                         STRING(@s1),AT(6542,333,167,167),USE(Pat:SEX)
                         STRING('Client Number:'),AT(4427,1406,,187),USE(?S34),FONT('Arial',8),TRN
                         STRING('Collection Date:'),AT(3844,844,1312,187),USE(?S35),FONT('Arial',8),RIGHT,TRN
                         STRING('Received Date:'),AT(3844,1031,1312,187),USE(?S36),FONT('Arial',8,,FONT:regular),RIGHT, |
  TRN
                         STRING('Printed Date Time:'),AT(3844,1219,1312,187),USE(?S37),FONT('Arial',8,,FONT:regular), |
  RIGHT,TRN
                         STRING('Patient (Last, First):'),AT(3844,-10,1313,188),USE(?S29),FONT('Arial',8),RIGHT,TRN
                         STRING('DOB Age Gender:'),AT(3844,333,1312,188),USE(?S32),FONT('Arial',8),RIGHT,TRN
                         STRING('Lab ID:'),AT(3844,510,1312,188),USE(?S30),FONT('Arial',8),RIGHT,TRN
                         STRING(@s40),AT(5219,-10,2812,167),USE(gloPatName),LEFT
                         STRING(@d2b),AT(5219,333,677,167),USE(Pat:DOB),LEFT,TRN
                         STRING(@s15),AT(5219,167,1156,156),USE(Pat:CLIENT_ID),LEFT
                         STRING(@S10),AT(5219,844,833,156),USE(gloPATCollection),LEFT
                         STRING(@n3),AT(6010,333,302,167),USE(Pat:AGE),RIGHT
                         STRING(@n_6),AT(5219,510,552,156),USE(Pat:INVOICE),LEFT
                         STRING(@s1),AT(6312,333,156,167),USE(Pat:AGE_TYPE),LEFT
                         STRING(@D2),AT(5219,1219,740,146),USE(gloDate),LEFT
                         STRING('Client Identifier:'),AT(4333,167,823,187),USE(?S93),FONT('Arial',8),RIGHT,TRN
                         STRING(@d2),AT(5219,1031,740,156),USE(Pat:DATE),LEFT
                         STRING(@N_6),AT(5219,1406,573,156),USE(Pat:CLIENT),LEFT,TRN
                         STRING(@T3),AT(6010,1219,594,156),USE(gloTime),LEFT
                         STRING(@s40),AT(2000,0,2052,177),USE(gloClientName),FONT(,8,,FONT:regular),LEFT,TRN
                         STRING(@s40),AT(2000,150,2052,177),USE(gloAddress1),FONT(,8,,FONT:regular),LEFT,TRN
                         STRING(@s40),AT(2000,300,2052,177),USE(gloAddress2),FONT(,8,,FONT:regular),LEFT,TRN
                         STRING(@s40),AT(2000,450,2052,177),USE(gloAddress3),FONT(,8,,FONT:regular),LEFT,TRN
                         STRING('Phone: '),AT(2000,600,385,180),USE(?S44),FONT('Arial',8,,FONT:regular),TRN
                         STRING(@S20),AT(2406,600),USE(CLI:PHONE),FONT('Arial',8,,FONT:regular)
                         STRING(@S20),AT(2406,750),USE(CLI:FAX),FONT('Arial',8,,FONT:regular)
                         STRING('Fax:     '),AT(2000,750,385,180),USE(?S45),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Comment:'),AT(365,1650),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,1650,7021,208),USE(locPatientNote),TRN
                         STRING(@S127),AT(896,1800,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('400 Sugartree Lane'),AT(312,792,1615),USE(?STRING6),FONT('Arial',8,,FONT:regular), |
  LEFT
                         LINE,AT(0,2010,8000,0),USE(?BottomLine)
                         STRING('Billing ID'),AT(4740,675),USE(?StringBillingID),FONT(,8,,FONT:regular,CHARSET:DEFAULT)
                         STRING(@s32),AT(5219,687),USE(CLM:ClientBillingID),FONT(,8,,,CHARSET:DEFAULT),LEFT
                       END
CML                    DETAIL,AT(10,0,8292,175),USE(?DETAIL20:2)
                         STRING(@s6),AT(550,0,2500,175),USE(RES:Code,,?RES:Description:7),FONT(,,,,CHARSET:ANSI),LEFT, |
  TRN
                         STRING(@s40),AT(1150,0,2500,175),USE(RES:Description),FONT(,,,,CHARSET:ANSI),LEFT,TRN
                         STRING(@s7),AT(4417,0,573,175),USE(RES:Conc,,?RES:Conc:4),FONT(,10,,,CHARSET:ANSI),RIGHT,TRN
                         STRING(@s64),AT(5500,0,2490,175),USE(cmlComment),FONT(,10,,,CHARSET:ANSI),LEFT,TRN
                         STRING(@s8),AT(3698,0,656,175),USE(RES:Score),FONT('Times',10,,,CHARSET:ANSI),CENTER,TRN
                         LINE,AT(-20,180,8000,10),USE(?LINE1:2)
                       END
FDA                    DETAIL,AT(0,0,8292,667),USE(?FDA)
                         STRING('the FDA. The laboratory is regulated under CLIA as qualified to perform highcom' & |
  'plexity testing. This test is used for clinical purposes. '),AT(-10,145),USE(?STRING1)
                         STRING('This test was developed and its performance characteristics determined by Aller' & |
  'metrix. It has not been cleared nor approved by '),AT(-10,-10),USE(?STRING2)
                         STRING('It should not be regarded as investigational or for research.'),AT(-10,333,4219),USE(?STRING3)
                       END
HeadE                  DETAIL,AT(10,0,8292,290),USE(?HeadE)
                         STRING('Specific/Total IgE Results'),AT(760,0,6594,271),USE(?headE2),FONT(,16,COLOR:Black, |
  FONT:bold),CENTER,TRN
                       END
HeadG                  DETAIL,AT(10,10,8302,300),USE(?HeadG)
                         STRING('Specific IgG Results'),AT(760,21,6594,260),USE(?headG2),FONT(,16,COLOR:Black,FONT:bold), |
  CENTER,TRN
                       END
HeadG4                 DETAIL,AT(10,10,8302,300),USE(?HeadG4)
                         STRING('Specific IgG4 Results'),AT(708,-10,6594,344),USE(?headG42),FONT(,16,COLOR:Black,FONT:bold), |
  CENTER,TRN
                       END
G4Interp               DETAIL,AT(10,100,8302,2198),USE(?DETAIL3)
                         BOX,AT(4865,354,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,354,969,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,354,2698,219),USE(?Box4:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,552,969,219),USE(?BoxEinterpConc1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,552,479,219),USE(?BoxEinterpClass1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,552,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,750,2698,219),USE(?BoxEinterpDesc2:4),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4865,750,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,750,969,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,948,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,948,969,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,948,2698,1219),USE(?BoxEinterpDesc4:3),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4865,1156,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1156,969,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1354,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1354,969,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1552,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1552,969,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1750,479,219),USE(?BoxEinterpClass7:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1750,969,219),USE(?BoxEinterpConc7:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1948,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1948,969,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('VI'),AT(4958,1990,313,135),USE(?SEinterpClass8:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,1979,948,135),USE(NOR:G46),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(2250,771,2365,208),USE(?SEinterp2:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/I'),AT(4958,781,313,135),USE(?SEinterpClass2:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,781,948,135),USE(NOR:G4E),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('I'),AT(4979,979,313,135),USE(?SEinterpClass3:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,979,948,135),USE(NOR:G41),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2240,1406,2365,208),USE(?SEinterp4:2),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('II'),AT(4979,1177,313,135),USE(?SEinterpClass4:4),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,1177,948,135),USE(NOR:G42),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('III'),AT(4958,1396,313,135),USE(?SEinterpClass5:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,1375,948,135),USE(NOR:G43),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('IV'),AT(4958,1583,313,135),USE(?SEinterpClass6:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,1594,948,135),USE(NOR:G44),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('V'),AT(4958,1781,313,135),USE(?SEinterpClass7:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,1792,948,135),USE(NOR:G45),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(2271,573,2365,208),USE(?SEinterp1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5437,594,948,135),USE(NOR:G40),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(4958,594,313,135),USE(?SEinterpClass1:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgG4 Normal Range'),AT(2073,135,4302,229),USE(?locHeading:5),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black)
                         STRING('Interpretation'),AT(2281,365,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(4896,365,417,208),USE(?RES:Score:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5437,375,885,208),USE(?S72:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
GInterp                DETAIL,AT(10,100,8302,2250),USE(?DETAIL4)
                         BOX,AT(2073,958,2698,1208),USE(?BoxEinterpDesc4:4),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4865,344,479,219),USE(?Box5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,344,969,219),USE(?Box16:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,344,2698,219),USE(?Box4:11),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,542,969,219),USE(?BoxEinterpConc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,542,479,219),USE(?BoxEinterpClass1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,542,2698,219),USE(?BoxEinterpDesc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2073,740,2698,219),USE(?BoxEinterpDesc2:3),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4865,740,479,219),USE(?BoxEinterpClass2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,740,969,219),USE(?BoxEinterpConc2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,937,479,219),USE(?BoxEinterpClass3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,937,969,219),USE(?BoxEinterpConc3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1135,479,219),USE(?BoxEinterpClass4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,1135,969,219),USE(?BoxEinterpConc4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1344,479,219),USE(?BoxEinterpClass5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,1344,969,219),USE(?BoxEinterpConc5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1542,479,219),USE(?BoxEinterpClass6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,1542,969,219),USE(?BoxEinterpConc6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1740,479,219),USE(?BoxEinterpClass7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5417,1740,969,219),USE(?BoxEinterpConc7:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4865,1937,479,219),USE(?BoxEinterpClass8:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5406,1937,969,219),USE(?BoxEinterpConc8:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('VI'),AT(4937,1958,313,208),USE(?SEinterpClass8),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,1969,1031,156),USE(NOR:G6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(2240,750,2365,208),USE(?SEinterp2:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/I'),AT(4937,760,313,208),USE(?SEinterpClass2),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,771,1031,156),USE(NOR:GE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('I'),AT(4937,958,313,208),USE(?SEinterpClass3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,969,1031,156),USE(NOR:G1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2240,1365,2365,208),USE(?SEinterp4),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('II'),AT(4937,1167,313,208),USE(?SEinterpClass4),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,1177,1031,156),USE(NOR:G2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('III'),AT(4937,1365,313,208),USE(?SEinterpClass5),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,1375,1031,156),USE(NOR:G3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('IV'),AT(4937,1562,313,208),USE(?SEinterpClass6),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,1573,1031,156),USE(NOR:G4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('V'),AT(4937,1760,313,208),USE(?SEinterpClass7),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,1760,1031,156),USE(NOR:G5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(2240,562,2365,208),USE(?SEinterp1:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5375,573,1031,156),USE(NOR:G0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(4937,562,313,208),USE(?SEinterpClass1),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgG Normal Range'),AT(2073,156,4302,219),USE(?locHeading:8),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black)
                         STRING('Interpretation'),AT(2302,375,2240,146),USE(?RES:Description:16),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(4917,375,417,146),USE(?RES:Score:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5448,365,896,167),USE(?S72:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
EInterp                DETAIL,AT(10,100,8302,2229),USE(?DETAIL5)
                         BOX,AT(2115,885,2698,1229),USE(?BoxEinterpDesc4:2),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4906,292,479,219),USE(?Box5:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,292,969,208),USE(?Box16:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,292,2698,219),USE(?Box4:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,687,969,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,490,479,219),USE(?BoxEinterpClass1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,490,2698,219),USE(?BoxEinterpDesc1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,687,2698,219),USE(?BoxEinterpDesc2:2),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(4906,687,479,219),USE(?BoxEinterpClass2:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,490,969,219),USE(?BoxEinterpConc2:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,885,479,219),USE(?BoxEinterpClass3:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,885,969,219),USE(?BoxEinterpConc3:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,1094,479,219),USE(?BoxEinterpClass4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,1094,969,219),USE(?BoxEinterpConc4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,1292,479,219),USE(?BoxEinterpClass5:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,1292,969,219),USE(?BoxEinterpConc5:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,1490,479,219),USE(?BoxEinterpClass6:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,1490,969,219),USE(?BoxEinterpConc6:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,1687,479,219),USE(?BoxEinterpClass7:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,1687,969,219),USE(?BoxEinterpConc7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4906,1885,479,219),USE(?BoxEinterpClass8:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5448,1885,969,219),USE(?BoxEinterpConc8:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('VI'),AT(4979,1927,313,156),USE(?SEinterpClass8:2),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,1906,1031,156),USE(NOR:E6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(2281,729,2365,177),USE(?SEinterp2:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/I'),AT(4979,729,313,156),USE(?SEinterpClass2:4),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,708,1031,156),USE(NOR:EE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('I'),AT(4979,917,313,156),USE(?SEinterpClass3:4),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,906,1031,156),USE(NOR:E1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2323,1292,2365,208),USE(?SEinterp4:3),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('II'),AT(4979,1104,313,156),USE(?SEinterpClass4:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,1104,1031,156),USE(NOR:E2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('III'),AT(4979,1333,313,156),USE(?SEinterpClass5:3),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,1312,1031,156),USE(NOR:E3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('IV'),AT(4979,1531,313,156),USE(?SEinterpClass6:2),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,1510,1031,156),USE(NOR:E4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('V'),AT(4979,1729,313,156),USE(?SEinterpClass7:2),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,1708,1031,156),USE(NOR:E5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(2281,521,2365,177),USE(?SEinterp1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(5417,510,1031,156),USE(NOR:E0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(4979,542,313,156),USE(?SEinterpClass1:4),FONT('Times',10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgE Normal Range'),AT(2115,125,4302,219),USE(?locHeading:6),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black)
                         STRING('Interpretation'),AT(2406,333,2240,177),USE(?RES:Description:2),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(4927,333,417,177),USE(?RES:Score:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (kU/L)'),AT(5479,333,906,177),USE(?S72:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
TEInterp               DETAIL,AT(10,10,8302,1625),USE(?DETAIL6)
                         BOX,AT(4885,281,1000,219),USE(?HeadingBoxE),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,281,1000,219),USE(?Box16:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,281,2698,219),USE(?Box4:10),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,479,2698,219),USE(?BoxAge1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,677,2698,219),USE(?BoxAge2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,875,2698,219),USE(?BoxAge3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,1083,2698,219),USE(?BoxAge4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2115,1281,2698,219),USE(?BoxAge5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,479,1000,219),USE(?BoxThigh1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4885,479,1000,219),USE(?BoxMedian1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,677,1000,219),USE(?BoxThigh12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4885,677,1000,219),USE(?BoxMedian2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,875,1000,219),USE(?BoxThigh3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4885,875,1000,219),USE(?BoxMedian3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,1083,1000,219),USE(?BoxThigh4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4885,1083,1000,219),USE(?BoxMedian4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5927,1281,1000,219),USE(?BoxThigh5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4885,1281,1000,219),USE(?BoxMedian5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('0-1'),AT(2292,510,2365,156),USE(?SrtingAge1),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1-2'),AT(2292,698,2365,156),USE(?SAge2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2-3'),AT(2292,896,2365,156),USE(?SAge3),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3-9'),AT(2292,1094,2365,156),USE(?SAge4),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Adult'),AT(2292,1302,2365,156),USE(?SAge5),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('10.1'),AT(5198,719,448,156),USE(?SEinterpClass2:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('49'),AT(6042,698,771,156),USE(?SEinterpConc2:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('12.9'),AT(5198,906,448,156),USE(?SEinterpClass3:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('45'),AT(6042,896,771,156),USE(?SEinterpConc3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('14.4'),AT(5198,1094,448,156),USE(?SEinterpClass4:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('52'),AT(6042,1104,771,156),USE(?SEinterpConc4:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('20.4'),AT(5198,1312,448,156),USE(?SEinterpClass5:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('87'),AT(6042,1312,771,156),USE(?SEinterpConc5:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('29'),AT(6042,510,771,156),USE(?SEinterpConc1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('6.6'),AT(5198,521,448,156),USE(?SEinterpClass1:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Total IgE Normal Range'),AT(2115,31,4812,219),USE(?locHeading:7),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black)
                         STRING('Age'),AT(2323,312,2240,208),USE(?RES:Description:10),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Median (IU/mL)'),AT(4885,312,1010,208),USE(?RES:Score:9),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('95% (IU/mL)'),AT(6042,312,813,208),USE(?S72:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
columnHead             DETAIL,AT(0,0,8000,229),USE(?DETAIL1)
                         STRING(' {25}Test {49}Class        Conc        Comment'),AT(-10,-10,8000,208),USE(?STRING4), |
  FONT(,12,COLOR:White,FONT:bold),COLOR(COLOR:Black)
                       END
SubHeading             DETAIL,AT(10,10,8302,229),USE(?DETAIL22)
                         BOX,AT(250,10,8290,219),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Class'),AT(3698,31),USE(?S71:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Conc'),AT(4410,31,896,208),USE(?S72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(260,21,3200,208),USE(locPollen),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         LINE,AT(250,229,8094,10),USE(?LINE1)
                       END
ASR                    DETAIL,AT(10,10,8302,833),USE(?DETAIL29),FONT(,8)
                         STRING('Gluten IgA test was developed and its performance characteristics determined by' & |
  ' Allermetrix.   It has not been cleared nor approved by the FDA. '),AT(698,10,7219,177), |
  USE(?S198),TRN
                         STRING('The laboratory is regulated under CLIA as qualified to perform high-complexity testing. '), |
  AT(698,167,6875,177),USE(?S198:3),TRN
                         STRING('� *-HD (High Definition)�  indicates the reagent was prepared by fortifying ext' & |
  'ract with purified natural allergen protein.'),AT(646,406,7219,208),USE(?S198:2),TRN
                       END
PageBreak              DETAIL,AT(0,0,0,0),USE(?DETAIL34),PAGEAFTER(-1)
                       END
Disclaimer             DETAIL,AT(104,0,7833,800),USE(?Detail:Disclaimer)
                         TEXT,AT(550,0,6240,500),USE(locDisclaimer),FONT(,,,FONT:bold,CHARSET:ANSI)
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
                       FOOTER,AT(250,9000,7948,1948),USE(?Footer)
                         IMAGE('cmlInterpretations.jpg'),AT(0,0,7948,1276),USE(?ImageFooter)
                         STRING('Gary A. Kitos, Ph.D., H.C.L.D., C.C.'),AT(31,1333,1906,146),USE(?String40),FONT('Arial', |
  8,,FONT:regular),TRN
                         TEXT,AT(2240,1333,5052,563),USE(locASR),FONT('Vrinda',8,,FONT:regular),BOXED
                         STRING('Medical Laboratory Director'),AT(31,1500,1583,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7354,1500,2156,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('cmlReport')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:INVOICE
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Claims.Open                                       ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:GAM.Open                                          ! File GAM used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cmlReport',ProgressWindow)                 ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE,gloPatient)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  SET(Normals,1)
  NEXT(Normals)
  locAccount = CLI:Number
  locSummary = 0
   
    Report{PROPPRINT:Device}=gloPDFPrinter
         
    locPatientText = 'Laboratory results need to be correlated to your history and clinical symptoms prior to any diagnosis.  A positive test may, or, may not indicate an allergic condition and only your physician can make that determination.  The avoidance information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if you have any concerns, or, specific questions regarding the attached information.'
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    locClientPhone = FORMAT(CLI:PHONE,@P###-###-####P)
    locClientFax = FORMAT(CLI:FAX,@P###-###-####P)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .        
    CLM:Patient = Pat:INVOICE
    GET(Claims,CLM:OrderKey)
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Claims.Close
    Relate:Client.Close
    Relate:Docs.Close
    Relate:GAM.Close
    Relate:Normals.Close
  END
  IF SELF.Opened
    INIMgr.Update('cmlReport',ProgressWindow)              ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  SETTARGET(Report)
    IF CLI:NUMBER = 500258 THEN UNHIDE(?StringBillingID,?CLM:ClientBillingID).
    
    locPhysician = SUB(gloPatientNotes[1],1,40)
    locComment = SUB(gloPatientNotes[1],41,88)
    locPatientNote = CLIP(locPhysician) & ' ' & CLIP(locComment)
    
  locASR = 'This test was developed and its performance characteristics determined by Allermetrix.  It has not been cleared nor approved by the FDA.  The laboratory is regulated under CLIA as qualified to perform high-complexity testing.  This test is used for clinical purposes.  It should not be regarded as investigational or for research.' 
  SORT(Results,RES:Sort,RES:Category,RES:Description)
  !SORT(Results,RES:Sort,RES:Description)
  IF gloTE or gloE
    PRINT(RPT:HeadE)
    PRINT(RPT:columnHead)
  .
  IF gloTE = EQ:Tested
    TRange[1,1] = 6.6
    TRange[1,2] = 29
  
    TRange[2,1] = 10.1
    TRange[2,2] = 49
  
    TRange[3,1] = 12.9
    TRange[3,2] = 45
  
    TRange[4,1] = 14.4
    TRange[4,2] = 52
  
    TRange[5,1] = 20.4
    TRange[5,2] = 87
  
    IF Pat:AGE_TYPE = 'M'
      locAge = 1
    ELSIF Pat:AGE < 3
      locAge = 2
    ELSIF Pat:AGE < 4
      locAge = 3
    ELSIF Pat:AGE < 10
      locAge = 4
    ELSE
      locAge = 5
    .
      IF INRANGE(gloTotalEConc,0,TRange[locAge,2])
        IF gloTotalEConc < .2
          gloTotalEScore = '<0.20'
        ELSE
          gloTotalEScore = FORMAT(gloTotalEConc,@n8.2)
        .
        locComment  = 'Normal'
      ELSE
        gloTotalEScore = FORMAT(gloTotalEConc,@n8.2)
        locComment  = 'Elevated for Age'
      .
  
     
  
        IF gloTE = EQ:Tested
          RES:Description = 'Total IgE'
          RES:Conc = gloTotalEConc
          RES:Score = ''
          RES:Code = '100'
          PRINT(RPT:CML)
          locComment = ''
        .
  .
      IF gloE  
        LOOP I# = 1 TO RECORDS(Results)
          GET(Results,I#)
          IF RES:Type <> 'IgE' THEN CYCLE.
          DISPLAY(?locResultsCount)
          locResultsCount -=1
          CASE RES:Status
          OF 'A'
          OROF 'Q'
          OROF 'B'
          OROF 'D'
            CYCLE
          .
         
         locDescription = CLIP(RES:Code) & '    ' & CLIP(RES:Description)
         PRINT(RPT:CML)
        .
  
        
        IF gloG OR gloG4
          PRINT(RPT:PageBreak)
        .
        locASR = ''
      .      
      IF gloG
        PRINT(RPT:HeadG)
        PRINT(RPT:columnHead)
        LOOP I# = 1 TO RECORDS(Results)
          GET(Results,I#)
          IF RES:Type <> 'IgG' THEN CYCLE.
          DISPLAY(?locResultsCount)
          locResultsCount -=1
          CASE RES:Status
          OF 'A'
          OROF 'Q'
          OROF 'B'
          OROF 'D'
            CYCLE
          .
          CASE  RES:Sort
          OF 1
            IF RES:Summary
              gloPollen = 1
            .
          OF 2
            IF RES:Summary
              IF RES:Category = 'M'
                gloMold = 1
              ELSE
                gloDust = 1
              .
            .
          OF 3
            IF RES:Summary
              gloFood = 1
            .
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Allergens'
          .
          IF SAV:Sort <> RES:Sort
            locPollen = ''
            CASE RES:Sort
            OF 1
              locHeading = 'Pollen'
            OF 2
              locHeading = 'Environmental'
            OF 3
              locHeading = 'Food'
              locPollen = 'Allergens'
            OF 4
              locHeading = 'Other Allergens'
              locPollen = 'Allergens'
            ELSE
              locHeading = 'ERROR Sort Order = ' & res:SORT
           
            .
         !   PRINT(RPT:Heading)
            IF RES:Sort > 2   ! polens handeled below
            !  PRINT(RPT:SubHeading)
            .
    
            SAV:Sort = RES:Sort
          .
          IF (RES:Sort = '1' OR RES:Sort = '2') AND RES:Category <> SAV:Code   ! Pollen Categories G,T,W get subHeader
            CASE RES:Category
            OF 'G'
              locPollen = 'Grasses'
            OF 'T'
              locPollen = 'Trees'
            OF 'W'
              locPollen = 'Weeds'
            OF 'D'
              locPollen = 'Dust Components'
            OF 'E'
              locPollen = 'Epidermals'
            OF 'M'
              locPollen = 'Mold'
            OF 'C'         
              locPollen = 'Chemicals & Drugs'
            .
         !   PRINT(RPT:SubHeading)
            SAV:Code = RES:Category
          .
          locDescription = CLIP(RES:Code) & '    ' & CLIP(RES:Description)
          PRINT(RPT:CML)
          
        .
        IF gloG4
          PRINT(RPT:PageBreak)
          
        .
        locASR = ''
      .
      IF gloG4
        PRINT(RPT:HeadG4)
        PRINT(RPT:columnHead)
        LOOP I# = 1 TO RECORDS(Results)
          GET(Results,I#)
          IF RES:Type <> 'IgG4' THEN CYCLE.
          DISPLAY(?locResultsCount)
          locResultsCount -=1
          CASE RES:Status
          OF 'A'
          OROF 'Q'
          OROF 'B'
          OROF 'D'
            CYCLE
          .
          CASE  RES:Sort
          OF 1
            IF RES:Summary
              gloPollen = 1
            .
          OF 2
            IF RES:Summary
              IF RES:Category = 'M'
                gloMold = 1
              ELSE
                gloDust = 1
              .
            .
          OF 3
            IF RES:Summary
              gloFood = 1
            .
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Allergens'
          .
          IF SAV:Sort <> RES:Sort
            locPollen = ''
            CASE RES:Sort
            OF 1
              locHeading = 'Pollen'
            OF 2
              locHeading = 'Environmental'
            OF 3
              locHeading = 'Food'
              locPollen = 'Allergens'
            OF 4
              locHeading = 'Other Allergens'
              locPollen = 'Allergens'
            ELSE
              locHeading = 'ERROR Sort Order = ' & res:SORT
           
            .
        !   PRINT(RPT:Heading)
            IF RES:Sort > 2   ! polens handeled below
        !      PRINT(RPT:SubHeading)
            .
    
            SAV:Sort = RES:Sort
          .
          IF (RES:Sort = '1' OR RES:Sort = '2') AND RES:Category <> SAV:Code   ! Pollen Categories G,T,W get subHeader
            CASE RES:Category
            OF 'G'
              locPollen = 'Grasses'
            OF 'T'
              locPollen = 'Trees'
            OF 'W'
              locPollen = 'Weeds'
            OF 'D'
              locPollen = 'Dust Components'
            OF 'E'
              locPollen = 'Epidermals'
            OF 'M'
              locPollen = 'Mold'
            OF 'C'         
              locPollen = 'Chemicals & Drugs'
            .
         !   PRINT(RPT:SubHeading)
            SAV:Code = RES:Category
          .
          locDescription = CLIP(RES:Code) & '    ' & CLIP(RES:Description)
          PRINT(RPT:CML)
  
        .
      .
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    OMIT('XXXX')
    
    
  IF gloTE = EQ:Tested AND locTestCount > 15  
    
   SETTARGET(Report)
   gloReportTitle = 'Peanut Panel Summary'
   locRisk6 = 'Peanut positive with negative Ara h 1, Ara h 2, Ara h 6, and peach results that have positive pollen results are at low risk of true peanut allergy'
   locDisclaimer = 'Laboratory results indicating a low number of risk factors do not preclude the possibility of the patient experiencing a reaction to peanuts'
   gloPeanutPanel = TRUE
   SETTARGET(Report)
        
   IF locF360 > 0.04
     locSpecificActivity = (locF360 / gloTotalEConc) * 100
     IF locSpecificActivity < .1
       locSpecificActivityString = '<0.1%'      
     ELSE
       locSpecificActivityString = LEFT(FORMAT(locSpecificActivity,@N7.1) & '%')
     .
   .    
   IF locSpecificActivity  > 2
     locIndicatorSA = '>>'
     ?PeanutBoxSA{PROP:Fill} = COLOR:Positive
     locScore += 1
   .
    IF locF013 > 14.99
      ?PeanutBoxThreshold{PROP:Fill} = COLOR:Positive
      locThreshold = '>>'
      locScore += 1
    .
    ?GraphBorder{PROP:Xpos}   = GRAPH:X 
    ?GraphBorder{PROP:Ypos}   = GRAPH:Y 
    ?GraphBorder{PROP:Width}  = gloGraphWidth 
    ?GraphBorder{PROP:Height} = GRAPH:H 
    BAR:X = GRAPH:X + BAR:Padding
    BAR:Y = GRAPH:Y + BAR:Padding
    BAR:W = gloGraphWidth - (BAR:Padding * 2)
    BAR:H = GRAPH:H - (BAR:Padding * 2)
    ?GraphBar{PROP:Xpos} = BAR:X 
    ?GraphBar{PROP:Ypos} = BAR:Y 
    ?GraphBar{PROP:Width}  = BAR:W 
    ?GraphBar{PROP:Height} = BAR:H 
    IF locScore = 9
      ?CoverGraph{PROP:Hide} = TRUE     
    ELSE
      ?CoverGraph{PROP:Width}  = ((9 - locScore) * gloGraphGrid)- 21
    .    
    
    ?CoverGraph{PROP:Xpos}   = (BAR:X + (locScore  * gloGraphGrid)) 
    ?CoverGraph{PROP:Ypos}   = BAR:Y  - 7
    ?CoverGraph{PROP:Height} = BAR:H + 14 
  
    PRINT(RPT:Graph)
      IF locF360 > 0.04  OR locF359 > 0.04  OR locF372 > 0.04
       PRINT(RPT:Risk7)
     .
  
     IF locF360 > 0.04 
       PRINT(RPT:Risk1)
     .
     IF locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04  OR locF372 > 0.04
       PRINT(RPT:Risk2)
     .
     IF locF360 > 14.99
       PRINT(RPT:Risk3)
     .
  !       IF (locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
     IF locF095 > 0.04            
       PRINT(RPT:Risk4)
     .
     IF (locF013 > 0.04  OR locF360> 0.04  OR locF359> 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
       PRINT(RPT:Risk5)
     .
     IF (locF013> 0.04  ) and (locF359 < 0.05  and locF360 < 0.05   and locF095 < 0.05  ) and (locG006 > 0.04  OR locT146 > 0.04  OR locW006 > 0.04  )
       PRINT(RPT:Risk6)
     .
     PRINT(RPT:Disclaimer)
     PRINT(RPT:PeanutInterp)
     SETTARGET()
   .       
 

      PRINT(RPT:SumHead)
      IF gloTotalSummary
        PRINT(RPT:HeaderTotal)
        IF gloTE = EQ:Elevated
          locTotalType = 'Total IgE'
          PRINT(RPT:STotalElevated)
        .
        IF gloTG = EQ:Elevated
          locTotalType = 'Total IgG'
          PRINT(RPT:STotalElevated)
        .
        IF gloTG = EQ:Depressed
          locTotalType = 'Total IgG'
          PRINT(RPT:STotalDepressed)
        .
        IF gloTA = EQ:Elevated
          locTotalType = 'Total IgA'
          PRINT(RPT:STotalElevated)
        .
        IF gloTA = EQ:Depressed
          locTotalType = 'Total IgA'
          PRINT(RPT:STotalDepressed)
        .
        IF gloTM = EQ:Elevated
          locTotalType = 'Total IgM'
          PRINT(RPT:STotalElevated)
        .
        IF gloTM = EQ:Depressed
          locTotalType = 'Total IgM'
          PRINT(RPT:STotalDepressed)
        .
        gloTotalSummary = FALSE
        locPositive = TRUE
      .
      
      SAV:Sort = '-'
      
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        locPositive = TRUE
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'Pollen'
          OF 2
            locHeading = 'Environmental'

            locPollen = 'Elevated Allergens'
          OF 3
            locHeading = 'Food'
            locPollen = 'Elevated Allergens'
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Elevated Allergens'
          ELSE
            locHeading = 'ERROR: Sort Order = ' & RES:Sort
          .
       !   PRINT(RPT:Heading)
       !   PRINT(RPT:SumSubHead)
          SAV:Sort = RES:Sort
        .
        
        IF INRANGE(RES:Score,'1','6')
      !    PRINT(RPT:SElevated)
        ELSE
      !    PRINT(RPT:SEquivocal)
        .
      .
    .
    IF ~locPositive THEN PRINT(RPT:NoAbnormal).
    PRINT(RPT:PageBreak)
    locStatus = 'Printing Interpretations'
    DISPLAY(?locStatus)
    SETFONT(?Footer,'Vrinda',8,,FONT:regular,)
    locASR = 'This test was developed and its performance characteristics determined by Allermetrix. It has not been cleared nor approved by the FDA.  The laboratory is regulated under CLIA as qualified to perform high-complexity testing.  This test is used for clinical purposes.  It should not be regarded as investigational or for research.<13,10>' & |
    'An "-HD*" High Definition (HD) designation indicates the reagent was prepared by fortifying extract with purified natural allergen protein.'
    gloReportTitle = 'Interpretation'
   !IF gloE THEN PRINT(RPT:EInterp).
   !IF gloG THEN PRINT(RPT:GInterp).
   ! IF gloG4 THEN PRINT(RPT:G4Interp).
   ! IF gloTE THEN PRINT(RPT:TEInterp).
   ! IF gloTG THEN PRINT(RPT:TGInterp).
   ! IF gloTA THEN PRINT(RPT:TAInterp).
   ! IF gloTM THEN PRINT(RPT:TMInterp).
    !PRINT(RPT:PageBreak)
    locASR = ''



! ___________________________________________________________________

    gloReportTitle = 'Results'

    
    locStatus = 'Printing Results'
    DISPLAY(?locStatus)






    IF gloTotal
      PRINT(RPT:HeaderTotal)
      gloTotal = 0
    .

    IF ~gloTE
      IF gloTG OR gloTA OR gloTM  THEN PRINT(RPT:HeaderGAMnoE).
    .
    IF gloTG OR gloTA OR gloTM  THEN PRINT(RPT:HeaderGAM).
    IF gloTG
      RES:Description = 'Total IgG'
      locScoreGAM = gloTotalGScore
      GAM:Type = 4
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GAM:AgeType = Pat:AGE_TYPE
      GET(GAM,GAM:OrderKey)
      IF ERRORCODE() THEN STOP('GAM: ' & ERROR()).
      IF gloTG = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTG = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
    IF gloTA
      RES:Description = 'Total IgA'
      locScoreGAM = gloTotalAScore
      GAM:Type = 5
      GAM:AgeType = Pat:AGE_TYPE
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GET(GAM,GAM:OrderKey)
      IF gloTA = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTA = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
    IF gloTM
      RES:Description = 'Total IgM'
      locScoreGAM = gloTotalMScore
      GAM:Type = 6
      GAM:AgeType = Pat:AGE_Type
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GET(GAM,GAM:OrderKey)
      IF gloTM = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTM = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
      locPollen = 'Not Initialized'
      locResultsCount = RECORDS(Results)
      SAV:Sort = 9      ! Initalize to unused value
      SAV:Code = 'x'    ! Initalize to unused value
      SAV:Sort = '+'
    
    
    XXXX
    
    
  OMIT('XXXX')    

    IF locSummary
      SORT(Results,RES:Sort,RES:Description)
      PRINT(RPT:PageBreak)
      Report{PROP:NextPageNo} = 1
      locPatientText = 'Laboratory results need to be correlated to your history and clinical symptoms prior to any diagnosis.  A positive test may, or, may not indicate an allergic condition and only your physician can make that determination.  The avoidance information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if you have any concerns, or, specific questions regarding the attached information.'
      gloReportTitle = 'Patient Summary'
      PRINT(RPT:PatientInfo)
      SAV:Code = 'x'
      SAV:Sort = 9
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        IF RES:Description = SAV:Description THEN CYCLE.
        IF SAV:Sort <> RES:Sort
          CASE RES:Sort
          OF 1
            locHeading = 'Pollen'
            locPollen = ''
          OF 2
            locHeading = 'Environmental'
            locPollen = 'Elevated Allergens'
          OF 3
            locHeading = 'Food'
            locPollen = 'Elevated Allergens'
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Elevated Allergens'
          .
          PRINT(RPT:Heading)
          PRINT(RPT:PatSubHead)
          SAV:Sort = RES:Sort
          
        .
        PRINT(RPT:PElevated)
        SAV:Description = RES:Description
    . .



    locStatus = 'Printing Patient Info'
    DISPLAY(?locStatus)





    gloReportTitle = 'Patient Info'
    IF gloPollen
      DOC:Number = DOC:Pollen
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('POLLEN: ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloDust
      DOC:Number = DOC:Dust
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('DUST ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloMold
      DOC:Number = DOC:Mold
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('MOLD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
      DOC:Number = DOC:Mold + DOC:Page2
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloFood
      DOC:Number = DOC:Food
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('FOOD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    PUT(Patient)
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)

    SETTARGET()











  PRINT(RPT:CML)
  PRINT(RPT:FDA)
  PRINT(RPT:HeadE)
  PRINT(RPT:HeadG)
  PRINT(RPT:HeadG4)
  PRINT(RPT:G4Interp)
  PRINT(RPT:GInterp)
  PRINT(RPT:EInterp)
  PRINT(RPT:TEInterp)
  PRINT(RPT:columnHead)
  PRINT(RPT:SubHeading)
  PRINT(RPT:ASR)
  PRINT(RPT:PageBreak)
  PRINT(RPT:Disclaimer)
  XXXX
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
FaxRequest PROCEDURE (prmRequest)

locClientID          STRING(16)                            !
locNotice            STRING(600)                           !
locLineNumber        BYTE                                  !
locPatient           STRING(32)                            !
locClient            LONG                                  !
locAssession         LONG                                  !
locDOB               STRING(9)                             !
locDrawnDate         STRING(9)                             !
Progress:Thermometer BYTE                                  !
locSenderPhoneNumber STRING(32)                            !
locMessage           STRING(84)                            !
locRecipientPhoneNumber STRING(32)                         !
locSenderFaxNumber   STRING(32)                            !
locrecipientFaxNumber STRING(32)                           !
locSender            STRING(32)                            !
locRecipient         STRING(32)                            !
locSubject           STRING(32)                            !
locPageRange         USHORT                                !
locDate              LONG                                  !
locFooter            STRING(576)                           !
locRecipentCompany   STRING(32)                            !
locDisclaimer        STRING(2048)                          !
locFaxBody           STRING(4096)                          !
Process:View         VIEW(Patient)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:INVOICE)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Patient Report'),AT(0,250,8500,10500),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10, |
  COLOR:Black,FONT:regular),THOUS
HEADER                 DETAIL,AT(0,0,8000,4719),USE(?Header)
                         IMAGE('am.JPG'),AT(2625,-10,2500,820),USE(?Image1)
                         BOX,AT(740,781,6667,510),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Single Page Facsimile Transmittal '),AT(823,875,6406,271),USE(?String1),FONT(,12,, |
  FONT:bold),CENTER,TRN
                         BOX,AT(740,1354,6667,448),USE(?Box2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient'),AT(823,1375,708,167),USE(?StringRecipient:2),FONT(,8),TRN
                         STRING('Sender'),AT(4229,1375),USE(?StringSender),FONT(,8),TRN
                         LINE,AT(729,1531,6646,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,1604,2740,177),USE(locRecipient),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(4229,1604,2740,177),USE(locSender),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,1823,6667,448),USE(?Box3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Company'),AT(823,1833,1563,167),USE(?StringRecipient),FONT(,8),TRN
                         STRING('*** Please fax to 615-599-4648 or e-mail to info@allermetrix.com ***'),AT(823,3708, |
  6781,229),USE(?STRING6:12),FONT(,11,,FONT:bold),CENTER
                         STRING(@s32),AT(1625,4073,3073,229),USE(locPatient,,?locPatient:2),FONT(,12,,FONT:bold),LEFT
                         STRING('Patient:'),AT(823,4073,740,229),USE(?STRING6:14),FONT(,12,,FONT:bold),LEFT
                         STRING('Date Sent'),AT(4229,1844,760,188),USE(?StringSender:2),FONT(,8),TRN
                         LINE,AT(719,2000,6646,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,2062,2740,177),USE(locRecipentCompany),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,2292,6667,448),USE(?Box3:2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Fax Number'),AT(823,2323,1563,167),USE(?StringRecipientFaxnumber),FONT(, |
  8),TRN
                         STRING('Sender Fax Number'),AT(4229,2333,1563,167),USE(?StringSenderFaxnumber),FONT(,8),TRN
                         LINE,AT(729,2490,6646,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,2521,2740,177),USE(locrecipientFaxNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(4229,2521,2740,177),USE(locSenderFaxNumber),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,2760,6667,448),USE(?Box3:3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Sender Phone Number'),AT(4229,2781,1563,167),USE(?StringSenderPhoneNumber),FONT(,8), |
  TRN
                         STRING('Recipient Phone Number'),AT(823,2792,1563,167),USE(?StringRecipientPhoneNumber),FONT(, |
  8),TRN
                         LINE,AT(729,2958,6646,0),USE(?Line3:3),COLOR(COLOR:Black)
                         STRING(@s32),AT(4229,2990,2740,177),USE(locSenderPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(823,2990,2740,177),USE(locRecipientPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@D4),AT(4229,2062,2740,177),USE(locDate),FONT(,11,,FONT:bold),TRN
                         STRING('Subject'),AT(823,3271,1563,167),USE(?StringSubject),FONT(,8),TRN
                         BOX,AT(740,3271,6667,740),USE(?Box3:4),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         LINE,AT(729,3417,6646,0),USE(?Line3:4),COLOR(COLOR:Black)
                         STRING('Allermetrix needs the following information to process your patient�s insurance/billing'), |
  AT(823,3469,6406,177),USE(?locSubject),FONT(,11,,FONT:bold),TRN
                         STRING(@s20),AT(1625,4365),USE(locClientID),FONT(,12,,FONT:bold)
                         STRING('Client ID:'),AT(823,4365,740,229),USE(?STRING6:6),FONT(,12,,FONT:bold),LEFT
                       END
Request1               DETAIL,AT(10,10,8292,375),USE(?DETAIL2),FONT(,12,,FONT:bold)
                         STRING('1'),AT(531,31,427),USE(?locLineNumber),RIGHT
                         STRING('. Patient''s current Address'),AT(979,31),USE(?STRING1:4)
                       END
Request3               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:3),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:3),RIGHT
                         STRING('. ICD-10 code(s)'),AT(979,31),USE(?STRING3)
                       END
Request4               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:4),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:4),RIGHT
                         STRING('. Referring/Requesting Physician name'),AT(979,31),USE(?STRING4)
                       END
Request5               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:5),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:5),RIGHT
                         STRING('. Office notes'),AT(979,31),USE(?STRING5)
                       END
Request2               DETAIL,AT(10,10,8292,677),USE(?DETAIL2:2),FONT(,12,,FONT:bold)
                         STRING(@n3),AT(531,31,427),USE(locLineNumber,,?locLineNumber:2),RIGHT
                         STRING('. Copy of insurance card front and back'),AT(979,31),USE(?STRING2)
                         STRING('  or patient demographic form containing all insurance information'),AT(979,302,7240, |
  292),USE(?STRING2:2)
                       END
                       FOOTER,AT(250,9000,7948,2302),USE(?Footer)
                         STRING('Client#'),AT(4979,344),USE(?STRING6),FONT(,12,,FONT:regular),RIGHT
                         STRING('Allermetrix ID:'),AT(31,604,1708,229),USE(?STRING6:2),FONT(,12,,FONT:regular),RIGHT
                         STRING('Patient:'),AT(31,344,1708,229),USE(?STRING6:3),FONT(,12,,FONT:regular),RIGHT
                         STRING('DOB:'),AT(4979,615,562,229),USE(?STRING6:4),FONT(,12,,FONT:regular),RIGHT
                         STRING('Allermetrix Internal Use:'),AT(281,83,2625,229),USE(?STRING6:5),FONT(,12,,FONT:regular+FONT:italic), |
  LEFT
                         STRING(@s32),AT(1802,375,3073,229),USE(locPatient),FONT(,12,,FONT:regular),LEFT
                         STRING(@n_6),AT(1844,604,917,229),USE(Pat:INVOICE),FONT(,12,,FONT:regular),LEFT
                         STRING(@n_6),AT(5604,344,917,229),USE(Pat:CLIENT),FONT(,12,,FONT:regular),LEFT
                         STRING(@s9),AT(5604,604,917,229),USE(locDOB),FONT(,12,,FONT:regular),LEFT
                         STRING('Drawn:'),AT(4521,885,1021,229),USE(?STRING6:10),FONT(,12,,FONT:regular),RIGHT
                         STRING(@s9),AT(5604,896,917,229),USE(locDrawnDate),FONT(,12,,FONT:regular),LEFT
                         TEXT,AT(125,1260,7000,833),USE(locNotice),FONT(,8),TRN
                         BOX,AT(125,31,7000,1167),USE(?BOX4),COLOR(COLOR:Black),LINEWIDTH(1)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FaxRequest')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('FaxRequest',ProgressWindow)                ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  IF NOT TargetSelector.ASK(1) THEN
     SELF.Kill()
     RETURN Level:Fatal
  END
  IF NOT TargetSelector.GetPrintSelected() THEN
     SELF.SetReportTarget(TargetSelector.GetSelected())
  END
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
  END
  IF SELF.Opened
    INIMgr.Update('FaxRequest',ProgressWindow)             ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  PRINTER{PROPPRINT:Device} = 'PDFill PDF&Image Writer' 
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
      CLI:Number = PAT:Client
      GET(Client,CLI:ORDER_KEY)
      IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
      IF CLI:FIRST
        gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
      ELSE
        gloClientName = CLI:LAST
      .
      gloAddress1 = CLI:ADDRESS1
      IF CLI:ADDRESS2
        gloAddress2 = CLI:ADDRESS2
        gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      ELSE
        gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
        gloAddress3 = ''
      .
      gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
      IF PAT:COLLECTION
        gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
      ELSE
        gloPATCollection = 'Not Given'
      .
  
  
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    locSenderPhoneNumber = '877-992-4100'
    locRecipientPhoneNumber = CLI:PHONE
    locSenderFaxNumber = '615-599-4648'
    locrecipientFaxNumber = CLI:FAX
    locSender = 'Gary A. Kitos, PhD, HCLD, CC'
    locRecipentCompany = gloClientName
    locRecipient = CLI:CONTACT
    locDate = TODAY()
    locFooter =  DOC:Body
    locPageRange = 0
    locPatient = CLIP(Pat:LAST) & ', ' & Pat:FIRST
    IF Pat:COLLECTION > 0 
      locDrawnDate = FORMAT(Pat:COLLECTION,@D1)
    ELSE
      locDrawnDate = 'Not Given'
    .
    IF Pat:DOB > 0 
      locDOB = FORMAT(Pat:DOB,@D1)
    ELSE
      locDOB = 'Not Given'
    .
    IF LEN(CLIP(PAT:CLIENT_ID)) > 0 
      locClientID = PAT:CLIENT_ID
    ELSE
      locClientID = 'Not Given'
    .
    locNotice = 'Notice: This message is intended only for the use of the individual or entity to which it is addressed and may contain information that is privileged or confidential.  If the reader of this message is the intended recipient or the employee or agent responsible for delivering the message to the intended recipient you are hereby notified that any dissemination, distribution or copying of this communication is strictly prohibited.  If you have received this communication in error, please notify us immediately by telephone and destroy the original document.'


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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  OMIT('XXXX')
  PRINT(RPT:HEADER)
  PRINT(RPT:Request1)
  PRINT(RPT:Request3)
  PRINT(RPT:Request4)
  PRINT(RPT:Request5)
  PRINT(RPT:Request2)
  XXXX
  locLineNumber = 0
  
  PRINT(RPT:Header)
  IF BAND(prmRequest,1)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request1)
  .
  IF BAND(prmRequest,2)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request2)
  .
  IF BAND(prmRequest,4)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request3)
  .
  IF BAND(prmRequest,8)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request4)
  .
  IF BAND(prmRequest,16)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request5)
  .
   
    
    
    
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
FaxRequest2 PROCEDURE (prmRequest)

locClientID          STRING(16)                            !
locNotice            STRING(600)                           !
locLineNumber        BYTE                                  !
locPatient           STRING(32)                            !
locClient            LONG                                  !
locAssession         LONG                                  !
locDOB               STRING(9)                             !
locDrawnDate         STRING(9)                             !
Progress:Thermometer BYTE                                  !
locSenderPhoneNumber STRING(32)                            !
locMessage           STRING(84)                            !
locRecipientPhoneNumber STRING(32)                         !
locSenderFaxNumber   STRING(32)                            !
locrecipientFaxNumber STRING(32)                           !
locSender            STRING(32)                            !
locRecipient         STRING(32)                            !
locSubject           STRING(32)                            !
locPageRange         USHORT                                !
locDate              LONG                                  !
locFooter            STRING(576)                           !
locRecipentCompany   STRING(32)                            !
locDisclaimer        STRING(2048)                          !
locFaxBody           STRING(4096)                          !
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT('Patient Report'),AT(0,250,8500,10500),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10, |
  COLOR:Black,FONT:regular),THOUS
HEADER                 DETAIL,AT(0,0,8000,4719),USE(?Header)
                         IMAGE('am.JPG'),AT(2625,-10,2500,820),USE(?Image1)
                         BOX,AT(740,781,6667,510),USE(?Box1),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Single Page Facsimile Transmittal '),AT(823,875,6406,271),USE(?String1),FONT(,12,, |
  FONT:bold),CENTER,TRN
                         BOX,AT(740,1354,6667,448),USE(?Box2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient'),AT(823,1375,708,167),USE(?StringRecipient:2),FONT(,8),TRN
                         STRING('Sender'),AT(4229,1375),USE(?StringSender),FONT(,8),TRN
                         LINE,AT(729,1531,6646,0),USE(?Line2),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,1604,2740,177),USE(locRecipient),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(4229,1604,2740,177),USE(locSender),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,1823,6667,448),USE(?Box3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Company'),AT(823,1833,1563,167),USE(?StringRecipient),FONT(,8),TRN
                         STRING('*** Please fax to 615-599-4648 or e-mail to info@allermetrix.com ***'),AT(823,3708, |
  6781,229),USE(?STRING6:12),FONT(,11,,FONT:bold),CENTER
                         STRING(@s32),AT(1625,4073,3073,229),USE(locPatient,,?locPatient:2),FONT(,12,,FONT:bold),LEFT
                         STRING('Patient:'),AT(823,4073,740,229),USE(?STRING6:14),FONT(,12,,FONT:bold),LEFT
                         STRING('Date Sent'),AT(4229,1844,760,188),USE(?StringSender:2),FONT(,8),TRN
                         LINE,AT(719,2000,6646,0),USE(?Line3),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,2062,2740,177),USE(locRecipentCompany),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,2292,6667,448),USE(?Box3:2),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Recipient Fax Number'),AT(823,2323,1563,167),USE(?StringRecipientFaxnumber),FONT(, |
  8),TRN
                         STRING('Sender Fax Number'),AT(4229,2333,1563,167),USE(?StringSenderFaxnumber),FONT(,8),TRN
                         LINE,AT(729,2490,6646,0),USE(?Line3:2),COLOR(COLOR:Black)
                         STRING(@s32),AT(823,2521,2740,177),USE(locrecipientFaxNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(4229,2521,2740,177),USE(locSenderFaxNumber),FONT(,11,,FONT:bold),TRN
                         BOX,AT(740,2760,6667,448),USE(?Box3:3),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         STRING('Sender Phone Number'),AT(4229,2781,1563,167),USE(?StringSenderPhoneNumber),FONT(,8), |
  TRN
                         STRING('Recipient Phone Number'),AT(823,2792,1563,167),USE(?StringRecipientPhoneNumber),FONT(, |
  8),TRN
                         LINE,AT(729,2958,6646,0),USE(?Line3:3),COLOR(COLOR:Black)
                         STRING(@s32),AT(4229,2990,2740,177),USE(locSenderPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@s32),AT(823,2990,2740,177),USE(locRecipientPhoneNumber),FONT(,11,,FONT:bold),TRN
                         STRING(@D4),AT(4229,2062,2740,177),USE(locDate),FONT(,11,,FONT:bold),TRN
                         STRING('Subject'),AT(823,3271,1563,167),USE(?StringSubject),FONT(,8),TRN
                         BOX,AT(740,3271,6667,740),USE(?Box3:4),COLOR(COLOR:Black),LINEWIDTH(10),ROUND
                         LINE,AT(729,3417,6646,0),USE(?Line3:4),COLOR(COLOR:Black)
                         STRING('Allermetrix needs the following information to process your patient�s insurance/billing'), |
  AT(823,3469,6406,177),USE(?locSubject),FONT(,11,,FONT:bold),TRN
                         STRING(@s20),AT(1625,4365),USE(locClientID),FONT(,12,,FONT:bold)
                         STRING('Client ID:'),AT(823,4365,740,229),USE(?STRING6:6),FONT(,12,,FONT:bold),LEFT
                       END
Request6               DETAIL,AT(10,10,8292,375),USE(?DETAIL2),FONT(,12,,FONT:bold)
                         STRING('. Patient''s Date of Birth'),AT(979,31),USE(?STRING1:4)
                         STRING(@n1),AT(531,31,427,240),USE(locLineNumber,,?locLineNumber:8),RIGHT
                       END
Request7               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:2),FONT(,12,,FONT:bold)
                         STRING('. Patient''s Gender'),AT(979,31),USE(?STRING1:2)
                         STRING(@n1),AT(531,31,427,240),USE(locLineNumber,,?locLineNumber:9),RIGHT
                       END
Request1               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:3),FONT(,12,,FONT:bold)
                         STRING('1'),AT(531,31,427),USE(?locLineNumber:3),RIGHT
                         STRING('. Patient''s current Address'),AT(979,31),USE(?STRING1:3)
                       END
Request3               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:4),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:4),RIGHT
                         STRING('. ICD-10 code(s)'),AT(979,31),USE(?STRING3)
                       END
Request4               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:5),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:5),RIGHT
                         STRING('. Referring/Requesting Physician name'),AT(979,31),USE(?STRING4)
                       END
Request5               DETAIL,AT(10,10,8292,375),USE(?DETAIL2:6),FONT(,12,,FONT:bold)
                         STRING(@n1),AT(531,31,427),USE(locLineNumber,,?locLineNumber:6),RIGHT
                         STRING('. Office notes'),AT(979,31),USE(?STRING5)
                       END
Request2               DETAIL,AT(10,10,8292,677),USE(?DETAIL2:7),FONT(,12,,FONT:bold)
                         STRING(@n3),AT(531,31,427),USE(locLineNumber,,?locLineNumber:7),RIGHT
                         STRING('. Copy of insurance card front and back'),AT(979,31),USE(?STRING2)
                         STRING('  or patient demographic form containing all insurance information'),AT(979,302,7240, |
  292),USE(?STRING2:2)
                       END
                       FOOTER,AT(250,9000,7948,2302),USE(?Footer)
                         STRING('Client#'),AT(4979,344),USE(?STRING6),FONT(,12,,FONT:regular),RIGHT
                         STRING('Allermetrix ID:'),AT(31,604,1708,229),USE(?STRING6:2),FONT(,12,,FONT:regular),RIGHT
                         STRING('Patient:'),AT(31,344,1708,229),USE(?STRING6:3),FONT(,12,,FONT:regular),RIGHT
                         STRING('DOB:'),AT(4979,615,562,229),USE(?STRING6:4),FONT(,12,,FONT:regular),RIGHT
                         STRING('Allermetrix Internal Use:'),AT(281,83,2625,229),USE(?STRING6:5),FONT(,12,,FONT:regular+FONT:italic), |
  LEFT
                         STRING(@s32),AT(1802,375,3073,229),USE(locPatient),FONT(,12,,FONT:regular),LEFT
                         STRING(@n_6),AT(1844,604,917,229),USE(Pat:INVOICE),FONT(,12,,FONT:regular),LEFT
                         STRING(@n_6),AT(5604,344,917,229),USE(Pat:CLIENT),FONT(,12,,FONT:regular),LEFT
                         STRING(@s9),AT(5604,604,917,229),USE(locDOB),FONT(,12,,FONT:regular),LEFT
                         STRING('Drawn:'),AT(4521,885,1021,229),USE(?STRING6:10),FONT(,12,,FONT:regular),RIGHT
                         STRING(@s9),AT(5604,896,917,229),USE(locDrawnDate),FONT(,12,,FONT:regular),LEFT
                         TEXT,AT(125,1260,7000,833),USE(locNotice),FONT(,8),TRN
                         BOX,AT(125,31,7000,1167),USE(?BOX4),COLOR(COLOR:Black),LINEWIDTH(1)
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
  GlobalErrors.SetProcedureName('FaxRequest2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
      CLI:Number = PAT:Client
      GET(Client,CLI:ORDER_KEY)
      IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
      IF CLI:FIRST
        gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
      ELSE
        gloClientName = CLI:LAST
      .
      gloAddress1 = CLI:ADDRESS1
      IF CLI:ADDRESS2
        gloAddress2 = CLI:ADDRESS2
        gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      ELSE
        gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
        gloAddress3 = ''
      .
      gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
      IF PAT:COLLECTION
        gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
      ELSE
        gloPATCollection = 'Not Given'
      .
  
  
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    locSenderPhoneNumber = '877-992-4100'
    locRecipientPhoneNumber = CLI:PHONE
    locSenderFaxNumber = '615-599-4648'
    locrecipientFaxNumber = CLI:FAX
    locSender = 'Gary A. Kitos, PhD, HCLD, CC'
    locRecipentCompany = gloClientName
    locRecipient = CLI:CONTACT
    locDate = TODAY()
    locFooter =  DOC:Body
    locPageRange = 0
    locPatient = CLIP(Pat:LAST) & ', ' & Pat:FIRST
    IF Pat:COLLECTION > 0 
      locDrawnDate = FORMAT(Pat:COLLECTION,@D1)
    ELSE
      locDrawnDate = 'Not Given'
    .
    IF Pat:DOB > 0 
      locDOB = FORMAT(Pat:DOB,@D1)
    ELSE
      locDOB = 'Not Given'
    .
    IF LEN(CLIP(PAT:CLIENT_ID)) > 0 
      locClientID = PAT:CLIENT_ID
    ELSE
      locClientID = 'Not Given'
    .
  
    PRINTER{PROPPRINT:Device} = 'PDFill PDF&Image Writer'
    OPEN(Report)
    PRINT(RPT:Header)  
  IF BAND(prmRequest,1)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request1)
  .
  IF BAND(prmRequest,32)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request6)
  .  
  IF BAND(prmRequest,64)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request7)
  .  
  IF BAND(prmRequest,2)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request2)
  .
  IF BAND(prmRequest,4)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request3)
  .
  IF BAND(prmRequest,8)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request4)
  .
  IF BAND(prmRequest,16)
    locLineNumber = locLineNumber + 1
    PRINT(RPT:Request5)
  .  
    CLOSE(Report)
    POST(EVENT:CloseWindow)
  Do DefineListboxStyle
  INIMgr.Fetch('FaxRequest2',ProgressWindow)               ! Restore window settings from non-volatile store
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
  END
  IF SELF.Opened
    INIMgr.Update('FaxRequest2',ProgressWindow)            ! Save window data to non-volatile store
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
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
ResultsPrint PROCEDURE 

Progress:Thermometer BYTE                                  !
locTextIgM           STRING(196)                           !
locTextIgG           STRING(200)                           !
locTextIgG1          STRING(300)                           !
locTextIgG2          STRING(300)                           !
locTextIgG3          STRING(300)                           !
locPatientNote       STRING(127)                           !
locPercentile        STRING(64)                            !
locPercent           BYTE                                  !
locPoz               STRING(32),DIM(6)                     !
locNeg               STRING(32),DIM(6)                     !
locNegNdx            LONG(1)                               !
locPozNdx            LONG(1)                               !
locIVG               LONG                                  !
locIVM               LONG                                  !
locInturpt           STRING(16),DIM(12,3)                  !
Progress:Thermometer_Copy BYTE                             !
locComment           STRING(88)                            !
locPhysician         STRING(40)                            !
locResultsCount      SHORT                                 !
locASR               CSTRING(1020)                         !
locSummary           BYTE                                  !
locPositive          BYTE                                  !
locTotalType         STRING(12)                            !
locPollen            STRING(32)                            !
locHeading           STRING(20)                            !
locAccount           LONG                                  !
locPatientText       STRING(512)                           !
SAV:Sort             STRING(1)                             !
SAV:Type             STRING(4)                             !
SAV:Code             STRING(5)                             !
SAV:Description      STRING(40)                            !
locAge               BYTE                                  !
locScoreGAM          STRING(4)                             !
locImmunoglobulin    STRING(10)                            !
locStatus            STRING(64)                            !

BAR:Padding         BYTE(15)





GRAPH:X      EQUATE(800)
GRAPH:Y      EQUATE(300)
GRAPH:H      EQUATE(400)
BAR:X        ULONG
BAR:Y        ULONG
BAR:W        ULONG
BAR:H        ULONG



locRisk6            STRING(255)
locDisclaimer            STRING(255)
locTestCount             BYTE
locScore                 DECIMAL(5,1)
locThreshold             STRING(24)
locSpecificActivity6      DECIMAL(7,4)
locSpecificActivityString6      STRING(8)
locSpecificActivity      DECIMAL(7,4)
locSpecificActivityString      STRING(8)
COLOR:Equivocal      EQUATE(0D2FFD2H)
COLOR:Positive       EQUATE(080FFFFH)

locNDX  SHORT

locIndicatorG006     STRING(12)
locIndicatorW006     STRING(12)
locIndicatorT146     STRING(12)
locIndicatorF317     STRING(12)
locIndicatorF203     STRING(12)
locIndicatorF201     STRING(12)
locIndicatorF017     STRING(12)
locIndicatorF103     STRING(12)
locIndicatorF202     STRING(12)
locIndicatorF010     STRING(12)
locIndicatorF018     STRING(12)
locIndicatorF020     STRING(12)
locIndicatorF095     STRING(12)
locIndicatorF013     STRING(12)
locIndicatorF359     STRING(12)
locIndicatorF360     STRING(12)
locIndicatorF372     STRING(12)
locIndicatorSA       STRING(12)
locIndicatorSA6       STRING(12)
locG006     DECIMAL(5,2)
locW006     DECIMAL(5,2)
locT146     DECIMAL(5,2)
locF317     DECIMAL(5,2)
locF203     DECIMAL(5,2)
locF201     DECIMAL(5,2)
locF017     DECIMAL(5,2)
locF103     DECIMAL(5,2)
locF202     DECIMAL(5,2)
locF010     DECIMAL(5,2)
locF018     DECIMAL(5,2)
locF020     DECIMAL(5,2)
locF095     DECIMAL(5,2)
locF013     DECIMAL(5,2)
locF359     DECIMAL(5,2)
locF360     DECIMAL(5,2)
locF372     DECIMAL(5,2)



gloTotalGConc   DECIMAL(7,2)
gloTotaLAConc   DECIMAL(7,2)
gloTotalMConc   DECIMAL(7,2)

gloTotalEScore   STRING(13)
gloTotalERange   STRING(16)
gloTotalGScore   STRING(7)
gloTotalGRange   STRING(16)
gloTotalAScore   STRING(7)
gloTotalARange   STRING(16)
gloTotalMScore   STRING(7)
gloTotalMRange   STRING(16)


SAV:Patient   LONG
locOverWrite   BYTE
locTarget   BYTE,DIM(255)
locSource   BYTE,DIM(255)
locLength   USHORT
locSourcePosition   USHORT
locTargetPosition   USHORT
locPathZ   STRING(48)
EQ:Month                 EQUATE(1)
EQ:Year                  EQUATE(2)
EQ:NotTested             EQUATE(0)
EQ:Tested                EQUATE(4)
EQ:Normal                EQUATE(1)
EQ:Elevated              EQUATE(2)
EQ:Depressed             EQUATE(3)
EQ:FinalFollow           EQUATE(5)
EQ:OffScale              EQUATE(6)
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType

ProgressWindow       WINDOW('Report Patient'),AT(,,288,156),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       STRING(@n_6),AT(132,24),USE(Pat:INVOICE),TRN
                       STRING(@s20),AT(134,34),USE(Pat:LAST),TRN
                       STRING(@s64),AT(66,58),USE(locStatus),FONT(,12,COLOR:Red,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       STRING(@pResults <<#pb),AT(109,84),USE(locResultsCount),TRN
                       STRING('Last Name'),AT(90,34),USE(?String6),TRN
                       STRING('Assession:'),AT(90,24),USE(?String4),TRN
                       PROGRESS,AT(8,128,111,12),USE(Progress:Thermometer),HIDE,RANGE(0,100)
                       STRING(''),AT(2,128,141,10),USE(?Progress:UserString),CENTER,HIDE
                       STRING(''),AT(2,128,141,10),USE(?Progress:PctText),CENTER,HIDE
                       BUTTON('Cancel'),AT(0,50,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT, |
  MSG('Cancel Report'),TIP('Cancel Report')
                     END
                     
                     OMIT('XXX')
ProgressWindow       WINDOW('Report Patient'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

  XXX
Report               REPORT('Results'),AT(250,3604,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,12,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2082),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-364),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2082),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(locPatientNote),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3896,1813,1521,208),USE(gloRPTNOTICE3),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
Heading                DETAIL,AT(10,10,8302,385),USE(?DETAIL1)
                         BOX,AT(719,63,2510,250),USE(?Box3:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(979,83,1958,219),USE(locHeading),FONT(,12,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
CovidStructure         DETAIL,AT(0,0,8000,3865),USE(?DETAIL35)
                         IMAGE('..\..\ALIS\App\CoV-Structure.jpg'),AT(1625,31,4594,3792),USE(?IMAGE2)
                         STRING('Image from  Rohan Singh, MD; Made with Biorender.com'),AT(104,3344,2969),USE(?STRING5), |
  FONT(,8,,FONT:regular),RIGHT
                         BOX,AT(719,31,2510,250),USE(?Box3:11),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('SARS CoV-2 Structure'),AT(958,52,1958,219),USE(?StringCovidStructure),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),LEFT,COLOR(COLOR:Black),TRN
                       END
Covid                  DETAIL,AT(0,0,8000,7552),USE(?DETAIL35:2),FONT(,,,FONT:bold)
                         BOX,AT(208,10,2510,250),USE(?BoxIgGSummaryHeading),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(250,302,2000,4594),USE(?BoxGroupIgG1),COLOR(COLOR:Black),LINEWIDTH(3)
                         STRING('IgG Summary Percentile'),AT(469,31,2250,219),USE(?StringIgGSummaryHeading),FONT(,12, |
  COLOR:White,FONT:bold,CHARSET:ANSI),LEFT,COLOR(COLOR:White),TRN
                         BOX,AT(2635,302,2000,4594),USE(?BoxGroupIgG2),COLOR(COLOR:Black),LINEWIDTH(3)
                         BOX,AT(5042,302,2000,4594),USE(?BoxGroupIgG3),COLOR(COLOR:Black),LINEWIDTH(3)
                         BOX,AT(448,448,1583,219),USE(?BoxIgGHead1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,448,1583,219),USE(?BoxIgGHead2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5250,448,1583,219),USE(?BoxIgGHead3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(448,708,1583,219),USE(?BoxIgG1),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(2823,708,1583,219),USE(?BoxIgG2),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(5240,708,1583,219),USE(?BoxIgG3),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(448,969,1583,219),USE(?BoxIgGConc1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,969,1583,219),USE(?BoxIgGConc2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5240,969,1583,219),USE(?BoxIgGConc3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(448,1229,1583,198),USE(?BoxIgGBAU1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,1229,1583,198),USE(?BoxIgGBAU2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5240,1229,1583,198),USE(?BoxIgGBAU3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         TEXT,AT(448,1531,1583,2000),USE(locPercentile,,?locPercentile:1),CENTER,COLOR(COLOR:Silver)
                         TEXT,AT(5250,1531,1583,2000),USE(locPercentile,,?locPercentile:3),CENTER,COLOR(COLOR:Silver)
                         TEXT,AT(2823,1531,1583,2000),USE(locPercentile,,?locPercentile:2),CENTER,COLOR(COLOR:Silver)
                         BOX,AT(448,1469,1583,198),USE(?BoxPercentile1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,1469,1583,195),USE(?BoxPercentile2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5240,1469,1583,198),USE(?BoxPercentile3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('S1 Protein'),AT(437,468,1646,198),USE(?StringIgGHHead1),FONT(,,COLOR:White),CENTER, |
  TRN
                         STRING('RBD'),AT(2844,468,1562,198),USE(?StringIgGHHead2),FONT(,,COLOR:White),CENTER,TRN
                         STRING('N Protein'),AT(5250,468,1583,198),USE(?StringIgGHHead3),FONT(,,COLOR:White),CENTER, |
  TRN
                         STRING('Not Tested'),AT(437,728,1583,219),USE(?StringIgG1),CENTER,TRN
                         STRING('Not Tested'),AT(2823,728,1583,219),USE(?StringIgG2),CENTER,TRN
                         STRING('Not Tested'),AT(5240,728,1583,219),USE(?StringIgG3),CENTER,TRN
                         STRING('165.1 �g/mL'),AT(448,979,1583,219),USE(?StringConcValue1),FONT(,,COLOR:White),CENTER, |
  HIDE,TRN
                         STRING('165.1 �g/mL'),AT(2823,979,1583,219),USE(?StringConcValue2),FONT(,,COLOR:White),CENTER, |
  HIDE,TRN
                         STRING('165.1 �g/mL'),AT(5240,979,1583,219),USE(?StringConcValue3),FONT(,,COLOR:White),CENTER, |
  HIDE,TRN
                         STRING('165.1 BAU/mL (WHO)'),AT(448,1259,1583,219),USE(?StringBAUValue1),FONT(,,COLOR:White), |
  CENTER,HIDE,TRN
                         STRING('165.1 BAU/mL (WHO)'),AT(2823,1259,1583,219),USE(?StringBAUValue2),FONT(,,COLOR:White), |
  CENTER,HIDE,TRN
                         STRING('165.1 BAU/mL (WHO)'),AT(5250,1259,1583,219),USE(?StringBAUValue3),FONT(,,COLOR:White), |
  CENTER,HIDE,TRN
                         STRING('Percentile'),AT(448,1500,1583,219),USE(?StringPercentileValue1),FONT(,10,COLOR:White), |
  CENTER,TRN
                         STRING('Percentile'),AT(2823,1500,1583,219),USE(?StringPercentileValue2),FONT(,10,COLOR:White), |
  CENTER,TRN
                         STRING('Percentile'),AT(5250,1500,1583,198),USE(?StringPercentileValue3),FONT(,10,COLOR:White), |
  CENTER,TRN
                         IMAGE('..\..\ALIS\App\leftArrow.jpg'),AT(1375,2396,615,100),USE(?ImageArrow1),HIDE
                         IMAGE('..\..\ALIS\App\leftArrow.jpg'),AT(3750,2396,615,104),USE(?ImageArrow2),HIDE
                         IMAGE('..\..\ALIS\App\leftArrow.jpg'),AT(6156,2125,615,104),USE(?ImageArrow3),HIDE
                         TEXT,AT(437,3594,1698,1302),USE(locTextIgG1),FONT(,8,,FONT:regular),TRN
                         TEXT,AT(2823,3594,1698,1302),USE(locTextIgG2),FONT(,8,,FONT:regular),TRN
                         TEXT,AT(5250,3594,1698,1302),USE(locTextIgG3),FONT(,8,,FONT:regular),TRN
                         STRING('NOTE:  BAU/mL is an Antibody Binding Unit established by the World Health Organ' & |
  'ization (WHO)'),AT(250,4958,7073,240),USE(?STRING6)
                       END
Detail1                DETAIL,AT(0,0),USE(?CovidStructure)
                       END
HeaderTotal            DETAIL,AT(10,10,8302,385),USE(?DETAIL2)
                         BOX,AT(719,63,2510,250),USE(?Box3:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Immunoglobulin'),AT(1135,83,1542,219),USE(?locHeading:2),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
G4Interp               DETAIL,AT(10,10,8302,2198),USE(?DETAIL3)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,302,969,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,302,2698,219),USE(?Box4:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,0,2510,250),USE(?Box3:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,500,969,219),USE(?BoxEinterpConc1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,500,479,219),USE(?BoxEinterpClass1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,500,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,698,2698,219),USE(?BoxEinterpDesc2:4),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,698,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,698,969,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,896,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,896,969,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,896,2698,1219),USE(?BoxEinterpDesc4:3),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5615,1104,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1104,969,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1302,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1302,969,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1500,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1500,969,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1698,479,219),USE(?BoxEinterpClass7:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1698,969,219),USE(?BoxEinterpConc7:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1896,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1896,969,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('6'),AT(5708,1938,313,135),USE(?SEinterpClass8:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1927,948,135),USE(NOR:G46),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(3000,719,2365,208),USE(?SEinterp2:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/1'),AT(5708,729,313,135),USE(?SEinterpClass2:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,729,948,135),USE(NOR:G4E),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5729,927,313,135),USE(?SEinterpClass3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,927,948,135),USE(NOR:G41),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2990,1354,2365,208),USE(?SEinterp4:2),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5729,1125,313,135),USE(?SEinterpClass4:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1125,948,135),USE(NOR:G42),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5708,1344,313,135),USE(?SEinterpClass5:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1323,948,135),USE(NOR:G43),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5708,1531,313,135),USE(?SEinterpClass6:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1542,948,135),USE(NOR:G44),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5708,1729,313,135),USE(?SEinterpClass7:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1740,948,135),USE(NOR:G45),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(3021,521,2365,208),USE(?SEinterp1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,542,948,135),USE(NOR:G40),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5708,542,313,135),USE(?SEinterpClass1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgG4 Normal Range'),AT(781,10,2344,219),USE(?locHeading:5),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3031,313,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,313,417,208),USE(?RES:Score:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(6188,323,885,208),USE(?S72:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
GInterp                DETAIL,AT(10,0,8302,2250),USE(?DETAIL4)
                         BOX,AT(719,21,2510,250),USE(?Box3:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,948,2698,1208),USE(?BoxEinterpDesc4:4),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5615,333,479,219),USE(?Box5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,333,969,219),USE(?Box16:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,333,2698,219),USE(?Box4:11),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,531,969,219),USE(?BoxEinterpConc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,531,479,219),USE(?BoxEinterpClass1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,531,2698,219),USE(?BoxEinterpDesc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,729,2698,219),USE(?BoxEinterpDesc2:3),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,729,479,219),USE(?BoxEinterpClass2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,729,969,219),USE(?BoxEinterpConc2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,927,479,219),USE(?BoxEinterpClass3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,927,969,219),USE(?BoxEinterpConc3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1125,479,219),USE(?BoxEinterpClass4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,1125,969,219),USE(?BoxEinterpConc4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1333,479,219),USE(?BoxEinterpClass5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,1333,969,219),USE(?BoxEinterpConc5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1531,479,219),USE(?BoxEinterpClass6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,1531,969,219),USE(?BoxEinterpConc6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1729,479,219),USE(?BoxEinterpClass7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,1729,969,219),USE(?BoxEinterpConc7:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1927,479,219),USE(?BoxEinterpClass8:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1927,969,219),USE(?BoxEinterpConc8:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('6'),AT(5688,1948,313,208),USE(?SEinterpClass8),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1958,1031,156),USE(NOR:G6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(2990,740,2365,208),USE(?SEinterp2:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/1'),AT(5688,750,313,208),USE(?SEinterpClass2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,760,1031,156),USE(NOR:GE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,948,313,208),USE(?SEinterpClass3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,958,1031,156),USE(NOR:G1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2990,1354,2365,208),USE(?SEinterp4),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1156,313,208),USE(?SEinterpClass4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1167,1031,156),USE(NOR:G2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5688,1354,313,208),USE(?SEinterpClass5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1365,1031,156),USE(NOR:G3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5688,1552,313,208),USE(?SEinterpClass6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1563,1031,156),USE(NOR:G4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5688,1750,313,208),USE(?SEinterpClass7),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s20),AT(6125,1750,1031,156),USE(NOR:G5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(2990,552,2365,208),USE(?SEinterp1:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,563,1031,156),USE(NOR:G0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,208),USE(?SEinterpClass1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('Specific IgG Normal Range'),AT(792,42,2323,219),USE(?locHeading:8),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3052,365,2240,146),USE(?RES:Description:16),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5667,365,417,146),USE(?RES:Score:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(6198,354,896,167),USE(?S72:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
VgInterp               DETAIL,AT(10,0,8292,5146),USE(?DETAIL4:2)
                         BOX,AT(719,21,2510,250),USE(?Box3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2302,1052,2698,219),USE(?BoxEinterpDesc4),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5094,302,479,219),USE(?Box5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5677,302,1052,219),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2302,302,2698,219),USE(?Box4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5677,500,1052,219),USE(?BoxEinterpConc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5094,500,479,219),USE(?BoxEinterpClass1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2302,500,2698,219),USE(?BoxEinterpDesc1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5094,1031,479,219),USE(?BoxEinterpClass3:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5677,1031,1052,219),USE(?BoxEinterpConc3:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Pos'),AT(5167,1052,313,208),USE(?SEinterpClass3:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5698,1062,1031,156),USE(locInturpt[7,2]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Antibodies Detected'),AT(2479,1062,2365,208),USE(?SEinterp4:3),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Antibodies Not Detected'),AT(2469,521,2365,208),USE(?SEinterp1:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(5698,531,1031,156),USE(locInturpt[7,1]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Neg'),AT(5167,521,313,208),USE(?SEinterpClass1:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(2302,771,2698,219),USE(?BoxEinterpDesc4:6),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5094,750,479,219),USE(?BoxEinterpClass3:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5677,750,1052,219),USE(?BoxEinterpConc3:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Bdl'),AT(5167,771,312,208),USE(?SEinterpClass3:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5698,781,1031,156),USE(locInturpt[7,3]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Borderline'),AT(2479,781,2365,208),USE(?SEinterp4:6),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6792,302,1156,219),USE(?Box16:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6792,1031,1156,219),USE(?BoxBAU1Pos),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6792,750,1156,219),USE(?BoxBAU1Bdl),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6792,500,1156,219),USE(?BoxBAU1Neg),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6792,531,1156,156),USE(locInturpt[9,1]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6792,781,1156,156),USE(locInturpt[9,3]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6792,1062,1156,156),USE(locInturpt[9,2],,?locInturpt_9_2:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Covid-19 IgG'),AT(792,42,2323,219),USE(?locHeading:3),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('S1 Interpretation'),AT(2531,333,2240,146),USE(?RES:Description),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5146,333,417,146),USE(?RES:Score),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5677,323,1052,167),USE(?S72),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('WHO* (BAU/mL)'),AT(6792,312,1156,167),USE(?S72:14),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(2312,2219,2698,219),USE(?BoxEinterpDesc4:9),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5104,1469,479,219),USE(?Box5:14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5687,1469,1052,219),USE(?Box16:11),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2312,1469,2698,219),USE(?Box4:22),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5687,1667,1052,219),USE(?BoxEinterpConc1:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5104,1667,479,219),USE(?BoxEinterpClass1:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2312,1667,2698,219),USE(?BoxEinterpDesc1:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5104,2198,479,219),USE(?BoxEinterpClass3:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5687,2198,1052,219),USE(?BoxEinterpConc3:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Pos'),AT(5177,2219,312,208),USE(?SEinterpClass3:10),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5708,2229,1031,156),USE(locInturpt[7,2],,?locInturpt_7_2:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Antibodies Detected'),AT(2490,2229,2365,208),USE(?SEinterp4:9),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Antibodies Not Detected'),AT(2479,1687,2365,208),USE(?SEinterp1:6),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(5708,1698,1031,156),USE(locInturpt[7,1],,?locInturpt_7_1:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Neg'),AT(5177,1687,312,208),USE(?SEinterpClass1:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(2312,1937,2698,219),USE(?BoxEinterpDesc4:8),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5104,1917,479,219),USE(?BoxEinterpClass3:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5687,1917,1052,219),USE(?BoxEinterpConc3:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Bdl'),AT(5177,1937,312,208),USE(?SEinterpClass3:9),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5708,1948,1031,156),USE(locInturpt[7,3],,?locInturpt_7_3:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Borderline'),AT(2490,1948,2365,208),USE(?SEinterp4:8),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6802,1469,1156,219),USE(?Box16:10),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6802,2198,1156,219),USE(?BoxBAU2Pos),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6802,1917,1156,219),USE(?BoxBAU2Bdl),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6802,1667,1156,219),USE(?BoxBAU2Neg),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6802,1698,1156,156),USE(locInturpt[10,1]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6802,1948,1156,156),USE(locInturpt[10,3]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6802,2229,1156,156),USE(locInturpt[10,2]),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('RBD Interpretation'),AT(2542,1500,2240,146),USE(?RES:Description:22),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5156,1500,417,146),USE(?RES:Score:15),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5687,1490,1052,167),USE(?S72:16),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('WHO* (BAU/mL)'),AT(6802,1479,1156,167),USE(?S72:15),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(2260,3406,2698,219),USE(?BoxEinterpDesc4:11),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5052,2656,479,219),USE(?Box5:15),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,2656,1052,219),USE(?Box16:13),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2260,2656,2698,219),USE(?Box4:23),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,2854,1052,219),USE(?BoxEinterpConc1:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5052,2854,479,219),USE(?BoxEinterpClass1:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2260,2854,2698,219),USE(?BoxEinterpDesc1:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5052,3385,479,219),USE(?BoxEinterpClass3:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,3385,1052,219),USE(?BoxEinterpConc3:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Pos'),AT(5125,3406,312,208),USE(?SEinterpClass3:12),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5656,3417,1031,156),USE(locInturpt[7,2],,?locInturpt_7_2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Antibodies Detected'),AT(2437,3417,2365,208),USE(?SEinterp4:11),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Antibodies Not Detected'),AT(2427,2875,2365,208),USE(?SEinterp1:7),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(5656,2885,1031,156),USE(locInturpt[7,1],,?locInturpt_7_1),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Neg'),AT(5125,2875,312,208),USE(?SEinterpClass1:8),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(2260,3125,2698,219),USE(?BoxEinterpDesc4:10),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5052,3104,479,219),USE(?BoxEinterpClass3:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5635,3104,1052,219),USE(?BoxEinterpConc3:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Bdl'),AT(5125,3125,312,208),USE(?SEinterpClass3:11),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(5656,3135,1031,156),USE(locInturpt[7,3],,?locInturpt_7_3),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Borderline'),AT(2437,3135,2365,208),USE(?SEinterp4:10),FONT(,10,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6750,2656,1156,219),USE(?Box16:12),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6750,3385,1156,219),USE(?BoxBAU2Pos:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6750,3104,1156,219),USE(?BoxBAU2Bdl:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6750,2854,1156,219),USE(?BoxBAU2Neg:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6750,2885,1156,156),USE(locInturpt[11,1],,?locInturpt_10_1:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(6750,3135,1156,156),USE(locInturpt[11,3],,?locInturpt_10_3:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(6750,3417,1156,156),USE(locInturpt[11,2],,?locInturpt_10_2:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('N Interpretation'),AT(2490,2687,2240,146),USE(?RES:Description:23),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5104,2687,417,146),USE(?RES:Score:16),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5635,2677,1052,167),USE(?S72:18),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('WHO* (BAU/mL)'),AT(6750,2667,1156,167),USE(?S72:17),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('* BAU/mL is an Antibody Binding Unit established by the World Health Organization (WHO) '), |
  AT(2260,4094,5573,250),USE(?STRING4)
                       END
EInterp                DETAIL,AT(10,0,8302,2229),USE(?DETAIL5)
                         BOX,AT(719,0,2510,250),USE(?Box3:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,896,2698,1229),USE(?BoxEinterpDesc4:5),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5615,302,479,219),USE(?Box5:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,302,969,208),USE(?Box16:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,302,2698,219),USE(?Box4:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,698,969,219),USE(?BoxEinterpConc1:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,500,479,219),USE(?BoxEinterpClass1:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,500,2698,219),USE(?BoxEinterpDesc1:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,698,2698,219),USE(?BoxEinterpDesc2:5),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,698,479,219),USE(?BoxEinterpClass2:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,500,969,219),USE(?BoxEinterpConc2:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,896,479,219),USE(?BoxEinterpClass3:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,896,969,219),USE(?BoxEinterpConc3:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1104,479,219),USE(?BoxEinterpClass4:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1104,969,219),USE(?BoxEinterpConc4:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1302,479,219),USE(?BoxEinterpClass5:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1302,969,219),USE(?BoxEinterpConc5:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1500,479,219),USE(?BoxEinterpClass6:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1500,969,219),USE(?BoxEinterpConc6:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1698,479,219),USE(?BoxEinterpClass7:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1698,969,219),USE(?BoxEinterpConc7:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1896,479,219),USE(?BoxEinterpClass8:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1896,969,219),USE(?BoxEinterpConc8:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('6'),AT(5688,1938,313,156),USE(?SEinterpClass8:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1917,1031,156),USE(NOR:E6),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(2990,740,2365,177),USE(?SEinterp2:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/1'),AT(5688,740,313,156),USE(?SEinterpClass2:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,719,1031,156),USE(NOR:EE),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5688,927,313,156),USE(?SEinterpClass3:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,917,1031,156),USE(NOR:E1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(3031,1302,2365,208),USE(?SEinterp4:5),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5688,1115,313,156),USE(?SEinterpClass4:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1115,1031,156),USE(NOR:E2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3'),AT(5688,1344,313,156),USE(?SEinterpClass5:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1323,1031,156),USE(NOR:E3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('4'),AT(5688,1542,313,156),USE(?SEinterpClass6:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1521,1031,156),USE(NOR:E4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('5'),AT(5688,1740,313,156),USE(?SEinterpClass7:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,1719,1031,156),USE(NOR:E5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('No Antibody Detected'),AT(2990,531,2365,177),USE(?SEinterp1:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6125,521,1031,156),USE(NOR:E0),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5688,552,313,156),USE(?SEinterpClass1:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgE Normal Range'),AT(833,31,2271,219),USE(?locHeading:6),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3115,344,2240,177),USE(?RES:Description:3),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5635,344,417,177),USE(?RES:Score:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (kU/L)'),AT(6188,344,906,177),USE(?S72:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
TEInterp               DETAIL,AT(10,10,8302,1625),USE(?DETAIL6)
                         BOX,AT(719,10,2510,250),USE(?Box3:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,302,1000,219),USE(?HeadingBoxE),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,302,1000,219),USE(?Box16:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,302,2698,219),USE(?Box4:10),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,500,2698,219),USE(?BoxAge1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,698,2698,219),USE(?BoxAge2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,896,2698,219),USE(?BoxAge3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,1104,2698,219),USE(?BoxAge4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,1302,2698,219),USE(?BoxAge5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,500,1000,219),USE(?BoxThigh1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,500,1000,219),USE(?BoxMedian1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,698,1000,219),USE(?BoxThigh12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,698,1000,219),USE(?BoxMedian2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,896,1000,219),USE(?BoxThigh3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,896,1000,219),USE(?BoxMedian3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,1104,1000,219),USE(?BoxThigh4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,1104,1000,219),USE(?BoxMedian4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6635,1302,1000,219),USE(?BoxThigh5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5594,1302,1000,219),USE(?BoxMedian5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('0-1'),AT(3000,531,2365,156),USE(?SrtingAge1),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1-2'),AT(3000,719,2365,156),USE(?SAge2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2-3'),AT(3000,917,2365,156),USE(?SAge3),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('3-9'),AT(3000,1115,2365,156),USE(?SAge4),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Adult'),AT(3000,1323,2365,156),USE(?SAge5),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('10.1'),AT(5906,740,448,156),USE(?SEinterpClass2:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('49'),AT(6750,719,771,156),USE(?SEinterpConc2:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('12.9'),AT(5906,927,448,156),USE(?SEinterpClass3:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('45'),AT(6750,917,771,156),USE(?SEinterpConc3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('14.4'),AT(5906,1115,448,156),USE(?SEinterpClass4:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('52'),AT(6750,1125,771,156),USE(?SEinterpConc4:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('20.4'),AT(5906,1333,448,156),USE(?SEinterpClass5:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('87'),AT(6750,1333,771,156),USE(?SEinterpConc5:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('29'),AT(6750,531,771,156),USE(?SEinterpConc1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('6.6'),AT(5906,542,448,156),USE(?SEinterpClass1:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Total IgE Normal Range'),AT(1052,42,1854,219),USE(?locHeading:7),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Age'),AT(3031,333,2240,208),USE(?RES:Description:10),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Median (IU/mL)'),AT(5594,333,1010,208),USE(?RES:Score:9),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('95% (IU/mL)'),AT(6750,333,813,208),USE(?S72:5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
TAInterp               DETAIL,AT(10,10,8302,1906),USE(?DETAIL7)
                         BOX,AT(719,10,2510,250),USE(?HeadingBoxA),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Total IgA Normal Range'),AT(1010,42,1969,219),USE(?HeadingIgA),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(896,542,1000,219),USE(?BoxHeadA4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(896,552,1000,219),USE(?SHeadA4:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(896,760,1000,219),USE(?BoxAgeA1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,969,1000,219),USE(?BoxAgeA2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1167,1000,219),USE(?BoxAgeA3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1365,1000,219),USE(?BoxAgeA4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1563,1000,219),USE(?BoxAgeA5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('1-3 mo'),AT(948,771,729,219),USE(?SrtingAgeA1),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('4-6 mo'),AT(948,979,729,219),USE(?SAgeA2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('7-11 mo'),AT(948,1177,729,219),USE(?SAgeA3),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('1 yr'),AT(948,1375,729,219),USE(?SAgeA4),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('2 yr'),AT(948,1573,729,219),USE(?SAgeA5),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         BOX,AT(1948,344,1000,219),USE(?BoxHeadA5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(1948,375,1000,219),USE(?SHeadA5:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(1948,542,1000,219),USE(?BoxHeadA5:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(1948,552,1000,219),USE(?SHeadA5:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(1948,760,1000,219),USE(?BoxMedianA1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,969,1000,219),USE(?BoxMedianA2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1167,1000,219),USE(?BoxMedianA3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1365,1000,219),USE(?BoxMedianA4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1563,1000,219),USE(?BoxMedianA5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('0'),AT(1948,771,1000,219),USE(?SClassA1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('0'),AT(1948,979,1000,219),USE(?SClassA2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1'),AT(1948,1177,1000,219),USE(?SClassA3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1'),AT(1948,1375,1000,219),USE(?SClassA4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('2'),AT(1948,1573,1000,219),USE(?SClassA5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(3000,344,1000,219),USE(?BoxHeadA6:1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(3000,375,979,208),USE(?SHeadA6:1),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(3000,563,1000,198),USE(?BoxHeadA6:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(3000,552,979,208),USE(?SHeadA6:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(3000,760,1000,219),USE(?BoxHighA1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,969,1000,219),USE(?BoxHighA2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1167,1000,219),USE(?BoxHighA3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1365,1000,219),USE(?BoxHighA4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1563,1000,219),USE(?BoxHighA5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('47'),AT(3052,771,1000,219),USE(?SConcA1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('64'),AT(3052,979,1000,219),USE(?SConcA2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('73'),AT(3052,1177,1000,219),USE(?SConcA3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('98'),AT(3052,1375,1000,219),USE(?SConcA4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('145'),AT(3052,1573,1000,219),USE(?SConcA5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(4552,542,1000,219),USE(?BoxHeadA4:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(4552,552,1000,219),USE(?SHeadA4:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(4552,760,1000,219),USE(?BoxAgeA1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,969,1000,219),USE(?BoxAgeA2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1167,1000,219),USE(?BoxAgeA3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1365,1000,219),USE(?BoxAgeA4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1563,1000,219),USE(?BoxAgeA5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('3-5 yr'),AT(4542,771,729,219),USE(?SrtingAgeA1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('6-8 yr'),AT(4542,979,729,219),USE(?SAgeA2:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('9-11 yr'),AT(4542,1177,729,219),USE(?SAgeA3:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('12-16 yr'),AT(4542,1375,729,219),USE(?SAgeA4:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('Adult'),AT(4542,1573,729,219),USE(?SAgeA5:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         BOX,AT(5604,344,1000,219),USE(?BoxHeadA5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(5604,354,1000,219),USE(?SHeadA5:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5604,542,1000,219),USE(?BoxHeadA5:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(5604,552,1000,219),USE(?SHeadA5:5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5604,760,1000,219),USE(?BoxMedianA1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,969,1000,219),USE(?BoxMedianA2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1167,1000,219),USE(?BoxMedianA3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1365,1000,219),USE(?BoxMedianA4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1563,1000,219),USE(?BoxMedianA5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('0'),AT(5594,771,1000,219),USE(?SClassA1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('39'),AT(5594,979,1000,219),USE(?SClassA2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('11'),AT(5594,1177,1000,219),USE(?SClassA3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('22'),AT(5594,1375,1000,219),USE(?SClassA4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('78'),AT(5594,1573,1000,219),USE(?SClassA5:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(6646,344,1000,219),USE(?BoxHeadA6:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(6646,354,979,208),USE(?SHeadA6:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(6646,542,1000,219),USE(?BoxHeadA6:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(6646,552,979,219),USE(?SHeadA6:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6646,760,1000,219),USE(?BoxHighA1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,969,1000,219),USE(?BoxHighA2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1167,1000,219),USE(?BoxHighA3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1365,1000,219),USE(?BoxHighA4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1563,1000,219),USE(?BoxHighA5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('147'),AT(6635,771,1000,219),USE(?SConcA1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('214'),AT(6635,979,1000,219),USE(?SConcA2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('251'),AT(6635,1177,1000,219),USE(?SConcA3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('274'),AT(6635,1375,1000,219),USE(?SConcA4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('322'),AT(6635,1573,1000,219),USE(?SConcA5:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
TMInterp               DETAIL,AT(10,10,8302,1896),USE(?DETAIL8)
                         BOX,AT(719,10,2510,250),USE(?HeadingBoxM),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Total IgM Normal Range'),AT(1000,31,1927,219),USE(?HeadingIgM),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(896,542,1000,219),USE(?BoxHeadM1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(896,552,1000,219),USE(?SHeadM1),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(896,760,1000,219),USE(?BoxAgeM1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,969,1000,219),USE(?BoxAgeM2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1167,1000,219),USE(?BoxAgeM3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1365,1000,219),USE(?BoxAgeM4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1563,1000,219),USE(?BoxAgeM5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('1-3 mo'),AT(948,771,729,219),USE(?SrtingAgeM1),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('4-6 mo'),AT(948,979,729,219),USE(?SAgeM2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('7-11 mo'),AT(948,1177,729,219),USE(?SAgeM3),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('1 yr'),AT(948,1375,729,219),USE(?SAgeM4),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('2 yr'),AT(948,1573,729,219),USE(?SAgeM5),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         BOX,AT(1948,344,1000,219),USE(?BoxHeadM2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(1948,375,1000,219),USE(?SHeadM5:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(1948,542,1000,219),USE(?BoxHeadM2:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(1948,552,1000,219),USE(?SHeadM5:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(1948,760,1000,219),USE(?BoxMedianM1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,969,1000,219),USE(?BoxMedianM2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1167,1000,219),USE(?BoxMedianM3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1365,1000,219),USE(?BoxMedianM4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1563,1000,219),USE(?BoxMedianM5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('8'),AT(1948,771,1000,219),USE(?SClassM1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('9'),AT(1948,979,1000,219),USE(?SClassM2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('8'),AT(1948,1177,1000,219),USE(?SClassM3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('12'),AT(1948,1375,1000,219),USE(?SClassM4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('23'),AT(1948,1573,1000,219),USE(?SClassM5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(3000,344,1000,219),USE(?BoxHeadM3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(3000,375,979,208),USE(?SHeadM2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(3000,563,1000,198),USE(?BoxHeadM3:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(3000,552,979,208),USE(?SHeadM2:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(3000,760,1000,219),USE(?BoxHighM1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,969,1000,219),USE(?BoxHighM2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1167,1000,219),USE(?BoxHighM3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1365,1000,219),USE(?BoxHighM4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1563,1000,219),USE(?BoxHighM5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('52'),AT(3052,771,1000,219),USE(?SConcM1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('77'),AT(3052,979,1000,219),USE(?SConcM2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('100'),AT(3052,1177,1000,219),USE(?SConcM3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('104'),AT(3052,1375,1000,219),USE(?SConcM4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('99'),AT(3052,1573,1000,219),USE(?SConcM5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(4552,542,1000,219),USE(?BoxHeadM4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(4552,552,1000,219),USE(?SHeadM4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(4552,760,1000,219),USE(?BoxAgeM1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,969,1000,219),USE(?BoxAgeM2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1167,1000,219),USE(?BoxAgeM3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1365,1000,219),USE(?BoxAgeM4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1563,1000,219),USE(?BoxAgeM5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('3-5 yr'),AT(4552,771,729,219),USE(?SrtingAgeM1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('6-8 yr'),AT(4542,979,729,219),USE(?SAgeM2:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('9-11 yr'),AT(4542,1177,729,219),USE(?SAgeM3:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('12-16 yr'),AT(4552,1375,729,219),USE(?SAgeM4:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('Adult'),AT(4542,1573,729,219),USE(?SAgeM5:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         BOX,AT(5604,344,1000,219),USE(?BoxHeadM5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(5604,354,1000,219),USE(?SHeadM5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5604,542,1000,219),USE(?BoxHeadM5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(5604,552,1000,219),USE(?SHeadM5:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5604,760,1000,219),USE(?BoxMedianM1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,969,1000,219),USE(?BoxMedianM2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1167,1000,219),USE(?BoxMedianM3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1365,1000,219),USE(?BoxMedianM4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1563,1000,219),USE(?BoxMedianM5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,344,1000,219),USE(?BoxHeadM6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(6646,354,979,208),USE(?SHeadM6),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6646,542,1000,219),USE(?BoxHeadA6:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(6646,552,979,208),USE(?SHeadM6:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6646,760,1000,219),USE(?BoxHighM1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,969,1000,219),USE(?BoxHighM2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1167,1000,219),USE(?BoxHighM3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1365,1000,219),USE(?BoxHighM4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1563,1000,219),USE(?BoxHighM5:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('20'),AT(5594,771,1000,219),USE(?SClassM1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('15'),AT(5594,979,1000,219),USE(?SClassM2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('13'),AT(5594,1177,1000,219),USE(?SClassM3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('19'),AT(5594,1375,1000,219),USE(?SClassM4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('45'),AT(5594,1573,1000,219),USE(?SClassM5:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('92'),AT(6635,771,1000,219),USE(?SConcM1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('115'),AT(6635,979,1000,219),USE(?SConcM2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('145'),AT(6635,1177,1000,219),USE(?SConcM3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('99'),AT(6635,1375,1000,219),USE(?SConcM4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('153'),AT(6635,1573,1000,219),USE(?SConcM5:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
TGInterp               DETAIL,AT(10,0,8302,1896),USE(?DETAIL9)
                         BOX,AT(719,10,2510,250),USE(?HeadingBoxG),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Total IgG Normal Range'),AT(969,42,2021,229),USE(?HeadingIgM:2),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         BOX,AT(896,542,1000,219),USE(?BoxHeadM1:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(896,552,1000,219),USE(?SHeadM1:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(896,760,1000,219),USE(?BoxAgeG1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,969,1000,219),USE(?BoxAgeG2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1167,1000,219),USE(?BoxAgeG3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1365,1000,219),USE(?BoxAgeG4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(896,1563,1000,219),USE(?BoxAgeG5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('1-2 mo'),AT(948,771,729,219),USE(?SrtingAgeG1),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('3-5 mo'),AT(948,979,729,219),USE(?SAgeG2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('6-9 mo'),AT(948,1177,729,219),USE(?SAgeG3),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('10-11 mo'),AT(948,1375,729,219),USE(?SAgeG4),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('1 yr'),AT(948,1573,729,219),USE(?SAgeG5),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         BOX,AT(1948,344,1000,219),USE(?BoxHeadG2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(1948,375,1000,219),USE(?SHeadG5:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(1948,542,1000,219),USE(?BoxHeadG2:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(1948,552,1000,219),USE(?SHeadG5:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(1948,760,1000,219),USE(?BoxMedianG1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,969,1000,219),USE(?BoxMedianG2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1167,1000,219),USE(?BoxMedianG3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1365,1000,219),USE(?BoxMedianG4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1948,1563,1000,219),USE(?BoxMedianG5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('250'),AT(1948,771,1000,219),USE(?SClassG1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('200'),AT(1948,979,1000,219),USE(?SClassG2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('220'),AT(1948,1177,1000,219),USE(?SClassG3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('290'),AT(1948,1375,1000,219),USE(?SClassG4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('340'),AT(1948,1573,1000,219),USE(?SClassG5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(3000,344,1000,219),USE(?BoxHeadG3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(3000,375,979,208),USE(?SHeadG2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(3000,563,1000,198),USE(?BoxHeadG3:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(3000,552,979,208),USE(?SHeadG2:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(3000,760,1000,219),USE(?BoxHighG1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,969,1000,219),USE(?BoxHighG2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1167,1000,219),USE(?BoxHighG3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1365,1000,219),USE(?BoxHighG4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(3000,1563,1000,219),USE(?BoxHighG5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('900'),AT(3052,771,1000,219),USE(?SConcG1),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('700'),AT(3052,979,1000,219),USE(?SConcG2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('900'),AT(3052,1177,1000,219),USE(?SConcG3),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1070'),AT(3052,1375,1000,219),USE(?SConcG4),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1200'),AT(3052,1573,1000,219),USE(?SConcG5),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         BOX,AT(4552,542,1000,219),USE(?BoxHeadG4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Age'),AT(4552,552,1000,219),USE(?SHeadG4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(4552,760,1000,219),USE(?BoxAgeG1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,969,1000,219),USE(?BoxAgeG2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1167,1000,219),USE(?BoxAgeG3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4552,1365,1000,219),USE(?BoxAgeG4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('2-3 yr'),AT(4542,771,729,219),USE(?SrtingAgeG1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('4-6 yr'),AT(4542,979,729,219),USE(?SAgeG2:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('7-17 yr'),AT(4542,1177,729,219),USE(?SAgeG3:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING('17+ yr'),AT(4542,1375,729,219),USE(?SAgeG4:2),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         BOX,AT(5604,344,1000,219),USE(?BoxHeadG5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(5604,354,1000,219),USE(?SHeadG5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5604,542,1000,219),USE(?BoxHeadG5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(5604,552,1000,219),USE(?SHeadM5:5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5604,760,1000,219),USE(?BoxMedianG1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,969,1000,219),USE(?BoxMedianG2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1167,1000,219),USE(?BoxMedianG3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,1365,1000,219),USE(?BoxMedianG4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,344,1000,219),USE(?BoxHeadG6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Upper Range'),AT(6646,354,979,208),USE(?SHeadG6),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6646,542,1000,219),USE(?BoxHeadG6:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('(mg/dL)'),AT(6646,552,979,208),USE(?SHeadMG:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6646,760,1000,219),USE(?BoxHighG1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,969,1000,219),USE(?BoxHighG2:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1167,1000,219),USE(?BoxHighG3:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,1365,1000,219),USE(?BoxHighG4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('420'),AT(5604,771,1000,219),USE(?SClassG1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('460'),AT(5604,979,1000,219),USE(?SClassG2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('750'),AT(5604,1177,1000,219),USE(?SClassG3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('700'),AT(5604,1375,1000,219),USE(?SClassG4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1200'),AT(6646,771,1000,219),USE(?SConcG1:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1240'),AT(6646,979,1000,219),USE(?SConcG2:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1752'),AT(6646,1177,1000,219),USE(?SConcG3:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('1600'),AT(6646,1375,1000,219),USE(?SConcG4:2),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
HeaderGAMnoE           DETAIL,AT(10,0,8302,219),USE(?DETAIL10)
                         BOX,AT(5563,0,1990,229),USE(?Box15:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal Range'),AT(5969,21,1042,208),USE(?S71:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                       END
HeaderGAM              DETAIL,AT(10,0,8302,385),USE(?DETAIL11)
                         BOX,AT(1760,177,2698,219),USE(?Box14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Immunoglobulin'),AT(2385,219,1438,208),USE(?S44:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5563,10,969,375),USE(?BoxLowerRange:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6573,10,969,375),USE(?BoxUpperRange:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4573,10,896,375),USE(?BoxGAMScore),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Lower Range'),AT(5531,10,969,188),USE(?S72:6),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('(mg/dL)'),AT(5750,167,646,208),USE(?S72:9),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Upper Range'),AT(6563,10,969,188),USE(?S71:2),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('(mg/dL)'),AT(6698,177,729,208),USE(?S72:7),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc'),AT(4573,10,938,208),USE(?S72:8),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('(mg/dL)'),AT(4677,208,656,208),USE(?S72:10),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
NormalGAM              DETAIL,AT(10,0,8302,250),USE(?DETAIL12)
                         BOX,AT(5563,10,969,219),USE(?BoxUpperRange),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1760,0,2698,219),USE(?BoxLowerRange),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4573,0,896,219),USE(?BoxConcGAM:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@n4),AT(5573,21,667,188),USE(GAM:LowerRange),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         STRING(@n4),AT(6552,21,667,188),USE(GAM:UpperRange),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                         BOX,AT(729,10,948,219),USE(?GAMLevelBox:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6573,10,969,219),USE(?Box18:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal'),AT(844,42,677,188),USE(?Elevated:4),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s10),AT(1917,21,2323,188),USE(RES:Description,,?RES:Description:8),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s4),AT(4542,21,667,188),USE(locScoreGAM,,?locScoreGAM:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                       END
ElevatedGAM            DETAIL,AT(10,0,8302,250),USE(?DETAIL13)
                         BOX,AT(5563,10,969,219),USE(?Box6:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1760,10,2698,219),USE(?Box4:15),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4573,0,896,219),USE(?BoxConcGAM),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,0,948,219),USE(?GAMLevelBox:2),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING(@n4),AT(5573,52,667,219),USE(GAM:LowerRange,,?GAM:LowerRange:E),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@n4),AT(6563,52,667,219),USE(GAM:UpperRange,,?GAM:UpperRange:E),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         BOX,AT(6573,10,969,229),USE(?Box18:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(4542,42,667,219),USE(locScoreGAM,,?locScoreGAM:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('Elevated'),AT(844,31,677,219),USE(?Elevated:3),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s10),AT(1917,31,2323,188),USE(RES:Description,,?RES:Description:14),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
DepressedGAM           DETAIL,AT(10,0,8302,250),USE(?DETAIL14)
                         BOX,AT(5563,10,969,219),USE(?Box6:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1760,10,2698,219),USE(?Box4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,10,948,219),USE(?GAMLevelBox),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(6573,10,969,229),USE(?Box18:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(4542,52,667,219),USE(locScoreGAM),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         BOX,AT(4573,10,896,219),USE(?BoxConcGAM:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@n4),AT(5573,52,667,219),USE(GAM:LowerRange,,?GAM:LowerRange:D),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@n4),AT(6563,52,667,219),USE(GAM:UpperRange,,?GAM:UpperRange:D),FONT(,,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('Depressed'),AT(844,31,677,219),USE(?Elevated:2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s10),AT(1917,31,2323,188),USE(RES:Description,,?RES:Description:15),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
HeaderTE               DETAIL,AT(10,0,8302,219),USE(?DETAIL15)
                         BOX,AT(2687,0,2698,219),USE(?Box14:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,1031,219),USE(?Box16:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6531,0,1167,229),USE(?Box15:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Immunoglobulin'),AT(2990,21,2125,208),USE(?S44:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Normal Range'),AT(6594,21,1042,208),USE(?S71),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING('Conc'),AT(5490,21,906,208),USE(?S72:12),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
TElevated              DETAIL,AT(10,0,8302,250),USE(?DETAIL16)
                         BOX,AT(5437,-10,1031,219),USE(?Box6:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,-10,2698,229),USE(?Box4:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:2),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(6531,-10,1167,229),USE(?Box18:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('>>'),AT(1375,21),USE(?S81:4),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s16),AT(6604,10,1042),USE(gloTotalERange),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Elevated'),AT(1750,10,677,219),USE(?Elevated:5),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('Total IgE'),AT(2958,10,2323,188),USE(?RES:Description:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s14),AT(5437,10,958,208),USE(gloTotalEScore,,?gloTotalConc:1),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
TENormal               DETAIL,AT(10,0,8302,250),USE(?DETAIL17)
                         BOX,AT(5437,0,1031,219),USE(?Box6:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,229),USE(?Box4:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6531,0,1167,229),USE(?Box18:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal'),AT(1750,31,677,219),USE(?Normal:3),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('Total IgE'),AT(2958,31,2323,188),USE(?RES:Description:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s14),AT(5437,31,958,208),USE(gloTotalEScore,,?gloTotalConc:2),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s16),AT(6604,31,1042,208),USE(gloTotalERange,,?gloTotalRange:3),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
TEquivocal             DETAIL,AT(10,0,8302,250),USE(?DETAIL18)
                         BOX,AT(5437,10,1031,219),USE(?Box6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6604,42,1042),USE(gloTotalERange,,?gloTotalRange:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(2687,10,2698,219),USE(?Box4:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,10,948,219),USE(?LevelBox),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(6531,0,1167,229),USE(?Box18:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Equivocal'),AT(1750,42,677,219),USE(?Equivocal:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Total IgE'),AT(2958,42,2323,188),USE(?RES:Description:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s14),AT(5437,42,958,208),USE(gloTotalEScore,,?gloTotalConc:3),FONT(,10,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('>'),AT(1375,21),USE(?S81),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                       END
NoAbnormal             DETAIL,AT(0,0,8000,729),USE(?Detail:2)
                         STRING('No Abnormal Laboratory Findings'),AT(94,177,7938,271),USE(?String123),FONT(,14,,FONT:bold), |
  CENTER,TRN
                       END
Detail                 DETAIL,AT(0,0,8000,115),USE(?Detail)
                         LINE,AT(42,292,0,1000),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,1000),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(0,1000,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
Elevated               DETAIL,AT(10,0,8302,250),USE(?DETAIL19)
                         BOX,AT(5979,0,1115,208),USE(?Box6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(7156,0,542,219),USE(?Box18:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Elevated'),AT(1750,31,677,208),USE(?Elevated),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2958,31,2500,208),USE(RES:Description,,?RES:Description:11),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,31,1031,208),USE(RES:Conc,,?RES:Conc:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>>'),AT(1375,63),USE(?S81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5531,31,281,208),USE(RES:Score,,?RES:Score:10),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovPositive            DETAIL,AT(10,10,8302,250),USE(?DETAIL19:2)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(719,-21,948,208),USE(?LevelBox:3),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,219),USE(?Box18),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Positive'),AT(844,10,677,208),USE(?Elevated:6),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(1875,10,2500,208),USE(RES:Description,,?RES:Description:7),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                         STRING('>>'),AT(469,10),USE(?S81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(4625,10,281,208),USE(RES:Score,,?RES:Score:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6240,-21,1175,208),USE(?Box6:15),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU,,?RES:BAU:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovNegative            DETAIL,AT(10,10,8302,250),USE(?CovNegative)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:13),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(708,-21,948,208),USE(?LevelBox:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,208),USE(?Box18:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6240,-21,1175,208),USE(?Box6:16),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Negative'),AT(844,10,677,208),USE(?Normal:2),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(1865,10,2500,208),USE(RES:Description,,?RES:Description:12),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc,,?RES:Conc:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s3),AT(4615,10,281,208),USE(RES:Score,,?RES:Score:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU,,?RES:BAU:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovEquivocal           DETAIL,AT(10,10,8302,250),USE(?CovEquivocal)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:16),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,-21,948,208),USE(?LevelBox:8),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,208),USE(?Box18:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6240,-21,1175,208),USE(?Box6:14),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Borderline'),AT(896,10,677,208),USE(?Equivocal:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(1885,10,2500,208),USE(RES:Description,,?RES:Description:17),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc,,?RES:Conc:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>'),AT(562,10),USE(?S81:5),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(4635,10,281,208),USE(RES:Score,,?RES:Score:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
CovNegativeM           DETAIL,AT(10,10,8302,250),USE(?CovNegative:2)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:17),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(719,-21,948,208),USE(?LevelBox:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,208),USE(?Box18:10),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Negative'),AT(844,10,677,208),USE(?Normal),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(1865,10,2500,208),USE(RES:Description,,?RES:Description:18),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc,,?RES:Conc:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@s3),AT(4635,10,281,208),USE(RES:Score,,?RES:Score:12),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6240,-21,1175,208),USE(?Box6:13),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU,,?RES:BAU:5),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovPositiveM           DETAIL,AT(10,0,8302,250),USE(?DETAIL19:3)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:14),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(719,-21,948,208),USE(?LevelBox:7),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,208),USE(?Box18:9),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Positive'),AT(844,10,677,208),USE(?Elevated:7),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(1875,10,2500,208),USE(RES:Description,,?RES:Description:13),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc,,?RES:Conc:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>>'),AT(469,10),USE(?S81:6),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(4635,10,281,208),USE(RES:Score,,?RES:Score:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6240,-21,1175,208),USE(?Box6:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU,,?RES:BAU:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovEquivocalM          DETAIL,AT(10,10,8302,250),USE(?CovEquivocal:2)
                         BOX,AT(5083,-21,1115,208),USE(?Box6:17),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4541,-21,479,208),USE(?Box5:12),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,-21,2698,208),USE(?Box4:18),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,-21,948,208),USE(?LevelBox:10),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(7480,-21,440,208),USE(?Box18:13),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7480,10,440,208),USE(RES:Type,,?RES:Type:7),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Borderline'),AT(896,10,677,208),USE(?Equivocal),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(1885,10,2500,208),USE(RES:Description,,?RES:Description:19),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5073,10,1031,208),USE(RES:Conc,,?RES:Conc:7),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>'),AT(562,10),USE(?S81:7),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(4635,10,281,208),USE(RES:Score,,?RES:Score:13),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(6240,-21,1175,208),USE(?Box6:18),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s16),AT(6240,10,1175,208),USE(RES:BAU,,?RES:BAU:6),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CovSubHeading          DETAIL,AT(10,10,8302,229),USE(?CovSubHeading)
                         BOX,AT(5083,10,1115,219),USE(?Box16:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1792,10,2698,219),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(4542,10,479,219),USE(?Box15),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6240,10,1175,219),USE(?Box16:15),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Class'),AT(4542,20,479,219),USE(?S71:4),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (�g/mL)'),AT(5083,20,1115,219),USE(?S72:13),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s32),AT(1792,20,2698,208),USE(locPollen),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('WHO (BAU/mL)'),AT(6250,20,1180,219),USE(?S72:20),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
LabSubHeading          DETAIL,AT(10,10,8302,229),USE(?DETAIL22)
                         BOX,AT(5979,10,1115,219),USE(?Box16:14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7120,10,542,219),USE(?Box16:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,10,2698,219),USE(?Box14:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,10,479,219),USE(?Box15:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(' Class'),AT(5437,31),USE(?S71:5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Type'),AT(7220,31,365),USE(?S71:6),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('Conc'),AT(5979,31,1115,208),USE(?S72:19),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s32),AT(2687,21,2698,208),USE(locPollen,,?locPollen:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
LabEquivocal           DETAIL,AT(10,10,8302,250),USE(?DETAIL21:2)
                         BOX,AT(5979,0,1115,219),USE(?Box6:22),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:18),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:24),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7120,0,542,219),USE(?Box18:17),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:11),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2958,21,2396,208),USE(RES:Description,,?RES:Description:25),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,10,1031,208),USE(RES:Conc,,?RES:Conc:11),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@s3),AT(5531,10,281,208),USE(RES:Score,,?RES:Score:19),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
LabPositive            DETAIL,AT(10,0,8302,250),USE(?DETAIL19:4)
                         BOX,AT(5979,0,1115,219),USE(?Box6:19),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:13),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:19),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7120,0,542,219),USE(?Box18:14),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7220,31,365,208),USE(RES:Type,,?RES:Type:8),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2958,31,2396,208),USE(RES:Description,,?RES:Description:20),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,31,1031,208),USE(RES:Conc,,?RES:Conc:8),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@s3),AT(5531,31,281,208),USE(RES:Score,,?RES:Score:14),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Positive               DETAIL,AT(10,0,8302,250),USE(?DETAIL19:5)
                         BOX,AT(5979,0,1115,208),USE(?Box6:20),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:12),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(7120,0,542,219),USE(?Box18:15),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7220,31,365,208),USE(RES:Type,,?RES:Type:9),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Positive'),AT(1750,31,677,208),USE(?Elevated:9),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2958,31,2396,208),USE(RES:Description,,?RES:Description:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,31,1031,208),USE(RES:Conc,,?RES:Conc:9),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>>'),AT(1375,63),USE(?S81:10),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5531,31,281,208),USE(RES:Score,,?RES:Score:2),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Negative               DETAIL,AT(10,0,8302,250),USE(?DETAIL20:2)
                         BOX,AT(5979,0,1115,219),USE(?Box6:21),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:16),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:20),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:13),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7156,0,542,219),USE(?Box18:16),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:10),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Negative'),AT(1760,31,677,208),USE(?Normal:4),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2958,31,2396,208),USE(RES:Description,,?RES:Description:21),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,31,1031,208),USE(RES:Conc,,?RES:Conc:10),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@s3),AT(5531,31,281,208),USE(RES:Score,,?RES:Score:17),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Normal                 DETAIL,AT(10,0,8302,250),USE(?DETAIL20:3)
                         BOX,AT(5979,0,1115,219),USE(?Box6:23),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:17),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:21),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:15),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(7156,0,542,219),USE(?Box18:18),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:12),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Normal'),AT(1760,31,677,208),USE(?Normal:5),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2958,31,2396,208),USE(RES:Description,,?RES:Description:24),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,31,1031,208),USE(RES:Conc,,?RES:Conc:12),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING(@s3),AT(5531,31,281,208),USE(RES:Score,,?RES:Score:18),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
Equivocal              DETAIL,AT(10,10,8302,250),USE(?DETAIL21)
                         BOX,AT(5979,0,1115,219),USE(?Box6:24),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,0,479,219),USE(?Box5:19),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,0,2698,219),USE(?Box4:25),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,219),USE(?LevelBox:16),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(7156,10,542,219),USE(?Box18:19),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(7229,31,365,208),USE(RES:Type,,?RES:Type:13),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equivocal'),AT(1792,31,677,208),USE(?Equivocal:5),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2958,21,2396,208),USE(RES:Description,,?RES:Description:26),FONT(,,,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                         STRING(@s13),AT(5979,10,1031,208),USE(RES:Conc,,?RES:Conc:13),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                         STRING('>'),AT(1458,63),USE(?S81:11),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s3),AT(5531,10,281,208),USE(RES:Score,,?RES:Score:20),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
SubHeading             DETAIL,AT(10,10,8302,229),USE(?DETAIL22:2)
                         BOX,AT(5979,10,1115,219),USE(?Box16:16),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2687,10,2698,219),USE(?Box14:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5437,10,479,219),USE(?Box15:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING(' Class'),AT(5437,31),USE(?S71:7),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Conc'),AT(5979,31,1115,208),USE(?S72:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s32),AT(2687,21,2698,208),USE(locPollen,,?locPollen:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
SumHead                DETAIL,AT(10,10,8302,385),USE(?DETAIL23),PAGEBEFORE(-1)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,10,6594,354),USE(?locHeading:9),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
SumSubHead             DETAIL,AT(10,10,8302,240),USE(?DETAIL24)
                         BOX,AT(5604,10,479,250),USE(?Box5:20),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Box4:26),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6167,10,542,250),USE(?Box18:20),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Allergen'),AT(3479,21,1177,208),USE(?RES:Description:27),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,21,396,208),USE(?RES:Score:21),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Type'),AT(6292,21),USE(?RES:Type:14),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                       END
SElevated              DETAIL,AT(10,10,8302,250),USE(?DETAIL25)
                         BOX,AT(5604,0,479,219),USE(?Box5:21),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,219),USE(?Box4:27),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6177,0,542,229),USE(?Box18:21),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6292,31),USE(RES:Type,,?RES:Type:15),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                         STRING(@s40),AT(2854,31),USE(RES:Description,,?RES:Description:28),FONT(,,,FONT:bold,CHARSET:ANSI), |
  LEFT,TRN
                         STRING(@s3),AT(5698,31),USE(RES:Score,,?RES:Score:22),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       END
SEquivocal             DETAIL,AT(10,10,8302,250),USE(?DETAIL26)
                         BOX,AT(5604,0,479,219),USE(?Box5:22),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,219),USE(?Box4:28),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6177,0,542,219),USE(?Box18:22),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6281,21,354,208),USE(RES:Type,,?RES:Type:16),FONT(,,,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING(@s40),AT(2833,21),USE(RES:Description,,?RES:Description:29),FONT(,,,FONT:bold,CHARSET:ANSI), |
  LEFT,TRN
                         STRING(@s3),AT(5688,21,281,208),USE(RES:Score,,?RES:Score:23),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
STotalElevated         DETAIL,AT(0,0,8260,250),USE(?DETAIL27)
                         BOX,AT(2687,0,2698,250),USE(?Box14:5),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         STRING(@s20),AT(3115,31,1802,167),USE(locTotalType,,?locTotalType:2),FONT(,10,COLOR:Black, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         BOX,AT(5437,0,1656,250),USE(?Box14:6),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('Elevated for Age'),AT(5469,31,1573,167),USE(?STRING1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER(6),TRN
                       END
STotalDepressed        DETAIL,AT(0,0,8260,250),USE(?DETAIL28)
                         BOX,AT(2687,0,2698,250),USE(?Box14:8),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         STRING(@s20),AT(3115,42,1802,167),USE(locTotalType),FONT(,10,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         BOX,AT(5437,0,1677,250),USE(?Box14:9),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         STRING('Depressed for Age'),AT(5469,42,1573,167),USE(?STRING2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(00D2FFD2h),TRN
                       END
ASR                    DETAIL,AT(10,10,8302,833),USE(?DETAIL29),FONT(,8)
                         STRING('Gluten IgA test was developed and its performance characteristics determined by' & |
  ' Allermetrix.   It has not been cleared nor approved by the FDA. '),AT(698,10,7219,177), |
  USE(?S198),TRN
                         STRING('The laboratory is regulated under CLIA as qualified to perform high-complexity testing. '), |
  AT(698,167,6875,177),USE(?S198:3),TRN
                         STRING('� *-HD (High Definition)�  indicates the reagent was prepared by fortifying ext' & |
  'ract with purified natural allergen protein.'),AT(646,406,7219,208),USE(?S198:2),TRN
                       END
PatientInfo            DETAIL,AT(10,10,8302,958),USE(?DETAIL30),PAGEBEFORE(-1)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:10),FONT(, |
  16,COLOR:Black),CENTER,TRN
                         TEXT,AT(260,302,7552,615),USE(locPatientText),FONT(,8),BOXED
                       END
PatSubHead             DETAIL,AT(10,0,8302,219),USE(?DETAIL31)
                         BOX,AT(2792,0,2698,219),USE(?Box4:29),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Allergen'),AT(3469,31,1177,188),USE(?RES:Description:30),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
PElevated              DETAIL,AT(10,0,8302,250),USE(?DETAIL32)
                         BOX,AT(2792,0,2698,219),USE(?Box4:30),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2958,31,2354,208),USE(RES:Description,,?D:8),FONT(,,,FONT:bold,CHARSET:ANSI), |
  LEFT,TRN
                       END
Text                   DETAIL,AT(10,10,8302,6000),USE(?DETAIL33),PAGEAFTER(-1)
                         TEXT,AT(31,21,7958,5948),USE(DOC:Body),FONT('Arial',12,,,CHARSET:ANSI),RTF(TEXT:Field),LEFT, |
  BOXED,RESIZE
                       END
PeanutInterp           DETAIL,AT(10,0,8292,2531),USE(?DETAIL1:2),FONT(,,,FONT:bold)
                         BOX,AT(1000,104,2800,250),USE(?PeanutBox1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,354,2800,250),USE(?PeanutBoxF360),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,604,2800,250),USE(?PeanutBoxSA),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,854,2800,250),USE(?PeanutBoxF359),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1354,2802,250),USE(?PeanutBoxSA6),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s20),AT(3854,1385,802,198),USE(locSpecificActivityString6),TRN
                         BOX,AT(1000,1104,2800,250),USE(?PeanutBoxF372),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1604,2800,250),USE(?PeanutBoxThreshold),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,1854,2800,250),USE(?PeanutBoxF013),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2104,2800,250),USE(?PeanutBoxF095),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2354,2800,250),USE(?PeanutBoxF020),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1000,2604,2800,250),USE(?PeanutBoxF018),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,104,2010,250),USE(?PeanutBox21),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,354,2010,250),USE(?PeanutBoxF202),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,604,2010,250),USE(?PeanutBoxF103),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,854,2010,250),USE(?PeanutBoxF017),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1104,2010,250),USE(?PeanutBoxF201),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1354,2010,250),USE(?PeanutBoxF203),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1604,2010,250),USE(?PeanutBoxF317),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,1854,2010,250),USE(?PeanutBoxF010),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2396,2010,250),USE(?PeanutBoxT146),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2646,2010,250),USE(?PeanutBoxW006),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5000,2896,2010,250),USE(?PeanutBoxG006),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@S8),AT(3854,635,802),USE(locSpecificActivityString),TRN
                         STRING('True Peanut Risk Factors (IgE)'),AT(1104,130,2573,229),USE(?PeanutText1),FONT(,,COLOR:White, |
  ,CHARSET:ANSI),CENTER,TRN
                         STRING('1.  Ara h 2'),AT(1104,375,2281,198),USE(?PeanutText2),TRN
                         STRING('2.  Ara h 2 specific activity'),AT(1104,625,2573,198),USE(?PeanutText3),TRN
                         STRING('3.  Ara h 1'),AT(1104,875,2281,198),USE(?PeanutText4),TRN
                         STRING('4.  Ara h 6'),AT(1104,1125,2281,198),USE(?PeanutText372),TRN
                         STRING('5.  Ara h 6 specific activity'),AT(1104,1385,2281,198),USE(?PeanutText372:2),TRN
                         STRING('6.  Peanut-HD'),AT(1104,1625,2281,198),USE(?PeanutText21),TRN
                         STRING('7.  Peanut-HD =>15 kU/L '),AT(1104,1875,2281,198),USE(?PeanutText22),TRN
                         STRING('8.  Peach (food)'),AT(1104,2125,2281,198),USE(?PeanutText23),TRN
                         STRING('9.  Almond (Ara h 2 cross-reactive) '),AT(1104,2375,2573,198),USE(?PeanutText24),TRN
                         STRING('10.  Brazil Nut (Ara h 2 cross-reactive)'),AT(1104,2667,2601,198),USE(?PeanutText25), |
  TRN
                         BOX,AT(5000,2146,2010,250),USE(?PeanutBox21:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Tree Nuts (IgE)'),AT(5042,125,2000,229),USE(?PeanutText27),FONT(,,COLOR:White),CENTER, |
  TRN
                         STRING('Cashew'),AT(5104,375,1208,198),USE(?PeanutText28),TRN
                         STRING('Chestnut'),AT(5104,625,1208,198),USE(?PeanutText29),TRN
                         STRING(@s2),AT(583,625,344,208),USE(locIndicatorSA),RIGHT,TRN
                         STRING('Hazelnut /Filbert'),AT(5104,875,1208,198),USE(?PeanutText30),TRN
                         STRING('Pecan'),AT(5104,1125,1208,198),USE(?PeanutText31),TRN
                         STRING('Pistachio'),AT(5104,1375,1208,198),USE(?PeanutText32),TRN
                         STRING('Walnut, English'),AT(5104,1625,1208,198),USE(?PeanutText33),TRN
                         STRING('Sesame Seed'),AT(5104,1875,1208,198),USE(?PeanutText34),TRN
                         STRING('Cross Reacting Pollen (IgE)'),AT(5000,2167,2000,198),USE(?PeanutText27:2),FONT(,,COLOR:White), |
  CENTER,TRN
                         STRING('Birch, River (tree)'),AT(5083,2417,1208,198),USE(?PeanutText41),TRN
                         STRING('Mugwort (weed)'),AT(5083,2667,1208,198),USE(?PeanutText42),TRN
                         STRING('Timothy (grass)'),AT(5083,2948,1208,198),USE(?PeanutText43),TRN
                         STRING(@s24),AT(615,1625,344,208),USE(locThreshold),RIGHT,TRN
                         STRING(@s2),AT(583,375,344,208),USE(locIndicatorF360,,?locIndicatorF360:2),RIGHT,TRN
                         STRING(@s2),AT(583,875,344,208),USE(locIndicatorF359),RIGHT,TRN
                         STRING(@s2),AT(583,1125,344,208),USE(locIndicatorF372),RIGHT,TRN
                         STRING(@s2),AT(615,1885,344,208),USE(locIndicatorF013),RIGHT,TRN
                         STRING(@s2),AT(615,2125,344,208),USE(locIndicatorF095),RIGHT,TRN
                         STRING(@s2),AT(615,2354,344,208),USE(locIndicatorF020),RIGHT,TRN
                         STRING(@s2),AT(615,2604,344,208),USE(locIndicatorF018),RIGHT,TRN
                         STRING(@s2),AT(4583,1875,344,208),USE(locIndicatorF010),RIGHT,TRN
                         STRING(@s2),AT(4583,375,344,208),USE(locIndicatorF202),RIGHT,TRN
                         STRING(@s2),AT(4583,625,344,208),USE(locIndicatorF103),RIGHT,TRN
                         STRING(@s2),AT(4583,875,344,208),USE(locIndicatorF017),RIGHT,TRN
                         STRING(@s2),AT(4583,1125,344,208),USE(locIndicatorF201),RIGHT,TRN
                         STRING(@s2),AT(4573,1375,354,208),USE(locIndicatorF203),RIGHT,TRN
                         STRING(@s2),AT(4583,1625,344,208),USE(locIndicatorF317),RIGHT,TRN
                         STRING(@s2),AT(4562,2417,344,208),USE(locIndicatorT146),RIGHT,TRN
                         STRING(@s2),AT(4562,2667,344,208),USE(locIndicatorW006),RIGHT,TRN
                         STRING(@s2),AT(4562,2917,344,208),USE(locIndicatorG006),RIGHT,TRN
                         STRING('*-Specific activity (%) = specific IgE Ara h 2 (kU/L) / Total IgE (kU/L)'),AT(760, |
  2870),USE(?PeanutFootNote:1),FONT(,8,,FONT:regular),TRN
                         STRING('*-Specific activity (%) = specific IgE Ara h 6 (kU/L) / Total IgE (kU/L)'),AT(760, |
  3000),USE(?PeanutFootNote:2),FONT(,8,,FONT:regular),TRN
                         STRING('( > indicates equivocal,    >> indicates elevated level )'),AT(2156,-100),USE(?PeanutFootNote:3), |
  FONT(,9,,FONT:regular),TRN
                         STRING(@s2),AT(583,1375,344,208),USE(locIndicatorSA6),RIGHT,TRN
                       END
Graph                  DETAIL,AT(104,0,7823),USE(?Detail:Graph),FONT(,10)
                         STRING('Laboratory Assessment of Risk for Clinical Reaction to Peanut'),AT(860,0,,281),USE(?String78), |
  FONT(,14,,FONT:bold),TRN
                         STRING(@n2),AT(6604,302,479),USE(locScore),FONT(,24,,FONT:bold),RIGHT,TRN
                         STRING(' / 10'),AT(7042,302,781,427),USE(?String97),FONT(,24,,FONT:bold),LEFT,TRN
                         IMAGE('Gradient.jpg'),AT(800,300,5844,400),USE(?GraphBar)
                         BOX,AT(800,250,6000,400),USE(?GraphBorder),COLOR(COLOR:Black),LINEWIDTH(10)
                         BOX,AT(800,250,5740,400),USE(?CoverGraph),COLOR(COLOR:White),FILL(COLOR:White),LINEWIDTH(1)
                         STRING(' 0 {12}1 {12}2 {12}3 {13}4 {13}5 {12}6 {12}7 {12}8 {12}9 {12}10'),AT(760,700,,167), |
  USE(?String77),FONT(,,,FONT:bold),LEFT,TRN
                         STRING('Number of Risk Factors'),AT(875,880,5562),USE(?STRING3),FONT(,,,FONT:bold),CENTER
                       END
Risk7                  DETAIL,AT(104,0,7844,175),USE(?Detail:Risk1)
                         STRING('Risk of true peanut allergy increases with the presence of elevated Ara h 1, Ar' & |
  'a h 2, or Ara h 6  concentrations'),AT(550,0),USE(?StringRisk1),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk1                  DETAIL,AT(104,0,7833,200),USE(?Detail:Risk1:2)
                         STRING('The level of Ara h 2 specific IgE tends to correlate with the severity of respo' & |
  'nse in peanut allergic individuals'),AT(550,0),USE(?StringRisk1:2),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk2                  DETAIL,AT(104,0,7885,200),USE(?Detail:Risk2)
                         STRING('Up to 50% of peanut allergic individuals develop clinical tree nut allergy'),AT(550, |
  0,4719),USE(?StringRisk2),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk3                  DETAIL,AT(104,0,10740,200),USE(?Detail:Risk3)
                         STRING('Risk of peanut anaphylaxis increases at peanut specific IgE levels above 15kU/L'), |
  AT(550,0),USE(?StringRisk3),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk8                  DETAIL,AT(104,0,10740,200),USE(?Detail:Risk8)
                         STRING('About 20% of peanut IgE positive patients have "true" peanut allergy and may ex' & |
  'hibit clinical reactions'),AT(550,0),USE(?StringRisk3:2),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk9                  DETAIL,AT(104,0,10740,200),USE(?Detail:Risk9)
                         STRING('Peanut allergy effects about 1% of the US population and only 20% of those pati' & |
  'ents will outgrow the allergy'),AT(550,0),USE(?StringRisk3:3),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk10                 DETAIL,AT(104,0,10740,200),USE(?Detail:Risk10)
                         STRING('Elevated levels of Ara h 6 with undetected Ara h 2 may occur in up to 4% of pos' & |
  'itive patients'),AT(550,0),USE(?StringRisk3:4),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:7),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk11                 DETAIL,AT(104,0,10740,200),USE(?Detail:Risk11)
                         STRING('Patients with either Ara h 2 or Ara h 6 specific activity of 2% or greater are ' & |
  'likely to have a clinical reaction'),AT(550,0),USE(?StringRisk3:5),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk4                  DETAIL,AT(104,0,8000,200),USE(?Detail:Risk4)
                         STRING('Clinical peach allergy increases risk of true peanut allergy'),AT(550,0),USE(?StringRisk4), |
  TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk5                  DETAIL,AT(104,0,8000,200),USE(?Detail:Risk5)
                         STRING('True peanut allergic patients with positive tree nut allergy are at increased r' & |
  'isk of sesame seed allergy'),AT(550,0),USE(?StringRisk5),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:10),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Risk6                  DETAIL,AT(104,10,8000,375),USE(?Detail:Risk6)
                         TEXT,AT(550,0,7219),USE(locRisk6),TRN
                         ELLIPSE,AT(385,50,50,50),USE(?ELLIPSE1:11),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
Disclaimer             DETAIL,AT(104,0,7833,500),USE(?Detail:Disclaimer)
                         TEXT,AT(550,0,6240),USE(locDisclaimer),FONT(,,,FONT:bold,CHARSET:ANSI)
                         ELLIPSE,AT(385,85,50,50),USE(?ELLIPSE1:12),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                       END
PageBreak              DETAIL,AT(10,0,8302),USE(?DETAIL34),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10500,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD, CC'),AT(21,52,1656,271),USE(?String40),FONT('Arial',8, |
  ,FONT:regular),TRN
                         TEXT,AT(1667,0,5281,563),USE(locASR),FONT('Vrinda',8,,FONT:regular),BOXED
                         STRING('Medical Laboratory Director'),AT(21,156,1469,188),USE(?String40:2),FONT('Arial',8, |
  ,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7260,188,698,135),USE(?PageCount),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------


GetResults          ROUTINE

!  IF gloOK > 0 THEN EXIT.
!  gloOK += 1
!  recs# = RECORDS(Results)
  
  
  
  
! stop('GetResdults Routine: ' & recs# & ' ok=' & gloOK)
 
 
 
 
  locTestCount = 0
  LOOP locNDX = 1 TO RECORDS(Results)
    GET(Results,locNDX)
    IF RES:Type <> 'IgE' THEN CYCLE.    
 CASE RES:Code
 OF 'F317'
    locTestCount += 1
    locF317 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF317{PROP:Fill} = COLOR:Equivocal
      locIndicatorF317 = '>'
    ELSE
      ?PeanutBoxF317{PROP:Fill} = COLOR:Positive
      locIndicatorF317 = '>>'
      
    .
 OF 'T146'
    locTestCount += 1
    locT146 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxT146{PROP:Fill} = COLOR:Equivocal
      locIndicatorT146 = '>'
    ELSE
      ?PeanutBoxT146{PROP:Fill} = COLOR:Positive
      locIndicatorT146 = '>>'
    .
 OF 'W006'
    locTestCount += 1
    locW006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxW006{PROP:Fill} = COLOR:Equivocal
      locIndicatorW006 = '>'
    ELSE
      ?PeanutBoxW006{PROP:Fill} = COLOR:Positive
      locIndicatorW006 = '>>'
      
    .
 OF 'G006'
    locTestCount += 1
    locG006 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxG006{PROP:Fill} = COLOR:Equivocal
      locIndicatorG006 = '>'
    ELSE
      ?PeanutBoxG006{PROP:Fill} = COLOR:Positive
      locIndicatorG006 = '>>'
      
    .

 OF 'F360'
    locTestCount += 1
    locF360 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF360{PROP:Fill} = COLOR:Equivocal
      locIndicatorF360 = '>'
    ELSE
      ?PeanutBoxF360{PROP:Fill} = COLOR:Positive
      locIndicatorF360 = '>>'
      locScore += 1
    .
 OF 'F359'
    locTestCount += 1
    locF359 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF359{PROP:Fill} = COLOR:Equivocal
      locIndicatorF359 = '>'
    ELSE
      ?PeanutBoxF359{PROP:Fill} = COLOR:Positive
      locIndicatorF359 = '>>'
      locScore += 1
    .
 OF 'F013'
    locTestCount += 1
    locF013 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxThreshold{PROP:Fill} = COLOR:Equivocal
      locThreshold = '>'
    ELSE
      ?PeanutBoxThreshold{PROP:Fill} = COLOR:Positive
      locThreshold = '>>'
      locScore += 1
    .
 OF 'F095'
    locTestCount += 1
    locF095 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF095{PROP:Fill} = COLOR:Equivocal
      locIndicatorF095 = '>'
    ELSE
      ?PeanutBoxF095{PROP:Fill} = COLOR:Positive
      locIndicatorF095 = '>>'
      locScore += 1
    .
 OF 'F020'
    locTestCount += 1
    locF020 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF020{PROP:Fill} = COLOR:Equivocal
      locIndicatorF020 = '>'
    ELSE
      ?PeanutBoxF020{PROP:Fill} = COLOR:Positive
      locIndicatorF020 = '>>'
      locScore += 1
    .
 OF 'F018'
    locTestCount += 1
    locF018 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF018{PROP:Fill} = COLOR:Equivocal
      locIndicatorF018 = '>'
    ELSE
      ?PeanutBoxF018{PROP:Fill} = COLOR:Positive
      locIndicatorF018 = '>>'
      locScore += 1
    .
        
        
        
        
        
 OF 'F010'
    locTestCount += 1
    locF010 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF010{PROP:Fill} = COLOR:Equivocal
      locIndicatorF010 = '>'
    ELSE
      ?PeanutBoxF010{PROP:Fill} = COLOR:Positive
      locIndicatorF010 = '>>'
    .
 OF 'F202'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF202{PROP:Fill} = COLOR:Equivocal
      locIndicatorF202 = '>'
    ELSE
      ?PeanutBoxF202{PROP:Fill} = COLOR:Positive
      locIndicatorF202 = '>>'
      
    .
 OF 'F103'
    locTestCount += 1
    locF202 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF103{PROP:Fill} = COLOR:Equivocal
      locIndicatorF103 = '>'
    ELSE
      ?PeanutBoxF103{PROP:Fill} = COLOR:Positive
      locIndicatorF103 = '>>'
      
    .
 OF 'F017'
    locTestCount += 1
    locF017 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF017{PROP:Fill} = COLOR:Equivocal
      locIndicatorF017 = '>'
    ELSE
      ?PeanutBoxF017{PROP:Fill} = COLOR:Positive
      locIndicatorF017 = '>>'
      
    .
 OF 'F201'
    locTestCount += 1
    locF201 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF201{PROP:Fill} = COLOR:Equivocal
      locIndicatorF201 = '>'
    ELSE
      ?PeanutBoxF201{PROP:Fill} = COLOR:Positive
      locIndicatorF201 = '>>'
      
    .
 OF 'F203'
    locTestCount += 1
    locF203 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF203{PROP:Fill} = COLOR:Equivocal
      locIndicatorF203 = '>'
    ELSE
      ?PeanutBoxF203{PROP:Fill} = COLOR:Positive
      locIndicatorF203 = '>>'
      
    .
 OF 'F372'
    locTestCount += 1
    locF372 = RES:Conc
    CASE RES:Score
    OF '0'
    OF '0/1'
      ?PeanutBoxF372{PROP:Fill} = COLOR:Equivocal
      locIndicatorF372 = '>'
    ELSE
      ?PeanutBoxF372{PROP:Fill} = COLOR:Positive
      locIndicatorF372 = '>>'
      locScore += 1
      
    .
  .
.
! stop('locTestCount: ' &  locTestCount)
! End of 

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ResultsPrint')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:GAM.Open                                          ! File GAM used by this procedure, so make sure it's RelationManager is open
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  
  
  
  
  
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  !
  
  !QBE2.Init(QBV2, INIMgr,'EnglishResults', GlobalErrors)
  !
  !
  INIMgr.Fetch('ResultsPrint',ProgressWindow)              ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SetAlerts()
   recs# = RECORDS(Results)
  !  stop('Init: ' & recs# & '  gloPatient:' & gloPatient) 
  
  
  0{PROP:Wallpaper} = gloWallpaper
  SET(Normals,1)
  NEXT(Normals)
  locAccount = CLI:Number
  locSummary = 0
  locPercentile = '<13,10>100<13,10>90<13,10>80<13,10>70<13,10>60<13,10>50<13,10>40<13,10>30<13,10>20<13,10>10<13,10>0<13,10><13,10>' 
  Report{PROPPRINT:Device}=gloPDFPrinter  
  
  
         
    locPatientText = 'Laboratory results need to be correlated to your history and clinical symptoms prior to any diagnosis.  A positive test may, or, may not indicate an allergic condition and only your physician can make that determination.  The avoidance information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if you have any concerns, or, specific questions regarding the attached information.'
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .       
  !  stop(' set gloPatient: ' & gloPatient & ' cli:number: ' & CLI:number & '-' & PAT:Client & ' lab id: ' & Pat:CLIENT_ID & ' pat:dob: ' & Pat:DOB)
    
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Docs.Close
    Relate:GAM.Close
    Relate:Normals.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsPrint',ProgressWindow)           ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  
  
  ! stop('gloTE: ' & gloTE)
  
  
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
  ReturnValue = PARENT.TakeRecord()
  
  
  DO GetResults    
  
  
  !  stop(' 2 set gloPatient: ' & gloPatient & ' cli:number: ' & CLI:number & '-' & PAT:Client & ' lab id: ' & Pat:CLIENT_ID & ' pat:dob: ' & Pat:DOB)
  !   SETTARGET(Report)
  !!    gloOK += 1
  
  ! .
  ! IF gloOK > 0 
  !   gloOK += 1
  !   stop('-' & gloOK)
  !   RETURN(gloOK)
  ! .
  results# = RECORDS(Results)
  ! stop('got results, #results:' & results# )
      
  ! stop(' 2.5 set gloPatient: ' & gloPatient & ' cli:number: ' & CLI:number & '-' & PAT:Client & ' lab id: ' & Pat:CLIENT_ID & ' pat:dob: ' & Pat:DOB)
  
  
  locPhysician = SUB(gloPatientNotes[1],1,40)
  locComment = SUB(gloPatientNotes[1],41,88)
  locPatientNote = CLIP(locPhysician) & ' ' & CLIP(locComment)   
  OMIT('COVID19')
  IF gloVirus   
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#) 
  !    stop(RES:type & ', ' & RES:Score)
      IF RES:Type = 'IVG' 
        RES:Type = 'IgG'
        IF RES:Score = '1'  
          IF RES:Code = 'A103' OR RES:Code = 'A104' 
            ?StringIgG1{PROP:Text} = 'Antibodies Detected'
            ?BoxIgG1{PROP:Fill} = 0080FFFFh   
            ?ImageArrow1{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))  
            locTextIgG1 = 'S1 Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented  COVID-19 positive patients tested in an Allermetrix quantitative antibody study.  Currently, there is no concentration level known to confer immunity, but S1 Protein antibodies are associated with neutralization of the virus.'
            ?StringConcValue1{PROP:Text} = RES:Conc 
            ?StringBAUValue1{PROP:Text} = RES:BAU
            ?StringPercentileValue1{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            UNHIDE(?StringPercentileValue1)
            UNHIDE(?StringConcValue1)
            UNHIDE(?StringBAUValue1)
            UNHIDE(?ImageArrow1)
  !  stop(i# & ', CODE:' & RES:Code & ', CONC: ' & RES:Conc & ', ' & RES:Percentile & '%, ARROW XPOS:' & (1125 + (RES:Percentile/100 * (2800 - 1125))))            
          ELSIF RES:Code = 'A099' OR RES:Code = 'A100'
            ?StringIgG2{PROP:Text} = 'Antibodies Detected' 
            ?BoxIgG2{PROP:Fill} = 0080FFFFh
            ?StringConcValue2{PROP:Text} = RES:Conc 
            ?StringBAUValue2{PROP:Text} = RES:BAU
            ?StringPercentileValue2{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            ?ImageArrow2{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125)) 
            locTextIgG2 = 'RBD antibodies are higher than ' & RES:Percentile & '% of 101 documented COVID-19 positive patients tested in an Allermetrix quantitative antibody study. Currently, there is no concentration level known to confer immunity, but RBD antibodies are associated with neutralization of the virus.'  
            UNHIDE(?StringPercentileValue2)
            UNHIDE(?StringBAUValue2)
            UNHIDE(?StringConcValue2)
            UNHIDE(?ImageArrow2)
   !  stop(i# & ', CODE:' & RES:Code & ', CONC: ' & RES:Conc & ', ' & RES:Percentile & '%, ARROW XPOS:' & (1125 + (RES:Percentile/100 * (2800 - 1125))))            
  
          ELSIF RES:Code = 'A101' OR RES:Code = 'A102' 
            ?StringIgG3{PROP:Text} = 'Antibodies Detected'
            ?BoxIgG3{PROP:Fill} = 0080FFFFh
            ?StringConcValue3{PROP:Text} = RES:Conc 
            ?StringBAUValue3{PROP:Text} = RES:BAU
            ?StringPercentileValue3{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            ?ImageArrow3{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))
            locTextIgG3 = 'N Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented  COVID-19 positive patients tested in an Allermetrix quantitative antibody study.  N-Protein antibodies are not associated with neutralization of the virus, but indicate a natural infection rather than vaccine response.'
            UNHIDE(?StringPercentileValue3)
            UNHIDE(?StringBAUValue3)
            UNHIDE(?StringConcValue3)
            UNHIDE(?ImageArrow3)
          . 
        ELSIF RES:Score = '0/1' 
          IF RES:Code = 'A103' OR RES:Code = 'A104' 
            ?StringIgG1{PROP:Text} = 'Borderline'
            ?StringPercentileValue1{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            ?StringConcValue1{PROP:Text} = RES:Conc 
            ?StringBAUValue1{PROP:Text} = RES:BAU
            ?BoxIgG1{PROP:Fill} = 00D2FFD2h    
            ?ImageArrow1{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))  
            locTextIgG1 = 'S1 Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented  COVID-19 positive patients tested in an Allermetrix quantitative antibody study.  Currently, there is no concentration level known to confer immunity, but S1 Protein antibodies are associated with neutralization of the virus.'
            UNHIDE(?StringPercentileValue1)
            UNHIDE(?StringBAUValue1)
            UNHIDE(?StringConcValue1)
            UNHIDE(?ImageArrow1)
          ELSIF RES:Code = 'A099' OR RES:Code = 'A100'
            ?StringIgG2{PROP:Text} = 'Borderline' 
            ?StringPercentileValue2{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            ?StringConcValue2{PROP:Text} = RES:Conc 
            ?StringBAUValue2{PROP:Text} = RES:BAU
            locTextIgG2 = 'RBD antibodies are higher than ' & RES:Percentile & '% of 101 documented COVID-19 positive patients tested in an Allermetrix quantitative antibody study. Currently, there is no concentration level known to confer immunity, but RBD antibodies are associated with neutralization of the virus.'  
            ?BoxIgG2{PROP:Fill} = 00D2FFD2h
            ?ImageArrow2{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))  
            UNHIDE(?StringPercentileValue2)
            UNHIDE(?StringBAUValue2)
            UNHIDE(?StringConcValue2)
            UNHIDE(?ImageArrow2)
          ELSIF RES:Code = 'A101' OR RES:Code = 'A102' 
            ?StringIgG3{PROP:Text} = 'Borderline' 
            ?StringPercentileValue3{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            ?StringConcValue3{PROP:Text} = RES:Conc 
            ?StringBAUValue3{PROP:Text} = RES:BAU
            locTextIgG3 = 'N Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented  COVID-19 positive patients tested in an Allermetrix quantitative antibody study.  N-Protein antibodies are not associated with neutralization of the virus, but indicate a natural infection rather than vaccine response.'
            ?BoxIgG3{PROP:Fill} = 00D2FFD2h
            ?ImageArrow3{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))
            UNHIDE(?StringPercentileValue3)
            UNHIDE(?StringBAUValue3)
            UNHIDE(?StringConcValue3)
            UNHIDE(?ImageArrow3)
          . 
        ELSE
          IF RES:Code = 'A103' OR RES:Code = 'A104' 
            ?StringIgG1{PROP:Text} = 'Antibodies Not Found'
            ?StringConcValue1{PROP:Text} = RES:Conc 
            ?StringBAUValue1{PROP:Text} = RES:BAU
            ?StringPercentileValue1{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            locTextIgG1 = 'S1 Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented COVID-19 positive patients tested in an Allermetrix quantitative antibody study. Currently, there is no concentration level known to confer immunity, but S1 antibodies are associated with neutralization of the virus.'  
            ?ImageArrow1{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))
            UNHIDE(?StringPercentileValue1)
            UNHIDE(?ImageArrow1)
            UNHIDE(?StringConcValue1)
            UNHIDE(?StringBAUValue1)
          ELSIF RES:Code = 'A099' OR RES:Code = 'A100'
            ?StringIgG2{PROP:Text} = 'Antibodies Not Found'
            ?StringConcValue2{PROP:Text} = RES:Conc 
            ?StringBAUValue2{PROP:Text} = RES:BAU
            ?StringPercentileValue2{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
             locTextIgG2 = 'RBD antibodies are higher than ' & RES:Percentile & '% of 101 documented COVID-19 positive patients tested in an Allermetrix quantitative antibody study. Currently, there is no concentration level known to confer immunity, but RBD antibodies are associated with neutralization of the virus.'  
            ?ImageArrow2{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))
            UNHIDE(?StringPercentileValue2)
            UNHIDE(?ImageArrow2)
            UNHIDE(?StringConcValue2)
            UNHIDE(?StringBAUValue2)
          ELSIF RES:Code = 'A101' OR RES:Code = 'A102' 
            ?StringIgG3{PROP:Text} = 'Antibodies Not Found'
            ?StringConcValue3{PROP:Text} = RES:Conc 
            ?StringBAUValue3{PROP:Text} = RES:BAU
            ?StringPercentileValue3{PROP:Text} = 'Percentile [' & RES:Percentile & '%]'
            locTextIgG3 = 'N Protein antibodies are higher than ' & RES:Percentile & '% of 101 documented  COVID-19 positive patients tested in an Allermetrix quantitative antibody study.  N-Protein antibodies are not associated with neutralization of the virus, but indicate a natural infection rather than vaccine response.'
            ?ImageArrow3{PROP:Ypos} = 3380 - (RES:Percentile/100 * (2800 - 1125))
            UNHIDE(?StringPercentileValue3)
            UNHIDE(?ImageArrow3)
            UNHIDE(?StringConcValue3)
            UNHIDE(?StringBAUValue3)
          . 
        .
      .
    . 
   
    
    gloReportTitle = 'Summary'
    PRINT(RPT:COVID) 
    locInturpt[7,1] = '< 0.38 �g/mL'
    locInturpt[7,3] = '>= 0.38 �g/mL'
    locInturpt[7,2] = '>= 2.10 �g/mL'
    locInturpt[8,1] = '< 0.50 �g/mL'
    locInturpt[8,3] = '>= 0.50 �g/mL'
    locInturpt[8,2] = '>= 0.87 �g/mL'
    locInturpt[10,1] = '<7.11 BAU/mL'
    locInturpt[10,3] = '>=7.11 BAU/mL'
    locInturpt[9,2] = '>= 12.17 BAU/mL'
    locInturpt[9,1] = '<6.90 BAU/mL'
    locInturpt[9,3] = '>=6.90 BAU/mL'
    locInturpt[10,2] = '>= 12.53 BAU/mL'
    locInturpt[11,1] = '<2.72 BAU/mL'
    locInturpt[11,3] = '>=2.72 BAU/mL'
    locInturpt[11,2] = '>= 15.06 BAU/mL'
  .      
  COVID19  
  
  
  
  ! stop('back from GetResdults Routine, EQ:Tested:' & EQ:tested & ' Test Count: ' & locTestCount)
  !     stop(' 3 set gloPatient: ' & gloPatient & ' cli:number: ' & CLI:number & '-' & PAT:Client & ' lab id: ' & Pat:CLIENT_ID & ' pat:dob: ' & Pat:DOB)
  
  
  
  
  ! stop('gloTE: ' & gloTE  & ', locTestCount: ' & locTestCount)
  
  IF gloTE = EQ:Tested AND locTestCount > 16  
    
   SETTARGET(Report)
   gloReportTitle = 'Peanut Panel Summary'
   locRisk6 = 'Peanut positive with negative Ara h 1, Ara h 2, Ara h 6, and peach results that have positive pollen results are at low risk of true peanut allergy'
   locDisclaimer = 'Laboratory results indicating a low number of risk factors do not preclude the possibility of the patient experiencing a reaction to peanuts (may be due to avoidance of peanuts)'
   gloPeanutPanel = TRUE
   SETTARGET(Report)
      
   IF locF372 > 0.04
     locSpecificActivity6 = (locF372 / gloTotalEConc) * 100
     IF locSpecificActivity6 < .1
       locSpecificActivityString6 = '<0.1%'      
     ELSE
       locSpecificActivityString6 = LEFT(FORMAT(locSpecificActivity6,@N7.1) & '%')
     .
   .   
   IF locSpecificActivity6  > 2
     locIndicatorSA6 = '>>'
     ?PeanutBoxSA6{PROP:Fill} = COLOR:Positive
     locScore += 1
   .
    IF locF360 > 0.04
     locSpecificActivity = (locF360 / gloTotalEConc) * 100
     IF locSpecificActivity < .1
       locSpecificActivityString = '<0.1%'      
     ELSE
       locSpecificActivityString = LEFT(FORMAT(locSpecificActivity,@N7.1) & '%')
     .
   .    
   IF locSpecificActivity  > 2
     locIndicatorSA = '>>'
     ?PeanutBoxSA{PROP:Fill} = COLOR:Positive
     locScore += 1
   .
   IF locF013 > 14.99
      ?PeanutBoxF013{PROP:Fill} = COLOR:Positive
      locIndicatorF013 = '>>'
      locScore += 1
    .
    ?GraphBorder{PROP:Xpos}   = GRAPH:X 
    ?GraphBorder{PROP:Ypos}   = GRAPH:Y 
    ?GraphBorder{PROP:Width}  = gloGraphWidth 
    ?GraphBorder{PROP:Height} = GRAPH:H 
    BAR:X = GRAPH:X + BAR:Padding
    BAR:Y = GRAPH:Y + BAR:Padding
    BAR:W = gloGraphWidth - (BAR:Padding * 2)
    BAR:H = GRAPH:H - (BAR:Padding * 2)
    ?GraphBar{PROP:Xpos} = BAR:X 
    ?GraphBar{PROP:Ypos} = BAR:Y 
    ?GraphBar{PROP:Width}  = BAR:W 
    ?GraphBar{PROP:Height} = BAR:H 
    
    
    
    !locScore = 9
  
   
    gloGraphGrid = 560
    
    
    IF locScore = 10
      ?CoverGraph{PROP:Hide} = TRUE     
    ELSE
      ?CoverGraph{PROP:Width}  = ((10 - locScore) * gloGraphGrid)- 21
    .    
    
    ?CoverGraph{PROP:Xpos}   = (BAR:X + (locScore  * gloGraphGrid)) 
    ?CoverGraph{PROP:Ypos}   = BAR:Y  - 7
    ?CoverGraph{PROP:Height} = BAR:H + 14 
  
    PRINT(RPT:Graph)
    PRINT(RPT:Risk8) 
    PRINT(RPT:Risk9) 
   
      IF locF360 > 0.04  OR locF359 > 0.04  OR locF372 > 0.04
       PRINT(RPT:Risk7)
     .
     PRINT(RPT:Risk1)
     IF locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04  OR locF372 > 0.04
       PRINT(RPT:Risk2)
     .
     IF locF360 > 14.99
       PRINT(RPT:Risk3)
     .
     IF locF360 < 0.05 AND  locF372 > 0.04
       PRINT(RPT:Risk10)
     .
     IF locSpecificActivity  > 2 OR locSpecificActivity6  > 2
       PRINT(RPT:Risk11)
     .
  !       IF (locF013 > 0.04  OR locF360 > 0.04  OR locF359 > 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
     IF locF095 > 0.04            
       PRINT(RPT:Risk4)
     .
     IF (locF013 > 0.04  OR locF360 > 0.04  OR locF359> 0.04  ) and (locF018 > 0.04  OR locF020 > 0.04  OR locF201 > 0.04  OR locF202 > 0.04  OR locF203 > 0.04  OR locF017 > 0.04  OR locF317 > 0.04  OR locF103 > 0.04  )
       PRINT(RPT:Risk5)
     .
     IF (locF013> 0.04  ) and (locF359 < 0.05  and locF360 < 0.05   and locF095 < 0.05  ) and (locG006 > 0.04  OR locT146 > 0.04  OR locW006 > 0.04  )
       PRINT(RPT:Risk6)
     .
     PRINT(RPT:Disclaimer)
     PRINT(RPT:PeanutInterp)
     SETTARGET()
   .       
  
  ! [Priority 5500]
    TRange[1,1] = 6.6
    TRange[1,2] = 29
  
    TRange[2,1] = 10.1
    TRange[2,2] = 49
  
    TRange[3,1] = 12.9
    TRange[3,2] = 45
  
    TRange[4,1] = 14.4
    TRange[4,2] = 52
  
    TRange[5,1] = 20.4
    TRange[5,2] = 87
  
    IF Pat:AGE_TYPE = 'M'
      locAge = 1
    ELSIF Pat:AGE < 3
      locAge = 2
    ELSIF Pat:AGE < 4
      locAge = 3
    ELSIF Pat:AGE < 10
      locAge = 4
    ELSE
      locAge = 5
    .
    gloTotalERange = '<=' &  TRange[locAge,2]
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' BILLING: ' & ERROR()).
       locIVG = 0
       locIVM = 0
   !   SORT(Results,RES:Description)   ! sort for report
      SORT(Results,RES:Sort,RES:Description)
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        CASE RES:Status
        OF 'A'
        OROF 'Q'
        OROF 'B'
        OROF 'D'
          CYCLE
        .    
        IF RES:TYPE = 'IVG'  THEN locIVG = 1; CYCLE. 
        IF RES:TYPE = 'IVM' THEN locIVM = 1;CYCLE.
        IF RES:Score = '0' THEN CYCLE.
        locSummary = 1
      .
    IF gloTE = EQ:Tested
   ! stop('gloTotalEConc=' & gloTotalEConc & '  locAge=' & locAge)
      IF INRANGE(gloTotalEConc,0,TRange[locAge,2])   ! Test here for Elevated Because BuildQueue PROC does not have TRange
        gloTE = EQ:Normal
      ELSE
        gloTE = EQ:Elevated 
        gloTotalSummary = TRUE
      .
    .
    IF gloTG = EQ:Elevated OR gloTG = EQ:Depressed OR gloTA = EQ:Elevated OR gloTA = EQ:Depressed OR gloTM = EQ:Elevated OR gloTM = EQ:Depressed
       gloTotalSummary = TRUE
    .
    locPositive = FALSE
    gloReportTitle = 'Summary'
    IF locSummary OR gloTotalSummary
      
  
      PRINT(RPT:SumHead)
      IF gloTotalSummary
        PRINT(RPT:HeaderTotal)
        IF gloTE = EQ:Elevated
          locTotalType = 'Total IgE'
          PRINT(RPT:STotalElevated)
        .
        IF gloTG = EQ:Elevated
          locTotalType = 'Total IgG'
          PRINT(RPT:STotalElevated)
        .
        IF gloTG = EQ:Depressed
          locTotalType = 'Total IgG'
          PRINT(RPT:STotalDepressed)
        .
        IF gloTA = EQ:Elevated
          locTotalType = 'Total IgA'
          PRINT(RPT:STotalElevated)
        .
        IF gloTA = EQ:Depressed
          locTotalType = 'Total IgA'
          PRINT(RPT:STotalDepressed)
        .
        IF gloTM = EQ:Elevated
          locTotalType = 'Total IgM'
          PRINT(RPT:STotalElevated)
        .
        IF gloTM = EQ:Depressed
          locTotalType = 'Total IgM'
          PRINT(RPT:STotalDepressed)
        .
        gloTotalSummary = FALSE 
        locPositive = TRUE
      .
  ! STOP('Records Results: ' &    RECORDS(Results))
      SAV:Sort = '-'
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        locPositive = TRUE
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'Pollen'
            locPollen = 'Elevated Allergens'
          OF 2
            locHeading = 'Environmental'
            locPollen = 'Elevated Allergens'
          OF 3
            locHeading = 'Food'
            locPollen = 'Elevated Allergens'
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Elevated Allergens' 
          OF 5 
            locHeading = 'SARS-CoV-2 Results'  
            locPollen = 'Receptor Binding Domain' 
          ELSE
            locHeading = 'ERROR: Sort Order = ' & RES:Sort
          .
          PRINT(RPT:Heading)
          PRINT(RPT:LabSubHeading)
          SAV:Sort = RES:Sort
        .
        
        IF INRANGE(RES:Score,'1','6')
          PRINT(RPT:LabPositive)
        ELSE
          PRINT(RPT:LabEquivocal)
        .
      .
    .  
    
    IF ~locPositive AND (locIVG + locIVM) < 1 THEN PRINT(RPT:NoAbnormal);PRINT(RPT:PageBreak).
    IF locPositive  AND (locIVG + locIVM) < 1 THEN PRINT(RPT:PageBreak).
  
    locStatus = 'Printing Interpretations'
  !   stop('locStatus: ' & locStatus)
    DISPLAY(?locStatus)
    SETFONT(?Footer,'Vrinda',8,,FONT:regular,)
    locASR = 'This test was developed and its performance characteristics determined by Allermetrix. It has not been cleared nor approved by the FDA.  The laboratory is regulated under CLIA as qualified to perform high-complexity testing.  This test is used for clinical purposes.  It should not be regarded as investigational or for research.<13,10>' & |
    'An "-HD*" High Definition (HD) designation indicates the reagent was prepared by fortifying extract with purified natural allergen protein.'
    gloReportTitle = 'Interpretation'
    IF gloE THEN PRINT(RPT:EInterp).
    IF gloG THEN PRINT(RPT:GInterp).
    IF gloG4 THEN PRINT(RPT:G4Interp).
    IF gloTE THEN PRINT(RPT:TEInterp).
    IF gloTG THEN PRINT(RPT:TGInterp).
    IF gloTA THEN PRINT(RPT:TAInterp).
    IF gloTM THEN PRINT(RPT:TMInterp).  
    IF locIVG THEN PRINT(RPT:VGInterp).
    IF locIVG THEN PRINT(RPT:CovidStructure).
    PRINT(RPT:PageBreak)
    locASR = ''
  
  
  
  ! ___________________________________________________________________
  
    gloReportTitle = 'Results'
  
    SORT(Results,RES:Sort,RES:Category,RES:Description)
    locStatus = 'Printing Results'
    DISPLAY(?locStatus)
  
  
  
  
  
  
    IF gloTotal
      PRINT(RPT:HeaderTotal)
      gloTotal = 0
    .
    
    
    
  !  STOP('gloTotalEConc: ' & gloTotalEConc)
    
    IF gloTE
    
    
    
      PRINT(RPT:HeaderTE)
      IF INRANGE(gloTotalEConc,0,TRange[locAge,2])
        IF gloTotalEConc < .2
          gloTotalEScore = '<0.20 IU/mL'
        ELSE
          gloTotalEScore = FORMAT(gloTotalEConc,@n_8.2) & ' IU/mL'
        .
        PRINT(RPT:TENormal)
      ELSE
        gloTotalEScore = FORMAT(gloTotalEConc,@n_8.2)  & ' IU/mL'
        PRINT(RPT:TElevated)
      .
    .
    IF ~gloTE
      IF gloTG OR gloTA OR gloTM  THEN PRINT(RPT:HeaderGAMnoE).
    .
    IF gloTG OR gloTA OR gloTM  THEN PRINT(RPT:HeaderGAM).
    IF gloTG
      RES:Description = 'Total IgG'
      locScoreGAM = gloTotalGScore
      GAM:Type = 4
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GAM:AgeType = Pat:AGE_TYPE
      GET(GAM,GAM:OrderKey)
      IF ERRORCODE() THEN STOP('GAM: ' & ERROR()).
      IF gloTG = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTG = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
    IF gloTA
      RES:Description = 'Total IgA'
      locScoreGAM = gloTotalAScore
      GAM:Type = 5
      GAM:AgeType = Pat:AGE_TYPE
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GET(GAM,GAM:OrderKey)
      IF gloTA = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTA = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
    IF gloTM
      RES:Description = 'Total IgM'
      locScoreGAM = gloTotalMScore
      GAM:Type = 6
      GAM:AgeType = Pat:AGE_Type
      IF PAT:Age > 18
        GAM:Age = 18
      ELSE
        GAM:Age = Pat:AGE
      .
      GET(GAM,GAM:OrderKey)
      IF gloTM = EQ:Elevated
        PRINT(RPT:ElevatedGAM)
      ELSIF gloTM = EQ:Depressed
        PRINT(RPT:DepressedGAM)
      ELSE
        PRINT(RPT:NormalGAM)
      .
    .
  
  
      locPollen = 'Not Initialized'
      locResultsCount = RECORDS(Results)
      SAV:Sort = 9      ! Initalize to unused value
      SAV:Code = 'x'    ! Initalize to unused value
      SAV:Sort = '+'
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        DISPLAY(?locResultsCount)
        locResultsCount -=1
        CASE RES:Status
        OF 'A'
        OROF 'Q'
        OROF 'B'
        OROF 'D'
          CYCLE
        .
        CASE  RES:Sort
        OF 1
          IF RES:Summary
            gloPollen = 1
          .
        OF 2
          IF RES:Summary
            IF RES:Category = 'M'
              gloMold = 1
            ELSE
              gloDust = 1
            .
          .
        OF 3
          IF RES:Summary
            gloFood = 1
          .
        OF 4
          locHeading = 'Other Allergens'
          locPollen = 'Allergens'  
        .
        IF SAV:Sort <> RES:Sort
          locPollen = ''
          CASE RES:Sort
          OF 1
            locHeading = 'Pollen'
          OF 2
            locHeading = 'Environmental'
          OF 3
            locHeading = 'Food'
            locPollen = 'Allergens'
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Allergens' 
          OF 5
            locHeading = 'SARS-CoV-2 Serology'
          ELSE
            locHeading = 'ERROR Sort Order = ' & res:SORT
         
          .
          PRINT(RPT:Heading)
          IF RES:Sort > 2 AND RES:Sort < 5   ! polens handeled below
            IF SAV:Code <> RES:Category
              PRINT(RPT:SubHeading)
              SAV:Code = RES:Category
            .
          .
  
          SAV:Sort = RES:Sort
        .
        IF (RES:Sort = '1' OR RES:Sort = '2' OR RES:Sort = '5') AND RES:Category <> SAV:Code   ! Pollen Categories G,T,W get subHeader
          CASE RES:Category
          OF 'G'
            locPollen = 'Grasses' 
          OF 'T'
            locPollen = 'Trees'
          OF 'W'
            locPollen = 'Weeds'
          OF 'D'
            locPollen = 'Dust Components' 
          OF 'E'
            locPollen = 'Epidermals'
          OF 'M'
            locPollen = 'Mold' 
          OF 'C'         
            locPollen = 'Chemicals & Drugs' 
          OF 'X' 
            locPollen = 'Receptor Binding Domain' 
          OF 'Y' 
            locPollen = 'Nucleocapsid Protein'
          OF 'Z' 
            locPollen = 'S1 Protein'  
          .
          
        . 
        IF RES:Type = 'IVG'
          RES:Type = 'IgG'  
          PRINT(RPT:CovSubHeading)
          CASE RES:Score
          OF '0'
            RES:Score = 'Neg'
            PRINT(RPT:CovNegative)
          OF '0/1'    
            RES:Score = 'Bdl'
            PRINT(RPT:CovEquivocal)
          ELSE              
            RES:Score = 'Pos'
            PRINT(RPT:CovPositive)
          . 
        ELSE
          IF SAV:Code <> RES:Category
            PRINT(RPT:SubHeading)
            SAV:Code = RES:Category
          .
          CASE RES:Score
          OF '0'
            PRINT(RPT:Normal)
          OF '0/1'
            PRINT(RPT:Equivocal)
            locSummary = 1
          ELSE
            PRINT(RPT:Elevated)
            locSummary = 1
          . 
          
        .
      .
  
    IF locSummary
      SORT(Results,RES:Sort,RES:Description)
      PRINT(RPT:PageBreak)
      Report{PROP:NextPageNo} = 1
      locPatientText = 'Laboratory results need to be correlated to your history and clinical symptoms prior to any diagnosis.  A positive test may, or, may not indicate an allergic condition and only your physician can make that determination.  The avoidance information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if you have any concerns, or, specific questions regarding the attached information.'
      gloReportTitle = 'Patient Summary'
      PRINT(RPT:PatientInfo)
      SAV:Code = 'x'
      SAV:Sort = 9
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF ~RES:Summary THEN CYCLE.
        IF RES:Description = SAV:Description THEN CYCLE.
        IF SAV:Sort <> RES:Sort
          CASE RES:Sort
          OF 1
            locHeading = 'Pollen'
            locPollen = ''
          OF 2
            locHeading = 'Environmental'
            locPollen = 'Elevated Allergens'
          OF 3
            locHeading = 'Food'
            locPollen = 'Elevated Allergens'
          OF 4
            locHeading = 'Other Allergens'
            locPollen = 'Elevated Allergens'
          .
          PRINT(RPT:Heading)
          PRINT(RPT:PatSubHead)
          SAV:Sort = RES:Sort
          
        .
        PRINT(RPT:PElevated)
        SAV:Description = RES:Description
    . .
  
  
  
    locStatus = 'Printing Patient Info'
    DISPLAY(?locStatus)
  
  
  
  
  
    gloReportTitle = 'Patient Info'
    IF gloPollen
      DOC:Number = DOC:Pollen
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('POLLEN: ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloDust
      DOC:Number = DOC:Dust
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('DUST ' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloMold
      DOC:Number = DOC:Mold
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('MOLD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
      DOC:Number = DOC:Mold + DOC:Page2
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    IF gloFood
      DOC:Number = DOC:Food
      GET(Docs,DOC:OrderKey)
      IF ERRORCODE() THEN STOP('FOOD' & DOC:Number & ' ' & ERROR()).
      PRINT(RPT:Text)
    .
    PUT(Patient)
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)
  
    SETTARGET()
  
  
  
  !   STOP('END RETURN VALUE')
  
  
  
  
  OMIT('XXXXX')
  PRINT(RPT:Heading)
  PRINT(RPT:CovidStructure)
  PRINT(RPT:Covid)
  PRINT(RPT:Detail1)
  PRINT(RPT:HeaderTotal)
  PRINT(RPT:G4Interp)
  PRINT(RPT:GInterp)
  PRINT(RPT:VgInterp)
  PRINT(RPT:EInterp)
  PRINT(RPT:TEInterp)
  PRINT(RPT:TAInterp)
  PRINT(RPT:TMInterp)
  PRINT(RPT:TGInterp)
  PRINT(RPT:HeaderGAMnoE)
  PRINT(RPT:HeaderGAM)
  PRINT(RPT:NormalGAM)
  PRINT(RPT:ElevatedGAM)
  PRINT(RPT:DepressedGAM)
  PRINT(RPT:HeaderTE)
  PRINT(RPT:TElevated)
  PRINT(RPT:TENormal)
  PRINT(RPT:TEquivocal)
  PRINT(RPT:NoAbnormal)
  PRINT(RPT:Detail)
  PRINT(RPT:Elevated)
  PRINT(RPT:CovPositive)
  PRINT(RPT:CovNegative)
  PRINT(RPT:CovEquivocal)
  PRINT(RPT:CovNegativeM)
  PRINT(RPT:CovPositiveM)
  PRINT(RPT:CovEquivocalM)
  PRINT(RPT:CovSubHeading)
  PRINT(RPT:LabSubHeading)
  PRINT(RPT:LabEquivocal)
  PRINT(RPT:LabPositive)
  PRINT(RPT:Positive)
  PRINT(RPT:Negative)
  PRINT(RPT:Normal)
  PRINT(RPT:Equivocal)
  PRINT(RPT:SubHeading)
  PRINT(RPT:SumHead)
  PRINT(RPT:SumSubHead)
  PRINT(RPT:SElevated)
  PRINT(RPT:SEquivocal)
  PRINT(RPT:STotalElevated)
  PRINT(RPT:STotalDepressed)
  PRINT(RPT:ASR)
  PRINT(RPT:PatientInfo)
  PRINT(RPT:PatSubHead)
  PRINT(RPT:PElevated)
  PRINT(RPT:Text)
  PRINT(RPT:PeanutInterp)
  PRINT(RPT:Graph)
  PRINT(RPT:Risk7)
  PRINT(RPT:Risk1)
  PRINT(RPT:Risk2)
  PRINT(RPT:Risk3)
  PRINT(RPT:Risk8)
  PRINT(RPT:Risk9)
  PRINT(RPT:Risk10)
  PRINT(RPT:Risk11)
  PRINT(RPT:Risk4)
  PRINT(RPT:Risk5)
  PRINT(RPT:Risk6)
  PRINT(RPT:Disclaimer)
  PRINT(RPT:PageBreak)
  
  XXXXX
  
  ReturnValue = Level:Fatal
  
    ! STOP('RV: ' & ReturnValue)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Patient File
!!! </summary>
ResultsSendout100 PROCEDURE 

Progress:Thermometer BYTE                                  !
locNoS130            LONG                                  !
locGPos              BYTE                                  !
locTPos              BYTE                                  !
locRPos              BYTE                                  !
locGlutPos           BYTE                                  !
locCdPos             BYTE                                  !
locCeliacPos         BYTE                                  !
locCeliac            BYTE                                  !
locCandida           BYTE                                  !
SAV:Type             STRING(4)                             !
locPatientText       STRING(512)                           !
locNoAbnormal        STRING(32)                            !
NOR:Glut0 STRING('<<250')
NOR:Glut1 STRING('=>250')
Process:View         VIEW(Patient)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       PROJECT(Pat:CLIENT_ID)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:SEX)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Patient Sendouts'),AT(,,143,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE, |
  CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3600,8000,7000),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8302,3448),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(6271,250,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(6271,406,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(6271,563,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(6271,719,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(6271,875,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s20),AT(5781,1188,2083,292),USE(gloREPORTTITLE),FONT(,16,,FONT:bold),CENTER,TRN
                         LINE,AT(7917,3229,0,-2082),USE(?Line20),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,365),USE(?Line19),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s20),AT(3896,1813),USE(gloRPTNOTICE3),TRN
                         STRING(@s40),AT(490,1896,3021,208),USE(gloAddress3),TRN
                         LINE,AT(5729,1823,2188,0),USE(?Line23),COLOR(COLOR:Black)
                         LINE,AT(3646,2500,0,365),USE(?Line17),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(1823,2500,0,365),USE(?Line16),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(7396,2135,0,365),USE(?Line15),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5729,1146,0,990),USE(?Line15:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(6771,2500,0,-364),USE(?Line14),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(5104,2135,0,729),USE(?Line13),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(3646,2135,0,365),USE(?Line12),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,3229,0,-2082),USE(?Line6),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@s1),AT(7552,2302,167,167),USE(Pat:SEX)
                         LINE,AT(104,2500,7813,0),USE(?HorizLine2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Client Number'),AT(229,2521),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(2313,2521),USE(?S35),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Received Date'),AT(4031,2521),USE(?S36),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Date'),AT(5729,2521),USE(?S37),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Print Time'),AT(7135,2521),USE(?S38),FONT('Arial',8,,FONT:underline),TRN
                         LINE,AT(104,2135,7813,0),USE(?HorzLine1),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,1146,7813,0),USE(?HorzLine1:2),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Patient Name (Last, First)'),AT(208,2167,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Sex'),AT(7500,2167),USE(?S33),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Age'),AT(6927,2167,208,188),USE(?S32),FONT('Arial',8,,FONT:underline),TRN
                         STRING('INVOICE #'),AT(6042,1573,823,188),USE(?S31),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Lab ID'),AT(4219,2167,375,188),USE(?S30),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(208,2302,3333,167),USE(gloPatName)
                         STRING(@d2b),AT(5563,2302,677,167),USE(Pat:DOB),TRN
                         STRING(@n_6),AT(4063,2302,552,167),USE(Pat:INVOICE,,?PAT:INVOICE:2),RIGHT(1)
                         STRING(@s15),AT(250,2677,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(2313,2677,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6875,2302,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(7052,1573,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5563,2677,740,146),USE(gloDate),RIGHT(1)
                         STRING('Comment:'),AT(365,2896),USE(?S39),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@S127),AT(896,2896,7021,208),USE(gloPatientNotes[1]),TRN
                         STRING(@S127),AT(896,3073,7021,208),USE(gloPatientNotes[2]),TRN
                         STRING('ACCOUNT#'),AT(6042,1906),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s20),AT(3896,1292,1521,208),USE(gloRPTNOTICE1),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         LINE,AT(5729,1510,2188,0),USE(?Line22),COLOR(COLOR:Black)
                         STRING(@s20),AT(3896,1552,1521,208),USE(gloRPTNOTICE2),TRN
                         STRING(@s20),AT(3854,833,1563,208),USE(gloFaxNumber),TRN
                         STRING(@d2),AT(3969,2677,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         LINE,AT(104,3229,7813,0),USE(?HorzLine4),COLOR(COLOR:Black),LINEWIDTH(5)
                         LINE,AT(104,2865,7813,0),USE(?HorzLine3),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING(@T3),AT(7031,2677,594,156),USE(gloTime),RIGHT(1)
                       END
PosSubHead             DETAIL,AT(10,52,8302,250),USE(?DETAIL1)
                         BOX,AT(5604,0,969,250),USE(?SCBox5:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Antibody'),AT(3188,31,1833,200),USE(?RES:Description:3),FONT(,10,COLOR:White, |
  FONT:bold),CENTER,TRN
                         STRING('Units (EIA)'),AT(5604,30,969,200),USE(?RES:SCScore:2),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,TRN
                         BOX,AT(6646,0,542,250),USE(?SCBox5:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(6760,31),USE(?String125),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       END
PosRSubHead            DETAIL,AT(10,52,8302,250),USE(?DETAIL2)
                         BOX,AT(5604,0,969,250),USE(?SCBox5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Autoantibody'),AT(3188,31,1833,200),USE(?PRS:Description:7),FONT(,10,COLOR:White, |
  FONT:bold),CENTER,TRN
                         STRING('Titer'),AT(5604,30,969,200),USE(?RES:SCScore:3),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  TRN
                       END
PosGlutSubHead         DETAIL,AT(10,52,8302,250),USE(?DETAIL3)
                         BOX,AT(5604,0,969,250),USE(?glutBox5:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?glutBox4:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Autoantibody'),AT(3188,31,1833,200),USE(?PRS:Description),FONT(,10,COLOR:White, |
  FONT:bold),CENTER,TRN
                         STRING('Units (ng/mL)'),AT(5604,30,969,200),USE(?RES:Score),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,TRN
                         BOX,AT(6656,0,542,250),USE(?GlutTypeBox),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Type'),AT(6760,31),USE(?String125:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                       END
PosElevated            DETAIL,AT(10,0,8302,250),USE(?DETAIL4)
                         BOX,AT(5604,0,969,250),USE(?S1PFill),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?S1PBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?S1PBoxType),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2854,30),USE(RES:Description,,?S1P:Description),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s12),AT(5604,30,969,200),USE(RES:Conc,,?S1P:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING(@s4),AT(6646,30,542,200),USE(RES:Type,,?S1P:Type),FONT(,,,FONT:bold),CENTER,TRN
                       END
PosEquivocal           DETAIL,AT(10,0,8302,250),USE(?DETAIL5)
                         BOX,AT(5604,0,969,250),USE(?SEPFill),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SEPBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SEPBoxType),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@S40),AT(2854,30),USE(RES:Description,,?SEP:Description),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s12),AT(5604,30,969,200),USE(RES:Conc,,?SEP:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING(@s4),AT(6646,31,542,200),USE(RES:Type,,?SEP:Type),FONT(,,,FONT:bold),CENTER,TRN
                       END
PosRElevated           DETAIL,AT(10,0,8302,250),USE(?DETAIL6)
                         BOX,AT(5604,0,969,250),USE(?RS1PFill),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?RS1PBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2854,30),USE(RES:Description,,?RS1P:Description),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s12),AT(5604,30,969,200),USE(RES:Conc,,?RS1P:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                       END
PosGlutElevated        DETAIL,AT(10,0,8302,250),USE(?DETAIL7)
                         BOX,AT(5604,0,969,250),USE(?Glut1PFill),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('IgA'),AT(6646,31,542,200),USE(?RES:TypeIgA),FONT(,,,FONT:bold),CENTER,TRN
                         BOX,AT(2792,0,2698,250),USE(?Glut1PBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2854,30),USE(RES:Description,,?glut1P:Description),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s12),AT(5604,30,969,200),USE(RES:Conc,,?glut1P:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                         BOX,AT(6646,0,542,250),USE(?SEPBoxType:2),COLOR(COLOR:Black),LINEWIDTH(1)
                       END
PosREquivocal          DETAIL,AT(10,0,8302,250),USE(?DETAIL8)
                         BOX,AT(5604,0,969,250),USE(?RSEPFill),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?RSEPBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@S40),AT(2854,30),USE(RES:Description,,?RSEP:Description),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s12),AT(5604,30,969,200),USE(RES:Conc,,?RSEP:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                       END
CdInterp               DETAIL,AT(10,52,8302,781),USE(?DETAIL9)
                         BOX,AT(5615,0,969,220),USE(?SCBox16:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,0,2698,220),USE(?SCBox4:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,220,969,220),USE(?SCBoxEinterpConc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,220,2698,220),USE(?SCBoxEinterpDesc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,440,969,220),USE(?SCBoxEinterpConc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,440,2698,220),USE(?SCBoxEinterpDesc1:3),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING(@s12),AT(5615,460),USE(NOR:SC1),CENTER,TRN
                         STRING('Positive (Antibody Detected)'),AT(3000,460,2365,177),USE(?SEinterp2:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Negative (Antibody Not Detected)'),AT(2990,240,2365,177),USE(?SEinterp1:2),FONT(,, |
  ,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING(@s12),AT(5615,240),USE(NOR:SC0),CENTER,TRN
                         STRING('Interpretation'),AT(3115,30,2240,177),USE(?RES:Description:2),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Units (EIA)'),AT(5615,30,969,219),USE(?S72:3),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
GlutInterp             DETAIL,AT(10,52,8302,781),USE(?DETAIL10)
                         BOX,AT(5615,0,969,220),USE(?GlutBox16:5),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,0,2698,220),USE(?GlutBox4:9),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,220,969,220),USE(?GlutBoxEinterpConc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,220,2698,220),USE(?GlutBoxEinterpDesc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,440,969,220),USE(?GlutBoxEinterpConc1:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,440,2698,220),USE(?GlutBoxEinterpDesc1:3),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING(@s12),AT(5615,460),USE(NOR:Glut1),CENTER,TRN
                         STRING('Increasing Positive'),AT(3000,460,2365,177),USE(?Glutinterp2:2),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Negative'),AT(2990,240,2365,177),USE(?Glutinterp1:2),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s12),AT(5615,240),USE(NOR:Glut0),CENTER,TRN
                         STRING('Interpretation'),AT(3115,30,2240,220),USE(?RES:Description),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Units (ng/mL)'),AT(5615,30,969,220),USE(?Glut72:3),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
SRInterp               DETAIL,AT(10,52,8302,896),USE(?DETAIL11)
                         BOX,AT(5615,0,969,220),USE(?SGBoxHead:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,0,2698,220),USE(?SRBoxHead2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,220,969,220),USE(?SR0Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,220,2698,220),USE(?SR0Box:InterpDesc),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,440,969,220),USE(?SREBox:InterpWeak),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,440,2698,220),USE(?SREBox:InterpDesc),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,660,969,220),USE(?SR1Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,660,2698,220),USE(?SR1Box:InterpDesc),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('No Antibody Detected'),AT(2990,240,2365,200),USE(?SR0InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,240,938,200),USE(NOR:SR0),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Weak Positive'),AT(2990,460,2365,200),USE(?SREInterpDesc),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s16),AT(5615,460,938,198),USE(NOR:SRE),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Moderate to Strong Positive'),AT(3031,680,2365,208),USE(?SR1InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,680,938,198),USE(NOR:SR1),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Interpretation'),AT(3115,30,2240,220),USE(?SR:Description),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,TRN
                         STRING('Titer'),AT(5615,30,969,250),USE(?SR:Units),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  TRN
                       END
STInterp               DETAIL,AT(10,52,8302,896),USE(?DETAIL12)
                         BOX,AT(5615,0,969,220),USE(?SGBoxHead),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,0,2698,220),USE(?STBoxHead2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,220,969,220),USE(?ST0Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,220,2698,220),USE(?ST0Box:InterpDesc),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,440,969,220),USE(?STEBox:InterpWeak),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,440,2698,220),USE(?STEBox:InterpDesc),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,660,969,220),USE(?ST1Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,660,2698,220),USE(?ST1Box:InterpDesc),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('No Antibody Detected'),AT(2990,240,2365,220),USE(?ST0InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,240,938,220),USE(NOR:ST0),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Weak Positive'),AT(2990,460,2365,200),USE(?STEInterpDesc),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s16),AT(5615,460,938,198),USE(NOR:STE),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Moderate to Strong Positive'),AT(3031,680,2365,220),USE(?ST1InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,680,938,220),USE(NOR:ST1),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Interpretation'),AT(3115,30,2240,220),USE(?ST:Description),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,TRN
                         STRING('Units (EIA)'),AT(5615,30,969,220),USE(?ST:Units),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  TRN
                       END
SGInterp               DETAIL,AT(10,52,8302,896),USE(?DETAIL13)
                         BOX,AT(5615,0,969,220),USE(?SGBoxHead:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,0,2698,220),USE(?SGBoxHead2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,220,969,220),USE(?SG0Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,220,2698,220),USE(?SG0Box:InterpDesc),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,440,969,220),USE(?SGEBox:InterpWeak),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,440,2698,220),USE(?SGEBox:InterpDesc),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,660,969,220),USE(?SG1Box:Interp),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,660,2698,220),USE(?SG1Box:InterpDesc),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         STRING('No Antibody Detected'),AT(2990,240,2365,200),USE(?SG0InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,240,938,200),USE(NOR:SG0),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Weak Positive'),AT(2990,460,2365,200),USE(?SGEInterpDesc),FONT(,,,FONT:bold),CENTER, |
  TRN
                         STRING(@s16),AT(5615,460,938,198),USE(NOR:SGE),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Moderate to Strong Positive'),AT(3031,680,2365,208),USE(?SG1InterpDesc),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,680,938,198),USE(NOR:SG1),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('Interpretation'),AT(3115,30,2240,220),USE(?SG:Description),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,TRN
                         STRING('Units (EIA)'),AT(5615,30,969,220),USE(?SG:Units),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  TRN
                       END
SGHeader               DETAIL,AT(10,156,8302,302),USE(?DETAIL14)
                         BOX,AT(730,20,2510,302),USE(?SGBox:Header),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Gliadin Antibody-*'),AT(719,50,2510,200),USE(?locHeading:2),FONT(,12,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
GlutHeader             DETAIL,AT(10,156,8302,302),USE(?DETAIL15)
                         BOX,AT(730,20,2510,302),USE(?GlutBox:Header),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Gluten IgA-**'),AT(729,50,2510,200),USE(?locHeading:12),FONT(,12,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
STHeader               DETAIL,AT(10,156,8302,302),USE(?DETAIL16)
                         BOX,AT(730,20,2510,302),USE(?STBox:Header),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Tissue Transglutaminase-*'),AT(729,50,2510,200),USE(?locHeading:3),FONT(,12,COLOR:White, |
  FONT:bold),CENTER,COLOR(COLOR:Black),TRN
                       END
SRHeader               DETAIL,AT(10,156,8302,302),USE(?DETAIL17)
                         BOX,AT(730,20,2510,302),USE(?SRBox:Header),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Reticulin Total Autoantibody'),AT(729,50,2510,200),USE(?locHeading:11),FONT(,12,COLOR:White, |
  FONT:bold),CENTER,COLOR(COLOR:Black),TRN
                       END
SGHeader2              DETAIL,AT(10,-21,8302,250),USE(?DETAIL18)
                         BOX,AT(730,0,2510,250),USE(?SGBox:Header2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('IgG and IgA Normal Range'),AT(729,30,2510,200),USE(?locHeading:8),FONT(,11,COLOR:White, |
  FONT:bold),CENTER,COLOR(COLOR:Black),TRN
                       END
STHeader2              DETAIL,AT(10,-21,8302,250),USE(?DETAIL19)
                         BOX,AT(730,0,2510,250),USE(?STBox:Header2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('IgG and IgA Normal Range'),AT(729,30,2510,200),USE(?locHeading:9),FONT(,11,COLOR:White, |
  FONT:bold),CENTER,COLOR(COLOR:Black),TRN
                       END
GlutHeader2            DETAIL,AT(10,-21,8302,250),USE(?DETAIL20)
                         BOX,AT(730,0,2510,250),USE(?GlutBox:Header2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal Range'),AT(729,50,2510,200),USE(?locHeading:13),FONT(,11,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
SRHeader2              DETAIL,AT(10,-21,8302,250),USE(?DETAIL21)
                         BOX,AT(730,0,2510,250),USE(?SRBox:Header2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal Range'),AT(729,30,2510,200),USE(?locHeading:10),FONT(,11,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
SubHeading             DETAIL,AT(10,52,8302,250),USE(?DETAIL22)
                         BOX,AT(5615,0,969,250),USE(?Box16),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Box14:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Units (EIA)'),AT(5615,31,896,208),USE(?S72:2),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  COLOR(COLOR:Black),TRN
                         STRING('Antibody'),AT(3438,30,1438,208),USE(?AllergensHead),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
RSubHeading            DETAIL,AT(10,52,8302,250),USE(?DETAIL23)
                         BOX,AT(5615,0,969,250),USE(?Box16:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Box14),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Titer'),AT(5615,31,896,208),USE(?S72),FONT(,10,COLOR:White,FONT:bold),CENTER,COLOR(COLOR:Black), |
  TRN
                         STRING('Autoantibody'),AT(3438,30,1438,208),USE(?AllergensHead:2),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
GlutSubHeading         DETAIL,AT(10,52,8302,250),USE(?DETAIL24)
                         BOX,AT(5615,0,969,250),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Box14:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Units (ng/mL)'),AT(5615,31,896,208),USE(?S72:4),FONT(,10,COLOR:White,FONT:bold),CENTER, |
  COLOR(COLOR:Black),TRN
                         STRING('Antibody'),AT(3177,31,1948,208),USE(?AllergensHead:3),FONT(,10,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Black),TRN
                       END
SCEquivocal            DETAIL,AT(10,0,8302,250),USE(?DETAIL25)
                         BOX,AT(5615,0,969,250),USE(?SCBox6:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1396,0,1281,250),USE(?LevelBox:2),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,31,542,200),USE(RES:Type,,?RES:SCSCType:2),FONT(,,,FONT:bold),CENTER,TRN
                         STRING('Weak Positive'),AT(1396,42,1281,198),USE(?Equivocal:2),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,31,2500,200),USE(RES:Description,,?RES:SCSCDescription:2),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,31,896,208),USE(RES:Conc,,?RES:SCSCConc:Eqv:2),FONT(,10,,FONT:bold),CENTER, |
  TRN
                         STRING('>'),AT(1021,0,333,240),USE(?SE:Mark),FONT('Arial',12,,FONT:bold),RIGHT,TRN
                       END
SCElevated             DETAIL,AT(10,0,8302,250),USE(?DETAIL26)
                         BOX,AT(1396,0,1281,250),USE(?S1:Fill),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?S1:Box),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,0,969,250),USE(?S1:Box:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?S1Box),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,31,542,200),USE(RES:Type,,?S1:Type),FONT(,,,FONT:bold),CENTER,TRN
                         STRING('Elevated'),AT(1396,42,1281,198),USE(?S1:Text),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,31,2500,200),USE(RES:Description,,?S1:Description:2),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,31,896,208),USE(RES:Conc,,?S1:Conc:2),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('>>'),AT(1021,0,333,240),USE(?S1:Mark),FONT('Arial',12,,FONT:bold),RIGHT,TRN
                       END
SCNormal               DETAIL,AT(10,0,8302,250),USE(?DETAIL27)
                         BOX,AT(5615,0,969,250),USE(?SCBox6:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1396,0,1281,250),USE(?LevelBox:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBox18),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,40,542,200),USE(RES:Type,,?RES:SCSCType:3),FONT(,,,FONT:bold),CENTER,TRN
                         STRING('Normal'),AT(1396,42,1281,198),USE(?Normal:2),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,208),USE(RES:Description,,?RES:SCSCDescription:3),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?RES:Conc:2),FONT(,10,,FONT:bold),CENTER,TRN
                       END
REquivocal             DETAIL,AT(10,0,8302,250),USE(?DETAIL28)
                         BOX,AT(5615,0,969,250),USE(?SCBox6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1396,0,1281,250),USE(?LevelBox:4),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         STRING('Weak Positive'),AT(1396,42,1281,198),USE(?Equivocal),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,200),USE(RES:Description,,?RES:SCSCDescription:6),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?RES:SCSCConc:Eqv:3),FONT(,10,,FONT:bold),CENTER, |
  TRN
                         STRING('>'),AT(1021,0,333,240),USE(?SE:Mark:2),FONT('Arial',12,,FONT:bold),RIGHT,TRN
                       END
RElevated              DETAIL,AT(10,0,8302,250),USE(?DETAIL29)
                         BOX,AT(1396,0,1281,250),USE(?S1:Fill:2),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?S1:Box:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,0,969,250),USE(?S1:Box:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated'),AT(1396,42,1281,198),USE(?S1:Text:2),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,200),USE(RES:Description,,?S1:Description:3),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?S1:Conc:3),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('>>'),AT(1021,0,333,240),USE(?S1:Mark:2),FONT('Arial',12,,FONT:bold),RIGHT,TRN
                       END
GlutElevated           DETAIL,AT(10,0,8302,250),USE(?DETAIL30)
                         BOX,AT(1375,21,1302,229),USE(?glut1:Fill),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?Glut1:Box),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,0,969,250),USE(?Glut1:Box:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated'),AT(1396,42,1281,198),USE(?glut1:Text),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,200),USE(RES:Description,,?S1:Description),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?S1:Conc),FONT(,10,,FONT:bold),CENTER,TRN
                         STRING('>>'),AT(1021,10,333,240),USE(?Glut1:Mark),FONT('Arial',12,,FONT:bold),RIGHT,TRN
                         STRING('IgA'),AT(6646,42,542,200),USE(?GlutTypeElv),FONT(,,,FONT:bold),CENTER,TRN
                         BOX,AT(6646,0,542,250),USE(?GlutElvTypeBox),COLOR(COLOR:Black),LINEWIDTH(1)
                       END
RNormal                DETAIL,AT(10,0,8302,250),USE(?DETAIL31)
                         BOX,AT(5615,0,969,250),USE(?SCBox6:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1396,0,1281,250),USE(?LevelBox),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal'),AT(1396,42,1281,198),USE(?Normal),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,208),USE(RES:Description,,?RES:SCSCDescription:7),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?RES:Conc:3),FONT(,10,,FONT:bold),CENTER,TRN
                       END
GlutNormal             DETAIL,AT(10,0,8302,250),USE(?DETAIL32)
                         BOX,AT(5615,0,969,250),USE(?GlutBox6:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?glutBox4:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1396,0,1281,250),USE(?glutLevelBox:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('Normal'),AT(1396,42,1281,198),USE(?GlutNormal:2),FONT(,,,FONT:bold),CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,208),USE(RES:Description,,?RES:GlutDescription:7),FONT(,,,FONT:bold), |
  CENTER,TRN
                         STRING(@s16),AT(5615,40,896,208),USE(RES:Conc,,?RES:GlutConc:3),FONT(,10,,FONT:bold),CENTER, |
  TRN
                         STRING('IgA'),AT(6646,42,542,200),USE(?GlutTypeNormal),FONT(,,,FONT:bold),CENTER,TRN
                         BOX,AT(6646,0,542,250),USE(?GlutNormalTypeBox),COLOR(COLOR:Black),LINEWIDTH(1)
                       END
CdPosSubHead           DETAIL,AT(10,156,8302,250),USE(?DETAIL33)
                         BOX,AT(6646,10,542,219),USE(?SCBox5:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5604,0,969,250),USE(?SCBox5:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SC:TypeBox),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Elevated Antigen'),AT(3479,31,1177,208),USE(?RES:Description:7),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Units (EIA)'),AT(5604,30,969,219),USE(?RES:Score:2),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING('Type'),AT(6740,31),USE(?StringType),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       END
CdPosElevated          DETAIL,AT(10,0,8302,250),USE(?DETAIL34)
                         BOX,AT(5604,0,969,250),USE(?SCBox5:ElvPos),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:ElvPos),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBoxType:ElvPos),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s40),AT(2854,30),USE(RES:Description,,?RES:SCDescription:PosElv),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s12),AT(5604,30,969,219),USE(RES:Conc,,?RES:SCSCConc:EvlPos),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s4),AT(6646,31,542,219),USE(RES:Type,,?RES:SCSCType:PosElv),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       END
CdHeader               DETAIL,AT(10,104,8302,260),USE(?DETAIL35)
                         BOX,AT(730,0,2510,260),USE(?SCBox3:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(3)
                         STRING('Candida Antibodies'),AT(729,30,2510,200),USE(?locHeading:7),FONT(,12,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
CdHeader2              DETAIL,AT(10,-10,8302,250),USE(?DETAIL36)
                         BOX,AT(730,0,2510,250),USE(?SCBox3:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(4)
                         STRING('IgG, IgA and IgM Normals Range'),AT(729,30,2510,200),USE(?locHeading),FONT(,11,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                       END
NoAbnormal             DETAIL,AT(0,0,8000,729),USE(?Detail:2)
                         STRING('No Abnormal Laboratory Findings'),AT(94,177,7938,271),USE(?String123:2),FONT(,14,, |
  FONT:bold),CENTER,TRN
                       END
NotTested              DETAIL,AT(0,0,8000,729),USE(?NotTested)
                         STRING('Not Tested'),AT(94,177,7938,271),USE(?String123),FONT(,14,,FONT:bold),CENTER,TRN
                       END
PosHeader              DETAIL,AT(10,10,8302,469),USE(?DETAIL37)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:5),FONT(, |
  16,COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
CdSubHeading           DETAIL,AT(10,156,8302,250),USE(?DETAIL38)
                         BOX,AT(5615,0,896,250),USE(?SCBox16:2),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox14:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         STRING('Units (EIA)'),AT(5615,31,896,208),USE(?S72:5),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Antigen'),AT(3438,21,1438,208),USE(?AllergensHead:4),FONT(,10,COLOR:White,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                       END
CdEquivocal            DETAIL,AT(10,0,8302,250),USE(?DETAIL39)
                         BOX,AT(5615,0,896,250),USE(?SCBox6:5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:5),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?RES:SCSCType:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Equivocal'),AT(1750,40,677,200),USE(?Equivocal:3),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s40),AT(2865,40,2500,200),USE(RES:Description,,?RES:SCSCDescription:5),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc,,?RES:SCSCConc:Eqv),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>'),AT(1229,0,333,240),USE(?S81:3),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                       END
CdElevated             DETAIL,AT(10,0,8302,250),USE(?DETAIL40)
                         BOX,AT(5615,0,896,250),USE(?SCBox6:6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:6),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:11),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?SCRES:Type:Elv),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Elevated'),AT(1750,40,677,188),USE(?Elevated),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,40,2500,188),USE(RES:Description,,?RES:SCSCDescription:Elv),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc,,?RES:SCSCConc:Elv),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('>>'),AT(1229,0,333,240),USE(?S81:2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                       END
CdNormal               DETAIL,AT(10,0,8302,250),USE(?DETAIL41)
                         BOX,AT(5615,0,896,250),USE(?SCBox6:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2792,0,2698,250),USE(?SCBox4:8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(1625,0,948,250),USE(?LevelBox:7),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6646,0,542,250),USE(?SCBox18:4),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING(@s4),AT(6646,40,542,219),USE(RES:Type,,?RES:SCSCType:6),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Normal'),AT(1760,40,677,208),USE(?Normal:3),FONT(,,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING(@s40),AT(2865,40,2500,208),USE(RES:Description,,?RES:SCSCDescription:4),FONT(,,,FONT:bold, |
  CHARSET:ANSI),CENTER,TRN
                         STRING(@s7),AT(5615,40,896,219),USE(RES:Conc),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       END
PosCHeader             DETAIL,AT(10,10,8302,500),USE(?DETAIL42)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:4),FONT(, |
  16,COLOR:Black,FONT:bold),CENTER,TRN
                         STRING('Celiac Disease Panel'),AT(750,250,6594,240),USE(?String124),FONT(,14,,FONT:bold),CENTER, |
  TRN
                       END
PosCdHeader            DETAIL,AT(10,10,8302,500),USE(?DETAIL43)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:6),FONT(, |
  16,COLOR:Black,FONT:bold),CENTER,TRN
                         STRING('Candida Disease Panel'),AT(771,250,6594,240),USE(?String124:3),FONT(,14,,FONT:bold), |
  CENTER,TRN
                       END
PosCCHeader            DETAIL,AT(10,10,8302,500),USE(?DETAIL44)
                         STRING('Review of Abnormal Laboratory Findings'),AT(760,21,6594,344),USE(?locHeading:14),FONT(, |
  16,COLOR:Black,FONT:bold),CENTER,TRN
                         STRING('Celiac and Candida Disease Panel'),AT(760,250,6594,240),USE(?String124:2),FONT(,14, |
  ,FONT:bold),CENTER,TRN
                       END
PageBreak              DETAIL,AT(10,0,8302,344),USE(?DETAIL45),PAGEAFTER(-1)
                       END
                       FOOTER,AT(250,10400,7948,573),USE(?Footer)
                         STRING('Gary A. Kitos, Ph.D., HCLD'),AT(21,52,1427,120),USE(?String40),FONT('Arial',8),TRN
                         STRING('Medical Laboratory Director'),AT(21,170,1469,120),USE(?String40:2),FONT('Arial',8), |
  TRN
                         STRING('     *-Testing performed at Warde Medical Laboratory, Ann Arbor MI'),AT(2177,0,4000, |
  120),USE(?StringFooter:1),FONT('Arial',8),HIDE,TRN
                         STRING('   **-Testing performed at Allermetrix, Franklin, TN'),AT(2177,120,4000,120),USE(?StringFooter:2), |
  FONT('Arial',8),HIDE,TRN
                         STRING(@pPage <<#p),AT(7010,42,698,250),USE(?PageCount),FONT('Arial',10),PAGENO
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
Close                  PROCEDURE(),DERIVED
Close                  PROCEDURE(BYTE Force),DERIVED
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ResultsSendout100')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ResultsSendout100',ProgressWindow)         ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Patient, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pat:INVOICE)
  ThisReport.AddSortOrder(Pat:INVOICE_KEY)
  ThisReport.AddRange(Pat:INVOICE)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Patient.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Normals.Close
    Relate:Patient.Close
    Relate:SendOuts.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsSendout100',ProgressWindow)      ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.Close PROCEDURE

  CODE
  SETTARGET()
  PARENT.Close


ThisReport.Close PROCEDURE(BYTE Force)

  CODE
  SETTARGET()
  PARENT.Close(Force)


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
    gloReportTitle = 'Summary'
    Pat:INVOICE = gloPatient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('PAT:' & PAT:Invoice & ' ' & ERROR()).
    CASE Pat:BILLING
    OF 'M'
      CLI:Number = 800000
    OF 'A'
      CLI:Number = 800001
    OF 'I'
      CLI:Number = 800002
    OF 'P'
      CLI:Number = 800003
    ELSE
      CLI:Number = PAT:Client
    .

  
    CLI:Number = PAT:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP(CLI:NUMBER & ' CLI: ' & ERROR()).
    IF CLI:FIRST
      gloClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      gloClientName = CLI:LAST
    .
    gloAddress1 = CLI:ADDRESS1
    IF CLI:ADDRESS2
      gloAddress2 = CLI:ADDRESS2
      gloAddress3 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
    ELSE
      gloAddress2 = CLIP(CLI:CITY) & ' ' & CLI:STATE & ' ' & CLI:ZIP
      gloAddress3 = ''
    .
    gloPatName = CLIP(PAT:LAST) & ', ' & PAT:FIRST
    IF PAT:COLLECTION
      gloPATCollection = FORMAT(PAT:COLLECTION,@D2)
    ELSE
      gloPATCollection = 'Not Given'
    .

!Results   QUEUE,PRE(RES)
! RES:Sort      BYTE
! RES:Code      STRING(9)
! RES:Description   STRING(40)
! RES:Type      STRING(4)
! RES:Result    STRING(10)
! RES:Conc      STRING(7)
! RES:Score     STRING(3)
! RES:Status    STRING(1)
! RES:Panel     STRING(9)
! RES:Summary   BYTE
! RES:Fee       DECIMAL(5,2)
! RES:FeeLevel   BYTE

  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF VAL(RES:Code[2:2]) - 48 = 2   ! Candida
      locCandida = TRUE
      IF RES:Score = '0' THEN CYCLE.
      locCdPos = TRUE
    ELSE
      locCeliac = TRUE
    .
  .
  SETTARGET(Report)
  IF locCeliac
    ?StringFooter:1{PROP:Hide} =  FALSE
    ?StringFooter:2{PROP:Hide} =  FALSE
  ELSE
    ?StringFooter:1{PROP:Hide} =  FALSE
    ?StringFooter:2{PROP:Hide} =  TRUE
  .

  IF Pat:CLIENT <> 200220
    ?StringFooter:2{PROP:Hide} =  TRUE
  .


  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF VAL(RES:Code[2:2]) - 48 = 2 THEN CYCLE.
    IF RES:Score = '0' THEN CYCLE.
    IF VAL(RES:Code[3:3]) - 48 = 1   ! Gliadin
      locGPos = TRUE
      locCeliacPos = TRUE
      BREAK
    .
  .
  locNoS130 = TRUE 
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF RES:Code = 'S130'
      locNoS130 = FALSE
    .
  .
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF VAL(RES:Code[2:2]) - 48 = 2 THEN CYCLE.
    IF RES:Score = '0' THEN CYCLE.
    IF VAL(RES:Code[3:3]) - 48 = 2   ! Transglutaminase
      locTPos = TRUE
      locCeliacPos = TRUE
      BREAK
    .
  .
  locRPos = FALSE
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF VAL(RES:Code[2:2]) - 48 = 2 THEN CYCLE.
    IF RES:Score = '0' THEN CYCLE.
    IF VAL(RES:Code[3:3]) - 48 = 3   ! ReticulinA
    stop(RES:code)
      locRPos = TRUE
      locCeliacPos = TRUE
      BREAK
    .
  .
  LOOP I# = 1 TO RECORDS(Results)
    GET(Results,I#)
    IF VAL(RES:Code[2:2]) - 48 = 2 THEN CYCLE.
    IF RES:Score = '0' THEN CYCLE.
    IF VAL(RES:Code[3:3]) - 48 = 4   ! Gluten
      locGlutPos = TRUE
      locCeliacPos = TRUE
      BREAK
    .
  .

  IF locCandida AND  locCeliac
    PRINT(RPT:PosCCHeader)
  ELSIF locCeliac
    PRINT(RPT:PosCHeader)
  ELSE
    PRINT(RPT:PosCdHeader)
  .

  IF locCdPos
    PRINT(RPT:Cdheader)
    PRINT(RPT:CdPosSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 = 1 THEN CYCLE.
      IF RES:Score = '0' OR VAL(RES:Code[2:2]) - 48 <> 2  THEN CYCLE.
      PRINT(RPT:CdPosElevated)
    .
  ELSIF locCandida
    PRINT(RPT:Cdheader)
    PRINT(RPT:NoAbnormal)
  .

  IF locGPos
    PRINT(RPT:SGheader)
    PRINT(RPT:PosSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '0' THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '1'
        PRINT(RPT:PosElevated)
      ELSE
        PRINT(RPT:PosEquivocal)
      .
    .
  ELSIF locCeliac
    PRINT(RPT:SGheader)
    PRINT(RPT:NoAbnormal)
  .

  IF locTPos
    PRINT(RPT:STheader)
    PRINT(RPT:PosSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '0' THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 2 THEN CYCLE.
      IF RES:Score = '1'
        PRINT(RPT:PosElevated)
      ELSE
        PRINT(RPT:PosEquivocal)
      .
    .
  ELSIF locCeliac
    PRINT(RPT:STheader)
    PRINT(RPT:NoAbnormal)
  .
 
  IF  locRPos
    PRINT(RPT:SRheader)
    PRINT(RPT:PosRSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '0' THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 3 THEN CYCLE.
      
      IF RES:Score = '1'
        PRINT(RPT:PosRElevated)
      ELSE
        PRINT(RPT:PosREquivocal)
      .
    .
  ELSIF locCeliac
    PRINT(RPT:SRheader)
    IF locNoS130
      PRINT(RPT:NotTested)
    ELSE
      PRINT(RPT:NoAbnormal)
    .
  .




  IF locGlutPos AND Pat:CLIENT = 200220
    PRINT(RPT:GlutHeader)
    PRINT(RPT:PosGlutSubHead)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '0' THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 4 THEN CYCLE.
      PRINT(RPT:PosGlutElevated)
    .
  ELSIF locCeliac AND Pat:CLIENT = 200220
    PRINT(RPT:GlutHeader)
    PRINT(RPT:NoAbnormal)
  .

  PRINT(RPT:PageBreak)

  SETTARGET(Report)
  ?StringFooter:1{PROP:Hide} =  TRUE
  ?StringFooter:2{PROP:Hide} =  TRUE

  gloReportTitle = 'Interpretation'
  IF locCandida

    PRINT(RPT:Cdheader)
    PRINT(RPT:Cdheader2)
    PRINT(RPT:CdInterp)
    PRINT(RPT:PageBreak)
  .
  IF locCeliac
    PRINT(RPT:SGheader)
    PRINT(RPT:SGheader2)
    PRINT(RPT:SGInterp)
    PRINT(RPT:STheader)
    PRINT(RPT:STheader2)
    PRINT(RPT:STInterp)
 !   PRINT(RPT:SRheader)
 !   PRINT(RPT:SRheader2)
 !   PRINT(RPT:SRInterp)  
    IF Pat:CLIENT = 200220
      PRINT(RPT:GlutHeader)
      PRINT(RPT:Glutheader2)
      PRINT(RPT:GlutInterp)
    .
    PRINT(RPT:PageBreak)
  .

  SETTARGET(Report)
  IF locCeliac
    ?StringFooter:1{PROP:Hide} =  FALSE
    ?StringFooter:2{PROP:Hide} =  FALSE
  ELSE
    ?StringFooter:1{PROP:Hide} =  FALSE
    ?StringFooter:2{PROP:Hide} =  TRUE
  .  
  IF Pat:CLIENT <> 200220
    ?StringFooter:2{PROP:Hide} =  TRUE
  .
  gloReportTitle = 'Results'  
 ! PRINT(RPT:SGheader)
 ! PRINT(RPT:SubHeading)

  IF locCandida
    PRINT(RPT:Cdheader)
    PRINT(RPT:CdSubHeading)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 2 THEN CYCLE.
      IF RES:Score = '0'
        PRINT(RPT:CdNormal)
      ELSE
        PRINT(RPT:CdElevated)
      .
    .
  .
  IF locCeliac
    PRINT(RPT:SGheader)
    PRINT(RPT:SubHeading)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 1 THEN CYCLE.
      IF RES:Score = '0'
        PRINT(RPT:SCNormal)
      ELSIF RES:Score = '1'
        PRINT(RPT:SCElevated)
      ELSE
        PRINT(RPT:SCEquivocal)
      .
    .

    PRINT(RPT:STheader)
    PRINT(RPT:SubHeading)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 2 THEN CYCLE.
      IF RES:Score = '0'
        PRINT(RPT:SCNormal)
      ELSIF RES:Score = '1'
        PRINT(RPT:SCElevated)
      ELSE
        PRINT(RPT:SCEquivocal)
      .
    .

    PRINT(RPT:SRheader)
    PRINT(RPT:RSubHeading)
    LOOP I# = 1 TO RECORDS(Results)
      GET(Results,I#)
      IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
      IF VAL(RES:Code[3:3]) - 48 <> 3 THEN CYCLE.
      IF RES:Score = '0'
        PRINT(RPT:RNormal)
      ELSIF RES:Score = '1'
        PRINT(RPT:RElevated)
      ELSE
        PRINT(RPT:REquivocal)
      .
    .
    IF Pat:CLIENT = 200220
      PRINT(RPT:GlutHeader)
      PRINT(RPT:GlutSubHeading)
      LOOP I# = 1 TO RECORDS(Results)
        GET(Results,I#)
        IF VAL(RES:Code[2:2]) - 48 <> 1 THEN CYCLE.
        IF VAL(RES:Code[3:3]) - 48 <> 4 THEN CYCLE.
        IF RES:Score = '0'
          PRINT(RPT:GlutNormal)
        ELSE 
          PRINT(RPT:GlutElevated)
      . .
    .
  .
  SO:Patient = PAT:Invoice
  GET(SendOuts,SO:OrderKey)
  IF ~ERRORCODE() THEN DELETE(SendOuts).











































  SO:Patient = PAT:Invoice
  GET(SendOuts,SO:OrderKey)
  IF ~ERRORCODE() THEN DELETE(SendOuts).
  omit('XXXX')
  PRINT(RPT:PosSubHead)
  PRINT(RPT:PosRSubHead)
  PRINT(RPT:PosGlutSubHead)
  PRINT(RPT:PosElevated)
  PRINT(RPT:PosEquivocal)
  PRINT(RPT:PosRElevated)
  PRINT(RPT:PosGlutElevated)
  PRINT(RPT:PosREquivocal)
  PRINT(RPT:CdInterp)
  PRINT(RPT:GlutInterp)
  PRINT(RPT:SRInterp)
  PRINT(RPT:STInterp)
  PRINT(RPT:SGInterp)
  PRINT(RPT:SGHeader)
  PRINT(RPT:GlutHeader)
  PRINT(RPT:STHeader)
  PRINT(RPT:SRHeader)
  PRINT(RPT:SGHeader2)
  PRINT(RPT:STHeader2)
  PRINT(RPT:GlutHeader2)
  PRINT(RPT:SRHeader2)
  PRINT(RPT:SubHeading)
  PRINT(RPT:RSubHeading)
  PRINT(RPT:GlutSubHeading)
  PRINT(RPT:SCEquivocal)
  PRINT(RPT:SCElevated)
  PRINT(RPT:SCNormal)
  PRINT(RPT:REquivocal)
  PRINT(RPT:RElevated)
  PRINT(RPT:GlutElevated)
  PRINT(RPT:RNormal)
  PRINT(RPT:GlutNormal)
  PRINT(RPT:CdPosSubHead)
  PRINT(RPT:CdPosElevated)
  PRINT(RPT:CdHeader)
  PRINT(RPT:CdHeader2)
  PRINT(RPT:NoAbnormal)
  PRINT(RPT:NotTested)
  PRINT(RPT:PosHeader)
  PRINT(RPT:CdSubHeading)
  PRINT(RPT:CdEquivocal)
  PRINT(RPT:CdElevated)
  PRINT(RPT:CdNormal)
  PRINT(RPT:PosCHeader)
  PRINT(RPT:PosCdHeader)
  PRINT(RPT:PosCCHeader)
  PRINT(RPT:PageBreak)
  XXXX
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

