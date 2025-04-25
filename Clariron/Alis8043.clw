

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('rtfctl.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8043.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Docs
!!! </summary>
UpdateDocs PROCEDURE 

CurrentTab           STRING(80)                            !
SAV:Text             CSTRING(8192)                         !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::SU:Record   LIKE(SU:RECORD),THREAD
QuickWindow          WINDOW,AT(0,0,578,351),FONT('Arial',10,COLOR:Black,FONT:regular),GRAY,IMM,MDI,HLP('UpdateDocs')
                       BUTTON,AT(528,0,16,14),USE(?RTFToolNew),ICON('New.ico'),HIDE,MSG('New'),SKIP,TIP('New'),TRN
                       BUTTON,AT(545,0,16,14),USE(?RTFToolOpen),ICON('Open.ico'),HIDE,MSG('Open'),SKIP,TIP('Open'), |
  TRN
                       BUTTON,AT(562,0,16,14),USE(?RTFToolSave),ICON('Save.ico'),HIDE,MSG('Save'),SKIP,TIP('Save'), |
  TRN
                       ENTRY(@s40),AT(93,17,236,10),USE(DOC:Subject)
                       BUTTON,AT(0,0,16,14),USE(?RTFToolPrint),ICON('Print.ico'),MSG('Print'),SKIP,TIP('Print'),TRN
                       BUTTON,AT(16,0,16,14),USE(?RTFToolFind),ICON('RFind.ico'),MSG('Find'),SKIP,TIP('Find'),TRN
                       BUTTON,AT(32,0,16,14),USE(?RTFToolFindAndReplace),ICON('RReplace.ico'),MSG('Find and Replace'), |
  SKIP,TIP('Find and Replace'),TRN
                       BUTTON,AT(48,0,16,14),USE(?RTFToolCut),ICON('cut.ico'),DISABLE,MSG('Cut'),SKIP,TIP('Cut'), |
  TRN
                       BUTTON,AT(64,0,16,14),USE(?RTFToolCopy),ICON('Copy.ico'),DISABLE,MSG('Copy'),SKIP,TIP('Copy'), |
  TRN
                       BUTTON,AT(80,0,16,14),USE(?RTFToolPaste),ICON('Paste.ico'),DISABLE,MSG('Paste'),SKIP,TIP('Paste'), |
  TRN
                       BUTTON,AT(100,0,16,14),USE(?RTFToolUndo),ICON('undo.ico'),DISABLE,MSG('Undo'),SKIP,TIP('Undo'), |
  TRN
                       BUTTON,AT(116,0,16,14),USE(?RTFToolRedo),ICON('redo.ico'),DISABLE,MSG('Redo'),SKIP,TIP('Redo'), |
  TRN
                       BUTTON,AT(136,0,16,14),USE(?RTFToolTabs),ICON('tabstop.ico'),MSG('Tab stops'),SKIP,TIP('Tab stops'), |
  TRN
                       BUTTON,AT(158,0,16,14),USE(?RTFToolPara),ICON('para.ico'),MSG('Paragraph indents'),SKIP,TIP('Paragraph indents'), |
  TRN
                       OPTION,AT(174,0,68,18),USE(?RTFToolAlignment),SKIP
                         RADIO,AT(176,0,16,14),USE(?RTFToolAlignmentLeft),ICON('JUSTLFT.ICO'),MSG('Left Alignment'), |
  SKIP,TIP('Left'),TRN,VALUE('1')
                         RADIO,AT(192,0,16,14),USE(?RTFToolAlignmentCenter),ICON('JUSTCTR.ICO'),MSG('Center Alignment'), |
  SKIP,TIP('Center'),TRN,VALUE('3')
                         RADIO,AT(208,0,16,14),USE(?RTFToolAlignmentRight),ICON('JUSTRT.ICO'),MSG('Right Alignment'), |
  SKIP,TIP('Right'),TRN,VALUE('2')
                         RADIO,AT(224,0,16,14),USE(?RTFToolAlignmentJust),ICON('JUSTJUST.ICO'),MSG('Justify Alignment'), |
  SKIP,TIP('Justify'),TRN,VALUE('4')
                       END
                       CHECK,AT(244,0,16,14),USE(?RTFToolBullets),ICON('BULLETS.ICO'),MSG('Bullets and numbering'), |
  SKIP,TIP('Bullets and numbering'),TRN
                       LIST,AT(262,0,16,14),USE(?RTFToolBulletStyle),LEFT(2),ALRT(EscKey),DROP(8,90),FROM('Bullets|#1' & |
  '|Arabic numbers|#2|Lower letters|#3|Upper letters|#4|Lower Roman numbers|#5|Upper Ro' & |
  'man numbers|#6'),MSG('Bullets styles'),SKIP,TIP('Bullets styles'),TRN
                       LIST,AT(372,0,120,14),USE(?RTFToolFontName),LEFT(2),VSCROLL,ALRT(EscKey),ALRT(EscKey),DROP(10), |
  FORMAT('20L(2)I@S32@'),FROM('1|2'),MSG('Font name'),SKIP,TIP('Font')
                       LIST,AT(494,0,30,14),USE(?RTFToolFontSize),LEFT(2),VSCROLL,ALRT(EscKey),DROP(10),FORMAT('20R(2)@N2@'), |
  FROM('8|9|10|11|12|14|16|18|20|22|24|26|28|36|48|72'),MSG('Font size'),SKIP,TIP('Font size')
                       LIST,AT(494,16,82,12),USE(?RTFToolFontScript),LEFT(2),VSCROLL,ALRT(EscKey),DROP(10),FORMAT('20L(2)@S32@?'), |
  FROM('1|2'),HIDE,MSG('Font charset'),SKIP,TIP('Charset')
                       CHECK,AT(314,0,16,14),USE(?RTFToolBold),ICON('bold.ico'),MSG('Bold'),SKIP,TIP('Bold'),TRN
                       CHECK,AT(330,0,16,14),USE(?RTFToolItalic),ICON('italic.ico'),MSG('Italic'),SKIP,TIP('Italic'), |
  TRN
                       CHECK,AT(346,0,16,14),USE(?RTFToolUnderline),ICON('undrline.ico'),MSG('Underline'),SKIP,TIP('Underline'), |
  TRN
                       LIST,AT(280,0,16,14),USE(?RTFToolFontColor),ALRT(EscKey),DROP(17,60),FORMAT('20L(2)J@S10@'), |
  FROM('Black|1|Maroon|2|Green|3|Olive|4|Navy|5|Purple|6|Teal|7|Gray|8|Silver|9|Red|10|' & |
  'Lime|11|Yellow|12|Blue|13|Fuchia|14|Aqua|15|White|16|Automatic|0'),MSG('Font color'),SKIP, |
  TIP('Font color'),TRN
                       LIST,AT(298,0,16,14),USE(?RTFToolFontBkColor),ALRT(EscKey),DROP(17,60),FORMAT('20L(2)J@S10@'), |
  FROM('Black|1|Maroon|2|Green|3|Olive|4|Navy|5|Purple|6|Teal|7|Gray|8|Silver|9|Red|10|' & |
  'Lime|11|Yellow|12|Blue|13|Fuchia|14|Aqua|15|White|16|Automatic|0'),MSG('Highlight'),SKIP, |
  TIP('Highlight'),TRN
                       TEXT,AT(2,28,490,318),USE(DOC:Body),RTF(TEXT:Field),VSCROLL,BOXED
                       BUTTON('Done'),AT(502,282,70,25),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window'),TRN
                       IMAGE('button.jpg'),AT(502,282,70,25),USE(?Image2)
                       IMAGE('button.jpg'),AT(502,246,70,25),USE(?Image1)
                       BUTTON('&Cancel'),AT(502,246,70,25),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                     END

Convert FILE,NAME('Convert.txt'),DRIVER('ASCII'),PRE(CVT)
  RECORD
Text  STRING(120)
.  .

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
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

RTFControl8          CLASS(RTFControlClass)
ContextMenuText        PROCEDURE(),STRING,DERIVED
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
  IF BAND(gloDoc, DOC:AllowEdit)
    ReturnValue = RequestCompleted
    gloDoc = RequestCompleted
    POST(EVENT:CloseWindow)
  
  ELSE
  ReturnValue = PARENT.ChangeAction()
  .
  RETURN ReturnValue


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateDocs')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RTFToolNew
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(SU:Record,History::SU:Record)
  SELF.AddUpdateFile(Access:Setup)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Docs.Open                                         ! File Docs used by this procedure, so make sure it's RelationManager is open
  Relate:Setup.Open                                        ! File Setup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Setup
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
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  RTFControl8.AddItem(RTFToolbar:CtlButtonNew,?RTFToolNew)
  RTFControl8.AddItem(RTFToolbar:CtlButtonOpen,?RTFToolOpen)
  RTFControl8.AddItem(RTFToolbar:CtlButtonSave,?RTFToolSave)
  RTFControl8.AddItem(RTFToolbar:CtlButtonPrint,?RTFToolPrint)
  RTFControl8.AddItem(RTFToolbar:CtlButtonFind,?RTFToolFind)
  RTFControl8.AddItem(RTFToolbar:CtlButtonFindAndReplace,?RTFToolFindAndReplace)
  RTFControl8.AddItem(RTFToolbar:CtlButtonCut,?RTFToolCut)
  RTFControl8.AddItem(RTFToolbar:CtlButtonCopy,?RTFToolCopy)
  RTFControl8.AddItem(RTFToolbar:CtlButtonPaste,?RTFToolPaste)
  RTFControl8.AddItem(RTFToolbar:CtlButtonUndo,?RTFToolUndo)
  RTFControl8.AddItem(RTFToolbar:CtlButtonRedo,?RTFToolRedo)
  RTFControl8.AddItem(RTFToolbar:CtlButtonTabs,?RTFToolTabs)
  RTFControl8.AddItem(RTFToolbar:CtlButtonPara,?RTFToolPara)
  RTFControl8.AddItem(RTFToolbar:CtlAlignment,?RTFToolAlignment)
  RTFControl8.AddItem(RTFToolbar:CtlAlignmentJust,?RTFToolAlignmentJust)
  RTFControl8.AddItem(RTFToolbar:CtlBullets,?RTFToolBullets)
  RTFControl8.AddItem(RTFToolbar:CtlBulletStyle,?RTFToolBulletStyle)
  RTFControl8.AddItem(RTFToolbar:CtlFontName,?RTFToolFontName)
  RTFControl8.AddItem(RTFToolbar:CtlFontSize,?RTFToolFontSize)
  RTFControl8.AddItem(RTFToolbar:CtlFontScript,?RTFToolFontScript)
  RTFControl8.AddItem(RTFToolbar:CtlBold,?RTFToolBold)
  RTFControl8.AddItem(RTFToolbar:CtlItalic,?RTFToolItalic)
  RTFControl8.AddItem(RTFToolbar:CtlUnderline,?RTFToolUnderline)
  RTFControl8.AddItem(RTFToolbar:CtlFontColor,?RTFToolFontColor)
  RTFControl8.AddItem(RTFToolbar:CtlFontBkColor,?RTFToolFontBkColor)
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    DISABLE(?RTFToolNew)
    DISABLE(?RTFToolOpen)
    DISABLE(?RTFToolSave)
    ?DOC:Subject{PROP:ReadOnly} = True
    DISABLE(?RTFToolPrint)
    DISABLE(?RTFToolFind)
    DISABLE(?RTFToolFindAndReplace)
    DISABLE(?RTFToolCut)
    DISABLE(?RTFToolCopy)
    DISABLE(?RTFToolPaste)
    DISABLE(?RTFToolUndo)
    DISABLE(?RTFToolRedo)
    DISABLE(?RTFToolTabs)
    DISABLE(?RTFToolPara)
    DISABLE(?RTFToolBulletStyle)
    DISABLE(?RTFToolFontName)
    DISABLE(?RTFToolFontSize)
    DISABLE(?RTFToolFontScript)
    DISABLE(?RTFToolFontColor)
    DISABLE(?RTFToolFontBkColor)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('UpdateDocs',QuickWindow)                   ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  RTFControl8.Init(?DOC:Body)
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
   !IF BAND(gloDoc, DOC:AllowEdit) THEN DISABLE(?Cancel).
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
    Relate:Setup.Close
  END
  RTFControl8.Kill()
  IF SELF.Opened
    INIMgr.Update('UpdateDocs',QuickWindow)                ! Save window data to non-volatile store
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
  ReturnValue = RTFControl8.TakeEvent()
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


RTFControl8.ContextMenuText PROCEDURE

ReturnValue          ANY

  CODE
  ReturnValue = PARENT.ContextMenuText()
  ReturnValue = ''
  RETURN ReturnValue

