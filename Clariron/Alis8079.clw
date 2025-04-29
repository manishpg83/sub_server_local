

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8079.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! </summary>
CovidRequestForm PROCEDURE 

locPfizer            LONG(1)                               !
locBarcode           STRING(8)                             !
locCitryStateZip     STRING(64)                            !
locModerna           LONG                                  !
locAstraZenica       LONG                                  !
locJohnson           LONG                                  !
locRace              STRING(64)                            !
Ethnicities          STRING(32),DIM(3)                     !
locEthenicity        STRING(32)                            !
locGender            STRING(9)                             !
Genders              STRING(8),DIM(3)                      !
Races                STRING(64),DIM(6)                     !
locVavinated         LONG(1)                               !
locProviderInstructions STRING(128)                        !
locIcdDescription1   STRING(255)                           !
locIcdDescription2   STRING(300)                           !
locIcdDescription3   STRING(200)                           !
locIcdDescription4   STRING(200)                           !
locLcdDescription5   STRING(200)                           !
Progress:Thermometer BYTE                                  !
Process:View         VIEW(CovidOrders)
                       PROJECT(Cov:Accession)
                       PROJECT(Cov:Address1)
                       PROJECT(Cov:Address2)
                       PROJECT(Cov:DOB)
                       PROJECT(Cov:FirstName)
                       PROJECT(Cov:LastName)
                       PROJECT(Cov:Phone)
                       PROJECT(Cov:dov)
                       PROJECT(Cov:email)
                       PROJECT(Cov:id)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Progress...'),AT(,,142,59),DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(45,42,50,15),USE(?Progress:Cancel)
                     END

Report               REPORT,AT(500,250,8000,10500),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10,,FONT:regular,CHARSET:ANSI), |
  THOUS
