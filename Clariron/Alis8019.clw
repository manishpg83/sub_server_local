

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8019.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8052.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Patient file by Pat:CLIENT_KEY
!!! </summary>
ClientPatients PROCEDURE 

CurrentTab           STRING(80)                            !
locPosition          ULONG                                 !
locLength            BYTE                                  !
SAV:Name             STRING(20)                            !
FIX:PatientNumber    LONG                                  !used to get correct patient when first patient is selected dbl clicked
Names                QUEUE,PRE(NAM)                        !
Invoice              LONG                                  !
Last                 STRING(20)                            !
First                STRING(15)                            !
                     END                                   !
locDOW               STRING(4)                             !
BRW1::View:Browse    VIEW(Patient)
                       PROJECT(Pat:STATUS)
                       PROJECT(Pat:INVOICE)
                       PROJECT(Pat:LAST)
                       PROJECT(Pat:FIRST)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:ENTERED_BY)
                       PROJECT(Pat:VERIFIED_BY)
                       PROJECT(Pat:DOB)
                       PROJECT(Pat:AGE)
                       PROJECT(Pat:AGE_TYPE)
                       PROJECT(Pat:CLIENT)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pat:STATUS             LIKE(Pat:STATUS)               !List box control field - type derived from field
Pat:STATUS_NormalFG    LONG                           !Normal forground color
Pat:STATUS_NormalBG    LONG                           !Normal background color
Pat:STATUS_SelectedFG  LONG                           !Selected forground color
Pat:STATUS_SelectedBG  LONG                           !Selected background color
Pat:STATUS_Style       LONG                           !Field style
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
Pat:DOB                LIKE(Pat:DOB)                  !List box control field - type derived from field
Pat:DOB_NormalFG       LONG                           !Normal forground color
Pat:DOB_NormalBG       LONG                           !Normal background color
Pat:DOB_SelectedFG     LONG                           !Selected forground color
Pat:DOB_SelectedBG     LONG                           !Selected background color
Pat:DOB_Style          LONG                           !Field style
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
Pat:CLIENT             LIKE(Pat:CLIENT)               !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,506,330),FONT('Arial',11,,FONT:regular),GRAY,MDI,HLP('BrowsePatientByPat:' & |
  'CLIENT_KEY')
                       ENTRY(@s20),AT(120,30,75,10),USE(SAV:Name),UPR
                       LIST,AT(24,42,371,278),USE(?Browse:1),FONT(,,COLOR:Black,FONT:regular),VSCROLL,COLOR(,COLOR:Blue, |
  COLOR:White),FORMAT('22C(2)|M*Y~Status~C(0)@s1@31R(1)|M*Y~Number~C(0)@p### ###p@64L(2' & |
  ')|M*Y~Last~@s20@56L(2)|M*Y~First~@s15@19L(1)|M*Y~DoW~C(0)@s4@40R(1)|M*Y~Date~C(0)@D7' & |
  '@31C(2)|M*Y~Entered~L@s2@30C(2)|M*Y~Verified~L@s2@36R(1)|M*Y~DOB~C(0)@d1b@15R(1)M*Y~' & |
  'Age~C(0)@n3@1L|M*Y@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Patient file'),TRN
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image1)
                       IMAGE('button.jpg'),AT(420,208,70,25),USE(?Image2)
                       BUTTON('&Insert'),AT(420,60,70,14),USE(?Insert:3),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  FLAT,MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&View Edit'),AT(420,208,70,25),USE(?Change:3),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  MSG('Change the Record'),TIP('Change the Record'),TRN
                       STRING(@n7),AT(232,30),USE(CLI:NUMBER),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                       STRING(@s25),AT(276,30),USE(CLI:LAST),FONT('Arial',12,,FONT:bold,CHARSET:ANSI),TRN
                       BUTTON('&Delete'),AT(420,44,70,14),USE(?Delete:3),FONT(,,,FONT:bold),LEFT,ICON('WADELETE.ICO'), |
  FLAT,MSG('Delete the Record'),TIP('Delete the Record')
                       PANEL,AT(24,42,371,278),USE(?Panel1)
                       BUTTON('Done'),AT(420,290,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DELAY(1),MSG('Close Window'),TIP('Close Window'),TRN
                       BUTTON('&Help'),AT(2,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window'),TRN
                       STRING('Client Patients'),AT(138,6),USE(?String4),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                       STRING('Find Patient by Last Name:'),AT(24,30),USE(?String1),FONT(,,,FONT:bold),TRN
                       BUTTON('&Select'),AT(418,108),USE(?Select)
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
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
  GlobalErrors.SetProcedureName('ClientPatients')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SAV:Name
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locDOW',locDOW)                           ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:PatientName.Open                         ! File PatientName used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Patient,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:DATE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pat:CLIENT_KEY) ! Add the sort order for Pat:CLIENT_KEY for sort order 1
  BRW1.AddRange(Pat:CLIENT,Relate:Patient,Relate:Client) ! Add file relationship range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pat:DATE,,BRW1)       ! Initialize the browse locator using  using key: Pat:CLIENT_KEY , Pat:DATE
  BRW1.AppendOrder('+Pat:INVOICE')                ! Append an additional sort order
  BRW1.AddField(Pat:STATUS,BRW1.Q.Pat:STATUS)     ! Field Pat:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)   ! Field Pat:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:LAST,BRW1.Q.Pat:LAST)         ! Field Pat:LAST is a hot field or requires assignment from browse
  BRW1.AddField(Pat:FIRST,BRW1.Q.Pat:FIRST)       ! Field Pat:FIRST is a hot field or requires assignment from browse
  BRW1.AddField(locDOW,BRW1.Q.locDOW)             ! Field locDOW is a hot field or requires assignment from browse
  BRW1.AddField(Pat:DATE,BRW1.Q.Pat:DATE)         ! Field Pat:DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:ENTERED_BY,BRW1.Q.Pat:ENTERED_BY) ! Field Pat:ENTERED_BY is a hot field or requires assignment from browse
  BRW1.AddField(Pat:VERIFIED_BY,BRW1.Q.Pat:VERIFIED_BY) ! Field Pat:VERIFIED_BY is a hot field or requires assignment from browse
  BRW1.AddField(Pat:DOB,BRW1.Q.Pat:DOB)           ! Field Pat:DOB is a hot field or requires assignment from browse
  BRW1.AddField(Pat:AGE,BRW1.Q.Pat:AGE)           ! Field Pat:AGE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:AGE_TYPE,BRW1.Q.Pat:AGE_TYPE) ! Field Pat:AGE_TYPE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:CLIENT,BRW1.Q.Pat:CLIENT)     ! Field Pat:CLIENT is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','ClientPatients',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,66,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
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
    Relate:PatientName.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SAV:Name
      IF SAV:Name
        CLOSE(PatientName)
        OPEN(PatientName)
        EMPTY(PatientName)
        IF ERRORCODE() THEN STOP('EMPTY Name: ' & ERROR()).
        locLength = LEN(CLIP(LEFT(SAV:Name)))
        CLEAR(PAT:Record)
        Pat:LAST = SAV:Name
        SET(Pat:ORDER_KEY,Pat:ORDER_KEY)
        LOOP
          NEXT(Patient)
          IF UPPER(SUB(Pat:LAST,1,locLength)) <> SAV:Name  OR ERRORCODE() THEN BREAK.
          IF Pat:CLIENT <> CLI:Number THEN CYCLE.
          PN:Record :=: PAT:Record
          ADD(PatientName)
          IF ERRORCODE() THEN STOP('ADD Name: ' & ERROR()).
        .
      .
      IF RECORDS(PatientName)
        GlobalRequest = SelectRecord
        PatientNameLookup(SAV:Name,CLI:Number)
        IF GlobalResponse = RequestCompleted
          Pat:INVOICE = PN:INVOICE
          GET(Patient,Pat:INVOICE_KEY)
          GlobalRequest = ChangeRecord
          UpdatePatient(2)
          
        .
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
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
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
      POST(Event:ScrollBottom,?Browse:1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (PAT:Status = 'H')
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 4868863
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 4868863
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 4868863
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 4868863
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 4868863
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 4868863
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 4868863
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 4868863
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 4868863
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 4868863
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 4868863
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSIF (PAT:Status = 'Q')
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 16776960
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 16776960
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 16776960
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 16776960
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 16776960
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 16776960
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 16776960
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 16776960
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 16776960
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 16776960
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 16776960
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSIF (PAt:Status = 'L'  AND ~Pat:VERIFIED_BY)
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 65535
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 65535
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 65535
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 65535
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 65535
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 65535
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 65535
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 65535
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 65535
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 65535
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 65535
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSIF (PAT:Status = 'L')
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 12582911
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 12582911
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 12582911
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 12582911
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 12582911
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 12582911
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 12582911
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 12582911
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 12582911
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 12582911
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 12582911
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSIF (PAT:Status = 'W')
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 11206570
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 11206570
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 11206570
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 11206570
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 11206570
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 11206570
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 11206570
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 11206570
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 11206570
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 11206570
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 11206570
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSIF (PAT:Status = 'I')
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set conditional color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = 13816530
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set conditional color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = 13816530
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set conditional color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = 13816530
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set conditional color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = 13816530
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set conditional color values for locDOW
    SELF.Q.locDOW_NormalBG = 13816530
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set conditional color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = 13816530
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set conditional color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = 13816530
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set conditional color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = 13816530
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set conditional color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = 13816530
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set conditional color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = 13816530
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set conditional color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = 13816530
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  ELSE
    SELF.Q.Pat:STATUS_NormalFG = -1                        ! Set color values for Pat:STATUS
    SELF.Q.Pat:STATUS_NormalBG = -1
    SELF.Q.Pat:STATUS_SelectedFG = -1
    SELF.Q.Pat:STATUS_SelectedBG = -1
    SELF.Q.Pat:INVOICE_NormalFG = -1                       ! Set color values for Pat:INVOICE
    SELF.Q.Pat:INVOICE_NormalBG = -1
    SELF.Q.Pat:INVOICE_SelectedFG = -1
    SELF.Q.Pat:INVOICE_SelectedBG = -1
    SELF.Q.Pat:LAST_NormalFG = -1                          ! Set color values for Pat:LAST
    SELF.Q.Pat:LAST_NormalBG = -1
    SELF.Q.Pat:LAST_SelectedFG = -1
    SELF.Q.Pat:LAST_SelectedBG = -1
    SELF.Q.Pat:FIRST_NormalFG = -1                         ! Set color values for Pat:FIRST
    SELF.Q.Pat:FIRST_NormalBG = -1
    SELF.Q.Pat:FIRST_SelectedFG = -1
    SELF.Q.Pat:FIRST_SelectedBG = -1
    SELF.Q.locDOW_NormalFG = -1                            ! Set color values for locDOW
    SELF.Q.locDOW_NormalBG = -1
    SELF.Q.locDOW_SelectedFG = -1
    SELF.Q.locDOW_SelectedBG = -1
    SELF.Q.Pat:DATE_NormalFG = -1                          ! Set color values for Pat:DATE
    SELF.Q.Pat:DATE_NormalBG = -1
    SELF.Q.Pat:DATE_SelectedFG = -1
    SELF.Q.Pat:DATE_SelectedBG = -1
    SELF.Q.Pat:ENTERED_BY_NormalFG = -1                    ! Set color values for Pat:ENTERED_BY
    SELF.Q.Pat:ENTERED_BY_NormalBG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedFG = -1
    SELF.Q.Pat:ENTERED_BY_SelectedBG = -1
    SELF.Q.Pat:VERIFIED_BY_NormalFG = -1                   ! Set color values for Pat:VERIFIED_BY
    SELF.Q.Pat:VERIFIED_BY_NormalBG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedFG = -1
    SELF.Q.Pat:VERIFIED_BY_SelectedBG = -1
    SELF.Q.Pat:DOB_NormalFG = -1                           ! Set color values for Pat:DOB
    SELF.Q.Pat:DOB_NormalBG = -1
    SELF.Q.Pat:DOB_SelectedFG = -1
    SELF.Q.Pat:DOB_SelectedBG = -1
    SELF.Q.Pat:AGE_NormalFG = -1                           ! Set color values for Pat:AGE
    SELF.Q.Pat:AGE_NormalBG = -1
    SELF.Q.Pat:AGE_SelectedFG = -1
    SELF.Q.Pat:AGE_SelectedBG = -1
    SELF.Q.Pat:AGE_TYPE_NormalFG = -1                      ! Set color values for Pat:AGE_TYPE
    SELF.Q.Pat:AGE_TYPE_NormalBG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedFG = -1
    SELF.Q.Pat:AGE_TYPE_SelectedBG = -1
  END
  SELF.Q.Pat:STATUS_Style = 1 ! 
  SELF.Q.Pat:INVOICE_Style = 1 ! 
  SELF.Q.Pat:LAST_Style = 1 ! 
  SELF.Q.Pat:FIRST_Style = 1 ! 
  SELF.Q.locDOW_Style = 1 ! 
  SELF.Q.Pat:DATE_Style = 1 ! 
  SELF.Q.Pat:ENTERED_BY_Style = 1 ! 
  SELF.Q.Pat:VERIFIED_BY_Style = 1 ! 
  SELF.Q.Pat:DOB_Style = 1 ! 
  SELF.Q.Pat:AGE_Style = 1 ! 
  SELF.Q.Pat:AGE_TYPE_Style = 1 ! 


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>0,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>0,1,NewOrder+1))
  END
  BRW1::LastSortOrder=NewOrder
  RETURN ReturnValue


