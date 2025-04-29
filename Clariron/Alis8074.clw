

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8074.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8072.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
amxUpdateDiet PROCEDURE (prmClient)

FTPONLINE:New        EQUATE(4)
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

LS   FILE,DRIVER('ASCII'),NAME('.\ls.txt'),PRE(LS) 
RECORD RECORD
TEXT  STRING(32)
 . . 
Data   FILE,DRIVER('ASCII'),NAME('..\buData\updateTest.sql'),PRE(DAT),CREATE
RECORD RECORD
TEXT  STRING(255)
 . . 

TRANS STRING(2),DIM(128)

locLastName  STRING(32)
locFirstName STRING(16)
locRangeCount        SHORT                                 !
locCreratedData      BYTE                                  !
locTestCount         LONG                                  !
locDateRestriction   BYTE                                  !
locPath              CSTRING(48)                           !
locIncludeUpdated    BYTE                                  !
locIncludeDate       BYTE                                  !
locIncludeRange      BYTE                                  !
locBuDate            LONG                                  !
locbuUpload          BYTE                                  !
locFileList          STRING(65536)                         !
FTP                  QUEUE,PRE(FTP)                        !
PDF                  STRING(64)                            !
Client               LONG                                  !
Patient              LONG                                  !
FileName             STRING(11)                            !
                     END                                   !
