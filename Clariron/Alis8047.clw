

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8047.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8045.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8048.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8058.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8059.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PickUp file
!!! </summary>
FedExTable PROCEDURE 

CurrentTab           STRING(80)                            !
locClient            LONG                                  !
locDOW               STRING(4)                             !
locDayCount          BYTE                                  !
locToday             STRING(30)                            !
locTodayDOW          STRING(9)                             !
locClientName        STRING(40)                            !
locAddress           STRING(40)                            !
locEmail             STRING(180)                           !
locPopupString       STRING(20)                            !
locZero              BYTE(0)                               !
BRW1::View:Browse    VIEW(PickUp)
                       PROJECT(PU:Received)
                       PROJECT(PU:Client)
                       PROJECT(PU:Date)
                       PROJECT(PU:Inititals)
                       PROJECT(PU:ContactName)
                       PROJECT(PU:Note)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PU:Received            LIKE(PU:Received)              !List box control field - type derived from field
PU:Received_NormalFG   LONG                           !Normal forground color
PU:Received_NormalBG   LONG                           !Normal background color
PU:Received_SelectedFG LONG                           !Selected forground color
PU:Received_SelectedBG LONG                           !Selected background color
PU:Received_Icon       LONG                           !Entry's icon ID
PU:Received_Style      LONG                           !Field style
PU:Client              LIKE(PU:Client)                !List box control field - type derived from field
PU:Client_NormalFG     LONG                           !Normal forground color
PU:Client_NormalBG     LONG                           !Normal background color
PU:Client_SelectedFG   LONG                           !Selected forground color
PU:Client_SelectedBG   LONG                           !Selected background color
PU:Client_Style        LONG                           !Field style
locDOW                 LIKE(locDOW)                   !List box control field - type derived from local data
locDOW_NormalFG        LONG                           !Normal forground color
locDOW_NormalBG        LONG                           !Normal background color
locDOW_SelectedFG      LONG                           !Selected forground color
locDOW_SelectedBG      LONG                           !Selected background color
locDOW_Style           LONG                           !Field style
locDayCount            LIKE(locDayCount)              !List box control field - type derived from local data
locDayCount_NormalFG   LONG                           !Normal forground color
locDayCount_NormalBG   LONG                           !Normal background color
locDayCount_SelectedFG LONG                           !Selected forground color
locDayCount_SelectedBG LONG                           !Selected background color
locDayCount_Style      LONG                           !Field style
PU:Date                LIKE(PU:Date)                  !List box control field - type derived from field
PU:Date_NormalFG       LONG                           !Normal forground color
PU:Date_NormalBG       LONG                           !Normal background color
PU:Date_SelectedFG     LONG                           !Selected forground color
PU:Date_SelectedBG     LONG                           !Selected background color
PU:Date_Style          LONG                           !Field style
PU:Inititals           LIKE(PU:Inititals)             !List box control field - type derived from field
PU:Inititals_NormalFG  LONG                           !Normal forground color
PU:Inititals_NormalBG  LONG                           !Normal background color
PU:Inititals_SelectedFG LONG                          !Selected forground color
PU:Inititals_SelectedBG LONG                          !Selected background color
PU:Inititals_Style     LONG                           !Field style
PU:ContactName         LIKE(PU:ContactName)           !List box control field - type derived from field
PU:ContactName_NormalFG LONG                          !Normal forground color
PU:ContactName_NormalBG LONG                          !Normal background color
PU:ContactName_SelectedFG LONG                        !Selected forground color
PU:ContactName_SelectedBG LONG                        !Selected background color
PU:ContactName_Style   LONG                           !Field style
PU:Note                LIKE(PU:Note)                  !List box control field - type derived from field
PU:Note_NormalFG       LONG                           !Normal forground color
PU:Note_NormalBG       LONG                           !Normal background color
PU:Note_SelectedFG     LONG                           !Selected forground color
PU:Note_SelectedBG     LONG                           !Selected background color
PU:Note_Style          LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW8::View:Browse    VIEW(Supplies)
                       PROJECT(SUP:Date)
                       PROJECT(SUP:Client)
                       PROJECT(SUP:Quantity)
                       PROJECT(SUP:Note)
                       PROJECT(SUP:ShipDate)
                       PROJECT(SUP:Shipped)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List:Supplies
SUP:Date               LIKE(SUP:Date)                 !List box control field - type derived from field
SUP:Date_Style         LONG                           !Field style
SUP:Client             LIKE(SUP:Client)               !List box control field - type derived from field
SUP:Client_Style       LONG                           !Field style
SUP:Quantity           LIKE(SUP:Quantity)             !List box control field - type derived from field
SUP:Quantity_Style     LONG                           !Field style
SUP:Note               LIKE(SUP:Note)                 !List box control field - type derived from field
SUP:Note_Style         LONG                           !Field style
SUP:ShipDate           LIKE(SUP:ShipDate)             !List box control field - type derived from field
SUP:ShipDate_Style     LONG                           !Field style
SUP:Shipped            LIKE(SUP:Shipped)              !List box control field - type derived from field
SUP:Shipped_Style      LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW9::View:Browse    VIEW(SpecimenReceived)
                       PROJECT(SR:Patient)
                       PROJECT(SR:PatientName)
                       PROJECT(SR:Client)
                       PROJECT(SR:ClientName)
                       PROJECT(SR:Date)
                     END
