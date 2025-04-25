

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8078.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
FindInsurance        PROCEDURE                             ! Declare Procedure
CSVtable                FILE,DRIVER('ASCII'),PRE(CSV),CREATE,NAME(gloFileName4)
          RECORD
Data    STRING(512)
        . .  

  CODE


  CREATE(TEMP)
  SHARE(Physicians)
  SHARE(TEMP)  
  SET(Physicians)
  LOOP UNTIL EOF(Physicians)
    NEXT(Physicians) 
    IF ERRORCODE() THEN BREAK.
    TMP:Client = PHY:Client
    TMP:Degree = PHY:License
    TMP:NPI = PHY:Upin
    TMP:Physician = PHY:Physician
    ADD(TEMP)
  .



















  RETURN

  SHARE(Patient)
  SHARE(Claims)
        gloFileName4 = 'FindInsurance.CSV'         
        CREATE(CSVtable)
        IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
        OPEN(CSVtable)
        IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
        CSV:Data = 'Assession,Login Date,Billed Date,Type,Status'
        ADD(CSVtable)  
  
  Pat:date = DATE(12,1,2019)
  SET(Patient,Pat:DATE_KEY) 
  LOOP UNTIL EOF(Patient)
    NEXT(Patient)
    IF ERRORCODE() THEN BREAK.  
    IF Pat:BILLING = 'I' OR Pat:BILLING = 'A' OR Pat:BILLING = 'M'
      IF Pat:BILLED > DATE(1,1,2020) 
        CLM:Patient = Pat:INVOICE
        GET(Claims,CLM:OrderKey)
        CSV:Data = Pat:INVOICE & ',' & FORMAT(Pat:date,@D1) & ',' & FORMAT(Pat:BILLED,@D1) & ',' & Pat:BILLING & ',' & Pat:STATUS  & ',' & CLM:Physician & ',' & CLM:NPI  & ',' &  CLM:DiagCode1 & ',' &  CLM:PlanID  & ',' &  CLM:PlanName
        ADD(CSVtable)
      
    . .    
  .    
  CLOSE(CSVtable) 
  CLOSE(Patient)
  
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ListPhysicians       PROCEDURE                             ! Declare Procedure
CSVtable                FILE,DRIVER('ASCII'),PRE(CSV),CREATE,NAME(gloFileName4)
          RECORD
Data    STRING(512)
        . .  

  CODE
  gloFileName4 = 'Physicians.CSV'         
  CREATE(CSVtable)
  IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
  OPEN(CSVtable)
  IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
  SHARE(Physicians) 
  SHARE(Client)
  CLEAR(CLI:Record)
  SET(CLI:ORDER_KEY,CLI:ORDER_KEY) 
  LOOP UNTIL EOF(Client)
    NEXT(Client)
    IF ERRORCODE() THEN BREAK. 
    CSV:Data = CLI:NUMBER & ',' & CLI:LAST
    ADD(CSVtable)     

    CLEAR(PHY:Record)
    PHY:Client = CLI:NUMBER
    SET(PHY:OrderKey,PHY:OrderKey)
    LOOP UNTIL EOF(Physicians)
      NEXT(Physicians)      
      IF ERRORCODE() OR PHY:Client <> CLI:NUMBER THEN BREAK.
      CSV:Data = ' ,' & PHY:Physician & ',' & PHY:UPIN & ',' & PHY:License
      ADD(CSVtable)  
   
    .  
    CSV:Data = ''
    ADD(CSVtable)  
  .
  CLOSE(CSVtable)
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
UploadInsurance      PROCEDURE                             ! Declare Procedure
ClaimList FILE,DRIVER('ASCII'),PRE(CL),CREATE,NAME(gloFileName3)
            RECORD
Data          STRING(512)
          . .   
Patients  QUEUE,PRE(PTS)
Patient      LONG
          .        

  CODE

  PTS:Patient = 209885
  ADD(Patients)
  PTS:Patient = 209927
  ADD(Patients)
  PTS:Patient = 209939
  ADD(Patients)
  PTS:Patient = 210229
  ADD(Patients)
  PTS:Patient = 210274
  ADD(Patients)
  PTS:Patient = 210275
  ADD(Patients)
  PTS:Patient = 210279
  ADD(Patients)
  PTS:Patient = 210280
  ADD(Patients)
  PTS:Patient = 210281
  ADD(Patients)
  PTS:Patient = 210283
  ADD(Patients)
  PTS:Patient = 210284
  ADD(Patients)
  PTS:Patient = 210287
  ADD(Patients)
  PTS:Patient = 210288
  ADD(Patients)
  PTS:Patient = 210289
  ADD(Patients)
  PTS:Patient = 210290
  ADD(Patients)
  PTS:Patient = 210337
  ADD(Patients)
  PTS:Patient = 210338
  ADD(Patients)
  PTS:Patient = 210340
  ADD(Patients)
  PTS:Patient = 210343
  ADD(Patients)
  PTS:Patient = 210344
  ADD(Patients)
  PTS:Patient = 210345
  ADD(Patients)
  PTS:Patient = 210346
  ADD(Patients)
  PTS:Patient = 210348
  ADD(Patients)
  PTS:Patient = 210350
  ADD(Patients)
  PTS:Patient = 210353
  ADD(Patients)
  PTS:Patient = 210354
  ADD(Patients)
  PTS:Patient = 210356
  ADD(Patients)
  PTS:Patient = 210357
  ADD(Patients)
  PTS:Patient = 210379
  ADD(Patients)
  PTS:Patient = 210424
  ADD(Patients)
  PTS:Patient = 210435
  ADD(Patients)
  PTS:Patient = 210436
  ADD(Patients)
  PTS:Patient = 210439
  ADD(Patients)
  PTS:Patient = 210440
  ADD(Patients)
  PTS:Patient = 210441
  ADD(Patients)
  PTS:Patient = 210442
  ADD(Patients)
  PTS:Patient = 210443
  ADD(Patients)
  PTS:Patient = 210444
  ADD(Patients)
  PTS:Patient = 210446
  ADD(Patients)
  
  
  CREATE(ChangeCare)
  SHARE(ChangeCare)

  SHARE(Billing)
  SHARE(Patient)
  SHARE(Claims)
  gloFileName3 = '.\ChangeCare\claims.lst'         
  CREATE(ClaimList)
  IF ERRORCODE() THEN STOP('CL: ' & ERROR()).
  OPEN(ClaimList)
  IF ERRORCODE() THEN STOP('CL: ' & ERROR()).  
  
  Pat:DATE = TODAY() - 30
  PAT:INVOICE = 0
  SET(PAT:DATE_KEY,PAT:DATE_KEY)
  LOOP UNTIL EOF(Patient) 
  BREAK
    NEXt(Patient)
