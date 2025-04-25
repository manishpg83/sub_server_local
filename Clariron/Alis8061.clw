

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8061.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8040.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8042.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8048.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8058.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8064.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8067.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8069.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8070.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8071.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
ToDo PROCEDURE 

locCutoff            LONG                                  !
locClientName        STRING(40)                            !
locMenuSO            STRING(20)                            !
locAddress           STRING(40)                            !
locEmail             STRING(140)                           !
locMenu              STRING(20)                            !
BRW1::View:Browse    VIEW(Supplies)
                       PROJECT(SUP:Shipped)
                       PROJECT(SUP:Client)
                       PROJECT(SUP:Date)
                       PROJECT(SUP:ShipDate)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List:Supplies:BRW1
SUP:Shipped            LIKE(SUP:Shipped)              !List box control field - type derived from field
SUP:Shipped_NormalFG   LONG                           !Normal forground color
SUP:Shipped_NormalBG   LONG                           !Normal background color
SUP:Shipped_SelectedFG LONG                           !Selected forground color
SUP:Shipped_SelectedBG LONG                           !Selected background color
SUP:Shipped_Icon       LONG                           !Entry's icon ID
SUP:Shipped_Style      LONG                           !Field style
SUP:Client             LIKE(SUP:Client)               !List box control field - type derived from field
SUP:Client_NormalFG    LONG                           !Normal forground color
SUP:Client_NormalBG    LONG                           !Normal background color
SUP:Client_SelectedFG  LONG                           !Selected forground color
SUP:Client_SelectedBG  LONG                           !Selected background color
SUP:Client_Style       LONG                           !Field style
SUP:Date               LIKE(SUP:Date)                 !List box control field - type derived from field
SUP:Date_NormalFG      LONG                           !Normal forground color
SUP:Date_NormalBG      LONG                           !Normal background color
SUP:Date_SelectedFG    LONG                           !Selected forground color
SUP:Date_SelectedBG    LONG                           !Selected background color
SUP:Date_Style         LONG                           !Field style
SUP:ShipDate           LIKE(SUP:ShipDate)             !List box control field - type derived from field
SUP:ShipDate_NormalFG  LONG                           !Normal forground color
SUP:ShipDate_NormalBG  LONG                           !Normal background color
SUP:ShipDate_SelectedFG LONG                          !Selected forground color
SUP:ShipDate_SelectedBG LONG                          !Selected background color
SUP:ShipDate_Style     LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW2::View:Browse    VIEW(ToDo)
                       PROJECT(ToD:Description)
                       PROJECT(ToD:ID)
                       PROJECT(ToD:Due)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:Exceptions:BRW2
ToD:Description        LIKE(ToD:Description)          !List box control field - type derived from field
ToD:Description_Style  LONG                           !Field style
ToD:ID                 LIKE(ToD:ID)                   !List box control field - type derived from field
ToD:Due                LIKE(ToD:Due)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW3::View:Browse    VIEW(SpecimenReceived)
                       PROJECT(SR:Date)
                       PROJECT(SR:Patient)
                       PROJECT(SR:Client)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:Confirmation:BRW3
SR:Date                LIKE(SR:Date)                  !List box control field - type derived from field
SR:Date_Style          LONG                           !Field style
SR:Patient             LIKE(SR:Patient)               !List box control field - type derived from field
SR:Patient_Style       LONG                           !Field style
SR:Client              LIKE(SR:Client)                !List box control field - type derived from field
SR:Client_Style        LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW4::View:Browse    VIEW(PickUp)
                       PROJECT(PU:Received)
                       PROJECT(PU:Date)
                       PROJECT(PU:Client)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:PickUp:BRW4