Queue:Browse:2       QUEUE                            !Queue declaration for browse/combo box using ?List:Confirmation
SR:Patient             LIKE(SR:Patient)               !List box control field - type derived from field
SR:Patient_NormalFG    LONG                           !Normal forground color
SR:Patient_NormalBG    LONG                           !Normal background color
SR:Patient_SelectedFG  LONG                           !Selected forground color
SR:Patient_SelectedBG  LONG                           !Selected background color
SR:Patient_Style       LONG                           !Field style
SR:PatientName         LIKE(SR:PatientName)           !List box control field - type derived from field
SR:PatientName_NormalFG LONG                          !Normal forground color
SR:PatientName_NormalBG LONG                          !Normal background color
SR:PatientName_SelectedFG LONG                        !Selected forground color
SR:PatientName_SelectedBG LONG                        !Selected background color
SR:PatientName_Style   LONG                           !Field style
SR:Client              LIKE(SR:Client)                !List box control field - type derived from field
SR:Client_NormalFG     LONG                           !Normal forground color
SR:Client_NormalBG     LONG                           !Normal background color
SR:Client_SelectedFG   LONG                           !Selected forground color
SR:Client_SelectedBG   LONG                           !Selected background color
SR:Client_Style        LONG                           !Field style
SR:ClientName          LIKE(SR:ClientName)            !List box control field - type derived from field
SR:ClientName_NormalFG LONG                           !Normal forground color
SR:ClientName_NormalBG LONG                           !Normal background color
SR:ClientName_SelectedFG LONG                         !Selected forground color
SR:ClientName_SelectedBG LONG                         !Selected background color
SR:ClientName_Style    LONG                           !Field style
SR:Date                LIKE(SR:Date)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW10::View:Browse   VIEW(Exceptions)
                       PROJECT(EXC:Patient)
                       PROJECT(EXC:Client)
                       PROJECT(EXC:PatientStatus)
                       PROJECT(EXC:Age)
                     END
