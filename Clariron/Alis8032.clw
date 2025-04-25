

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8032.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8031.INC'),ONCE        !Req'd for module callout resolution
                     END


gloLanguage   STRING(1)
gloPrinter   STRING(64)
gloTextFileName   STRING(64)
gloPassword   STRING(6)
TRange   DECIMAL(5,2),DIM(5,2)
gloFees   DECIMAL(5,2),DIM(4,5)
gloTotalSummary   BYTE
gloTotal   BYTE
gloSendout   BYTE
gloSendout100   BYTE
gloSendout200   BYTE
gloPeanutPanel   BYTE
gloOverride   BYTE
gloREPORTTITLE   STRING(26)
gloRPTNOTICE1   STRING(20)
gloRPTNOTICE2   STRING(20)
gloRPTNOTICE3   STRING(20)
gloSKIPQC   BYTE
gloReportdate   LONG
gloFaxIt   BYTE
gloLast   LONG
gloFirst   LONG
gloExport   BYTE
gloInvoice   BYTE
GlobalTotal   DECIMAL(7,2)
gloCLInum   LONG
gloDATE0   LONG
gloDate   LONG
gloBilledDate   LONG
gloTime   LONG
gloNote1   STRING(60)
gloNote2   STRING(60)
gloPatName   STRING(40)
gloClientName   STRING(35)
gloAddress1   STRING(35)
gloAddress2   STRING(40)
gloAddress3   STRING(40)
gloExportFile   STRING(22)
gloIgEInterp   BYTE
gloDIgEInterp   BYTE
gloIgGInterp   BYTE
gloIgG4Interp   BYTE
gloGAM   BYTE,DIM(3)
gloE   BYTE
gloG4   BYTE
gloG   BYTE
gloIGG   BYTE,DIM(4)
gloFood   BYTE
gloInhalant   BYTE
gloDust   BYTE
gloPollen   BYTE
gloMold   BYTE
gloAllercare   BYTE
gloIsFax   BYTE
gloIGG_Flag   BYTE
gloASR_Flag   BYTE
gloPATCollection   STRING(16)
gloGEETotal   DECIMAL(7,2)
gloFaxNumber   STRING(20)
Results   QUEUE,PRE(RES)
Sort   STRING(1)
Category   STRING(1)
Code   STRING(9)
Description   STRING(40)
Type   STRING(4)
Result   STRING(10)
Conc   STRING(7)
Score   STRING(8)
Status   STRING(1)
Panel   STRING(9)
Summary   BYTE
Fee   DECIMAL(5,2)
FeeLevel   BYTE
   END
gloTotalGConc   DECIMAL(7,2)
gloTotaLAConc   DECIMAL(7,2)
gloTotalMConc   DECIMAL(7,2)
gloTotalEConc   DECIMAL(7,2)
gloTotalEScore   STRING(7)
gloTotalERange   STRING(16)
gloTotalGScore   STRING(7)
gloTotalGRange   STRING(16)
gloTotalAScore   STRING(7)
gloTotalARange   STRING(16)
gloTotalMScore   STRING(7)
gloTotalMRange   STRING(16)
gloTE   BYTE
gloTG   BYTE
gloTA   BYTE
gloTM   BYTE
PatientReports   QUEUE,PRE(PR)
Invoice   LIKE(PAT:Invoice)
Client   LIKE(PAT:Client)
eMail   BYTE
Postal   BYTE
Fax   BYTE
Language   BYTE
FileName   STRING(20)
FollowUp   STRING(255)
Consolidate   BYTE
Sendout   BYTE
Reports   BYTE
   END
SAV:Patient   LONG
locOverWrite   BYTE
locTarget   BYTE,DIM(255)
locSource   BYTE,DIM(255)
locLength   USHORT
locSourcePosition   USHORT
locTargetPosition   USHORT
locPathZ   STRING(48)
!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the PCodes file
!!! </summary>
PassCodes PROCEDURE 

