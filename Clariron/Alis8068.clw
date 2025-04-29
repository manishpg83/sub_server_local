

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABASCII.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8068.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8079.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8080.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
amxUpdate PROCEDURE 

FTPONLINE:New     EQUATE(4)
ONLINE:Changed    EQUATE(8)

Clients QUEUE,PRE(CL)
Number                      ULONG
PCAE                        BYTE

.
Patients QUEUE,PRE(PT)
Number                      ULONG
PCAE                        BYTE
Diet                        BYTE   
.

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


locPatientCount ULONG
locClientCount  ULONG
locDate STRING(10)
locDoB   STRING(10)
locStartDate LONG

AllFiles             QUEUE(File:queue),PRE(FIL)            !
                     END 

LS   FILE,DRIVER('ASCII'),NAME(gloFileName2),PRE(LS) 
RECORD RECORD
TEXT  STRING(32)
 . . 
Data   FILE,DRIVER('ASCII'),NAME(gloFileName3),PRE(DAT),CREATE
RECORD RECORD
TEXT  STRING(255)
 . . 

locVolume            DECIMAL(5,1)                          !
locHL7CountCPL       LONG                                  !
locTestCountCPL      LONG                                  !
locTestCountSERO     LONG                                  !
locTestCountSanJuan  LONG                                  !
locDateTime          STRING(10)                            !
locDays              LONG                                  !
locFTP               STRING(64)                            !
locPipe              STRING(20)                            !
locExportFrom        LONG                                  !
locExportTo          LONG                                  !
locRangeCount        SHORT                                 !
locCurrentPath       STRING(64)                            !
locCreratedData      BYTE                                  !
locTestCount         LONG                                  !
locDateRestriction   BYTE                                  !
locPath              CSTRING(48)                           !
locPathPDF           STRING(64)                            !
locIncludeUpdated    BYTE                                  !
locIncludeDate       BYTE                                  !
locIncludeRange      BYTE                                  !
locBuDate            LONG                                  !
locbuUpload          BYTE                                  !
locFileList          STRING(1048576)                       !
locPDFs              STRING(1048576)                       !
FTP                  QUEUE,PRE(FTP)                        !
PDF                  STRING(64)                            !
Client               LONG                                  !
Billing              LONG                                  !
Patient              LONG                                  !
FileName             STRING(11)                            !
                     END                                   !
