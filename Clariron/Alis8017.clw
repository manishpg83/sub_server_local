

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8017.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8015.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Exceptions file
!!! </summary>
Ex PROCEDURE 

CurrentTab           STRING(80)                            !
BRW1::View:Browse    VIEW(Exceptions)
                       PROJECT(EXC:Patient)
                       PROJECT(EXC:Age)
                       PROJECT(EXC:StatusW)
                       PROJECT(EXC:StatusL)
                       PROJECT(EXC:StatusQ)
                       PROJECT(EXC:StatusC)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
EXC:Patient            LIKE(EXC:Patient)              !List box control field - type derived from field
EXC:Age                LIKE(EXC:Age)                  !List box control field - type derived from field
EXC:StatusW            LIKE(EXC:StatusW)              !List box control field - type derived from field
EXC:StatusL            LIKE(EXC:StatusL)              !List box control field - type derived from field
EXC:StatusQ            LIKE(EXC:StatusQ)              !List box control field - type derived from field
EXC:StatusC            LIKE(EXC:StatusC)              !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Exception'),AT(1,265,163,66),FONT('MS Sans Serif',8,,FONT:regular),RESIZE,GRAY,MDI, |
  HLP('Ex'),SYSTEM,TIMER(200)
                       LIST,AT(4,1,101,65),USE(?Browse:1),FORMAT('33R(2)|M~Patient~C(0)@p### ###p@14C(2)|M~Age' & |
  '~@s1@11C(2)|M~W~C(0)@s1@11C(2)|M~ L~C(0)@s1@11C(2)|M~Q~C(0)@s1@11C(2)|M~C~C(0)@s1@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Exceptions file')
                       BUTTON('&Change'),AT(112,4,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,HIDE, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(112,6,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,HIDE,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       BUTTON('&Close'),AT(108,32,49,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                     END

BRW1::LastSortOrder       BYTE
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
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetAlerts              PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
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
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Ex')
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
  Relate:Exceptions.Open                          ! File Exceptions used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Exceptions,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,EXC:OrderKey)                ! Add the sort order for EXC:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,EXC:Patient,1,BRW1)   ! Initialize the browse locator using  using key: EXC:OrderKey , EXC:Patient
  BRW1.AddField(EXC:Patient,BRW1.Q.EXC:Patient)   ! Field EXC:Patient is a hot field or requires assignment from browse
  BRW1.AddField(EXC:Age,BRW1.Q.EXC:Age)           ! Field EXC:Age is a hot field or requires assignment from browse
  BRW1.AddField(EXC:StatusW,BRW1.Q.EXC:StatusW)   ! Field EXC:StatusW is a hot field or requires assignment from browse
  BRW1.AddField(EXC:StatusL,BRW1.Q.EXC:StatusL)   ! Field EXC:StatusL is a hot field or requires assignment from browse
  BRW1.AddField(EXC:StatusQ,BRW1.Q.EXC:StatusQ)   ! Field EXC:StatusQ is a hot field or requires assignment from browse
  BRW1.AddField(EXC:StatusC,BRW1.Q.EXC:StatusC)   ! Field EXC:StatusC is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('Ex',QuickWindow)                  ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','Ex',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,6,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
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
    Relate:Exceptions.Close
    Relate:Patient.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('Ex',QuickWindow)                        ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
   PAt:Invoice = EXC:Patient
   GET(Patient,PAT:Invoice_Key)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePatient(0)
    ReturnValue = GlobalResponse
  END
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
    OF EVENT:Timer
      IF gloCloseExceptions = 1
        gloCloseExceptions = 0
        POST(EVENT:Closewindow)
      .
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


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