Detail                 DETAIL,AT(0,0,7948,10437),USE(?Detail)
                         IMAGE('am.JPG'),AT(208,31,2823,958),USE(?IMAGE2)
                         BOX,AT(0,1323,3656,2635),USE(?BoxPatientInfo),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         BOX,AT(0,7417,7542,2083),USE(?BOX4),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         STRING(@s32),AT(1135,1771),USE(Cov:LastName)
                         STRING(@s32),AT(1135,1552),USE(Cov:FirstName)
                         STRING(@s32),AT(1135,1990),USE(Cov:Address1)
                         STRING(@s32),AT(1135,2208),USE(Cov:Address2)
                         STRING(@d17),AT(1135,2646),USE(Cov:DOB)
                         STRING(@s9),AT(1135,3302),USE(locGender)
                         STRING(@s64),AT(1135,2865,2375),USE(locRace)
                         STRING(@s32),AT(1135,3083),USE(locEthenicity)
                         STRING('First Name:'),AT(146,1552,927),USE(?STRING1),FONT(,,,FONT:bold),RIGHT
                         STRING('Last Name:'),AT(146,1781,927,198),USE(?STRING2),FONT(,,,FONT:bold),RIGHT
                         STRING('Address:'),AT(146,2010,927,198),USE(?STRING3),FONT(,,,FONT:bold),RIGHT
                         STRING('City/ST/Zip:'),AT(146,2427,927),USE(?STRING4),FONT(,,,FONT:bold),RIGHT
                         STRING('Date of Birth:'),AT(146,2667,927),USE(?STRING5),FONT(,,,FONT:bold),RIGHT
                         STRING('Gender:'),AT(146,3292,927),USE(?STRING6),FONT(,,,FONT:bold),RIGHT
                         STRING('Race:'),AT(146,2875,927),USE(?STRING7),FONT(,,,FONT:bold),RIGHT
                         STRING('Ethnicity:'),AT(146,3083,927),USE(?STRING8),FONT(,,,FONT:bold),RIGHT
                         STRING('e-Mail:'),AT(146,3521,927),USE(?STRING9),FONT(,,,FONT:bold),RIGHT
                         STRING(@s64),AT(1135,3521,2677),USE(Cov:email,,?Cov:email:2),FONT(,,,FONT:regular),LEFT,TRN
                         STRING(@p###-###-####p),AT(1125,3760),USE(Cov:Phone),TRN
                         STRING('Telephone:'),AT(146,3760,927),USE(?STRING13),FONT(,,,FONT:bold),RIGHT,TRN
                         BOX,AT(3875,1333,3656,1083),USE(?BOX2),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         STRING('COVIDG, Covid IgG Panel'),AT(5823,1406,1708),USE(?StringOrderedDescription),LEFT,TRN
                         STRING(' S1-Protein and Receptor Binding Domain (RBD)'),AT(3875,1552,3542),USE(?StringOrderedDescription2), |
  RIGHT,TRN
                         BOX,AT(3875,2677,3656,1760),USE(?BOX1),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         CHECK('Check if you are Vaccinated'),AT(4021,2708),USE(locVavinated),FONT(,,,FONT:bold)
                         STRING('Approx Date Vaccinated:'),AT(4021,2969),USE(?STRING10),FONT(,,,FONT:bold)
                         LINE,AT(5740,3094,1219,0),USE(?LINE3),HIDE
                         CHECK('Pfizer'),AT(4021,3302,2292),USE(locPfizer),FONT(,10,,FONT:bold)
                         CHECK('Modenera'),AT(4021,3500,2292),USE(locModerna),FONT(,,,FONT:bold)
                         CHECK('AstraZenica'),AT(4021,3698,2292,198),USE(locAstraZenica),FONT(,,,FONT:bold)
                         CHECK('Other'),AT(4021,4094),USE(?CheckOther),FONT(,,,FONT:bold)
                         STRING('Optional Vaccine Information'),AT(4021,2458),USE(?STRING11),FONT(,12,,FONT:bold),TRN
                         LINE,AT(4656,4260,2167,0),USE(?LINE1)
                         STRING('Patient Draw Date:'),AT(146,4250),USE(?STRING12),FONT(,12,COLOR:Red,FONT:bold)
                         LINE,AT(1615,4437,1573,0),USE(?LINE2),COLOR(COLOR:Red)
                         BOX,AT(0,5135,7542,2062),USE(?BOX3),COLOR(COLOR:Black),FILL(COLOR:White),LINEWIDTH(1)
                         TEXT,AT(1135,7781,6229,281),USE(locIcdDescription1)
                         TEXT,AT(1135,8031,6229,365),USE(locIcdDescription2),TRN
                         STRING('[  ] U07.1'),AT(208,7781,865,281),USE(?StrikngICD),FONT(,10,,FONT:bold)
                         TEXT,AT(1135,8635,6229,365),USE(locIcdDescription3)
                         CHECK('Johnson & Johnson'),AT(4021,3896,2292,198),USE(locJohnson),FONT(,,,FONT:bold)
                         STRING('[  ] Z20.828'),AT(208,8031,865,281),USE(?StrikngICD:3),FONT(,10,,FONT:bold)
                         STRING('[  ] Z01.84'),AT(208,8635,865,281),USE(?StrikngICD:4),FONT(,10,,FONT:bold),TRN
                         STRING('ICD-10 Codes for Insurance'),AT(125,7240),USE(?STRING20),FONT(,12,COLOR:Red,FONT:bold), |
  TRN
                         IMAGE('..\..\ALIS\App\CovidRed400.jpg'),AT(3062,9562,1271,771),USE(?IMAGE3)
                         IMAGE('LogoCAP.gif'),AT(6115,177,1240,490),USE(?IMAGE1)
                         STRING(@s8),AT(6115,729,1552,354),USE(locBarcode),FONT('CCode39_S3',12)
                         STRING(@n_6),AT(6115,1073,1240),USE(Cov:Accession),CENTER,TRN
                         STRING('Non-Vaccine related ICD-10 Code'),AT(208,7521,2615,198),USE(?STRING21),FONT(,,,FONT:bold), |
  TRN
                         STRING('Vaccine related ICD-10 Code'),AT(208,8417,2615,198),USE(?STRING21:2),FONT(,,,FONT:bold), |
  TRN
                         STRING('Healthcare Provider Signature:'),AT(146,4646,2687),USE(?STRING15),FONT(,12,COLOR:Red, |
  FONT:bold),LEFT
                         STRING('Provider NPI Number:'),AT(208,5260,2229,229),USE(?STRING16),FONT(,12,COLOR:Black,FONT:bold), |
  RIGHT
                         LINE,AT(2615,4823,4729,0),USE(?LINE2:2),COLOR(COLOR:Red)
                         LINE,AT(2510,5406,4729,0),USE(?LINE2:3),COLOR(COLOR:Black)
                         STRING('Address:'),AT(31,6510,2406,229),USE(?STRING22:2),FONT(,12,COLOR:Black,FONT:bold),RIGHT
                         STRING('Fax:'),AT(3708,4844,2229,229),USE(?STRING22:3),FONT(,12,COLOR:Gray,FONT:bold),RIGHT, |
  HIDE
                         STRING('City State Zip:'),AT(208,6771,2229,229),USE(?STRING22:4),FONT(,12,COLOR:Black,FONT:bold), |
  RIGHT
                         LINE,AT(2510,6698,4729,0),USE(?LINE2:6),COLOR(COLOR:Black)
                         LINE,AT(2510,6990,4729,0),USE(?LINE2:7),COLOR(COLOR:Black)
                         LINE,AT(6010,5062,4729,0),USE(?LINE2:8),COLOR(COLOR:Black),HIDE
                         STRING('Healthcare Provider'),AT(146,4937,3792,229),USE(?STRING22:5),FONT(,12,COLOR:Red,FONT:bold), |
  LEFT,TRN
                         STRING('Provider Name:'),AT(208,5552,2229,229),USE(?STRING22:6),FONT(,12,COLOR:Black,FONT:bold), |
  RIGHT
                         LINE,AT(2510,5719,4729,0),USE(?LINE2:9),COLOR(COLOR:Black)
                         STRING('Tel: 887-992-4100'),AT(542,1062),USE(?STRING23)
                         CHECK('Use mailing address from NPI registry, or enter mailing adress below'),AT(1104,6250), |
  USE(?CHECK2)
                         STRING('Lab Results Mailing Address:'),AT(1104,6000,2406,187),USE(?STRING14),FONT(,12,,FONT:bold), |
  LEFT
                         STRING(@D1b),AT(5740,2969),USE(Cov:dov)
                         STRING('Blood Test Request Form'),AT(2917,31),USE(?STRING18),FONT(,14,COLOR:HIGHLIGHT,FONT:bold)
                         STRING('Other ICD-10 Code:'),AT(146,9062,1406,281),USE(?StrikngICD:2),FONT(,10,,FONT:bold), |
  TRN
                         LINE,AT(1448,9229,4729,0),USE(?LINE2:4),COLOR(COLOR:Black)
                         STRING('Include a copy of your Medicare card'),AT(437,3958,3073,229),USE(?StringMedicare), |
  FONT(,12,COLOR:Red,FONT:bold),HIDE
                         CHECK('Recommended Panel'),AT(4021,1406),USE(?test:2),FONT(,,COLOR:HIGHLIGHT,FONT:bold),TRN
                         CHECK('IgG RBD'),AT(4021,1781,2292),USE(?test),FONT(,10,,FONT:bold)
                         CHECK('IgG S1 protein'),AT(4021,1990,2292),USE(?test:3),FONT(,10,,FONT:bold)
                         CHECK('IgG N protein'),AT(4021,2198,2292),USE(?test:4),FONT(,10,,FONT:bold)
                         STRING(@s64),AT(1156,2427,2354),USE(locCitryStateZip)
                       END
Page2                  DETAIL,AT(-250,0,7948,10250),USE(?Page2)
                         IMAGE('..\drawInstructions.jpg'),AT(208,31,7385,10219),USE(?IMAGE4)
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
  GlobalErrors.SetProcedureName('CovidRequestForm')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:CovidOrders.Open                                  ! File CovidOrders used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CovidRequestForm',ProgressWindow)          ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:CovidOrders, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Cov:id)
  ThisReport.AddSortOrder(Cov:OrderKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:CovidOrders.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
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
    Relate:CovidOrders.Close
  END
  IF SELF.Opened
    INIMgr.Update('CovidRequestForm',ProgressWindow)       ! Save window data to non-volatile store
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
  Races[1] = 'Not Given'
  Races[2] = 'White'
  Races[3] = 'Black or Africian American'
  Races[4] = 'Asian'
  Races[5] = 'American Indian or Alaska Native'
  Races[6] = 'Native Hawaiian or Other Pacific Islander'
  locRace = Races[Cov:Race + 1]
  Ethnicities[1] = 'Not Given'
  Ethnicities[2] = 'Hispanic or Latino'
  Ethnicities[3] = 'Not Hispanic or Latino'
  locEthenicity = Ethnicities[Cov:Ethnicity + 1]
  locGender = 'Not Given'
  locPfizer = 0
  locModerna = 0
  locAstraZenica = 0
  locJohnson = 0
  IF Cov:VaxBrand = 1 THEN locPfizer = TRUE.
  IF Cov:VaxBrand = 2 THEN locModerna = TRUE.
  IF Cov:VaxBrand = 3 THEN locAstraZenica = TRUE.
  IF Cov:VaxBrand = 4 THEN locJohnson = TRUE.
  locVavinated = FALSE 
  IF Cov:vaccinated = 1 THEN locVavinated = TRUE.
  locCitryStateZip = CLIP(Cov:City) & ', ' & Cov:State & ' ' & Cov:Zip
  locBarcode = '*' & Cov:Accession & '*'
  SETTARGET(Report)
  locIcdDescription1 = 'For patients with unresolved history of COVID-19'
  locIcdDescription2 = 'Contact with and (suspected) exposure to Covid-19'  
  locIcdDescription3 = 'Encounter for antibody response examination not performed to confirm a current COVID-19 infection, nor is performed as a follow-up test after resolution of COVID-19'
  locProviderInstructions = 'Enter mailing address if different than registered NPI mailing address.'
  ! PRINT(RPT:Detail)
  !  PRINT(RPT:Page2)
  ! ?StringOrdered{PROP:Text} = 'Test Ordered: '
  ! ?StringOrderedDescription{PROP:Text} = 'G-RBD, IgG Receptor Binding Domain'
  ! ?StringOrderedDescription2{PROP:Text} = ''
  !UNHIDE(?StringMedicare)
  !UNHIDE(?LineMedicareProvider)
  SETTARGET()
  PRINT(RPT:Detail)
  PRINT(RPT:Page2)
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
!!! Generated from procedure template - Source
!!! </summary>
ImportCovidTests     PROCEDURE                             ! Declare Procedure
Tests FILE,DRIVER('ASCII', '/TAB = -100'),PRE(TES),NAME(gloFileName2)
          RECORD
Data    STRING(255)
  . .
Field   LONG
locMark              LONG                                  !
locMonth             LONG                                  !
locDay               LONG                                  !
locYear              LONG                                  !
Fields               STRING(64),DIM(24)                    !
locPosition          LONG                                  !

  CODE
  stop('Are You Sure?')
  SHARE(Patient)
  SHARE(Client)
  SHARE(Claims)
  SHARE(Billing)
  gloFileName2 = 'import.txt'
  OPEN(CovidOrders)
  OPEN(Tests)
  EMPTY(CovidOrders)
  SET(Tests)
  LOOP UNTIL EOF(Tests)
    NEXT(Tests)
    IF errorcode() then break.
    STOP(TES:Data)
    locMark = 1
    Field = 0
    LOOP
      locPosition = INSTRING('<9>',TES:Data,1,locMark)
      IF locPosition = 0 THEN BREAK.
      Field += 1
      Fields[Field] = SUB(TES:Data,locMark,locPosition-locMark)
     ! stop(Fields[Field] & ', ' & locMark & ',' & locPosition & ',' & SUB(TES:Data,locMark,locPosition-locMark) & '|')
      locMark = locPosition + 1
    .
    Cov:Accession = Fields[1]
    locYear = SUB(Fields[2],1,4)
    locMonth = SUB(Fields[2],6,2)  
    locDay = SUB(Fields[2],9,2) 
    Cov:Date = DATE(locMonth,locDay,locYear)
    Cov:LastName = Fields[3]
    Cov:FirstName = Fields[4]
    Cov:Address1 = Fields[5]
    Cov:Address2 = Fields[6]
    Cov:City = Fields[7]
    Cov:State = Fields[8]
    Cov:Zip = Fields[9]
    Cov:Phone = Fields[10]
    locYear = SUB(Fields[11],1,4)
    locMonth = SUB(Fields[11],6,2)  
    locDay = SUB(Fields[11],9,2) 
    Cov:DOB = DATE(locMonth,locDay,locYear)
    Cov:Sex = Fields[12]
    Cov:Race = Fields[13]
    Cov:Ethnicity = Fields[14]
    Cov:email = Fields[15]
    Cov:Insurance = Fields[16]
    Cov:Payer = Fields[17]
    Cov:MemberID = Fields[18]
    Cov:VaxBrand = Fields[19]
    locYear = SUB(Fields[20],1,4)
    locMonth = SUB(Fields[20],6,2)  
    locDay = SUB(Fields[20],9,2) 
    Cov:dov = DATE(locMonth,locDay,locYear)
    IF locYear < 2020 THEN Cov:dov = 0.
    Cov:vaccinated = Fields[21]
    Cov:status = Fields[22]
    Cov:id = Fields[23]
    ADD(CovidOrders)  
    IF Cov:Insurance = 1
      Pat:BILLING = 'M'
      Cov:Payer = ''
      Cov:MemberID = Fields[17]
    ELSIF Cov:Insurance = 2
      Pat:BILLING = 'I'
    ELSIF Cov:Insurance = 3
      Pat:BILLING = 'I'
    ELSIF Cov:Insurance = 4
      Pat:BILLING = 'P'
    .
    Pat:INVOICE = Cov:Accession
    Pat:CLIENT = Cov:Accession
    Pat:ACCESSION = Pat:INVOICE
    Pat:LAST = Cov:LastName
    Pat:FIRST = Cov:FirstName
    Pat:CLIENT_ID = Cov:id
    gloPatientNotes[2] = FORMAT(Cov:Date,@D1)
    Pat:DOB = Cov:DOB
    Pat:SpecimenType = 1
    BILL:Accession = Pat:INVOICE
    BILL:AddressPatient = Cov:Address1
    BILL:Address2Patient = Cov:Address2
    BILL:CityPatient = Cov:City
    BILL:StatePatient = Cov:State
    BILL:PostalPatient = Cov:Zip
    BILL:emailPatient = Cov:email
    BILL:PhonePatient = Cov:Phone
    BILL:DoV = Cov:dov
    BILL:Vacination = Cov:VaxBrand
    BILL:CovID = Cov:id
    CLI:NUMBER = Pat:INVOICE
    CLI:BILLING = Pat:INVOICE
    CLI:LAST = UPPER(Pat:LAST)
    CLI:FIRST = UPPER(Pat:FIRST)
    CLI:Email = Cov:email
    CLI:Postal = 'Y'
    CLI:Language = 'E'
    CLI:EmailReport = 8
    CLM:Patient = Pat:INVOICE
    CLM:PlanID =  Cov:Payer
    CLM:MemberID = Cov:MemberID
    CLM:PlanName = Fields[24]
    ADD(Patient)
    IF ERRORCODE() THEN STOP('PAT: ' & ERROR()).
    ADD(Client)
    IF ERRORCODE() THEN STOP('CLI: ' & ERROR()).
    ADD(Billing)
    IF ERRORCODE() THEN STOP('BILL: ' & ERROR()).
    ADD(Claims)
    IF ERRORCODE() THEN STOP('CLM: ' & ERROR()).
  .
  CLOSE(Tests) 




!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
GetOrderCPL PROCEDURE 

locVolume1           DECIMAL(4,1)                          !
locVolume2           DECIMAL(5,1)                          !
locVolume3           DECIMAL(5,1)                          !
locClientID          STRING(16)                            !
locLoginFile         STRING(16)                            !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Import HL7'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('GetOrder'),SYSTEM
                       STRING('Scan Barcode'),AT(49,55),USE(?STRING:Scan)
                       ENTRY(@s16),AT(45,63,145,25),USE(locClientID),FONT(,16,,FONT:bold,CHARSET:ANSI)
                       BUTTON('Import'),AT(205,55,46),USE(?BUTTON_Inport),ICON(ICON:Connect)
                       STRING('Volume 1'),AT(39,31),USE(?STRING:V1),HIDE
                       STRING('Volume 2'),AT(39,47,30,10),USE(?STRING:V2),HIDE
                       STRING('Volume 3'),AT(39,62,30,10),USE(?STRING:V3),HIDE
                       BUTTON('Print Label 1'),AT(103,28,65,14),USE(?BUTTON_PrintLabel1),FONT(,,,FONT:bold),HIDE
                       BUTTON('Print Label 2'),AT(103,46,65,14),USE(?BUTTON_PrintLabel2),FONT(,,,FONT:bold),HIDE
                       BUTTON('Print Label 3'),AT(103,62,65,14),USE(?BUTTON_PrintLabel3),FONT(,,,FONT:bold),HIDE
                       BUTTON('Next Patient'),AT(205,28,46,37),USE(?BUTTON_NextPatient),ICON(ICON:NextPage),HIDE
                       ENTRY(@n4.1),AT(73,28),USE(locVolume1),RIGHT,HIDE
                       ENTRY(@n4.1),AT(73,46),USE(locVolume2),RIGHT,HIDE
                       ENTRY(@n4.1),AT(73,62),USE(locVolume3),RIGHT,HIDE
                       BUTTON('Done'),AT(185,129,58,28),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Login FILE,DRIVER('ASCII'),PRE(LI),NAME(gloFileName2)
          RECORD
Data    STRING(64)
        . .

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
  GlobalErrors.SetProcedureName('GetOrderCPL')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?STRING:Scan
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('GetOrderCPL',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  ALIAS(EnterKey,TabKey)
  SELECT(?locClientID)
  getHL7Orders
  ProcessOrdersHL7
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
    Relate:Test.Close
  END
  IF SELF.Opened
    INIMgr.Update('GetOrderCPL',QuickWindow)               ! Save window data to non-volatile store
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
    OF ?BUTTON_Inport
      IF LEN(CLIP(locClientID)) < 7
        SELECT(?locClientID)
        CYCLE
      .
      locLoginFile =  CLIP(locClientID) & '.txt'
      REMOVE('c:\apps\' & locLoginFile)
      RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/public_html/cpl/login/' & CLIP(locLoginFile) & ' C:\apps\' & CLIP(locLoginFile) & ' & pause',1)   
      IF EXISTS('c:\apps\' & locLoginFile)
        CLOSE(Login)
        gloFileName2 = 'c:\apps\' & locLoginFile
        OPEN(Login)
        IF ERRORCODE() THEN STOP('OPEN LI: ' & ERROR());SELECT(?locClientID);CYCLE.
        SET(Login)
        CLEAR(PAT:Record,1)
        Pat:INVOICE = 599999
        SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
        PREVIOUS(Patient)
        INVOICE# = PAT:Invoice + 1
        GET(Patient,0)
        CLEAR(PAT:Record)                                         
        PAT:Invoice = INVOICE#
        PAT:Date = TODAY()
        PAT:AGE_TYPE = 'Y'
        Pat:CLIENT = 200032
        PAT:ReportLanguage = 'E'
        Pat:BILLING = 'C'
        Pat:SpecimenType = 1
        Pat:ENTERED_BY = 'CP'
        Pat:VERIFIED_BY = 'AL'
        Pat:STATUS = 'V'
        Pat:ACCESSION = PAT:Invoice
        Pat:CLIENT_ID = locClientID
        Pat:VOLUME1 = locVolume1
        Pat:VOLUME2 = locVolume2
        Pat:Volume3 = locVolume3
        Pat:HL7 = 1
        NEXT(Login)
        PAT:Last = LI:Data
        NEXT(Login)
        Pat:FIRST = LI:Data
        NEXT(Login)
        Pat:DOB = DATE(SUB(LI:Data,6,2), SUB(LI:Data,9,2), SUB(LI:Data,1,4))
        NEXT(Login)
        Pat:SEX = LI:Data
        NEXT(Login)
        IF LEN(CLIP(LI:Data)) = 10
          Pat:COLLECTION = DATE(SUB(LI:Data,6,2), SUB(LI:Data,9,2), SUB(LI:Data,1,4)) 
        .
        ADD(Patient)
        SHARE(AddTests)
        LOOP UNTIL EOF(Login)
          NEXT(Login)
          IF ERRORCODE() THEN BREAK.
          AT:Code =  SUB(LI:Data,1,4) 
          AT:Type =  SUB(LI:Data,5,1)
          AT:Patient = PAT:Invoice
          ADD(AddTests)
          IF ERRORCODE() THEN STOP('ADD AT: ' & ERROR()).
        .
        CLOSE(AddTests)
        CLEAR(BILLING) 
        BILL:VerifiedBy2 = 'CPL'
        BILL:Accession = Pat:Invoice
        ADD(BILLING) 
        CLOSE(Login)
        REMOVE('c:\apps\' & locLoginFile)        
        CREATEDIRECTORY('C:\Apps\Results\' & CLIP(locClientID))
      ELSE
         STOP('File not found: ' & locLoginFile) 
      . 
      UNHIDE(?STRING:V1,?locVolume3)
      HIDE(?STRING:Scan,?BUTTON_Inport)
      SELECT(?locVolume1)
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/post.php?assession=' & Pat:INVOICE & '&id=' & Pat:CLIENT_ID)
    OF ?BUTTON_PrintLabel1
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
    OF ?BUTTON_PrintLabel2
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?BUTTON_NextPatient
        locVolume1 = 0
        locVolume2 = 0
        locVolume3 = 0
        locClientID = ''
        locLoginFile = ''
        HIDE(?STRING:V1,?locVolume3)
        UNHIDE(?STRING:Scan,?BUTTON_Inport)  
        SELECT(?locClientID)
        DISPLAY
    OF ?locVolume1
      Pat:VOLUME1 = locVolume1
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    OF ?locVolume2
      Pat:VOLUME2 = locVolume2
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    OF ?locVolume3
      Pat:VOLUME3 = locVolume3
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BUTTON_PrintLabel3
      ThisWindow.Update
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?Ok
      ThisWindow.Update
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
ExportResult PROCEDURE 

locResultsFilename   STRING(16)                            !
locDelay             LONG                                  !
locRecordNumber      LONG                                  !
locRecords           LONG                                  !
locWaitTime          LONG                                  !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Create HL7 Results'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular+FONT:italic+FONT:strikeout, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,HLP('ExportResult'),SYSTEM
                       ENTRY(@n_6),AT(63,56,87,30),USE(Pat:INVOICE),FONT(,20,,FONT:bold,CHARSET:ANSI),SKIP
                       BUTTON('Post'),AT(167,65,73,22),USE(?BUTTON_Post),FONT(,10,,FONT:bold)
                       BUTTON('Close'),AT(179,132,61,14),USE(?Ok),FONT(,10,,FONT:bold),LEFT,ICON('WAOK.ICO'),FLAT, |
  MSG('Accept operation'),TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(20,109,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Help'),AT(20,132,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Next'),AT(63,103,73,22),USE(?BUTTON_Next),FONT(,10,,FONT:bold)
                       STRING(@n2),AT(75,91,13),USE(locRecordNumber),FONT(,10,,FONT:bold+FONT:italic)
                       STRING(@n2),AT(107,91),USE(locRecords),FONT(,10,,FONT:bold)
                       STRING(@S20),AT(2,4,86,11),USE(Pat:CLIENT_ID),FONT(,10,,FONT:bold),RIGHT
                       STRING(@S20),AT(154,4,93,11),USE(Pat:LAST),FONT(,10,,FONT:bold),LEFT
                       STRING(@S20),AT(92,4,58,11),USE(Pat:FIRST),FONT(,10,,FONT:bold),RIGHT
                       STRING(@D1),AT(71,28),USE(Pat:DATE),FONT(,12,,FONT:bold),RIGHT
                       STRING(@s1),AT(138,28,15),USE(Pat:STATUS),FONT(,12,,FONT:bold)
                       STRING('of'),AT(93,91,11,12),USE(?STRING_OF),FONT(,,,FONT:bold),CENTER
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Data    STRING(32)
        . .       

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
  GlobalErrors.SetProcedureName('ExportResult')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:INVOICE
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
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ExportResult',QuickWindow)                 ! Restore window settings from non-volatile store
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
  IF SELF.FilesOpened
    Relate:Normals.Close
    Relate:Patient.Close
    Relate:Test.Close
  END
  IF SELF.Opened
    INIMgr.Update('ExportResult',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  SHARE(Patient)
  OPEN(CPL)
  locRecords = RECORDS(cpl)
  locRecordNumber = 1
  SET(CPL)
  LOOP UNTIL EOF(CPL)
    NEXT(CPL)
    IF ERRORCODE() THEN BREAK.
    Pat:INVOICE = CPL:Accession
    GET(Patient,Pat:INVOICE_KEY)
    DISPLAY()
    IF ERRORCODE() THEN STOP('GET PAT: ' & ERROR()). 
    IF Pat:CLIENT <> 200032 THEN CYCLE.
    IF CreateDirectory('c:\Apps\Results\' & CLIP(Pat:CLIENT_ID))
      CASE ERROR()
      OF 3
        MESSAGE('CREATE DIRECTORY: Path Not Found')
      OF 5
        MESSAGE('CREATE DIRECTORY: Access Denied')
    . .      
     URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/results.php?id=' & CLIP(Pat:CLIENT_ID) & '&accession=' & Pat:INVOICE)
    locDelay = CLOCK() + 150
    LOOP WHILE CLOCK() < locDelay
      YIELD    
    .      
    RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/public_html/cpl/Results/' & CLIP(Pat:CLIENT_ID) & '/fzUploadResultsCPL.script' & ' C:\Apps\Results\' & CLIP(Pat:CLIENT_ID) & '\fzUploadResultsCPL.script' & ' & exit',1)  
    RUN('C:\Windows\System32\CMD.exe /c ECHO ON & C:\Apps\uploadResultsCPL.bat ' & CLIP(Pat:CLIENT_ID) & ' exit',1) 
    locRecordNumber += 1
  .
  IF locRecordNumber > 1
    URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/status.php') 
  .
  
  POST(EVENT:CloseWindow)
  RETURN
  
  SELECT(?Pat:INVOICE)
  locRecords = RECORDS(cpl)
  DISPLAY()
  IF locRecords = 0
    HIDE(?BUTTON_Next,?STRING_OF)
  .


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
    OF ?BUTTON_Post
      UPDATE(?Pat:INVOICE)
      IF Pat:INVOICE = 0 THEN CYCLE.
      GET(Patient,Pat:INVOICE_KEY)
      IF ERRORCODE() THEN STOP('Get ' & Pat:INVOICE & ':  ' & ERROR());CYCLE.
      IF CreateDirectory('c:\Apps\Results\' & CLIP(Pat:CLIENT_ID))
        CASE ERROR()
        OF 3
          MESSAGE('Path Not Found')
        OF 5
          MESSAGE('Access Denied')
      . .      
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/results.php?id=' & CLIP(Pat:CLIENT_ID) & '&accession=' & Pat:INVOICE)
      STOP('If results posted okay then click Ignore ')
      RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/public_html/cpl/Results/' & CLIP(Pat:CLIENT_ID) & '/fzUploadResultsCPL.script' & ' C:\Apps\Results\' & CLIP(Pat:CLIENT_ID) & '\fzUploadResultsCPL.script' & ' & exit',1)  
      RUN('C:\Windows\System32\CMD.exe /c ECHO ON & C:\Apps\uploadResultsCPL.bat ' & CLIP(Pat:CLIENT_ID) & ' exit',1) 
            
            
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pat:INVOICE
      
      
    OF ?BUTTON_Next
      ThisWindow.Update
      NEXT(CPL)
      Pat:INVOICE = CPL:Accession
      locRecordNumber += 1
      GET(Patient,Pat:INVOICE_KEY)
      DISPLAY()
      IF locRecordNumber = RECORDS(CPL)
        HIDE(?BUTTON_Next,?STRING_OF)
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
  ReturnValue = PARENT.TakeEvent()
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
getHL7Orders         PROCEDURE                             ! Declare Procedure

  CODE
   RUN('C:\Windows\System32\CMD.exe /c ECHO ON & C:\Apps\downloadOrdersCPL.bat & EXIT',1)   
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ProcessOrdersHL7 PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Caption'),AT(,,260,100),GRAY
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
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
  GlobalErrors.SetProcedureName('ProcessOrdersHL7')
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
  INIMgr.Fetch('ProcessOrdersHL7',Window)                  ! Restore window settings from non-volatile store
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
    INIMgr.Update('ProcessOrdersHL7',Window)               ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  URLHandler(ThisWindow{prop:handle},'https://dev.amxemr.com/cpl/findOrders.php')
  POST(EVENT:CloseWindow)  
  PARENT.SetAlerts


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
UploadHL7            PROCEDURE                             ! Declare Procedure

  CODE
     RUN('C:\Windows\System32\CMD.exe /c ECHO ON & C:\Apps\uploadResultsCPL.bat  & EXIT',1)   
!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
GetOrders PROCEDURE 

locVolume1           DECIMAL(4,1)                          !
locName              STRING(64)                            !
locClientName        STRING(20)                            !
locOnHold            LONG                                  !
locDays              LONG                                  !
locVolume2           DECIMAL(5,1)                          !
locVolume3           DECIMAL(5,1)                          !
locOrderNumber       STRING(16)                            !
locLoginFile         STRING(32)                            !
locLength            LONG                                  !
locRoutine           LONG                                  !
locCeliac            LONG                                  !
locChemical          LONG                                  !
locOrders            LONG                                  !
locRecord            LONG                                  !
locAccessionNumbers  LONG,DIM(3)                           !
locNextAccession     LONG                                  !
locPosition          LONG                                  !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Online Request Form'),AT(,,260,186),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('GetOrder'),SYSTEM
                       BUTTON('Patient Label'),AT(103,10,65,14),USE(?BUTTON_PatientLabel),FONT(,,,FONT:bold)
                       STRING('Scan Request Form'),AT(49,55),USE(?STRING:Scan)
                       ENTRY(@s16),AT(45,63,145,25),USE(locOrderNumber),FONT(,16,,FONT:bold,CHARSET:ANSI)
                       BUTTON('Import'),AT(205,55,46),USE(?BUTTON_Inport),ICON(ICON:Connect)
                       STRING('Volume 1'),AT(39,31),USE(?STRING:V1),HIDE
                       STRING('Volume 2'),AT(39,47,30,10),USE(?STRING:V2),HIDE
                       STRING('Volume 3'),AT(39,62,30,10),USE(?STRING:V3),HIDE
                       BUTTON('Print Label 1'),AT(103,28,65,14),USE(?BUTTON_PrintLabel1),FONT(,,,FONT:bold),HIDE
                       BUTTON('Print Label 2'),AT(103,46,65,14),USE(?BUTTON_PrintLabel2),FONT(,,,FONT:bold),HIDE
                       BUTTON('Print Label 3'),AT(103,62,65,14),USE(?BUTTON_PrintLabel3),FONT(,,,FONT:bold),HIDE
                       BUTTON('Next Patient'),AT(205,28,46,37),USE(?BUTTON_NextPatient),ICON(ICON:NextPage),HIDE
                       ENTRY(@n4.1),AT(73,28),USE(locVolume1),RIGHT,HIDE
                       ENTRY(@n4.1),AT(73,46),USE(locVolume2),RIGHT,HIDE
                       ENTRY(@n4.1),AT(73,62),USE(locVolume3),RIGHT,HIDE
                       ENTRY(@s16),AT(97,95),USE(CLM:Barcode),FONT(,12,,FONT:regular),HIDE
                       STRING('Sample Barcode'),AT(11,95,81,17),USE(?StringSampleBarcode),FONT(,12),RIGHT,HIDE
                       ENTRY(@s12),AT(97,116),USE(CLM:ClientBillingID),FONT(,12),LEFT,HIDE
                       STRING('Billing ID'),AT(26,116,66,16),USE(?StringBilling),FONT(,12),RIGHT,HIDE
                       BUTTON('Done'),AT(200,165,58,20),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT
                       STRING(@s64),AT(26,135,215,9),USE(locName),FONT('Microsoft Tai Le',10,,FONT:bold),CENTER
                       STRING(@S64),AT(26,148,215,10),USE(locClientName),FONT('Microsoft Tai Le',10,,FONT:bold),CENTER
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

locDecimal  LONG

Login FILE,DRIVER('ASCII'),PRE(LI),NAME(gloFileName2)
          RECORD
Data    STRING(64)
        . .
        
locChemicals QUEUE,PRE(CHM)
Code STRING(4)
             .
Pat GROUP,PRE(SAVP)
RECORD LIKE(Pat:Record) 
    .

CLM GROUP,PRE(SAVC)
RECORD LIKE(CLM:Record) 
    .


BILL GROUP,PRE(SAVB)
RECORD LIKE(BILL:Record) 
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
  GlobalErrors.SetProcedureName('GetOrders')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?BUTTON_PatientLabel
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Claims.Open                                       ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('GetOrders',QuickWindow)                    ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  ALIAS(EnterKey,TabKey)
  SELECT(?locOrderNumber)
  
  
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
    Relate:Claims.Close
    Relate:Client.Close
    Relate:Test.Close
  END
  IF SELF.Opened
    INIMgr.Update('GetOrders',QuickWindow)                 ! Save window data to non-volatile store
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
    OF ?BUTTON_Inport
      locOrderNumber = DEFORMAT(locOrderNumber)
      rec# = locOrderNumber
      !     locDecimal = VAL(SUB(locOrderNumber,10,1))
      !     IF LEN(CLIP(locOrderNumber)) = 10
      !        IF locDecimal > 64 AND locDecimal < 91
      !          locOrderNumber = SUB(locOrderNumber,1,9)
      !        .
      !      .
      locLoginFile =  CLIP(locOrderNumber) & 'login.txt'
      REMOVE('c:\apps\' & locLoginFile)  
      RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/orders/' & CLIP(locLoginFile) & ' C:\apps\orders\' & CLIP(locLoginFile) & ' & pause',1)   
      IF EXISTS('c:\apps\Orders\' & locLoginFile)
        CLOSE(Login)
        gloFileName2 = 'c:\apps\orders\' & locLoginFile
        OPEN(Login)
        IF ERRORCODE() THEN STOP('OPEN LI: ' & ERROR());SELECT(?locOrderNumber);CYCLE.
        SET(Login)
        NEXT(Login)
        locOrders = 0
        locRoutine = FALSE
        locCeliac = FALSE
        locChemical = FALSE
        locAccessionNumbers[1] = 0  ! Routine
        locAccessionNumbers[2] = 0  ! Celiac
        locAccessionNumbers[3] = 0  ! Chemical
        IF BAND(1,LI:Data) THEN locRoutine = TRUE;locOrders = 1.
        IF BAND(2,LI:Data) THEN locCeliac = TRUE;locOrders += 1.
        IF BAND(4,LI:Data) THEN locChemical = TRUE;locOrders += 1.
        locOnHold = FALSE 
        NEXT(Login)
        IF LI:Data = 1 THEN locOnHold = TRUE.       
        
        
        CLEAR(PAT:Record,1)
        Pat:INVOICE = 599999
        SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
        PREVIOUS(Patient)
        INVOICE# = PAT:Invoice
        DISPLAY
        GET(Patient,0)
        CLEAR(PAT:Record)
      !    PAT:Invoice = INVOICE#
      !    Pat:ACCESSION = INVOICE#
        PAT:Date = TODAY()
        NEXT(Login)        
        Pat:CLIENT = LI:Data        
        CLI:NUMBER = Pat:CLIENT
        GET(Client,CLI:ORDER_KEY)
        locClientName =  CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
        Pat:HL7 = CLI:HL7
        GET(Claims,0)
        CLEAR(CLM:Record)
      !    CLM:Patient = INVOICE#
        CLM:PlanType = 'P'
        CLM:OrderNumber = locOrderNumber
        GET(Billing,0)
        CLEAR(BILL:Record)
      !     BILL:Invoice = INVOICE#
      !     BILL:Accession = INVOICE#
        BILL:VerifiedBy2 = 'OL'
        
        PAT:ReportLanguage = 'E'
        Pat:SpecimenType = 1
        Pat:ENTERED_BY = 'OL'
        Pat:VERIFIED_BY = 'OL'
        Pat:STATUS = 'V'
      !      Pat:ACCESSION = PAT:Invoice
        
        NEXT(Login)
        accession# = LI:Data      
        NEXT(Login)
        Pat:BILLING = LI:Data
        NEXT(Login)        
        PAT:Last = LI:Data
        NEXT(Login)
        Pat:FIRST = LI:Data
        locName = CLIP(PAT:Last) & ', ' & Pat:FIRST
        NEXT(Login)
        IF LI:Data = 1 THEN LI:Data = 'M'.
        IF LI:Data = 2 THEN LI:Data = 'F'.
        
        Pat:SEX = LI:Data
        NEXT(Login)
        Pat:DOB = DATE(SUB(LI:Data,6,2), SUB(LI:Data,9,2), SUB(LI:Data,1,4))
        IF PAT:DOB
          locDays = TODAY() - PAT:DOB
          IF locDays < 365
            PAT:Age = locDays/30
            PAT:AGE_TYPE = 'M'
          ELSIF locDays > 729
            PAT:AGE_TYPE = 'Y'
            PAT:Age = DEFORMAT(AGE(PAT:DOB))
          ELSE
            PAT:AGE_TYPE = 'Y'
            PAT:Age = locDays/365
        . .
        IF ERRORCODE() THEN STOP('PUT PAT: ' & ERROR()).
        NEXT(Login)
        BILL:AddressPatient = LI:Data
        NEXT(Login)
        BILL:CityPatient = LI:Data
        NEXT(Login)
        BILL:StatePatient = LI:Data
        NEXT(Login)
        BILL:PostalPatient = LI:Data
        NEXT(Login)
        BILL:PhonePatient = LI:Data
        NEXT(Login)
        BILL:emailPatient = LI:Data
        NEXT(Login)        
        note" = LI:Data        
        NEXT(Login)
        IF LEN(CLIP(LI:Data)) = 10
          Pat:COLLECTION = DATE(SUB(LI:Data,6,2), SUB(LI:Data,9,2), SUB(LI:Data,1,4)) 
        .
      
        NEXT(Login)
        locPosition = INSTRING(' ',LI:Data)
        locLength = LEN(CLIP(LI:Data)) - locPosition
        Pat:CLIENT_ID = SUB(LI:Data,1,locPosition - 1)
        CLM:ClientBillingID = SUB(LI:Data,locPosition + 1,locLength)
        CLM:Barcode = Pat:CLIENT_ID
      !   stop(Pat:CLIENT_ID & ',' & CLM:ClientBillingID & ', ' & locPosition)
        NEXT(Login)
        
        
        CLM:Physician = LI:Data
        Pat:Notes = LI:Data  
        
        
        
        NEXT(Login)
        CLM:NPI = LI:Data
        NEXT(Login)
        clm:DiagCode1 = LI:Data
        NEXT(Login)
        clm:DiagCode2 = LI:Data
        NEXT(Login)
        clm:DiagCode3 = LI:Data
        IF Pat:BILLING = 'A' OR locOnHold THEN Pat:STATUS = 'H'.
        PUT(Claims)
        PUT(Patient)
        Pat:INVOICE = INVOICE#
        
        IF locRoutine 
          Pat:INVOICE += 1
          Pat:ACCESSION = Pat:INVOICE
          ADD(Patient)
          CLM:Patient = Pat:INVOICE
          ADD(Claims)
          BILL:Invoice = Pat:INVOICE
          BILL:Accession = Pat:INVOICE
          ADD(Billing)
          locAccessionNumbers[1] = Pat:INVOICE
          
        .
        IF locCeliac
          Pat:INVOICE += 1
          Pat:ACCESSION = Pat:INVOICE
          ADD(Patient)
          CLM:Patient = Pat:INVOICE
          ADD(Claims)
          BILL:Invoice = Pat:INVOICE
          BILL:Accession = Pat:INVOICE
          ADD(Billing)
          locAccessionNumbers[2] = Pat:INVOICE
          
        .
        IF locChemical 
          Pat:INVOICE += 1
          Pat:ACCESSION = Pat:INVOICE
          ADD(Patient)
          CLM:Patient = Pat:INVOICE
          ADD(Claims)
          BILL:Invoice = Pat:INVOICE
          BILL:Accession = Pat:INVOICE
          ADD(Billing)
          locAccessionNumbers[3] = Pat:INVOICE
        .
      
      
        SHARE(AddTests)
        LOOP UNTIL EOF(Login)
          NEXT(Login)
          IF ERRORCODE() THEN BREAK.
          locLength = LEN(CLIP(LI:Data))
          IF locLength < 3 THEN CYCLE.
          IF LI:Data = '2600' 
            AT:Code =  '260'
            AT:Patient = locAccessionNumbers[2]
            AT:Type = 0
            ADD(AddTests)            
            CYCLE
          .
          IF SUB(LI:Data,1,2) = 'S0' 
            AT:Code =  SUB(LI:Data,1,4)
            AT:Patient = locAccessionNumbers[3]
            AT:Type = 1
            ADD(AddTests)
            CYCLE
          .
          AT:Type = SUB(LI:Data,5,1)
          IF locLength = 5 AND INRANGE(AT:Type,1,3)
            AT:Code =  SUB(LI:Data,1,4)
            AT:Patient =  locAccessionNumbers[1]
            ADD(AddTests)
          ELSE
            AT:Type = SUB(LI:Data,locLength,1)
            AT:Code = SUB(LI:Data,1,locLength - 1)
            AT:Patient =locAccessionNumbers[1]
            ADD(AddTests)
         .
          IF ERRORCODE() THEN STOP('ADD AT: ' & ERROR()).
        .
        CLOSE(Login)
      !      REMOVE('c:\apps\' & locLoginFile)        
      ELSE
        STOP('File not found: ' & locLoginFile)
      . 
      
      UNHIDE(?STRING:V1,?StringSampleBarcode)
      HIDE(?STRING:Scan,?BUTTON_Inport)
      IF PAT:CLIENT = 500258 THEN UNHIDE(?CLM:ClientBillingID,?StringBilling).  
      DISPLAY
      
      !   locCheckValue[1] = 0
      !   locCheckValue[2] = 0
      !   locCheckValue[3] = 0
      !  locCheckValue[4] = 0
      !  locCheckValue[5] = 0
      
      
      
    OF ?BUTTON_PrintLabel1
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
    OF ?BUTTON_PrintLabel2
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?BUTTON_NextPatient
        locVolume1 = 0
        locVolume2 = 0
        locVolume3 = 0
        locName = ''
        locOrderNumber = ''
        locLoginFile = ''
        GET(Patient,0)
        GET(Billing,0)
        GET(Claims,0)
        CLEAR(Patient)
        CLEAR(Billing)
        CLEAR(Claims)
        HIDE(?STRING:V1,?StringBilling)
        UNHIDE(?STRING:Scan,?BUTTON_Inport)  
        SELECT(?locOrderNumber)
        DISPLAY
    OF ?locVolume1
      Pat:INVOICE = locAccessionNumbers[1]
      GET(Patient,Pat:INVOICE_KEY)
      Pat:VOLUME1 = locVolume1
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    OF ?locVolume2
      Pat:INVOICE = locAccessionNumbers[1]
      GET(Patient,Pat:INVOICE_KEY)
      Pat:VOLUME2 = locVolume2
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    OF ?locVolume3
      Pat:INVOICE = locAccessionNumbers[1]
      GET(Patient,Pat:INVOICE_KEY)
      Pat:VOLUME3 = locVolume3
      PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
      PUT(Patient)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BUTTON_PatientLabel
      ThisWindow.Update
        InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A1,150,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,120,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,5,0,4,1,1,N,"X' & CLIP(PAT:Invoice) & 'X"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,170,0,5,1,1,N,"X' & CLIP(PAT:Invoice) & 'X"<10>P1<10>'
        ComPuts(CommPort,InitStr) 
    OF ?BUTTON_PrintLabel3
      ThisWindow.Update
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?CLM:Barcode
      
      IF LEN(CLIP(CLM:Barcode)) > 0
        IF LEN(CLIP(Pat:CLIENT_ID)) = 0 
          Pat:INVOICE = locAccessionNumbers[1]
          GET(Patient,Pat:INVOICE_KEY)          
          Pat:CLIENT_ID = CLM:Barcode  
          PUT(Patient) 
          IF ERRORCODE() THEN STOP('PUT PAT: ' & ERROR()). 
        .
        IF CLM:Barcode = Pat:CLIENT_ID
          CLM:Barcode = ''
        .
      . 
      PUT(Claims) 
      IF ERRORCODE() THEN STOP('PUT CLM: ' & ERROR()). 
      DISPLAY
    OF ?CLM:ClientBillingID
      DISPLAY
      PUT(Claims) 
      IF ERRORCODE() THEN STOP('PUT CLM: ' & ERROR()).
    OF ?Ok
      ThisWindow.Update
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
ExportPortal PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Window'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('ExportPortal'),SYSTEM
                       BUTTON('&OK'),AT(101,142,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(154,142,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Help'),AT(207,142,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('ExportPortal')
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
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Claims.Open                                       ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ExportPortal',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  
  
  gloFileName = 'patient.txt'
  CREATE(Text)
  OPEN(Text)
  CLEAR(Pat:RECORD)
  Pat:DATE = TODAY() - 180  
  SET(Pat:DATE_KEY,Pat:DATE_KEY)
  LOOP UNTIL EOF(Patient)
    NEXT(Patient)
    BILL:Accession = Pat:INVOICE
    TXT:Text = pat:ACCESSION & '|' & YEAR(Pat:COLLECTION) & '-' & MONTH(Pat:COLLECTION) & '-' & DAY(Pat:COLLECTION) & '|' & (Pat:VOLUME - (Pat:NEEDED/1000)) & '|' & SUB(gloPatientNotes[1],1,40)  
    ADD(Text)
  .
  CLOSE(Text)
  RETURN(0)
  
  gloFileName = 'billing.txt'
  CREATE(Text)
  OPEN(Text) 
  CLEAR(BILL:RECORD)
  SET(BILL:patKey,BILL:patKey)
  LOOP UNTIL EOF(Billing)
    NEXT(Billing)
    IF LEN(CLIP(BILL:AddressPatient)) > 4
      TXT:Text = BILL:Accession & '|' & CLIP(BILL:AddressPatient) & '|' & CLIP(BILL:CityPatient) & '|' & CLIP(BILL:StatePatient) & '|' & CLIP(BILL:PostalPatient) & '|' & CLIP(BILL:emailPatient) & '|' & CLIP(BILL:PhonePatient)  
      ADD(Text)
  . .
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
    Relate:Claims.Close
    Relate:Patient.Close
  END
  IF SELF.Opened
    INIMgr.Update('ExportPortal',QuickWindow)              ! Save window data to non-volatile store
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ExportUpdates        PROCEDURE  (LONG prmFrom,LONG prmTo)  ! Declare Procedure
AllFiles             QUEUE(File:queue),PRE(FIL)            !
                     END     
locLine              STRING(256)                           !
locDate              DATE                                  !
locLastAccession     LONG                                  !

  CODE

  time# = clock()
!!  OMIT('XXXX')
  SHARE(Client)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('CLI: ' & ERROR()).
  SHARE(Physicians)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('PHY: ' & ERROR()).
  SHARE(Test)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('TST: ' & ERROR()).
  SHARE(Patient)
  IF ERRORCODE() AND ERRORCODE() <> 52  THEN STOP('PAT: ' & ERROR()).
  SHARE(Billing)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('BILL: ' & ERROR()).
  SHARE(Claims)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('CLM: ' & ERROR()).
  SHARE(PatientList)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('PL: ' & ERROR()).
  CLOSE(Text)
  CLOSE(Text)
  gloFileName = 'updateclient.txt'
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE updateclient.txt: ' & ERROR()).  
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN updateclient.txt: ' & ERROR()).  
  SET(CLI:ORDER_KEY)
  LOOP UNTIL EOF(Client)
    NEXT(Client)
    IF ERRORCODE() THEN BREAK.
    TXT:Text = CLI:NUMBER & '|' & LEFT(CLIP(CLI:FIRST) & ' ' &  CLIP(CLI:LAST) & ' ' & CLIP(CLI:DEGREE)) & '|' & CLIP(CLI:ADDRESS1) & '|' & CLIP(CLI:CITY) & '|' & CLI:STATE & '|' & CLIP(CLI:ZIP) & '|' & CLIP(CLI:CONTACT) & '|' & CLIP(CLI:PHONE) & '|' & CLIP(CLI:Email) & '|' & CLIP(CLI:FAX) & '|' 
    ADD(Text)
    IF ERRORCODE() THEN STOP('ADD TXT: ' & ERROR()).  
  .  
  
  CLOSE(Text)
  gloFileName = 'updatephysicians.txt'
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE updatephysicians.txt: ' & ERROR()).    
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN updateclient.txt: ' & ERROR()).  
  SET(PHY:OrderKey)
  LOOP UNTIL EOF(Physicians)
    NEXT(Physicians)
    IF ERRORCODE() THEN BREAK.
    IF LEN(CLIP(PHY:Physician)) = 0 THEN CYCLE.
    TXT:Text = PHY:Client & '|' & CLIP(PHY:Physician) & '|' &  CLIP(PHY:Upin)  & '|' &  CLIP(PHY:License)  & '|' & CLIP(PHY:First) & '|' & CLIP(PHY:Last) & '|'
    ADD(Text)
  .  

 ! stop(prmFrom & ' ' & prmTo)
  
!!  XXXX
!!  prmFrom = 300014
!!  prmTo = 300034
  
  CLOSE(Text)
  gloFileName = 'updatepatient.txt'
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE UpdatePatient.txt: ' & ERROR()).
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN UpdatePatient.txt: ' & ERROR()).
  CNT# = 1
  CLEAR(Pat:RECORD)
  Pat:INVOICE = prmFrom
  SET(Pat:INVOICE_KEY,Pat:INVOICE_KEY)
  IF ERRORCODE() THEN STOP('SET PL: ' & ERROR()).
  LOOP UNTIL EOF(Patient)
    NEXT(Patient)
    IF ERRORCODE() THEN STOP('PAT NEXT ' & ERROR());BREAK.
    IF Pat:INVOICE > prmTo THEN BREAK.
    Pat:INVOICE = Pat:INVOICE
    GET(Patient,Pat:INVOICE_KEY)
    BILL:Accession = Pat:INVOICE
    GET(Billing,BILL:patKey)
    CLM:Patient = Pat:INVOICE
    GET(Claims, CLM:OrderKey)
    TXT:Text = 	Pat:INVOICE & '|' & Pat:STATUS & '|' & FORMAT(Pat:DATE,@D10-) & '|' &  Pat:CLIENT & '|' &  CLIP(Pat:LAST) & '|' & CLIP(Pat:FIRST) & '|' &  FORMAT(Pat:DOB,@D10-) & '|' & PAT:Sex & '|' & CLIP(Pat:CLIENT_ID) & '|' & CLIP(BILL:AddressPatient) & '|' & CLIP(BILL:Address2Patient) & '|' & CLIP(BILL:CityPatient) & '|' & CLIP(BILL:StatePatient) & '|' & CLIP(BILL:PostalPatient)  & '|' & CLIP(BILL:PhonePatient) & '|' & CLIP(BILL:emailPatient) &  '|' & CLIP(CLM:Physician) & '|' & CLIP(CLM:NPI) & '|'  & (Pat:VOLUME - Pat:NEEDED/1000) & '|' & Pat:BILLING  & '|' &  FORMAT(Pat:COLLECTION,@D10-) & '|' & CLIP(BILL:GuarantorName) & '|' & CLIP(CLM:PlanName) & '|' & CLIP(CLM:PlanID) & '|' & CLIP(CLM:MemberID) & '|' & CLIP(CLM:DiagCode1) & '|' & CLIP(CLM:DiagCode2) & '|' & CLIP(CLM:DiagCode3) & '|' & Pat:NEEDED & '|'
    ADD(Text)
    IF ERRORCODE() THEN STOP('TXT: ' & ERROR()).
    CLI:NUMBER = Pat:CLIENT
    GET(CLIENT,CLI:ORDER_KEY)
    IF CLI:NUMBER <> CLI:BILLING
      TXT:Text = 	Pat:INVOICE & '|' & Pat:STATUS & '|' & FORMAT(Pat:DATE,@D10-) & '|' &  CLI:BILLING & '|' &  CLIP(Pat:LAST) & '|' & CLIP(Pat:FIRST) & '|' &  FORMAT(Pat:DOB,@D10-) & '|' & PAT:Sex & '|' & CLIP(Pat:CLIENT_ID) & '|' & CLIP(BILL:AddressPatient) & '|' & CLIP(BILL:Address2Patient) & '|' & CLIP(BILL:CityPatient) & '|' & CLIP(BILL:StatePatient) & '|' & CLIP(BILL:PostalPatient)  & '|' & CLIP(BILL:PhonePatient) & '|' & CLIP(BILL:emailPatient) &  '|' & CLIP(CLM:Physician) & '|' & CLIP(CLM:NPI) & '|'  & (Pat:VOLUME - Pat:NEEDED/1000) & '|' & Pat:BILLING  & '|' &  FORMAT(Pat:COLLECTION,@D10-) & '|' & CLIP(BILL:GuarantorName) & '|' & CLIP(CLM:PlanName) & '|' & CLIP(CLM:PlanID) & '|' & CLIP(CLM:MemberID) & '|' & CLIP(CLM:DiagCode1) & '|' & CLIP(CLM:DiagCode2) & '|' & CLIP(CLM:DiagCode3) & '|'
      ADD(Text)
    .
    
  .
  locLastAccession = Pat:INVOICE
  CLOSE(Text)

  
  
  gloFileName = 'updatetest.txt'
  CREATE(Text)
  IF ERRORCODE() THEN STOP('CREATE UpdateTest.txt: ' & ERROR()).
  OPEN(Text)
  IF ERRORCODE() THEN STOP('OPEN UpdateTest.txt: ' & ERROR()).  
  CLEAR(Pat:RECORD)
  Pat:INVOICE =  prmFrom
  SET(Pat:INVOICE_KEY,Pat:INVOICE_KEY)
  LOOP UNTIL EOF(Patient)
    NEXT(Patient)
    IF ERRORCODE() THEN STOP(ERROR());BREAK.
  !  Pat:INVOICE = PatL:Accession
   ! GET(Patient,Pat:INVOICE_KEY) 
    !IF Pat:STATUS <> 'C' THEN CYCLE.

    CLEAR(TST:Record)
    TST:INVOICE = Pat:INVOICE 
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP UNTIL EOF(Test)
      NEXT(Test)
      IF ERRORCODE() THEN STOP(ERROR());BREAK.
      IF TST:INVOICE <> Pat:INVOICE THEN BREAK.
   !   IF TST:STATUS = 'X' THEN CYCLE.
       TXT:TEXT = Pat:CLIENT & '|' & pat:invoice & '|' & CLIP(TST:STATUS)  & '|' & CLIP(TST:CODE) & '|' & TST:TYPE & '|' & TST:COUNT & '|' & CLIP(TST:Score) & '|'
       ADD(Text)
       IF ERRORCODE() THEN STOP('ADD UpdateTest.txt: ' & ERROR()).
       IF TST:INVOICE > prmTo THEN BREAK. 
    .  
    
  .
  CLOSE(Text)
  ! stop((CLOCK() - TIME#)/100)