BRW1.TakeNewSelection PROCEDURE

  CODE
  IF BRW1::PopupChoiceOn THEN
     IF KEYCODE() = MouseRightUp
        BRW1::PopupTextExt = ''
        BRW1::PopupChoiceExec = True
        BRW1::FormatManager.MakePopup(BRW1::PopupTextExt)
        IF SELF.Popup.GetItems() THEN
           BRW1::PopupTextExt = '|-|' & CLIP(BRW1::PopupTextExt)
        END
        BRW1::FormatManager.SetPopupChoice(SELF.Popup.GetItems(True)+1,0)
        SELF.Popup.AddMenu(CLIP(BRW1::PopupTextExt),SELF.Popup.GetItems()+1)
        BRW1::FormatManager.SetPopupChoice(,SELF.Popup.GetItems(True))
     ELSE
        BRW1::PopupChoiceExec = False
     END
  END
  PARENT.TakeNewSelection
  IF BRW1::PopupChoiceOn AND BRW1::PopupChoiceExec THEN
     BRW1::PopupChoiceExec = False
     BRW1::PopupChoice = SELF.Popup.GetLastNumberSelection()
     SELF.Popup.DeleteMenu(BRW1::PopupTextExt)
     IF BRW1::FormatManager.DispatchChoice(BRW1::PopupChoice)
     ELSE
     END
  END


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
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

