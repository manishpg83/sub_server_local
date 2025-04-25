

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8031.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form PCodes
!!! </summary>
UpdatePCodes PROCEDURE 

CurrentTab           STRING(80)                            !
locViewPatients      SHORT                                 !
ActionMessage        CSTRING(40)                           !
locAdmin             SHORT                                 !
locPatients          SHORT                                 !
locEditPatients      SHORT                                 !
locEditClients       SHORT                                 !
locClients           SHORT                                 !
locResultsReadIn     SHORT                                 !
locResultsView       SHORT                                 !
locResultsPrint      SHORT                                 !
locWorkpool          SHORT                                 !
locVerify            SHORT                                 !
locLogin             SHORT                                 !
locDatabase          SHORT                                 !
locBilling           USHORT                                !
locAnalysis          ULONG                                 !
locWebPassword       ULONG                                 !
EnhancedFocusManager EnhancedFocusClassType
History::PC:Record   LIKE(PC:RECORD),THREAD
QuickWindow          WINDOW('Employee Permissions'),AT(0,0,506,341),FONT('Arial',11,,FONT:regular),RESIZE,IMM,MDI, |
  HLP('UpdatePCodes')
                       PROMPT('Initials:'),AT(94,34),USE(?PC:Initials:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s3),AT(122,34,40,10),USE(PC:Initials)
                       PROMPT('Pass Code:'),AT(80,50),USE(?PC:PassCode:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n_8),AT(122,50,40,10),USE(PC:PassCode),RIGHT(2)
                       CHECK('Admin'),AT(126,68,81,12),USE(locAdmin),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('1', |
  '0')
                       CHECK('View Patients'),AT(214,140,81,12),USE(locPatients),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('8','0')
                       CHECK('WorkPool'),AT(214,110,81,12),USE(locWorkpool),FONT(,,,FONT:bold),ICON(ICON:None),TRN, |
  VALUE('128','0')
                       CHECK('Edit Patients'),AT(214,154,81,12),USE(locEditPatients),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('16','0')
                       CHECK('Edit Billing'),AT(126,168,81,12),USE(locBilling),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('8192','0')
                       CHECK('Read Results'),AT(214,68,81,12),USE(locResultsReadIn),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('256','0')
                       CHECK('Print Results'),AT(214,82,81,12),USE(locResultsPrint),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('512','0')
                       CHECK('Analysis'),AT(126,96,81,12),USE(locAnalysis),FONT(,,,FONT:bold),ICON(ICON:None),TRN, |
  VALUE('4096','0')
                       CHECK('Web Password'),AT(126,110,81,12),USE(locWebPassword),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('16384','0')
                       CHECK('View Clients'),AT(126,140,81,12),USE(locClients),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('2','0')
                       CHECK('View Results'),AT(214,96,81,12),USE(locResultsView),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('1024','0')
                       CHECK('Edit Clients'),AT(126,154,81,12),USE(locEditClients),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('4','0')
                       CHECK('Patient Login'),AT(214,168,81,12),USE(locLogin),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('32','0')
                       CHECK('Database Tables'),AT(126,82,81,12),USE(locDatabase),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('2048','0')
                       BUTTON('&Done'),AT(396,194,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DEFAULT,MSG('Accept data and close the window'),TIP('Accept data and close the window'), |
  TRN
                       IMAGE('button.jpg'),AT(396,194,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(306,194,70,25),USE(?Image1)
                       CHECK('Verify Login'),AT(214,182,81,12),USE(locVerify),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('64','0')
                       BUTTON('&Cancel'),AT(306,194,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeCompleted          PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
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
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdatePCodes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PC:Initials:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PC:Record,History::PC:Record)
  SELF.AddHistoryField(?PC:Initials,1)
  SELF.AddHistoryField(?PC:PassCode,2)
  SELF.AddUpdateFile(Access:PCodes)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:PCodes.Open                                       ! File PCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:PCodes
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
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?PC:Initials{PROP:ReadOnly} = True
    ?PC:PassCode{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locAdmin          = BAND(PC:Permissions ,ACCESS:Admin)
  locPatients       = BAND(PC:Permissions ,ACCESS:Patients)
  locEditPatients   = BAND(PC:Permissions ,ACCESS:EditPatients)
  locEditClients    = BAND(PC:Permissions ,ACCESS:EditClients)
  locClients        = BAND(PC:Permissions ,ACCESS:Clients)
  locResultsReadIn  = BAND(PC:Permissions ,ACCESS:ReadInResults)
  locResultsView    = BAND(PC:Permissions ,ACCESS:ViewResults)
  locResultsPrint   = BAND(PC:Permissions ,ACCESS:PrintResults)
  locWorkpool       = BAND(PC:Permissions ,ACCESS:Workpool)
  locVerify         = BAND(PC:Permissions ,ACCESS:Verify)
  locLogin          = BAND(PC:Permissions ,ACCESS:PatientLogin)
  locDatabase       = BAND(PC:Permissions ,ACCESS:Database)
  locBilling        = BAND(PC:Permissions ,ACCESS:Financials)
  locWebPassword    = BAND(PC:Permissions ,ACCESS:WebPassword)
  locAnalysis       = BAND(PC:Permissions ,ACCESS:Analysis)
                                           
 !ACCESS:Admin          EQUATE(1)
!ACCESS:Clients        EQUATE(2)
!ACCESS:EditClients    EQUATE(4)
!ACCESS:Patients       EQUATE(8)
!ACCESS:EditPatients   EQUATE(16)
!ACCESS:PatientLogIn   EQUATE(32)
!ACCESS:Verify         EQUATE(64)
!ACCESS:Workpool       EQUATE(128)
!ACCESS:ReadInResults  EQUATE(256)
!ACCESS:PrintResults   EQUATE(512)
!ACCESS:ViewResults    EQUATE(1024)
!ACCESS:Database       EQUATE(2048)
!ACCESS:Analysis       EQUATE(4096)
!ACCESS:Billing        EQUATE(8192)
!ACCESS:WebPassword    EQUATE(16384)



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
    Relate:PCodes.Close
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
    PC:Permissions = locAdmin + locPatients + locEditPatients + locClients + locEditClients + locResultsReadIn + locResultsView + locResultsPrint + locWorkpool + locVerify + locLogin + locDatabase + locBilling + locWebPassword + locAnalysis
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

