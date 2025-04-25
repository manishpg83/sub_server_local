

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8050.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
DocEmail PROCEDURE (prmAttributes)

locEmail             STRING(180)                           !
locSubject           STRING(128)                           !
locLogo              STRING(6656)                          !
locDisclaimer        STRING(2048)                          !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Send Email'),AT(,,67,5),FONT('MS Sans Serif',8,,FONT:regular),CENTER,GRAY
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
locBody STRING(8200)
locTarget BYTE,DIM(8200),OVER(locBody)
locDOC:Body STRING(8200)
locSource BYTE,DIM(8200),OVER(locDOC:Body)




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
  GlobalErrors.SetProcedureName('DocEmail')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('DocEmail',Window)                          ! Restore window settings from non-volatile store
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
    Relate:Docs.Close
  END
  IF SELF.Opened
    INIMgr.Update('DocEmail',Window)                       ! Save window data to non-volatile store
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
      DOC:Number =  DOC:Confidentiality + DOC:Text + BAND(prmAttributes,DOC:Spanish)
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locDisclaimer = DOC:Body
      .
      DOC:Number =  DOC:FaxCover  + DOC:Text 
      GET(Docs,DOC:OrderKey)
      IF ~ERRORCODE()
        locLogo = DOC:Body
      .
      locSubject = 'RE: Allermetrix'
      
      IF PAT:Invoice > 99999
        GET(Patient,PAT:Invoice_Key)
        IF ERRORCODE()
          CLEAR(PAT:Record)
          stop('error patient ' & pat:invoice & ' ' & error())
        ELSE
          locSubject = 'RE: ' & CLIP(Pat:LAST) & ', ' & CLIP(Pat:FIRST) & ' ' & FORMAT(PAT:Invoice,@P### ###PB)
        .
      ELSIF SR:Patient > 999999
        PAT:Invoice = SR:Patient
        GET(Patient,PAT:Invoice_Key)
        IF ERRORCODE()
          CLEAR(PAT:Record)
        ELSE
          locSubject = 'RE: ' & CLIP(Pat:LAST) & ', ' & CLIP(Pat:FIRST) & ' ' & FORMAT(PAT:Invoice,@P### ###PB)
        .
      .
      IF BAND(prmAttributes,3221225455)
        CLEAR(DOC:Record)
        DOC:Number = BAND(prmAttributes,DOC:DocFilename)
        GET(Docs,DOC:OrderKey)
        IF ERRORCODE()
          locSubject = 'DOC ERROR #' & prmAttributes
          locBody = 'GET DOC: ' & DOC:Number & '=' & ERROR()
        ELSE
          locDOC:Body = DOC:Body
          IF BAND(prmAttributes,DOC:Confirmation)
          .
          L# = LEN(CLIP(locDOC:Body))
          LOOP L# TIMES
            S# += 1
            IF locSource[S#] = VAL(',') THEN CYCLE.
            IF locSource[S#] = VAL('"') THEN CYCLE.
            T# += 1
            locTarget[T#] = locSource[S#]
          .
        .
      ELSE
        DOC:Body = ''
      .
      IF BAND(prmAttributes,DOC:SignatureRequest + DOC:CreditCard + DOC:Confirmation)
        locBody = '<p>' & locSubject & '</p>' & locDOC:Body
      .

      locEmail = CLI:Email & CLI:Physician4  & CLI:Physician3 & CLI:Physician2
      RUN(PATH('C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe') & ' -compose "to=' & CLIP(locEmail) & ',subject=''' & CLIP(locSubject) & ''',body=''' &   CLIP(locLogo) &  CLIP(locBody) & CLIP(locDisclaimer) & '''"')
      POST(EVENT:CloseWindow)
      

!DOC:AllowEdit          EQUATE(1073741824)
!DOC:IncludeTest        EQUATE(2147483648) ! INCLUDE PATIENT TESTS IN DOCUMENT
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
!DOC:DocFilename        EQUATE(0BFFFFFFF)     ! MASK ALLOW EDIT

      
      
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

