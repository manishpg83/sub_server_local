

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8052.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PatientName file
!!! </summary>
PatientNameLookup PROCEDURE (prmName,prmClient)

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(PatientName)
                       PROJECT(PN:Invoice)
                       PROJECT(PN:Date)
                       PROJECT(PN:Last)
                       PROJECT(PN:First)
                       PROJECT(PN:Status)
                       PROJECT(PN:Age)
                       PROJECT(PN:AgeType)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PN:Invoice             LIKE(PN:Invoice)               !List box control field - type derived from field
PN:Invoice_NormalFG    LONG                           !Normal forground color
PN:Invoice_NormalBG    LONG                           !Normal background color
PN:Invoice_SelectedFG  LONG                           !Selected forground color
PN:Invoice_SelectedBG  LONG                           !Selected background color
PN:Invoice_Style       LONG                           !Field style
PN:Date                LIKE(PN:Date)                  !List box control field - type derived from field
PN:Date_NormalFG       LONG                           !Normal forground color
PN:Date_NormalBG       LONG                           !Normal background color
PN:Date_SelectedFG     LONG                           !Selected forground color
PN:Date_SelectedBG     LONG                           !Selected background color
PN:Date_Style          LONG                           !Field style
PN:Last                LIKE(PN:Last)                  !List box control field - type derived from field
PN:Last_NormalFG       LONG                           !Normal forground color
PN:Last_NormalBG       LONG                           !Normal background color
PN:Last_SelectedFG     LONG                           !Selected forground color
PN:Last_SelectedBG     LONG                           !Selected background color
PN:Last_Style          LONG                           !Field style
PN:First               LIKE(PN:First)                 !List box control field - type derived from field
PN:First_NormalFG      LONG                           !Normal forground color
PN:First_NormalBG      LONG                           !Normal background color
PN:First_SelectedFG    LONG                           !Selected forground color
PN:First_SelectedBG    LONG                           !Selected background color
PN:First_Style         LONG                           !Field style
PN:Status              LIKE(PN:Status)                !List box control field - type derived from field
PN:Status_NormalFG     LONG                           !Normal forground color
PN:Status_NormalBG     LONG                           !Normal background color
PN:Status_SelectedFG   LONG                           !Selected forground color
PN:Status_SelectedBG   LONG                           !Selected background color
PN:Status_Style        LONG                           !Field style
PN:Age                 LIKE(PN:Age)                   !List box control field - type derived from field
PN:Age_NormalFG        LONG                           !Normal forground color
PN:Age_NormalBG        LONG                           !Normal background color
PN:Age_SelectedFG      LONG                           !Selected forground color
PN:Age_SelectedBG      LONG                           !Selected background color
PN:Age_Style           LONG                           !Field style
PN:AgeType             LIKE(PN:AgeType)               !List box control field - type derived from field
PN:AgeType_NormalFG    LONG                           !Normal forground color
PN:AgeType_NormalBG    LONG                           !Normal background color
PN:AgeType_SelectedFG  LONG                           !Selected forground color
PN:AgeType_SelectedBG  LONG                           !Selected background color
PN:AgeType_Style       LONG                           !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Patient Lookup by Name'),AT(,,507,330),FONT('Arial',11,,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,MDI,HLP('PatientNameLookup'),SYSTEM
                       LIST,AT(6,12,296,286),USE(?Browse:1),VSCROLL,FORMAT('36R(2)|M*Y~Assession~C(0)@p### ###' & |
  'p@50L(2)|M*Y~Date~C(0)@D3@80L(2)|M*Y~Last~@s20@64L(2)|M*Y~First~@s15@28C(2)|M*Y~Stat' & |
  'us~L@s1@16R(2)M*Y~Age~C(0)@n3@36L(2)|M*Y@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he PatientName file'),TRN
                       BUTTON('&Select'),AT(318,184,70,26),USE(?Select:2),LEFT,ICON('SteelSelect.ico'),MSG('Select the Record'), |
  TIP('Select the Record'),TRN
                       BUTTON('&Done'),AT(318,258,70,26),USE(?Close),LEFT,ICON('SteelCheck.ico'),MSG('Close Window'), |
  TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(318,184,70,26),USE(?Image2)
                       IMAGE('button.jpg'),AT(318,258,70,26),USE(?Image1)
                       BUTTON('&Help'),AT(318,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
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
  GlobalErrors.SetProcedureName('PatientNameLookup')
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
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  Relate:PatientName.Open                         ! File PatientName used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PatientName,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon PN:Last for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PN:OrderKey) ! Add the sort order for PN:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PN:Last,1,BRW1)       ! Initialize the browse locator using  using key: PN:OrderKey , PN:Last
  BRW1.AddField(PN:Invoice,BRW1.Q.PN:Invoice)     ! Field PN:Invoice is a hot field or requires assignment from browse
  BRW1.AddField(PN:Date,BRW1.Q.PN:Date)           ! Field PN:Date is a hot field or requires assignment from browse
  BRW1.AddField(PN:Last,BRW1.Q.PN:Last)           ! Field PN:Last is a hot field or requires assignment from browse
  BRW1.AddField(PN:First,BRW1.Q.PN:First)         ! Field PN:First is a hot field or requires assignment from browse
  BRW1.AddField(PN:Status,BRW1.Q.PN:Status)       ! Field PN:Status is a hot field or requires assignment from browse
  BRW1.AddField(PN:Age,BRW1.Q.PN:Age)             ! Field PN:Age is a hot field or requires assignment from browse
  BRW1.AddField(PN:AgeType,BRW1.Q.PN:AgeType)     ! Field PN:AgeType is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('PatientNameLookup',QuickWindow)   ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PatientNameLookup',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,42,LFM_CFile,LFM_CFile.Record)
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
    Relate:Patient.Close
    Relate:PatientName.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('PatientNameLookup',QuickWindow)         ! Save window data to non-volatile store
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PN:Invoice_Style = 1 ! 
  SELF.Q.PN:Date_Style = 1 ! 
  SELF.Q.PN:Last_Style = 1 ! 
  SELF.Q.PN:First_Style = 1 ! 
  SELF.Q.PN:Status_Style = 1 ! 
  SELF.Q.PN:Age_Style = 1 ! 
  SELF.Q.PN:AgeType_Style = 1 ! 
  SELF.Q.PN:Invoice_NormalFG = -1                          ! Set color values for PN:Invoice
  SELF.Q.PN:Invoice_NormalBG = -1
  SELF.Q.PN:Invoice_SelectedFG = -1
  SELF.Q.PN:Invoice_SelectedBG = -1
  SELF.Q.PN:Date_NormalFG = -1                             ! Set color values for PN:Date
  SELF.Q.PN:Date_NormalBG = -1
  SELF.Q.PN:Date_SelectedFG = -1
  SELF.Q.PN:Date_SelectedBG = -1
  SELF.Q.PN:Last_NormalFG = -1                             ! Set color values for PN:Last
  SELF.Q.PN:Last_NormalBG = -1
  SELF.Q.PN:Last_SelectedFG = -1
  SELF.Q.PN:Last_SelectedBG = -1
  SELF.Q.PN:First_NormalFG = -1                            ! Set color values for PN:First
  SELF.Q.PN:First_NormalBG = -1
  SELF.Q.PN:First_SelectedFG = -1
  SELF.Q.PN:First_SelectedBG = -1
  SELF.Q.PN:Status_NormalFG = -1                           ! Set color values for PN:Status
  SELF.Q.PN:Status_NormalBG = -1
  SELF.Q.PN:Status_SelectedFG = -1
  SELF.Q.PN:Status_SelectedBG = -1
  SELF.Q.PN:Age_NormalFG = -1                              ! Set color values for PN:Age
  SELF.Q.PN:Age_NormalBG = -1
  SELF.Q.PN:Age_SelectedFG = -1
  SELF.Q.PN:Age_SelectedBG = -1
  SELF.Q.PN:AgeType_NormalFG = -1                          ! Set color values for PN:AgeType
  SELF.Q.PN:AgeType_NormalBG = -1
  SELF.Q.PN:AgeType_SelectedFG = -1
  SELF.Q.PN:AgeType_SelectedBG = -1


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

