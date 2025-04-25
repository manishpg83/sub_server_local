

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8049.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8048.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PickUp file
!!! </summary>
FedExClientTable PROCEDURE (prmClient)

CurrentTab           STRING(80)                            !
locClient            LONG                                  !
locPopupString       STRING(20)                            !
locClientName        STRING(40)                            !
BRW1::View:Browse    VIEW(PickUp)
                       PROJECT(PU:Received)
                       PROJECT(PU:Date)
                       PROJECT(PU:Inititals)
                       PROJECT(PU:ContactName)
                       PROJECT(PU:Note)
                       PROJECT(PU:Client)
                       JOIN(CLI:ORDER_KEY,PU:Client)
                         PROJECT(CLI:NUMBER)
                       END
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PU:Received            LIKE(PU:Received)              !List box control field - type derived from field
PU:Received_NormalFG   LONG                           !Normal forground color
PU:Received_NormalBG   LONG                           !Normal background color
PU:Received_SelectedFG LONG                           !Selected forground color
PU:Received_SelectedBG LONG                           !Selected background color
PU:Received_Icon       LONG                           !Entry's icon ID
PU:Received_Style      LONG                           !Field style
PU:Date                LIKE(PU:Date)                  !List box control field - type derived from field
PU:Date_NormalFG       LONG                           !Normal forground color
PU:Date_NormalBG       LONG                           !Normal background color
PU:Date_SelectedFG     LONG                           !Selected forground color
PU:Date_SelectedBG     LONG                           !Selected background color
PU:Date_Style          LONG                           !Field style
PU:Inititals           LIKE(PU:Inititals)             !List box control field - type derived from field
PU:Inititals_NormalFG  LONG                           !Normal forground color
PU:Inititals_NormalBG  LONG                           !Normal background color
PU:Inititals_SelectedFG LONG                          !Selected forground color
PU:Inititals_SelectedBG LONG                          !Selected background color
PU:Inititals_Style     LONG                           !Field style
PU:ContactName         LIKE(PU:ContactName)           !List box control field - type derived from field
PU:ContactName_NormalFG LONG                          !Normal forground color
PU:ContactName_NormalBG LONG                          !Normal background color
PU:ContactName_SelectedFG LONG                        !Selected forground color
PU:ContactName_SelectedBG LONG                        !Selected background color
PU:ContactName_Style   LONG                           !Field style
PU:Note                LIKE(PU:Note)                  !List box control field - type derived from field
PU:Note_NormalFG       LONG                           !Normal forground color
PU:Note_NormalBG       LONG                           !Normal background color
PU:Note_SelectedFG     LONG                           !Selected forground color
PU:Note_SelectedBG     LONG                           !Selected background color
PU:Note_Style          LONG                           !Field style
PU:Client              LIKE(PU:Client)                !Browse key field - type derived from field
CLI:NUMBER             LIKE(CLI:NUMBER)               !Related join file key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
QuickWindow          WINDOW('Client Pickups'),AT(0,,398,178),FONT('Arial',11,,FONT:regular),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('FedExTable'),SYSTEM
                       LIST,AT(7,20,288,145),USE(?Browse:1),VSCROLL,FORMAT('12R(2)|M*JY@n3@37R(2)|M*Y~Date~C(0' & |
  ')@d1@24C(2)|M*Y~Initials~@s3@53L(2)|M*Y~Contact~@s20@80L(2)|M*Y~Note~@s20@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the PickUp file'),TRN
                       BUTTON('&Select'),AT(167,0,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&Add New'),AT(315,68,70,26),USE(?Insert:4),LEFT,ICON('SteelAdd.ico'),MSG('Insert a Record'), |
  TIP('Insert a Record'),TRN
                       BUTTON('Received'),AT(315,102,70,26),USE(?MarkReceivedButton),LEFT,ICON('WAMARK.ICO'),TRN
                       BUTTON('View Edit'),AT(315,34,70,26),USE(?Change:4),LEFT,ICON('SteelDelta.ico'),DEFAULT,MSG('Change the Record'), |
  TIP('Change the Record'),TRN
                       BUTTON('&Delete'),AT(315,0,70,26),USE(?Delete:4),LEFT,ICON('SteelDelete.ico'),MSG('Delete the Record'), |
  TIP('Delete the Record'),TRN
                       SHEET,AT(3,4,296,165),USE(?CurrentTab),FONT('Arial',11),HIDE
                         TAB('Date'),USE(?Tab:2),HIDE
                         END
                         TAB('Client'),USE(?Tab:3),HIDE
                         END
                       END
                       STRING(@s40),AT(57,4),USE(locClientName),FONT(,12,,FONT:bold),TRN
                       BUTTON('&Close'),AT(315,136,70,26),USE(?Close),LEFT,ICON('SteelCheck.ico'),MSG('Close Window'), |
  TIP('Close Window'),TRN
                       IMAGE('button.jpg'),AT(315,0,70,26),USE(?Image5)
                       IMAGE('button.jpg'),AT(315,36),USE(?Image4)
                       IMAGE('button.jpg'),AT(315,68,70,26),USE(?Image3)
                       IMAGE('button.jpg'),AT(315,102,70,26),USE(?Image2)
                       IMAGE('button.jpg'),AT(315,136,70,26),USE(?Image1)
                       BUTTON('&Help'),AT(249,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

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
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

PopupMgr3            PopupClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

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
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
ShowMark  ROUTINE
  IF PU:Received
    ?MarkReceivedButton{PROP:Text} = 'Not Received'
    ?MarkReceivedButton{PROP:Icon} = 'UnDo.ico'
  ELSE
    ?MarkReceivedButton{PROP:Text} = 'Received'
    ?MarkReceivedButton{PROP:Icon} = 'WAMark.ico'
  .

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('FedExClientTable')
  locClient=prmClient
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PickUp,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha)       ! Moveable thumb based upon PU:Received for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PU:ClientKey)    ! Add the sort order for PU:ClientKey for sort order 1
  BRW1.AddRange(PU:Client,locClient)                       ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PU:Received,1,BRW1)            ! Initialize the browse locator using  using key: PU:ClientKey , PU:Received
  ?Browse:1{PROP:IconList,1} = '~checkoff.ico'
  ?Browse:1{PROP:IconList,2} = '~checkon.ico'
  BRW1.AddField(PU:Received,BRW1.Q.PU:Received)            ! Field PU:Received is a hot field or requires assignment from browse
  BRW1.AddField(PU:Date,BRW1.Q.PU:Date)                    ! Field PU:Date is a hot field or requires assignment from browse
  BRW1.AddField(PU:Inititals,BRW1.Q.PU:Inititals)          ! Field PU:Inititals is a hot field or requires assignment from browse
  BRW1.AddField(PU:ContactName,BRW1.Q.PU:ContactName)      ! Field PU:ContactName is a hot field or requires assignment from browse
  BRW1.AddField(PU:Note,BRW1.Q.PU:Note)                    ! Field PU:Note is a hot field or requires assignment from browse
  BRW1.AddField(PU:Client,BRW1.Q.PU:Client)                ! Field PU:Client is a hot field or requires assignment from browse
  BRW1.AddField(CLI:NUMBER,BRW1.Q.CLI:NUMBER)              ! Field CLI:NUMBER is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW1.AskProcedure = 1
  PopupMgr3.Init(INIMgr)
  PopupMgr3.AddItem('Mark Received','MarkReceived')
  PopupMgr3.AddItemMimic('MarkReceived',?MarkReceivedButton)
  PopupMgr3.AddItem('-','Seperator1')
  PopupMgr3.AddItem('Select','Select')
  PopupMgr3.AddItemMimic('Select',?Change:4)
  PopupMgr3.AddItem('-','Seperator2')
  PopupMgr3.AddItem('Add New','AddNew')
  PopupMgr3.AddItemMimic('AddNew',?Insert:4)
  PopupMgr3.AddItem('-','Seperator3')
  PopupMgr3.AddItem('Delete','Delete')
  PopupMgr3.AddItemMimic('Delete',?Delete:4)
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  CLI:NUMBER = prmClient
  GET(Client,CLI:ORDER_KEY)
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
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
    Relate:Client.Close
  END
  BRW1::AutoSizeColumn.Kill()
  PopupMgr3.Kill
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePickUp
    ReturnValue = GlobalResponse
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
    OF ?Insert:4
      PU:Client = prmClient
    OF ?MarkReceivedButton
      ThisWindow.Update
      GET(PickUp,PU:ClientKey)
      IF ERRORCODE() THEN STOP('GET PICKUP: ' & ERROR()).
      PU:Received = BXOR(PU:Received,1)
      PUT(PickUp)
      BRW1.ResetFromFile
      
      POST(EVENT:NewSelection,?Browse:1)
    OF ?Change:4
      !
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
  IF KEYCODE() = MouseRight
    ThisWindow.Update
  
   ! STOP('RCV=' & PU:Received & ' ' & PopupMgr3.GetItemEnabled('MarkReceived') & ' marked/unmarked ' &  PopupMgr3.GetItemEnabled('UnMarkReceived') )
     
  locPopupString=PopupMgr3.Ask()
