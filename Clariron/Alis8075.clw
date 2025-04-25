

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8075.INC'),ONCE        !Local module procedure declarations
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
!!! Generated from procedure template - Source
!!! </summary>
Patients1            PROCEDURE                             ! Declare Procedure

  CODE
!!! <summary>
!!! Procedure not yet defined
!!! </summary>
AddBillingItems1 PROCEDURE !Procedure not yet defined
  CODE
  GlobalErrors.ThrowMessage(Msg:ProcedureToDo,'AddBillingItems1') ! This procedure acts as a place holder for a procedure yet to be defined
  SETKEYCODE(0)
  GlobalResponse = RequestCancelled                        ! Request cancelled is the implied action
!!! <summary>
!!! Generated from procedure template - Report
!!! Report the Test File
!!! </summary>
cwRpt PROCEDURE 

Progress:Thermometer BYTE                                  !
Process:View         VIEW(Test)
                       PROJECT(TST:CODE)
                       PROJECT(TST:INVOICE)
                       PROJECT(TST:TYPE)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report Test'),AT(,,142,59),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,CENTER,GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Results'),AT(250,3604,8000,6900),PRE(RPT),FONT('Arial',10),THOUS
                       HEADER,AT(250,250,8292,3062),USE(?HEADER1)
                         IMAGE('am.jpg'),AT(104,229,1969,927),USE(?Image1)
                         STRING('400 Sugartree Lane'),AT(2312,198,1667,156),USE(?S41),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Suite 510'),AT(2312,354,802,156),USE(?S42),FONT('Arial',8,,FONT:regular),TRN
                         STRING('Franklin, TN 37064'),AT(2312,510,1823,156),USE(?S43),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Phone: 615-599-4100'),AT(2312,667,1458,156),USE(?S44),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Fax:     615-599-4648'),AT(2312,823,1563,156),USE(?S45),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING(@s40),AT(490,1688,3021,208),USE(gloAddress2),TRN
                         STRING(@s1),AT(6437,354,167,167),USE(Pat:SEX)
                         STRING('Client Number'),AT(6271,1927),USE(?S34),FONT('Arial',8,,FONT:underline),TRN
                         STRING('Collection Date'),AT(3844,823,1312),USE(?S35),FONT('Arial',8,,FONT:underline),RIGHT, |
  TRN
                         STRING('Received Date'),AT(3844,1000,1312),USE(?S36),FONT('Arial',8,,FONT:regular+FONT:underline), |
  RIGHT,TRN
                         STRING('Printed Date Time'),AT(3844,1187,1312),USE(?S37),FONT('Arial',8,,FONT:regular),RIGHT, |
  TRN
                         STRING('Patient Name (Last, First)'),AT(3844,-10,1313,188),USE(?S29),FONT('Arial',8,,FONT:underline), |
  TRN
                         STRING('Date of Birth'),AT(5635,2167,656,188),USE(?S20),FONT('Arial',8,,FONT:underline),TRN
                         STRING(''),AT(5469,2135),USE(?S133),FONT('Arial',8,,FONT:underline,CHARSET:ANSI),TRN
                         STRING('DoB Age Gender'),AT(3844,354,1312,188),USE(?S32),FONT('Arial',8,,FONT:underline),RIGHT, |
  TRN
                         STRING('Lab ID'),AT(3844,510,1312,188),USE(?S30),FONT('Arial',8,,FONT:underline),RIGHT,TRN
                         STRING(@s40),AT(5219,-10,2812,167),USE(gloPatName)
                         STRING(@d2b),AT(5219,354,677,167),USE(Pat:DOB),TRN
                         STRING(@s15),AT(5219,177,1156,156),USE(Pat:CLIENT_ID)
                         STRING(@S10),AT(5219,844,833,156),USE(gloPATCollection)
                         STRING(@n3),AT(6073,354,302,167),USE(Pat:AGE)
                         STRING(@n_6),AT(5219,510,552,156),USE(Pat:INVOICE),RIGHT(1)
                         STRING(@s1),AT(7177,2302,156,167),USE(Pat:AGE_TYPE)
                         STRING(@D2),AT(5219,1187,740,146),USE(gloDate),RIGHT(1)
                         STRING('Client Identifier'),AT(4417,156),USE(?S93),FONT('Arial',8,,FONT:underline),TRN
                         STRING(@s40),AT(490,1271,3021,208),USE(gloClientName),TRN
                         STRING(@s40),AT(490,1479,3021,208),USE(gloAddress1),TRN
                         STRING(@d2),AT(5219,1000,740,156),USE(Pat:DATE),RIGHT(1)
                         STRING(@N_6),AT(7031,1906,573,156),USE(Pat:CLIENT),RIGHT,TRN
                         STRING(@T3),AT(6010,1187,594,156),USE(gloTime),RIGHT(1)
                         STRING('the FDA. The laboratory is regulated under CLIA as qualified to perform highcom' & |
  'plexity testing. This test is used for clinical purposes. '),AT(31,2500),USE(?STRING1)
                         STRING('This test was developed and its performance characteristics determined by Aller' & |
  'metrix. It has not been cleared nor approved by '),AT(31,2302),USE(?STRING2)
                         STRING('It should not be regarded as investigational or for research.'),AT(31,2698,4219),USE(?STRING3)
                       END
