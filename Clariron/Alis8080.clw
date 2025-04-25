

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8080.INC'),ONCE        !Local module procedure declarations
                     END


gloPrinter   STRING(64)
gloLanguage   STRING(1)
gloTextFileName   STRING(64)
gloPassword   STRING(6)
TRange   DECIMAL(5,2),DIM(5,2)
gloFees   DECIMAL(5,2),DIM(4,5)
gloTotalSummary   BYTE
gloTotal   BYTE
gloSendout   BYTE
gloSendout100   BYTE
gloSendout200   BYTE
gloPeanutPanel   BYTE
gloOverride   BYTE
gloREPORTTITLE   STRING(26)
gloRPTNOTICE1   STRING(20)
gloRPTNOTICE2   STRING(20)
gloRPTNOTICE3   STRING(20)
gloSKIPQC   BYTE
gloReportdate   LONG
gloFaxIt   BYTE
gloLast   LONG
gloFirst   LONG
gloExport   BYTE
gloInvoice   BYTE
GlobalTotal   DECIMAL(7,2)
gloCLInum   LONG
gloDATE0   LONG
gloDate   LONG
gloBilledDate   LONG
gloTime   LONG
gloNote1   STRING(60)
gloNote2   STRING(60)
gloPatName   STRING(40)
gloClientName   STRING(35)
gloAddress1   STRING(35)
gloAddress2   STRING(40)
gloAddress3   STRING(40)
gloExportFile   STRING(22)
gloIgEInterp   BYTE
gloDIgEInterp   BYTE
gloIgGInterp   BYTE
gloIgG4Interp   BYTE
gloGAM   BYTE,DIM(3)
gloE   BYTE
gloG4   BYTE
gloG   BYTE
gloIGG   BYTE,DIM(4)
gloFood   BYTE
gloInhalant   BYTE
gloDust   BYTE
gloPollen   BYTE
gloMold   BYTE
gloAllercare   BYTE
gloIsFax   BYTE
gloIGG_Flag   BYTE
gloASR_Flag   BYTE
gloPATCollection   STRING(16)
gloGEETotal   DECIMAL(7,2)
gloFaxNumber   STRING(20)
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
exportTables         PROCEDURE                             ! Declare Procedure

  CODE



 

  OMIT('XXX') 
  CREATE(NewPanels)
  OPEN(NewPanels)
  IF ERRORCODE() THEN STOP('OPEN NP: ' & ERROR()).
  SHARE(Panels)
  IF ERRORCODE() THEN STOP('OPEN PAN: ' & ERROR()).
  SET(Pan:ORDER_KEY)
  LOOP UNTIL EOF(Panels)
    NEXT(Panels)
    IF ERRORCODE() THEN STOP('NEXT PAN: ' & ERROR()).
    IF LEN(CLIP(Pan:NUMBER)) < 3 THEN CYCLE.
    IF LEN(CLIP(Pan:DESCRIPTION)) < 3 THEN CYCLE.
    NP:Number = Pan:NUMBER
    NP:Description = Pan:DESCRIPTION
    NP:Fee = Pan:FEE
    NP:IgE = 0
    NP:IgG = 0
    NP:IgG4 = 0
    NP:Mix = 0
    NP:TotalIgE = 0
    NP:Tests = Pan:TESTS
    NP:SpareLong = 0
    NP:SpareString = ''
    ADD(NewPanels)
    IF ERRORCODE() THEN STOP('ADD NT: ' & ERROR()).
 
  
  .

  STOP('DONE')

  XXX







  SHARE(Rast)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('RAST ' & ERROR()).
  SHARE(Panels)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('PANELS: ' & ERROR()).
  SHARE(Pnl_test)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('PANEL TESTS ' & ERROR()).
  SHARE(Cli_panl)
  IF ERRORCODE() AND ERRORCODE() <> 52 THEN STOP('CLIENT PANELS ' & ERROR()).
  gloFileName = 'panels.txt' 
  CREATE(Text)
  OPEN(Text)
  SET(Pan:ORDER_KEY)
  LOOP
    NEXT(Panels)
    IF ERRORCODE() THEN BREAK.
    TXT:Text = Pan:NUMBER &'|' & CLIP(Pan:DESCRIPTION) &'|' & Pan:FEE &'|' & Pan:TESTS &'|'
    ADD(TEXT)
  .
  CLOSE(Text)
  gloFileName = 'paneltests.txt' 
  CREATE(Text)
  OPEN(Text)
  SET(PT:ORDER_KEY)
  LOOP
    NEXT(Pnl_test)
    IF ERRORCODE() THEN BREAK.
    TXT:Text = CLIP(PT:PANEL) &'|' & PT:CODE &'|' & PT:TYPE &'|' 
    ADD(TEXT)
  .
  CLOSE(Text)
  gloFileName = 'clientpanels.txt'
  CREATE(Text)
  OPEN(Text)
  SET(CP:ORDER_KEY)
  LOOP
    NEXT(Cli_panl)
    IF ERRORCODE() THEN BREAK.
    TXT:Text = CP:CLIENT &'|' & CLIP(CP:PANEL) &'|' & clip(CP:DESCRIPTION) &'|' & CP:FEE &'|' 
    ADD(TEXT)
  .
  
    CLOSE(Text)
  gloFileName = 'rast.txt'
  CREATE(Text)
  OPEN(Text)
  SET(RST:ORDER_KEY)
  LOOP
    NEXT(Rast)
    IF ERRORCODE() THEN BREAK.
    TXT:Text = RST:NUMBER &'|' &  CLIP(RST:DESCRIPTION) &'|' & CLIP(RST:sDescription) &'|' &  CLIP(RST:ShortDescription) &'|' &  RST:FeeLevel  & '|'
    ADD(TEXT)
  .
  RUN('CMD /c C:\Apps\updateTables.bat & EXIT',1)
