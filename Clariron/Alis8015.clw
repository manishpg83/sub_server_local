

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8015.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8001.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8038.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8040.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8050.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8055.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8077.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8078.INC'),ONCE        !Req'd for module callout resolution
                     END


mdlSelectNotes   BYTE,DIM(8)
!!! <summary>
!!! Generated from procedure template - Window
!!! Form Patient
!!! </summary>
UpdatePatient PROCEDURE (prmAction)

  INCLUDE('PRNPROP.CLW')


   ! if prmAction=1 then show verify button
locCheckValue        BYTE,DIM(8),OVER(BILl:ClientRequestCheckmarks)  ! ClientRequestCheckmarks STRING(8)
locPath              STRING(64)                            !
locClientID          STRING(16)                            !
locLoginFile         STRING(16)                            !
locFaxRequest        ULONG                                 !
locPhysician         STRING(40)                            !
locComment           STRING(88)                            !
CurrentTab           STRING(80)                            !
locAvailableIgE      SHORT                                 !
locAvailableIgE50    SHORT                                 !
locQNS               BYTE                                  !
locNeeded40          ULONG                                 !
locNeeded50          ULONG                                 !
locVolumeReceived    ULONG                                 !
locDays              LONG                                  !
locPatient           LONG                                  !
locSpanish           BYTE                                  !
locLanguage          STRING(8)                             !display English or Spanish
locDelay             LONG                                  !
locFileNamePDF       STRING(192)                           !
locOutputName        STRING(192)                           !
locTargetFileName    STRING(64)                            !
locFileName          STRING(64)                            !
locEncryptPDF        STRING(64)                            !
locEmail             STRING(180)                           !
locAttachments       STRING(64)                            !
locDisclaimer        STRING(2048)                          !
locLogo              STRING(6656)                          !
ActionMessage        CSTRING(40)                           !
locBody              STRING(512)                           !
locBodyS             STRING(512)                           !
locSubject           STRING(74)                            !
locSubjectS          STRING(74)                            !
locAddOnTakenBy      STRING(3)                             !
locAddOnOrderedBy    STRING(16)                            !
locAddOnOrderMethod  STRING(1)                             !
locAddOnDate         DATE                                  !
locExceptionStatus   LONG                                  !
locTestComplete      BYTE                                  !
locTestLogin         BYTE                                  !
locTestWorkpool      BYTE                                  !
locVolumeNeeded      ULONG                                 !
locClientName        STRING(20)                            !
locSerumRemaining    LONG                                  !
locSerumRemaining50  LONG                                  !
locViewOriginal      BYTE                                  !
EnhancedFocusManager EnhancedFocusClassType

SAV:Patient LIKE(PAT:Record)


Login FILE,DRIVER('ASCII'),PRE(LI),NAME(gloFileName2)
          RECORD
Data    STRING(64)
        . .

AddOnWindow WINDOW('Add On'),AT(,,395,224),FONT('Arial',11,,FONT:regular),CENTER,GRAY,MDI
       STRING('Add On'),AT(48,16,68,17),USE(?AOString4),TRN,FONT(,14,,FONT:bold)
       STRING('Taken By'),AT(112,36),USE(?AOString1),TRN,FONT(,,,FONT:bold)
       ENTRY(@s3),AT(152,36,31,10),USE(locAddOnTakenBy),UPR
       STRING('Ordered By'),AT(106,52),USE(?String2),TRN,FONT(,,,FONT:bold)
       ENTRY(@s16),AT(152,52,68,10),USE(locAddOnOrderedBy),CAP
       SPIN(@D2),AT(152,68,117,16),USE(locAddOnDate),HVSCROLL,RIGHT(2),FONT(,12,,)
       STRING('Run Date'),AT(112,72),USE(?String3),TRN,FONT(,,,FONT:bold)
       OPTION('Order Method'),AT(152,92,79,81),USE(locAddOnOrderMethod),BOXED,TRN,FONT(,,,FONT:bold)
         RADIO('eMail'),AT(162,110),USE(?locAddOnOrderMethod:Radio1),TRN,VALUE('E')
         RADIO('Postal'),AT(162,122),USE(?locAddOnOrderMethod:Radio2),TRN,VALUE('P')
         RADIO('Telephone'),AT(162,134),USE(?locAddOnOrderMethod:Radio3),TRN,VALUE('T')
         RADIO('Fax'),AT(162,148,27,8),USE(?locAddOnOrderMethod:Radio4),TRN,VALUE('F')
       END
       BUTTON('&Cancel'),AT(304,128,70,25),USE(?AOCancel),TRN,LEFT,FONT(,,,FONT:bold),ICON(ICON:Cross)
       BUTTON('Create Add On'),AT(308,184,70,25),USE(?AOk),TRN,LEFT,FONT(,,,FONT:bold),ICON(ICON:Tick), |
           DEFAULT
       IMAGE('button.jpg'),AT(308,184,70,25),USE(?Image2)
       IMAGE('button.jpg'),AT(304,128,70,25),USE(?Image1)
     END
