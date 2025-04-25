

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8067.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Report
!!! Report the PickUp File
!!! </summary>
PrintPickup PROCEDURE 

Progress:Thermometer BYTE                                  !
locFilterReceived    BYTE(0)                               !
Process:View         VIEW(PickUp)
                       PROJECT(PU:Client)
                       PROJECT(PU:ContactName)
                       PROJECT(PU:Date)
                       PROJECT(PU:Inititals)
                       PROJECT(PU:Note)
                       PROJECT(PU:Received)
                       JOIN(CLI:ORDER_KEY,PU:Client)
                         PROJECT(CLI:LAST)
                       END
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report PickUp'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('PickUp Report'),AT(0,1200,8500,9646),PRE(RPT),PAPER(PAPER:LETTER),FONT('Arial',12, |
  COLOR:Black,FONT:regular),THOUS
                       HEADER,AT(0,500,8500,677),USE(?HEADER1)
                         STRING('Pickups Not Received'),AT(10,10,8688,417),USE(?String7),FONT(,14,,FONT:bold),CENTER, |
  TRN
                         LINE,AT(0,687,8500,0),USE(?Line4),COLOR(COLOR:Black),LINEWIDTH(5)
                         STRING('Date {10}Init.    Client'),AT(385,490,7896,229),USE(?String8),TRN
                       END
Detail                 DETAIL,AT(0,0,8500,260),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         STRING(@s3),AT(1177,10),USE(PU:Inititals)
                         LINE,AT(8500,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         STRING(@d17),AT(271,10),USE(PU:Date)
                         STRING(@s25),AT(2188,10,2260,229),USE(CLI:LAST)
                         STRING(@s20),AT(4469,10),USE(PU:ContactName)
                         STRING(@s20),AT(6375,10),USE(PU:Note)
                         STRING(@p### ###p),AT(1448,10),USE(PU:Client,,?PU:Client:2),RIGHT(1)
                         LINE,AT(0,250,8500,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepRealClass                         ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer
TargetSelector       ReportTargetSelectorClass             ! Report Target Selector
TXTReporter          CLASS(TextReportGenerator)            ! TXT
Setup                  PROCEDURE(),DERIVED
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

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('PrintPickup')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('PrintPickup',ProgressWindow)               ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:PickUp, ?Progress:PctText, Progress:Thermometer, ProgressMgr, PU:Date)
  ThisReport.AddSortOrder(PU:DateKey)
  ThisReport.AddRange(PU:Received,locFilterReceived)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:PickUp.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
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
  IF SELF.Opened
    INIMgr.Update('PrintPickup',ProgressWindow)            ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report{PROPPRINT:Extend}=True
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
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetPageLen(0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

