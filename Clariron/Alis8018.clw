

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8018.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8011.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8019.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8021.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8023.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8025.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8027.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8048.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8050.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8054.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8056.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8074.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Client
!!! </summary>
UpdateClient PROCEDURE 

CurrentTab           STRING(80)                            !
locRequest           BYTE                                  !
locBotanical         STRING(20)                            !
LocCourier           STRING(20)                            !
locSpecialty         STRING(20)                            !
ActionMessage        CSTRING(40)                           !
locEmail             STRING(180)                           !
locSpanish           BYTE                                  !
locDocumentNumber    BYTE                                  !
locMenu              STRING(20)                            !
locClient            STRING(20)                            !
locEditSuppliesFax   ULONG                                 !
locEditFax           ULONG                                 !
BRW8::View:Browse    VIEW(Supplies)
                       PROJECT(SUP:Date)
                       PROJECT(SUP:Initials)
                       PROJECT(SUP:Quantity)
                       PROJECT(SUP:ShipDate)
                       PROJECT(SUP:ShippedVia)
                       PROJECT(SUP:Note)
                       PROJECT(SUP:Client)
                       PROJECT(SUP:Shipped)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
SUP:Date               LIKE(SUP:Date)                 !List box control field - type derived from field
SUP:Date_Style         LONG                           !Field style
SUP:Initials           LIKE(SUP:Initials)             !List box control field - type derived from field
SUP:Initials_Style     LONG                           !Field style
SUP:Quantity           LIKE(SUP:Quantity)             !List box control field - type derived from field
SUP:Quantity_Style     LONG                           !Field style
SUP:ShipDate           LIKE(SUP:ShipDate)             !List box control field - type derived from field
SUP:ShipDate_Style     LONG                           !Field style
SUP:ShippedVia         LIKE(SUP:ShippedVia)           !List box control field - type derived from field
SUP:ShippedVia_Style   LONG                           !Field style
SUP:Note               LIKE(SUP:Note)                 !List box control field - type derived from field
SUP:Note_Style         LONG                           !Field style
SUP:Client             LIKE(SUP:Client)               !Browse key field - type derived from field
SUP:Shipped            LIKE(SUP:Shipped)              !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW7::View:Browse    VIEW(PickUp)
                       PROJECT(PU:Received)
                       PROJECT(PU:Date)
                       PROJECT(PU:Inititals)
                       PROJECT(PU:ContactName)
                       PROJECT(PU:Note)
                       PROJECT(PU:Client)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
PU:Received            LIKE(PU:Received)              !List box control field - type derived from field
PU:Received_Icon       LONG                           !Entry's icon ID
PU:Received_Style      LONG                           !Field style
PU:Date                LIKE(PU:Date)                  !List box control field - type derived from field
PU:Date_Style          LONG                           !Field style
PU:Inititals           LIKE(PU:Inititals)             !List box control field - type derived from field
PU:Inititals_Style     LONG                           !Field style
PU:ContactName         LIKE(PU:ContactName)           !List box control field - type derived from field
PU:ContactName_Style   LONG                           !Field style
PU:Note                LIKE(PU:Note)                  !List box control field - type derived from field
PU:Note_Style          LONG                           !Field style
PU:Client              LIKE(PU:Client)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(Physicians)
                       PROJECT(PHY:Last)
                       PROJECT(PHY:First)
                       PROJECT(PHY:Physician)
                       PROJECT(PHY:License)
                       PROJECT(PHY:Upin)
                       PROJECT(PHY:Client)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:3
PHY:Last               LIKE(PHY:Last)                 !List box control field - type derived from field
PHY:Last_Style         LONG                           !Field style
PHY:First              LIKE(PHY:First)                !List box control field - type derived from field
PHY:First_Style        LONG                           !Field style
PHY:Physician          LIKE(PHY:Physician)            !List box control field - type derived from field
PHY:Physician_Style    LONG                           !Field style
PHY:License            LIKE(PHY:License)              !List box control field - type derived from field
PHY:License_Style      LONG                           !Field style
PHY:Upin               LIKE(PHY:Upin)                 !List box control field - type derived from field
PHY:Upin_Style         LONG                           !Field style
PHY:Client             LIKE(PHY:Client)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW11::View:Browse   VIEW(Phone)
                       PROJECT(PHO:Phone)
                       PROJECT(PHO:Note)
                       PROJECT(PHO:Client)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:4
