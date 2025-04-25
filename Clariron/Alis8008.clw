

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8008.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8007.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Rast file
!!! </summary>
RastTable PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Rast)
                       PROJECT(RST:NUMBER)
                       PROJECT(RST:DESCRIPTION)
                       PROJECT(RST:sDescription)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
RST:NUMBER             LIKE(RST:NUMBER)               !List box control field - type derived from field
RST:NUMBER_Style       LONG                           !Field style
RST:DESCRIPTION        LIKE(RST:DESCRIPTION)          !List box control field - type derived from field
RST:DESCRIPTION_Style  LONG                           !Field style
RST:sDescription       LIKE(RST:sDescription)         !List box control field - type derived from field
RST:sDescription_Style LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Rast Library'),AT(0,0,506,341),FONT('Arial',11),RESIZE,GRAY,IMM,MDI,HLP('RastTable')
                       LIST,AT(18,40,318,253),USE(?Browse:1),FONT(,,,FONT:bold,CHARSET:ANSI),VSCROLL,GRID(COLOR:Blue), |
  FORMAT('44L(2)|MY~Code~@s5@131L(2)|MY~Description~@s30@160L(2)|MY~Spanish Description~@s40@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the Rast file'),TRN
                       STRING('Rast Library'),AT(24,10),USE(?String1),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                       BUTTON('&Select'),AT(344,104,70,25),USE(?Select:2),FONT(,,,FONT:bold),LEFT,ICON('SteelSelect.ico'), |
  MSG('Select the Record'),TIP('Select the Record'),TRN
                       BUTTON('&Insert'),AT(344,178,70,25),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  MSG('Insert a Record'),TIP('Insert a Record'),TRN
                       BUTTON('&Change'),AT(344,140,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(344,66,70,25),USE(?Delete:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  MSG('Delete the Record'),TIP('Delete the Record'),TRN
                       SHEET,AT(18,28,319,265),USE(?CurrentTab),SPREAD
                         TAB('Code'),USE(?Tab:2)
                         END
                         TAB('Description'),USE(?Tab:3)
                         END
                         TAB('&3) LABEL_KEY'),USE(?Tab:4),HIDE
                         END
                       END
                       BUTTON('&Close'),AT(420,290,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(344,66,70,25),USE(?Image5)
                       IMAGE('button.jpg'),AT(344,140,70,25),USE(?Image4)
                       IMAGE('button.jpg'),AT(344,178,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(344,104,70,24),USE(?SelectImage),HIDE
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image1)
                       BUTTON('&Help'),AT(0,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Export'),AT(20,311),USE(?BUTTON_Export)
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
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepClass                            ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Text    STRING(128)
        . .    

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
  GlobalErrors.SetProcedureName('RastTable')
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
  Relate:Rast.Open                                ! File Rast used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Rast,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon RST:DESCRIPTION for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,RST:DESCRIPT_KEY) ! Add the sort order for RST:DESCRIPT_KEY for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,RST:DESCRIPTION,1,BRW1) ! Initialize the browse locator using  using key: RST:DESCRIPT_KEY , RST:DESCRIPTION
  BRW1.AddSortOrder(,)                            ! Add the sort order for  for sort order 2
  BRW1.AddSortOrder(,RST:ORDER_KEY)               ! Add the sort order for RST:ORDER_KEY for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,RST:NUMBER,1,BRW1)    ! Initialize the browse locator using  using key: RST:ORDER_KEY , RST:NUMBER
  BRW1.AddField(RST:NUMBER,BRW1.Q.RST:NUMBER)     ! Field RST:NUMBER is a hot field or requires assignment from browse
  BRW1.AddField(RST:DESCRIPTION,BRW1.Q.RST:DESCRIPTION) ! Field RST:DESCRIPTION is a hot field or requires assignment from browse
  BRW1.AddField(RST:sDescription,BRW1.Q.RST:sDescription) ! Field RST:sDescription is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','RastTable',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  IF SELF.Request = SelectRecord
    UNHIDE(?SelectImage)
  .
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
    Relate:Rast.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF gloMonitoringLoginTest
    ReturnValue = RequestCancelled  
  ELSE
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateRast
    ReturnValue = GlobalResponse
  END
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
    OF ?BUTTON_Export
      CLOSE(Post)
      gloFileName2 = 'C:\Apps\rast.txt'
      CREATE(Post)
      IF ERRORCODE() THEN STOP('CREATE PST: ' & ERROR()).
      OPEN(Post)
      IF ERRORCODE() THEN STOP('OPEN PST: ' & ERROR()).
      SET(RST:ORDER_KEY)
      IF ERRORCODE() THEN STOP('SET RST ' & ERROR()). 
      LOOP UNTIL EOF(Rast)
        NEXT(Rast)
        IF ERRORCODE() THEN STOP('NEXT RST ' & ERROR()).        
        PST:Text = RST:NUMBER & '|' & CLIP(RST:DESCRIPTION) & '|' & CLIP(RST:sDescription) & '|' & CLIP(RST:ShortDescription)
        ADD(Post)
        IF ERRORCODE() THEN STOP('ADD PST: ' & ERROR()).
        I# += 1
      .
      CLOSE(Post)
      
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


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.RST:NUMBER_Style = 1 ! 
  SELF.Q.RST:DESCRIPTION_Style = 1 ! 
  SELF.Q.RST:sDescription_Style = 1 ! 


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>2,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>2,1,NewOrder+1))
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

