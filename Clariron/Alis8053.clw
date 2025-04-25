

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8053.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the LogInTests file
!!! </summary>
PanelTestDelete PROCEDURE (prmPanel)

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(LogInPanelTests)
                       PROJECT(LPT:CODE)
                       PROJECT(LPT:TypeDescription)
                       PROJECT(LPT:TestDescription)
                       PROJECT(LPT:Panel)
                       PROJECT(LPT:TYPE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LPT:CODE               LIKE(LPT:CODE)                 !List box control field - type derived from field
LPT:CODE_Style         LONG                           !Field style
LPT:TypeDescription    LIKE(LPT:TypeDescription)      !List box control field - type derived from field
LPT:TypeDescription_Style LONG                        !Field style
LPT:TestDescription    LIKE(LPT:TestDescription)      !List box control field - type derived from field
LPT:TestDescription_Style LONG                        !Field style
LPT:Panel              LIKE(LPT:Panel)                !Primary key field - type derived from field
LPT:TYPE               LIKE(LPT:TYPE)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Delete Panel Test'),AT(,,284,316),FONT('ARIAL',11,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('PanelTestDelete'),SYSTEM
                       LIST,AT(18,12,142,295),USE(?Browse:1),VSCROLL,FORMAT('28R(1)|MY~Code~C(0)@s7@23R(1)|MY~' & |
  'Type~C(0)@s4@120R(2)|MY~Description~L@s30@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he LogInTests file'),NOBAR,TRN
                       BUTTON('Delete'),AT(186,40,70,25),USE(?DeleteButton),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  HIDE,TRN
                       STRING('Keep as Standard Panel'),AT(184,138),USE(?String2),FONT(,,,FONT:bold),TRN
                       BUTTON('Keep '),AT(190,148,70,25),USE(?Button),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DEFAULT,STD(STD:Close),TRN
                       IMAGE('button.jpg'),AT(186,40,70,25),USE(?Image2),HIDE
                       IMAGE('button.jpg'),AT(190,148,70,25),USE(?Image1)
                       STRING('Delete the Panel Tests Also?'),AT(18,0,142,12),USE(?String1),FONT(,14,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
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
  !------------------------------------
  !Style for ?Browse:1
  !------------------------------------
  ?Browse:1{PROPSTYLE:FontName, 1}      = gloListFont
  ?Browse:1{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?Browse:1{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?Browse:1{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?Browse:1{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PanelTestDelete')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:LogInPanelTests.Open                     ! File LogInPanelTests used by this procedure, so make sure it's RelationManager is open
  Relate:Panels.SetOpenRelated()
  Relate:Panels.Open                              ! File Panels used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  Access:Pnl_test.UseFile                         ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:LogInPanelTests,SELF) ! Initialize the browse manager
  CLEAR(PT:Record)
  PT:Panel = prmPanel
  SET(Pnl_Test)
  LOOP
    NEXT(Pnl_Test)
    IF PT:PANEL <> prmPanel OR ERRORCODE() THEN BREAK.
    LPT:CODE = PT:CODE
    LPT:TYPE = PT:TYPE
    RST:NUMBER = PT:CODE
    GET(Rast,RST:ORDER_KEY)
    LPT:TestDescription = RST:DESCRIPTION
    ADD(LogInPanelTests)
  .
  
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon LPT:Panel for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,LPT:OrderKey) ! Add the sort order for LPT:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,LPT:Panel,1,BRW1)     ! Initialize the browse locator using  using key: LPT:OrderKey , LPT:Panel
  BRW1.AddField(LPT:CODE,BRW1.Q.LPT:CODE)         ! Field LPT:CODE is a hot field or requires assignment from browse
  BRW1.AddField(LPT:TypeDescription,BRW1.Q.LPT:TypeDescription) ! Field LPT:TypeDescription is a hot field or requires assignment from browse
  BRW1.AddField(LPT:TestDescription,BRW1.Q.LPT:TestDescription) ! Field LPT:TestDescription is a hot field or requires assignment from browse
  BRW1.AddField(LPT:Panel,BRW1.Q.LPT:Panel)       ! Field LPT:Panel is a hot field or requires assignment from browse
  BRW1.AddField(LPT:TYPE,BRW1.Q.LPT:TYPE)         ! Field LPT:TYPE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('PanelTestDelete',QuickWindow)     ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PanelTestDelete',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:LogInPanelTests.Close
    Relate:Panels.Close
    Relate:Rast.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('PanelTestDelete',QuickWindow)           ! Save window data to non-volatile store
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
    OF ?DeleteButton
      CLEAR(PT:Record)
      PT:Panel = prmPanel
      SET(PT:ORDER_KEY,PT:ORDER_KEY)
      LOOP
        NEXT(Pnl_Test)
        IF PT:PANEL <> prmPanel OR ERRORCODE() THEN BREAK.
        DELETE(Pnl_Test)
      .
      POST(EVENT:CloseWindow)
      
      
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
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.LPT:CODE_Style = 1 ! 
  SELF.Q.LPT:TypeDescription_Style = 1 ! 
  SELF.Q.LPT:TestDescription_Style = 1 ! 


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