Queue:Browse:3       QUEUE                            !Queue declaration for browse/combo box using ?List:Exceptions
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
QuickWindow          WINDOW('Browse the PickUp file'),AT(,,511,340),FONT('Arial',11,,FONT:regular),RESIZE,ALRT(0004h), |
  CENTER,ICON('Allermetrix.ico'),GRAY,IMM,MDI,HLP('FedExTable'),SYSTEM
                       BUTTON('&Select'),AT(350,270,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&Insert'),AT(370,120,70,25),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  HIDE,MSG('Insert a Record'),TIP('Insert a Record')
                       STRING(@n_6),AT(308,172),USE(CLI:NUMBER),FONT(,,,FONT:bold),TRN
                       STRING(@s40),AT(308,182),USE(locClientName),FONT(,,,FONT:bold),TRN
                       STRING(@s24),AT(308,192),USE(CLI:CONTACT),FONT(,,,FONT:bold),TRN
                       STRING(@s35),AT(308,202),USE(CLI:ADDRESS1),FONT(,,,FONT:bold),TRN
                       STRING(@s40),AT(308,212),USE(locAddress),FONT(,,,FONT:bold),TRN
                       STRING(@s20),AT(308,222),USE(CLI:PHONE),FONT(,,,FONT:bold),TRN
                       STRING(@s20),AT(308,232),USE(CLI:FAX),FONT(,,,FONT:bold),TRN
                       STRING(@s100),AT(308,242,203,10),USE(locEmail),FONT(,10,,,CHARSET:ANSI),TRN
                       SHEET,AT(4,4,445,264),USE(CurrentTab),FONT('Arial',11),SPREAD
                         TAB('Pickup'),USE(?Tab:2)
                           LIST,AT(8,30,288,232),USE(?Browse:1),VSCROLL,ALRT(MouseRight),FORMAT('15C(19)|M*JY~Rcv~' & |
  'C(0)@n1@33L(2)|M*Y~Client~C(0)@p### ###p@21L(2)|M*Y~DoW~C(0)@s4@19R(5)|M*Y~Days~C(0)' & |
  '@n3@47R(2)|M*Y~Date~C(0)@D3@24C(2)|M*Y~Initials~@s3@51L(2)|M*Y~Contact~@s20@80L(2)|M' & |
  '*Y~Note~@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the PickUp file'),TRN
                           IMAGE('button.jpg'),AT(328,66,70,25),USE(?Image3)
                           IMAGE('button.jpg'),AT(328,104,70,25),USE(?Image2)
                           IMAGE('button.jpg'),AT(328,142,70,25),USE(?Image1)
                           BUTTON('Received'),AT(328,66,70,25),USE(?MarkReceivedButton),FONT(,,,FONT:bold),LEFT,ICON('SteelCheckOn.ico'), |
  TRN
                           BUTTON('&Delete'),AT(328,104,70,25),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  MSG('Delete the Record'),TIP('Delete the Record'),TRN
                           BUTTON('&Edit View'),AT(328,142,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                         END
                         TAB('Supplies'),USE(?Tab3)
                           STRING('Supplies'),AT(94,34,55,13),USE(?String12),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                           LIST,AT(30,52,232,147),USE(?List:Supplies),VSCROLL,ALRT(MouseRight),FORMAT('42L(2)|MY~D' & |
  'ate~@d17@40R(2)|MY~Client~L@p### ###p@19R(2)|MY~Qty~L@n3@96L(2)|MY~Note~@s32@40L(2)|' & |
  'MY~Ship Date~@d17@12R(2)|MY~Shipped~L@n3@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  TRN
                         END
                         TAB('Confirmation'),USE(?Tab4)
                           STRING('Specimen Received Notices'),AT(80,28),USE(?String10),FONT(,16,,FONT:bold,CHARSET:ANSI), |
  TRN
                           PANEL,AT(40,42,243,198),USE(?Panel1)
                           LIST,AT(40,42,243,198),USE(?List:Confirmation),VSCROLL,ALRT(0004h),FORMAT('31R|M*Y~Pati' & |
  'ent~L(2)@n_6@78R|M*Y~PatientName~L(2)@s32@31R|M*Y~Client~L(2)@n_06@128L(1)|M*Y~Clien' & |
  'tName~L(2)@s32@'),FROM(Queue:Browse:2),IMM,MSG('Browsing Records'),TRN
                           BUTTON('Send Notice'),AT(294,98,70,25),USE(?NoticeButton),FONT(,,,FONT:bold),LEFT,ICON('SteelEmail.ico'), |
  TRN
                           IMAGE('button.jpg'),AT(294,98,70,25),USE(?Image7)
                         END
                         TAB('Followup'),USE(?Tab5)
                           STRING('Follow Up'),AT(108,28,67,13),USE(?String11),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                         END
                         TAB('Exceptions'),USE(?ExceptionsTab)
                           STRING('Exceptions'),AT(90,30),USE(?String13),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                           LIST,AT(42,56,125,196),USE(?List:Exceptions),VSCROLL,ALRT(0004h),FORMAT('33R|M*Y~Patien' & |
  't~L(2)@n_6@31R|M*Y~Client~L(2)@n_6@27R(10)|M*Y~Status~L(2)@s1@20R(7)|M*Y~Age~L(2)@s1@'), |
  FROM(Queue:Browse:3),IMM,MSG('Browsing Records'),TRN
                           BUTTON('Edit Patient'),AT(194,74,70,25),USE(?EditPatientButton),FONT(,,,FONT:bold),TRN
                           IMAGE('button.jpg'),AT(194,74,70,25),USE(?Image6)
                           IMAGE('button.jpg'),AT(194,112,70,25),USE(?Image5)
                           BUTTON('Delete'),AT(194,112,70,25),USE(?DeleteButton),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  TRN
                         END
                         TAB('Client'),USE(?Tab:3),HIDE
                         END
                       END
                       BUTTON('&Close'),AT(416,276,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       BUTTON('Events'),AT(254,280,70,25),USE(?Button11)
                       STRING(@s30),AT(46,18,195,12),USE(locToday),FONT(,14,,FONT:bold),TRN
                       IMAGE('button.jpg'),AT(416,276),USE(?Image4)
                       BUTTON('&Help'),AT(380,128,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW8::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW9::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
BRW10::AutoSizeColumn CLASS(AutoSizeColumnClassType)
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
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeEvent              PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW8                 CLASS(BrowseClass)                    ! Browse using ?List:Supplies
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
TakeKey                PROCEDURE(),BYTE,PROC,DERIVED
                     END

BRW8::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW9                 CLASS(BrowseClass)                    ! Browse using ?List:Confirmation
Q                      &Queue:Browse:2                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW9::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW10                CLASS(BrowseClass)                    ! Browse using ?List:Exceptions
Q                      &Queue:Browse:3                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW10::Sort0:Locator StepLocatorClass                      ! Default Locator
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

PopupMgr3            PopupClass

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
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:Supplies
  !------------------------------------
  ?List:Supplies{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Supplies{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Supplies{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Supplies{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Supplies{PROPSTYLE:BackColor, 1}     = -1
  ?List:Supplies{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Supplies{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:Confirmation
  !------------------------------------
  ?List:Confirmation{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Confirmation{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Confirmation{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Confirmation{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Confirmation{PROPSTYLE:BackColor, 1}     = -1
  ?List:Confirmation{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Confirmation{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
  !------------------------------------
  !Style for ?List:Exceptions
  !------------------------------------
  ?List:Exceptions{PROPSTYLE:FontName, 1}      = gloListFont
  ?List:Exceptions{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List:Exceptions{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List:Exceptions{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List:Exceptions{PROPSTYLE:BackColor, 1}     = -1
  ?List:Exceptions{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List:Exceptions{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
ShowClient  ROUTINE
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE() OR ~CLI:Number
    CLEAR(CLI:Record)
    locClientName =  ERROR()
    locAddress = 'x'
    locEmail = 'x'
  ELSE
    locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
    locAddress = CLIP(CLI:City) & ', ' & CLI:State & ' ' & CLI:Zip
    locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3 & CLI:Physician2
      
  .
  DISPLAY()


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FedExTable')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Select:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locDOW',locDOW)                                    ! Added by: BrowseBox(ABC)
  BIND('locDayCount',locDayCount)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:EventsTable.Open                                  ! File EventsTable used by this procedure, so make sure it's RelationManager is open
  Relate:Exceptions.Open                                   ! File Exceptions used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PickUp,SELF) ! Initialize the browse manager
  BRW8.Init(?List:Supplies,Queue:Browse.ViewPosition,BRW8::View:Browse,Queue:Browse,Relate:Supplies,SELF) ! Initialize the browse manager
  BRW9.Init(?List:Confirmation,Queue:Browse:2.ViewPosition,BRW9::View:Browse,Queue:Browse:2,Relate:SpecimenReceived,SELF) ! Initialize the browse manager
  BRW10.Init(?List:Exceptions,Queue:Browse:3.ViewPosition,BRW10::View:Browse,Queue:Browse:3,Relate:Exceptions,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon PU:Received for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PU:DateKey)      ! Add the sort order for PU:DateKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PU:Received,1,BRW1)            ! Initialize the browse locator using  using key: PU:DateKey , PU:Received
  ?Browse:1{PROP:IconList,1} = '~checkoff.ico'
  ?Browse:1{PROP:IconList,2} = '~checkon.ico'
  BRW1.AddField(PU:Received,BRW1.Q.PU:Received)            ! Field PU:Received is a hot field or requires assignment from browse
  BRW1.AddField(PU:Client,BRW1.Q.PU:Client)                ! Field PU:Client is a hot field or requires assignment from browse
  BRW1.AddField(locDOW,BRW1.Q.locDOW)                      ! Field locDOW is a hot field or requires assignment from browse
  BRW1.AddField(locDayCount,BRW1.Q.locDayCount)            ! Field locDayCount is a hot field or requires assignment from browse
  BRW1.AddField(PU:Date,BRW1.Q.PU:Date)                    ! Field PU:Date is a hot field or requires assignment from browse
  BRW1.AddField(PU:Inititals,BRW1.Q.PU:Inititals)          ! Field PU:Inititals is a hot field or requires assignment from browse
  BRW1.AddField(PU:ContactName,BRW1.Q.PU:ContactName)      ! Field PU:ContactName is a hot field or requires assignment from browse
  BRW1.AddField(PU:Note,BRW1.Q.PU:Note)                    ! Field PU:Note is a hot field or requires assignment from browse
  BRW8.Q &= Queue:Browse
  BRW8.AddSortOrder(,SUP:FindUnShippedKey)                 ! Add the sort order for SUP:FindUnShippedKey for sort order 1
  BRW8.AddLocator(BRW8::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW8::Sort0:Locator.Init(,SUP:Shipped,1,BRW8)            ! Initialize the browse locator using  using key: SUP:FindUnShippedKey , SUP:Shipped
  BRW8.AddField(SUP:Date,BRW8.Q.SUP:Date)                  ! Field SUP:Date is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Client,BRW8.Q.SUP:Client)              ! Field SUP:Client is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Quantity,BRW8.Q.SUP:Quantity)          ! Field SUP:Quantity is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Note,BRW8.Q.SUP:Note)                  ! Field SUP:Note is a hot field or requires assignment from browse
  BRW8.AddField(SUP:ShipDate,BRW8.Q.SUP:ShipDate)          ! Field SUP:ShipDate is a hot field or requires assignment from browse
  BRW8.AddField(SUP:Shipped,BRW8.Q.SUP:Shipped)            ! Field SUP:Shipped is a hot field or requires assignment from browse
  BRW9.Q &= Queue:Browse:2
  BRW9.AddSortOrder(,SR:OrderKey)                          ! Add the sort order for SR:OrderKey for sort order 1
  BRW9.AddLocator(BRW9::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW9::Sort0:Locator.Init(,SR:Date,1,BRW9)                ! Initialize the browse locator using  using key: SR:OrderKey , SR:Date
  BRW9.AddField(SR:Patient,BRW9.Q.SR:Patient)              ! Field SR:Patient is a hot field or requires assignment from browse
  BRW9.AddField(SR:PatientName,BRW9.Q.SR:PatientName)      ! Field SR:PatientName is a hot field or requires assignment from browse
  BRW9.AddField(SR:Client,BRW9.Q.SR:Client)                ! Field SR:Client is a hot field or requires assignment from browse
  BRW9.AddField(SR:ClientName,BRW9.Q.SR:ClientName)        ! Field SR:ClientName is a hot field or requires assignment from browse
  BRW9.AddField(SR:Date,BRW9.Q.SR:Date)                    ! Field SR:Date is a hot field or requires assignment from browse
  BRW10.Q &= Queue:Browse:3
  BRW10.AddSortOrder(,EXC:OrderKey)                        ! Add the sort order for EXC:OrderKey for sort order 1
  BRW10.AddLocator(BRW10::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW10::Sort0:Locator.Init(,EXC:Patient,1,BRW10)          ! Initialize the browse locator using  using key: EXC:OrderKey , EXC:Patient
  BRW10.AddField(EXC:Patient,BRW10.Q.EXC:Patient)          ! Field EXC:Patient is a hot field or requires assignment from browse
  BRW10.AddField(EXC:Client,BRW10.Q.EXC:Client)            ! Field EXC:Client is a hot field or requires assignment from browse
  BRW10.AddField(EXC:PatientStatus,BRW10.Q.EXC:PatientStatus) ! Field EXC:PatientStatus is a hot field or requires assignment from browse
  BRW10.AddField(EXC:Age,BRW10.Q.EXC:Age)                  ! Field EXC:Age is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('FedExTable',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  PopupMgr3.Init(INIMgr)
  PopupMgr3.AddItem('MarkReceived','Mark Received')
  PopupMgr3.AddItem('UnMarkReceived','UnMark Received')
  PopupMgr3.AddItem('-','Seperator')
  PopupMgr3.AddItem('Edit View','EditView')
  PopupMgr3.AddItemMimic('EditView',?Change:4)
  BRW8.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW8.ToolbarItem.HelpButton = ?Help
  BRW9.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW9.ToolbarItem.HelpButton = ?Help
  BRW10.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
  BRW10.ToolbarItem.HelpButton = ?Help
  BRW8.SetAlerts
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  CASE TODAY() % 7
  OF 0
    locTodayDOW = 'Sunday'
  OF 1
    locTodayDOW = 'Monday'
  OF 2
    locTodayDOW = 'Tuesday'
  OF 3
    locTodayDOW = 'Wednesday'
  OF 4
    locTodayDOW = 'Thursday'
  OF 5
    locTodayDOW = 'Friday'
  OF 6
    locTodayDOW = 'Saturday'
  .
  locToday = CLIP(locTodayDOW) & ' ' & FORMAT(TODAY(),@D3)
  IF RECORDS(Exceptions)
    ?ExceptionsTab{PROP:Font,3} = COLOR:Red
    ?ExceptionsTab{PROP:Font,4} = 700
  .
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
  BRW8::AutoSizeColumn.Init()
  BRW8::AutoSizeColumn.AddListBox(?List:Supplies,Queue:Browse)
  BRW9::AutoSizeColumn.Init()
  BRW9::AutoSizeColumn.AddListBox(?List:Confirmation,Queue:Browse:2)
  BRW10::AutoSizeColumn.Init()
  BRW10::AutoSizeColumn.AddListBox(?List:Exceptions,Queue:Browse:3)
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
    Relate:EventsTable.Close
    Relate:Exceptions.Close
    Relate:SpecimenReceived.Close
  END
  BRW1::AutoSizeColumn.Kill()
  BRW8::AutoSizeColumn.Kill()
  BRW9::AutoSizeColumn.Kill()
  BRW10::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('FedExTable',QuickWindow)                ! Save window data to non-volatile store
  END
  PopupMgr3.Kill
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
    UpdatePickUp
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
    CASE ACCEPTED()
    OF ?MarkReceivedButton
      BRW1.UpdateBuffer
      GET(PickUp,PU:ClientKey)
      PU:Received = BXOR(PU:Received,1)
      PUT(PickUp)
      BRW1.ResetFromFile
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?NoticeButton
      ThisWindow.Update
        BRW9.UpdateBuffer
        GET(SpecimenReceived,SR:OrderKey)
        CLI:NUMBER = SR:Client
        GET(Client,CLI:ORDER_KEY)
        globalRequest = ChangeRecord
        Confirmation
        BRW9.ResetFromFile
    OF ?EditPatientButton
      ThisWindow.Update
        BRW10.UpdateBuffer
        Pat:INVOICE = EXC:Patient
        GET(Patient,Pat:INVOICE_KEY)
        IF ERRORCODE() THEN STOP(EXC:Patient & ' EXC GET PAT: ' & ERROR()).
        CLI:NUMBER =  PAT:Client
        GET(Client,CLI:ORDER_KEY)
        globalRequest = ChangeRecord
        UpdatePatient(0)
    OF ?DeleteButton
      ThisWindow.Update
      BRW10.UpdateBuffer
      GET(Exceptions,EXC:OrderKey)
      IF ~ERRORCODE()
        DELETE(Exceptions)
        BRW10.ResetFromfile
      .
    OF ?Button11
      ThisWindow.Update
      EventsTable()
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
  IF BRW8::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW9::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  IF BRW10::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
  ET:EventNumber = EVENT()
  ET:Keys = KEYCODE()
  CLI:NUMBER = 999999
  CASE FIELD()
  OF ?List:Confirmation
    ET:FiledNumber =  ?List:Confirmation
    IF EVENT() = EVENT:NewSelection
     ! POST(EVENT:NewSelection,?List:Confirmation)
      BRW8.UpdateBuffer
      CLI:NUMBER = SR:Client
      DO ShowClient
    ELSIF EVENT() = EVENT:AlertKey AND KEYCODE() = MouseLeft2
      BRW8.UpdateBuffer
    .
  OF ?List:Supplies
    ET:FiledNumber = ?List:Supplies
    IF EVENT() = EVENT:NewSelection
   !   POST(EVENT:NewSelection,?List:Supplies)
      BRW9.UpdateBuffer
      CLI:NUMBER = SUP:Client
      DO ShowClient
    ELSIF EVENT() = EVENT:AlertKey AND KEYCODE() = MouseLeft2
      BRW9.UpdateBuffer
    .
  OF ?List:Exceptions
    ET:FiledNumber = ?List:Exceptions
    IF EVENT() = EVENT:NewSelection
   !   POST(EVENT:NewSelection,?List:Exceptions)
      BRW10.UpdateBuffer
      CLI:NUMBER = EXC:Client
      DO ShowClient
    ELSIF EVENT() = EVENT:AlertKey AND KEYCODE() = MouseLeft2
      BRW10.UpdateBuffer
    .
  ELSE
   ET:FiledNumber =  FIELD()
   CLI:NUMBER = 0
  .
  ET:Client = CLI:NUMBER
  ADD(EventsTable)
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
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = MouseRight
        BRW1.UpdateBuffer
        IF PU:Received
          PopupMgr3.SetItemEnable('UnMarkReceived',True)
          PopupMgr3.SetItemEnable('MarkReceived',False)
        ELSE
          PopupMgr3.SetItemEnable('UnMarkReceived',False)
          PopupMgr3.SetItemEnable('MarkReceived',True)
        .
      locPopupString=PopupMgr3.Ask()
    END
  OF ?List:Supplies
    CASE EVENT()
    OF EVENT:AlertKey
      !IF KEYCODE() = 5
       stop('sup')
       BRW8.UpdateBuffer
       GET(Supplies,SUP:ClientKey)
       globalRequest = ChangeRecord
       UpdateSupplies
       BRW8.ResetFromfile
      !.
    END
  OF ?List:Confirmation
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = 5
        BRW9.UpdateBuffer
        GET(SpecimenReceived,SR:OrderKey)
        CLI:NUMBER = SR:Client
        GET(Client,CLI:ORDER_KEY)
        globalRequest = ChangeRecord
        Confirmation
        BRW9.ResetFromFile
      .
    END
  OF ?List:Exceptions
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = 5
        BRW10.UpdateBuffer
        Pat:INVOICE = EXC:Patient
        GET(Patient,Pat:INVOICE_KEY)
        IF ERRORCODE() THEN STOP(EXC:Patient & ' EXC GET PAT: ' & ERROR()).
        CLI:NUMBER =  PAT:Client
        GET(Client,CLI:ORDER_KEY)
        globalRequest = ChangeRecord
        UpdatePatient(0)
      .
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:AlertKey
        IF locPopupString <> 'EditView'
          GET(PickUp,PU:DateKey)
          IF ERRORCODE() THEN STOP('GET PICKUP: ' & ERROR()).
        .
        
        CASE  locPopupString
        OF 'MarkReceived'
          PU:Received = 1
          PUT(Pickup)
          IF ERRORCODE() THEN STOP('UPDATE PICKUP: ' & ERROR()).
        OF 'UnMarkReceived'
          PU:Received = 0
          PUT(Pickup)
          IF ERRORCODE() THEN STOP('UPDATE PICKUP: ' & ERROR()).
        .
        BRW1.ResetFromFile
      .
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
    OF ?CurrentTab
      IF CurrentTab = 'Supplies'
        BRW8.UpdateBuffer
        CLI:NUMBER = SUP:Client
        GET(Client,CLI:ORDER_KEY)
      .
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?List:Supplies
       BRW8.UpdateBuffer
       CLI:NUMBER = SUP:Client
       DO ShowClient
    OF ?List:Confirmation
        BRW9.UpdateBuffer
        GET(SpecimenReceived,SR:OrderKey)
        DO ShowClient
    OF ?List:Exceptions
        BRW10.UpdateBuffer
        CLI:NUMBER =  EXC:Client
        DO ShowClient
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
      BRW8.ResetFromFile
      BRW9.ResetFromFile
      BRW10.ResetFromFile
      
      
      !IF ~RECORDS(Queue:Browse) THEN HIDE(?Tab3).
    END
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (~PU:Received AND locDayCount > 2)
    SELF.Q.PU:Received_NormalFG = 16777215                 ! Set conditional color values for PU:Received
    SELF.Q.PU:Received_NormalBG = 6316287
    SELF.Q.PU:Received_SelectedFG = 16777215
    SELF.Q.PU:Received_SelectedBG = 255
    SELF.Q.PU:Client_NormalFG = 16777215                   ! Set conditional color values for PU:Client
    SELF.Q.PU:Client_NormalBG = 6316287
    SELF.Q.PU:Client_SelectedFG = 16777215
    SELF.Q.PU:Client_SelectedBG = 255
    SELF.Q.locDOW_NormalFG = 16777215                      ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 6316287
    SELF.Q.locDOW_SelectedFG = 16777215
    SELF.Q.locDOW_SelectedBG = 255
    SELF.Q.locDayCount_NormalFG = 16777215                 ! Set conditional color values for locDayCount
    SELF.Q.locDayCount_NormalBG = 6316287
    SELF.Q.locDayCount_SelectedFG = 16777215
    SELF.Q.locDayCount_SelectedBG = 255
    SELF.Q.PU:Date_NormalFG = 16777215                     ! Set conditional color values for PU:Date
    SELF.Q.PU:Date_NormalBG = 6316287
    SELF.Q.PU:Date_SelectedFG = 16777215
    SELF.Q.PU:Date_SelectedBG = 255
    SELF.Q.PU:Inititals_NormalFG = 16777215                ! Set conditional color values for PU:Inititals
    SELF.Q.PU:Inititals_NormalBG = 6316287
    SELF.Q.PU:Inititals_SelectedFG = 16777215
    SELF.Q.PU:Inititals_SelectedBG = 255
    SELF.Q.PU:ContactName_NormalFG = 16777215              ! Set conditional color values for PU:ContactName
    SELF.Q.PU:ContactName_NormalBG = 6316287
    SELF.Q.PU:ContactName_SelectedFG = 16777215
    SELF.Q.PU:ContactName_SelectedBG = 255
    SELF.Q.PU:Note_NormalFG = 16777215                     ! Set conditional color values for PU:Note
    SELF.Q.PU:Note_NormalBG = 6316287
    SELF.Q.PU:Note_SelectedFG = 16777215
    SELF.Q.PU:Note_SelectedBG = 255
  ELSIF (~PU:Received AND locDaycount > 1)
    SELF.Q.PU:Received_NormalFG = 0                        ! Set conditional color values for PU:Received
    SELF.Q.PU:Received_NormalBG = 8454143
    SELF.Q.PU:Received_SelectedFG = 0
    SELF.Q.PU:Received_SelectedBG = 65535
    SELF.Q.PU:Client_NormalFG = 0                          ! Set conditional color values for PU:Client
    SELF.Q.PU:Client_NormalBG = 8454143
    SELF.Q.PU:Client_SelectedFG = 0
    SELF.Q.PU:Client_SelectedBG = 65535
    SELF.Q.locDOW_NormalFG = 0                             ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 8454143
    SELF.Q.locDOW_SelectedFG = 0
    SELF.Q.locDOW_SelectedBG = 65535
    SELF.Q.locDayCount_NormalFG = 0                        ! Set conditional color values for locDayCount
    SELF.Q.locDayCount_NormalBG = 8454143
    SELF.Q.locDayCount_SelectedFG = 0
    SELF.Q.locDayCount_SelectedBG = 65535
    SELF.Q.PU:Date_NormalFG = 0                            ! Set conditional color values for PU:Date
    SELF.Q.PU:Date_NormalBG = 8454143
    SELF.Q.PU:Date_SelectedFG = 0
    SELF.Q.PU:Date_SelectedBG = 65535
    SELF.Q.PU:Inititals_NormalFG = 0                       ! Set conditional color values for PU:Inititals
    SELF.Q.PU:Inititals_NormalBG = 8454143
    SELF.Q.PU:Inititals_SelectedFG = 0
    SELF.Q.PU:Inititals_SelectedBG = 65535
    SELF.Q.PU:ContactName_NormalFG = 0                     ! Set conditional color values for PU:ContactName
    SELF.Q.PU:ContactName_NormalBG = 8454143
    SELF.Q.PU:ContactName_SelectedFG = 0
    SELF.Q.PU:ContactName_SelectedBG = 65535
    SELF.Q.PU:Note_NormalFG = 0                            ! Set conditional color values for PU:Note
    SELF.Q.PU:Note_NormalBG = 8454143
    SELF.Q.PU:Note_SelectedFG = 0
    SELF.Q.PU:Note_SelectedBG = 65535
  ELSE
    SELF.Q.PU:Received_NormalFG = -1                       ! Set color values for PU:Received
    SELF.Q.PU:Received_NormalBG = -1
    SELF.Q.PU:Received_SelectedFG = -1
    SELF.Q.PU:Received_SelectedBG = -1
    SELF.Q.PU:Client_NormalFG = -1                         ! Set color values for PU:Client
    SELF.Q.PU:Client_NormalBG = -1
    SELF.Q.PU:Client_SelectedFG = -1
    SELF.Q.PU:Client_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set color values for locDOW
    SELF.Q.locDOW_NormalBG = -1
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.locDayCount_NormalFG = -1                       ! Set color values for locDayCount
    SELF.Q.locDayCount_NormalBG = -1
    SELF.Q.locDayCount_SelectedFG = -1
    SELF.Q.locDayCount_SelectedBG = -1
    SELF.Q.PU:Date_NormalFG = -1                           ! Set color values for PU:Date
    SELF.Q.PU:Date_NormalBG = -1
    SELF.Q.PU:Date_SelectedFG = -1
    SELF.Q.PU:Date_SelectedBG = -1
    SELF.Q.PU:Inititals_NormalFG = -1                      ! Set color values for PU:Inititals
    SELF.Q.PU:Inititals_NormalBG = -1
    SELF.Q.PU:Inititals_SelectedFG = -1
    SELF.Q.PU:Inititals_SelectedBG = -1
    SELF.Q.PU:ContactName_NormalFG = -1                    ! Set color values for PU:ContactName
    SELF.Q.PU:ContactName_NormalBG = -1
    SELF.Q.PU:ContactName_SelectedFG = -1
    SELF.Q.PU:ContactName_SelectedBG = -1
    SELF.Q.PU:Note_NormalFG = -1                           ! Set color values for PU:Note
    SELF.Q.PU:Note_NormalBG = -1
    SELF.Q.PU:Note_SelectedFG = -1
    SELF.Q.PU:Note_SelectedBG = -1
  END
  SELF.Q.PU:Received_Style = 1 ! 
  SELF.Q.PU:Client_Style = 1 ! 
  SELF.Q.locDOW_Style = 1 ! 
  SELF.Q.locDayCount_Style = 1 ! 
  SELF.Q.PU:Date_Style = 1 ! 
  SELF.Q.PU:Inititals_Style = 1 ! 
  SELF.Q.PU:ContactName_Style = 1 ! 
  SELF.Q.PU:Note_Style = 1 ! 
  IF (PU:Received)
    SELF.Q.PU:Received_Icon = 2                            ! Set icon from icon list
  ELSE
    SELF.Q.PU:Received_Icon = 1                            ! Set icon from icon list
  END


BRW1.TakeEvent PROCEDURE

  CODE
  PARENT.TakeEvent
  OMIT('XXXX') !Disable PopUp
  locPopupString=PopupMgr3.Ask()
  XXXX


BRW1.TakeNewSelection PROCEDURE

  CODE
  BRW1.UpdateBuffer
  CLI:NUMBER = PU:Client
  IF PU:Received
    ?MarkReceivedButton{PROP:Text} = 'Not Received'
    ?MarkReceivedButton{PROP:Icon} = 'UnDo.ico'
  ELSE
    ?MarkReceivedButton{PROP:Text} = 'Received'
    ?MarkReceivedButton{PROP:Icon} = 'WAMark.ico'
  .
  DO ShowClient
  PARENT.TakeNewSelection


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  locDayCount = TODAY() - PU:Date
  CASE PU:Date % 7
  OF 0
    locDOW = 'Sun'
  OF 1
    IF locDayCount > 1 THEN locDayCount -= 2.
    locDOW = 'Mon'
  OF 2
    IF locDayCount > 2 THEN locDayCount -= 2.
    locDOW = 'Tue'
  OF 3
    IF locDayCount > 3 THEN locDayCount -= 2.
    locDOW = 'Wed'
  OF 4
    IF locDayCount > 4 THEN locDayCount -= 2.
    IF INRANGE(locDayCount,2,3) THEN locDayCount = 1.
    locDOW = 'Thur'
  OF 5
    IF locDayCount > 5  THEN locDayCount -= 2.
    IF INRANGE(locDayCount,1,2) THEN locDayCount = 0.
    locDOW = 'Fri'
  OF 6
    IF locDayCount > 6 THEN locDayCount -= 2.
    locDOW = 'Sat'
  .
  
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW8.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.SUP:Date_Style = 1 ! 
  SELF.Q.SUP:Client_Style = 1 ! 
  SELF.Q.SUP:Quantity_Style = 1 ! 
  SELF.Q.SUP:Note_Style = 1 ! 
  SELF.Q.SUP:ShipDate_Style = 1 ! 
  SELF.Q.SUP:Shipped_Style = 1 ! 


BRW8.TakeKey PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.TakeKey()
  BRW8.UpdateBuffer
  STOP('SUB TK ' & SUP:Client)
  RETURN ReturnValue


BRW9.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (SR:eMailed)
    SELF.Q.SR:Patient_NormalFG = 16777215                  ! Set conditional color values for SR:Patient
    SELF.Q.SR:Patient_NormalBG = 0
    SELF.Q.SR:Patient_SelectedFG = 0
    SELF.Q.SR:Patient_SelectedBG = 16777215
    SELF.Q.SR:PatientName_NormalFG = 16777215              ! Set conditional color values for SR:PatientName
    SELF.Q.SR:PatientName_NormalBG = 0
    SELF.Q.SR:PatientName_SelectedFG = 0
    SELF.Q.SR:PatientName_SelectedBG = 16777215
    SELF.Q.SR:Client_NormalFG = 16777215                   ! Set conditional color values for SR:Client
    SELF.Q.SR:Client_NormalBG = 0
    SELF.Q.SR:Client_SelectedFG = 0
    SELF.Q.SR:Client_SelectedBG = 16777215
    SELF.Q.SR:ClientName_NormalFG = 16777215               ! Set conditional color values for SR:ClientName
    SELF.Q.SR:ClientName_NormalBG = 0
    SELF.Q.SR:ClientName_SelectedFG = 0
    SELF.Q.SR:ClientName_SelectedBG = 16777215
  ELSE
    SELF.Q.SR:Patient_NormalFG = -1                        ! Set color values for SR:Patient
    SELF.Q.SR:Patient_NormalBG = -1
    SELF.Q.SR:Patient_SelectedFG = -1
    SELF.Q.SR:Patient_SelectedBG = -1
    SELF.Q.SR:PatientName_NormalFG = -1                    ! Set color values for SR:PatientName
    SELF.Q.SR:PatientName_NormalBG = -1
    SELF.Q.SR:PatientName_SelectedFG = -1
    SELF.Q.SR:PatientName_SelectedBG = -1
    SELF.Q.SR:Client_NormalFG = -1                         ! Set color values for SR:Client
    SELF.Q.SR:Client_NormalBG = -1
    SELF.Q.SR:Client_SelectedFG = -1
    SELF.Q.SR:Client_SelectedBG = -1
    SELF.Q.SR:ClientName_NormalFG = -1                     ! Set color values for SR:ClientName
    SELF.Q.SR:ClientName_NormalBG = -1
    SELF.Q.SR:ClientName_SelectedFG = -1
    SELF.Q.SR:ClientName_SelectedBG = -1
  END
  SELF.Q.SR:Patient_Style = 1 ! 
  SELF.Q.SR:PatientName_Style = 1 ! 
  SELF.Q.SR:Client_Style = 1 ! 
  SELF.Q.SR:ClientName_Style = 1 ! 


BRW10.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.EXC:Patient_Style = 1 ! 
  SELF.Q.EXC:Client_Style = 1 ! 
  SELF.Q.EXC:PatientStatus_Style = 1 ! 
  SELF.Q.EXC:Age_Style = 1 ! 
  SELF.Q.EXC:Patient_NormalFG = -1                         ! Set color values for EXC:Patient
  SELF.Q.EXC:Patient_NormalBG = -1
  SELF.Q.EXC:Patient_SelectedFG = -1
  SELF.Q.EXC:Patient_SelectedBG = -1
  SELF.Q.EXC:Client_NormalFG = -1                          ! Set color values for EXC:Client
  SELF.Q.EXC:Client_NormalBG = -1
  SELF.Q.EXC:Client_SelectedFG = -1
  SELF.Q.EXC:Client_SelectedBG = -1
  SELF.Q.EXC:PatientStatus_NormalFG = -1                   ! Set color values for EXC:PatientStatus
  SELF.Q.EXC:PatientStatus_NormalBG = -1
  SELF.Q.EXC:PatientStatus_SelectedFG = -1
  SELF.Q.EXC:PatientStatus_SelectedBG = -1
  SELF.Q.EXC:Age_NormalFG = -1                             ! Set color values for EXC:Age
  SELF.Q.EXC:Age_NormalBG = -1
  SELF.Q.EXC:Age_SelectedFG = -1
  SELF.Q.EXC:Age_SelectedBG = -1


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

