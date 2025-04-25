

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8016.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8040.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8049.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8061.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8079.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Client file
!!! </summary>
Client PROCEDURE 

CurrentTab           STRING(80)                            !
locHL7ExportTime     LONG                                  !
locMexican           LONG                                  !
locPickupCount       BYTE                                  !
locSendoutCount      SHORT                                 !
locSendoutCountToday USHORT                                !
locPickupWarning     BYTE                                  !
locPickupLate        BYTE                                  !
locLocator           STRING(20)                            !
locLocatorLabel      STRING(13)                            !
SAV:WallPaper        STRING(48)                            !
locPopupString       STRING(20)                            !
locClientName        STRING(50)                            !
CLIENT:FollowupDate  LONG                                  !
locConfirmCount      SHORT                                 !
locSuppliesCount     SHORT                                 !
locExceptioncount    SHORT                                 !
FeesClient QUEUE,PRE(FC) 
Client  LONG
.  
Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Data    STRING(32)
        . .      
BRW1::View:Browse    VIEW(Client)
                       PROJECT(CLI:NUMBER)
                       PROJECT(CLI:CITY)
                       PROJECT(CLI:STATE)
                       PROJECT(CLI:ZIP)
                       PROJECT(CLI:PHONE)
                       PROJECT(CLI:LAST)
                       PROJECT(CLI:HOLD)
                       PROJECT(CLI:SALESMAN)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CLI:NUMBER             LIKE(CLI:NUMBER)               !List box control field - type derived from field
