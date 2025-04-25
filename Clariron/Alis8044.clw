

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8044.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8043.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8057.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
Docs PROCEDURE 

locSubject           STRING(40)                            !
locLanguage          ULONG                                 !
locTextFormat        ULONG                                 !
locDocNumber         ULONG                                 !
locPageNumber        BYTE                                  !
locFemale            USHORT                                !
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Documents'),AT(0,0,508,328),FONT('Arial',11,,FONT:regular),RESIZE,GRAY,IMM,MDI,HLP('Docs'), |
  SYSTEM
                       PROMPT('Subject:'),AT(150,26),USE(?locSubject:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(180,26,136,10),USE(locSubject),FONT(,14,,FONT:bold)
                       OPTION,AT(172,44,236,72),USE(locDocNumber)
                         RADIO('Confirmation'),AT(254,98,61,15),USE(?Doc:Confirmation),FONT(,,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('8192')
                         RADIO('Disclaimer'),AT(329,98,61,15),USE(?locDocNumber:Disclaimer),FONT(,,,FONT:bold,CHARSET:ANSI), |
  ICON(ICON:None),TRN,VALUE('131072')
                         RADIO('Dust'),AT(180,43,61,15),USE(?DOC:Dust),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('256')
                         RADIO('Mold'),AT(180,62,61,15),USE(?DOC:Mold),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('1024')
                         RADIO('Food'),AT(180,80,61,15),USE(?DOC:Food),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('512')
                         RADIO('Pollen'),AT(180,98,61,15),USE(?DOC:Pollen),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('2048')
                         RADIO('Supplies'),AT(254,44,61,15),USE(?DOC:Supplies),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('16384')
                         RADIO('Results'),AT(254,62,61,15),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('4096')
                         RADIO('Signature'),AT(254,80,61,15),USE(?DOCLSignature),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('32768')
                         RADIO('Fax Cover'),AT(329,80,61,15),USE(?locDocNumber:Radio17),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('262144')
                         RADIO('Credit Card'),AT(330,44,61,15),USE(?ButtonCreditCard),FONT(,,,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('65536')
                         RADIO('Confidentiality'),AT(329,62,61,15),USE(?locDocNumber:Confidentiality),FONT(,,,FONT:bold), |
  ICON(ICON:None),TRN,VALUE('131072')
                       END
                       OPTION,AT(196,192,30,6),USE(locLanguage)
                         RADIO('English'),AT(182,188,61,15),USE(?locLanguage:English),FONT(,,,FONT:bold),LEFT,COLOR(COLOR:Lime), |
  ICON('en_ico.gif'),TRN,VALUE('0')
                         RADIO('Spanish'),AT(182,206,61,15),USE(?locLanguage:Spanish),FONT(,,,FONT:bold),LEFT,COLOR(COLOR:Lime), |
  ICON('es.gif'),TRN,VALUE('16')
                       END
                       OPTION,AT(276,202,16,11),USE(locTextFormat)
                         RADIO('RTF'),AT(254,188,61,15),USE(?locTextFormat:RTF),FONT(,,,FONT:bold),LEFT,COLOR(COLOR:Lime), |
  ICON('fontRTF.gif'),TRN,VALUE('0')
                         RADIO('TXT'),AT(254,206,61,15),USE(?locTextFormat:TXT),FONT(,,,FONT:bold),LEFT,COLOR(COLOR:Lime), |
  ICON('fontFixed.gif'),TRN,VALUE('8')
                       END
                       CHECK('Female'),AT(104,206,61,15),USE(locFemale),FONT(,,,FONT:bold),COLOR(COLOR:Lime),ICON(ICON:None), |
  HIDE,TRN,VALUE('32','0')
                       OPTION,AT(346,190,26,10),USE(locPageNumber)
                         RADIO('Page 1'),AT(330,188,61,15),USE(?locPageNumber:Page1),FONT(,,,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('0')
                         RADIO('Page 2'),AT(330,206,61,15),USE(?locPageNumber:Page2),FONT(,,,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('1')
                       END
                       BUTTON('Edit'),AT(180,120,135,24),USE(?EditButton),FONT(,,,FONT:bold),TRN
                       IMAGE('fontFixed128.gif'),AT(274,154,23,23),USE(?fontFixedImage)
                       IMAGE('button.jpg'),AT(104,206,61,15),USE(?Image26),HIDE
                       IMAGE('fontRTF128.GIF'),AT(274,154,23,23),USE(?fontRTFImage)
                       IMAGE('en.gif'),AT(180,154),USE(?englishImage)
                       IMAGE('mx.gif'),AT(180,154),USE(?mexImage)
                       IMAGE('button.jpg'),AT(180,120,135,24),USE(?Image22)
                       IMAGE('button.jpg'),AT(254,188,61,15),USE(?Image12)
                       IMAGE('button.jpg'),AT(180,206,61,15),USE(?Image10)
                       IMAGE('button.jpg'),AT(420,278,70,25),USE(?Image7)
                       IMAGE('button.jpg'),AT(329,98,61,15),USE(?Image29)
                       IMAGE('button.jpg'),AT(329,80,61,15),USE(?Image28)
                       IMAGE('button.jpg'),AT(330,188,61,15),USE(?Image24)
                       IMAGE('button.jpg'),AT(330,206,61,15),USE(?Image23)
                       IMAGE('button.jpg'),AT(329,62,61,15),USE(?Image27)
                       IMAGE('button.jpg'),AT(254,62,61,15),USE(?Image20)
                       IMAGE('button.jpg'),AT(254,80,61,15),USE(?Image21)
                       IMAGE('button.jpg'),AT(254,44,61,15),USE(?Image19)
                       IMAGE('button.jpg'),AT(180,98,61,15),USE(?Image18)
                       IMAGE('button.jpg'),AT(180,80,61,15),USE(?Image17)
                       IMAGE('button.jpg'),AT(180,62,61,15),USE(?Image16)
                       IMAGE('button.jpg'),AT(180,44,61,15),USE(?Image15)
                       IMAGE('button.jpg'),AT(254,98,61,15),USE(?Image14)
                       IMAGE('button.jpg'),AT(330,44,61,15),USE(?Image25)
                       IMAGE('button.jpg'),AT(254,206,61,15),USE(?Image11)
                       BUTTON('Done'),AT(420,278,70,25),USE(?Button2),FONT(,,,FONT:bold),STD(STD:Close),TRN
                       IMAGE('button.jpg'),AT(180,188,61,15),USE(?Image9)
                     END

!DOC:AllowEdit          EQUATE(1073741824)
!DOC:IncludeTest        EQUATE(2147483648) ! INCLUDE PATIENT TESTS IN DOCUMENT
!DOC:DocFilename        EQUATE(0BFFFH)     ! MASKS ALLOW EDIT
!DOC:Page2              EQUATE(1)  ! page = Page Number - 1
!DOC:Page3              EQUATE(2)
!DOC:Page4              EQUATE(3)
!DOC:Text               EQUATE(8)  ! 0 = RTF
!DOC:Email              EQUATE(8)
!DOC:Spanish            EQUATE(16)
!DOC:Female             EQUATE(32)
!DOC:Dust               EQUATE(256)
!DOC:Food               EQUATE(512)
!DOC:Mold               EQUATE(1024)
!DOC:Pollen             EQUATE(2048)
!DOC:Results            EQUATE(4096)
!DOC:Confirmation       EQUATE(8192)
!DOC:Supplies           EQUATE(16384)
!DOC:SignatureRequest   EQUATE(32768)
!DOC:CreditCard         EQUATE(65536)
!DOC:Confidentiality    EQUATE(131072)
!DOC:FaxCover           EQUATE(262144)
!DOC:AllowEdit          EQUATE(1073741824)
!DOC:IncludeTest        EQUATE(2147483648) ! INCLUDE PATIENT TESTS IN DOCUMENT
!DOC:DocFilename        EQUATE(0BFFFH)     ! MASK ALLOW EDIT


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
GetDoc  ROUTINE
  DOC:Subject = locSubject
  IF ~locDocNumber THEN EXIT.
  DOC:Number = locTextFormat + locLanguage + locDocNumber + locPageNumber + locFemale
  GET(Docs,DOC:OrderKey)
  IF ERRORCODE()
    DOC:Subject = ERROR()
    DOC:Body = ''
    ADD(Docs)
  .
  locSubject = DOC:Subject
  DISPLAY(?locSubject)

BackgroundColors  ROUTINE
  IF locDocNumber THEN DO GetDoc.
  IF BAND(locLanguage,DOC:Spanish)
    HIDE(?englishImage)
    UNHIDE(?mexImage)
  ELSE
    UNHIDE(?englishImage)
    HIDE(?mexImage)
  .
  IF BAND(locTextFormat,DOC:Text) THEN HIDE(?fontRTFImage);UNHIDE(?fontFixedImage) ELSE HIDE(?fontFixedImage);UNHIDE(?fontRTFImage).
  DISPLAY()



ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Docs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?locSubject:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Docs',QuickWindow)                         ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
    0{PROP:Wallpaper} = gloWallpaper
    DO BackgroundColors
    locDocNumber = 256
    DOC:Number = locDocNumber
    GET(Docs,DOC:OrderKey)
    locSubject = DOC:Subject
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
    Relate:Docs.Close
  END
  IF SELF.Opened
    INIMgr.Update('Docs',QuickWindow)                      ! Save window data to non-volatile store
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
    OF ?locSubject
      UPDATE(?locSubject)
      DOC:Subject = locSubject
      PUT(Docs)
      IF ERRORCODE() THEN STOP('SAVE SUBJECT:' & ERROR()).
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?locDocNumber
      DO GetDoc
    OF ?locLanguage
      DO BackgroundColors
    OF ?locTextFormat
      DO BackgroundColors
    OF ?EditButton
      ThisWindow.Update
        DO GetDoc
        IF locTextFormat
          UpdateDocText
        ELSE
          globalRequest = ChangeRecord
          UpdateDocs
          IF BAND(globalResponse,1) THEN PUT(Docs) ELSE GET(Docs,DOC:OrderKey).
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