PHO:Phone              LIKE(PHO:Phone)                !List box control field - type derived from field
PHO:Phone_Style        LONG                           !Field style
PHO:Note               LIKE(PHO:Note)                 !List box control field - type derived from field
PHO:Note_Style         LONG                           !Field style
PHO:Client             LIKE(PHO:Client)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
History::CLI:Record  LIKE(CLI:RECORD),THREAD
locName STRING(20),DIM(2),OVER(PHY:Physician)
BRW11::FormatManager ListFormatManagerClass,THREAD ! LFM object
BRW11::PopupTextExt  STRING(1024)                 ! Extended popup text
BRW11::PopupChoice   SIGNED                       ! Popup current choice
BRW11::PopupChoiceOn BYTE(1)                      ! Popup on/off choice
BRW11::PopupChoiceExec BYTE(0)                    ! Popup executed
QuickWindow          WINDOW,AT(0,0,510,340),FONT('Arial',11,,FONT:regular),GRAY,MDI,HLP('UpdateClient'),TIMER(500)
                       SHEET,AT(0,0,480,242),USE(?CurrentTab),SPREAD
                         TAB('General'),USE(?Tab:1),FONT(,,,FONT:bold)
                           ENTRY(@s25),AT(64,72,144,10),USE(CLI:LAST),FLAT
                           ENTRY(@s20),AT(64,88,144,10),USE(CLI:FIRST),FLAT
                           ENTRY(@s5),AT(64,104,40,10),USE(CLI:DEGREE),FLAT
                           CHECK('Female'),AT(120,104,60,12),USE(CLI:Sex),FONT(,,,FONT:bold),COLOR(COLOR:Lime),ICON(ICON:None), |
  TRN,VALUE('F','M')
                           ENTRY(@s35),AT(64,120,144,10),USE(CLI:ADDRESS1),FLAT
                           ENTRY(@s35),AT(64,136,144,10),USE(CLI:ADDRESS2),FLAT
                           IMAGE('SteelFax.gif'),AT(226,118,78,27),USE(?FaxImage),CENTERED,HIDE
                           IMAGE('SteelEmail.gif'),AT(305,118,78,27),USE(?EmailImage),CENTERED,HIDE
                           IMAGE('SteelPostal.gif'),AT(384,118,78,27),USE(?PostalImage),CENTERED,HIDE
                           ENTRY(@s20),AT(64,152,84,10),USE(CLI:CITY),FLAT
                           ENTRY(@s2),AT(64,168,40,10),USE(CLI:STATE),FLAT
                           ENTRY(@s20),AT(64,184,84,10),USE(CLI:Country),FLAT
                           IMAGE('en.gif'),AT(282,190),USE(?EnglishImage)
                           IMAGE('mx.gif'),AT(282,190,48,23),USE(?MexImage)
                           ENTRY(@s10),AT(64,200,49,10),USE(CLI:ZIP),FLAT
                           ENTRY(@s140),AT(64,216,364,10),USE(locEmail),FLAT
                           PROMPT('Number Copies'),AT(182,158,105,10),USE(?CLI:REPORTS:Prompt),FONT(,,,FONT:bold),RIGHT, |
  TRN
                           ENTRY(@n3),AT(288,156,14,10),USE(CLI:REPORTS),RIGHT(1)
                           ENTRY(@s24),AT(348,32,100,10),USE(CLI:CONTACT),FLAT
                           IMAGE('SteelWarning.gif'),AT(208,38,42,27),USE(?AttentionImage),CENTERED,HIDE
                           IMAGE('SteelHand.ico'),AT(254,38,42,27),USE(?HoldImage),CENTERED,HIDE
                           ENTRY(@s20),AT(348,48,100,10),USE(CLI:PHONE),FLAT
                           ENTRY(@s20),AT(348,64,100,10),USE(CLI:FAX),FLAT
                           BUTTON('Botanical'),AT(296,76,49,14),USE(?Botanical),FONT(,,,FONT:bold)
                           BUTTON('Courier'),AT(296,92,49,13),USE(?Courier),FONT(,,,FONT:bold)
                           CHECK('Fax Report'),AT(226,140,78,15),USE(CLI:FaxReport),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('2','0')
                           CHECK('Email Report'),AT(305,140,78,15),USE(CLI:EmailReport),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('8','0')
                           CHECK('Send Postal'),AT(384,140,78,15),USE(CLI:Postal),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('Y','N')
                           CHECK('Consolidate'),AT(305,156,78,15),USE(CLI:ConsolidateReports),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('64','0')
                           CHECK('Diet'),AT(384,156,78,15),USE(CLI:Diet),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('1', |
  '0')
                           OPTION('Language'),AT(218,168,166,21),USE(CLI:Language),FONT(,,,FONT:bold),TRN
                             RADIO('   English'),AT(226,172,78,15),USE(?CLI:Language:Radio1),LEFT,ICON('en.ico'),TRN,VALUE('E')
                             RADIO('   Spanish'),AT(305,172,78,15),USE(?CLI:Language:Radio2),LEFT,ICON('mx.ico'),TRN,VALUE('S')
                           END
                           TEXT,AT(0,290,250,50),USE(CLI:FOLLOW2,,?CLI:FOLLOW2:2),FONT(,9,,,CHARSET:ANSI),BOXED,FLAT
                           PROMPT('Account #'),AT(26,40),USE(?CLI:NUMBER:Prompt),FONT(,,,FONT:bold),TRN
                           STRING('On Hold'),AT(254,58,42,10),USE(?OnHold),FONT('Arial',12,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  CENTER,HIDE,TRN
                           STRING('Attention'),AT(208,58,42,10),USE(?AttentionRequired),FONT('Arial',12,COLOR:Red,FONT:bold, |
  CHARSET:ANSI),CENTER,HIDE,TRN
                           CHECK('Followup Required'),AT(208,32,90,11),USE(CLI:FOLLOW),FONT(,,COLOR:Black,FONT:bold), |
  COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('16','0')
                           PROMPT('Billing Account #'),AT(2,56),USE(?CLI:BILLING:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Last:'),AT(44,72),USE(?CLI:LAST:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('First:'),AT(43,88),USE(?CLI:FIRST:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Degree:'),AT(32,104),USE(?CLI:DEGREE:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Address'),AT(32,120),USE(?CLI:ADDRESS1:Prompt),FONT(,,,FONT:bold),TRN
                           STRING(@s20),AT(352,78),USE(locBotanical),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI),TRN
                           PROMPT('CLIA#'),AT(40,184),USE(?CLI:Country:Prompt),FONT(,,,FONT:bold),TRN
                           STRING(@s20),AT(352,94),USE(LocCourier),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI),TRN
                           PROMPT('City'),AT(47,152),USE(?CLI:CITY:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('State'),AT(42,168),USE(?CLI:STATE:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Postal Code:'),AT(16,200),USE(?CLI:ZIP:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Email:'),AT(40,216),USE(?CLI:Email:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Phone:'),AT(320,48),USE(?CLI:PHONE:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Contact:'),AT(316,32),USE(?CLI:CONTACT:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Fax:'),AT(330,64),USE(?CLI:FAX:Prompt),FONT(,,,FONT:bold),TRN
                           CHECK('On Hold'),AT(208,18,90,11),USE(CLI:HOLD),FONT(,,COLOR:Black,FONT:bold),COLOR(COLOR:Red), |
  ICON(ICON:None),TRN,VALUE('32','0')
                           ENTRY(@n06),AT(64,40,40,10),USE(CLI:NUMBER),RIGHT(1),FLAT,IMM,SKIP
                           ENTRY(@N06),AT(64,56,40,10),USE(CLI:BILLING),RIGHT(1),FLAT,IMM,SKIP
                           BUTTON('Update Online Tests'),AT(367,195,95),USE(?BUTTON1),HIDE
                           CHECK('CML Report'),AT(384,172,78,15),USE(CLI:ReportFormatCML),ICON(ICON:None),TRN,VALUE('1', |
  '0')
                           CHECK('HL7'),AT(416,18,,11),USE(CLI:HL7),COLOR(COLOR:Lime),FLAT,VALUE('True','False'),TRN
                         END
                         TAB('Supplies Pickup'),USE(?Tab:2),FONT(,,,FONT:bold)
                           ENTRY(@n-7),AT(126,38,40,12),USE(CLI:SUPPLY),RIGHT(1),FLAT
                           STRING('1 month supply'),AT(170,40),USE(?String19),FONT(,,,FONT:bold),TRN
                           IMAGE('button.jpg'),AT(52,62,71,23),USE(?Image16)
                           LIST,AT(126,62,250,72),USE(?List),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),VSCROLL,ALRT(MouseCenter), |
  COLOR(,COLOR:White,COLOR:Blue),GRID(COLOR:Blue),FORMAT('36R(1)|MY~Date~L(2)@d1@26C(2)' & |
  '|MY~Initials~C(0)@s3@18R(2)|MY~Qty~C(0)@n4@36R(2)|MY~Shipped~C(0)@d1b@46C(2)|MY~Ship' & |
  'ped Via~C(0)@s12@128L(2)|MY~Note~@s32@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  TRN
                           IMAGE('button.jpg'),AT(2,62,48,23),USE(?Image19)
                           CHECK('Edit'),AT(2,62,48,23),USE(locEditSuppliesFax),FONT(,,,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN,VALUE('1073741824','0')
                           IMAGE('button.jpg'),AT(52,87,71,23),USE(?Image15)
                           PANEL,AT(126,62,250,72),USE(?Panel2)
                           BUTTON('Email Notice'),AT(52,87,71,23),USE(?EmailButton),FONT(,,,FONT:bold,CHARSET:ANSI),LEFT, |
  ICON('SteelEmail.ico'),TRN
                           IMAGE('button.jpg'),AT(52,112,71,23),USE(?Image13)
                           BUTTON('Fax Notice'),AT(52,62,71,23),USE(?FaxButton:),FONT(,,,FONT:bold,CHARSET:ANSI),LEFT, |
  ICON('SteelFax.ico'),TRN
                           BUTTON('Calc Supply'),AT(0,16,71,23),USE(?CalcSupply),FONT(,,,FONT:bold),LEFT,ICON('SteelCalc.ico'), |
  HIDE,TRN
                           BUTTON('Add Supplies'),AT(52,112,71,23),USE(?AddSuppliesButton),FONT(,,,FONT:bold,CHARSET:ANSI), |
  LEFT,ICON('SteelAdd.ico'),TRN
                           LIST,AT(126,166,250,49),USE(?List:2),FONT(,,,FONT:bold),VSCROLL,ALRT(MouseCenter),GRID(COLOR:Blue), |
  FORMAT('17L(2)|MJY~Rcv~C@n3@40L(2)|MY~Date~C@d17@16C(2)|MY~Init~@s3@80L(2)|MY~Contact' & |
  ' Name~@s20@80L(2)|MY~Note~@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records'),TRN
                           PANEL,AT(126,166,250,49),USE(?Panel3)
                           BUTTON('Add Pickup'),AT(52,192,71,23),USE(?NewPickupButton),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  TRN
                           IMAGE('button.jpg'),AT(52,192),USE(?Image14)
                           STRING(@S3),AT(258,28),USE(gloInitials),TRN
                         END
                         TAB('Comments '),USE(?Tab:3),FONT(,,,FONT:bold)
                           STRING('Login Comments'),AT(34,38),USE(?String7),FONT(,,,FONT:bold),TRN
                           TEXT,AT(96,38,250,45),USE(CLI:FOLLOW1),FONT(,10,,FONT:bold,CHARSET:ANSI),BOXED
                           TEXT,AT(96,102,250,50),USE(CLI:FOLLOW2),FONT(,10,,FONT:bold,CHARSET:ANSI),BOXED
                           SPIN(@D1B),AT(96,154,89,16),USE(CLI:FollowupDate),FONT(,14,,FONT:bold,CHARSET:ANSI),RIGHT(3), |
  HVSCROLL
                           BUTTON('Clear'),AT(96,170,89,11),USE(?ButtonClearFollowupDate)
                           BUTTON('Set Today'),AT(96,181,89,11),USE(?ButtonSetFollowupDate)
                           STRING('Deadline'),AT(20,156,74,11),USE(?String20),FONT(,,,FONT:bold),RIGHT,TRN
                           STRING('Follow-up Comments'),AT(20,102),USE(?String8),FONT(,,,FONT:bold),TRN
                         END
                         TAB('Physician Info'),USE(?Tab:4),FONT(,,,FONT:bold)
                           BUTTON('&Help'),AT(412,2,26,8),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                           LIST,AT(120,46,181,78),USE(?List:4),VSCROLL,ALRT(MouseRight),FORMAT('56R(1)|MY~Phone~L(' & |
  '2)@p###-###-####p@80L|MY~Note~L(2)@s20@'),FROM(Queue:Browse:3),IMM,MSG('Browsing Records'), |
  TRN
                           BUTTON('Add'),AT(66,52,47,12),USE(?AddPhone),HIDE
                           BUTTON('Delete'),AT(66,68,47,12),USE(?DeletePhone),HIDE
                           BUTTON('Edit'),AT(66,84,47,12),USE(?EditPhone),HIDE
                           PANEL,AT(120,150,317,78),USE(?Panel5)
                           PANEL,AT(120,46,181,78),USE(?Panel4),HIDE
                           LIST,AT(120,150,317,78),USE(?List:3),VSCROLL,ALRT(MouseRight),FORMAT('51L(2)|MY~Last~@s' & |
  '20@60L(2)|MY~First~L(0)@s20@102L(2)|MY~Physician~L(0)@s32@31L(2)|MY~Degree~@s20@80L(' & |
  '2)|MY~NPI~@s20@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records'),TRN
                           BUTTON('Add New'),AT(66,160,47,12),USE(?AddPhysician),HIDE
                           BUTTON('Delete'),AT(66,176,47,12),USE(?PhysicianDeleteButton),HIDE
                           BUTTON('Follow Up'),AT(66,192,47,12),USE(?FollowupButton),HIDE
                           BUTTON('Edit'),AT(66,208,47,12),USE(?EditPhysicianButton),HIDE
                         END
                         TAB('Fee'),USE(?TAB1)
                           PROMPT('Routine'),AT(192,78),USE(?locRast:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Hymenoptera'),AT(192,105),USE(?locHymenoptera:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Mix'),AT(192,92,44),USE(?locMix:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Occupational'),AT(192,119),USE(?locOccupational:Prompt),FONT(,,,FONT:bold),TRN
                           PROMPT('Chemical'),AT(192,133),USE(?locChemical:Prompt),FONT(,,,FONT:bold),TRN
                           STRING('TIgE'),AT(196,37,31),USE(?STRING8:2),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('TIgG'),AT(250,37,31),USE(?STRING9),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('TIgA'),AT(308,37,31),USE(?STRING10),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('TIgM'),AT(360,37,31),USE(?STRING11),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('IgE'),AT(255,69,24),USE(?STRING12),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('IgG'),AT(323,68,24),USE(?STRING13),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('IgG4'),AT(380,68,24),USE(?STRING14),FONT(,,,FONT:bold),CENTER,TRN
                           STRING('Panel 260'),AT(190,176,40),USE(?STRING15),FONT(,,,FONT:bold),TRN
                           STRING('Panel 270'),AT(190,202,40),USE(?STRING16),FONT(,,,FONT:bold),TRN
                           STRING('Component'),AT(192,146),USE(?STRING18),FONT(,,,FONT:bold),TRN
                           STRING('S145'),AT(192,189),USE(?S145:2),FONT(,,,FONT:bold),TRN
                           ENTRY(@n$6.2),AT(192,46),USE(FEE:TIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(246,46),USE(FEE:TIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(304,46),USE(FEE:TIgA),RIGHT(2)
                           ENTRY(@n$6.2),AT(356,46),USE(FEE:TIgM),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,79),USE(FEE:IgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,79),USE(FEE:IgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,79),USE(FEE:IgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,92),USE(FEE:mxIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,92),USE(FEE:mxIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,92),USE(FEE:mxIgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,106),USE(FEE:hyIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,106),USE(FEE:hyIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,106),USE(FEE:hyIgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,120),USE(FEE:occIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,120),USE(FEE:occIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,120),USE(FEE:occIgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,133),USE(FEE:chemIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,133),USE(FEE:chemIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,133),USE(FEE:chemIgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(250,147),USE(FEE:ComponentIgE),RIGHT(2)
                           ENTRY(@n$6.2),AT(316,147),USE(FEE:ComponentIgG),RIGHT(2)
                           ENTRY(@n$6.2),AT(376,147),USE(FEE:ComponentIgG4),RIGHT(2)
                           ENTRY(@n$6.2),AT(248,176),USE(FEE:Panel260),RIGHT(2)
                           ENTRY(@n$6.2),AT(248,190),USE(FEE:Panel260S145),RIGHT(2)
                           ENTRY(@n$6.2),AT(248,204),USE(FEE:Panel270),RIGHT(2)
                           ENTRY(@n5.2),AT(408,46,34),USE(FEE:Virus),RIGHT(2)
                           STRING('Virus'),AT(411,37,31,10),USE(?STRING11:2),FONT(,,,FONT:bold),CENTER,TRN
                         END
                         TAB('&6) General (cont. 5)'),USE(?Tab:6),HIDE
                         END
                       END
                       BUTTON('Send Email'),AT(204,242,71,23),USE(?SendEmail),FONT('Arial',10,,FONT:bold,CHARSET:ANSI), |
  LEFT,ICON('SteelEmail.ico'),TRN
                       BUTTON('Panels'),AT(306,242,71,23),USE(?Button4),FONT('Arial',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       BUTTON('Patients'),AT(408,242,71,23),USE(?Patients),FONT(,10,,FONT:bold,CHARSET:ANSI),DISABLE, |
  TRN
                       IMAGE('Button.jpg'),AT(307,290,70,25),USE(?Image8)
                       BUTTON('&Cancel'),AT(307,290,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('Done'),AT(410,290,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'),DEFAULT, |
  DISABLE,MSG('Accept data and close the window'),TIP('Accept data and close the window'), |
  TRN
                       IMAGE('button.jpg'),AT(102,266,71,23),USE(?Image20)
                       IMAGE('button.jpg'),AT(0,242,71,23),USE(?Image18)
                       IMAGE('button.jpg'),AT(102,242,71,23),USE(?Image17)
                       IMAGE('button.jpg'),AT(409,242,71,23),USE(?Image12)
                       CHECK('Edit'),AT(102,266,71,23),USE(locEditFax),FONT(,,,FONT:bold),COLOR(COLOR:Yellow),ICON(ICON:None), |
  TRN,VALUE('1073741824','0')
                       BUTTON('Password'),AT(0,242,71,23),USE(?ButtonPassword),FONT(,,,FONT:bold),DISABLE,TRN
                       BUTTON('Send Fax'),AT(102,242,71,23),USE(?SendFaxbutton),FONT(,,,FONT:bold),LEFT,ICON('SteelFax.ico'), |
  TRN
                       IMAGE('button.jpg'),AT(204,242,71,23),USE(?Image11)
                       IMAGE('Button.jpg'),AT(410,290,70,25),USE(?Image9)
                       IMAGE('Button.jpg'),AT(306,242,71,23),USE(?Image10)
                     END

BRW11::LastSortOrder       BYTE
BRW8::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW7::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW9::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW11::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
InsertAction           PROCEDURE(),BYTE,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Reset                  PROCEDURE(BYTE Force=0),DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7                 CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW9                 CLASS(BrowseClass)                    ! Browse using ?List:3
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW11                CLASS(BrowseClass)                    ! Browse using ?List:4
Q                      &Queue:Browse:3                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW11::Sort0:Locator StepLocatorClass                      ! Default Locator
PopupMgr10           PopupClass
PopupMgr12           PopupClass
locFeeRecord  STRING(SIZE(FEE:Record))   
CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = gloListFont
  ?List{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:2
  !------------------------------------
  ?List:2{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:2{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:2{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:2{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:2{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:2{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:2{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:4
  !------------------------------------
  ?List:4{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:4{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:4{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:4{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:4{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:4{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:4{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:3
  !------------------------------------
  ?List:3{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:3{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:3{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:3{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:3{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:3{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:3{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
DisplaySelected ROUTINE

  IF CLI:FaxReport   THEN UNHIDE(?FaxImage)       ELSE HIDE(?FaxImage).
  IF CLI:EmailReport THEN UNHIDE(?EmailImage)     ELSE HIDE(?EmailImage).
  IF CLI:HOLD        THEN UNHIDE(?HoldImage)      ELSE HIDE(?HoldImage).
  IF CLI:FOLLOW      THEN UNHIDE(?AttentionImage) ELSE HIDE(?AttentionImage).

  IF CLI:Postal   = CLIENT:Postal_Y  THEN UNHIDE(?PostalImage)  ELSE HIDE(?PostalImage).
  IF CLI:Language = CLIENT:Spanish_S THEN UNHIDE(?MexImage)     ELSE HIDE(?MexImage).
  IF CLI:Language = CLIENT:English_E THEN UNHIDE(?EnglishImage) ELSE HIDE(?EnglishImage).






ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                               ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    IF CLI:FOLLOW2 THEN CLI:FOLLOW = 1 ELSE CLI:FOLLOW = 0.
    FU:Client = CLI:Number
    GET(FollowUp,FU:OrderKey)
    IF ERRORCODE() 
      IF CLI:FOLLOW
        FU:Client = CLI:Number
        FU:ClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
        ADD(FollowUp)
      .
    ELSE
      IF ~CLI:FOLLOW
        DELETE(FollowUp)
    . .
    
      IF TODAY() % 7 < 3
        T# = TODAY() -2
      ELSE
        T# = TODAY()
      .
      CLI:Pickup = 0
      CLEAR(PU:Record)
      PU:Client = CLI:Number
      SET(PU:ClientKey,PU:ClientKey)
      LOOP
        NEXT(PickUp)
        IF PU:Received OR  PU:Client <> CLI:Number OR ERRORCODE() THEN BREAK.
        IF INRANGE(T# - PU:Date,2,100) THEN CLI:Pickup = 1; BREAK.
      .
  
  OL:Date = TODAY()
  OL:Time = CLOCK()
  OL:Number = CLI:Number
  OL:PCAE = ONLINE:Client + ONLINE:Change
  ADD(Online)
  PUT(FEES)
  IF ERRORCODE() THEN STOP('PUT FEE: ' & ERROR()).
  ReturnValue = PARENT.ChangeAction()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateClient')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CLI:LAST
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(CLI:Record,History::CLI:Record)
  SELF.AddHistoryField(?CLI:LAST,3)
  SELF.AddHistoryField(?CLI:FIRST,4)
  SELF.AddHistoryField(?CLI:DEGREE,5)
  SELF.AddHistoryField(?CLI:Sex,75)
  SELF.AddHistoryField(?CLI:ADDRESS1,7)
  SELF.AddHistoryField(?CLI:ADDRESS2,8)
  SELF.AddHistoryField(?CLI:CITY,9)
  SELF.AddHistoryField(?CLI:STATE,10)
  SELF.AddHistoryField(?CLI:Country,25)
  SELF.AddHistoryField(?CLI:ZIP,11)
  SELF.AddHistoryField(?CLI:REPORTS,44)
  SELF.AddHistoryField(?CLI:CONTACT,12)
  SELF.AddHistoryField(?CLI:PHONE,13)
  SELF.AddHistoryField(?CLI:FAX,14)
  SELF.AddHistoryField(?CLI:FaxReport,41)
  SELF.AddHistoryField(?CLI:EmailReport,42)
  SELF.AddHistoryField(?CLI:Postal,43)
  SELF.AddHistoryField(?CLI:ConsolidateReports,45)
  SELF.AddHistoryField(?CLI:Diet,69)
  SELF.AddHistoryField(?CLI:Language,6)
  SELF.AddHistoryField(?CLI:FOLLOW2:2,38)
  SELF.AddHistoryField(?CLI:FOLLOW,36)
  SELF.AddHistoryField(?CLI:HOLD,70)
  SELF.AddHistoryField(?CLI:NUMBER,1)
  SELF.AddHistoryField(?CLI:BILLING,2)
  SELF.AddHistoryField(?CLI:ReportFormatCML,73)
  SELF.AddHistoryField(?CLI:HL7,76)
  SELF.AddHistoryField(?CLI:SUPPLY,35)
  SELF.AddHistoryField(?CLI:FOLLOW1,37)
  SELF.AddHistoryField(?CLI:FOLLOW2,38)
  SELF.AddUpdateFile(Access:Client)
  SELF.AddItem(?Cancel,RequestCancelled)          ! Add the cancel control to the window manager
  Relate:Botanical.Open                           ! File Botanical used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Courier.Open                             ! File Courier used by this procedure, so make sure it's RelationManager is open
  Relate:Docs.Open                                ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Fees.Open                                ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:FollowUp.Open                            ! File FollowUp used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                              ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:Physicians.Open                          ! File Physicians used by this procedure, so make sure it's RelationManager is open
  Relate:Salesman.Open                            ! File Salesman used by this procedure, so make sure it's RelationManager is open
  Relate:Specialty.Open                           ! File Specialty used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                          ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Client
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.DeleteAction = Delete:None               ! Deletes not allowed
    SELF.ChangeAction = Change:Caller             ! Changes allowed
    SELF.CancelAction = Cancel:Cancel             ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW8.Init(?List,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:Supplies,SELF) ! Initialize the browse manager
  BRW7.Init(?List:2,Queue:Browse:1.ViewPosition,BRW7::View:Browse,Queue:Browse:1,Relate:PickUp,SELF) ! Initialize the browse manager
  BRW9.Init(?List:3,Queue:Browse:2.ViewPosition,BRW9::View:Browse,Queue:Browse:2,Relate:Physicians,SELF) ! Initialize the browse manager
  BRW11.Init(?List:4,Queue:Browse:3.ViewPosition,BRW11::View:Browse,Queue:Browse:3,Relate:Phone,SELF) ! Initialize the browse manager
  SPY:Number = CLI:Class
  GET(Specialty,SPY:OrderKey)
  IF ERRORCODE()
    CLEAR(SPY:Record)
  .
  locSpecialty = SPY:Description
  
  
  COU:Number = CLI:Courier
  GET(Courier,COU:OrderKey)
  IF ERRORCODE()
    CLEAR(COU:Record)
  .
  locCourier = COU:Description
  
  
  BOT:Code = CLI:BOTANICAL
  GET(Botanical,BOT:OrderKey)
  IF ERRORCODE()
    CLEAR(BOT:Record)
  .
  locBotanical = BOT:Description
  locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3  & CLI:Physician2
  CLEAR(PAT:RECORD)
  
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                    ! Configure controls for View Only mode
    ?CLI:LAST{PROP:ReadOnly} = True
    ?CLI:FIRST{PROP:ReadOnly} = True
    ?CLI:DEGREE{PROP:ReadOnly} = True
    ?CLI:ADDRESS1{PROP:ReadOnly} = True
    ?CLI:ADDRESS2{PROP:ReadOnly} = True
    ?CLI:CITY{PROP:ReadOnly} = True
    ?CLI:STATE{PROP:ReadOnly} = True
    ?CLI:Country{PROP:ReadOnly} = True
    ?CLI:ZIP{PROP:ReadOnly} = True
    ?locEmail{PROP:ReadOnly} = True
    ?CLI:CONTACT{PROP:ReadOnly} = True
    ?CLI:PHONE{PROP:ReadOnly} = True
    ?CLI:FAX{PROP:ReadOnly} = True
    DISABLE(?Botanical)
    DISABLE(?Courier)
    ?CLI:HOLD{PROP:ReadOnly} = True
    ?CLI:NUMBER{PROP:ReadOnly} = True
    ?CLI:BILLING{PROP:ReadOnly} = True
    DISABLE(?BUTTON1)
    ?CLI:SUPPLY{PROP:ReadOnly} = True
    DISABLE(?EmailButton)
    DISABLE(?FaxButton:)
    DISABLE(?CalcSupply)
    DISABLE(?AddSuppliesButton)
    DISABLE(?NewPickupButton)
    ?CLI:FOLLOW1{PROP:ReadOnly} = True
    ?CLI:FOLLOW2{PROP:ReadOnly} = True
    DISABLE(?ButtonClearFollowupDate)
    DISABLE(?ButtonSetFollowupDate)
    DISABLE(?AddPhone)
    DISABLE(?DeletePhone)
    DISABLE(?EditPhone)
    DISABLE(?AddPhysician)
    DISABLE(?PhysicianDeleteButton)
    DISABLE(?FollowupButton)
    DISABLE(?EditPhysicianButton)
    DISABLE(?locChemical:Prompt)
    DISABLE(?STRING11)
    DISABLE(?STRING12)
    ?FEE:TIgE{PROP:ReadOnly} = True
    ?FEE:TIgG{PROP:ReadOnly} = True
    ?FEE:TIgA{PROP:ReadOnly} = True
    ?FEE:TIgM{PROP:ReadOnly} = True
    ?FEE:IgE{PROP:ReadOnly} = True
    ?FEE:IgG{PROP:ReadOnly} = True
    ?FEE:IgG4{PROP:ReadOnly} = True
    ?FEE:mxIgE{PROP:ReadOnly} = True
    ?FEE:mxIgG{PROP:ReadOnly} = True
    ?FEE:mxIgG4{PROP:ReadOnly} = True
    ?FEE:hyIgE{PROP:ReadOnly} = True
    ?FEE:hyIgG{PROP:ReadOnly} = True
    ?FEE:hyIgG4{PROP:ReadOnly} = True
    ?FEE:occIgE{PROP:ReadOnly} = True
    ?FEE:occIgG{PROP:ReadOnly} = True
    ?FEE:occIgG4{PROP:ReadOnly} = True
    ?FEE:chemIgE{PROP:ReadOnly} = True
    ?FEE:chemIgG{PROP:ReadOnly} = True
    ?FEE:chemIgG4{PROP:ReadOnly} = True
    ?FEE:ComponentIgE{PROP:ReadOnly} = True
    ?FEE:ComponentIgG{PROP:ReadOnly} = True
    ?FEE:ComponentIgG4{PROP:ReadOnly} = True
    ?FEE:Panel260{PROP:ReadOnly} = True
    ?FEE:Panel260S145{PROP:ReadOnly} = True
    ?FEE:Panel270{PROP:ReadOnly} = True
    ?FEE:Virus{PROP:ReadOnly} = True
    DISABLE(?SendEmail)
    DISABLE(?Button4)
    DISABLE(?Patients)
    DISABLE(?ButtonPassword)
    DISABLE(?SendFaxbutton)
  END
  BRW8.Q &= Queue:Browse
  BRW8.AddSortOrder(,SUP:ClientKey)               ! Add the sort order for SUP:ClientKey for sort order 1
  BRW8.AddRange(SUP:Client,CLI:NUMBER)            ! Add single value range limit for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,SUP:Shipped,1,BRW8)   ! Initialize the browse locator using  using key: SUP:ClientKey , SUP:Shipped
  BRW8.AddField(SUP:Date,BRW8.Q.SUP:Date)         ! Field SUP:Date is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Initials,BRW8.Q.SUP:Initials) ! Field SUP:Initials is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Quantity,BRW8.Q.SUP:Quantity) ! Field SUP:Quantity is a hot field or requires assignment from browse
  BRW8.AddField(SUP:ShipDate,BRW8.Q.SUP:ShipDate) ! Field SUP:ShipDate is a hot field or requires assignment from browse
  BRW8.AddField(SUP:ShippedVia,BRW8.Q.SUP:ShippedVia) ! Field SUP:ShippedVia is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Note,BRW8.Q.SUP:Note)         ! Field SUP:Note is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Client,BRW8.Q.SUP:Client)     ! Field SUP:Client is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Shipped,BRW8.Q.SUP:Shipped)   ! Field SUP:Shipped is a hot field or requires assignment from browse
  BRW7.Q &= Queue:Browse:1
  BRW7.AddSortOrder(,PU:ClientKey)                ! Add the sort order for PU:ClientKey for sort order 1
  BRW7.AddRange(PU:Client,CLI:NUMBER)             ! Add single value range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,PU:Received,1,BRW7)   ! Initialize the browse locator using  using key: PU:ClientKey , PU:Received
  ?List:2{PROP:IconList,1} = '~SteelCheckOff.ico'
  ?List:2{PROP:IconList,2} = '~SteelCheckOn.ico'
  BRW7.AddField(PU:Received,BRW7.Q.PU:Received)   ! Field PU:Received is a hot field or requires assignment from browse
  BRW7.AddField(PU:Date,BRW7.Q.PU:Date)           ! Field PU:Date is a hot field or requires assignment from browse
  BRW7.AddField(PU:Inititals,BRW7.Q.PU:Inititals) ! Field PU:Inititals is a hot field or requires assignment from browse
  BRW7.AddField(PU:ContactName,BRW7.Q.PU:ContactName) ! Field PU:ContactName is a hot field or requires assignment from browse
  BRW7.AddField(PU:Note,BRW7.Q.PU:Note)           ! Field PU:Note is a hot field or requires assignment from browse
  BRW7.AddField(PU:Client,BRW7.Q.PU:Client)       ! Field PU:Client is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:2
  BRW9.AddSortOrder(,PHY:OrderKey)                ! Add the sort order for PHY:OrderKey for sort order 1
  BRW9.AddRange(PHY:Client,CLI:NUMBER)            ! Add single value range limit for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,PHY:Last,1,BRW9)      ! Initialize the browse locator using  using key: PHY:OrderKey , PHY:Last
  BRW9.AddField(PHY:Last,BRW9.Q.PHY:Last)         ! Field PHY:Last is a hot field or requires assignment from browse
  BRW9.AddField(PHY:First,BRW9.Q.PHY:First)       ! Field PHY:First is a hot field or requires assignment from browse
  BRW9.AddField(PHY:Physician,BRW9.Q.PHY:Physician) ! Field PHY:Physician is a hot field or requires assignment from browse
  BRW9.AddField(PHY:License,BRW9.Q.PHY:License)   ! Field PHY:License is a hot field or requires assignment from browse
  BRW9.AddField(PHY:Upin,BRW9.Q.PHY:Upin)         ! Field PHY:Upin is a hot field or requires assignment from browse
  BRW9.AddField(PHY:Client,BRW9.Q.PHY:Client)     ! Field PHY:Client is a hot field or requires assignment from browse
  BRW11.Q &= Queue:Browse:3
  BRW11.AddSortOrder(,PHO:OrderKey)               ! Add the sort order for PHO:OrderKey for sort order 1
  BRW11.AddRange(PHO:Client,CLI:NUMBER)           ! Add single value range limit for sort order 1
  BRW11.AddLocator(BRW11::Sort0:Locator)          ! Browse has a locator for sort order 1
  BRW11::Sort0:Locator.Init(,PHO:Client,1,BRW11)  ! Initialize the browse locator using  using key: PHO:OrderKey , PHO:Client
  BRW11.AddField(PHO:Phone,BRW11.Q.PHO:Phone)     ! Field PHO:Phone is a hot field or requires assignment from browse
  BRW11.AddField(PHO:Note,BRW11.Q.PHO:Note)       ! Field PHO:Note is a hot field or requires assignment from browse
  BRW11.AddField(PHO:Client,BRW11.Q.PHO:Client)   ! Field PHO:Client is a hot field or requires assignment from browse
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  PopupMgr10.Init(INIMgr)
  PopupMgr10.AddItem('Edit','Edit')
  PopupMgr10.AddItemMimic('Edit',?EditPhysicianButton)
  PopupMgr10.AddItem('AddNew','AddNew')
  PopupMgr10.AddItemMimic('AddNew',?AddPhysician)
  PopupMgr10.AddItem('-','-')
  PopupMgr10.AddItem('Delete','Delete')
  PopupMgr10.AddItemMimic('Delete',?PhysicianDeleteButton)
  PopupMgr12.Init(INIMgr)
  PopupMgr12.AddItem('Edit','Edit')
  PopupMgr12.AddItemMimic('Edit',?EditPhone)
  PopupMgr12.AddItem('Add','Add')
  PopupMgr12.AddItemMimic('Add',?AddPhone)
  PopupMgr12.AddItem('-','-')
  PopupMgr12.AddItem('Delete','Delete')
  PopupMgr12.AddItemMimic('Delete',?DeletePhone)
  BRW8.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW8.ToolbarItem.HelpButton = ?Help
  BRW7.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW7.ToolbarItem.HelpButton = ?Help
  BRW9.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW9.ToolbarItem.HelpButton = ?Help
  BRW11.AddToolbarTarget(Toolbar)                 ! Browse accepts toolbar control
  BRW11.ToolbarItem.HelpButton = ?Help
  BRW11::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW11::FormatManager.Init('Alis8','UpdateClient',1,?List:4,11,BRW11::PopupTextExt,Queue:Browse:3,4,LFM_CFile,LFM_CFile.Record)
  BRW11::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  IF BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN ENABLE(?Patients) ELSE DISABLE(?Patients).
  IF BAND(gloPermissions,ACCESS:WebPassword) THEN ENABLE(?ButtonPassword).
  POST(EVENT:Timer)
  IF CLI:FOLLOW1 THEN CLI:FOLLOW = 1.
  IF CLI:FaxReport THEN CLI:FaxReport = CLIENT:Fax.
  IF CLI:EmailReport THEN CLI:EmailReport = CLIENT:Email.
  IF CLI:HOLD THEN CLI:HOLD = CLI:HOLD.
  IF CLI:EmailReport THEN CLI:EmailReport = CLIENT:Email.
  IF CLI:ConsolidateReports THEN CLI:ConsolidateReports = CLIENT:Consolidate.
  IF ~CLI:Email THEN DISABLE(?SendEmail).
  IF CLI:FOLLOW2 THEN CLI:FOLLOW = 1 ELSE CLI:Follow = 0.
  IF CLI:FOLLOW
    UNHIDE(?AttentionRequired)
  ELSE
    HIDE(?AttentionRequired)
  .
  IF CLI:HOLD
    UNHIDE(?OnHold)
  ELSE
    HIDE(?OnHold)
  .
  IF CLI:Language = 'S' THEN locSpanish = 16.
  DO DisplaySelected
  IF ~INRANGE(CLI:FollowupDate,50000,90000) THEN CLI:FollowupDate = 0.
  
  FEE:Client = CLI:BILLING
  GET(Fees,FEE:OrderKey)
  IF ERRORCODE()  
    FEE:Client = 999992
    GET(Fees,FEE:OrderKey)
    IF ERRORCODE() THEN STOP('GET DEFAULT FEES ADD: ' & ERROR()).
    FEE:Client  = CLI:BILLING
    ADD(Fees)
    IF ERRORCODE() THEN STOP('ADD FEE: ' & ERROR()).
  .
  IF FEE:IgE = 0
    FEE:Client = 999992
    GET(Fees,FEE:OrderKey)
    IF ERRORCODE() THEN STOP('GET DEFAULT FEES PUT: ' & ERROR()).
    locFeeRecord = FEE:Record
    FEE:Client  = CLI:BILLING
    GET(Fees,FEE:OrderKey)
    FEE:Record = locFeeRecord
    FEE:Client  = CLI:BILLING
    PUT(Fees)
    IF ERRORCODE() THEN STOP('PUT FEES: ' & ERROR()).
  .   
    
    
  BRW8::AutoSizeColumn.Init()
  BRW8::AutoSizeColumn.AddListBox(?List,Queue:Browse)
  BRW7::AutoSizeColumn.Init()
  BRW7::AutoSizeColumn.AddListBox(?List:2,Queue:Browse:1)
  BRW9::AutoSizeColumn.Init()
  BRW9::AutoSizeColumn.AddListBox(?List:3,Queue:Browse:2)
  BRW11::AutoSizeColumn.Init()
  BRW11::AutoSizeColumn.AddListBox(?List:4,Queue:Browse:3)
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'»',8)
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
  RUN ('CMD /c MKDIR ..\Results\' & CLI:Number)
  OL:Date = TODAY()
  OL:Time = CLOCK()
  OL:Number = CLI:Number
  OL:PCAE = ONLINE:Client + ONLINE:Add
  ADD(Online)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Botanical.Close
    Relate:Client.Close
    Relate:Courier.Close
    Relate:Docs.Close
    Relate:Fees.Close
    Relate:FollowUp.Close
    Relate:Online.Close
    Relate:Physicians.Close
    Relate:Salesman.Close
    Relate:Specialty.Close
  END
  ! List Format Manager destructor
  BRW11::FormatManager.Kill() 
  BRW8::AutoSizeColumn.Kill()
  BRW7::AutoSizeColumn.Kill()
  BRW9::AutoSizeColumn.Kill()
  BRW11::AutoSizeColumn.Kill()
  PopupMgr10.Kill
  PopupMgr12.Kill
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  CLI:REPORTS = 1
  LocCourier = ''
  locBotanical = ''
  locSpecialty = ''
  CLI:ADDRESS2 = 'xxxx'
  PARENT.PrimeFields


ThisWindow.Reset PROCEDURE(BYTE Force=0)

  CODE
  SELF.ForcedReset += Force
  IF QuickWindow{Prop:AcceptAll} THEN RETURN.
  FEE:Client = CLI:NUMBER                                  ! Assign linking field value
  Access:Fees.Fetch(FEE:OrderKey)
  PARENT.Reset(Force)


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
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
    CASE ACCEPTED()
    OF ?CLI:FOLLOW
      IF CLI:FOLLOW2 THEN CLI:FOLLOW = 1 ELSE CLI:FOLLOW = 0.
    OF ?EmailButton
      CLEAR(PAT:RECORD)
    OF ?NewPickupButton
      CLEAR(PU:Record)
    OF ?ButtonSetFollowupDate
      CLI:FollowupDate = TODAY()
      DISPLAY(?CLI:FollowupDate)
    OF ?FollowupButton
      BRW9.UpdateBuffer
      CLI:FOLLOW1 = LEFT(CLIP(CLI:FOLLOW1) & ' ' & PHY:Physician)
      DISPLAY(?CLI:FOLLOW1)
      SELECT(?Tab:3)
      SELECT(?CLI:Follow1)
    OF ?SendEmail
      CLEAR(PAT:RECORD)
    OF ?Patients
      PUT(Client)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?locEmail
      IF CLI:Email
        ENABLE(?SendEmail)
      ELSE
        DISABLE(?SendEmail)
      .
      CLI:Email = locEmail
      CLI:Physician4 = SUB(locEmail,61,40)
      CLI:Physician3 = SUB(locEmail,101,40)
      CLI:Physician2 = SUB(locEmail,141,40)
    OF ?Botanical
      ThisWindow.Update
      GlobalREquest = SelectRecord
      SelectBotanical
      CLI:Botanical = BOT:Code
      locBotanical = BOT:Description
      DISPLAY(?locBotanical)
    OF ?Courier
      ThisWindow.Update
      GlobalREquest = SelectRecord
      SelectCourier
      LocCourier = COU:Description
      DISPLAY(?LocCourier)
      CLI:COURIER = COU:Number
    OF ?CLI:FaxReport
      DO DisplaySelected
      SELECT(?ok)
    OF ?CLI:EmailReport
      DO DisplaySelected
      SELECT(?ok)
    OF ?CLI:Postal
      DO DisplaySelected
      SELECT(?ok)
    OF ?CLI:ConsolidateReports
      SELECT(?ok)
    OF ?CLI:Language
      DO DisplaySelected
      SELECT(?ok)
      IF CLI:Language = 'S' THEN locSpanish = 16 ELSE locSpanish =0.
    OF ?CLI:FOLLOW
      DO DisplaySelected
      SELECT(?ok)
    OF ?CLI:HOLD
      DO DisplaySelected
      SELECT(?ok)
    OF ?CLI:NUMBER
      IF CLI:Number < 100000
        SELECT(?CLI:Number)
      !      I# = MessageBox('Account number must be 6 digits',,,)
      .
      
      IF NOT QuickWindow{PROP:AcceptAll}
        IF Access:Client.TryValidateField(1)               ! Attempt to validate CLI:NUMBER in Client
          SELECT(?CLI:NUMBER)
          CYCLE
        ELSE
          FieldColorQueue.Feq = ?CLI:NUMBER
          GET(FieldColorQueue, FieldColorQueue.Feq)
          IF ERRORCODE() = 0
            ?CLI:NUMBER{PROP:FontColor} = FieldColorQueue.OldColor
            DELETE(FieldColorQueue)
          END
        END
      END
    OF ?BUTTON1
      ThisWindow.Update
      amxUpdateDiet(CLI:Number)
      ThisWindow.Reset
    OF ?EmailButton
      ThisWindow.Update
      DocEmail(DOC:Supplies+locSpanish+DOC:Text)
      ThisWindow.Reset
    OF ?FaxButton:
      ThisWindow.Update
      FaxCover(DOC:Supplies+locSpanish+locEditSuppliesFax)
      ThisWindow.Reset
    OF ?CalcSupply
      ThisWindow.Update
      CLI:SUPPLY = 0
      Pat:CLIENT = CLI:Number
      Pat:DATE = TODAY() - 30
      SET(Pat:CLIENT_KEY,Pat:CLIENT_KEY)
      LOOP
        NEXT(Patient)
        IF Pat:CLIENT <> CLI:NUMBER OR ERRORCODE() THEN BREAK.
        CLI:SUPPLY += 1
      .
      DISPLAY(?CLI:SUPPLY)
      CLEAR(PAT:RECORD)
    OF ?AddSuppliesButton
      ThisWindow.Update
      GlobalRequest = InsertRecord
      UpdateSupplies()
      ThisWindow.Reset
        BRW8.ResetFromFile
    OF ?NewPickupButton
      ThisWindow.Update
      GlobalRequest = InsertRecord
      UpdatePickUp()
      ThisWindow.Reset
      BRW7.ResetFromFile
    OF ?CLI:FOLLOW2
      IF CLI:FOLLOW2  AND CLI:FollowupDate
        CLI:FOLLOW = 1
      ELSE
        CLI:FOLLOW = 0
        CLI:FollowupDate = 0
      .
      DISPLAY()
      
    OF ?ButtonClearFollowupDate
      ThisWindow.Update
      CLI:FollowupDate = 0
      DISPLAY(?CLI:FollowupDate)
    OF ?AddPhone
      ThisWindow.Update
      GlobalRequest = InsertRecord
      UpdatePhone()
      ThisWindow.Reset
      BRW11.ResetFromfile
    OF ?DeletePhone
      ThisWindow.Update
      GlobalRequest = DeleteRecord
      UpdatePhone()
      ThisWindow.Reset
      BRW11.ResetFromfile
    OF ?EditPhone
      ThisWindow.Update
      GlobalRequest = ChangeRecord
      UpdatePhone()
      ThisWindow.Reset
      BRW11.ResetFromFile
    OF ?AddPhysician
      ThisWindow.Update
      GlobalRequest = InsertRecord
      UpdatePhysician()
      ThisWindow.Reset
      BRW9.ResetFromfile
    OF ?PhysicianDeleteButton
      ThisWindow.Update
      GlobalRequest = DeleteRecord
      UpdatePhysician()
      ThisWindow.Reset
      BRW9.ResetFromfile
    OF ?EditPhysicianButton
      ThisWindow.Update
      GlobalRequest = ChangeRecord
      UpdatePhysician()
      ThisWindow.Reset
    OF ?SendEmail
      ThisWindow.Update
      DocEmail(locSpanish)
      ThisWindow.Reset
    OF ?Button4
      ThisWindow.Update
      ClientPanels()
      ThisWindow.Reset
    OF ?Patients
      ThisWindow.Update
      ClientPatients()
      ThisWindow.Reset
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ButtonPassword
      ThisWindow.Update
      URLHandler(QuickWindow{prop:handle},'https://amxemr.com/gP.php?c=' & CLI:Number & '&amp;p=MDkwNzEy')
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
    IF CLI:FOLLOW
      UNHIDE(?AttentionRequired)
    ELSE
      HIDE(?AttentionRequired)
    .
    IF CLI:HOLD
      UNHIDE(?OnHold)
    ELSE
      HIDE(?OnHold)
    .
  EnhancedFocusManager.TakeEvent()
  IF BRW8::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW7::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW9::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW11::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
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
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = 5   ! Supplies ?List  BRW8 Queue:Browse  SUP:ClientKey=SUP:Client,SUP:ShipDate,SUP:Shipped
        BRW8.UpdateBuffer
        SUP:Client = CLI:Number
        GET(Supplies,SUP:ClientKey)
        IF ERRORCODE() THEN STOP('GET SUP: ' & ERROR()).
        globalRequest = ChangeRecord
        UpdateSupplies
      .
      !
    END
  OF ?List:2
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = 5  ! PickUp  ?List:2  BRW7  Queue:Browse:1  PU:DateKey=PU:Client,PU:Received,PU:Date
        BRW7.UpdateBuffer
        GET(PickUp,PU:ClientKey)
        IF ERRORCODE() THEN STOP('GET PU: ' & ERROR()).
        globalRequest = ChangeRecord
        UpdatePickUp
      .
    END
  OF ?List:4
    CASE EVENT()
    OF EVENT:AlertKey
      BRW9.UpdateBuffer !    Physicians  ?List:3  BRW9 Queue:Browse:2  PHY:OrderKey=PHY:Client,PHY:Physician
      GET(Physicians,PHY:OrderKey)
      
      
      locMenu=PopupMgr12.Ask()
    END
  OF ?List:3
    CASE EVENT()
    OF EVENT:AlertKey
      BRW11.UpdateBuffer   !  Phone   ?List:4   BRW11 Queue:Browse:3  PHO:OrderKey=PHO:Client
      GET(Phone,PHO:PhoneKey)
      locMenu=PopupMgr10.Ask()
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:AlertKey
        BRW8.ResetFromFile
      !
    END
  OF ?List:2
    CASE EVENT()
    OF EVENT:AlertKey
      BRW7.ResetFromFile
    END
  OF ?List:4
    CASE EVENT()
    OF EVENT:AlertKey
      BRW9.ResetFromFile
    END
  OF ?List:3
    CASE EVENT()
    OF EVENT:AlertKey
      BRW11.ResetFromFile
    END
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
    OF EVENT:OpenWindow
      IF  CLI:Postal = '1' THEN CLI:Postal = 'Y'; PUT(Client).
      IF  CLI:Postal = '0' THEN CLI:Postal = 'N'; PUT(Client).
      
      POST(EVENT:Accepted,?CalcSupply)
      
    OF EVENT:Timer
      IF ~BAND(gloPermissions,ACCESS:Clients+ACCESS:EditClients) THEN POST(EVENT:CloseWindow) .
      IF BAND(gloPermissions,ACCESS:EditClients) THEN ENABLE(?OK).
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW8.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.SUP:Date_Style = 1 ! 
  SELF.Q.SUP:Initials_Style = 1 ! 
  SELF.Q.SUP:Quantity_Style = 1 ! 
  SELF.Q.SUP:ShipDate_Style = 1 ! 
  SELF.Q.SUP:ShippedVia_Style = 1 ! 
  SELF.Q.SUP:Note_Style = 1 ! 


BRW7.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PU:Received_Style = 1 ! 
  SELF.Q.PU:Date_Style = 1 ! 
  SELF.Q.PU:Inititals_Style = 1 ! 
  SELF.Q.PU:ContactName_Style = 1 ! 
  SELF.Q.PU:Note_Style = 1 ! 
  IF (~PU:Received)
    SELF.Q.PU:Received_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.PU:Received_Icon = 2                            ! Set icon from icon list
  END


BRW9.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PHY:Last_Style = 1 ! 
  SELF.Q.PHY:First_Style = 1 ! 
  SELF.Q.PHY:Physician_Style = 1 ! 
  SELF.Q.PHY:License_Style = 1 ! 
  SELF.Q.PHY:Upin_Style = 1 ! 


BRW11.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PHO:Phone_Style = 1 ! 
  SELF.Q.PHO:Note_Style = 1 ! 


BRW11.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW11::LastSortOrder <> NewOrder THEN
     BRW11::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW11::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW11.TakeNewSelection PROCEDURE

  CODE
  IF BRW11::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW11::PopupTextExt = ''
        BRW11::PopupChoiceExec = True
        BRW11::FormatManager.MakePopup(BRW11::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW11::PopupTextExt = '|-|' & CLIP(BRW11::PopupTextExt)
        END
        BRW11::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW11::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW11::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW11::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW11::PopupChoiceOn AND BRW11::PopupChoiceExec THEN
     BRW11::PopupChoiceExec = False
     BRW11::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW11::PopupTextExt)
     IF BRW11::FormatManager.DispatchChoice(BRW11::PopupChoice)
     ELSE
     END
  END

