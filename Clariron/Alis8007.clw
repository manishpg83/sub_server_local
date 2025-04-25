

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8007.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Rast
!!! </summary>
UpdateRast PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::RST:Record  LIKE(RST:RECORD),THREAD
QuickWindow          WINDOW('Edit Rast '),AT(196,,310,341),FONT('Arial',11,,FONT:regular),RESIZE,CENTER,GRAY,IMM, |
  MDI,HLP('UpdateRast'),SYSTEM
                       PROMPT('Code'),AT(8,30),USE(?RST:NUMBER:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s5),AT(61,30,40,10),USE(RST:NUMBER)
                       PROMPT('Descriptiion'),AT(8,44),USE(?RST:DESCRIPTION:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s30),AT(61,44,160,10),USE(RST:DESCRIPTION)
                       PROMPT('Spanish Desc'),AT(8,58),USE(?RST:sDescription:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(61,57,160,10),USE(RST:sDescription)
                       PROMPT('Fee Level:'),AT(8,73),USE(?RST:FeeLevel:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n3),AT(63,72,22,10),USE(RST:FeeLevel),RIGHT(1)
                       PROMPT('Lot:'),AT(8,89),USE(?RST:Lot:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n-7),AT(63,88,22,10),USE(RST:Lot),RIGHT(1)
                       PROMPT('Family'),AT(8,114),USE(?RST:FAMILY:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(63,114,164,10),USE(RST:FAMILY)
                       PROMPT('Tribe'),AT(8,129),USE(?RST:TRIBE:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(63,129,164,10),USE(RST:TRIBE)
                       PROMPT('Genus'),AT(8,143),USE(?RST:GENUS:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(63,143,164,10),USE(RST:GENUS)
                       PROMPT('Species'),AT(8,157),USE(?RST:SPECIES:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@s40),AT(63,157,164,10),USE(RST:SPECIES)
                       PROMPT('Exp Month:'),AT(92,88),USE(?RST:ExpMonth:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n3),AT(136,88,15,10),USE(RST:ExpMonth)
                       PROMPT('Exp Year:'),AT(172,88),USE(?RST:ExpYear:Prompt),FONT(,,,FONT:bold),TRN
                       BUTTON('&OK'),AT(192,220,70,25),USE(?OK),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'),DEFAULT, |
  MSG('Accept data and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(192,220,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(70,220,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(70,220,70,25),USE(?Cancel),FONT(,,,FONT:bold),LEFT,ICON('SteelCancel.ico'), |
  MSG('Cancel operation'),TIP('Cancel operation'),TRN
                       BUTTON('&Help'),AT(0,312,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       ENTRY(@n3),AT(208,88,16,10),USE(RST:ExpYear)
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
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateRast')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RST:NUMBER:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(RST:Record,History::RST:Record)
  SELF.AddHistoryField(?RST:NUMBER,1)
  SELF.AddHistoryField(?RST:DESCRIPTION,2)
  SELF.AddHistoryField(?RST:sDescription,3)
  SELF.AddHistoryField(?RST:FeeLevel,9)
  SELF.AddHistoryField(?RST:Lot,10)
  SELF.AddHistoryField(?RST:FAMILY,5)
  SELF.AddHistoryField(?RST:TRIBE,6)
  SELF.AddHistoryField(?RST:GENUS,7)
  SELF.AddHistoryField(?RST:SPECIES,8)
  SELF.AddHistoryField(?RST:ExpMonth,11)
  SELF.AddHistoryField(?RST:ExpYear,12)
  SELF.AddUpdateFile(Access:Rast)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Rast
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
    ?RST:NUMBER{PROP:ReadOnly} = True
    ?RST:DESCRIPTION{PROP:ReadOnly} = True
    ?RST:sDescription{PROP:ReadOnly} = True
    ?RST:FeeLevel{PROP:ReadOnly} = True
    ?RST:Lot{PROP:ReadOnly} = True
    ?RST:FAMILY{PROP:ReadOnly} = True
    ?RST:TRIBE{PROP:ReadOnly} = True
    ?RST:GENUS{PROP:ReadOnly} = True
    ?RST:SPECIES{PROP:ReadOnly} = True
    ?RST:ExpMonth{PROP:ReadOnly} = True
    ?RST:ExpYear{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallPaper
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
    Relate:Rast.Close
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

