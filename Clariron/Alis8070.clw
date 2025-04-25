

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8070.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8012.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8071.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8077.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form SendOuts
!!! </summary>
UpdateSendout PROCEDURE 

locValueCol1         BYTE                                  !
locValueCol2         BYTE                                  !
locField             BYTE                                  !
locFieldOffset       BYTE                                  !
CurrentTab           STRING(80)                            !
locResult            REAL                                  !
locMatch             BYTE                                  !
locNext              BYTE                                  !
locblank             BYTE                                  !
locNdx               BYTE                                  !
ActionMessage        CSTRING(40)                           !
locTestType          STRING(4)                             !
locPatientName       STRING(32)                            !
BRW6::View:Browse    VIEW(Test)
                       PROJECT(TST:CODE)
                       PROJECT(TST:STATUS)
                       PROJECT(TST:RANGE)
                       PROJECT(TST:COUNT)
                       PROJECT(TST:Score)
                       PROJECT(TST:INVOICE)
                       PROJECT(TST:TYPE)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
TST:CODE               LIKE(TST:CODE)                 !List box control field - type derived from field
TST:CODE_Style         LONG                           !Field style
TST:STATUS             LIKE(TST:STATUS)               !List box control field - type derived from field
TST:STATUS_Style       LONG                           !Field style
RST:DESCRIPTION        LIKE(RST:DESCRIPTION)          !List box control field - type derived from field
RST:DESCRIPTION_Style  LONG                           !Field style
locTestType            LIKE(locTestType)              !List box control field - type derived from local data
locTestType_Style      LONG                           !Field style
TST:RANGE              LIKE(TST:RANGE)                !List box control field - type derived from field
TST:RANGE_Style        LONG                           !Field style
TST:COUNT              LIKE(TST:COUNT)                !List box control field - type derived from field
TST:COUNT_Style        LONG                           !Field style
TST:Score              LIKE(TST:Score)                !List box control field - type derived from field
TST:Score_Style        LONG                           !Field style
TST:INVOICE            LIKE(TST:INVOICE)              !Browse key field - type derived from field
TST:TYPE               LIKE(TST:TYPE)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
History::SO:Record   LIKE(SO:RECORD),THREAD
QuickWindow          WINDOW,AT(,,506,330),FONT('Arial',11,COLOR:Black,FONT:regular),CENTER,GRAY,IMM,MDI,HLP('UpdateSendout'), |
  SYSTEM
                       LIST,AT(143,50,254,120),USE(?List),ALRT(MouseCenter),FORMAT('36L(2)|MY~Code~@s9@8C|MY~S' & |
  '~@s1@90L(2)|MY~Description~@s40@20L(2)|MY~Type~C(0)@s4@36R(2)|MY~Range~L(2)@s9@32R(2' & |
  ')|MY~Count~L(2)@n-13.2@12C(2)|MY~Score~C(0)@s3@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  SKIP,TRN
                       BUTTON('Remove From To Do'),AT(174,253,139,27),USE(?Button3),FONT(,10,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  TRN
                       BUTTON('Done'),AT(416,288,70,25),USE(?OK),FONT(,10,,FONT:bold),LEFT,ICON('WAOK.ICO'),DEFAULT, |
  MSG('Accept data and close the window'),STD(STD:Close),TIP('Accept data and close the window'), |
  TRN
                       IMAGE('button.jpg'),AT(174,253,139,27),USE(?Image2)
                       IMAGE('button.jpg'),AT(416,288,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(145,264,25,16),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),HIDE,MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                       STRING(@p### ###p),AT(148,18),USE(SO:Patient),FONT(,12,COLOR:Aqua,FONT:bold),TRN
                       STRING(@s32),AT(196,18,162),USE(locPatientName),FONT(,12,COLOR:Aqua,FONT:bold),TRN
                       STRING(@p### ###p),AT(148,29),USE(CLI:NUMBER),FONT(,12,COLOR:Aqua,FONT:bold),TRN
                       STRING(@s25),AT(196,29),USE(CLI:LAST),FONT(,12,COLOR:Aqua,FONT:bold),TRN
                       BUTTON('Print'),AT(416,253,70,25),USE(?ButtonPrint),FONT(,10,,FONT:bold),LEFT,ICON(ICON:Print), |
  TRN
                       BUTTON('Results'),AT(174,288,139,27),USE(?ButtonUpdateresults),FONT(,10,,FONT:bold+FONT:underline), |
  TRN
                       IMAGE('button.jpg'),AT(174,288,139,27),USE(?Image2:2)
                       IMAGE('button.jpg'),AT(416,253,70,25),USE(?IMAGE3)
                       PROMPT('Date:'),AT(200,194),USE(?SO:Date:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@D1),AT(222,193,60,10),USE(SO:Date),FONT(,,,FONT:bold),LEFT(1)
                       PROMPT('Send Out'),AT(170,205,48),USE(?Pat:HSA4:Prompt),FONT(,,,FONT:bold),RIGHT,TRN
                       ENTRY(@D1),AT(222,204,60,10),USE(Pat:HSA4),FONT(,,,FONT:bold),LEFT(1)
                     END

BRW6::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

BRW6                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
UpdateViewRecord       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
locSTypes STRING('IgGIgAIgM')
locSType  STRING(3),DIM(3),OVER(locSTypes)

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = gloListFont
  ?List{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List{PROPSTYLE:BackSelected, 1}  = gloListBgColor
  !------------------------------------
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
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateSendout')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?List
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locTestType',locTestType)                          ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SO:Record,History::SO:Record)
  SELF.AddHistoryField(?SO:Patient,1)
  SELF.AddHistoryField(?SO:Date,2)
  SELF.AddUpdateFile(Access:SendOuts)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:ResultsSendout.Open                               ! File ResultsSendout used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Primary &= Relate:SendOuts
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.InsertAction = Insert:None                        ! Inserts not allowed
    SELF.DeleteAction = Delete:Auto                        ! Automatic deletions
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel                      ! No confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  BRW6.Init(?List,Queue:Browse.ViewPosition,BRW6::View:Browse,Queue:Browse,Relate:Test,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?Button3)
    ?SO:Patient{PROP:ReadOnly} = True
    DISABLE(?ButtonPrint)
    DISABLE(?ButtonUpdateresults)
    ?SO:Date{PROP:ReadOnly} = True
    ?Pat:HSA4{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW6.Q &= Queue:Browse
  BRW6.AddSortOrder(,TST:ORDER_KEY)                        ! Add the sort order for TST:ORDER_KEY for sort order 1
  BRW6.AddRange(TST:INVOICE,SO:Patient)                    ! Add single value range limit for sort order 1
  BRW6.SetFilter('(TST:Status <<> ''X'')')                 ! Apply filter expression to browse
  BRW6.AddField(TST:CODE,BRW6.Q.TST:CODE)                  ! Field TST:CODE is a hot field or requires assignment from browse
  BRW6.AddField(TST:STATUS,BRW6.Q.TST:STATUS)              ! Field TST:STATUS is a hot field or requires assignment from browse
  BRW6.AddField(RST:DESCRIPTION,BRW6.Q.RST:DESCRIPTION)    ! Field RST:DESCRIPTION is a hot field or requires assignment from browse
  BRW6.AddField(locTestType,BRW6.Q.locTestType)            ! Field locTestType is a hot field or requires assignment from browse
  BRW6.AddField(TST:RANGE,BRW6.Q.TST:RANGE)                ! Field TST:RANGE is a hot field or requires assignment from browse
  BRW6.AddField(TST:COUNT,BRW6.Q.TST:COUNT)                ! Field TST:COUNT is a hot field or requires assignment from browse
  BRW6.AddField(TST:Score,BRW6.Q.TST:Score)                ! Field TST:Score is a hot field or requires assignment from browse
  BRW6.AddField(TST:INVOICE,BRW6.Q.TST:INVOICE)            ! Field TST:INVOICE is a hot field or requires assignment from browse
  BRW6.AddField(TST:TYPE,BRW6.Q.TST:TYPE)                  ! Field TST:TYPE is a hot field or requires assignment from browse
  BRW6.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  Pat:INVOICE = SO:Patient
  GET(Patient,Pat:INVOICE_KEY)
  locPatientName = CLIP(Pat:LAST) & ', ' &  Pat:FIRST
  CLI:Number =  Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)
  BRW6::AutoSizeColumn.Init()
  BRW6::AutoSizeColumn.AddListBox(?List,Queue:Browse)
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
    Relate:Panels.Close
    Relate:Rast.Close
    Relate:ResultsSendout.Close
    Relate:SendOuts.Close
    Relate:Test.Close
  END
  BRW6::AutoSizeColumn.Kill()
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
    OF ?Button3
      ThisWindow.Update
      DELETE(Sendouts)
      SELF.Request = DeleteRecord
      POST(EVENT:CloseWindow)
    OF ?OK
      ThisWindow.Update
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    OF ?ButtonPrint
      ThisWindow.Update
      SummarySendouts()
      ThisWindow.Reset
    OF ?ButtonUpdateresults
      ThisWindow.Update
      RS:Patient = Pat:INVOICE
      GET(ResultsSendout,RS:OrderKey)
      IF ERRORCODE() 
        CLEAR(RS:Record)
        RS:Patient = Pat:INVOICE
        ADD(ResultsSendout)
        IF ERRORCODE() THEN STOP('RS: ADD ' & ERROR()).
      .
      CLEAR(TST:Record)
      TST:INVOICE = Pat:INVOICE
      SET(TST:ORDER_KEY,TST:ORDER_KEY)
      LOOP
        NEXT(Test)
        IF ERRORCODE() OR TST:INVOICE <> Pat:INVOICE THEN BREAK.
        IF ~TST:TYPE OR TST:STATUS = 'X' THEN CYCLE.
        LOOP locblank = 1 TO 12
          IF ~RS:Code[locblank] THEN BREAK.
        .
        LOOP locNdx = 1 TO 12
          IF RS:Code[locNdx] = TST:CODE AND RS:Type[locNdx] = TST:Type
            BREAK 
          .
        .
      
        IF locNdx > 12 
          RS:Code[locblank] = TST:CODE  
          RS:Type[locblank] = TST:Type
          IF gloTestCodeStartsWith2 = 'S0'
            RS:TypeText[locblank] = gloTypeDescription[TST:Type]
          ELSIF INRANGE(TST:CODE[4:4],'4','6')
            RS:TypeText[locblank] = locSType[VAL(TST:CODE[4:4]) - 51]
          ELSE
            RS:TypeText[locblank] = ''
          .
      
          IF TST:Status = 'C'
            RS:Score[1,locblank] = TST:Score
            RS:Score[2,locblank] = TST:Score
            IF LEN(CLIP(LEFT(TST:RANGE))) > 0 
              RS:TextResult[1,locblank] = TST:Range
              RS:TextResult[2,locblank] = TST:Range
            .
          .
        .
      .
      PUT(ResultsSendout)
      GlobalRequest = ChangeRecord
      ResultsSendoutUpdate()
      IF GlobalResponse = RequestCompleted
        LOOP locNdx = 1 TO 12
          IF ~RS:Code[locNdx] THEN CYCLE.
          TST:INVOICE = Pat:INVOICE
          TST:CODE = RS:Code[locNdx]  
          TST:TYPE = RS:Type[locNdx]  
          GET(Test,TST:ORDER_KEY)
          IF ERRORCODE()
            stop(locNdx & ') ' & TST:CODE & ' TYPE=' & TST:TYPE & ' Result1=' & RS:TextResult[1,locNdx] & ' Result2=' & RS:TextResult[2,locNdx] & ': ' & error())
            CYCLE
          .
          RS:TextResult[1,locNdx] = CLIP(LEFT(RS:TextResult[1,locNdx]))
          RS:TextResult[2,locNdx] = CLIP(LEFT(RS:TextResult[2,locNdx]))
          IF LEN(CLIP(RS:TextResult[1,locNdx])) > 0 AND  RS:TextResult[1,locNdx] = RS:TextResult[2,locNdx] AND  RS:Score[1,locNdx] = RS:Score[2,locNdx] 
            TST:STATUS = 'C' 
            TST:Score = RS:Score[1,locNdx]
            locResult = RS:TextResult[1,locNdx]
            TST:Range = RS:TextResult[1,locNdx]
            IF gloTestCodeStartsWith2 = 'S0' OR gloTestCodeStartsWith2 = 'S1'
              IF TST:TYPE = TYPE:IgE
                TST:COUNT = locResult
                IF TST:COUNT < 500
                  TST:Score = '0'
                ELSIF TST:COUNT < 751
                  TST:Score = '0/1'
                ELSIF TST:COUNT < 1601
                  TST:Score = '1'
                ELSIF TST:COUNT < 3601
                  TST:Score = '2'
                ELSIF TST:COUNT < 8001
                  TST:Score = '3'
                ELSIF TST:COUNT < 18001
                  TST:Score = '4'
                ELSE 
                  TST:Score = '5'
                .
              ELSIF TST:TYPE = TYPE:IgG4
                TST:COUNT = locResult
                IF TST:COUNT < .15
                  TST:Score = '0'
                ELSIF TST:COUNT < .41
                  TST:Score = '1'
                ELSIF TST:COUNT < 2.01
                  TST:Score = '2'
                ELSIF TST:COUNT < 10.01
                  TST:Score = '3'
                ELSIF TST:COUNT < 50.01
                  TST:Score = '4'
                ELSE 
                  TST:Score = '5'
                .
              .
            ELSE
              TST:Score = RS:Score[1,locNdx]
            .
          ELSE
            TST:STATUS = 'L'
          .
          PUT(Test)
        .
        BRW6.ResetQueue(1)
        BRW6.PostNewSelection
       .
    OF ?Pat:HSA4
      PUT(Patient)
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
  IF BRW6::AutoSizeColumn.TakeEvents()
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
    OF EVENT:AlertKey
      GET(Test,TST:Order_Key)
      globalRequest = ChangeRecord
      UpdateTest
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


BRW6.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.TST:CODE_Style = 1 ! 
  SELF.Q.TST:STATUS_Style = 1 ! 
  SELF.Q.RST:DESCRIPTION_Style = 1 ! 
  SELF.Q.locTestType_Style = 1 ! 
  SELF.Q.TST:RANGE_Style = 1 ! 
  SELF.Q.TST:COUNT_Style = 1 ! 
  SELF.Q.TST:Score_Style = 1 ! 


BRW6.UpdateViewRecord PROCEDURE

  CODE
  PARENT.UpdateViewRecord
  !


BRW6.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW6::RecordStatus   BYTE,AUTO
  CODE
    RST:NUMBER = TST:Code
    GET(Rast,RST:Order_Key)
    IF INRANGE(TST:TYPE,1,6)
      RST:NUMBER = TST:CODE
      GET(Rast,RST:ORDER_KEY)
      IF gloTestCodeStartsWith2 = 'S0'
        locTestType = gloTypeDescription[TST:Type]
      ELSIF INRANGE(TST:CODE[4:4],'4','6')
        locTestType = locSType[VAL(TST:CODE[4:4]) - 51]
      ELSE
        locTestType = ''
      .
    ELSIF TST:TYPE = 0
     locTestType = ''
     Pan:NUMBER =  TST:CODE
     GET(Panels,Pan:ORDER_KEY)
     IF ERRORCODE()
       RST:DESCRIPTION = 'Not Found'
     ELSE
       RST:DESCRIPTION = Pan:DESCRIPTION
     .
    .
  ReturnValue = PARENT.ValidateRecord()
  BRW6::RecordStatus=ReturnValue
  RETURN ReturnValue

