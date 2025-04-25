

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8058.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8050.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form SpecimenReceived
!!! </summary>
Confirmation PROCEDURE 

CurrentTab           STRING(80)                            !
locOK                BYTE                                  !
locEmail             STRING(140)                           !
locclientName        STRING(40)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::SR:Record   LIKE(SR:RECORD),THREAD
QuickWindow          WINDOW('Specimen Received Confirmation'),AT(255,30,255,151),FONT('Arial',11,COLOR:Black,FONT:regular), |
  RESIZE,ICON('Allermetrix.ico'),GRAY,IMM,MDI,HLP('Confirmation'),SYSTEM
                       STRING(@d17),AT(26,72),USE(SR:Date),FONT(,,,FONT:bold),TRN
                       STRING(@n_6),AT(26,80),USE(SR:Patient),FONT(,,,FONT:bold),TRN
                       BUTTON('Notice'),AT(26,8,70,25),USE(?NoticeButton),FONT(,,,FONT:bold),LEFT,ICON('SteelEmail.ico'), |
  TRN
                       STRING(@s40),AT(26,88,175,10),USE(locclientName),FONT(,,,FONT:bold),TRN
                       STRING(@s100),AT(26,100,227,10),USE(locEmail),FONT(,8,,FONT:bold),TRN
                       BUTTON('Done Delete'),AT(26,40,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('WAOK.ICO'),DEFAULT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(26,40,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(120,40,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(26,8,70,25),USE(?Image1)
                       BUTTON('Do Not Delete'),AT(120,40,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('WACANCEL.ICO'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(0,138,31,14),USE(?Help),FONT('Arial',10),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE, |
  MSG('See Help Window'),STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  OF InsertRecord
    GlobalErrors.Throw(Msg:InsertIllegal)
    RETURN
  OF ChangeRecord
    ActionMessage = 'Change Status'
  OF DeleteRecord
    GlobalErrors.Throw(Msg:DeleteIllegal)
    RETURN
  END
  QuickWindow{PROP:StatusText,2} = ActionMessage           ! Display status message in status bar
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  locOK = TRUE
  ReturnValue = PARENT.ChangeAction()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Confirmation')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?SR:Date
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SR:Record,History::SR:Record)
  SELF.AddHistoryField(?SR:Date,1)
  SELF.AddHistoryField(?SR:Patient,2)
  SELF.AddUpdateFile(Access:SpecimenReceived)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SpecimenReceived
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:None                        ! Deletes not allowed
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?SR:Date{PROP:ReadOnly} = True
    DISABLE(?NoticeButton)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  CLI:NUMBER = SR:Client
  GET(Client,CLI:ORDER_KEY)
  IF ~ERRORCODE()
    locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3
    locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  ELSE
    locEmail = ''
    locClientName = ERROR()
    DISABLE(?NoticeButton)
  .
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
  IF locOK THEN DELETE(SpecimenReceived).
    Relate:Client.Close
    Relate:SpecimenReceived.Close
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
    OF ?NoticeButton
      ThisWindow.Update
        Pat:INVOICE = SR:Patient
        GET(Patient,PAT:Invoice_Key)
        CLI:NUMBER = PAT:Client
        GET(Client,CLI:ORDER_KEY)
      
        DocEmail(DOC:Confirmation+DOC:Spanish+DOC:Email)
        SR:eMailed = TRUE
        PUT(SpecimenReceived)
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

