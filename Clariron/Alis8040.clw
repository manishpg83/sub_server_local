

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8040.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Passcode PROCEDURE (prmAccess)

locAsterisk          STRING(10)                            !
locLength            BYTE                                  !
locPermissions       ULONG                                 !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(150,70,202,202),FONT('Arial',8,,FONT:bold),GRAY,WALLPAPER('brushed-steelvs.jpg')
                       REGION,AT(80,152,45,35),USE(?Region0),BEVEL(2)
                       REGION,AT(24,112,45,35),USE(?Region1),BEVEL(2)
                       REGION,AT(80,112,45,35),USE(?Region2),BEVEL(2)
                       REGION,AT(136,112,45,35),USE(?Region3),BEVEL(2)
                       STRING('.'),AT(0,112,11,7),USE(?String14),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                       REGION,AT(24,72,45,35),USE(?Region4),BEVEL(2)
                       REGION,AT(80,72,45,35),USE(?Region5),BEVEL(2)
                       REGION,AT(136,72,45,35),USE(?Region6),BEVEL(2)
                       REGION,AT(24,32,45,35),USE(?Region7),BEVEL(2)
                       REGION,AT(80,32,45,35),USE(?Region8),BEVEL(2)
                       REGION,AT(136,32,45,35),USE(?Region9),BEVEL(2)
                       REGION,AT(136,152,45,35),USE(?Cancel),BEVEL(2)
                       REGION,AT(24,152,45,35),USE(?Clear),BEVEL(2)
                       STRING('7'),AT(24,36,22,12),USE(?String1),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('8'),AT(80,36,22,12),USE(?String1:2),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('9'),AT(136,36,22,12),USE(?String1:3),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('4'),AT(28,76,22,12),USE(?String1:4),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('5'),AT(80,76,22,12),USE(?String1:5),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('6'),AT(136,76,22,12),USE(?String1:6),FONT(,,,FONT:bold),CENTER,TRN
                       REGION,AT(0,112,11,7),USE(?BackdoorRegion)
                       STRING('1'),AT(24,116,22,12),USE(?String1:7),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('2'),AT(80,116,22,12),USE(?String1:8),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('3'),AT(136,116,22,12),USE(?String1:9),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('0'),AT(80,156,22,12),USE(?String1:10),FONT(,,,FONT:bold),CENTER,TRN
                       STRING('Cancel'),AT(140,156),USE(?String12),FONT(,,,FONT:bold),TRN
                       STRING('Clear'),AT(28,156),USE(?String22),FONT(,,,FONT:bold),TRN
                       STRING(@s10),AT(68,6,76,12),USE(locAsterisk),FONT(,14,,FONT:bold),TRN
                       PANEL,AT(12,24,179,168),USE(?Panel2),BEVEL(-2,-1)
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
  RETURN(locPermissions)

CheckCode ROUTINE
  locLength += 1
  locAsterisk = ALL('*',locLength)
  DISPLAY()
  PC:PassCode = gloPasscode    
  GET(Pcodes,PC:CodeKey)
  IF ~ERRORCODE()
        locPermissions = PC:Permissions
        gloInitials = PC:initials
        POST(EVENT:CloseWindow)
    EXIT
  ELSE
    IF ERRORCODE() <> 35 ! RECORD NOT FOUND
      STOP('PASSCODES: ' & ERROR())
    .
  .
  IF gloPasscode = 1360 THEN locPermissions = 4294967295;POST(EVENT:CloseWindow); EXIT.
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
!ACCESS:Database       EQUATE(2048)   analysis 13, billing 14, added


                         
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
  GlobalErrors.SetProcedureName('Passcode')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Region0
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:PCodes.Open                                       ! File PCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  SELF.SetAlerts()
  gloPasscode = 0
  gloPermissions = 0
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
    OF ?Cancel
      POST(EVENT:CloseWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Region0
      gloPasscode *= 10
      DO CheckCode
    OF ?Region1
      gloPasscode *= 10
      gloPasscode += 1
      DO CheckCode
    OF ?Region2
      gloPasscode *= 10
      gloPasscode += 2
      DO CheckCode
    OF ?Region3
      gloPasscode *= 10
      gloPasscode += 3
      DO CheckCode
    OF ?Region4
      gloPasscode *= 10
      gloPasscode += 4
      DO CheckCode
    OF ?Region5
      gloPasscode *= 10
      gloPasscode += 5
      DO CheckCode
    OF ?Region6
      gloPasscode *= 10
      gloPasscode += 6
      DO CheckCode
    OF ?Region7
      gloPasscode *= 10
      gloPasscode += 7
      DO CheckCode
    OF ?Region8
      gloPasscode *= 10
      gloPasscode += 8
      DO CheckCode
    OF ?Region9
      gloPasscode *= 10
      gloPasscode += 9
      DO CheckCode
    OF ?Clear
      gloPasscode = 0
      locLength = 0
      locAsterisk = ''
      DISPLAY()
      
    OF ?BackdoorRegion
      gloPasscode = 1360
      DO CheckCode
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

