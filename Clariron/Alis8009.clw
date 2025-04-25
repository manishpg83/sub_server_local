

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8009.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! All Patients
!!! </summary>
Patients PROCEDURE 

CurrentTab           STRING(80)                            !
locBillingDateExists STRING(1)                             !
locPatient           LONG                                  !
locCovidHigh         LONG(499999)                          !
locCovidLow          LONG(100000)                          !
locCovid             LONG                                  !
locLocator           STRING(20)                            !
locLocatorLabel      STRING(20)                            !
locDOW               STRING(4)                             !
BRW1::View:Browse    VIEW(Patient)
                       PROJECT(Pat:STATUS)
                       PROJECT(Pat:BILLING)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:LAST)
                       PROJECT(Pat:FIRST)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:ENTERED_BY)
                       PROJECT(Pat:VERIFIED_BY)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                       JOIN(BILL:patKey,Pat:INVOICE)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pat:STATUS             LIKE(Pat:STATUS)               !List box control field - type derived from field
Pat:STATUS_NormalFG    LONG                           !Normal forground color
Pat:STATUS_NormalBG    LONG                           !Normal background color
Pat:STATUS_SelectedFG  LONG                           !Selected forground color
Pat:STATUS_SelectedBG  LONG                           !Selected background color
Pat:STATUS_Style       LONG                           !Field style
locBillingDateExists   LIKE(locBillingDateExists)     !List box control field - type derived from local data
locBillingDateExists_NormalFG LONG                    !Normal forground color
locBillingDateExists_NormalBG LONG                    !Normal background color
locBillingDateExists_SelectedFG LONG                  !Selected forground color
locBillingDateExists_SelectedBG LONG                  !Selected background color
locBillingDateExists_Style LONG                       !Field style
Pat:BILLING            LIKE(Pat:BILLING)              !List box control field - type derived from field
Pat:BILLING_NormalFG   LONG                           !Normal forground color
Pat:BILLING_NormalBG   LONG                           !Normal background color
Pat:BILLING_SelectedFG LONG                           !Selected forground color
Pat:BILLING_SelectedBG LONG                           !Selected background color
Pat:BILLING_Style      LONG                           !Field style
Pat:INVOICE            LIKE(Pat:INVOICE)              !List box control field - type derived from field
Pat:INVOICE_NormalFG   LONG                           !Normal forground color
Pat:INVOICE_NormalBG   LONG                           !Normal background color
Pat:INVOICE_SelectedFG LONG                           !Selected forground color
Pat:INVOICE_SelectedBG LONG                           !Selected background color
Pat:INVOICE_Style      LONG                           !Field style
Pat:LAST               LIKE(Pat:LAST)                 !List box control field - type derived from field
Pat:LAST_NormalFG      LONG                           !Normal forground color
Pat:LAST_NormalBG      LONG                           !Normal background color
Pat:LAST_SelectedFG    LONG                           !Selected forground color
Pat:LAST_SelectedBG    LONG                           !Selected background color
Pat:LAST_Style         LONG                           !Field style
Pat:FIRST              LIKE(Pat:FIRST)                !List box control field - type derived from field
Pat:FIRST_NormalFG     LONG                           !Normal forground color
Pat:FIRST_NormalBG     LONG                           !Normal background color
Pat:FIRST_SelectedFG   LONG                           !Selected forground color
Pat:FIRST_SelectedBG   LONG                           !Selected background color
Pat:FIRST_Style        LONG                           !Field style
locDOW                 LIKE(locDOW)                   !List box control field - type derived from local data
locDOW_NormalFG        LONG                           !Normal forground color
locDOW_NormalBG        LONG                           !Normal background color
locDOW_SelectedFG      LONG                           !Selected forground color
locDOW_SelectedBG      LONG                           !Selected background color
locDOW_Style           LONG                           !Field style
Pat:DATE               LIKE(Pat:DATE)                 !List box control field - type derived from field
Pat:DATE_NormalFG      LONG                           !Normal forground color
Pat:DATE_NormalBG      LONG                           !Normal background color
Pat:DATE_SelectedFG    LONG                           !Selected forground color
Pat:DATE_SelectedBG    LONG                           !Selected background color
Pat:DATE_Style         LONG                           !Field style
Pat:ENTERED_BY         LIKE(Pat:ENTERED_BY)           !List box control field - type derived from field
Pat:ENTERED_BY_NormalFG LONG                          !Normal forground color
Pat:ENTERED_BY_NormalBG LONG                          !Normal background color
Pat:ENTERED_BY_SelectedFG LONG                        !Selected forground color
Pat:ENTERED_BY_SelectedBG LONG                        !Selected background color
Pat:ENTERED_BY_Style   LONG                           !Field style
Pat:VERIFIED_BY        LIKE(Pat:VERIFIED_BY)          !List box control field - type derived from field
Pat:VERIFIED_BY_NormalFG LONG                         !Normal forground color
Pat:VERIFIED_BY_NormalBG LONG                         !Normal background color
Pat:VERIFIED_BY_SelectedFG LONG                       !Selected forground color
Pat:VERIFIED_BY_SelectedBG LONG                       !Selected background color
Pat:VERIFIED_BY_Style  LONG                           !Field style
Pat:AGE                LIKE(Pat:AGE)                  !List box control field - type derived from field
Pat:AGE_NormalFG       LONG                           !Normal forground color
Pat:AGE_NormalBG       LONG                           !Normal background color
Pat:AGE_SelectedFG     LONG                           !Selected forground color
Pat:AGE_SelectedBG     LONG                           !Selected background color
Pat:AGE_Style          LONG                           !Field style
Pat:AGE_TYPE           LIKE(Pat:AGE_TYPE)             !List box control field - type derived from field
Pat:AGE_TYPE_NormalFG  LONG                           !Normal forground color
Pat:AGE_TYPE_NormalBG  LONG                           !Normal background color
Pat:AGE_TYPE_SelectedFG LONG                          !Selected forground color
Pat:AGE_TYPE_SelectedBG LONG                          !Selected background color
Pat:AGE_TYPE_Style     LONG                           !Field style
Pat:CLIENT             LIKE(Pat:CLIENT)               !List box control field - type derived from field
Pat:CLIENT_NormalFG    LONG                           !Normal forground color
Pat:CLIENT_NormalBG    LONG                           !Normal background color
Pat:CLIENT_SelectedFG  LONG                           !Selected forground color
Pat:CLIENT_SelectedBG  LONG                           !Selected background color
Pat:CLIENT_Style       LONG                           !Field style
CLI:LAST               LIKE(CLI:LAST)                 !List box control field - type derived from field
CLI:LAST_NormalFG      LONG                           !Normal forground color
CLI:LAST_NormalBG      LONG                           !Normal background color
CLI:LAST_SelectedFG    LONG                           !Selected forground color
CLI:LAST_SelectedBG    LONG                           !Selected background color
CLI:LAST_Style         LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('All Patients'),AT(0,0,510,340),FONT('Arial',11,,FONT:regular),ICON('Allermetrix.ico'), |
  GRAY,MAX,MDI,HLP('BrowsePatient'),SYSTEM,TIMER(500),IMM
                       STRING('All Patients'),AT(44,4),USE(?String2),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                       STRING(@s20),AT(140,4),USE(locLocatorLabel),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@s20),AT(228,4,72,10),USE(locLocator),IMM
                       LIST,AT(1,32,410,268),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,ALRT(MouseLeft2),ALRT(TabKey), |
  FORMAT('6LM*Y@s1@Z(1)4LM*Y@s1@Z(1)5R|M*Y@s2@Z(1)38C|M*Y~Number~@p### ###p@Z(1)62L(2)|' & |
  'M*Y~Last~@s20@Z(1)45L(2)|M*Y~First~@s15@Z(1)20L(2)|M*Y~DOW~C(0)@s4@Z(1)40R(2)|M*Y~Da' & |
  'te~C(0)@D2@Z(1)17C|M*Y~Ent~L(0)@s2@Z(1)14C(2)|M*Y~Vfy~C(0)@s2@Z(1)17R(2)M*Y~Age~L(2)' & |
  '@n3@Z(1)5L|M*Y@s1@Z(1)38C|M*Y~Client#~@p### ###p@Z(1)100L(2)|M*Y~Client Name~@s25@Z(1)'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the Patient file'),TRN
                       PROMPT('First:'),AT(312,4),USE(?Pat:FIRST:Prompt),FONT(,,,FONT:bold),HIDE,TRN
                       ENTRY(@s15),AT(336,4,72,10),USE(Pat:FIRST),HIDE
                       BUTTON('&Insert'),AT(420,115,54,17),USE(?Insert:3),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  FLAT,HIDE,MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&Change'),AT(422,186,70,25),USE(?Change:3),FONT(,,,FONT:bold),LEFT,ICON('WAOk.ICO'), |
  MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(420,90,54,17),USE(?Delete:3),FONT(,,,FONT:bold),LEFT,ICON('WADELETE.ICO'), |
  FLAT,HIDE,MSG('Delete the Record'),TIP('Delete the Record')
                       SHEET,AT(0,20,412,281),USE(?CurrentTab),SPREAD
                         TAB('&1) Number'),USE(?Tab:1)
                         END
                         TAB('&2) Name'),USE(?Tab:2)
                         END
                         TAB('&3) Date'),USE(?Tab:3),HIDE
                         END
                         TAB('&4) ACCESS_KEY'),USE(?Tab:4),HIDE
                         END
                         TAB('&5) CLIENT_KEY'),USE(?Tab:5),HIDE
                         END
                         TAB('&6) SHIP_KEY'),USE(?Tab:7),HIDE
                         END
                       END
                       BUTTON('Clients'),AT(420,222,70,25),USE(?ButtonClients),FONT(,,,FONT:bold),HIDE,MSG('Close Window'), |
  TIP('Close Window'),TRN
                       BUTTON('Close'),AT(420,272,70,25),USE(?ButtonClose),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  STD(STD:Close),TRN
                       IMAGE('Button.jpg'),AT(420,272,70,25),USE(?Image1)
                       IMAGE('button.jpg'),AT(420,222,70,25),USE(?ClientsImage),HIDE
                       BUTTON('&Help'),AT(424,24,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('&Select'),AT(420,53,70,25),USE(?ButtonSelect),FONT(,,,FONT:bold),LEFT,ICON('WASelect.ico'), |
  TRN
                       IMAGE('button.jpg'),AT(422,186,70,25),USE(?IMAGE2)
                       CHECK('Covid'),AT(26,308),USE(locCovidHigh),COLOR(0080FFFFh),ICON(ICON:None),FLAT,VALUE('699999', |
  '499999')
                       BUTTON,AT(101,0,44),USE(?BUTTONlookup),FLAT,TRN
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
BRW1::Sort1:Locator  EntryLocatorClass                     ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
RestoreWindow          PROCEDURE(),DERIVED
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
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Patients')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locBillingDateExists',locBillingDateExists)        ! Added by: BrowseBox(ABC)
  BIND('locDOW',locDOW)                                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?ButtonClients,RequestCancelled)         ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?ButtonClients,RequestCompleted)         ! Add the close control to the window manger
  END
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Patient,SELF) ! Initialize the browse manager
  BRW1.SetUsePopup(False)
  locLocatorLabel = 'Patient Number:'
  
  Pat:INVOICE = 0
  GET(Patient,Pat:INVOICE_KEY)
  IF ~ERRORCODE() THEN DELETE(Patient).
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,Pat:ORDER_KEY)                        ! Add the sort order for Pat:ORDER_KEY for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(?locLocator,Pat:LAST,1,BRW1)    ! Initialize the browse locator using ?locLocator using key: Pat:ORDER_KEY , Pat:LAST
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:INVOICE for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pat:INVOICE_KEY) ! Add the sort order for Pat:INVOICE_KEY for sort order 2
  BRW1.AddRange(Pat:INVOICE,locCovidLow,locCovidHigh)      ! Add 'range of values' range limit for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(?locLocator,Pat:INVOICE,,BRW1)  ! Initialize the browse locator using ?locLocator using key: Pat:INVOICE_KEY , Pat:INVOICE
  BRW1.AddField(Pat:STATUS,BRW1.Q.Pat:STATUS)              ! Field Pat:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(locBillingDateExists,BRW1.Q.locBillingDateExists) ! Field locBillingDateExists is a hot field or requires assignment from browse
  BRW1.AddField(Pat:BILLING,BRW1.Q.Pat:BILLING)            ! Field Pat:BILLING is a hot field or requires assignment from browse
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)            ! Field Pat:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:LAST,BRW1.Q.Pat:LAST)                  ! Field Pat:LAST is a hot field or requires assignment from browse
  BRW1.AddField(Pat:FIRST,BRW1.Q.Pat:FIRST)                ! Field Pat:FIRST is a hot field or requires assignment from browse
  BRW1.AddField(locDOW,BRW1.Q.locDOW)                      ! Field locDOW is a hot field or requires assignment from browse
  BRW1.AddField(Pat:DATE,BRW1.Q.Pat:DATE)                  ! Field Pat:DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:ENTERED_BY,BRW1.Q.Pat:ENTERED_BY)      ! Field Pat:ENTERED_BY is a hot field or requires assignment from browse
  BRW1.AddField(Pat:VERIFIED_BY,BRW1.Q.Pat:VERIFIED_BY)    ! Field Pat:VERIFIED_BY is a hot field or requires assignment from browse
  BRW1.AddField(Pat:AGE,BRW1.Q.Pat:AGE)                    ! Field Pat:AGE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:AGE_TYPE,BRW1.Q.Pat:AGE_TYPE)          ! Field Pat:AGE_TYPE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:CLIENT,BRW1.Q.Pat:CLIENT)              ! Field Pat:CLIENT is a hot field or requires assignment from browse
  BRW1.AddField(CLI:LAST,BRW1.Q.CLI:LAST)                  ! Field CLI:LAST is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  ALIAS(EnterKey,TabKey)
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
    UpdatePatient(0)
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
    OF ?Change:3
      !CHANGE:3
      gloPatientNumber = Pat:INVOICE
      ?BUTTONlookup{PROP:Text} = gloPatientNumber
    OF ?BUTTONlookup
      CLEAR(Pat:Record)
      Pat:INVOICE = gloPatientNumber
      SET(Pat:INVOICE_KEY,Pat:INVOICE_KEY)
      NEXT(Patient)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?locLocator
      ThisWindow.Update
      ! IF ?CurrentTab = ?Tab:1
        CLEAR(PAT:RECORD)
        Pat:INVOICE = ?locLocator{PROP:USE}
        GET(Patient,Pat:INVOICE_KEY)
        IF ~ERRORCODE()
          gloPatientNumber = Pat:INVOICE
          GlobalRequest = ChangeRecord
          UpdatePatient(0)
          ALIAS(EnterKey,TabKey)
      !    IF globalResponse = RequestCompleted
      !      BRW1.ResetFromFile
      !      BRW1.ResetFromView
        
      !    .
        .
          
      
        
      
        ?BUTTONlookup{PROP:Text} = gloPatientNumber
           
    OF ?Change:3
      ThisWindow.Update
      !CHANGE:3
    OF ?locCovidHigh
            BRW1.ResetQueue(1)
            POST(EVENT:NewSelection,?Browse:1)
            POST(EVENT:ScrollBottom,?Browse:1)
    OF ?BUTTONlookup
      ThisWindow.Update
      
      DISPLAY()
      CLEAR(Pat:Record)
      Pat:INVOICE = gloPatientNumber
      SET(Pat:INVOICE_KEY,Pat:INVOICE_KEY)
      NEXT(Patient)
      ! stop(gloPatientNumber & ' / ' & locLocator
      GlobalRequest = 2
      UpdatePatient(0)
      ?BUTTONlookup{PROP:Text} = gloPatientNumber
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
  OMIT('XXX')
  EnhancedFocusManager.TakeEvent()
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  XXX
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
                GET(Patient,Pat:INVOICE_KEY)
                gloPatientNumber = Pat:INVOICE
                UpdatePatient(0)
                SETKEYCODE(0)
                SELECT(?+1)
                IF globalResponse = RequestCompleted
                  BRW1.ResetFromFile
                  BRW1.ResetFromView
                  SETKEYCODE(0)    
                  SELECT(?+1)
             .   .
             POST(Event:ScrollBottom,?Browse:1)
             ?BUTTONlookup{PROP:Text} = gloPatientNumber
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?Browse:1
    CASE EVENT()
    OF EVENT:ScrollBottom
      !Scroll Bottom
      
      
      ?BUTTONlookup{PROP:Text} = gloPatientNumber
      !    stop('1: ' & gloPatientNumber & ' / ' & locLocator )
    END
  OF ?CurrentTab
    CASE EVENT()
    OF EVENT:TabChanging
      IF CHOICE() = 1
        locLocatorLabel = 'Patient Name:'
      ELSE
        locLocatorLabel = 'Patient Number:'
        locPatient = gloPatientNumber
      .
      DISPLAY(?locLocatorLabel)
      !  POST(Event:ScrollTop,?Browse:1)
      POST(Event:ScrollBottom,?Browse:1)
      ?BUTTONlookup{PROP:Text} = gloPatientNumber
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
    OF EVENT:LoseFocus
      ALIAS
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:Completed
         
    OF EVENT:GainFocus
      ALIAS(EnterKey,TabKey)
    OF EVENT:OpenWindow
            !ACCESS:Clients         EQUATE(1)
            !ACCESS:Patients        EQUATE(2)
            !ACCESS:Verify         EQUATE(4)
            !ACCESS:Workpool       EQUATE(8)
            !ACCESS:PrintResults   EQUATE(16)
            !ACCESS:ViewResults    EQUATE(32)
            !ACCESS:ReadInResults  EQUATE(64)
            !ACCESS:Database       EQUATE(128)
            !ACCESS:Admin          EQUATE(256)
            
      
      
      
      POST(Event:ScrollBottom,?Browse:1)
      POST(Event:Timer)
      ?BUTTONlookup{PROP:Text} = gloPatientNumber
    OF EVENT:Timer
      IF ~BAND(gloPermissions,ACCESS:Patients+ACCESS:EditPatients) THEN POST(EVENT:CloseWindow).
      IF ~BAND(gloPermissions,ACCESS:Clients+ACCESS:EditClients)  THEN HIDE(?ButtonClients); HIDE(?ClientsImage).
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?ButtonSelect
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (LEN(CLIP(BILL:AddressPatient )) = 0 AND PAT:BILLING <> 'C' AND PAT:DATE > TODAY() -30)
    SELF.Q.Pat:STATUS_NormalFG = 8454143                   ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 16711680
    SELF.Q.Pat:STATUS_SelectedFG = 16711680
    SELF.Q.Pat:STATUS_SelectedBG = 8454143
    SELF.Q.locBillingDateExists_NormalFG = 8454143         ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 16711680
    SELF.Q.locBillingDateExists_SelectedFG = 16711680
    SELF.Q.locBillingDateExists_SelectedBG = 8454143
    SELF.Q.Pat:BILLING_NormalFG = 8454143                  ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 16711680
    SELF.Q.Pat:BILLING_SelectedFG = 16711680
    SELF.Q.Pat:BILLING_SelectedBG = 8454143
    SELF.Q.Pat:INVOICE_NormalFG = 8454143                  ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 16711680
    SELF.Q.Pat:INVOICE_SelectedFG = 16711680
    SELF.Q.Pat:INVOICE_SelectedBG = 8454143
    SELF.Q.Pat:LAST_NormalFG = 8454143                     ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 16711680
    SELF.Q.Pat:LAST_SelectedFG = 16711680
    SELF.Q.Pat:LAST_SelectedBG = 8454143
    SELF.Q.Pat:FIRST_NormalFG = 8454143                    ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 16711680
    SELF.Q.Pat:FIRST_SelectedFG = 16711680
    SELF.Q.Pat:FIRST_SelectedBG = 8454143
    SELF.Q.locDOW_NormalFG = 8454143                       ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 16711680
    SELF.Q.locDOW_SelectedFG = 16711680
    SELF.Q.locDOW_SelectedBG = 8454143
    SELF.Q.Pat:DATE_NormalFG = 8454143                     ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 16711680
    SELF.Q.Pat:DATE_SelectedFG = 16711680
    SELF.Q.Pat:DATE_SelectedBG = 8454143
    SELF.Q.Pat:ENTERED_BY_NormalFG = 8454143               ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 16711680
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16711680
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 8454143
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 8454143              ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 16711680
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16711680
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 8454143
    SELF.Q.Pat:AGE_NormalFG = 8454143                      ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 16711680
    SELF.Q.Pat:AGE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_SelectedBG = 8454143
    SELF.Q.Pat:AGE_TYPE_NormalFG = 8454143                 ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 16711680
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 8454143
    SELF.Q.Pat:CLIENT_NormalFG = 8454143                   ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 16711680
    SELF.Q.Pat:CLIENT_SelectedFG = 16711680
    SELF.Q.Pat:CLIENT_SelectedBG = 8454143
    SELF.Q.CLI:LAST_NormalFG = 8454143                     ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 16711680
    SELF.Q.CLI:LAST_SelectedFG = 16711680
    SELF.Q.CLI:LAST_SelectedBG = 8454143
  ELSIF (PAT:Status = 'W' )
    SELF.Q.Pat:STATUS_NormalFG = 0                         ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 65280
    SELF.Q.Pat:STATUS_SelectedFG = 65280
    SELF.Q.Pat:STATUS_SelectedBG = 0
    SELF.Q.locBillingDateExists_NormalFG = 0               ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 65280
    SELF.Q.locBillingDateExists_SelectedFG = 65280
    SELF.Q.locBillingDateExists_SelectedBG = 0
    SELF.Q.Pat:BILLING_NormalFG = 0                        ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 65280
    SELF.Q.Pat:BILLING_SelectedFG = 65280
    SELF.Q.Pat:BILLING_SelectedBG = 0
    SELF.Q.Pat:INVOICE_NormalFG = 0                        ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 65280
    SELF.Q.Pat:INVOICE_SelectedFG = 65280
    SELF.Q.Pat:INVOICE_SelectedBG = 0
    SELF.Q.Pat:LAST_NormalFG = 0                           ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 65280
    SELF.Q.Pat:LAST_SelectedFG = 65280
    SELF.Q.Pat:LAST_SelectedBG = 0
    SELF.Q.Pat:FIRST_NormalFG = 0                          ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 65280
    SELF.Q.Pat:FIRST_SelectedFG = 65280
    SELF.Q.Pat:FIRST_SelectedBG = 0
    SELF.Q.locDOW_NormalFG = 0                             ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 65280
    SELF.Q.locDOW_SelectedFG = 65280
    SELF.Q.locDOW_SelectedBG = 0
    SELF.Q.Pat:DATE_NormalFG = 0                           ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 65280
    SELF.Q.Pat:DATE_SelectedFG = 65280
    SELF.Q.Pat:DATE_SelectedBG = 0
    SELF.Q.Pat:ENTERED_BY_NormalFG = 0                     ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 65280
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 65280
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 0
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 0                    ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 65280
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 65280
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 0
    SELF.Q.Pat:AGE_NormalFG = 0                            ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 65280
    SELF.Q.Pat:AGE_SelectedFG = 65280
    SELF.Q.Pat:AGE_SelectedBG = 0
    SELF.Q.Pat:AGE_TYPE_NormalFG = 0                       ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 65280
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 65280
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 0
    SELF.Q.Pat:CLIENT_NormalFG = 0                         ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 65280
    SELF.Q.Pat:CLIENT_SelectedFG = 65280
    SELF.Q.Pat:CLIENT_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 65280
    SELF.Q.CLI:LAST_SelectedFG = 65280
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSIF (PAT:Status ='L' )
    SELF.Q.Pat:STATUS_NormalFG = 0                         ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 65535
    SELF.Q.Pat:STATUS_SelectedFG = 65535
    SELF.Q.Pat:STATUS_SelectedBG = 0
    SELF.Q.locBillingDateExists_NormalFG = 0               ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 65535
    SELF.Q.locBillingDateExists_SelectedFG = 65535
    SELF.Q.locBillingDateExists_SelectedBG = 0
    SELF.Q.Pat:BILLING_NormalFG = 0                        ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 65535
    SELF.Q.Pat:BILLING_SelectedFG = 65535
    SELF.Q.Pat:BILLING_SelectedBG = 0
    SELF.Q.Pat:INVOICE_NormalFG = 0                        ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 65535
    SELF.Q.Pat:INVOICE_SelectedFG = 65535
    SELF.Q.Pat:INVOICE_SelectedBG = 0
    SELF.Q.Pat:LAST_NormalFG = 0                           ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 65535
    SELF.Q.Pat:LAST_SelectedFG = 65535
    SELF.Q.Pat:LAST_SelectedBG = 0
    SELF.Q.Pat:FIRST_NormalFG = 0                          ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 65535
    SELF.Q.Pat:FIRST_SelectedFG = 65535
    SELF.Q.Pat:FIRST_SelectedBG = 0
    SELF.Q.locDOW_NormalFG = 0                             ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 65535
    SELF.Q.locDOW_SelectedFG = 65535
    SELF.Q.locDOW_SelectedBG = 0
    SELF.Q.Pat:DATE_NormalFG = 0                           ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 65535
    SELF.Q.Pat:DATE_SelectedFG = 65535
    SELF.Q.Pat:DATE_SelectedBG = 0
    SELF.Q.Pat:ENTERED_BY_NormalFG = 0                     ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 65535
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 65535
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 0
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 0                    ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 65535
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 65535
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 0
    SELF.Q.Pat:AGE_NormalFG = 0                            ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 65535
    SELF.Q.Pat:AGE_SelectedFG = 65535
    SELF.Q.Pat:AGE_SelectedBG = 0
    SELF.Q.Pat:AGE_TYPE_NormalFG = 0                       ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 65535
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 65535
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 0
    SELF.Q.Pat:CLIENT_NormalFG = 0                         ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 65535
    SELF.Q.Pat:CLIENT_SelectedFG = 65535
    SELF.Q.Pat:CLIENT_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 65535
    SELF.Q.CLI:LAST_SelectedFG = 65535
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSIF (PAT:Status = 'V')
    SELF.Q.Pat:STATUS_NormalFG = 16777215                  ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 16711680
    SELF.Q.Pat:STATUS_SelectedFG = 16711680
    SELF.Q.Pat:STATUS_SelectedBG = 16777215
    SELF.Q.locBillingDateExists_NormalFG = 16777215        ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 16711680
    SELF.Q.locBillingDateExists_SelectedFG = 16711680
    SELF.Q.locBillingDateExists_SelectedBG = 16777215
    SELF.Q.Pat:BILLING_NormalFG = 16777215                 ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 16711680
    SELF.Q.Pat:BILLING_SelectedFG = 16711680
    SELF.Q.Pat:BILLING_SelectedBG = 16777215
    SELF.Q.Pat:INVOICE_NormalFG = 16777215                 ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 16711680
    SELF.Q.Pat:INVOICE_SelectedFG = 16711680
    SELF.Q.Pat:INVOICE_SelectedBG = 16777215
    SELF.Q.Pat:LAST_NormalFG = 16777215                    ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 16711680
    SELF.Q.Pat:LAST_SelectedFG = 16711680
    SELF.Q.Pat:LAST_SelectedBG = 16777215
    SELF.Q.Pat:FIRST_NormalFG = 16777215                   ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 16711680
    SELF.Q.Pat:FIRST_SelectedFG = 16711680
    SELF.Q.Pat:FIRST_SelectedBG = 16777215
    SELF.Q.locDOW_NormalFG = 16777215                      ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 16711680
    SELF.Q.locDOW_SelectedFG = 16711680
    SELF.Q.locDOW_SelectedBG = 16777215
    SELF.Q.Pat:DATE_NormalFG = 16777215                    ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 16711680
    SELF.Q.Pat:DATE_SelectedFG = 16711680
    SELF.Q.Pat:DATE_SelectedBG = 16777215
    SELF.Q.Pat:ENTERED_BY_NormalFG = 16777215              ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 16711680
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16711680
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 16777215
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 16777215             ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 16711680
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16711680
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 16777215
    SELF.Q.Pat:AGE_NormalFG = 16777215                     ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 16711680
    SELF.Q.Pat:AGE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_SelectedBG = 16777215
    SELF.Q.Pat:AGE_TYPE_NormalFG = 16777215                ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 16711680
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 16777215
    SELF.Q.Pat:CLIENT_NormalFG = 16777215                  ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 16711680
    SELF.Q.Pat:CLIENT_SelectedFG = 16711680
    SELF.Q.Pat:CLIENT_SelectedBG = 16777215
    SELF.Q.CLI:LAST_NormalFG = 16777215                    ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 16711680
    SELF.Q.CLI:LAST_SelectedFG = 16711680
    SELF.Q.CLI:LAST_SelectedBG = 16777215
  ELSIF (PAT:Status = 'Q')
    SELF.Q.Pat:STATUS_NormalFG = 0                         ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 16776960
    SELF.Q.Pat:STATUS_SelectedFG = 16776960
    SELF.Q.Pat:STATUS_SelectedBG = 0
    SELF.Q.locBillingDateExists_NormalFG = 0               ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 16776960
    SELF.Q.locBillingDateExists_SelectedFG = 16776960
    SELF.Q.locBillingDateExists_SelectedBG = 0
    SELF.Q.Pat:BILLING_NormalFG = 0                        ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 16776960
    SELF.Q.Pat:BILLING_SelectedFG = 16776960
    SELF.Q.Pat:BILLING_SelectedBG = 0
    SELF.Q.Pat:INVOICE_NormalFG = 0                        ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 16776960
    SELF.Q.Pat:INVOICE_SelectedFG = 16776960
    SELF.Q.Pat:INVOICE_SelectedBG = 0
    SELF.Q.Pat:LAST_NormalFG = 0                           ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 16776960
    SELF.Q.Pat:LAST_SelectedFG = 16776960
    SELF.Q.Pat:LAST_SelectedBG = 0
    SELF.Q.Pat:FIRST_NormalFG = 0                          ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 16776960
    SELF.Q.Pat:FIRST_SelectedFG = 16776960
    SELF.Q.Pat:FIRST_SelectedBG = 0
    SELF.Q.locDOW_NormalFG = 0                             ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 16776960
    SELF.Q.locDOW_SelectedFG = 16776960
    SELF.Q.locDOW_SelectedBG = 0
    SELF.Q.Pat:DATE_NormalFG = 0                           ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 16776960
    SELF.Q.Pat:DATE_SelectedFG = 16776960
    SELF.Q.Pat:DATE_SelectedBG = 0
    SELF.Q.Pat:ENTERED_BY_NormalFG = 0                     ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 16776960
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16776960
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 0
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 0                    ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 16776960
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16776960
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 0
    SELF.Q.Pat:AGE_NormalFG = 0                            ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 16776960
    SELF.Q.Pat:AGE_SelectedFG = 16776960
    SELF.Q.Pat:AGE_SelectedBG = 0
    SELF.Q.Pat:AGE_TYPE_NormalFG = 0                       ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 16776960
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16776960
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 0
    SELF.Q.Pat:CLIENT_NormalFG = 0                         ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 16776960
    SELF.Q.Pat:CLIENT_SelectedFG = 16776960
    SELF.Q.Pat:CLIENT_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 16776960
    SELF.Q.CLI:LAST_SelectedFG = 16776960
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSIF (PAT:Status = 'H')
    SELF.Q.Pat:STATUS_NormalFG = 16777215                  ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 255
    SELF.Q.Pat:STATUS_SelectedFG = 255
    SELF.Q.Pat:STATUS_SelectedBG = 16777215
    SELF.Q.locBillingDateExists_NormalFG = 16777215        ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 255
    SELF.Q.locBillingDateExists_SelectedFG = 255
    SELF.Q.locBillingDateExists_SelectedBG = 16777215
    SELF.Q.Pat:BILLING_NormalFG = 16777215                 ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 255
    SELF.Q.Pat:BILLING_SelectedFG = 255
    SELF.Q.Pat:BILLING_SelectedBG = 16777215
    SELF.Q.Pat:INVOICE_NormalFG = 16777215                 ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 255
    SELF.Q.Pat:INVOICE_SelectedFG = 255
    SELF.Q.Pat:INVOICE_SelectedBG = 16777215
    SELF.Q.Pat:LAST_NormalFG = 16777215                    ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 255
    SELF.Q.Pat:LAST_SelectedFG = 255
    SELF.Q.Pat:LAST_SelectedBG = 16777215
    SELF.Q.Pat:FIRST_NormalFG = 16777215                   ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 255
    SELF.Q.Pat:FIRST_SelectedFG = 255
    SELF.Q.Pat:FIRST_SelectedBG = 16777215
    SELF.Q.locDOW_NormalFG = 16777215                      ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 255
    SELF.Q.locDOW_SelectedFG = 255
    SELF.Q.locDOW_SelectedBG = 16777215
    SELF.Q.Pat:DATE_NormalFG = 16777215                    ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 255
    SELF.Q.Pat:DATE_SelectedFG = 255
    SELF.Q.Pat:DATE_SelectedBG = 16777215
    SELF.Q.Pat:ENTERED_BY_NormalFG = 16777215              ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 255
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 255
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 16777215
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 16777215             ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 255
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 255
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 16777215
    SELF.Q.Pat:AGE_NormalFG = 16777215                     ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 255
    SELF.Q.Pat:AGE_SelectedFG = 255
    SELF.Q.Pat:AGE_SelectedBG = 16777215
    SELF.Q.Pat:AGE_TYPE_NormalFG = 16777215                ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 255
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 255
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 16777215
    SELF.Q.Pat:CLIENT_NormalFG = 16777215                  ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 255
    SELF.Q.Pat:CLIENT_SelectedFG = 255
    SELF.Q.Pat:CLIENT_SelectedBG = 16777215
    SELF.Q.CLI:LAST_NormalFG = 16777215                    ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 255
    SELF.Q.CLI:LAST_SelectedFG = 255
    SELF.Q.CLI:LAST_SelectedBG = 16777215
  ELSIF (PAT:Status = 'I')
    SELF.Q.Pat:STATUS_NormalFG = 16777215                  ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 170
    SELF.Q.Pat:STATUS_SelectedFG = 170
    SELF.Q.Pat:STATUS_SelectedBG = 16777215
    SELF.Q.locBillingDateExists_NormalFG = 16777215        ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 170
    SELF.Q.locBillingDateExists_SelectedFG = 170
    SELF.Q.locBillingDateExists_SelectedBG = 16777215
    SELF.Q.Pat:BILLING_NormalFG = 16777215                 ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 170
    SELF.Q.Pat:BILLING_SelectedFG = 170
    SELF.Q.Pat:BILLING_SelectedBG = 16777215
    SELF.Q.Pat:INVOICE_NormalFG = 16777215                 ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 170
    SELF.Q.Pat:INVOICE_SelectedFG = 170
    SELF.Q.Pat:INVOICE_SelectedBG = 16777215
    SELF.Q.Pat:LAST_NormalFG = 16777215                    ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 170
    SELF.Q.Pat:LAST_SelectedFG = 170
    SELF.Q.Pat:LAST_SelectedBG = 16777215
    SELF.Q.Pat:FIRST_NormalFG = 16777215                   ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 170
    SELF.Q.Pat:FIRST_SelectedFG = 170
    SELF.Q.Pat:FIRST_SelectedBG = 16777215
    SELF.Q.locDOW_NormalFG = 16777215                      ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 170
    SELF.Q.locDOW_SelectedFG = 170
    SELF.Q.locDOW_SelectedBG = 16777215
    SELF.Q.Pat:DATE_NormalFG = 16777215                    ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 170
    SELF.Q.Pat:DATE_SelectedFG = 170
    SELF.Q.Pat:DATE_SelectedBG = 16777215
    SELF.Q.Pat:ENTERED_BY_NormalFG = 16777215              ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 170
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 170
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 16777215
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 16777215             ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 170
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 170
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 16777215
    SELF.Q.Pat:AGE_NormalFG = 16777215                     ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 170
    SELF.Q.Pat:AGE_SelectedFG = 170
    SELF.Q.Pat:AGE_SelectedBG = 16777215
    SELF.Q.Pat:AGE_TYPE_NormalFG = 16777215                ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 170
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 170
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 16777215
    SELF.Q.Pat:CLIENT_NormalFG = 16777215                  ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 170
    SELF.Q.Pat:CLIENT_SelectedFG = 170
    SELF.Q.Pat:CLIENT_SelectedBG = 16777215
    SELF.Q.CLI:LAST_NormalFG = 16777215                    ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 170
    SELF.Q.CLI:LAST_SelectedFG = 170
    SELF.Q.CLI:LAST_SelectedBG = 16777215
  ELSIF (PAT:Status='C')
    SELF.Q.Pat:STATUS_NormalFG = 0                         ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = -1
    SELF.Q.Pat:STATUS_SelectedFG = 16777215
    SELF.Q.Pat:STATUS_SelectedBG = 0
    SELF.Q.locBillingDateExists_NormalFG = 0               ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = -1
    SELF.Q.locBillingDateExists_SelectedFG = 16777215
    SELF.Q.locBillingDateExists_SelectedBG = 0
    SELF.Q.Pat:BILLING_NormalFG = 0                        ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = -1
    SELF.Q.Pat:BILLING_SelectedFG = 16777215
    SELF.Q.Pat:BILLING_SelectedBG = 0
    SELF.Q.Pat:INVOICE_NormalFG = 0                        ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = -1
    SELF.Q.Pat:INVOICE_SelectedFG = 16777215
    SELF.Q.Pat:INVOICE_SelectedBG = 0
    SELF.Q.Pat:LAST_NormalFG = 0                           ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = -1
    SELF.Q.Pat:LAST_SelectedFG = 16777215
    SELF.Q.Pat:LAST_SelectedBG = 0
    SELF.Q.Pat:FIRST_NormalFG = 0                          ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = -1
    SELF.Q.Pat:FIRST_SelectedFG = 16777215
    SELF.Q.Pat:FIRST_SelectedBG = 0
    SELF.Q.locDOW_NormalFG = 0                             ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = -1
    SELF.Q.locDOW_SelectedFG = 16777215
    SELF.Q.locDOW_SelectedBG = 0
    SELF.Q.Pat:DATE_NormalFG = 0                           ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = -1
    SELF.Q.Pat:DATE_SelectedFG = 16777215
    SELF.Q.Pat:DATE_SelectedBG = 0
    SELF.Q.Pat:ENTERED_BY_NormalFG = 0                     ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16777215
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 0
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 0                    ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16777215
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 0
    SELF.Q.Pat:AGE_NormalFG = 0                            ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = -1
    SELF.Q.Pat:AGE_SelectedFG = 16777215
    SELF.Q.Pat:AGE_SelectedBG = 0
    SELF.Q.Pat:AGE_TYPE_NormalFG = 0                       ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16777215
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 0
    SELF.Q.Pat:CLIENT_NormalFG = 0                         ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = -1
    SELF.Q.Pat:CLIENT_SelectedFG = 16777215
    SELF.Q.Pat:CLIENT_SelectedBG = 0
    SELF.Q.CLI:LAST_NormalFG = 0                           ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = -1
    SELF.Q.CLI:LAST_SelectedFG = 16777215
    SELF.Q.CLI:LAST_SelectedBG = 0
  ELSIF (PAT:Status='X')
    SELF.Q.Pat:STATUS_NormalFG = 255                       ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 16777215
    SELF.Q.Pat:STATUS_SelectedFG = 16777215
    SELF.Q.Pat:STATUS_SelectedBG = 255
    SELF.Q.locBillingDateExists_NormalFG = 255             ! Set conditional color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = 16777215
    SELF.Q.locBillingDateExists_SelectedFG = 16777215
    SELF.Q.locBillingDateExists_SelectedBG = 255
    SELF.Q.Pat:BILLING_NormalFG = 255                      ! Set conditional color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = 16777215
    SELF.Q.Pat:BILLING_SelectedFG = 16777215
    SELF.Q.Pat:BILLING_SelectedBG = 255
    SELF.Q.Pat:INVOICE_NormalFG = 255                      ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 16777215
    SELF.Q.Pat:INVOICE_SelectedFG = 16777215
    SELF.Q.Pat:INVOICE_SelectedBG = 255
    SELF.Q.Pat:LAST_NormalFG = 255                         ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 16777215
    SELF.Q.Pat:LAST_SelectedFG = 16777215
    SELF.Q.Pat:LAST_SelectedBG = 255
    SELF.Q.Pat:FIRST_NormalFG = 255                        ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 16777215
    SELF.Q.Pat:FIRST_SelectedFG = 16777215
    SELF.Q.Pat:FIRST_SelectedBG = 255
    SELF.Q.locDOW_NormalFG = 255                           ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 16777215
    SELF.Q.locDOW_SelectedFG = 16777215
    SELF.Q.locDOW_SelectedBG = 255
    SELF.Q.Pat:DATE_NormalFG = 255                         ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 16777215
    SELF.Q.Pat:DATE_SelectedFG = 16777215
    SELF.Q.Pat:DATE_SelectedBG = 255
    SELF.Q.Pat:ENTERED_BY_NormalFG = 255                   ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 16777215
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16777215
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 255
    SELF.Q.Pat:VERIFIED_BY_NormalFG = 255                  ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 16777215
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16777215
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 255
    SELF.Q.Pat:AGE_NormalFG = 255                          ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 16777215
    SELF.Q.Pat:AGE_SelectedFG = 16777215
    SELF.Q.Pat:AGE_SelectedBG = 255
    SELF.Q.Pat:AGE_TYPE_NormalFG = 255                     ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 16777215
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16777215
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 255
    SELF.Q.Pat:CLIENT_NormalFG = 255                       ! Set conditional color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = 16777215
    SELF.Q.Pat:CLIENT_SelectedFG = 16777215
    SELF.Q.Pat:CLIENT_SelectedBG = 255
    SELF.Q.CLI:LAST_NormalFG = 255                         ! Set conditional color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = 16777215
    SELF.Q.CLI:LAST_SelectedFG = 16777215
    SELF.Q.CLI:LAST_SelectedBG = 255
  ELSE
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = -1
    SELF.Q.Pat:STATUS_SelectedFG = 16711680
    SELF.Q.Pat:STATUS_SelectedBG = 16777215
    SELF.Q.locBillingDateExists_NormalFG = -1              ! Set color values for locBillingDateExists
    SELF.Q.locBillingDateExists_NormalBG = -1
    SELF.Q.locBillingDateExists_SelectedFG = 16711680
    SELF.Q.locBillingDateExists_SelectedBG = 16777215
    SELF.Q.Pat:BILLING_NormalFG = -1                       ! Set color values for Pat:BILLING
    SELF.Q.Pat:BILLING_NormalBG = -1
    SELF.Q.Pat:BILLING_SelectedFG = 16711680
    SELF.Q.Pat:BILLING_SelectedBG = 16777215
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = -1
    SELF.Q.Pat:INVOICE_SelectedFG = 16711680
    SELF.Q.Pat:INVOICE_SelectedBG = 16777215
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = -1
    SELF.Q.Pat:LAST_SelectedFG = 16711680
    SELF.Q.Pat:LAST_SelectedBG = 16777215
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = -1
    SELF.Q.Pat:FIRST_SelectedFG = 16711680
    SELF.Q.Pat:FIRST_SelectedBG = 16777215
    SELF.Q.locDOW_NormalFG = -1                            ! Set color values for locDOW
    SELF.Q.locDOW_NormalBG = -1
    SELF.Q.locDOW_SelectedFG = 16711680
    SELF.Q.locDOW_SelectedBG = 16777215
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = -1
    SELF.Q.Pat:DATE_SelectedFG = 16711680
    SELF.Q.Pat:DATE_SelectedBG = 16777215
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedFG = 16711680
    SELF.Q.Pat:ENTERED_BY_SelectedBG = 16777215
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = 16711680
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = 16777215
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = -1
    SELF.Q.Pat:AGE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_SelectedBG = 16777215
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedFG = 16711680
    SELF.Q.Pat:AGE_TYPE_SelectedBG = 16777215
    SELF.Q.Pat:CLIENT_NormalFG = -1                        ! Set color values for Pat:CLIENT
    SELF.Q.Pat:CLIENT_NormalBG = -1
    SELF.Q.Pat:CLIENT_SelectedFG = 16711680
    SELF.Q.Pat:CLIENT_SelectedBG = 16777215
    SELF.Q.CLI:LAST_NormalFG = -1                          ! Set color values for CLI:LAST
    SELF.Q.CLI:LAST_NormalBG = -1
    SELF.Q.CLI:LAST_SelectedFG = 16711680
    SELF.Q.CLI:LAST_SelectedBG = 16777215
  END
  SELF.Q.Pat:STATUS_Style = 1 ! 
  SELF.Q.locBillingDateExists_Style = 1 ! 
  SELF.Q.Pat:BILLING_Style = 1 ! 
  SELF.Q.Pat:INVOICE_Style = 1 ! 
  SELF.Q.Pat:LAST_Style = 1 ! 
  SELF.Q.Pat:FIRST_Style = 1 ! 
  SELF.Q.locDOW_Style = 1 ! 
  SELF.Q.Pat:DATE_Style = 1 ! 
  SELF.Q.Pat:ENTERED_BY_Style = 1 ! 
  SELF.Q.Pat:VERIFIED_BY_Style = 1 ! 
  SELF.Q.Pat:AGE_Style = 1 ! 
  SELF.Q.Pat:AGE_TYPE_Style = 1 ! 
  SELF.Q.Pat:CLIENT_Style = 1 ! 
  SELF.Q.CLI:LAST_Style = 1 ! 


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  CASE PAT:Date%7
  OF 0
    locDOW = 'Sun'
  OF 1
    locDOW = 'Mon'
  OF 2
    locDOW = 'Tue'
  OF 3
    locDOW = 'Wed'
  OF 4
    locDOW = 'Thur'
  OF 5
    locDOW = 'Fri'
  OF 6
    locDOW = 'Sat'
  .
  CLI:NUMBER = PAT:Client
  GET(Client,CLI:ORDER_KEY)
  IF ERRORCODE()
    CLI:Last = ERROR()
  ELSE
    CLI:Last = CLIP(CLI:Last) & ', ' & CLI:First
  .
  IF ~BILL:AddressPatient AND Pat:BILLING <> 'C' 
    BILL:Status = '-' & Pat:BILLING
  ELSE
    BILL:Status = ''
  .
  locBillingDateExists = ''
  IF Pat:BILLED > 11111 THEN locBillingDateExists = '*'.
  Pat:ENTERED_BY  = UPPER(Pat:ENTERED_BY )
  Pat:VERIFIED_BY = UPPER(Pat:VERIFIED_BY)
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


Resizer.RestoreWindow PROCEDURE


  CODE
  PARENT.RestoreWindow
  ?BUTTONlookup{PROP:Text} = gloPatientNumber
    

