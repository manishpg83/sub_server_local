

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8030.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8077.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Patient file
!!! </summary>
VerifyPatients PROCEDURE 

CurrentTab           STRING(80)                            !
locDisable           LONG                                  !
CodeSort             QUEUE,PRE(CS)                         !
Code                 STRING(4)                             !
Sort                 LONG                                  !
                     END                                   !
locDate              STRING(20)                            !
locPatient           STRING(32)                            !
locClientName        STRING(40)                            !
ActionMessage        CSTRING(40)                           !
locAddTestRecsMax    SHORT                                 !
locAddTestRecsNow    SHORT                                 !
BRW1::View:Browse    VIEW(Patient)
                       PROJECT(Pat:DATE)
                       PROJECT(Pat:ENTERED_BY)
                       PROJECT(Pat:INVOICE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pat:DATE               LIKE(Pat:DATE)                 !List box control field - type derived from field
Pat:DATE_Style         LONG                           !Field style
Pat:ENTERED_BY         LIKE(Pat:ENTERED_BY)           !List box control field - type derived from field
Pat:ENTERED_BY_Style   LONG                           !Field style
Pat:INVOICE            LIKE(Pat:INVOICE)              !List box control field - type derived from field
Pat:INVOICE_Style      LONG                           !Field style
locPatient             LIKE(locPatient)               !List box control field - type derived from local data
locPatient_Style       LONG                           !Field style
locClientName          LIKE(locClientName)            !List box control field - type derived from local data
locClientName_Style    LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW,AT(0,0,506,340),FONT('Arial',11,,FONT:regular),GRAY,MDI,HLP('VerifyPatients'),TIMER(18000)
                       LIST,AT(70,16,312,310),USE(?Browse:1),FONT(,,,FONT:bold),VSCROLL,FORMAT('45R(2)|MY~Date' & |
  '~C(0)@d1@28C(2)|MY~By~@s2@40R(1)|MY~Patient#~C(4)@p### ###p@82L(2)|MY~Patient~L(0)@s' & |
  '20@80L(2)|MY~Client~@s40@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Patient file'),TRN
                       BUTTON('&Insert'),AT(428,206,49,14),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('WAINSERT.ICO'), |
  FLAT,HIDE,MSG('Insert a Record'),TIP('Insert a Record')
                       BUTTON('&View Edit'),AT(428,230,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(428,180,49,14),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('WADELETE.ICO'), |
  FLAT,HIDE,MSG('Delete the Record'),TIP('Delete the Record')
                       SHEET,AT(66,16,312,310),USE(?CurrentTab),SPREAD
                         TAB,USE(?Tab:2)
                         END
                       END
                       BUTTON('Done'),AT(428,264,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(428,230,70,25),USE(?Image2)
                       IMAGE('BUTTON.JPG'),AT(428,264,70,25),USE(?Image1)
                       STRING('Busy Adding Records'),AT(162,0),USE(?Busy),FONT(,18,COLOR:Red,FONT:bold),HIDE,TRN
                       STRING('ERROR:  Could not open test file'),AT(351,2),USE(?Err),FONT(,14,COLOR:Red,FONT:bold), |
  HIDE
                       STRING(@n-7),AT(404,23),USE(locAddTestRecsMax),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n-7),AT(404,43),USE(locAddTestRecsNow),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING('To Be Added'),AT(437,43),USE(?STRING2),LEFT,TRN
                       STRING('Records Added'),AT(437,23),USE(?STRING3),LEFT,TRN
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(IListControl IC,VIEW V,BrowseQueue LQ,RelationManager RM,WindowManager WM)
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
  ?Browse:1{PROPSTYLE:FontName, 1}      = gloListFont
  ?Browse:1{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?Browse:1{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontSize
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
GetTests  ROUTINE
  IF locDisable THEN EXIT.
  HIDE(?Err)
  IF RECORDS(DeleteTests)
    CLOSE(Test)
    OPEN(Test)
    IF ERRORCODE()
      HIDE(?Busy)
      UNHIDE(?Err)
      DISPLAY(?Err)
      EXIT
    .
    SET(DT:OrderKey)
    LOOP UNTIL EOF(DeleteTests)
      NEXT(DeleteTests)
      TST:INVOICE = DT:Patient
      TST:CODE = DT:Code
      TST:Type = DT:Type
      GET(Test,TST:ORDER_KEY)
      IF ~ERRORCODE() 
        DELETE(Test)
        IF ~ERRORCODE() THEN DELETE(DeleteTests).
      .
    .
    CLOSE(Test)
  .
  IF ~RECORDS(AddTests) 
    EXIT
  .
  UNHIDE(?Busy)
  DISPLAY(?Busy) 
  CLOSE(Test)
  OPEN(Test)
  IF ERRORCODE()
    HIDE(?Busy)
    UNHIDE(?Err)
    DISPLAY(?Err)
    EXIT
  .
  STREAM(Test)
  IF ERRORCODE()
    STOP('TEST STREAM ISSUE: ' & ERROR())
  .
  SET(AddTests)
  LOOP
    NEXT(AddTests)
    IF ERRORCODE() 
      locAddTestRecsNow = RECORDS(AddTests)
      DISPLAY()
      IF RECORDS(AddTests) THEN STOP('ADD TESTS ISSUE: CLICK IGNORE').
      BREAK
    .
    TST:Code = AT:Code
    TST:Invoice = AT:Patient
    TST:Type = AT:Type
    TST:Status = 'L'
    CS:Code = TST:CODE
    GET(CodeSort,CS:Code)
    TST:Order = CS:Sort
    APPEND(Test)
    IF ERRORCODE()
      STOP('ADD TEST: ' & ERROR())
    ELSE
      DELETE(AddTests)
      locAddTestRecsMax += 1
    . 
  .
  locAddTestRecsNow = RECORDS(AddTests)
  DISPLAY()
  FLUSH(Test)
  IF ERRORCODE()
    STOP('TEST FLUSH ISSUE: ' & ERROR())
  .
  BUILD(Test)
  CLOSE(Test)
  IF ERRORCODE() AND ERRORCODE() <> 37
    STOP('TEST END CLOSE: ' & ERRORCODE() & '-' & ERROR())
  .
  HIDE(?Busy)

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('VerifyPatients')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('locPatient',locPatient)                            ! Added by: BrowseBox(ABC)
  BIND('locClientName',locClientName)                      ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
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
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:DeleteTests.Open                                  ! File DeleteTests used by this procedure, so make sure it's RelationManager is open
  Relate:ResultsSendout.Open                               ! File ResultsSendout used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
    locDate = TODAY()
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Patient,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha+ScrollSort:CaseSensitive) ! Moveable thumb based upon Pat:INVOICE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pat:DATE_KEY)    ! Add the sort order for Pat:DATE_KEY for sort order 1
  BRW1.AddRange(Pat:DATE,locDate)                          ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,Pat:INVOICE,,BRW1)             ! Initialize the browse locator using  using key: Pat:DATE_KEY , Pat:INVOICE
  BRW1.SetFilter('(~Pat:VERIFIED_BY)')                     ! Apply filter expression to browse
  BRW1.AddField(Pat:DATE,BRW1.Q.Pat:DATE)                  ! Field Pat:DATE is a hot field or requires assignment from browse
  BRW1.AddField(Pat:ENTERED_BY,BRW1.Q.Pat:ENTERED_BY)      ! Field Pat:ENTERED_BY is a hot field or requires assignment from browse
  BRW1.AddField(Pat:INVOICE,BRW1.Q.Pat:INVOICE)            ! Field Pat:INVOICE is a hot field or requires assignment from browse
  BRW1.AddField(locPatient,BRW1.Q.locPatient)              ! Field locPatient is a hot field or requires assignment from browse
  BRW1.AddField(locClientName,BRW1.Q.locClientName)        ! Field locClientName is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  
  locAddTestRecsNow = RECORDS(AddTests)
  DISPLAY()
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
    Relate:Client.Close
    Relate:DeleteTests.Close
    Relate:ResultsSendout.Close
  END
  BRW1::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF Pat:BILLING = 'M' THEN CheckMedicare(Pat:INVOICE).
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePatient(1)
    ReturnValue = GlobalResponse
  END
  locDisable = 1
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
      DO GetTests
    OF EVENT:Timer
      DO GetTests
      locAddTestRecsNow = RECORDS(AddTests)
      gloMonitoringLoginTest = TRUE
      DISPLAY()
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(IListControl IC,VIEW V,BrowseQueue LQ,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(IC,V,LQ,RM,WM)
  locDate = TODAY()


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete:4
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.Pat:DATE_Style = 1 ! 
  SELF.Q.Pat:ENTERED_BY_Style = 1 ! 
  SELF.Q.Pat:INVOICE_Style = 1 ! 
  SELF.Q.locPatient_Style = 1 ! 
  SELF.Q.locClientName_Style = 1 ! 


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  CLI:NUMBER = Pat:CLIENT
  GET(Client,CLI:ORDER_KEY)
  locPatient = CLIP(Pat:LAST) & ', ' & Pat:FIRST
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