CLI:NUMBER_NormalFG    LONG                           !Normal forground color
CLI:NUMBER_NormalBG    LONG                           !Normal background color
CLI:NUMBER_SelectedFG  LONG                           !Selected forground color
CLI:NUMBER_SelectedBG  LONG                           !Selected background color
CLI:NUMBER_Style       LONG                           !Field style
locClientName          LIKE(locClientName)            !List box control field - type derived from local data
locClientName_NormalFG LONG                           !Normal forground color
locClientName_NormalBG LONG                           !Normal background color
locClientName_SelectedFG LONG                         !Selected forground color
locClientName_SelectedBG LONG                         !Selected background color
locClientName_Style    LONG                           !Field style
CLIENT:FollowupDate    LIKE(CLIENT:FollowupDate)      !List box control field - type derived from local data
CLIENT:FollowupDate_NormalFG LONG                     !Normal forground color
CLIENT:FollowupDate_NormalBG LONG                     !Normal background color
CLIENT:FollowupDate_SelectedFG LONG                   !Selected forground color
CLIENT:FollowupDate_SelectedBG LONG                   !Selected background color
CLIENT:FollowupDate_Style LONG                        !Field style
CLI:CITY               LIKE(CLI:CITY)                 !List box control field - type derived from field
CLI:CITY_NormalFG      LONG                           !Normal forground color
CLI:CITY_NormalBG      LONG                           !Normal background color
CLI:CITY_SelectedFG    LONG                           !Selected forground color
CLI:CITY_SelectedBG    LONG                           !Selected background color
CLI:CITY_Style         LONG                           !Field style
CLI:STATE              LIKE(CLI:STATE)                !List box control field - type derived from field
CLI:STATE_NormalFG     LONG                           !Normal forground color
CLI:STATE_NormalBG     LONG                           !Normal background color
CLI:STATE_SelectedFG   LONG                           !Selected forground color
CLI:STATE_SelectedBG   LONG                           !Selected background color
CLI:STATE_Style        LONG                           !Field style
CLI:ZIP                LIKE(CLI:ZIP)                  !List box control field - type derived from field
CLI:ZIP_NormalFG       LONG                           !Normal forground color
CLI:ZIP_NormalBG       LONG                           !Normal background color
CLI:ZIP_SelectedFG     LONG                           !Selected forground color
CLI:ZIP_SelectedBG     LONG                           !Selected background color
CLI:ZIP_Style          LONG                           !Field style
CLI:PHONE              LIKE(CLI:PHONE)                !List box control field - type derived from field
CLI:PHONE_NormalFG     LONG                           !Normal forground color
CLI:PHONE_NormalBG     LONG                           !Normal background color
CLI:PHONE_SelectedFG   LONG                           !Selected forground color
CLI:PHONE_SelectedBG   LONG                           !Selected background color
CLI:PHONE_Style        LONG                           !Field style
CLI:LAST               LIKE(CLI:LAST)                 !List box control field - type derived from field
CLI:LAST_NormalFG      LONG                           !Normal forground color
CLI:LAST_NormalBG      LONG                           !Normal background color
CLI:LAST_SelectedFG    LONG                           !Selected forground color
CLI:LAST_SelectedBG    LONG                           !Selected background color
CLI:LAST_Style         LONG                           !Field style
CLI:HOLD               LIKE(CLI:HOLD)                 !Browse key field - type derived from field
CLI:SALESMAN           LIKE(CLI:SALESMAN)             !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11,,FONT:regular),GRAY,IMM,MAX,MDI,HLP('Client'),SYSTEM, |
  TIMER(100)
                       ENTRY(@s20),AT(306,18,69,9),USE(locLocator),RIGHT(2)
                       STRING(@s13),AT(230,18,71,10),USE(locLocatorLabel),FONT(,12,COLOR:Black,FONT:bold),RIGHT,TRN
                       STRING('Clients'),AT(90,18),USE(?String2),FONT(,12,COLOR:Black,FONT:bold),TRN
                       LIST,AT(4,32,409,263),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,ALRT(TabKey),FORMAT('32C|M*Y~Ac' & |
  'count~@p### ###p@Z(1)154L(3)M*Y~Name~C(0)@s50@Z(1)39R(1)|M*Y~Deadline~L(3)@d1b@Z(1)7' & |
  '1L(2)|M*Y~City~@s20@Z(1)13C(2)|M*Y~St~@s2@Z(1)40L(2)|M*Y~Postal~@s10@Z(1)83L(2)|M*Y~' & |
  'Phone~C(0)@s20@Z(1)100C|M*Y~LAST~@s25@Z(1)'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Client file'),TRN
                       STRING('Supplies'),AT(108,304,44,9),USE(?suppliesString:2),FONT(,11,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       STRING('Confirm'),AT(152,304,44,10),USE(?ConfirmString),FONT(,11,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       STRING('Sendout'),AT(196,304,44,9),USE(?SendoutString:2),FONT(,11,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       STRING('Exceptions'),AT(240,304,45,8),USE(?exceptionsString),FONT(,11,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       STRING('Pickup'),AT(64,304,44,9),USE(?PickupsString),FONT(,11,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                       STRING(@n2b),AT(196,314,44,10),USE(locSendoutCount),FONT(,14,COLOR:Aqua,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black)
                       STRING(@n_4b),AT(240,314,44,10),USE(locExceptioncount),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black)
                       STRING(@n2b),AT(64,314,44,10),USE(locPickupLate),FONT(,14,COLOR:Red,FONT:bold),CENTER,COLOR(COLOR:Black)
                       STRING(@n2b),AT(108,314,44,10),USE(locSuppliesCount),FONT(,14,COLOR:Yellow,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black)
                       STRING(@n2b),AT(152,314,44,10),USE(locConfirmCount),FONT(,14,COLOR:Lime,FONT:bold,CHARSET:ANSI), |
  CENTER,COLOR(COLOR:Black)
                       BUTTON('To Do'),AT(422,214,70,25),USE(?ButtonToDo),FONT(,,,FONT:bold),TRN
                       STRING('Pick Ups'),AT(422,198,70,12),USE(?PickupString),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       STRING('Follow Up'),AT(422,162,70,12),USE(?FollowUpString),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  CENTER,HIDE,TRN
                       STRING('Confirmation'),AT(422,138,70,12),USE(?ConfirmationString),FONT(,14,COLOR:Red,FONT:bold, |
  CHARSET:ANSI),CENTER,HIDE,TRN
                       STRING('Exceptions'),AT(422,150,70,12),USE(?ExceptionString),FONT(,14,COLOR:Red,FONT:bold, |
  CHARSET:ANSI),CENTER,HIDE,TRN
                       STRING('Supplies'),AT(422,174,70,12),USE(?SuppliesString),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  CENTER,HIDE,TRN
                       STRING('Sendout'),AT(422,186,70,12),USE(?SendoutString),FONT(,14,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  CENTER,HIDE,TRN
                       BUTTON('All Patients'),AT(420,248,70,25),USE(?ButtonPatient),FONT(,,,FONT:bold),TRN
                       BUTTON('&Help'),AT(548,11,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Close'),AT(420,290,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(422,214,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(420,248,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image1)
                       SHEET,AT(4,0,410,297),USE(?CurrentTab),FONT(,,,FONT:regular+FONT:strikeout),COLOR(00A3A3A3h), |
  SPREAD
                         TAB('Account #'),USE(?AccountTab),FONT(,12,COLOR:Black,FONT:bold)
                         END
                         TAB('Name'),USE(?NameTab),FONT(,12,COLOR:Black,FONT:bold)
                         END
                         TAB('On Hold'),USE(?Tab:4),FONT(,,COLOR:Black,,CHARSET:ANSI),HIDE
                         END
                         TAB('Zip Code'),USE(?Tab:5),HIDE
                         END
                       END
                       CHECK('200 000+'),AT(326,310),USE(locMexican),FONT(,,,FONT:bold),COLOR(COLOR:Yellow),ICON(ICON:None), |
  TRN,VALUE('199999','0')
                       BUTTON('&Insert'),AT(422,48,70,25),USE(?Insert),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  TRN
                       BUTTON('&Change'),AT(422,88,70,25),USE(?Change),FONT(,,,FONT:bold),LEFT,ICON('WAChange.ICO'), |
  TRN
                       BUTTON('&Delete'),AT(431,119,42,12),USE(?Delete),HIDE
                       IMAGE('BUTTON.JPG'),AT(422,48,70,25),USE(?IMAGE4)
                       IMAGE('button.jpg'),AT(422,88,70,25),USE(?IMAGE5)
                       BUTTON('Export Fees'),AT(422,17,70),USE(?ButtonExportFees)
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Ask                    PROCEDURE(BYTE Request),BYTE,PROC,DERIVED
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetUsePopup            PROCEDURE(BYTE UsePopUp=True),DERIVED
TakeEvent              PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  CLASS(EntryLocatorClass)              ! Default Locator
TakeAccepted           PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepLongClass                        ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
BRW1::Sort4:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
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
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?Browse:1{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = 16777215
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = 0
  !------------------------------------
!---------------------------------------------------------------------------
PickupCount ROUTINE
  SET(PU:DateKey)
  IF TODAY() % 7 < 3
    T# = TODAY() -2
  ELSE
    T# = TODAY()
  .
  locPickupLate = 0
  locPickupWarning = 0
  locSendoutCount = 0
  locSendoutCountToday = 0
  
  LOOP
    NEXT(PickUp)
    IF PU:Received OR ERRORCODE() THEN BREAK.
    locPickupLate += 1
    CASE T# - PU:Date
    OF 3 TO 100
      
    OF 2 
      locPickupWarning += 1
    .
    locPickupCount += 1

  .
  IF locPickupLate OR locPickupWarning
    SETFONT(?PickupString,'Arial',14,COLOR:Red,FONT:Bold)
    SETPOSITION(?PickupString,,194)
  ELSE
    SETFONT(?PickupString,'Arial',10,COLOR:Black,FONT:Thin)
    SETPOSITION(?PickupString,,196)
    
  .
  DO ShowToDo

  SET(Sendouts)
  LOOP
    NEXT(Sendouts)
    IF ERRORCODE() THEN BREAK.
    IF SO:Date = TODAY()
      locSendoutCountToday += 1
    ELSE
      locSendoutCount += 1
    .
  .
  locConfirmCount =   RECORDS(SpecimenReceived)
  locExceptioncount = RECORDS(ToDo)

ShowToDo  ROUTINE
  IF RECORDS(Exceptions)
    UNHIDE(?ExceptionString)
  ELSE
    HIDE(?ExceptionString)
  .
  IF RECORDS(SpecimenReceived)
    UNHIDE(?ConfirmationString)
  ELSE
    HIDE(?ConfirmationString)
  .
  IF RECORDS(FollowUp)
    UNHIDE(?FollowUpString)
  ELSE
    HIDE(?FollowUpString)
  .
  locSuppliesCount = 0
  CLEAR(SUP:Record)
  SET(SUP:FindUnShippedKey,SUP:FindUnShippedKey)
  LOOP
    NEXT(Supplies)
    IF SUP:ShipDate THEN BREAK.
    locSuppliesCount += 1
  .
  IF locSuppliesCount THEN UNHIDE(?SuppliesString) ELSE HIDE(?SuppliesString).


GetFees ROUTINE
  gloFileName2 = 'FeesClient.XLS'
  CREATE(Post)
  OPEN(Post)
  FC:Client = 100003; ADD(FeesClient);
  FC:Client = 100021;ADD(FeesClient);
  FC:Client = 100024;ADD(FeesClient);
  FC:Client = 100025;ADD(FeesClient);
  FC:Client = 100028;ADD(FeesClient);
  FC:Client = 100031;ADD(FeesClient);
  FC:Client = 100032;ADD(FeesClient);
  FC:Client = 100035;ADD(FeesClient);
  FC:Client = 100036;ADD(FeesClient);
  FC:Client = 100040;ADD(FeesClient);
  FC:Client = 100042;ADD(FeesClient);
  FC:Client = 100051;ADD(FeesClient);
  FC:Client = 100059;ADD(FeesClient);
  FC:Client = 100060;ADD(FeesClient);
  FC:Client = 100064;ADD(FeesClient);
  FC:Client = 100067;ADD(FeesClient);
  FC:Client = 100077;ADD(FeesClient);
  FC:Client = 100078;ADD(FeesClient);
  FC:Client = 100082;ADD(FeesClient);
  FC:Client = 200006;ADD(FeesClient);
  FC:Client = 200012;ADD(FeesClient);
  FC:Client = 200020;ADD(FeesClient);
  FC:Client = 200032;ADD(FeesClient);
  FC:Client = 200042;ADD(FeesClient);
  FC:Client = 200094;ADD(FeesClient);
  FC:Client = 200113;ADD(FeesClient);
  FC:Client = 200203;ADD(FeesClient);
  FC:Client = 200219;ADD(FeesClient);
  FC:Client = 200220;ADD(FeesClient);
  FC:Client = 200225;ADD(FeesClient);
  FC:Client = 200241;ADD(FeesClient);
  FC:Client = 200249;ADD(FeesClient);
  FC:Client = 200261;ADD(FeesClient);
  FC:Client = 200268;ADD(FeesClient);
  FC:Client = 200291;ADD(FeesClient);
  FC:Client = 200310;ADD(FeesClient);
  FC:Client = 200313;ADD(FeesClient);
  FC:Client = 200314;ADD(FeesClient);
  FC:Client = 200315;ADD(FeesClient);
  FC:Client = 200366;ADD(FeesClient);
  FC:Client = 200394;ADD(FeesClient);
  FC:Client = 200399;ADD(FeesClient);
  FC:Client = 200402;ADD(FeesClient);
  FC:Client = 200423;ADD(FeesClient);
  FC:Client = 200424;ADD(FeesClient);
  FC:Client = 500001;ADD(FeesClient);
  FC:Client = 500003;ADD(FeesClient);
  FC:Client = 500007;ADD(FeesClient);
  FC:Client = 500008;ADD(FeesClient);
  FC:Client = 500228;ADD(FeesClient);
  FC:Client = 500231;ADD(FeesClient);
  FC:Client = 500233;ADD(FeesClient);
  FC:Client = 500234;ADD(FeesClient);
  FC:Client = 500243;ADD(FeesClient);
  FC:Client = 500245;ADD(FeesClient);
  FC:Client = 500248;ADD(FeesClient);
  FC:Client = 500249;ADD(FeesClient);
  FC:Client = 500251;ADD(FeesClient);
  FC:Client = 500256;ADD(FeesClient);
  FC:Client = 500258;ADD(FeesClient);
  FC:Client = 500271;ADD(FeesClient);
  FC:Client = 500274;ADD(FeesClient);
  FC:Client = 500280;ADD(FeesClient);
  FC:Client = 500289;ADD(FeesClient);
  FC:Client = 500295;ADD(FeesClient);
  FC:Client = 500300;ADD(FeesClient);
  FC:Client = 500306;ADD(FeesClient);
  FC:Client = 500316;ADD(FeesClient);
  FC:Client = 500367;ADD(FeesClient);
  FC:Client = 500378;ADD(FeesClient);
  FC:Client = 500389;ADD(FeesClient);
  FC:Client = 500396;ADD(FeesClient);
  FC:Client = 500428;ADD(FeesClient);
  FC:Client = 500445;ADD(FeesClient);
  FC:Client = 500472;ADD(FeesClient);
  FC:Client = 500479;ADD(FeesClient);
  FC:Client = 500492;ADD(FeesClient);
  FC:Client = 500523;ADD(FeesClient);
  FC:Client = 500595;ADD(FeesClient);
  FC:Client = 500627;ADD(FeesClient);
  FC:Client = 500751;ADD(FeesClient);
  FC:Client = 500809;ADD(FeesClient);
  FC:Client = 500815;ADD(FeesClient);
  FC:Client = 500823;ADD(FeesClient);
  FC:Client = 500854;ADD(FeesClient);
  FC:Client = 500862;ADD(FeesClient);
  FC:Client = 500904;ADD(FeesClient);
  FC:Client = 700000;ADD(FeesClient);
  FC:Client = 700001;ADD(FeesClient);
  LOOP X# = 1 TO RECORDS(FeesClient)
    GET(FeesClient,X#)                         
    FEE:Client = FC:Client
    GET(FEES,FEE:OrderKey)
    PST:Data =  FEE:Client & ',' & FEE:TIgE & ',' &  FEE:IgE & ',' & FEE:mxIgE  & ',' & FEE:hyIgE  & ',' & FEE:occIgE  & ',' & FEE:chemIgE  & ',' & FEE:ComponentIgE
    ADD(Post) 
    IF(Errorcode()) THEN STOP(PST:DATA).
  .



ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Client')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?locLocator
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locMexican',locMexican)                            ! Added by: BrowseBox(ABC)
  BIND('locClientName',locClientName)                      ! Added by: BrowseBox(ABC)
  BIND('CLIENT:FollowupDate',CLIENT:FollowupDate)          ! Added by: BrowseBox(ABC)
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
  Relate:Fees.Open                                         ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:FollowUp.Open                                     ! File FollowUp used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                         ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Access:PickUp.UseFile                                    ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Supplies.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Client,SELF) ! Initialize the browse manager
  BRW1.SetUsePopup(False)
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon CLI:LAST for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,CLI:NAME_KEY)    ! Add the sort order for CLI:NAME_KEY for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?locLocator,CLI:LAST,1,BRW1)    ! Initialize the browse locator using ?locLocator using key: CLI:NAME_KEY , CLI:LAST
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon CLI:HOLD for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,CLI:HOLD_KEY)    ! Add the sort order for CLI:HOLD_KEY for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,CLI:HOLD,1,BRW1)               ! Initialize the browse locator using  using key: CLI:HOLD_KEY , CLI:HOLD
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon CLI:ZIP for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,CLI:ZIP_NDX)     ! Add the sort order for CLI:ZIP_NDX for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,CLI:ZIP,,BRW1)                 ! Initialize the browse locator using  using key: CLI:ZIP_NDX , CLI:ZIP
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive,ScrollBy:Runtime) ! Moveable thumb based upon CLI:SALESMAN for sort order 4
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,CLI:SALES_NDX)   ! Add the sort order for CLI:SALES_NDX for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,CLI:SALESMAN,,BRW1)            ! Initialize the browse locator using  using key: CLI:SALES_NDX , CLI:SALESMAN
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon CLI:NUMBER for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,CLI:ORDER_KEY)   ! Add the sort order for CLI:ORDER_KEY for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(?locLocator,CLI:NUMBER,1,BRW1)  ! Initialize the browse locator using ?locLocator using key: CLI:ORDER_KEY , CLI:NUMBER
  BRW1.SetFilter('(locMexican << CLI:NUMBER)')             ! Apply filter expression to browse
  BRW1.AddField(CLI:NUMBER,BRW1.Q.CLI:NUMBER)              ! Field CLI:NUMBER is a hot field or requires assignment from browse
  BRW1.AddField(locClientName,BRW1.Q.locClientName)        ! Field locClientName is a hot field or requires assignment from browse
  BRW1.AddField(CLIENT:FollowupDate,BRW1.Q.CLIENT:FollowupDate) ! Field CLIENT:FollowupDate is a hot field or requires assignment from browse
  BRW1.AddField(CLI:CITY,BRW1.Q.CLI:CITY)                  ! Field CLI:CITY is a hot field or requires assignment from browse
  BRW1.AddField(CLI:STATE,BRW1.Q.CLI:STATE)                ! Field CLI:STATE is a hot field or requires assignment from browse
  BRW1.AddField(CLI:ZIP,BRW1.Q.CLI:ZIP)                    ! Field CLI:ZIP is a hot field or requires assignment from browse
  BRW1.AddField(CLI:PHONE,BRW1.Q.CLI:PHONE)                ! Field CLI:PHONE is a hot field or requires assignment from browse
  BRW1.AddField(CLI:LAST,BRW1.Q.CLI:LAST)                  ! Field CLI:LAST is a hot field or requires assignment from browse
  BRW1.AddField(CLI:HOLD,BRW1.Q.CLI:HOLD)                  ! Field CLI:HOLD is a hot field or requires assignment from browse
  BRW1.AddField(CLI:SALESMAN,BRW1.Q.CLI:SALESMAN)          ! Field CLI:SALESMAN is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  SAV:WallPaper = gloWallpaper
  POST(EVENT:Timer)
  locMexican = 199999
  ALIAS(EnterKey,TabKey)
  DO PickupCount
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?Browse:1,Queue:Browse:1)
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
    Relate:Fees.Close
    Relate:FollowUp.Close
    Relate:SendOuts.Close
    Relate:SpecimenReceived.Close
    Relate:ToDo.Close
  END
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
    UpdateClient
    ReturnValue = GlobalResponse
  END
  ALIAS(EnterKey,TabKey)
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
    OF ?locLocator
      ThisWindow.Update
      CLI:NUMBER = ?locLocator{PROP:USE}
      GET(client,CLI:ORDER_KEY)
      IF ~ERRORCODE()
        GlobalRequest = ChangeRecord
        ALIAS
        UpdateClient
        SETKEYCODE(0)
        ALIAS(EnterKey,TabKey)
        SELECT(?ButtonToDo)
        IF globalResponse = RequestCompleted
          BRW1.ResetFromFile
          BRW1.ResetFromView
          SETKEYCODE(0)    
          SELECT(?ButtonToDo)
      . .
        
    OF ?ButtonToDo
      ALIAS
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ButtonToDo
      ThisWindow.Update
      ToDo()
      ThisWindow.Reset
      ALIAS(EnterKey,TabKey)
      DO PickupCount
    OF ?ButtonPatient
      ThisWindow.Update
      Patients()
      ThisWindow.Reset
    OF ?locMexican
      BRW1.ResetQueue(1)
      POST(EVENT:NewSelection,?Browse:1)
      POST(EVENT:ScrollTop,?Browse:1)
    OF ?ButtonExportFees
      ThisWindow.Update
      Do GetFees
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
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = MouseLeft2 OR KEYCODE() = TabKey
        GlobalRequest = ChangeRecord
        GET(Client,CLI:ORDER_KEY)
        ALIAS         
        UpdateClient
        SETKEYCODE(0)
        SELECT(?ButtonToDo)
        ALIAS(EnterKey,TabKey)
        IF globalResponse = RequestCompleted
          BRW1.ResetFromFile
          BRW1.ResetFromView
          SETKEYCODE(0)    
          SELECT(?ButtonToDo)
      . .
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?CurrentTab
    CASE EVENT()
    OF EVENT:TabChanging
      IF CHOICE() = 1
        locLocatorLabel = 'Find by Name'
      ELSE
        locLocatorLabel = 'Find Account#'
      .
      DISPLAY(?locLocatorLabel)
      POST(Event:ScrollTop,?Browse:1)
      DO PickupCount
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
    CASE EVENT()
    OF EVENT:GainFocus
      ALIAS(EnterKey,TabKey)
    OF EVENT:LoseFocus
      ALIAS
    OF EVENT:Timer
      
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      !    HIDE(?locLocator,?Help)
      !    IF ~BAND(gloPermissions,ACCESS:Clients) THEN gloPermissions = Passcode(1).
      
      locLocatorLabel  = 'Find Acount#'
    OF EVENT:Timer




  IF ~BAND(gloPermissions,ACCESS:Clients+ACCESS:EditClients) THEN POST(EVENT:CloseWindow).
  IF SAV:Wallpaper <> gloWallpaper THEN 0{PROP:Wallpaper} = gloWallpaper; SAV:Wallpaper = gloWallpaper.
  IF  BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN UNHIDE(?ButtonPatient) ELSE HIDE(?ButtonPatient).

  IF RECORDS(Exceptions)
    UNHIDE(?ExceptionString)
  ELSE
    HIDE(?ExceptionString)
    gloCloseExceptions = 1
  .


      !ACCESS:Clients         EQUATE(1)
      !ACCESS:Patients        EQUATE(2)
      !ACCESS:Verify         EQUATE(4)
      !ACCESS:Workpool       EQUATE(8)
      !ACCESS:PrintResults   EQUATE(16)
      !ACCESS:ViewResults    EQUATE(32)
      !ACCESS:ReadInResults  EQUATE(64)
      !ACCESS:Database       EQUATE(128)
      !ACCESS:Admin          EQUATE(256)
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Ask PROCEDURE(BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Ask(Request)
  !ASK
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
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
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  locLocator = ''
  DISPLAY(?locLocator)
  POST(Event:ScrollTop,?Browse:1)
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (CLI:Hold)
    SELF.Q.CLI:NUMBER_NormalFG = 16777215                  ! Set conditional color values for CLI:NUMBER
    SELF.Q.CLI:NUMBER_NormalBG = 255
    SELF.Q.CLI:NUMBER_SelectedFG = 255
    SELF.Q.CLI:NUMBER_SelectedBG = 16777215
    SELF.Q.locClientName_NormalFG = 16777215               ! Set conditional color values for locClientName
    SELF.Q.locClientName_NormalBG = 255
    SELF.Q.locClientName_SelectedFG = 255
    SELF.Q.locClientName_SelectedBG = 16777215
    SELF.Q.CLIENT:FollowupDate_NormalFG = 16777215         ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 16777215
    SELF.Q.CLI:CITY_NormalFG = 16777215                    ! Set conditional color values for CLI:CITY
    SELF.Q.CLI:CITY_NormalBG = 255
    SELF.Q.CLI:CITY_SelectedFG = 255
    SELF.Q.CLI:CITY_SelectedBG = 16777215
    SELF.Q.CLI:STATE_NormalFG = 16777215                   ! Set conditional color values for CLI:STATE
    SELF.Q.CLI:STATE_NormalBG = 255
    SELF.Q.CLI:STATE_SelectedFG = 255
    SELF.Q.CLI:STATE_SelectedBG = 16777215
    SELF.Q.CLI:ZIP_NormalFG = 16777215                     ! Set conditional color values for CLI:ZIP
    SELF.Q.CLI:ZIP_NormalBG = 255
    SELF.Q.CLI:ZIP_SelectedFG = 255
    SELF.Q.CLI:ZIP_SelectedBG = 16777215
    SELF.Q.CLI:PHONE_NormalFG = 16777215                   ! Set conditional color values for CLI:PHONE
    SELF.Q.CLI:PHONE_NormalBG = 255
    SELF.Q.CLI:PHONE_SelectedFG = 255
    SELF.Q.CLI:PHONE_SelectedBG = 16777215
    SELF.Q.CLI:LAST_NormalFG = 16777215                    ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 255
    SELF.Q.CLI:LAST_SelectedFG = 255
    SELF.Q.CLI:LAST_SelectedBG = 16777215
  ELSIF (CLI:FOLLOWUPDATE)
    SELF.Q.CLI:NUMBER_NormalFG = 0                         ! Set conditional color values for CLI:NUMBER
    SELF.Q.CLI:NUMBER_NormalBG = 65535
    SELF.Q.CLI:NUMBER_SelectedFG = 65535
    SELF.Q.CLI:NUMBER_SelectedBG = 0
    SELF.Q.locClientName_NormalFG = 0                      ! Set conditional color values for locClientName
    SELF.Q.locClientName_NormalBG = 65535
    SELF.Q.locClientName_SelectedFG = 65535
    SELF.Q.locClientName_SelectedBG = 0
    SELF.Q.CLIENT:FollowupDate_NormalFG = 0                ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 65535
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 65535
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 0
    SELF.Q.CLI:CITY_NormalFG = 0                           ! Set conditional color values for CLI:CITY
    SELF.Q.CLI:CITY_NormalBG = 65535
    SELF.Q.CLI:CITY_SelectedFG = 65535
    SELF.Q.CLI:CITY_SelectedBG = 0
    SELF.Q.CLI:STATE_NormalFG = 0                          ! Set conditional color values for CLI:STATE
    SELF.Q.CLI:STATE_NormalBG = 65535
    SELF.Q.CLI:STATE_SelectedFG = 65535
    SELF.Q.CLI:STATE_SelectedBG = 0
    SELF.Q.CLI:ZIP_NormalFG = 0                            ! Set conditional color values for CLI:ZIP
    SELF.Q.CLI:ZIP_NormalBG = 65535
    SELF.Q.CLI:ZIP_SelectedFG = 65535
    SELF.Q.CLI:ZIP_SelectedBG = 0
    SELF.Q.CLI:PHONE_NormalFG = 0                          ! Set conditional color values for CLI:PHONE
    SELF.Q.CLI:PHONE_NormalBG = 65535
    SELF.Q.CLI:PHONE_SelectedFG = 65535
    SELF.Q.CLI:PHONE_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 65535
    SELF.Q.CLI:LAST_SelectedFG = 65535
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSIF (CLI:Pickup)
    SELF.Q.CLI:NUMBER_NormalFG = 0                         ! Set conditional color values for CLI:NUMBER
    SELF.Q.CLI:NUMBER_NormalBG = 33023
    SELF.Q.CLI:NUMBER_SelectedFG = 33023
    SELF.Q.CLI:NUMBER_SelectedBG = 0
    SELF.Q.locClientName_NormalFG = 0                      ! Set conditional color values for locClientName
    SELF.Q.locClientName_NormalBG = 33023
    SELF.Q.locClientName_SelectedFG = 33023
    SELF.Q.locClientName_SelectedBG = 0
    SELF.Q.CLIENT:FollowupDate_NormalFG = 0                ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 33023
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 33023
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 0
    SELF.Q.CLI:CITY_NormalFG = 0                           ! Set conditional color values for CLI:CITY
    SELF.Q.CLI:CITY_NormalBG = 33023
    SELF.Q.CLI:CITY_SelectedFG = 33023
    SELF.Q.CLI:CITY_SelectedBG = 0
    SELF.Q.CLI:STATE_NormalFG = 0                          ! Set conditional color values for CLI:STATE
    SELF.Q.CLI:STATE_NormalBG = 33023
    SELF.Q.CLI:STATE_SelectedFG = 33023
    SELF.Q.CLI:STATE_SelectedBG = 0
    SELF.Q.CLI:ZIP_NormalFG = 0                            ! Set conditional color values for CLI:ZIP
    SELF.Q.CLI:ZIP_NormalBG = 33023
    SELF.Q.CLI:ZIP_SelectedFG = 33023
    SELF.Q.CLI:ZIP_SelectedBG = 0
    SELF.Q.CLI:PHONE_NormalFG = 0                          ! Set conditional color values for CLI:PHONE
    SELF.Q.CLI:PHONE_NormalBG = 33023
    SELF.Q.CLI:PHONE_SelectedFG = 33023
    SELF.Q.CLI:PHONE_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 33023
    SELF.Q.CLI:LAST_SelectedFG = 33023
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSE
    SELF.Q.CLI:NUMBER_NormalFG = -1                        ! Set color values for CLI:NUMBER
    SELF.Q.CLI:NUMBER_NormalBG = -1
    SELF.Q.CLI:NUMBER_SelectedFG = -1
    SELF.Q.CLI:NUMBER_SelectedBG = -1
    SELF.Q.locClientName_NormalFG = -1                     ! Set color values for locClientName
    SELF.Q.locClientName_NormalBG = -1
    SELF.Q.locClientName_SelectedFG = -1
    SELF.Q.locClientName_SelectedBG = -1
    SELF.Q.CLIENT:FollowupDate_NormalFG = -1               ! Set color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = -1
    SELF.Q.CLIENT:FollowupDate_SelectedFG = -1
    SELF.Q.CLIENT:FollowupDate_SelectedBG = -1
    SELF.Q.CLI:CITY_NormalFG = -1                          ! Set color values for CLI:CITY
    SELF.Q.CLI:CITY_NormalBG = -1
    SELF.Q.CLI:CITY_SelectedFG = -1
    SELF.Q.CLI:CITY_SelectedBG = -1
    SELF.Q.CLI:STATE_NormalFG = -1                         ! Set color values for CLI:STATE
    SELF.Q.CLI:STATE_NormalBG = -1
    SELF.Q.CLI:STATE_SelectedFG = -1
    SELF.Q.CLI:STATE_SelectedBG = -1
    SELF.Q.CLI:ZIP_NormalFG = -1                           ! Set color values for CLI:ZIP
    SELF.Q.CLI:ZIP_NormalBG = -1
    SELF.Q.CLI:ZIP_SelectedFG = -1
    SELF.Q.CLI:ZIP_SelectedBG = -1
    SELF.Q.CLI:PHONE_NormalFG = -1                         ! Set color values for CLI:PHONE
    SELF.Q.CLI:PHONE_NormalBG = -1
    SELF.Q.CLI:PHONE_SelectedFG = -1
    SELF.Q.CLI:PHONE_SelectedBG = -1
    SELF.Q.CLI:LAST_NormalFG = -1                          ! Set color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = -1
    SELF.Q.CLI:LAST_SelectedFG = -1
    SELF.Q.CLI:LAST_SelectedBG = -1
  END
  SELF.Q.CLI:NUMBER_Style = 1 ! 
  SELF.Q.locClientName_Style = 1 ! 
  SELF.Q.CLIENT:FollowupDate_Style = 1 ! 
  SELF.Q.CLI:CITY_Style = 1 ! 
  SELF.Q.CLI:STATE_Style = 1 ! 
  SELF.Q.CLI:ZIP_Style = 1 ! 
  SELF.Q.CLI:PHONE_Style = 1 ! 
  SELF.Q.CLI:LAST_Style = 1 ! 
  IF INRANGE(CLIENT:FollowupDate,70000,90000)
  IF (CLIENT:FollowupDate - TODAY() < 2)
    SELF.Q.CLIENT:FollowupDate_NormalFG = 16777215         ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 16777215
  ELSIF (CLIENT:FollowupDate -TODAY() < 7)
    SELF.Q.CLIENT:FollowupDate_NormalFG = 0                ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 65535
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 65535
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 0
  .  .
      FEE:Client = CLI:NUMBER
      GET(Fees,FEE:OrderKey)
      IF ERRORCODE() THEN CLEAR(FEE:Record).
    
      IF FEE:IgE = 0 
        SELF.Q.CLI:NUMBER_NormalFG = COLOR:WHITE                  ! Set conditional color values for CLI:NUMBER
        SELF.Q.CLI:NUMBER_NormalBG = COLOR:RED
        SELF.Q.CLI:NUMBER_SelectedFG = COLOR:RED
        SELF.Q.CLI:NUMBER_SelectedBG = COLOR:WHITE
      .
    
  OMIT ('XXXX')
  ELSIF   CLI:Hold
         SELF.Q.CLIENT:FollowupDate_NormalFG = 16777215         ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 255
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 16777215
  ELSIF    CLI:FOLLOW
      SELF.Q.CLIENT:FollowupDate_NormalFG = 0                ! Set conditional color values for CLIENT:FollowupDate
    SELF.Q.CLIENT:FollowupDate_NormalBG = 65280
    SELF.Q.CLIENT:FollowupDate_SelectedFG = 65280
    SELF.Q.CLIENT:FollowupDate_SelectedBG = 0
     
  ELSIF CLI:Pickup
      SELF.Q.locClientName_NormalFG = 0                      ! Set conditional color values for locClientName
    SELF.Q.locClientName_NormalBG = 33023
    SELF.Q.locClientName_SelectedFG = 33023
    SELF.Q.locClientName_SelectedBG = 0
  
  XXXX


BRW1.SetUsePopup PROCEDURE(BYTE UsePopUp=True)

  CODE
  PARENT.SetUsePopup(UsePopUp)
  !popup


BRW1.TakeEvent PROCEDURE

  CODE
  PARENT.TakeEvent
  ThisWindow.Update
  IF FIELD() = ?Browse:1 AND KEYCODE() =  MouseLeft2
  .  
  
  
  


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
      IF CLI:FIRST
        locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
      ELSE
        locClientName = CLI:LAST
      .
      IF ~INRANGE(CLI:FollowupDate,50000,90000) THEN CLI:FollowupDate = 0.
      CLIENT:FollowupDate = CLI:FollowupDate
    
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


BRW1::Sort0:Locator.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  
  ReturnValue = PARENT.TakeAccepted()
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

