

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8062.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Form Normals
!!! </summary>
Normals PROCEDURE 

CurrentTab           STRING(80)                            !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::NOR:Record  LIKE(NOR:RECORD),THREAD
QuickWindow          WINDOW('Normals Ranges'),AT(,,231,254),FONT('Arial',8,COLOR:Black,FONT:regular),RESIZE,CENTER, |
  GRAY,IMM,HLP('Normals'),SYSTEM
                       SHEET,AT(4,10,220,180),USE(?CurrentTab),SPREAD
                         TAB('E'),USE(?Tab:1)
                           PROMPT('Off Scale High'),AT(26,26),USE(?NOR:OffScaleHiE:Prompt),TRN
                           ENTRY(@s20),AT(76,26,84,10),USE(NOR:OffScaleHiE)
                           PROMPT('Off Scale Low '),AT(23,42),USE(?NOR:OffScaleLowE:Prompt),TRN
                           ENTRY(@s20),AT(76,41,84,10),USE(NOR:OffScaleLowE)
                           PROMPT('E 0:'),AT(54,58),USE(?NOR:E0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:E0)
                           PROMPT('EE:'),AT(54,73),USE(?NOR:EE:Prompt),TRN
                           ENTRY(@s20),AT(76,70,84,10),USE(NOR:EE)
                           PROMPT('E 1:'),AT(54,86),USE(?NOR:E1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:E1)
                           PROMPT('E 2:'),AT(54,101),USE(?NOR:E2:Prompt),TRN
                           ENTRY(@s20),AT(76,98,84,10),USE(NOR:E2)
                           PROMPT('E 3:'),AT(54,114),USE(?NOR:E3:Prompt),TRN
                           ENTRY(@s20),AT(76,113,84,10),USE(NOR:E3)
                           PROMPT('E 4:'),AT(54,129),USE(?NOR:E4:Prompt),TRN
                           ENTRY(@s20),AT(76,126,84,10),USE(NOR:E4)
                           PROMPT('E 5:'),AT(54,142),USE(?NOR:E5:Prompt),TRN
                           ENTRY(@s20),AT(76,141,84,10),USE(NOR:E5)
                           PROMPT('D 6:'),AT(54,157),USE(?NOR:D6:Prompt),TRN
                           ENTRY(@s20),AT(76,154,84,10),USE(NOR:E6)
                           BUTTON('Export IgE'),AT(75,171,85),USE(?BUTTON_ExportE)
                         END
                         TAB('G'),USE(?Tab:2)
                           PROMPT('Off Scale High'),AT(25,30),USE(?NOR:OffScaleHiG:Prompt),TRN
                           ENTRY(@s20),AT(76,30,84,10),USE(NOR:OffScaleHiG)
                           PROMPT('Off Scale Low'),AT(23,42),USE(?NOR:OffScaleLosG:Prompt),TRN
                           ENTRY(@s20),AT(76,46,84,10),USE(NOR:OffScaleLowG)
                           PROMPT('G 0:'),AT(54,62),USE(?NOR:G0:Prompt),TRN
                           ENTRY(@s20),AT(76,62,84,10),USE(NOR:G0)
                           PROMPT('GE:'),AT(56,78),USE(?NOR:GE:Prompt),TRN
                           ENTRY(@s20),AT(76,78,84,10),USE(NOR:GE)
                           PROMPT('G 1:'),AT(54,90),USE(?NOR:G1:Prompt),TRN
                           ENTRY(@s20),AT(76,90,84,10),USE(NOR:G1)
                           PROMPT('G 2:'),AT(54,106),USE(?NOR:G2:Prompt),TRN
                           ENTRY(@s20),AT(76,106,84,10),USE(NOR:G2)
                           PROMPT('G 3:'),AT(54,118),USE(?NOR:G3:Prompt),TRN
                           ENTRY(@s20),AT(76,118,84,10),USE(NOR:G3)
                           PROMPT('G 4:'),AT(54,134),USE(?NOR:G4:Prompt),TRN
                           ENTRY(@s20),AT(76,134,84,10),USE(NOR:G4)
                           PROMPT('G 5:'),AT(54,146),USE(?NOR:G5:Prompt),TRN
                           ENTRY(@s20),AT(76,146,84,10),USE(NOR:G5)
                           PROMPT('G 6:'),AT(54,162),USE(?NOR:G6:Prompt),TRN
                           ENTRY(@s20),AT(76,162,84,10),USE(NOR:G6)
                           BUTTON('Export IgG'),AT(74,177,85,14),USE(?BUTTON_ExportIgG)
                         END
                         TAB('G4'),USE(?Tab:3)
                           PROMPT('Off Scale High'),AT(21,34),USE(?NOR:OffScaleHiG4:Prompt),TRN
                           ENTRY(@s20),AT(76,34,84,10),USE(NOR:OffScaleHiG4)
                           PROMPT('Off Scale Low G 4:'),AT(5,47),USE(?NOR:OffScaleLowG4:Prompt),TRN
                           ENTRY(@s20),AT(76,47,84,10),USE(NOR:OffScaleLowG4)
                           PROMPT('G 40:'),AT(51,60),USE(?NOR:G40:Prompt),TRN
                           ENTRY(@s20),AT(76,60,84,10),USE(NOR:G40)
                           PROMPT('G 4 E:'),AT(49,73),USE(?NOR:G4E:Prompt),TRN
                           ENTRY(@s20),AT(76,73,84,10),USE(NOR:G4E)
                           PROMPT('G 41:'),AT(51,86),USE(?NOR:G41:Prompt),TRN
                           ENTRY(@s20),AT(76,86,84,10),USE(NOR:G41)
                           PROMPT('G 42:'),AT(51,99),USE(?NOR:G42:Prompt),TRN
                           ENTRY(@s20),AT(76,99,84,10),USE(NOR:G42)
                           PROMPT('G 43:'),AT(51,112),USE(?NOR:G43:Prompt),TRN
                           ENTRY(@s20),AT(76,112,84,10),USE(NOR:G43)
                           PROMPT('G 44:'),AT(51,125),USE(?NOR:G44:Prompt),TRN
                           ENTRY(@s20),AT(76,125,84,10),USE(NOR:G44)
                           PROMPT('G 45:'),AT(51,138),USE(?NOR:G45:Prompt),TRN
                           ENTRY(@s20),AT(76,138,84,10),USE(NOR:G45)
                           PROMPT('G 46:'),AT(51,151),USE(?NOR:G46:Prompt),TRN
                           ENTRY(@s20),AT(76,151,84,10),USE(NOR:G46)
                           BUTTON('Export IgG4'),AT(76,171,85,14),USE(?BUTTON_ExportIgG4)
                         END
                         TAB('SG4'),USE(?Tab4)
                           PROMPT('Off Scale High SG4'),AT(21,34),USE(?NOR:OffScaleHiSG4:Prompt),TRN
                           ENTRY(@s20),AT(76,34,84,10),USE(NOR:OffScaleHiSG4)
                           PROMPT('Off Scale Low SG4:'),AT(5,47),USE(?NOR:OffScaleLowSG4:Prompt),TRN
                           ENTRY(@s20),AT(76,47,84,10),USE(NOR:OffScaleLowSG4)
                           PROMPT('SG40:'),AT(51,60),USE(?NOR:SG40:Prompt),TRN
                           ENTRY(@s20),AT(76,60,84,10),USE(NOR:SG40)
                           PROMPT('SG41:'),AT(51,86),USE(?NOR:SG41:Prompt),TRN
                           ENTRY(@s20),AT(76,86,84,10),USE(NOR:SG41)
                           PROMPT('SG42:'),AT(51,99),USE(?NOR:SG42:Prompt),TRN
                           ENTRY(@s20),AT(76,99,84,10),USE(NOR:SG42)
                           PROMPT('SG43:'),AT(51,112),USE(?NOR:SG43:Prompt),TRN
                           ENTRY(@s20),AT(76,112,84,10),USE(NOR:SG43)
                           PROMPT('SG44:'),AT(51,125),USE(?NOR:SG44:Prompt),TRN
                           ENTRY(@s20),AT(76,125,84,10),USE(NOR:SG44)
                           PROMPT('SG45:'),AT(51,138),USE(?NOR:SG45:Prompt),TRN
                           ENTRY(@s20),AT(76,138,84,10),USE(NOR:SG45)
                         END
                         TAB('SE'),USE(?Tab5)
                           PROMPT('Off Scale High'),AT(26,26),USE(?NOR:OffScaleHiSE:Prompt),TRN
                           ENTRY(@s20),AT(76,26,84,10),USE(NOR:OffScaleHiSE)
                           PROMPT('Off Scale Low '),AT(23,42),USE(?NOR:OffScaleLowSE:Prompt),TRN
                           ENTRY(@s20),AT(76,41,84,10),USE(NOR:OffScaleLowSE)
                           PROMPT('SE0:'),AT(54,58),USE(?NOR:SE0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:SE0)
                           PROMPT('SE:'),AT(54,73),USE(?NOR:SEE:Prompt),TRN
                           ENTRY(@s20),AT(76,70,84,10),USE(NOR:SEE)
                           PROMPT('SE1:'),AT(54,86),USE(?NOR:SE1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:SE1)
                           PROMPT('SE2:'),AT(54,101),USE(?NOR:SE2:Prompt),TRN
                           ENTRY(@s20),AT(76,98,84,10),USE(NOR:SE2)
                           PROMPT('SE3:'),AT(54,114),USE(?NOR:SE3:Prompt),TRN
                           ENTRY(@s20),AT(76,113,84,10),USE(NOR:SE3)
                           PROMPT('SE4:'),AT(54,129),USE(?NOR:SE4:Prompt),TRN
                           ENTRY(@s20),AT(76,126,84,10),USE(NOR:SE4)
                           PROMPT('SE5:'),AT(54,142),USE(?NOR:SE5:Prompt),TRN
                           ENTRY(@s20),AT(76,141,84,10),USE(NOR:SE5)
                           ENTRY(@s20),AT(76,158,83,9),USE(NOR:SE6)
                           STRING('SE6'),AT(54,157),USE(?STRING1),TRN
                         END
                         TAB('SC'),USE(?Tab6)
                           STRING('Candida'),AT(76,32,76,13),USE(?StringC),FONT(,12,,FONT:bold),TRN
                           PROMPT('SE0:'),AT(54,58),USE(?NOR:SC0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:SC0)
                           PROMPT('SE1:'),AT(54,86),USE(?NOR:SC1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:SC1)
                         END
                         TAB('SG'),USE(?Tab7)
                           STRING('Gliadin'),AT(76,32,76,13),USE(?StringG),FONT(,12,,FONT:bold),TRN
                           PROMPT('SG0:'),AT(54,58),USE(?NOR:SG0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:SG0)
                           PROMPT('SGE:'),AT(54,73),USE(?NOR:SGE:Prompt),TRN
                           ENTRY(@s20),AT(76,70,84,10),USE(NOR:SGE)
                           PROMPT('SG1:'),AT(54,86),USE(?NOR:SG1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:SG1)
                         END
                         TAB('ST'),USE(?Tab8)
                           STRING('Transglutaminase'),AT(76,32,105,13),USE(?StringT),FONT(,12,,FONT:bold),TRN
                           PROMPT('SG0:'),AT(54,58),USE(?NOR:ST0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:ST0)
                           PROMPT('SGE:'),AT(54,73),USE(?NOR:STE:Prompt),TRN
                           ENTRY(@s20),AT(76,70,84,10),USE(NOR:STE)
                           PROMPT('SG1:'),AT(54,86),USE(?NOR:ST1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:ST1)
                         END
                         TAB('SR'),USE(?Tab9)
                           STRING('Reticulin'),AT(76,32,76,13),USE(?StringR),FONT(,12,,FONT:bold),TRN
                           PROMPT('SG0:'),AT(54,58),USE(?NOR:SR0:Prompt),TRN
                           ENTRY(@s20),AT(76,56,84,10),USE(NOR:SR0)
                           PROMPT('SGE:'),AT(54,73),USE(?NOR:SRE:Prompt),TRN
                           ENTRY(@s20),AT(76,70,84,10),USE(NOR:SRE)
                           PROMPT('SG1:'),AT(54,86),USE(?NOR:SR1:Prompt),TRN
                           ENTRY(@s20),AT(76,85,84,10),USE(NOR:SR1)
                         END
                       END
                       PROMPT('Cut Off Date:'),AT(38,197),USE(?NOR:CutOffDate:Prompt),TRN
                       ENTRY(@d17),AT(89,197,84,10),USE(NOR:CutOffDate)
                       BUTTON('Done'),AT(132,218,93,29),USE(?OK),LEFT,ICON('SteelCheck.ico'),DEFAULT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window'),TRN
                       BUTTON('&Cancel'),AT(4,218,93,29),USE(?Cancel),LEFT,ICON('SteelCancel.ico'),MSG('Cancel operation'), |
  TIP('Cancel operation'),TRN
                       IMAGE('Button.jpg'),AT(132,218,93,29),USE(?Image2)
                       IMAGE('Button.jpg'),AT(4,218),USE(?Image1)
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
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END
Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Text    STRING(96)
        . .       