PU:Received            LIKE(PU:Received)              !List box control field - type derived from field
PU:Received_NormalFG   LONG                           !Normal forground color
PU:Received_NormalBG   LONG                           !Normal background color
PU:Received_SelectedFG LONG                           !Selected forground color
PU:Received_SelectedBG LONG                           !Selected background color
PU:Received_Icon       LONG                           !Entry's icon ID
PU:Received_Style      LONG                           !Field style
PU:Date                LIKE(PU:Date)                  !List box control field - type derived from field
PU:Date_NormalFG       LONG                           !Normal forground color
PU:Date_NormalBG       LONG                           !Normal background color
PU:Date_SelectedFG     LONG                           !Selected forground color
PU:Date_SelectedBG     LONG                           !Selected background color
PU:Date_Style          LONG                           !Field style
PU:Client              LIKE(PU:Client)                !List box control field - type derived from field
PU:Client_NormalFG     LONG                           !Normal forground color
PU:Client_NormalBG     LONG                           !Normal background color
PU:Client_SelectedFG   LONG                           !Selected forground color
PU:Client_SelectedBG   LONG                           !Selected background color
PU:Client_Style        LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW5::View:Browse    VIEW(SendOuts)
                       PROJECT(SO:Date)
                       PROJECT(SO:Patient)
                     END