!!! <summary>
!!! Generated from procedure template - Form
!!! </summary>
ClientPanelDesciptionEdit PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Caption'),AT(,,260,100),GRAY
                       ENTRY(@s64),AT(50,28,196),USE(CP:Description)
                       BUTTON('Done'),AT(170,62),USE(?BUTTON1)
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
  GlobalErrors.SetProcedureName('ClientPanelDesciptionEdit')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?CP:Description
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ClientPanelDesciptionEdit',Window)         ! Restore window settings from non-volatile store
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
    Relate:Cli_panl.Close
  END
  IF SELF.Opened
    INIMgr.Update('ClientPanelDesciptionEdit',Window)      ! Save window data to non-volatile store
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
    OF ?BUTTON1
      ThisWindow.Update
      PUT(Cli_panl)
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
MakeHL7 PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Make HL7'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('MakeHL7'),SYSTEM
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
  GlobalErrors.SetProcedureName('MakeHL7')
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
  Relate:HL7.Open                                          ! File HL7 used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('MakeHL7',QuickWindow)                      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
    OPEN(HL7)
    HL7:Client = 200424
    HL7:Accession = 0
    SET(HL7:OrderKey,HL7:OrderKey)
    LOOP UNTIL EOF(HL7)
      NEXT(HL7)
      URLHandler(QuickWindow{prop:handle},'http://dev.amxemr.com/HL7/' & HL7:Accession & '.php?id=' & CLIP(Pat:CLIENT_ID) & '&accession=' & Pat:INVOICE)
  
    .
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
    Relate:HL7.Close
  END
  IF SELF.Opened
    INIMgr.Update('MakeHL7',QuickWindow)                   ! Save window data to non-volatile store
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
ResultsSendout1002   PROCEDURE                             ! Declare Procedure

  CODE
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
Patients2            PROCEDURE                             ! Declare Procedure

  CODE
!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
DoUpdateSanJuan PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('RUN'),AT(,,260,76),FONT('Microsoft Sans Serif',8,,FONT:bold,CHARSET:DEFAULT),RESIZE, |
  CENTER,GRAY,IMM,HLP('DoUpdateSanJuan'),SYSTEM
                       BUTTON('&OK'),AT(181,52,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       STRING('RUN C:\apps\500258\Results\'),AT(50,30),USE(?STRING1)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('DoUpdateSanJuan')
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('DoUpdateSanJuan',QuickWindow)              ! Restore window settings from non-volatile store
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
  IF SELF.Opened
    INIMgr.Update('DoUpdateSanJuan',QuickWindow)           ! Save window data to non-volatile store
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
      !    RUN('CMD /c C:\Apps\500258\TEST.bat',1)      
      RUN('CMD /c C:\Apps\500258\getamxresultsSanJuan.bat',1)
      !   RUN('CMD /c C:\Apps\updateAMX.bat & EXIT',1)getamxresultsSanJuan.bat
      IF errorcode() then stop('error: ' & error()).
      POST(Event:CloseWindow)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

