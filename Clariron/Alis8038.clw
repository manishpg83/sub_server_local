

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE
   INCLUDE('abprtext.inc'),ONCE
   INCLUDE('abrppsel.inc'),ONCE

                     MAP
                       INCLUDE('ALIS8038.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8046.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8050.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8058.INC'),ONCE        !Req'd for module callout resolution
                     END


gloDropFileName   STRING(128)
mdlOpenWells   STRING(4),DIM(288)
gloTScount   ULONG
gloDRPcount   ULONG
gloLogFileName   STRING(128)
gloTubeSize   BYTE
gloCutoff   LONG
gloLabels   BYTE
gloDilLabels   BYTE
gloSpare   STRING(1)
gloPosition   SHORT
gloFinal   BYTE
gloMonitorFileName   STRING(64)
gloTypeID   STRING(3),DIM(9)
gloSetCount   BYTE,DIM(9)
gloTestWells   SHORT
gloTestCount   LONG,DIM(9)
gloFirstWell   SHORT
gloFirstSource   SHORT
gloSetWells   SHORT
gloDate   LONG
gloTime   LONG
gloReportType   STRING(20)
TestSet     QUEUE,PRE(TS)  !The list of patient test to be used in the drop file test set of plates
Patient         LONG
Code            STRING(5)
Source          USHORT
Panel           BYTE
            .
DropTable   QUEUE,PRE(DT)
Invoice       LONG
Source        USHORT
Position      USHORT
Code          STRING(5)
            .







TYPE:Postal EQUATE(4)  ! Summary Report type
TYPE:Fax    EQUATE(2)
TYPE:eMail  EQUATE(1)
TYPE:All    EQUATE(0)
!!! <summary>
!!! Generated from procedure template - Window
!!! Monitors number of tests logged in and verified
!!! </summary>
Monitor PROCEDURE 

SAV:Panel            STRING(9)                             !
locRecords           LONG                                  !
locIncludeCovid      LONG                                  !
locIncludeChemicals  LONG                                  !
locFoundG            LONG                                  !
locFoundE            LONG                                  !
locExceptionStatus   ULONG                                 !
locNumber            LONG                                  !
locComplete          BYTE                                  !
locException         SHORT                                 !
locLabelStartPatient LONG                                  !
locLabelEndPatient   LONG                                  !
locLabelPatient      STRING(12)                            !
locLabelText         STRING(10)                            !
locAutoPrint         BYTE                                  !
locTubeSize          BYTE                                  !
locNoDropMade        BYTE                                  !
locDay               LONG                                  !
locNeedDOB           BYTE                                  !
locNeedAgeCount      BYTE                                  !
locLabels            SHORT                                 !
locLowVerifiedPatient LONG                                 !
locHighVerifiedPatient LONG                                !
locLowLoggedInPatient LONG                                 !
locHighLoggedInPatient LONG                                !
locErrors            LONG                                  !
locStatusType        BYTE                                  !
locPlates            BYTE                                  !
locPlateType         BYTE                                  !
SAV:Invoice          LONG                                  !
SAV:QNS              LONG                                  !
SAV:MainPanel        STRING(9)                             !
locFileName          STRING(12)                            !
HSA                  BYTE,DIM(9)                           !
locManualFire        BYTE                                  !
locDisableTimer      BYTE                                  !
locLoginStatus       BYTE                                  !Used to find patients that are partially workpooled after each drop file is created
locTestType          BYTE                                  !
SAV:Code             STRING(9)                             !
SAV:Type             BYTE                                  !
locCount             LONG                                  !
locWorkpooledTests   USHORT,DIM(9)                         !
locFirstSet          BYTE,DIM(9)                           !
locSetTests          SHORT,DIM(9)                          !
locEvents            ULONG                                 !
locVerifiedPatients  USHORT                                !
locNotVerifiedPatients LONG                                !
locWorkpooledPatients USHORT                               !
locCompletePatients  USHORT                                !
locVerified          BYTE                                  !
locQNS               BYTE                                  !
FindDups             QUEUE,PRE(FD)                         !
Type                 BYTE                                  !
Code                 STRING(9)                             !
                     END                                   !
DropPatients         QUEUE,PRE(DP)                         !
Patient              LONG                                  !
                     END                                   !
locPrinterError      STRING(32)                            !
locPlate1            BYTE                                  !
locPlate2            BYTE                                  !
locPlate3            BYTE                                  !
locPlateOffset       BYTE                                  !
locWellColumn        BYTE                                  !
locRowOffset         BYTE                                  !
locRow               STRING(1)                             !
RowQ                 QUEUE,PRE(ROW)                        !
Letter               STRING(1)                             !
                     END                                   !
locQNS2              BYTE                                  !
locQNS3              BYTE                                  !
locMenu              STRING(20)                            !
locLabelsChanged     BYTE                                  !
locTestCount         ULONG                                 !
locAge               LONG                                  !
locDays              LONG                                  !
Count    FILE,DRIVER('ASCII'),NAME(gloFileName3),PRE(CNT),CREATE
          RECORD
Text      STRING(50)
        .  .
ErrorLog FILE,DRIVER('ASCII'),NAME(gloFileName3),PRE(EL),CREATE
Record    RECORD
Text       STRING(100)
        .  .

PanelQ               QUEUE,PRE(PNLQ)
Patient              LIKE(PAT:Invoice)                             !
Client               LIKE(CLI:Number)
Number               STRING(9)                             !
                     END  
                     
locStartsWith   STRING(2),OVER(TST:CODE)                     !

WellWindow WINDOW('Plates'),AT(,,337,301),FONT('Arial',8,,FONT:regular),GRAY
       STRING(@s4),AT(4,12),USE(mdlOpenWells[1]),CENTER
       STRING(@s4),AT(4,22),USE(mdlOpenWells[2]),CENTER
       STRING(@s4),AT(4,32),USE(mdlOpenWells[3]),CENTER
       STRING(@s4),AT(4,42),USE(mdlOpenWells[4]),CENTER
       STRING(@s4),AT(4,52),USE(mdlOpenWells[5]),CENTER
       STRING(@s4),AT(4,62),USE(mdlOpenWells[6]),CENTER
       STRING(@s4),AT(4,72),USE(mdlOpenWells[7]),CENTER
       STRING(@s4),AT(4,82),USE(mdlOpenWells[8]),CENTER
       STRING(@s4),AT(24,12),USE(mdlOpenWells[9]),CENTER
       STRING(@s4),AT(24,22),USE(mdlOpenWells[10]),CENTER
       STRING(@s4),AT(24,32),USE(mdlOpenWells[11]),CENTER
       STRING(@s4),AT(24,42),USE(mdlOpenWells[12]),CENTER
       STRING(@s4),AT(24,52),USE(mdlOpenWells[13]),CENTER
       STRING(@s4),AT(24,62),USE(mdlOpenWells[14]),CENTER
       STRING(@s4),AT(24,72),USE(mdlOpenWells[15]),CENTER
       STRING(@s4),AT(24,82),USE(mdlOpenWells[16]),CENTER
       STRING(@s4),AT(44,12),USE(mdlOpenWells[17]),CENTER
       STRING(@s4),AT(44,22),USE(mdlOpenWells[18]),CENTER
       STRING(@s4),AT(44,32),USE(mdlOpenWells[19]),CENTER
       STRING(@s4),AT(44,42),USE(mdlOpenWells[20]),CENTER
       STRING(@s4),AT(44,52),USE(mdlOpenWells[21]),CENTER
       STRING(@s4),AT(44,62),USE(mdlOpenWells[22]),CENTER
       STRING(@s4),AT(44,72),USE(mdlOpenWells[23]),CENTER
       STRING(@s4),AT(44,82),USE(mdlOpenWells[24]),CENTER
       STRING(@s4),AT(64,12),USE(mdlOpenWells[25]),CENTER
       STRING(@s4),AT(64,22),USE(mdlOpenWells[26]),CENTER
       STRING(@s4),AT(64,32),USE(mdlOpenWells[27]),CENTER
       STRING(@s4),AT(64,42),USE(mdlOpenWells[28]),CENTER
       STRING(@s4),AT(64,52),USE(mdlOpenWells[29]),CENTER
       STRING(@s4),AT(64,62),USE(mdlOpenWells[30]),CENTER
       STRING(@s4),AT(64,72),USE(mdlOpenWells[31]),CENTER
       STRING(@s4),AT(64,82),USE(mdlOpenWells[32]),CENTER
       STRING(@s4),AT(84,12),USE(mdlOpenWells[33]),CENTER
       STRING(@s4),AT(84,22),USE(mdlOpenWells[34]),CENTER
       STRING(@s4),AT(84,32),USE(mdlOpenWells[35]),CENTER
       STRING(@s4),AT(84,42),USE(mdlOpenWells[36]),CENTER
       STRING(@s4),AT(84,52),USE(mdlOpenWells[37]),CENTER
       STRING(@s4),AT(84,62),USE(mdlOpenWells[38]),CENTER
       STRING(@s4),AT(84,72),USE(mdlOpenWells[39]),CENTER
       STRING(@s4),AT(84,82),USE(mdlOpenWells[40]),CENTER
       STRING(@s4),AT(104,12),USE(mdlOpenWells[41]),CENTER
       STRING(@s4),AT(104,22),USE(mdlOpenWells[42]),CENTER
       STRING(@s4),AT(104,32),USE(mdlOpenWells[43]),CENTER
       STRING(@s4),AT(104,42),USE(mdlOpenWells[44]),CENTER
       STRING(@s4),AT(104,52),USE(mdlOpenWells[45]),CENTER
       STRING(@s4),AT(104,62),USE(mdlOpenWells[46]),CENTER
       STRING(@s4),AT(104,72),USE(mdlOpenWells[47]),CENTER
       STRING(@s4),AT(104,82),USE(mdlOpenWells[48]),CENTER
       STRING(@s4),AT(124,12),USE(mdlOpenWells[49]),CENTER
       STRING(@s4),AT(124,22),USE(mdlOpenWells[50]),CENTER
       STRING(@s4),AT(124,32),USE(mdlOpenWells[51]),CENTER
       STRING(@s4),AT(124,42),USE(mdlOpenWells[52]),CENTER
       STRING(@s4),AT(124,52),USE(mdlOpenWells[53]),CENTER
       STRING(@s4),AT(124,62),USE(mdlOpenWells[54]),CENTER
       STRING(@s4),AT(124,72),USE(mdlOpenWells[55]),CENTER
       STRING(@s4),AT(124,82),USE(mdlOpenWells[56]),CENTER
       STRING(@s4),AT(144,12),USE(mdlOpenWells[57]),CENTER
       STRING(@s4),AT(144,22),USE(mdlOpenWells[58]),CENTER
       STRING(@s4),AT(144,32),USE(mdlOpenWells[59]),CENTER
       STRING(@s4),AT(144,42),USE(mdlOpenWells[60]),CENTER
       STRING(@s4),AT(144,52),USE(mdlOpenWells[61]),CENTER
       STRING(@s4),AT(144,62),USE(mdlOpenWells[62]),CENTER
       STRING(@s4),AT(144,72),USE(mdlOpenWells[63]),CENTER
       STRING(@s4),AT(144,82),USE(mdlOpenWells[64]),CENTER
       STRING(@s4),AT(164,12),USE(mdlOpenWells[65]),CENTER
       STRING(@s4),AT(164,22),USE(mdlOpenWells[66]),CENTER
       STRING(@s4),AT(164,32),USE(mdlOpenWells[67]),CENTER
       STRING(@s4),AT(164,42),USE(mdlOpenWells[68]),CENTER
       STRING(@s4),AT(164,52),USE(mdlOpenWells[69]),CENTER
       STRING(@s4),AT(164,62),USE(mdlOpenWells[70]),CENTER
       STRING(@s4),AT(164,72),USE(mdlOpenWells[71]),CENTER
       STRING(@s4),AT(164,82),USE(mdlOpenWells[72]),CENTER
       STRING(@s4),AT(164,12),USE(mdlOpenWells[73]),CENTER
       STRING(@s4),AT(164,22),USE(mdlOpenWells[74]),CENTER
       STRING(@s4),AT(164,32),USE(mdlOpenWells[75]),CENTER
       STRING(@s4),AT(164,42),USE(mdlOpenWells[76]),CENTER
       STRING(@s4),AT(164,52),USE(mdlOpenWells[77]),CENTER
       STRING(@s4),AT(164,62),USE(mdlOpenWells[78]),CENTER
       STRING(@s4),AT(164,72),USE(mdlOpenWells[79]),CENTER
       STRING(@s4),AT(164,82),USE(mdlOpenWells[80]),CENTER
       STRING(@s4),AT(184,12),USE(mdlOpenWells[81]),CENTER
       STRING(@s4),AT(184,22),USE(mdlOpenWells[82]),CENTER
       STRING(@s4),AT(184,32),USE(mdlOpenWells[83]),CENTER
       STRING(@s4),AT(184,42),USE(mdlOpenWells[84]),CENTER
       STRING(@s4),AT(184,52),USE(mdlOpenWells[85]),CENTER
       STRING(@s4),AT(184,62),USE(mdlOpenWells[86]),CENTER
       STRING(@s4),AT(184,72),USE(mdlOpenWells[87]),CENTER
       STRING(@s4),AT(184,82),USE(mdlOpenWells[88]),CENTER
       STRING(@s4),AT(204,12),USE(mdlOpenWells[89]),CENTER
       STRING(@s4),AT(204,22),USE(mdlOpenWells[90]),CENTER
       STRING(@s4),AT(204,32),USE(mdlOpenWells[91]),CENTER
       STRING(@s4),AT(204,42),USE(mdlOpenWells[92]),CENTER
       STRING(@s4),AT(204,52),USE(mdlOpenWells[93]),CENTER
       STRING(@s4),AT(204,62),USE(mdlOpenWells[94]),CENTER
       STRING(@s4),AT(204,72),USE(mdlOpenWells[95]),CENTER
       STRING(@s4),AT(204,82),USE(mdlOpenWells[96]),CENTER
       STRING(@s4),AT(4,112),USE(mdlOpenWells[97]),CENTER
       STRING(@s4),AT(4,122),USE(mdlOpenWells[98]),CENTER
       STRING(@s4),AT(4,132),USE(mdlOpenWells[99]),CENTER
       STRING(@s4),AT(4,142),USE(mdlOpenWells[100]),CENTER
       STRING(@s4),AT(4,152),USE(mdlOpenWells[101]),CENTER
       STRING(@s4),AT(4,162),USE(mdlOpenWells[102]),CENTER
       STRING(@s4),AT(4,172),USE(mdlOpenWells[103]),CENTER
       STRING(@s4),AT(4,182),USE(mdlOpenWells[104]),CENTER
       STRING(@s4),AT(24,112),USE(mdlOpenWells[105]),CENTER
       STRING(@s4),AT(24,122),USE(mdlOpenWells[106]),CENTER
       STRING(@s4),AT(24,132),USE(mdlOpenWells[107]),CENTER
       STRING(@s4),AT(24,142),USE(mdlOpenWells[108]),CENTER
       STRING(@s4),AT(24,152),USE(mdlOpenWells[109]),CENTER
       STRING(@s4),AT(24,162),USE(mdlOpenWells[110]),CENTER
       STRING(@s4),AT(24,172),USE(mdlOpenWells[111]),CENTER
       STRING(@s4),AT(24,182),USE(mdlOpenWells[112]),CENTER
       STRING(@s4),AT(44,112),USE(mdlOpenWells[113]),CENTER
       STRING(@s4),AT(44,122),USE(mdlOpenWells[114]),CENTER
       STRING(@s4),AT(44,132),USE(mdlOpenWells[115]),CENTER
       STRING(@s4),AT(44,142),USE(mdlOpenWells[116]),CENTER
       STRING(@s4),AT(44,152),USE(mdlOpenWells[117]),CENTER
       STRING(@s4),AT(44,162),USE(mdlOpenWells[118]),CENTER
       STRING(@s4),AT(44,172),USE(mdlOpenWells[119]),CENTER
       STRING(@s4),AT(44,182),USE(mdlOpenWells[120]),CENTER
       STRING(@s4),AT(64,112),USE(mdlOpenWells[121]),CENTER
       STRING(@s4),AT(64,122),USE(mdlOpenWells[122]),CENTER
       STRING(@s4),AT(64,132),USE(mdlOpenWells[123]),CENTER
       STRING(@s4),AT(64,142),USE(mdlOpenWells[124]),CENTER
       STRING(@s4),AT(64,152),USE(mdlOpenWells[125]),CENTER
       STRING(@s4),AT(64,162),USE(mdlOpenWells[126]),CENTER
       STRING(@s4),AT(64,172),USE(mdlOpenWells[127]),CENTER
       STRING(@s4),AT(64,182),USE(mdlOpenWells[128]),CENTER
       STRING(@s4),AT(84,112),USE(mdlOpenWells[129]),CENTER
       STRING(@s4),AT(84,122),USE(mdlOpenWells[130]),CENTER
       STRING(@s4),AT(84,132),USE(mdlOpenWells[131]),CENTER
       STRING(@s4),AT(84,142),USE(mdlOpenWells[132]),CENTER
       STRING(@s4),AT(84,152),USE(mdlOpenWells[133]),CENTER
       STRING(@s4),AT(84,162),USE(mdlOpenWells[134]),CENTER
       STRING(@s4),AT(84,172),USE(mdlOpenWells[135]),CENTER
       STRING(@s4),AT(84,182),USE(mdlOpenWells[136]),CENTER
       STRING(@s4),AT(104,112),USE(mdlOpenWells[137]),CENTER
       STRING(@s4),AT(104,122),USE(mdlOpenWells[138]),CENTER
       STRING(@s4),AT(104,132),USE(mdlOpenWells[139]),CENTER
       STRING(@s4),AT(104,142),USE(mdlOpenWells[140]),CENTER
       STRING(@s4),AT(104,152),USE(mdlOpenWells[141]),CENTER
       STRING(@s4),AT(104,162),USE(mdlOpenWells[142]),CENTER
       STRING(@s4),AT(104,172),USE(mdlOpenWells[143]),CENTER
       STRING(@s4),AT(104,182),USE(mdlOpenWells[144]),CENTER
       STRING(@s4),AT(124,112),USE(mdlOpenWells[145]),CENTER
       STRING(@s4),AT(124,122),USE(mdlOpenWells[146]),CENTER
       STRING(@s4),AT(124,132),USE(mdlOpenWells[147]),CENTER
       STRING(@s4),AT(124,142),USE(mdlOpenWells[148]),CENTER
       STRING(@s4),AT(124,152),USE(mdlOpenWells[149]),CENTER
       STRING(@s4),AT(124,162),USE(mdlOpenWells[150]),CENTER
       STRING(@s4),AT(124,172),USE(mdlOpenWells[151]),CENTER
       STRING(@s4),AT(124,182),USE(mdlOpenWells[152]),CENTER
       STRING(@s4),AT(144,112),USE(mdlOpenWells[153]),CENTER
       STRING(@s4),AT(144,122),USE(mdlOpenWells[154]),CENTER
       STRING(@s4),AT(144,132),USE(mdlOpenWells[155]),CENTER
       STRING(@s4),AT(144,142),USE(mdlOpenWells[156]),CENTER
       STRING(@s4),AT(144,152),USE(mdlOpenWells[157]),CENTER
       STRING(@s4),AT(144,162),USE(mdlOpenWells[158]),CENTER
       STRING(@s4),AT(144,172),USE(mdlOpenWells[159]),CENTER
       STRING(@s4),AT(144,182),USE(mdlOpenWells[160]),CENTER
       STRING(@s4),AT(164,112),USE(mdlOpenWells[161]),CENTER
       STRING(@s4),AT(164,122),USE(mdlOpenWells[162]),CENTER
       STRING(@s4),AT(164,132),USE(mdlOpenWells[163]),CENTER
       STRING(@s4),AT(164,142),USE(mdlOpenWells[164]),CENTER
       STRING(@s4),AT(164,152),USE(mdlOpenWells[165]),CENTER
       STRING(@s4),AT(164,162),USE(mdlOpenWells[166]),CENTER
       STRING(@s4),AT(164,172),USE(mdlOpenWells[167]),CENTER
       STRING(@s4),AT(164,182),USE(mdlOpenWells[168]),CENTER
       STRING(@s4),AT(164,112),USE(mdlOpenWells[169]),CENTER
       STRING(@s4),AT(164,122),USE(mdlOpenWells[170]),CENTER
       STRING(@s4),AT(164,132),USE(mdlOpenWells[171]),CENTER
       STRING(@s4),AT(164,142),USE(mdlOpenWells[172]),CENTER
       STRING(@s4),AT(164,152),USE(mdlOpenWells[173]),CENTER
       STRING(@s4),AT(164,162),USE(mdlOpenWells[174]),CENTER
       STRING(@s4),AT(164,172),USE(mdlOpenWells[175]),CENTER
       STRING(@s4),AT(164,182),USE(mdlOpenWells[176]),CENTER
       STRING(@s4),AT(184,112),USE(mdlOpenWells[177]),CENTER
       STRING(@s4),AT(184,122),USE(mdlOpenWells[178]),CENTER
       STRING(@s4),AT(184,132),USE(mdlOpenWells[179]),CENTER
       STRING(@s4),AT(184,142),USE(mdlOpenWells[180]),CENTER
       STRING(@s4),AT(184,152),USE(mdlOpenWells[181]),CENTER
       STRING(@s4),AT(184,162),USE(mdlOpenWells[182]),CENTER
       STRING(@s4),AT(184,172),USE(mdlOpenWells[183]),CENTER
       STRING(@s4),AT(184,182),USE(mdlOpenWells[184]),CENTER
       STRING(@s4),AT(204,112),USE(mdlOpenWells[185]),CENTER
       STRING(@s4),AT(204,122),USE(mdlOpenWells[186]),CENTER
       STRING(@s4),AT(204,132),USE(mdlOpenWells[187]),CENTER
       STRING(@s4),AT(204,142),USE(mdlOpenWells[188]),CENTER
       STRING(@s4),AT(204,152),USE(mdlOpenWells[189]),CENTER
       STRING(@s4),AT(204,162),USE(mdlOpenWells[190]),CENTER
       STRING(@s4),AT(204,172),USE(mdlOpenWells[191]),CENTER
       STRING(@s4),AT(204,182),USE(mdlOpenWells[192]),CENTER
       STRING(@s4),AT(4,212),USE(mdlOpenWells[193]),CENTER
       STRING(@s4),AT(4,222),USE(mdlOpenWells[194]),CENTER
       STRING(@s4),AT(4,232),USE(mdlOpenWells[195]),CENTER
       STRING(@s4),AT(4,242),USE(mdlOpenWells[196]),CENTER
       STRING(@s4),AT(4,252),USE(mdlOpenWells[197]),CENTER
       STRING(@s4),AT(4,262),USE(mdlOpenWells[198]),CENTER
       STRING(@s4),AT(4,272),USE(mdlOpenWells[199]),CENTER
       STRING(@s4),AT(4,282),USE(mdlOpenWells[200]),CENTER
       STRING(@s4),AT(24,212),USE(mdlOpenWells[201]),CENTER
       STRING(@s4),AT(24,222),USE(mdlOpenWells[202]),CENTER
       STRING(@s4),AT(24,232),USE(mdlOpenWells[203]),CENTER
       STRING(@s4),AT(24,242),USE(mdlOpenWells[204]),CENTER
       STRING(@s4),AT(24,252),USE(mdlOpenWells[205]),CENTER
       STRING(@s4),AT(24,262),USE(mdlOpenWells[206]),CENTER
       STRING(@s4),AT(24,272),USE(mdlOpenWells[207]),CENTER
       STRING(@s4),AT(24,282),USE(mdlOpenWells[208]),CENTER
       STRING(@s4),AT(44,212),USE(mdlOpenWells[209]),CENTER
       STRING(@s4),AT(44,222),USE(mdlOpenWells[210]),CENTER
       STRING(@s4),AT(44,232),USE(mdlOpenWells[211]),CENTER
       STRING(@s4),AT(44,242),USE(mdlOpenWells[212]),CENTER
       STRING(@s4),AT(44,252),USE(mdlOpenWells[213]),CENTER
       STRING(@s4),AT(44,262),USE(mdlOpenWells[214]),CENTER
       STRING(@s4),AT(44,272),USE(mdlOpenWells[215]),CENTER
       STRING(@s4),AT(44,282),USE(mdlOpenWells[216]),CENTER
       STRING(@s4),AT(64,212),USE(mdlOpenWells[217]),CENTER
       STRING(@s4),AT(64,222),USE(mdlOpenWells[218]),CENTER
       STRING(@s4),AT(64,232),USE(mdlOpenWells[219]),CENTER
       STRING(@s4),AT(64,242),USE(mdlOpenWells[220]),CENTER
       STRING(@s4),AT(64,252),USE(mdlOpenWells[221]),CENTER
       STRING(@s4),AT(64,262),USE(mdlOpenWells[222]),CENTER
       STRING(@s4),AT(64,272),USE(mdlOpenWells[223]),CENTER
       STRING(@s4),AT(64,282),USE(mdlOpenWells[224]),CENTER
       STRING(@s4),AT(84,212),USE(mdlOpenWells[225]),CENTER
       STRING(@s4),AT(84,222),USE(mdlOpenWells[226]),CENTER
       STRING(@s4),AT(84,232),USE(mdlOpenWells[227]),CENTER
       STRING(@s4),AT(84,242),USE(mdlOpenWells[228]),CENTER
       STRING(@s4),AT(84,252),USE(mdlOpenWells[229]),CENTER
       STRING(@s4),AT(84,262),USE(mdlOpenWells[230]),CENTER
       STRING(@s4),AT(84,272),USE(mdlOpenWells[231]),CENTER
       STRING(@s4),AT(84,282),USE(mdlOpenWells[232]),CENTER
       STRING(@s4),AT(104,212),USE(mdlOpenWells[233]),CENTER
       STRING(@s4),AT(104,222),USE(mdlOpenWells[234]),CENTER
       STRING(@s4),AT(104,232),USE(mdlOpenWells[235]),CENTER
       STRING(@s4),AT(104,242),USE(mdlOpenWells[236]),CENTER
       STRING(@s4),AT(104,252),USE(mdlOpenWells[237]),CENTER
       STRING(@s4),AT(104,262),USE(mdlOpenWells[238]),CENTER
       STRING(@s4),AT(104,272),USE(mdlOpenWells[239]),CENTER
       STRING(@s4),AT(104,282),USE(mdlOpenWells[240]),CENTER
       STRING(@s4),AT(124,212),USE(mdlOpenWells[241]),CENTER
       STRING(@s4),AT(124,222),USE(mdlOpenWells[242]),CENTER
       STRING(@s4),AT(124,232),USE(mdlOpenWells[243]),CENTER
       STRING(@s4),AT(124,242),USE(mdlOpenWells[244]),CENTER
       STRING(@s4),AT(124,252),USE(mdlOpenWells[245]),CENTER
       STRING(@s4),AT(124,262),USE(mdlOpenWells[246]),CENTER
       STRING(@s4),AT(124,272),USE(mdlOpenWells[247]),CENTER
       STRING(@s4),AT(124,282),USE(mdlOpenWells[248]),CENTER
       STRING(@s4),AT(144,212),USE(mdlOpenWells[249]),CENTER
       STRING(@s4),AT(144,222),USE(mdlOpenWells[250]),CENTER
       STRING(@s4),AT(144,232),USE(mdlOpenWells[251]),CENTER
       STRING(@s4),AT(144,242),USE(mdlOpenWells[252]),CENTER
       STRING(@s4),AT(144,252),USE(mdlOpenWells[253]),CENTER
       STRING(@s4),AT(144,262),USE(mdlOpenWells[254]),CENTER
       STRING(@s4),AT(144,272),USE(mdlOpenWells[255]),CENTER
       STRING(@s4),AT(144,282),USE(mdlOpenWells[256]),CENTER
       STRING(@s4),AT(164,212),USE(mdlOpenWells[257]),CENTER
       STRING(@s4),AT(164,222),USE(mdlOpenWells[258]),CENTER
       STRING(@s4),AT(164,232),USE(mdlOpenWells[259]),CENTER
       STRING(@s4),AT(164,242),USE(mdlOpenWells[260]),CENTER
       STRING(@s4),AT(164,252),USE(mdlOpenWells[261]),CENTER
       STRING(@s4),AT(164,262),USE(mdlOpenWells[262]),CENTER
       STRING(@s4),AT(164,272),USE(mdlOpenWells[263]),CENTER
       STRING(@s4),AT(164,282),USE(mdlOpenWells[264]),CENTER
       STRING(@s4),AT(164,212),USE(mdlOpenWells[265]),CENTER
       STRING(@s4),AT(164,222),USE(mdlOpenWells[266]),CENTER
       STRING(@s4),AT(164,232),USE(mdlOpenWells[267]),CENTER
       STRING(@s4),AT(164,242),USE(mdlOpenWells[268]),CENTER
       STRING(@s4),AT(164,252),USE(mdlOpenWells[269]),CENTER
       STRING(@s4),AT(164,262),USE(mdlOpenWells[270]),CENTER
       STRING(@s4),AT(164,272),USE(mdlOpenWells[271]),CENTER
       STRING(@s4),AT(164,282),USE(mdlOpenWells[272]),CENTER
       STRING(@s4),AT(184,212),USE(mdlOpenWells[273]),CENTER
       STRING(@s4),AT(184,222),USE(mdlOpenWells[274]),CENTER
       STRING(@s4),AT(184,232),USE(mdlOpenWells[275]),CENTER
       STRING(@s4),AT(184,242),USE(mdlOpenWells[276]),CENTER
       STRING(@s4),AT(184,252),USE(mdlOpenWells[277]),CENTER
       STRING(@s4),AT(184,262),USE(mdlOpenWells[278]),CENTER
       STRING(@s4),AT(184,272),USE(mdlOpenWells[279]),CENTER
       STRING(@s4),AT(184,282),USE(mdlOpenWells[280]),CENTER
       STRING(@s4),AT(204,212),USE(mdlOpenWells[281]),CENTER
       STRING(@s4),AT(204,222),USE(mdlOpenWells[282]),CENTER
       STRING(@s4),AT(204,232),USE(mdlOpenWells[283]),CENTER
       STRING(@s4),AT(204,242),USE(mdlOpenWells[284]),CENTER
       STRING(@s4),AT(204,252),USE(mdlOpenWells[285]),CENTER
       BUTTON('Close'),AT(254,251,70,25),USE(?CloseTestPlates),LEFT,ICON(ICON:Tick)
       STRING(@s4),AT(204,262),USE(mdlOpenWells[286]),CENTER
       STRING(@s4),AT(204,272),USE(mdlOpenWells[287]),CENTER
       STRING(@s4),AT(204,282),USE(mdlOpenWells[288]),CENTER
     END