HeadIgG                DETAIL,AT(10,10,8292,312),USE(?HeadIgG),PAGEBEFORE(-1)
                         STRING('Specific IgG '),AT(490,10,1823,229),USE(?locHeading:3),FONT(,12,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                       END
HeadIgG4               DETAIL,AT(10,10,8292,312),USE(?HeadIgG4),PAGEBEFORE(-1)
                         STRING('Specific IgG4'),AT(490,10,1823,229),USE(?locHeading),FONT(,12,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                       END
HeadIgE                DETAIL,AT(10,10,8292,312),USE(?HeadIgE),PAGEBEFORE(-1)
                         STRING('Specific IgE '),AT(490,10,1823,229),USE(?locHeading:2),FONT(,12,COLOR:Black,FONT:bold, |
  CHARSET:ANSI),LEFT,TRN
                       END
Interp                 DETAIL,AT(10,10,8292,312),USE(?HeadIgE:2),PAGEBEFORE(-1)
                       END
CML                    DETAIL,AT(10,0,8302,250),USE(?DETAIL20)
                         STRING(@s40),AT(5219,20,3021,208),USE(?comments),FONT(,,,,CHARSET:ANSI),LEFT,TRN
                         STRING(@s40),AT(729,20,2500,208),USE(RES:Description,,?RES:Description:4),FONT(,,,,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s7),AT(4417,20,573,208),USE(RES:Conc),FONT(,10,,,CHARSET:ANSI),RIGHT,TRN
                         STRING(@s3),AT(3698,20,281,208),USE(RES:Score,,?RES:Score:4),FONT(,10,,,CHARSET:ANSI),CENTER, |
  TRN
                         LINE,AT(250,0,8094,11),USE(?LINE1)
                         LINE,AT(250,187,8094,10),USE(?LINE1:2)
                       END
G4Interp               DETAIL,AT(10,10,8302,2198),USE(?DETAIL3)
                         BOX,AT(5615,302,479,219),USE(?Box5:6),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,302,969,219),USE(?Box16:3),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,302,2698,219),USE(?Box4:8),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(729,0,2510,250),USE(?Box3:4),COLOR(COLOR:Black),FILL(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,500,969,219),USE(?BoxEinterpConc1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,500,479,219),USE(?BoxEinterpClass1:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,500,2698,219),USE(?BoxEinterpDesc1),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,698,2698,219),USE(?BoxEinterpDesc2:4),COLOR(COLOR:Black),FILL(00D2FFD2h),LINEWIDTH(1)
                         BOX,AT(5615,698,479,219),USE(?BoxEinterpClass2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,698,969,219),USE(?BoxEinterpConc2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,896,479,219),USE(?BoxEinterpClass3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,896,969,219),USE(?BoxEinterpConc3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(2823,896,2698,1219),USE(?BoxEinterpDesc4:3),COLOR(COLOR:Black),FILL(0080FFFFh),LINEWIDTH(1)
                         BOX,AT(5615,1104,479,219),USE(?BoxEinterpClass4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1104,969,219),USE(?BoxEinterpConc4),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1302,479,219),USE(?BoxEinterpClass5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1302,969,219),USE(?BoxEinterpConc5),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1500,479,219),USE(?BoxEinterpClass6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1500,969,219),USE(?BoxEinterpConc6),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1698,479,219),USE(?BoxEinterpClass7:3),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1698,969,219),USE(?BoxEinterpConc7:2),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(5615,1896,479,219),USE(?BoxEinterpClass8),COLOR(COLOR:Black),LINEWIDTH(1)
                         BOX,AT(6156,1896,969,219),USE(?BoxEinterpConc8),COLOR(COLOR:Black),LINEWIDTH(1)
                         STRING('6'),AT(5708,1938,313,135),USE(?SEinterpClass8:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1927,948,135),USE(?NORG46),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Equivocal'),AT(3000,719,2365,208),USE(?SEinterp2:4),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('0/1'),AT(5708,729,313,135),USE(?SEinterpClass2:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,729,948,135),USE(?NOR:G4E),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('1'),AT(5729,927,313,135),USE(?SEinterpClass3:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,927,948,135),USE(?NOR:G41),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Increasing Antibody Levels 1-6'),AT(2990,1354,2365,208),USE(?SEinterp4:2),FONT(,10, |
  COLOR:Black,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('2'),AT(5729,1125,313,135),USE(?SEinterpClass4:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1125,948,135),USE(?NOR:G42),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('3'),AT(5708,1344,313,135),USE(?SEinterpClass5:4),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1323,948,135),USE(?NOR:G43),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('4'),AT(5708,1531,313,135),USE(?SEinterpClass6:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1542,948,135),USE(?NOR:G44),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('5'),AT(5708,1729,313,135),USE(?SEinterpClass7:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,1740,948,135),USE(?NOR:G45),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER, |
  TRN
                         STRING('No Antibody Detected'),AT(3021,521,2365,208),USE(?SEinterp1),FONT(,,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING(@s20),AT(6188,542,948,135),USE(?NOR:G40),FONT(,10,,FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('0'),AT(5708,542,313,135),USE(?SEinterpClass1:3),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Specific IgG4 Normal Range'),AT(781,10,2344,219),USE(?locHeading:5),FONT(,12,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,COLOR(COLOR:Black),TRN
                         STRING('Interpretation'),AT(3031,313,2240,208),USE(?RES:Description:9),FONT(,10,COLOR:White, |
  FONT:bold,CHARSET:ANSI),CENTER,TRN
                         STRING('Class'),AT(5646,313,417,208),USE(?RES:Score:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
                         STRING('Conc (µg/mL)'),AT(6188,323,885,208),USE(?S72:11),FONT(,10,COLOR:White,FONT:bold,CHARSET:ANSI), |
  CENTER,TRN
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

ProgressMgr          StepLongClass                         ! Progress Manager
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
  GlobalErrors.SetProcedureName('cwRpt')
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
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('cwRpt',ProgressWindow)                     ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Test, ?Progress:PctText, Progress:Thermometer, ProgressMgr, TST:INVOICE)
  ThisReport.AddSortOrder(TST:ORDER_KEY)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Test.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Test.Close
  END
  IF SELF.Opened
    INIMgr.Update('cwRpt',ProgressWindow)                  ! Save window data to non-volatile store
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
  PRINT(RPT:HeadIgG)
  PRINT(RPT:HeadIgG4)
  PRINT(RPT:HeadIgE)
  PRINT(RPT:Interp)
  PRINT(RPT:CML)
  PRINT(RPT:G4Interp)
  RETURN ReturnValue


TXTReporter.Setup PROCEDURE

  CODE
  PARENT.Setup
  SELF.SetFileName('')
  SELF.SetPagesAsDifferentFile(False)
  SELF.SetMargin(0,0,0,0)
  SELF.SetCheckBoxString('[X]','[_]')
  SELF.SetRadioButtonString('(*)','(_)')
  SELF.SetLineString('|','|','-','-','/','\','\','/')
  SELF.SetTextFillString(' ',CHR(176),CHR(177),CHR(178),CHR(219))
  SELF.SetOmitGraph(False)