!    IF PAT:Date > locEndDate THEN BREAK.
    IF PAT:CLIENT > 799999 THEN CYCLE.
    IF Pat:STATUS <> 'C' THEN CYCLE.
	  IF Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A'
      IF (BILL:AddressPatient OR BILL:Address2Patient) AND CLM:Physician AND CLM:DiagCode1 AND CLM:NPI AND CLM:PayerID
	      CC:Patient = Pat:INVOICE
	      GET(ChangeCare,CC:OrderKey) 
	      IF ERRORCODE()
          PTS:Patient = Pat:INVOICE
     !     ADD(Patients)
	      ELSE
	        CYCLE
	    . .
	. .  
  
  
  
  
  
  
  
  
  
  
  
  
  LOOP I# = 1 TO RECORDS(Patients)
    GET(Patients,I#)
    CLM:Patient = PTS:Patient  
    GET(Claims,CLM:OrderKey)
    BILL:Accession = PTS:Patient
    GET(Billing,BILL:patKey)
    PAT:INVOICE = PTS:Patient 
    GET(Patient,Pat:INVOICE_KEY) 
    ExportInsurance 
    CL:Data = Pat:INVOICE & '.txt'
    ADD(ClaimList)
    CC:Patient = PAT:INVOICE
    CC:Date = TODAY()
    CC:Time = CLOCK()
    ADD(ChangeCare)
  .   
  CLOSE(ClaimList)
  SETPATH('.\ChangeCare')  
  RUN('CMD /c 7z a  -tzip claims' & FORMAT(TODAY(),@D11) & '.ZIP @CLAIMS.LST',1) 
  RUN('CMD /c del *.txt')  
  SETPATH('..\')  
  
 OMIT('XXXX') 
  
  Pat:date = DATE(12,1,2019)
  SET(Patient,Pat:DATE_KEY) 
  LOOP UNTIL EOF(Patient)
    NEXT(Patient)
    IF ERRORCODE() THEN BREAK.  
    IF Pat:BILLING = 'I' OR Pat:BILLING = 'A' OR Pat:BILLING = 'M'
      IF Pat:BILLED > DATE(1,1,2020) 
        CLM:Patient = Pat:INVOICE
        GET(Claims,CLM:OrderKey)
      
        CSV:Data = Pat:INVOICE & ',' & FORMAT(Pat:date,@D1) & ',' & FORMAT(Pat:BILLED,@D1) & ',' & Pat:BILLING & ',' & Pat:STATUS  & ',' & CLM:Physician
        ADD(CSVtable)
      
    . .    
  .    
  XXXX
  
  CLOSE(Billing)
  CLOSE(Claims)
  CLOSE(Patient)
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the DiagnosticCodes file
!!! </summary>
DiagCodesLookup PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(DiagnosticCodes)
                       PROJECT(DC:Code)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
DC:Code                LIKE(DC:Code)                  !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(,,100,278),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('DiagCodesLookup'),SYSTEM
                       LIST,AT(5,4,89,235),USE(?Browse:1),FONT(,20,,FONT:bold,CHARSET:ANSI),HVSCROLL,FORMAT('68L(2)|M~Code~@s16@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the DiagnosticCodes file')
                       BUTTON('&Select'),AT(52,262,43,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&Insert'),AT(7,262,43,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(7,244,43,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('&Delete'),AT(52,244,43,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
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
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('DiagCodesLookup')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:DiagnosticCodes.Open                     ! File DiagnosticCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:DiagnosticCodes,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon DC:Code for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,DC:OrderKey) ! Add the sort order for DC:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,DC:Code,1,BRW1)       ! Initialize the browse locator using  using key: DC:OrderKey , DC:Code
  BRW1.AddField(DC:Code,BRW1.Q.DC:Code)           ! Field DC:Code is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('DiagCodesLookup',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','DiagCodesLookup',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,1,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:DiagnosticCodes.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('DiagCodesLookup',QuickWindow)           ! Save window data to non-volatile store
  END
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
    UpdateDiagnosticCodes
    ReturnValue = GlobalResponse
  END
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form DiagnosticCodes
!!! </summary>
UpdateDiagnosticCodes PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::DC:Record   LIKE(DC:RECORD),THREAD
QuickWindow          WINDOW('Form DiagnosticCodes'),AT(,,163,56),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateDiagnosticCodes'),SYSTEM
                       SHEET,AT(4,4,155,30),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Code:'),AT(8,20),USE(?DC:Code:Prompt),TRN
                           ENTRY(@s16),AT(61,20,68,10),USE(DC:Code)
                         END
                       END
                       BUTTON('&OK'),AT(4,38,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(57,38,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(110,38,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateDiagnosticCodes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?DC:Code:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(DC:Record,History::DC:Record)
  SELF.AddHistoryField(?DC:Code,1)
  SELF.AddUpdateFile(Access:DiagnosticCodes)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:DiagnosticCodes.Open                              ! File DiagnosticCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:DiagnosticCodes
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?DC:Code{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateDiagnosticCodes',QuickWindow)        ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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
  IF SELF.FilesOpened
    Relate:DiagnosticCodes.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateDiagnosticCodes',QuickWindow)     ! Save window data to non-volatile store
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
!!! Generated from procedure template - Window
!!! </summary>
ReadPDF PROCEDURE 

locFileName          STRING(61)                            !
locAccession         LONG                                  !
locDate              DATE                                  !
locFound             LONG                                  !
locFileName STRING(63)
Numbers FILE,DRIVER('ASCII'),PRE(NUM),NAME('accession.txt')
            RECORD
Data          STRING(8)
          . .  
BRW1::View:Browse    VIEW(Accession)
                       PROJECT(ACC:Number)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
ACC:Number             LIKE(ACC:Number)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
Window               WINDOW('Read PDF'),AT(,,394,348),FONT('Microsoft Sans Serif',8),RESIZE,SYSTEM
                       BUTTON('Read PDF'),AT(199,86,61,23),USE(?OkButton)
                       BUTTON('Close'),AT(270,312,61,23),USE(?CancelButton)
                       LIST,AT(344,2,43,343),USE(?List),RIGHT(1),FORMAT('60L(2)|M@n-14@'),FROM(Queue:Browse),IMM
                       STRING(@n_3b),AT(321,2),USE(locFound)
                       BUTTON('Read No Hash'),AT(2,323,61,23),USE(?ReadNoHash)
                       SPIN(@d17),AT(87,17),USE(locDate)
                       STRING(@s63),AT(2,49,337,17),USE(locFileName),FONT(,,,FONT:bold),CENTER,TRN
                       ENTRY(@n_6),AT(271,156,47),USE(locAccession),FONT(,,,FONT:bold),CENTER
                       BUTTON('Add'),AT(270,172,49,14),USE(?ButtonAdd)
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()               ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
GetFileName ROUTINE
  IF locDate < 81453  ! last day of 2024
    locFileName = '..\' & YEAR(locDate) & ' REQUEST FORMS\B&W to Searchable PDF_' & YEAR(locDate) & '-' & FORMAT(MONTH(locDate),'@N02') & '-' &  FORMAT(DAY(locDate),'@N02') & '_1.PDF'  
  ELSE     
    locFileName = '..\' & YEAR(locDate) & ' REQUEST FORMS\B&W to Searchable PDF_' & YEAR(locDate) & '-' & FORMAT(MONTH(locDate),'@N02') & '-' &  FORMAT(DAY(locDate),'@N02') & '_1.PDF'  
  .
  DISPLAY(?locFileName)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReadPDF')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?OkButton
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Accession.Open                           ! File Accession used by this procedure, so make sure it's RelationManager is open
  Relate:RequestForms.Open                        ! File RequestForms used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:Accession,SELF) ! Initialize the browse manager
  SELF.Open(Window)                               ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,)                            ! Add the sort order for  for sort order 1
  BRW1.AddField(ACC:Number,BRW1.Q.ACC:Number)     ! Field ACC:Number is a hot field or requires assignment from browse
  INIMgr.Fetch('ReadPDF',Window)                  ! Restore window settings from non-volatile store
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','ReadPDF',1,?List,1,BRW1::PopupTextExt,Queue:Browse,1,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
    locDate = TODAY()
    DO GetFileName
    
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?List,Queue:Browse)
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
    Relate:Accession.Close
    Relate:RequestForms.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('ReadPDF',Window)                        ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?CancelButton
      POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OkButton
      ThisWindow.Update
      CASE MESSAGE('Are you on the server?',,,BUTTON:YES + BUTTON:NO,BUTTON:NO)  
      OF BUTTON:NO
      OF BUTTON:YES
        RUN('CMD /c pdftotext "' & locFileName & '" pdf.txt',1)  
        RUN('CMD /c pcre2grep -o1 "[*|#|k|f|t|w|x|X|^]([2-9]\d\d\d\d\d)[*|#|k|f|t|w|x|X|$]" pdf.txt > accession.txt',1)   
      
        CLOSE(Accession)
        CREATE(Accession)  
        OPEN(Accession)
        OPEN(Numbers)   
        OPEN(RequestForms)
        SET(Numbers,1)
        LOOP
          NEXT(Numbers)
          IF ERRORCODE() THEN BREAK.   
          ACC:Number = NUM:Data
          ADD(Accession) 
      !      IF ERRORCODE() THEN STOP('ACC ' & ACC:Number & ': ' & ERROR()).
        .    
        BRW1.ResetFromFile   
        locFound = RECORDS(ACCESSION) 
        display()                     
        CLEAR(ACC:Record)
        SET(ACC:OrderKey,ACC:OrderKey)
        LOOP
          NEXT(Accession)
          IF ERRORCODE() THEN BREAK. 
          RF:Accession = ACC:Number
          RF:Date = locDate 
          ADD(RequestForms)
        .
        CLOSE(RequestForms)
        CLOSE(Numbers)   
      .
    OF ?ReadNoHash
      ThisWindow.Update
      RUN('CMD /c pdftotext "' & locFileName & '" pdf.txt',1)  
      RUN('CMD /c pcre2grep -o1 "(21[1-5]\d\d\d)" pdf.txt > accession.txt',1)   
      !   CLOSE(Accession)
      !   CREATE(Accession)  
      OPEN(Accession)   
      SHARE(RequestForms)
      OPEN(Numbers)
      SET(Numbers,1)
      LOOP
        NEXT(Numbers)
        IF ERRORCODE() THEN BREAK.   
        ACC:Number = NUM:Data
        ADD(Accession) 
      !      IF ERRORCODE() THEN STOP('ACC ' & ACC:Number & ': ' & ERROR()).
      .    
      BRW1.ResetFromFile   
      locFound = RECORDS(ACCESSION)
      DISPLAY()  
      CLEAR(ACC:Record)
      SET(ACC:OrderKey,ACC:OrderKey)
      LOOP
        NEXT(Accession)
        IF ERRORCODE() THEN BREAK. 
        RF:Accession = ACC:Number
        RF:Date = locDate
        ADD(RequestForms)
      .
      CLOSE(Numbers)
    OF ?locDate
      DO GetFileName
    OF ?locAccession
      IF locAccession > 99999 AND locAccession < 1000000
        RF:Accession = locAccession
        RF:Date = locDate
        ADD(RequestForms)
        ACC:Number = NUM:Data
        ADD(Accession)
        BRW1.ResetFromFile  
        DISPLAY()
        
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
    OF ?locDate
      DO GetFileName
    END
  ReturnValue = PARENT.TakeNewSelection()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the RequestForms file
!!! </summary>
RequestForm PROCEDURE 

CurrentTab           STRING(80)                            !
locDate              DATE                                  !
BRW1::View:Browse    VIEW(RequestForms)
                       PROJECT(RF:Date)
                       PROJECT(RF:Accession)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RF:Date                LIKE(RF:Date)                  !List box control field - type derived from field
RF:Accession           LIKE(RF:Accession)             !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the RequestForms file'),AT(,,277,354),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,HLP('RequestForm'),SYSTEM
                       LIST,AT(8,2,102,332),USE(?Browse:1),HVSCROLL,FORMAT('57R(2)|M~Date~C(0)@d17@39C(2)|M~Ac' & |
  'cession~C(0)@n_6@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the RequestForms file')
                       BUTTON('&Select'),AT(2,338,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(2,338,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(55,338,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(102,338,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(155,338,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       BUTTON('&Close'),AT(226,338,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(2,338,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       SPIN(@d17),AT(144,116,84,24),USE(locDate),FONT(,12,,FONT:bold)
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
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
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  locDate = TODAY()
  GlobalErrors.SetProcedureName('RequestForm')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:RequestForms.Open                        ! File RequestForms used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:RequestForms,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon RF:Accession for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,RF:DateKey) ! Add the sort order for RF:DateKey for sort order 1
  BRW1.AddRange(RF:Date,locDate)                  ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,RF:Accession,1,BRW1)  ! Initialize the browse locator using  using key: RF:DateKey , RF:Accession
  BRW1.AddField(RF:Date,BRW1.Q.RF:Date)           ! Field RF:Date is a hot field or requires assignment from browse
  BRW1.AddField(RF:Accession,BRW1.Q.RF:Accession) ! Field RF:Accession is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('RequestForm',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','RequestForm',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,2,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:RequestForms.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('RequestForm',QuickWindow)               ! Save window data to non-volatile store
  END
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
    UpdateRequestForms
    ReturnValue = GlobalResponse
  END
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
    OF ?locDate
      DISPLAY(?)
      DISPLAY()      
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
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form RequestForms
!!! </summary>
UpdateRequestForms PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::RF:Record   LIKE(RF:RECORD),THREAD
QuickWindow          WINDOW('Form RequestForms'),AT(,,173,84),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('UpdateRequestForms'),SYSTEM
                       SHEET,AT(4,4,165,58),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Accession:'),AT(8,20),USE(?RF:Accession:Prompt),TRN
                           ENTRY(@n_6),AT(61,20,104,10),USE(RF:Accession),RIGHT(1)
                           PROMPT('Date:'),AT(8,34),USE(?RF:Date:Prompt),TRN
                           ENTRY(@d17),AT(61,34,104,10),USE(RF:Date)
                           PROMPT('Sequence:'),AT(8,48),USE(?RF:Sequence:Prompt),TRN
                           ENTRY(@n-14),AT(61,48,64,10),USE(RF:Sequence),RIGHT(1)
                         END
                       END
                       BUTTON('&OK'),AT(14,66,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(67,66,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(120,66,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
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
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateRequestForms')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RF:Accession:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(RF:Record,History::RF:Record)
  SELF.AddHistoryField(?RF:Accession,1)
  SELF.AddHistoryField(?RF:Date,2)
  SELF.AddHistoryField(?RF:Sequence,3)
  SELF.AddUpdateFile(Access:RequestForms)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:RequestForms.Open                                 ! File RequestForms used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:RequestForms
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?RF:Accession{PROP:ReadOnly} = True
    ?RF:Date{PROP:ReadOnly} = True
    ?RF:Sequence{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateRequestForms',QuickWindow)           ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
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
  IF SELF.FilesOpened
    Relate:RequestForms.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateRequestForms',QuickWindow)        ! Save window data to non-volatile store
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
!!! Generated from procedure template - Window
!!! Browse the Test file
!!! </summary>
virus PROCEDURE 

locHighValue         LONG(999999)                          !
locLowValue          LONG(213573)                          !
CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Test)
                       PROJECT(TST:INVOICE)
                       PROJECT(TST:CODE)
                       PROJECT(TST:TYPE)
                       PROJECT(TST:COUNT)
                       PROJECT(TST:Score)
                       PROJECT(TST:STATUS)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TST:INVOICE            LIKE(TST:INVOICE)              !List box control field - type derived from field
TST:CODE               LIKE(TST:CODE)                 !List box control field - type derived from field
TST:TYPE               LIKE(TST:TYPE)                 !List box control field - type derived from field
TST:COUNT              LIKE(TST:COUNT)                !List box control field - type derived from field
TST:Score              LIKE(TST:Score)                !List box control field - type derived from field
TST:STATUS             LIKE(TST:STATUS)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the Test file'),AT(,,356,525),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('virus'),SYSTEM
                       LIST,AT(5,20,195,415),USE(?Browse:1),HVSCROLL,FORMAT('45C(2)|M~Accession~C(0)@p### ###p' & |
  '@40L(2)|M~Code~@s9@20R(2)|M~Type~C(0)@n3@38R(4)|M~Conc~C(0)@n7.2@24C(2)|M~Score~L(2)' & |
  '@s3@28L(2)|M~Status~@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Test file')
                       BUTTON('&Select'),AT(87,478,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(141,478,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(194,478,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(247,478,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(299,478,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,197,439),USE(?CurrentTab)
                         TAB,USE(?Tab:2),HIDE
                         END
                       END
                       BUTTON('&Close'),AT(251,500,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(303,500,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
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
!---------------------------------------------------------------------------
EXPORT ROUTINE 
  SHARE(Patient) 
  CLOSE(Text)
  gloFileName = '.\virus.csv'
  CREATE(TEXT)
  OPEN(TEXT)
  CLEAR(TST:Record)   
  TST:INVOICE = 213574
  SET(TST:ORDER_KEY,TST:ORDER_KEY) 
  LOOP  
    NEXT(TEST)  
    IF ERRORCODE() THEN BREAK.
    IF (TST:TYPE <> 7 OR TST:TYPE <> 8) OR TST:STATUS <> 'C' THEN CYCLE.
    IF TST:COUNT = 0 THEN CYCLE.
    Pat:INVOICE = TST:INVOICE
    GET(Patient,Pat:INVOICE_KEY)
    TXT:TEXT = Pat:FIRST & ',' & Pat:LAST & ',' & TST:INVOICE & ',' & CLIP(TST:CODE) & ',' & TST:TYPE & ',' & TST:COUNT & ', ' & TST:Percentile
    ADD(TEXT)
    IF ERRORCODE() THEN STOP('TXT ADD: ' & ERROR()).
  . 
  CLOSE(TEXT)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('virus')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Test,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon TST:INVOICE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,TST:ORDER_KEY) ! Add the sort order for TST:ORDER_KEY for sort order 1
  BRW1.AddRange(TST:INVOICE,locLowValue,locHighValue) ! Add 'range of values' range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,TST:INVOICE,,BRW1)    ! Initialize the browse locator using  using key: TST:ORDER_KEY , TST:INVOICE
  BRW1.SetFilter('(TST:Count > 150 AND (TST:Type = 7 ))') ! Apply filter expression to browse
  BRW1.AddField(TST:INVOICE,BRW1.Q.TST:INVOICE)   ! Field TST:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(TST:CODE,BRW1.Q.TST:CODE)         ! Field TST:CODE is a hot field or requires assignment from browse
  BRW1.AddField(TST:TYPE,BRW1.Q.TST:TYPE)         ! Field TST:TYPE is a hot field or requires assignment from browse
  BRW1.AddField(TST:COUNT,BRW1.Q.TST:COUNT)       ! Field TST:COUNT is a hot field or requires assignment from browse
  BRW1.AddField(TST:Score,BRW1.Q.TST:Score)       ! Field TST:Score is a hot field or requires assignment from browse
  BRW1.AddField(TST:STATUS,BRW1.Q.TST:STATUS)     ! Field TST:STATUS is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('virus',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','virus',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  DO EXPORT
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
    Relate:Patient.Close
    Relate:Test.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('virus',QuickWindow)                     ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  Pat:INVOICE = TST:INVOICE
  GET(Patient,Pat:INVOICE_KEY)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePatient(0)
    ReturnValue = GlobalResponse
  END
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
  SELF.ViewControl = ?View:3                               ! Setup the control used to initiate view only mode


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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
ExportCovid          PROCEDURE                             ! Declare Procedure
locColumn            LONG,DIM(64)                          !
locNumberOfFields    LONG                                  !
locState             STRING(2)                             !
locLabel             STRING(64),DIM(64)                    !
locFields            STRING(80),DIM(64)                    !
locPhyscianLast      STRING(32)                            !
locPhyscianFirst     STRING(32)                            !
locMark              LONG                                  !
StateCSV                FILE,DRIVER('ASCII'),PRE(CSV),CREATE,NAME(gloFileName4)
          RECORD
Text    STRING(1024)
        . .   

  CODE
  SHARE(TEST)
  SHARE(RAST)
  SHARE(PATIENT)    
  SHARE(Client)
  SHARE(Billing)
  SHARE(Claims)
  CLOSE(ExportCovid)
  create(ExportCovid)  
  IF ERRORCODE() THEN STOP('CREATE EC: ' & ERROR()).
  open(ExportCovid)
  IF ERRORCODE() THEN STOP('OPEN EC: ' & ERROR()).
  CLEAR(Pat:RECORD) 
  Pat:INVOICE = 215248
  SET(Pat:INVOICE_KEY,Pat:INVOICE_KEY)
  LOOP UNTIL EOF(PATIENT)
    NEXT(PATIENT)
    IF ERRORCODE() THEN BREAK. 
    IF Pat:CLIENT > 888000 THEN CYCLE. 
    CLEAR(TST:Record)
    TST:INVOICE = Pat:INVOICE   
    TST:TYPE = 7
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP UNTIL EOF(TEST)
      NEXT(TEST)
      IF ERRORCODE() THEN BREAK.  
      if TST:INVOICE <> Pat:INVOICE THEN BREAK. 
      IF TST:TYPE < 7 THEN BREAK.
      IF TST:STATUS <> 'C' THEN CYCLE.  
      RST:NUMBER = TST:CODE
      GET(RAST,RST:ORDER_KEY)
      IF INRANGE(TST:TYPE,7,8)
        EC:Accession = Pat:INVOICE 
        CLEAR(CLI:Record)
        CLI:NUMBER = Pat:CLIENT
        GET(CLIENT,CLI:ORDER_KEY)
        EC:State = CLI:STATE 
        EC:TestCode = TST:CODE  
        EC:Result = TST:COUNT
        EC:TestType = TST:TYPE 
        EC:Score = TST:Score
        Add(ExportCovid)  
       ! IF ERRORCODE() THEN STOP('EC: ' & ERROR()).
      .
    .
  .    
  locState = ''
  CLEAR(EC:Record)
  SET(EC:OrderKey,EC:OrderKey) 
  LOOP UNTIL EOF(ExportCovid)
    NEXT(ExportCovid)
    IF ERRORCODE() THEN BREAK.
    Pat:INVOICE = EC:Accession
    GET(Patient,Pat:INVOICE_KEY)  
    IF ERRORCODE() THEN STOP('GET PAT: ' & ERROR()).
    BILL:Accession = EC:Accession   
    CLEAR(CLI:Record)
    CLI:NUMBER = Pat:CLIENT  
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() THEN STOP('GET CLI: ' & ERROR()).
    GET(Billing,BILL:patKey) 
    IF ERRORCODE() THEN STOP('GET BILL: ' & ERROR()).
    CLM:Patient = EC:Accession
    GET(Claims,CLM:OrderKey)
    IF ERRORCODE() THEN STOP('GET CLM: ' & ERROR()).
    DO SetFields
    IF locState <> EC:State  
      locState = EC:State
      CLOSE(StateCSV)   
      gloFileName4 = EC:State & '.CSV'  
      CREATE(StateCSV) 
      OPEN(StateCSV) 
      DO WriteHeadCSV
    . 
   
    
    
    DO WriteCSV
  .
  
SetFields ROUTINE    
  locMark = INSTRING('*', CLM:Physician) 
  locPhyscianLast = SUB(CLM:Physician,1,locMark - 1)    
  locPhyscianFirst = SUB(CLM:Physician,locMark + 1,32)
  CLEAR(locFields)
  locFields[1] = CLIP(CLI:LAST) & ' ' & CLIP(CLI:FIRST)
  locFields[2] = '16D2067684' 
  locFields[3] = 'Allermetrix'
  locFields[4] = '44D1053766'
  locFields[5] = '400 Sugartree Lane Suite 510'  
  locFields[6] = 'Franklin' 
  locFields[7] = 'TN' 
  locFields[8] = '37064' 
  locFields[9] = '6155994100'
  locFields[10] = Pat:INVOICE 
  locFields[11] = PAT:FIRST 
  locFields[12] =  PAT:LAST
  locFields[13] =  CLIP(PAT:FIRST)  & ' ' & Pat:LAST
  locFields[14] = FORMAT(PAT:DOB,@D12)
  locFields[15] = PAT:SEX
  locFields[16] = '2131-1'  ! RACE 
  locFields[17] = ''  ! ETHNICITY
  locFields[18] = 'U'  ! LANGUAGE 
  locFields[19] = BILL:AddressPatient
  locFields[20] = BILL:CityPatient 
  locFields[21] = BILL:StatePatient 
  locFields[22] = BILL:PostalPatient 
  locFields[23] = '' ! COUNTY
  locFields[24] = BILL:PhonePatient 
  locFields[25] = 'U'
  locFields[26] = 'LDT'  ! Device ID
  locFields[27] = CLIP(CLI:LAST) & ' ' & CLIP(CLI:FIRST) & ' ' &  CLM:NPI
  locFields[28] = CLIP(CLI:LAST) & ' ' & CLIP(CLI:FIRST)
  locFields[29] = CLIP(CLM:NPI)
  locFields[30] = CLIP(CLI:ADDRESS1)
  locFields[31] = CLIP(CLI:CITY) 
  locFields[32] = CLIP(CLI:STATE)
  locFields[33] = CLIP(CLI:ZIP) 
  locFields[34] = CLIP(CLI:STATE) 
  locFields[35] = CLI:PHONE
  locFields[36] = Pat:AGE   
  locFields[37] = FORMAT(Pat:DATE,@D12)
  locFields[38] = FORMAT(Pat:COLLECTION,@D12)
  locFields[39] = FORMAT(Pat:DATE+2,@D12) 
  locFields[40] =  '119364003'  
  locFields[44] = EC:Result
  IF EC:TestType = 7
    locFields[41] = '94505-5'   
    locFields[45] = 'SARS-CoV-2 (COVID-19) IgG Ab µg/ml in Serum or Plasma by Immunoassay'
    IF EC:TestCode = 'A099' OR EC:TestCode = 'A100'  
      locFields[43] = 'SARS coronavirus 2 Ab.IgG' 
 !      '0.38 - 0.66'  
    ELSIF EC:TestCode = 'A101' OR EC:TestCode = 'A102' 
      locFields[43] = 'SARS coronavirus 2 Ab.IgG'   
    ELSIF EC:TestCode = 'A103' OR EC:TestCode = 'A104'   
      locFields[43] = 'SARS coronavirus 2 rS1-Proten Ab.IgG'    
      locFields[43] = 'SARS coronavirus 2 Ab.IgG'    
    . 
    IF EC:Score = '0'  
      locFields[53] = '< 0.38 µg/mL' 
    ELSIF EC:SCORE = '0/1' 
      locFields[53] = '0.38 - 0.66 µg/mL'
    ELSE
      locFields[53] = '0.67+ µg/mL'
    .
    
    locFields[52] = 'µg/mL'
  ELSIF EC:TestType = 8  
 !   ''    ' '  ''
    locFields[41] = '94506-3'           
    locFields[45] = 'SARS-CoV-2 (COVID-19) IgM Ab ng/ml in Serum or Plasma by Immunoassay'
    IF EC:TestCode = 'A099' OR EC:TestCode = 'A100'  
      locFields[43] = 'SARS coronavirus 2 rRBD Ab.IgM'
      locFields[43] = 'SARS coronavirus 2 Ab.IgM'
    ELSIF EC:TestCode = 'A101' OR EC:TestCode = 'A102' 
      locFields[43] = 'SARS coronavirus 2 rN-Protein 2 Ab.IgM'   
      locFields[43] = 'SARS coronavirus 2 Ab.IgM'   
    ELSIF EC:TestCode = 'A103' OR EC:TestCode = 'A104'   
      locFields[43] = 'SARS coronavirus 2 rS1-Proten Ab.IgM'    
      locFields[43] = 'SARS coronavirus 2 Ab.IgM'    
    .                      
    IF EC:Score = '0'  
      locFields[53] = '< 5.00 ng/mL' 
    ELSIF EC:SCORE = '0/1' 
      locFields[53] = '5.00 - 8.74 ng/mL'
    ELSE
      locFields[53] = '8.75+ ng/mL'
    .
    
    locFields[52] = 'ng/mL'
  .  
  IF EC:Score = '1'
    locFields[42] =  '10828004'	! Positive	 
  ELSIF EC:Score = '0'
    locFields[42] = '260385009'	! Negative	 
  ELSIF EC:Score = '0/1'
    locFields[42] = '82334004'  
  .

  locFields[44] = EC:Result
  locFields[46] = FORMAT(Pat:DATE,@D12)
  locFields[47] = CLIP(locPhyscianFirst) & ' ' & locPhyscianLast
  locFields[48] = CLIP(CLM:NPI)
  locFields[49] = locPhyscianFirst
  locFields[50] = locPhyscianLast
  locFields[51] = CLI:Country ! CLIA#
  
  locFields[54] = 'Allermetrix 44D1053766'
  locFields[55] =  ''  
  locFields[64] =  ''
  IF CLI:STATE = ''  THEN STOP('No Client record found for: ' & Pat:Invoice & ', ' & Pat:CLIENT).
  IF CLI:STATE = 'TX'
  locColumn[1] = 3  ;  locLabel[1] = 'Reporting_Facility_Name'
  locColumn[2] = 4  ;  locLabel[2] = 'CLIA_Number'
  locColumn[3] = 3  ;  locLabel[3] = 'Performing_Organization_Name'
  locColumn[4] = 5  ;  locLabel[4] = 'Performing_Organization_Address'
  locColumn[5] = 6  ;  locLabel[5] = 'Performing_Organization_City'
  locColumn[6] = 8  ;  locLabel[6] = 'Performing_Organization_Zip'
  locColumn[7] = 7  ;  locLabel[7] = 'Performing_Organization_State'
  locColumn[8] = 26 ;  locLabel[8] = 'Device_Identifier'
  locColumn[9] = 43 ;  locLabel[9] = 'Ordered_Test_Name'
  locColumn[10] = 41 ; locLabel[10] = 'LOINC_Code'
  locColumn[11] = 45 ; locLabel[11] = 'LOINC_Text'
  locColumn[12] = 44 ; locLabel[12] = 'Result'
  locColumn[13] = 52 ; locLabel[13] = 'Result_Units'
  locColumn[14] = 53 ; locLabel[14] = 'Reference_Range'
  locColumn[15] = 37 ; locLabel[15] = 'Date_Test_Performed'
  locColumn[16] = 39 ; locLabel[16] = 'Test_Result_Date'
  locColumn[17] = 11 ; locLabel[17] = 'Pt_Fname'
  locColumn[18] = 64 ; locLabel[18] = 'Pt_Middle_Initial'
  locColumn[19] = 12 ; locLabel[19] = 'Pt_Lname'
  locColumn[20] = 14 ; locLabel[20] = 'Date_of_Birth'
  locColumn[21] = 36 ; locLabel[21] = 'Patient Age (Years)'
  locColumn[22] = 15 ; locLabel[22] = 'Sex'
  locColumn[23] = 16 ; locLabel[23] = 'Pt_Race'
  locColumn[24] = 17 ; locLabel[24] = 'Pt_Ethnicity'
  locColumn[25] = 64 ; locLabel[25] = 'Pt_Phone'
  locColumn[26] = 19 ; locLabel[26] = 'Pt_Str'
  locColumn[27] = 20 ; locLabel[27] = 'Pt_City'
  locColumn[28] = 21 ; locLabel[28] = 'Pt_ST'
  locColumn[29] = 22 ; locLabel[29] = 'Pt_Zip'
  locColumn[30] = 23 ; locLabel[30] = 'Pt_County'
  locColumn[31] = 10 ; locLabel[31] = 'Accession_Number'
  locColumn[32] = 28 ; locLabel[32] = 'Ordering_Facility'
  locColumn[33] = 30 ; locLabel[33] = 'Ordering_Facility_Address'
  locColumn[34] = 31 ; locLabel[34] = 'Ordering_Facility_City'
  locColumn[35] = 32 ; locLabel[35] = 'Ordering_Facility_State'
  locColumn[36] = 33 ; locLabel[36] = 'Ordering_Facility_Zip'
  locColumn[37] = 50 ; locLabel[37] = 'Ordering_Provider_Last_Name'
  locColumn[38] = 49 ; locLabel[38] = 'Ordering_Provider_First_Name'
  locColumn[39] = 48 ; locLabel[39] = 'Ordering_Provider_NPI'
  locColumn[40] = 30 ; locLabel[40] = 'Ordering_Provider_Street_Address'
  locColumn[41] = 31 ; locLabel[41] = 'Ordering_Provider_City'
  locColumn[42] = 32 ; locLabel[42] = 'Ordering_Provider_State'
  locColumn[43] = 33 ; locLabel[43] = 'Ordering_Provider_Zip'
  locColumn[44] = 35 ; locLabel[44] = 'Ordering_Provider_Phone'
  locColumn[45] = 10 ; locLabel[45] = 'Specimen_ID'
  locColumn[46] = 41 ; locLabel[46] = 'Specimen_Type'
  locColumn[47] = 37 ; locLabel[47] = 'Date_Test_Ordered'
  locColumn[48] = 38 ; locLabel[48] = 'Date_Specimen_Collected'  
  locColumn[49] = 10 ; locLabel[49] = 'Medical_Record_Number'
  locColumn[50] = 64 ; locLabel[50] = 'Employed_in_healthcare'
  locColumn[51] = 64 ; locLabel[51] = 'Symptomatic_per_cdc'
  locColumn[52] = 64 ; locLabel[52] = 'Date_of_Symptom_Onset'
  locColumn[53] = 64 ; locLabel[53] = 'Hospitalized'
  locColumn[54] = 64 ; locLabel[54] = 'ICU'
  locColumn[55] = 64 ; locLabel[55] = 'Resident_in_Congregate_Care'
  locColumn[56] = 64 ; locLabel[56] = 'Pregnant' 
  locNumberOfFields = 56 
  .
   exit 
  IF CLI:STATE = 'LA'
  locColumn[1] = 3 ; locLabel[1] = 'LabName'
  locColumn[2] = 10 ; locLabel[2] = 'MRN'
  locColumn[3] = 12 ; locLabel[3] = 'Last Name'
  locColumn[4] = 64 ; locLabel[4] = 'Middle Name'
  locColumn[5] = 11 ; locLabel[5] = 'First Name'
  locColumn[6] = 19 ; locLabel[6] = 'Patient Address'
  locColumn[7] = 20 ; locLabel[7] = 'Patient City'
  locColumn[8] = 21 ; locLabel[8] = 'Patient State'
  locColumn[9] = 22 ; locLabel[9] = 'Patient ZipCode'
  locColumn[10] = 64 ; locLabel[10] = 'Patient phone'
  locColumn[11] = 64 ; locLabel[11] = 'SSN'
  locColumn[12] = 14 ; locLabel[12] = 'Birth Date'
  locColumn[13] = 15 ; locLabel[13] = 'Sex'
  locColumn[14] = 64 ; locLabel[14] = 'Race'
  locColumn[15] = 64 ; locLabel[15] = 'Ethnicity'
  locColumn[16] = 38 ; locLabel[16] = 'DateColl'
  locColumn[17] = 39 ; locLabel[17] = 'ResultDate'
  locColumn[18] = 41 ; locLabel[18] = 'LOINC'
  locColumn[19] = 45 ; locLabel[19] = 'TestName'
  locColumn[20] = 44 ; locLabel[20] = 'LabResult'
  locColumn[21] = 52 ; locLabel[21] = 'ResultUnits'
  locColumn[22] = 53 ; locLabel[22] = 'Reference Range'
  locColumn[23] = 47 ; locLabel[23] = 'PhyName'
  locColumn[24] = 30 ; locLabel[24] = 'PhyAddress1'
  locColumn[25] = 31 ; locLabel[25] = 'PhysCity'
  locColumn[26] = 32 ; locLabel[26] = 'PhysST'
  locColumn[27] = 33 ; locLabel[27] = 'PhysZip'
  locColumn[28] = 35 ; locLabel[28] = 'PhysPhone'
  locColumn[29] = 28 ; locLabel[29] = 'Facility'
  locColumn[30] = 30 ; locLabel[30] = 'Fac_Addr1'
  locColumn[31] = 31 ; locLabel[31] = 'Fac_City'
  locColumn[32] = 32 ; locLabel[32] = 'Fac_State'
  locColumn[33] = 33 ; locLabel[33] = 'Fac_Zip'
  locColumn[34] = 35 ; locLabel[34] = 'Fac_Phone'
  locColumn[35] = 64 ; locLabel[35] = 'Comment'
  locColumn[36] = 2 ; locLabel[36] = 'CLIA No'
  locColumn[37] = 10 ; locLabel[37] = 'Accession_no'
  locColumn[38] = 40 ; locLabel[38] = 'Specimen_Type'
  locColumn[39] = 64 ; locLabel[39] = 'Pregnant'    
  locNumberOfFields = 39 
  .
  exit
  IF CLI:STATE = 'IA' 
  locColumn[1] = 1   ; locLabel[1] = 'SendingFacilityName'
  locColumn[2] = 2   ; locLabel[2] = 'SendingFacilityCode'
  locColumn[3] = 3   ; locLabel[3] = 'PerformingFacilityName'
  locColumn[4] = 4   ; locLabel[4] = 'PerformingFacilityCode (CLIA#)'
  locColumn[5] = 10   ; locLabel[5] = 'PatientID / MRN'
  locColumn[6] = 12   ; locLabel[6] = 'PatientLastName'
  locColumn[7] = 11   ; locLabel[7] = 'PatientFirstName'
  locColumn[8] = 64   ; locLabel[8] = 'PatientMiddleName'
  locColumn[9] = 14   ; locLabel[9] = 'PatientDOB'
  locColumn[10] = 15   ; locLabel[10] = 'PatientGender'
  locColumn[11] = 16   ; locLabel[11] = 'PatientRace'
  locColumn[12] = 19   ; locLabel[12] = 'PatientAddress1'
  locColumn[13] = 64   ; locLabel[13] = 'PatientAddress2'
  locColumn[14] = 20   ; locLabel[14] = 'PatientCity'
  locColumn[15] = 21   ; locLabel[15] = 'PatientState'
  locColumn[16] = 22   ; locLabel[16] = 'PatientZip'
  locColumn[17] = 23   ; locLabel[17] = 'PatientCountyName'
  locColumn[18] = 24   ; locLabel[18] = 'PatientHomePhone'
  locColumn[19] = 17   ; locLabel[19] = 'PatientEthnicity'
  locColumn[20] = 64   ; locLabel[20] = 'PatientPregnancyStatus'
  locColumn[21] = 47   ; locLabel[21] = 'OrderingProviderName'
  locColumn[22] = 30   ; locLabel[22] = 'OrderingProviderAddress'
  locColumn[23] = 31   ; locLabel[23] = 'OrderingProviderCity'
  locColumn[24] = 32   ; locLabel[24] = 'OrderingProviderState'
  locColumn[25] = 33   ; locLabel[25] = 'OrderingProviderZip'
  locColumn[26] = 35   ; locLabel[26] = 'OrderingProviderPhone'
  locColumn[27] = 64   ; locLabel[27] = 'OrderingProviderCountyName'
  locColumn[28] = 28   ; locLabel[28] = 'OrderingFacilityName'
  locColumn[29] = 30   ; locLabel[29] = 'OrderingFacilityAddress'
  locColumn[30] = 31   ; locLabel[30] = 'OrderingFacilityCity'
  locColumn[31] = 32   ; locLabel[31] = 'OrderingFacilityState'
  locColumn[32] = 33   ; locLabel[32] = 'OrderingFacilityZip'
  locColumn[33] = 35   ; locLabel[33] = 'OrderingFacilityPhone'
  locColumn[34] = 64   ; locLabel[34] = 'OrderingFacilityCountyName'
  locColumn[35] = 10   ; locLabel[35] = 'LabAccessionNumber or SpecimenID'
  locColumn[36] = 38   ; locLabel[36] = 'SpecimenCollectedDate'
  locColumn[37] = 37   ; locLabel[37] = 'SpecimenReceivedDate'
  locColumn[38] = 40   ; locLabel[38] = 'SpecimenTypeName'
  locColumn[39] = 41   ; locLabel[39] = 'TestCode'
  locColumn[40] = 42   ; locLabel[40] = 'ResultCode'
  locColumn[41] = 39   ; locLabel[41] = 'ResultDate'
  locColumn[42] = 43   ; locLabel[42] = 'Observation Notes'
  locColumn[43] = 41   ; locLabel[43] = 'TestOrdered'
  locColumn[44] = 38   ; locLabel[44] = 'DateTestOrdered'
  locColumn[45] = 47   ; locLabel[45] = 'Ordering Provider Full name'
  locColumn[46] = 48   ; locLabel[46] = 'Ordering Provider NPI'
  locColumn[47] = 'LDT'   ; locLabel[47] = 'Device Identifier'
  locColumn[48] = 64   ; locLabel[48] = 'EmployedInHealthcare'
  locColumn[49] = 64   ; locLabel[49] = 'Symptomatic (for COVID-19)'
  locColumn[50] = 64   ; locLabel[50] = 'SymptomOnsetDate'
  locColumn[51] = 64   ; locLabel[51] = 'HospitalizedForCOVID-19'
  locColumn[52] = 64   ; locLabel[52] = 'ICU'
  locColumn[53] = 64   ; locLabel[53] = 'Resident in a congregate care setting' 
  locNumberOfFields = 53   
  .
  EXIT
    
    
    
    locColumn[1] = 45 ; locLabel[1] = 'Test name'
    locColumn[2] = 44 ; locLabel[2] = 'Result '
    locColumn[3] = 52 ; locLabel[3] = 'Numeric result unit'
    locColumn[4] = 10 ; locLabel[4] = 'Accession number'
    locColumn[5] = 38 ; locLabel[5] = 'Specimen collection date'
    locColumn[6] = 37 ; locLabel[6] = 'Date/time of testing'
    locColumn[7] = 11 ; locLabel[7] = 'Patient first name'
    locColumn[8] = 12 ; locLabel[8] = 'Patient last name'
    locColumn[9] = 14 ; locLabel[9] = 'Patient date of birth'
    locColumn[10] = 15 ; locLabel[0] = 'Patient sex'
    locColumn[11] = 64 ; locLabel[11] = 'Patient race'
    locColumn[12] = 64 ; locLabel[12] = 'Patient phone number'
    locColumn[13] = 19 ; locLabel[13] = 'Patient street address'
    locColumn[14] = 64 ; locLabel[14] = 'Patient street address 2'
    locColumn[15] = 20 ; locLabel[15] = 'Patient city'
    locColumn[16] = 21 ; locLabel[16] = 'Patient state'
    locColumn[17] = 22 ; locLabel[17] = 'Patient zip'
    locColumn[18] = 13 ; locLabel[18] = 'Ordering facility/client name'
    locColumn[19] = 47 ; locLabel[19] = 'Ordering provider name'
    locColumn[20] = 31 ; locLabel[20] = 'Ordering provider street address'
    locColumn[21] = 64 ; locLabel[21] = 'Ordering provider street address 2'
    locColumn[22] = 31 ; locLabel[22] = 'Ordering provider city'
    locColumn[23] = 32 ; locLabel[23] = 'Ordering provider state'
    locColumn[24] = 33 ; locLabel[24] = 'Ordering provider zip'
    locColumn[25] = 35 ; locLabel[25] = 'Ordering provider phone number'
    locColumn[26] = 53 ; locLabel[26] = 'Reference range for result'
    
    locNumberOfFields = 26 
    EXIT
    
  

  

  
WriteCSV    ROUTINE    
  CSV:Text = CLIP(LEFT(locFields[locColumn[1]])) 
  LOOP I# = 2 TO locNumberOfFields  
    CSV:Text = CLIP(CSV:Text) & ',' & CLIP(LEFT(locFields[locColumn[I#]])) 
    
  . 
  ADD(StateCSV) 
  
WriteHeadCSV    ROUTINE    
  CSV:Text = CLIP(LEFT(locLabel[1])) 
  LOOP I# = 2 TO locNumberOfFields  
    CSV:Text = CLIP(CSV:Text) & ',' & CLIP(LEFT(locLabel[I#])) 
    
  . 
  ADD(StateCSV)
  
