

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8077.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8018.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8076.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
MakeNewTest          PROCEDURE                             ! Declare Procedure

  CODE
  OPEN(Test)
  if errorcode() then stop('tst: ' & error()).
  CREATE(TestMem)
  if errorcode() then stop('create ' & error()).
  OPEN(TestMem)
  if errorcode() then stop('open ' & error()).
  STREAM(TestMem)
    stop('start make TestNew')
    T# = clock()
    clear(TST:record)
    TST:INVOICE = 180000
    set(TST:ORDER_KEY,TST:ORDER_KEY)
    loop until eof(Test)
      NEXT(Test) 
      OMIT('XXX')
      TM:INVOICE = TST:INVOICE
      TM:ORDER = TST:ORDER
      TM:CODE = TST:CODE
      TM:TYPE = TST:TYPE
      TM:RANGE = TST:RANGE
      TM:COUNT = TST:COUNT
      TM:SCORE = TST:SCORE
      TM:STATUS = TST:STATUS
      TM:MODIFIER = TST:MODIFIER
      TM:FEE = TST:FEE
      TM:DATE = TST:DATE
      XXX
      TM:Record = TST:Record
      append(TestMem)
    .
    FLUSH(TestMem)
    BUILD(TestMem) 
    if errorcode() then stop('build: ' & error()).
    stop('done, made TestNew.tps # of recs=' & records(TestMem) & ', time to create=' & format( clock() - T#,@t4))
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Verify PROCEDURE (prmPatient)

CurrentTab           STRING(80)                            !
locPanelOrder        LONG                                  !
locSaveIgE           LONG                                  !
locSaveIgG           LONG                                  !
locSaveIgG4          LONG                                  !
locIgE               LONG                                  !
locIgG               LONG                                  !
locIgG4              LONG                                  !
locSelectedIgE       LONG                                  !
locSelectedIgG4      LONG                                  !
locSelectedIgG       LONG                                  !
locSelectedCode      STRING(4)                             !
locCode              STRING(4)                             !
CodeSort             QUEUE,PRE(CS)                         !
Code                 STRING(4)                             !
Sort                 LONG                                  !
                     END                                   !
BRW1::View:Browse    VIEW(VerifyPatient)
                       PROJECT(VP:Code)
                       PROJECT(VP:Description)
                       PROJECT(VP:IgE)
                       PROJECT(VP:IgG4)
                       PROJECT(VP:IgG)
                       PROJECT(VP:Order)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
VP:Code                LIKE(VP:Code)                  !List box control field - type derived from field
VP:Description         LIKE(VP:Description)           !List box control field - type derived from field
VP:IgE                 LIKE(VP:IgE)                   !List box control field - type derived from field
VP:IgE_NormalFG        LONG                           !Normal forground color
VP:IgE_NormalBG        LONG                           !Normal background color
VP:IgE_SelectedFG      LONG                           !Selected forground color
VP:IgE_SelectedBG      LONG                           !Selected background color
VP:IgG4                LIKE(VP:IgG4)                  !List box control field - type derived from field
VP:IgG4_NormalFG       LONG                           !Normal forground color
VP:IgG4_NormalBG       LONG                           !Normal background color
VP:IgG4_SelectedFG     LONG                           !Selected forground color
VP:IgG4_SelectedBG     LONG                           !Selected background color
VP:IgG                 LIKE(VP:IgG)                   !List box control field - type derived from field
VP:IgG_NormalFG        LONG                           !Normal forground color
VP:IgG_NormalBG        LONG                           !Normal background color
VP:IgG_SelectedFG      LONG                           !Selected forground color
VP:IgG_SelectedBG      LONG                           !Selected background color
VP:Order               LIKE(VP:Order)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW,AT(0,0,507,330),FONT('Arial',11),GRAY,MDI,HLP('Verify'),SYSTEM
                       LIST,AT(98,3,254,309),USE(?Browse:1),FONT(,11,,FONT:bold,CHARSET:ANSI),VSCROLL,FORMAT('43L(2)|M~C' & |
  'ode~@s8@105L(2)|M~Description~@s32@24C(2)|M*~IgE~C(0)@n1@E(00FFFFFFH,00FFFFFFH,,)27C' & |
  '(2)|M*~IgG4~C(0)@n1@E(00FFFFFFH,00FFFFFFH,,)22C(2)|M*~IgG~C(0)@n1@E(00FFFFFFH,00FFFF' & |
  'FFH,,)31R(2)|M~Order~C(0)@n3@64R(2)|M~Test~C(0)@n-14@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Verify file')
                       BUTTON('&Select'),AT(446,286,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(452,307,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(442,199,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(442,220,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(444,239,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,HIDE,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       BUTTON('&Close'),AT(382,200,60,25),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(448,263,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       CHECK('IgE'),AT(380,39,50,17),USE(locIgE),COLOR(COLOR:Red),ICON(ICON:None),HIDE,TRN
                       CHECK('IgG4'),AT(380,57,50,17),USE(locIgG4),COLOR(COLOR:Blue),ICON(ICON:None),HIDE,TRN
                       CHECK('IgG'),AT(380,74,50,17),USE(locIgG),COLOR(COLOR:Yellow),ICON(ICON:None),HIDE,TRN
                       ENTRY(@s4),AT(390,25),USE(locCode),UPR,HIDE
                       BUTTON,AT(442,39),USE(?AddButton),ICON('SteelAdd.ico'),HIDE
                       CHECK('IgE'),AT(380,117,50,17),USE(locSelectedIgE),COLOR(COLOR:Red),ICON(ICON:None),HIDE,TRN
                       CHECK('IgG4'),AT(380,134,50,17),USE(locSelectedIgG4),COLOR(COLOR:Blue),ICON(ICON:None),HIDE, |
  TRN
                       CHECK('IgG'),AT(380,152,50,17),USE(locSelectedIgG),COLOR(COLOR:Yellow),ICON(ICON:None),HIDE, |
  TRN
                       ENTRY(@s4),AT(394,104),USE(locSelectedCode),FONT(,,,FONT:bold),HIDE,READONLY,TRN
                       BUTTON,AT(442,122),USE(?EditButton),ICON('SteelDelta.ico'),HIDE
                       CHECK,AT(362,117,12,17),USE(locSaveIgE),COLOR(COLOR:Red),ICON(ICON:None),FLAT,HIDE,READONLY, |
  TRN
                       CHECK,AT(362,134,12,17),USE(locSaveIgG4),COLOR(COLOR:Blue),ICON(ICON:None),FLAT,HIDE,READONLY, |
  TRN
                       CHECK,AT(362,152,12,17),USE(locSaveIgG),COLOR(COLOR:Yellow),ICON(ICON:None),FLAT,HIDE,READONLY, |
  TRN
                       BUTTON('Save Changes and Exit'),AT(379,176),USE(?SaveButton)
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
FillList ROUTINE  
  SET(VP:OrderKey)
  LOOP UNTIL EOF(VerifyPatient)
    NEXT(VerifyPatient)
    DELETE(VerifyPatient)
  .
    SHARE(Test)
    CLEAR(TST:Record)
    TST:INVOICE = prmPatient
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP UNTIL EOF(Test)
      NEXT(Test)
      IF TST:Invoice <> prmPatient THEN BREAK.
      VP:Code = TST:CODE
      GET(VerifyPatient,VP:CodeKey)
      IF ERRORCODE()
        VP:IgE  = 0 
        VP:IgG  = 0 
        VP:IgG4 = 0 
        VP:saveIgE  = 0 
        VP:saveIgG  = 0 
        VP:saveIgG4 = 0 
        EXECUTE TST:TYPE
          VP:IgE  = 1 
          VP:IgG  = 1 
          VP:IgG4 = 1 
        .
        EXECUTE TST:TYPE
          VP:saveIgE  = 1 
          VP:saveIgG  = 1 
          VP:saveIgG4 = 1 
        .
        VP:Code = TST:Code
        IF TST:TYPE = 0
          VP:Order = 0
          PAN:NUMBER = TST:CODE
          GET(Panels,Pan:ORDER_KEY)
          IF ERRORCODE()
            VP:Description = ERROR()
          ELSE
            VP:Description = PAN:DESCRIPTION
         .
        ELSE
          CS:Code = TST:CODE
          GET(CodeSort,CS:Code)
          IF ERRORCODE()
            VP:Order = 0
          ELSE 
            VP:Order = CS:Sort
          .
          RST:Number = TST:CODE
          GET(RAST,RST:ORDER_KEY)
          IF ERRORCODE()
            VP:Description = ERROR()
          ELSE
            VP:Description = RST:DESCRIPTION
          .
        .
        
        ADD(VerifyPatient)
        IF ERRORCODE() THEN STOP('ADD VERIFY ' & ERROR()).
      ELSE
        EXECUTE TST:TYPE
          VP:IgE  = 1 
          VP:IgG  = 1 
          VP:IgG4 = 1 
        .
        EXECUTE TST:TYPE
          VP:saveIgE  = 1 
          VP:saveIgG  = 1 
          VP:saveIgG4 = 1 
        .
        PUT(VerifyPatient)
      .
    .
    CLOSE(Test)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Verify')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  
    
  CS:Code = 'C005'
  CS:Sort = 511
  ADD(CodeSort,CS:Code)
  CS:Code = 'C006'
  CS:Sort = 491
  ADD(CodeSort,CS:Code)
  CS:Code = 'C007'
  CS:Sort = 510
  ADD(CodeSort,CS:Code)
  CS:Code = 'D001'
  CS:Sort = 5
  ADD(CodeSort,CS:Code)
  CS:Code = 'D002'
  CS:Sort = 4
  ADD(CodeSort,CS:Code)
  CS:Code = 'E001'
  CS:Sort = 11
  ADD(CodeSort,CS:Code)
  CS:Code = 'E004'
  CS:Sort = 13
  ADD(CodeSort,CS:Code)
  CS:Code = 'E005'
  CS:Sort = 14
  ADD(CodeSort,CS:Code)
  CS:Code = 'E008'
  CS:Sort = 18
  ADD(CodeSort,CS:Code)
  CS:Code = 'E009'
  CS:Sort = 23
  ADD(CodeSort,CS:Code)
  CS:Code = 'E010'
  CS:Sort = 29
  ADD(CodeSort,CS:Code)
  CS:Code = 'E011'
  CS:Sort = 27
  ADD(CodeSort,CS:Code)
  CS:Code = 'E012'
  CS:Sort = 28
  ADD(CodeSort,CS:Code)
  CS:Code = 'E013'
  CS:Sort = 26
  ADD(CodeSort,CS:Code)
  CS:Code = 'E014'
  CS:Sort = 37
  ADD(CodeSort,CS:Code)
  CS:Code = 'E015'
  CS:Sort = 33
  ADD(CodeSort,CS:Code)
  CS:Code = 'E070'
  CS:Sort = 21
  ADD(CodeSort,CS:Code)
  CS:Code = 'E071'
  CS:Sort = 30
  ADD(CodeSort,CS:Code)
  CS:Code = 'E072'
  CS:Sort = 31
  ADD(CodeSort,CS:Code)
  CS:Code = 'E073'
  CS:Sort = 36
  ADD(CodeSort,CS:Code)
  CS:Code = 'E082'
  CS:Sort = 35
  ADD(CodeSort,CS:Code)
  CS:Code = 'E085'
  CS:Sort = 19
  ADD(CodeSort,CS:Code)
  CS:Code = 'E086'
  CS:Sort = 20
  ADD(CodeSort,CS:Code)
  CS:Code = 'E100'
  CS:Sort = 24
  ADD(CodeSort,CS:Code)
  CS:Code = 'E101'
  CS:Sort = 25
  ADD(CodeSort,CS:Code)
  CS:Code = 'E102'
  CS:Sort = 34
  ADD(CodeSort,CS:Code)
  CS:Code = 'E103'
  CS:Sort = 12
  ADD(CodeSort,CS:Code)
  CS:Code = 'E111'
  CS:Sort = 32
  ADD(CodeSort,CS:Code)
  CS:Code = 'EZ04'
  CS:Sort = 16
  ADD(CodeSort,CS:Code)
  CS:Code = 'EZ06'
  CS:Sort = 6
  ADD(CodeSort,CS:Code)
  CS:Code = 'EZ06'
  CS:Sort = 15
  ADD(CodeSort,CS:Code)
  CS:Code = 'EZ07'
  CS:Sort = 17
  ADD(CodeSort,CS:Code)
  CS:Code = 'EZ12'
  CS:Sort = 22
  ADD(CodeSort,CS:Code)
  CS:Code = 'F001'
  CS:Sort = 120
  ADD(CodeSort,CS:Code)
  CS:Code = 'F002'
  CS:Sort = 161
  ADD(CodeSort,CS:Code)
  CS:Code = 'F003'
  CS:Sort = 102
  ADD(CodeSort,CS:Code)
  CS:Code = 'F004'
  CS:Sort = 259
  ADD(CodeSort,CS:Code)
  CS:Code = 'F005'
  CS:Sort = 222
  ADD(CodeSort,CS:Code)
  CS:Code = 'F006'
  CS:Sort = 49
  ADD(CodeSort,CS:Code)
  CS:Code = 'F007'
  CS:Sort = 176
  ADD(CodeSort,CS:Code)
  CS:Code = 'F008'
  CS:Sort = 105
  ADD(CodeSort,CS:Code)
  CS:Code = 'F009'
  CS:Sort = 220
  ADD(CodeSort,CS:Code)
  CS:Code = 'F010'
  CS:Sort = 229
  ADD(CodeSort,CS:Code)
  CS:Code = 'F011'
  CS:Sort = 144
  ADD(CodeSort,CS:Code)
  CS:Code = 'F012'
  CS:Sort = 190
  ADD(CodeSort,CS:Code)
  CS:Code = 'F013'
  CS:Sort = 192
  ADD(CodeSort,CS:Code)
  CS:Code = 'F014'
  CS:Sort = 233
  ADD(CodeSort,CS:Code)
  CS:Code = 'F015'
  CS:Sort = 59
  ADD(CodeSort,CS:Code)
  CS:Code = 'F016'
  CS:Sort = 249
  ADD(CodeSort,CS:Code)
  CS:Code = 'F017'
  CS:Sort = 140
  ADD(CodeSort,CS:Code)
  CS:Code = 'F018'
  CS:Sort = 66
  ADD(CodeSort,CS:Code)
  CS:Code = 'F019'
  CS:Sort = 40
  ADD(CodeSort,CS:Code)
  CS:Code = 'F020'
  CS:Sort = 39
  ADD(CodeSort,CS:Code)
  CS:Code = 'F021'
  CS:Sort = 208
  ADD(CodeSort,CS:Code)
  CS:Code = 'F022'
  CS:Sort = 75
  ADD(CodeSort,CS:Code)
  CS:Code = 'F023'
  CS:Sort = 95
  ADD(CodeSort,CS:Code)
  CS:Code = 'F024'
  CS:Sort = 230
  ADD(CodeSort,CS:Code)
  CS:Code = 'F025'
  CS:Sort = 247
  ADD(CodeSort,CS:Code)
  CS:Code = 'F026'
  CS:Sort = 210
  ADD(CodeSort,CS:Code)
  CS:Code = 'F027'
  CS:Sort = 60
  ADD(CodeSort,CS:Code)
  CS:Code = 'F028'
  CS:Sort = 178
  ADD(CodeSort,CS:Code)
  CS:Code = 'F029'
  CS:Sort = 68
  ADD(CodeSort,CS:Code)
  CS:Code = 'F030'
  CS:Sort = 97
  ADD(CodeSort,CS:Code)
  CS:Code = 'F031'
  CS:Sort = 80
  ADD(CodeSort,CS:Code)
  CS:Code = 'F032'
  CS:Sort = 41
  ADD(CodeSort,CS:Code)
  CS:Code = 'F033'
  CS:Sort = 182
  ADD(CodeSort,CS:Code)
  CS:Code = 'F035'
  CS:Sort = 212
  ADD(CodeSort,CS:Code)
  CS:Code = 'F036'
  CS:Sort = 101
  ADD(CodeSort,CS:Code)
  CS:Code = 'F040'
  CS:Sort = 250
  ADD(CodeSort,CS:Code)
  CS:Code = 'F041'
  CS:Sort = 225
  ADD(CodeSort,CS:Code)
  CS:Code = 'F044'
  CS:Sort = 237
  ADD(CodeSort,CS:Code)
  CS:Code = 'F045'
  CS:Sort = 265
  ADD(CodeSort,CS:Code)
  CS:Code = 'F047'
  CS:Sort = 129
  ADD(CodeSort,CS:Code)
  CS:Code = 'F048'
  CS:Sort = 181
  ADD(CodeSort,CS:Code)
  CS:Code = 'F049'
  CS:Sort = 43
  ADD(CodeSort,CS:Code)
  CS:Code = 'F054'
  CS:Sort = 211
  ADD(CodeSort,CS:Code)
  CS:Code = 'F075'
  CS:Sort = 123
  ADD(CodeSort,CS:Code)
  CS:Code = 'F076'
  CS:Sort = 163
  ADD(CodeSort,CS:Code)
  CS:Code = 'F077'
  CS:Sort = 164
  ADD(CodeSort,CS:Code)
  CS:Code = 'F078'
  CS:Sort = 162
  ADD(CodeSort,CS:Code)
  CS:Code = 'F079'
  CS:Sort = 260
  ADD(CodeSort,CS:Code)
  CS:Code = 'F080'
  CS:Sort = 153
  ADD(CodeSort,CS:Code)
  CS:Code = 'F081'
  CS:Sort = 87
  ADD(CodeSort,CS:Code)
  CS:Code = 'F082'
  CS:Sort = 86
  ADD(CodeSort,CS:Code)
  CS:Code = 'F083'
  CS:Sort = 93
  ADD(CodeSort,CS:Code)
  CS:Code = 'F085'
  CS:Sort = 84
  ADD(CodeSort,CS:Code)
  CS:Code = 'F087'
  CS:Sort = 160
  ADD(CodeSort,CS:Code)
  CS:Code = 'F089'
  CS:Sort = 172
  ADD(CodeSort,CS:Code)
  CS:Code = 'F090'
  CS:Sort = 157
  ADD(CodeSort,CS:Code)
  CS:Code = 'F092'
  CS:Sort = 48
  ADD(CodeSort,CS:Code)
  CS:Code = 'F093'
  CS:Sort = 96
  ADD(CodeSort,CS:Code)
  CS:Code = 'F094'
  CS:Sort = 196
  ADD(CodeSort,CS:Code)
  CS:Code = 'F095'
  CS:Sort = 191
  ADD(CodeSort,CS:Code)
  CS:Code = 'F096'
  CS:Sort = 47
  ADD(CodeSort,CS:Code)
  CS:Code = 'F100'
  CS:Sort = 91
  ADD(CodeSort,CS:Code)
  CS:Code = 'F101'
  CS:Sort = 51
  ADD(CodeSort,CS:Code)
  CS:Code = 'F102'
  CS:Sort = 70
  ADD(CodeSort,CS:Code)
  CS:Code = 'F103'
  CS:Sort = 92
  ADD(CodeSort,CS:Code)
  CS:Code = 'F104'
  CS:Sort = 110
  ADD(CodeSort,CS:Code)
  CS:Code = 'F105'
  CS:Sort = 115
  ADD(CodeSort,CS:Code)
  CS:Code = 'F106'
  CS:Sort = 117
  ADD(CodeSort,CS:Code)
  CS:Code = 'F107'
  CS:Sort = 118
  ADD(CodeSort,CS:Code)
  CS:Code = 'F108'
  CS:Sort = 124
  ADD(CodeSort,CS:Code)
  CS:Code = 'F109'
  CS:Sort = 136
  ADD(CodeSort,CS:Code)
  CS:Code = 'F110'
  CS:Sort = 137
  ADD(CodeSort,CS:Code)
  CS:Code = 'F111'
  CS:Sort = 156
  ADD(CodeSort,CS:Code)
  CS:Code = 'F112'
  CS:Sort = 186
  ADD(CodeSort,CS:Code)
  CS:Code = 'F114'
  CS:Sort = 204
  ADD(CodeSort,CS:Code)
  CS:Code = 'F115'
  CS:Sort = 213
  ADD(CodeSort,CS:Code)
  CS:Code = 'F116'
  CS:Sort = 236
  ADD(CodeSort,CS:Code)
  CS:Code = 'F117'
  CS:Sort = 90
  ADD(CodeSort,CS:Code)
  CS:Code = 'F118'
  CS:Sort = 240
  ADD(CodeSort,CS:Code)
  CS:Code = 'F119'
  CS:Sort = 139
  ADD(CodeSort,CS:Code)
  CS:Code = 'F120'
  CS:Sort = 202
  ADD(CodeSort,CS:Code)
  CS:Code = 'F121'
  CS:Sort = 261
  ADD(CodeSort,CS:Code)
  CS:Code = 'F122'
  CS:Sort = 45
  ADD(CodeSort,CS:Code)
  CS:Code = 'F123'
  CS:Sort = 231
  ADD(CodeSort,CS:Code)
  CS:Code = 'F124'
  CS:Sort = 179
  ADD(CodeSort,CS:Code)
  CS:Code = 'F125'
  CS:Sort = 142
  ADD(CodeSort,CS:Code)
  CS:Code = 'F126'
  CS:Sort = 150
  ADD(CodeSort,CS:Code)
  CS:Code = 'F127'
  CS:Sort = 185
  ADD(CodeSort,CS:Code)
  CS:Code = 'F128'
  CS:Sort = 207
  ADD(CodeSort,CS:Code)
  CS:Code = 'F129'
  CS:Sort = 218
  ADD(CodeSort,CS:Code)
  CS:Code = 'F130'
  CS:Sort = 252
  ADD(CodeSort,CS:Code)
  CS:Code = 'F131'
  CS:Sort = 242
  ADD(CodeSort,CS:Code)
  CS:Code = 'F132'
  CS:Sort = 173
  ADD(CodeSort,CS:Code)
  CS:Code = 'F133'
  CS:Sort = 130
  ADD(CodeSort,CS:Code)
  CS:Code = 'F134'
  CS:Sort = 152
  ADD(CodeSort,CS:Code)
  CS:Code = 'F135'
  CS:Sort = 46
  ADD(CodeSort,CS:Code)
  CS:Code = 'F136'
  CS:Sort = 154
  ADD(CodeSort,CS:Code)
  CS:Code = 'F137'
  CS:Sort = 209
  ADD(CodeSort,CS:Code)
  CS:Code = 'F138'
  CS:Sort = 44
  ADD(CodeSort,CS:Code)
  CS:Code = 'F139'
  CS:Sort = 63
  ADD(CodeSort,CS:Code)
  CS:Code = 'F140'
  CS:Sort = 113
  ADD(CodeSort,CS:Code)
  CS:Code = 'F141'
  CS:Sort = 114
  ADD(CodeSort,CS:Code)
  CS:Code = 'F142'
  CS:Sort = 189
  ADD(CodeSort,CS:Code)
  CS:Code = 'F143'
  CS:Sort = 126
  ADD(CodeSort,CS:Code)
  CS:Code = 'F144'
  CS:Sort = 187
  ADD(CodeSort,CS:Code)
  CS:Code = 'F145'
  CS:Sort = 62
  ADD(CodeSort,CS:Code)
  CS:Code = 'F146'
  CS:Sort = 100
  ADD(CodeSort,CS:Code)
  CS:Code = 'F147'
  CS:Sort = 167
  ADD(CodeSort,CS:Code)
  CS:Code = 'F148'
  CS:Sort = 175
  ADD(CodeSort,CS:Code)
  CS:Code = 'F149'
  CS:Sort = 216
  ADD(CodeSort,CS:Code)
  CS:Code = 'F150'
  CS:Sort = 199
  ADD(CodeSort,CS:Code)
  CS:Code = 'F151'
  CS:Sort = 224
  ADD(CodeSort,CS:Code)
  CS:Code = 'F152'
  CS:Sort = 61
  ADD(CodeSort,CS:Code)
  CS:Code = 'F153'
  CS:Sort = 146
  ADD(CodeSort,CS:Code)
  CS:Code = 'F154'
  CS:Sort = 69
  ADD(CodeSort,CS:Code)
  CS:Code = 'F155'
  CS:Sort = 241
  ADD(CodeSort,CS:Code)
  CS:Code = 'F156'
  CS:Sort = 245
  ADD(CodeSort,CS:Code)
  CS:Code = 'F157'
  CS:Sort = 168
  ADD(CodeSort,CS:Code)
  CS:Code = 'F158'
  CS:Sort = 147
  ADD(CodeSort,CS:Code)
  CS:Code = 'F159'
  CS:Sort = 73
  ADD(CodeSort,CS:Code)
  CS:Code = 'F201'
  CS:Sort = 197
  ADD(CodeSort,CS:Code)
  CS:Code = 'F202'
  CS:Sort = 81
  ADD(CodeSort,CS:Code)
  CS:Code = 'F203'
  CS:Sort = 206
  ADD(CodeSort,CS:Code)
  CS:Code = 'F204'
  CS:Sort = 248
  ADD(CodeSort,CS:Code)
  CS:Code = 'F207'
  CS:Sort = 99
  ADD(CodeSort,CS:Code)
  CS:Code = 'F208'
  CS:Sort = 149
  ADD(CodeSort,CS:Code)
  CS:Code = 'F209'
  CS:Sort = 135
  ADD(CodeSort,CS:Code)
  CS:Code = 'F210'
  CS:Sort = 205
  ADD(CodeSort,CS:Code)
  CS:Code = 'F212'
  CS:Sort = 170
  ADD(CodeSort,CS:Code)
  CS:Code = 'F214'
  CS:Sort = 234
  ADD(CodeSort,CS:Code)
  CS:Code = 'F215'
  CS:Sort = 151
  ADD(CodeSort,CS:Code)
  CS:Code = 'F216'
  CS:Sort = 72
  ADD(CodeSort,CS:Code)
  CS:Code = 'F221'
  CS:Sort = 103
  ADD(CodeSort,CS:Code)
  CS:Code = 'F236'
  CS:Sort = 166
  ADD(CodeSort,CS:Code)
  CS:Code = 'F244'
  CS:Sort = 112
  ADD(CodeSort,CS:Code)
  CS:Code = 'F245'
  CS:Sort = 119
  ADD(CodeSort,CS:Code)
  CS:Code = 'F247'
  CS:Sort = 141
  ADD(CodeSort,CS:Code)
  CS:Code = 'F256'
  CS:Sort = 255
  ADD(CodeSort,CS:Code)
  CS:Code = 'F259'
  CS:Sort = 134
  ADD(CodeSort,CS:Code)
  CS:Code = 'F259'
  CS:Sort = 217
  ADD(CodeSort,CS:Code)
  CS:Code = 'F260'
  CS:Sort = 67
  ADD(CodeSort,CS:Code)
  CS:Code = 'F263'
  CS:Sort = 201
  ADD(CodeSort,CS:Code)
  CS:Code = 'F283'
  CS:Sort = 183
  ADD(CodeSort,CS:Code)
  CS:Code = 'F284'
  CS:Sort = 251
  ADD(CodeSort,CS:Code)
  CS:Code = 'F288'
  CS:Sort = 64
  ADD(CodeSort,CS:Code)
  CS:Code = 'F290'
  CS:Sort = 184
  ADD(CodeSort,CS:Code)
  CS:Code = 'F291'
  CS:Sort = 83
  ADD(CodeSort,CS:Code)
  CS:Code = 'F300'
  CS:Sort = 55
  ADD(CodeSort,CS:Code)
  CS:Code = 'F301'
  CS:Sort = 56
  ADD(CodeSort,CS:Code)
  CS:Code = 'F302'
  CS:Sort = 57
  ADD(CodeSort,CS:Code)
  CS:Code = 'F303'
  CS:Sort = 58
  ADD(CodeSort,CS:Code)
  CS:Code = 'F304'
  CS:Sort = 65
  ADD(CodeSort,CS:Code)
  CS:Code = 'F305'
  CS:Sort = 74
  ADD(CodeSort,CS:Code)
  CS:Code = 'F306'
  CS:Sort = 82
  ADD(CodeSort,CS:Code)
  CS:Code = 'F307'
  CS:Sort = 85
  ADD(CodeSort,CS:Code)
  CS:Code = 'F308'
  CS:Sort = 98
  ADD(CodeSort,CS:Code)
  CS:Code = 'F309'
  CS:Sort = 106
  ADD(CodeSort,CS:Code)
  CS:Code = 'F310'
  CS:Sort = 108
  ADD(CodeSort,CS:Code)
  CS:Code = 'F311'
  CS:Sort = 127
  ADD(CodeSort,CS:Code)
  CS:Code = 'F312'
  CS:Sort = 138
  ADD(CodeSort,CS:Code)
  CS:Code = 'F313'
  CS:Sort = 198
  ADD(CodeSort,CS:Code)
  CS:Code = 'F314'
  CS:Sort = 200
  ADD(CodeSort,CS:Code)
  CS:Code = 'F316'
  CS:Sort = 239
  ADD(CodeSort,CS:Code)
  CS:Code = 'F317'
  CS:Sort = 256
  ADD(CodeSort,CS:Code)
  CS:Code = 'F318'
  CS:Sort = 264
  ADD(CodeSort,CS:Code)
  CS:Code = 'F319'
  CS:Sort = 267
  ADD(CodeSort,CS:Code)
  CS:Code = 'F329'
  CS:Sort = 258
  ADD(CodeSort,CS:Code)
  CS:Code = 'F337'
  CS:Sort = 232
  ADD(CodeSort,CS:Code)
  CS:Code = 'F338'
  CS:Sort = 228
  ADD(CodeSort,CS:Code)
  CS:Code = 'F339'
  CS:Sort = 107
  ADD(CodeSort,CS:Code)
  CS:Code = 'F340'
  CS:Sort = 243
  ADD(CodeSort,CS:Code)
  CS:Code = 'F341'
  CS:Sort = 116
  ADD(CodeSort,CS:Code)
  CS:Code = 'F342'
  CS:Sort = 180
  ADD(CodeSort,CS:Code)
  CS:Code = 'F343'
  CS:Sort = 50
  ADD(CodeSort,CS:Code)
  CS:Code = 'F344'
  CS:Sort = 268
  ADD(CodeSort,CS:Code)
  CS:Code = 'F345'
  CS:Sort = 131
  ADD(CodeSort,CS:Code)
  CS:Code = 'F346'
  CS:Sort = 235
  ADD(CodeSort,CS:Code)
  CS:Code = 'F347'
  CS:Sort = 52
  ADD(CodeSort,CS:Code)
  CS:Code = 'F348'
  CS:Sort = 104
  ADD(CodeSort,CS:Code)
  CS:Code = 'F349'
  CS:Sort = 223
  ADD(CodeSort,CS:Code)
  CS:Code = 'F350'
  CS:Sort = 238
  ADD(CodeSort,CS:Code)
  CS:Code = 'F351'
  CS:Sort = 158
  ADD(CodeSort,CS:Code)
  CS:Code = 'F352'
  CS:Sort = 221
  ADD(CodeSort,CS:Code)
  CS:Code = 'F353'
  CS:Sort = 226
  ADD(CodeSort,CS:Code)
  CS:Code = 'F354'
  CS:Sort = 109
  ADD(CodeSort,CS:Code)
  CS:Code = 'F355'
  CS:Sort = 188
  ADD(CodeSort,CS:Code)
  CS:Code = 'F356'
  CS:Sort = 53
  ADD(CodeSort,CS:Code)
  CS:Code = 'F357'
  CS:Sort = 122
  ADD(CodeSort,CS:Code)
  CS:Code = 'F358'
  CS:Sort = 165
  ADD(CodeSort,CS:Code)
  CS:Code = 'F359'
  CS:Sort = 193
  ADD(CodeSort,CS:Code)
  CS:Code = 'F360'
  CS:Sort = 194
  ADD(CodeSort,CS:Code)
  CS:Code = 'F361'
  CS:Sort = 246
  ADD(CodeSort,CS:Code)
  CS:Code = 'F363'
  CS:Sort = 155
  ADD(CodeSort,CS:Code)
  CS:Code = 'F364'
  CS:Sort = 77
  ADD(CodeSort,CS:Code)
  CS:Code = 'F365'
  CS:Sort = 78
  ADD(CodeSort,CS:Code)
  CS:Code = 'F366'
  CS:Sort = 79
  ADD(CodeSort,CS:Code)
  CS:Code = 'F369'
  CS:Sort = 214
  ADD(CodeSort,CS:Code)
  CS:Code = 'F370'
  CS:Sort = 145
  ADD(CodeSort,CS:Code)
  CS:Code = 'F372'
  CS:Sort = 195
  ADD(CodeSort,CS:Code)
  CS:Code = 'F373'
  CS:Sort = 38
  ADD(CodeSort,CS:Code)
  CS:Code = 'F374'
  CS:Sort = 42
  ADD(CodeSort,CS:Code)
  CS:Code = 'F376'
  CS:Sort = 71
  ADD(CodeSort,CS:Code)
  CS:Code = 'F378'
  CS:Sort = 76
  ADD(CodeSort,CS:Code)
  CS:Code = 'F379'
  CS:Sort = 88
  ADD(CodeSort,CS:Code)
  CS:Code = 'F380'
  CS:Sort = 89
  ADD(CodeSort,CS:Code)
  CS:Code = 'F381'
  CS:Sort = 111
  ADD(CodeSort,CS:Code)
  CS:Code = 'F382'
  CS:Sort = 125
  ADD(CodeSort,CS:Code)
  CS:Code = 'F387'
  CS:Sort = 143
  ADD(CodeSort,CS:Code)
  CS:Code = 'F388'
  CS:Sort = 159
  ADD(CodeSort,CS:Code)
  CS:Code = 'F392'
  CS:Sort = 169
  ADD(CodeSort,CS:Code)
  CS:Code = 'F393'
  CS:Sort = 171
  ADD(CodeSort,CS:Code)
  CS:Code = 'F394'
  CS:Sort = 177
  ADD(CodeSort,CS:Code)
  CS:Code = 'F395'
  CS:Sort = 121
  ADD(CodeSort,CS:Code)
  CS:Code = 'F396'
  CS:Sort = 203
  ADD(CodeSort,CS:Code)
  CS:Code = 'F398'
  CS:Sort = 227
  ADD(CodeSort,CS:Code)
  CS:Code = 'F404'
  CS:Sort = 254
  ADD(CodeSort,CS:Code)
  CS:Code = 'F406'
  CS:Sort = 262
  ADD(CodeSort,CS:Code)
  CS:Code = 'F407'
  CS:Sort = 263
  ADD(CodeSort,CS:Code)
  CS:Code = 'F408'
  CS:Sort = 266
  ADD(CodeSort,CS:Code)
  CS:Code = 'F409'
  CS:Sort = 244
  ADD(CodeSort,CS:Code)
  CS:Code = 'F410'
  CS:Sort = 253
  ADD(CodeSort,CS:Code)
  CS:Code = 'F411'
  CS:Sort = 132
  ADD(CodeSort,CS:Code)
  CS:Code = 'F414'
  CS:Sort = 148
  ADD(CodeSort,CS:Code)
  CS:Code = 'F415'
  CS:Sort = 219
  ADD(CodeSort,CS:Code)
  CS:Code = 'F416'
  CS:Sort = 215
  ADD(CodeSort,CS:Code)
  CS:Code = 'F417'
  CS:Sort = 54
  ADD(CodeSort,CS:Code)
  CS:Code = 'FZ03'
  CS:Sort = 128
  ADD(CodeSort,CS:Code)
  CS:Code = 'FZ11'
  CS:Sort = 133
  ADD(CodeSort,CS:Code)
  CS:Code = 'FZ13'
  CS:Sort = 174
  ADD(CodeSort,CS:Code)
  CS:Code = 'FZ16'
  CS:Sort = 257
  ADD(CodeSort,CS:Code)
  CS:Code = 'G002'
  CS:Sort = 270
  ADD(CodeSort,CS:Code)
  CS:Code = 'G003'
  CS:Sort = 280
  ADD(CodeSort,CS:Code)
  CS:Code = 'G004'
  CS:Sort = 278
  ADD(CodeSort,CS:Code)
  CS:Code = 'G005'
  CS:Sort = 282
  ADD(CodeSort,CS:Code)
  CS:Code = 'G006'
  CS:Sort = 285
  ADD(CodeSort,CS:Code)
  CS:Code = 'G008'
  CS:Sort = 277
  ADD(CodeSort,CS:Code)
  CS:Code = 'G009'
  CS:Sort = 281
  ADD(CodeSort,CS:Code)
  CS:Code = 'G010'
  CS:Sort = 276
  ADD(CodeSort,CS:Code)
  CS:Code = 'G013'
  CS:Sort = 286
  ADD(CodeSort,CS:Code)
  CS:Code = 'G014'
  CS:Sort = 279
  ADD(CodeSort,CS:Code)
  CS:Code = 'G015'
  CS:Sort = 287
  ADD(CodeSort,CS:Code)
  CS:Code = 'G017'
  CS:Sort = 269
  ADD(CodeSort,CS:Code)
  CS:Code = 'G021'
  CS:Sort = 283
  ADD(CodeSort,CS:Code)
  CS:Code = 'G022'
  CS:Sort = 271
  ADD(CodeSort,CS:Code)
  CS:Code = 'G023'
  CS:Sort = 284
  ADD(CodeSort,CS:Code)
  CS:Code = 'G024'
  CS:Sort = 274
  ADD(CodeSort,CS:Code)
  CS:Code = 'G025'
  CS:Sort = 273
  ADD(CodeSort,CS:Code)
  CS:Code = 'G026'
  CS:Sort = 272
  ADD(CodeSort,CS:Code)
  CS:Code = 'GZ08'
  CS:Sort = 275
  ADD(CodeSort,CS:Code)
  CS:Code = 'H001'
  CS:Sort = 9
  ADD(CodeSort,CS:Code)
  CS:Code = 'H002'
  CS:Sort = 10
  ADD(CodeSort,CS:Code)
  CS:Code = 'H010'
  CS:Sort = 8
  ADD(CodeSort,CS:Code)
  CS:Code = 'H010'
  CS:Sort = 304
  ADD(CodeSort,CS:Code)
  CS:Code = 'HZ05'
  CS:Sort = 7
  ADD(CodeSort,CS:Code)
  CS:Code = 'I001'
  CS:Sort = 296
  ADD(CodeSort,CS:Code)
  CS:Code = 'I002'
  CS:Sort = 297
  ADD(CodeSort,CS:Code)
  CS:Code = 'I003'
  CS:Sort = 302
  ADD(CodeSort,CS:Code)
  CS:Code = 'I004'
  CS:Sort = 301
  ADD(CodeSort,CS:Code)
  CS:Code = 'I005'
  CS:Sort = 298
  ADD(CodeSort,CS:Code)
  CS:Code = 'I006'
  CS:Sort = 2
  ADD(CodeSort,CS:Code)
  CS:Code = 'I006'
  CS:Sort = 293
  ADD(CodeSort,CS:Code)
  CS:Code = 'I007'
  CS:Sort = 300
  ADD(CodeSort,CS:Code)
  CS:Code = 'I010'
  CS:Sort = 288
  ADD(CodeSort,CS:Code)
  CS:Code = 'I011'
  CS:Sort = 294
  ADD(CodeSort,CS:Code)
  CS:Code = 'I012'
  CS:Sort = 295
  ADD(CodeSort,CS:Code)
  CS:Code = 'I014'
  CS:Sort = 299
  ADD(CodeSort,CS:Code)
  CS:Code = 'I016'
  CS:Sort = 290
  ADD(CodeSort,CS:Code)
  CS:Code = 'I070'
  CS:Sort = 289
  ADD(CodeSort,CS:Code)
  CS:Code = 'I206'
  CS:Sort = 1
  ADD(CodeSort,CS:Code)
  CS:Code = 'I206'
  CS:Sort = 292
  ADD(CodeSort,CS:Code)
  CS:Code = 'IZ17'
  CS:Sort = 3
  ADD(CodeSort,CS:Code)
  CS:Code = 'IZ17'
  CS:Sort = 291
  ADD(CodeSort,CS:Code)
  CS:Code = 'K001'
  CS:Sort = 308
  ADD(CodeSort,CS:Code)
  CS:Code = 'K002'
  CS:Sort = 313
  ADD(CodeSort,CS:Code)
  CS:Code = 'K082'
  CS:Sort = 309
  ADD(CodeSort,CS:Code)
  CS:Code = 'M001'
  CS:Sort = 349
  ADD(CodeSort,CS:Code)
  CS:Code = 'M002'
  CS:Sort = 331
  ADD(CodeSort,CS:Code)
  CS:Code = 'M003'
  CS:Sort = 319
  ADD(CodeSort,CS:Code)
  CS:Code = 'M004'
  CS:Sort = 347
  ADD(CodeSort,CS:Code)
  CS:Code = 'M006'
  CS:Sort = 317
  ADD(CodeSort,CS:Code)
  CS:Code = 'M008'
  CS:Sort = 338
  ADD(CodeSort,CS:Code)
  CS:Code = 'M009'
  CS:Sort = 335
  ADD(CodeSort,CS:Code)
  CS:Code = 'M010'
  CS:Sort = 359
  ADD(CodeSort,CS:Code)
  CS:Code = 'M011'
  CS:Sort = 352
  ADD(CodeSort,CS:Code)
  CS:Code = 'M012'
  CS:Sort = 324
  ADD(CodeSort,CS:Code)
  CS:Code = 'M013'
  CS:Sort = 350
  ADD(CodeSort,CS:Code)
  CS:Code = 'M014'
  CS:Sort = 333
  ADD(CodeSort,CS:Code)
  CS:Code = 'M016'
  CS:Sort = 332
  ADD(CodeSort,CS:Code)
  CS:Code = 'M018'
  CS:Sort = 318
  ADD(CodeSort,CS:Code)
  CS:Code = 'M019'
  CS:Sort = 321
  ADD(CodeSort,CS:Code)
  CS:Code = 'M020'
  CS:Sort = 355
  ADD(CodeSort,CS:Code)
  CS:Code = 'M021'
  CS:Sort = 320
  ADD(CodeSort,CS:Code)
  CS:Code = 'M022'
  CS:Sort = 322
  ADD(CodeSort,CS:Code)
  CS:Code = 'M023'
  CS:Sort = 323
  ADD(CodeSort,CS:Code)
  CS:Code = 'M024'
  CS:Sort = 360
  ADD(CodeSort,CS:Code)
  CS:Code = 'M025'
  CS:Sort = 329
  ADD(CodeSort,CS:Code)
  CS:Code = 'M026'
  CS:Sort = 316
  ADD(CodeSort,CS:Code)
  CS:Code = 'M027'
  CS:Sort = 353
  ADD(CodeSort,CS:Code)
  CS:Code = 'M030'
  CS:Sort = 336
  ADD(CodeSort,CS:Code)
  CS:Code = 'M031'
  CS:Sort = 327
  ADD(CodeSort,CS:Code)
  CS:Code = 'M032'
  CS:Sort = 364
  ADD(CodeSort,CS:Code)
  CS:Code = 'M033'
  CS:Sort = 328
  ADD(CodeSort,CS:Code)
  CS:Code = 'M034'
  CS:Sort = 341
  ADD(CodeSort,CS:Code)
  CS:Code = 'M035'
  CS:Sort = 340
  ADD(CodeSort,CS:Code)
  CS:Code = 'M036'
  CS:Sort = 343
  ADD(CodeSort,CS:Code)
  CS:Code = 'M037'
  CS:Sort = 334
  ADD(CodeSort,CS:Code)
  CS:Code = 'M038'
  CS:Sort = 354
  ADD(CodeSort,CS:Code)
  CS:Code = 'M039'
  CS:Sort = 325
  ADD(CodeSort,CS:Code)
  CS:Code = 'M040'
  CS:Sort = 346
  ADD(CodeSort,CS:Code)
  CS:Code = 'M041'
  CS:Sort = 358
  ADD(CodeSort,CS:Code)
  CS:Code = 'M042'
  CS:Sort = 326
  ADD(CodeSort,CS:Code)
  CS:Code = 'M043'
  CS:Sort = 363
  ADD(CodeSort,CS:Code)
  CS:Code = 'M044'
  CS:Sort = 362
  ADD(CodeSort,CS:Code)
  CS:Code = 'M045'
  CS:Sort = 330
  ADD(CodeSort,CS:Code)
  CS:Code = 'M046'
  CS:Sort = 351
  ADD(CodeSort,CS:Code)
  CS:Code = 'M047'
  CS:Sort = 348
  ADD(CodeSort,CS:Code)
  CS:Code = 'M048'
  CS:Sort = 315
  ADD(CodeSort,CS:Code)
  CS:Code = 'M049'
  CS:Sort = 345
  ADD(CodeSort,CS:Code)
  CS:Code = 'M050'
  CS:Sort = 337
  ADD(CodeSort,CS:Code)
  CS:Code = 'M052'
  CS:Sort = 342
  ADD(CodeSort,CS:Code)
  CS:Code = 'M061'
  CS:Sort = 357
  ADD(CodeSort,CS:Code)
  CS:Code = 'M062'
  CS:Sort = 339
  ADD(CodeSort,CS:Code)
  CS:Code = 'M063'
  CS:Sort = 356
  ADD(CodeSort,CS:Code)
  CS:Code = 'MZ02'
  CS:Sort = 344
  ADD(CodeSort,CS:Code)
  CS:Code = 'MZ15'
  CS:Sort = 361
  ADD(CodeSort,CS:Code)
  CS:Code = 'S001'
  CS:Sort = 493
  ADD(CodeSort,CS:Code)
  CS:Code = 'S002'
  CS:Sort = 518
  ADD(CodeSort,CS:Code)
  CS:Code = 'S003'
  CS:Sort = 504
  ADD(CodeSort,CS:Code)
  CS:Code = 'S004'
  CS:Sort = 496
  ADD(CodeSort,CS:Code)
  CS:Code = 'S006'
  CS:Sort = 522
  ADD(CodeSort,CS:Code)
  CS:Code = 'S007'
  CS:Sort = 506
  ADD(CodeSort,CS:Code)
  CS:Code = 'S008'
  CS:Sort = 499
  ADD(CodeSort,CS:Code)
  CS:Code = 'S009'
  CS:Sort = 501
  ADD(CodeSort,CS:Code)
  CS:Code = 'S010'
  CS:Sort = 495
  ADD(CodeSort,CS:Code)
  CS:Code = 'S012'
  CS:Sort = 514
  ADD(CodeSort,CS:Code)
  CS:Code = 'S013'
  CS:Sort = 503
  ADD(CodeSort,CS:Code)
  CS:Code = 'S015'
  CS:Sort = 519
  ADD(CodeSort,CS:Code)
  CS:Code = 'S016'
  CS:Sort = 524
  ADD(CodeSort,CS:Code)
  CS:Code = 'S017'
  CS:Sort = 517
  ADD(CodeSort,CS:Code)
  CS:Code = 'S018'
  CS:Sort = 520
  ADD(CodeSort,CS:Code)
  CS:Code = 'S020'
  CS:Sort = 507
  ADD(CodeSort,CS:Code)
  CS:Code = 'S021'
  CS:Sort = 489
  ADD(CodeSort,CS:Code)
  CS:Code = 'S022'
  CS:Sort = 508
  ADD(CodeSort,CS:Code)
  CS:Code = 'S023'
  CS:Sort = 494
  ADD(CodeSort,CS:Code)
  CS:Code = 'S024'
  CS:Sort = 497
  ADD(CodeSort,CS:Code)
  CS:Code = 'S025'
  CS:Sort = 515
  ADD(CodeSort,CS:Code)
  CS:Code = 'S026'
  CS:Sort = 523
  ADD(CodeSort,CS:Code)
  CS:Code = 'S027'
  CS:Sort = 513
  ADD(CodeSort,CS:Code)
  CS:Code = 'S028'
  CS:Sort = 490
  ADD(CodeSort,CS:Code)
  CS:Code = 'S029'
  CS:Sort = 306
  ADD(CodeSort,CS:Code)
  CS:Code = 'S030'
  CS:Sort = 307
  ADD(CodeSort,CS:Code)
  CS:Code = 'S032'
  CS:Sort = 500
  ADD(CodeSort,CS:Code)
  CS:Code = 'S033'
  CS:Sort = 488
  ADD(CodeSort,CS:Code)
  CS:Code = 'S034'
  CS:Sort = 512
  ADD(CodeSort,CS:Code)
  CS:Code = 'S036'
  CS:Sort = 502
  ADD(CodeSort,CS:Code)
  CS:Code = 'S037'
  CS:Sort = 303
  ADD(CodeSort,CS:Code)
  CS:Code = 'S038'
  CS:Sort = 312
  ADD(CodeSort,CS:Code)
  CS:Code = 'S042'
  CS:Sort = 305
  ADD(CodeSort,CS:Code)
  CS:Code = 'S043'
  CS:Sort = 310
  ADD(CodeSort,CS:Code)
  CS:Code = 'S045'
  CS:Sort = 492
  ADD(CodeSort,CS:Code)
  CS:Code = 'S046'
  CS:Sort = 314
  ADD(CodeSort,CS:Code)
  CS:Code = 'S049'
  CS:Sort = 521
  ADD(CodeSort,CS:Code)
  CS:Code = 'S051'
  CS:Sort = 509
  ADD(CodeSort,CS:Code)
  CS:Code = 'S052'
  CS:Sort = 498
  ADD(CodeSort,CS:Code)
  CS:Code = 'S053'
  CS:Sort = 311
  ADD(CodeSort,CS:Code)
  CS:Code = 'S053'
  CS:Sort = 516
  ADD(CodeSort,CS:Code)
  CS:Code = 'S054'
  CS:Sort = 94
  ADD(CodeSort,CS:Code)
  CS:Code = 'S055'
  CS:Sort = 505
  ADD(CodeSort,CS:Code)
  CS:Code = 'T001'
  CS:Sort = 403
  ADD(CodeSort,CS:Code)
  CS:Code = 'T002'
  CS:Sort = 369
  ADD(CodeSort,CS:Code)
  CS:Code = 'T003'
  CS:Sort = 377
  ADD(CodeSort,CS:Code)
  CS:Code = 'T004'
  CS:Sort = 400
  ADD(CodeSort,CS:Code)
  CS:Code = 'T005'
  CS:Sort = 376
  ADD(CodeSort,CS:Code)
  CS:Code = 'T006'
  CS:Sort = 380
  ADD(CodeSort,CS:Code)
  CS:Code = 'T007'
  CS:Sort = 415
  ADD(CodeSort,CS:Code)
  CS:Code = 'T008'
  CS:Sort = 387
  ADD(CodeSort,CS:Code)
  CS:Code = 'T009'
  CS:Sort = 416
  ADD(CodeSort,CS:Code)
  CS:Code = 'T010'
  CS:Sort = 440
  ADD(CodeSort,CS:Code)
  CS:Code = 'T011'
  CS:Sort = 382
  ADD(CodeSort,CS:Code)
  CS:Code = 'T012'
  CS:Sort = 397
  ADD(CodeSort,CS:Code)
  CS:Code = 'T013'
  CS:Sort = 441
  ADD(CodeSort,CS:Code)
  CS:Code = 'T014'
  CS:Sort = 383
  ADD(CodeSort,CS:Code)
  CS:Code = 'T015'
  CS:Sort = 373
  ADD(CodeSort,CS:Code)
  CS:Code = 'T016'
  CS:Sort = 429
  ADD(CodeSort,CS:Code)
  CS:Code = 'T017'
  CS:Sort = 399
  ADD(CodeSort,CS:Code)
  CS:Code = 'T018'
  CS:Sort = 390
  ADD(CodeSort,CS:Code)
  CS:Code = 'T019'
  CS:Sort = 365
  ADD(CodeSort,CS:Code)
  CS:Code = 'T020'
  CS:Sort = 405
  ADD(CodeSort,CS:Code)
  CS:Code = 'T021'
  CS:Sort = 379
  ADD(CodeSort,CS:Code)
  CS:Code = 'T022'
  CS:Sort = 370
  ADD(CodeSort,CS:Code)
  CS:Code = 'T023'
  CS:Sort = 386
  ADD(CodeSort,CS:Code)
  CS:Code = 'T072'
  CS:Sort = 421
  ADD(CodeSort,CS:Code)
  CS:Code = 'T100'
  CS:Sort = 366
  ADD(CodeSort,CS:Code)
  CS:Code = 'T101'
  CS:Sort = 367
  ADD(CodeSort,CS:Code)
  CS:Code = 'T102'
  CS:Sort = 371
  ADD(CodeSort,CS:Code)
  CS:Code = 'T103'
  CS:Sort = 372
  ADD(CodeSort,CS:Code)
  CS:Code = 'T104'
  CS:Sort = 374
  ADD(CodeSort,CS:Code)
  CS:Code = 'T105'
  CS:Sort = 381
  ADD(CodeSort,CS:Code)
  CS:Code = 'T106'
  CS:Sort = 385
  ADD(CodeSort,CS:Code)
  CS:Code = 'T107'
  CS:Sort = 388
  ADD(CodeSort,CS:Code)
  CS:Code = 'T108'
  CS:Sort = 389
  ADD(CodeSort,CS:Code)
  CS:Code = 'T109'
  CS:Sort = 396
  ADD(CodeSort,CS:Code)
  CS:Code = 'T110'
  CS:Sort = 401
  ADD(CodeSort,CS:Code)
  CS:Code = 'T111'
  CS:Sort = 402
  ADD(CodeSort,CS:Code)
  CS:Code = 'T112'
  CS:Sort = 407
  ADD(CodeSort,CS:Code)
  CS:Code = 'T114'
  CS:Sort = 413
  ADD(CodeSort,CS:Code)
  CS:Code = 'T115'
  CS:Sort = 414
  ADD(CodeSort,CS:Code)
  CS:Code = 'T116'
  CS:Sort = 417
  ADD(CodeSort,CS:Code)
  CS:Code = 'T117'
  CS:Sort = 418
  ADD(CodeSort,CS:Code)
  CS:Code = 'T118'
  CS:Sort = 419
  ADD(CodeSort,CS:Code)
  CS:Code = 'T119'
  CS:Sort = 420
  ADD(CodeSort,CS:Code)
  CS:Code = 'T120'
  CS:Sort = 423
  ADD(CodeSort,CS:Code)
  CS:Code = 'T121'
  CS:Sort = 425
  ADD(CodeSort,CS:Code)
  CS:Code = 'T122'
  CS:Sort = 426
  ADD(CodeSort,CS:Code)
  CS:Code = 'T123'
  CS:Sort = 428
  ADD(CodeSort,CS:Code)
  CS:Code = 'T124'
  CS:Sort = 431
  ADD(CodeSort,CS:Code)
  CS:Code = 'T125'
  CS:Sort = 432
  ADD(CodeSort,CS:Code)
  CS:Code = 'T126'
  CS:Sort = 434
  ADD(CodeSort,CS:Code)
  CS:Code = 'T127'
  CS:Sort = 439
  ADD(CodeSort,CS:Code)
  CS:Code = 'T128'
  CS:Sort = 444
  ADD(CodeSort,CS:Code)
  CS:Code = 'T130'
  CS:Sort = 433
  ADD(CodeSort,CS:Code)
  CS:Code = 'T131'
  CS:Sort = 392
  ADD(CodeSort,CS:Code)
  CS:Code = 'T132'
  CS:Sort = 384
  ADD(CodeSort,CS:Code)
  CS:Code = 'T133'
  CS:Sort = 395
  ADD(CodeSort,CS:Code)
  CS:Code = 'T134'
  CS:Sort = 411
  ADD(CodeSort,CS:Code)
  CS:Code = 'T136'
  CS:Sort = 443
  ADD(CodeSort,CS:Code)
  CS:Code = 'T137'
  CS:Sort = 393
  ADD(CodeSort,CS:Code)
  CS:Code = 'T138'
  CS:Sort = 404
  ADD(CodeSort,CS:Code)
  CS:Code = 'T139'
  CS:Sort = 412
  ADD(CodeSort,CS:Code)
  CS:Code = 'T140'
  CS:Sort = 435
  ADD(CodeSort,CS:Code)
  CS:Code = 'T141'
  CS:Sort = 406
  ADD(CodeSort,CS:Code)
  CS:Code = 'T142'
  CS:Sort = 424
  ADD(CodeSort,CS:Code)
  CS:Code = 'T143'
  CS:Sort = 409
  ADD(CodeSort,CS:Code)
  CS:Code = 'T144'
  CS:Sort = 408
  ADD(CodeSort,CS:Code)
  CS:Code = 'T145'
  CS:Sort = 422
  ADD(CodeSort,CS:Code)
  CS:Code = 'T146'
  CS:Sort = 378
  ADD(CodeSort,CS:Code)
  CS:Code = 'T147'
  CS:Sort = 427
  ADD(CodeSort,CS:Code)
  CS:Code = 'T148'
  CS:Sort = 398
  ADD(CodeSort,CS:Code)
  CS:Code = 'T149'
  CS:Sort = 394
  ADD(CodeSort,CS:Code)
  CS:Code = 'T150'
  CS:Sort = 438
  ADD(CodeSort,CS:Code)
  CS:Code = 'T151'
  CS:Sort = 410
  ADD(CodeSort,CS:Code)
  CS:Code = 'T152'
  CS:Sort = 442
  ADD(CodeSort,CS:Code)
  CS:Code = 'T153'
  CS:Sort = 368
  ADD(CodeSort,CS:Code)
  CS:Code = 'T154'
  CS:Sort = 391
  ADD(CodeSort,CS:Code)
  CS:Code = 'T155'
  CS:Sort = 375
  ADD(CodeSort,CS:Code)
  CS:Code = 'TZ01'
  CS:Sort = 430
  ADD(CodeSort,CS:Code)
  CS:Code = 'TZ09'
  CS:Sort = 437
  ADD(CodeSort,CS:Code)
  CS:Code = 'TZ13'
  CS:Sort = 436
  ADD(CodeSort,CS:Code)
  CS:Code = 'W001'
  CS:Sort = 473
  ADD(CodeSort,CS:Code)
  CS:Code = 'W002'
  CS:Sort = 478
  ADD(CodeSort,CS:Code)
  CS:Code = 'W003'
  CS:Sort = 475
  ADD(CodeSort,CS:Code)
  CS:Code = 'W004'
  CS:Sort = 472
  ADD(CodeSort,CS:Code)
  CS:Code = 'W005'
  CS:Sort = 487
  ADD(CodeSort,CS:Code)
  CS:Code = 'W006'
  CS:Sort = 464
  ADD(CodeSort,CS:Code)
  CS:Code = 'W007'
  CS:Sort = 486
  ADD(CodeSort,CS:Code)
  CS:Code = 'W009'
  CS:Sort = 471
  ADD(CodeSort,CS:Code)
  CS:Code = 'W010'
  CS:Sort = 459
  ADD(CodeSort,CS:Code)
  CS:Code = 'W011'
  CS:Sort = 483
  ADD(CodeSort,CS:Code)
  CS:Code = 'W013'
  CS:Sort = 450
  ADD(CodeSort,CS:Code)
  CS:Code = 'W014'
  CS:Sort = 468
  ADD(CodeSort,CS:Code)
  CS:Code = 'W015'
  CS:Sort = 460
  ADD(CodeSort,CS:Code)
  CS:Code = 'W016'
  CS:Sort = 462
  ADD(CodeSort,CS:Code)
  CS:Code = 'W018'
  CS:Sort = 480
  ADD(CodeSort,CS:Code)
  CS:Code = 'W019'
  CS:Sort = 467
  ADD(CodeSort,CS:Code)
  CS:Code = 'W020'
  CS:Sort = 465
  ADD(CodeSort,CS:Code)
  CS:Code = 'W021'
  CS:Sort = 461
  ADD(CodeSort,CS:Code)
  CS:Code = 'W100'
  CS:Sort = 445
  ADD(CodeSort,CS:Code)
  CS:Code = 'W101'
  CS:Sort = 449
  ADD(CodeSort,CS:Code)
  CS:Code = 'W102'
  CS:Sort = 451
  ADD(CodeSort,CS:Code)
  CS:Code = 'W104'
  CS:Sort = 454
  ADD(CodeSort,CS:Code)
  CS:Code = 'W105'
  CS:Sort = 463
  ADD(CodeSort,CS:Code)
  CS:Code = 'W106'
  CS:Sort = 466
  ADD(CodeSort,CS:Code)
  CS:Code = 'W107'
  CS:Sort = 448
  ADD(CodeSort,CS:Code)
  CS:Code = 'W109'
  CS:Sort = 477
  ADD(CodeSort,CS:Code)
  CS:Code = 'W111'
  CS:Sort = 479
  ADD(CodeSort,CS:Code)
  CS:Code = 'W112'
  CS:Sort = 481
  ADD(CodeSort,CS:Code)
  CS:Code = 'W113'
  CS:Sort = 484
  ADD(CodeSort,CS:Code)
  CS:Code = 'W114'
  CS:Sort = 482
  ADD(CodeSort,CS:Code)
  CS:Code = 'W115'
  CS:Sort = 446
  ADD(CodeSort,CS:Code)
  CS:Code = 'W116'
  CS:Sort = 447
  ADD(CodeSort,CS:Code)
  CS:Code = 'W117'
  CS:Sort = 458
  ADD(CodeSort,CS:Code)
  CS:Code = 'W118'
  CS:Sort = 457
  ADD(CodeSort,CS:Code)
  CS:Code = 'W119'
  CS:Sort = 469
  ADD(CodeSort,CS:Code)
  CS:Code = 'W121'
  CS:Sort = 456
  ADD(CodeSort,CS:Code)
  CS:Code = 'W122'
  CS:Sort = 470
  ADD(CodeSort,CS:Code)
  CS:Code = 'W123'
  CS:Sort = 452
  ADD(CodeSort,CS:Code)
  CS:Code = 'W124'
  CS:Sort = 474
  ADD(CodeSort,CS:Code)
  CS:Code = 'W125'
  CS:Sort = 453
  ADD(CodeSort,CS:Code)
  CS:Code = 'W126'
  CS:Sort = 455
  ADD(CodeSort,CS:Code)
  CS:Code = 'WZ10'
  CS:Sort = 485
  ADD(CodeSort,CS:Code)
  CS:Code = 'WZ16'
  CS:Sort = 476
  ADD(CodeSort,CS:Code)   
    CLOSE(VerifyPatient)
    CREATE(VerifyPatient)
    OPEN(VerifyPatient)
    SHARE(Rast)
    SHARE(Test)
    IF ERRORCODE() AND  ERRORCODE() <> 52 THEN STOP('SHARE TEST: ' & ERROR()).
    SHARE(Panels)
    CLEAR(TST:Record)
    TST:INVOICE = prmPatient
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP UNTIL EOF(Test)
      NEXT(Test)
      IF TST:Invoice <> prmPatient THEN BREAK.
      VP:Code = TST:CODE
      GET(VerifyPatient,VP:CodeKey)
      IF ERRORCODE()
        VP:IgE  = 0 
        VP:IgG  = 0 
        VP:IgG4 = 0 
        EXECUTE TST:TYPE
          VP:IgE  = 1 
          VP:IgG  = 1 
          VP:IgG4 = 1 
        .
        VP:Code = TST:Code
        IF TST:TYPE = 0
          VP:Order = 0
          PAN:NUMBER = TST:CODE
          GET(Panels,Pan:ORDER_KEY)
          IF ERRORCODE()
            VP:Description = ERROR()
          ELSE
            VP:Description = PAN:DESCRIPTION
         .
        ELSE
          CS:Code = TST:CODE
          GET(CodeSort,CS:Code)
          IF ERRORCODE()
            VP:Order = 0
          ELSE 
            VP:Order = CS:Sort
          .
          RST:Number = TST:CODE
          GET(RAST,RST:ORDER_KEY)
          IF ERRORCODE()
            VP:Description = ERROR()
          ELSE
            VP:Description = RST:DESCRIPTION
          .
        .
        
        ADD(VerifyPatient)
        IF ERRORCODE() THEN STOP('ADD VERIFY ' & ERROR()).
      ELSE
        EXECUTE TST:TYPE
          VP:IgE  = 1 
          VP:IgG  = 1 
          VP:IgG4 = 1 
        .
        PUT(VerifyPatient)
      .
    .
    CLOSE(VerifyPatient)
    CLOSE(Test)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:DeleteTests.Open                                  ! File DeleteTests used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:VerifyPatient.Open                                ! File VerifyPatient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:VerifyPatient,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon VP:Order for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,VP:OrderKey)     ! Add the sort order for VP:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,VP:Order,1,BRW1)               ! Initialize the browse locator using  using key: VP:OrderKey , VP:Order
  BRW1.AddField(VP:Code,BRW1.Q.VP:Code)                    ! Field VP:Code is a hot field or requires assignment from browse
  BRW1.AddField(VP:Description,BRW1.Q.VP:Description)      ! Field VP:Description is a hot field or requires assignment from browse
  BRW1.AddField(VP:IgE,BRW1.Q.VP:IgE)                      ! Field VP:IgE is a hot field or requires assignment from browse
  BRW1.AddField(VP:IgG4,BRW1.Q.VP:IgG4)                    ! Field VP:IgG4 is a hot field or requires assignment from browse
  BRW1.AddField(VP:IgG,BRW1.Q.VP:IgG)                      ! Field VP:IgG is a hot field or requires assignment from browse
  BRW1.AddField(VP:Order,BRW1.Q.VP:Order)                  ! Field VP:Order is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
    DO FillList  
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
    Relate:AddTests.Close
    Relate:DeleteTests.Close
    Relate:Panels.Close
    Relate:Rast.Close
    Relate:VerifyPatient.Close
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
    UpdateVerifyPatient
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
    OF ?AddButton
      IF LEN(locCode) = 4
        IF locIgE
          AT:Code = locCode
          AT:Patient = PAT:Invoice
          AT:Type = 1
          ADD(AddTests)
        . 
        IF locIgG
          AT:Code = locCode
          AT:Patient = PAT:Invoice
          AT:Type = 2
          ADD(AddTests)
        .  
        IF locIgG4
          AT:Code = locCode
          AT:Patient = PAT:Invoice
          AT:Type = 3
          ADD(AddTests)
        .  
      .
          DO FillList
    OF ?EditButton
        IF locSaveIgE AND (NOT locSelectedIgE)
          DT:Code = locSelectedCode
          DT:Patient = PAT:Invoice
          DT:Type = 1
          ADD(DeleteTests)
          locSaveIgE = locSelectedIgE
        . 
        IF locSaveIgG AND (NOT locSelectedIgG)
          DT:Code = locSelectedCode
          DT:Patient = PAT:Invoice
          DT:Type = 2
          ADD(DeleteTests)
          locSaveIgG = locSelectedIgG
        . 
        IF locSaveIgG4 AND (NOT locSelectedIgG4)
          DT:Code = locSelectedCode
          DT:Patient = PAT:Invoice
          DT:Type = 3
          ADD(DeleteTests)
          locSaveIgG4 = locSelectedIgG4
        . 
        IF (NOT locSaveIgE) AND locSelectedIgE
          AT:Code = locSelectedCode
          AT:Patient = PAT:Invoice
          AT:Type = 1
          ADD(AddTests)
          locSaveIgE = locSelectedIgE
        . 
        IF (NOT locSaveIgG) AND locSelectedIgG
          AT:Code = locSelectedCode
          AT:Patient = PAT:Invoice
          AT:Type = 2
          ADD(AddTests)
          locSaveIgG = locSelectedIgG
        . 
        IF (NOT locSaveIgG4) AND locSelectedIgG4
          AT:Code = locSelectedCode
          AT:Patient = PAT:Invoice
          AT:Type = 3
          ADD(AddTests)
          locSaveIgG4 = locSelectedIgG4
        . 
        DO FillList
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SaveButton
      ThisWindow.Update
      SET(VerifyPatient)
      LOOP 
        NEXT(VerifyPatient)
        IF ERRORCODE() THEN BREAK.
        IF VP:saveIgE AND (NOT VP:IgE)
          DT:Code = VP:Code
          DT:Patient = PAT:Invoice
          DT:Type = 1
          ADD(DeleteTests)
        . 
        IF VP:saveIgG AND (NOT VP:IgG)
          DT:Code = VP:Code
          DT:Patient = PAT:Invoice
          DT:Type = 2
          ADD(DeleteTests)
        . 
        IF VP:saveIgG4 AND (NOT VP:IgG4)
          DT:Code = VP:Code
          DT:Patient = PAT:Invoice
          DT:Type = 3
          ADD(DeleteTests)
        . 
        IF (NOT VP:saveIgE) AND VP:IgE
          AT:Code = VP:Code
          AT:Patient = PAT:Invoice
          AT:Type = 1
          ADD(AddTests)
        . 
        IF (NOT VP:saveIgG) AND VP:IgG
          AT:Code = VP:Code
          AT:Patient = PAT:Invoice
          AT:Type = 2
          ADD(AddTests)
        . 
        IF (NOT VP:saveIgG4) AND VP:IgG4
          AT:Code = VP:Code
          AT:Patient = PAT:Invoice
          AT:Type = 3
          ADD(AddTests)
        . 
      .
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (VP:IgE > 0)
    SELF.Q.VP:IgE_NormalFG = 16777215                      ! Set conditional color values for VP:IgE
    SELF.Q.VP:IgE_NormalBG = 255
    SELF.Q.VP:IgE_SelectedFG = 16777215
    SELF.Q.VP:IgE_SelectedBG = 255
  ELSIF (VP:IgE = 0)
    SELF.Q.VP:IgE_NormalFG = 16777215                      ! Set conditional color values for VP:IgE
    SELF.Q.VP:IgE_NormalBG = 16777215
    SELF.Q.VP:IgE_SelectedFG = 16777215
    SELF.Q.VP:IgE_SelectedBG = 16777215
  ELSE
    SELF.Q.VP:IgE_NormalFG = 16777215                      ! Set color values for VP:IgE
    SELF.Q.VP:IgE_NormalBG = 16777215
    SELF.Q.VP:IgE_SelectedFG = -1
    SELF.Q.VP:IgE_SelectedBG = -1
  END
  IF (VP:IgG4 > 0)
    SELF.Q.VP:IgG4_NormalFG = 0                            ! Set conditional color values for VP:IgG4
    SELF.Q.VP:IgG4_NormalBG = 65535
    SELF.Q.VP:IgG4_SelectedFG = 0
    SELF.Q.VP:IgG4_SelectedBG = 65535
  ELSIF (VP:IgG4 = 0)
    SELF.Q.VP:IgG4_NormalFG = 16777215                     ! Set conditional color values for VP:IgG4
    SELF.Q.VP:IgG4_NormalBG = 16777215
    SELF.Q.VP:IgG4_SelectedFG = 16777215
    SELF.Q.VP:IgG4_SelectedBG = 16777215
  ELSE
    SELF.Q.VP:IgG4_NormalFG = -1                           ! Set color values for VP:IgG4
    SELF.Q.VP:IgG4_NormalBG = -1
    SELF.Q.VP:IgG4_SelectedFG = -1
    SELF.Q.VP:IgG4_SelectedBG = -1
  END
  IF (VP:IgG > 0)
    SELF.Q.VP:IgG_NormalFG = 16777215                      ! Set conditional color values for VP:IgG
    SELF.Q.VP:IgG_NormalBG = 16711680
    SELF.Q.VP:IgG_SelectedFG = 16777215
    SELF.Q.VP:IgG_SelectedBG = 16711680
  ELSIF (VP:IgG = 0)
    SELF.Q.VP:IgG_NormalFG = 16777215                      ! Set conditional color values for VP:IgG
    SELF.Q.VP:IgG_NormalBG = 16777215
    SELF.Q.VP:IgG_SelectedFG = 16777215
    SELF.Q.VP:IgG_SelectedBG = 16777215
  ELSE
    SELF.Q.VP:IgG_NormalFG = -1                            ! Set color values for VP:IgG
    SELF.Q.VP:IgG_NormalBG = -1
    SELF.Q.VP:IgG_SelectedFG = -1
    SELF.Q.VP:IgG_SelectedBG = -1
  END


BRW1.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
    ThisWindow.Update
    locSelectedCode = VP:Code
    locSelectedIgE = VP:IgE
    locSelectedIgG = VP:IgG
    locSelectedIgG4 = VP:IgG4
    locSaveIgE = locSelectedIgE
    locSaveIgG = locSelectedIgG
    locSaveIgG4 = locSelectedIgG4
    DISPLAY


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Form VerifyPatient
!!! </summary>
UpdateVerifyPatient PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::VP:Record   LIKE(VP:RECORD),THREAD
QuickWindow          WINDOW,AT(,,528,273),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('UpdateVerifyPatient'),SYSTEM
                       PROMPT('Code:'),AT(8,34),USE(?VP:Code:Prompt),TRN
                       PROMPT('Description:'),AT(8,48),USE(?VP:Description:Prompt),TRN
                       STRING(@s32),AT(61,48,269,10),USE(VP:Description),FONT(,12,,FONT:bold,CHARSET:ANSI)
                       ENTRY(@s8),AT(62,29),USE(VP:Code,,?VP:Code:2),FONT(,12,,FONT:bold,CHARSET:ANSI)
                       BUTTON('&OK'),AT(347,79,84,41),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(344,155,84,41),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(208,250,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       CHECK('IgE'),AT(49,79,84,41),USE(VP:IgE),FONT(,14,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Red), |
  ICON(ICON:None),TRN
                       CHECK('IgG4'),AT(150,79,84,41),USE(VP:IgG4),FONT(,14,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN
                       CHECK('IgG'),AT(250,79,84,41),USE(VP:IgG),FONT(,14,COLOR:Black,,CHARSET:ANSI),COLOR(COLOR:Blue), |
  ICON(ICON:None),TRN
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
  CASE SELF.Request
  OF ChangeRecord OROF DeleteRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (' & VP:Description & ')' ! Append status message to window title text
  OF InsertRecord
    QuickWindow{PROP:Text} = QuickWindow{PROP:Text} & '  (New)'
  END
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateVerifyPatient')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?VP:Code:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(VP:Record,History::VP:Record)
  SELF.AddHistoryField(?VP:Description,3)
  SELF.AddHistoryField(?VP:Code:2,2)
  SELF.AddHistoryField(?VP:IgE,4)
  SELF.AddHistoryField(?VP:IgG4,6)
  SELF.AddHistoryField(?VP:IgG,5)
  SELF.AddUpdateFile(Access:VerifyPatient)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:VerifyPatient.Open                                ! File VerifyPatient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:VerifyPatient
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
    ?VP:Description{PROP:ReadOnly} = True
    ?VP:Code:2{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateVerifyPatient',QuickWindow)          ! Restore window settings from non-volatile store
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
    Relate:VerifyPatient.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateVerifyPatient',QuickWindow)       ! Save window data to non-volatile store
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
!!! Generated from procedure template - Report
!!! Report the SendOuts File
!!! </summary>
SummarySendouts PROCEDURE 

Progress:Thermometer BYTE                                  !
locInhouse           STRING(16)                            !
locViacore           LONG                                  !
locAccount           STRING(8)                             !
locDate              LONG                                  !
locSendTo            STRING(32)                            !
locTestType          STRING(4)                             !
locPatientName       STRING(32)                            !
locSTypes STRING('IgGIgAIgM')
locSType            STRING(3),DIM(3),OVER(locSTypes)
loc260              BYTE
loc270              BYTE
locMRT  BYTE


Process:View         VIEW(SendOuts)
                       PROJECT(SO:Patient)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report SendOuts'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('SendOuts Report'),AT(0,850,8500,9646),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',10, |
  COLOR:Black,FONT:regular),THOUS
MRT                    DETAIL,AT(10,0,8500,2948),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(8500,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         STRING(@D3),AT(1135,750),USE(locDate),TRN
                         STRING('Date:'),AT(781,760),USE(?String1),TRN
                         STRING('Send Out To:'),AT(781,1000),USE(?String3),TRN
                         STRING('MRT Labortories Inc.'),AT(1656,1021),USE(?SendToMRT),TRN
                         STRING(@s32),AT(1375,1615),USE(locPatientName),TRN
                         STRING('From:  Allermetrix     Tel: 615-599-4100  Fax: 615-599-4100'),AT(781,490,3844),USE(?String5), |
  TRN
                         STRING(@p### ###p),AT(1323,2021),USE(SO:Patient),TRN
                         STRING('Test Description'),AT(958,2698),USE(?String12),TRN
                         STRING('Test Type'),AT(3458,2698),USE(?String13),TRN
                         STRING('AI'),AT(781,2021,510,208),USE(?String11),TRN
                         STRING('Patient: '),AT(781,1615),USE(?String6),TRN
                         STRING('Age'),AT(781,1823,510,208),USE(?String16),TRN
                         STRING(@n3),AT(1313,1823),USE(Pat:AGE),TRN
                         STRING(@s1),AT(1610,1823),USE(Pat:AGE_TYPE),TRN
                         STRING('Account:'),AT(781,1229),USE(?AccountString)
                         STRING('185424'),AT(1656,1229,937),USE(?AccountMRT)
                         STRING('Account#'),AT(781,2260),USE(?STRING4)
                         STRING(@n-14),AT(1510,-1030),USE(Pat:CLIENT),RIGHT(1)
                         STRING(@p### ###p),AT(1531,2260),USE(Pat:CLIENT,,?Pat:CLIENT:2)
                       END
Ward                   DETAIL,AT(10,0,8500,2948),USE(?Detail:2)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0:2),COLOR(COLOR:Black)
                         LINE,AT(8500,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@D3),AT(1135,750),USE(locDate,,?locDate:2),TRN
                         STRING('Date:'),AT(781,760),USE(?String1:2),TRN
                         STRING('Send Out To:'),AT(781,1000),USE(?String3:2),TRN
                         STRING('Ward labortories Inc.'),AT(1656,1021),USE(?SendToWard),TRN
                         STRING(@s32),AT(1375,1615),USE(locPatientName,,?locPatientName:2),TRN
                         STRING('From:  Allermetrix     Tel: 615-599-4100  Fax: 615-599-4100'),AT(781,490,3844),USE(?String5:2), |
  TRN
                         STRING(@p### ###p),AT(1323,2021),USE(SO:Patient,,?SO:Patient:2),TRN
                         STRING('Panel Description'),AT(802,2698),USE(?String12:2),FONT(,12,,FONT:bold),TRN
                         STRING('AI'),AT(781,2021,510,208),USE(?String11:2),TRN
                         STRING('Patient: '),AT(781,1615),USE(?String6:2),TRN
                         STRING('Age'),AT(781,1823,510,208),USE(?String16:2),TRN
                         STRING(@n3),AT(1313,1823),USE(Pat:AGE,,?Pat:AGE:2),TRN
                         STRING(@s1),AT(1610,1823),USE(Pat:AGE_TYPE,,?Pat:AGE_TYPE:2),TRN
                         STRING('Account:'),AT(781,1229),USE(?AccountString:2)
                         STRING('069662'),AT(1656,1229,937),USE(?AccountWard)
                         STRING('Account#'),AT(750,2187,583,198),USE(?STRINGAccount2)
                         STRING(@p### ###p),AT(1427,2187,625,198),USE(Pat:CLIENT,,?Pat:CLIENT:3)
                       END
Viracor                DETAIL,AT(10,0,8500,2948),USE(?Detail:3)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0:3),COLOR(COLOR:Black)
                         LINE,AT(8500,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         STRING(@D3),AT(1135,750),USE(locDate,,?locDate:3),TRN
                         STRING('Date:'),AT(781,760),USE(?String1:3),TRN
                         STRING('Send Out To:'),AT(781,1000),USE(?String3:3),TRN
                         STRING(@s16),AT(1656,1021,1646),USE(locInhouse),FONT(,12,,FONT:bold),TRN
                         STRING(@s32),AT(1375,1615),USE(locPatientName,,?locPatientName:3),TRN
                         STRING('From:  Allermetrix     Tel: 615-599-4100  Fax: 615-599-4100'),AT(781,490,3844),USE(?String5:3), |
  TRN
                         STRING(@p### ###p),AT(1323,2021),USE(SO:Patient,,?SO:Patient:3),TRN
                         STRING('Test:'),AT(781,2646),USE(?String12:3),TRN
                         STRING('AI'),AT(781,2021,510,208),USE(?String11:3),TRN
                         STRING('Patient: '),AT(781,1615),USE(?String6:3),TRN
                         STRING('Age'),AT(781,1823,510,208),USE(?String16:3),TRN
                         STRING(@n3),AT(1313,1823),USE(Pat:AGE,,?Pat:AGE:3),TRN
                         STRING(@s1),AT(1610,1823),USE(Pat:AGE_TYPE,,?Pat:AGE_TYPE:3),TRN
                         STRING('Account:'),AT(781,1229),USE(?AccountString:3)
                         STRING('6061'),AT(1656,1229,937),USE(?AccountViracor)
                         STRING('536 Gluten IgA  (0.5mL)'),AT(1323,2646),USE(?STRING2),FONT(,12,,FONT:bold)
                         STRING('Account#'),AT(781,2281,583,198),USE(?STRINGAccount3)
                         STRING(@p### ###p),AT(1427,2281,625,198),USE(Pat:CLIENT,,?Pat:CLIENT:4)
                       END
Test                   DETAIL,AT(0,0,8500,198),USE(?Test)
                         STRING(@s40),AT(802,21),USE(RST:DESCRIPTION),TRN
                         STRING(@s4),AT(3615,21),USE(locTestType),TRN
                       END
Panel                  DETAIL,AT(-10,10,8500,281),USE(?Panel)
                         STRING(@s24),AT(802,73),USE(PAN:Description),FONT(,12,,FONT:bold),TRN
                       END
Space                  DETAIL,AT(0,0,8500,104),USE(?Space)
                       END
PageBreak              DETAIL,AT(10,10,8302,146),USE(?DETAIL34),PAGEAFTER(-1)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepLongClass                         ! Progress Manager

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
  GlobalErrors.SetProcedureName('SummarySendouts')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                                       ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                                      ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SummarySendouts',ProgressWindow)           ! Restore window settings from non-volatile store
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:SendOuts, ?Progress:PctText, Progress:Thermometer, ProgressMgr, SO:Patient)
  ThisReport.AddSortOrder(SO:OrderKey)
  ThisReport.AddRange(SO:Patient)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report)
  ?Progress:UserString{PROP:Text} = ''
  Relate:SendOuts.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Panels.Close
    Relate:Patient.Close
    Relate:Rast.Close
    Relate:SendOuts.Close
  END
  IF SELF.Opened
    INIMgr.Update('SummarySendouts',ProgressWindow)        ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
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


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINTER{PROPPRINT:Copies} = 2
  CLEAR(TEST:Record)
  TST:INVOICE = SO:Patient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP
    NEXT(Test)
    IF TST:INVOICE <>  SO:Patient OR ERRORCODE() THEN BREAK.
    IF TST:CODE = '260' THEN loc260 = TRUE;locViacore = TRUE; locInhouse = 'IN HOUSE TESTING'.
    IF TST:CODE = '260-1' THEN loc260 = TRUE; locInhouse = 'DO NOT TEST'.
    IF TST:CODE = '270' THEN loc270 = TRUE.
    IF gloTestCodeStartsWith2 = 'S0' THEN locMRT = TRUE.
  .  
  OMIT('XXXX')
  PRINT(RPT:MRT)
  PRINT(RPT:Ward)
  PRINT(RPT:Viracor)
  PRINT(RPT:Test)
  PRINT(RPT:Panel)
  PRINT(RPT:Space)
  PRINT(RPT:PageBreak)
  XXXX 

  locPatientName = CLIP(Pat:LAST) & ', ' &  Pat:FIRST
  locDate = Pat:DATE
  IF loc260 OR loc270
    PRINT(RPT:Ward) 
    IF loc260
      Pan:NUMBER =  '260'
      GET(Panels,Pan:ORDER_KEY)
      PRINT(RPT:Panel)
    .
    IF loc270
      Pan:NUMBER =  '270'
      GET(Panels,Pan:ORDER_KEY)
      PRINT(RPT:Panel)
    .
    PRINT(RPT:pageBreak)
  .
  IF loc260 AND locViacore
    PRINT(RPT:Viracor)
    PRINT(RPT:pageBreak)
  .
  
  IF locMRT
    PRINT(RPT:MRT)
    CLEAR(TEST:Record)
    TST:INVOICE = SO:Patient
    SET(TST:ORDER_KEY,TST:ORDER_KEY)
    LOOP
      NEXT(Test)
      IF TST:INVOICE <>  SO:Patient OR ERRORCODE() THEN BREAK.
      IF gloTestCodeStartsWith2 <> 'S0' THEN CYCLE.
      locTestType = gloTypeDescription[TST:TYPE]
      RST:NUMBER = TST:Code
      GET(Rast,RST:Order_Key)
      PRINT(RPT:Test)
    .
    PRINT(RPT:pageBreak)
    
  .


  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the ExportList file
!!! </summary>
ExportBilling PROCEDURE 

CurrentTab           STRING(80)                            !
locPath              STRING(63)                            !
locPatientSuffix     STRING(2)                             !
locCovid             LONG                                  !
locGuarantor         STRING(32)                            !
locFaxDates          BYTE                                  !
locCreateCSV         LONG                                  !
locUndoBilledDate    LONG                                  !
locExportLimit       LONG                                  !
locStatusLowLimit    LONG                                  !
locStatusHighLimit   LONG                                  !
locHighLimit         LONG                                  !
locLowLimit          LONG                                  !
locExportHighLimit   LONG                                  !
locExportLowLimit    LONG                                  !
locIgA               LONG                                  !
locTIgA              STRING(20)                            !
locSuffix            STRING(1)                             !
locPathSAV:Code  STRING(6)
SAV:Score STRING(3)
SAV:Type  BYTE
SAV:Conc  DECIMAL(9,2)
SAV:Status STRING(1)
SAV:Physician STRING(40)
locIgE   BYTE
locIgG   BYTE
locIgG4  BYTE
locSerumRemaining LONG
locStartDate    LONG
locEndDate    LONG
FileName  STRING(128)
locDue  STRING(8)
locClient STRING(8)
locClientName STRING(64)
locMemo STRING(64)
locTIgE LONG
locLevel LONG
locType LONG
locFee    DECIMAL(8,2),DIM(11,7)
locQty LONG,DIM(11,7)
locDescription  STRING(32),DIM(11,7)
locDebug  LONG
locClientID STRING(64)
locBillingType  LONG,DIM(5)
CSVtable                FILE,DRIVER('ASCII'),PRE(CSV),CREATE,NAME(gloFileName4)
          RECORD
Data    STRING(512)
        . .                                    
ClaimList FILE,DRIVER('ASCII'),PRE(CL),CREATE,NAME(gloFileName3)
            RECORD
Data          STRING(512)
          . .           
locCheckValue        BYTE,DIM(8),OVER(BILL:ClientRequestCheckmarks)    
        
BRW1::View:Browse    VIEW(ExportList)
                       PROJECT(EL:FaxDates)
                       PROJECT(EL:Assession)
                       PROJECT(EL:Date)
                       PROJECT(EL:Last)
                       PROJECT(EL:First)
                       PROJECT(EL:Client)
                       PROJECT(EL:BilledDate)
                       PROJECT(EL:Billing)
                       PROJECT(EL:Status)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EL:FaxDates            LIKE(EL:FaxDates)              !List box control field - type derived from field
EL:FaxDates_NormalFG   LONG                           !Normal forground color
EL:FaxDates_NormalBG   LONG                           !Normal background color
EL:FaxDates_SelectedFG LONG                           !Selected forground color
EL:FaxDates_SelectedBG LONG                           !Selected background color
EL:Assession           LIKE(EL:Assession)             !List box control field - type derived from field
EL:Assession_NormalFG  LONG                           !Normal forground color
EL:Assession_NormalBG  LONG                           !Normal background color
EL:Assession_SelectedFG LONG                          !Selected forground color
EL:Assession_SelectedBG LONG                          !Selected background color
EL:Date                LIKE(EL:Date)                  !List box control field - type derived from field
EL:Date_NormalFG       LONG                           !Normal forground color
EL:Date_NormalBG       LONG                           !Normal background color
EL:Date_SelectedFG     LONG                           !Selected forground color
EL:Date_SelectedBG     LONG                           !Selected background color
EL:Last                LIKE(EL:Last)                  !List box control field - type derived from field
EL:Last_NormalFG       LONG                           !Normal forground color
EL:Last_NormalBG       LONG                           !Normal background color
EL:Last_SelectedFG     LONG                           !Selected forground color
EL:Last_SelectedBG     LONG                           !Selected background color
EL:First               LIKE(EL:First)                 !List box control field - type derived from field
EL:First_NormalFG      LONG                           !Normal forground color
EL:First_NormalBG      LONG                           !Normal background color
EL:First_SelectedFG    LONG                           !Selected forground color
EL:First_SelectedBG    LONG                           !Selected background color
EL:Client              LIKE(EL:Client)                !List box control field - type derived from field
EL:Client_NormalFG     LONG                           !Normal forground color
EL:Client_NormalBG     LONG                           !Normal background color
EL:Client_SelectedFG   LONG                           !Selected forground color
EL:Client_SelectedBG   LONG                           !Selected background color
EL:BilledDate          LIKE(EL:BilledDate)            !List box control field - type derived from field
EL:BilledDate_NormalFG LONG                           !Normal forground color
EL:BilledDate_NormalBG LONG                           !Normal background color
EL:BilledDate_SelectedFG LONG                         !Selected forground color
EL:BilledDate_SelectedBG LONG                         !Selected background color
EL:Billing             LIKE(EL:Billing)               !Browse hot field - type derived from field
EL:Status              LIKE(EL:Status)                !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Export to Quickbooks'),AT(,,508,331),FONT('Arial',11,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('ExportBilling'),SYSTEM
                       LIST,AT(222,18,288,253),USE(?Browse:1),VSCROLL,FORMAT('22C(2)|M*~Faxed~@n1@44L(2)|M*~As' & |
  'session~C(0)@s10@33C(2)|M*~Date~C(0)@d1@66L(2)|M*~Last~@s32@45L(2)|M*~First~@s32@36L' & |
  '(1)|M*~Client~C(2)@s8@37C(2)|M*~Billed~C(1)@d1b@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he ExportList file')
                       BUTTON('&Select'),AT(115,299,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,HIDE,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(168,299,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,HIDE,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(221,299,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,HIDE,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(168,314,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),FLAT,HIDE,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('&Delete'),AT(221,314,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,HIDE,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       BUTTON('&Close'),AT(438,299,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(279,180,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING('Start Date'),AT(26,68),USE(?String2),TRN
                       STRING('End Date'),AT(28,84),USE(?String3),TRN
                       ENTRY(@D1),AT(66,84,60,10),USE(locEndDate)
                       BUTTON('&Refresh'),AT(65,117,67,22),USE(?Generate),DEFAULT
                       STRING('CSV File Name'),AT(98,276),USE(?String5),TRN
                       STRING(@s20),AT(66,100,69,10),USE(Pat:INVOICE),TRN
                       BUTTON('&Cancel'),AT(234,202,64,14),USE(?CancelButton),LEFT,HIDE
                       STRING(@s128),AT(152,276,284,10),USE(gloFileName4),TRN
                       ENTRY(@D1),AT(66,68,60,10),USE(locStartDate)
                       SHEET,AT(222,0,288,274),USE(?CurrentTab)
                         TAB('Not Ready '),USE(?TAB1)
                         END
                         TAB(' Ready to Post '),USE(?TAB2)
                         END
                         TAB(' Billed '),USE(?TAB3)
                           ENTRY(@D2),AT(358,287,70,13),USE(locUndoBilledDate),TRN
                           BUTTON('Undo Billed Date'),AT(358,299),USE(?ButtonUndoBilledDate),FLAT,SKIP,TRN
                         END
                       END
                       BUTTON('Post'),AT(65,166,67,22),USE(?ButtonPost),FONT(,,,FONT:regular),HIDE,SKIP
                       BUTTON('SelectPayer'),AT(30,234),USE(?ButtonSelectPayer),HIDE
                       STRING('Missing Addr/Insurance'),AT(2,256,88),USE(?STRING1),FONT(,,COLOR:White,FONT:bold), |
  CENTER,COLOR(COLOR:Red)
                       STRING('Fee Table'),AT(2,266,88),USE(?STRING4),FONT(,,COLOR:Black,FONT:bold),CENTER,COLOR(COLOR:Aqua)
                       STRING('Send Out'),AT(2,277,88,10),USE(?STRING6),FONT(,,,FONT:bold),CENTER,COLOR(COLOR:Lime)
                       STRING('No Bill Type'),AT(2,286,88),USE(?STRING7),FONT(,,,FONT:bold),CENTER,COLOR(COLOR:Yellow)
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
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 1
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
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
AddCSV  ROUTINE
  IF Pat:CLIENT = 500258 THEN  locClientID =  CLM:ClientBillingID.  
  locGuarantor = CLIP(Pat:LAST) & ', ' & CLIP(Pat:FIRST)
  IF BILL:GuarantorName THEN locGuarantor = BILL:GuarantorName.
  IF locCreateCSV
    IF Pat:BILLING = 'C' OR Pat:BILLING = 'E'
      CSV:Data = '"' & CLIP(locMemo)& '  ' &  CLIP(PAT:FIRST) & ' ' & CLIP(Pat:LAST)  & '","' & locClient & '","' & CLIP(locClientName)                    & '","' & CLIP(CLI:ADDRESS1)         & '","' & CLIP(CLI:ADDRESS2)         & '","' & CLIP(CLI:CITY)         & '","' & CLIP(CLI:STATE)         & '","' & CLIP(CLI:ZIP)            & '","Net 30","'  &  PAT:Invoice & '","' & CLIP(locGuarantor) & '","' & CLIP(locClientName) & '","' & CLIP(locClientID) & '","' & CLIP(locDescription[locLevel,locType]) & '","' & CLIP(locDescription[locLevel,locType]) & '",' & locQty[locLevel,locType] & ',' & locFee[locLevel,locType] & ',' & (locQty[locLevel,locType] * locFee[locLevel,locType]) & ',"' & LEFT(FORMAT(PAT:Date,@d1)) & '","' & LEFT(locDue) & '"'
    ELSE
      CSV:Data = '"' & CLIP(locMemo)& '  ' &  CLIP(PAT:FIRST) & ' ' & CLIP(Pat:LAST)  & '","' & locClient & '","' & CLIP(PAT:FIRST) & ' ' & CLIP(Pat:LAST) & '","'  & CLIP(BILL:AddressPatient) & '","' & CLIP(BILL:Address2Patient) & '","' & CLIP(BILL:CityPatient) & '","' & CLIP(BILL:StatePatient) & '","' & CLIP(BILL:PostalPatient) & '","Net 30","'  &  PAT:Invoice & locSuffix & '","' & CLIP(locGuarantor) & '","' & CLIP(locClientName) & '","' & CLIP(locClientID) & '","' & CLIP(locDescription[locLevel,locType]) & '","' & CLIP(locDescription[locLevel,locType]) & '",' & locQty[locLevel,locType] & ',' & locFee[locLevel,locType] & ',' & (locQty[locLevel,locType] * locFee[locLevel,locType]) & ',"' & LEFT(FORMAT(PAT:Date,@d1)) & '","' & LEFT(locDue) & '"'
    .
    ADD(CSVtable)  
    IF ERRORCODE()
      STOP('ADD CSV ' & Pat:INVOICE & ': ' & ERROR()) 
      EXIT
    .
  . 
  FLUSH(CSVtable)
                          
Refresh ROUTINE
        SHARE(TEST)
        locDebug = FALSE
        locDescription[9,1] = 'Viral IgM'
        locDescription[9,2] = 'Viral IgG'
        locDescription[1,1] = 'Routine IgE'
        locDescription[1,2] = 'Routine IgG'
        locDescription[1,3] = 'Routine IgG4'
        locDescription[2,1] = 'Insects, Hymenoptera IgE'
        locDescription[2,2] = 'Insects, Hymenoptera IgG'
        locDescription[2,3] = 'Insects, Hymenoptera IgG4'
        locDescription[3,1] = 'Mix IgE'
        locDescription[3,2] = 'Mix IgG'
        locDescription[3,3] = 'Mix IgG4'
        locDescription[4,1] = 'Occupational IgE'
        locDescription[4,2] = 'Occupational IgG'
        locDescription[4,3] = 'Occupational IgG4'
        locDescription[5,1] = 'Chem/Drug IgE'
        locDescription[5,2] = 'Chem/Drug IgG'
        locDescription[5,3] = 'Chem/Drug IgG4'
        locDescription[8,1] = 'Component IgE'
        locDescription[8,2] = 'Component IgG'
        locDescription[8,3] = 'Component IgG4'
        locDescription[9,1] = 'G-RBD'
        locDescription[9,2] = 'M-RBD'
        locDescription[10,1] = 'G-NP'
        locDescription[10,2] = 'M-NP'
        locDescription[11,1] = 'G-S1'
        locDescription[11,2] = 'M-S1'
    
        
        CLOSE(ExportList)
        CREATE(ExportList)
        OPEN(ExportList)
              Pat:DATE = locStartDate
              PAT:INVOICE = 0
              SET(PAT:DATE_KEY,PAT:DATE_KEY)
              LOOP UNTIL EOF(Patient)
                NEXt(Patient)
                IF PAT:Date > locEndDate THEN BREAK.
                IF PAT:CLIENT > 799999 THEN CYCLE.  
                IF Pat:STATUS = 'X' THEN CYCLE.
                IF Pat:STATUS = 'L' THEN CYCLE.    
                CLI:Number = PAT:Client
                GET(Client,CLI:ORDER_KEY)
                IF ERRORCODE() OR Pat:CLIENT < 100000
                  STOP('GET CLIENT ' & PAT:Client & ': ' & ERROR() & ', PAT: ' & Pat:INVOICE)
                  CYCLE
                .  
                IF ~CLI:BILLING THEN CLI:BILLING = CLI:NUMBER.  
                EL:Client = CLI:BILLING & '-' & Pat:BILLING
                BILL:Accession = PAT:Invoice
                GET(Billing,BILL:patKey)   
                CLM:Patient = Pat:INVOICE
                GET(Claims,CLM:OrderKey) 
                EL:FaxDates = 0 
                IF BILL:DateFax1 THEN EL:FaxDates = 1.
                IF BILL:DateFax2 THEN EL:FaxDates = 2.
                    
                IF (~BILL:CityPatient OR ~BILL:VerifiedBy2) AND Pat:BILLING <> 'C'  AND Pat:BILLING <> 'E' 
                  EL:Assession = Pat:INVOICE & ' ' & locPatientSuffix
                  EL:Last = Pat:LAST
                  EL:First = Pat:FIRST 
                  EL:BilledDate = Pat:BILLED  
                  EL:Date = Pat:DATE
                  EL:Status = 1    ! put on Not Ready Tab in Red
                  ADD(ExportList)  ! add to NOT READY export tab
                  CYCLE   ! skip QB export and get next patient.
                .     
                    
                IF ~Pat:BILLED AND (Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A')
              
                  IF ~BILL:CityPatient OR ~CLM:Physician OR ~CLM:DiagCode1 OR ~CLM:NPI  OR ~CLM:PlanID OR ~BILL:VerifiedBy2  
                 ! STOP(CLM:Physician & ', ' &  CLM:DiagCode1 & ', ' &  CLM:NPI  & ', ' &  CLM:PlanID  )
                     EL:Status = 1  
                     IF Pat:BILLED 
                       EL:Status = -1 
                     .          
                     EL:BilledDate = Pat:BILLED
                     EL:Assession = Pat:INVOICE !& ' ' & Pat:BILLING
                     EL:Last = Pat:STATUS & '-' & Pat:LAST
                     EL:First = Pat:FIRST   
                     EL:Date = Pat:DATE
                     ADD(ExportList)         
                     CYCLE  
                  . 
                .
                locPatientSuffix = ''  ! for secondary
                IF FALSE !Pat:Attributes AND Pat:BILLING = 'I' REMOVED 7/26/22 Cigna putting patietnts on hold
                    EL:BilledDate = Pat:BILLED
                    EL:Date = Pat:DATE
                    EL:Assession =  Pat:INVOICE & '-' & Pat:STATUS
                    EL:Last = Pat:LAST
                    EL:First = Pat:FIRST
                    EL:Status = 2   
                    ADD(ExportList) 
                    CYCLE
                .
                IF Pat:STATUS <> 'C' 
                  IF Pat:BILLING = 'C' AND Pat:BILLED < DATE(1,1,2000) AND Pat:STATUS <> 'W' AND Pat:STATUS <> 'X' AND Pat:STATUS <> 'H'  
                    IF Pat:STATUS = 'I' AND TODAY() - Pat:DATE < 8 THEN CYCLE.
                    
                    EL:BilledDate = Pat:BILLED
                    EL:Date = Pat:DATE
                    EL:Assession =  Pat:INVOICE & '-' & Pat:STATUS
                    EL:Last = Pat:LAST
                    EL:First = Pat:FIRST
                    EL:Status = 4   
                    ADD(ExportList) 
                  .
                  CYCLE
                .
                locIgA = 0
                locTIgA = 0  
                IF LEN(CLIP(Pat:CLIENT_ID)) = 0
                  Pat:CLIENT_ID = 'NG' 
                .
                IF PAT:COLLECTION = 0
                  locClientID = 'ID: ' & LEFT(CLIP(Pat:CLIENT_ID) & '  Drawn: NG' )
                ELSE 
                  locClientID = 'ID: ' & LEFT(CLIP(Pat:CLIENT_ID) & '  Drawn: ' &  FORMAT(Pat:COLLECTION,@D1))
                .
                IF Pat:BILLING = 'P' THEN locClient = CLI:BILLING & '-4'; locMemo = 'Patient Bill';FEE:Client = 999991;EL:Billing = 4.
                IF Pat:BILLING = 'I' THEN locClient = CLI:BILLING & '-1'; locMemo = 'Insurance Bill';FEE:Client = 999990;EL:Billing = 1.
                IF Pat:BILLING = 'A' THEN locClient = CLI:BILLING & '-2'; locMemo = 'Medicaid Bill';FEE:Client = 999990;EL:Billing = 2.
                IF Pat:BILLING = 'M' THEN locClient = CLI:BILLING & '-3'; locMemo = 'Medicare Bill';FEE:Client = 999990;EL:Billing = 3.  
                IF Pat:BILLING = 'C'   
                  IF INRANGE(CLI:NUMBER,99999,199999) THEN FEE:Client = 999993.
                  locClient = CLI:BILLING & '-0'; locMemo = 'Client ID: ' & Pat:CLIENT_ID;FEE:Client = CLI:BILLING;EL:Billing = 0
                  IF CLI:BILLING <> PAT:CLIENT
                    CLI:NUMBER = CLI:BILLING
                    GET(CLIENT,CLI:ORDER_KEY)
                    IF ERRORCODE() 
                      STOP('GET BILLED CLIENT ' & PAT:Client & ': ' & ERROR() & ', PAT: ' & Pat:INVOICE)
                      CYCLE
                    .                
                  .
                . 
                IF CLM:PlanID2 OR CLM:MemberID2 OR CLM:PlanName2 THEN locPatientSuffix = '-S'.
                IF CLI:NUMBER < 20000 THEN FEE:Client = 999993.
                EL:BilledDate = Pat:BILLED
                EL:Date = Pat:DATE
                EL:Assession = Pat:INVOICE & ' ' & locPatientSuffix
                EL:Last = Pat:LAST
                EL:First = Pat:FIRST
                IF Pat:BILLED 
                  EL:Status = -1
                  ADD(ExportList)                   
                  CYCLE
                .
                IF CLIP(Pat:BILLING) = ''
            !     STOP('NO BILLING TYPE PAT: ' & Pat:INVOICE)
                  EL:Status = 2
                  ADD(ExportList)                  
                  CYCLE
                .  
                
                EL:Status = 0    
                EL:Date = Pat:DATE
                EL:Assession = Pat:INVOICE & ' ' & locPatientSuffix
                EL:BilledDate = Pat:BILLED
                EL:Last = BILL:VerifiedBy2 & Pat:LAST
                EL:First = Pat:FIRST 
                EL:Verified = '' 
                IF BILL:VerifiedBy2
                  EL:Verified = 'X' 
                .
                ADD(ExportList)  
                EL:Verified = '' 
                IF ERRORCODE() THEN STOP('EL ' & Pat:INVOICE & ': ' & ERROR()).
                
                locIgE = 0
                locIgG = 0
                locIgG4 = 0
                locTIgE = 0
                CLEAR(locQty)
                locDue = FORMAT(Pat:DATE + 30,@D1)
                SAV:Physician = gloPatientNotes[1]
                DISPLAY(?PAT:Invoice)
                IF CLI:FIRST
                  locClientName = CLIP(CLI:FIRST) & ' ' & CLIP(CLI:LAST) & ' ' & CLI:DEGREE
                ELSE
                  locClientName = CLI:LAST
                .
               
                GET(Fees,FEE:OrderKey)
                IF ERRORCODE() OR FEE:IgE = 0
                !  STOP('FEES: ' & ERROR() & ', CLI:' & CLI:BILLING & ', PAT: ' & PAT:Invoice)
                  EL:Status = 3                
                  ADD(ExportList)
                  CYCLE
                .  
                IF FEE:Virus = 0
                  FEE:Virus = 50
                  PUT(Fees)
                .
                IF Pat:BILLING = 'N' THEN Pat:BILLING = 'E'.
                IF Pat:BILLING = 'E' 
                  CLEAR(FEE:Record)
                  locClient = CLI:BILLING 
                  EL:Status =  0
                .
                BILL:Accession = PAT:Invoice
                GET(Billing,BILL:patKey)
                IF ERRORCODE() 
                  CLEAR(BILL:Record)
                  BILL:Accession = Pat:INVOICE
                  locCheckValue[1] = 0
                  locCheckValue[2] = 0
                  locCheckValue[3] = 0
                  locCheckValue[4] = 0
                  locCheckValue[5] = 0                  
                  ADD(BILLING)
                .
  
                locCovid = FALSE
                TST:Invoice = PAT:Invoice
                TST:Type = 0
                TST:Code = ''
                SET(TST:Order_Key,TST:Order_Key)
                LOOP UNTIL EOF(TEST)
                  NEXT(Test)
                  IF TST:Invoice <> PAT:Invoice THEN  BREAK.
                  IF TST:Status = 'X' THEN CYCLE.
                  IF TST:Type = 0 THEN CYCLE.
                  IF locDebug THEN STOP(TST:CODE & ', ' & TST:TYPE & ', ' & TST:INVOICE).
                  IF gloTestCodeStartsWith2 = 'S1'
                    locLevel = 7     
                    locType = 7
                    locQty[locLevel,locType] = 1
                    locFee[locLevel,locType] = FEE:PANEL260
                    IF TST:Code = 'S114'
                      locDescription[locLevel,locType] = 'Gliadin IgG Ab, Deaminated'
                    ELSIF TST:Code = 'S115'
                      locDescription[locLevel,locType] = 'Gliadin IgA Ab, Deaminated'
                    ELSIF TST:Code = 'S124'
                      locDescription[locLevel,locType] = 'T. Transglutaminase Ab, IgG'                
                    ELSIF TST:Code = 'S125'
                      locDescription[locLevel,locType] = 'Total IgA'
                      locFee[locLevel,locType] = FEE:TIGA 
                      DO AddCSV  
                      locLevel = 7     
                      locType = 7
                      locQty[locLevel,locType] = 1
                      locFee[locLevel,locType] = FEE:PANEL260                      
                      locDescription[locLevel,locType] = 'T. Transglutaminase Ab, IgA'                
                    ELSIF TST:Code = 'S130'
                      locDescription[locLevel,locType] = 'Reticulin T. Autoantibody'
                    ELSIF TST:Code = 'S145'                                           
                      IF FEE:Client = 999990 THEN locIgA = 1;CYCLE.  
                      locDescription[locLevel,locType] = 'Gluten IgA'
                      locFee[locLevel,locType] = FEE:PANEL260S145
                    . 
                    DO AddCSV
                  ELSIF SUB(TST:Code,1,3) = '100' 
                    IF ~locTIgE
                      locTIgE = 1 
                      locType = 7
                      locLevel = 7
                      locDescription[locLevel,locType] = 'Total IgE'
                      locFee[locLevel,locType] = FEE:TIGE 
                      locQty[locLevel,locType] = 1
                      DO AddCSV
                    .
                  ELSIF INRANGE(TST:Type,7,8) 
                    IF ~locCovid
                      locCovid = TRUE  
                      IF ~BILL:CovidPostDate
                        EC:Accession = Pat:INVOICE
                        EC:State = CLI:STATE
                        Add(ExportCovid)
                      .
                    .
                    IF TST:Code = 'A099' OR  TST:Code = 'A100'
                      locLevel = 9
                    ELSIF TST:Code = 'A101' OR  TST:Code = 'A102'
                      locLevel =  10
                    ELSE
                      locLevel =  11
                    .
                    IF TST:Type = 7
                      locType = 1
                      locQty[locLevel,locType] += 1 
                    ELSE 
                      locType = 2
                      locQty[locLevel,locType] += 1 
                    . 
                    CYCLE
                  !  DO AddCSV

                  ELSE
                    RST:Number = TST:Code
                    GET(Rast,RST:ORDER_KEY)
                    IF ERRORCODE()
                      STOP('RAST: ' & ERROR() & ', ' & TST:Code & ', PAT: ' & PAT:Invoice)
                      CYCLE
                    . 
                    IF RST:FeeLevel < 1 OR RST:FeeLevel > 8
                      STOP('Rast Fee Level = ' & RST:FeeLevel & ', for: ' & TST:Code)
                      CYCLE
                    .     
                    IF TST:CODE = 'E103' OR TST:CODE = 'F395' OR TST:CODE = 'F357' OR TST:CODE = 'F076' OR TST:CODE = 'F077' OR TST:CODE = 'F078' OR TST:CODE = 'F359' OR TST:CODE = 'F360' OR TST:CODE = 'F372' OR TST:CODE = 'F019'
                      RST:FeeLevel = 8
                    .
                    locQty[RST:FeeLevel,TST:Type] += 1
                . .
                locFee[1,1] = FEE:IGE
                locFee[1,2] = FEE:IGG
                locFee[1,3] = FEE:IGG4
                locFee[2,1] = FEE:HYIGE
                locFee[2,2] = FEE:HYIGG
                locFee[2,3] = FEE:HYIGG4
                locFee[3,1] = FEE:MXIGE
                locFee[3,2] = FEE:MXIGE
                locFee[3,3] = FEE:MXIGE
                locFee[4,1] = FEE:OCCIGE
                locFee[4,2] = FEE:OCCIGG
                locFee[4,3] = FEE:OCCIGG4
                locFee[5,1] = FEE:CHEMIGE            
                locFee[5,2] = FEE:CHEMIGG            
                locFee[5,3] = FEE:CHEMIGG4  
                locFee[8,1] = FEE:ComponentIgE            
                locFee[8,2] = FEE:ComponentIgG            
                locFee[8,3] = FEE:ComponentIgG4  
                locFee[9,1] = FEE:Virus  
                locFee[9,2] = FEE:Virus  
                locFee[10,1] = FEE:Virus  
                locFee[10,2] = FEE:Virus  
                locFee[11,1] = FEE:Virus  
                locFee[11,2] = FEE:Virus  
                LOOP locLevel = 1 TO 6
                  LOOP locType = 1 TO 6
                    IF locQty[locLevel,locType] > 0 
                      DO AddCSV
                . . . 
                LOOP locLevel = 9 TO 11
                  LOOP locType = 1 TO 2
                    IF locQty[locLevel,locType] > 0 
                      DO AddCSV
                . . . 
                locLevel = 8
                LOOP locType = 1 TO 3
                  IF locQty[locLevel,locType] > 0 
                    DO AddCSV
                . . 
                IF locIgA
                  locType = 7
                  locLevel = 7
                  Pat:BILLING = 'P' 
                  locClient = CLI:BILLING & '-4'
                  locMemo = 'Patient Bill'
                  FEE:Client = 999991
                  GET(Fees,FEE:OrderKey)
                  EL:Billing = 4
                  locQty[locLevel,locType] = 1
                  locDescription[locLevel,locType] = 'Gluten IgA'
                  locFee[locLevel,locType] = FEE:PANEL260S145 
                  locSuffix = 'P'
                  DO AddCSV 
                  locSuffix = ''
                .            
              .          
              CLOSE(Test)
              BRW1.ResetFromFile() 

                          


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ExportBilling')
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
  Relate:Billing.Open                             ! File Billing used by this procedure, so make sure it's RelationManager is open
  Relate:Claims.Open                              ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:ExportCovid.Open                         ! File ExportCovid used by this procedure, so make sure it's RelationManager is open
  Relate:ExportList.Open                          ! File ExportList used by this procedure, so make sure it's RelationManager is open
  Relate:Fees.Open                                ! File Fees used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                          ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:ExportList,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,EL:OrderKey)                 ! Add the sort order for EL:OrderKey for sort order 1
  BRW1.AddRange(EL:Status,locExportLimit)         ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort3:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort3:Locator.Init(,EL:Assession,1,BRW1)  ! Initialize the browse locator using  using key: EL:OrderKey , EL:Assession
  BRW1.AddSortOrder(,EL:OrderKey)                 ! Add the sort order for EL:OrderKey for sort order 2
  BRW1.AddRange(EL:Status,locStatusLowLimit,locStatusHighLimit) ! Add 'range of values' range limit for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,EL:Status,1,BRW1)     ! Initialize the browse locator using  using key: EL:OrderKey , EL:Status
  BRW1.SetFilter('(EL:BilledDate = 0)')           ! Apply filter expression to browse
  BRW1.AddSortOrder(,EL:BilledKey)                ! Add the sort order for EL:BilledKey for sort order 3
  BRW1.AddRange(EL:BilledDate,locLowLimit,locHighLimit) ! Add 'range of values' range limit for sort order 3
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 3
  BRW1::Sort1:Locator.Init(,EL:BilledDate,1,BRW1) ! Initialize the browse locator using  using key: EL:BilledKey , EL:BilledDate
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon EL:Status for sort order 4
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,EL:OrderKey) ! Add the sort order for EL:OrderKey for sort order 4
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 4
  BRW1::Sort0:Locator.Init(,EL:Status,1,BRW1)     ! Initialize the browse locator using  using key: EL:OrderKey , EL:Status
  BRW1.AddField(EL:FaxDates,BRW1.Q.EL:FaxDates)   ! Field EL:FaxDates is a hot field or requires assignment from browse
  BRW1.AddField(EL:Assession,BRW1.Q.EL:Assession) ! Field EL:Assession is a hot field or requires assignment from browse
  BRW1.AddField(EL:Date,BRW1.Q.EL:Date)           ! Field EL:Date is a hot field or requires assignment from browse
  BRW1.AddField(EL:Last,BRW1.Q.EL:Last)           ! Field EL:Last is a hot field or requires assignment from browse
  BRW1.AddField(EL:First,BRW1.Q.EL:First)         ! Field EL:First is a hot field or requires assignment from browse
  BRW1.AddField(EL:Client,BRW1.Q.EL:Client)       ! Field EL:Client is a hot field or requires assignment from browse
  BRW1.AddField(EL:BilledDate,BRW1.Q.EL:BilledDate) ! Field EL:BilledDate is a hot field or requires assignment from browse
  BRW1.AddField(EL:Billing,BRW1.Q.EL:Billing)     ! Field EL:Billing is a hot field or requires assignment from browse
  BRW1.AddField(EL:Status,BRW1.Q.EL:Status)       ! Field EL:Status is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('ExportBilling',QuickWindow)       ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','ExportBilling',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,35,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:wallpaper} = glowallPaper  
  IF ~BAND(gloPermissions,ACCESS:Workpool) THEN RETURN(0).
  IF BAND(gloPermissions,ACCESS:Financials) THEN UNHIDE(?ButtonPost). 
  locCreateCSV = FALSE
  gloFileName4 = LONGPATH(gloFileName4)
  locStartDate = DATE(8,1,2023) !;TODAY() - 30
  locEndDate = TODAY() 
    !    IF locStartDate < 79598 THEN locStartDate = 79598.
  locLowLimit = 79598
  locHighLimit = 99999
  locExportLimit = 0
  locStatusLowLimit = 1 
  locStatusHighLimit = 4  
   !     locStartDate = 79598   
   POST(EVENT:Accepted,?Generate)  
   SHARE(Claims)
   
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
    Relate:Billing.Close
    Relate:Claims.Close
    Relate:Client.Close
    Relate:ExportCovid.Close
    Relate:ExportList.Close
    Relate:Fees.Close
    Relate:Rast.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('ExportBilling',QuickWindow)             ! Save window data to non-volatile store
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
    UpdateExportList
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
    OF ?ButtonPost
      
      CASE MESSAGE('Are you on the server?',,,BUTTON:YES + BUTTON:NO,BUTTON:NO)  
      OF BUTTON:NO
      OF BUTTON:YES
      
      CREATE(ExportCovid)
      OPEN(ExportCovid)
      gloFileName4 = '..\EXPORT\Export ' & FORMAT(locStartDate,@d11) & '-' &  FORMAT(locEndDate,@d11) & '-' &   FORMAT(CLOCK(),@T2) &  '.CSV'         
      CREATE(CSVtable)
      IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
      OPEN(CSVtable)
      IF ERRORCODE() THEN STOP('CSV: ' & ERROR()).
      CSV:Data = '"Memo","Customer","BillTo Line1","BillTo Line2","BillTo Line3","BillTo City","BillTo State","BillTo PostalCode","Terms","RefNumber","patient name","client name","client id","Item","Description","Quantity","Price","Other1","FOB","Due Date"'
      ADD(CSVtable) 
      locCreateCSV = TRUE
      DO Refresh  
      locCreateCSV = FALSE   
      
      gloFileName3 = '.\ChangeCare\claims.lst' 
      CLOSE(ClaimList)
      CREATE(ClaimList)
      IF ERRORCODE() THEN STOP('CL: ' & ERROR()).
      SHARE(ClaimList)
      IF ERRORCODE() THEN STOP('CL: ' & ERROR()). 
      
      CLEAR(EL:Record)
      SET(EL:OrderKey,EL:OrderKey)
      IF ERRORCODE() THEN STOP('UPDATE SET EL' & ERROR()).
      LOOP WHILE TRUE !UNTIL EOF(ExportList)
        NEXT(ExportList)
        IF ERRORCODE() THEN BREAK.
        IF EL:STATUS <> 0 THEN CYCLE.  
        Pat:INVOICE = EL:Assession
        GET(Patient,Pat:INVOICE_KEY)
        IF ERRORCODE() THEN STOP('UPDATE GET PAT:' & ERROR()).
        Pat:BILLED = TODAY()
        PUT(Patient)
        EL:BilledDate = TODAY()
        EL:Status = -1
        PUT(ExportList) 
        
        IF ERRORCODE() THEN STOP('UPDATE PUT EL: ' & ERROR()).  
        IF Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A'  
          ExportInsurance  
          CL:Data = Pat:INVOICE & '.txt'
          ADD(ClaimList)
          IF ERRORCODE() THEN STOP('CL ' & Pat:INVOICE & ': ' & ERROR()).
      !      STOP('CL2 ' & Pat:INVOICE & ': ' & ERROR())
        .
      .  
      CLOSE(CSVtable)
      CLOSE(ClaimList)
      SETPATH('.\ChangeCare') 
      locPath = LONGPATH(path())
      RUN('CMD /C 7z a  -tzip claims' & FORMAT(TODAY(),@D11) & '-' & FORMAT(CLOCK(),@t2) & '.ZIP @CLAIMS.LST',1) 
      RUN('CMD /C del *.txt')  
      SETPATH('..\')   
      . 
      DO REFRESH
       
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Generate
      ThisWindow.Update
      DO Refresh      
      
      
              
      
              
              
                    
      
      ! End of "Processed Code"
      ! Start of "Procedure Routines"
      ! [Priority 4000]
    OF ?ButtonUndoBilledDate
      ThisWindow.Update
        CLEAR(ExportList)
        EL:Status = -1
        SET(EL:OrderKey,EL:OrderKey)
        LOOP WHILE TRUE ! UNTIL EOF(ExportList)
          NEXT(ExportList)
          IF ERRORCODE() THEN BREAK.
          IF EL:Status <> -1 THEN BREAK.
          IF locUndoBilledDate = EL:BilledDate
            Pat:INVOICE = EL:Assession
            GET(Patient,Pat:INVOICE_KEY)
            IF Pat:BILLED = locUndoBilledDate
              Pat:BILLED = 0
              PUT(Patient)
              EL:Status = 0
              EL:BilledDate = 0
              PUT(ExportList)
            ELSE
              STOP('INCORECT BILLED DATE Pat: ' & PAT:INVOICE)
        . . .
        BRW1.ResetFromFile()
    OF ?ButtonSelectPayer
      ThisWindow.Update
      SelectPayer()
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 1
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(3,Force)
  ELSE
    RETURN SELF.SetSort(4,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (EL:Status = 1)
    SELF.Q.EL:FaxDates_NormalFG = 16777215                 ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 255
    SELF.Q.EL:FaxDates_SelectedFG = 255
    SELF.Q.EL:FaxDates_SelectedBG = 16777215
    SELF.Q.EL:Assession_NormalFG = 16777215                ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 255
    SELF.Q.EL:Assession_SelectedFG = 255
    SELF.Q.EL:Assession_SelectedBG = 16777215
    SELF.Q.EL:Date_NormalFG = 16777215                     ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 255
    SELF.Q.EL:Date_SelectedFG = 255
    SELF.Q.EL:Date_SelectedBG = 16777215
    SELF.Q.EL:Last_NormalFG = 16777215                     ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 255
    SELF.Q.EL:Last_SelectedFG = 255
    SELF.Q.EL:Last_SelectedBG = 16777215
    SELF.Q.EL:First_NormalFG = 16777215                    ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 255
    SELF.Q.EL:First_SelectedFG = 255
    SELF.Q.EL:First_SelectedBG = 16777215
    SELF.Q.EL:Client_NormalFG = 16777215                   ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 255
    SELF.Q.EL:Client_SelectedFG = 255
    SELF.Q.EL:Client_SelectedBG = 16777215
    SELF.Q.EL:BilledDate_NormalFG = 16777215               ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 255
    SELF.Q.EL:BilledDate_SelectedFG = 255
    SELF.Q.EL:BilledDate_SelectedBG = 16777215
  ELSIF (EL:Status = 2)
    SELF.Q.EL:FaxDates_NormalFG = 0                        ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 65535
    SELF.Q.EL:FaxDates_SelectedFG = 65535
    SELF.Q.EL:FaxDates_SelectedBG = 0
    SELF.Q.EL:Assession_NormalFG = 0                       ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 65535
    SELF.Q.EL:Assession_SelectedFG = 65535
    SELF.Q.EL:Assession_SelectedBG = 0
    SELF.Q.EL:Date_NormalFG = 0                            ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 65535
    SELF.Q.EL:Date_SelectedFG = 65535
    SELF.Q.EL:Date_SelectedBG = 0
    SELF.Q.EL:Last_NormalFG = 0                            ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 65535
    SELF.Q.EL:Last_SelectedFG = 65535
    SELF.Q.EL:Last_SelectedBG = 0
    SELF.Q.EL:First_NormalFG = 0                           ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 65535
    SELF.Q.EL:First_SelectedFG = 65535
    SELF.Q.EL:First_SelectedBG = 0
    SELF.Q.EL:Client_NormalFG = 0                          ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 65535
    SELF.Q.EL:Client_SelectedFG = 65535
    SELF.Q.EL:Client_SelectedBG = 0
    SELF.Q.EL:BilledDate_NormalFG = 0                      ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 65535
    SELF.Q.EL:BilledDate_SelectedFG = 65535
    SELF.Q.EL:BilledDate_SelectedBG = 0
  ELSIF (EL:Status = 3)
    SELF.Q.EL:FaxDates_NormalFG = 0                        ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 16776960
    SELF.Q.EL:FaxDates_SelectedFG = 16776960
    SELF.Q.EL:FaxDates_SelectedBG = 0
    SELF.Q.EL:Assession_NormalFG = 0                       ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 16776960
    SELF.Q.EL:Assession_SelectedFG = 16776960
    SELF.Q.EL:Assession_SelectedBG = 0
    SELF.Q.EL:Date_NormalFG = 0                            ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 16776960
    SELF.Q.EL:Date_SelectedFG = 16776960
    SELF.Q.EL:Date_SelectedBG = 0
    SELF.Q.EL:Last_NormalFG = 0                            ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 16776960
    SELF.Q.EL:Last_SelectedFG = 16776960
    SELF.Q.EL:Last_SelectedBG = 0
    SELF.Q.EL:First_NormalFG = 0                           ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 16776960
    SELF.Q.EL:First_SelectedFG = 16776960
    SELF.Q.EL:First_SelectedBG = 0
    SELF.Q.EL:Client_NormalFG = 0                          ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 16776960
    SELF.Q.EL:Client_SelectedFG = 16776960
    SELF.Q.EL:Client_SelectedBG = 0
    SELF.Q.EL:BilledDate_NormalFG = 0                      ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 16776960
    SELF.Q.EL:BilledDate_SelectedFG = 16776960
    SELF.Q.EL:BilledDate_SelectedBG = 0
  ELSIF (EL:Status = -1)
    SELF.Q.EL:FaxDates_NormalFG = 16777215                 ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 0
    SELF.Q.EL:FaxDates_SelectedFG = 0
    SELF.Q.EL:FaxDates_SelectedBG = 16777215
    SELF.Q.EL:Assession_NormalFG = 16777215                ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 0
    SELF.Q.EL:Assession_SelectedFG = 0
    SELF.Q.EL:Assession_SelectedBG = 16777215
    SELF.Q.EL:Date_NormalFG = 16777215                     ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 0
    SELF.Q.EL:Date_SelectedFG = 0
    SELF.Q.EL:Date_SelectedBG = 16777215
    SELF.Q.EL:Last_NormalFG = 16777215                     ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 0
    SELF.Q.EL:Last_SelectedFG = 0
    SELF.Q.EL:Last_SelectedBG = 16777215
    SELF.Q.EL:First_NormalFG = 16777215                    ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 0
    SELF.Q.EL:First_SelectedFG = 0
    SELF.Q.EL:First_SelectedBG = 16777215
    SELF.Q.EL:Client_NormalFG = 16777215                   ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 0
    SELF.Q.EL:Client_SelectedFG = 0
    SELF.Q.EL:Client_SelectedBG = 16777215
    SELF.Q.EL:BilledDate_NormalFG = 16777215               ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 0
    SELF.Q.EL:BilledDate_SelectedFG = 0
    SELF.Q.EL:BilledDate_SelectedBG = 16777215
  ELSIF (EL:Status = 0 )
    SELF.Q.EL:FaxDates_NormalFG = 0                        ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 12632256
    SELF.Q.EL:FaxDates_SelectedFG = 12632256
    SELF.Q.EL:FaxDates_SelectedBG = 0
    SELF.Q.EL:Assession_NormalFG = 0                       ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 12632256
    SELF.Q.EL:Assession_SelectedFG = 12632256
    SELF.Q.EL:Assession_SelectedBG = 0
    SELF.Q.EL:Date_NormalFG = 0                            ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 12632256
    SELF.Q.EL:Date_SelectedFG = 12632256
    SELF.Q.EL:Date_SelectedBG = 0
    SELF.Q.EL:Last_NormalFG = 0                            ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 12632256
    SELF.Q.EL:Last_SelectedFG = 12632256
    SELF.Q.EL:Last_SelectedBG = 0
    SELF.Q.EL:First_NormalFG = 0                           ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 12632256
    SELF.Q.EL:First_SelectedFG = 12632256
    SELF.Q.EL:First_SelectedBG = 0
    SELF.Q.EL:Client_NormalFG = 0                          ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 12632256
    SELF.Q.EL:Client_SelectedFG = 12632256
    SELF.Q.EL:Client_SelectedBG = 0
    SELF.Q.EL:BilledDate_NormalFG = 0                      ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 12632256
    SELF.Q.EL:BilledDate_SelectedFG = 12632256
    SELF.Q.EL:BilledDate_SelectedBG = 0
  ELSIF (EL:Status = 0 AND EL:Verified = '')
    SELF.Q.EL:FaxDates_NormalFG = 0                        ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 12615935
    SELF.Q.EL:FaxDates_SelectedFG = 12615935
    SELF.Q.EL:FaxDates_SelectedBG = 0
    SELF.Q.EL:Assession_NormalFG = 0                       ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 12615935
    SELF.Q.EL:Assession_SelectedFG = 12615935
    SELF.Q.EL:Assession_SelectedBG = 0
    SELF.Q.EL:Date_NormalFG = 0                            ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 12615935
    SELF.Q.EL:Date_SelectedFG = 12615935
    SELF.Q.EL:Date_SelectedBG = 0
    SELF.Q.EL:Last_NormalFG = 0                            ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 12615935
    SELF.Q.EL:Last_SelectedFG = 12615935
    SELF.Q.EL:Last_SelectedBG = 0
    SELF.Q.EL:First_NormalFG = 0                           ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 12615935
    SELF.Q.EL:First_SelectedFG = 12615935
    SELF.Q.EL:First_SelectedBG = 0
    SELF.Q.EL:Client_NormalFG = 0                          ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 12615935
    SELF.Q.EL:Client_SelectedFG = 12615935
    SELF.Q.EL:Client_SelectedBG = 0
    SELF.Q.EL:BilledDate_NormalFG = 0                      ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 12615935
    SELF.Q.EL:BilledDate_SelectedFG = 12615935
    SELF.Q.EL:BilledDate_SelectedBG = 0
  ELSIF (EL:Status = 4)
    SELF.Q.EL:FaxDates_NormalFG = 0                        ! Set conditional color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = 65280
    SELF.Q.EL:FaxDates_SelectedFG = 65280
    SELF.Q.EL:FaxDates_SelectedBG = 0
    SELF.Q.EL:Assession_NormalFG = 0                       ! Set conditional color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = 65280
    SELF.Q.EL:Assession_SelectedFG = 65280
    SELF.Q.EL:Assession_SelectedBG = 0
    SELF.Q.EL:Date_NormalFG = 0                            ! Set conditional color values for EL:Date
    SELF.Q.EL:Date_NormalBG = 65280
    SELF.Q.EL:Date_SelectedFG = 65280
    SELF.Q.EL:Date_SelectedBG = 0
    SELF.Q.EL:Last_NormalFG = 0                            ! Set conditional color values for EL:Last
    SELF.Q.EL:Last_NormalBG = 65280
    SELF.Q.EL:Last_SelectedFG = 65280
    SELF.Q.EL:Last_SelectedBG = 0
    SELF.Q.EL:First_NormalFG = 0                           ! Set conditional color values for EL:First
    SELF.Q.EL:First_NormalBG = 65280
    SELF.Q.EL:First_SelectedFG = 65280
    SELF.Q.EL:First_SelectedBG = 0
    SELF.Q.EL:Client_NormalFG = 0                          ! Set conditional color values for EL:Client
    SELF.Q.EL:Client_NormalBG = 65280
    SELF.Q.EL:Client_SelectedFG = 65280
    SELF.Q.EL:Client_SelectedBG = 0
    SELF.Q.EL:BilledDate_NormalFG = 0                      ! Set conditional color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = 65280
    SELF.Q.EL:BilledDate_SelectedFG = 65280
    SELF.Q.EL:BilledDate_SelectedBG = 0
  ELSE
    SELF.Q.EL:FaxDates_NormalFG = -1                       ! Set color values for EL:FaxDates
    SELF.Q.EL:FaxDates_NormalBG = -1
    SELF.Q.EL:FaxDates_SelectedFG = -1
    SELF.Q.EL:FaxDates_SelectedBG = -1
    SELF.Q.EL:Assession_NormalFG = -1                      ! Set color values for EL:Assession
    SELF.Q.EL:Assession_NormalBG = -1
    SELF.Q.EL:Assession_SelectedFG = -1
    SELF.Q.EL:Assession_SelectedBG = -1
    SELF.Q.EL:Date_NormalFG = -1                           ! Set color values for EL:Date
    SELF.Q.EL:Date_NormalBG = -1
    SELF.Q.EL:Date_SelectedFG = -1
    SELF.Q.EL:Date_SelectedBG = -1
    SELF.Q.EL:Last_NormalFG = -1                           ! Set color values for EL:Last
    SELF.Q.EL:Last_NormalBG = -1
    SELF.Q.EL:Last_SelectedFG = -1
    SELF.Q.EL:Last_SelectedBG = -1
    SELF.Q.EL:First_NormalFG = -1                          ! Set color values for EL:First
    SELF.Q.EL:First_NormalBG = -1
    SELF.Q.EL:First_SelectedFG = -1
    SELF.Q.EL:First_SelectedBG = -1
    SELF.Q.EL:Client_NormalFG = -1                         ! Set color values for EL:Client
    SELF.Q.EL:Client_NormalBG = -1
    SELF.Q.EL:Client_SelectedFG = -1
    SELF.Q.EL:Client_SelectedBG = -1
    SELF.Q.EL:BilledDate_NormalFG = -1                     ! Set color values for EL:BilledDate
    SELF.Q.EL:BilledDate_NormalBG = -1
    SELF.Q.EL:BilledDate_SelectedFG = -1
    SELF.Q.EL:BilledDate_SelectedBG = -1
  END


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>3,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>3,1,NewOrder+1))
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
!!! Form ExportList
!!! </summary>
UpdateExportList PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::EL:Record   LIKE(EL:RECORD),THREAD
QuickWindow          WINDOW('Form ExportList'),AT(,,201,112),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('UpdateExportList'),SYSTEM
                       SHEET,AT(4,4,193,86),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('Assession:'),AT(8,20),USE(?EL:Assession:Prompt),TRN
                           ENTRY(@n-14),AT(61,20,64,10),USE(EL:Assession),RIGHT(1)
                           PROMPT('Last:'),AT(8,34),USE(?EL:Last:Prompt),TRN
                           ENTRY(@s32),AT(61,34,132,10),USE(EL:Last)
                           PROMPT('First:'),AT(8,48),USE(?EL:First:Prompt),TRN
                           ENTRY(@s32),AT(61,48,132,10),USE(EL:First)
                           PROMPT('Client:'),AT(8,62),USE(?EL:Client:Prompt),TRN
                           ENTRY(@s8),AT(61,62,40,10),USE(EL:Client),DECIMAL(14)
                           PROMPT('Billing:'),AT(8,76),USE(?EL:Billing:Prompt),TRN
                           ENTRY(@n-14),AT(61,76,64,10),USE(EL:Billing),RIGHT(1)
                         END
                       END
                       BUTTON('&OK'),AT(42,94,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(95,94,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(148,94,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
  GlobalRequest = 2
  Pat:INVOICE = EL:Assession
  GET(Patient,Pat:INVOICE_KEY)
  IF EL:STATUS = 3
    CLI:NUMBER = Pat:CLIENT
    GET(CLIENT,CLI:ORDER_KEY)
    CLI:NUMBER = cli:BILLING
    GET(CLIENT,CLI:ORDER_KEY)
    UpdateClient
  ELSE
    UpdatePatient(1)
  .
  RETURN
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
  GlobalErrors.SetProcedureName('UpdateExportList')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?EL:Assession:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(EL:Record,History::EL:Record)
  SELF.AddHistoryField(?EL:Assession,3)
  SELF.AddHistoryField(?EL:Last,6)
  SELF.AddHistoryField(?EL:First,7)
  SELF.AddHistoryField(?EL:Client,8)
  SELF.AddHistoryField(?EL:Billing,9)
  SELF.AddUpdateFile(Access:ExportList)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:ExportList.Open                                   ! File ExportList used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:ExportList
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
    ?EL:Assession{PROP:ReadOnly} = True
    ?EL:Last{PROP:ReadOnly} = True
    ?EL:First{PROP:ReadOnly} = True
    ?EL:Client{PROP:ReadOnly} = True
    ?EL:Billing{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateExportList',QuickWindow)             ! Restore window settings from non-volatile store
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
    Relate:ExportList.Close
  END
  IF SELF.Opened
    INIMgr.Update('UpdateExportList',QuickWindow)          ! Save window data to non-volatile store
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
!!! Window
!!! </summary>
CheckMedicare PROCEDURE (prmPatient)

locTestTypes         LONG,DIM(3)                           !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Medicare'),AT(,,260,160),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,HLP('CheckMedicare'),SYSTEM
                       BUTTON('&OK'),AT(207,124,49,14),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(154,142,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,HIDE,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                       BUTTON('&Help'),AT(207,142,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@n3),AT(89,42,53,12),USE(locTestTypes[1])
                       STRING(@n3),AT(89,55,53,12),USE(locTestTypes[2])
                       STRING(@n3),AT(89,68,53,12),USE(locTestTypes[3])
                       STRING('This patient exceeds the Medicare Limit'),AT(25,20),USE(?STRING1),FONT(,11,,FONT:bold)
                       STRING('IgE'),AT(65,42,21,11),USE(?STRING2)
                       STRING('IgG'),AT(65,55,21,11),USE(?STRING2:2)
                       STRING('IgG4'),AT(65,68,21,11),USE(?STRING2:3)
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
Panel ROUTINE   
  CLEAR(PT:Record)
  PT:PANEL = TST:CODE 
 ! STOP('PANEL: ' & PT:PANEL)
  SET(PT:ORDER_KEY,PT:ORDER_KEY) 
  IF ERRORCODE() THEN STOP(ERROR()).
  LOOP  
    NEXT(Pnl_test)
    IF ERRORCODE() OR PT:PANEL <> TST:CODE THEN BREAK.
    IF SUB(PT:CODE,1,3) = '100' THEN CYCLE. 
    IF INRANGE(PT:TYPE,1,3)  
      locTestTypes[PT:TYPE] += 1 
         ! STOP(PT:TYPE & ': ' & locTestTypes[1] & ', ' & locTestTypes[2] & ', ' & locTestTypes[3])      
    .
  .

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('CheckMedicare')
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
  Relate:MedicareTests.Open                                ! File MedicareTests used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
        CLOSE(Test)
        SHARE(Test)
        
        CLEAR(locTestTypes[])
        CLEAR(TST:Record)
        TST:INVOICE = prmPatient  
     !   STOP('PATIENT: ' & TST:INVOICE)
        SET(TST:ORDER_KEY,TST:ORDER_KEY)
        LOOP  
          NEXT(Test)
          IF ERRORCODE() OR TST:INVOICE <> prmPatient THEN BREAK.
          IF SUB(TST:CODE,1,3) = '100' THEN CYCLE. 
          IF INRANGE(TST:TYPE,1,3)  
            locTestTypes[TST:TYPE] += 1 
          .     
      !    STOP(TST:TYPE & ': ' & locTestTypes[1] & ', ' & locTestTypes[2] & ', ' & locTestTypes[3])  
          IF TST:TYPE = 0 
            DO Panel 
            CYCLE
          .
        . 
        
  
  !      STOP('Done: ' & locTestTypes[1] & ', ' & locTestTypes[2] & ', ' & locTestTypes[3])  
        CLOSE(Test)
        IF locTestTypes[1] < 63 AND  (locTestTypes[2] + locTestTypes[3]) < 21 
          RETURN(1)
        . 
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('CheckMedicare',QuickWindow)                ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
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
    Relate:MedicareTests.Close
    Relate:Pnl_test.Close
    Relate:Test.Close
  END
  IF SELF.Opened
    INIMgr.Update('CheckMedicare',QuickWindow)             ! Save window data to non-volatile store
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
    CASE EVENT()
    OF EVENT:OpenWindow
      
    END
  ReturnValue = PARENT.TakeWindowEvent()
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
!!! Browse the payers file
!!! </summary>
PayerImport PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(payers)
                       PROJECT(PA:ID)
                       PROJECT(PA:Payer)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PA:ID                  LIKE(PA:ID)                    !List box control field - type derived from field
PA:Payer               LIKE(PA:Payer)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Import Payers'),AT(,,539,373),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('PayerImport'),SYSTEM
                       LIST,AT(139,140,261,124),USE(?Browse:1),HVSCROLL,FORMAT('36L(2)|M~ID~L(2)@s8@80L(2)|M~P' & |
  'ayer~L(2)@s40@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the payers file')
                       BUTTON('&Select'),AT(139,268,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(192,268,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(245,268,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(297,268,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(351,268,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(135,114,269,172),USE(?CurrentTab)
                         TAB('&1) OrderKey'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(301,290,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(355,290,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Import'),AT(159,50),USE(?BUTTON1)
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
  GlobalErrors.SetProcedureName('PayerImport')
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
  gloFileName = 'payer.txt'
  Relate:Text.Open                                ! File Text used by this procedure, so make sure it's RelationManager is open
  Relate:payers.Open                              ! File payers used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:payers,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon PA:Payer for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PA:OrderKey) ! Add the sort order for PA:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PA:Payer,1,BRW1)      ! Initialize the browse locator using  using key: PA:OrderKey , PA:Payer
  BRW1.AddField(PA:ID,BRW1.Q.PA:ID)               ! Field PA:ID is a hot field or requires assignment from browse
  BRW1.AddField(PA:Payer,BRW1.Q.PA:Payer)         ! Field PA:Payer is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('PayerImport',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PayerImport',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,2,LFM_CFile,LFM_CFile.Record)
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
    Relate:Text.Close
    Relate:payers.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('PayerImport',QuickWindow)               ! Save window data to non-volatile store
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
    Updatepayers
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
    OF ?BUTTON1
      ThisWindow.Update
            !  
          CLOSE(payers)   
          IF ERRORCODE() THEN STOP('CLOSE CLM: ' & ERROR()).
          OPEN(payers)
          IF ERRORCODE() THEN STOP('OPEN CLM: ' & ERROR()).
          EMPTY(payers) 
          IF ERRORCODE() THEN STOP('EMPTY CLM: ' & ERROR()).
        SET(Text)
        LOOP UNTIL EOF(Text)
          NEXT(Text)
          IF ERRORCODE() THEN BREAK.
          PA:ID = CLIP(SUB(TXT:Text,1,8))
          PA:Payer = LEFT(CLIP(SUB(TXT:Text,12,64)))
       !   stop(PA:Payer)
          ADD(payers) 
      !    IF ERRORCODE() THEN STOP('ADD PA: ' & ERROR()).
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
!!! Form payers
!!! </summary>
Updatepayers PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::PA:Record   LIKE(PA:RECORD),THREAD
QuickWindow          WINDOW('Form payers'),AT(,,233,70),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Updatepayers'),SYSTEM
                       SHEET,AT(4,4,225,44),USE(?CurrentTab)
                         TAB('&1) General'),USE(?Tab:1)
                           PROMPT('ID:'),AT(8,20),USE(?PA:ID:Prompt),TRN
                           ENTRY(@s8),AT(61,20,40,10),USE(PA:ID)
                           PROMPT('Payer:'),AT(8,34),USE(?PA:Payer:Prompt),TRN
                           ENTRY(@s40),AT(61,34,164,10),USE(PA:Payer)
                         END
                       END
                       BUTTON('&OK'),AT(74,52,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(127,52,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&Help'),AT(180,52,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
  GlobalErrors.SetProcedureName('Updatepayers')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?PA:ID:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(PA:Record,History::PA:Record)
  SELF.AddHistoryField(?PA:ID,1)
  SELF.AddHistoryField(?PA:Payer,2)
  SELF.AddUpdateFile(Access:payers)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:payers.Open                                       ! File payers used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:payers
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
    ?PA:ID{PROP:ReadOnly} = True
    ?PA:Payer{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Updatepayers',QuickWindow)                 ! Restore window settings from non-volatile store
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
    Relate:payers.Close
  END
  IF SELF.Opened
    INIMgr.Update('Updatepayers',QuickWindow)              ! Save window data to non-volatile store
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
!!! Browse the payers file
!!! </summary>
SelectPayer PROCEDURE 

CurrentTab           STRING(80)                            !
locPayer             STRING(32)                            !
BRW1::View:Browse    VIEW(payers)
                       PROJECT(PA:ID)
                       PROJECT(PA:Payer)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PA:ID                  LIKE(PA:ID)                    !List box control field - type derived from field
PA:Payer               LIKE(PA:Payer)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the payers file'),AT(,,277,342),FONT('Microsoft Sans Serif',8,,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,CENTER,GRAY,IMM,MDI,HLP('SelectPayer'),SYSTEM
                       LIST,AT(8,30,261,268),USE(?Browse:1),HVSCROLL,FORMAT('36L(2)|M~ID~@s8@80L(2)|M~Payer~@s64@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the payers file')
                       BUTTON('&Select'),AT(7,303,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&View'),AT(60,303,49,14),USE(?View:3),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(113,303,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(165,303,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(219,303,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,269,337),USE(?CurrentTab)
                         TAB('&1) PayerKey'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(169,324,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(223,324,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       ENTRY(@s32),AT(93,5),USE(locPayer)
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

BRW1::Sort0:Locator  EntryLocatorClass                     ! Default Locator
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
  GlobalErrors.SetProcedureName('SelectPayer')
   GlobalRequest = 4
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
  Relate:payers.Open                              ! File payers used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:payers,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon PA:Payer for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PA:PayerKey) ! Add the sort order for PA:PayerKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(?locPayer,PA:Payer,1,BRW1) ! Initialize the browse locator using ?locPayer using key: PA:PayerKey , PA:Payer
  BRW1.AddField(PA:ID,BRW1.Q.PA:ID)               ! Field PA:ID is a hot field or requires assignment from browse
  BRW1.AddField(PA:Payer,BRW1.Q.PA:Payer)         ! Field PA:Payer is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('SelectPayer',QuickWindow)         ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','SelectPayer',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,2,LFM_CFile,LFM_CFile.Record)
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
    Relate:payers.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('SelectPayer',QuickWindow)               ! Save window data to non-volatile store
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
    Updatepayers
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

