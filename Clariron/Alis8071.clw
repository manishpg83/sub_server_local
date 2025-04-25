

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8071.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8009.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8019.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form ToDo
!!! </summary>
UpdateToDo PROCEDURE 

locNumber            ULONG                                 !
CurrentTab           STRING(80)                            !
locOther             BYTE                                  !
locVendor            BYTE                                  !
locSales             BYTE                                  !
locOperations        BYTE                                  !
locPatient           BYTE                                  !
locClient            ULONG                                 !
locQNS               ULONG                                 !
locException         BYTE                                  !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::ToD:Record  LIKE(ToD:RECORD),THREAD
QuickWindow          WINDOW,AT(,,506,330),FONT('Arial',11,,FONT:regular,CHARSET:DEFAULT),CENTER,GRAY,IMM,MDI,HLP('UpdateToDo'), |
  SYSTEM
                       PROMPT('Description:'),AT(15,34),USE(?ToD:Description:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@s64),AT(61,34,307,10),USE(ToD:Description),REQ
                       PROMPT('Patient:'),AT(19,62,40),USE(?ToD:Patient:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@p### ###p),AT(61,62,40,10),USE(ToD:Patient),RIGHT(1)
                       PROMPT('Client:'),AT(19,48,40),USE(?ToD:Client:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@p### ###p),AT(61,48,40,10),USE(ToD:Client),RIGHT(1)
                       PROMPT('Date:'),AT(19,16,40),USE(?ToD:Date:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       PROMPT('Do By'),AT(19,76,40),USE(?ToD:Due:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@d17),AT(62,76,51,10),USE(ToD:Due)
                       PROMPT('For:'),AT(19,92,40),USE(?ToD:For:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@s3),AT(62,92,40,10),USE(ToD:For)
                       PROMPT('Entered By:'),AT(19,105,40),USE(?ToD:EnteredBy:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@s3),AT(62,106,40,10),USE(ToD:EnteredBy)
                       BUTTON('&OK'),AT(420,290,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('WAOK.ICO'),DEFAULT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window'),TRN
                       BUTTON('&Cancel'),AT(310,290,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('WACANCEL.ICO'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(14,300,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@d17),AT(61,16),USE(ToD:Date,,?ToD:Date:2),FONT(,,,FONT:bold),TRN
                       BUTTON,AT(118,73,18,15),USE(?UpDate),ICON('upArrow.png')
                       BUTTON,AT(142,73,18,15),USE(?DownDate),ICON('downArrow.png')
                       CHECK(' Report Exception'),AT(62,126),USE(locException),FONT(,,,FONT:bold),TRN,VALUE('1','0')
                       CHECK(' QNS'),AT(62,139,62),USE(locQNS),FONT(,,,FONT:bold),TRN,VALUE('2','0')
                       CHECK(' Patient'),AT(62,152),USE(locPatient),FONT(,,,FONT:bold),TRN,VALUE('4','0')
                       CHECK(' Client'),AT(62,165),USE(locClient),FONT(,,,FONT:bold),TRN,VALUE('8','0')
                       CHECK(' Operations'),AT(62,180),USE(locOperations),FONT(,,,FONT:bold),TRN,VALUE('16','0')
                       CHECK(' Sales'),AT(62,192),USE(locSales),FONT(,,,FONT:bold),TRN,VALUE('32','0')
                       CHECK(' Vendor'),AT(62,206),USE(locVendor),FONT(,,,FONT:bold),TRN,VALUE('64','0')
                       CHECK(' Other'),AT(62,220),USE(locOther),FONT(,,,FONT:bold),TRN,VALUE('128','0')
                       BUTTON('...'),AT(105,48,18,10),USE(?ButtonLookupClinet),FONT(,,,FONT:bold)
                       BUTTON('...'),AT(105,61,18,10),USE(?ButtonLookupPatient),FONT(,,,FONT:bold)
                       BUTTON('Go To'),AT(133,48,,10),USE(?ButtonRetreiveClient),FONT(,,,FONT:bold),HIDE
                       BUTTON('Go To'),AT(133,61,,10),USE(?ButtonRetreivePatient),FONT(,,,FONT:bold),HIDE
                       STRING(@s25),AT(173,48,194),USE(CLI:LAST),FONT(,,,FONT:bold),TRN
                       STRING(@s20),AT(173,65,87),USE(Pat:LAST),FONT(,,,FONT:bold),TRN
                       STRING(@s15),AT(173,58,77),USE(Pat:FIRST),FONT(,,,FONT:bold),TRN
                       IMAGE('button.jpg'),AT(310,290,,25),USE(?IMAGE1)
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?IMAGE2)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
ChangeAction           PROCEDURE(),BYTE,DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
InsertAction           PROCEDURE(),BYTE,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
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
  PARENT.Ask


ThisWindow.ChangeAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    ToD:Attributes = locException + locQNS + locPatient + locClient + locOperations + locSales + locVendor + locOther  
  ReturnValue = PARENT.ChangeAction()
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateToDo')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?ToD:Description:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(ToD:Record,History::ToD:Record)
  SELF.AddHistoryField(?ToD:Description,2)
  SELF.AddHistoryField(?ToD:Patient,3)
  SELF.AddHistoryField(?ToD:Client,4)
  SELF.AddHistoryField(?ToD:Due,6)
  SELF.AddHistoryField(?ToD:For,7)
  SELF.AddHistoryField(?ToD:EnteredBy,8)
  SELF.AddHistoryField(?ToD:Date:2,5)
  SELF.AddUpdateFile(Access:ToDo)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                         ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ToDo
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  Pat:INVOICE = ToD:Patient
  GET(Patient,Pat:INVOICE_KEY)
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?ToD:Description{PROP:ReadOnly} = True
    ?ToD:Patient{PROP:ReadOnly} = True
    ?ToD:Client{PROP:ReadOnly} = True
    ?ToD:Due{PROP:ReadOnly} = True
    ?ToD:For{PROP:ReadOnly} = True
    ?ToD:EnteredBy{PROP:ReadOnly} = True
    DISABLE(?UpDate)
    DISABLE(?DownDate)
    DISABLE(?ButtonLookupClinet)
    DISABLE(?ButtonLookupPatient)
    DISABLE(?ButtonRetreiveClient)
    DISABLE(?ButtonRetreivePatient)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:WallPaper} = gloWallpaper
    locException = BAND(ToD:Attributes,1)
    locQNS = BAND(ToD:Attributes,2)
    locPatient = BAND(ToD:Attributes,4)
    locClient = BAND(ToD:Attributes,8)
    locOperations = BAND(ToD:Attributes,16)
    locSales = BAND(ToD:Attributes,32)
    locVendor = BAND(ToD:Attributes,64)
    locOther = BAND(ToD:Attributes,128)
    PAT:INVOICE = ToD:Patient
    GET(Patient,PAT:ORDER_KEY)
    IF ERRORCODE() 
      CLEAR(Pat:Record)
    ELSE
      UNHIDE(?ButtonRetreivePatient)
    .
    CLI:NUMBER = ToD:Client
    GET(Client,CLI:ORDER_KEY)
    IF ERRORCODE() 
      CLEAR(CLI:Record)
    ELSE
      UNHIDE(?ButtonRetreiveClient)
    .
  
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'»',8)
  EnhancedFocusManager.DisableControlType(CREATE:Radio)
  EnhancedFocusManager.DisableControlType(CREATE:Check)
  EnhancedFocusManager.DisableControlType(CREATE:Combo)
  EnhancedFocusManager.DisableControlType(CREATE:List)
  EnhancedFocusManager.DisableControlType(CREATE:DropCombo)
  EnhancedFocusManager.DisableControlType(CREATE:DropList)
  RETURN ReturnValue


ThisWindow.InsertAction PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
    ToD:Attributes = locException + locQNS + locPatient + locClient + locOperations + locSales + locVendor + locOther  
  ReturnValue = PARENT.InsertAction()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Client.Close
    Relate:ToDo.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  CLEAR(ToD:ID,1)
  SET(ToD:OrderKey,ToD:OrderKey)
  PREVIOUS(ToDo)
  IF ERRORCODE()  
    IF ERRORCODE() = 33 
      ToD:ID = 0
    ELSE 
      STOP('PREV TODO: ' & ERROR())
  . .
  locNumber = ToD:ID + 1
  CLEAR(ToD:Record)  
  ToD:Date = TODAY()
  ToD:Due = TODAY()
  ToD:EnteredBy = gloInitials
  ToD:ID = locNumber
  PARENT.PrimeFields


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
    OF ?UpDate
      ThisWindow.Update
      ToD:Due += 1
      DISPLAY(?ToD:Due)
    OF ?DownDate
      ThisWindow.Update
      ToD:DUE -= 1
      DISPLAY(?ToD:Due)
    OF ?ButtonLookupClinet
      ThisWindow.Update
      GlobalRequest = SelectRecord
      Client()
      ThisWindow.Reset
      IF GlobalResponse = RequestCompleted 
        ToD:Client = CLI:NUMBER
        DISPLAY(?ToD:Client)
      .
    OF ?ButtonLookupPatient
      ThisWindow.Update
      IF ToD:Client
        CLI:NUMBER = ToD:Client
        GET(Client,CLI:ORDER_KEY)
        GlobalRequest = SelectRecord
        ClientPatients
      ELSE
        GlobalRequest = SelectRecord
        Patients
       .
        IF GlobalResponse = RequestCompleted
          ToD:Patient = Pat:INVOICE
          ToD:Client = pat:CLIENT
          DISPLAY(?ToD:Patient)
        .
    OF ?ButtonRetreiveClient
      ThisWindow.Update
      CLI:NUMBER = ToD:Client
      GET(Client,CLI:ORDER_KEY)
      IF ~ERRORCODE() THEN GlobalRequest = ChangeRecord;UpdateClient.
    OF ?ButtonRetreivePatient
      ThisWindow.Update
      PAT:INVOICE = ToD:Patient
      GET(Patient,PAT:INVOICE_KEY)
      IF ~ERRORCODE() THEN GlobalRequest = ChangeRecord;UpdatePatient(0).
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
!!! Form ResultsSendout
!!! </summary>
ResultsSendoutUpdate PROCEDURE 

CurrentTab           STRING(80)                            !
locFirst             BYTE                                  !
locLast              BYTE                                  !
locValueCol2         STRING(8)                             !
locValueCol1         STRING(8)                             !
locFieldOffset       BYTE                                  !
locField             BYTE                                  !
locName              STRING(32)                            !
locTestType          STRING(4),DIM(12)                     !
locDescription       STRING(32),DIM(12)                    !
locNdx               BYTE                                  !
locBlank             BYTE                                  !
ActionMessage        CSTRING(40)                           !
locSTypes STRING('IgGIgAIgM')
locSType  STRING(3),DIM(3),OVER(locSTypes)
History::RS:Record   LIKE(RS:RECORD),THREAD
QuickWindow          WINDOW,AT(,,506,330),FONT('Arial',11,,FONT:regular,CHARSET:ANSI),CENTER,GRAY,IMM,MDI,HLP('ResultsSen' & |
  'doutUpdate'),SYSTEM
                       ENTRY(@s8),AT(101,42,30,10),USE(RS:Score[1,1]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,42,30,10),USE(RS:TextResult[1,1]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,54,30,10),USE(RS:Score[1,2]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,54,30,10),USE(RS:TextResult[1,2]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,66,30,10),USE(RS:Score[1,3]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,66,30,10),USE(RS:TextResult[1,3]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,78,30,10),USE(RS:Score[1,4]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,78,30,10),USE(RS:TextResult[1,4]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,90,30,10),USE(RS:Score[1,5]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,90,30,10),USE(RS:TextResult[1,5]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,102,30,10),USE(RS:Score[1,6]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,102,30,10),USE(RS:TextResult[1,6]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,114,30,10),USE(RS:Score[1,7]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,114,30,10),USE(RS:TextResult[1,7]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,126,30,10),USE(RS:Score[1,8]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,126,30,10),USE(RS:TextResult[1,8]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,138,30,10),USE(RS:Score[1,9]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,138,30,10),USE(RS:TextResult[1,9]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,150,30,10),USE(RS:Score[1,10]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,150,30,10),USE(RS:TextResult[1,10]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,162,30,10),USE(RS:Score[1,11]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,162,30,10),USE(RS:TextResult[1,11]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(101,174,30,10),USE(RS:Score[1,12]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(137,174,30,10),USE(RS:TextResult[1,12]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,42,30,10),USE(RS:Score[2,1]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,42,30,10),USE(RS:TextResult[2,1]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,54,30,10),USE(RS:Score[2,2]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,54,30,10),USE(RS:TextResult[2,2]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,66,30,10),USE(RS:Score[2,3]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,66,30,10),USE(RS:TextResult[2,3]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,78,30,10),USE(RS:Score[2,4]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,78,30,10),USE(RS:TextResult[2,4]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,90,30,10),USE(RS:Score[2,5]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,90,30,10),USE(RS:TextResult[2,5]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,102,30,10),USE(RS:Score[2,6]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,102,30,10),USE(RS:TextResult[2,6]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,114,30,10),USE(RS:Score[2,7]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,114,30,10),USE(RS:TextResult[2,7]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,126,30,10),USE(RS:Score[2,8]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,126,30,10),USE(RS:TextResult[2,8]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,138,30,10),USE(RS:Score[2,9]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,138,30,10),USE(RS:TextResult[2,9]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,150,30,10),USE(RS:Score[2,10]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,150,30,10),USE(RS:TextResult[2,10]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,162,30,10),USE(RS:Score[2,11]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,162,30,10),USE(RS:TextResult[2,11]),FONT(,,,FONT:bold)
                       ENTRY(@s8),AT(193,174,30,10),USE(RS:Score[2,12]),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@s8),AT(232,174,30,10),USE(RS:TextResult[2,12]),FONT(,,,FONT:bold)
                       PROMPT('Patient:'),AT(120,221),USE(?RS:Patient:Prompt),FONT(,,COLOR:Black,FONT:bold),TRN
                       PROMPT('Entered By:'),AT(56,16),USE(?RS:EnteredBy:Prompt),TRN
                       STRING(@p### ###p),AT(151,221),USE(Pat:INVOICE),FONT(,,COLOR:Aqua,FONT:bold),TRN
                       STRING(@s4),AT(74,42),USE(RS:Code[1]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,54),USE(RS:Code[2]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,66),USE(RS:Code[3]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,78),USE(RS:Code[4]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,90),USE(RS:Code[5]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,102),USE(RS:Code[6]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,114),USE(RS:Code[7]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,126),USE(RS:Code[8]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,138),USE(RS:Code[9]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,150),USE(RS:Code[10]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,162),USE(RS:Code[11]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(74,174),USE(RS:Code[12]),FONT(,12,,FONT:bold),TRN
                       STRING(@s4),AT(268,42,18,9),USE(locTestType[1]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,54,18,9),USE(locTestType[2]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,66,18,9),USE(locTestType[3]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,78,18,9),USE(locTestType[4]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,90,18,9),USE(locTestType[5]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,102,18,9),USE(locTestType[6]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,114,18,9),USE(locTestType[7]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,126,18,9),USE(locTestType[8]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,138,18,9),USE(locTestType[9]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,150,18,9),USE(locTestType[10]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,162,18,9),USE(locTestType[11]),FONT(,,,FONT:bold),TRN
                       STRING(@s4),AT(268,174,18,9),USE(locTestType[12]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,42,144),USE(locDescription[1]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,54,144),USE(locDescription[2]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,66,144),USE(locDescription[3]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,78,144),USE(locDescription[4]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,90,144),USE(locDescription[5]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,102,144),USE(locDescription[6]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,114,144),USE(locDescription[7]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,126,144),USE(locDescription[8]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,138,144),USE(locDescription[9]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,150,144),USE(locDescription[10]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,162,144),USE(locDescription[11]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(288,174,144),USE(locDescription[12]),FONT(,,,FONT:bold),TRN
                       BUTTON('&OK'),AT(405,284,70,25),USE(?OK),FONT(,,,FONT:regular+FONT:underline),LEFT,ICON('WAOK.ICO'), |
  DEFAULT,FLAT,MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(324,284,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(47,172,20,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@s3),AT(103,5),USE(gloInitials)
                       STRING(@s32),AT(183,221,177),USE(locName),FONT(,,COLOR:Aqua,FONT:bold),TRN
                       STRING('Score'),AT(100,33),USE(?STRING1),TRN
                       STRING('Result'),AT(146,33,,9),USE(?STRING2),TRN
                       STRING('Score'),AT(192,33,20),USE(?STRING3),TRN
                       STRING('Result'),AT(240,33),USE(?STRING4),TRN
                       ENTRY(@s3),AT(100,16,30,10),USE(RS:EnteredBy[1]),FONT(,,,FONT:bold)
                       ENTRY(@s3),AT(192,16,29,9),USE(RS:EnteredBy[2]),FONT(,,,FONT:bold)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ResultsSendoutUpdate')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RS:Score_1_1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(RS:Record,History::RS:Record)
  SELF.AddUpdateFile(Access:ResultsSendout)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:ResultsSendout.Open                               ! File ResultsSendout used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ResultsSendout
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('ResultsSendoutUpdate',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper 
  locName = CLIP(Pat:last) & ', ' & Pat:FIRST
  IF LOWER(RS:EnteredBy[1]) = LOWER(gloInitials) 
    DISABLE(?RS:Score_2_1,?RS:TextResult_2_12)
    SELECT(?RS:Score_1_1)
  ELSIF LOWER(RS:EnteredBy[2]) = LOWER(gloInitials) 
    DISABLE(?RS:Score_1_1,?RS:TextResult_1_12)
    SELECT(?RS:Score_2_1)
  ELSIF ~RS:EnteredBy[1] AND ~RS:EnteredBy[2]
    RS:EnteredBy[1] = gloInitials
    DISABLE(?RS:Score_2_1,?RS:TextResult_2_12)
    SELECT(?RS:Score_1_1)
  ELSIF ~RS:EnteredBy[1]     
    DISABLE(?RS:Score_2_1,?RS:TextResult_2_12)
    RS:EnteredBy[1] = gloInitials
    SELECT(?RS:Score_1_1)
  ELSIF ~RS:EnteredBy[2]     
    RS:EnteredBy[2] = gloInitials
    DISABLE(?RS:Score_1_1,?RS:TextResult_1_12)
    SELECT(?RS:Score_2_1) 
  ELSE ! IF RS:EnteredBy[1] AND RS:EnteredBy[2]    
    DISABLE(?RS:Score_1_1,?RS:TextResult_2_12)
  .
  
    
      LOOP locNdx = 1 TO 12
        IF RS:Code[locNdx] 
          RST:NUMBER = RS:Code[locNdx] 
          GET(Rast,RST:ORDER_KEY)
          locDescription[locNdx] = RST:DESCRIPTION
          locTestType[locNdx] = RS:TypeText[locNdx]
        ELSE
         locNdx -= 1
         locFirst = ?RS:Score_1_1 + (locNdx * 2)
         locLast  = ?RS:TextResult_1_12 
         HIDE(locFirst,loclast)
         locFirst = ?RS:Score_2_1 + (locNdx * 2)
         locLast  = ?RS:TextResult_2_12
         HIDE(locFirst,loclast)
         BREAK  
        .
      .
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Patient.Close
    Relate:Rast.Close
    Relate:ResultsSendout.Close
  END
  IF SELF.Opened
    INIMgr.Update('ResultsSendoutUpdate',QuickWindow)      ! Save window data to non-volatile store
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
      UPDATE(?)
      IF INRANGE(FIELD(),?RS:TextResult_1_1,?RS:TextResult_1_12)
        locFieldOffset = FIELD() - ?RS:TextResult_1_1 
        locField =  FIELD()
        locValueCol1 = locField{PROP:Use}
        locField = ?RS:TextResult_2_1 + locFieldOffset
        locValueCol2 = locField{PROP:Use}
        locField =  FIELD()
        IF LEN(CLIP(LEFT(locValueCol1))) > 0 AND LEN(CLIP(LEFT(locValueCol2))) > 0
          IF locValueCol1 <> locValueCol2
            SELECT(?)
            locField =  FIELD()
            locField{PROP:COLOR} = COLOR:Red 
            locField{PROP:FontColor} = COLOR:White
            locField{PROP:FontStyle} = FONT:bold
            BEEP(BEEP:SystemExclamation)
          ELSE
            locField{PROP:COLOR} = COLOR:White 
            locField{PROP:FontColor} = COLOR:Black
            locField{PROP:FontStyle} = FONT:bold
          .
        ELSE
          locField{PROP:COLOR} = COLOR:White 
          locField{PROP:FontColor} = COLOR:Black
          locField{PROP:FontStyle} = FONT:bold
        .
     ELSIF INRANGE(FIELD(),?RS:TextResult_2_1,?RS:TextResult_2_12)
       locFieldOffset = FIELD() - ?RS:TextResult_2_1 
       locField =  FIELD()
       locValueCol2 = locField{PROP:Use}
       locField = ?RS:TextResult_1_1 + locFieldOffset
       locValueCol1 = locField{PROP:Use}
       locField =  FIELD()
       IF LEN(CLIP(LEFT(locValueCol1))) > 0 AND LEN(CLIP(LEFT(locValueCol2))) > 0
         IF locValueCol1 <> locValueCol2
           SELECT(?)
           locField{PROP:COLOR} = COLOR:Red
           locField{PROP:FontColor} = COLOR:White
           locField{PROP:FontStyle} = FONT:bold
           BEEP(BEEP:SystemExclamation)
         ELSE
           locField{PROP:COLOR} = COLOR:White 
           locField{PROP:FontColor} = COLOR:Black
           locField{PROP:FontStyle} = FONT:bold
         .
       ELSE
         locField{PROP:COLOR} = COLOR:White 
         locField{PROP:FontColor} = COLOR:Black
         locField{PROP:FontStyle} = FONT:bold
       .
     .
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
LabelSetup PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Label Setup'),AT(0,0,508,325),FONT('Arial',11,,FONT:regular,CHARSET:DEFAULT),RESIZE, |
  ICON('Allermetrix.ico'),GRAY,IMM,MDI,HLP('LabelSetup'),SYSTEM
                       SPIN(@n3),AT(409,126,42,11),USE(gloPlateBarcodeWidth),FONT(,,,FONT:bold),RIGHT(4),HVSCROLL, |
  RANGE(1,10),STEP(1)
                       ENTRY(@n3),AT(132,36),USE(gloLabelXpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(132,57),USE(gloLabelYpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(158,127,,10),USE(gloPlateBarcodeXpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(187,127,,10),USE(gloPlateBarcodeYpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(215,127,24,9),USE(gloPlateBarcode2Ypos),FONT(,,,FONT:bold+FONT:italic),RIGHT
                       ENTRY(@n3),AT(244,127,24,9),USE(gloPlateBarcode3Ypos),FONT(,,,FONT:bold+FONT:italic),RIGHT
                       OPTION('Rotation'),AT(278,118,77,20),USE(gloPlateBarcodeRotation),FONT(,,,FONT:bold),BOXED, |
  TRN
                         RADIO('None'),AT(284,126),USE(?GLOPLATEBARCODEROTATION:None),TRN,VALUE('0')
                         RADIO('90'),AT(319,127),USE(?GLOPLATEBARCODEROTATION:90),TRN,VALUE('1')
                       END
                       ENTRY(@n3),AT(377,125),USE(gloPlateBarcodeHeight),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(158,143,,10),USE(gloPlateNameXpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(187,143,,10),USE(gloPlateNameYpos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(215,143,24,9),USE(gloPlateName2Ypos),FONT(,,,FONT:bold),RIGHT
                       ENTRY(@n3),AT(244,143,24,9),USE(gloPlateName3Ypos),FONT(,,,FONT:bold),RIGHT
                       OPTION('Rotation'),AT(280,143,77,34),USE(gloPlateNameRotation),FONT(,,,FONT:bold),BOXED
                         RADIO(' None'),AT(285,152),USE(?OPTION1:RADIO1),TRN,VALUE('0')
                         RADIO(' 90'),AT(320,152),USE(?GLOPLATENAMEROTATION:90),TRN,VALUE('1')
                         RADIO(' 180'),AT(285,163),USE(?GLOPLATENAMEROTATION:180),TRN,VALUE('2')
                         RADIO(' 270'),AT(320,163),USE(?GLOPLATENAMEROTATION:270),TRN,VALUE('3')
                       END
                       OPTION('Font'),AT(377,140,74,66),USE(gloPlateNameFont),FONT(,,,FONT:bold),BOXED,TRN
                         RADIO(' 7pt'),AT(401,159),USE(?GLOPLATENAMEFONT:Medium),TRN,VALUE('2')
                         RADIO(' 6 pt'),AT(401,149,27,10),USE(?GLOPLATENAMEFONT:Small),TRN,VALUE('1')
                         RADIO(' 12 pt'),AT(401,180),USE(?GLOPLATENAMEFONT:XL),TRN,VALUE('4')
                         RADIO(' 10 pt'),AT(401,170),USE(?GLOPLATENAMEFONT:Large),TRN,VALUE('3')
                         RADIO(' 24 pt'),AT(401,191),USE(?GLOPLATENAMEFONT:XXL),TRN,VALUE('5')
                       END
                       STRING('Height'),AT(377,114,26),USE(?STRING10),FONT(,,,FONT:bold),CENTER,TRN
                       BUTTON('&OK'),AT(425,275,67,25),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(331,275,67,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Help'),AT(250,181,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING('Barcode X Position'),AT(58,39,70),USE(?STRING1),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING('Barcode Y Position'),AT(60,57),USE(?STRING2),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING('Plate Barcode Position'),AT(61,127),USE(?STRING3),FONT(,,,FONT:bold),TRN
                       STRING('Plate Name Position'),AT(61,143),USE(?STRING4),FONT(,,,FONT:bold),TRN
                       STRING('X'),AT(168,116),USE(?STRING6),FONT(,,,FONT:bold),TRN
                       STRING('Y1'),AT(197,116),USE(?STRING7),FONT(,,,FONT:bold),TRN
                       LINE,AT(68,84,360,0),USE(?LINE1),COLOR(COLOR:Black)
                       STRING('Patient Labels'),AT(19,6,101),USE(?STRING8),FONT(,24,,FONT:bold,CHARSET:ANSI),TRN
                       STRING('Plate Labels'),AT(19,98),USE(?STRING9),FONT(,24,,FONT:bold,CHARSET:ANSI),TRN
                       STRING('Y2'),AT(215,116,26),USE(?STRING5),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Y3'),AT(243,116,26),USE(?STRING11),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Width'),AT(408,114,42),USE(?STRING12),FONT(,,,FONT:bold),CENTER,TRN
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
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
  GlobalErrors.SetProcedureName('LabelSetup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?gloPlateBarcodeWidth
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
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  0{PROP:Wallpaper}= gloWallpaper
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
    OF ?Ok
        PUTINI('label','BarcodeXpos',gloLabelXpos,'ALIS.INI')
        PUTINI('label','BarcodeYpos',gloLabelYpos,'ALIS.INI')
        PUTINI('label','PlateBarcodeXpos',gloPlateBarcodeXpos,'ALIS.INI')
        PUTINI('label','PlateBarcodeYpos',gloPlateBarcodeYpos,'ALIS.INI')
        PUTINI('label','PlateBarcode2Ypos',gloPlateBarcode2Ypos,'ALIS.INI')
        PUTINI('label','PlateBarcode3Ypos',gloPlateBarcode3Ypos,'ALIS.INI')
        PUTINI('label','PlateBarcodeRotation',gloPlateBarcodeRotation,'ALIS.INI')
        PUTINI('label','PlateNameRotation',gloPlateNameRotation,'ALIS.INI')
        PUTINI('label','PlateNameFont',gloPlateNameFont,'ALIS.INI')
        PUTINI('label','PlateNameXpos',gloPlateNameXpos,'ALIS.INI')
        PUTINI('label','PlateNameYpos',gloPlateNameYpos,'ALIS.INI')
        PUTINI('label','PlateName2Ypos',gloPlateName2Ypos,'ALIS.INI')
        PUTINI('label','PlateName3Ypos',gloPlateName3Ypos,'ALIS.INI')
        PUTINI('label','PlateBarcodeHeight',gloPlateBarcodeHeight,'ALIS.INI')
        PUTINI('label','PlateNameFont',gloPlateNameFont,'ALIS.INI')
        PUTINI('label','PlateBarcodeWidth',gloPlateBarcodeWidth,'ALIS.INI')
      
      
      
    END
  ReturnValue = PARENT.TakeAccepted()
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

