

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8037.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8074.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ReadInResults PROCEDURE 

locFileName          STRING(40)                            !
locStatus            LONG                                  !
locLoginFileName     STRING(24)                            !
locType              BYTE                                  !
locDate              LONG                                  !
locTestCount         ULONG                                 !
locFileCount         USHORT                                !
Results FILE,DRIVER('ASCII'),PRE(RES),CREATE,NAME(gloFileName2)
          RECORD
Data    STRING(64)
        . .


CheckPatients QUEUE,PRE(CP)
Patient LONG
.
EnhancedFocusManager EnhancedFocusClassType
locBillingVerified STRING(2) OVER(Pat:IG4)



AllFiles QUEUE(File:queue),PRE(FIL)    !Inherit exact declaration of File:queue
 
        END
LP      LONG
Recs    LONG
 
 
 

 



Window               WINDOW,AT(0,0,510,340),FONT('Arial',8,,FONT:regular),GRAY
                       STRING('Read In Results'),AT(172,64),USE(?String3),FONT(,14,,FONT:bold),TRN
                       PANEL,AT(80,78,362,100),USE(?Panel1)
                       STRING(@S129),AT(80,118,362,10),USE(gloFileName2),FONT(,12,,FONT:bold),CENTER,TRN
                       STRING(@n13),AT(285,91),USE(locTestCount),LEFT,TRN
                       STRING('Complete'),AT(172,142),USE(?Completedmessage),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  HIDE,TRN
                       STRING('File count: '),AT(123,92),USE(?String6),TRN
                       STRING(@n6),AT(157,92),USE(locFileCount),TRN
                       STRING('Test Count:'),AT(249,92),USE(?String5),TRN
                       BUTTON('Done'),AT(344,197,70,25),USE(?Done),FONT(,,,FONT:bold),LEFT,ICON(ICON:Tick),DEFAULT, |
  STD(STD:Close)
                       BUTTON('Read Results'),AT(344,142,70,25),USE(?ReadResultsButton),FONT(,,,FONT:bold),LEFT,ICON('JUMPPG.ICO')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
ReadFile    ROUTINE

    OPEN(Results)
    IF ERRORCODE()
      STOP(CLIP(gloFileName2) & ' OPEN: ' & ERROR())
      EXIT
    .
    SET(Results)
    LOOP UNTIL EOF(Results)
      NEXT(Results)
      locType = SUB(RES:Data,41,1)
      if errorcode() then stop(locFileName & ' NEXT: ' & error()).
      
