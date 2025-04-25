

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module

                     MAP
                       INCLUDE('ALIS8041.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
Analysis             PROCEDURE                             ! Declare Procedure
SAV:Code  STRING(6)
SAV:Score STRING(3)
SAV:Type  BYTE
SAV:Conc  DECIMAL(9,2)
SAV:Status STRING(1)
SAV:Physician STRING(40)  
locFax  STRING(3)
locEmail STRING(5)


locStartDate    LONG
locEndDate    LONG
FileName  STRING(128)

Window WINDOW('Analysis'),AT(0,0,508,318),FONT('Arial',11,,),SYSTEM,GRAY,RESIZE,MDI
       STRING('Start Date'),AT(76,78),USE(?String2),TRN
       ENTRY(@D1),AT(116,78,60,10),USE(locStartDate)
       STRING('End Date'),AT(78,94),USE(?String3),TRN
       ENTRY(@D1),AT(116,94,60,10),USE(locEndDate)
       BUTTON('&Generate CSV'),AT(210,120,67,22),USE(?Generate),LEFT,DEFAULT
       STRING('CSV File Name'),AT(55,150),USE(?String5),TRN
       STRING(@s20),AT(116,110,69,10),USE(PAT:Invoice),TRN
       BUTTON('&Cancel'),AT(234,202,64,14),USE(?CancelButton),HIDE,LEFT
       STRING(@s128),AT(116,150,355,10),USE(gloFileName4),TRN
     END

FilesOpened     BYTE(0)
CSVtable FILE,DRIVER('ASCII'),PRE(CSV),CREATE,NAME(gloFileName4)
          RECORD
Data    STRING(512)
        . .
locSerumRemaining LONG


  CODE
  IF ~BAND(gloPermissions,ACCESS:Analysis) THEN RETURN.
  gloFileName4 = '..\data\Analysis.CSV'
  gloFileName4 = LONGPATH(gloFileName4)
  OPEN(Window)
  0{PROP:wallpaper} = glowallPaper
  ACCEPT
    IF EVENT() = EVENT:accepted
      CASE FIELD()
      OF ?locEndDate
        SELECT(?locStartDate)
      OF ?Generate
        CREATE(CSVtable)
        IF ERRORCODE() THEN STOP('CSV": ' & ERROR()).
        OPEN(CSVtable)
        IF ERRORCODE() THEN STOP('CSV": ' & ERROR()).
        SHARE(Patient)
        IF ERRORCODE() THEN STOP('PAT: ' & ERROR()).
        SHARE(Client)
        IF ERRORCODE() THEN STOP('CLI: ' & ERROR()).
        SHARE(Test)
        IF ERRORCODE() THEN STOP('TEST": ' & ERROR()).
        SHARE(Rast)
        IF ERRORCODE() THEN STOP('RST: ' & ERROR()).
        Pat:DATE = locStartDate
        PAT:INVOICE = 0
        SET(PAT:DATE_KEY,PAT:DATE_KEY)
        LOOP UNTIL EOF(Patient)
          NEXt(Patient)
          IF PAT:Date > locEndDate THEN BREAK.
          SAV:Physician = gloPatientNotes[1]
          DISPLAY(?PAT:Invoice)
          CLI:Number = PAT:Client
          GET(Client,CLI:ORDER_KEY)
          IF ERRORCODE() THEN STOP('GET CLIENT: ' & ERROR()).  
          locEmail = ''
          locFax = ''
          IF CLI:FaxReport THEN locFax = 'Fax'.
          IF cli:EmailReport THEN locEmail = 'Email'.
          TST:Invoice = PAT:Invoice
          TST:Type = 0
          TST:Code = ''
          locSerumRemaining = (Pat:VOLUME * 1000) - PAT:Needed
          SET(TST:Order_Key,TST:Order_Key)
          LOOP UNTIL EOF(TEST)
            NEXT(Test)
            IF TST:Invoice <> PAT:Invoice THEN  BREAK.
            IF TST:Type = 0 THEN CYCLE.
            SAV:Code = TST:Code
            SAV:Type = TST:Type
            SAV:Status = TST:Status
            SAV:Score = TST:Score
            SAV:Conc = TST:Count
            RST:Number = TST:Code
            GET(Rast,RST:Order_Key)
            CSV:Data = '"' & CLI:Billing & '","' &  PAT:Last  & '","' & PAT:First  & '","' & PAT:Invoice &  '","' & Pat:Billing &   '","' & FORMAT(PAT:Date,@D1) & '","' & PAT:Age  & '","'  & PAT:Age_Type  & '","' & (PAT:Sex) & '","' & CLIP(PAT:Client_ID) & '","' & SAV:Status & '","' &  SAV:Code & '","' &SAV:Type & '","' & SAV:Score & '","' & SAV:Conc & '","' & RST:FeeLevel & '","' & PAT:Billing & '","' & CLIP(PAT:Notes) & '","' & CLIP(locSerumRemaining)  & '","' & CLIP(PAT:Client) & '","' & locFax & '","' & locEmail & '","' & SUB(gloPatientNotes[1],1,40) & '"'
            ADD(CSVtable)
          .
        .
        CLOSE(CSVtable)
        CLOSE(Patient)
        CLOSE(Client) 
        CLOSE(Test)
        CLOSE(Rast)
        CLOSE(Window)
        RETURN
      .
    .
  .

!--------------------------------------
OpenFiles  ROUTINE
  Access:Patient.Open                                      ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Patient.UseFile                                   ! Use File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.Open                                         ! Open File referenced in 'Other Files' so need to inform its FileManager
  Access:Rast.UseFile                                      ! Use File referenced in 'Other Files' so need to inform its FileManager
  FilesOpened = True
!--------------------------------------
CloseFiles ROUTINE
  IF FilesOpened THEN
     Access:Patient.Close
     Access:Rast.Close
     FilesOpened = False
  END