locCountFTP          USHORT                                !
locUnlock            BYTE                                  !
locDateCount         SHORT                                 !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('amx Update Diet'),AT(0,0,505,313),FONT('Arial',11,,FONT:regular),RESIZE,ICON('Allermetrix.ico'), |
  GRAY,IMM,MDI,HLP('amxUpdate'),SYSTEM
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
Start   ROUTINE
  locToday = TODAY()
  locPatientCount = 0
  locClientCount = 0
  gloFileName = '..\buData\amxUpdate.SQL'
 
  CLOSE(Text)
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE amxUpdate.SQL: ' & ERROR()).
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN amxUpdate.SQL: ' & ERROR()).

 
  TRANS[32] = ' '
  TRANS[33] = '!'
  TRANS[34] = '\"'
  TRANS[35] = '#'
  TRANS[36] = '$'
  TRANS[37] = '%'
  TRANS[38] = '&'
  TRANS[39] = ' '
  TRANS[40] = '('
  TRANS[41] = ')'
  TRANS[42] = '*'
  TRANS[43] = '+'
  TRANS[44] = ','
  TRANS[45] = '-'
  TRANS[46] = '.'
  TRANS[47] = '/'
  TRANS[48] = '0'
  TRANS[49] = '1'
  TRANS[50] = '2'
  TRANS[51] = '3'
  TRANS[52] = '4'
  TRANS[53] = '5'
  TRANS[54] = '6'
  TRANS[55] = '7'
  TRANS[56] = '8'
  TRANS[57] = '9'
  TRANS[58] = ':'
  TRANS[59] = ';'
  TRANS[60] = '<'
  TRANS[61] = '='
  TRANS[62] = '>'
  TRANS[63] = '?'
  TRANS[64] = '@'
  TRANS[65] = 'A'
  TRANS[66] = 'B'
  TRANS[67] = 'C'
  TRANS[68] = 'D'
  TRANS[69] = 'E'
  TRANS[70] = 'F'
  TRANS[71] = 'G'
  TRANS[72] = 'H'
  TRANS[73] = 'I'
  TRANS[74] = 'J'
  TRANS[75] = 'K'
  TRANS[76] = 'L'
  TRANS[77] = 'M'
  TRANS[78] = 'N'
  TRANS[79] = 'O'
  TRANS[80] = 'P'
  TRANS[81] = 'Q'
  TRANS[82] = 'R'
  TRANS[83] = 'S'
  TRANS[84] = 'T'
  TRANS[85] = 'U'
  TRANS[86] = 'V'
  TRANS[87] = 'W'
  TRANS[88] = 'X'
  TRANS[89] = 'Y'
  TRANS[90] = 'Z'
  TRANS[91] = '['
  TRANS[92] = '\'
  TRANS[93] = ']'
  TRANS[94] = '^'
  TRANS[95] = '_'
  TRANS[96] = '`'
  TRANS[97] = 'a'
  TRANS[98] = 'b'
  TRANS[99] = 'c'
  TRANS[100] = 'd'
  TRANS[101] = 'e'
  TRANS[102] = 'f'
  TRANS[103] = 'g'
  TRANS[104] = 'h'
  TRANS[105] = 'i'
  TRANS[106] = 'j'
  TRANS[107] = 'k'
  TRANS[108] = 'l'
  TRANS[109] = 'm'
  TRANS[110] = 'n'
  TRANS[111] = 'o'
  TRANS[112] = 'p'
  TRANS[113] = 'q'
  TRANS[114] = 'r'
  TRANS[115] = 's'
  TRANS[116] = 't'
  TRANS[117] = 'u'
  TRANS[118] = 'v'
  TRANS[119] = 'w'
  TRANS[120] = 'x'
  TRANS[121] = 'y'
  TRANS[122] = 'z'
  TRANS[123] = ''
  TRANS[124] = ''
  TRANS[125] = ''
  TRANS[126] = ''
  TRANS[127] = ''
  TRANS[128] = ''
  
  Pat:CLIENT = prmClient
  Pat:DATE = DATE(7,27,2009)
  SET(Pat:CLIENT_KEY,Pat:CLIENT_KEY)
  LOOP
    NEXT(Patient)
    IF Pat:CLIENT <> prmClient OR ERRORCODE() THEN stop('PAT: ' & error() & ' tCNT: ' & locTestCount & ' P: ' & P#);BREAK. 
    IF pat:STATUS = 'C' THEN  DO GetPatient.
  .
  CLOSE(TEXT)
  RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi .\budata\amxUpdate.SQL amx@amxemr.com:/home/amx/Z/buData/ & EXIT',1)   
  SLEEP(2000)
  URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/update.php')   
  

Upload  ROUTINE
  
       IF locUnlock
        CLOSE(Text)
        IF ERRORCODE() AND ERRORCODE() <> 37 THEN STOP('UPLOAD SQL: ' & ERROR()).
        RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi .\budata\amxUpdate.SQL amx@amxemr.com:/home/amx/Z/buData/ & EXIT',1)   
        RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi .\budata\UpdateTest.sql amx@amxemr.com:/home/amx/Z/buData/ & EXIT',1)   
        gloFileName = '..\buData\movePDF.php' 
        CREATE(Text)
        OPEN(Text)
        TXT:Text = '<?php'
        ADD(Text)
        locFileList = ''
        LOOP I# = 1 TO RECORDS(FTP)
          GET(FTP,I#)
          locPath = '.\ResultsNoEncrypt\' & FTP:PDF
          IF EXISTS(locPath)
            locFileList = CLIP(locFileList) & ' ' & CLIP(locPath)
            TXT:Text = 'if (file_exists("/home/amx/Z/' & CLIP(FTP:FileName) & '")){{'
            ADD(Text)
            TXT:Text = '  if (!file_exists("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '")){{mkdir("/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '");}'
            ADD(Text)
            TXT:Text = '  rename("/home/amx/Z/' & CLIP(FTP:FileName) & '","/home/amx/Z/ResultsNoEncrypt/' & FTP:Client & '/' & CLIP(FTP:FileName) &  '");<10>}'
            ADD(Text)
          .
        .
        TXT:Text = '?>'
        ADD(Text)
        CLOSE(Text)
        RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi .\budata\movePDF.php amx@amxemr.com:/home/amx/Z/ & EXIT',1)   
        RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & CLIP(locFileList) & ' amx@amxemr.com:/home/amx/Z/ & EXIT',1)   
        SLEEP(2000)
        URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/update.php') 
      !       STOP('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi ' & CLIP(locFileList) & ' amx@amxemr.com:/home/amx/Z/ & PAUSE & EXIT')   
      
        IF ~EXISTS('BUDATA.KEY') 
          locBuDate = GETINI('config','buDate','','alis.ini')
          IF locBuDate <> TODAY()
            PUTINI('config','buDate',TODAY(),'alis.ini')
            RUN('CMD /c ' & i#  & ' & ECHO ON & pscp -v -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi .\buData\*.* amx@amxemr.com:/home/amx/Z/buData/ & EXIT',0)   
        . .
        
      !    SLEEP(2000)
      !    RUN('CMD /c pscp -p -pw 7oT9W6l7E3cS2ge4O1UXxdDi amx@amxemr.com:/home/amx/Z/ls.txt ..\  & EXIT',1)
      .

GetClient ROUTINE
   C# += 1
  
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
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
  OL:PCAE = 10
  DO ADDSQL
 ! TXT:Text = 'INSERT INTO `amx_portal`.`Client` (`Number`, `Name`, `Address`, `Address2`, `City`, `State`, `PostalCode`, `Contact`, `Phone`, `Email`, `Mobile`, `Fax`, `RecordsCRC`, `days`, `ip`, `LastVisit`, `Updated`) VALUES (' & CLIP(CLI:Number) & ',"' & CLIP(CLI:Last) & '","' & CLIP(CLI:Address1) & '","' & CLIP(CLI:Address2) & '","' & CLIP(CLI:City) & '","' & CLIP(CLI:State) & '","' & CLIP(CLI:Zip) & '","' & CLIP(CLI:Contact) & '","' & CLIP(CLI:Phone) & '","' & CLIP(CLI:Email) & '"," ","' & CLIP(CLI:Fax) & '","","","",NOW(),NOW());'
 ! ADD(Text)
GetPatient ROUTINE
  P# += 1

  locDay = FORMAT(DAY(PAT:Date),@N02)
  locMonth = FORMAT(MONTH(PAT:Date),@N02)
  locYear = FORMAT(YEAR(PAT:Date),@N04)
  locDate = locYear & '-' & locMonth & '-' & locDay

  locDay = FORMAT(DAY(PAT:DOB),@N02)
  locMonth = FORMAT(MONTH(PAT:DOB),@N02)
  locYear = FORMAT(YEAR(PAT:DOB),@N04)
  locDoB = locYear & '-' & locMonth & '-' & locDay
  TXT:Text = 'INSERT INTO `amx_portal`.`Patient` (`Client`, `Patient`, `Date`, `Last`, `First`, `DoB`, `Age`, `Sex`, `Status`, `ClientID`, `Updated`) VALUES ("' & PAT:Client & '", "' & PAT:Invoice & '", "' & locDate & '", "' & CLIP(locLastName) & '", "' & CLIP(locFirstName) & '", "' & locDoB & '", "' & CLIP(PAT:Age)   & '", "' & CLIP(PAT:Sex) & '", "' & CLIP(PAT:Status) & '", "' & CLIP(PAT:Client_ID) & '", CURRENT_TIMESTAMP);'
!  ADD(Text)
  IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
  TXT:Text = 'UPDATE `amx_portal`.`Patient` SET `Client`=' & PAT:Client  & ',`Patient`= "' & CLIP(PAT:Invoice) & '",`Date`= "' & locDate & '",`Last`= "' & CLIP(locLastName) & '",`First`= "' & CLIP(locFirstName) & '",`DoB`= "' & locDOB & '",`Age`= "' & CLIP(PAT:Age) & '",`Sex`= "' & CLIP(PAT:Sex) & '",`Status`= "' & CLIP(PAT:Status) & '",`ClientID`= "' & CLIP(PAT:Client_ID) & '",`Updated`= CURRENT_TIMESTAMP WHERE `Patient`= ' & PAT:Invoice & ';'
!  ADD(Text)
  IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
  SHARE(Test)
  CLEAR(TST:Record)
  TST:INVOICE = Pat:INVOICE
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF Pat:INVOICE <> TST:INVOICE OR ERRORCODE() THEN BREAK.
    IF TST:STATUS <> 'C' OR SUB(TST:CODE,1,1) = '1' THEN CYCLE.
    RST:NUMBER = TST:CODE
    GET(Rast,RST:ORDER_KEY)
    TXT:Text = 'INSERT INTO `amx_portal` . `Test`(`Patient`, `Code`, `Type`, `Score`) VALUES (' & pat:invoice & ',''' & CLIP(TST:CODE) & ''',' & TST:TYPE & ',''' & CLIP(TST:Score)  & ''');'
    ADD(Text)
    IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
    TXT:Text = 'UPDATE `amx_portal`.`Test` SET `Type`=' & TST:Type  & ',`Score`= ''' & CLIP(TST:Score) & ''' WHERE`Patient`= ' & PAT:Invoice & ' AND `Code`=''' & CLIP(TST:CODE) & ''' AND `Type`=''' & TST:Type & ''' ;'
    ADD(Text)
    IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
    locTestCount += 1
  .
  CLOSE(Test)

  
AddClient ROUTINE
      CL:Number = PAT:Client
      GET(Clients,CL:Number)
      IF ERRORCODE()
        CL:PCAE = ONLINE:Client + ONLINE:Changed    
        ADD(Clients,CL:Number)
      .

AddTest ROUTINE
  CLI:Number = PAT:CLIENT
  GET(Client,CLI:ORDER_KEY)
  IF CLI:Diet <> 1 THEN EXIT.
  IF ~locCreratedData
    locCreratedData = TRUE
    CLOSE(Data)
    CREATE(Data)
    IF ERRORCODE() THEN STOP('CREATE updateTest.sql: ' & ERROR()).
  .
  OPEN(Data)
  IF ERRORCODE() THEN STOP('OPEN updateTest.sql: ' & ERROR()).
  SHARE(Test)
  CLEAR(TST:Record)
  TST:INVOICE = Pat:INVOICE
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF Pat:INVOICE <> TST:INVOICE OR ERRORCODE() THEN BREAK.
    IF TST:STATUS <> 'C' OR SUB(TST:CODE,1,1) = '1' THEN CYCLE.
    RST:NUMBER = TST:CODE
    GET(Rast,RST:ORDER_KEY)
    DAT:Text = 'INSERT INTO `amx_portal` . `Test`(`Patient`, `Code`, `Type`, `Score`,`Description`) VALUES (' & pat:invoice & ',''' & CLIP(TST:CODE) & ''',' & TST:TYPE & ',''' & CLIP(TST:Score)  & ''',''' & CLIP(RST:DESCRIPTION) & ''');'
    ADD(Data)
    DAT:Text = 'UPDATE `amx_portal`.`Test` SET `Type`=' & TST:Type  & ',`Score`= ''' & CLIP(TST:Score) & ''',`Description`= ''' & CLIP(RST:DESCRIPTION)  & ''' WHERE`Patient`= ' & PAT:Invoice & ' AND `Code`=''' & CLIP(TST:CODE) & ''' AND `Type`=''' & TST:Type & ''' ;'
    ADD(Data)
    locTestCount += 1
  .
  CLOSE(Test)
  CLOSE(Data)

  
AddTestPatient  ROUTINE
       DAT:Text = 'INSERT INTO `amx_portal`.`Patient` (`Client`, `Patient`, `Date`, `Last`, `First`, `DoB`, `Age`, `Sex`, `Status`, `ClientID`, `Updated`) VALUES ("' & PAT:Client & '", "' & PAT:Invoice & '", "' & locDate & '", "' & CLIP(PAT:Last) & '", "' & CLIP(PAT:First) & '", "' & locDoB & '", "' & CLIP(PAT:Age)   & '", "' & CLIP(PAT:Sex) & '", "' & CLIP(PAT:Status) & '", "' & CLIP(PAT:Client_ID) & '", CURRENT_TIMESTAMP);'
       ADD(Data)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
       DAT:Text = 'UPDATE `amx_portal`.`Patient` SET `Client`=' & PAT:Client  & ',`Patient`= "' & CLIP(PAT:Invoice) & '",`Date`= "' & locDate & '",`Last`= "' & CLIP(PAT:Last) & '",`First`= "' & CLIP(PAT:First) & '",`DoB`= "' & locDOB & '",`Age`= "' & CLIP(PAT:Age) & '",`Sex`= "' & CLIP(PAT:Sex) & '",`Status`= "' & CLIP(PAT:Status) & '",`ClientID`= "' & CLIP(PAT:Client_ID) & '",`Updated`= CURRENT_TIMESTAMP WHERE `Patient`= ' & PAT:Invoice & ';'
       ADD(Data)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
  


ADDSQL ROUTINE
     CASE OL:PCAE
     OF 5  ! NEW PATIENT
       TXT:Text = 'INSERT INTO `amx_portal`.`Patient` (`Client`, `Patient`, `Date`, `Last`, `First`, `DoB`, `Age`, `Sex`, `Status`, `ClientID`, `Updated`) VALUES ("' & PAT:Client & '", "' & PAT:Invoice & '", "' & locDate & '", "' & CLIP(PAT:Last) & '", "' & CLIP(PAT:First) & '", "' & locDoB & '", "' & CLIP(PAT:Age)   & '", "' & CLIP(PAT:Sex) & '", "' & CLIP(PAT:Status) & '", "' & CLIP(PAT:Client_ID) & '", CURRENT_TIMESTAMP);'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
       TXT:Text = 'UPDATE `amx_portal`.`Patient` SET `Client`=' & PAT:Client  & ',`Patient`= "' & CLIP(PAT:Invoice) & '",`Date`= "' & locDate & '",`Last`= "' & CLIP(PAT:Last) & '",`First`= "' & CLIP(PAT:First) & '",`DoB`= "' & locDOB & '",`Age`= "' & CLIP(PAT:Age) & '",`Sex`= "' & CLIP(PAT:Sex) & '",`Status`= "' & CLIP(PAT:Status) & '",`ClientID`= "' & CLIP(PAT:Client_ID) & '",`Updated`= CURRENT_TIMESTAMP WHERE `Patient`= ' & PAT:Invoice & ';'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
     OF 6  ! NEW CLIENT
       TXT:Text = 'INSERT INTO `amx_portal`.`Client` (`Number`, `Name`, `Address`, `Address2`, `City`, `State`, `PostalCode`, `Contact`, `Phone`, `Email`, `Mobile`, `Fax`, `RecordsCRC`, `days`, `ip`, `LastVisit`, `Updated`) VALUES (' & CLIP(CLI:Number) & ',"' & CLIP(CLI:Last) & '","' & CLIP(CLI:Address1) & '","' & CLIP(CLI:Address2) & '","' & CLIP(CLI:City) & '","' & CLIP(CLI:State) & '","' & CLIP(CLI:Zip) & '","' & CLIP(CLI:Contact) & '","' & CLIP(CLI:Phone) & '","' & CLIP(CLI:Email) & '"," ","' & CLIP(CLI:Fax) & '","","","",NOW(),NOW());'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
       TXT:Text = 'UPDATE `amx_portal`.`Client` SET `Number` = ' & CLIP(CLI:Number) & ', `Name`= "' & CLIP(CLI:Last) & '", `Address` = "' & CLIP(CLI:Address1) & '", `Address2` = "' & CLIP(CLI:Address2) & '", `City` = "' & CLIP(CLI:City) & '", `State` = "' & CLIP(CLI:State)  & '", `PostalCode` = "' & CLIP(CLI:Zip) & '", `Contact` = "' & CLIP(CLI:Contact) & '", `Phone` = "' & CLIP(CLI:Phone) & '", `Email` = "' & CLIP(CLI:Email) & '", `Mobile` = "' & '", `Fax` = "' & CLIP(CLI:Fax) & '",`Updated`= CURRENT_TIMESTAMP  WHERE `Client`.`Number` = ' & CLIP(CLI:Number) & ' ;'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
     OF 9  ! CHANGED PATIENT
       TXT:Text = 'INSERT INTO `amx_portal`.`Patient` (`Client`, `Patient`, `Date`, `Last`, `First`, `DoB`, `Age`, `Sex`, `Status`, `ClientID`, `Updated`) VALUES ("' & PAT:Client & '", "' & PAT:Invoice & '", "' & locDate & '", "' & CLIP(PAT:Last) & '", "' & CLIP(PAT:First) & '", "' & locDoB & '", "' & CLIP(PAT:Age)   & '", "' & CLIP(PAT:Sex) & '", "' & CLIP(PAT:Status) & '", "' & CLIP(PAT:Client_ID) & '", CURRENT_TIMESTAMP);'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
       TXT:Text = 'UPDATE `amx_portal`.`Patient` SET `Client`=' & PAT:Client  & ',`Patient`= "' & CLIP(PAT:Invoice) & '",`Date`= "' & locDate & '",`Last`= "' & CLIP(PAT:Last) & '",`First`= "' & CLIP(PAT:First) & '",`DoB`= "' & locDOB & '",`Age`= "' & CLIP(PAT:Age) & '",`Sex`= "' & CLIP(PAT:Sex) & '",`Status`= "' & CLIP(PAT:Status) & '",`ClientID`= "' & CLIP(PAT:Client_ID) & '",`Updated`= CURRENT_TIMESTAMP WHERE `Patient`= ' & PAT:Invoice & ';'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
     OF 10 ! CHANGED CLIENT
       TXT:Text = 'INSERT INTO `amx_portal`.`Client` (`Number`, `Name`, `Address`, `Address2`, `City`, `State`, `PostalCode`, `Contact`, `Phone`, `Email`, `Mobile`, `Fax`, `RecordsCRC`, `days`, `ip`, `LastVisit`, `Updated`) VALUES (' & CLIP(CLI:Number) & ',"' & CLIP(CLI:Last) & '","' & CLIP(CLI:Address1) & '","' & CLIP(CLI:Address2) & '","' & CLIP(CLI:City) & '","' & CLIP(CLI:State) & '","' & CLIP(CLI:Zip) & '","' & CLIP(CLI:Contact) & '","' & CLIP(CLI:Phone) & '","' & CLIP(CLI:Email) & '"," ","' & CLIP(CLI:Fax) & '","","","",NOW(),NOW());'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
       TXT:Text = 'UPDATE `amx_portal`.`Client` SET `Number` = ' & CLIP(CLI:Number) & ', `Name`= "' & CLIP(CLI:Last) & '", `Address` = "' & CLIP(CLI:Address1) & '", `Address2` = "' & CLIP(CLI:Address2) & '", `City` = "' & CLIP(CLI:City) & '", `State` = "' & CLIP(CLI:State)  & '", `PostalCode` = "' & CLIP(CLI:Zip) & '", `Contact` = "' & CLIP(CLI:Contact) & '", `Phone` = "' & CLIP(CLI:Phone) & '", `Email` = "' & CLIP(CLI:Email) & '", `Mobile` = "' & '", `Fax` = "' & CLIP(CLI:Fax) & '",`Updated`= CURRENT_TIMESTAMP  WHERE `Client`.`Number` = ' & CLIP(CLI:Number) & ' ;'
       ADD(Text)
       IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
    .


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('amxUpdateDiet')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  gloFileName = '..\buData\amxUpdate.SQL'
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:PDF.Open                                          ! File PDF used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
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
    locIncludeDate = 1
    locIncludeRange = 1
    locIncludeUpdated = 1
    locDateRestriction = 0
    locCreratedData = 0
    
  gloFileName = '..\buData\amxUpdate.SQL'
  
  CLOSE(Text)
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE amxUpdate.SQL: ' & ERROR()).
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN amxUpdate.SQL: ' & ERROR()).
  DO START
  
  POST(EVENT:CloseWindow)
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
    Relate:Online.Close
    Relate:PDF.Close
    Relate:Rast.Close
    Relate:Text.Close
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
      IF ~EXISTS('BUDATA.KEY') 
        locBuDate = GETINI('config','buDate','','alis.ini')
        IF locBuDate <> TODAY()
          Run('cmd /k DEL  ..\buData\*.* /Q & exit')
          Run('cmd /k copy ..\Data\test.Tps ..\buData & exit')
          Run('cmd /k copy ..\Data\patient.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\wpSetup.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\template.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Client.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Physicians.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\PickUp.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Supplies.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\sendouts.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\Salesman.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\specialty.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Printed.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\Rast.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Panels.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Pnl_test.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\plates.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Login.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Online.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Normals.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\FollowUp.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\GAM.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Courier.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\Docs.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\todo.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Cli_panl.tps ..\buData & exit')
          Run('cmd /k copy ..\Data\Codes.TPS ..\buData & exit')
          Run('cmd /k copy ..\Data\botanical.tps ..\buData & exit')
      . .
      CLOSE(Text)
      CREATE(Text)
      OPEN(Text)
      IF ERRORCODE() THEN STOP(' Text  ' & ERROR()).
      locStartDate = TODAY()
      
      ! Run('cmd /k cd \program files\filezilla FTP Client & filezilla -c ""0/amx"" & exit ')
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
!!! Generated from procedure template - Process
!!! Process the Billing File
!!! </summary>
GetLetters PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Billing)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Process Billing'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Process'), |
  TIP('Cancel Process')
                     END

ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisProcess          ProcessClass                          ! Process Manager
ProgressMgr          StepClass                             ! Progress Manager

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
  GlobalErrors.SetProcedureName('GetLetters')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('GetLetters',ProgressWindow)                ! Restore window settings from non-volatile store
  ProgressWindow{Prop:Timer} = 10                          ! Assign timer interval
  ThisProcess.Init(Process:View, Relate:Billing, ?Progress:PctText, Progress:Thermometer)
  ThisProcess.AddSortOrder()
  ProgressWindow{Prop:Text} = 'Processing Records'
  ?Progress:PctText{Prop:Text} = '0% Completed'
  SELF.Init(ThisProcess)
  ?Progress:UserString{Prop:Text}=''
  SELF.AddItem(?Progress:Cancel, RequestCancelled)
  SEND(Billing,'QUICKSCAN=on')
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
    Relate:Billing.Close
  END
  IF SELF.Opened
    INIMgr.Update('GetLetters',ProgressWindow)             ! Save window data to non-volatile store
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
!!! Generated from procedure template - Source
!!! </summary>
BillingFees          PROCEDURE                             ! Declare Procedure
locSource BYTE,DIM(113)
locTarget BYTE,DIM(16)
locData   STRING(113)!,OVER(locSource)  

  CODE

  SHARE(FEES)
  FEE:Client = 100000
  SET(FEE:OrderKey,FEE:OrderKey)
  LOOP UNTIL EOF(FEES)
    NEXT(FEES)
!    IF FEE:Client > 199999 THEN BREAK.
    FEE:TIgG = 20
    FEE:TIgA = 35
    FEE:TIgM = 20
    PUT(FEES)
    C# += 1
  
  .


  STOP(c#)
  return 
  
  
  
  
  
      SHARE(FEES)
      FEE:Client = 100003
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100014
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100021
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100024
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100025
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100028
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100031
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100032
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100035
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100036
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100040
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100042
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100051
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100059
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100060
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100064
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100067
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100077
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100078
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 100082
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     4.80
      FEE:IgG =     4.80
      FEE:IgG4 =    4.80
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200006
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    16.05
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200012
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    21.40
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   21.40;
      FEE:hyIgG =   21.40;
      FEE:hyIgG4 =  21.40;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200020
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    16.05
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200032
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    16.05
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
      IF ERRORCODE() <> 0 THEN STOP(ERRORCODE()).
	  STOP('2000032')
      FEE:Client = 200094
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200113
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    16.05
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   21.40;
      FEE:hyIgG =   21.40;
      FEE:hyIgG4 =  21.40;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200203
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    16.05
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   21.40;
      FEE:hyIgG =   21.40;
      FEE:hyIgG4 =  21.40;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200219
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200220
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200225
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200241
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200249
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200261
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200268
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200291
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200310
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200313
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200314
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200315
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 200366
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200372
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200394
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200399
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200402
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200423
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 200424
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 400000
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.00
      FEE:IgE =     4.50
      FEE:IgG =     4.50
      FEE:IgG4 =    4.50
      FEE:mxIgE =   7.00
      FEE:mxIgG =   7.00;
      FEE:mxIgG4 =  7.00;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  15.00;
      FEE:occIgG =  15.00;
      FEE:occIgG4 = 15.00;
      FEE:chemIgE = 15.00;
      FEE:chemIgG = 15.00;
      FEE:chemIgG4 = 15.00;
      FEE:ComponentIgE =  15.00;
      FEE:ComponentIgG =  15.00;
      FEE:ComponentIgG4 = 15.00;
      PUT(FEES)
	  
      FEE:Client = 500001
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.70
      FEE:IgG =     5.70
      FEE:IgG4 =    5.70
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500003
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 500007
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.80
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500008
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     6.40
      FEE:IgG =     6.40
      FEE:IgG4 =    6.40
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500228
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500231
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 500233
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.50
      FEE:IgG =     5.50
      FEE:IgG4 =    5.50
      FEE:mxIgE =   10.00
      FEE:mxIgG =   10.00;
      FEE:mxIgG4 =  10.00;
      FEE:hyIgE =   15.00;
      FEE:hyIgG =   15.00;
      FEE:hyIgG4 =  15.00;
      FEE:occIgE =  17.00;
      FEE:occIgG =  17.00;
      FEE:occIgG4 = 17.00;
      FEE:chemIgE = 20.00;
      FEE:chemIgG = 20.00;
      FEE:chemIgG4 = 20.00;
      FEE:ComponentIgE =  20.00;
      FEE:ComponentIgG =  20.00;
      FEE:ComponentIgG4 = 20.00;
      PUT(FEES)
	  
      FEE:Client = 500234
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500243
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.50
      FEE:IgG =     5.50
      FEE:IgG4 =    5.50
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500245
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 500248
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500249
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500251
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500256
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.25
      FEE:IgG =     5.25
      FEE:IgG4 =    5.25
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500258
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    9.60
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   13.91;
      FEE:hyIgG =   13.91;
      FEE:hyIgG4 =  13.91;
      FEE:occIgE =  13.90;
      FEE:occIgG =  13.90;
      FEE:occIgG4 = 13.90;
      FEE:chemIgE = 13.90;
      FEE:chemIgG = 13.90;
      FEE:chemIgG4 = 13.90;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500271
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500274
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500280
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500289
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  12.85;
      FEE:occIgG =  12.85;
      FEE:occIgG4 = 12.85;
      FEE:chemIgE = 12.85;
      FEE:chemIgG = 12.85;
      FEE:chemIgG4 = 12.85;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500295
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    21.40
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500300
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500306
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.10
      FEE:IgG =     5.10
      FEE:IgG4 =    5.10
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500316
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  11.80;
      FEE:occIgG =  11.80;
      FEE:occIgG4 = 11.80;
      FEE:chemIgE = 11.80;
      FEE:chemIgG = 11.80;
      FEE:chemIgG4 = 11.80;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500367
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500378
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500389
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500396
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.00
      FEE:IgE =     4.50
      FEE:IgG =     4.50
      FEE:IgG4 =    4.50
      FEE:mxIgE =   7.00
      FEE:mxIgG =   7.00;
      FEE:mxIgG4 =  7.00;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  15.00;
      FEE:occIgG =  15.00;
      FEE:occIgG4 = 15.00;
      FEE:chemIgE = 15.00;
      FEE:chemIgG = 15.00;
      FEE:chemIgG4 = 15.00;
      FEE:ComponentIgE =  15.00;
      FEE:ComponentIgG =  15.00;
      FEE:ComponentIgG4 = 15.00;
      PUT(FEES)
	  
      FEE:Client = 500428
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500445
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.90
      FEE:IgG =     5.90
      FEE:IgG4 =    5.90
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500472
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500479
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500492
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     6.40
      FEE:IgG =     6.40
      FEE:IgG4 =    6.40
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500523
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500595
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500627
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500751
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500809
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500815
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     6.40
      FEE:IgG =     6.40
      FEE:IgG4 =    6.40
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500823
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  21.40;
      FEE:ComponentIgG =  21.40;
      FEE:ComponentIgG4 = 21.40;
      PUT(FEES)
	  
      FEE:Client = 500854
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    13.90
      FEE:IgE =     6.40
      FEE:IgG =     6.40
      FEE:IgG4 =    6.40
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500862
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    12.85
      FEE:IgE =     5.60
      FEE:IgG =     5.60
      FEE:IgG4 =    5.60
      FEE:mxIgE =   7.50
      FEE:mxIgG =   7.50;
      FEE:mxIgG4 =  7.50;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  16.05;
      FEE:occIgG =  16.05;
      FEE:occIgG4 = 16.05;
      FEE:chemIgE = 16.05;
      FEE:chemIgG = 16.05;
      FEE:chemIgG4 = 16.05;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 500904
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    21.40
      FEE:IgE =     5.35
      FEE:IgG =     5.35
      FEE:IgG4 =    5.35
      FEE:mxIgE =   16.05
      FEE:mxIgG =   16.05;
      FEE:mxIgG4 =  16.05;
      FEE:hyIgE =   21.40;
      FEE:hyIgG =   21.40;
      FEE:hyIgG4 =  21.40;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 700000
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   10.70;
      FEE:hyIgG =   10.70;
      FEE:hyIgG4 =  10.70;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  
      FEE:Client = 700001
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    10.70
      FEE:IgE =     5.00
      FEE:IgG =     5.00
      FEE:IgG4 =    5.00
      FEE:mxIgE =   10.70
      FEE:mxIgG =   10.70;
      FEE:mxIgG4 =  10.70;
      FEE:hyIgE =   16.05;
      FEE:hyIgG =   16.05;
      FEE:hyIgG4 =  16.05;
      FEE:occIgE =  10.70;
      FEE:occIgG =  10.70;
      FEE:occIgG4 = 10.70;
      FEE:chemIgE = 21.40;
      FEE:chemIgG = 21.40;
      FEE:chemIgG4 = 21.40;
      FEE:ComponentIgE =  16.05;
      FEE:ComponentIgG =  16.05;
      FEE:ComponentIgG4 = 16.05;
      PUT(FEES)
	  

  
  
  
  return
  


  
  gloFileName2 = 'C:\C6\alis\fee.csv'
  SHARE(fees)
  IF ERRORCODE() THEN  STOP('FEE: ' & ERROR()).
  set(FEE:OrderKey,FEE:OrderKey)
  LOOP UNTIL EOF(FEES)
    NEXT(FEES)
    IF FEE:Client = 400000 THEN CYCLE.
    IF FEE:Client > 899999 THEN BREAK.
    
    IF FEE:Client < 200000
      FEE:TIgE = 10.70
      FEE:TIgG = 10.70
      FEE:TIgA =10.70
      FEE:TIgM = 10.70
      FEE:IgE = 4.8
      FEE:IgG = 4.8
      FEE:IgG4 = 4.8
      FEE:mxIgE = 10.7
      FEE:mxIgG = 10.7
      FEE:mxIgG4 = 10.7
      FEE:hyIgE = 16.05
      FEE:hyIgG = 16.05
      FEE:hyIgG4 = 16.05
      FEE:occIgE = 16.05
      FEE:occIgG = 16.05
      FEE:occIgG4 = 16.05
      FEE:chemIgE = 16.05
      FEE:chemIgG = 16.05
      FEE:chemIgG4 = 16.05
      FEE:ComponentIgE = 16.05
      FEE:ComponentIgG = 16.05
      FEE:ComponentIgG4 = 16.05
    ELSE
      FEE:TIgE = 10.70
      FEE:TIgG = 10.70
      FEE:TIgA = 10.70
      FEE:TIgM = 10.70
      FEE:IgE = 10.7
      FEE:IgG = 10.7
      FEE:IgG4 = 10.7
      FEE:mxIgE = 7.5
      FEE:mxIgG = 7.5
      FEE:mxIgG4 = 7.5
      FEE:hyIgE = 10.7
      FEE:hyIgG = 10.7
      FEE:hyIgG4 = 10.7
      FEE:occIgE = 16.05
      FEE:occIgG = 16.05
      FEE:occIgG4 = 16.05
      FEE:chemIgE = 18
      FEE:chemIgG = 18
      FEE:chemIgG4 = 18
      FEE:ComponentIgE = 18
      FEE:ComponentIgG = 18
      FEE:ComponentIgG4 = 18
    .
    PUT(FEES)
  !  STOP(ERRORCODE())
    IF ERRORCODE() THEN STOP('ERR: ' & FEE:Client & ' ' &  ERROR()).

  .





   return

  OMIT('xxx')
   SHARE(Fees)
   FEE:Client = 100059
   GET(Fees,FEE:OrderKey)
   if errorcode() then stop(error()).   
   locData = FEE:Record
   SHARE(CLIENT)  
   CLI:NUMBER = 100000
   SET(CLI:ORDER_KEY)
   LOOP
     NEXT(CLIENT)
     IF ERRORCODE() THEN BREAK.
     IF CLI:NUMBER > 100999 THEN BREAK.   
     MEX:Number = CLI:NUMBER
     ADD(locMexicans)
     
   .    
   loop i# = 1 to records(locMexicans)
     get(locMexicans,I#)
     FEE:Client = MEX:Number  
     GET(FEES,FEE:OrderKey)
     FEE:Record = locData
     FEE:Client = MEX:Number
     PUT(FEES)
     
     
   .



  stop('creating fees')
    C#= 0
    F# = 0
    locData = ''
    CLOSE(Fees)
    CREATE(Fees)
    OPEN(Fees)
    gloFileName = '..\client fees 12-8-18.csv'
    OPEN(Text)
    IF ERRORCODE() THEN stop('open fees: ' & error()).
    SET(Text,1)
    LOOP
      NEXT(Text)
      IF ERRORCODE() THEN stop('Next Text: ' & error());BREAK.
      LOOP I#=1 TO 512
   !     STOP('CHAR=' & locSource[I#] & ' c=' & c#)
   !     stop( '  <13,10>F=' & F# & '  <13,10>C=' & C# & '  <13,10>I=' & I#   &  ' <13,10> In: ' & TXT:text & ' <13,10>ld=' & CLIP(locData))
        
        IF locSource[I#] = 13
          
        ELSIF locSource[I#] = 44
          F# += 1
          
          case F#
          OF 1;FEE:Client = locData;locData = '';C# = 0 
          OF 2;FEE:tIgE   = locData;locData = '';C# = 0 
          OF 3;FEE:tIgG  = locData;locData = '';C# = 0 
          OF 4;FEE:IgE  = locData;locData = '';C# = 0  
          OF 5;FEE:IgG  = locData ;locData = '';C# = 0  
          OF 6;FEE:IgG4 = locData;locData = '' ;C# = 0 
          OF 7;FEE:mxIgE = locData;locData = '';C# = 0   
          OF 8;FEE:mxIgG = locData;locData = '';C# = 0   
          OF 9;FEE:mxIgG4 = locData;locData = '';C# = 0 
          OF 10;FEE:hyIgE = locData;locData = '';C# = 0 
          OF 11;FEE:hyIgG = locData;locData = '';C# = 0 
          OF 12;FEE:hyIgG4 = locData;locData = '';C# = 0 
          OF 13;FEE:occIgE = locData;locData = '';C# = 0 
          OF 14;FEE:occIgG  = locData;locData = '';C# = 0 
          OF 15;FEE:occIgG4 = locData;locData = '';C# = 0 
          OF 16;FEE:chemIgE = locData;locData = '';C# = 0 
          OF 17;FEE:chemIgG = locData;locData = '';C# = 0 
          OF 18;FEE:chemIgG4 = locData;locData = '' ;C# = 0
       !   OF 19;FEE:Type = locData;
            FEE:TIgA = 20;
            FEE:TIgM=20;
            FEE:Panel260=25;
            FEE:Panel260S145=75;
            FEE:Panel270=28.33;
            FEE:ComponentIgE = 15;
            FEE:ComponentIgG = 15;
            FEE:ComponentIgG4 = 15;
            ADD(Fees);
            IF ERRORCODE() THEN STOP('ADD FEES: ' & ERROR() & ', CLI:' &  FEE:Client).
            CLEAR(FEE:Record);
            locData = '';
            F# = 0;
            C# = 0;
            locData = '';
            BREAK
          .
        ELSIF INRANGE(locSource[I#],46, 122) 
          C# += 1
          locTarget[C#] = locSource[I#]
                   
        .
        
      .
    .
    return
    FEE:Client = 200252
    GET(Fees,FEE:OrderKey)
    FEE:client = 80
    ADD(Fees)
    FEE:Client = 200245
    GET(Fees,FEE:OrderKey)
    FEE:client = 73
    FEE:ComponentIgE = 20
    FEE:ComponentIgG = 20
    FEE:ComponentIgG4 = 20
    ADD(Fees)
    FEE:client = 65
    ADD(Fees)
    FEE:client = 77
    ADD(Fees)
    CLEAR(FEE:Record)
    FEE:client = 69
    ADD(Fees)
    xxx
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Patient file
!!! </summary>
BillingCheck PROCEDURE 

CurrentTab           STRING(80)                            !
locFilter            STRING(2)                             !
locTo                DATE                                  !
locDate              STRING(20)                            !
locPatient           STRING(32)                            !
locClientName        STRING(40)                            !
ActionMessage        CSTRING(40)                           !
locAddTestRecsMax    SHORT                                 !
locAddTestRecsNow    SHORT                                 !
locFrom              DATE                                  !
BRW1::View:Browse    VIEW(Patient)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:STATUS)
                       PROJECT(Pat:INVOICE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pat:DATE               LIKE(Pat:DATE)                 !List box control field - type derived from field
Pat:DATE_Style         LONG                           !Field style
Pat:STATUS             LIKE(Pat:STATUS)               !List box control field - type derived from field
Pat:STATUS_Style       LONG                           !Field style
locFilter              LIKE(locFilter)                !List box control field - type derived from local data
locFilter_Style        LONG                           !Field style
Pat:INVOICE            LIKE(Pat:INVOICE)              !List box control field - type derived from field
Pat:INVOICE_Style      LONG                           !Field style
locPatient             LIKE(locPatient)               !List box control field - type derived from local data
locPatient_Style       LONG                           !Field style
locClientName          LIKE(locClientName)            !List box control field - type derived from local data
locClientName_Style    LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW,AT(0,0,509,340),FONT('Arial',11,,FONT:regular),GRAY,MDI,HLP('VerifyPatients'),TIMER(1000)
                       LIST,AT(70,16,312,310),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,FORMAT('45R(2)|MY~Date' & |
  '~C(0)@d1@12C(2)|MY~S~C(0)@s1@8C(2)|MY~loc Filter~C(0)@s2@34L(3)|MY~Patient~C(0)@p###' & |
  ' ###p@82L(2)|MY~Patient~L(0)@s20@80L(2)|MY~Client~@s40@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Patient file'),TRN
                       STRING(@n-7),AT(434,24),USE(locAddTestRecsMax),FONT(,,,FONT:bold),TRN
                       STRING(@n-7),AT(434,43),USE(locAddTestRecsNow),FONT(,,,FONT:bold),TRN
                       BUTTON('&Insert'),AT(428,206,49,14),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  FLAT,HIDE,MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&View Edit'),AT(428,230,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(428,180,49,14),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('WADELETE.ICO'), |
  FLAT,HIDE,MSG('Delete the Record'),TIP('Delete the Record')
                       SHEET,AT(66,16,312,310),USE(?CurrentTab),SPREAD
                         TAB,USE(?Tab:2)
                         END
                       END
                       BUTTON('Done'),AT(428,264,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(428,230,70,25),USE(?Image2)
                       IMAGE('BUTTON.JPG'),AT(428,264,70,25),USE(?Image1)
                       STRING('Busy Adding Records'),AT(162,0),USE(?Busy),FONT(,18,COLOR:Red,FONT:bold),HIDE,TRN
                       PROMPT('Date'),AT(404,82,33),USE(?locTo:Prompt),RIGHT,TRN
                       ENTRY(@d17),AT(440,83,60,10),USE(locTo)
                     END

!PAT:BillingVerified STRING(2) OVER(Pat:IG4)
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(IListControl IC,VIEW V,BrowseQueue LQ,RelationManager RM,WindowManager WM)
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
  ?Browse:1{PROPSTYLE:FontName, 1}      = gloListFont
  ?Browse:1{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?Browse:1{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontSize
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BillingCheck')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('PAT:BillingVerified',PAT:BillingVerified)          ! Added by: BrowseBox(ABC)
  BIND('locFilter',locFilter)                              ! Added by: BrowseBox(ABC)
  BIND('locPatient',locPatient)                            ! Added by: BrowseBox(ABC)
  BIND('locClientName',locClientName)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:ResultsSendout.Open                               ! File ResultsSendout used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
    locDate = TODAY()
    locFrom = locDate
    locTo = locDate - 30
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Patient,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:DATE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pat:DATE_KEY)    ! Add the sort order for Pat:DATE_KEY for sort order 1
  BRW1.AddRange(Pat:DATE,locTo,locFrom)                    ! Add 'range of values' range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pat:DATE,,BRW1)                ! Initialize the browse locator using  using key: Pat:DATE_KEY , Pat:DATE
  BRW1.SetFilter('(~PAT:Ige)')                             ! Apply filter expression to browse
  BRW1.AddField(Pat:DATE,BRW1.Q.Pat:DATE)                  ! Field Pat:DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:STATUS,BRW1.Q.Pat:STATUS)              ! Field Pat:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(locFilter,BRW1.Q.locFilter)                ! Field locFilter is a hot field or requires assignment from browse
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)            ! Field Pat:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(locPatient,BRW1.Q.locPatient)              ! Field locPatient is a hot field or requires assignment from browse
  BRW1.AddField(locClientName,BRW1.Q.locClientName)        ! Field locClientName is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
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
    Relate:AddTests.Close
    Relate:Billing.Close
    Relate:Client.Close
    Relate:ResultsSendout.Close
  END
  BRW1::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  OMIT('XXXX')
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateBilling
    ReturnValue = GlobalResponse
  END
  XXXX
    
    BILL:Accession = Pat:INVOICE
    BILL:Invoice = Pat:INVOICE
    GET(Billing,BILL:patKey)
    IF ERRORCODE()
      CLEAR(BILL:Record)
      BILL:Invoice = Pat:INVOICE
      BILL:Accession = Pat:INVOICE
      BILL:LastNamePatient = Pat:LAST
      BILL:FirstNamePatient = Pat:FIRST
  !      BILL:Date = Pat:DATE
  !      BILL:DrawDate = Pat:COLLECTION
   !   BILL:GenderPatient = Pat:SEX
      BILL:Client = Pat:CLIENT
      BILL:Description = 'Allergy Tesing Performed on Blood'
      CASE Pat:BILLING
      OF 'C'
        BILL:FeeType = 5
      OF 'P'
        BILL:FeeType = 6
      OF 'I'
        BILL:FeeType = 1
      OF 'M'
        BILL:FeeType = 3
      OF 'C'
        BILL:FeeType = 4
      OF 'E'
        BILL:FeeType = 0
      .
      ADD(Billing)
      IF ERRORCODE() THEN STOP('ADD BILLING: ' & ERROR()).
    .
    GlobalRequest = ChangeRecord
    UpdateBilling
    ReturnValue = GlobalResponse
  
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


BRW1.Init PROCEDURE(IListControl IC,VIEW V,BrowseQueue LQ,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(IC,V,LQ,RM,WM)
  locDate = TODAY()


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.Pat:DATE_Style = 1 ! 
  SELF.Q.Pat:STATUS_Style = 1 ! 
  SELF.Q.locFilter_Style = 1 ! 
  SELF.Q.Pat:INVOICE_Style = 1 ! 
  SELF.Q.locPatient_Style = 1 ! 
  SELF.Q.locClientName_Style = 1 ! 


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  CLI:NUMBER = Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)
  locPatient = CLIP(Pat:LAST) & ', ' & Pat:FIRST
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
AddName              PROCEDURE                             ! Declare Procedure

  CODE
  IF GlobalRequest = InsertRecord
    NAM:Name = 'New'
    NAM:Number = Pat:INVOICE
    ADD(NameList)
    GlobalResponse = 1
  ELSIF GlobalRequest = ChangeRecord
   PUT(NameList) 
  ELSIF GlobalRequest = DeleteRecord
    DELETE(NameList)
  .
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Billing file
!!! </summary>
Billing PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Billing)
                       PROJECT(BILL:Accession)
                       PROJECT(BILL:QB)
                       PROJECT(BILL:DateFax1)
                       PROJECT(BILL:LastNamePatient)
                       PROJECT(BILL:FirstNamePatient)
                       PROJECT(BILL:NextLetter)
                       PROJECT(BILL:OutStanding)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BILL:Accession         LIKE(BILL:Accession)           !List box control field - type derived from field
BILL:Accession_Style   LONG                           !Field style
BILL:QB                LIKE(BILL:QB)                  !List box control field - type derived from field
BILL:QB_Style          LONG                           !Field style
BILL:DateFax1          LIKE(BILL:DateFax1)            !List box control field - type derived from field
BILL:DateFax1_Style    LONG                           !Field style
BILL:LastNamePatient   LIKE(BILL:LastNamePatient)     !List box control field - type derived from field
BILL:LastNamePatient_Style LONG                       !Field style
BILL:FirstNamePatient  LIKE(BILL:FirstNamePatient)    !List box control field - type derived from field
BILL:FirstNamePatient_Style LONG                      !Field style
BILL:NextLetter        LIKE(BILL:NextLetter)          !List box control field - type derived from field
BILL:NextLetter_Style  LONG                           !Field style
BILL:OutStanding       LIKE(BILL:OutStanding)         !List box control field - type derived from field
BILL:OutStanding_Style LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),RESIZE,VSCROLL,GRAY,IMM, |
  MDI,HLP('Billing')
                       LIST,AT(8,30,430,236),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold),HVSCROLL,COLOR(,COLOR:White, |
  COLOR:Blue),FORMAT('40C(2)|MY~Accession~@p### ###p@68L(2)|MY~QB~C(2)@s16@54R(2)|MY~Da' & |
  'te~C(0)@d17@80L(2)|MY~Last Name~C(2)@s24@80L(2)|MY~First Name~C(2)@s24@45L(2)|MY~Nex' & |
  't Letter~C(2)@d17@44L(2)|MY~Balance~C(2)@n-10.2@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Billing file'),TRN
                       BUTTON('&Select'),AT(441,65,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       SHEET,AT(4,4,495,270),USE(?CurrentTab),SPREAD
                         TAB('Patient Name'),USE(?Tab:5)
                           BUTTON('&Insert'),AT(43,313,42,12),USE(?Insert),HIDE
                           BUTTON('&Change'),AT(447,197,42,12),USE(?Change)
                           BUTTON('&Delete'),AT(446,105,42,12),USE(?Delete)
                         END
                         TAB('Quickbooks'),USE(?Tab:4)
                         END
                         TAB('DateKey'),USE(?Tab:2)
                         END
                         TAB('Accession'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Close'),AT(444,252,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(5,310,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 1
BRW1::Sort0:StepClass StepRealClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
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
  GlobalErrors.SetProcedureName('Billing')
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
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:LastNamePatient for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,BILL:OrderKey) ! Add the sort order for BILL:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,BILL:LastNamePatient,1,BRW1) ! Initialize the browse locator using  using key: BILL:OrderKey , BILL:LastNamePatient
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:QB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,BILL:qbKey) ! Add the sort order for BILL:qbKey for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,BILL:QB,1,BRW1)       ! Initialize the browse locator using  using key: BILL:qbKey , BILL:QB
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon BILL:Accession for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,BILL:patKey) ! Add the sort order for BILL:patKey for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)            ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,BILL:Accession,1,BRW1) ! Initialize the browse locator using  using key: BILL:patKey , BILL:Accession
  BRW1.AddSortOrder(,BILL:OrderKey)               ! Add the sort order for BILL:OrderKey for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)            ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,BILL:LastNamePatient,1,BRW1) ! Initialize the browse locator using  using key: BILL:OrderKey , BILL:LastNamePatient
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon BILL:DateFax1 for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,BILL:DateKey) ! Add the sort order for BILL:DateKey for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,BILL:DateFax1,1,BRW1) ! Initialize the browse locator using  using key: BILL:DateKey , BILL:DateFax1
  BRW1.AddField(BILL:Accession,BRW1.Q.BILL:Accession) ! Field BILL:Accession is a hot field or requires assignment from browse
  BRW1.AddField(BILL:QB,BRW1.Q.BILL:QB)           ! Field BILL:QB is a hot field or requires assignment from browse
  BRW1.AddField(BILL:DateFax1,BRW1.Q.BILL:DateFax1) ! Field BILL:DateFax1 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:LastNamePatient,BRW1.Q.BILL:LastNamePatient) ! Field BILL:LastNamePatient is a hot field or requires assignment from browse
  BRW1.AddField(BILL:FirstNamePatient,BRW1.Q.BILL:FirstNamePatient) ! Field BILL:FirstNamePatient is a hot field or requires assignment from browse
  BRW1.AddField(BILL:NextLetter,BRW1.Q.BILL:NextLetter) ! Field BILL:NextLetter is a hot field or requires assignment from browse
  BRW1.AddField(BILL:OutStanding,BRW1.Q.BILL:OutStanding) ! Field BILL:OutStanding is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','Billing',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,14,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
   0{PROP:Wallpaper} = gloWallpaper
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
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
    Relate:Billing.Close
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
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 1
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.BILL:Accession_Style = 1 ! 1
  SELF.Q.BILL:QB_Style = 1 ! 1
  SELF.Q.BILL:DateFax1_Style = 1 ! 1
  SELF.Q.BILL:LastNamePatient_Style = 1 ! 1
  SELF.Q.BILL:FirstNamePatient_Style = 1 ! 1
  SELF.Q.BILL:NextLetter_Style = 1 ! 1
  SELF.Q.BILL:OutStanding_Style = 1 ! 1


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>4,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>4,1,NewOrder+1))
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
!!! Browse the Billing file
!!! </summary>
Billing2 PROCEDURE 

locAccesssionSearch  STRING(6)                             !
locDateTo            DATE                                  !
locDateFrom          DATE                                  !
locAssessionFrom     LONG                                  !
locAssessionTo       LONG                                  !
locSelected          LONG                                  !
locQBSearch          STRING(16)                            !
locShowSearch        STRING(20)                            !
CurrentTab           LONG                                  !
locNameSearch        STRING(20)                            !
locAccountNumber     STRING(9)                             !
locFeeType           STRING(16)                            !
locToday             DATE                                  !
locDate              DATE                                  !
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
BRW1::View:Browse    VIEW(Billing)
                       PROJECT(BILL:Status)
                       PROJECT(BILL:DateFax1)
                       PROJECT(BILL:LastNamePatient)
                       PROJECT(BILL:FirstNamePatient)
                       PROJECT(BILL:NextLetter)
                       PROJECT(BILL:OutStanding)
                       PROJECT(BILL:Selected)
                       PROJECT(BILL:VerifiedBy)
                       PROJECT(BILL:VerifiedBy2)
                       PROJECT(BILL:QB)
                       PROJECT(BILL:Accession)
                       JOIN(Pat:INVOICE_KEY,BILL:Accession)
                         PROJECT(Pat:INVOICE)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
BILL:Status            LIKE(BILL:Status)              !List box control field - type derived from field
BILL:Status_Style      LONG                           !Field style
locFeeType             LIKE(locFeeType)               !List box control field - type derived from local data
locFeeType_Style       LONG                           !Field style
locAccountNumber       LIKE(locAccountNumber)         !List box control field - type derived from local data
locAccountNumber_Style LONG                           !Field style
BILL:DateFax1          LIKE(BILL:DateFax1)            !List box control field - type derived from field
BILL:DateFax1_Style    LONG                           !Field style
BILL:LastNamePatient   LIKE(BILL:LastNamePatient)     !List box control field - type derived from field
BILL:LastNamePatient_Style LONG                       !Field style
BILL:FirstNamePatient  LIKE(BILL:FirstNamePatient)    !List box control field - type derived from field
BILL:FirstNamePatient_Style LONG                      !Field style
BILL:NextLetter        LIKE(BILL:NextLetter)          !List box control field - type derived from field
BILL:NextLetter_Style  LONG                           !Field style
BILL:OutStanding       LIKE(BILL:OutStanding)         !List box control field - type derived from field
BILL:OutStanding_Style LONG                           !Field style
BILL:Selected          LIKE(BILL:Selected)            !List box control field - type derived from field
BILL:Selected_Style    LONG                           !Field style
BILL:VerifiedBy        LIKE(BILL:VerifiedBy)          !List box control field - type derived from field
BILL:VerifiedBy_Style  LONG                           !Field style
BILL:VerifiedBy2       LIKE(BILL:VerifiedBy2)         !List box control field - type derived from field
BILL:VerifiedBy2_Style LONG                           !Field style
BILL:QB                LIKE(BILL:QB)                  !Browse key field - type derived from field
BILL:Accession         LIKE(BILL:Accession)           !Browse key field - type derived from field
Pat:INVOICE            LIKE(Pat:INVOICE)              !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),GRAY,IMM,MDI,HLP('Billing')
                       LIST,AT(8,34,434,232),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold),HVSCROLL,COLOR(,COLOR:White, |
  COLOR:Blue),FORMAT('10L(2)|MY~S~C(0)@s1@50L(2)|MY~Type~C(0)@s16@39L(2)|MY~Accession~C' & |
  '(0)@s9@44C|MY~Date~@d17@77L(2)|MY~Last Name~C(2)@s24@70L(2)|MY~First Name~C(2)@s24@4' & |
  '5C|MY~Next Letter~@d17B@52L(2)|MY~Balance~L(8)@n-10.2@46L(2)|MY~Select~C(1)@n1@61L(2' & |
  ')|MY~Verified By~C(0)@s3@12L(2)|MY~Verified By 2~C(0)@s3@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Billing file'),TRN
                       BUTTON('&Select'),AT(444,64,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(448,241,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(442,294,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,HIDE,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(444,188,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(441,311,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,HIDE,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,495,270),USE(?CurrentTab),IMM,SPREAD
                         TAB('Date'),USE(?Tab:2)
                           BUTTON('Insert'),AT(444,136,49,14),USE(?ButtonInsert),LEFT,ICON('WAINSERT.ICO'),FLAT
                         END
                         TAB('Patient Name'),USE(?Tab:3)
                           ENTRY(@s20),AT(100,21,,10),USE(locNameSearch),OVR,CAP,IMM
                         END
                         TAB('Invoice'),USE(?Tab:4)
                           ENTRY(@s16),AT(212,21,60,10),USE(locQBSearch),IMM
                         END
                         TAB('Accession'),USE(?Tab:5)
                           PROMPT('Accesssion:'),AT(268,23),USE(?locAccesssionSearch:Prompt),TRN
                           ENTRY(@s6),AT(308,22,44,10),USE(locAccesssionSearch),LEFT,IMM
                         END
                         TAB('Letters'),USE(?Tab:6)
                           BUTTON('Print Letters'),AT(444,252,52),USE(?ButtonBatchLetters)
                           ENTRY(@n2),AT(446,274,24,10),USE(SU:Days1),RIGHT(1)
                           ENTRY(@n2),AT(474,274,24,10),USE(SU:Days2),RIGHT(1)
                           ENTRY(@n2),AT(376,309,24,10),USE(SU:Days3),RIGHT(1)
                           ENTRY(@n2),AT(404,309,24,10),USE(SU:Days4),RIGHT(1)
                           PROMPT('Days between letters'),AT(332,273,108),USE(?gloBillingLetterDays:Prompt),RIGHT,TRN
                         END
                         TAB('Verify'),USE(?Tab:7),HIDE
                           BUTTON('Print Letters'),AT(435,306),USE(?ButtonBatchLetters:2)
                           ENTRY(@n2),AT(258,308,24,10),USE(SU:Days1,,?SU:Days1:2),RIGHT(1)
                           ENTRY(@n2),AT(480,275,24,10),USE(SU:Days2,,?SU:Days2:2),RIGHT(1)
                           ENTRY(@n2),AT(376,309,24,10),USE(SU:Days3,,?SU:Days3:2),RIGHT(1)
                           ENTRY(@n2),AT(404,309,24,10),USE(SU:Days4,,?SU:Days4:2),RIGHT(1)
                           PROMPT('Days between letters'),AT(338,274,108),USE(?gloBillingLetterDays:Prompt:2),RIGHT,TRN
                         END
                       END
                       BUTTON('&Close'),AT(444,289,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(446,273,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Export Insurance'),AT(9,295,112),USE(?ButtonExport)
                       BUTTON('Import Fees'),AT(444,200),USE(?butt),HIDE
                       BUTTON('Payments'),AT(447,218),USE(?ButtonPayments),HIDE
                       BUTTON('Select All Insurance'),AT(9,278,112),USE(?BUTTON1)
                       BUTTON('Export All to QB'),AT(126,295,112),USE(?BUTTON2)
                       BUTTON('Select All Patients'),AT(126,278,112),USE(?BUTTON3)
                       BUTTON('Export Selected to QB'),AT(126,312,112),USE(?BUTTON4)
                       BUTTON('Export Selected to Insurance'),AT(9,312),USE(?BUTTON5)
                       BUTTON('Archive'),AT(249,278,52),USE(?BUTTON6)
                       BUTTON('Insurance'),AT(249,295,52),USE(?BUTTON7)
                       BUTTON('All Patients'),AT(249,312),USE(?BUTTON8)
                       PROMPT('Date Range'),AT(324,280),USE(?locDateFrom:Prompt)
                       ENTRY(@d17),AT(366,279,42,10),USE(locDateFrom)
                       ENTRY(@d17),AT(410,279,42,10),USE(locDateTo)
                       PROMPT('Assession Range'),AT(306,296),USE(?locAssessionFrom:Prompt)
                       ENTRY(@n_6),AT(366,295,34,10),USE(locAssessionFrom),RIGHT(1)
                       ENTRY(@n_6),AT(410,295,34,10),USE(locAssessionTo)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort5:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 6
BRW1::Sort0:StepClass StepRealClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepRealClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Billing2')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locFeeType',locFeeType)                            ! Added by: BrowseBox(ABC)
  BIND('locAccountNumber',locAccountNumber)                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Setup.Open                                        ! File Setup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Billing,SELF) ! Initialize the browse manager
  BRW1.SetUsePopup(False)
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:LastNamePatient for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,BILL:OrderKey)   ! Add the sort order for BILL:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,BILL:LastNamePatient,1,BRW1)   ! Initialize the browse locator using  using key: BILL:OrderKey , BILL:LastNamePatient
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon BILL:QB for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,BILL:qbKey)      ! Add the sort order for BILL:qbKey for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,BILL:QB,1,BRW1)                ! Initialize the browse locator using  using key: BILL:qbKey , BILL:QB
  BRW1.SetFilter('(LEN(CLIP(BILL:QB)) > 0)')               ! Apply filter expression to browse
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon BILL:Accession for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,BILL:patKey)     ! Add the sort order for BILL:patKey for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,BILL:Accession,1,BRW1)         ! Initialize the browse locator using  using key: BILL:patKey , BILL:Accession
  BRW1.AddSortOrder(,BILL:NextLetterKey)                   ! Add the sort order for BILL:NextLetterKey for sort order 4
  BRW1.AddRange(BILL:NextLetter,locDate,locToday)          ! Add 'range of values' range limit for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,BILL:NextLetter,1,BRW1)        ! Initialize the browse locator using  using key: BILL:NextLetterKey , BILL:NextLetter
  BRW1.AddSortOrder(,BILL:patKey)                          ! Add the sort order for BILL:patKey for sort order 5
  BRW1.AddLocator(BRW1::Sort5:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort5:Locator.Init(,BILL:Accession,1,BRW1)         ! Initialize the browse locator using  using key: BILL:patKey , BILL:Accession
  BRW1.SetFilter('(LEN(CLIP(BILL:VerifiedBy)) << 2 OR LEN(CLIP( BILL:VerifiedBy2)) << 2)') ! Apply filter expression to browse
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon BILL:DateFax1 for sort order 6
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,BILL:DateKey)    ! Add the sort order for BILL:DateKey for sort order 6
  BRW1.AddField(BILL:Status,BRW1.Q.BILL:Status)            ! Field BILL:Status is a hot field or requires assignment from browse
  BRW1.AddField(locFeeType,BRW1.Q.locFeeType)              ! Field locFeeType is a hot field or requires assignment from browse
  BRW1.AddField(locAccountNumber,BRW1.Q.locAccountNumber)  ! Field locAccountNumber is a hot field or requires assignment from browse
  BRW1.AddField(BILL:DateFax1,BRW1.Q.BILL:DateFax1)        ! Field BILL:DateFax1 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:LastNamePatient,BRW1.Q.BILL:LastNamePatient) ! Field BILL:LastNamePatient is a hot field or requires assignment from browse
  BRW1.AddField(BILL:FirstNamePatient,BRW1.Q.BILL:FirstNamePatient) ! Field BILL:FirstNamePatient is a hot field or requires assignment from browse
  BRW1.AddField(BILL:NextLetter,BRW1.Q.BILL:NextLetter)    ! Field BILL:NextLetter is a hot field or requires assignment from browse
  BRW1.AddField(BILL:OutStanding,BRW1.Q.BILL:OutStanding)  ! Field BILL:OutStanding is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Selected,BRW1.Q.BILL:Selected)        ! Field BILL:Selected is a hot field or requires assignment from browse
  BRW1.AddField(BILL:VerifiedBy,BRW1.Q.BILL:VerifiedBy)    ! Field BILL:VerifiedBy is a hot field or requires assignment from browse
  BRW1.AddField(BILL:VerifiedBy2,BRW1.Q.BILL:VerifiedBy2)  ! Field BILL:VerifiedBy2 is a hot field or requires assignment from browse
  BRW1.AddField(BILL:QB,BRW1.Q.BILL:QB)                    ! Field BILL:QB is a hot field or requires assignment from browse
  BRW1.AddField(BILL:Accession,BRW1.Q.BILL:Accession)      ! Field BILL:Accession is a hot field or requires assignment from browse
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)            ! Field Pat:INVOICE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
    locDate = 1
    locToday = TODAY()
    IF RECORDS(Setup) = 0 THEN ADD(Setup).
    SET(Setup)
    NEXT(Setup)
    ALIAS(EnterKey,TabKey)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Billing.Close
    Relate:Setup.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
   locAccesssionSearch = ''
   locNameSearch = ''
   DISPLAY()
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateBilling1
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
    OF ?ButtonInsert
      ThisWindow.Update
      BillingAddRecord()
      ThisWindow.Reset
      !   IF globalResponse = RequestCompleted
        CLEAR(BILL:Record)
        BILL:Accession = gloPatientNumber
        GET(Billing,BILL:patKey)
        BRW1.ResetFromFile
        BRW1.ResetFromView
    OF ?ButtonBatchLetters:2
      ThisWindow.Update
      BatchLetters()
      ThisWindow.Reset
    OF ?ButtonExport
      ThisWindow.Update
      Export2BillingQB()
      ThisWindow.Reset
    OF ?butt
      ThisWindow.Update
      BillingFees()
      ThisWindow.Reset
    OF ?ButtonPayments
      ThisWindow.Update
      BillingPayments()
      ThisWindow.Reset
    END
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
  OF ?CurrentTab
    CASE EVENT()
    OF EVENT:TabChanging
      
      
      
    END
  END
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
    CASE FIELD()
    OF ?locNameSearch
      UPDATE(?)
      IF LEN(CLIP(locNameSearch)) > 0
        CLEAR(BILL:Record)
        BILL:LastNamePatient = locNameSearch 
        SET(BILL:OrderKey,BILL:OrderKey)
        NEXT(Billing)
        BRW1.ResetFromBuffer
      .
    OF ?locQBSearch
      UPDATE(?)
      IF LEN(CLIP(locQBSearch)) > 0
        CLEAR(BILL:Record)
        BILL:QB = locQBSearch
        GET(Billing,BILL:qbKey)
        IF ERRORCODE()
          BILL:QB = locQBSearch 
          SET(BILL:qbKey,BILL:qbKey)
          NEXT(Billing)
          BRW1.ResetFromBuffer
        ELSE
          locQBSearch = ''
          GlobalRequest = 2
          UpdateBilling1
          IF globalResponse = RequestCompleted
            BRW1.ResetFromBuffer
          .
      
        .
        
      .
    OF ?locAccesssionSearch
      UPDATE(?)
      ?locAccesssionSearch{PROP:Color,1} = COLOR:White
      IF locAccesssionSearch > 99999
        CLEAR(BILL:Record)
        BILL:Accession = locAccesssionSearch
        GET(Billing,BILL:patKey)
        IF ERRORCODE()
          ?locAccesssionSearch{PROP:Color,1} = COLOR:Red
          locAccesssionSearch = SUB(locAccesssionSearch,1,5)
          PRESSKEY(EndKey)
        ELSE
          locAccesssionSearch = ''
          GlobalRequest = 2
          UpdateBilling1
          IF globalResponse = RequestCompleted
            BRW1.ResetFromBuffer
          .
        .
      .
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?CurrentTab
       locAccesssionSearch = ''
       locNameSearch = ''
       DISPLAY()
      IF CHOICE() = 2
        SELECT(?locNameSearch)
      ELSIF CHOICE() = 4
        SELECT(?locAccesssionSearch)
      .  
    OF ?locNameSearch
      DISPLAY(?locNameSearch)
      PRESSKEY(EndKey)
    OF ?locQBSearch
      DISPLAY(?locQBSearch)
      PRESSKEY(EndKey)!
    OF ?locAccesssionSearch
      DISPLAY(?locAccesssionSearch)
      PRESSKEY(EndKey)
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
    OF EVENT:GainFocus
      ALIAS(EnterKey,TabKey)
    OF EVENT:Maximize
      ALIAS
    END
  ReturnValue = PARENT.TakeWindowEvent()
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
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.BILL:Status_Style = 0 ! 
  SELF.Q.locFeeType_Style = 0 ! 
  SELF.Q.locAccountNumber_Style = 0 ! 
  SELF.Q.BILL:DateFax1_Style = 0 ! 
  SELF.Q.BILL:LastNamePatient_Style = 0 ! 
  SELF.Q.BILL:FirstNamePatient_Style = 0 ! 
  SELF.Q.BILL:NextLetter_Style = 0 ! 
  SELF.Q.BILL:OutStanding_Style = 0 ! 
  SELF.Q.BILL:Selected_Style = 0 ! 
  SELF.Q.BILL:VerifiedBy_Style = 0 ! 
  SELF.Q.BILL:VerifiedBy2_Style = 0 ! 


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  locFeeType = '-----------'
  CASE BILL:FeeType
  OF 0
    locFeeType = 'Client'
  OF 4
    locFeeType = 'Patient'
    IF BILL:Network = 1
      locFeeType = 'Patient In'
    ELSIF BILL:Network = 2
      locFeeType = 'Patient Out'
    ELSIF BILL:AccountType = 1
      locFeeType = 'Patient XX'
    .
  OF 1
    IF BILL:Network = 1
      locFeeType =  'Insurance In'
    ELSIF BILL:Network = 2
      locFeeType = 'Insurance Out'
    ELSIF BILL:AccountType = 1
      locFeeType = 'Insurance XX'
    .
    
  OF 2
    locFeeType = 'Medicaid'
  OF 3
    locFeeType = 'Medicare'
  OF 5
    locFeeType = 'Recall'
  OF 6
    locFeeType = 'Eval/NC'
  .
  locAccountNumber = CLIP(FORMAT(BILL:Accession,@P### ###P))
    
  ReturnValue = PARENT.ValidateRecord()
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
Export2BillingQB     PROCEDURE                             ! Declare Procedure
locQty               LONG                                  !
locItem              STRING(20)                            !
locClientName        STRING(32)                            !
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
locPayments          DECIMAL(7,2)                          !
locPatientPayments   DECIMAL(7,2)                          !
locPatientBillingAmount DECIMAL(7,2)                       !
locShowPaymentTotal  DECIMAL(7,2)                          !
locBalance           DECIMAL(7,2)                          !
locItemType STRING(20),DIM(22)

  CODE

    
  locFeeValues[1] = 1
  locFeeValues[2] = 2
  locFeeValues[3] = 3
  locFeeValues[4] = 4
  locFeeValues[5] = BILL:Client
  locFeeValues[6] = 6
  locFeeValues[7] = 7
    

    
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
  ELSE
    locFeeType = BILL:FeeType
  .
  FEE:Client = locFeeValues[BILL:FeeType]
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE() AND BILL:FeeType > 99999
    CLEAR(FEE:Record)
    FEE:Client  = BILL:Client
    ADD(Fees)
  .

    
  gloFileName = 'QBinvoice.csv'
  OPEN(Text)
  IF ERRORCODE()
    CREATE(Text)
    OPEN(Text)
    IF ERRORCODE() THEN STOP('OPEN EXPORT INVOICE: ' & ERROR()).
  .
  locItemType[1]  = 'Total IgE'
  locItemType[2]  = 'IgE'
  locItemType[3]  = 'IgE Mix'
  locItemType[4]  = 'IgE Hymenoptera'
  locItemType[5]  = 'IgE Occupational'
  locItemType[6]  = 'IgE Chemical'
    
  locItemType[7]  = 'Total IgA'
  locItemType[8]  = 'Gluten IgA'
  locItemType[9]  = 'Total IgM'
    
  locItemType[10] = 'Total IgG'
  locItemType[11] = 'IgG'
  locItemType[12] = 'IgG Mix'
  locItemType[13] = 'IgG Hymenoptera'
  locItemType[14] = 'IgG Occupational'
  locItemType[15] = 'IgG Chemical'
    
  locItemType[16] = 'IgG4'
  locItemType[17] = 'IgG4 Mix'
  locItemType[18] = 'IgG4 Hymenoptera'
  locItemType[19] = 'IgG4 Occupational'
  locItemType[20] = 'IgG4 Chemical'
  locItemType[21] = 'Celiac Panel (260)'
  locItemType[22] = 'Candida Panel (270)'

  SET(BILL:patKey,BILL:patKey)

    NEXT(Billing)
    DO GetFees
!    IF ERRORCODE() OR LEN(CLIP(BILL:QB)) > 0  THEN BREAK.
    IF locTIgE >  0 THEN locQty = locTIgE; locFees =  FEE:tIgE;  locItem = locItemType[1]; DO printItem.
    IF locTIgG >  0 THEN locQty = locTIgG; locFees =  FEE:tIgG;locItem = locItemType[10]; DO printItem.
    IF locTIgA >  0 THEN locQty = locTIgA; locFees =  FEE:tIgA;locItem = locItemType[7]; DO printItem.
    IF locTIgM >  0 THEN locQty = locTIgM; locFees =  FEE:tIgM;locItem = locItemType[9]; DO printItem.
    IF locRast[1] >  0 THEN locQty = locRast[1]; locFees =  FEE:IgE;locItem = locItemType[2]; DO printItem.
    IF locRast[2] >  0 THEN locQty = locRast[2]; locFees =  FEE:IgG;locItem = locItemType[11]; DO printItem.
    IF locRast[3] >  0 THEN locQty = locRast[3]; locFees =  FEE:IgG4 ;locItem = locItemType[16]; DO printItem.
    IF locMix[1] >  0 THEN locQty = locMix[1]; locFees =  FEE:mxIgE;locItem = locItemType[3]; DO printItem.
    IF locMix[2] >  0 THEN locQty = locMix[2]; locFees =  FEE:mxIgG;locItem = locItemType[12]; DO printItem.
    IF locMix[3] >  0 THEN locQty = locMix[3]; locFees =  FEE:mxIgG4;locItem = locItemType[17]; DO printItem.
    IF locHymenoptera[1] >  0 THEN locQty = locHymenoptera[1]; locFees =  FEE:hyIgE;locItem = locItemType[4]; DO printItem.
    IF locHymenoptera[2] >  0 THEN locQty = locHymenoptera[2]; locFees =  FEE:hyIgE;locItem = locItemType[13]; DO printItem.
    IF locHymenoptera[3] >  0 THEN locQty = locHymenoptera[3]; locFees =  FEE:hyIgE;locItem = locItemType[18]; DO printItem.
    IF locOccupational[1] >  0 THEN locQty = locOccupational[1]; locFees =  FEE:occIgE;locItem = locItemType[5]; DO printItem.
    IF locOccupational[2] >  0 THEN locQty = locOccupational[2]; locFees =  FEE:occIgG;locItem = locItemType[14]; DO printItem.
    IF locOccupational[3] >  0 THEN locQty = locOccupational[3]; locFees =  FEE:occIgG4;locItem = locItemType[19]; DO printItem.
    IF locChemical[1] >  0 THEN locQty = locChemical[1]; locFees =  FEE:chemIgE;locItem = locItemType[6]; DO printItem.
    IF locChemical[2] >  0 THEN locQty = locChemical[2]; locFees =  FEE:chemIgG;locItem = locItemType[15]; DO printItem.
    IF locChemical[3] >  0 THEN locQty = locChemical[3]; locFees =  FEE:chemIgG4;locItem = locItemType[20]; DO printItem.
    IF locPanel260 >  0 THEN locQty = FEE:Panel260 ; locFees = FEE:Panel260;locItem = locItemType[21]; DO printItem.
! IF locPanel260s145 >  0 THEN locQty = FEE:Panel260S145 ; locFees = locPanel260s145;locItem = locItemType[xxx]; DO printItem.
    IF locPanel270 >  0 THEN locQty = FEE:Panel270 ; locFees = FEE:Panel270;locItem = locItemType[2]; DO printItem.

  CLOSE(Text)
  RUN('notepad.exe QB.csv')  
  
    



Payment ROUTINE  
  gloFileName = 'QBinvoice.csv'
  OPEN(Text)
  IF ERRORCODE()
    CREATE(Text)
    OPEN(Text)
    IF ERRORCODE() THEN STOP('OPEN EXPORT PAYMENT: ' & ERROR()).
  .
  
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
    IF Pay:Attributes > 0 THEN CYCLE.
    DO PostPayment
    
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
      BILL:NextLetter = BILL:LastLetter + gloBillingLetterDays
    .
  

  
  
  
  
PostPayment ROUTINE
    
    TXT:Text = 'na' & CHR(9) & CLIP(BILL:LastNamePatient) & ', ' & CLIP(BILL:FirstNamePatient) & CHR(9) & |
    FORMAT(Pay:Date,@D2) & CHR(9) & |   
    'Accounts Receivable' & CHR(9) & |
    CLIP(Pay:Note) & CHR(9) & |
    Pay:Type & CHR(9) & |
    FORMAT(Pay:Amount,@N7.2) & CHR(9) & |    
    'Undeposited Funds' & CHR(9) & |
    CLIP(Pay:Note) & CHR(9) & |
    FORMAT(Pay:Amount,@N7.2) & CHR(9) & CHR(9) & |    
    CLIP(Pay:Invoice) & CHR(9) & |
    FORMAT(Pay:Amount,@N7.2) & CHR(9) & |   
    FORMAT(Pay:Amount,@N7.2) & CHR(9) & |
    CLIP(BILL:LastNamePatient) & ', ' & CLIP(BILL:FirstNamePatient) & CHR(9) & |
    locItem & CHR(9) & |
    FORMAT(locFees,@N5.2) & CHR(9) & |
    locQty 
    ADD(Text)
 
printItem ROUTINE     

  OMIT('xxxx')

    TXT:Text = FORMAT(BILL:DrawDate,@D2) & CHR(9) & |   
    CLIP(BILL:LastNamePatient) & ', ' & CLIP(BILL:FirstNamePatient) & CHR(9) & |
    'Insurance Co. Name' & CHR(9) & |
    BILL:Accession & CHR(9) & |
    BILL:Accession & CHR(9) & |
    CLIP(BILL:LastNamePatient) & ', ' & CLIP(BILL:FirstNamePatient) & CHR(9) & |
    locItem & CHR(9) & |
    FORMAT(locFees,@N5.2) & CHR(9) & |
    locQty 
    ADD(Text)
 
       xxxx

GetFees             ROUTINE
 ! IF BILL:DrawDate < 22222 THEN BILL:DrawDate = TODAY().
  
  
  FEE:Client = locFeeValues[BILL:FeeType]
  SET(FEE:OrderKey,FEE:OrderKey)
  NEXT(Fees)
 ! stop('FeeType: ' & FEE:Client & ' - ' & BILL:FeeType & ERROR()).

  IF ERRORCODE()
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
  . . .
  locFees = locTIgE * FEE:tIgE + locTIgG * FEE:tIgG + locTIgA * FEE:tIgA + locTIgM * FEE:tIgM + |
  locRast[1] * FEE:IgE + locRast[2] * FEE:IgG + locRast[3] * FEE:IgG4 + | 
  locMix[1] * FEE:mxIgE + locMix[2] * FEE:mxIgG + locMix[3] * FEE:mxIgG4 + |
  locHymenoptera[1] * FEE:hyIgE + locHymenoptera[2] * FEE:hyIgE + locHymenoptera[3] * FEE:hyIgE + |
  locOccupational[1] * FEE:occIgE + locOccupational[2] * FEE:occIgG + locOccupational[3] * FEE:occIgG4 + |
  locChemical[1] * FEE:chemIgE + locChemical[2] * FEE:chemIgG + locChemical[3] * FEE:chemIgG4 + |
  FEE:Panel260 * locPanel260 +  FEE:Panel260S145 * locPanel260s145 + FEE:Panel270 * locPanel270
  DISPLAY()     
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
BatchLetters         PROCEDURE                             ! Declare Procedure
locCount LONG
locDate LONG
FilesOpened     BYTE(0)

  CODE
  DO OpenFiles
    locDate = TODAY() + 1
    SET(BILLING,1)
    LOOP
      NEXT(BILLING)
      IF ERRORCODE() THEN BREAK.
      IF BILL:NextLetter  < locDate AND BILL:NextLetter > 0
        locCount += 1
      .
    .
    DO CloseFiles
    IF locCount > 0
       STOP(locCount & ' Letters Today')
    ELSE
       STOP('No Letters Today') 
    .
    
!--------------------------------------
OpenFiles  ROUTINE
  Access:Billing.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Billing.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:Billing.Close
     FilesOpened = False
  END
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
AddBillingItems      PROCEDURE                             ! Declare Procedure
locQty               LONG                                  !
CPT86001             LONG                                  !
CPT86003             LONG                                  !
CPT86005             LONG                                  !
CPT83516             LONG                                  !
CPT86255             LONG                                  !
CPT82784             LONG                                  !
CPT82785             LONG                                  !
locCountIgE          LONG                                  !
locCountIgG4         LONG                                  !
locCountIgG          LONG                                  !
locItem              STRING(20)                            !
locClientName        STRING(32)                            !
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
locPayments          DECIMAL(7,2)                          !
locPatientPayments   DECIMAL(7,2)                          !
locPatientBillingAmount DECIMAL(7,2)                       !
locShowPaymentTotal  DECIMAL(7,2)                          !
locBalance           DECIMAL(7,2)                          !
locItemType STRING(20),DIM(22)

  CODE
  CLEAR(Fee:Record)
  SHARE(Test)
  IF BILL:FeeType = 0 
    FEE:Client = BILL:Client 
  ELSIF BILL:FeeType = 4
    FEE:Client = 999991  ! PATIENT 
  ELSE 
    FEE:Client = 999990 !INSURANCE
  .
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
  CPT86001 = 0
  CPT86003 = 0
  CPT86005 = 0
  CPT83516 = 0
  CPT86255 = 0
  CPT82784 = 0
  CPT82785 = 0    
  TST:INVOICE = BILL:Accession
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF ERRORCODE() OR TST:INVOICE <> BILL:Accession THEN BREAK.
    
    IF gloTestCodeStartsWith2 = 'S1'
      IF TST:CODE = 'S145'
        locPanel260s145 += 1 ! gluten IgA patient billed
      ELSIF TST:CODE = 'S130'
        CPT86255 = 1
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
  CLOSE(Test)
  CPT86001 = locRast[2] + locRast[3] + locHymenoptera[2] + locHymenoptera[3] + locOccupational[2] + locOccupational[3] + locChemical[2] + locChemical[3]
  CPT86003 = locRast[1] + locHymenoptera[1] + locOccupational[1] + locChemical[1]
  CPT86005 = locMix[1] + locMix[2] + locMix[3]
  CPT83516 = locPanel260 + locPanel270
  CPT82784 = locTIgE + locTIgA + locTIgG
  CPT82785 = locTIgE
  locPanel260 += CPT86255

 

  BI:Patient = BILL:Accession 
  SET(BillingItems,BI:OrderKey)
  LOOP
    NEXT(BillingItems)
    IF ERRORCODE() OR BI:Patient <> BILL:Accession THEN BREAK.
    DELETE(BillingItems)
  .
  PUT(Billing)
     

    

  locItemType[1]  = 'Total IgE'
  locItemType[2]  = 'IgE'
  locItemType[3]  = 'IgE Mix'
  locItemType[4]  = 'IgE Hymenoptera'
  locItemType[5]  = 'IgE Occupational'
  locItemType[6]  = 'IgE Chemical'
    
  locItemType[7]  = 'Total IgA'
  locItemType[8]  = 'Gluten IgA'
  locItemType[9]  = 'Total IgM'
    
  locItemType[10] = 'Total IgG'
  locItemType[11] = 'IgG'
  locItemType[12] = 'IgG Mix'
  locItemType[13] = 'IgG Hymenoptera'
  locItemType[14] = 'IgG Occupational'
  locItemType[15] = 'IgG Chemical'
    
  locItemType[16] = 'IgG4'
  locItemType[17] = 'IgG4 Mix'
  locItemType[18] = 'IgG4 Hymenoptera'
  locItemType[19] = 'IgG4 Occupational'
  locItemType[20] = 'IgG4 Chemical'
  locItemType[21] = 'Celiac Panel (260)'
  locItemType[22] = 'Candida Panel (270)'
  locAmountDue = 0  
    BI:Patient = BILL:Accession
    IF locTIgE >  0 THEN BI:Qty = locTIgE; BI:Price =  FEE:tIgE;  BI:Description = locItemType[1]; DO addItem.
    IF locTIgG >  0 THEN BI:Qty = locTIgG; BI:Price =  FEE:tIgG;BI:Description = locItemType[10]; DO addItem.
    IF locTIgA >  0 THEN BI:Qty = locTIgA; BI:Price =  FEE:tIgA;BI:Description = locItemType[7]; DO addItem.
    IF locTIgM >  0 THEN BI:Qty = locTIgM; BI:Price =  FEE:tIgM;BI:Description = locItemType[9]; DO addItem.
    IF locRast[1] >  0 THEN BI:Qty = locRast[1]; BI:Price =  FEE:IgE;BI:Description = locItemType[2]; DO addItem.
    IF locRast[2] >  0 THEN BI:Qty = locRast[2]; BI:Price =  FEE:IgG;BI:Description = locItemType[11]; DO addItem.
    IF locRast[3] >  0 THEN BI:Qty = locRast[3]; BI:Price =  FEE:IgG4 ;BI:Description = locItemType[16]; DO addItem.
    IF locMix[1] >  0 THEN BI:Qty = locMix[1]; BI:Price =  FEE:mxIgE;BI:Description = locItemType[3]; DO addItem.
    IF locMix[2] >  0 THEN BI:Qty = locMix[2]; BI:Price =  FEE:mxIgG;BI:Description = locItemType[12]; DO addItem.
    IF locMix[3] >  0 THEN BI:Qty = locMix[3]; BI:Price =  FEE:mxIgG4;BI:Description = locItemType[17]; DO addItem.
    IF locHymenoptera[1] >  0 THEN BI:Qty = locHymenoptera[1]; BI:Price =  FEE:hyIgE;BI:Description = locItemType[4]; DO addItem.
    IF locHymenoptera[2] >  0 THEN BI:Qty = locHymenoptera[2]; BI:Price =  FEE:hyIgE;BI:Description = locItemType[13]; DO addItem.
    IF locHymenoptera[3] >  0 THEN BI:Qty = locHymenoptera[3]; BI:Price =  FEE:hyIgE;BI:Description = locItemType[18]; DO addItem.
    IF locOccupational[1] >  0 THEN BI:Qty = locOccupational[1]; BI:Price =  FEE:occIgE;BI:Description = locItemType[5]; DO addItem.
    IF locOccupational[2] >  0 THEN BI:Qty = locOccupational[2]; BI:Price =  FEE:occIgG;BI:Description = locItemType[14]; DO addItem.
    IF locOccupational[3] >  0 THEN BI:Qty = locOccupational[3]; BI:Price =  FEE:occIgG4;BI:Description = locItemType[19]; DO addItem.
    IF locChemical[1] >  0 THEN BI:Qty = locChemical[1]; BI:Price =  FEE:chemIgE;BI:Description = locItemType[6]; DO addItem.
    IF locChemical[2] >  0 THEN BI:Qty = locChemical[2]; BI:Price =  FEE:chemIgG;BI:Description = locItemType[15]; DO addItem.
    IF locChemical[3] >  0 THEN BI:Qty = locChemical[3]; BI:Price =  FEE:chemIgG4;BI:Description = locItemType[20]; DO addItem.
    IF locPanel260 >  0 THEN BI:Qty = FEE:Panel260 ; BI:Price = FEE:Panel260;BI:Description = locItemType[21]; DO addItem.
! IF locPanel260s145 >  0 THEN BI:Qty = FEE:Panel260S145 ; BI:Price = locPanel260s145;BI:Description = locItemType[xxx]; DO addItem.
    IF locPanel270 >  0 THEN BI:Qty = FEE:Panel270 ; BI:Price = FEE:Panel270;BI:Description = locItemType[2]; DO addItem.
   
   FEE:Client = 999991
   GET(Fees,FEE:OrderKey)      
    BILL:PatientFeeAmount = 0 
    IF locTIgE >  0 THEN BILL:PatientFeeAmount += FEE:tIgE * locTIgE.
    IF locTIgG >  0 THEN BILL:PatientFeeAmount += FEE:tIgG * locTIgG.
    IF locTIgA >  0 THEN BILL:PatientFeeAmount += FEE:tIgA * locTIgA.
    IF locTIgM >  0 THEN BILL:PatientFeeAmount += FEE:tIgM * locTIgM.
    IF locRast[1] >  0 THEN BILL:PatientFeeAmount += FEE:IgE * locRast[1].
    IF locRast[2] >  0 THEN BILL:PatientFeeAmount += FEE:IgG * locRast[2].
    IF locRast[3] >  0 THEN BILL:PatientFeeAmount += FEE:IgG4 * locRast[3].
    IF locMix[1] >  0 THEN BILL:PatientFeeAmount += FEE:mxIgE * locMix[1].
    IF locMix[2] >  0 THEN BILL:PatientFeeAmount += FEE:mxIgG * locMix[2].
    IF locMix[3] >  0 THEN BILL:PatientFeeAmount += FEE:mxIgG4 * locMix[3].
    IF locHymenoptera[1] >  0 THEN BILL:PatientFeeAmount += FEE:hyIgE * locHymenoptera[1].
    IF locHymenoptera[2] >  0 THEN BILL:PatientFeeAmount += FEE:hyIgE * locHymenoptera[2].
    IF locHymenoptera[3] >  0 THEN  BILL:PatientFeeAmount += FEE:hyIgE * locHymenoptera[3].
    IF locOccupational[1] >  0 THEN BILL:PatientFeeAmount += FEE:occIgE * locOccupational[1].
    IF locOccupational[2] >  0 THEN BILL:PatientFeeAmount += FEE:occIgG * locOccupational[2].
    IF locOccupational[3] >  0 THEN BILL:PatientFeeAmount += FEE:occIgG4 * locOccupational[3].
    IF locChemical[1] >  0 THEN BILL:PatientFeeAmount += FEE:chemIgE * locChemical[1].
    IF locChemical[2] >  0 THEN BILL:PatientFeeAmount += FEE:chemIgG * locChemical[2].
    IF locChemical[3] >  0 THEN BILL:PatientFeeAmount += FEE:chemIgG4 * locChemical[3].
    IF locPanel260 >  0 THEN BILL:PatientFeeAmount += FEE:Panel260.
! IF locPanel260s145 >  0 THEN BI:Qty = FEE:Panel260S145 ; BI:Price = locPanel260s145;BI:Description = locItemType[xxx]; DO addItem.
    IF locPanel270 >  0 THEN  BILL:PatientFeeAmount += FEE:Panel270.
    PUT(Billing)
  

   
AddItem  ROUTINE
  locAmountDue += BI:Price * BI:Qty
!  STOP(BILL:Accession & ' - DESC: ' & BI:Description & ' -QTY: ' & BI:Qty & ' -PRICE: ' & bi:Price)
  ADD(BillingItems)
  IF ERRORCODE() THEN STOP('BI: ' & ERROR()).
  
GetFees             ROUTINE
!  IF BILL:DrawDate < 22222 THEN BILL:DrawDate = TODAY().
  SHARE(Fees)
  
  FEE:Client = locFeeValues[BILL:FeeType]
  SET(FEE:OrderKey,FEE:OrderKey)
  NEXT(Fees)
 ! stop('FeeType: ' & FEE:Client & ' - ' & BILL:FeeType & ERROR()).

  IF ERRORCODE()
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
  SHARE(Test)
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
  . . .
  CLOSE(Test)
  locFees = locTIgE * FEE:tIgE + locTIgG * FEE:tIgG + locTIgA * FEE:tIgA + locTIgM * FEE:tIgM + |
  locRast[1] * FEE:IgE + locRast[2] * FEE:IgG + locRast[3] * FEE:IgG4 + | 
  locMix[1] * FEE:mxIgE + locMix[2] * FEE:mxIgG + locMix[3] * FEE:mxIgG4 + |
  locHymenoptera[1] * FEE:hyIgE + locHymenoptera[2] * FEE:hyIgE + locHymenoptera[3] * FEE:hyIgE + |
  locOccupational[1] * FEE:occIgE + locOccupational[2] * FEE:occIgG + locOccupational[3] * FEE:occIgG4 + |
  locChemical[1] * FEE:chemIgE + locChemical[2] * FEE:chemIgG + locChemical[3] * FEE:chemIgG4 + |
  FEE:Panel260 * locPanel260 +  FEE:Panel260S145 * locPanel260s145 + FEE:Panel270 * locPanel270
  DISPLAY()     

  
  