.! END Popup.ASK
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


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PU:Received_Style = 1 ! 1
  SELF.Q.PU:Date_Style = 1 ! 1
  SELF.Q.PU:Inititals_Style = 1 ! 1
  SELF.Q.PU:ContactName_Style = 1 ! 1
  SELF.Q.PU:Note_Style = 1 ! 1
  SELF.Q.PU:Received_NormalFG = -1                         ! Set color values for PU:Received
  SELF.Q.PU:Received_NormalBG = -1
  SELF.Q.PU:Received_SelectedFG = -1
  SELF.Q.PU:Received_SelectedBG = -1
  IF (PU:Received=0)
    SELF.Q.PU:Received_Icon = 1                            ! Set icon from icon list
  ELSE
    SELF.Q.PU:Received_Icon = 2                            ! Set icon from icon list
  END
  SELF.Q.PU:Date_NormalFG = -1                             ! Set color values for PU:Date
  SELF.Q.PU:Date_NormalBG = -1
  SELF.Q.PU:Date_SelectedFG = -1
  SELF.Q.PU:Date_SelectedBG = -1
  SELF.Q.PU:Inititals_NormalFG = -1                        ! Set color values for PU:Inititals
  SELF.Q.PU:Inititals_NormalBG = -1
  SELF.Q.PU:Inititals_SelectedFG = -1
  SELF.Q.PU:Inititals_SelectedBG = -1
  SELF.Q.PU:ContactName_NormalFG = -1                      ! Set color values for PU:ContactName
  SELF.Q.PU:ContactName_NormalBG = -1
  SELF.Q.PU:ContactName_SelectedFG = -1
  SELF.Q.PU:ContactName_SelectedBG = -1
  SELF.Q.PU:Note_NormalFG = -1                             ! Set color values for PU:Note
  SELF.Q.PU:Note_NormalBG = -1
  SELF.Q.PU:Note_SelectedFG = -1
  SELF.Q.PU:Note_SelectedBG = -1


BRW1.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  ThisWindow.Update
  DO ShowMark


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