locE0        STRING(20)
locE1        STRING(20)
locE2        STRING(20)
locE3        STRING(20)
locE4        STRING(20)
locE5        STRING(20)
locE6        STRING(20)
locE7        STRING(20)
locE8        STRING(20)
locE9        STRING(20)
locG40        STRING(20)
locG41        STRING(20)
locG42        STRING(20)
locG43        STRING(20)
locG44        STRING(20)
locG45        STRING(20)
locG46        STRING(20)
locG47        STRING(20)
locG48        STRING(20)
locG49        STRING(20)
locG0        STRING(20)
locG1        STRING(20)
locG2        STRING(20)
locG3        STRING(20)
locG4        STRING(20)
locG5        STRING(20)
locG6        STRING(20)
locG7        STRING(20)
locG8        STRING(20)
locG9        STRING(20)

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


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Normals')
  globalRequest = ChangeRecord
  gloFileName2 = 'C:\Apps\Normals.html'
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?NOR:OffScaleHiE:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NOR:Record,History::NOR:Record)
  SELF.AddHistoryField(?NOR:OffScaleHiE,10)
  SELF.AddHistoryField(?NOR:OffScaleLowE,11)
  SELF.AddHistoryField(?NOR:E0,2)
  SELF.AddHistoryField(?NOR:EE,3)
  SELF.AddHistoryField(?NOR:E1,4)
  SELF.AddHistoryField(?NOR:E2,5)
  SELF.AddHistoryField(?NOR:E3,6)
  SELF.AddHistoryField(?NOR:E4,7)
  SELF.AddHistoryField(?NOR:E5,8)
  SELF.AddHistoryField(?NOR:E6,9)
  SELF.AddHistoryField(?NOR:OffScaleHiG,20)
  SELF.AddHistoryField(?NOR:OffScaleLowG,21)
  SELF.AddHistoryField(?NOR:G0,12)
  SELF.AddHistoryField(?NOR:GE,13)
  SELF.AddHistoryField(?NOR:G1,14)
  SELF.AddHistoryField(?NOR:G2,15)
  SELF.AddHistoryField(?NOR:G3,16)
  SELF.AddHistoryField(?NOR:G4,17)
  SELF.AddHistoryField(?NOR:G5,18)
  SELF.AddHistoryField(?NOR:G6,19)
  SELF.AddHistoryField(?NOR:OffScaleHiG4,30)
  SELF.AddHistoryField(?NOR:OffScaleLowG4,31)
  SELF.AddHistoryField(?NOR:G40,22)
  SELF.AddHistoryField(?NOR:G4E,23)
  SELF.AddHistoryField(?NOR:G41,24)
  SELF.AddHistoryField(?NOR:G42,25)
  SELF.AddHistoryField(?NOR:G43,26)
  SELF.AddHistoryField(?NOR:G44,27)
  SELF.AddHistoryField(?NOR:G45,28)
  SELF.AddHistoryField(?NOR:G46,29)
  SELF.AddHistoryField(?NOR:OffScaleHiSG4,38)
  SELF.AddHistoryField(?NOR:OffScaleLowSG4,39)
  SELF.AddHistoryField(?NOR:SG40,32)
  SELF.AddHistoryField(?NOR:SG41,33)
  SELF.AddHistoryField(?NOR:SG42,34)
  SELF.AddHistoryField(?NOR:SG43,35)
  SELF.AddHistoryField(?NOR:SG44,36)
  SELF.AddHistoryField(?NOR:SG45,37)
  SELF.AddHistoryField(?NOR:OffScaleHiSE,48)
  SELF.AddHistoryField(?NOR:OffScaleLowSE,49)
  SELF.AddHistoryField(?NOR:SE0,40)
  SELF.AddHistoryField(?NOR:SEE,41)
  SELF.AddHistoryField(?NOR:SE1,42)
  SELF.AddHistoryField(?NOR:SE2,43)
  SELF.AddHistoryField(?NOR:SE3,44)
  SELF.AddHistoryField(?NOR:SE4,45)
  SELF.AddHistoryField(?NOR:SE5,46)
  SELF.AddHistoryField(?NOR:SE6,47)
  SELF.AddHistoryField(?NOR:SC0,50)
  SELF.AddHistoryField(?NOR:SC1,52)
  SELF.AddHistoryField(?NOR:SG0,53)
  SELF.AddHistoryField(?NOR:SGE,54)
  SELF.AddHistoryField(?NOR:SG1,55)
  SELF.AddHistoryField(?NOR:ST0,56)
  SELF.AddHistoryField(?NOR:STE,57)
  SELF.AddHistoryField(?NOR:ST1,58)
  SELF.AddHistoryField(?NOR:SR0,59)
  SELF.AddHistoryField(?NOR:SRE,60)
  SELF.AddHistoryField(?NOR:SR1,61)
  SELF.AddHistoryField(?NOR:CutOffDate,1)
  SELF.AddUpdateFile(Access:Normals)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Normals.Open                                      ! File Normals used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Normals
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
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?NOR:OffScaleHiE{PROP:ReadOnly} = True
    ?NOR:OffScaleLowE{PROP:ReadOnly} = True
    ?NOR:E0{PROP:ReadOnly} = True
    ?NOR:EE{PROP:ReadOnly} = True
    ?NOR:E1{PROP:ReadOnly} = True
    ?NOR:E2{PROP:ReadOnly} = True
    ?NOR:E3{PROP:ReadOnly} = True
    ?NOR:E4{PROP:ReadOnly} = True
    ?NOR:E5{PROP:ReadOnly} = True
    ?NOR:E6{PROP:ReadOnly} = True
    DISABLE(?BUTTON_ExportE)
    ?NOR:OffScaleHiG{PROP:ReadOnly} = True
    ?NOR:OffScaleLowG{PROP:ReadOnly} = True
    ?NOR:G0{PROP:ReadOnly} = True
    ?NOR:GE{PROP:ReadOnly} = True
    ?NOR:G1{PROP:ReadOnly} = True
    ?NOR:G2{PROP:ReadOnly} = True
    ?NOR:G3{PROP:ReadOnly} = True
    ?NOR:G4{PROP:ReadOnly} = True
    ?NOR:G5{PROP:ReadOnly} = True
    ?NOR:G6{PROP:ReadOnly} = True
    DISABLE(?BUTTON_ExportIgG)
    ?NOR:OffScaleHiG4{PROP:ReadOnly} = True
    ?NOR:OffScaleLowG4{PROP:ReadOnly} = True
    ?NOR:G40{PROP:ReadOnly} = True
    ?NOR:G4E{PROP:ReadOnly} = True
    ?NOR:G41{PROP:ReadOnly} = True
    ?NOR:G42{PROP:ReadOnly} = True
    ?NOR:G43{PROP:ReadOnly} = True
    ?NOR:G44{PROP:ReadOnly} = True
    ?NOR:G45{PROP:ReadOnly} = True
    ?NOR:G46{PROP:ReadOnly} = True
    DISABLE(?BUTTON_ExportIgG4)
    ?NOR:OffScaleHiSG4{PROP:ReadOnly} = True
    ?NOR:OffScaleLowSG4{PROP:ReadOnly} = True
    ?NOR:SG40{PROP:ReadOnly} = True
    ?NOR:SG41{PROP:ReadOnly} = True
    ?NOR:SG42{PROP:ReadOnly} = True
    ?NOR:SG43{PROP:ReadOnly} = True
    ?NOR:SG44{PROP:ReadOnly} = True
    ?NOR:SG45{PROP:ReadOnly} = True
    ?NOR:OffScaleHiSE{PROP:ReadOnly} = True
    ?NOR:OffScaleLowSE{PROP:ReadOnly} = True
    ?NOR:SE0{PROP:ReadOnly} = True
    ?NOR:SEE{PROP:ReadOnly} = True
    ?NOR:SE1{PROP:ReadOnly} = True
    ?NOR:SE2{PROP:ReadOnly} = True
    ?NOR:SE3{PROP:ReadOnly} = True
    ?NOR:SE4{PROP:ReadOnly} = True
    ?NOR:SE5{PROP:ReadOnly} = True
    ?NOR:SE6{PROP:ReadOnly} = True
    ?NOR:SC0{PROP:ReadOnly} = True
    ?NOR:SC1{PROP:ReadOnly} = True
    ?NOR:SG0{PROP:ReadOnly} = True
    ?NOR:SGE{PROP:ReadOnly} = True
    ?NOR:SG1{PROP:ReadOnly} = True
    ?NOR:ST0{PROP:ReadOnly} = True
    ?NOR:STE{PROP:ReadOnly} = True
    ?NOR:ST1{PROP:ReadOnly} = True
    ?NOR:SR0{PROP:ReadOnly} = True
    ?NOR:SRE{PROP:ReadOnly} = True
    ?NOR:SR1{PROP:ReadOnly} = True
    ?NOR:CutOffDate{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('Normals',QuickWindow)                      ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  SET(Normals,1)
  SET(Normals)
  NEXT(Normals)
  EnhancedFocusManager.Init(1,11206570,1,0,8421631,1,11206570,8421376,2,11206570,8421376,1,8421376,'�',8)
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
    Relate:Normals.Close
  END
  IF SELF.Opened
    INIMgr.Update('Normals',QuickWindow)                   ! Save window data to non-volatile store
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
    CASE ACCEPTED()
    OF ?BUTTON_ExportIgG
      CREATE(Post)
      OPEN(Post)
      PST:Text = CLIP(NOR:G0)
      	  ADD(Post)
      PST:Text = CLIP(NOR:GE)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G1)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G2)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G3)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G4)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G5)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G6)
      	  ADD(Post)
      PST:Text = CLIP(NOR:OffScaleHiG)
      	  ADD(Post)
      PST:Text = CLIP(NOR:OffScaleLowG)
      	  ADD(Post)  
      CLOSE(Post)
      RUN('CMD /c ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName2) & 'amx@amxemr.com:/home/amx/public_html/cpl & EXIT',0)   
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/normals.php?type=2' )
      
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?BUTTON_ExportE
      ThisWindow.Update
      CREATE(Post)
      OPEN(Post)
      locE0 = NOR:E0
      locE1 = NOR:EE
      locE2 = NOR:E1
      locE3 = NOR:E2
      locE4 = NOR:E3
      locE5 = NOR:E4
      locE6 = NOR:E5
      locE7 = NOR:E6
      locE8 = NOR:OffScaleHiE
      locE9 = NOR:OffScaleLowE
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE0) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE1) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE2) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE3) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE4) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE5) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE6) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE7) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE8) & '" /> '
      ADD(Post)
      PST:Text = '<INPUT TYPE="HIDDEN" NAME="E[]" VALUE="' & CLIP(locE9) & '" /> '
      ADD(Post)
      CLOSE(Post)
      RUN('CMD /c ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName2) & 'amx@amxemr.com:/home/amx/public_html/cpl & EXIT',0)   
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/normals.php?type=1' )
    OF ?BUTTON_ExportIgG4
      ThisWindow.Update
      CREATE(Post)
      OPEN(Post)
      PST:Text = CLIP(NOR:G40)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G4E)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G41)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G42)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G43)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G44)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G45)
      	  ADD(Post)
      PST:Text = CLIP(NOR:G46)
      	  ADD(Post)
      PST:Text = CLIP(NOR:OffScaleHiG4)
      	  ADD(Post)
      PST:Text = CLIP(NOR:OffScaleLowG4)
      	  ADD(Post)  
      CLOSE(Post)
      RUN('CMD /c ECHO ON & pscp -v -p -pw xD1GkuK7a7DK8! ' & CLIP(gloFileName2) & 'amx@amxemr.com:/home/amx/public_html/cpl & EXIT',0)   
      URLHandler(QuickWindow{prop:handle},'https://dev.amxemr.com/cpl/normals.php?type=3' )
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