locCountFTP          USHORT                                !
locUnlock            BYTE                                  !
locDateCount         SHORT                                 !
ViewerActive4        BYTE(False)
AsciiFilename4       STRING(FILE:MaxFilePath),AUTO,STATIC,THREAD
AsciiFile4           FILE,DRIVER('ASCII'),NAME(AsciiFilename4),PRE(A4),THREAD
RECORD                RECORD,PRE()
TextLine                STRING(255)
                      END
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('amx Update'),AT(0,0,505,313),FONT(,10,,FONT:bold),RESIZE,ICON('Allermetrix.ico'),GRAY, |
  IMM,MDI,HLP('amxUpdate'),SYSTEM
                       SPIN(@D3),AT(2,15,190,25),USE(locStartDate),FONT('Arial',28,,FONT:bold,CHARSET:ANSI),RIGHT(2), |
  HVSCROLL
                       BUTTON('Get PDFs'),AT(148,150,126,20),USE(?Now),FONT(,16,,FONT:bold)
                       BUTTON('Upload PDF && Data'),AT(148,174,126,20),USE(?ButtonUpload),FONT(,16,,FONT:bold)
                       BUTTON('Find HL7 Input'),AT(148,210,126,20),USE(?ButtonCheckHL7),FONT(,14,COLOR:Navy,FONT:bold)
                       BUTTON('Create CPL HL7'),AT(148,239,126,20),USE(?ButtonCreateHL7),FONT(,14,,FONT:bold)
                       BUTTON('Create Sero Labs HL7'),AT(148,262,126,20),USE(?buttonCreateSeroLabsHL7),FONT(,14,, |
  FONT:bold)
                       BUTTON('Create San Juan HL7'),AT(148,285,126,20),USE(?ButtonCreateHL7s),FONT(,14,,FONT:bold)
                       BUTTON('Update San Juan'),AT(277,285,,20),USE(?UpdateSanaJuan),FONT(,14,COLOR:Navy)
                       ENTRY(@P######P),AT(289,74,59,14),USE(locFrom),FONT(,14),CENTER
                       ENTRY(@P######P),AT(375,72,60,15),USE(locTo),FONT('Arial',14,,FONT:bold),CENTER(2)
                       BUTTON('Upload PDFs'),AT(282,90,86,23),USE(?ButtonRangeDoIt:3),FONT(,16,,FONT:bold)
                       STRING(@n6),AT(158,50),USE(locClientCount),FONT(,12,,FONT:bold),RIGHT,TRN
                       STRING('Clients'),AT(126,50,37),USE(?String3),FONT(,,,FONT:bold),TRN
                       BUTTON('Update Data'),AT(374,90,86,23),USE(?buttonUpdateDataOnly:3),FONT(,16,,FONT:bold)
                       STRING(@n6),AT(158,63),USE(locPatientCount),FONT(,12,,FONT:bold),RIGHT,TRN
                       STRING('Patients'),AT(126,63,40),USE(?String4),FONT(,,,FONT:bold),TRN
                       STRING(@n-7b),AT(438,77),USE(locRangeCount,,?locRangeCount:3),TRN
                       BUTTON('&OK'),AT(23,157,70,25),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,HIDE,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('Done'),AT(392,272,86,20),USE(?Cancel),FONT(,16,,FONT:bold),MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       STRING(@pPDFs for FTP:<<#p),AT(126,75),USE(locCountFTP),FONT(,,,FONT:bold),TRN
                       LIST,AT(0,56,116,266),USE(?LIST1),FONT(,8),HVSCROLL,FORMAT('444L(2)|M~PDF~L(0)@s64@'),FROM(FTP)
                       STRING(@p### ###pb),AT(363,302),USE(PT:Number),FONT(,,,FONT:bold),TRN
                       CHECK('Date'),AT(132,114),USE(locIncludeDate),TRN,VALUE('1','0')
                       CHECK('Updated'),AT(132,126),USE(locIncludeUpdated),TRN,VALUE('1','0')
                       STRING('Include'),AT(130,106),USE(?STRING1),FONT(,,,FONT:bold),TRN
                       PANEL,AT(120,102,126,40),USE(?PANEL1),BEVEL(1)
                       CHECK('Restrict PDF by Date'),AT(119,92),USE(locDateRestriction),TRN,VALUE('1','0')
                       STRING('From '),AT(307,57,61,10),USE(?STRING2),FONT(,14,,FONT:bold),CENTER
                       STRING('To'),AT(374,57,61,10),USE(?STRING5),FONT(,14),CENTER
                       BUTTON('Upload Panels'),AT(308,14,86,26),USE(?BUTTON1),FONT(,,,FONT:bold),LEFT,ICON(ICON:Connect)
                       BUTTON('Do Not Click'),AT(450,2),USE(?BUTTON2),HIDE
                       STRING(@n3),AT(133,249,12),USE(locTestCountCPL),TRN
                       STRING(@n3),AT(133,290,12),USE(locTestCountSanJuan),FONT(,,,FONT:regular),TRN
                       STRING(@n3),AT(133,266,12),USE(locTestCountSERO),FONT(,,,FONT:regular),TRN
                       STRING(@s64),AT(2,1,208),USE(locCurrentPath),FONT(,10),CENTER,COLOR(COLOR:White),TRN
                       LIST,AT(290,158,177,12),USE(?List),FONT('DejaVu Sans Condensed',10,,FONT:regular,CHARSET:ANSI), |
  FORMAT('1020L(2)|M~Text~@s255@'),FROM(''),HIDE,IMM,TRN
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Viewer4              AsciiViewerClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

Viewer4:Initialize ROUTINE
  AsciiFilename4='amxUpdate.SQL'
  ViewerActive4=Viewer4.Init(AsciiFile4,A4:Textline,AsciiFilename4,?List,GlobalErrors,EnableSearch)
!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
AddClient ROUTINE
      CL:Number = PAT:Client
      GET(Clients,CL:Number)
      IF ERRORCODE()
        CL:PCAE = ONLINE:Client + ONLINE:Changed    
        ADD(Clients,CL:Number)
      .

AddPatient ROUTINE
        GET(Patients,PT:Number)
        IF ERRORCODE()
           PT:PCAE = ONLINE:Patient + ONLINE:Changed   
           ADD(Patients,PT:Number)
           locPatientCount += 1
           DISPLAY(?locPatientCount)
           DO AddClient
        .


ByPassResults   ROUTINE
  LOOP locExportTo = 300037 TO 300037
  gloFileName = CLIP(locExportTo) & '.txt' 
  CREATE(Text)
  OPEN(Text)
  CLEAR(TST:Record)
  
  TST:INVOICE = locExportTo
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP UNTIL EOF(Test)
    NEXT(Test)
    IF ERRORCODE() OR TST:INVOICE <> locExportTo THEN BREAK.
    TXT:Text = TST:CODE & '|' & TST:TYPE & '|' & TST:COUNT & '|' & TST:Score & '|' 
    ADD(Text)
  .
  CLOSE(Text)

 ! stop( CLIP(gloFileName) & ' amx@amxemr.com:/home/amx/HL7/ & EXIT') 
  RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName) & ' amx@amxemr.com:/home/amx/HL7/ & EXIT',1) 

  .
  stop('exit')

  




Upload  ROUTINE
        REMOVE('C:\C6\ALIS\App\updatepatient.txt')
        REMOVE('C:\C6\ALIS\App\updatetest.txt')
        CLEAR(PAT:Record,1)
        Pat:INVOICE = 599999
        SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
        PREVIOUS(Patient)
        locExportTo = PAT:Invoice 
        
        CLEAR(Pat:Record)
        PAT:DATE = TODAY() - 180
        SET(Pat:DATE_KEY,Pat:DATE_KEY)
        NEXT(Patient)
        locExportFrom = PAT:Invoice
        IF locTo AND locFrom
          locExportFrom = locFrom
          locExportTo = locTo
          locTo = 0
          locFrom = 0
          DISPLAY
        .
        ExportUpdates(locExportFrom,locExportTo)
        IF RECORDS(FTP) = 0 THEN 
          RUN('CMD /c C:\Apps\updateAMX.bat & EXIT',1)
  !  Above runs c=> RUN('CMD /c C:\Apps\500258\getamxresultsSanJuan.bat',1)          
          EXIT
        .
        IF ViewerActive4
          Viewer4.Kill
          ViewerActive4 = FALSE
        .
        CLOSE(Text)
        IF ERRORCODE() AND ERRORCODE() <> 37 THEN STOP('UPLOAD SQL: ' & ERROR()).
    !    RUN('CMD /c ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! amxUpdate.SQL amx@amxemr.com:/home/amx/Z/buData/ & EXIT',1)   
        gloFileName = 'movePDF.php' 
        CREATE(Text)
        OPEN(Text)
        TXT:Text = '<?php'
        ADD(Text)
        locFileList = ''
        LOOP I# = 1 TO RECORDS(FTP)
          GET(FTP,I#)
          locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' & FTP:PDF
          IF EXISTS(locPath)
            locFileList = CLIP(locFileList) & ' ' & CLIP(locPathPDF)
            TXT:Text = 'if (file_exists("/home/amx/Z/' & CLIP(FTP:FileName) & '")){{'
            ADD(Text)
            TXT:Text = '  if (!file_exists("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '")){{@mkdir("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '");}'
            ADD(Text)
            TXT:Text = '  rename("/home/amx/Z/' & CLIP(FTP:FileName) & '","/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '/' & CLIP(FTP:FileName) &  '");<10>'
            ADD(Text)
            IF FTP:Client <> FTP:Billing
              TXT:Text = '  @mkdir("/home/amx/Z/ResultsNoEncrypt/' & FTP:Billing & '");'
              ADD(Text)
              TXT:Text = '  copy("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '/' & CLIP(FTP:FileName) &  '","/home/amx/Z/ResultsNoEncrypt/' & FTP:Billing & '/' & CLIP(FTP:FileName) &  '");<10>}'
              ADD(Text)
            ELSE
              TXT:Text = '}'
              ADD(Text)
            .
          .
        .
 !       TXT:Text = 'include_once("/home/amx/Z/email.php");<10>'
 !       ADD(Text)
!        LOOP I# = 1 TO RECORDS(FTP)
!          GET(FTP,I#)
!          TXT:Text = 'email(' & FTP:Patient & ');<10>'
!          ADD(Text)
!        .
        TXT:Text = '// pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(locFileList) & ' amx@amxemr.com:/home/amx/Z/' 
        ADD(Text)
        TXT:Text = '?>'
        ADD(Text)
        CLOSE(Text)
        RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! movePDF.php amx@amxemr.com:/home/amx/Z/ & EXIT',1) 
        RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(locFileList) & ' amx@amxemr.com:/home/amx/Z/ & EXIT',1) 
        IF ~ERRORCODE() 
          CLOSE(Online)
          OPEN(Online)
          EMPTY(Online)
          CLOSE(Online)
          SHARE(Online)
        ELSE
          STOP('FTP FAILED')
        .
        RUN('CMD /c C:\Apps\updateAMX.bat & EXIT',1)
        SLEEP(1000)
      
Start   ROUTINE  ! begin, Get PDFs clicked
  locToday = TODAY()
  locPatientCount = 0
  locClientCount = 0
  gloFileName = 'amxUpdate.SQL'
  0{PROP:From} = gloFileName
  IF ViewerActive4
    Viewer4.Kill
    ViewerActive4=False
  END
  CLOSE(Text)
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE amxUpdate.SQL: ' & ERROR()).
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN amxUpdate.SQL: ' & ERROR()).
  FREE(Patients)
  FREE(Clients)
  FREE(FTP)
  locCountFTP = 0
  DISPLAY()  
  
  CLEAR(PAT:Record)
  PAT:Date = locStartDate  ! Main big date on screen
  SET(PAT:DATE_KEY,PAT:DATE_KEY)
  LOOP
    NEXT(Patient)
    IF ERRORCODE() THEN BREAK. 
    PT:Number = PAT:Invoice
    DISPLAY(?PT:Number)
    DO AddPatient
  .
  
  SET(Online,1)
  LOOP
    IF ~locIncludeUpdated THEN BREAK.
    NEXT(OnLine)
    IF ERRORCODE() THEN BREAK.
    IF INRANGE(OL:Date, locStartDate,locToday) OR INRANGE(OL:Date,locToday,locStartDate)
      R# += 1
      IF BAND(OL:PCAE,ONLINE:Patient)
        PT:Number = OL:Number
        DISPLAY(?PT:Number)
        PAT:Invoice = PT:Number
        GET(Patient,PAT:INVOICE_KEY)
        DO AddPatient
      ELSIF BAND(OL:PCAE,ONLINE:Client)
        PAT:Client = OL:Number
        DO AddClient
      .
    .
  .
  IF ~locIncludeDate 
    stop('no start date included')
  .

  locPatientCount = RECORDS(Patients)
  locClientCount  = RECORDS(Clients)
  P# = 0
  C# = 0
  DISPLAY()
  SORT(Patients,PT:PCAE,PT:Number)
  LOOP I# = 1 TO RECORDS(Patients)
    GET(Patients,I#)
    PAT:Invoice = PT:Number
    DISPLAY(?PT:Number)
    GET(Patient,PAT:Invoice_key)
    IF ERRORCODE()
      STOP('PAT: ' & PT:Number & ' ' & ERROR())
    ELSE
      OL:Number = PAT:Client
      DO GetPatient
      DISPLAY(?locPatientCount)
    .
  .
  SORT(Clients,CL:PCAE,CL:Number)
  LOOP I# = 1 TO RECORDS(Clients)
    GET(Clients,I#)
    CLI:Number = CL:Number
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE()
      STOP('CLI: ' & CLI:Number & ' '  & ERROR())
    ELSE
      DO GetClient
      DISPLAY(?locClientCount)
    .
  .
       OMIT('XXX')
         UNHIDE(?YellowStripe,?List)
         gloFileName = 'amxUpdate.SQL'
         DO Viewer4:Initialize
         Viewer4.DisplayPage(1)
       XXX
  locUnlock = TRUE
  UNHIDE(?ButtonUpload)
  locCountFTP = RECORDS(FTP)
  PT:Number = 0
  DISPLAY()
  CLOSE(Text)
  IF ERRORCODE() AND ERRORCODE() <> 37 THEN STOP('CLOSE amxUpdate.SQL: ' & ERROR()).
   locCountFTP = 0
    LOOP I# = 1 TO RECORDS(FTP)
      GET(FTP,I#)
      IF EXISTS(FTP:PDF)
        locCountFTP += 1
    . .
  DISPLAY(?locCountFTP)



GetClient ROUTINE
  C# += 1
  IF CLI:FIRST
    locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
  ELSE
    locClientName = CLI:LAST
  .
  locLength = LEN(CLIP(locClientName))
  LOOP locIndex = 1 TO locLength
    IF INRANGE(locCLI:Name[locIndex],0,31) OR INRANGE(locCLI:Name[locIndex],91,96) OR locCLI:Name[locIndex] = 34  OR locCLI:Name[locIndex] > 122
      locCLI:Name[locIndex] = 32
    .
  .
  locLength = LEN(CLIP(CLI:Address1))
  LOOP locIndex = 1 TO locLength
    IF INRANGE(locCLI:Address1[locIndex],0,31) OR INRANGE(locCLI:Address1[locIndex],91,96) OR locCLI:Address1[locIndex] = 34  OR locCLI:Address1[locIndex] > 122
      locCLI:Address1[locIndex] = 32
    .
  .
  locLength = LEN(CLIP(CLI:Address2))
  LOOP locIndex = 1 TO locLength
    IF INRANGE(locCLI:Address2[locIndex],0,31) OR INRANGE(locCLI:Address2[locIndex],91,96) OR locCLI:Address2[locIndex] = 34  OR locCLI:Address2[locIndex] > 122
      locCLI:Address2[locIndex] = 32
    .
  .
 ! TXT:Text = 'INSERT INTO `amx_portal`.`Client` (`Number`, `Name`, `Address`, `Address2`, `City`, `State`, `PostalCode`, `Contact`, `Phone`, `Email`, `Mobile`, `Fax`, `RecordsCRC`, `days`, `ip`, `LastVisit`, `Updated`) VALUES (' & CLIP(CLI:Number) & ',"' & CLIP(CLI:Last) & '","' & CLIP(CLI:Address1) & '","' & CLIP(CLI:Address2) & '","' & CLIP(CLI:City) & '","' & CLIP(CLI:State) & '","' & CLIP(CLI:Zip) & '","' & CLIP(CLI:Contact) & '","' & CLIP(CLI:Phone) & '","' & CLIP(CLI:Email) & '"," ","' & CLIP(CLI:Fax) & '","","","",NOW(),NOW());'
 ! ADD(Text)
GetPatient ROUTINE
  P# += 1
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


  
  IF Pat:STATUS = 'C'
      FTP:PDF = PAT:Client & '\' & PAT:Invoice & 'e.PDF'
      locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' &  FTP:PDF
    IF EXISTS(locPathPDF)
      FREE(AllFiles)
      DIRECTORY(AllFiles, PATH(locPathPDF), 0 )
      GET(AllFiles,1)
      if errorcode() then stop('PDF Not Found: ' & locPathPDF).
      IF ~locDateRestriction OR (FIL:Date = TODAY() OR FIL:Date = locStartDate)
        GET(FTP,FTP:PDF)
        IF ERRORCODE()
          FTP:Patient = PAT:Invoice
          FTP:Client = PAT:CLIENT
          CLEAR(CLI:Record)
          CLI:NUMBER = PAT:CLIENT
          GET(CLIENT,CLI:ORDER_KEY)
          FTP:Billing = CLI:BILLING
          FTP:FileName = PAT:Invoice & 'e.PDF'
          ADD(FTP,FTP:PDF)
          IF ERRORCODE() THEN STOP('ADD FTP: ' & ERROR()).
        .
      ELSE
        FTP:PDF = ' Date=' &  FORMAT(FIL:Date,@D1) & ' ' &  PAT:Client & '\' & PAT:Invoice & 'e.PDF'
        FTP:Patient = PAT:Invoice
        FTP:Client = PAT:CLIENT
        FTP:Billing = CLI:BILLING
        FTP:FileName = PAT:Invoice & 's.PDF'
    !    ADD(FTP,FTP:PDF)
         STOP(FTP:FileName & ' Not Added to FTP')
      .
    ELSIF EXISTS(CLIP(locPath) & 'ResultsNoEncrypt\' & PAT:Client & '\' & PAT:Invoice & 's.PDF')
      FTP:PDF = PAT:Client & '\' & PAT:Invoice & 's.PDF'
      locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' &  FTP:PDF
      FREE(AllFiles)
      DIRECTORY(AllFiles, PATH(locPathPDF), 0 )
      GET(AllFiles,1)
      IF ~locDateRestriction OR (FIL:Date = TODAY() OR FIL:Date = locStartDate)
        FTP:Patient = PAT:Invoice
        FTP:Client = PAT:CLIENT
        FTP:Billing = CLI:BILLING
        FTP:FileName = PAT:Invoice & 's.PDF'
        ADD(FTP)
        IF ERRORCODE() THEN STOP('ADD FTP: ' & ERROR()).
      ELSE
        FTP:PDF = 'Date=' & FORMAT(FIL:Date,@D1) & ' ' & PAT:Client & '\' & PAT:Invoice & 's.PDF'
        FTP:Patient = PAT:Invoice
        FTP:Client = PAT:CLIENT
        FTP:Billing = CLI:BILLING
        FTP:FileName = PAT:Invoice & 's.PDF'
   !     ADD(FTP,FTP:PDF)
        STOP(FTP:FileName & ' Not Added to FTP')
      .
    ELSIF Pat:STATUS <> 'X'
      STOP('PDF NOT FOUND: ' & locPathPDF)
    .
  .


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('amxUpdate')
  locPath = LONGPATH('..\')
  gloFileName2 = CLIP(locPath) & 'ls.txt'
  gloFileName3 = CLIP(locPath) & 'buData/updateTest.sql'
  
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?locStartDate
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
  gloFileName = 'amxUpdate.SQL'
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:HL7.Open                                          ! File HL7 used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:PDF.Open                                          ! File PDF used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Relate:Text.Open                                         ! File Text used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  Relate:Text.Close
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
    0{PROP:Wallpaper} = gloWallpaper
    locIncludeDate = 1 ! Include date 
    locIncludeRange = 1
    locIncludeUpdated = 1 ! Updated Checkbox
    locDateRestriction = 0
    locCreratedData = 0
    locCurrentPath = PATH()
    locCurrentPath = LONGPATH(locCurrentPath)
  
    
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
    Relate:HL7.Close
    Relate:Online.Close
    Relate:PDF.Close
    Relate:Rast.Close
    Relate:Test.Close
    Relate:Text.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  IF ViewerActive4 THEN Viewer4.TakeEvent(EVENT()).
  PARENT.Reset(Force)


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
    OF ?Now
      DO Start  ! Get PDFs clicked to start off.
    OF ?buttonCreateSeroLabsHL7
        locTestCount = 0
        CLOSE(HL7)
        OPEN(HL7)
        IF ERRORCODE() THEN STOP('OPEN HL7:' & ERROR()).  
        CLEAR(HL7:Record)
        SET(HL7:OrderKey,HL7:OrderKey)
        CLOSE(Text)
        gloFileName = 'postHL7' & FORMAT(TODAY(),@D11)  & FORMAT(CLOCK(),@T2)  & '.txt'
        CREATE(Text)
        IF ERRORCODE() THEN STOP('CREATE TEXT:' & ERROR()).
        OPEN(Text)
        
        LOOP UNTIL EOF(HL7)
          NEXT(HL7)
          IF ERRORCODE() THEN STOP('NEXT HL7:' & ERROR()).
          IF HL7:Client = 200424
            Pat:INVOICE = HL7:Accession
            GET(Patient,Pat:INVOICE_KEY)
            IF ERRORCODE() THEN STOP('GET HL7:' & ERROR()).
            TXT:Text = CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID 
            ADD(Text)
            IF ERRORCODE() THEN STOP('ADD HL7:' & ERROR()).
            locTestCount += 1
          . 
        . 
        CLOSE(HL7)
        CLOSE(Text)
      !    STOP('locTestCount += ' & locTestCount)
        IF locTestCount > 0
      !     stop('Test Count: ' & locTestCount)
          RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName) & ' amx@amxemr.com:/home/amx/HL7/200424/ & exit',1) 
          SLEEP(2000)
        .
       
    OF ?ButtonCreateHL7s
        locTestCount = 0 !! San Juan 
        CLOSE(HL7)
        OPEN(HL7)
        IF ERRORCODE() THEN STOP('OPEN HL7:' & ERROR()).  
        CLEAR(HL7:Record)
        SET(HL7:OrderKey,HL7:OrderKey)
        CLOSE(Text)
        locDateTime = FORMAT(TODAY(),@D11)  & FORMAT(CLOCK(),@T2) 
        gloFileName = 'postHL7' & locDateTime & '.txt'
        CREATE(Text)
        IF ERRORCODE() THEN STOP('CREATE TEXT:' & ERROR()).
        OPEN(Text)
        
        LOOP UNTIL EOF(HL7)
          NEXT(HL7)
          IF HL7:Client = 500258
            Pat:INVOICE = HL7:Accession
            GET(Patient,Pat:INVOICE_KEY)
            TXT:Text = CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID 
            ADD(Text)
            locTestCount += 1
          . 
        . 
        CLOSE(HL7)
        CLOSE(Text)
        IF locTestCount > 0
      !     stop('Test Count: ' & locTestCount)
          RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName) & ' amx@amxemr.com:/home/amx/HL7/500258/ & exit',1) 
      !      stop('file sent: ' & gloFileName)
          SLEEP(2000)
       ELSE
      !     stop('Error, Test Count: ' & locTestCount)
        .
    OF ?locFrom
      DoUpdateSanJuan()
    OF ?ButtonRangeDoIt:3
      locFileList = ''
      locPDFs = ''
      locPipe = ''
      IF locFrom AND locTo 
      locToday = TODAY()
      locPatientCount = 0
      locClientCount = 0
      FREE(Patients)
      FREE(Clients)
      FREE(FTP)
      locCountFTP = 0
      DISPLAY()  
      CLEAR(PAT:Record)
      PAT:Invoice = locFrom
      SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
      LOOP
        NEXT(Patient)
        IF ERRORCODE() OR PAT:Invoice > locTo THEN BREAK.
        IF NOT Pat:STATUS = 'C' THEN CYCLE.
      
        FTP:PDF = PAT:Client & '\' & PAT:Invoice & 'e.PDF'
        FTP:FileName = PAT:Invoice & 'e.PDF'
        locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' &  FTP:PDF
        IF NOT EXISTS(locPathPDF) AND Pat:CLIENT < 200000
          FTP:PDF = PAT:Client & '\' & PAT:Invoice & 's.PDF'        
          locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' &  FTP:PDF
          IF NOT EXISTS(locPathPDF)
            STOP('CLIENT: ' & Pat:CLIENT & ' PATIENT: ' & PAT:INVOICE & ' STATUS=C, NO PDF')
            CYCLE 
          .
          FTP:FileName = PAT:Invoice & 's.PDF'
        .
        
      
      
        GET(FTP,FTP:PDF)
        IF ERRORCODE()  
          locPDFs = CLIP(LEFT(locPDFs)) & locPipe & CLIP(LEFT('/home/amx/Z/ResultsNoEncrypt/' & PAT:Client & '/' & FTP:FileName))
          locPipe = '|'
          locFileList = CLIP(locFileList) & ' ' & CLIP(LEFT(locPathPDF) )
          locPathPDF = CLIP(locPath) & 'ResultsNoEncrypt\' &  FTP:PDF
          CLI:NUMBER = PAT:CLIENT
          GET(CLIENT,CLI:ORDER_KEY)         
          FTP:Patient = PAT:Invoice
          FTP:Client = PAT:CLIENT   
          FTP:Billing = CLI:BILLING
          ADD(FTP,FTP:PDF)
      . . 
      CLOSE(Text)
      IF ERRORCODE() AND ERRORCODE() <> 37 THEN STOP('UPLOAD SQL: ' & ERROR()).
      gloFileName = 'movePDF.php' 
      CREATE(Text)
      OPEN(Text)
      TXT:Text = '<?php'
      ADD(Text)  
      
      LOOP I# = 1 TO RECORDS(FTP)
        GET(FTP,I#)
        IF EXISTS(locPath)
          locFileList = CLIP(locFileList) & ' ' & CLIP(locPathPDF)
          TXT:Text = 'if (file_exists("/home/amx/Z/' & CLIP(FTP:FileName) & '")){{'
          ADD(Text)
          TXT:Text = '  if (!file_exists("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '")){{@mkdir("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '");}'
          ADD(Text)
          TXT:Text = '  rename("/home/amx/Z/' & CLIP(FTP:FileName) & '","/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '/' & CLIP(FTP:FileName) &  '");<10>'
          ADD(Text)
          IF FTP:Client <> FTP:Billing
            TXT:Text = '  mkdir("/home/amx/Z/ResultsNoEncrypt/' & FTP:Billing & '");'
            ADD(Text)
            TXT:Text = '  copy("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '/' & CLIP(FTP:FileName) &  '","/home/amx/Z/ResultsNoEncrypt/' & FTP:Billing & '/' & CLIP(FTP:FileName) &  '");<10>}'
            ADD(Text)
          ELSE
            TXT:Text = '}'
            ADD(Text)
          .
        .
      . 
      TXT:TEXT = 'file_put_contents("/home/amx/Z/check.txt","' & CLIP(LEFT(locPDFs))  & '");'
      ADD(TEXT)
      TXT:TEXT = '?>'
      ADD(TEXT)
      CLOSE(TEXT)
      !   TXT:TEST = file_put_contents('\home\amx\Z\check.php','',FILE_APPEND);'
      RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! movePDF.php amx@amxemr.com:/home/amx/Z/ & PAUSE',1) 
      RUN('CMD /c  ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(locFileList) & ' amx@amxemr.com:/home/amx/Z/ & PAUSE',1) 
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/movePDFs.php')
      .   
      
      OMIT('XXX')
      
      
          CLEAR(CLI:Record)
      
          FTP:Billing = CLI:BILLING
          FTP:FileName = PAT:Invoice & 'e.PDF'
          ADD(FTP,FTP:PDF)      
      
      
      
      
      
      
      
      
      SORT(Patients,PT:PCAE,PT:Number)
      LOOP I# = 1 TO RECORDS(Patients)
        GET(Patients,I#)
        PAT:Invoice = PT:Number
        DISPLAY(?PT:Number)
        GET(Patient,PAT:Invoice_key)
        IF ERRORCODE()
          STOP('PAT: ' & PT:Number & ' ' & ERROR())
        ELSE
          OL:Number = PAT:Client
          DO GetPatient
          DISPLAY(?locPatientCount)
        .
      .
      SORT(Clients,CL:PCAE,CL:Number)
      LOOP I# = 1 TO RECORDS(Clients)
        GET(Clients,I#)
        CLI:Number = CL:Number
        GET(Client,CLI:ORDER_KEY)
        IF ERRORCODE()
          STOP('CLI: ' & CLI:Number & ' '  & ERROR())
        ELSE
          DO GetClient
          DISPLAY(?locClientCount)
        .    
      .
      CLOSE(Text)    
      HIDE(?Now)
      locCountFTP = RECORDS(FTP)
      PT:Number = 0
      DISPLAY()
      
      IF ERRORCODE() AND ERRORCODE() <> 37 THEN STOP('CLOSE amxUpdate.SQL: ' & ERROR()).
      locCountFTP = 0
      LOOP I# = 1 TO RECORDS(FTP)
        GET(FTP,I#)
        IF EXISTS(FTP:PDF)
          locCountFTP += 1
      . .
      DISPLAY(?locCountFTP)
          
      .
      
      XXX
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ButtonUpload
      ThisWindow.Update
      DO Upload
      
      
    OF ?ButtonCheckHL7
      ThisWindow.Update
      !  BUTTON('Find HL7 Input'),AT(148,210,126,20),USE(?ButtonCheckHL7),FONT(,14,COLOR:Navy,FONT:bold)
      ! Goes through HL7.tps makeikng text file
      
        locTestCountCPL = 0        
        locTestCountSERO = 0        
        locTestCountSanJuan = 0  
        DISPLAY
        CLOSE(HL7)
        OPEN(HL7)
        CLOSE(Text)
        OPEN(Text)
        EMPTY(Text)
        OPEN(Text)
        SET(HL7)
        LOOP UNTIL EOF(HL7)
          NEXT(HL7)
          IF ERRORCODE() THEN STOP(ERROR()).
      !         STOP(CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID )
          IF HL7:Client = 200032
            Pat:INVOICE = HL7:Accession
            GET(Patient,Pat:INVOICE_KEY)
            TXT:Text = CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID 
            ADD(Text)
            locTestCountCPL += 1
          .
          IF HL7:Client = 200424
            Pat:INVOICE = HL7:Accession
            GET(Patient,Pat:INVOICE_KEY)
            TXT:Text = CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID 
            ADD(Text)
            locTestCountSERO += 1
          .           
          IF HL7:Client = 500258
            Pat:INVOICE = HL7:Accession
            GET(Patient,Pat:INVOICE_KEY)
            TXT:Text = CLIP(HL7:Client) & '|' & HL7:Accession  & '|' & Pat:CLIENT_ID 
            ADD(Text)
            locTestCountSanJuan += 1
        . . 
           
           
           
    OF ?ButtonCreateHL7
      ThisWindow.Update
      ExportResult()
      ThisWindow.Reset
    OF ?buttonCreateSeroLabsHL7
      ThisWindow.Update
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/HL7/200424/post200424.php?filename=' & gloFileName)
      DoUpdateSanJuan()
    OF ?ButtonCreateHL7s
      ThisWindow.Update
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/HL7/500258/post500258.php?filename=' & gloFileName)
    OF ?UpdateSanaJuan
      ThisWindow.Update
        DoUpdateSanJuan()      
    OF ?buttonUpdateDataOnly:3
      ThisWindow.Update
      ! "Update Data" Button
      REMOVE('updatepatient.txt')
      REMOVE('updatetest.txt')
      REMOVE('updateclient.txt')
      REMOVE('updatephysicians.txt')
      ExportUpdates(locTo,locFrom)
      RUN('CMD /c C:\Apps\updateAMX.bat & EXIT',1)
      
      
      OMIT('XXX')
      
      IF locFrom AND locTo
        CLEAR(PAT:Record)
        PAT:Invoice = locFrom
        SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
        LOOP
          NEXT(Patient)
          IF ERRORCODE() OR PAT:Invoice > locTo THEN BREAK.
          CLI:Number = PAT:CLIENT
          GET(Client,CLI:ORDER_KEY)
          P# += 1
      
          DO AddClient  
        .
        SORT(Clients,CL:PCAE,CL:Number)
        LOOP I# = 1 TO RECORDS(Clients)
          GET(Clients,I#)
          CLI:Number = CL:Number
          GET(Client,CLI:ORDER_KEY)
          IF ERRORCODE()
            STOP('CLI: ' & CLI:Number & ' '  & ERROR())
          ELSE
            DO GetClient
            DISPLAY(?locClientCount)
          .    
        .
      .
      locUnlock = TRUE
      UNHIDE(?ButtonUpload)
      DISPLAY
      
        XXX
      
      
    OF ?BUTTON1
      ThisWindow.Update
      exportTables()
      ThisWindow.Reset
    OF ?BUTTON2
      ThisWindow.Update
      DO ByPassResults
      !runs when hidden button is clicked=> BUTTON('Do Not Click'),AT(450,2),USE(?BUTTON2),HIDE
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
  CASE FIELD()
  OF ?List
    IF ViewerActive4
      IF Viewer4.TakeEvent(EVENT())=Level:Notify THEN CYCLE.
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
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
    OF ?LIST1
      GET(FTP,CHOICE(?LIST1))
      SETCLIPBOARD('DIR ' & SUB(FTP:PDF,9,55))
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
    CASE EVENT()
    OF EVENT:CloseWindow
      IF ViewerActive4
        Viewer4.Kill
        ViewerActive4=False
      END
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      
      CLOSE(Text)
      CREATE(Text)
      OPEN(Text)
      IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
      EXECUTE TODAY() % 7 + 1
      locStartDate = TODAY() - 2
      locStartDate = TODAY() - 4
      locStartDate = TODAY() - 4
      locStartDate = TODAY() - 2
      locStartDate = TODAY() - 2
      locStartDate = TODAY() - 2
      locStartDate = TODAY() - 2
      locStartDate = TODAY() - 3
      .
      DISPLAY(?locStartDate)
      ! Run('CMD /c cd \program files\filezilla FTP Client & filezilla -c ""0/amx"" & exit ')
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