Queue:Browse:4       QUEUE                            !Queue declaration for browse/combo box using ?List:Sendout:BRW5
SO:Date                LIKE(SO:Date)                  !List box control field - type derived from field
SO:Date_Style          LONG                           !Field style
SO:Patient             LIKE(SO:Patient)               !List box control field - type derived from field
SO:Patient_Style       LONG                           !Field style
Pat:STATUS             LIKE(Pat:STATUS)               !List box control field - type derived from field
Pat:STATUS_Style       LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(0,0,506,330),FONT('Arial',11,,FONT:regular),GRAY,IMM,MDI
                       STRING(@s40),AT(220,286,,8),USE(locClientName),FONT(,10,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING(@s24),AT(220,292,,8),USE(CLI:CONTACT),FONT(,10,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING(@s35),AT(220,304,,8),USE(CLI:ADDRESS1),FONT(,10,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING(@s40),AT(220,298,,8),USE(locAddress),FONT(,10,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING(@s100),AT(220,310,,8),USE(locEmail),FONT(,10,,FONT:bold,CHARSET:DEFAULT),TRN
                       STRING('Pick Up'),AT(0,4,89,11),USE(?String4),FONT(,,,FONT:bold),CENTER,TRN
                       BUTTON('Print'),AT(0,286,89,11),USE(?ButtonPrintPickup),FONT(,,,FONT:bold),TRN
                       STRING('Supplies'),AT(92,4,125,11),USE(?String1),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Sendouts'),AT(218,4,79,11),USE(?String10),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Confirmation'),AT(290,4,111,11),USE(?String3),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Exceptions'),AT(402,4,104,11),USE(?String2),FONT(,,,FONT:bold),CENTER,TRN
                       LIST,AT(0,12,89,253),USE(?List:PickUp:BRW4),VSCROLL,ALRT(MouseCenter),FORMAT('10C|M*IY@n' & |
  '1@32L(2)|M*Y~Date~@d1@28L(2)|M*Y~Client~C@p### ###p@'),FROM(Queue:Browse:3),IMM,MSG('Browsing Records'), |
  NOBAR,TRN
                       LIST,AT(92,12,125,253),USE(?List:Supplies:BRW1),VSCROLL,ALRT(MouseCenter),FORMAT('10L(2)|M*I' & |
  'Y@n3@32C(2)|M*Y~Client~@p### ###p@35R(2)|M*Y~Date~L@d1@33L|M*Y~Ship Date~@d1b@'),FROM(Queue:Browse), |
  IMM,MSG('Browsing Records'),NOBAR,TRN
                       LIST,AT(402,12,104,253),USE(?List:Exceptions:BRW2),FORMAT('256L(2)|MY~Description~L(0)@' & |
  's64@52L(2)|M~ID~L(1)@n13@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records'),NOBAR,TRN
                       LIST,AT(218,12,79,253),USE(?List:Sendout:BRW5),FONT(,,,FONT:regular),FORMAT('33L(2)|MY~' & |
  'Date~@d1@28L(2)|MY~Patient~@p### ###p@4C|MY~S~@s1@'),FROM(Queue:Browse:4),IMM,MSG('Browsing Records'), |
  NOBAR,TRN
                       LIST,AT(300,12,101,253),USE(?List:Confirmation:BRW3),ALRT(MouseCenter),FORMAT('32L|MY~Dat' & |
  'e~@d1@30C|MY~Patient~C(2)@p### ###p@28C|MY~Client~C(2)@p### ###p@'),FROM(Queue:Browse:2), |
  IMM,MSG('Browsing Records'),NOBAR,TRN
                       BUTTON('Done'),AT(420,290,71,26),USE(?OkButton),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DEFAULT,STD(STD:Close),TRN
                       IMAGE('button.jpg'),AT(420,290,71,26),USE(?Image1)
                       PANEL,AT(300,12,101,254),USE(?Panel3)
                       PANEL,AT(92,12,125,254),USE(?Panel2)
                       PANEL,AT(402,12,105,254),USE(?Panel4)
                       PANEL,AT(0,12,89,254),USE(?Panel1)
                       BUTTON('&Insert'),AT(220,269,20,12),USE(?Insert),HIDE
                       BUTTON,AT(236,266,22,16),USE(?Change),ICON('SteelDelta.ico'),FLAT,TRN
                       BUTTON,AT(261,266,22,16),USE(?Delete),ICON('SteelDelete.ico'),FLAT,TRN
                       BUTTON('&Insert'),AT(358,289,42,12),USE(?Insert:2),HIDE
                       BUTTON,AT(435,266,22,16),USE(?Change:2),RIGHT,ICON('SteelDelta.ico'),FLAT,TRN
                       BUTTON,AT(460,266,22,16),USE(?Delete:2),LEFT,ICON('SteelDelete.ico'),FLAT,TRN
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW2::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW3::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW4::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW5::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List:Supplies:BRW1
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeAcceptedLocator    PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW2                 CLASS(BrowseClass)                    ! Browse using ?List:Exceptions:BRW2
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
TakeAcceptedLocator    PROCEDURE(),DERIVED
                     END

BRW2::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW3                 CLASS(BrowseClass)                    ! Browse using ?List:Confirmation:BRW3
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeAcceptedLocator    PROCEDURE(),DERIVED
                     END

BRW3::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW4                 CLASS(BrowseClass)                    ! Browse using ?List:PickUp:BRW4
Q                      &Queue:Browse:3                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeAcceptedLocator    PROCEDURE(),DERIVED
                     END

BRW4::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW5                 CLASS(BrowseClass)                    ! Browse using ?List:Sendout:BRW5
Q                      &Queue:Browse:4                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeAcceptedLocator    PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW5::Sort0:Locator  StepLocatorClass                      ! Default Locator
PopupMgr8            PopupClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?List:PickUp:BRW4
  !------------------------------------
  ?List:PickUp:BRW4{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:PickUp:BRW4{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:PickUp:BRW4{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:PickUp:BRW4{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:PickUp:BRW4{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:PickUp:BRW4{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:PickUp:BRW4{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  ?List:PickUp:BRW4{PROPSTYLE:FontName, 2}      = gloListFont
  ?List:PickUp:BRW4{PROPSTYLE:FontSize, 2}      = gloListFontSize
  ?List:PickUp:BRW4{PROPSTYLE:FontStyle, 2}     = 700
  ?List:PickUp:BRW4{PROPSTYLE:TextColor, 2}     = -1
  ?List:PickUp:BRW4{PROPSTYLE:BackColor, 2}     = -1
  ?List:PickUp:BRW4{PROPSTYLE:TextSelected, 2}  = -1
  ?List:PickUp:BRW4{PROPSTYLE:BackSelected, 2}  = -1
  !------------------------------------
  !------------------------------------
  !Style for ?List:Supplies:BRW1
  !------------------------------------
  ?List:Supplies:BRW1{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Supplies:BRW1{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Supplies:BRW1{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Supplies:BRW1{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Supplies:BRW1{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:Supplies:BRW1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Supplies:BRW1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  ?List:Supplies:BRW1{PROPSTYLE:FontName, 2}      = gloListFont
  ?List:Supplies:BRW1{PROPSTYLE:FontSize, 2}      = gloListFontSize
  ?List:Supplies:BRW1{PROPSTYLE:FontStyle, 2}     = 700
  ?List:Supplies:BRW1{PROPSTYLE:TextColor, 2}     = -1
  ?List:Supplies:BRW1{PROPSTYLE:BackColor, 2}     = -1
  ?List:Supplies:BRW1{PROPSTYLE:TextSelected, 2}  = -1
  ?List:Supplies:BRW1{PROPSTYLE:BackSelected, 2}  = -1
  !------------------------------------
  !------------------------------------
  !Style for ?List:Exceptions:BRW2
  !------------------------------------
  ?List:Exceptions:BRW2{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Exceptions:BRW2{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Exceptions:BRW2{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Exceptions:BRW2{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Exceptions:BRW2{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:Exceptions:BRW2{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Exceptions:BRW2{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  ?List:Exceptions:BRW2{PROPSTYLE:FontName, 2}      = gloListFont
  ?List:Exceptions:BRW2{PROPSTYLE:FontSize, 2}      = gloListFontSize
  ?List:Exceptions:BRW2{PROPSTYLE:FontStyle, 2}     = 700
  ?List:Exceptions:BRW2{PROPSTYLE:TextColor, 2}     = -1
  ?List:Exceptions:BRW2{PROPSTYLE:BackColor, 2}     = -1
  ?List:Exceptions:BRW2{PROPSTYLE:TextSelected, 2}  = -1
  ?List:Exceptions:BRW2{PROPSTYLE:BackSelected, 2}  = -1
  !------------------------------------
  !------------------------------------
  !Style for ?List:Sendout:BRW5
  !------------------------------------
  ?List:Sendout:BRW5{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Sendout:BRW5{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Sendout:BRW5{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Sendout:BRW5{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Sendout:BRW5{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:Sendout:BRW5{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Sendout:BRW5{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  ?List:Sendout:BRW5{PROPSTYLE:FontName, 2}      = gloListFont
  ?List:Sendout:BRW5{PROPSTYLE:FontSize, 2}      = gloListFontSize
  ?List:Sendout:BRW5{PROPSTYLE:FontStyle, 2}     = 700
  ?List:Sendout:BRW5{PROPSTYLE:TextColor, 2}     = -1
  ?List:Sendout:BRW5{PROPSTYLE:BackColor, 2}     = -1
  ?List:Sendout:BRW5{PROPSTYLE:TextSelected, 2}  = -1
  ?List:Sendout:BRW5{PROPSTYLE:BackSelected, 2}  = -1
  !------------------------------------
  !------------------------------------
  !Style for ?List:Confirmation:BRW3
  !------------------------------------
  ?List:Confirmation:BRW3{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Confirmation:BRW3{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Confirmation:BRW3{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Confirmation:BRW3{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Confirmation:BRW3{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List:Confirmation:BRW3{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Confirmation:BRW3{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  ?List:Confirmation:BRW3{PROPSTYLE:FontName, 2}      = gloListFont
  ?List:Confirmation:BRW3{PROPSTYLE:FontSize, 2}      = gloListFontSize
  ?List:Confirmation:BRW3{PROPSTYLE:FontStyle, 2}     = 700
  ?List:Confirmation:BRW3{PROPSTYLE:TextColor, 2}     = -1
  ?List:Confirmation:BRW3{PROPSTYLE:BackColor, 2}     = -1
  ?List:Confirmation:BRW3{PROPSTYLE:TextSelected, 2}  = -1
  ?List:Confirmation:BRW3{PROPSTYLE:BackSelected, 2}  = -1
  !------------------------------------
!---------------------------------------------------------------------------
ShowClient  ROUTINE
  CASE FIELD()
  OF ?List:Supplies:BRW1
    CLI:Number = SUP:Client
  OF ?List:Exceptions:BRW2
    CLI:Number = TOD:Client
  OF ?List:Confirmation:BRW3
    CLI:Number = SR:Client
  OF ?List:PickUp:BRW4
    CLI:Number = PU:Client
  OF ?List:Sendout:BRW5
    Pat:INVOICE = SO:Patient
    GET(Patient,PAT:Invoice_Key)
    CLI:Number = PAT:Client
  .
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE() OR ~CLI:Number
    CLEAR(CLI:Record)
    locClientName =  ''
    locAddress = ''
    locEmail = ''
  ELSE
    locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
    locAddress = CLIP(CLI:City) & ', ' & CLI:State & ' ' & CLI:Zip
    locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3
  .
  DISPLAY()


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ToDo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?locClientName
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locCutoff',locCutoff)                              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                         ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?List:Supplies:BRW1,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:Supplies,SELF) ! Initialize the browse manager
  BRW2.Init(?List:Exceptions:BRW2,Queue:Browse:1.ViewPosition,BRW2::View:Browse,Queue:Browse:1,Relate:ToDo,SELF) ! Initialize the browse manager
  BRW3.Init(?List:Confirmation:BRW3,Queue:Browse:2.ViewPosition,BRW3::View:Browse,Queue:Browse:2,Relate:SpecimenReceived,SELF) ! Initialize the browse manager
  BRW4.Init(?List:PickUp:BRW4,Queue:Browse:3.ViewPosition,BRW4::View:Browse,Queue:Browse:3,Relate:PickUp,SELF) ! Initialize the browse manager
  BRW5.Init(?List:Sendout:BRW5,Queue:Browse:4.ViewPosition,BRW5::View:Browse,Queue:Browse:4,Relate:SendOuts,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,SUP:FindUnShippedKey)                 ! Add the sort order for SUP:FindUnShippedKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SUP:Shipped,1,BRW1)            ! Initialize the browse locator using  using key: SUP:FindUnShippedKey , SUP:Shipped
  BRW1.SetFilter('(~SUP:Shipped)')                         ! Apply filter expression to browse
  ?List:Supplies:BRW1{PROP:IconList,1} = '~SteelCheckOff.ico'
  ?List:Supplies:BRW1{PROP:IconList,2} = '~SteelCheckOn.ico'
  BRW1.AddField(SUP:Shipped,BRW1.Q.SUP:Shipped)            ! Field SUP:Shipped is a hot field or requires assignment from browse
  BRW1.AddField(SUP:Client,BRW1.Q.SUP:Client)              ! Field SUP:Client is a hot field or requires assignment from browse
  BRW1.AddField(SUP:Date,BRW1.Q.SUP:Date)                  ! Field SUP:Date is a hot field or requires assignment from browse
  BRW1.AddField(SUP:ShipDate,BRW1.Q.SUP:ShipDate)          ! Field SUP:ShipDate is a hot field or requires assignment from browse
  BRW2.Q &= Queue:Browse:1
  BRW2.AddSortOrder(,ToD:DateKey)                          ! Add the sort order for ToD:DateKey for sort order 1
  BRW2.AddLocator(BRW2::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW2::Sort0:Locator.Init(,ToD:Due,1,BRW2)                ! Initialize the browse locator using  using key: ToD:DateKey , ToD:Due
  BRW2.SetFilter('(ToD:Date>locCutoff)')                   ! Apply filter expression to browse
  BRW2.AddField(ToD:Description,BRW2.Q.ToD:Description)    ! Field ToD:Description is a hot field or requires assignment from browse
  BRW2.AddField(ToD:ID,BRW2.Q.ToD:ID)                      ! Field ToD:ID is a hot field or requires assignment from browse
  BRW2.AddField(ToD:Due,BRW2.Q.ToD:Due)                    ! Field ToD:Due is a hot field or requires assignment from browse
  BRW3.Q &= Queue:Browse:2
  BRW3.AddSortOrder(,SR:OrderKey)                          ! Add the sort order for SR:OrderKey for sort order 1
  BRW3.AddLocator(BRW3::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW3::Sort0:Locator.Init(,SR:Date,1,BRW3)                ! Initialize the browse locator using  using key: SR:OrderKey , SR:Date
  BRW3.AddField(SR:Date,BRW3.Q.SR:Date)                    ! Field SR:Date is a hot field or requires assignment from browse
  BRW3.AddField(SR:Patient,BRW3.Q.SR:Patient)              ! Field SR:Patient is a hot field or requires assignment from browse
  BRW3.AddField(SR:Client,BRW3.Q.SR:Client)                ! Field SR:Client is a hot field or requires assignment from browse
  BRW4.Q &= Queue:Browse:3
  BRW4.AddSortOrder(,PU:DateKey)                           ! Add the sort order for PU:DateKey for sort order 1
  BRW4.AddLocator(BRW4::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW4::Sort0:Locator.Init(,PU:Received,1,BRW4)            ! Initialize the browse locator using  using key: PU:DateKey , PU:Received
  BRW4.SetFilter('(~PU:Received)')                         ! Apply filter expression to browse
  ?List:PickUp:BRW4{PROP:IconList,1} = '~SteelCheckOff.ico'
  ?List:PickUp:BRW4{PROP:IconList,2} = '~SteelCheckOn.ico'
  BRW4.AddField(PU:Received,BRW4.Q.PU:Received)            ! Field PU:Received is a hot field or requires assignment from browse
  BRW4.AddField(PU:Date,BRW4.Q.PU:Date)                    ! Field PU:Date is a hot field or requires assignment from browse
  BRW4.AddField(PU:Client,BRW4.Q.PU:Client)                ! Field PU:Client is a hot field or requires assignment from browse
  BRW5.Q &= Queue:Browse:4
  BRW5.AddSortOrder(,SO:OrderKey)                          ! Add the sort order for SO:OrderKey for sort order 1
  BRW5.AddLocator(BRW5::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW5::Sort0:Locator.Init(,SO:Patient,1,BRW5)             ! Initialize the browse locator using  using key: SO:OrderKey , SO:Patient
  BRW5.AddField(SO:Date,BRW5.Q.SO:Date)                    ! Field SO:Date is a hot field or requires assignment from browse
  BRW5.AddField(SO:Patient,BRW5.Q.SO:Patient)              ! Field SO:Patient is a hot field or requires assignment from browse
  BRW5.AddField(Pat:STATUS,BRW5.Q.Pat:STATUS)              ! Field Pat:STATUS is a hot field or requires assignment from browse
  BRW5.AskProcedure = 1
  BRW2.AskProcedure = 2
  PopupMgr8.Init(INIMgr)
  PopupMgr8.AddItem('Edit','Edit')
  PopupMgr8.AddItem('Delete','Delete')
  PopupMgr8.AddItem('Add New','AddNew')
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW2.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW3.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW4.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW5.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locCutoff = TODAY() - 30
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?List:Supplies:BRW1,Queue:Browse)
  BRW2::AutoSizeColumn.Init()
  BRW2::AutoSizeColumn.AddListBox(?List:Exceptions:BRW2,Queue:Browse:1)
  BRW3::AutoSizeColumn.Init()
  BRW3::AutoSizeColumn.AddListBox(?List:Confirmation:BRW3,Queue:Browse:2)
  BRW4::AutoSizeColumn.Init()
  BRW4::AutoSizeColumn.AddListBox(?List:PickUp:BRW4,Queue:Browse:3)
  BRW5::AutoSizeColumn.Init()
  BRW5::AutoSizeColumn.AddListBox(?List:Sendout:BRW5,Queue:Browse:4)
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
    Relate:Client.Close
    Relate:SendOuts.Close
    Relate:SpecimenReceived.Close
    Relate:ToDo.Close
  END
  BRW1::AutoSizeColumn.Kill()
  BRW2::AutoSizeColumn.Kill()
  BRW3::AutoSizeColumn.Kill()
  BRW4::AutoSizeColumn.Kill()
  BRW5::AutoSizeColumn.Kill()
  PopupMgr8.Kill
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
    EXECUTE Number
      UpdateSendout
      UpdateToDo
    END
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
    OF ?ButtonPrintPickup
      ThisWindow.Update
      PrintPickup()
      ThisWindow.Reset
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
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW2::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW3::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW4::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW5::AutoSizeColumn.TakeEvents()
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
  OF ?List:PickUp:BRW4
    CASE EVENT()
    OF EVENT:AlertKey
      GET(Pickup,PU:ClientKey)
      IF ERRORCODE() THEN STOP('PU: ' & ERROR()).
      globalRequest = ChangeRecord
      UpdatePickUp()
    END
  OF ?List:Supplies:BRW1
    CASE EVENT()
    OF EVENT:AlertKey
      GET(Supplies,SUP:ClientKey)
      globalRequest = ChangeRecord  
      UpdateSupplies()
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?List:PickUp:BRW4
    CASE EVENT()
    OF EVENT:AlertKey
      BRW4.ResetFromFile
    END
  OF ?List:Supplies:BRW1
    CASE EVENT()
    OF EVENT:AlertKey
      BRW1.ResetFromFile
    END
  OF ?List:Confirmation:BRW3
    CASE EVENT()
    OF EVENT:AlertKey
      GET(SpecimenReceived,SR:OrderKey)
      globalRequest = ChangeRecord
      Confirmation()
      BRW3.ResetFromFile
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
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?List:Exceptions:BRW2
       IF KEYCODE() = MouseRightUp
         BRW2.UpdateBuffer
      locMenu=PopupMgr8.Ask()
        IF locMenu = 'Delete'  
          GET(Todo,ToD:OrderKey)
          GlobalRequest = 3
          UpdateToDo
        ELSIF locMenu = 'Edit'
          GET(Todo,ToD:OrderKey)
          GlobalRequest = 2
          UpdateToDo
        ELSIF locMenu = 'AddNew'
          GlobalRequest = 1
          UpdateToDo
        .
        BRW2.ResetFromFile
      .
    OF ?List:Sendout:BRW5
      IF KEYCODE() = MouseRightUp
        BRW5.UpdateBuffer
        locMenu=PopupMgr8.Ask()
        IF locMenu = 'Delete'  
          GET(Sendouts,SO:OrderKey)
          GlobalRequest = 3
          UpdateSendout
        ELSIF locMenu = 'Edit'
          GET(Sendouts,SO:OrderKey)
          GlobalRequest = 2
          UpdateSendout
        ELSIF locMenu = 'AddNew'
          GlobalRequest = 1
          UpdateSendout
        .
        BRW5.ResetFromFile
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
    OF EVENT:OpenWindow
      OMIT('XXXX')
      SET(Pickup,PU:DateKey)
      NEXT(Pickup)
      SET(SpecimenReceived,SR:OrderKey)
      NEXT(SpecimenReceived)
      SET(Supplies,SUP:FindUnShippedKey)
      NEXT(Supplies)
      SET(Exceptions,EXC:OrderKey)
      NEXT(Exceptions)
      
      BRW1.ResetFromFile
      BRW2.ResetFromFile
      BRW3.ResetFromFile
      BRW4.ResetFromFile
       XXXX
      POST(EVENT:ScrollTop,?List:Exceptions:BRW2)
      POST(EVENT:ScrollTop,?List:Confirmation:BRW3)
      POST(EVENT:ScrollTop,?List:PickUp:BRW4)
      POST(EVENT:ScrollTop,?List:Supplies:BRW1)
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.SUP:Shipped_NormalFG = -1                         ! Set color values for SUP:Shipped
  SELF.Q.SUP:Shipped_NormalBG = -1
  SELF.Q.SUP:Shipped_SelectedFG = -1
  SELF.Q.SUP:Shipped_SelectedBG = -1
  SELF.Q.SUP:Client_NormalFG = -1                          ! Set color values for SUP:Client
  SELF.Q.SUP:Client_NormalBG = -1
  SELF.Q.SUP:Client_SelectedFG = -1
  SELF.Q.SUP:Client_SelectedBG = -1
  SELF.Q.SUP:Date_NormalFG = -1                            ! Set color values for SUP:Date
  SELF.Q.SUP:Date_NormalBG = -1
  SELF.Q.SUP:Date_SelectedFG = -1
  SELF.Q.SUP:Date_SelectedBG = -1
  SELF.Q.SUP:ShipDate_NormalFG = -1                        ! Set color values for SUP:ShipDate
  SELF.Q.SUP:ShipDate_NormalBG = -1
  SELF.Q.SUP:ShipDate_SelectedFG = -1
  SELF.Q.SUP:ShipDate_SelectedBG = -1
  SELF.Q.SUP:Shipped_Style = 1 ! 
  SELF.Q.SUP:Client_Style = 1 ! 
  SELF.Q.SUP:Date_Style = 1 ! 
  SELF.Q.SUP:ShipDate_Style = 1 ! 
  IF (SUP:ShipDate)
    SELF.Q.SUP:Shipped_Icon = 2                            ! Set icon from icon list
  ELSE
    SELF.Q.SUP:Shipped_Icon = 1                            ! Set icon from icon list
  END


BRW1.TakeAcceptedLocator PROCEDURE

  CODE
  PARENT.TakeAcceptedLocator
  CLI:Number = SUP:Client
  DO Showclient


BRW2.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:2
    SELF.ChangeControl=?Change:2
    SELF.DeleteControl=?Delete:2
  END


BRW2.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.ToD:Description_Style = 1 ! 


BRW2.TakeAcceptedLocator PROCEDURE

  CODE
  BRW2.UpdateBuffer
  PARENT.TakeAcceptedLocator
  GET(Todo,ToD:OrderKey)
  DO ShowClient


BRW3.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.SR:Date_Style = 1 ! 
  SELF.Q.SR:Patient_Style = 1 ! 
  SELF.Q.SR:Client_Style = 1 ! 


BRW3.TakeAcceptedLocator PROCEDURE

  CODE
  PARENT.TakeAcceptedLocator
  CLI:Number = SR:Client
  DO ShowClient


BRW4.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PU:Received_NormalFG = -1                         ! Set color values for PU:Received
  SELF.Q.PU:Received_NormalBG = -1
  SELF.Q.PU:Received_SelectedFG = -1
  SELF.Q.PU:Received_SelectedBG = -1
  SELF.Q.PU:Date_NormalFG = -1                             ! Set color values for PU:Date
  SELF.Q.PU:Date_NormalBG = -1
  SELF.Q.PU:Date_SelectedFG = -1
  SELF.Q.PU:Date_SelectedBG = -1
  SELF.Q.PU:Client_NormalFG = -1                           ! Set color values for PU:Client
  SELF.Q.PU:Client_NormalBG = -1
  SELF.Q.PU:Client_SelectedFG = -1
  SELF.Q.PU:Client_SelectedBG = -1
  SELF.Q.PU:Received_Style = 1 ! 
  SELF.Q.PU:Date_Style = 1 ! 
  SELF.Q.PU:Client_Style = 1 ! 
  IF (PU:Received)
    SELF.Q.PU:Received_Icon = 2                            ! Set icon from icon list
  ELSE
    SELF.Q.PU:Received_Icon = 1                            ! Set icon from icon list
  END


BRW4.TakeAcceptedLocator PROCEDURE

  CODE
  PARENT.TakeAcceptedLocator
  CLI:Number = PU:Client
  DO ShowClient


BRW5.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW5.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW5.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.SO:Date_Style = 1 ! 
  SELF.Q.SO:Patient_Style = 1 ! 
  SELF.Q.Pat:STATUS_Style = 1 ! 


BRW5.TakeAcceptedLocator PROCEDURE

  CODE
  PARENT.TakeAcceptedLocator
  DO ShowClient


BRW5.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW5::RecordStatus   BYTE,AUTO
  CODE
  Pat:INVOICE = SO:Patient
  GET(Patient,PAT:Invoice_Key)
  ReturnValue = PARENT.ValidateRecord()
  BRW5::RecordStatus=ReturnValue
  RETURN ReturnValue