CurrentTab           STRING(80)                            !
locPermissions       STRING(20),DIM(16)                    !
locPermissionString  STRING(16),DIM(16)                    !
locAdmin             BYTE                                  !
locPatients          BYTE                                  !
locEditPatients      BYTE                                  !
locEditClients       BYTE                                  !
locClients           BYTE                                  !
locResultsReadIn     BYTE                                  !
locResultsView       BYTE                                  !
locResultsPrint      BYTE                                  !
locWorkpool          BYTE                                  !
locVerify            BYTE                                  !
locLogin             BYTE                                  !
BRW1::View:Browse    VIEW(PCodes)
                       PROJECT(PC:Initials)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PC:Initials            LIKE(PC:Initials)              !List box control field - type derived from field
PC:Initials_Style      LONG                           !Field style
locPermissions_1       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_1_Style LONG                           !Field style
locPermissions_2       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_2_Style LONG                           !Field style
locPermissions_3       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_3_Style LONG                           !Field style
locPermissions_4       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_4_Style LONG                           !Field style
locPermissions_5       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_5_Style LONG                           !Field style
locPermissions_6       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_6_Style LONG                           !Field style
locPermissions_7       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_7_Style LONG                           !Field style
locPermissions_8       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_8_Style LONG                           !Field style
locPermissions_9       STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_9_Style LONG                           !Field style
locPermissions_10      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_10_Style LONG                          !Field style
locPermissions_11      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_11_Style LONG                          !Field style
locPermissions_12      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_12_Style LONG                          !Field style
locPermissions_13      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_13_Style LONG                          !Field style
locPermissions_14      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_14_Style LONG                          !Field style
locPermissions_15      STRING(20)                     !List box control field - type derived from local data (Array Component)
locPermissions_15_Style LONG                          !Field style
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Permissions'),AT(,,506,341),FONT('Arial',11,,FONT:regular),RESIZE,CENTER,IMM,MDI,HLP('PassCodes')
                       BUTTON('&Close'),AT(420,290,70,25),USE(?Close),LEFT,ICON('SteelCheck.ico'),MSG('Close Window'), |
  TIP('Close Window'),TRN
                       IMAGE('BUTTON.JPG'),AT(420,290,70,25),USE(?Image1)
                       BUTTON('&Select'),AT(98,238,49,14),USE(?Select:2),LEFT,ICON('WASELECT.ICO'),FLAT,MSG('Select the Record'), |
  TIP('Select the Record')
                       BUTTON('&Insert'),AT(204,238,49,14),USE(?Insert:4),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(258,238,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(310,238,49,14),USE(?Delete:4),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       LIST,AT(0,18,505,217),USE(?Browse:1),FONT(,10),HVSCROLL,FORMAT('16L(2)|MY@s3@Z(1)40L(2)' & |
  '|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)' & |
  '|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@40L(2)' & |
  '|MY@s20@40L(2)|MY@s20@40L(2)|MY@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the PCodes file'), |
  NOBAR,TRN
                       PANEL,AT(0,18,505,217),USE(?Panel1)
                     END

BRW1::LastSortOrder       BYTE
BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
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
  GlobalErrors.SetProcedureName('PassCodes')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Close
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locPermissions_1',locPermissions[1])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_2',locPermissions[2])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_3',locPermissions[3])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_4',locPermissions[4])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_5',locPermissions[5])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_6',locPermissions[6])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_7',locPermissions[7])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_8',locPermissions[8])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_9',locPermissions[9])      ! Added by: BrowseBox(ABC)
  BIND('locPermissions_10',locPermissions[10])    ! Added by: BrowseBox(ABC)
  BIND('locPermissions_11',locPermissions[11])    ! Added by: BrowseBox(ABC)
  BIND('locPermissions_12',locPermissions[12])    ! Added by: BrowseBox(ABC)
  BIND('locPermissions_13',locPermissions[13])    ! Added by: BrowseBox(ABC)
  BIND('locPermissions_14',locPermissions[14])    ! Added by: BrowseBox(ABC)
  BIND('locPermissions_15',locPermissions[15])    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:PCodes.Open                              ! File PCodes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:PCodes,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?Browse:1{Prop:LineHeight} = 16
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon PC:Initials for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PC:OrderKey) ! Add the sort order for PC:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PC:Initials,1,BRW1)   ! Initialize the browse locator using  using key: PC:OrderKey , PC:Initials
  BRW1.AddField(PC:Initials,BRW1.Q.PC:Initials)   ! Field PC:Initials is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[1],BRW1.Q.locPermissions_1) ! Field locPermissions[1] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[2],BRW1.Q.locPermissions_2) ! Field locPermissions[2] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[3],BRW1.Q.locPermissions_3) ! Field locPermissions[3] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[4],BRW1.Q.locPermissions_4) ! Field locPermissions[4] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[5],BRW1.Q.locPermissions_5) ! Field locPermissions[5] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[6],BRW1.Q.locPermissions_6) ! Field locPermissions[6] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[7],BRW1.Q.locPermissions_7) ! Field locPermissions[7] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[8],BRW1.Q.locPermissions_8) ! Field locPermissions[8] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[9],BRW1.Q.locPermissions_9) ! Field locPermissions[9] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[10],BRW1.Q.locPermissions_10) ! Field locPermissions[10] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[11],BRW1.Q.locPermissions_11) ! Field locPermissions[11] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[12],BRW1.Q.locPermissions_12) ! Field locPermissions[12] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[13],BRW1.Q.locPermissions_13) ! Field locPermissions[13] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[14],BRW1.Q.locPermissions_14) ! Field locPermissions[14] is a hot field or requires assignment from browse
  BRW1.AddField(locPermissions[15],BRW1.Q.locPermissions_15) ! Field locPermissions[15] is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PassCodes',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,32,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  locPermissionString[1] = 'Admin'
  locPermissionString[2] = 'View Client'
  locPermissionString[3] = 'Edit Client'
  locPermissionString[4] = 'View Patient'
  locPermissionString[5] = 'Edit Patient'
  locPermissionString[6] = 'Log In'
  locPermissionString[7] = 'Verify'
  locPermissionString[8] = 'Work Pool'
  locPermissionString[9] = 'Read In'
  locPermissionString[10] = 'Print Report'
  locPermissionString[11] = 'View Report'
  locPermissionString[12] = 'Data Tables'
  locPermissionString[13] = 'Analysis'
  locPermissionString[14] = 'Billing'
  locPermissionString[15] = 'Web Password'
  
  
  
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
    Relate:PCodes.Close
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
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePCodes
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


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.PC:Initials_Style = 1 ! 
  SELF.Q.locPermissions_1_Style = 1 ! 
  SELF.Q.locPermissions_2_Style = 1 ! 
  SELF.Q.locPermissions_3_Style = 1 ! 
  SELF.Q.locPermissions_4_Style = 1 ! 
  SELF.Q.locPermissions_5_Style = 1 ! 
  SELF.Q.locPermissions_6_Style = 1 ! 
  SELF.Q.locPermissions_7_Style = 1 ! 
  SELF.Q.locPermissions_8_Style = 1 ! 
  SELF.Q.locPermissions_9_Style = 1 ! 
  SELF.Q.locPermissions_10_Style = 1 ! 
  SELF.Q.locPermissions_11_Style = 1 ! 
  SELF.Q.locPermissions_12_Style = 1 ! 
  SELF.Q.locPermissions_13_Style = 1 ! 
  SELF.Q.locPermissions_14_Style = 1 ! 
  SELF.Q.locPermissions_15_Style = 1 ! 


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


BRW1.ValidateRecord PROCEDURE

ReturnValue          BYTE,AUTO

BRW1::RecordStatus   BYTE,AUTO
  CODE
  ReturnValue = PARENT.ValidateRecord()
  LOOP I# = 1 TO 14
    IF BAND(PC:Permissions ,2^(I#-1))  THEN locPermissions[I#] = locPermissionString[I#] ELSE  locPermissions[I#] = '------------------'.
  .
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

