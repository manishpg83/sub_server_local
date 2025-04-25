

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('rtfctl.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8069.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Window
!!! </summary>
FindReplaceRTF PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Window'),AT(,,255,160),FONT('Arial',8,COLOR:Black,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,HLP('FindReplaceRTF'),SYSTEM
                       TEXT,AT(71,32,60,48),USE(?RTFTextBox),RTF(TEXT:Field),VSCROLL,BOXED
                       BUTTON('&OK'),AT(107,131,70,25),USE(?Ok),LEFT,ICON('WAOK.ICO'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                       BUTTON('&Cancel'),AT(181,131,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Operation'), |
  TIP('Cancel Operation')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

RTFControl4          CLASS(RTFControlClass)
ContextMenuText        PROCEDURE(),STRING,DERIVED
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
  GlobalErrors.SetProcedureName('FindReplaceRTF')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RTFTextBox
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
  INIMgr.Fetch('FindReplaceRTF',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  RTFControl4.Init(?RTFTextBox)
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
  RTFControl4.Kill()
  IF SELF.Opened
    INIMgr.Update('FindReplaceRTF',QuickWindow)            ! Save window data to non-volatile store
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
  ReturnValue = RTFControl4.TakeEvent()
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


RTFControl4.ContextMenuText PROCEDURE

ReturnValue          ANY

  CODE
  ReturnValue = PARENT.ContextMenuText()
  ReturnValue = ''
  RETURN ReturnValue

