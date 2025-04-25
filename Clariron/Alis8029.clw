

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8029.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8028.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the plates file
!!! </summary>
PlatesTable PROCEDURE 

CurrentTab           STRING(80)                            !
SAV:PlateType        BYTE                                  !
locWells             SHORT                                 !
locPlateCount        BYTE                                  !
locTotalPlates       BYTE                                  !
locLabelNumber       BYTE                                  !
locLabelPosition     BYTE                                  !
locLabel             STRING(512)                           !
locPlateNumber       STRING(13)                            !
locDate              STRING(20)                            !
locPlateType         STRING(5)                             !
BRW1::View:Browse    VIEW(plates)
                       PROJECT(PLT:DATE)
                       PROJECT(PLT:FILENAME)
                       PROJECT(PLT:TYPE)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
PLT:DATE               LIKE(PLT:DATE)                 !List box control field - type derived from field
PLT:DATE_NormalFG      LONG                           !Normal forground color
PLT:DATE_NormalBG      LONG                           !Normal background color
PLT:DATE_SelectedFG    LONG                           !Selected forground color
PLT:DATE_SelectedBG    LONG                           !Selected background color
PLT:DATE_Style         LONG                           !Field style
PLT:FILENAME           LIKE(PLT:FILENAME)             !List box control field - type derived from field
PLT:FILENAME_NormalFG  LONG                           !Normal forground color
PLT:FILENAME_NormalBG  LONG                           !Normal background color
PLT:FILENAME_SelectedFG LONG                          !Selected forground color
PLT:FILENAME_SelectedBG LONG                          !Selected background color
PLT:FILENAME_Style     LONG                           !Field style
locPlateType           LIKE(locPlateType)             !List box control field - type derived from local data
locPlateType_NormalFG  LONG                           !Normal forground color
locPlateType_NormalBG  LONG                           !Normal background color
locPlateType_SelectedFG LONG                          !Selected forground color
locPlateType_SelectedBG LONG                          !Selected background color
locPlateType_Style     LONG                           !Field style
PLT:TYPE               LIKE(PLT:TYPE)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Plates'),AT(0,0,506,341),FONT('Arial',11,,FONT:regular),RESIZE,IMM,MDI,HLP('PlatesTable')
                       LIST,AT(116,20,177,276),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),VSCROLL, |
  COLOR(,COLOR:Blue,COLOR:White),FORMAT('59R(2)|M*Y~Date~C(0)@d3@62L(2)|M*Y~Drop File N' & |
  'ame~@s8@16R(2)|M*Y~Type~C@s5@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the plates file'), |
  TRN
                       SPIN(@D1),AT(320,26,93,14),USE(locDate),HVSCROLL,IMM
                       BUTTON('&Insert'),AT(420,182,70,25),USE(?Insert:4),FONT(,,,FONT:bold),LEFT,ICON('SteelAdd.ico'), |
  MSG('Insert a Record'),TIP('Insert a Record'),TRN
                       BUTTON('&Change'),AT(420,230,70,25),USE(?Change:4),FONT(,,,FONT:bold),LEFT,ICON('SteelDelta.ico'), |
  DEFAULT,MSG('Change the Record'),TIP('Change the Record'),TRN
                       IMAGE('button.jpg'),AT(420,290,70,25),USE(?Image1)
                       BUTTON('Delete'),AT(420,122,70,25),USE(?Delete),FONT(,,,FONT:bold),LEFT,ICON('SteelDelete.ico'), |
  MSG('Delete the Record'),TIP('Delete the Record'),TRN
                       BUTTON('&Close'),AT(420,290,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       BUTTON('&Help'),AT(0,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       BUTTON('Labels'),AT(420,69,70,25),USE(?ButtonLabels),FONT(,,,FONT:bold),LEFT,ICON('SteelPrinter.ico'), |
  TRN
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
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
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
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

locType STRING(1),DIM(8)
locBarcodeYpos BYTE,DIM(8)    
locNameYpos    BYTE,DIM(8) 
Plate                 FILE,DRIVER('ASCII'),NAME(gloFileName2),PRE(P)
Record                   RECORD,PRE()
Text                        STRING(512)
                         END
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
  ?Browse:1{PROPSTYLE:BackColor, 1}     = -1
  ?Browse:1{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?Browse:1{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PlatesTable')
  locDate = TODAY()
  CLOSE(Text)
  REMOVE('labels.txt')
  gloFileName = 'labels.txt'
  locType[1] = 'E'
  locType[2] = 'G'
  locType[3] = '4'
  locType[7] = 'V'
  locType[8] = 'M'
  locBarcodeYpos[1] = gloPlateBarcodeYpos
  locBarcodeYpos[2] = gloPlateBarcode2Ypos
  locBarcodeYpos[3] = gloPlateBarcode3Ypos
  locBarcodeYpos[7] = gloPlateBarcodeYpos
  locBarcodeYpos[8] = gloPlateBarcodeYpos
  locNameYpos[1] = gloPlateNameYpos
  locNameYpos[2] = gloPlateName2Ypos
  locNameYpos[3] = gloPlateName3Ypos
  locNameYpos[7] = gloPlateNameYpos
  locNameYpos[8] = gloPlateNameYpos
    
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locPlateType',locPlateType)               ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Text.Open                                ! File Text used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                              ! File plates used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:plates,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon PLT:TYPE for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,PLT:DATE_KEY) ! Add the sort order for PLT:DATE_KEY for sort order 1
  BRW1.AddRange(PLT:DATE,locDate)                 ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,PLT:TYPE,1,BRW1)      ! Initialize the browse locator using  using key: PLT:DATE_KEY , PLT:TYPE
  BRW1.AddField(PLT:DATE,BRW1.Q.PLT:DATE)         ! Field PLT:DATE is a hot field or requires assignment from browse
  BRW1.AddField(PLT:FILENAME,BRW1.Q.PLT:FILENAME) ! Field PLT:FILENAME is a hot field or requires assignment from browse
  BRW1.AddField(locPlateType,BRW1.Q.locPlateType) ! Field locPlateType is a hot field or requires assignment from browse
  BRW1.AddField(PLT:TYPE,BRW1.Q.PLT:TYPE)         ! Field PLT:TYPE is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','PlatesTable',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,18,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  gloPrinterStatus  = ModemStat(CommPort)
  Rts(CommPort,1)
  Dtr(CommPort,1)
  CommStatus = ModemStat(CommPort)
  IF BAND(CommStatus,020h)
    DTR = True
  ELSE
    DTR = False
  .
  IF BAND(CommStatus,010h)
    CTS = True
  ELSE
    CTS = False
  .
  IF DTR AND CTS
    ENABLE(?ButtonLabels)
  .

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
    Relate:Text.Close
    Relate:plates.Close
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
    Updateplates
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?ButtonLabels
      ThisWindow.Update
      locLabelPosition = 1
      locLabelNumber = 1
      locLabel = 'N<10>'
      PLT:DATE = locDate
      PLT:TYPE = 0
      SAV:PlateType = 0
      SET(PLT:DATE_KEY,PLT:DATE_KEY)
      IF ERRORCODE() THEN STOP('PLT SET: ' & ERROR()).
      LOOP
      !      THEN BREAK.
        NEXT(Plates)
        IF ERRORCODE() OR PLT:DATE <> locDate THEN BREAK.
        IF PLT:TYPE <> SAV:PlateType
          locTotalPlates = 0 
          SAV:PlateType = PLT:TYPE
        .
        locWells = 0
        gloFileName2 = 'DROP\' & CLIP(PLT:FILENAME) & '.txt'
        OPEN(Plate)
        IF ERRORCODE() THEN STOP('DRP: ' & ERROR() & ': ' & gloFileName2).
        SET(Plate,1)
        LOOP
          NEXT(Plate)
          IF ERRORCODE() THEN BREAK.
          locWells += 1
        .
        IF locWells > 194
          locPlateCount = 3
        ELSIF locWells > 97
          locPlateCount = 2  
        ELSE
          locPlateCount = 1 
        .
        locLabelPosition = 1
      !     STOP(locPlateCount & ' ' & locWells & ' ' & gloFileName2)        
        LOOP locPlateCount TIMES
          locTotalPlates += 1
      !   stop(locLabelPosition & locLabel)
          locPlateNumber = '2' & SUB(PLT:FILENAME,1,5) & '-' & locTotalPlates & CLIP(locType[PLT:Type])
          locLabel = CLIP(locLabel) & 'B' & gloPlateBarcodeXpos & ',' & locBarcodeYpos[locLabelPosition]  & ',' & gloPlateBarcodeRotation & ',3,' & gloPlateBarcodeWidth & ',' & gloPlateBarcodeWidth * 2 & ',' & gloPlateBarcodeHeight  & ',N,"' & CLIP(locPlateNumber) & '"<10>A' & gloPlateNameXpos & ',' & locNameYpos[locLabelPosition] & ',' & gloPlateNameRotation & ',' & gloPlateNameFont & ',1,1,N,"' & CLIP(locPlateNumber) & '"<10>'
          locLabelPosition += 1
          locLabelNumber += 1
        .
        
        TXT:Text = CLIP(locLabel) & 'P1<10>'
      
        IF DTR AND CTS 
          InitStr = CLIP(TXT:Text)
          ComPuts(CommPort,InitStr)
        .
        ADD(Text)
        locLabel = 'N<10>'
        CLOSE(Plate)
      .
      CLOSE(Text)
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
  IF BRW1::AutoSizeColumn.TakeEvents()
     RETURN Level:Notify
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeNewSelection PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all NewSelection events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeNewSelection()
    CASE FIELD()
    OF ?locDate
      BRW1.ResetFromfile
    END
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
    OF EVENT:GainFocus
      locBarcodeYpos[1] = gloPlateBarcodeYpos
      locBarcodeYpos[2] = gloPlateBarcode2Ypos
      locBarcodeYpos[3] = gloPlateBarcode3Ypos
      locBarcodeYpos[7] = gloPlateBarcodeYpos
      locBarcodeYpos[8] = gloPlateBarcodeYpos
      locNameYpos[1] = gloPlateNameYpos
      locNameYpos[2] = gloPlateName2Ypos
      locNameYpos[3] = gloPlateName3Ypos
      locNameYpos[7] = gloPlateNameYpos
      locNameYpos[8] = gloPlateNameYpos
    OF EVENT:OpenWindow
      POST(Event:ScrollBottom,?Browse:1)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:4
    SELF.ChangeControl=?Change:4
    SELF.DeleteControl=?Delete
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (PLT:TYPE = 1)
    SELF.Q.PLT:DATE_NormalFG = 16777215                    ! Set conditional color values for PLT:DATE
    SELF.Q.PLT:DATE_NormalBG = 255
    SELF.Q.PLT:DATE_SelectedFG = 255
    SELF.Q.PLT:DATE_SelectedBG = 16777215
    SELF.Q.PLT:FILENAME_NormalFG = 16777215                ! Set conditional color values for PLT:FILENAME
    SELF.Q.PLT:FILENAME_NormalBG = 255
    SELF.Q.PLT:FILENAME_SelectedFG = 255
    SELF.Q.PLT:FILENAME_SelectedBG = 16777215
    SELF.Q.locPlateType_NormalFG = 16777215                ! Set conditional color values for locPlateType
    SELF.Q.locPlateType_NormalBG = 255
    SELF.Q.locPlateType_SelectedFG = 255
    SELF.Q.locPlateType_SelectedBG = 16777215
  ELSIF (PLT:Type = 2)
    SELF.Q.PLT:DATE_NormalFG = 16777215                    ! Set conditional color values for PLT:DATE
    SELF.Q.PLT:DATE_NormalBG = 16711680
    SELF.Q.PLT:DATE_SelectedFG = 16711680
    SELF.Q.PLT:DATE_SelectedBG = 16777215
    SELF.Q.PLT:FILENAME_NormalFG = 16777215                ! Set conditional color values for PLT:FILENAME
    SELF.Q.PLT:FILENAME_NormalBG = 16711680
    SELF.Q.PLT:FILENAME_SelectedFG = 16711680
    SELF.Q.PLT:FILENAME_SelectedBG = 16777215
    SELF.Q.locPlateType_NormalFG = 16777215                ! Set conditional color values for locPlateType
    SELF.Q.locPlateType_NormalBG = 16711680
    SELF.Q.locPlateType_SelectedFG = 16711680
    SELF.Q.locPlateType_SelectedBG = 16777215
  ELSIF (PLT:Type = 3)
    SELF.Q.PLT:DATE_NormalFG = 0                           ! Set conditional color values for PLT:DATE
    SELF.Q.PLT:DATE_NormalBG = 65535
    SELF.Q.PLT:DATE_SelectedFG = 65535
    SELF.Q.PLT:DATE_SelectedBG = 0
    SELF.Q.PLT:FILENAME_NormalFG = 0                       ! Set conditional color values for PLT:FILENAME
    SELF.Q.PLT:FILENAME_NormalBG = 65535
    SELF.Q.PLT:FILENAME_SelectedFG = 65535
    SELF.Q.PLT:FILENAME_SelectedBG = 0
    SELF.Q.locPlateType_NormalFG = 0                       ! Set conditional color values for locPlateType
    SELF.Q.locPlateType_NormalBG = 65535
    SELF.Q.locPlateType_SelectedFG = 65535
    SELF.Q.locPlateType_SelectedBG = 0
  ELSE
    SELF.Q.PLT:DATE_NormalFG = -1                          ! Set color values for PLT:DATE
    SELF.Q.PLT:DATE_NormalBG = -1
    SELF.Q.PLT:DATE_SelectedFG = -1
    SELF.Q.PLT:DATE_SelectedBG = -1
    SELF.Q.PLT:FILENAME_NormalFG = -1                      ! Set color values for PLT:FILENAME
    SELF.Q.PLT:FILENAME_NormalBG = -1
    SELF.Q.PLT:FILENAME_SelectedFG = -1
    SELF.Q.PLT:FILENAME_SelectedBG = -1
    SELF.Q.locPlateType_NormalFG = -1                      ! Set color values for locPlateType
    SELF.Q.locPlateType_NormalBG = -1
    SELF.Q.locPlateType_SelectedFG = -1
    SELF.Q.locPlateType_SelectedBG = -1
  END
  SELF.Q.PLT:DATE_Style = 1 ! 
  SELF.Q.PLT:FILENAME_Style = 1 ! 
  SELF.Q.locPlateType_Style = 1 ! 


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
  IF INRANGE(PLT:TYPE,1,8)
    locPlateType = gloTypeDescription[PLT:TYPE]
  ELSE
    locPlateType = gloTypeDescription[TYPE:Error]
  .
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