History::Pat:Record  LIKE(Pat:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),GRAY,MDI,HLP('UpdatePatient'),TIMER(500)
                       PROMPT('Patient Last name:'),AT(13,78),USE(?Pat:LAST:Prompt),FONT(,,,FONT:bold),TRN
                       PROMPT('Patient First Name:'),AT(11,89),USE(?Pat:FIRST:Prompt),FONT(,,,FONT:bold),TRN
                       SHEET,AT(0,0,507,330),USE(?CurrentTab),FONT(,,,FONT:regular),SPREAD
                         TAB('Patient'),USE(?Tab:Patient)
                           STRING('Client Name:'),AT(31,12),USE(?String16),FONT(,,,FONT:bold),TRN
                           STRING(@s40),AT(80,12,218,11),USE(locClientName),FONT(,12,00C00000h,FONT:bold),TRN
                           ENTRY(@s2),AT(80,67,41,10),USE(Pat:VERIFIED_BY),UPR,FLAT
                           ENTRY(@d2b),AT(80,100,48,10),USE(Pat:DATE),LEFT(1),FLAT
                           ENTRY(@d2b),AT(224,72,55,10),USE(Pat:COLLECTION),RIGHT(1),FLAT
                           ENTRY(@s15),AT(224,84,55,10),USE(Pat:CLIENT_ID),FLAT
                           ENTRY(@d2b),AT(83,112,42,10),USE(Pat:BILLED),RIGHT(1),FLAT
                           OPTION('Specimen Type'),AT(132,100,71,29),USE(Pat:SpecimenType),BOXED,TRN
                             RADIO('Serum'),AT(136,108,60,9),USE(?OPTION1:RADIO3),FONT(,10,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('1')
                             RADIO('Finger Stick'),AT(136,119,60,9),USE(?PAT:SPECIMENTYPE:RADIO1),FONT(,10,,FONT:bold), |
  ICON(ICON:None),TRN,VALUE('2')
                           END
                           OPTION('Billing'),AT(362,35,128,74),USE(Pat:BILLING),FONT(,,,FONT:bold),DISABLE,TRN
                             RADIO('Client'),AT(374,42,53,12),USE(?Pat:BILLING:Radio1),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('C')
                             RADIO('Patient'),AT(428,42,53,12),USE(?Pat:BILLING:Radio2),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('P')
                             RADIO('Insurance'),AT(374,67,53,12),USE(?Pat:BILLING:Insurance),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('I')
                             RADIO('Medicaid'),AT(428,54,53,12),USE(?Pat:BILLING:Medicaid),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('A')
                             RADIO('Medicare'),AT(374,54,53,12),USE(?PAT:Billing:Medicare),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('M')
                             RADIO('No Chrg/Eval'),AT(427,67,53,12),USE(?Pat:BILLING:Eval),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('E')
                           END
                           ENTRY(@s88),AT(30,194,309,13),USE(locComment),FONT(,10),FLAT
                           ENTRY(@s127),AT(30,208,309,13),USE(gloPatientNotes[2]),FONT(,10),FLAT
                           TEXT,AT(30,230,308,28),USE(Pat:InHouseComments),FONT(,10),FLAT
                           STRING('Serum Remaining'),AT(368,216,78,11),USE(?String18),FONT(,,COLOR:White,FONT:bold),RIGHT, |
  TRN
                           STRING('Remaining 50uL'),AT(368,238,78,11),USE(?String22),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT,TRN
                           STRING(@n-7),AT(452,238,34,10),USE(locSerumRemaining50),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  RIGHT(2),COLOR(COLOR:White),TRN
                           STRING('IgE Tests Available (50uL)'),AT(372,249,78,11),USE(?String24:2),FONT(,,COLOR:White, |
  FONT:bold,CHARSET:ANSI),RIGHT,TRN
                           STRING(@n-7),AT(452,249,34,10),USE(locAvailableIgE50),FONT(,,COLOR:Black,,CHARSET:ANSI),RIGHT(2), |
  COLOR(COLOR:White),TRN
                           STRING(@n-7),AT(452,216,34,10),USE(locSerumRemaining),FONT(,,COLOR:Black,,CHARSET:ANSI),RIGHT(2), |
  COLOR(COLOR:White),TRN
                           STRING(@s128),AT(28,309,210,10),USE(gloPDFPrinter),FONT(,8,,FONT:bold),LEFT,HIDE,TRN
                           STRING('Volume'),AT(376,116,49,10),USE(?String9),FONT(,,COLOR:Aqua,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                           PANEL,AT(362,110,128,155),USE(?Panel5),BEVEL(-1,-1)
                           OPTION('STATUS'),AT(106,134,12,32),USE(Pat:STATUS),FONT(,,,FONT:bold),TRN
                             RADIO('Login'),AT(110,142,51,10),USE(?Pat:STATUS:Radio1),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Yellow),ICON(ICON:None),TRN,VALUE('L')
                             RADIO('Workpool'),AT(218,142,51,10),USE(?Pat:STATUS:Radio2),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('W')
                             RADIO('Send Out'),AT(218,154,51,10),USE(?Pat:STATUS:Radio6),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('I')
                             RADIO('Complete'),AT(272,142,51,10),USE(?Pat:STATUS:Radio3),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:White),ICON(ICON:None),SCROLL,TRN,VALUE('C')
                             RADIO('Void'),AT(272,154,51,10),USE(?Pat:STATUS:RadioX),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:White),ICON(ICON:None),SCROLL,TRN,VALUE('X')
                             RADIO('Verified'),AT(164,142,51,10),USE(?Pat:STATUS:RadioV),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Blue),ICON(ICON:None),TRN,VALUE('V')
                             RADIO('QNS'),AT(110,154,51,10),USE(?Pat:STATUS:Radio4),FONT(,,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Aqua), |
  ICON(ICON:None),TRN,VALUE('Q')
                             RADIO('Held'),AT(164,154,51,10),USE(?Pat:STATUS:Radio5),FONT(,,COLOR:Black,,CHARSET:ANSI), |
  COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('H')
                           END
                           PANEL,AT(220,112,120,19),USE(?Panel4),BEVEL(-1,-1)
                           PANEL,AT(74,132,255,42),USE(?Panel2),BEVEL(-1,-1)
                           ENTRY(@n-8.1),AT(452,112,34,10),USE(Pat:VOLUME1),DECIMAL(8),FLAT
                           ENTRY(@n-8.1),AT(452,124,34,10),USE(Pat:VOLUME2),DECIMAL(8),FLAT
                           ENTRY(@n-8.1),AT(452,136,34,10),USE(Pat:Volume3),DECIMAL(8),FLAT
                           ENTRY(@n-8.1),AT(452,148,34,10),USE(Pat:Volume4),DECIMAL(8),FLAT
                           BUTTON('Serum Label 2'),AT(368,158,66,14),USE(?ButtonPrintSerumLabel:2),FONT(,,,FONT:bold), |
  ICON(ICON:None),TRN
                           BUTTON('Serum Label 1'),AT(368,143,66,14),USE(?ButtonPrintSerumLabel),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN
                           ENTRY(@n-8.1),AT(452,160,34,10),USE(Pat:Volume5),DECIMAL(8),FLAT
                           ENTRY(@n6),AT(452,172,34,10),USE(locVolumeReceived),RIGHT(2),FLAT,READONLY
                           ENTRY(@n13),AT(452,183,34,10),USE(locVolumeNeeded),RIGHT(2),FLAT,READONLY
                           STRING(@s8),AT(22,158,38,11),USE(locLanguage),FONT(,,,FONT:bold),CENTER,TRN
                           BUTTON('View PDF'),AT(24,265,70,25),USE(?ViewPDF),FONT(,,,FONT:bold),LEFT,ICON('EXP_PDF.ICO'), |
  TRN
                           BUTTON('Email PDF'),AT(96,265,70,25),USE(?eMailPDF),FONT(,,,FONT:bold),LEFT,ICON('SteelEmail.ico'), |
  TRN
                           BUTTON('Encrypt PDF'),AT(168,265,70,25),USE(?Encrypt),FONT(,,,FONT:bold),LEFT,ICON('SteelLock.ico'), |
  TRN
                           BUTTON('Fax Results'),AT(240,265,75,25),USE(?FaxPDFButton),FONT(,,,FONT:bold),LEFT,ICON('SteelFax.ico'), |
  TRN
                           BUTTON('View Tests'),AT(322,265,70,25),USE(?ViewTestsButton),FONT(,,,FONT:bold),LEFT,ICON('SteelView.ico'), |
  TRN
                           BUTTON('Add On'),AT(241,288,75,25),USE(?AddOn),FONT(,,,FONT:bold),LEFT,ICON('SteelAddOn.ico'), |
  DISABLE,TRN
                           OPTION('Signature'),AT(0,314,180,15),USE(Pat:SIGNATURE),BOXED,HIDE,TRN
                             RADIO('Needed'),AT(78,322,50,4),USE(?Option5:Radio3),ICON(ICON:None),TRN,VALUE('N')
                             RADIO('Requested'),AT(132,320,49,6),USE(?Option5:Radio4),ICON(ICON:None),TRN
                             RADIO('Received'),AT(26,322,49,4),USE(?Option5:Radio5),ICON(ICON:None),TRN,VALUE('R')
                           END
                           BUTTON('Sig. Request'),AT(4,318,35,9),USE(?PrintSignatureRequest),FONT(,,,FONT:bold),LEFT, |
  ICON('EXP_DOTM.ico'),HIDE
                           CHECK('Original'),AT(132,290),USE(locViewOriginal),HIDE,TRN,VALUE('1','0')
                           BUTTON('Save and Exit'),AT(184,314,75,11),USE(?SaveExit),HIDE
                           IMAGE('button.jpg'),AT(362,110,128,155),USE(?Image23)
                           IMAGE('button.jpg'),AT(361,16,128,94),USE(?Image22)
                           IMAGE('button.jpg'),AT(221,112,136,19),USE(?Image21)
                           IMAGE('button.jpg'),AT(280,74,53,39),USE(?Image20)
                           IMAGE('button.jpg'),AT(74,132,255,42),USE(?Image19)
                           IMAGE('button.jpg'),AT(240,265,75,25),USE(?Image16)
                           IMAGE('button.jpg'),AT(168,265,70,25),USE(?Image15)
                           IMAGE('button.jpg'),AT(96,265,70,25),USE(?Image14)
                           IMAGE('button.jpg'),AT(24,265,70,25),USE(?Image13)
                           IMAGE('button.jpg'),AT(421,265,70,25),USE(?Image12)
                           IMAGE('button.jpg'),AT(322,265,70,25),USE(?Image11)
                           IMAGE('button.jpg'),AT(241,290,75,25),USE(?Image10)
                           IMAGE('Button.jpg'),AT(420,290,70,25),USE(?Image9)
                           IMAGE('Button.jpg'),AT(24,285,70,25),USE(?Image99)
                           STRING(@s192),AT(28,310,213,9),USE(locFileNamePDF),FONT(,8,,FONT:bold,CHARSET:ANSI),TRN
                           STRING(@n6),AT(452,194,34,10),USE(locNeeded50),FONT(,,COLOR:Black,,CHARSET:ANSI),RIGHT(2), |
  COLOR(COLOR:Aqua),HIDE,TRN
                           STRING(@n6),AT(452,205,34,10),USE(locNeeded40),FONT(,,COLOR:Black,,CHARSET:ANSI),RIGHT(2), |
  COLOR(COLOR:Aqua),HIDE,TRN
                           STRING('Needed (40uL)'),AT(368,205,78,11),USE(?String40),FONT(,,,FONT:bold),RIGHT,TRN
                           STRING('Needed (50uL)'),AT(368,194,78,11),USE(?String50),FONT(,,,FONT:bold),RIGHT,TRN
                           TEXT,AT(128,30,231,40),USE(CLI:FOLLOW1),FONT(,10,COLOR:Red,FONT:bold,CHARSET:ANSI),BOXED,FLAT, |
  READONLY
                           STRING('Status'),AT(78,134),USE(?String4),FONT(,,COLOR:Aqua,FONT:bold),TRN
                           PROMPT('3'),AT(444,136),USE(?Prompt17),FONT(,,,FONT:bold),TRN
                           PROMPT('Entered By:'),AT(38,56),USE(?Pat:ENTERED_BY:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Date logged In:'),AT(26,100),USE(?Pat:DATE:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Verified By:'),AT(39,67),USE(?Pat:VERIFIED_BY:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Collection Date:'),AT(167,71),USE(?Pat:COLLECTION:Prompt),FONT(,,,FONT:bold),TRN
                           STRING('Billing'),AT(394,20,31,10),USE(?String8),FONT(,,COLOR:Aqua,FONT:bold),TRN
                           BUTTON('Print Notice'),AT(428,18,53,12),USE(?printCreditCArdNotice),FONT(,,,FONT:bold),TRN
                           CHECK('Credit Card'),AT(374,30,107,12),USE(Pat:CreditCard),FONT(,,COLOR:Black,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),HIDE,TRN,VALUE('1','0')
                           PROMPT('Billed On:'),AT(52,112,24),USE(?Pat:BILLED:Prompt),FONT(,,,FONT:bold),TRN
                           BUTTON('Patient Label'),AT(368,128,66,14),USE(?ButtonPrintLabel),FONT(,,,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN
                           PROMPT('Client ID:'),AT(191,84),USE(?Pat:CLIENT_ID:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('4'),AT(444,148),USE(?Prompt18),FONT(,,,FONT:bold),TRN
                           PROMPT('5'),AT(444,160),USE(?Prompt19),FONT(,,,FONT:bold),TRN
                           STRING('Comments'),AT(30,186),USE(?String1),FONT(,,,FONT:bold),TRN
                           BUTTON('Physicians'),AT(214,177,70,14),USE(?ButtonPhysicians),FONT(,,,FONT:bold),TRN
                           CHECK('Ammended'),AT(272,154,51,10),USE(Pat:AmendedReport),FONT(,,,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),HIDE,TRN,VALUE('Y','N')
                           PROMPT('1'),AT(444,112),USE(?Pat:VOLUME1:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('2'),AT(444,124),USE(?Pat:VOLUME2:Prompt),FONT(,,,FONT:bold),TRN
                           STRING('Inhouse Comments'),AT(30,222),USE(?String1:2),FONT(,,,FONT:bold),TRN
                           STRING(@n-7),AT(452,227,34,10),USE(locAvailableIgE),FONT(,,COLOR:Black,,CHARSET:ANSI),RIGHT(2), |
  COLOR(COLOR:White),TRN
                           STRING('IgE Tests Available'),AT(368,227,78,11),USE(?String24),FONT(,,COLOR:White,FONT:bold, |
  CHARSET:ANSI),RIGHT,TRN
                           PROMPT('Total Received: '),AT(368,174,78,11),USE(?Pat:VOLUME:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                           PROMPT('Needed (60uL)'),AT(368,184,78,11),USE(?Pat:NEEDED:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                           BUTTON('Auto Password'),AT(246,316,70,13),USE(?AutoPassword),HIDE
                           IMAGE('button.jpg'),AT(163,296,75,13),USE(?Image25),HIDE
                           STRING(@s128),AT(28,312,271,9),USE(gloResultsPrinter),FONT(,8,,FONT:bold),RIGHT,TRN
                           BUTTON('Fax Printer'),AT(163,296,75,13),USE(?PrinterSelect),FONT(,,,FONT:bold),HIDE,TRN
                           IMAGE('button.jpg'),AT(214,177,70,14),USE(?Image24)
                           IMAGE('red.bmp'),AT(20,60),USE(?LED:UnVerified),CENTERED,HIDE
                           IMAGE('yellow.bmp'),AT(110,134,51,6),USE(?LED:Login),HIDE
                           IMAGE('blue.bmp'),AT(164,134,51,6),USE(?LED:Verified),HIDE
                           IMAGE('red.bmp'),AT(274,104),USE(?LED:Age),CENTERED
                           IMAGE('red.bmp'),AT(376,20,13,8),USE(?LED:Billing),CENTERED,HIDE
                           IMAGE('lime.bmp'),AT(218,134,51,6),USE(?LED:Workpooled),HIDE
                           IMAGE('aqua.bmp'),AT(110,166,51,6),USE(?LED:QNS),HIDE
                           IMAGE('red.bmp'),AT(164,166,162,4),USE(?LED:Held),HIDE
                           IMAGE('en.gif'),AT(18,132),USE(?englishImage),HIDE
                           IMAGE('mx.gif'),AT(18,132,48,24),USE(?mexImage),HIDE
                           BUTTON('Create Void PDF'),AT(290,173,69,21),USE(?ButtonPrintVoid),FONT(,,,FONT:bold),HIDE
                           BUTTON('Verify'),AT(24,290,70,25),USE(?Verify),FONT(,,,FONT:bold),TRN
                           ENTRY(@s40),AT(76,178,134),USE(locPhysician)
                           IMAGE('button.jpg'),AT(322,290,70,25),USE(?Image10:2)
                           CHECK('HL7'),AT(368,90,66),USE(Pat:HL7),COLOR(COLOR:Lime),ICON(ICON:None),DISABLE,HIDE,VALUE('1', |
  '0'),TRN
                           BUTTON('Get HL7'),AT(324,317),USE(?BUTTON_GetHL7),HIDE
                           BUTTON('Make && Upload HL7'),AT(95,290,75,25),USE(?ButtonHL7),HIDE
                           STRING(@s32),AT(79,21,42),USE(CLM:OrderNumber),RIGHT,TRN
                           STRING(@s15),AT(224,95,55),USE(CLM:Barcode),LEFT,TRN
                         END
                         TAB('Billing'),USE(?Tab:Billing)
                           ENTRY(@s3),AT(80,56,41,10),USE(BILL:VerifiedBy),UPR,FLAT
                           ENTRY(@s3),AT(80,66,41,10),USE(BILL:VerifiedBy2),UPR,FLAT
                           ENTRY(@s32),AT(80,117,139,11),USE(BILL:AddressPatient)
                           ENTRY(@s32),AT(80,131),USE(BILL:Address2Patient)
                           ENTRY(@s20),AT(80,146,92,10),USE(BILL:CityPatient)
                           PROMPT('City St Zip:'),AT(11,148,68),USE(?BILL:StatePatient:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                           ENTRY(@s2),AT(186,146,25,10),USE(BILL:StatePatient)
                           ENTRY(@s10),AT(224,146,60,10),USE(BILL:PostalPatient)
                           PROMPT('Email:'),AT(24,162,55),USE(?BILL:EmailPatient:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                           ENTRY(@s64),AT(80,160,244,12),USE(BILL:emailPatient,,?BILL:emailPatient:2)
                           PROMPT('Phone:'),AT(24,176,55),USE(?BILL:PhonePatient:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                           ENTRY(@P(###) ###-####P),AT(80,180,60,10),USE(BILL:PhonePatient),RIGHT(2)
                           PROMPT('Phone Alt:'),AT(24,190,55),USE(?BILL:PhoneAltPatient:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                           ENTRY(@P(###) ###-####P),AT(80,189,60,10),USE(BILL:PhoneAltPatient),FONT(,,,FONT:regular), |
  RIGHT(2)
                           ENTRY(@s32),AT(80,204),USE(CLM:Physician)
                           ENTRY(@s64),AT(80,234),USE(CLM:PlanName)
                           STRING('Plan Name'),AT(41,235),USE(?STRINGplanname),FONT(,,,FONT:bold),TRN
                           BUTTON('...'),AT(228,233,22,10),USE(?ButtonSelectPayer),FONT(,,,FONT:bold)
                           ENTRY(@s32),AT(80,247),USE(CLM:PlanID)
                           STRING('Payer ID'),AT(41,250,38),USE(?STRINGplanid),FONT(,,,FONT:bold),RIGHT,TRN
                           STRING('Diag Codes'),AT(37,279),USE(?STRINGdiagcodes),FONT(,,,FONT:bold),TRN
                           ENTRY(@s32),AT(80,260),USE(CLM:MemberID),FONT(,,,FONT:regular)
                           STRING('Member ID'),AT(40,263),USE(?STRING10),FONT(,,,FONT:bold),TRN
                           ENTRY(@s32),AT(80,217),USE(CLM:NPI)
                           STRING('NPI'),AT(62,220,17,10),USE(?STRINGnpi),FONT(,,,FONT:bold),RIGHT,TRN
                           ENTRY(@s32),AT(80,277),USE(CLM:DiagCode1)
                           ENTRY(@s32),AT(80,290),USE(CLM:DiagCode2)
                           ENTRY(@s32),AT(329,221),USE(CLM:PlanID2)
                           ENTRY(@s64),AT(329,208),USE(CLM:PlanName2)
                           ENTRY(@s32),AT(329,234),USE(CLM:MemberID2),FONT(,,,FONT:regular)
                           OPTION,AT(328,183,132,26),USE(CLM:PlanType),BOXED,TRN
                             RADIO('Primary'),AT(338,193),USE(?OPTION1:RADIO1),VALUE('P'),TRN
                             RADIO('Secondary'),AT(394,193),USE(?CLM:PLANTYPE:RADIO1),VALUE('S'),TRN
                           END
                           ENTRY(@s32),AT(80,303,145),USE(CLM:DiagCode3)
                           BUTTON('...'),AT(484,239,22,10),USE(?ButtonSelectPayer:2),FONT(,,,FONT:bold)
                           CHECK('Employment'),AT(196,61,69),USE(BILL:ConditionRelatedTo[1],,?BILL:ConditionRelatedTo:2), |
  HIDE,VALUE('Y','N'),TRN
                           CHECK('Auto Accident'),AT(196,70,69),USE(BILL:ConditionRelatedTo[2]),HIDE,VALUE('Y','N'),TRN
                           CHECK('Other Accident'),AT(196,80),USE(BILL:ConditionRelatedTo[3]),HIDE,VALUE('Y','N'),TRN
                           STRING('Physician'),AT(45,204),USE(?STRING23),FONT(,,,FONT:bold),RIGHT,TRN
                           PROMPT('Address:'),AT(37,118,42),USE(?PROMPT1),FONT(,,,FONT:bold),RIGHT,TRN
                           PROMPT('PO Box / Apt.#:'),AT(26,133),USE(?PROMPT2),FONT(,,,FONT:bold),TRN
                           STRING('Numeric Only'),AT(143,180),USE(?STRING8:2),FONT(,,COLOR:Red,FONT:bold),TRN
                           STRING('Numeric Only'),AT(143,189,48,10),USE(?STRING29),FONT(,,COLOR:Red,FONT:bold),TRN
                           PANEL,AT(352,30,148,143),USE(?PANEL1),BEVEL(1)
                           CHECK('Patient Gender'),AT(360,53,128,10),USE(locCheckValue[6]),TRN,VALUE('32','0')
                           CHECK('Date of Birth'),AT(360,40,128,10),USE(locCheckValue[7]),TRN,VALUE('64','0')
                           CHECK('Patient Address'),AT(361,66,128),USE(locCheckValue[1]),TRN,VALUE('1','0')
                           CHECK('Insurance Card'),AT(361,112,128),USE(locCheckValue[2]),TRN,VALUE('2','0')
                           CHECK('ICD-10 Dianostic Code(s)'),AT(361,97,128),USE(locCheckValue[3]),TRN,VALUE('4','0')
                           CHECK('Referring/Requesting Physician'),AT(361,81,128),USE(locCheckValue[4]),TRN,VALUE('8', |
  '0')
                           CHECK('Office Notes'),AT(360,128,128),USE(locCheckValue[5]),TRN,VALUE('16','0')
                           BUTTON('Fax Request'),AT(361,148),USE(?ButtonFaxRequest)
                           BUTTON('Export Insurance'),AT(2,312,73),USE(?ExportInsurance),HIDE
                           BUTTON('Import Payers'),AT(228,316),USE(?BUTTON1),HIDE
                           BUTTON('Web'),AT(228,216,22,10),USE(?ButtonLookupNPI),FONT(,,,FONT:bold)
                           STRING('Billing Entered By: '),AT(10,56),USE(?STRING2),FONT(,,,FONT:bold),TRN
                           STRING('Billing Verified By: '),AT(10,67),USE(?STRING3),FONT(,,,FONT:bold),TRN
                           BUTTON('...'),AT(228,204,22,10),USE(?BUTTON2),FONT(,,,FONT:bold)
                           ENTRY(@d17),AT(438,133),USE(BILL:DateFax1)
                           ENTRY(@d17),AT(438,149),USE(BILL:DateFax2)
                           PROMPT('Guarantor: '),AT(38,104),USE(?GuarantorPrompt),FONT(,,,FONT:bold),TRN
                           ENTRY(@s32),AT(82,103,113,11),USE(BILL:GuarantorName),FONT(,11)
                           BUTTON('Send Label Code'),AT(4,296),USE(?ButtonLabelCode),HIDE
                           OPTION('Vax Brand'),AT(244,260,167,30),USE(BILL:Vacination),BOXED,TRN
                             RADIO('Pfizer'),AT(250,269,39),USE(?Vax:Pfizer),VALUE('1'),TRN
                             RADIO('Moderna'),AT(250,280,39,10),USE(?Vax:Moderna),VALUE('2'),TRN
                             RADIO('Johnson & Johnson'),AT(292,269,83,10),USE(?Vax:Johnson),VALUE('4'),TRN
                             RADIO('Astrazeneca'),AT(292,280,54,10),USE(?Vax:Astrazeneca),VALUE('3'),TRN
                             RADIO('Not Given'),AT(363,280,48,10),USE(?Vax:NotGiven),VALUE('0'),TRN
                           END
                           STRING('Billing ID:'),AT(36,24,42,8),USE(?StringBillingID),FONT(,,,FONT:bold,CHARSET:DEFAULT), |
  RIGHT,HIDE,TRN
                           ENTRY(@s12),AT(80,24,66,9),USE(CLM:ClientBillingID),LEFT,HIDE
                           STRING('Barcode:'),AT(124,34,30,11),USE(?StringBarcode),RIGHT,TRN
                           STRING(@s32),AT(157,34,78),USE(CLM:Barcode,,?CLM:Barcode:2),TRN
                         END
                       END
                       STRING('Number:'),AT(48,36),USE(?String6),FONT(,,,FONT:bold),TRN
                       ENTRY(@n_6),AT(80,34,41,10),USE(Pat:INVOICE),FONT(,10,,FONT:bold,CHARSET:ANSI),RIGHT(1),FLAT, |
  READONLY,SKIP
                       PROMPT('Client:'),AT(55,45),USE(?Pat:CLIENT:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n_6),AT(80,45,41,10),USE(Pat:CLIENT),RIGHT(1),FLAT,SKIP
                       ENTRY(@s20),AT(80,77,84,10),USE(Pat:LAST),FLAT
                       ENTRY(@s15),AT(80,89,84,10),USE(Pat:FIRST),FLAT
                       PROMPT('DOB:'),AT(198,103,26,10),USE(?Pat:DOB:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@D2B),AT(224,103,49,10),USE(Pat:DOB),LEFT(1),FLAT
                       PROMPT('Age'),AT(220,116,27,10),USE(?Pat:AGE:Prompt),FONT(,,COLOR:Blue,FONT:bold),RIGHT,TRN
                       OPTION('AGE_TYPE'),AT(256,118,84,10),USE(Pat:AGE_TYPE),FONT(,,,FONT:bold)
                         RADIO('Years'),AT(272,116,35),USE(?AgeType:Years),FONT(,,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('Y')
                         RADIO('Months'),AT(305,116,35),USE(?AgeType:Months),FONT(,,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('M')
                       END
                       ENTRY(@n3),AT(248,116,17,10),USE(Pat:AGE),RIGHT(1),FLAT
                       ENTRY(@s2),AT(80,56,41,10),USE(Pat:ENTERED_BY),UPR,FLAT,SKIP
                       PANEL,AT(280,74,53,39),USE(?Panel3),BEVEL(-1,-1)
                       STRING('Sex'),AT(282,72,53,10),USE(?String7),FONT(,,COLOR:Aqua,FONT:bold),CENTER,TRN
                       OPTION('SEX'),AT(286,82,45,25),USE(Pat:SEX),FONT(,,,FONT:bold)
                         RADIO('Male'),AT(286,82,43,10),USE(?PAT:Sex:Male),FONT(,,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('M')
                         RADIO('Female'),AT(286,94,43,10),USE(?PAT:Sex:Female),FONT(,,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('F')
                       END
                       BUTTON('Request Form'),AT(322,291,70,25),USE(?ButtonRequestForm),LEFT,ICON('EXP_PDF.ICO'), |
  LAYOUT(0),TRN
                       BUTTON('&Cancel'),AT(421,265,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&OK'),AT(420,290,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'),DEFAULT, |
  DISABLE,MSG('Accept data and close the window'),TIP('Accept data and close the window'), |
  TRN
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
InsertAction           PROCEDURE(),BYTE,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
CheckDiagCode ROUTINE
  DC:code = 'xyz'
  CASE FIELD()
  OF ?CLM:DiagCode1  
    DC:Code = CLM:DiagCode1
  OF ?CLM:DiagCode2
    DC:Code = CLM:DiagCode2
  OF ?CLM:DiagCode3
    DC:Code = CLM:DiagCode3
  .
  GET(DiagnosticCodes,DC:OrderKey)  
  IF ERRORCODE() 
    GlobalRequest = SelectRecord
    DiagCodesLookup 
  .



CheckBilling  ROUTINE
  locCheckValue[1] = 0
  locCheckValue[2] = 0
  locCheckValue[3] = 0
  locCheckValue[4] = 0
  locCheckValue[6] = 0
  locCheckValue[7] = 0
  IF ~BILL:AddressPatient AND ~BILL:Address2Patient THEN locCheckValue[1] = 1.   
  if Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A'
    IF ~CLM:Physician OR ~CLM:NPI THEN locCheckValue[4] = 8. 
    IF ~CLM:DiagCode1 THEN locCheckValue[3] = 4.   
    IF ~CLM:PlanID OR ~CLM:PlanName OR ~CLM:MemberID THEN locCheckValue[2] = 2.   
    IF ~pat:DOB  THEN locCheckValue[7] = 64.   
    IF ~pat:sex  THEN locCheckValue[6] = 32. 
  .
  DISPLAY()
LED ROUTINE
  IF 0{PROP:AcceptAll} THEN EXIT.
  HIDE(?LED:UnVerified,?LED:Held)
  IF BAND(exceptions#,EX:Age)
    UNHIDE(?LED:Age)
  .

  IF Pat:BILLING = 'C' OR Pat:BILLING = 'P'
    UNHIDE(?Pat:CreditCard)
    DISPLAY(?Pat:CreditCard)
    IF locSpanish AND Pat:CreditCard
      UNHIDE(?PrintCreditCardNotice)
    ELSE
      HIDE(?PrintCreditCardNotice)
    .
  ELSE
    Pat:CreditCard = 0
    HIDE(?Pat:CreditCard)
    HIDE(?PrintCreditCardNotice)
  .
  IF ~Pat:BILLING
    UNHIDE(?LED:Billing)
  .
  CASE Pat:STATUS
  OF 'W'
    UNHIDE(?LED:Workpooled)
  OF 'V'
    UNHIDE(?LED:Verified)
  OF 'L'
    UNHIDE(?LED:Login)
  OF 'Q'
    UNHIDE(?LED:QNS)
  OF 'C'
  OF 'H'
  OROF 'I'
    UNHIDE(?LED:Held)
  ELSE
    UNHIDE(?LED:Held)
  .
  DISPLAY()


CheckStatus   ROUTINE

  IF 0{PROP:AcceptAll} THEN EXIT.
  IF Pat:STATUS = 'X' OR Pat:CLIENT = 666666
    0{PROP:Wallpaper} = ''
    UNHIDE(?LED:Held)
    HIDE(?Image23,?Image9)
    UNHIDE(?ButtonPrintVoid)
    Pat:STATUS = 'X'
    DISPLAY(?Pat:STATUS)
    EXIT
  ELSE
    0{PROP:Wallpaper} = gloWallpaper
    UNHIDE(?Image23,?Image9)
    HIDE(?ButtonPrintVoid)
  .
  
  locExceptionStatus = SetPatientStatus(PAT:Invoice)
  locVolumeNeeded = 0
  locNeeded50 = 0
  locNeeded40 = 0
  Pat:VOLUME = Pat:VOLUME1 + Pat:VOLUME2 + Pat:Volume3 + Pat:Volume4 + Pat:Volume5
  HIDE(?locNeeded50,?locNeeded40)
  locQNS = CheckQNS(Pat:INVOICE)
  CLOSE(Test)
  locVolumeNeeded = MON:Needed[1]
  Pat:VOLUME = Pat:VOLUME1 + Pat:VOLUME2 + Pat:Volume3 + Pat:Volume4 + Pat:Volume5
  locVolumeReceived = Pat:VOLUME * 1000
  locSerumRemaining = locVolumeReceived - locVolumeNeeded
  IF locSerumRemaining < 0
    ?locSerumRemaining{PROP:Color,1} = COLOR:Red
    ?locSerumRemaining{PROP:Font,3} = COLOR:White
  ELSE
    ?locSerumRemaining{PROP:Color,1} = COLOR:White
    ?locSerumRemaining{PROP:Font,3} = COLOR:Black
  .
  locNeeded50 = MON:Needed[2]
 
 locNeeded40 = MON:Needed[3]
  locSerumRemaining50 = locVolumeReceived - locNeeded50
  locAvailableIgE = locSerumRemaining / 60
  locAvailableIgE50 = locSerumRemaining / 50
  IF locSerumRemaining50 < 0
    ?locSerumRemaining50{PROP:Color,1} = COLOR:Red
    ?locSerumRemaining50{PROP:Font,3} = COLOR:White
  ELSE
    ?locSerumRemaining50{PROP:Color,1} = COLOR:White
    ?locSerumRemaining50{PROP:Font,3} = COLOR:Black
  .
  IF BAND(locQNS,7)
    PAT:Status = 'Q'
    ?locVolumeNeeded{PROP:Color,1} = COLOR:Aqua
    IF BAND(locQNS,2)
      ?locNeeded50{PROP:Color,1} = COLOR:Aqua
    ELSE
      ?locNeeded50{PROP:Color,1} = COLOR:Lime
    .
    IF BAND(locQNS,4)
      ?locNeeded40{PROP:Color,1} = COLOR:Aqua
    ELSE
      ?locNeeded40{PROP:Color,1} = COLOR:Lime
    .
    UNHIDE(?String40,?String50)
    UNHIDE(?locNeeded50,?locNeeded40)
  ELSE
    HIDE(?locNeeded50,?locNeeded40)
    HIDE(?String40,?String50)
    ?locVolumeNeeded{PROP:Color,1} = COLOR:Lime
  .

  DO LED



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


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.ChangeAction()
  OL:Date = TODAY()
  OL:Time = CLOCK()
  OL:Number = Pat:INVOICE
  OL:PCAE = ONLINE:Patient + ONLINE:Change
  ADD(Online)
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePatient')
   IF ~BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN RETURN(0).
   ALIAS()
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:LAST:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(Pat:Record,History::Pat:Record)
  SELF.AddHistoryField(?Pat:VERIFIED_BY,2)
  SELF.AddHistoryField(?Pat:DATE,7)
  SELF.AddHistoryField(?Pat:COLLECTION,16)
  SELF.AddHistoryField(?Pat:CLIENT_ID,17)
  SELF.AddHistoryField(?Pat:BILLED,21)
  SELF.AddHistoryField(?Pat:SpecimenType,29)
  SELF.AddHistoryField(?Pat:BILLING,19)
  SELF.AddHistoryField(?Pat:InHouseComments,40)
  SELF.AddHistoryField(?Pat:STATUS,8)
  SELF.AddHistoryField(?Pat:VOLUME1,22)
  SELF.AddHistoryField(?Pat:VOLUME2,23)
  SELF.AddHistoryField(?Pat:Volume3,24)
  SELF.AddHistoryField(?Pat:Volume4,25)
  SELF.AddHistoryField(?Pat:Volume5,26)
  SELF.AddHistoryField(?Pat:SIGNATURE,11)
  SELF.AddHistoryField(?Pat:CreditCard,20)
  SELF.AddHistoryField(?Pat:AmendedReport,41)
  SELF.AddHistoryField(?Pat:HL7,42)
  SELF.AddHistoryField(?Pat:INVOICE,6)
  SELF.AddHistoryField(?Pat:CLIENT,3)
  SELF.AddHistoryField(?Pat:LAST,4)
  SELF.AddHistoryField(?Pat:FIRST,5)
  SELF.AddHistoryField(?Pat:DOB,30)
  SELF.AddHistoryField(?Pat:AGE_TYPE,14)
  SELF.AddHistoryField(?Pat:AGE,13)
  SELF.AddHistoryField(?Pat:ENTERED_BY,1)
  SELF.AddHistoryField(?Pat:SEX,15)
  SELF.AddUpdateFile(Access:Patient)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Billing.SetOpenRelated()   
  Relate:Billing.Open                                      ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Claims.Open                                       ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:DiagnosticCodes.Open                              ! File DiagnosticCodes used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:RequestForms.Open                                 ! File RequestForms used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Patient
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  
  CLM:Patient = Pat:INVOICE
  GET(Claims,CLM:OrderKey)
  IF ERRORCODE()
    IF ERRORCODE() =  35 
      CLEAR(CLM:Record)
      CLM:Patient = Pat:INVOICE
      CLM:PlanType = 'P'
      ADD(Claims) 
      IF ERRORCODE()
        STOP('ADD CLM: ' & ERROR())
      .
    ELSE
      STOP('GET CLM: ' & ERROR())
    .
  .   
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  BILL:Accession = Pat:Invoice
  GET(Billing,BILL:patKey) 
  IF  ERRORCODE() = 35
    CLEAR(BILLING) 
    locCheckValue[1] = 0
    locCheckValue[2] = 0
    locCheckValue[3] = 0
    locCheckValue[4] = 0
    locCheckValue[5] = 0
    BILL:Accession = Pat:Invoice
    ADD(BILLING)
  ELSIF ERRORCODE()
    STOP('BILL: ' & ERROR())
  .    
  
  
  
  
  
  
  
  
  
    OMIT('XXXX')
  
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  XXXX
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  locPath = LONGPATH('..\') 
  0{PROP:Wallpaper} = gloWallpaper
  IF Pat:CLIENT = 500258 THEN UNHIDE(?StringBillingID,?CLM:ClientBillingID).
  CLI:NUMBER = Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)
  IF PAT:CLIENT = 666666 THEN Pat:STATUS = 'X'.
  IF CLI:Language = 'S'
    locSpanish = 16
    HIDE(?englishImage)
    UNHIDE(?mexImage)
    locLanguage = 'Spanish'
    locFileNamePDF = LONGPATH('..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf')
  ELSE
    locSpanish = FALSE
    HIDE(?mexImage)
    UNHIDE(?englishImage)
    locLanguage = 'English'
    locFileNamePDF = LONGPATH('..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf')
  .
  locPhysician = gloPatientNotes[1]
  locComment = SUB(gloPatientNotes[1],41,88)
  
  locClientName = LEFT(CLIP(CLI:Last) & ' ' & CLIP(CLI:FIRST) & ' ' & CLI:DEGREE)
  
  IF BAND(gloPermissions,ACCESS:PatientLogIn)  THEN ENABLE(?AddOn) ELSE DISABLE(?AddOn).
  
  POST(EVENT:Timer)
  
  IF BAND(gloPermissions,8192)
    ENABLE(?PAT:Billing)
  .
  
  IF PAT:Status = 'C'
   IF FILEEXISTS(LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'eo.pdf')) |
   OR FILEEXISTS(LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'so.pdf'))
     UNHIDE(?locViewOriginal)
  . .
   
  DO CheckStatus
  
  IF ~FILEEXISTS(locFileNamePDF)
    DISABLE(?ViewPDF)
    IF Pat:STATUS = 'C' OR PAT:STATUS = 'X'
      ?ViewPDF{PROP:TRN} = 0
      ?ViewPDF{PROP:Color,1} = COLOR:Red
      IF PAT:STATUS = 'X'
       ?ButtonPrintVoid{PROP:Color,1} = COLOR:Red
       ?ButtonPrintVoid{PROP:Font,3} = COLOR:White
    . .
    DISABLE(?Encrypt)
  !   DISABLE(?eMailPDF)
    DISABLE(?AutoPassword)
  .
  
  gloPDFPrinter = GETINI('PrintReport','PDFPRINTER','deskPDF','PrintResults.INI')
  gloResultsPrinter = GETINI('PrintReport','RESULTSPRINTER','','PrintResults.INI')   
  DO CheckBilling
  gloPatientNumber = Pat:INVOICE
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
  EnhancedFocusManager.DisableControlType(CREATE:Radio)
  EnhancedFocusManager.DisableControlType(CREATE:Check)
  EnhancedFocusManager.DisableControlType(CREATE:Combo)
  EnhancedFocusManager.DisableControlType(CREATE:List)
  EnhancedFocusManager.DisableControlType(CREATE:DropCombo)
  EnhancedFocusManager.DisableControlType(CREATE:DropList)
  RETURN ReturnValue


ThisWindow.InsertAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.InsertAction()
   RUN('CMD MkDir ..\Results\' & CLI:NUMBER)
  OL:Date = TODAY()
  OL:Time = CLOCK()
  OL:Number = Pat:Invoice
  OL:PCAE = ONLINE:Patient + ONLINE:Add
  ADD(Online)
   
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
  
    IF BILL:AddressPatient AND BILL:PostalPatient AND BILL:CityPatient
      BILL:Status = ''
    ELSE
      BILL:Status = '*'      
    .
    PUT(Billing)
    Relate:Billing.Close
    Relate:Claims.Close
    Relate:Client.Close
    Relate:DiagnosticCodes.Close
    Relate:Docs.Close
    Relate:Online.Close
    Relate:RequestForms.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.SetAlerts PROCEDURE

  CODE
  PARENT.SetAlerts
  !STOP(gloPermissions & ', ' &  ACCESS:Admin & ', ' & BAND(gloPermissions, ACCESS:Admin) & ', ' & Pat:HL7) 
  !! STOP(?ButtonHL7{PROP:Hide})
  IF BAND(gloPermissions, ACCESS:Admin) AND Pat:HL7 THEN UNHIDE(?ButtonHL7). 
  !STOP(?ButtonHL7{PROP:Hide})


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
    OF ?Pat:VERIFIED_BY
      UPDATE(?)
    OF ?ButtonPrintLabel
        gloPatient = pat:invoice     
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
     
    OF ?ButtonFaxRequest
      IF BILL:DateFax1
        BILL:DateFax2 = TODAY()
      ELSE  
        BILL:DateFax1 = TODAY()
      .
      DISPLAY()  
      
      locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]     
      gloReportFileName = LONGPATH('.\')  
      locFileName = 'faxRequest.PDF'
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
      FaxRequest2(locFaxRequest)             
      
      locFileName =  CLIP(gloReportFileName) & locFileName    
      locDelay = CLOCK() + 350
      LOOP WHILE CLOCK() < locDelay
        YIELD    
      .   
      RUN('acrord32.exe  /n /s /o ' & locFileName)
       
      URLHandler(QuickWindow{prop:handle},'http://127.0.0.1/amx/cc.php?c=' & CLIP(PAT:Client) & '&p=' & CLIP(PAT:Invoice) & '&n=' & CLIP(CLI:FAX) & '&f=' & CLIP(locFileName))
    OF ?OK
      PUT(Claims)
  
    ELSE
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Pat:VERIFIED_BY
      DO CheckStatus
      
          
    OF ?Pat:BILLING
      DO LED
    OF ?Pat:VOLUME1
      DO CheckStatus
    OF ?Pat:VOLUME2
      DO CheckStatus
    OF ?Pat:Volume3
      DO CheckStatus
    OF ?Pat:Volume4
      DO CheckStatus
    OF ?ButtonPrintSerumLabel:2
      ThisWindow.Update
        InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
        ComPuts(CommPort,InitStr)
      
    OF ?Pat:Volume5
      DO CheckStatus
    OF ?ViewPDF
      ThisWindow.Update
      IF locSpanish 
        IF locViewOriginal
          gloFileName1 =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'so.pdf'
        ELSE
          gloFileName1 =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf'
        .
      ELSE
        IF  locViewOriginal
          gloFileName1 =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'eo.pdf'
        ELSE
          gloFileName1 =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf'
        .
      .
      IF EXISTS(gloFileName1)
        run('acrord32.exe ' & LONGPATH(gloFileName1))
      ELSE
        IF locSpanish
          IF locViewOriginal
            gloFileName1 =  '..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 'so.pdf'
            
          ELSE
            gloFileName1 =  '..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf'
          .
        ELSE
          IF  locViewOriginal
            gloFileName1 =  '..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 'eo.pdf'
          ELSE
            gloFileName1 =  '..\Results\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf'
          .
          IF EXISTS(gloFileName1)
            run('acrord32.exe ' & LONGPATH(gloFileName1))
          ELSE
            STOP('PDF not found')
          .
        .
      .
      
    OF ?eMailPDF
      ThisWindow.Update
        locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3  & CLI:Physician2
        CLEAR(DOC:Record)
        DOC:Number =  DOC:FaxCover  + DOC:Text
        GET(Docs,DOC:OrderKey)
        IF ~ERRORCODE()
          locLogo = DOC:Body
        .
        DOC:Number =  DOC:FaxCover  + DOC:Text
        GET(Docs,DOC:OrderKey)
        IF ERRORCODE()
          STOP('Doc Logo: ' & ERROR())
        ELSE
          locLogo = DOC:Body
        .
        IF locSpanish
          DOC:Number =  DOC:Confidentiality + DOC:Text + DOC:Spanish
          GET(Docs,DOC:OrderKey)
          IF ERRORCODE()
            STOP('Doc Spanish Disclaimer ' & ERROR())
          ELSE
            locDisclaimer = DOC:Body
          .
          locSubject = 'Allermetrix:  Le adjuntamos los resultados de las pruebas de alergia de su paciente'
          locBody = '<p  style="color:#20889A;">Le adjuntamos los resultados de las pruebas de alergia de su paciente. Si tiene alguna pregunta o desea m&#225s informaci&#243n&#44 comun�quese con nosotros por medio de este correo electr&#243nico.<p>C&#243mo abrir los archivos pdf de ' & PAT:Client & '<p>Gracias.<p><br>Gary A. Kitos&#44 Ph.D.&#44 H.C.L.D.<br>Director del Laboratorio M&#233dico<br>Tel: 615-599-4100<br>Fax: 615-599-4648</p>'          
          locSubject = 'Allermetrix:  Le adjuntamos los resultados de las pruebas de alergia de su paciente'
          locAttachments = 'file:///' & CLIP(locPath) & 'Results\' & PAT:Client & '\' & PAT:Invoice & 's.PDF'
        ELSE
          DOC:Number =  DOC:Confidentiality + DOC:Text
          GET(Docs,DOC:OrderKey)
          IF ERRORCODE()
            STOP('Doc English Disclaimer ' & ERROR())
          ELSE
            locDisclaimer = DOC:Body
          .
          locBody = '<h3 style="color:#20889A;">Test Results Attached</h3>'
          locSubject = 'Allermetrix Test Results'
          locAttachments = 'file:///' & CLIP(locPath) & 'Results\' & PAT:Client & '\' & PAT:Invoice & 'e.PDF'
        .
        RUN(PATH('C:\Program Files\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubject) & ',body=''' & CLIP(locLogo) & CLIP(locBody) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
        RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubject) & ',body=''' & CLIP(locLogo) & CLIP(locBody) & CLIP(locDisclaimer) & ''',attachment=' & CLIP(locAttachments) & '"')
      
    OF ?Encrypt
      ThisWindow.Update
        locEncryptPDF = '"C:\Program Files (x86)\PlotSoft\PDFill\PDFill.exe" ENCRYPT'
        IF locSpanish
          locFileName =  LONGPATH('..\ResultsNoEncrypt\') & '\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF'
          locTargetFileName =  LONGPATH('..\Results\') &'\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF'
          RUN('CMD /c ' & CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & PAT:Client)
        ELSE
          locFileName =  LONGPATH('..\ResultsNoEncrypt\') & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF'
          locTargetFileName =  LONGPATH('..\Results\') & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF'          
          RUN('CMD /c ' & CLIP(locEncryptPDF) & ' ' & CLIP(locFileName) & ' ' & CLIP(locTargetFileName) & ' -bit 128 -option 10100100 -ownerpassword 5994100  -userpassword ' & PAT:Client)
        .
           
    OF ?FaxPDFButton
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
      IF CLI:Language = 'S'      
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 's.PDF')
      ELSE
        gloReportFileName =  LONGPATH('..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & Pat:INVOICE & 'e.PDF')
      .  
      FaxCover(1)
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
         
      !     REMOVE(locFileName)  
      ! RUN('print /D:HP Universial Fax Driver ' & locOutputName)       
      
      
      locFileName =  '..\ResultsNoEncrypt\' & Pat:CLIENT & '\' & 'fax.PDF'
      !    RUN('acrord32.exe  /n /s /o ' & locFileName)   
      URLHandler(QuickWindow{prop:handle},'http://127.0.0.1/amx/cc.php?c=' & CLIP(Pat:Client) & '&p=' & CLIP(Pat:Invoice) & '&n=' & CLIP(CLI:FAX))
       
    OF ?ViewTestsButton
      ThisWindow.Update
      PatientTests(PAT:Invoice)
      ThisWindow.Reset
    OF ?AddOn
      ThisWindow.Update
      UPDATE()
      PUT(Patient)
      locAddOnTakenBy = PC:Initials
      locAddOnDate = TODAY()
      OPEN(AddOnWindow)
      0{PROP:Wallpaper} = gloWallpaper
      ACCEPT
        IF EVENT() = EVENT:Accepted
          CASE FIELD()
          OF ?AOK
            gloAddOn = TRUE
            SAV:Patient = PAT:Record
            PAT:Invoice = 0
            Pat:DATE = locAddOnDate
            PAT:InHouseComments = locAddOnOrderMethod & ': Add On ' & FORMAT(locAddOnDate,@D1) & ' Taken: ' &  locAddOnTakenBy & ' Order: '  & locAddOnOrderedBy
            LoginMain
            POST(EVENT:CloseWindow)
            BREAK
          OF ?AOCANCEL
            BREAK
          .
        .
      .
      CLOSE(AddOnWindow)
      POST(EVENT:CloseWindow)
      
    OF ?PrintSignatureRequest
      ThisWindow.Update
      gloPatient = Pat:INVOICE
      SignatureRequest('Signature Request',DOC:SignatureRequest + DOC:IncludeTest + locSpanish)
      DocEmail(DOC:SignatureRequest + DOC:IncludeTest + locSpanish)
      OMIT('XXXX')
      locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3
      locSubjectE = 'Allermetrix Signature Request'
      locBodyE = ' "CLIA laws require a physican signature on all test request forms.  Please sign the attached form and fax to Allermetrix at 615-599-4100 or e-mail to ck@allermetrix.com"'
      locAttachments = 'file:///' & locPath & '\Results\' & CLIP(gloReportFileName) & '.PDF'
      RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=' & CLIP(locSubjectE) & ',body=' & CLIP(locBodyE) & ',attachment=' & CLIP(locAttachments) & '"')
      XXXX
    OF ?SaveExit
      ThisWindow.Update
      !     POST(EVENT:Accepted,?OK)
    OF ?printCreditCArdNotice
      ThisWindow.Update
      DocEmail(DOC:CreditCard + locSpanish + DOC:Text)
    OF ?Pat:CreditCard
      IF PAT:CreditCard AND locSpanish
        UNHIDE(?PrintCreditCardNotice)
      ELSE
        HIDE(?PrintCreditCardNotice)
      .
    OF ?ButtonPhysicians
      ThisWindow.Update
      GlobalRequest = SelectRecord
      PhysicianLookup()
      ThisWindow.Reset
      
      
      locPhysician = PHY:Physician   
      CLM:Physician = LEFT(CLIP(PHY:Last)) & '*' & LEFT(PHY:First) 
      CLM:NPI = PHY:Upin    
      DISPLAY(?locPhysician)
      DISPLAY(?CLM:NPI)
    OF ?AutoPassword
      ThisWindow.Update
      IF CLI:Language = 'S'
        gloFileName1 =  Pat:CLIENT & '\' & Pat:INVOICE & 's.pdf'
      ELSE
        gloFileName1 =  Pat:CLIENT & '\' & Pat:INVOICE & 'e.pdf'
      .
      SETPATH('' & locPath & '\RESULTS')
      RUN('cscript //B //NoLogo  AppActivate.VBS "AcroRd32.exe ' &  gloFileName1   & '" "' & PAT:Client & '{{ENTER}" 5994100',1)
      SETPATH('..\APPS')
    OF ?PrinterSelect
      ThisWindow.Update
      PRINTERDIALOG('Select Fax')
      gloResultsPrinter = PRINTER{PROPPRINT:Device}
      DISPLAY()
      PUTINI('PrintReport','RESULTSPRINTER',gloResultsPrinter,'PrintResults.INI')
      DISPLAY(?gloResultsPrinter)
    OF ?ButtonPrintVoid
      ThisWindow.Update
      gloPDFPrinter = GETINI('PrintReport','PDFPRINTER','deskPDF','PrintResults.INI')
      gloResultsPrinter = GETINI('PrintReport','RESULTSPRINTER','','PrintResults.INI')
      gloReportFileName = '..\ResultsNoEncrypt\' & PAT:Client
      IF ~FILEEXISTS(gloReportFileName) THEN CREATEDIRECTORY(gloReportFileName).
      gloReportFileName = '..\ResultsNoEncrypt\' & PAT:Client & '\' & PAT:Invoice & 'e.PDF'
      IF PUTREG(REG_LOCAL_MACHINE,'SOFTWARE\Docudesk\deskPDF\Documents','Results',LONGPATH(gloReportFileName))
        STOP('Could not create registry filename: ' & LONGPATH(gloReportFileName))
      .
      VoidPDF()
    OF ?Verify
      ThisWindow.Update
      Verify(Pat:INVOICE)
      ThisWindow.Reset
    OF ?BUTTON_GetHL7
      ThisWindow.Update
            locLoginFile =  CLIP(pat:CLIENT_ID) & '.txt'
            REMOVE('c:\apps\' & locLoginFile)
            RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/public_html/cpl/login/' & CLIP(locLoginFile) & ' C:\apps\' & CLIP(locLoginFile) & ' & pause',1)   
            IF EXISTS('c:\apps\' & locLoginFile)
              CLOSE(Login)
              gloFileName2 = 'c:\apps\' & locLoginFile
              OPEN(Login)
              IF ERRORCODE() THEN STOP('OPEN LI: ' & ERROR());CYCLE.
              SET(Login)
              NEXT(Login)
              NEXT(Login)
              NEXT(Login)
              NEXT(Login)
              NEXT(Login)
              OPEN(Test)
              LOOP UNTIL EOF(Login)
                NEXT(Login)
                IF ERRORCODE() THEN BREAK.
                TST:INVOICE = PAT:Invoice
                TST:STATUS = 'L'
                TST:CODE =  SUB(LI:Data,1,4) 
                TST:TYPE =  SUB(LI:Data,5,1)
                ADD(Test)
                IF ERRORCODE() THEN STOP('ADD TST: ' & ERROR()).
              .
              CLOSE(Login)
              REMOVE('c:\apps\' & locLoginFile)        
              CREATEDIRECTORY('C:\Apps\Results\' & CLIP(locClientID))
            ELSE
               STOP('File not found: ' & locLoginFile) 
            . 
    OF ?ButtonHL7
      ThisWindow.Update
          URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/results.php?id=' & CLIP(Pat:CLIENT_ID) & '&accession=' & Pat:INVOICE)
          locDelay = CLOCK() + 150
          LOOP WHILE CLOCK() < locDelay
            YIELD    
          .      
          RUN('C:\Windows\System32\CMD.exe /c ECHO ON & "c:\apps\pscp" -v -p -pw xD1GkuK7a7DK8! amx@amxemr.com:/home/amx/public_html/cpl/Results/' & CLIP(Pat:CLIENT_ID) & '/fzUploadResultsCPL.script' & ' C:\Apps\Results\' & CLIP(Pat:CLIENT_ID) & '\fzUploadResultsCPL.script' & ' & exit',1)  
          RUN('C:\Windows\System32\CMD.exe /c ECHO ON & C:\Apps\uploadResultsCPL.bat ' & CLIP(Pat:CLIENT_ID) & ' exit',1) 
    OF ?ButtonSelectPayer
      ThisWindow.Update
      GlobalRequest = SelectRecord
      SelectPayer()
      ThisWindow.Reset
      CLM:PlanID = PA:ID
      CLM:PlanName = PA:Payer 
      DISPLAY()
    OF ?locCheckValue_1
        locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]
       
    OF ?locCheckValue_2
        locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]
    OF ?locCheckValue_3
         locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]
    OF ?locCheckValue_4
        locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]
    OF ?locCheckValue_5
        locFaxRequest = locCheckValue[1] + locCheckValue[2] + locCheckValue[3] + locCheckValue[4] + locCheckValue[5] + locCheckValue[6] + locCheckValue[7]
    OF ?ExportInsurance
      ThisWindow.Update
      ExportInsurance()
      ThisWindow.Reset
    OF ?BUTTON1
      ThisWindow.Update
      PayerImport()
      ThisWindow.Reset
    OF ?ButtonLookupNPI
      ThisWindow.Update
      URLHandler(QuickWindow{prop:handle},'https://npiregistry.cms.hhs.gov/')
       
    OF ?BUTTON2
      ThisWindow.Update
      GlobalRequest = SelectRecord
      PhysicianLookup()
      ThisWindow.Reset
      !     stop(PHY:Physician & ', ' & PHY:Upin & ', ' & PHY:License & ', ' & PHY:First & ', ' & PHY:Last)   
       IF GlobalResponse = RequestCompleted
          CLM:Physician = LEFT(CLIP(PHY:Last)) & '*' & LEFT(PHY:First) 
          CLM:NPI = PHY:Upin    
          locPhysician = PHY:Physician
          DISPLAY()
       .
    OF ?ButtonLabelCode
      ThisWindow.Update
        InitStr = 'oR0<10>P1<10>'
        ComPuts(CommPort,InitStr)
    OF ?Pat:DOB
            IF PAT:DOB
              locDays = TODAY() - PAT:DOB
              IF locDays < 366
                PAT:Age = locDays/30
                PAT:AGE_TYPE = 'M'
              ELSE
                PAT:AGE_TYPE = 'Y'
                PAT:Age = locDays/365
            . .
            DISPLAY(?PAT:Age,?PAT:AGE_TYPE)
    OF ?ButtonRequestForm
      ThisWindow.Update
      RF:Accession = Pat:INVOICE
      GET(RequestForms,RF:OrderKey) 
      locFileName = '..\' & YEAR(RF:Date) & ' REQUEST FORMS\B&W to Searchable PDF_' & YEAR(RF:Date) & '-' & FORMAT(MONTH(RF:Date),'@N02') & '-' &  FORMAT(DAY(RF:Date),'@N02') & '_1.PDF'  
      RUN('acrord32.exe  /n /s /o /A search=' & Pat:invoice & ' ' & locFileName)
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeCompleted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ! save
  gloPatientNotes[1] = locPhysician & locComment
  ReturnValue = PARENT.TakeCompleted()
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
  IF EVENT() = EVENT:Accepted THEN DO CheckBilling.
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
  OF ?Panel2
    DO LED
  END
  ReturnValue = PARENT.TakeFieldEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeSelected()
    CASE FIELD()
    OF ?ButtonPrintSerumLabel
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
    OF ?CLM:DiagCode1
      DO CheckDiagCode  
      IF GlobalResponse = RequestCompleted
        CLM:DiagCode1 = DC:Code 
        DISPLAY(?)
      .
    OF ?CLM:DiagCode2
      DO CheckDiagCode  
      IF GlobalResponse = RequestCompleted
        CLM:DiagCode2 = DC:Code 
        DISPLAY(?)
      .
    OF ?CLM:DiagCode3
      DO CheckDiagCode
      IF GlobalResponse = RequestCompleted
        CLM:DiagCode3 = DC:Code 
        DISPLAY(?)
      .
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
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:GainFocus
      IF BAND(gloThreadedReturn,2)
        gloThreadedReturn = BAND(gloThreadedReturn,4294967293) 
        POST(EVENT:Accepted,?ViewTestsButton)
      .
    OF EVENT:OpenWindow
      !   SETCLIPBOARD(Pat:INVOICE)
    OF EVENT:Timer
      IF ~BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN POST(EVENT:CloseWindow).
      IF BAND(gloPermissions,ACCESS:EditPatients) THEN ENABLE(?OK).
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

