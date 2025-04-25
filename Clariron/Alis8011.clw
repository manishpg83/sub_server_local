

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8011.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8004.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8005.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8006.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8053.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8080.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Cli_panl file
!!! </summary>
ClientPanels PROCEDURE 

CurrentTab           STRING(80)                            !
locClientName        STRING(40)                            !
locPopupMenuString   STRING(20)                            !
locCount             USHORT                                !
BRW1::View:Browse    VIEW(Cli_panl)
                       PROJECT(CP:Panel)
                       PROJECT(CP:Description)
                       PROJECT(CP:IgE)
                       PROJECT(CP:IgG)
                       PROJECT(CP:IgG4)
                       PROJECT(CP:Mix)
                       PROJECT(CP:TotalIgE)
                       PROJECT(CP:Client)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
CP:Panel               LIKE(CP:Panel)                 !List box control field - type derived from field
CP:Panel_Style         LONG                           !Field style
CP:Description         LIKE(CP:Description)           !List box control field - type derived from field
CP:Description_Style   LONG                           !Field style
CP:IgE                 LIKE(CP:IgE)                   !List box control field - type derived from field
CP:IgE_Style           LONG                           !Field style
CP:IgG                 LIKE(CP:IgG)                   !List box control field - type derived from field
CP:IgG_Style           LONG                           !Field style
CP:IgG4                LIKE(CP:IgG4)                  !List box control field - type derived from field
CP:IgG4_Style          LONG                           !Field style
CP:Mix                 LIKE(CP:Mix)                   !List box control field - type derived from field
CP:Mix_Style           LONG                           !Field style
CP:TotalIgE            LIKE(CP:TotalIgE)              !List box control field - type derived from field
CP:TotalIgE_Style      LONG                           !Field style
locCount               LIKE(locCount)                 !List box control field - type derived from local data
locCount_Style         LONG                           !Field style
CP:Client              LIKE(CP:Client)                !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),ALRT(MouseRight),GRAY,MDI,HLP('SelectClientPanel')
                       BUTTON('Delete'),AT(420,124,70,25),USE(?DeleteButton),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  TRN
                       BUTTON('View Tests'),AT(420,230,70,25),USE(?ViewTest),FONT(,,,FONT:bold),LEFT,ICON('SteelView.ico'), |
  TRN
                       BUTTON('&Change'),AT(420,194,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Close'),AT(420,290,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       BUTTON('&Help'),AT(216,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Get Existing'),AT(0,302,70,25),USE(?GetExistingButton),FONT(,,,FONT:bold),HIDE,TRN
                       BUTTON('Add New'),AT(420,160,70,25),USE(?InsertButton),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  TRN
                       STRING(@s40),AT(310,52),USE(locClientName),FONT(,14,,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                       STRING('Client Panels'),AT(166,52,149,13),USE(?String1),FONT(,16,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                       LIST,AT(26,75,307,180),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,FORMAT('40L(2)|MY~Pane' & |
  'l~@s9@139L(2)|MY~Description~@s64@19L(2)|MY~IgE~L(1)@n3@19L(2)|MY~IgG~L(1)@n3@21L(2)' & |
  '|MY~IgG4~L(1)@n3@20L(2)|MY~Mix~L(1)@n3@20L(2)|MY~TIgE~L(1)@n3@24L(2)|MY~Count~@n3@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Cli_panl file'),TRN
                       IMAGE('button.jpg'),AT(420,160,70,25),USE(?Image4)
                       IMAGE('button.jpg'),AT(0,302,70,25),USE(?Image3),HIDE
                       IMAGE('BUTTON.JPG'),AT(420,290,70,25),USE(?Image1)
                       IMAGE('button.jpg'),AT(420,230,70,25),USE(?Image6)
                       IMAGE('button.jpg'),AT(420,124,70,25),USE(?Image5)
                       IMAGE('BUTTON.JPG'),AT(420,194,70,25),USE(?Image2)
                       BUTTON('&Select'),AT(420,85,70,25),USE(?Select),FONT(,,,FONT:bold),LEFT,ICON('SteelSelect.ico'), |
  TRN
                       IMAGE('button.jpg'),AT(420,85,,25),USE(?IMAGE7)
                       BUTTON('Edit Description'),AT(203,275,,25),USE(?ButtonEditDescription)
                       BUTTON('Upload Panels'),AT(410,14,,25),USE(?BUTTON1),FONT(,,,FONT:bold),LEFT,ICON(ICON:Connect)
                     END

Window WINDOW('Caption'),AT(,,395,224),FONT('MS Sans Serif',8,,FONT:regular),GRAY
       BUTTON('&OK'),AT(309,201,35,14),USE(?OkButton),LEFT,DEFAULT
       BUTTON('&Cancel'),AT(351,201,36,14),USE(?CancelButton),LEFT
     END
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
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
!---------------------------------------------------------------------------
SyncPanels  ROUTINE
  CP:CLIENT = CLI:NUMBER
  CP:PANEL = PAN:Number
  GET(Cli_Panl,CP:ORDER_KEY)
  IF ERRORCODE()
    CP:DESCRIPTION = PAN:Description
    ADD(Cli_Panl)
!  ELSE
!    CP:DESCRIPTION = PAN:Description
!    PUT(Cli_Panl)
  .

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ClientPanels')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DeleteButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locCount',locCount)                                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  Access:Pnl_test.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Cli_panl,SELF) ! Initialize the browse manager
  BRW1.SetUsePopup(False)
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon CP:Panel for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,CP:ORDER_KEY)    ! Add the sort order for CP:ORDER_KEY for sort order 1
  BRW1.AddRange(CP:Client,CLI:NUMBER)                      ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,CP:Panel,1,BRW1)               ! Initialize the browse locator using  using key: CP:ORDER_KEY , CP:Panel
  BRW1.AddField(CP:Panel,BRW1.Q.CP:Panel)                  ! Field CP:Panel is a hot field or requires assignment from browse
  BRW1.AddField(CP:Description,BRW1.Q.CP:Description)      ! Field CP:Description is a hot field or requires assignment from browse
  BRW1.AddField(CP:IgE,BRW1.Q.CP:IgE)                      ! Field CP:IgE is a hot field or requires assignment from browse
  BRW1.AddField(CP:IgG,BRW1.Q.CP:IgG)                      ! Field CP:IgG is a hot field or requires assignment from browse
  BRW1.AddField(CP:IgG4,BRW1.Q.CP:IgG4)                    ! Field CP:IgG4 is a hot field or requires assignment from browse
  BRW1.AddField(CP:Mix,BRW1.Q.CP:Mix)                      ! Field CP:Mix is a hot field or requires assignment from browse
  BRW1.AddField(CP:TotalIgE,BRW1.Q.CP:TotalIgE)            ! Field CP:TotalIgE is a hot field or requires assignment from browse
  BRW1.AddField(locCount,BRW1.Q.locCount)                  ! Field locCount is a hot field or requires assignment from browse
  BRW1.AddField(CP:Client,BRW1.Q.CP:Client)                ! Field CP:Client is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  PopupMgr3.Init(INIMgr)
  PopupMgr3.AddItem('Edit','Edit')
  PopupMgr3.AddItemMimic('Edit',?Change:4)
  PopupMgr3.AddItem('Add Panel','Add Panel')
  PopupMgr3.AddItem('Delete Panel','DeletePanel')
  PopupMgr3.AddItem('-','-')
  PopupMgr3.AddItem('View Tests','View Test')
  PopupMgr3.AddItemMimic('View Test',?ViewTest)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
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
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:Panels.Close
  END
  BRW1::AutoSizeColumn.Kill()
  PopupMgr3.Kill
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  IF Request <> InsertRecord
    PAN:Number = CP:PANEL
    GET(Panels,Pan:ORDER_KEY)
    IF ERRORCODE()
      Pan:DESCRIPTION = CP:DESCRIPTION
      Pan:FEE = CP:FEE
      ADD(Panels)
    .
  else
    stop('insert')
  .
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    PanelTestTable(CP:Panel)
    ReturnValue = GlobalResponse
  END
   Do SyncPanels
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
    OF ?DeleteButton
      ThisWindow.Update
      GET(Cli_Panl,CP:ORDER_KEY)
      IF ERRORCODE()
        STOP('DEL CP: ' & ERROR())
      ELSE
        DELETE(Cli_Panl)
        CLEAR(PT:Record)
        PT:PANEL = CP:PANEL
        SET(PT:ORDER_KEY,PT:ORDER_KEY)
        NEXT(Pnl_test)
        IF PT:PANEL <> CP:PANEL
          Pan:NUMBER = CP:PANEL
          GET(Panels,Pan:ORDER_KEY)
          IF ~ERRORCODE() THEN DELETE(Panels).
          POST(EVENT:CloseWindow)
        ELSE
          PanelTestDelete(CP:PANEL)
        .
        BRW1.ResetFromFile
      .
    OF ?ViewTest
      ThisWindow.Update
      BRW1.UpdateBuffer
      gloPanelNumber = CP:Panel
    OF ?Change:4
      !
    OF ?InsertButton
      CLEAR(PAN:Record)
      GET(Panels,0)
      GlobalRequest = InsertRecord
      UpdatePanels
    OF ?ButtonEditDescription
      !update description
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ViewTest
      ThisWindow.Update
      PanelTestTable(CP:PANEL)
      ThisWindow.Reset
    OF ?GetExistingButton
      ThisWindow.Update
      GlobalRequest = SelectRecord
      Panels()
      ThisWindow.Reset
    OF ?InsertButton
      ThisWindow.Update
      BRW1.ResetFromFile
    OF ?ButtonEditDescription
      ThisWindow.Update
      ClientPanelDesciptionEdit()
      ThisWindow.Reset
      BRW1.ResetFromFile
    OF ?BUTTON1
      ThisWindow.Update
      exportTables()
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
    CASE EVENT()
    OF EVENT:AlertKey
      IF KEYCODE() = MouseRight
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:AlertKey
      locPopupMenuString=PopupMgr3.Ask()
      END ! MouseRight
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
    SELF.ChangeControl=?Change:4
  END


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.CP:Panel_Style = 1 ! 
  SELF.Q.CP:Description_Style = 1 ! 
  SELF.Q.CP:IgE_Style = 1 ! 
  SELF.Q.CP:IgG_Style = 1 ! 
  SELF.Q.CP:IgG4_Style = 1 ! 
  SELF.Q.CP:Mix_Style = 1 ! 
  SELF.Q.CP:TotalIgE_Style = 1 ! 
  SELF.Q.locCount_Style = 1 ! 


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  Pan:NUMBER = CP:PANEL
  GET(Panels,Pan:ORDER_KEY)
  IF ERRORCODE()
    CP:DESCRIPTION = 'Not a Valid Panel Number'
  ELSE
    locCount = Pan:TESTS
  .
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

