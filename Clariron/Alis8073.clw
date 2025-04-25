

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8073.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Billing File
!!! </summary>
Letters PROCEDURE (prmLetterNumber)

locNumberPayments    LONG                                  !
locClientNumber      STRING(32)                            !
locClientName        STRING(32)                            !
Progress:Thermometer BYTE                                  !
locPaymentHeader     STRING(32)                            !
locName              STRING(32)                            !
locDueDate           LONG                                  !
locNote              STRING(512)                           !
locTitle             STRING(40)                            !
locAmountDue         DECIMAL(7,2)                          !
locLetters           BYTE                                  !
locTextLetter        STRING(1024)                          !
locPayments          DECIMAL(7,2)                          !
locShowPaymentTotal  DECIMAL(7,2)                          !
locToday             DATE                                  !
locLastPayment       DATE                                  !
locLastLetter        DATE                                  !
locAddress2          STRING(32)                            !
locAddress3          STRING(32)                            !
locAddress4          STRING(20)                            !
Process:View         VIEW(Billing)
                       PROJECT(BILL:Accession)
                       PROJECT(BILL:DateFax1)
                       PROJECT(BILL:DateFax2)
                       PROJECT(BILL:Description)
                       PROJECT(BILL:InsuranceAdj)
                       PROJECT(BILL:InsuranceBilled)
                       PROJECT(BILL:InsurancePaid)
                       PROJECT(BILL:LetterComment)
                       PROJECT(BILL:OutStanding)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Billing'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Billing Report'),AT(250,6000,8000,10000),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,5781),USE(?Header),FONT('Arial',12,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE('am.jpg'),AT(104,229,3073,927),USE(?Image1)
                         STRING(@D4),AT(583,1469,2677,187),USE(BILL:DateFax1,,?BILL:Date:2)
                         STRING(@s32),AT(583,2021),USE(NAM:Name)
                         STRING(@s32),AT(583,2240),USE(NAM:Address1)
                         STRING(@s32),AT(583,2458),USE(locAddress2)
                         STRING(@s32),AT(583,2677,2917),USE(locAddress3)
                         STRING(@d17),AT(2198,3260),USE(BILL:DateFax2)
                         STRING(@n$9.2),AT(2198,4177,969,229),USE(BILL:InsuranceBilled),RIGHT
                         STRING(@n$9.2),AT(2198,4417,969,229),USE(BILL:InsurancePaid),RIGHT
                         STRING(@n$9.2),AT(2198,4656,969,229),USE(BILL:InsuranceAdj),RIGHT
                         STRING(@n$9.2),AT(2198,5135,969),USE(BILL:OutStanding),FONT(,,,FONT:bold),RIGHT
                         STRING('Insurance Fee:'),AT(104,4177,1979),USE(?STRING1),FONT(,,,FONT:bold),RIGHT
                         STRING('Insurance Payment'),AT(104,4417,1979,219),USE(?STRING2:2),FONT(,,,FONT:bold),RIGHT
                         STRING('Insurance Adjustment'),AT(104,4656,1979),USE(?STRING3),FONT(,,,FONT:bold),RIGHT
                         STRING('Balance Due'),AT(469,5135,1615,219),USE(?STRING4),FONT(,,,FONT:bold),RIGHT
                         STRING(@s32),AT(2198,3719,4646),USE(locName)
                         STRING(@s25),AT(2979,3490,3167,260),USE(locClientName)
                         STRING(@p### ###p),AT(2198,3490),USE(CLI:NUMBER),LEFT(1)
                         STRING('Service Description'),AT(104,3948,1979),USE(?STRING5),FONT(,,,FONT:bold),RIGHT
                         STRING('Lab. Date of Service'),AT(469,3260,1615),USE(?STRING6),FONT(,,,FONT:bold),RIGHT
                         STRING('Patient'),AT(469,3719,1615,219),USE(?STRING7),FONT(,,,FONT:bold),RIGHT
                         STRING('Physician'),AT(469,3490,1615,219),USE(?STRING8:2),FONT(,,,FONT:bold),RIGHT
                         STRING(@p### ###p),AT(2198,3031),USE(BILL:Accession),LEFT(1)
                         STRING('Invoice'),AT(469,3031,1615),USE(?STRING9),FONT(,,,FONT:bold),RIGHT
                         STRING('Improving allergy outcomes'),AT(521,1115),USE(?STRING10),FONT(,10,,FONT:bold+FONT:italic, |
  CHARSET:ANSI)
                         STRING(@n$9.2),AT(2198,4896,969,229),USE(locPayments),RIGHT
                         STRING('Payments'),AT(469,4896,1615),USE(?STRING8),FONT(,,,FONT:bold),RIGHT
                         STRING(@s32),AT(2198,3948,4156,219),USE(BILL:Description)
                         STRING(@s40),AT(3510,927,4437),USE(locTitle),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI),CENTER
                         STRING(@s32),AT(1927,5542),USE(locPaymentHeader),LEFT
                       END
Comment                DETAIL,AT(10,0,7969,240),USE(?Comment)
                         STRING(@s255),AT(375,31,6312),USE(locNote),FONT('Arial',10,,,CHARSET:ANSI)
                       END
Comment2               DETAIL,AT(10,0,7969,240),USE(?Comment2)
                         STRING(@s255),AT(375,31,6312),USE(BILL:LetterComment),FONT('Arial',10,,,CHARSET:ANSI)
                       END
Detail                 DETAIL,AT(10,0,7000,187),USE(?Detail)
                         STRING(@d17),AT(1927,0),USE(Pay:Date),FONT('Arial',10,,,CHARSET:ANSI)
                         STRING(@n$9.2),AT(3031,0),USE(Pay:Amount),FONT('Arial',10,,,CHARSET:ANSI),RIGHT(2)
                       END
                       FOOTER,AT(250,10300,7948,396),USE(?Footer)
                         STRING('FAX: 615-599-4648'),AT(2823,31),USE(?String34),TRN
                         STRING('dc@allermetrix.com'),AT(4979,31),USE(?String22),TRN
                         STRING('Tel# 877-992-4100'),AT(677,31),USE(?String23),FONT(,,,FONT:regular),TRN
                         STRING(@pPage <<#p),AT(7135,31,700,135),USE(?locPageNumber),FONT('Arial',8,,FONT:regular), |
  PAGENO
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

ProgressMgr          StepRealClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('Letters')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:NameList.Open                                     ! File NameList used by this procedure, so make sure it's RelationManager is open
  Relate:Payments.Open                                     ! File Payments used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Letters',ProgressWindow)                   ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Billing, ?Progress:PctText, Progress:Thermometer, ProgressMgr, BILL:Accession)
  ThisReport.AddSortOrder(BILL:patKey)
  ThisReport.AddRange(BILL:Accession)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Billing.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SetAlerts()
  NAM:Number = BILL:Accession
  GET(NameList,NAM:OrderKey)
  IF NAM:Address2 
    locAddress2 = NAM:Address2
    locAddress3 = CLIP(NAM:City) & ' ' & NAM:State & ' ' & NAM:Postalcode
  ELSE
    locAddress2 = CLIP(NAM:City) & ' ' & NAM:State & ' ' & NAM:Postalcode
  .
  
  Pat:INVOICE = BILL:Accession
  GET(Patient,Pat:INVOICE_KEY)
  CLI:NUMBER = Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE() 
    locClientName = 'CLIENT: ' & ERROR()
  ELSE
    IF CLI:FIRST
      locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
    ELSE
      locClientName = CLI:LAST
    .
  .
    
    
  IF prmLetterNumber = 1
    locTextLetter = 'If you are unable to pay this invoice in full, you may select a payment plan'
    locTitle = ''
  ELSIF prmLetterNumber = 2
    locTextLetter = 'Please resolve this past due account, pay now or select a payment plan.'
    locTitle = 'Second Letter'
  ELSIF prmLetterNumber = 3
    locTextLetter = 'We''ve been more than patient with you.  We have expended our limited resources to provide you with quality service.  Do you think you are being fair?'
    locTitle = ''
  ELSIF prmLetterNumber = 4
    locTitle = 'DELINQUENT ACCOUNT'
    locTextLetter = 'We have made multiple attempts to contact you regarding payment for laboratory servicesr endered.  Payment plans are available.  If you do not contact our office within the next 5 business days  we will turn your account over to a collection agency.'
  ELSIF prmLetterNumber = 5
    locTextLetter = 'Despite repeated notices, your payment has not been received, and thus your account remains past due.  Unless you promptly cure the default on this account before ' & FORMAT(locDueDate,@d1) & ' national, third-party collection agency.<13,10,13,10>We urge you to make immediate payment of the above past due amount.<13,10,13,10>To avoid the collections process, please ensure that we receive payment before the “Collections Process Begins” date printed above.<13,10,13,10>Please be advised that nothing in this letter is intended to waive any rights or remedies available to us under your contract, at law or in equity, all of which are expressly reserved.'
    locTitle = 'FINAL NOTICE OF PAST DUE ACCOUNT'
  .
  locName = CLIP(Pat:LAST) & ', ' & Pat:FIRST
  locNumberPayments = 0
  Pay:Invoice = BILL:Accession
  Pay:Date = 0
  SET(Pay:OrderKey,Pay:OrderKey)
  LOOP
    NEXT(Payments)
    IF Pay:Invoice <> BILL:Accession OR ERRORCODE() THEN BREAK.
    IF Pay:Type = 'Insurance' THEN CYCLE.
    locNumberPayments += 1
  .
   IF locNumberPayments = 0 
     locPaymentHeader = 'No Payments'
   ELSIF locNumberPayments = 1 
     locPaymentHeader =  'Previous Payment'
   ELSE 
     locPaymentHeader =  'Previous Payments'
   .
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
    Relate:Client.Close
    Relate:NameList.Close
    Relate:Payments.Close
  END
  IF SELF.Opened
    INIMgr.Update('Letters',ProgressWindow)                ! Save window data to non-volatile store
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
  OMIT('XXXX')
  PRINT(RPT:Comment)
  PRINT(RPT:Comment2)
  PRINT(RPT:Detail)
  XXXX
  Pay:Invoice = BILL:Accession
  Pay:Date = 0
  SET(Pay:OrderKey,Pay:OrderKey)
  LOOP
    NEXT(Payments)
  !    stop(Pay:Invoice & '-' & BILL:Accession)
    IF ERRORCODE() OR Pay:Invoice <> BILL:Accession THEN BREAK.
    IF Pay:Amount = 0 OR Pay:Type = 'Insurance' THEN CYCLE.
    PRINT(RPT:Detail)
  .
  IF BAND(BILL:LetterNotes,1)  THEN locNote = '-Please sent copy of insurance card with insured''s date of birth';PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,2)  THEN locNote = '-Insurance applied to yearly deductible/co-insurance';PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,4)  THEN locNote = '-The Fee for our service is not covered by your insurance';PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,8)  THEN locNote = '-Non-network discount applied';PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,16) THEN locNote = '-Per your insurance, no coverage on the date of service' ;PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,32) THEN locNote = '-Per insurance, payment for services sent to member/patient';PRINT(RPT:Comment).
  IF BAND(BILL:LetterNotes,64) THEN locNote = '-In seven days, the Balance Due amount will be applied to the credit card information provided at the time of service';PRINT(RPT:Comment).
  IF LEN(locNote)> 0 THEN PRINT(RPT:Comment).
  IF LEN(BILL:LetterComment)> 0 THEN PRINT(RPT:Comment2).
   
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
CreditCard PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(,,428,333),FONT('Microsoft Sans Serif',8),GRAY
                       IMAGE('ccWeb.jpg'),AT(0,0),USE(?IMAGE1)
                       REGION,AT(63,283,351,46),USE(?PANEL1),IMM
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CreditCard')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?IMAGE1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('CreditCard',Window)                        ! Restore window settings from non-volatile store
  SELF.SetAlerts()
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
  IF SELF.Opened
    INIMgr.Update('CreditCard',Window)                     ! Save window data to non-volatile store
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
    OF ?PANEL1
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
CONVERT PROCEDURE 