!      stop('inv: ' & SUB(RES:Data,9,6) & ' /' & ' code: ' & SUB(RES:Data,21,4) & ' count=' & SUB(RES:Data,29,5) & ' score=' & SUB(RES:Data,37,3))
      TST:Invoice = SUB(RES:Data,9,6)
      PL:Patient = TST:Invoice
      ADD(PrintList)
      IF ERRORCODE() THEN IF ERRORCODE() <> 40 THEN STOP('ADD PL: ' & ERROR())..
      IF ~TST:Invoice THEN CYCLE.
      PatL:Accession = TST:INVOICE
      ADD(PatientList)
      IF ERRORCODE() THEN IF ERRORCODE() <> 40 THEN STOP('ADD PatL: ' & ERROR())..
      TST:Code = SUB(RES:Data,25,5)
      TST:Type = locType
      GET(TEST,TST:ORDER_KEY)
      IF ERRORCODE()
        STOP('TEST.TPS: ' & ERROR() & ' Patient=' & TST:INVOICE & ' Test Code=' & TST:Code  & '.' & locType & ' File=' & gloFileName2)
      ELSE
        IF SUB(TST:Code,1,1) = 'S'
          TST:Count = CLIP(LEFT(SUB(RES:Data,49,7)))
          TST:Range = CLIP(LEFT(SUB(RES:Data,49,7)))
          TST:Score = SUB(RES:Data,33,3)
          TST:Code = SUB(RES:Data,25,5)          
        ELSIF INRANGE(locType,4,6)
          TST:Range = CLIP(LEFT(SUB(RES:Data,49,7)))
          TST:Score =  ''
        ELSE
          TST:Count = CLIP(LEFT(SUB(RES:Data,49,7)))
          TST:Score = SUB(RES:Data,33,3)
          TST:Code = SUB(RES:Data,25,5)
        .   
        IF INRANGE(locType,7,8)
          TST:Percentile = INT(CLIP(LEFT(SUB(RES:Data,56,5))))
        .
        TST:Status = UPPER(SUB(RES:Data,1,1))
        PUT(Test)
        IF ERRORCODE() THEN STOP('PUT TST: ' & ERROR()).
      .
      locTestCount += 1
      DISPLAY(?locTestCount)
      if errorcode() then stop('SAVE: ' & error()).
      IF TST:STATUS <> 'X'
        BRI:Patient = TST:INVOICE
        ADD(BillingReadIn)
      .
    .
    CLOSE(RESULTS)
    
  !  EMPTY(PatientList)
    
    
    
    


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReadInResults')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String3
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:BillingItems.Open                                 ! File BillingItems used by this procedure, so make sure it's RelationManager is open
  Relate:BillingReadIn.Open                                ! File BillingReadIn used by this procedure, so make sure it's RelationManager is open
  Relate:CPL.Open                                          ! File CPL used by this procedure, so make sure it's RelationManager is open
  Relate:Fees.Open                                         ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:HL7.Open                                          ! File HL7 used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:PatientList.Open                                  ! File PatientList used by this procedure, so make sure it's RelationManager is open
  Relate:PrintList.Open                                    ! File PrintList used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                                       ! File plates used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  SELF.SetAlerts()
    CREATE(BillingReadIn) 
    OPEN(BillingReadIn)
      IF TODAY() %7 = 1
        locDate = TODAY() - 4
      ELSIF TODAY() %7 = 2
        locDate = TODAY() - 4
      ELSE
        locDate = TODAY() - 2
      .
  0{PROP:Wallpaper} = glowallpaper
  DIRECTORY(AllFiles,'..\conc\*.txt',ff_:DIRECTORY)   !Get all files and directories
  Recs = RECORDS(AllFiles) 
  SHARE(Online) 
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
    Relate:Billing.Close
    Relate:BillingItems.Close
    Relate:BillingReadIn.Close
    Relate:CPL.Close
    Relate:Fees.Close
    Relate:HL7.Close
    Relate:Online.Close
    Relate:Patient.Close
    Relate:PatientList.Close
    Relate:PrintList.Close
    Relate:plates.Close
    CLOSE(Test)
    CLOSE(PatientList)
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ReadResultsButton
      ThisWindow.Update
      CLOSE(PrintList)
      CREATE(PrintList)
      OPEN(PrintList)  
      CLOSE(PatientList)
      CREATE(PatientList)
      OPEN(PatientList)  
      CLOSE(CPL)
      CREATE(CPL)
      IF ERRORCODE() THEN STOP('CREATE CPL: ' & ERROR()).      
      CLOSE(HL7)
      CREATE(HL7)
      IF ERRORCODE() THEN STOP('CREATE HL7: ' & ERROR()).
      OPEN(HL7)  
      IF ERRORCODE() THEN STOP('OPEN HL7: ' & ERROR()).   
      OPEN(CPL)  
      IF ERRORCODE() THEN STOP('OPEN CPL: ' & ERROR()).   
      CLOSE(TEST)
      OPEN(TEST)
      IF ERRORCODE() 
        STOP('TEST FILE IN USE')
        OPEN(TEST)
        IF ERRORCODE() THEN RETURN(0).
      .
      STREAM(TEST)      
      locFileCount = 0      
      LOOP LP = Recs TO 1 BY -1
        GET(AllFiles,LP)
        locFileCount += 1
        DISPLAY(?locFileCount)
        gloFileName2 = '..\conc\' & FIL:Name
        DISPLAY(?gloFileName2)
        locType = PLT:Type
        DO ReadFile
        RENAME(gloFileName2,CLIP(gloFileName2 ) & '.READ')
      .
      UNHIDE(?Completedmessage)
      FLUSH(Test)
      BUILD(Test)
      CLOSE(Test)
      
      PatL:Accession = 0
      SET(PatL:OrderKey,PatL:OrderKey)
      LOOP UNTIL EOF(PatientList)
      NEXT(PatientList)
      OL:Date = TODAY()
      OL:Time = CLOCK()
      OL:Number = PatL:Accession
      OL:PCAE = ONLINE:Patient + ONLINE:Add
      ADD(Online) 
      Pat:INVOICE = PatL:Accession
      GET(Patient,Pat:INVOICE_KEY)
      IF ~ERRORCODE()
        IF PAT:Client = 500258
          HL7:Accession = PatL:Accession
          HL7:Client = Pat:CLIENT
          ADD(HL7)
          IF ERRORCODE() THEN STOP('ADD HL7 500258: ' & ERROR()).
        .
      
        IF PAT:Client = 200424
          HL7:Accession = PatL:Accession
          HL7:Client = Pat:CLIENT
          ADD(HL7)
          IF ERRORCODE() THEN STOP('ADD HL7 200424: ' & ERROR()).
        .
        
        IF Pat:HL7 > 0 AND Pat:CLIENT = 200032
          CPL:Accession = PatL:Accession
          ADD(CPL)
          IF ERRORCODE() THEN STOP('ADD CPL: ' & ERROR()).
          HL7:Accession = PatL:Accession
          HL7:Client = Pat:CLIENT
          ADD(HL7)
          IF ERRORCODE() THEN STOP('ADD HL7 200032: ' & ERROR()).
         
      . .
      .
      UNHIDE(?Completedmessage)
      
        
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