BRW1::View:Browse    VIEW(SpecimenReceived)
                       PROJECT(SR:eMailed)
                       PROJECT(SR:Patient)
                       PROJECT(SR:PatientName)
                       PROJECT(SR:Client)
                       PROJECT(SR:ClientName)
                       PROJECT(SR:Date)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
SR:eMailed             LIKE(SR:eMailed)               !List box control field - type derived from field
SR:eMailed_NormalFG    LONG                           !Normal forground color
SR:eMailed_NormalBG    LONG                           !Normal background color
SR:eMailed_SelectedFG  LONG                           !Selected forground color
SR:eMailed_SelectedBG  LONG                           !Selected background color
SR:eMailed_Style       LONG                           !Field style
SR:Patient             LIKE(SR:Patient)               !List box control field - type derived from field
SR:Patient_NormalFG    LONG                           !Normal forground color
SR:Patient_NormalBG    LONG                           !Normal background color
SR:Patient_SelectedFG  LONG                           !Selected forground color
SR:Patient_SelectedBG  LONG                           !Selected background color
SR:Patient_Style       LONG                           !Field style
SR:PatientName         LIKE(SR:PatientName)           !List box control field - type derived from field
SR:PatientName_NormalFG LONG                          !Normal forground color
SR:PatientName_NormalBG LONG                          !Normal background color
SR:PatientName_SelectedFG LONG                        !Selected forground color
SR:PatientName_SelectedBG LONG                        !Selected background color
SR:PatientName_Style   LONG                           !Field style
SR:Client              LIKE(SR:Client)                !List box control field - type derived from field
SR:Client_NormalFG     LONG                           !Normal forground color
SR:Client_NormalBG     LONG                           !Normal background color
SR:Client_SelectedFG   LONG                           !Selected forground color
SR:Client_SelectedBG   LONG                           !Selected background color
SR:Client_Style        LONG                           !Field style
SR:ClientName          LIKE(SR:ClientName)            !List box control field - type derived from field
SR:ClientName_NormalFG LONG                           !Normal forground color
SR:ClientName_NormalBG LONG                           !Normal background color
SR:ClientName_SelectedFG LONG                         !Selected forground color
SR:ClientName_SelectedBG LONG                         !Selected background color
SR:ClientName_Style    LONG                           !Field style
SR:Date                LIKE(SR:Date)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Workpool Log-In Monitor'),AT(1,1,510,340),FONT('Arial',11,,,CHARSET:ANSI),AUTO,ICON('SteelGears.ico'), |
  GRAY,MAX,MDI,SYSTEM,IMM
                       IMAGE('button.jpg'),AT(182,40,284,45),USE(?Image6)
                       STRING('Tests per Set'),AT(8,134),USE(?String54),FONT(,12,COLOR:White,FONT:bold),TRN
                       PANEL,AT(2,114,67,104),USE(?Panel4),BEVEL(-1,-1)
                       STRING('Patients'),AT(6,38,31,10),USE(?String1),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING('Verified'),AT(102,26),USE(?String9),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('Not Verified'),AT(44,26),USE(?String10),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@n6),AT(102,38),USE(locVerifiedPatients),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n6),AT(430,64),USE(locWorkpooledPatients),FONT(,,,FONT:bold),RIGHT,TRN
                       BUTTON('Send Notice'),AT(226,90,70,12),USE(?SendNotice),HIDE
                       BUTTON('Delete'),AT(308,90,70,12),USE(?DeleteConfirmation),HIDE
                       STRING(@n6B),AT(56,38),USE(locNotVerifiedPatients),FONT(,,COLOR:Red,FONT:bold),RIGHT,TRN
                       STRING('IgE'),AT(262,42),USE(?String14),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('IgG'),AT(288,42),USE(?String15),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('IgG4'),AT(310,42),USE(?String16),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('IVG'),AT(346,42),USE(?String18),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('IVM'),AT(373,42),USE(?String19),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),TRN
                       STRING('T-IgM'),AT(398,42),USE(?String20),FONT(,,COLOR:White,FONT:bold,CHARSET:ANSI),HIDE, |
  TRN
                       ENTRY(@n7),AT(162,204,44,10),USE(locLabelEndPatient),RIGHT(2)
                       STRING(@n13),AT(233,207),USE(locTestCount),FONT(,14,,FONT:bold),LEFT,TRN
                       STRING(@PMonitor:  ### ###PB),AT(394,124),USE(MON:PATIENT),TRN
                       CHECK('  Changed Labels'),AT(140,218),USE(locLabelsChanged),FONT(,,,FONT:bold),TRN
                       STRING(@s9),AT(413,148),USE(PT:PANEL),RIGHT,TRN
                       STRING('Panel: '),AT(394,148),USE(?String64),TRN
                       STRING(@s7),AT(458,148),USE(PT:CODE),LEFT,TRN
                       STRING('Not Workpooled'),AT(190,54),USE(?String24),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@n4),AT(251,54,23,10),USE(gloTestCount[1]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(280,54,21,10),USE(gloTestCount[2]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(306,54,21,10),USE(gloTestCount[3]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(338,54,21,10),USE(gloTestCount[7]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(366,54,21,10),USE(gloTestCount[8]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(398,54,21,10),USE(gloTestCount[6]),FONT(,,,FONT:bold),RIGHT,HIDE,TRN
                       BUTTON('Print Labels'),AT(140,230,70,25),USE(?PrintLabels),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(76,274),USE(locPrinterError),FONT(,,COLOR:Red,,CHARSET:ANSI),RIGHT,TRN
                       STRING(@N7b),AT(233,187),USE(locCount),FONT(,14,,FONT:bold),LEFT,TRN
                       STRING(@n4),AT(251,64),USE(locWorkpooledTests[1]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(278,64),USE(locWorkpooledTests[2]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(304,64),USE(locWorkpooledTests[3]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(336,64),USE(locWorkpooledTests[7]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(364,64),USE(locWorkpooledTests[8]),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n4),AT(398,64),USE(locWorkpooledTests[6]),FONT(,,,FONT:bold),RIGHT,HIDE,TRN
                       STRING('Labels First Patient:'),AT(82,188),USE(?String46),FONT(,,,FONT:bold),TRN
                       ENTRY(@n7),AT(162,188,44,10),USE(locLabelStartPatient),RIGHT(2)
                       PANEL,AT(182,40,284,45),USE(?Panel3),BEVEL(-1,-1)
                       STRING('Workpooled'),AT(190,64),USE(?String25),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI),TRN
                       BUTTON('Workpool'),AT(420,186,70,25),USE(?ManualFireButton),FONT(,,,FONT:bold),LEFT,ICON('SteelGears.ico'), |
  TRN
                       STRING('Send Specimen Received Notifacation'),AT(88,98),USE(?String56),FONT(,10),HIDE,TRN
                       LIST,AT(86,107,251,61),USE(?List),FONT(,9,,,CHARSET:ANSI),ALRT(MouseCenter),FORMAT('12C|M*Y@n1' & |
  'b@34C|M*Y~Patient~C(2)@p### ###p@76L|M*Y~Patient Name~L(2)@s32@34C|M*Y~Client~C(2)@p' & |
  '### ###p@85L|M*Y~Client Name~L(2)@s32@'),FROM(Queue:Browse),IMM,MSG('Browsing Records'), |
  TRN
                       STRING('No QNS Found'),AT(312,183),USE(?NoQNSString),FONT(,,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  RIGHT,HIDE,TRN
                       STRING('.'),AT(12,284),USE(?String57),FONT(,12,,FONT:bold),TRN
                       STRING(@n2),AT(377,191,16,10),USE(locQNS2),FONT(,,COLOR:Yellow,FONT:bold,CHARSET:ANSI),CENTER, |
  COLOR(COLOR:Black)
                       STRING(@n2),AT(392,191,16,10),USE(locQNS3),FONT(,,COLOR:Lime,FONT:bold,CHARSET:ANSI),CENTER, |
  COLOR(COLOR:Black)
                       IMAGE('button.jpg'),AT(140,256,70,17),USE(?Image9)
                       CHECK('Plate Row'),AT(2,6,48,10),USE(locPlate1),ICON(ICON:None),VALUE('1','0')
                       STRING('IgG test'),AT(8,154),USE(?String49),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,144,21,10),USE(locSetTests[1]),FONT(,9,,FONT:bold),TRN
                       STRING('IgE Tests'),AT(8,144),USE(?String48),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,154,21,10),USE(locSetTests[2]),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,162,21,10),USE(locSetTests[3]),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,180,21,10),USE(locSetTests[8]),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,172,21,10),USE(locSetTests[7]),FONT(,9,,FONT:bold),TRN
                       STRING('IVG Tests'),AT(8,172),USE(?String51),FONT(,9,,FONT:bold),TRN
                       STRING(@N_4),AT(42,190,21,10),USE(locSetTests[6]),FONT(,9,,FONT:bold),HIDE,TRN
                       STRING(@s9),AT(417,138,36,10),USE(TST:CODE),RIGHT,TRN
                       STRING('Test: '),AT(394,138),USE(?String65),TRN
                       STRING(@pPatient:  ### ###pb),AT(394,112),USE(Pat:INVOICE),TRN
                       LIST,AT(52,6,33,10),USE(locRow),FONT('Arial',14,,FONT:bold,CHARSET:ANSI),CENTER,DROP(8),FORMAT('4C(2)|M~Row~L@s1@'), |
  FROM(RowQ)
                       STRING('T-IgM Tests'),AT(8,190),USE(?String53),FONT(,9,,FONT:bold),HIDE,TRN
                       STRING(@n_6),AT(100,48),USE(locLowVerifiedPatient),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n_6),AT(54,48),USE(locLowLoggedInPatient),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING('IgG4 Tests'),AT(8,162),USE(?String50),FONT(,9,,FONT:bold),TRN
                       STRING('Lowest #'),AT(6,48,31,10),USE(?String31),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@n_6),AT(100,58),USE(locHighVerifiedPatient),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING(@n_6),AT(54,58),USE(locHighLoggedInPatient),FONT(,,,FONT:bold),RIGHT,TRN
                       STRING('IVM Tests'),AT(8,180),USE(?String52),FONT(,9,,FONT:bold),TRN
                       STRING('Higest #'),AT(6,58,31,10),USE(?String32),FONT(,,COLOR:Navy,FONT:bold,CHARSET:ANSI), |
  TRN
                       BUTTON('Complete'),AT(420,222,70,25),USE(?Complete),FONT(,,,FONT:bold),TRN
                       BUTTON('Summary'),AT(230,230,70,25),USE(?SummaryButton),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                       BUTTON('Shipping Labels'),AT(324,230,70,25),USE(?ShippingLabelsButton),FONT(,,,FONT:bold,CHARSET:ANSI), |
  DISABLE
                       BUTTON('Done'),AT(420,278,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  STD(STD:Close),TRN
                       REGION,AT(6,284,16,13),USE(?Region1)
                       PANEL,AT(86,107,251,61),USE(?Panel5)
                       CHECK('Plate 3'),AT(0,244,48,10),USE(locPlate3),ICON(ICON:None),HIDE,VALUE('1','0')
                       BUTTON('Test  Label'),AT(140,256,70,17),USE(?locLabelTest),FONT(,,,FONT:bold),DISABLE,TRN
                       IMAGE('button.jpg'),AT(2,114,67,104),USE(?Image8)
                       IMAGE('button.jpg'),AT(2,24,135,64),USE(?Image7)
                       IMAGE('button.jpg'),AT(140,230,70,25),USE(?Image5)
                       IMAGE('button.jpg'),AT(230,230,70,25),USE(?Image4)
                       IMAGE('Button.jpg'),AT(420,222,70,25),USE(?Image3)
                       IMAGE('Button.jpg'),AT(420,186,70,25),USE(?Image2)
                       IMAGE('Button.jpg'),AT(420,278,70,25),USE(?Image1)
                       STRING(@pNumber of QNS: <<#p),AT(302,191,76,10),USE(locQNS),FONT(,,COLOR:Red,FONT:bold),LEFT(5), |
  COLOR(COLOR:Black)
                       BUTTON('Test'),AT(88,6,48,10),USE(?TestPlates),HIDE
                       CHECK('Plate 2'),AT(0,234,48,10),USE(locPlate2),ICON(ICON:None),HIDE,VALUE('1','0')
                       STRING('Labels Last Patient:'),AT(82,204),USE(?String47),FONT(,,,FONT:bold),TRN
                       STRING('Patients that Need Age:'),AT(308,204),USE(?String42),FONT(,,,FONT:bold),TRN
                       STRING(@n2),AT(394,204),USE(locNeedAgeCount),FONT(,,,FONT:bold),TRN
                       LINE,AT(38,22,0,45),USE(?Line3),COLOR(COLOR:Black)
                       LINE,AT(86,22,0,45),USE(?Line1),COLOR(COLOR:Black)
                       LINE,AT(1,35,135,0),USE(?Line4),COLOR(COLOR:Black)
                       PANEL,AT(2,24,135,64),USE(?Panel1),BEVEL(-1,-1)
                       PANEL,AT(412,178,87,40),USE(?WarningPanel),BEVEL(1)
                     END

BRW1::AutoSizeColumn CLASS(AutoSizeColumnClassType)
               END
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
  !------------------------------------
  !Style for ?List
  !------------------------------------
  ?List{PROPSTYLE:FontName, 1}      = gloListFont
  ?List{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?List{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?List{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?List{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?List{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?List{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
CountTests  ROUTINE
  SHARE(Test)
  locNeedDOB = FALSE
  locTestCount = 0
  locFoundG = FALSE
  locFoundE = FALSE
  
! This routine counts the number of test for each type, checks if all tests have been workpooled (locLoginStatus=FALSE means all patient tests were workpooled),
  CLEAR(MON:Count[])
  CLEAR(MON:Workpooled[]) 
  SO:Patient = 0  
  
  CLEAR(TST:Record)
  TST:INVOICE = MON:Patient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  IF ERRORCODE() THEN STOP('TST SET: ' & ERROR()).
  LOOP
    NEXT(Test)
    IF TST:INVOICE <> MON:Patient OR ERRORCODE() THEN BREAK.  
    IF TST:Type = 0 AND TST:Status = 'L' 
      PNLQ:Number = TST:CODE
      PNLQ:Patient = TST:Invoice
      PNLQ:Client =  MON:Client
      ADD(PanelQ)
    .
  . 
  IF RECORDS(PanelQ)
    DO BreakPanels    
  .
  
  MON:Status = 'W'                                  ! ASSUME WORKPOOLED, L or R will change status back to V
  CLEAR(TST:Record)
  TST:INVOICE = MON:Patient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  IF ERRORCODE() THEN STOP('TST SET: ' & ERROR()).
  LOOP
    NEXT(Test)
    IF TST:INVOICE <> MON:Patient OR ERRORCODE() THEN BREAK.
    IF TST:TYPE = 2 THEN locFoundG = TRUE.
    IF TST:TYPE = 1 AND SUB(TST:CODE,1,3) <> '100' THEN locFoundE = TRUE.

    IF gloTestCodeStartsWith1 = 'S'
      SO:Patient = TST:INVOICE
      GET(SendOuts,SO:OrderKey)
      IF ERRORCODE()
        SO:Date = TODAY()
        ADD(SendOuts)
      .
      EXIT
    .
    
    locTestCount += 1
 !   IF SO:Patient = TST:INVOICE THEN STOP(TST:INVOICE & ' ' & MON:Client & ' ' & SO:Patient & ': Sendout Mix With Other Test Error');CYCLE.
    DISPLAY(?locTestCount)
    IF INRANGE(TST:Type,1,8) 
      IF TST:CODE = '100-1' THEN  MON:Attributes = BOR(MON:Attributes,1); locNeedDOB = TRUE.
      IF TST:CODE = '100-5' THEN  MON:Attributes = BOR(MON:Attributes,2); locNeedDOB = TRUE.
      CASE TST:Status
      OF 'W'
        MON:Workpooled[TST:Type] += 1
      OF 'L'
      OROF 'R'
        MON:Count[TST:Type] += 1
        MON:Status = 'V'
      .
    .
  .
  LOOP locTestType = 1 to 8  ! add patient test counts to total (gloTestCount=logged in and not workpooled, loc Workpooled totals workpooled tests)
    gloTestCount[locTestType]       += MON:Count[locTestType]
    locWorkpooledTests[locTestType] +=  MON:Workpooled[locTestType]
  .
  IF INRANGE(TST:Type,4,6) THEN locNeedDOB = TRUE.

  


  IF locFoundG  
    TST:INVOICE = MON:Patient
    TST:TYPE = 2
    TST:Code = 'A999'
    ADD(Test)
    IF ERRORCODE() AND ERRORCODE() <> 40 THEN STOP('ADD G A999: ' & ERROR()).
  . 
!  IF locFoundE 
!    TST:INVOICE = MON:Patient
!    TST:TYPE = 1
!    TST:Code = 'A999'
!    ADD(Test)
!    IF ERRORCODE() AND ERRORCODE() <> 40 THEN STOP('ADD E A999: ' & ERROR()).
!  . 


CountAll ROUTINE
  locLowVerifiedPatient = 999999
  locHighVerifiedPatient = 0
  locLowLoggedInPatient = 999999
  locHighLoggedInPatient = 0
  locExceptionStatus = 0 
  locQNS = 0
  locQNS2 = 0
  locQNS3 = 0
  locNeedAgeCount = 0
  locVerifiedPatients = 0
  locNotVerifiedPatients = 0
  locCompletePatients = 0
  locWorkpooledPatients = 0  
  ?WarningPanel{PROP:Background} = COLOR:Green
  CLEAR(gloTestCount[])
  CLEAR(locWorkpooledTests[])
  FREE(PanelQ)
  SET(MON:OrderKey)
  IF ERRORCODE() THEN STOP('MON SET: ' & ERROR()).
  LOOP 
    NEXT(Monitor)
    IF ERRORCODE() THEN BREAK.  
    locTestCount += 1
    DISPLAY()
    Pat:INVOICE = MON:Patient
    GET(Patient,Pat:INVOICE_KEY)
    IF ERRORCODE() THEN STOP('Monitor Patient: ' & MON:Patient & ' Not Found').
    IF locAge THEN DO Age.
    CASE Pat:STATUS
    OF 'I'
      DO CountTests
    OF 'D'
      locCompletePatients += 1
      DO CountTests
    OF 'W'
      locWorkpooledPatients += 1
      QNS# = CheckQNS(MON:Patient)
      IF QNS#
        locQNS += 1
        MON:Status = 'Q'  
        ?WarningPanel{PROP:Background} = COLOR:Red
        IF BAND(QNS#,2) THEN locQNS2 += 1.
        IF BAND(QNS#,4) THEN locQNS3 += 1.
      ELSE
         IF MON:Patient < locLowVerifiedPatient THEN locLowVerifiedPatient = MON:Patient.
         IF MON:Patient > locHighVerifiedPatient THEN locHighVerifiedPatient = MON:Patient.
         DO CountTests
      .
    OF 'L'
      IF MON:Patient < locLowLoggedInPatient THEN locLowLoggedInPatient = MON:Patient.
      IF MON:Patient > locHighLoggedInPatient THEN locHighLoggedInPatient = MON:Patient.
      locNotVerifiedPatients += 1
      CYCLE
    OF 'V'
      QNS# = CheckQNS(MON:Patient)
      IF QNS#
        locQNS += 1
        MON:Status = 'Q'
        IF BAND(QNS#,2) THEN locQNS2 += 1.
        IF BAND(QNS#,4) THEN locQNS3 += 1.
        MON:Status = 'Q'
      ELSE
        MON:Status = 'W'
        IF ERRORCODE() THEN STOP('PUT MON: ' & ERROR()).
        IF MON:Patient < locLowVerifiedPatient THEN locLowVerifiedPatient = MON:Patient.
        IF MON:Patient > locHighVerifiedPatient THEN locHighVerifiedPatient = MON:Patient.
        DO CountTests  
      .
    OF 'Q'       ! skip excluded QNSed and Held
      QNS# = CheckQNS(MON:Patient)
      IF QNS#
        locQNS += 1
        MON:Status = 'Q'
        IF BAND(QNS#,2) THEN locQNS2 += 1.
        IF BAND(QNS#,4) THEN locQNS3 += 1.
        IF MON:Patient < locLowVerifiedPatient THEN locLowVerifiedPatient   = MON:Patient.
        IF MON:Patient > locHighVerifiedPatient THEN locHighVerifiedPatient = MON:Patient.
      ELSE
        MON:Status = 'W'
        IF ERRORCODE() THEN STOP('PUT MON: ' & ERROR()).
        DO CountTests
      .
    .
    IF locNeedDOB AND (~PAT:Age OR ~PAT:Age_Type)
      locNeedAgeCount += 1
      Pat:Attributes = BOR(Pat:Attributes,PAT:AgeNeeded)
      locExceptionStatus = PAT:AgeNeeded
    . 
    PAT:Status = MON:Status 
    PUT(Patient)
    PUT(Monitor)
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)
  .
  locLabelStartPatient = locLowVerifiedPatient
  locLabelEndPatient = locHighVerifiedPatient
  DISPLAY()
  IF locQNS
    HIDE(?NoQNSString)
  ELSE
    UNHIDE(?NoQNSString)
  .
  locTestCount = 0
  DISPLAY(?locCount)
  IF MON:STATUS = 'H' OR MON:STATUS = 'Q'
    CLEAR(ToD:ID,1)
    SET(ToD:OrderKey,ToD:OrderKey)
    PREVIOUS(ToDo)
    IF ERRORCODE()  
      IF ERRORCODE() = 33 
        ToD:ID = 0
       ELSE 
         STOP('PREV TODO: ' & ERROR())
    . .
    locNumber = ToD:ID + 1
    CLEAR(ToD:Record) 
    ToD:ID = locNumber
    ToD:Date = TODAY()
    ToD:Due = TODAY()
    ToD:Patient = MON:Patient
    ToD:Client= MON:CLIENT 
    ToD:Attributes = 1
    ToD:Attributes = 7
    ToD:Description = MON:Patient & ' Status = '  & MON:STATUS & ' (Workpool)'
    ADD(ToDo)
    IF ERRORCODE() 
      IF ERRORCODE() <> 40
        STOP('ADD TODO: ' & ERROR())
      .
    .
  .
 
  IF BAND(locExceptionStatus,EX:Age)
    CLEAR(ToD:ID,1)
    SET(ToD:OrderKey,ToD:OrderKey)
    PREVIOUS(ToDo)
    IF ERRORCODE()  
      IF ERRORCODE() = 33 
        ToD:ID = 0
       ELSE 
         STOP('PREV TODO: ' & ERROR())
     . .
     locNumber = ToD:ID + 1
     CLEAR(ToD:Record) 
     ToD:ID = locNumber
     ToD:Date = TODAY()
     ToD:Due = TODAY()
     ToD:Patient = MON:Patient
     ToD:Client= MON:CLIENT 
     ToD:Attributes = 1
       ToD:Attributes = 7
       ToD:Description = MON:Patient & ' Status = '  & MON:STATUS & ' (Workpool)'
       ADD(ToDo)
       IF ERRORCODE() 
         IF ERRORCODE() <> 40
           STOP('ADD TODO: ' & ERROR())
         .
       .      
      ToD:Description = MON:Patient & ' Needs Age'  
      ADD(ToDo)
      IF ERRORCODE() 
        IF ERRORCODE() <> 40
          STOP('ADD TODO: ' & ERROR())
      .
    .
  .



BreakPanels    ROUTINE
  SHARE(Test)
  LOOP
    CLEAR(TST:Record)
    
    GET(PanelQ,1)
    IF MON:Patient <> PNLQ:Patient
      MON:Patient = PNLQ:Patient
      GET(Monitor,MON:OrderKey)
    .
    IF PAT:Invoice <> PNLQ:Patient
      PAT:Invoice = PNLQ:Patient
      GET(Patient,Pat:INVOICE_KEY)
    .
    SAV:Panel = PNLQ:Number
    CLEAR(PT:Record)
    PT:PANEL  = PNLQ:Number
    SET(PT:ORDER_KEY,PT:ORDER_KEY)
    IF ERRORCODE() THEN STOP('PT SET: ' & ERROR()).
    LOOP UNTIL EOF(PNL_TEST)
      NEXT(PNL_TEST)
      IF PT:PANEL <> SAV:Panel OR ERRORCODE()
        BREAK
      .
      DISPLAY()
      IF ~PT:Type 
        PNLQ:Number = PT:Code
        ADD(PanelQ)
        CYCLE
      .
      locCount += 1
      DISPLAY(?locCount)
      TST:Type = PT:Type
      TST:Code = PT:Code
      TST:INVOICE = MON:Patient
      IF gloTestCodeStartsWith1 = 'S'
        TST:Status = 'W'
      ELSE
        TST:Status = 'L'
      .
      ADD(Test)
    .

    MON:Patient = TST:Invoice
    GET(Monitor,MON:OrderKey)
    MON:Status = 'W'
    PUT(Monitor)
    TST:Invoice = MON:Patient
    TST:Code = PNLQ:Number
    TST:Type = 0
    GET(Test,TST:Order_Key)
    TST:Status = 'X'
    PUT(Test)
    DELETE(PanelQ)
    IF RECORDS(PanelQ) < 1 THEN BREAK.
 !   Pat:STATUS = 'W'
    PUT(Patient)
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Change
    ADD(Online)
  .
  locCount = 0
  DISPLAY(?locCount)

Release ROUTINE
  CLEAR(TST:Record)
  TST:STATUS = 'R'                ! look at all TST (then PTS) records with status of R
  SET(TST:STATUS_KEY,TST:STATUS_KEY)
  LOOP UNTIL EOF(Test)
    NEXT(Test)
    IF TST:STATUS <> 'R' THEN BREAK.
  !  locCount += 1
    DISPLAY(?locCount)
    IF ~TST:Type THEN CYCLE.
    IF TST:Invoice <> SAV:Invoice
      SAV:Invoice = TST:Invoice
      PAT:Invoice = TST:Invoice
      GET(Patient,PAT:Invoice_Key)
      IF ERRORCODE() THEN STOP('Release Patient Lookup Failed: ' & TST:Invoice).
      CLI:NUMBER = PAT:CLIENT
      GET(CLIENT,CLI:ORDER_KEY)
      IF ERRORCODE() THEN STOP('Release Client Lookup Failed: ' & PAT:Invoice).
    .
    MON:Patient = TST:Invoice
    GET(Monitor,MON:OrderKey)
    IF ERRORCODE()         ! if not already in monitor file add it
      CLEAR(MON:Record)
      MON:Patient = TST:Invoice
      MON:Status = 'L'
      MON:Name = CLIP(PAT:Last) & ', ' & PAT:First
      MON:Age = PAT:Age
      IF PAT:Client = 800430 OR PAT:Client = 888888
        MON:Sort = 1
      ELSE
        MON:Sort = 0
      .
      MON:Type = 'R'
      MON:SerumReceived = PAT:Volume
      MON:LoginDate = PAT:Date
      ADD(Monitor)
    ELSE
      CYCLE
    .
    IF PAT:Verified_By THEN MON:Status = 'V'.
    CASE PAT:STATUS
    OF 'H'           ! mark & skip QNS & Held release patients
    OROF 'Q'
      MON:Status = PAT:Status
    .
    PUT(Monitor)
  .
Complete ROUTINE
  DO CountAll
  locTestType = 1
  LOOP                                  ! locTestType = 1 to 6  ! check if enough of any type to make a drop file
    IF gloTestCount[locTestType] < 1
      IF locTestType = 8 THEN BREAK.    ! Sets Last Test Type
      locTestType += 1
      CYCLE
    ELSE
      gloSetWells = WPS:Wells[locTestType]
    .

    IF gloSetWells > 1
      I# = MakeDrop(locTestType)
      IF ~I# THEN EXIT.
      gloTestCount[locTestType] -= I#
    ELSE
      STOP('NUMBER OF WELLS NOT SET, TYPE=' & locTestType)
      CYCLE
    .
  .

  DO CountAll
  DO SaveCounts
 

PrinterStatus ROUTINE
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
      IF ~DTR OR ~CTS
        locPrinterError = 'No Printer DTR=' & DTR & '  CTS=' & CTS
      .




PrintLabels     ROUTINE
  MON:Patient = locLabelStartPatient
  SET(MON:OrderKey,MON:OrderKey)
  IF ERRORCODE() THEN STOP('MON SET: ' & ERROR()).
  LOOP
    NEXT(Monitor)
    IF ERRORCODE() OR MON:Patient > locLabelEndPatient THEN BREAK. 
    locLabelPatient = MON:Patient & '-1'
    IF MON:Workpooled[TYPE:IgE] > 75
      locLabelText = '**L** IgE'
      locLabelPatient = MON:Patient & '-1'
      DO MakeLabel
    .
    IF MON:Workpooled[TYPE:IgG]
       IF MON:Workpooled[TYPE:IgG] > 75
        locLabelText = '**L** IgG'
      ELSE
        locLabelText = '***** IgG'
      .
      DO MakeLabel
    .
    IF MON:Workpooled[7]
      locLabelText = '** IVG-100' 
      locLabelPatient = MON:Patient & '-100'
      DO MakeLabel
      locLabelPatient = MON:Patient & '-1'
    .
    IF MON:Workpooled[8]
      locLabelText = '** IVM-100'  
      locLabelPatient = MON:Patient & '-100'
      DO MakeLabel
      locLabelPatient = MON:Patient & '-1'
    .
    IF MON:Workpooled[TYPE:IgG4]
      IF MON:Workpooled[TYPE:IgG4] > 75
        locLabelText = '##L## IgG4'
      ELSE
        locLabelText = '##### IgG4'
      .
      DO MakeLabel
    .
    IF BAND(MON:Attributes,1)
      locLabelPatient = MON:Patient & '-1/21'
      locLabelText = '++1:21++'
      DO MakeLabel
      locLabelPatient = MON:Patient & '-1/42'
      locLabelText = '++1:42++'
      DO MakeLabel
    .
    IF BAND(MON:Attributes,2)
      locLabelPatient = MON:Patient & '-1/101'
      locLabelText = '++1:101++'
      DO MakeLabel
      locLabelPatient = MON:Patient & '-1/202'
      locLabelText = '++1:202++'
      DO MakeLabel
      locLabelPatient = MON:Patient & '-1/404'
      locLabelText = '++1:404++'
      DO MakeLabel
    .
  .
SaveCounts  ROUTINE
        PUTINI('Set','Count1',gloSetCount[1],'WorkPool.INI')
        PUTINI('Set','Count2',gloSetCount[2],'WorkPool.INI')
        PUTINI('Set','Count3',gloSetCount[3],'WorkPool.INI')
        PUTINI('Set','Count4',gloSetCount[4],'WorkPool.INI')
        PUTINI('Set','Count5',gloSetCount[5],'WorkPool.INI')
        PUTINI('Set','Count7',gloSetCount[7],'WorkPool.INI')
        PUTINI('Set','Count8',gloSetCount[8],'WorkPool.INI')
        PUTINI('Rack','Pos',1,'WorkPool.INI')
        PUTINI('Drop','Cutoff',0,'WorkPool.INI')
        PUTINI('Drop','Day',TODAY(),'WorkPool.INI')

MakeLabel   ROUTINE

! A ASCII,   N Clear Image Buffer
! A xpos, ypos, rotate 0=none 1=90..3=270,  Font 4=12pt 3=10pt, hoz multiplier, vert multiplier, reverse image N=normal R=Reverse, "TEXT" LF
! B Barcode B xpos,ypos,rotate, 3=Code39, Narrow Bar Width,Wide Bar(1-10),Height,Human Read B=yes N=No"DATA" LF
!                         1  2 3 4 5 6  7 8
        InitStr = 'N<10>B30,70,0,3,2,4,70,N,"' & CLIP(locLabelPatient) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,10,0,3,1,1,N,"' & CLIP(locLabelText) & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A1,180,3,3,1,1,N,"' & MON:PATIENT & '"<10>'
        ComPuts(CommPort,InitStr)
        InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(MON:NAME) & '"<10>P1<10>'
        ComPuts(CommPort,InitStr)

OpenWells ROUTINE
! Open Wells are defective wells that cannot be used and are skiped in the MakeDrop PROC
  CLEAR(mdlOpenWells[])
  IF ~locPlate1 THEN EXIT.
  locRowOffset = VAL(locRow) - 65
  LOOP locPlateOffset = 0 TO 192 BY 96
    LOOP locWellColumn = 1 TO 89 BY 8
      mdlOpenWells[locPlateOffset + locRowOffset + locWellColumn]  = 'Z999'
  . .
  mdlOpenWells[94]  = 'Z999'
  mdlOpenWells[95]  = 'Z999'
  mdlOpenWells[96]  = 'Z999'
  mdlOpenWells[192] = 'Z999'
  mdlOpenWells[288] = 'Z999'

Age     ROUTINE
            IF PAT:DOB
              locDays = TODAY() - PAT:DOB
              IF locDays < 365
                  PAT:Age = locDays/30
                  PAT:AGE_TYPE = 'M'
              ELSIF locDays > 729
                PAT:AGE_TYPE = 'Y'
                PAT:Age = DEFORMAT(AGE(PAT:DOB))
              ELSE
                PAT:AGE_TYPE = 'Y'
                PAT:Age = locDays/365
            . .

      

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Monitor')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Image6
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                         ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                                       ! File plates used by this procedure, so make sure it's RelationManager is open
  Relate:template.Open                                     ! File template used by this procedure, so make sure it's RelationManager is open
  Relate:wpSetup.Open                                      ! File wpSetup used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  OMIT('XXX')
  Relate:AddTests.Open                                     ! File AddTests used by this procedure, so make sure it's RelationManager is open
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Monitor.Open                                      ! File Monitor used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Relate:SendOuts.Open                                     ! File SendOuts used by this procedure, so make sure it's RelationManager is open
  Relate:SpecimenReceived.Open                             ! File SpecimenReceived used by this procedure, so make sure it's RelationManager is open
  Relate:Test.Open                                         ! File Test used by this procedure, so make sure it's RelationManager is open
  Relate:ToDo.Open                                         ! File ToDo used by this procedure, so make sure it's RelationManager is open
  Relate:plates.Open                                       ! File plates used by this procedure, so make sure it's RelationManager is open
  Relate:template.Open                                     ! File template used by this procedure, so make sure it's RelationManager is open
  Relate:wpSetup.Open                                      ! File wpSetup used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  XXX
  SELF.FilesOpened = True                           ! File referenced in 'Other Files' so need to inform it's FileManager
  BRW1.Init(?List,Queue:Browse.ViewPosition,BRW1::View:Browse,Queue:Browse,Relate:SpecimenReceived,SELF) ! Initialize the browse manager
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse
  BRW1.AddSortOrder(,SR:OrderKey)                          ! Add the sort order for SR:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,SR:Date,1,BRW1)                ! Initialize the browse locator using  using key: SR:OrderKey , SR:Date
  BRW1.SetFilter('(SR:Date=TODAY())')                      ! Apply filter expression to browse
  BRW1.AddField(SR:eMailed,BRW1.Q.SR:eMailed)              ! Field SR:eMailed is a hot field or requires assignment from browse
  BRW1.AddField(SR:Patient,BRW1.Q.SR:Patient)              ! Field SR:Patient is a hot field or requires assignment from browse
  BRW1.AddField(SR:PatientName,BRW1.Q.SR:PatientName)      ! Field SR:PatientName is a hot field or requires assignment from browse
  BRW1.AddField(SR:Client,BRW1.Q.SR:Client)                ! Field SR:Client is a hot field or requires assignment from browse
  BRW1.AddField(SR:ClientName,BRW1.Q.SR:ClientName)        ! Field SR:ClientName is a hot field or requires assignment from browse
  BRW1.AddField(SR:Date,BRW1.Q.SR:Date)                    ! Field SR:Date is a hot field or requires assignment from browse
  INIMgr.Fetch('Monitor',Window)                           ! Restore window settings from non-volatile store
  IF ?locPlate1{Prop:Checked}
    UNHIDE(?locRow)
  END
  IF NOT ?locPlate1{PROP:Checked}
    HIDE(?locRow)
  END
  BRW1.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallPaper
  
  SHARE(Addtests)
  locRecords = RECORDS(AddTests)
  IF locRecords > 0
    STOP(locRecords & ' records found in AddTests.tps')
    OPEN(Test)
    IF ERRORCODE() THEN STOP('OPEN TEST FAILED: ' & ERROR()).
    SET(AddTests)
    LOOP
      NEXT(AddTests)
      IF ERRORCODE() 
        IF RECORDS(AddTests) THEN STOP('ADD TESTS ISSUE: CLICK IGNORE').
        BREAK
      .
      TST:Code = AT:Code
      TST:Invoice = AT:Patient
      TST:Type = AT:Type
      TST:Status = 'L'
      APPEND(Test)
      IF ERRORCODE()
        STOP('ADD TEST: ' & ERROR())
      ELSE
        DELETE(AddTests)
      . 
    .
    FLUSH(Test)
    IF ERRORCODE()
      STOP('TEST FLUSH ISSUE: ' & ERROR())
    .
    BUILD(Test)
    IF ERRORCODE()
      STOP('TEST BUILD ISSUE: ' & ERROR())
    .
    CLOSE(Test)
  .
  SHARE(Test)  
  BRW1::AutoSizeColumn.Init()
  BRW1::AutoSizeColumn.AddListBox(?List,Queue:Browse)
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
    Relate:AddTests.Close
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:Monitor.Close
    Relate:Online.Close
    Relate:Pnl_test.Close
    Relate:Rast.Close
    Relate:SendOuts.Close
    Relate:SpecimenReceived.Close
    Relate:Test.Close
    Relate:ToDo.Close
    Relate:plates.Close
    Relate:template.Close
    Relate:wpSetup.Close
    CLOSE(Test)
  END
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('Monitor',Window)                        ! Save window data to non-volatile store
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
    OF ?PrintLabels
      DO PrintLabels
    OF ?ManualFireButton
      DO OpenWells
      DO CountAll
      IF RECORDS(PanelQ)
        DO BreakPanels
        locAge = TRUE
        DO CountAll
        locAge = FALSE
      .                     
      DISPLAY()
      locTestType = 1
      LOOP                         ! locTestType = 1 to 3  ! check if enough of any type to make a drop file : IF locTestType = 2 OR locTestType = 3 OR ~WPS:UsedType[locTestType] THEN CYCLE.
        IF gloTestCount[locTestType]  < locSetTests[locTestType] OR  locSetTests[locTestType] = 0
          IF locTestType = 8 THEN BREAK.   ! Last Test Type
          locTestType += 1
          CYCLE
        ELSE
          gloSetWells = WPS:Wells[locTestType]
          IF ~gloSetWells THEN STOP('NO WELLS FOR TYPE=' & locTestType ); CYCLE.
          I# = MakeDrop(locTestType)
          IF ~I# THEN BREAK.
          gloTestCount[locTestType] -= I#
          locWorkpooledTests[locTestType] += I#
          DISPLAY()
          LOOP I# = 1 TO RECORDS(DropPatients)        ! change Monitor status to show partial workpool
            GET(DropPatients,I#)                      !  next timer event will re-count this patient
            MON:Patient = DP:Patient
            GET(Monitor,MON:OrderKey)
            MON:Status = 'W'
            PUT(Monitor)
          .
          FREE(DropPatients)
      . .
      DO SaveCounts
    OF ?locRow
      DO OpenWells
      UNHIDE(?TestPlates)
    OF ?Complete
      DO OpenWells
      IF  locQNS
        IF MESSAGE('QNS Exist, Continue?','Editor',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1) = BUTTON:No THEN RETURN(0).
      .
      DO Complete
      SET(Monitor)
      LOOP
        IF locComplete > 0 THEN BREAK.
        NEXT(Monitor)
        IF ERRORCODE() THEN BREAK.
        PAT:Invoice = MON:Patient
        GET(Patient,PAT:Invoice_Key)
        IF ~ERRORCODE()
          locException = SetPatientStatus(MON:Patient)
          PUT(Patient)
          MON:Status = Pat:STATUS
          PUT(Monitor)
          OL:Date = TODAY()
          OL:Time = CLOCK()
          OL:Number = Pat:INVOICE
          OL:PCAE = ONLINE:Patient + ONLINE:Change
          ADD(Online)
        .
        IF INRANGE(Pat:CLIENT,100000,199999)! OR INRANGE(Pat:CLIENT,200000,299999)  OR INRANGE(Pat:CLIENT,700000,799999) OR INRANGE(Pat:CLIENT,800000,899999)
          CLI:NUMBER = Pat:CLIENT
          GET(Client,CLI:ORDER_KEY)
          SR:Client =  Pat:CLIENT
          SR:ClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
          SR:Patient = PAT:Invoice
          SR:PatientName = CLIP(Pat:LAST) & ', ' & Pat:FIRST
          SR:Spanish = MON:Spanish
          ADD(SpecimenReceived)
        .
      .
      IF RECORDS(SpecimenReceived)
        UNHIDE(?String56)
        UNHIDE(?List)
        BRW1.ResetFromFile
      .
      locComplete += 1
    OF ?SummaryButton
      SHARE(Monitor)
    OF ?TestPlates
      OPEN(WellWindow)
      ACCEPT
        IF FIELD() = ?CloseTestPlates AND EVENT() = EVENT:Accepted THEN BREAK.
      .
      CLOSE(WellWindow)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?locLabelsChanged
      ENABLE(?PrintLabels)
      ENABLE(?locLabelTest)
      locLabelText = '**X** IgX'
      locLabelPatient = 'XXXX456-1'
      DO MakeLabel
      
      
    OF ?locPlate1
      IF ?locPlate1{PROP:Checked}
        UNHIDE(?locRow)
      END
      IF NOT ?locPlate1{PROP:Checked}
        HIDE(?locRow)
      END
      ThisWindow.Reset
    OF ?SummaryButton
      ThisWindow.Update
      MonitorTable()
      ThisWindow.Reset
    OF ?Region1
      SR:DATE = TODAY()
      SR:client = 111111
      SR:Patient = 333333
      SR:PatientName = 'MARIA'
      SR:ClientName = 'Dr. Patrick'
      ADD(SpecimenReceived)
      SR:client = 222222
      SR:Patient = 444444
      SR:PatientName = 'JULIO'
      SR:ClientName = 'Dr. Jones'
      
      ADD(SpecimenReceived)
      BRW1.ResetFromFile
    OF ?locLabelTest
      ThisWindow.Update
      SHARE(Monitor)
      DO MakeLabel
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?List
    CASE EVENT()
    OF EVENT:AlertKey
      BRW1.UpdateBuffer
      GET(SpecimenReceived,SR:OrderKey)
      CLI:NUMBER = SR:Client
      GET(Client,CLI:ORDER_KEY)
      globalRequest = ChangeRecord
      Confirmation
      BRW1.ResetFromFile
    END
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
    OF EVENT:OpenWindow
      LOOP I# = 65 TO 72
        ROW:Letter = CHR(I#)
        ADD(RowQ)
      .
   !   CLOSE(SpecimenReceived)
   !   CREATE(SpecimenReceived)
   !   OPEN(SpecimenReceived)
      DO PrinterStatus
      gloTypeID[1] = 'E'
      gloTypeID[2] = 'G'
      gloTypeID[3] = '4'
      gloTypeID[4] = 'TG'
      gloTypeID[5] = 'TA'
      gloTypeID[6] = 'TM'
      gloTypeID[7] = 'VG'
      gloTypeID[8] = 'VM'
      SET(wpSetup,1)
      NEXT(wpSetup)
      IF  ERRORCODE() THEN STOP('WPS: ' & ERROR()).
      gloFileName = '..\data\monitor' & FORMAT(TODAY(),@D11) & '.tps'
      gloDate = TODAY()       !default to today's date
      CLOSE(Monitor)
      SHARE(Monitor)
      IF ERRORCODE()      ! No existing Monitor table, 1st start of the day
        CREATE(Monitor)
        SHARE(Monitor)
        IF ERRORCODE() THEN STOP('MON: ' & ERROR()).
        CLEAR(locFirstSet[])
        CLEAR(gloSetCount[])
        DO SaveCounts
        gloPosition = 1
        gloCutoff = 0
      ELSE               ! Monitor file already exists, get counts from previous Start
        gloSetCount[1] = GETINI('Set','Count1',0,'WorkPool.INI')
        gloSetCount[2] = GETINI('Set','Count2',0,'WorkPool.INI')
        gloSetCount[3] = GETINI('Set','Count3',0,'WorkPool.INI')
        gloSetCount[4] = GETINI('Set','Count4',0,'WorkPool.INI')
        gloSetCount[5] = GETINI('Set','Count5',0,'WorkPool.INI')
        gloSetCount[7] = GETINI('Set','Count7',0,'WorkPool.INI')
        gloSetCount[8] = GETINI('Set','Count8',0,'WorkPool.INI')
        gloPosition    = GETINI('Rack','Pos',1,'WorkPool.INI')
        gloCutoff      = GETINI('Drop','Cutoff',0,'WorkPool.INI')
        locDay         = GETINI('Drop','Day',0,'WorkPool.INI')
        IF locDay <> TODAY()
              STOP('INI data is for:' & FORMAT(locDay,@d2))
        .
      .
      LOOP locTestType = 1 to 8  ! get size of test sets
        IF ~WPS:Wells[locTestType] THEN CYCLE.
        locSetTests[locTestType] = TestCount(locTestType,1,WPS:Wells[locTestType])   ! Count number of patient wells per set
        locFirstSet[locTestType] = TRUE
      .
      CASE MESSAGE('Include Covid?','COVID',ICON:Question,BUTTON:Yes+BUTTON:No,BUTTON:No,1)
      OF BUTTON:No
        locIncludeCovid = FALSE
      OF BUTTON:YES
        locIncludeCovid = TRUE
      .
      IF Pat:SpecimenType = 2 AND Pat:DATE = TODAY() THEN CYCLE.
      CLEAR(PAT:Record)
      PAT:DATE = TODAY() - 28
      locCount = RECORDS(Monitor)
      SET(PAT:DATE_KEY,PAT:DATE_KEY)
      LOOP UNTIL EOF(Patient)                     ! Check all patients that were logged in today
        NEXT(Patient)
        IF PAT:Date > TODAY() OR ERRORCODE() THEN BREAK.
        IF PAT:Date < TODAY() AND Pat:STATUS <> 'V' THEN CYCLE.
        IF ~locIncludeChemicals
          CLEAR(TST:Record)
          TST:Invoice = Pat:INVOICE
          SET(TST:ORDER_KEY,TST:ORDER_KEY)
          NEXT(Test)
          IF TST:INVOICE <> Pat:INVOICE OR ERRORCODE() 
            TST:Code = ''
          .
          IF TST:TYPE = 0 
            SAV:Panel = TST:CODE
            CLEAR(PT:Record)
            PT:PANEL  = TST:CODE
            SET(PT:ORDER_KEY,PT:ORDER_KEY)
            IF ERRORCODE() THEN STOP('PT SET: ' & ERROR()).
            NEXT(PNL_TEST)
            IF PT:PANEL <> TST:CODE OR ERRORCODE() 
              TST:Code = ''
            ELSE
              TST:Code = PT:Code
            .
          .
          IF locStartsWith = 'S0' THEN CYCLE.
        .
        IF ~locIncludeCovid
          CLEAR(TST:Record)
          TST:Invoice = Pat:INVOICE
          SET(TST:ORDER_KEY,TST:ORDER_KEY)
          NEXT(Test)
          IF TST:INVOICE <> Pat:INVOICE OR ERRORCODE() 
            TST:Type = 1
          .
          IF TST:TYPE = 0 
            SAV:Panel = TST:CODE
            CLEAR(PT:Record)
            PT:PANEL  = TST:CODE
            SET(PT:ORDER_KEY,PT:ORDER_KEY)
            IF ERRORCODE() THEN STOP('PT SET: ' & ERROR()).
            NEXT(PNL_TEST)
            IF PT:PANEL <> TST:CODE OR ERRORCODE() 
              TST:Type = 0
            ELSE
              TST:TYPE = PT:TYPE
            .
          .
          IF TST:Type > 6 AND TST:Invoice = Pat:INVOICE THEN CYCLE.
        .
        locCount += 1
        DISPLAY(?locCount)
        MON:Patient = PAT:Invoice                             ! check if new login or already exist in Monitor file
        GET(Monitor,MON:OrderKey)
        IF ERRORCODE()               ! NEW Patient Login Found
          CLEAR(MON:Record)                                   ! new, add patient to Monitor
          MON:Patient = PAT:Invoice                             ! check if new login or already exist in Monitor file
          MON:Status = PAT:Status
          MON:Name = CLIP(PAT:Last) & ', ' & PAT:First
          MON:SerumReceived = PAT:VOLUME
          MON:Age = PAT:Age
          MON:Type = 'L'
          MON:Initials = Pat:VERIFIED_BY
          MON:LoginDate = PAT:Date
          IF Pat:ReportLanguage = 'S'
            MON:Spanish = 1
          ELSE
            MON:Spanish = 0
          .
          ADD(Monitor)
          IF ERRORCODE() THEN STOP('ADD MON: ' & ERROR()).           
        .
        MON:Status = PAT:Status
        MON:Name = CLIP(PAT:Last) & ', ' & PAT:First
        MON:SerumReceived = PAT:VOLUME
        MON:Age = PAT:Age
        MON:Initials = Pat:VERIFIED_BY
        PUT(Monitor)
        IF INRANGE(Pat:CLIENT,100000,199999)
          CLI:NUMBER = PAT:CLIENT
          GET(CLIENT,CLI:ORDER_KEY)
          SR:Patient = MON:Patient
          SR:Client =  PAT:CLIENT
          SR:ClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
          SR:PatientName = MON:Name
          SR:eMailed = 0
          SR:Date = TODAY()
          ADD(SpecimenReceived)
        .
      .
      DO CountAll
      IF RECORDS(PanelQ)
        DO BreakPanels
        DO CountAll
      .
      locCount = 0
      BRW1.ResetFromfile
      DISPLAY()

      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (SR:eMailed=1)
    SELF.Q.SR:eMailed_NormalFG = 16777215                  ! Set conditional color values for SR:eMailed
    SELF.Q.SR:eMailed_NormalBG = 0
    SELF.Q.SR:eMailed_SelectedFG = 0
    SELF.Q.SR:eMailed_SelectedBG = 16777215
    SELF.Q.SR:Patient_NormalFG = 16777215                  ! Set conditional color values for SR:Patient
    SELF.Q.SR:Patient_NormalBG = 0
    SELF.Q.SR:Patient_SelectedFG = 0
    SELF.Q.SR:Patient_SelectedBG = 16777215
    SELF.Q.SR:PatientName_NormalFG = 16777215              ! Set conditional color values for SR:PatientName
    SELF.Q.SR:PatientName_NormalBG = 0
    SELF.Q.SR:PatientName_SelectedFG = 0
    SELF.Q.SR:PatientName_SelectedBG = 16777215
    SELF.Q.SR:Client_NormalFG = 16777215                   ! Set conditional color values for SR:Client
    SELF.Q.SR:Client_NormalBG = 0
    SELF.Q.SR:Client_SelectedFG = 0
    SELF.Q.SR:Client_SelectedBG = 16777215
    SELF.Q.SR:ClientName_NormalFG = 16777215               ! Set conditional color values for SR:ClientName
    SELF.Q.SR:ClientName_NormalBG = 0
    SELF.Q.SR:ClientName_SelectedFG = 0
    SELF.Q.SR:ClientName_SelectedBG = 16777215
  ELSE
    SELF.Q.SR:eMailed_NormalFG = -1                        ! Set color values for SR:eMailed
    SELF.Q.SR:eMailed_NormalBG = -1
    SELF.Q.SR:eMailed_SelectedFG = -1
    SELF.Q.SR:eMailed_SelectedBG = -1
    SELF.Q.SR:Patient_NormalFG = -1                        ! Set color values for SR:Patient
    SELF.Q.SR:Patient_NormalBG = -1
    SELF.Q.SR:Patient_SelectedFG = -1
    SELF.Q.SR:Patient_SelectedBG = -1
    SELF.Q.SR:PatientName_NormalFG = -1                    ! Set color values for SR:PatientName
    SELF.Q.SR:PatientName_NormalBG = -1
    SELF.Q.SR:PatientName_SelectedFG = -1
    SELF.Q.SR:PatientName_SelectedBG = -1
    SELF.Q.SR:Client_NormalFG = -1                         ! Set color values for SR:Client
    SELF.Q.SR:Client_NormalBG = -1
    SELF.Q.SR:Client_SelectedFG = -1
    SELF.Q.SR:Client_SelectedBG = -1
    SELF.Q.SR:ClientName_NormalFG = -1                     ! Set color values for SR:ClientName
    SELF.Q.SR:ClientName_NormalBG = -1
    SELF.Q.SR:ClientName_SelectedFG = -1
    SELF.Q.SR:ClientName_SelectedBG = -1
  END
  SELF.Q.SR:eMailed_Style = 1 ! 
  SELF.Q.SR:Patient_Style = 1 ! 
  SELF.Q.SR:PatientName_Style = 1 ! 
  SELF.Q.SR:Client_Style = 1 ! 
  SELF.Q.SR:ClientName_Style = 1 ! 

!!! <summary>
!!! Generated from procedure template - Source
!!! Function to count available wells for tests
!!! </summary>
TestCount            PROCEDURE  (prmTestType,prmSet,prmWells) ! Declare Procedure
locSource            SHORT                                 !
locTestWells         SHORT                                 !
locRack              BYTE,DIM(200)                         !
locPosition          SHORT                                 !
locStandards    BYTE,DIM(prmWells)

  CODE
! takes the total number of wells in a set of plates (prmWells) and subtracts
! the stansdrds and QC that are listed in the template for the test type (prmTestType) and
! the set (prmSet, first or subsequent sets of micro-plates)  the result is the number of
! avaiable patient postions in the set of micro-plates.

  SHARE(Template)
  locTestWells = prmWells
  CLEAR(locStandards[])
  TPL:Type = prmTestType
  TPL:Set = prmSet
  TPL:Relation = 'Z'  ! Decending key sort field so set to high value
  SET(TPL:KeyType,TPL:KeyType) 
  IF ERRORCODE() THEN STOP('SET TPL: ' & ERROR()).
  LOOP UNTIL EOF(Template)
    NEXT(Template)         
    IF ERRORCODE() THEN BREAK.
    IF TPL:Type <> prmTestType OR TPL:Set <> prmSet THEN BREAK.
    locTestWells -= 1
  . 
!  locTestWells -= 12
  RETURN(locTestWells)

!!! <summary>
!!! Generated from procedure template - Source
!!! Create a list of tests for the next set (drop file)
!!! Creates the test list (TestSet Queue defined in global embeds) with patient number and test code.  Is passed the requested number of tests  needed to fill the current test set and returns the number of records filled.  
!!! </summary>
TestSet              PROCEDURE  (prmSetSize,prmTestType)   ! Declare Procedure
locCount             USHORT                                !
locAdjustSource      BYTE                                  !Adjusts Souce Position for TIgE (100-1 & 100-2)
locTestCount         BYTE                                  !
locMaxTests          BYTE                                  !
SAV:Patient          LONG                                  !
SAV:Source           SHORT                                 !
locFilled            STRING(20)                            !Indicates current patient contributed at least 1 test to this set
locSet      BYTE
Window WINDOW('Building Test Set'),AT(165,137,174,87),GRAY
       STRING('Test Type'),AT(52,8),USE(?String11),TRN
       STRING(@n1),AT(107,8),USE(prmTestType),TRN,RIGHT
       STRING('Requested:'),AT(52,20),USE(?String2),TRN
       STRING(@n6),AT(92,20),USE(prmSetSize),TRN,RIGHT
       STRING('Filled:'),AT(52,32),USE(?String3),TRN
       STRING('1st Source'),AT(52,44),USE(?String5),TRN
       STRING(@n3),AT(102,44),USE(gloFirstSource),TRN
       STRING(@N3),AT(102,66),USE(TS:Source),TRN
       STRING('Current Source'),AT(50,66),USE(?String10),TRN
       STRING('Set'),AT(52,56),USE(?String7),TRN
       STRING(@n2),AT(106,56),USE(locSet),TRN
       STRING(@n6),AT(92,32),USE(locCount),TRN,RIGHT
     END
locTestType BYTE  
locSetSize LONG
locDPC      BYTE

  CODE
! This procedure creates the set of tests to be workpooled
! The type (prmTestType) and number of tests in the set
! (prmSetSize) are passed from the calling procedure.

! Modifies TST:Status and MON:Status
! IF all Test records are processed MON:Status is changed to 'w'
! Each Test record processed the Status is change to 'W'
! A TST:Status of small case 'w' means the test has entered the workpool process and
! will be updated to Capital W after the Drop file is created

! gloFirstSource is expected to be set to a value before the procedure is called
! It is typically set in MakeDrop to WPS:FirstSource
! It is used to set TS:Source to the position of the patient in the Source Rack
  gloTScount += 1
  OPEN(Window)
  0{PROP:Wallpaper} = glowallpaper
  IF ~INRANGE(prmTestType,1,8)
    STOP('Invalid Test Type: ' & prmTestType)
    RETURN(0)
  .
  locSet =  gloSetCount[prmTestType] + 1
  TS:Source = gloFirstSource - 1
  DISPLAY()
  IF  gloTScount > 100 THEN STOP('Warning Plate Sets exceds 100').
  FREE(TestSet)
  SHARE(Test)
  locCount = 0
  locTestCount = 0
  SAV:Patient = -1    ! Set to a number that will not match a patient
  locTestType = prmTestType
  CLEAR(MON:Record)
  SET(MON:OrderKey)
  LOOP 
    NEXT(Monitor)
    IF ERRORCODE() THEN BREAK.
    IF MON:Status = 'L' OR MON:Status = 'W' OR MON:Status = 'Q' OR MON:Status = 'H' OR MON:Status = 'M' THEN CYCLE.
    IF MON:Count[prmTestType]  < 1 THEN CYCLE. 
 !   stop(locTestType & ', PAT:' & MON:PATIENT & ', TESTS=' & prmSetSize  & ', cnt=' & locCount & ', MON:cnt=' & MON:Count[locTestType] & ', RECS=' & RECORDS(TestSet))
    IF locTestType > 6 AND (locCount + MON:Count[locTestType]) > prmSetSize  THEN BREAK. 
 !   stop('ok')
    IF SAV:Patient <> MON:Patient  ! new patient reset counter and make sure tests are added
      SAV:Patient = MON:Patient
      locFilled = FALSE
      SAV:Source = TS:Source
      TS:Source += (1 + locAdjustSource)
      locAdjustSource = 0
      locTestCount = 0
      DISPLAY
    .
    DO FillTestSet
    IF locCount = prmSetSize  THEN BREAK.       ! Number of requested tests (prmSetSize) has been met
    IF ~locFilled THEN TS:Source = SAV:Source.  ! If no tests contributed, take back source rack position
    DISPLAY()
  .
  CLOSE(Window)
  RETURN(RECORDS(TestSet))


FillTestSet ROUTINE
! This is a routine because it has 5 exits
  ! set source position
  locAdjustSource = 0
  CLEAR(TST:Record)
  TST:INVOICE = MON:Patient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP UNTIL EOF(Test)
    NEXT(Test)
    IF TST:INVOICE <> MON:Patient 
      BREAK
    .
    IF TST:TYPE <> locTestType
      CYCLE
    .
    IF TST:Status = 'L'
      TS:Patient = MON:Patient
      TS:Code = TST:Code
      TS:Panel = 0
      IF TS:Code = '100-1'
        TS:Source += 1
        locAdjustSource = 1
      ELSIF TS:Code = '100-2'
        TS:Source += 2
        locAdjustSource = 2
      .
      ADD(TestSet)
      IF TS:Code = '100-1'
        TS:Source -= 1
      ELSIF TS:Code = '100-2'
        TS:Source -= 2
      .
      locFilled = TRUE
      locCount += 1
      IF locCount = prmSetSize THEN EXIT.
      locTestCount += 1
  . .
!!! <summary>
!!! Generated from procedure template - Window
!!! Table of Test Set Templates
!!! </summary>
Templates PROCEDURE 

locCount             LONG                                  !
CurrentTab           STRING(80)                            !
locSort              STRING(1)                             !
SAV:TestType         STRING(20)                            !
locFirstSource       BYTE                                  !
locFirstWell         BYTE                                  !
locWells             USHORT                                !
locLabel             STRING(20)                            !
FilesOpened          BYTE                                  !
save                   QUEUE,PRE(SAV)  
RECORD  GROUP
Type               BYTE
Set                BYTE
Position           USHORT
Relation           STRING(1)
Code               STRING(5)
Barcode            DECIMAL(7,0)
Source             USHORT
                     END
                   END
BRW1::View:Browse    VIEW(template)
                       PROJECT(TPL:Barcode)
                       PROJECT(TPL:Source)
                       PROJECT(TPL:Position)
                       PROJECT(TPL:Code)
                       PROJECT(TPL:Relation)
                       PROJECT(TPL:Type)
                       PROJECT(TPL:Set)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
TPL:Barcode            LIKE(TPL:Barcode)              !List box control field - type derived from field
TPL:Barcode_Style      LONG                           !Field style
TPL:Source             LIKE(TPL:Source)               !List box control field - type derived from field
TPL:Source_Style       LONG                           !Field style
TPL:Position           LIKE(TPL:Position)             !List box control field - type derived from field
TPL:Position_Style     LONG                           !Field style
TPL:Code               LIKE(TPL:Code)                 !List box control field - type derived from field
TPL:Code_Style         LONG                           !Field style
TPL:Relation           LIKE(TPL:Relation)             !List box control field - type derived from field
TPL:Relation_Style     LONG                           !Field style
TPL:Type               LIKE(TPL:Type)                 !Browse key field - type derived from field
TPL:Set                LIKE(TPL:Set)                  !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Micro Plate StandardsTemplates'),AT(0,0,506,341),FONT('Arial',11),RESIZE,GRAY,IMM, |
  HLP('templates')
                       OPTION,AT(206,7,235,18),USE(gloTestType),FONT(,,,FONT:bold),BOXED,TRN
                         RADIO('IgE'),AT(214,14,35,9),USE(?RastLabel),COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('1')
                         RADIO('IgG'),AT(252,14,35,9),USE(?gloTestType:Radio2),COLOR(COLOR:Blue),ICON(ICON:None),TRN, |
  VALUE('2')
                         RADIO('IgG4'),AT(290,14,35,9),USE(?gloTestType:Radio3),COLOR(COLOR:Yellow),ICON(ICON:None), |
  TRN,VALUE('3')
                         RADIO('IVG'),AT(328,14,35,9),USE(?gloTestType:Radio4),ICON(ICON:None),TRN,VALUE('7')
                         RADIO('IVM'),AT(366,14,35,9),USE(?gloTestType:Radio4:2),ICON(ICON:None),TRN,VALUE('8')
                         RADIO('TIgM'),AT(404,14,35,9),USE(?gloTestType:Radio4:3),ICON(ICON:None),HIDE,TRN,VALUE('6')
                       END
                       CHECK(' First Set'),AT(214,31),USE(gloSet),FONT(,,,FONT:bold),TRN,VALUE('1','0')
                       PROMPT('1st Source Position'),AT(214,41),USE(?locFirstRack:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n3),AT(286,41,25,10),USE(locFirstSource),RIGHT
                       OPTION('Sort'),AT(322,39,57,36),USE(locSort),FONT(,,,FONT:bold),BOXED,HIDE,TRN
                         RADIO('Patient'),AT(330,50),USE(?locSort:Radio1),ICON(ICON:None),TRN,VALUE('P')
                         RADIO('Code'),AT(330,63,41,11),USE(?locSort:Radio2),ICON(ICON:None),TRN,VALUE('C')
                       END
                       PROMPT('Micro Plate Wells'),AT(214,55),USE(?locWells:Prompt),FONT(,,,FONT:bold),TRN
                       ENTRY(@n6),AT(286,55,25,10),USE(locWells),RIGHT
                       LIST,AT(2,2,174,337),USE(?Browse:1),FONT(,8,,FONT:bold,CHARSET:DEFAULT),VSCROLL,FORMAT('32C(1)|MY~' & |
  'Barcode~C(0)@n06@29C|MY~Source~@n03@32C|MY~Position~@n03@39L(5)|MY~Code~C(0)@s5@4L(5' & |
  ')|MY~Relation~C(0)@s1@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records'),TRN
                       BUTTON('&Select'),AT(228,144,45,14),USE(?Select:2),HIDE
                       BUTTON('&Insert'),AT(392,161,70,25),USE(?Insert:3),LEFT,ICON('SteelAdd.ico'),TRN
                       BUTTON('&Change'),AT(392,220,70,25),USE(?Change:3),LEFT,ICON('SteelDelta.ico'),DEFAULT,TRN
                       BUTTON('&Delete'),AT(392,102,70,25),USE(?Delete:3),LEFT,ICON('SteelDelete.ico'),TRN
                       BUTTON('Close'),AT(392,279,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  DELAY(1),TRN
                       BUTTON('Help'),AT(0,297,45,14),USE(?Help),HIDE,HLP('templates')
                       IMAGE('button.jpg'),AT(392,102,70,25),USE(?Image4)
                       IMAGE('button.jpg'),AT(392,161,70,25),USE(?Image3)
                       IMAGE('button.jpg'),AT(392,220),USE(?Image2)
                       IMAGE('button.jpg'),AT(392,279,70,25),USE(?Image1)
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
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
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
  GlobalErrors.SetProcedureName('Templates')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?RastLabel
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('gloSet',gloSet)                           ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:template.Open                            ! File template used by this procedure, so make sure it's RelationManager is open
  Relate:wpSetup.Open                             ! File wpSetup used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:template,SELF) ! Initialize the browse manager
  SAV:TestType = 0
  gloTestType = 1
  SET(wpSetup,1)
  NEXT(wpSetup)
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon TPL:Set for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,TPL:KeyType) ! Add the sort order for TPL:KeyType for sort order 1
  BRW1.AddRange(TPL:Type,gloTestType)             ! Add single value range limit for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,TPL:Set,1,BRW1)       ! Initialize the browse locator using  using key: TPL:KeyType , TPL:Set
  BRW1.SetFilter('(TPL:Set = gloSet)')            ! Apply filter expression to browse
  BRW1.AddField(TPL:Barcode,BRW1.Q.TPL:Barcode)   ! Field TPL:Barcode is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Source,BRW1.Q.TPL:Source)     ! Field TPL:Source is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Position,BRW1.Q.TPL:Position) ! Field TPL:Position is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Code,BRW1.Q.TPL:Code)         ! Field TPL:Code is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Relation,BRW1.Q.TPL:Relation) ! Field TPL:Relation is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Type,BRW1.Q.TPL:Type)         ! Field TPL:Type is a hot field or requires assignment from browse
  BRW1.AddField(TPL:Set,BRW1.Q.TPL:Set)           ! Field TPL:Set is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','Templates',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,10,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
    0{PROP:Wallpaper} = gloWallPaper    
   OMIT('XXX')    
    CLEAR(TPL:Record)
    TPL:Type = 0   
    TPL:SET = 0   
    CNT# = 0
    TPL:Relation = 'Z'
    set(template,1) 
    IF ERRORCODE() then STOP('SET: ' & ERROR()).
    LOOP
      NEXT(template)       
      IF ERRORCODE() then break.
  !     STOP(TPL:TYPE & TPL:Set)  
      
      IF TPL:Type <> 7 AND TPL:Type <> 8 THEN CYCLE.  
      SAV:RECORD = TPL:Record
      ADD(SAVE)
      IF ERRORCODE() then STOP('SAVE: ' & ERROR()).
       CNT# += 1
    .  
    STOP('DONE ' & RECORDS(SAVE))
    LOOP I# = 1 TO RECORDS(SAVE)
      GET(SAVE,I#)
      TPL:Record = SAV:RECORD
      TPL:SET = 1
      ADD(TEMPLATE)
      TPL:SET = 1
      ADD(TEMPLATE)
    .  
    STOP() 
    
    XXX    
    
    
    
    
    
    
    
    
    
    
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
  IF INRANGE(SAV:TestType,1,9)
    WPS:FirstWell[SAV:TestType]   = locFirstWell
    WPS:FirstSource[SAV:TestType] = locFirstSource
    WPS:Wells[SAV:TestType] = locWells
    WPS:Sort[SAV:TestType] = locSort
  .
  PUT(wpSetup)
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:template.Close
    Relate:wpSetup.Close
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
    UpdateTemplate
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
    OF ?gloSet
      SELF.Reset(TRUE)
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?gloTestType
      BRW1.ResetFromFile
      
      IF INRANGE(SAV:TestType,1,9)
        WPS:FirstWell[SAV:TestType]   = locFirstWell
        WPS:FirstSource[SAV:TestType] = locFirstSource
        WPS:Wells[SAV:TestType]       = locWells
        WPS:Sort = locSort
      .
      
      IF INRANGE(gloTestType,1,9)
        locFirstWell   = WPS:FirstWell[gloTestType]
        locFirstSource = WPS:FirstSource[gloTestType]
        locWells       = WPS:Wells[gloTestType]
        locSort        = WPS:Sort
      .
      DISPLAY()
      SAV:TestType = gloTestType
      PUT(wpSetup)
    OF ?Help
      ThisWindow.Update
      HELP('WinPool.HLP','~templates')
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  SELF.SelectControl = ?Select:2
  SELF.HideSelect = 1                                      ! Hide the select button when disabled
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  SELF.Q.TPL:Barcode_Style = 1 ! 
  SELF.Q.TPL:Source_Style = 1 ! 
  SELF.Q.TPL:Position_Style = 1 ! 
  SELF.Q.TPL:Code_Style = 1 ! 
  SELF.Q.TPL:Relation_Style = 1 ! 


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

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
MakeDrop             PROCEDURE  (locTestType)              ! Declare Procedure
locPosition          SHORT                                 !
locCount             LONG                                  !
locPatientWell       SHORT                                 !
SAV:Patient          LONG                                  !
locSourcePosition    SHORT,DIM(2)                          !
locAdjustSource      SHORT                                 !
locSourceAdjustment  SHORT                                 !
locTestCount         SHORT                                 !
locLastWells         SHORT                                 !
loctestSetRecord     USHORT                                !
locSerum             STRING(2),DIM(2)                      !
locStandard     STRING(5),DIM(gloSetWells)
locBarcode      LONG,DIM(gloSetWells)
locSource       SHORT,DIM(gloSetWells)
locLastCode     STRING(5),DIM(gloSetWells)
locLastBarcode  LONG,DIM(gloSetWells)
locLastSource   SHORT,DIM(gloSetWells)

Drop    FILE,DRIVER('ASCII'),NAME(gloDropFileName),PRE(DRP),CREATE
          RECORD
Text      STRING(128)
        .  .

TestWells    QUEUE,PRE(TW)
Patient        LONG
Code           STRING(5)
Source         SHORT
             .

Window WINDOW('Drop File Creation'),AT(43,137,113,48),GRAY
       STRING('Filled Wells'),AT(4,28),USE(?String6)
       STRING(@n7),AT(56,28,30,8),USE(locTestCount)
       STRING('Patient Wells'),AT(4,4),USE(?String5)
       STRING(@n7),AT(56,4,30,8),USE(loctestSetRecord)
       STRING(@n7),AT(56,16,30,8),USE(gloTestWells)
       STRING('Total Set Wells'),AT(4,16),USE(?String4)
     END


  CODE
! This procedure creates a Drop file of the type (locTestType) passed from the calling procedure
! Procedure TesSet is called to get the tests to be added to the drop file
! When a Patient Test is added to the Drop File the Test Status (TST:Status) is changed to 'W'
!   TST:Status is the only field modified (only changes TST:Status to 'W') by this Procedure
! The existing TST:Status in not viewed, this procedure assumes that TST:Status was 'L' when added to the TestSet memory Queue by the TestSet procudure
  SHARE(Test)

  gloTestWells = WPS:Wells[locTestType]
  gloFirstSource = WPS:FirstSource[locTestType]
  IF ~gloTestWells OR ~locTestType
    STOP('CLICK IGNOR Wells=' & gloTestWells & ' Type=' & locTestType)
    RETURN(0)
  . 
  CLEAR(TPL:Record)
  TPL:Type = locTestType
  IF ~gloSetCount[locTestType]         ! IF FIRST SET THEN USE FIRST SET TEMPLATE
    gloSet = 1
  ELSE
    gloSet = 0
  .  
  locCount = 0
  TPL:Set = gloSet
  TPL:Relation = 'Z'
  SET(TPL:KeyType,TPL:KeyType)
  LOOP                                 ! Fill in array for controls
    NEXT(Template)
    IF TPL:Type <> locTestType OR ERRORCODE()THEN BREAK.
    IF ~INRANGE(TPL:Position,1,gloTestWells) THEN CYCLE. 
    IF TPL:Set <> gloSet THEN CYCLE.
    locCount += 1
  .  
  locTestCount = TestSet(gloTestWells - locCount,locTestType)  ! Adds Patient Tests to the TestSet memory Queue amd returns the number of tests put in the Queue
  IF ~locTestCount
    MESSAGE('Make Drop called with no Patient Wells to fill, TYPE: ' & locTestType)
    RETURN(0)
  .

  locSerum[1] = '-1'
  locSerum[2] = '-+'

  Access:Plates.Open
  gloDRPcount += 1
  OPEN(Window)
  DISPLAY()
  IF gloDRPcount > 100 THEN MESSAGE('Warning: Number of DROP Files exceeds 100')
    RETURN(0)
  .
  SHARE(Template)
  CLEAR(locStandard[])
  CLEAR(locSource[])
  CLEAR(locBarcode[])
  locLastWells = 0
  locPatientWell = 0
  PLT:FILENAME = SUB(FORMAT(TODAY(),@D11),2,5) & FORMAT(gloSetCount[locTestType],@N02) & CLIP(gloTypeID[locTestType])
  gloDropfileName = 'DROP\' & CLIP(PLT:FILENAME) & '.txt'
  OPEN(Drop)
  IF ERRORCODE()
    CREATE(Drop)
    IF ERRORCODE()
      MESSAGE('Create Drop: ' & ERROR())
      RETURN(0)
    .
    OPEN(Drop)
  ELSE
    MESSAGE('Drop File already exists: ' & gloDropFileName)
    RETURN(0)
  .

  SORT(TestSet,TS:Patient,TS:Code)

  HOUR# = CLOCK() / 360000
  MINUTES# = CLOCK() % 360000
  MINUTES# = MINUTES# / 6000
  DRP:Text = FORMAT(TODAY(),@D11) & '  ' & FORMAT(HOUR#,@N02) & '    ' & FORMAT(MINUTES#,@N02) & '    ' & gloDropFileName
  ADD(Drop)
  CLEAR(TPL:Record)
  TPL:Type = locTestType
  IF ~gloSetCount[locTestType]         ! IF FIRST SET THEN USE FIRST SET TEMPLATE
    gloSet = 1
  ELSE
    gloSet = 0
  .
  TPL:Set = gloSet
  TPL:Relation = 'Z'
  SET(TPL:KeyType,TPL:KeyType)
  LOOP                                 ! Fill in array for controls
    NEXT(Template)
  !  IF TPL:Type <> locTestType OR TPL:Set <> gloSet OR ERRORCODE()THEN BREAK.
    IF TPL:Type <> locTestType OR ERRORCODE()THEN BREAK.
    IF ~INRANGE(TPL:Position,1,gloTestWells) THEN CYCLE.
    gloTestWells -= 1
    IF TPL:Relation = 'S'
      locStandard[TPL:Position] = TPL:Code
      locBarcode[TPL:Position]  = TPL:Barcode
      locSource[TPL:Position]   = TPL:Source
    ELSIF TPL:Relation = 'E'
      locLastWells += 1
      locLastCode[TPL:Position]    = TPL:Code
      locLastBarcode[TPL:Position] = TPL:Barcode
      locLastSource[TPL:Position]  = TPL:Source
    .  
  .
  locTestSetRecord = 0
  DISPLAY()
  SAV:Patient = -1 ! set to unused value
  locSourcePosition[1] = WPS:FirstSource[locTestType] - 1 !Initialize
  locSourcePosition[2] = WPS:FirstSource[locTestType] - 1 !Initialize
  locAdjustSource = 0
  LOOP locPosition = 1 TO WPS:Wells[locTestType] - locLastWells
    IF locBarcode[locPosition]                                      ! check if locPosition is a controls well
      DRP:Text = locBarcode[locPosition] & '<9,9>' & | !4 spaces replace controls Source
                 locPosition & '<9>'    & |
                 locStandard[locPosition]
    ELSIF mdlOpenWells[locPosition]
      DRP:Text = FORMAT(TS:Patient,@N06) & locSerum[Pat:SpecimenType] & '<9>' & |
                 locSourcePosition[Pat:SpecimenType] & '<9>' & |
                 locPosition & '<9>' & mdlOpenWells[locPosition]   & '<9>' & |
                 FORMAT(Pat:CLIENT,@N06)  & '<9>' & Pat:AGE & '<9>' & Pat:AGE_TYPE & '<9>' & CLIP(PAT:LAST) & '<9>' & PAT:FIRST
    ELSE
      locTestSetRecord += 1
      GET(TestSet,locTestSetRecord)
      IF ERRORCODE()
        BREAK
      .
      IF TS:Patient <> SAV:Patient
        IF locAdjustSource AND locSourceAdjustment
          locSourcePosition[Pat:SpecimenType] -= locAdjustSource
          locSourceAdjustment = FALSE
        .
        PAT:Invoice = TS:Patient
        GET(Patient,Pat:INVOICE_KEY)
        locSourcePosition[Pat:SpecimenType] += 1 + locAdjustSource
        locAdjustSource = 0
        SAV:Patient = TS:Patient
      .
      IF TS:Code = '100-1'  OR  TS:Code = '100-4'
        locSourcePosition[Pat:SpecimenType] += 1
        locAdjustSource += 1
        locSourceAdjustment = TRUE
      ELSIF TS:Code = '100-2' OR  TS:Code = '100-5'
        locSourcePosition[Pat:SpecimenType] += 1
        locAdjustSource += 1
        locSourceAdjustment = TRUE
      ELSIF locAdjustSource AND locSourceAdjustment
        locSourcePosition[Pat:SpecimenType] -= locAdjustSource
        locSourceAdjustment = FALSE
      .
      DRP:Text = FORMAT(TS:Patient,@N06) & locSerum[Pat:SpecimenType] & '<9>' & |
                 locSourcePosition[Pat:SpecimenType] & '<9>' & |
                 locPosition & '<9>' & CLIP(TS:Code)   & '<9>' & |
                 FORMAT(Pat:CLIENT,@N06)  & '<9>' & Pat:AGE & '<9>' & Pat:AGE_TYPE & '<9>' & CLIP(PAT:LAST) & '<9>' & PAT:FIRST
      locPatientWell += 1
      TST:Invoice = TS:Patient
      TST:Code = TS:Code
      TST:Type = locTestType
      GET(Test,TST:Order_Key)
      IF ERRORCODE()
        STOP('DROP GET TST: ' & ERROR())
      ELSE
        TST:Status = 'W'
        PUT(Test)
        IF ERRORCODE()
          STOP('DROP PUT TST: ' & ERROR())
        .
      .
    .
    ADD(Drop)
    DISPLAY()
  .
  LOOP I# = 1 TO locLastWells
    DRP:Text = FORMAT(locLastBarcode[I#],@N06) & '<9,9>' & FORMAT(locPosition,@n_6) & '<9>' & locLastCode[I#]
   !            FORMAT(locLastSource[I#],@n_4) & |  Replaced by first 4 spaces in above
               
    ADD(Drop)
    DISPLAY()
  .
  CLOSE(Drop)
  PLT:DATE = TODAY()
  PLT:TYPE = locTestType
  Access:Plates.Insert
  Access:Plates.Close

  gloSetCount[locTestType] += 1
  RETURN(locPatientWell)














!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
CheckQNS             PROCEDURE  (prmPatient)               ! Declare Procedure
locResult            BYTE                                  !

  CODE
! Checks for Patient QNS for patient indicated by MON:Patient
! Returns TRUE if QNS or FALSE if not.
! Sets PAT:Status to Q if QNS
! Counts for volume analysis
  CLEAR(MON:Needed[])
  CLEAR(MON:Volume[])
  locResult = 0
  SHARE(Test)
  CLEAR(TST:Record)
  TST:Invoice = prmPatient
  SET(TST:ORDER_KEY,TST:ORDER_KEY)
  LOOP UNTIL EOF(Test)
    NEXT(Test)
    IF TST:Invoice <> prmPatient THEN BREAK.
    IF TST:Status = 'Q' OR TST:Status = 'X' OR TST:Status = 'B' OR TST:Status = 'R' THEN CYCLE.
    IF TST:TYPE
      CASE TST:TYPE
      OF 1
        MON:Volume[1] += 1
      OF 2
        MON:Volume[2] += 1
      OF 3
        MON:Volume[3] += 1
      .
    .
  .
  MON:Needed[1] = MON:Volume[1] * 60 + (MON:Volume[2] + MON:Volume[3])
  MON:Needed[2] = MON:Volume[1] * 50 + (MON:Volume[2] + MON:Volume[3])
  MON:Needed[3] = MON:Volume[1] * 40 + (MON:Volume[2] + MON:Volume[3])
  PAT:NEEDED = MON:Needed[1]
  IF PAT:NEEDED/1000 > PAT:VOLUME
    locResult += 1
  .
  IF MON:Needed[2]/1000 > PAT:VOLUME
    locResult += 2
  .
  IF MON:Needed[3]/1000 > PAT:VOLUME
    locResult += 4
  .
  RETURN(locResult)

!!! <summary>
!!! Generated from procedure template - Report
!!! Report the monitor File
!!! </summary>
SummaryReport PROCEDURE 

Progress:Thermometer BYTE                                  !
locPatientCount      BYTE                                  !
locFollowUp          STRING(5)                             !
locBilling           STRING(9)                             !
locTotalG            STRING(3)                             !
locTotalA            STRING(3)                             !
locTotalM            STRING(3)                             !
locPrintTime         TIME                                  !
locPrintDate         DATE                                  !
locFax               STRING(5)                             !
locEmail             STRING(5)                             !
locPostal            STRING(5)                             !
locReportType        STRING(6)                             !
locLineNumber        USHORT                                !
locTypeHeader        STRING(6)                             !
locClientName        STRING(40)                            !
Process:View         VIEW(Monitor)
                       PROJECT(MON:PATIENT)
                     END
EnhancedFocusManager EnhancedFocusClassType
ProgressWindow       WINDOW('Report monitor'),AT(,,142,59),FONT('Arial',10,COLOR:Black,FONT:regular),DOUBLE,CENTER, |
  GRAY,TIMER(1)
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Monitor Report'),AT(,1470,10500,6333),PRE(RPT),PAPER(PAPER:LETTER),LANDSCAPE,FONT('Arial', |
  10,COLOR:Black,FONT:regular,CHARSET:ANSI),THOUS
                       HEADER,AT(0,1000,10500,500)
                       END
AllHead                DETAIL,AT(250,250,10500,1229),USE(?AllHeader)
                         STRING(@d17),AT(802,-10),USE(locPrintDate),TRN
                         STRING('Printed'),AT(302,-10),USE(?String32),TRN
                         STRING(@t7),AT(1594,-10),USE(locPrintTime),TRN
                         STRING('ALL'),AT(8156,10,1625,563),USE(?AllReportType),FONT(,18,,FONT:bold,CHARSET:ANSI),TRN
                         STRING('Comments:_{94}'),AT(615,479,7563,208),USE(?String4),TRN
                         STRING('_{100}'),AT(1281,720,6896,208),USE(?String39),TRN
                         STRING('Accession#'),AT(2313,1052),USE(?String22),TRN
                         STRING('Name'),AT(3948,1052),USE(?String25),TRN
                         STRING('TIgG   TIgA   TIgM'),AT(5917,1052),USE(?String41),TRN
                         STRING('Billing'),AT(1354,1052,677,208),USE(?String21),CENTER,TRN
                         STRING('Up'),AT(615,1042,385,208),USE(?String20),CENTER,TRN
                         STRING('Follow'),AT(615,896),USE(?String19),TRN
                         STRING('Client#'),AT(3104,1052),USE(?String24),TRN
                         STRING('(must equal listing below)'),AT(2958,125),USE(?String15),FONT(,8),TRN
                         STRING('Total # Request forms: _{10}'),AT(2958,-10),USE(?String3),FONT(,,,,CHARSET:ANSI),TRN
                         STRING(@pNo. Patients: <<#p),AT(5146,-10),USE(locPatientCount),FONT(,,COLOR:Red,,CHARSET:ANSI), |
  TRN
                         LINE,AT(1,1220,10500,0),USE(?HeadEndLine)
                       END
Header                 DETAIL,AT(250,250,10500,1229),USE(?Header)
                         STRING(@d17),AT(802,10),USE(locPrintDate,,?PrintDate),TRN
                         STRING('Printed'),AT(302,10),USE(?String32:2),TRN
                         STRING(@t7),AT(1594,10),USE(locPrintTime,,?PrintTime),TRN
                         STRING(@s6),AT(8156,10,1625,563),USE(locReportType,,?Reporttype),FONT(,18,,FONT:bold,CHARSET:ANSI), |
  TRN
                         STRING('Comments:_{94}'),AT(615,479,7563,208),USE(?String4:2),TRN
                         STRING('_{100}'),AT(1281,720,6896,208),USE(?String39:2),TRN
                         STRING('Initials    Comments'),AT(5917,1063),USE(?String49:2),TRN
                         STRING('Accession#'),AT(2313,1052),USE(?String22:2),TRN
                         STRING('Name'),AT(3948,1052),USE(?String25:2),TRN
                         STRING('Billing'),AT(1354,1052,677,208),USE(?String21:2),CENTER,TRN
                         STRING('Client#'),AT(3104,1052),USE(?String24:2),TRN
                         LINE,AT(1,1220,10500,0),USE(?HeadEndLine:2)
                       END
AllDetail              DETAIL,AT(250,,10479,177),USE(?AllDetail)
                         STRING(@s3),AT(594,0,400,150),USE(locFollowUp),FONT(,10,COLOR:Red,FONT:bold),CENTER,TRN
                         STRING(@s9),AT(1354,0,677,146),USE(locBilling),TRN
                         STRING(@n_6),AT(2302,0,708,150),USE(MON:PATIENT),CENTER,TRN
                         STRING(@n_6),AT(3104,0,625,150),USE(Pat:CLIENT),TRN
                         STRING(@s40),AT(3948,0,1927,150),USE(locClientName),TRN
                         STRING(@s3),AT(6000,0),USE(locTotalG),TRN
                         STRING(@s3),AT(6400,0),USE(locTotalA),TRN
                         STRING(@s3),AT(6800,0),USE(locTotalM),TRN
                         STRING(@n4),AT(52,21),USE(locLineNumber),TRN
                         LINE,AT(1,170,10500,0),USE(?DetailEndLine)
                         LINE,AT(430,0,0,170),USE(?DivLine0)
                         LINE,AT(1,176,10500,0),USE(?AllDetailLine)
                       END
Detail                 DETAIL,AT(250,,10479,177),USE(?Detail)
                         STRING(@s9),AT(1354,0,677,146),USE(locBilling,,?locBilling:3),TRN
                         STRING(@n_6),AT(2302,0,708,150),USE(MON:PATIENT,,?MON:PATIENT:3),CENTER,TRN
                         STRING(@n_6),AT(3104,0,625,150),USE(Pat:CLIENT,,?Pat:CLIENT:3),TRN
                         STRING(@s40),AT(3948,0,1927,150),USE(locClientName,,?locClientName:2),TRN
                         LINE,AT(5900,1,0,175),USE(?DivLine1),COLOR(COLOR:Black)
                         LINE,AT(6302,1,0,175),USE(?DivLine1:3),COLOR(COLOR:Black)
                         LINE,AT(1,176,10500,0),USE(?DetailLine)
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
  GlobalErrors.SetProcedureName('SummaryReport')
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
  Relate:Monitor.Open                                      ! File Monitor used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('SummaryReport',ProgressWindow)             ! Restore window settings from non-volatile store
  TargetSelector.AddItem(TXTReporter.IReportGenerator)
  SELF.AddItem(TargetSelector)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  ProgressMgr.Init(ScrollSort:AllowNumeric,)
  ThisReport.Init(Process:View, Relate:Monitor, ?Progress:PctText, Progress:Thermometer, ProgressMgr, MON:PATIENT)
  ThisReport.AddSortOrder(MON:ORDERKEY)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Monitor.SetQuickScan(1,Propagate:OneMany)
  SELF.SkipPreview = True
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  locPrintTime = CLOCK()
  locPrintDate = TODAY()
  locPatientCount = RECORDS(Monitor)
  0{PROP:Wallpaper} = gloWallpaper
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
    Relate:Monitor.Close
  END
  IF SELF.Opened
    INIMgr.Update('SummaryReport',ProgressWindow)          ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  SYSTEM{PROP:PrintMode} = 3
  ReturnValue = PARENT.OpenReport()
    SETTARGET(Report)
    CASE gloReportType
    OF TYPE:Postal
      Report{PROP:Text} = 'Postal'
      locReportType =  'Postal'
      PRINT(RPT:Header)
    OF TYPE:Fax
      Report{PROP:Text} = 'Fax'
      locReportType = 'Fax'
      PRINT(RPT:Header)
    OF TYPE:Email
      Report{PROP:Text} = 'eMail'
      locReportType =  'eMail'
      PRINT(RPT:Header)
    OF TYPE:All
      Report{PROP:Text} = 'All'
      PRINT(RPT:AllHead)
    .
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
  !TYPE:Postal EQUATE(4)
  !TYPE:Fax    EQUATE(2)
  !TYPE:eMail  EQUATE(1)
  !TYPE:All    EQUATE(0)
  
  PAT:INVOICE = MON:PATIENT
  GET(Patient,PAT:INVOICE_KEY)
  !if errorcode() then stop(error()).
  CLI:NUMBER = PAT:CLIENT
  GET(Client,CLI:ORDER_KEY)
  !if errorcode() then stop(error()).
  
  locClientName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  
  CASE PAT:Billing
  OF 'C'
    locBilling = 'Client'
  OF 'P'
    locBilling = 'Patient'
  OF 'I'
    locBilling = 'Insurance'
  OF 'A'
    locBilling = 'Medicaid'
  OF 'M'
    locBilling = 'Medicare'
  ELSE
    locBilling = '???????'
  .
  
  IF gloReportType = TYPE:Postal
    IF  CLI:Postal = '1' THEN CLI:Postal = 'Y'; PUT(Client).
    IF  CLI:Postal = '0' THEN CLI:Postal = 'N'; PUT(Client).
  
    IF CLI:Postal = CLIENT:Postal_Y
      PRINT(RPT:Detail)
    ELSE
      ReturnValue = Level:Benign
      RETURN ReturnValue
    .
  .
  IF gloReportType = TYPE:Fax 
    IF CLI:FaxReport
      PRINT(RPT:Detail)
    ELSE
      ReturnValue = Level:Benign
      RETURN ReturnValue
    .
  .
  IF gloReportType = TYPE:eMail 
    IF CLI:EmailReport
      PRINT(RPT:Detail)
    ELSE
      ReturnValue = Level:Benign
      RETURN ReturnValue
    .
  .
  IF gloReportType = TYPE:All
  
    IF CLI:FOLLOW
      locFollowUp = ''
    ELSE
      locFollowUp = '---'
    .
    IF MON:Count[4]
      locTotalG = 'Yes'
    ELSE
      locTotalG = '---'
    .
    IF MON:Count[5]
      locTotalA = 'Yes'
    ELSE
      locTotalA = '---'
    .
    IF MON:Count[6]
      locTotalM = 'Yes'
    ELSE
      locTotalM = '---'
    .
    locLineNumber += 1
    PRINT(RPT:AllDetail)
  .
  
  OMIT('XXXX')
  PRINT(RPT:AllHead)
  PRINT(RPT:Header)
  PRINT(RPT:AllDetail)
  PRINT(RPT:Detail)
  XXXX
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the monitor file
!!! </summary>
MonitorTable PROCEDURE 

CurrentTab           STRING(80)                            !
locDate              DATE                                  !
SAV:Date             DATE                                  !
BRW1::View:Browse    VIEW(Monitor)
                       PROJECT(MON:Spanish)
                       PROJECT(MON:PATIENT)
                       PROJECT(MON:NAME)
                       PROJECT(MON:LoginDate)
                       PROJECT(MON:STATUS)
                       PROJECT(MON:AGE)
                       PROJECT(MON:SerumReceived)
                       PROJECT(MON:Needed)
                       PROJECT(MON:COUNT)
                       PROJECT(MON:SORT)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MON:Spanish            LIKE(MON:Spanish)              !List box control field - type derived from field
MON:Spanish_NormalFG   LONG                           !Normal forground color
MON:Spanish_NormalBG   LONG                           !Normal background color
MON:Spanish_SelectedFG LONG                           !Selected forground color
MON:Spanish_SelectedBG LONG                           !Selected background color
MON:Spanish_Icon       LONG                           !Entry's icon ID
MON:Spanish_Style      LONG                           !Field style
MON:PATIENT            LIKE(MON:PATIENT)              !List box control field - type derived from field
MON:PATIENT_NormalFG   LONG                           !Normal forground color
MON:PATIENT_NormalBG   LONG                           !Normal background color
MON:PATIENT_SelectedFG LONG                           !Selected forground color
MON:PATIENT_SelectedBG LONG                           !Selected background color
MON:PATIENT_Style      LONG                           !Field style
MON:NAME               LIKE(MON:NAME)                 !List box control field - type derived from field
MON:NAME_NormalFG      LONG                           !Normal forground color
MON:NAME_NormalBG      LONG                           !Normal background color
MON:NAME_SelectedFG    LONG                           !Selected forground color
MON:NAME_SelectedBG    LONG                           !Selected background color
MON:NAME_Style         LONG                           !Field style
MON:LoginDate          LIKE(MON:LoginDate)            !List box control field - type derived from field
MON:LoginDate_NormalFG LONG                           !Normal forground color
MON:LoginDate_NormalBG LONG                           !Normal background color
MON:LoginDate_SelectedFG LONG                         !Selected forground color
MON:LoginDate_SelectedBG LONG                         !Selected background color
MON:LoginDate_Style    LONG                           !Field style
MON:STATUS             LIKE(MON:STATUS)               !List box control field - type derived from field
MON:STATUS_NormalFG    LONG                           !Normal forground color
MON:STATUS_NormalBG    LONG                           !Normal background color
MON:STATUS_SelectedFG  LONG                           !Selected forground color
MON:STATUS_SelectedBG  LONG                           !Selected background color
MON:STATUS_Style       LONG                           !Field style
MON:AGE                LIKE(MON:AGE)                  !List box control field - type derived from field
MON:AGE_NormalFG       LONG                           !Normal forground color
MON:AGE_NormalBG       LONG                           !Normal background color
MON:AGE_SelectedFG     LONG                           !Selected forground color
MON:AGE_SelectedBG     LONG                           !Selected background color
MON:AGE_Style          LONG                           !Field style
MON:SerumReceived      LIKE(MON:SerumReceived)        !List box control field - type derived from field
MON:SerumReceived_NormalFG LONG                       !Normal forground color
MON:SerumReceived_NormalBG LONG                       !Normal background color
MON:SerumReceived_SelectedFG LONG                     !Selected forground color
MON:SerumReceived_SelectedBG LONG                     !Selected background color
MON:SerumReceived_Style LONG                          !Field style
MON:Needed_1           DECIMAL(5,1)                   !List box control field - type derived from field (Array Component)
MON:Needed_1_NormalFG  LONG                           !Normal forground color
MON:Needed_1_NormalBG  LONG                           !Normal background color
MON:Needed_1_SelectedFG LONG                          !Selected forground color
MON:Needed_1_SelectedBG LONG                          !Selected background color
MON:Needed_1_Style     LONG                           !Field style
MON:Needed_2           DECIMAL(5,1)                   !List box control field - type derived from field (Array Component)
MON:Needed_2_NormalFG  LONG                           !Normal forground color
MON:Needed_2_NormalBG  LONG                           !Normal background color
MON:Needed_2_SelectedFG LONG                          !Selected forground color
MON:Needed_2_SelectedBG LONG                          !Selected background color
MON:Needed_2_Style     LONG                           !Field style
MON:Needed_3           DECIMAL(5,1)                   !List box control field - type derived from field (Array Component)
MON:Needed_3_NormalFG  LONG                           !Normal forground color
MON:Needed_3_NormalBG  LONG                           !Normal background color
MON:Needed_3_SelectedFG LONG                          !Selected forground color
MON:Needed_3_SelectedBG LONG                          !Selected background color
MON:Needed_3_Style     LONG                           !Field style
MON:COUNT_1            SHORT                          !List box control field - type derived from field (Array Component)
MON:COUNT_1_NormalFG   LONG                           !Normal forground color
MON:COUNT_1_NormalBG   LONG                           !Normal background color
MON:COUNT_1_SelectedFG LONG                           !Selected forground color
MON:COUNT_1_SelectedBG LONG                           !Selected background color
MON:COUNT_1_Style      LONG                           !Field style
MON:COUNT_3            SHORT                          !List box control field - type derived from field (Array Component)
MON:COUNT_3_NormalFG   LONG                           !Normal forground color
MON:COUNT_3_NormalBG   LONG                           !Normal background color
MON:COUNT_3_SelectedFG LONG                           !Selected forground color
MON:COUNT_3_SelectedBG LONG                           !Selected background color
MON:COUNT_3_Style      LONG                           !Field style
MON:COUNT_2            SHORT                          !List box control field - type derived from field (Array Component)
MON:COUNT_2_NormalFG   LONG                           !Normal forground color
MON:COUNT_2_NormalBG   LONG                           !Normal background color
MON:COUNT_2_SelectedFG LONG                           !Selected forground color
MON:COUNT_2_SelectedBG LONG                           !Selected background color
MON:COUNT_2_Style      LONG                           !Field style
MON:SORT               LIKE(MON:SORT)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Workpool Summary'),AT(0,0,510,340),FONT('Arial',11,,FONT:regular),RESIZE,ICON('Allermetrix.ico'), |
  GRAY,IMM,HLP('MonitorTable'),SYSTEM
                       LIST,AT(2,56,396,238),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold),VSCROLL,COLOR(,COLOR:Blue, |
  COLOR:White),FORMAT('12R(2)|M*IY@n3@36R(2)|M*Y~Patient~C(0)@p### ###p@80L(2)|M*Y~Name' & |
  '~@s32@47R(2)|M*Y~Login Date~C(0)@d17@32C|M*Y~Status~@s1@16R|M*Y~Age~C@n3@20R(2)|M*Y~' & |
  'Vrcv~C(0)@n5.1@24R(2)|M*Y~Need~C(0)@n6@24R(2)|M*Y~50~C(0)@n6@24R(2)|M*Y~40~C(0)@n6@2' & |
  '2R|M*Y~IgE~C@n3@22R|M*Y~IgG4~C@n3@28R|M*Y~IgG~C@n3@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he monitor file'),TRN
                       BUTTON('Print Summary'),AT(412,140,70,25),USE(?PrintSummary),FONT(,10,,FONT:bold),LEFT,ICON('EXP_DOTM.ico'), |
  TRN
                       BUTTON('&Change'),AT(0,328,49,14),USE(?Change:4),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,HIDE, |
  MSG('Change the Record'),TIP('Change the Record')
                       SHEET,AT(2,40,396,254),USE(?CurrentTab),SPREAD
                         TAB('Sort by Patient'),USE(?Tab:2),FONT(,,,FONT:bold)
                           STRING(@s128),AT(-4,316,428,10),USE(gloFileName),FONT(,,,FONT:bold),LEFT,TRN
                         END
                         TAB('Sort by Status'),USE(?Tab:3),FONT(,,,FONT:bold)
                         END
                       END
                       BUTTON('Done'),AT(412,220,70,25),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),TIP('Close Window'),TRN
                       IMAGE('Button.jpg'),AT(412,220,70,25),USE(?Image1)
                       IMAGE('button.jpg'),AT(412,140,70,25),USE(?Image2)
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
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepLongClass                        ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
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
  GlobalErrors.SetProcedureName('MonitorTable')
    gloFileName = '..\data\monitor' & FORMAT(TODAY(),@D11) & '.tps'
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('MON:Needed_1',MON:Needed[1])              ! Added by: BrowseBox(ABC)
  BIND('MON:Needed_2',MON:Needed[2])              ! Added by: BrowseBox(ABC)
  BIND('MON:Needed_3',MON:Needed[3])              ! Added by: BrowseBox(ABC)
  BIND('MON:COUNT_1',MON:COUNT[1])                ! Added by: BrowseBox(ABC)
  BIND('MON:COUNT_3',MON:COUNT[3])                ! Added by: BrowseBox(ABC)
  BIND('MON:COUNT_2',MON:COUNT[2])                ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  Relate:Monitor.Open                             ! File Monitor used by this procedure, so make sure it's RelationManager is open
  Relate:Patient.Open                             ! File Patient used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Monitor,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?CurrentTab{PROP:NoTheme} = True
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon MON:STATUS for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,MON:STATUSKEY) ! Add the sort order for MON:STATUSKEY for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,MON:STATUS,1,BRW1)    ! Initialize the browse locator using  using key: MON:STATUSKEY , MON:STATUS
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon MON:PATIENT for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,MON:ORDERKEY) ! Add the sort order for MON:ORDERKEY for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,MON:PATIENT,1,BRW1)   ! Initialize the browse locator using  using key: MON:ORDERKEY , MON:PATIENT
  ?Browse:1{PROP:IconList,1} = '~en.ico'
  ?Browse:1{PROP:IconList,2} = '~mx.ico'
  BRW1.AddField(MON:Spanish,BRW1.Q.MON:Spanish)   ! Field MON:Spanish is a hot field or requires assignment from browse
  BRW1.AddField(MON:PATIENT,BRW1.Q.MON:PATIENT)   ! Field MON:PATIENT is a hot field or requires assignment from browse
  BRW1.AddField(MON:NAME,BRW1.Q.MON:NAME)         ! Field MON:NAME is a hot field or requires assignment from browse
  BRW1.AddField(MON:LoginDate,BRW1.Q.MON:LoginDate) ! Field MON:LoginDate is a hot field or requires assignment from browse
  BRW1.AddField(MON:STATUS,BRW1.Q.MON:STATUS)     ! Field MON:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(MON:AGE,BRW1.Q.MON:AGE)           ! Field MON:AGE is a hot field or requires assignment from browse
  BRW1.AddField(MON:SerumReceived,BRW1.Q.MON:SerumReceived) ! Field MON:SerumReceived is a hot field or requires assignment from browse
  BRW1.AddField(MON:Needed[1],BRW1.Q.MON:Needed_1) ! Field MON:Needed[1] is a hot field or requires assignment from browse
  BRW1.AddField(MON:Needed[2],BRW1.Q.MON:Needed_2) ! Field MON:Needed[2] is a hot field or requires assignment from browse
  BRW1.AddField(MON:Needed[3],BRW1.Q.MON:Needed_3) ! Field MON:Needed[3] is a hot field or requires assignment from browse
  BRW1.AddField(MON:COUNT[1],BRW1.Q.MON:COUNT_1)  ! Field MON:COUNT[1] is a hot field or requires assignment from browse
  BRW1.AddField(MON:COUNT[3],BRW1.Q.MON:COUNT_3)  ! Field MON:COUNT[3] is a hot field or requires assignment from browse
  BRW1.AddField(MON:COUNT[2],BRW1.Q.MON:COUNT_2)  ! Field MON:COUNT[2] is a hot field or requires assignment from browse
  BRW1.AddField(MON:SORT,BRW1.Q.MON:SORT)         ! Field MON:SORT is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','MonitorTable',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,79,LFM_CFile,LFM_CFile.Record)
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
    Relate:Monitor.Close
    Relate:Patient.Close
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
    GetPatient(MON:Patient)
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
    OF ?PrintSummary
      ThisWindow.Update
        gloReportType = TYPE:All
        SummaryReport
        HOLD# = CLOCK() + 200
        LOOP WHILE CLOCK() < HOLD# .
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.ChangeControl=?Change:4
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (MON:Status = 'H')
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set conditional color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = 255
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set conditional color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = 255
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set conditional color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = 255
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set conditional color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = 255
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set conditional color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = 255
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set conditional color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = 255
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set conditional color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = 255
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set conditional color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = 255
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set conditional color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = 255
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set conditional color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = 255
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set conditional color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = 255
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set conditional color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = 255
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set conditional color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = 255
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  ELSIF (MON:Status = 'Q')
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set conditional color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = 16776960
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set conditional color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = 16776960
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set conditional color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = 16776960
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set conditional color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = 16776960
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set conditional color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = 16776960
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set conditional color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = 16776960
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set conditional color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = 16776960
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set conditional color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = 16776960
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set conditional color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = 16776960
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set conditional color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = 16776960
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set conditional color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = 16776960
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set conditional color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = 16776960
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set conditional color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = 16776960
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  ELSIF (MON:Status = 'V')
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set conditional color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = 12582911
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set conditional color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = 12582911
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set conditional color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = 12582911
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set conditional color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = 12582911
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set conditional color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = 12582911
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set conditional color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = 12582911
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set conditional color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = 12582911
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set conditional color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = 12582911
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set conditional color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = 12582911
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set conditional color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = 12582911
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set conditional color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = 12582911
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set conditional color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = 12582911
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set conditional color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = 12582911
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  ELSIF (MON:Status = 'W')
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set conditional color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = 11206570
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set conditional color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = 11206570
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set conditional color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = 11206570
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set conditional color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = 11206570
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set conditional color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = 11206570
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set conditional color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = 11206570
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set conditional color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = 11206570
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set conditional color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = 11206570
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set conditional color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = 11206570
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set conditional color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = 11206570
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set conditional color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = 11206570
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set conditional color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = 11206570
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set conditional color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = 11206570
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  ELSIF (MON:Status = 'L')
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set conditional color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = 65535
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set conditional color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = 65535
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set conditional color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = 65535
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set conditional color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = 65535
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set conditional color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = 65535
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set conditional color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = 65535
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set conditional color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = 65535
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set conditional color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = 65535
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set conditional color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = 65535
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set conditional color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = 65535
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set conditional color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = 65535
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set conditional color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = 65535
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set conditional color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = 65535
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  ELSE
    SELF.Q.MON:Spanish_NormalFG = -1                       ! Set color values for MON:Spanish
    SELF.Q.MON:Spanish_NormalBG = -1
    SELF.Q.MON:Spanish_SelectedFG = -1
    SELF.Q.MON:Spanish_SelectedBG = -1
    SELF.Q.MON:PATIENT_NormalFG = -1                       ! Set color values for MON:PATIENT
    SELF.Q.MON:PATIENT_NormalBG = -1
    SELF.Q.MON:PATIENT_SelectedFG = -1
    SELF.Q.MON:PATIENT_SelectedBG = -1
    SELF.Q.MON:NAME_NormalFG = -1                          ! Set color values for MON:NAME
    SELF.Q.MON:NAME_NormalBG = -1
    SELF.Q.MON:NAME_SelectedFG = -1
    SELF.Q.MON:NAME_SelectedBG = -1
    SELF.Q.MON:LoginDate_NormalFG = -1                     ! Set color values for MON:LoginDate
    SELF.Q.MON:LoginDate_NormalBG = -1
    SELF.Q.MON:LoginDate_SelectedFG = -1
    SELF.Q.MON:LoginDate_SelectedBG = -1
    SELF.Q.MON:STATUS_NormalFG = -1                        ! Set color values for MON:STATUS
    SELF.Q.MON:STATUS_NormalBG = -1
    SELF.Q.MON:STATUS_SelectedFG = -1
    SELF.Q.MON:STATUS_SelectedBG = -1
    SELF.Q.MON:AGE_NormalFG = -1                           ! Set color values for MON:AGE
    SELF.Q.MON:AGE_NormalBG = -1
    SELF.Q.MON:AGE_SelectedFG = -1
    SELF.Q.MON:AGE_SelectedBG = -1
    SELF.Q.MON:SerumReceived_NormalFG = -1                 ! Set color values for MON:SerumReceived
    SELF.Q.MON:SerumReceived_NormalBG = -1
    SELF.Q.MON:SerumReceived_SelectedFG = -1
    SELF.Q.MON:SerumReceived_SelectedBG = -1
    SELF.Q.MON:Needed_1_NormalFG = -1                      ! Set color values for MON:Needed_1
    SELF.Q.MON:Needed_1_NormalBG = -1
    SELF.Q.MON:Needed_1_SelectedFG = -1
    SELF.Q.MON:Needed_1_SelectedBG = -1
    SELF.Q.MON:Needed_2_NormalFG = -1                      ! Set color values for MON:Needed_2
    SELF.Q.MON:Needed_2_NormalBG = -1
    SELF.Q.MON:Needed_2_SelectedFG = -1
    SELF.Q.MON:Needed_2_SelectedBG = -1
    SELF.Q.MON:Needed_3_NormalFG = -1                      ! Set color values for MON:Needed_3
    SELF.Q.MON:Needed_3_NormalBG = -1
    SELF.Q.MON:Needed_3_SelectedFG = -1
    SELF.Q.MON:Needed_3_SelectedBG = -1
    SELF.Q.MON:COUNT_1_NormalFG = -1                       ! Set color values for MON:COUNT_1
    SELF.Q.MON:COUNT_1_NormalBG = -1
    SELF.Q.MON:COUNT_1_SelectedFG = -1
    SELF.Q.MON:COUNT_1_SelectedBG = -1
    SELF.Q.MON:COUNT_3_NormalFG = -1                       ! Set color values for MON:COUNT_3
    SELF.Q.MON:COUNT_3_NormalBG = -1
    SELF.Q.MON:COUNT_3_SelectedFG = -1
    SELF.Q.MON:COUNT_3_SelectedBG = -1
    SELF.Q.MON:COUNT_2_NormalFG = -1                       ! Set color values for MON:COUNT_2
    SELF.Q.MON:COUNT_2_NormalBG = -1
    SELF.Q.MON:COUNT_2_SelectedFG = -1
    SELF.Q.MON:COUNT_2_SelectedBG = -1
  END
  SELF.Q.MON:Spanish_Style = 1 ! 
  SELF.Q.MON:PATIENT_Style = 1 ! 
  SELF.Q.MON:NAME_Style = 1 ! 
  SELF.Q.MON:LoginDate_Style = 1 ! 
  SELF.Q.MON:STATUS_Style = 1 ! 
  SELF.Q.MON:AGE_Style = 1 ! 
  SELF.Q.MON:SerumReceived_Style = 1 ! 
  SELF.Q.MON:Needed_1_Style = 1 ! 
  SELF.Q.MON:Needed_2_Style = 1 ! 
  SELF.Q.MON:Needed_3_Style = 1 ! 
  SELF.Q.MON:COUNT_1_Style = 1 ! 
  SELF.Q.MON:COUNT_3_Style = 1 ! 
  SELF.Q.MON:COUNT_2_Style = 1 ! 
  IF (MON:Spanish)
    SELF.Q.MON:Spanish_Icon = 2                            ! Set icon from icon list
  ELSE
    SELF.Q.MON:Spanish_Icon = 1                            ! Set icon from icon list
  END
  IF BAND(PAT:Attributes,PAT:AgeNeeded) THEN  SELF.Q.MON:AGE_NormalBG = COLOR:RED; SELF.Q.MON:AGE_SelectedBG = COLOR:RED.
    IF MON:Needed[1] > MON:SerumReceived
      SELF.Q.MON:Needed_1_NormalFG = COLOR:White                      ! Set conditional color values for MON:Needed_2
      SELF.Q.MON:Needed_1_NormalBG = COLOR:Red
      IF MON:Needed[2] > MON:SerumReceived
        SELF.Q.MON:Needed_2_NormalFG = COLOR:White                    ! Set conditional color values for MON:Needed_2
        SELF.Q.MON:Needed_2_NormalBG = COLOR:Red
      ELSE
        SELF.Q.MON:Needed_2_NormalFG = COLOR:Black                      ! Set conditional color values for MON:Needed_2
        SELF.Q.MON:Needed_2_NormalBG = COLOR:Lime
      .
      IF MON:Needed[3] > MON:SerumReceived
        SELF.Q.MON:Needed_3_NormalFG = COLOR:White                      ! Set conditional color values for MON:Needed_2
        SELF.Q.MON:Needed_3_NormalBG = COLOR:Lime
      ELSE
        SELF.Q.MON:Needed_3_NormalFG = COLOR:Black                      ! Set conditional color values for MON:Needed_2
        SELF.Q.MON:Needed_3_NormalBG = COLOR:Lime
      .
    .
  


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>1,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>1,1,NewOrder+1))
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
  PAT:Invoice = MON:PATIENT
  GET(Patient,Pat:INVOICE_KEY)
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Window
!!! Update the Template File
!!! </summary>
UpdateTemplate PROCEDURE 

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
ActionMessage        CSTRING(40)                           !
EnhancedFocusManager EnhancedFocusClassType
History::TPL:Record  LIKE(TPL:RECORD),THREAD
QuickWindow          WINDOW('Micro Plate Standards Position'),AT(0,0,506,347),FONT('Arial',11),RESIZE,GRAY,IMM, |
  HLP('UpdateTemplate'),SYSTEM
                       ENTRY(@n06),AT(152,86,40,10),USE(TPL:Barcode),RIGHT(1)
                       ENTRY(@n03),AT(152,106,40,10),USE(TPL:Source),RIGHT,MSG('Source Rack Position'),TIP('Source Rac' & |
  'k Position')
                       ENTRY(@n3),AT(152,130,40,10),USE(TPL:Position),RIGHT
                       OPTION('Relation'),AT(220,128,119,21),USE(TPL:Relation)
                         RADIO('End'),AT(294,130,42,10),USE(?TPL:Relation:Radio2),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('E')
                         RADIO('Beginning'),AT(224,130,50,10),USE(?TPL:Relation:Radio1),FONT(,,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('S')
                       END
                       ENTRY(@s5),AT(152,148,40,10),USE(TPL:Code),LEFT
                       BUTTON('Done'),AT(390,270,64,22),USE(?OK),LEFT,ICON('SteelCheck.ico'),DEFAULT,TRN
                       IMAGE('button.jpg'),AT(390,270,64,22),USE(?Image2)
                       IMAGE('button.jpg'),AT(390,216,64,22),USE(?Image1)
                       PROMPT('&Position:'),AT(116,130),USE(?TPL:Position:Prompt),FONT(,,,FONT:bold),TRN
                       STRING('From'),AT(198,130),USE(?String1),FONT(,,,FONT:bold),TRN
                       STRING('Or'),AT(278,130),USE(?String2),FONT(,,,FONT:bold),TRN
                       STRING('Plate'),AT(344,130),USE(?String3),FONT(,,,FONT:bold),TRN
                       PROMPT('&Code:'),AT(124,146),USE(?TPL:Code:Prompt),FONT(,,,FONT:bold),TRN
                       PROMPT('Barcode'),AT(116,88),USE(?TPL:Patient:Prompt),FONT(,,,FONT:bold),TRN
                       BUTTON('Cancel'),AT(390,216,64,22),USE(?Cancel),LEFT,ICON('SteelCancel.ico'),TRN
                       PROMPT('Source:'),AT(118,108),USE(?TPL:Source:Prompt),FONT(,,,FONT:bold),TRN
                       BUTTON('Help'),AT(0,0,45,14),USE(?Help),HIDE,STD(STD:Help)
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
ToolbarForm          ToolbarUpdateClass                    ! Form Toolbar Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
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

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Adding a Template Record'
  OF ChangeRecord
    ActionMessage = 'Changing a Template Record'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('UpdateTemplate')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?TPL:Barcode
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = 734
  SELF.AddHistoryFile(TPL:Record,History::TPL:Record)
  SELF.AddHistoryField(?TPL:Barcode,6)
  SELF.AddHistoryField(?TPL:Source,7)
  SELF.AddHistoryField(?TPL:Position,3)
  SELF.AddHistoryField(?TPL:Relation,4)
  SELF.AddHistoryField(?TPL:Code,5)
  SELF.AddUpdateFile(Access:template)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:template.Open                                     ! File template used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:template
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  ToolBarForm.HelpButton=?Help
  SELF.AddItem(ToolbarForm)
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallPaper
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
    Relate:template.Close
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.PrimeFields PROCEDURE

  CODE
  TPL:Set = gloSet
  PARENT.PrimeFields


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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
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

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Monitor File
!!! </summary>
GetMonitor PROCEDURE 

CurrentTab           STRING(80)                            !
FilesOpened          BYTE                                  !
BRW1::View:Browse    VIEW(Monitor)
                       PROJECT(MON:PATIENT)
                       PROJECT(MON:NAME)
                       PROJECT(MON:STATUS)
                       PROJECT(MON:SORT)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
MON:PATIENT            LIKE(MON:PATIENT)              !List box control field - type derived from field
MON:NAME               LIKE(MON:NAME)                 !List box control field - type derived from field
MON:STATUS             LIKE(MON:STATUS)               !Browse key field - type derived from field
MON:SORT               LIKE(MON:SORT)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW('Browse the Monitor File'),AT(,0,243,246),FONT('MS Sans Serif',8),RESIZE,CENTER,GRAY, |
  IMM,MDI,HLP('GetMonitor'),SYSTEM
                       LIST,AT(16,0,140,239),USE(?Browse:1),VSCROLL,FORMAT('56R(2)|M~Patient~L@n06@128R(2)|M~N' & |
  'ame~L@s32@'),FROM(Queue:Browse:1),IMM,MSG('Browsing Records')
                       BUTTON('&Select'),AT(184,228,45,14),USE(?Select:2),HIDE
                       BUTTON('Close'),AT(184,208,45,14),USE(?Close)
                       BUTTON('Help'),AT(180,76,45,14),USE(?Help),HIDE,STD(STD:Help)
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
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('GetMonitor')
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
  Relate:Monitor.Open                             ! File Monitor used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Monitor,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon MON:STATUS for sort order 1
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,MON:STATUSKEY) ! Add the sort order for MON:STATUSKEY for sort order 1
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort0:Locator.Init(,MON:STATUS,1,BRW1)    ! Initialize the browse locator using  using key: MON:STATUSKEY , MON:STATUS
  BRW1.AddField(MON:PATIENT,BRW1.Q.MON:PATIENT)   ! Field MON:PATIENT is a hot field or requires assignment from browse
  BRW1.AddField(MON:NAME,BRW1.Q.MON:NAME)         ! Field MON:NAME is a hot field or requires assignment from browse
  BRW1.AddField(MON:STATUS,BRW1.Q.MON:STATUS)     ! Field MON:STATUS is a hot field or requires assignment from browse
  BRW1.AddField(MON:SORT,BRW1.Q.MON:SORT)         ! Field MON:SORT is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  INIMgr.Fetch('GetMonitor',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                  ! Reset required after window size altered by INI manager
  BRW1.AddToolbarTarget(Toolbar)                  ! Browse accepts toolbar control
  BRW1.ToolbarItem.HelpButton = ?Help
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','GetMonitor',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,2,LFM_CFile,LFM_CFile.Record)
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
    Relate:Monitor.Close
  END
  ! List Format Manager destructor
  BRW1::FormatManager.Kill() 
  BRW1::AutoSizeColumn.Kill()
  IF SELF.Opened
    INIMgr.Update('GetMonitor',QuickWindow)                ! Save window data to non-volatile store
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