billing2           FILE,DRIVER('TOPSPEED'),NAME('C:\C6\ALIS\DATA\BILLING2.TPS'),PRE(b2)
RECORD                RECORD
CURRENT                  STRING(32)
ACTIONDATE                  STRING(32)
SERVICEDATE                  STRING(32)
NEXTLETTER                  STRING(32)
LETTER1                  STRING(32)
LETTER2                  STRING(32)
LETTER3                  STRING(32)
LETTER4                 STRING(32)
LETTER5                 STRING(32)
INSBILLED                 STRING(32)
INSPAID                 STRING(32)
INSADJ                 STRING(32)
OTHERADJ                 STRING(32)
SALUTATION                 STRING(32)
FIRSTNAME                 STRING(32)
LASTNAME                 STRING(32)
PATIENTNAME                 STRING(32)
ADDRESS1                 STRING(32)
ADDRESS2                  STRING(32)
CITY                 STRING(32)
STATE                 STRING(32)
ZIP                 STRING(32)
PAYDATE1                 STRING(32)
AMOUNT1                 STRING(32)
PAYDATE2                 STRING(32)
AMOUNT2                 STRING(32)
PAYDATE3                 STRING(32)
AMOUNT3                 STRING(32)
PAYDATE4                 STRING(32)
AMOUNT4                 STRING(32)
PAYDATE5                 STRING(32)
AMOUNT5                 STRING(32)
PAYDATE6                 STRING(32)
AMOUNT6                 STRING(32)
PAYDATE7                 STRING(32)
AMOUNT7                 STRING(32)
PAYDATE8                 STRING(32)
AMOUNT8                 STRING(32)
PAYDATE9                 STRING(32)
AMOUNT9                 STRING(32)
PAYDATE10                 STRING(32)
AMOUNT10                 STRING(32)
PAYDATE11                 STRING(32)
AMOUNT11                 STRING(32)
PAYDATE12                 STRING(32)
AMOUNT12                 STRING(32)
REFER                 STRING(32)
INVOICE                 STRING(32)
LABEL51                 STRING(32)
COMMENTS                 STRING(32)
OUTSTANDING                 STRING(32)
PAYMENTPLAN                 STRING(32)
                      END
                    END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Window'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('CONVERT'),SYSTEM
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
  GlobalErrors.SetProcedureName('CONVERT')
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
  Relate:NameList.Open                                     ! File NameList used by this procedure, so make sure it's RelationManager is open
  Relate:Payments.Open                                     ! File Payments used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CONVERT',QuickWindow)                      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  !!!!!!!!!!!!!!
  open(billing2)
  SET(billing2)
  LOOP
    NEXT(billing2)
    IF ERRORCODE() THEN BREAK.
    CLEAR(BILL:Record)
    INVOICE# += 1
    BILL:Invoice = INVOICE#
    BILL:QB = B2:INVOICE
    BILL:Description = 'RAST-Allergy Testing' 
    BILL:Letter1 = DATE(SUB(B2:LETTER1,1,2),SUB(B2:LETTER1,4,2),SUB(B2:LETTER1,7,2))
    IF LEN(CLIP(B2:LETTER2)) = 10
      BILL:Letter2 = DATE(SUB(B2:LETTER2,1,2),SUB(B2:LETTER2,4,2),SUB(B2:LETTER2,7,4))
    ELSIF LEN(CLIP(B2:LETTER2)) = 9
      BILL:Letter2 = DATE(SUB(B2:LETTER2,1,1),SUB(B2:LETTER2,3,2),SUB(B2:LETTER2,6,4))
    .
    IF LEN(CLIP(B2:LETTER3)) = 10
      BILL:Letter3 = DATE(SUB(B2:LETTER3,1,2),SUB(B2:LETTER3,4,2),SUB(B2:LETTER3,7,4))
    ELSIF LEN(CLIP(B2:LETTER3)) = 9
      BILL:Letter3 = DATE(SUB(B2:LETTER3,1,1),SUB(B2:LETTER3,3,2),SUB(B2:LETTER3,6,4))
    .
    IF LEN(CLIP(B2:LETTER4)) = 10
      BILL:Letter4 = DATE(SUB(B2:LETTER4,1,2),SUB(B2:LETTER4,4,2),SUB(B2:LETTER4,7,4))
    ELSIF LEN(CLIP(B2:LETTER4)) = 9
      BILL:Letter4 = DATE(SUB(B2:LETTER4,1,1),SUB(B2:LETTER4,3,2),SUB(B2:LETTER4,6,4))
    .
    IF LEN(CLIP(B2:LETTER5)) = 10
      BILL:Letter5 = DATE(SUB(B2:LETTER5,1,2),SUB(B2:LETTER5,4,2),SUB(B2:LETTER5,7,4))
    ELSIF LEN(CLIP(B2:LETTER5)) = 9
      BILL:Letter5 = DATE(SUB(B2:LETTER5,1,1),SUB(B2:LETTER5,3,2),SUB(B2:LETTER5,6,4))
    .
    BILL:InsuranceBilled = DEFORMAT(b2:INSBILLED)
    BILL:InsurancePaid = DEFORMAT(B2:INSPAID)
    BILL:InsuranceAdj = DEFORMAT(B2:INSADJ)
    BILL:OtherAdj = DEFORMAT(B2:OTHERADJ)
    BILL:OutStanding = DEFORMAT(B2:OUTSTANDING)
    BILL:Attribute = 0
    BILL:Physician = B2:REFER
    BILL:PaymentPlan = B2:PAYMENTPLAN
    BILL:Comment = B2:COMMENTS 
    BILL:LastNamePatient = b2:LASTNAME
    BILL:FirstNamePatient = B2:FIRSTNAME
    BILL:SalutationPatient = B2:SALUTATION
    ADD(BILLING)
  
  
  
  
  
     
    NAM:Number = INVOICE#
    NAM:Name = CLIP(B2:SALUTATION ) & ' ' & CLIP(B2:FIRSTNAME) & ' ' & b2:LASTNAME
    NAM:Address1 = B2:ADDRESS1 
    NAM:Address2 = B2:ADDRESS2 
    NAM:City = B2:CITY 
    NAM:State = B2:STATE
    NAM:Postalcode = B2:ZIP
    ADD(NAMElIST)
    
    IF LEN(CLIP(B2:AMOUNT1)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE1,1,2),SUB(B2:PAYDATE1,4,2),SUB(B2:PAYDATE1,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT1)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    IF LEN(CLIP(B2:AMOUNT2)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE2,1,2),SUB(B2:PAYDATE2,4,2),SUB(B2:PAYDATE2,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT2)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    IF LEN(CLIP(B2:AMOUNT3)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE3,1,2),SUB(B2:PAYDATE3,4,2),SUB(B2:PAYDATE3,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT3)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    IF LEN(CLIP(B2:AMOUNT4)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE4,1,2),SUB(B2:PAYDATE4,4,2),SUB(B2:PAYDATE4,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT4)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT5)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE5,1,2),SUB(B2:PAYDATE5,4,2),SUB(B2:PAYDATE5,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT5)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT6)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE6,1,2),SUB(B2:PAYDATE6,4,2),SUB(B2:PAYDATE6,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT6)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT7)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE7,1,2),SUB(B2:PAYDATE7,4,2),SUB(B2:PAYDATE7,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT7)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT8)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE8,1,2),SUB(B2:PAYDATE8,4,2),SUB(B2:PAYDATE8,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT8)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT9)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE9,1,2),SUB(B2:PAYDATE9,4,2),SUB(B2:PAYDATE9,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT9)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT10)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE10,1,2),SUB(B2:PAYDATE10,4,2),SUB(B2:PAYDATE10,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT10)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT11)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE11,1,2),SUB(B2:PAYDATE11,4,2),SUB(B2:PAYDATE11,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT11)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
    IF LEN(CLIP(B2:AMOUNT12)) > 3
      Pay:Date = DATE(SUB(B2:PAYDATE12,1,2),SUB(B2:PAYDATE12,4,2),SUB(B2:PAYDATE12,7,2)) 
      Pay:Amount = DEFORMAT(B2:AMOUNT12)
      Pay:Invoice = INVOICE#
      ADD(PAYMENTS)
    .
    
  .
  stop(records(billing))
    
    
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
    Relate:NameList.Close
    Relate:Payments.Close
  END
  IF SELF.Opened
    INIMgr.Update('CONVERT',QuickWindow)                   ! Save window data to non-volatile store
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

