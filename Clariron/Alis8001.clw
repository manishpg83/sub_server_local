

   MEMBER('Alis8.clw')                                     ! This is a MEMBER module

!Start of module

   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('BRWEXT.INC'),ONCE

                     MAP
                       INCLUDE('ALIS8001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('ALIS8013.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8016.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8036.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8050.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8055.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('ALIS8066.INC'),ONCE        !Req'd for module callout resolution
                     END


StdPanelText   STRING(40),DIM(30)
mdlStartTime   LONG
mdlSorts   LONG,DIM(2,2)
mdlEntryPoint   BYTE
SAV:Page   BYTE
PanelText   STRING(40),DIM(20)
StdPanelCheckBox   STRING(1),DIM(30)
PanelCheckBox   STRING(1),DIM(20)
CurrentPage   BYTE
ErrorText   STRING(32)
locIgE   BYTE
locIgG   BYTE
locIgG4   BYTE
SortIndex   BYTE,DIM(26)
ActivePage           GROUP,PRE(AP),DIM(252)            ! The Active Page of Allergen Descriptions and Checked Boxes
Checked                STRING(1)
IgE                    BYTE
IgG                    BYTE
IgG4                   BYTE
Text                   STRING(32)
                     .

AllPages           GROUP,DIM(2016)PRE(APS)            ! The Active Page of Allergen Descriptions and Checked Boxes
Checked                STRING(1)
IgE                    BYTE
IgG                    BYTE
IgG4                   BYTE
Text                   STRING(32)
                     .
TransferPage     BYTE,DIM(SIZE(ActivePage)),OVER(ActivePage) ! Used to Move Data between Active and IndexedPage Storage
IndexedPage      BYTE,DIM(8,SIZE(TransferPage)),OVER(AllPages) ! Hold All 3 pages of Text and Check Marked Boxes

TabData FILE,DRIVER('ASCII'),PRE(TD),CREATE,NAME(gloTabFileName)
          RECORD
Data    STRING(40)
        . .


PageCheckBox    GROUP,DIM(756),PRE(PCB)
Checked             STRING(1)
IgE                 BYTE
IgG                 BYTE
IgG4                BYTE
                .
Selections      GROUP,DIM(756)
Checked             STRING(1)
IgE                 BYTE
IgG                 BYTE
IgG4                BYTE
                .
locCodes           STRING(4),DIM(756)
gloPanelCodes      STRING(9),DIM(20)
gloStdPanelCodes   STRING(9),DIM(30)
locDescriptions    STRING(32),DIM(756)

Post FILE,DRIVER('ASCII'),PRE(PST),CREATE,NAME(gloFileName2)
          RECORD
Data    STRING(64)
        . .       

! end of module data????



!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
LoginTests PROCEDURE (prmAction)

EGG4                 STRING(1)                             !
locPage              LONG                                  !
locSorts             LONG,DIM(2,2)                         !
SelectedTab          LONG                                  !
locEG4               BYTE                                  !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(0,0,678,406),FONT('Arial Narrow',8),GRAY,MDI
                       CHECK,AT(15,15,10,10),USE(AP:Checked[1]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(15,23,10,10),USE(AP:Checked[2]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,33,10,10),USE(AP:Checked[3]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,43,10,10),USE(AP:Checked[4]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,53,10,10),USE(AP:Checked[5]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,63,10,10),USE(AP:Checked[6]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,73,10,10),USE(AP:Checked[7]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,83,10,10),USE(AP:Checked[8]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,93,10,10),USE(AP:Checked[9]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,103,10,10),USE(AP:Checked[10]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,113,10,10),USE(AP:Checked[11]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,123,10,10),USE(AP:Checked[12]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,133,10,10),USE(AP:Checked[13]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,143,10,10),USE(AP:Checked[14]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,153,10,10),USE(AP:Checked[15]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,163,10,10),USE(AP:Checked[16]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,173,10,10),USE(AP:Checked[17]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,183,10,10),USE(AP:Checked[18]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,193,10,10),USE(AP:Checked[19]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,203,10,10),USE(AP:Checked[20]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,213,10,10),USE(AP:Checked[21]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,223,10,10),USE(AP:Checked[22]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,233,10,10),USE(AP:Checked[23]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,243,10,10),USE(AP:Checked[24]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,253,10,10),USE(AP:Checked[25]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,263,10,10),USE(AP:Checked[26]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,273,10,10),USE(AP:Checked[27]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,283,10,10),USE(AP:Checked[28]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,293,10,10),USE(AP:Checked[29]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,303,10,10),USE(AP:Checked[30]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,313,10,10),USE(AP:Checked[31]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,323,10,10),USE(AP:Checked[32]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,333,10,10),USE(AP:Checked[33]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,343,10,10),USE(AP:Checked[34]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,353,10,10),USE(AP:Checked[35]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,363,10,10),USE(AP:Checked[36]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,15,10,10),USE(AP:Checked[37]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(110,23,10,10),USE(AP:Checked[38]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,33,10,10),USE(AP:Checked[39]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,43,10,10),USE(AP:Checked[40]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,53,10,10),USE(AP:Checked[41]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,63,10,10),USE(AP:Checked[42]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,73,10,10),USE(AP:Checked[43]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,83,10,10),USE(AP:Checked[44]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,93,10,10),USE(AP:Checked[45]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,103,10,10),USE(AP:Checked[46]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,113,10,10),USE(AP:Checked[47]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,123,10,10),USE(AP:Checked[48]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,133,10,10),USE(AP:Checked[49]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,143,10,10),USE(AP:Checked[50]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,153,10,10),USE(AP:Checked[51]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,163,10,10),USE(AP:Checked[52]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,173,10,10),USE(AP:Checked[53]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,183,10,10),USE(AP:Checked[54]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,193,10,10),USE(AP:Checked[55]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,203,10,10),USE(AP:Checked[56]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,213,10,10),USE(AP:Checked[57]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,223,10,10),USE(AP:Checked[58]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,233,10,10),USE(AP:Checked[59]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,243,10,10),USE(AP:Checked[60]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,253,10,10),USE(AP:Checked[61]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,263,10,10),USE(AP:Checked[62]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,273,10,10),USE(AP:Checked[63]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,283,10,10),USE(AP:Checked[64]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,293,10,10),USE(AP:Checked[65]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,303,10,10),USE(AP:Checked[66]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,313,10,10),USE(AP:Checked[67]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,323,10,10),USE(AP:Checked[68]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,333,10,10),USE(AP:Checked[69]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,343,10,10),USE(AP:Checked[70]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,353,10,10),USE(AP:Checked[71]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,363,10,10),USE(AP:Checked[72]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,15,10,10),USE(AP:Checked[73]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(205,23,10,10),USE(AP:Checked[74]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,33,10,10),USE(AP:Checked[75]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,43,10,10),USE(AP:Checked[76]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,53,10,10),USE(AP:Checked[77]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,63,10,10),USE(AP:Checked[78]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,73,10,10),USE(AP:Checked[79]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,83,10,10),USE(AP:Checked[80]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,93,10,10),USE(AP:Checked[81]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,103,10,10),USE(AP:Checked[82]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,113,10,10),USE(AP:Checked[83]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,123,10,10),USE(AP:Checked[84]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,133,10,10),USE(AP:Checked[85]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,143,10,10),USE(AP:Checked[86]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,153,10,10),USE(AP:Checked[87]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,163,10,10),USE(AP:Checked[88]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,173,10,10),USE(AP:Checked[89]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,183,10,10),USE(AP:Checked[90]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,193,10,10),USE(AP:Checked[91]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,203,10,10),USE(AP:Checked[92]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,213,10,10),USE(AP:Checked[93]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,223,10,10),USE(AP:Checked[94]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,233,10,10),USE(AP:Checked[95]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,243,10,10),USE(AP:Checked[96]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,253,10,10),USE(AP:Checked[97]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,263,10,10),USE(AP:Checked[98]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,273,10,10),USE(AP:Checked[99]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,283,10,10),USE(AP:Checked[100]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,293,10,10),USE(AP:Checked[101]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,303,10,10),USE(AP:Checked[102]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,313,10,10),USE(AP:Checked[103]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,323,10,10),USE(AP:Checked[104]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,333,10,10),USE(AP:Checked[105]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,343,10,10),USE(AP:Checked[106]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,353,10,10),USE(AP:Checked[107]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,363,10,10),USE(AP:Checked[108]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,15,10,10),USE(AP:Checked[109]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(300,23,10,10),USE(AP:Checked[110]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,33,10,10),USE(AP:Checked[111]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,43,10,10),USE(AP:Checked[112]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,53,10,10),USE(AP:Checked[113]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,63,10,10),USE(AP:Checked[114]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,73,10,10),USE(AP:Checked[115]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,83,10,10),USE(AP:Checked[116]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,93,10,10),USE(AP:Checked[117]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,103,10,10),USE(AP:Checked[118]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,113,10,10),USE(AP:Checked[119]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,123,10,10),USE(AP:Checked[120]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,133,10,10),USE(AP:Checked[121]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,143,10,10),USE(AP:Checked[122]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,153,10,10),USE(AP:Checked[123]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,163,10,10),USE(AP:Checked[124]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,173,10,10),USE(AP:Checked[125]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,183,10,10),USE(AP:Checked[126]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,193,10,10),USE(AP:Checked[127]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,203,10,10),USE(AP:Checked[128]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,213,10,10),USE(AP:Checked[129]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,223,10,10),USE(AP:Checked[130]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,233,10,10),USE(AP:Checked[131]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,243,10,10),USE(AP:Checked[132]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,253,10,10),USE(AP:Checked[133]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,263,10,10),USE(AP:Checked[134]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,273,10,10),USE(AP:Checked[135]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,283,10,10),USE(AP:Checked[136]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,293,10,10),USE(AP:Checked[137]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,303,10,10),USE(AP:Checked[138]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,313,10,10),USE(AP:Checked[139]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,323,10,10),USE(AP:Checked[140]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,333,10,10),USE(AP:Checked[141]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,343,10,10),USE(AP:Checked[142]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,353,10,10),USE(AP:Checked[143]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,363,10,10),USE(AP:Checked[144]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,15,10,10),USE(AP:Checked[145]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(395,23,10,10),USE(AP:Checked[146]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,33,10,10),USE(AP:Checked[147]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,43,10,10),USE(AP:Checked[148]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,53,10,10),USE(AP:Checked[149]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,63,10,10),USE(AP:Checked[150]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,73,10,10),USE(AP:Checked[151]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,83,10,10),USE(AP:Checked[152]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,93,10,10),USE(AP:Checked[153]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,103,10,10),USE(AP:Checked[154]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,113,10,10),USE(AP:Checked[155]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,123,10,10),USE(AP:Checked[156]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,133,10,10),USE(AP:Checked[157]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,143,10,10),USE(AP:Checked[158]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,153,10,10),USE(AP:Checked[159]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,163,10,10),USE(AP:Checked[160]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,173,10,10),USE(AP:Checked[161]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,183,10,10),USE(AP:Checked[162]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,193,10,10),USE(AP:Checked[163]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,203,10,10),USE(AP:Checked[164]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,213,10,10),USE(AP:Checked[165]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,223,10,10),USE(AP:Checked[166]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,233,10,10),USE(AP:Checked[167]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,243,10,10),USE(AP:Checked[168]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,253,10,10),USE(AP:Checked[169]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,263,10,10),USE(AP:Checked[170]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,273,10,10),USE(AP:Checked[171]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,283,10,10),USE(AP:Checked[172]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,293,10,10),USE(AP:Checked[173]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,303,10,10),USE(AP:Checked[174]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,313,10,10),USE(AP:Checked[175]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,323,10,10),USE(AP:Checked[176]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,333,10,10),USE(AP:Checked[177]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,343,10,10),USE(AP:Checked[178]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,353,10,10),USE(AP:Checked[179]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,363,10,10),USE(AP:Checked[180]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,15,10,10),USE(AP:Checked[181]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(490,23,10,10),USE(AP:Checked[182]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,33,10,10),USE(AP:Checked[183]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,43,10,10),USE(AP:Checked[184]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,53,10,10),USE(AP:Checked[185]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,63,10,10),USE(AP:Checked[186]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,73,10,10),USE(AP:Checked[187]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,83,10,10),USE(AP:Checked[188]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,93,10,10),USE(AP:Checked[189]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,103,10,10),USE(AP:Checked[190]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,113,10,10),USE(AP:Checked[191]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,123,10,10),USE(AP:Checked[192]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,133,10,10),USE(AP:Checked[193]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,143,10,10),USE(AP:Checked[194]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,153,10,10),USE(AP:Checked[195]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,163,10,10),USE(AP:Checked[196]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,173,10,10),USE(AP:Checked[197]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,183,10,10),USE(AP:Checked[198]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,193,10,10),USE(AP:Checked[199]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,203,10,10),USE(AP:Checked[200]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,213,10,10),USE(AP:Checked[201]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,223,10,10),USE(AP:Checked[202]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,233,10,10),USE(AP:Checked[203]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,243,10,10),USE(AP:Checked[204]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,253,10,10),USE(AP:Checked[205]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,263,10,10),USE(AP:Checked[206]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,273,10,10),USE(AP:Checked[207]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,283,10,10),USE(AP:Checked[208]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,293,10,10),USE(AP:Checked[209]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,303,10,10),USE(AP:Checked[210]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,313,10,10),USE(AP:Checked[211]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,323,10,10),USE(AP:Checked[212]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,333,10,10),USE(AP:Checked[213]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,343,10,10),USE(AP:Checked[214]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,353,10,10),USE(AP:Checked[215]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,363,10,10),USE(AP:Checked[216]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,15,10,10),USE(AP:Checked[217]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(585,23,10,10),USE(AP:Checked[218]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,33,10,10),USE(AP:Checked[219]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,43,10,10),USE(AP:Checked[220]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,53,10,10),USE(AP:Checked[221]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,63,10,10),USE(AP:Checked[222]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,73,10,10),USE(AP:Checked[223]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,83,10,10),USE(AP:Checked[224]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,93,10,10),USE(AP:Checked[225]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,103,10,10),USE(AP:Checked[226]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,113,10,10),USE(AP:Checked[227]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,123,10,10),USE(AP:Checked[228]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,133,10,10),USE(AP:Checked[229]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,143,10,10),USE(AP:Checked[230]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,153,10,10),USE(AP:Checked[231]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,163,10,10),USE(AP:Checked[232]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,173,10,10),USE(AP:Checked[233]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,183,10,10),USE(AP:Checked[234]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,193,10,10),USE(AP:Checked[235]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,203,10,10),USE(AP:Checked[236]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,213,10,10),USE(AP:Checked[237]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,223,10,10),USE(AP:Checked[238]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,233,10,10),USE(AP:Checked[239]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,243,10,10),USE(AP:Checked[240]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,253,10,10),USE(AP:Checked[241]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,263,10,10),USE(AP:Checked[242]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,273,10,10),USE(AP:Checked[243]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,283,10,10),USE(AP:Checked[244]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,293,10,10),USE(AP:Checked[245]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,303,10,10),USE(AP:Checked[246]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,313,10,10),USE(AP:Checked[247]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,323,10,10),USE(AP:Checked[248]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,333,10,10),USE(AP:Checked[249]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,343,10,10),USE(AP:Checked[250]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,353,10,10),USE(AP:Checked[251]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,363,10,10),USE(AP:Checked[252]),ALRT(MouseRight),TRN,VALUE('1','0')
                       STRING(@s32),AT(25,15,80,10),USE(AP:Text[1]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(25,24,80,10),USE(AP:Text[2]),TRN
                       STRING(@s32),AT(25,34,80,10),USE(AP:Text[3]),TRN
                       STRING(@s32),AT(25,44,80,10),USE(AP:Text[4]),TRN
                       STRING(@s32),AT(25,54,80,10),USE(AP:Text[5]),TRN
                       STRING(@s32),AT(25,64,80,10),USE(AP:Text[6]),TRN
                       STRING(@s32),AT(25,74,80,10),USE(AP:Text[7]),TRN
                       STRING(@s32),AT(25,84,80,10),USE(AP:Text[8]),TRN
                       STRING(@s32),AT(25,94,80,10),USE(AP:Text[9]),TRN
                       STRING(@s32),AT(25,104,80,10),USE(AP:Text[10]),TRN
                       STRING(@s32),AT(25,114,80,10),USE(AP:Text[11]),TRN
                       STRING(@s32),AT(25,124,80,10),USE(AP:Text[12]),TRN
                       STRING(@s32),AT(25,134,80,10),USE(AP:Text[13]),TRN
                       STRING(@s32),AT(25,144,80,10),USE(AP:Text[14]),TRN
                       STRING(@s32),AT(25,154,80,10),USE(AP:Text[15]),TRN
                       STRING(@s32),AT(25,164,80,10),USE(AP:Text[16]),TRN
                       STRING(@s32),AT(25,174,80,10),USE(AP:Text[17]),TRN
                       STRING(@s32),AT(25,184,80,10),USE(AP:Text[18]),TRN
                       STRING(@s32),AT(25,194,80,10),USE(AP:Text[19]),TRN
                       STRING(@s32),AT(25,204,80,10),USE(AP:Text[20]),TRN
                       STRING(@s32),AT(25,214,80,10),USE(AP:Text[21]),TRN
                       STRING(@s32),AT(25,224,80,10),USE(AP:Text[22]),TRN
                       STRING(@s32),AT(25,234,80,10),USE(AP:Text[23]),TRN
                       STRING(@s32),AT(25,244,80,10),USE(AP:Text[24]),TRN
                       STRING(@s32),AT(25,254,80,10),USE(AP:Text[25]),TRN
                       STRING(@s32),AT(25,264,80,10),USE(AP:Text[26]),TRN
                       STRING(@s32),AT(25,274,80,10),USE(AP:Text[27]),TRN
                       STRING(@s32),AT(25,284,80,10),USE(AP:Text[28]),TRN
                       STRING(@s32),AT(25,294,80,10),USE(AP:Text[29]),TRN
                       STRING(@s32),AT(25,304,80,10),USE(AP:Text[30]),TRN
                       STRING(@s32),AT(25,314,80,10),USE(AP:Text[31]),TRN
                       STRING(@s32),AT(25,324,80,10),USE(AP:Text[32]),TRN
                       STRING(@s32),AT(25,334,80,10),USE(AP:Text[33]),TRN
                       STRING(@s32),AT(25,344,80,10),USE(AP:Text[34]),TRN
                       STRING(@s32),AT(25,354,80,10),USE(AP:Text[35]),TRN
                       STRING(@s32),AT(25,364,80,10),USE(AP:Text[36]),TRN
                       STRING(@s32),AT(120,15,80,10),USE(AP:Text[37]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(120,24,80,10),USE(AP:Text[38]),TRN
                       STRING(@s32),AT(120,34,80,10),USE(AP:Text[39]),TRN
                       STRING(@s32),AT(120,44,80,10),USE(AP:Text[40]),TRN
                       STRING(@s32),AT(120,54,80,10),USE(AP:Text[41]),TRN
                       STRING(@s32),AT(120,64,80,10),USE(AP:Text[42]),TRN
                       STRING(@s32),AT(120,74,80,10),USE(AP:Text[43]),TRN
                       STRING(@s32),AT(120,84,80,10),USE(AP:Text[44]),TRN
                       STRING(@s32),AT(120,94,80,10),USE(AP:Text[45]),TRN
                       STRING(@s32),AT(120,104,80,10),USE(AP:Text[46]),TRN
                       STRING(@s32),AT(120,114,80,10),USE(AP:Text[47]),TRN
                       STRING(@s32),AT(120,124,80,10),USE(AP:Text[48]),TRN
                       STRING(@s32),AT(120,134,80,10),USE(AP:Text[49]),TRN
                       STRING(@s32),AT(120,144,80,10),USE(AP:Text[50]),TRN
                       STRING(@s32),AT(120,154,80,10),USE(AP:Text[51]),TRN
                       STRING(@s32),AT(120,164,80,10),USE(AP:Text[52]),TRN
                       STRING(@s32),AT(120,174,80,10),USE(AP:Text[53]),TRN
                       STRING(@s32),AT(120,184,80,10),USE(AP:Text[54]),TRN
                       STRING(@s32),AT(120,194,80,10),USE(AP:Text[55]),TRN
                       STRING(@s32),AT(120,204,80,10),USE(AP:Text[56]),TRN
                       STRING(@s32),AT(120,214,80,10),USE(AP:Text[57]),TRN
                       STRING(@s32),AT(120,224,80,10),USE(AP:Text[58]),TRN
                       STRING(@s32),AT(120,234,80,10),USE(AP:Text[59]),TRN
                       STRING(@s32),AT(120,244,80,10),USE(AP:Text[60]),TRN
                       STRING(@s32),AT(120,254,80,10),USE(AP:Text[61]),TRN
                       STRING(@s32),AT(120,264,80,10),USE(AP:Text[62]),TRN
                       STRING(@s32),AT(120,274,80,10),USE(AP:Text[63]),TRN
                       STRING(@s32),AT(120,284,80,10),USE(AP:Text[64]),TRN
                       STRING(@s32),AT(120,294,80,10),USE(AP:Text[65]),TRN
                       STRING(@s32),AT(120,304,80,10),USE(AP:Text[66]),TRN
                       STRING(@s32),AT(120,314,80,10),USE(AP:Text[67]),TRN
                       STRING(@s32),AT(120,324,80,10),USE(AP:Text[68]),TRN
                       STRING(@s32),AT(120,334,80,10),USE(AP:Text[69]),TRN
                       STRING(@s32),AT(120,344,80,10),USE(AP:Text[70]),TRN
                       STRING(@s32),AT(120,354,80,10),USE(AP:Text[71]),TRN
                       STRING(@s32),AT(120,364,80,10),USE(AP:Text[72]),TRN
                       STRING(@s32),AT(215,15,80,10),USE(AP:Text[73]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(215,24,80,10),USE(AP:Text[74]),TRN
                       STRING(@s32),AT(215,34,80,10),USE(AP:Text[75]),TRN
                       STRING(@s32),AT(215,44,80,10),USE(AP:Text[76]),TRN
                       STRING(@s32),AT(215,54,80,10),USE(AP:Text[77]),TRN
                       STRING(@s32),AT(215,64,80,10),USE(AP:Text[78]),TRN
                       STRING(@s32),AT(215,74,80,10),USE(AP:Text[79]),TRN
                       STRING(@s32),AT(215,84,80,10),USE(AP:Text[80]),TRN
                       STRING(@s32),AT(215,94,80,10),USE(AP:Text[81]),TRN
                       STRING(@s32),AT(215,104,80,10),USE(AP:Text[82]),TRN
                       STRING(@s32),AT(215,114,80,10),USE(AP:Text[83]),TRN
                       STRING(@s32),AT(215,124,80,10),USE(AP:Text[84]),TRN
                       STRING(@s32),AT(215,134,80,10),USE(AP:Text[85]),TRN
                       STRING(@s32),AT(215,144,80,10),USE(AP:Text[86]),TRN
                       STRING(@s32),AT(215,154,80,10),USE(AP:Text[87]),TRN
                       STRING(@s32),AT(215,164,80,10),USE(AP:Text[88]),TRN
                       STRING(@s32),AT(215,174,80,10),USE(AP:Text[89]),TRN
                       STRING(@s32),AT(215,184,80,10),USE(AP:Text[90]),TRN
                       STRING(@s32),AT(215,194,80,10),USE(AP:Text[91]),TRN
                       STRING(@s32),AT(215,204,80,10),USE(AP:Text[92]),TRN
                       STRING(@s32),AT(215,214,80,10),USE(AP:Text[93]),TRN
                       STRING(@s32),AT(215,224,80,10),USE(AP:Text[94]),TRN
                       STRING(@s32),AT(215,234,80,10),USE(AP:Text[95]),TRN
                       STRING(@s32),AT(215,244,80,10),USE(AP:Text[96]),TRN
                       STRING(@s32),AT(215,254,80,10),USE(AP:Text[97]),TRN
                       STRING(@s32),AT(215,264,80,10),USE(AP:Text[98]),TRN
                       STRING(@s32),AT(215,274,80,10),USE(AP:Text[99]),TRN
                       STRING(@s32),AT(215,284,80,10),USE(AP:Text[100]),TRN
                       STRING(@s32),AT(215,294,80,10),USE(AP:Text[101]),TRN
                       STRING(@s32),AT(215,304,80,10),USE(AP:Text[102]),TRN
                       STRING(@s32),AT(215,314,80,10),USE(AP:Text[103]),TRN
                       STRING(@s32),AT(215,324,80,10),USE(AP:Text[104]),TRN
                       STRING(@s32),AT(215,334,80,10),USE(AP:Text[105]),TRN
                       STRING(@s32),AT(215,344,80,10),USE(AP:Text[106]),TRN
                       STRING(@s32),AT(215,354,80,10),USE(AP:Text[107]),TRN
                       STRING(@s32),AT(215,364,80,10),USE(AP:Text[108]),TRN
                       STRING(@s32),AT(310,15,80,10),USE(AP:Text[109]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(310,24,80,10),USE(AP:Text[110]),TRN
                       STRING(@s32),AT(310,34,80,10),USE(AP:Text[111]),TRN
                       STRING(@s32),AT(310,44,80,10),USE(AP:Text[112]),TRN
                       STRING(@s32),AT(310,54,80,10),USE(AP:Text[113]),TRN
                       STRING(@s32),AT(310,64,80,10),USE(AP:Text[114]),TRN
                       STRING(@s32),AT(310,74,80,10),USE(AP:Text[115]),TRN
                       STRING(@s32),AT(310,84,80,10),USE(AP:Text[116]),TRN
                       STRING(@s32),AT(310,94,80,10),USE(AP:Text[117]),TRN
                       STRING(@s32),AT(310,104,80,10),USE(AP:Text[118]),TRN
                       STRING(@s32),AT(310,114,80,10),USE(AP:Text[119]),TRN
                       STRING(@s32),AT(310,124,80,10),USE(AP:Text[120]),TRN
                       STRING(@s32),AT(310,134,80,10),USE(AP:Text[121]),TRN
                       STRING(@s32),AT(310,144,80,10),USE(AP:Text[122]),TRN
                       STRING(@s32),AT(310,154,80,10),USE(AP:Text[123]),TRN
                       STRING(@s32),AT(310,164,80,10),USE(AP:Text[124]),TRN
                       STRING(@s32),AT(310,174,80,10),USE(AP:Text[125]),TRN
                       STRING(@s32),AT(310,184,80,10),USE(AP:Text[126]),TRN
                       STRING(@s32),AT(310,194,80,10),USE(AP:Text[127]),TRN
                       STRING(@s32),AT(310,204,80,10),USE(AP:Text[128]),TRN
                       STRING(@s32),AT(310,214,80,10),USE(AP:Text[129]),TRN
                       STRING(@s32),AT(310,224,80,10),USE(AP:Text[130]),TRN
                       STRING(@s32),AT(310,234,80,10),USE(AP:Text[131]),TRN
                       STRING(@s32),AT(310,244,80,10),USE(AP:Text[132]),TRN
                       STRING(@s32),AT(310,254,80,10),USE(AP:Text[133]),TRN
                       STRING(@s32),AT(310,264,80,10),USE(AP:Text[134]),TRN
                       STRING(@s32),AT(310,274,80,10),USE(AP:Text[135]),TRN
                       STRING(@s32),AT(310,284,80,10),USE(AP:Text[136]),TRN
                       STRING(@s32),AT(310,294,80,10),USE(AP:Text[137]),TRN
                       STRING(@s32),AT(310,304,80,10),USE(AP:Text[138]),TRN
                       STRING(@s32),AT(310,314,80,10),USE(AP:Text[139]),TRN
                       STRING(@s32),AT(310,324,80,10),USE(AP:Text[140]),TRN
                       STRING(@s32),AT(310,334,80,10),USE(AP:Text[141]),TRN
                       STRING(@s32),AT(310,344,80,10),USE(AP:Text[142]),TRN
                       STRING(@s32),AT(310,354,80,10),USE(AP:Text[143]),TRN
                       STRING(@s32),AT(310,364,80,10),USE(AP:Text[144]),TRN
                       STRING(@s32),AT(405,15,80,10),USE(AP:Text[145]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(405,24,80,10),USE(AP:Text[146]),TRN
                       STRING(@s32),AT(405,34,80,10),USE(AP:Text[147]),TRN
                       STRING(@s32),AT(405,44,80,10),USE(AP:Text[148]),TRN
                       STRING(@s32),AT(405,54,80,10),USE(AP:Text[149]),TRN
                       STRING(@s32),AT(405,64,80,10),USE(AP:Text[150]),TRN
                       STRING(@s32),AT(405,74,80,10),USE(AP:Text[151]),TRN
                       STRING(@s32),AT(405,84,80,10),USE(AP:Text[152]),TRN
                       STRING(@s32),AT(405,94,80,10),USE(AP:Text[153]),TRN
                       STRING(@s32),AT(405,104,80,10),USE(AP:Text[154]),TRN
                       STRING(@s32),AT(405,114,80,10),USE(AP:Text[155]),TRN
                       STRING(@s32),AT(405,124,80,10),USE(AP:Text[156]),TRN
                       STRING(@s32),AT(405,134,80,10),USE(AP:Text[157]),TRN
                       STRING(@s32),AT(405,144,80,10),USE(AP:Text[158]),TRN
                       STRING(@s32),AT(405,154,80,10),USE(AP:Text[159]),TRN
                       STRING(@s32),AT(405,164,80,10),USE(AP:Text[160]),TRN
                       STRING(@s32),AT(405,174,80,10),USE(AP:Text[161]),TRN
                       STRING(@s32),AT(405,184,80,10),USE(AP:Text[162]),TRN
                       STRING(@s32),AT(405,194,80,10),USE(AP:Text[163]),TRN
                       STRING(@s32),AT(405,204,80,10),USE(AP:Text[164]),TRN
                       STRING(@s32),AT(405,214,80,10),USE(AP:Text[165]),TRN
                       STRING(@s32),AT(405,224,80,10),USE(AP:Text[166]),TRN
                       STRING(@s32),AT(405,234,80,10),USE(AP:Text[167]),TRN
                       STRING(@s32),AT(405,244,80,10),USE(AP:Text[168]),TRN
                       STRING(@s32),AT(405,254,80,10),USE(AP:Text[169]),TRN
                       STRING(@s32),AT(405,264,80,10),USE(AP:Text[170]),TRN
                       STRING(@s32),AT(405,274,80,10),USE(AP:Text[171]),TRN
                       STRING(@s32),AT(405,284,80,10),USE(AP:Text[172]),TRN
                       STRING(@s32),AT(405,294,80,10),USE(AP:Text[173]),TRN
                       STRING(@s32),AT(405,304,80,10),USE(AP:Text[174]),TRN
                       STRING(@s32),AT(405,314,80,10),USE(AP:Text[175]),TRN
                       STRING(@s32),AT(405,324,80,10),USE(AP:Text[176]),TRN
                       STRING(@s32),AT(405,334,80,10),USE(AP:Text[177]),TRN
                       STRING(@s32),AT(405,344,80,10),USE(AP:Text[178]),TRN
                       STRING(@s32),AT(405,354,80,10),USE(AP:Text[179]),TRN
                       STRING(@s32),AT(405,364,80,10),USE(AP:Text[180]),TRN
                       STRING(@s32),AT(500,15,80,10),USE(AP:Text[181]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(500,24,80,10),USE(AP:Text[182]),TRN
                       STRING(@s32),AT(500,34,80,10),USE(AP:Text[183]),TRN
                       STRING(@s32),AT(500,44,80,10),USE(AP:Text[184]),TRN
                       STRING(@s32),AT(500,54,80,10),USE(AP:Text[185]),TRN
                       STRING(@s32),AT(500,64,80,10),USE(AP:Text[186]),TRN
                       STRING(@s32),AT(500,74,80,10),USE(AP:Text[187]),TRN
                       STRING(@s32),AT(500,84,80,10),USE(AP:Text[188]),TRN
                       STRING(@s32),AT(500,94,80,10),USE(AP:Text[189]),TRN
                       STRING(@s32),AT(500,104,80,10),USE(AP:Text[190]),TRN
                       STRING(@s32),AT(500,114,80,10),USE(AP:Text[191]),TRN
                       STRING(@s32),AT(500,124,80,10),USE(AP:Text[192]),TRN
                       STRING(@s32),AT(500,134,80,10),USE(AP:Text[193]),TRN
                       STRING(@s32),AT(500,144,80,10),USE(AP:Text[194]),TRN
                       STRING(@s32),AT(500,154,80,10),USE(AP:Text[195]),TRN
                       STRING(@s32),AT(500,164,80,10),USE(AP:Text[196]),TRN
                       STRING(@s32),AT(500,174,80,10),USE(AP:Text[197]),TRN
                       STRING(@s32),AT(500,184,80,10),USE(AP:Text[198]),TRN
                       STRING(@s32),AT(500,194,80,10),USE(AP:Text[199]),TRN
                       STRING(@s32),AT(500,204,80,10),USE(AP:Text[200]),TRN
                       STRING(@s32),AT(500,214,80,10),USE(AP:Text[201]),TRN
                       STRING(@s32),AT(500,224,80,10),USE(AP:Text[202]),TRN
                       STRING(@s32),AT(500,234,80,10),USE(AP:Text[203]),TRN
                       STRING(@s32),AT(500,244,80,10),USE(AP:Text[204]),TRN
                       STRING(@s32),AT(500,254,80,10),USE(AP:Text[205]),TRN
                       STRING(@s32),AT(500,264,80,10),USE(AP:Text[206]),TRN
                       STRING(@s32),AT(500,274,80,10),USE(AP:Text[207]),TRN
                       STRING(@s32),AT(500,284,80,10),USE(AP:Text[208]),TRN
                       STRING(@s32),AT(500,294,80,10),USE(AP:Text[209]),TRN
                       STRING(@s32),AT(500,304,80,10),USE(AP:Text[210]),TRN
                       STRING(@s32),AT(500,314,80,10),USE(AP:Text[211]),TRN
                       STRING(@s32),AT(500,324,80,10),USE(AP:Text[212]),TRN
                       STRING(@s32),AT(500,334,80,10),USE(AP:Text[213]),TRN
                       STRING(@s32),AT(500,344,80,10),USE(AP:Text[214]),TRN
                       STRING(@s32),AT(500,354,80,10),USE(AP:Text[215]),TRN
                       STRING(@s32),AT(500,364,80,10),USE(AP:Text[216]),TRN
                       STRING(@s32),AT(595,15,80,10),USE(AP:Text[217]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(595,24,80,10),USE(AP:Text[218]),TRN
                       STRING(@s32),AT(595,34,80,10),USE(AP:Text[219]),TRN
                       STRING(@s32),AT(595,44,80,10),USE(AP:Text[220]),TRN
                       STRING(@s32),AT(595,54,80,10),USE(AP:Text[221]),TRN
                       STRING(@s32),AT(595,64,80,10),USE(AP:Text[222]),TRN
                       STRING(@s32),AT(595,74,80,10),USE(AP:Text[223]),TRN
                       STRING(@s32),AT(595,84,80,10),USE(AP:Text[224]),TRN
                       STRING(@s32),AT(595,94,80,10),USE(AP:Text[225]),TRN
                       STRING(@s32),AT(595,104,80,10),USE(AP:Text[226]),TRN
                       STRING(@s32),AT(595,114,80,10),USE(AP:Text[227]),TRN
                       STRING(@s32),AT(595,124,80,10),USE(AP:Text[228]),TRN
                       STRING(@s32),AT(595,134,80,10),USE(AP:Text[229]),TRN
                       STRING(@s32),AT(595,144,80,10),USE(AP:Text[230]),TRN
                       STRING(@s32),AT(595,154,80,10),USE(AP:Text[231]),TRN
                       STRING(@s32),AT(595,164,80,10),USE(AP:Text[232]),TRN
                       STRING(@s32),AT(595,174,80,10),USE(AP:Text[233]),TRN
                       STRING(@s32),AT(595,184,80,10),USE(AP:Text[234]),TRN
                       STRING(@s32),AT(595,194,80,10),USE(AP:Text[235]),TRN
                       STRING(@s32),AT(595,204,80,10),USE(AP:Text[236]),TRN
                       STRING(@s32),AT(595,214,80,10),USE(AP:Text[237]),TRN
                       STRING(@s32),AT(595,224,80,10),USE(AP:Text[238]),TRN
                       STRING(@s32),AT(595,234,80,10),USE(AP:Text[239]),TRN
                       STRING(@s32),AT(595,244,80,10),USE(AP:Text[240]),TRN
                       STRING(@s32),AT(595,254,80,10),USE(AP:Text[241]),TRN
                       STRING(@s32),AT(595,264,80,10),USE(AP:Text[242]),TRN
                       STRING(@s32),AT(595,274,80,10),USE(AP:Text[243]),TRN
                       STRING(@s32),AT(595,284,80,10),USE(AP:Text[244]),TRN
                       STRING(@s32),AT(595,294,80,10),USE(AP:Text[245]),TRN
                       STRING(@s32),AT(595,304,80,10),USE(AP:Text[246]),TRN
                       STRING(@s32),AT(595,314,80,10),USE(AP:Text[247]),TRN
                       STRING(@s32),AT(595,324,80,10),USE(AP:Text[248]),TRN
                       STRING(@s32),AT(595,334,80,10),USE(AP:Text[249]),TRN
                       STRING(@s32),AT(595,344,80,10),USE(AP:Text[250]),TRN
                       STRING(@s32),AT(595,354,80,10),USE(AP:Text[251]),TRN
                       STRING(@s32),AT(595,364,80,10),USE(AP:Text[252]),TRN
                       IMAGE('yellow.bmp'),AT(192,378,40,6),USE(?IgG4:On),HIDE
                       BUTTON('Review'),AT(324,380,80,25),USE(?Review),FONT(,,,FONT:bold),LEFT,ICON('SteelCheckOn.ico'), |
  TRN
                       BUTTON('Add to Panel'),AT(412,380,80,25),USE(?Add2PanelButton),FONT(,,,FONT:bold),HIDE
                       BUTTON('Pollens'),AT(16,0,79,13),USE(?Page1),FONT(,10,,FONT:bold),DISABLE
                       BUTTON('Non-Pollens'),AT(96,0,79,13),USE(?Page2),FONT(,10,,FONT:bold)
                       BUTTON('Food'),AT(176,0,79,13),USE(?Page3),FONT(,10,,FONT:bold)
                       BUTTON('Chemicals'),AT(256,0,79,13),USE(?Page4),FONT(,10,,FONT:bold)
                       CHECK('IgE'),AT(140,384,40,22),USE(locIgE),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('1', |
  '0')
                       CHECK('IgG'),AT(244,384,40,22),USE(locIgG),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('2', |
  '0')
                       IMAGE('button.jpg'),AT(140,384,40,22),USE(?Image11)
                       IMAGE('button.jpg'),AT(192,384,40,22),USE(?Image10)
                       IMAGE('button.jpg'),AT(244,384,40,22),USE(?Image9)
                       IMAGE('button.jpg'),AT(324,380,80,25),USE(?Image8)
                       IMAGE('button.jpg'),AT(504,380,100,25),USE(?Image7)
                       IMAGE('red.bmp'),AT(140,378,40,6),USE(?IgE:On),HIDE
                       IMAGE('blue.bmp'),AT(244,378,40,6),USE(?IgG:On),HIDE
                       CHECK('IgG4'),AT(192,384,40,22),USE(locIgG4),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('4', |
  '0')
                       BUTTON('      Done'),AT(504,380,100,25),USE(?Done),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  TRN
                       BUTTON('OK'),AT(0,0,35,14),USE(?OkButton),DEFAULT,HIDE
                       BUTTON('Cancel'),AT(0,0,36,14),USE(?CancelButton),HIDE
                       BOX,AT(0,16,16,98),USE(?Box1, 1001),COLOR(COLOR:Red),FILL(COLOR:Red),HIDE,LINEWIDTH(1)
                       BOX,AT(0,212,16,101),USE(?Box2, 1002),COLOR(COLOR:Blue),FILL(COLOR:Blue),HIDE,LINEWIDTH(1)
                       BOX,AT(0,112,16,101),USE(?Box3, 1004),COLOR(COLOR:Yellow),FILL(COLOR:Yellow),HIDE,LINEWIDTH(1)
                       STRING('E'),AT(0,56,16,18),USE(?String211, 2001),FONT(,14,COLOR:White,FONT:bold),CENTER,COLOR(COLOR:Red), |
  HIDE
                       STRING('G'),AT(0,256,16,17),USE(?String212, 2002),FONT(,14,COLOR:White,FONT:bold),CENTER,COLOR(COLOR:Blue), |
  HIDE
                       STRING('G4'),AT(0,160,16,17),USE(?String213, 2004),FONT(,14,COLOR:Black,FONT:bold),CENTER, |
  COLOR(COLOR:Yellow),HIDE
                       IMAGE('red.bmp'),AT(337,0,107,13),USE(?IgE:LED),HIDE
                       IMAGE('blue.bmp'),AT(553,0,107,13),USE(?IgG:LED),HIDE
                       IMAGE('yellow.bmp'),AT(445,0,107,13),USE(?IgG4:LED),HIDE
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
PopupMgr1            PopupClass
PopupMgr2            PopupClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------



ShowSelected        ROUTINE
  HIDE(1001,2004)
  UNHIDE(1000+locIgE)
  UNHIDE(2000+locIgE)
  UNHIDE(1000+locIgG)
  UNHIDE(2000+locIgG)
  UNHIDE(1000+locIgG4)
  UNHIDE(2000+locIgG4)
  IF locIgE
    UNHIDE(?IgE:On)
  ELSE
    HIDE(?IgE:On)
  .
  IF locIgG
    UNHIDE(?IgG:On)
  ELSE
    HIDE(?IgG:On)
  .
  IF locIgG4
    UNHIDE(?IgG4:On)
  ELSE
    HIDE(?IgG4:On)
  .
 HIDE(?IgE:LED,?IgG4:LED)
 ENABLE(?Page1,?Page4)
 EXECUTE CurrentPage
 DISABLE(?Page1)
 DISABLE(?Page2)
 DISABLE(?Page3)
 DISABLE(?Page4)
 .
 DISPLAY()

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
      IF ~CurrentPage OR prmAction = 1
        mdlSorts[1][1] = 1
        mdlSorts[1][2] = 4
        mdlSorts[2][1] = 5
        mdlSorts[2][2] = 8       
        
        locPage = 0   
        CLOSE(LogInTests)
        CREATE(LogInTests)
        IF ERRORCODE() THEN STOP('CREATE LT: ' & ERROR()).
        SHARE(LogInTests)
        IF ERRORCODE() THEN STOP('OPEN LT: ' & ERROR()).        
        LOOP CurrentPage = mdlSorts[gloLoginSort][1] TO mdlSorts[gloLoginSort][2]
          gloTabFileName = '..\Login\PAGE' & CurrentPage & '.TXT'
          OPEN(TabData)
          IF ERRORCODE() THEN STOP(CurrentPage & ' TabData ' & ERROR()).
          locPage += 1  
          I# = 1
          CLEAR(ActivePage)
          SET(TabData)
          LOOP UNTIL EOF(TabData)
            NEXT(TabData)
            IF I# > 252 OR ERRORCODE() THEN BREAK.
            AP:Text[I#] = ' ' &  CLIP(LEFT(SUB(TD:Data,1,4))) & ' ' &  LEFT(SUB(TD:Data,11,20))
            LT:Index = I#
            LT:Page = locPage
            LT:Code = LEFT(SUB(TD:Data,1,4))
            LT:Description = SUB(TD:Data,11,21)
            ADD(LogInTests)  
            I# += 1
          .
          IndexedPage[locPage] = TransferPage
          CLOSE(TabData)
        .
      .
      CurrentPage = 1 
      TransferPage = IndexedPage[CurrentPage]  
  GlobalErrors.SetProcedureName('LoginTests')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?AP:Checked_1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Login.Open                                        ! File Login used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  PopupMgr1.Init(INIMgr)
  PopupMgr1.AddItem('   0     0      0','0')
  PopupMgr1.AddItem('   0     0     X','1')
  PopupMgr1.AddItem('   0    X    0','2')
  PopupMgr2.Init(INIMgr)
  PopupMgr2.AddItem('===     ===       ====','0')
  PopupMgr2.AddItem('===     ===       IgG4','1')
  PopupMgr2.AddItem('===      IgG       ====','2')
  PopupMgr2.AddItem('===     IgG        IgG4','3')
  PopupMgr2.AddItem('IgE      ===      ====','4')
  PopupMgr2.AddItem('IgE      ===       IgG4','5')
  PopupMgr2.AddItem('IgE       IgG       ====','6')
  PopupMgr2.AddItem('IgE       IgG        IgG4','7')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  DO ShowSelected
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
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:Login.Close
  END
  PopupMgr1.Kill
  PopupMgr2.Kill
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
    IF EVENT() = EVENT:Accepted AND INRANGE(FIELD(),1,252)
  
      UPDATE(?)
      IF AP:Checked[FIELD()] = '1' AND (locIgE + locIgG + locIgG4)
        AP:IgE[FIELD()]  = locIgE
        AP:IgG[FIELD()]  = locIgG
        AP:IgG4[FIELD()] = locIgG4
        IF locIgE
          UNHIDE(?IgE:LED)
        ELSE
          HIDE(?IgE:LED)
        .
        IF locIgG
          UNHIDE(?IgG:LED)
        ELSE
          HIDE(?IgG:LED)
        .
        IF locIgG4
          UNHIDE(?IgG4:LED)
        ELSE
          HIDE(?IgG4:LED)
        .
      ELSE
        AP:IgE[FIELD()]  = FALSE
        AP:IgG[FIELD()]  = FALSE
        AP:IgG4[FIELD()] = FALSE
        AP:Checked[FIELD()] = '0'
        HIDE(?IgE:LED,?IgG4:LED)
      .
  
      DISPLAY(?)
      ReturnValue = 0
      RETURN ReturnValue
    .
    CASE ACCEPTED()
    OF ?Review
      SAV:Page = CurrentPage
      LoginReview
      CurrentPage = SAV:Page
      TransferPage = IndexedPage[CurrentPage]
      IF CurrentPage > 1
        IndexedPage[CurrentPage] = TransferPage
        CurrentPage = 1  ! Pollens
        TransferPage = IndexedPage[CurrentPage]
      .
      POST(EVENT:CloseWindow)
      
      
      !ActivePage           GROUP,PRE(AP),DIM(210)            ! The Active Page of Allergen Descriptions and Checked Boxes
      !Checked                STRING(1)
      !IgE                    BYTE
      !IgG                    BYTE
      !IgG4                   BYTE
      !Text                   STRING(25)
      !                     .
      !TransferPage     BYTE,DIM(SIZE(ActivePage)),OVER(ActivePage) ! Used to Move Data between Active and IndexedPage Storage
      !IndexedPage      BYTE,DIM(3,SIZE(TransferPage))              ! Hold All 3 pages of Text and Check Marked Boxes
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Add2PanelButton
      ThisWindow.Update
      POST(EVENT:CloseWindow)
      AddPanelTests
    OF ?Page1
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 1  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page2
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 2  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page3
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 3  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page4
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 4  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?locIgE
      DO ShowSelected
    OF ?locIgG
      DO ShowSelected
    OF ?locIgG4
      DO ShowSelected
    OF ?Done
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 1  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      POST(EVENT:CloseWindow)
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  IF KEYCODE() = MouseRight
    IF EVENT() <> 16
      ReturnValue = Level:Benign  
      RETURN ReturnValue
    .
    IF AP:IgE[FIELD()]
      UNHIDE(?IgE:LED)
    ELSE
      HIDE(?IgE:LED)
    .
    
    IF AP:IgG[FIELD()]
      UNHIDE(?IgG:LED)
    ELSE
      HIDE(?IgG:LED)
    .
    
    IF AP:IgG4[FIELD()]
      UNHIDE(?IgG4:LED)
    ELSE
      HIDE(?IgG4:LED)
    .
    SETKEYCODE(0)
    OMIT('XXXX')
    locEG4 = AP:IgE[FIELD()] + AP:IgG[FIELD()] + AP:IgG4[FIELD()]
    CASE locEG4
    OF 0
      PopupMgr2.SetItemEnable('0',FALSE)
    OF 1
      PopupMgr2.SetItemEnable('1',FALSE)
    OF 2
      PopupMgr2.SetItemEnable('2',FALSE)
    OF 3
      PopupMgr2.SetItemEnable('3',FALSE)
    OF 4
      PopupMgr2.SetItemEnable('4',FALSE)
    OF 5
      PopupMgr2.SetItemEnable('5',FALSE)
    OF 6
      PopupMgr2.SetItemEnable('6',FALSE)
    OF 7
      PopupMgr2.SetItemEnable('7',FALSE)
    .
  
  EGG4=PopupMgr2.Ask()
    AP:Checked[FIELD()] = '1'
    CASE EGG4
    OF '0'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 0
      AP:Checked[FIELD()] = '0'
    OF '1'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 1
    OF '2'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 0
    OF '3'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 1
    OF '4'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 0
    OF '5'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 1
    OF '6'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 0
    OF '7'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 1
    .
    DISPLAY(FIELD())
  
  
  
    CASE locEG4
    OF 0
      PopupMgr2.SetItemEnable('0',TRUE)
    OF 1
      PopupMgr2.SetItemEnable('1',TRUE)
    OF 2
      PopupMgr2.SetItemEnable('2',TRUE)
    OF 3
      PopupMgr2.SetItemEnable('3',TRUE)
    OF 4
      PopupMgr2.SetItemEnable('4',TRUE)
    OF 5
      PopupMgr2.SetItemEnable('5',TRUE)
    OF 6
      PopupMgr2.SetItemEnable('6',TRUE)
    OF 7
      PopupMgr2.SetItemEnable('7',TRUE)
    .
     XXXX
  .
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
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
    CASE EVENT()
    OF EVENT:OpenWindow
      IF prmAction = 1  
        gloLoginSort = GETINI('Login','LoginSort',2,'ALIS.INI')
        UNHIDE(?Add2PanelButton)
        HIDE(?DONE)
        HIDE(?REVIEW)
        mdlSorts[1][1] = 1
        mdlSorts[1][2] = 4
        mdlSorts[2][1] = 5
        mdlSorts[2][2] = 8 
      .
      
      DO ShowSelected
      IF mdlEntryPoint THEN POST(EVENT:Accepted,?Review).
      DISPLAY()
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
LoginMain PROCEDURE 

locName              STRING(40)                            !
locPage              LONG                                  !
locLanguage          BYTE                                  !
locCheckBox          SHORT                                 !
locAddress           STRING(40)                            !
SAV:Initials         LIKE(PAT:ENTERED_BY)                  !
SAV:Client           LIKE(PAT:Client)                      !
SAV:Last             LIKE(PAT:Last)                        !
SAV:Invoice          LONG                                  !
locPatientMessage    STRING(60)                            !
locRecordCreated     BYTE                                  !
locAllowNoVolume     BYTE                                  !
locDays              ULONG                                 !
EGG4                 STRING(1)                             !
locEG4               BYTE                                  !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(0,0,681,414),FONT('Arial',8),GRAY,MDI
                       ENTRY(@s2),AT(80,4,37,10),USE(Pat:ENTERED_BY),FONT(,10,,FONT:bold),UPR
                       ENTRY(@n_6),AT(80,16,37,10),USE(Pat:CLIENT),FONT(,10,,FONT:bold),RIGHT(2),INS,IMM
                       ENTRY(@s40),AT(80,28,99,10),USE(Pat:LAST),FONT(,10,,FONT:bold),CAP
                       ENTRY(@s15),AT(80,40,99,10),USE(Pat:FIRST),FONT(,10,,FONT:bold),CAP
                       ENTRY(@D2),AT(80,52,55,9),USE(Pat:DOB),FONT(,10,,FONT:bold),RIGHT(1)
                       ENTRY(@n2),AT(80,64,20,10),USE(Pat:AGE),FONT(,10,,FONT:bold),RIGHT
                       OPTION,AT(104,64,97,11),USE(Pat:AGE_TYPE),FONT(,,,FONT:bold)
                         RADIO('Years'),AT(108,62,52,14),USE(?Age:Years),COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('Y')
                         RADIO('Months'),AT(160,62,52,14),USE(?Age:Months),COLOR(COLOR:Yellow),ICON(ICON:None),TRN, |
  VALUE('M')
                       END
                       ENTRY(@D1),AT(80,76,55,9),USE(Pat:COLLECTION),FONT(,10,,FONT:bold)
                       ENTRY(@s15),AT(80,88,99,10),USE(Pat:CLIENT_ID),FONT(,10,,FONT:bold)
                       OPTION('Sex'),AT(80,104,105,12),USE(Pat:SEX),FONT(,,,FONT:bold),TRN
                         RADIO('Male'),AT(84,102,52,14),USE(?Option1:Radio1),FONT(,10,,FONT:bold),COLOR(COLOR:Aqua), |
  ICON(ICON:None),TRN,VALUE('M')
                         RADIO('Female'),AT(136,102,52,14),USE(?Option1:Radio2),FONT(,10,,FONT:bold),COLOR(COLOR:Red), |
  ICON(ICON:None),TRN,VALUE('F')
                       END
                       ENTRY(@n5.1),AT(80,120,37,10),USE(Pat:VOLUME1),FONT(,10,,FONT:bold),RIGHT(2)
                       ENTRY(@n5.1),AT(80,132,37,10),USE(Pat:VOLUME2),FONT(,10,,FONT:bold),RIGHT(2)
                       ENTRY(@n5.1),AT(80,144,37,10),USE(Pat:Volume3),FONT(,10,,FONT:bold),RIGHT(2)
                       OPTION('Specimen Type'),AT(127,118,,37),USE(Pat:SpecimenType),BOXED
                         RADIO('Serum'),AT(136,128,60,14),USE(?OPTION1:RADIO3),FONT(,10,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('1')
                         RADIO('Finger Stick'),AT(136,143,60,14),USE(?PAT:SPECIMENTYPE:RADIO1),FONT(,10,,FONT:bold), |
  ICON(ICON:None),TRN,VALUE('2')
                       END
                       IMAGE('red.bmp'),AT(24,5),USE(?RedLED:Initials),CENTERED
                       OPTION('Billing'),AT(79,160,123,67),USE(Pat:BILLING),FONT(,,,FONT:bold),TRN
                         RADIO('Client'),AT(83,164,57,11),USE(?Option2:Radio1),FONT(,10),COLOR(COLOR:Yellow),ICON(ICON:None), |
  FLAT,TRN,VALUE('C')
                         RADIO('Patient'),AT(143,164,57,11),USE(?Option2:Radio2),FONT(,10),COLOR(COLOR:Yellow),ICON(ICON:None), |
  FLAT,TRN,VALUE('P')
                         RADIO('Insurance'),AT(83,178,57,11),USE(?Option2:Radio3),FONT(,10),COLOR(COLOR:Yellow),FLAT, |
  TRN,VALUE('I')
                         RADIO('No Charge/Evaluation'),AT(83,205,113,11),USE(?Pat:BILLING:Eval),FONT(,10),COLOR(COLOR:Yellow), |
  ICON(ICON:None),FLAT,TRN,VALUE('E')
                         RADIO('Medicaid'),AT(83,191,57,11),USE(?Option2:Radio4),FONT(,10),COLOR(COLOR:Yellow),ICON(ICON:None), |
  FLAT,TRN,VALUE('A')
                         RADIO('Medicare'),AT(143,191,57,11),USE(?PAT:Billing:Radio8),FONT(,10),COLOR(COLOR:Yellow), |
  ICON(ICON:None),FLAT,TRN,VALUE('M')
                       END
                       OPTION,AT(80,246,173,16),USE(Pat:SIGNATURE)
                         RADIO('Received'),AT(80,246,50,14),USE(?Pat:SIGNATURE:Received),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Lime),ICON(ICON:None),TRN,VALUE('R')
                         RADIO('Requested'),AT(184,246,50,14),USE(?Pat:SIGNATURE:Requesred),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Yellow),ICON(ICON:None),TRN,VALUE('Q')
                         RADIO('Needed'),AT(132,246,50,14),USE(?Pat:SIGNATURE:Needed),FONT(,10,,FONT:bold,CHARSET:ANSI), |
  COLOR(COLOR:Red),ICON(ICON:None),TRN,VALUE('N')
                       END
                       OPTION,AT(82,266,171,13),USE(Pat:ReportLanguage),FONT(,,,FONT:bold)
                         RADIO('English'),AT(80,266,50,14),USE(?Option4:Radio1),FONT(,10,,FONT:bold),COLOR(COLOR:Lime), |
  ICON(ICON:None),TRN,VALUE('E')
                         RADIO('Spanish'),AT(132,266,50,14),USE(?Option4:Radio2),FONT(,10,,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN,VALUE('S')
                         RADIO('Both'),AT(184,266,50,14),USE(?Option4:Radio3),FONT(,10,,FONT:bold),COLOR(COLOR:Yellow), |
  ICON(ICON:None),TRN,VALUE('B')
                       END
                       BUTTON('Select Tests'),AT(80,282,95,25),USE(?TestButton),FONT(,10,,FONT:bold),TRN
                       IMAGE('red.bmp'),AT(24,66),USE(?RedLED:Age),CENTERED
                       BUTTON('Review Tests'),AT(80,310,95,25),USE(?ViewTestButton),FONT(,10,,FONT:bold),TRN
                       IMAGE('red.bmp'),AT(24,105),USE(?RedLED:Sex),CENTERED
                       STRING(@S32),AT(192,118),USE(ErrorText),FONT(,,COLOR:Red,FONT:bold,CHARSET:ANSI),RIGHT,TRN
                       CHECK('Credit Card'),AT(224,197,97,14),USE(Pat:CreditCard),FONT(,10,,FONT:bold),ICON(ICON:None), |
  HIDE,TRN,VALUE('1','0')
                       CHECK('History Enclosed'),AT(224,210,97,14),USE(Pat:RESULTS),FONT(,10,,FONT:bold),ICON(ICON:None), |
  HIDE,TRN
                       IMAGE('lime.bmp'),AT(208,216,12,6),USE(?RedLED:History),CENTERED,HIDE
                       CHECK('Supplies Request'),AT(80,228,97,14),USE(Pat:SUPPLIES),FONT(,10,,FONT:bold),ICON(ICON:None), |
  TRN,VALUE('Y','N')
                       IMAGE('red.bmp'),AT(24,252),USE(?RedLED:Signature),CENTERED
                       STRING('Signature'),AT(39,251),USE(?String73),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                       IMAGE('red.bmp'),AT(24,270),USE(?RedLED:Language),CENTERED
                       BUTTON('Cancel'),AT(80,338,95,25),USE(?NextPatient),FONT(,10,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  TRN
                       BUTTON('More Volume'),AT(224,170,95,14),USE(?Volume),FONT(,10,,FONT:bold),TRN
                       BUTTON('Patient Label'),AT(224,125,95,14),USE(?PatientLabel),FONT(,10,,FONT:bold),DISABLE, |
  TRN
                       BUTTON('Serum Label 1'),AT(224,140,95,14),USE(?SerumLabel1),FONT(,10,,FONT:bold),DISABLE,TRN
                       BUTTON('Serum Label 2'),AT(224,155,95,14),USE(?SerumLabel2),FONT(,10,,FONT:bold),DISABLE,TRN
                       STRING('Billing'),AT(52,160),USE(?String71),FONT(,,,FONT:bold),TRN
                       STRING('Patient First Name'),AT(8,40),USE(?String99),FONT(,,,FONT:bold),TRN
                       STRING('DOB'),AT(60,52),USE(?String69),FONT(,,,FONT:bold),TRN
                       STRING('Initials'),AT(51,4),USE(?String123),FONT(,,,FONT:bold),TRN
                       BUTTON('Done'),AT(0,390,70,25),USE(?Done),FONT(,10,,FONT:bold),LEFT,ICON(ICON:Tick),HIDE,STD(STD:Close), |
  TRN
                       STRING(@s60),AT(186,382,357,10),USE(locPatientMessage),FONT(,12,COLOR:Red,FONT:bold,CHARSET:ANSI), |
  LEFT,COLOR(COLOR:White)
                       STRING(@D3),AT(218,362),USE(Pat:DATE),FONT(,12,,FONT:bold),TRN
                       CHECK,AT(512,8,10,10),USE(StdPanelCheckBox[1]),TRN,VALUE('1','0')
                       CHECK,AT(512,18,10,10),USE(StdPanelCheckBox[2]),TRN,VALUE('1','0')
                       CHECK,AT(512,28,10,10),USE(StdPanelCheckBox[3]),TRN,VALUE('1','0')
                       CHECK,AT(512,38,10,10),USE(StdPanelCheckBox[4]),TRN,VALUE('1','0')
                       CHECK,AT(512,48,10,10),USE(StdPanelCheckBox[5]),TRN,VALUE('1','0')
                       CHECK,AT(512,58,10,10),USE(StdPanelCheckBox[6]),TRN,VALUE('1','0')
                       CHECK,AT(512,68,10,10),USE(StdPanelCheckBox[7]),TRN,VALUE('1','0')
                       CHECK,AT(512,78,10,10),USE(StdPanelCheckBox[8]),TRN,VALUE('1','0')
                       CHECK,AT(512,88,10,10),USE(StdPanelCheckBox[9]),TRN,VALUE('1','0')
                       CHECK,AT(512,98,10,10),USE(StdPanelCheckBox[10]),TRN,VALUE('1','0')
                       CHECK,AT(512,108,10,10),USE(StdPanelCheckBox[11]),TRN,VALUE('1','0')
                       CHECK,AT(512,118,10,10),USE(StdPanelCheckBox[12]),TRN,VALUE('1','0')
                       CHECK,AT(512,128,10,10),USE(StdPanelCheckBox[13]),TRN,VALUE('1','0')
                       CHECK,AT(512,138,10,10),USE(StdPanelCheckBox[14]),TRN,VALUE('1','0')
                       CHECK,AT(512,148,10,10),USE(StdPanelCheckBox[15]),TRN,VALUE('1','0')
                       CHECK,AT(512,158,10,10),USE(StdPanelCheckBox[16]),TRN,VALUE('1','0')
                       CHECK,AT(512,168,10,10),USE(StdPanelCheckBox[17]),TRN,VALUE('1','0')
                       CHECK,AT(512,178,10,10),USE(StdPanelCheckBox[18]),TRN,VALUE('1','0')
                       CHECK,AT(512,188,10,10),USE(StdPanelCheckBox[19]),TRN,VALUE('1','0')
                       CHECK,AT(512,198,10,10),USE(StdPanelCheckBox[20]),TRN,VALUE('1','0')
                       CHECK,AT(512,208,10,10),USE(StdPanelCheckBox[21]),TRN,VALUE('1','0')
                       CHECK,AT(512,218,10,10),USE(StdPanelCheckBox[22]),TRN,VALUE('1','0')
                       CHECK,AT(512,228,10,10),USE(StdPanelCheckBox[23]),TRN,VALUE('1','0')
                       CHECK,AT(512,238,10,10),USE(StdPanelCheckBox[24]),TRN,VALUE('1','0')
                       CHECK,AT(512,248,10,10),USE(StdPanelCheckBox[25]),TRN,VALUE('1','0')
                       CHECK,AT(512,258,10,10),USE(StdPanelCheckBox[26]),TRN,VALUE('1','0')
                       CHECK,AT(512,268,10,10),USE(StdPanelCheckBox[27]),TRN,VALUE('1','0')
                       CHECK,AT(512,278,10,10),USE(StdPanelCheckBox[28]),TRN,VALUE('1','0')
                       CHECK,AT(512,288,10,10),USE(StdPanelCheckBox[29]),TRN,VALUE('1','0')
                       CHECK,AT(512,298,10,10),USE(StdPanelCheckBox[30]),TRN,VALUE('1','0')
                       CHECK,AT(338,120,10,10),USE(PanelCheckBox[1]),TRN,VALUE('1','0')
                       CHECK,AT(338,130,10,10),USE(PanelCheckBox[2]),TRN,VALUE('1','0')
                       CHECK,AT(338,140,10,10),USE(PanelCheckBox[3]),TRN,VALUE('1','0')
                       CHECK,AT(338,150,10,10),USE(PanelCheckBox[4]),TRN,VALUE('1','0')
                       CHECK,AT(338,160,10,10),USE(PanelCheckBox[5]),TRN,VALUE('1','0')
                       CHECK,AT(338,170,10,10),USE(PanelCheckBox[6]),TRN,VALUE('1','0')
                       CHECK,AT(338,180,10,10),USE(PanelCheckBox[7]),TRN,VALUE('1','0')
                       CHECK,AT(338,190,10,10),USE(PanelCheckBox[8]),TRN,VALUE('1','0')
                       CHECK,AT(338,200,10,10),USE(PanelCheckBox[9]),TRN,VALUE('1','0')
                       CHECK,AT(338,210,10,10),USE(PanelCheckBox[10]),TRN,VALUE('1','0')
                       CHECK,AT(338,220,10,10),USE(PanelCheckBox[11]),TRN,VALUE('1','0')
                       CHECK,AT(338,230,10,10),USE(PanelCheckBox[12]),TRN,VALUE('1','0')
                       CHECK,AT(338,240,10,10),USE(PanelCheckBox[13]),TRN,VALUE('1','0')
                       CHECK,AT(338,250,10,10),USE(PanelCheckBox[14]),TRN,VALUE('1','0')
                       CHECK,AT(338,260,10,10),USE(PanelCheckBox[15]),TRN,VALUE('1','0')
                       CHECK,AT(338,270,10,10),USE(PanelCheckBox[16]),TRN,VALUE('1','0')
                       CHECK,AT(338,280,10,10),USE(PanelCheckBox[17]),TRN,VALUE('1','0')
                       CHECK,AT(338,290,10,10),USE(PanelCheckBox[18]),TRN,VALUE('1','0')
                       CHECK,AT(338,300,10,10),USE(PanelCheckBox[19]),TRN,VALUE('1','0')
                       CHECK,AT(338,310,10,10),USE(PanelCheckBox[20]),TRN,VALUE('1','0')
                       STRING(@s40),AT(350,120,140,10),USE(PanelText[1]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,130,140,10),USE(PanelText[2]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,140,140,10),USE(PanelText[3]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,150,140,10),USE(PanelText[4]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,160,140,10),USE(PanelText[5]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,170,140,10),USE(PanelText[6]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,180,140,10),USE(PanelText[7]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,190,140,10),USE(PanelText[8]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,200,140,10),USE(PanelText[9]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,210,140,10),USE(PanelText[10]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,220,140,10),USE(PanelText[11]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,230,140,10),USE(PanelText[12]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,240,140,10),USE(PanelText[13]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,250,140,10),USE(PanelText[14]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,260,140,10),USE(PanelText[15]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,270,140,10),USE(PanelText[16]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,280,140,10),USE(PanelText[17]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,290,140,10),USE(PanelText[18]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,300,140,10),USE(PanelText[19]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(350,310,140,10),USE(PanelText[20]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,8,140,10),USE(StdPanelText[1]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,18,140,10),USE(StdPanelText[2]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,28,140,10),USE(StdPanelText[3]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,38,140,10),USE(StdPanelText[4]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       TEXT,AT(220,48,277,20),USE(gloPatientNotes[1]),BOXED
                       TEXT,AT(220,72,250,45),USE(CLI:FOLLOW1),FONT(,,COLOR:Red,,CHARSET:ANSI),BOXED,COLOR(COLOR:White), |
  FLAT,READONLY,SKIP
                       STRING(@s40),AT(524,48,140,10),USE(StdPanelText[5]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,58,140,10),USE(StdPanelText[6]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,68,140,10),USE(StdPanelText[7]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,78,140,10),USE(StdPanelText[8]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,88,140,10),USE(StdPanelText[9]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,98,140,10),USE(StdPanelText[10]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,108,140,10),USE(StdPanelText[11]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,118,140,10),USE(StdPanelText[12]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,128,140,10),USE(StdPanelText[13]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,138,140,10),USE(StdPanelText[14]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING('Volume 3'),AT(39,145),USE(?StringVolume3),FONT(,,,FONT:bold),TRN
                       STRING(@s40),AT(524,148,140,10),USE(StdPanelText[15]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,158,140,10),USE(StdPanelText[16]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,168,140,10),USE(StdPanelText[17]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,178,140,10),USE(StdPanelText[18]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,188,140,10),USE(StdPanelText[19]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,198,140,10),USE(StdPanelText[20]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,208,140,10),USE(StdPanelText[21]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,218,140,10),USE(StdPanelText[22]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,228,140,10),USE(StdPanelText[23]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,238,140,10),USE(StdPanelText[24]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,248,140,10),USE(StdPanelText[25]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,258,140,10),USE(StdPanelText[26]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,268,140,10),USE(StdPanelText[27]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING('Language'),AT(38,268),USE(?String74),FONT(,,,FONT:bold,CHARSET:ANSI),TRN
                       STRING(@s40),AT(524,278,140,10),USE(StdPanelText[28]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       STRING(@s40),AT(524,288,140,10),USE(StdPanelText[29]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       IMAGE('button.jpg'),AT(80,310,95,25),USE(?Image11)
                       STRING(@s40),AT(524,298,140,10),USE(StdPanelText[30]),FONT('Arial Narrow',10,,FONT:bold,CHARSET:ANSI), |
  TRN
                       IMAGE('button.jpg'),AT(80,282,95,25),USE(?Image12)
                       STRING('Sex'),AT(56,104,21,10),USE(?String70),FONT(,,,FONT:bold),RIGHT,TRN
                       IMAGE('red.bmp'),AT(24,122),USE(?RedLED:Volume),CENTERED
                       PANEL,AT(79,161,123,67),USE(?Panel1),BEVEL(-1,-1)
                       IMAGE('red.bmp'),AT(24,161),USE(?RedLED:Billing),CENTERED
                       IMAGE('lime.bmp'),AT(66,234),USE(?RedLED:Supplies),CENTERED
                       BUTTON('Fax Request'),AT(240,246,70,14),USE(?FaxRequest),FONT(,,,FONT:bold),ICON(ICON:None), |
  HIDE,TRN
                       BUTTON('Email Request'),AT(241,228,69,14),USE(?EmailRequest),FONT(,,,FONT:bold),ICON(ICON:None), |
  HIDE,TRN
                       STRING('In House Patient Comments'),AT(192,314),USE(?String72),TRN
                       IMAGE('mx.gif'),AT(252,266),USE(?MexImage)
                       STRING('Volume 1'),AT(40,120),USE(?String64),FONT(,,,FONT:bold),TRN
                       STRING('Volume 2'),AT(40,132),USE(?String65),FONT(,,,FONT:bold),TRN
                       STRING(@s40),AT(250,16),USE(CLI:CONTACT),FONT(,10,,FONT:bold),TRN
                       BUTTON('Clear'),AT(122,12,37,14),USE(?ClearClient),FONT(,,,FONT:bold),SKIP,TRN
                       STRING(@s40),AT(250,36),USE(CLI:PHONE),FONT(,10,,FONT:bold),TRN
                       STRING(@s40),AT(250,26),USE(locAddress),FONT(,10,,FONT:bold),TRN
                       STRING(@s40),AT(250,6),USE(locName),FONT(,10,,FONT:bold),TRN
                       STRING('Date'),AT(186,362),USE(?String93),FONT(,12,,FONT:bold),TRN
                       STRING('Client Number'),AT(22,16),USE(?String91),FONT(,,,FONT:bold),TRN
                       STRING('Patient Number'),AT(186,372,79,11),USE(?String92),FONT(,12,,FONT:bold),TRN
                       STRING(@p### ###pB),AT(268,372,59,11),USE(Pat:INVOICE),FONT(,12,,FONT:bold),TRN
                       STRING('Patient Last Name'),AT(9,28),USE(?String94),FONT(,,,FONT:bold),TRN
                       STRING('Age'),AT(60,64),USE(?String96),FONT(,,,FONT:bold),TRN
                       STRING('Collection Date'),AT(20,76),USE(?String97),FONT(,,,FONT:bold),TRN
                       STRING('Specimen ID'),AT(17,90,58,10),USE(?String98),FONT(,,,FONT:bold,CHARSET:ANSI),RIGHT, |
  TRN
                       TEXT,AT(190,322,353,39),USE(Pat:InHouseComments),FONT(,10,COLOR:Black),BOXED,COLOR(COLOR:White), |
  FLAT
                       IMAGE('en.gif'),AT(252,266),USE(?EnglishImage)
                       IMAGE('button.jpg'),AT(80,338,95,25),USE(?Image10)
                       BUTTON('Same'),AT(161,12,37,14),USE(?SameClient),FONT(,,,FONT:bold),SKIP,TRN
                       BUTTON('Lookup'),AT(200,12,37,14),USE(?LookupClient),FONT(,,,FONT:bold),SKIP,TRN
                       BUTTON('Physicians'),AT(420,32,77,14),USE(?PhysicianButton)
                       STRING(@s3),AT(565,374),USE(gloInitials)
                       STRING(@s3),AT(565,384),USE(SAV:Initials,,?gloInitials:2)
                       ENTRY(@n-14),AT(268,372,37,10),USE(Pat:INVOICE,,?Pat:INVOICE:2),RIGHT(2)
                       CHECK('Alpha Sort'),AT(257,297),USE(gloLoginSort),ICON(ICON:None),TRN,VALUE('2','1')
                     END

NoVolume WINDOW('No Volume'),AT(,,280,124),FONT('MS Sans Serif',8,,FONT:regular),GRAY
       STRING('No Volume'),AT(65,24,57,10),USE(?String1)
       CHECK('Allow No Volume for this Patient'),AT(66,37),USE(locAllowNoVolume)
       BUTTON('&OK'),AT(163,58,62,25),USE(?nvOK),LEFT,ICON(ICON:Tick),DEFAULT
     END

locPatientRecord  LIKE(PAT:Record)
locBillingRecord  LIKE(BILL:Record)
locClaimsRecord  LIKE(CLM:Record)

Patient4Weeks WINDOW('Same Patient, 4 Weeks'),AT(170,20,295,244),FONT('MS Sans Serif',8,,),ICON('Allermetrix.ico'), |
         SYSTEM,GRAY,DOUBLE
       STRING(@s40),AT(74,34),USE(PAT4:Last),TRN,LEFT
       STRING(@n_6),AT(146,44),USE(PAT4:Number),TRN,LEFT,FONT(,14,,FONT:bold)
       STRING('Accession:'),AT(74,46),USE(?String5),TRN,LEFT,FONT(,10,,FONT:bold)
       STRING(@s40),AT(74,22),USE(PAT4:First),TRN,LEFT
       BUTTON('View Tests'),AT(216,32,69,13),USE(?ButtonViewTests),TRN,FONT(,,,FONT:bold)
       BUTTON('&OK'),AT(196,72,53,14),USE(?OkButton),STD(STD:Close),DEFAULT
       STRING('Same Patient, 4 Weeks'),AT(0,0,295,18),USE(?StringTitle),CENTER,FONT(,14,COLOR:Red,FONT:bold), |
           COLOR(COLOR:White)
     END


! Demension bounds
! gloStdPanelCodes 30
! StdPanelCheckBox 30
! StdPanelText 30


! gloPanelCodes 20

! PanelCheckBox 20
! PanelText 20
! SortIndex 26

! IndexedPage 3,210
! TransferPage 630
! PageCheckBox 630
! Selections 630
! locCodes 630

! ActivePage 210
! AllPages 620
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeSelected           PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
LoadData  ROUTINE
  mdlSorts[1][1] = 1
  mdlSorts[1][2] = 4
  mdlSorts[2][1] = 5
  mdlSorts[2][2] = 8       
  CurrentPage = 0 

  locPage = 0

  gloTabFileName = '..\Login\PANELS.TXT'
  HIDE(?StdPanelCheckBox_1,?StdPanelCheckBox_30)
  HIDE(?PanelCheckBox_1,?PanelCheckBox_20)
  OPEN(TabData)
  IF ERRORCODE() THEN STOP(ERROR()).
  I# = 1
  locCheckBox = ?StdPanelCheckBox_1
  SET(TabData)
  LOOP UNTIL EOF(TabData)
    NEXT(TabData)
    IF ERRORCODE() THEN STOP(ERROR()).
    IF I# > 30
!      MESSAGE('TOO MANY LINES IN ' & gloTabFileName)
      BREAK
    .
    gloStdPanelCodes[I#] = SUB(TD:Data,1,10)
    StdPanelText[I#] = CLIP(gloStdPanelCodes[I#]) & ' ' & SUB(TD:Data,11,40)
    IF LEN(CLIP(StdPanelText[I#])) > 4
      UNHIDE(locCheckBox)
      locCheckBox += 1
      I# += 1
    .
    
   

    
  .
  CLOSE(TabData)
  
  SortIndex[VAL('C')-64] = 1
  SortIndex[VAL('D')-64] = 2
  SortIndex[VAL('H')-64] = 3
  SortIndex[VAL('E')-64] = 4
  SortIndex[VAL('F')-64] = 5
  SortIndex[VAL('G')-64] = 6
  SortIndex[VAL('I')-64] = 7
  SortIndex[VAL('M')-64] = 8
  SortIndex[VAL('K')-64] = 9
  SortIndex[VAL('T')-64] = 10
  SortIndex[VAL('W')-64] = 11
  SortIndex[VAL('Z')-64] = 12
  SortIndex[VAL('S')-64] = 13

GetInvoice          ROUTINE
  IF locRecordCreated THEN EXIT.
  CLEAR(PAT:Record,1)
  Pat:INVOICE = 599999
  SET(PAT:INVOICE_KEY,PAT:INVOICE_KEY)
  PREVIOUS(Patient)
  INVOICE# = PAT:Invoice + 1
  IF gloAddOn = 1
    SAV:Invoice = INVOICE#
    EXIT
  .
  GET(Patient,0)
  CLEAR(PAT:Record)                                         
  PAT:Invoice = INVOICE#
  PAT:Date = TODAY()
  PAT:AGE_TYPE = 'Y'
  IF SAV:Initials
    PAT:Entered_by = SAV:Initials
  ELSE
    PAT:Entered_by = gloInitials
    SAV:Initials = gloInitials
  .
  PAT:Client = SAV:Client
  PAT:Last = SAV:Last
  PAT:ReportLanguage = CLI:Language
  Pat:SpecimenType = 1
  !Pat:SIGNATURE = 'N'
  SELECT(?PAT:First)
  Pat:ACCESSION = PAT:Invoice
  ADD(Patient)
  IF ERRORCODE()
    STOP('ADD NEW PATIENT: ' & ERROR())
    locPatientMessage = 'Patient Record Error, ' & PAT:Invoice & ': ' & ERROR()
    locRecordCreated = 0
  ELSE
    locPatientMessage = 'Patient Record Created ' & PAT:Invoice
    ?NextPatient{PROP:Text} = 'Next Patient'
    locRecordCreated = 1
    OL:Date = TODAY()
    OL:Time = CLOCK()
    OL:Number = Pat:INVOICE
    OL:PCAE = ONLINE:Patient + ONLINE:Add
    ADD(Online)
  .
  IF locLanguage
    HIDE(?EnglishImage)
    UNHIDE(?MexImage)
  ELSE
    UNHIDE(?EnglishImage)
    HIDE(?MexImage)
  .
  PAT:Status = ''
  HIDE(?PAT:Invoice:2)
  DISPLAY()

GetClient   ROUTINE
  HIDE(?PAT:Invoice:2)
  Pat:ReportLanguage = CLI:Language
  locName = CLIP(CLI:LAST) & ', ' & CLIP(CLI:First) & ' ' & CLI:Degree
  locAddress = CLIP(CLI:City) & ', ' & CLI:State & ' ' & CLI:Zip
  I# = 0

  locCheckBox = ?PanelCheckBox_1  
  HIDE(?PanelCheckBox_1,?PanelCheckBox_20)
  CLEAR(PanelText[])
  CLEAR(PanelCheckBox[])
  CP:Client = Pat:CLIENT
  CP:Panel = ''
  SET(CP:Order_Key,CP:Order_Key)
  LOOP 
    NEXT(Cli_Panl)
    IF CP:Client <> Pat:CLIENT OR ERRORCODE() THEN BREAK.
    I# += 1
    IF I# > 20 THEN BREAK.
    PanelText[I#] = CLIP(CP:Panel) & ' ' & CP:Description
    gloPanelCodes[I#] = CP:Panel
    UNHIDE(locCheckBox)
    locCheckBox += 1

  .
  IF PAT:ReportLanguage = 'S'
    locLanguage = 16
    HIDE(?EnglishImage)
    UNHIDE(?MexImage)
    gloLoginSort = 1
  ELSE
    locLanguage = 0
    UNHIDE(?EnglishImage)
    HIDE(?MexImage)
    gloLoginSort = GETINI('Login','LoginSort',,'ALIS.INI')
  .

  DISPLAY()
  SELECT(?Pat:LAST)
  SAV:Client = PAT:Client

InitSerialPort       ROUTINE
  ErrorText = ''
  DISPLAY()
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
    ErrorText = 'No Printer: DTR=' & DTR & '  CTS=' & CTS
  ELSE
    ENABLE(?PatientLabel,?SerumLabel2)
  .


Check4Week  ROUTINE
  IF INRANGE(Pat:DOB,DATE(1,1,1900),TODAY()) AND LEN(CLIP(PAT:Last)) > 2
    PAT4:DOB =  Pat:DOB
    PAT4:Last =  Pat:LAST
    GET(Patient4Week,PAT4:OrderKey)
    IF ~ERRORCODE()
      OPEN(Patient4Weeks)
      0{PROP:Wallpaper} = gloWallpaper
      ACCEPT
        IF EVENT() = EVENT:Accepted
          IF FIELD() = ?ButtonViewTests
            PatientTests(PAT4:Number)
          .
          BREAK
      . .
      CLOSE(Patient4Weeks)
    .
  .



ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LoginMain')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Pat:ENTERED_BY
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Claims.Open                                       ! File Claims used by this procedure, so make sure it's RelationManager is open
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Online.Open                                       ! File Online used by this procedure, so make sure it's RelationManager is open
  Relate:Patient4Week.Open                                 ! File Patient4Week used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Relate:Rast.Open                                         ! File Rast used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Supplies.UseFile                                  ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('LoginMain',Window)                         ! Restore window settings from non-volatile store
  IF ?Pat:RESULTS{Prop:Checked}
    UNHIDE(?RedLED:History)
  END
  IF NOT ?Pat:RESULTS{PROP:Checked}
    HIDE(?RedLED:History)
  END
  IF ?Pat:SUPPLIES{Prop:Checked}
    UNHIDE(?RedLED:Supplies)
  END
  IF NOT ?Pat:SUPPLIES{PROP:Checked}
    HIDE(?RedLED:Supplies)
  END
  SELF.SetAlerts()
  CLOSE(Test)
  0{PROP:Wallpaper} = gloWallpaper
  DO LoadData
  Pat:ENTERED_BY = gloInitials
  SAV:Initials = gloInitials
  DISPLAY()
  gloMonitoringLoginTest = FALSE
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
    Relate:Claims.Close
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:Online.Close
    Relate:Patient4Week.Close
    Relate:Pnl_test.Close
    Relate:Rast.Close
  END
  IF SELF.Opened
    INIMgr.Update('LoginMain',Window)                      ! Save window data to non-volatile store
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
    OF ?Pat:LAST
      IF locRecordCreated THEN CYCLE.
      DO Check4Week
      SAV:Client = PAT:Client
      SAV:Last = PAT:Last
      SAV:Initials = PAT:Entered_By
      DO GetInvoice
    OF ?Pat:DOB
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
        .
      .
      DISPLAY(?PAT:Age,?PAT:AGE_TYPE)
      DO Check4Week
    OF ?TestButton
      mdlEntryPoint = 0
      HIDE(?gloLoginSort)
      LoginTests(0)
    OF ?ViewTestButton
      mdlEntryPoint = 1
      LoginTests(0)
    OF ?NextPatient
        IF gloAddOn = 2
          gloThreadedReturn = 2
          GenerateOutput
          POST(EVENT:CloseWindow)
          RETURN(0)
        .
        
      
           UNHIDE(?gloLoginSort)
           IF locRecordCreated
              UPDATE
              PAT:VERIFIED_BY = ''
              IF ~PAT:ENTERED_BY
                SELECT(PAT:ENTERED_BY)
                CYCLE
              .
              locPatientMessage = 'Checking Volume'
              DISPLAY(?locPatientMessage)
              locAllowNoVolume = 0
              PAT:Volume = PAT:Volume1 + PAT:volume2 + PAT:volume3 + PAT:volume4 + PAT:volume5
              IF PAT:Volume < .1
                OPEN(NoVolume)
                ACCEPT
                  IF FIELD() = ?nvOK AND EVENT() = EVENT:ACCEPTED
                    CLOSE(NoVolume)
                    BREAK
                . .
              .
              IF ~INRANGE(Pat:SpecimenType,1,2)
                SELECT(?Pat:SpecimenType)
                CYCLE
              .
              IF PAT:Volume < .1 AND Pat:SpecimenType = 1
                IF ~locAllowNoVolume
                  SELECT(?PAT:Volume1)
                  CYCLE
                .
              .
              locPatientMessage = 'Checking Supplies'
              DISPLAY(?locPatientMessage)
              IF Pat:SUPPLIES = 'Y'
                SUP:Client = Pat:CLIENT
                SUP:Shipped = 0
                SUP:Date =   TODAY() + 1
                SET(SUP:FindUnShippedKey,SUP:FindUnShippedKey)
                NEXT(Supplies)
                IF SUP:Client = PAT:Client AND SUP:Shipped
                  CLEAR(SUP:Record)
                  SUP:Initials = PAT:Entered_by
                  SUP:Client = Pat:CLIENT
                  SUP:Date =   TODAY()
                  SUP:Note = 'Added at Log In'
                  ADD(Supplies)
                .
              .
              locPatientMessage = 'Saving Patient'
              DISPLAY(?locPatientMessage)
              PAT:Status = 'L'
              PUT(Patient)
              IF ERRORCODE()
                STOP('Update Patient Error: ' & ERROR())
              .
              CurrentPage = 0
              locPatientMessage = 'Generating Output'
              DISPLAY(?locPatientMessage)
              
              GenerateOutput
      
           !   IF ~gloMonitoringLoginTest THEN STOP('TESTS ARE NOT BEING ADDED TO PATIENT').
              gloMonitoringLoginTest = FALSE
              Pat:RESULTS = ''
              Pat:SUPPLIES = 'N'
              Pat:SIGNATURE = ''
              PAT:Status = ''
              IF gloAddOn = 1 THEN gloPatient = POINTER(Patient); gloAddOn = 0.
              locRecordCreated = 0
              locPatientMessage = 'New Patient Record NOT Created'
              CLEAR(PanelCheckBox[])
              CLEAR(StdPanelCheckBox[])
              HIDE(?PanelCheckBox_1,?PanelCheckBox_20)
              CLEAR(PanelText[])
              CLEAR(CLI:Record)
              EMPTY(LOG)
              locName = ''
              locAddress = ''
              IF PAT:Entered_by               
                SAV:Initials = PAT:Entered_by
              ELSE
                SAV:Initials = gloInitials
                PAT:Entered_by = gloInitials
              .
              GET(Patient,0)
              CLEAR(PAT:Record)
              PAT:Entered_by = SAV:Initials
              ?NextPatient{PROP:Text} = 'Done'
              DISPLAY()
              SELECT(?PAT:Client)
              TransferPage = IndexedPage[1]
              IF Pat:SUPPLIES = 'Y'
              .
            ELSE
              POST(EVENT:CloseWindow)
              RETURN(0)
            .
      
    OF ?Volume
      Volume
    OF ?PatientLabel
       !  PatientLabel(64,pat:invoice)       
                  InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '"<10>'
                  ComPuts(CommPort,InitStr)
                  InitStr = 'A1,150,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '"<10>'
                  ComPuts(CommPort,InitStr)
                  InitStr = 'A40,120,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>'
                  ComPuts(CommPort,InitStr)
                  InitStr = 'A40,5,0,4,1,1,N,"X' & CLIP(PAT:Invoice) & 'X"<10>'
                  ComPuts(CommPort,InitStr)
                  InitStr = 'A40,170,0,5,1,1,N,"X' & CLIP(PAT:Invoice) & 'X"<10>P1<10>'
                  ComPuts(CommPort,InitStr)      
    OF ?SerumLabel1
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-1"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?SerumLabel2
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-2"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
    OF ?ClearClient
      CLEAR(CLI:Record)
      PAT:Client = 0
      DISPLAY()
      SELECT(?PAT:Client)
      UNHIDE(?Pat:INVOICE:2)
    OF ?SameClient
      PAT:Client = SAV:Client
      DISPLAY(?PAT:Client)
      CLI:Number = PAT:Client
      GET(Client,CLI:Order_Key)
      DO GetClient
      
    END
  ReturnValue = PARENT.TakeAccepted()
    HIDE(?FaxRequest,?EmailRequest)
    IF Pat:SIGNATURE = 'Q' OR Pat:SIGNATURE = 'R'
      HIDE(?RedLED:Signature)
      
    ELSE
      UNHIDE(?RedLED:Signature)
      IF Pat:SIGNATURE = 'N'
        UNHIDE(?FaxRequest,?EmailRequest)
      .
    .
    IF Pat:ENTERED_BY
      HIDE(?RedLed:Initials)
    ELSE
      UNHIDE(?RedLed:Initials)
    .
    IF Pat:SEX
      HIDE(?RedLed:Sex)              
    ELSE
      UNHIDE(?RedLed:Sex)
    .
    IF Pat:AGE AND Pat:AGE_TYPE
      HIDE(?RedLed:Age)
    ELSE
      UNHIDE(?RedLed:Age)
    .
    IF Pat:BILLING
      HIDE(?RedLed:Billing)
      CASE PAT:Billing
      OF 'P'
      OROF 'C'
        UNHIDE(?Pat:CreditCard)
        DISPLAY(?Pat:CreditCard)
      ELSE
        HIDE(?Pat:CreditCard)
        Pat:CreditCard = 0
      .
      
    ELSE
      UNHIDE(?RedLed:Billing)
    .
    IF Pat:VOLUME1
      HIDE(?RedLed:Volume)
    ELSE
      UNHIDE(?RedLed:Volume)
    .
    IF Pat:ReportLanguage
      HIDE(?RedLed:Language)
    ELSE
      UNHIDE(?RedLed:Language)
    .
    CASE ACCEPTED()
    OF ?Pat:SIGNATURE
      IF Pat:SIGNATURE = 'N'
        UNHIDE(?FaxRequest,?EmailRequest)
        UNHIDE(?RedLED:Signature)
      ELSE
        HIDE(?FaxRequest,?EmailRequest)
        HIDE(?RedLED:Signature)
      .
    OF ?Pat:ReportLanguage
        IF PAT:ReportLanguage = 'S'
          HIDE(?EnglishImage)
          UNHIDE(?MexImage)
        ELSIF PAT:ReportLanguage = 'E'
          UNHIDE(?EnglishImage)
          HIDE(?MexImage)
        ELSE
          HIDE(?EnglishImage)
          HIDE(?MexImage)
        .
    OF ?Pat:RESULTS
      IF ?Pat:RESULTS{PROP:Checked}
        UNHIDE(?RedLED:History)
      END
      IF NOT ?Pat:RESULTS{PROP:Checked}
        HIDE(?RedLED:History)
      END
      ThisWindow.Reset
    OF ?Pat:SUPPLIES
      IF ?Pat:SUPPLIES{PROP:Checked}
        UNHIDE(?RedLED:Supplies)
      END
      IF NOT ?Pat:SUPPLIES{PROP:Checked}
        HIDE(?RedLED:Supplies)
      END
      ThisWindow.Reset
    OF ?FaxRequest
      ThisWindow.Update
      FaxCover(DOC:SignatureRequest)
      Pat:SIGNATURE = 'Q'
      HIDE(?EmailRequest,?FaxRequest)
      HIDE(?RedLED:Signature)
      DISPLAY()
      
    OF ?EmailRequest
      ThisWindow.Update
      SR:Patient = 0
      SR:Client = 0
      DocEmail(DOC:SignatureRequest+DOC:Email + locLanguage)
      Pat:SIGNATURE = 'Q'
      HIDE(?EmailRequest,?FaxRequest)
      HIDE(?RedLED:Signature)
      DISPLAY()
    OF ?LookupClient
      ThisWindow.Update
      GlobalRequest = SelectRecord
      Client()
      ThisWindow.Reset
      IF GlobalResponse = RequestCompleted
        Pat:CLIENT = CLI:NUMBER
        DISPLAY(?Pat:CLIENT)
        GET(Client,CLI:Order_Key)
        DO GetClient
      ELSE
        SELECT(?Pat:CLIENT)
      .
    OF ?PhysicianButton
      ThisWindow.Update
      GlobalRequest = SelectRecord
      PhysicianLookup()
      ThisWindow.Reset
      gloPatientNotes[1] = LEFT(CLIP(PHY:Physician)  & ' ' &  gloPatientNotes[1])  
      DISPLAY(?gloPatientNotes_1)
    OF ?Pat:INVOICE:2
      GET(Patient,PAT:Invoice_Key)
      IF ERRORCODE()
        STOP('PAT: ' & PAT:Invoice & ' ' & ERROR())
      ELSE
        IF PAT:Status = 'L' OR PAT:Status = 'V'
          CLI:Number = PAT:Client
          GET(Client,CLI:Order_Key)
          IF ERRORCODE()
            PAT:Client = 0
            CLI:Number = 0
            DISPLAY(?)
            SELECT(?)
          ELSE
            HIDE(?Pat:INVOICE:2)
            DO GetClient
            locRecordCreated = TRUE
            locPatientMessage = 'Patient Record Created ' & PAT:Invoice
            ?NextPatient{PROP:Text} = 'Next Patient'
            DISPLAY()
           IF locLanguage
             HIDE(?EnglishImage)
             UNHIDE(?MexImage)
           ELSE
             UNHIDE(?EnglishImage)
             HIDE(?MexImage)
            .
            SELECT(?Pat:Volume1)
          .
         ELSE
           STOP('PATIENT STATUS NOT L or V')
        .
      .
    OF ?gloLoginSort
      PUTINI('Login','LoginSort',gloLoginSort,'ALIS.INI')
      CurrentPage = 0
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
    CASE FIELD()
    OF ?Pat:CLIENT
        UPDATE(?PAT:Client)
        IF PAT:Client > 99999
          CLI:Number = PAT:Client
          GET(Client,CLI:Order_Key)
          IF ERRORCODE()
            PAT:Client = 0
            CLI:Number = 0
            DISPLAY(?)
            SELECT(?)
          ELSE
            SELECT(?+1)
            DO GetClient
            
        . .
    END
  ReturnValue = PARENT.TakeNewSelection()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeSelected PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all Selected events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE FIELD()
    OF ?CLI:FOLLOW1
      SELECT(?-1)
      DISPLAY(?-1)
    END
  ReturnValue = PARENT.TakeSelected()
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
    CASE EVENT()
    OF EVENT:OpenWindow
      IF gloAddOn = 2 ! adding from patient/verify
        Pat:INVOICE = gloPatient
        gloThreadedReturn = 2
        POST(EVENT:Accepted,?Pat:INVOICE:2)
      ELSIF gloAddOn = 1
        locPatientRecord = PAT:Record 
        locRecordCreated = 0
        DO GetInvoice
        gloAddOn = 0
        GET(Patient,0)
        PAT:Record = locPatientRecord
        PAT:Invoice = SAV:Invoice
        Pat:ACCESSION = PAT:Invoice
        Pat:VERIFIED_BY = ''
        Pat:DATE = TODAY()
        PAT:Billed = 0
        Pat:STATUS = 'L'
        Pat:VOLUME1 = 0
        Pat:VOLUME2 = 0
        Pat:Volume3 = 0
        Pat:Volume4 = 0
        Pat:Volume5 = 0
        Pat:VOLUME = 0
        Pat:NEEDED = 0     
      !     Pat:COLLECTION = TODAY()
        ADD(Patient)
        IF ERRORCODE()
          STOP('Add On: ' & ERROR())
        ELSE
          BILL:Accession = Pat:INVOICE
          locBillingRecord = BILL:Record  
          ADD(Billing)  
          IF Pat:BILLING = 'I' OR Pat:BILLING = 'M' OR Pat:BILLING = 'A'  
            CLM:Patient = Pat:INVOICE
            locClaimsRecord = CLM:Record  
            ADD(Claims)    
          .
          locPatientMessage = 'Patient Add On Record Created ' & INVOICE#
          locRecordCreated = 1
          ?NextPatient{PROP:Text} = 'Next Patient'
          OL:Date = TODAY()
          OL:Time = CLOCK()
          OL:Number = Pat:INVOICE
          OL:PCAE = ONLINE:Patient + ONLINE:Add
          ADD(Online)
        .
        DO GetClient
        DISPLAY()
        SELECT(?Pat:ENTERED_BY)
      ELSE  
        
        CLOSE(Patient4Week)
        CREATE(Patient4Week)
        OPEN(Patient4Week)
        Pat:DATE = TODAY() - 365
        SET(Pat:DATE_KEY,Pat:DATE_KEY)
        LOOP
          NEXT(Patient)
          IF ERRORCODE() THEN BREAK.
          PAT4:Last =   Pat:LAST
          PAT4:First =  Pat:FIRST
          PAT4:Date = Pat:DATE
          PAT4:Number = Pat:INVOICE
          PAT4:DOB = Pat:DOB
          APPEND(Patient4Week)
        .
        BUILD(Patient4Week)
        CLEAR(PAT:Record)
      .
      
      Pat:ENTERED_BY = gloInitials
      SAV:Initials = gloInitials
      DO InitSerialPort
      
    END
  ReturnValue = PARENT.TakeWindowEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Log file
!!! </summary>
LoginReview PROCEDURE 

CurrentTab           STRING(80)                            !
locSort              BYTE                                  !
locPage              BYTE                                  !
locType              BYTE,DIM(3)                           !
locField             BYTE                                  !
locLowLimit          SHORT(1)                              !
locHighLimit         SHORT(630)                            !
locPageDescription   STRING(16)                            !
ReviewPanelText      STRING(30),DIM(10)                    !
ReviewPanelCheckBox  STRING(30),DIM(10)                    !
locIgECount          BYTE                                  !
locIgGCount          BYTE                                  !
locIgG4Count         BYTE                                  !
locPanelDescription  STRING(40)                            !
locPanelTestDescription STRING(30)                         !
DisplayString        STRING(255)                           !
locVolume            ULONG,DIM(3)                          !
locNeeded            ULONG,DIM(3)                          !
locResult            BYTE                                  !
locVolumeReceived    ULONG                                 !
locIgECountDiscreet  SHORT                                 !
locIgG4CountDiscreet SHORT                                 !
locIgGCountDiscreet  SHORT                                 !
BRW1::View:Browse    VIEW(Log)
                       PROJECT(LOG:Code)
                       PROJECT(LOG:Description)
                       PROJECT(LOG:IgE)
                       PROJECT(LOG:IgG4)
                       PROJECT(LOG:IgG)
                       PROJECT(LOG:Page)
                       PROJECT(LOG:CheckBox)
                       PROJECT(LOG:Sort)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
LOG:Code               LIKE(LOG:Code)                 !List box control field - type derived from field
LOG:Code_NormalFG      LONG                           !Normal forground color
LOG:Code_NormalBG      LONG                           !Normal background color
LOG:Code_SelectedFG    LONG                           !Selected forground color
LOG:Code_SelectedBG    LONG                           !Selected background color
LOG:Code_Style         LONG                           !Field style
LOG:Description        LIKE(LOG:Description)          !List box control field - type derived from field
LOG:Description_NormalFG LONG                         !Normal forground color
LOG:Description_NormalBG LONG                         !Normal background color
LOG:Description_SelectedFG LONG                       !Selected forground color
LOG:Description_SelectedBG LONG                       !Selected background color
LOG:Description_Style  LONG                           !Field style
LOG:IgE                LIKE(LOG:IgE)                  !List box control field - type derived from field
LOG:IgE_NormalFG       LONG                           !Normal forground color
LOG:IgE_NormalBG       LONG                           !Normal background color
LOG:IgE_SelectedFG     LONG                           !Selected forground color
LOG:IgE_SelectedBG     LONG                           !Selected background color
LOG:IgE_Style          LONG                           !Field style
LOG:IgG4               LIKE(LOG:IgG4)                 !List box control field - type derived from field
LOG:IgG4_NormalFG      LONG                           !Normal forground color
LOG:IgG4_NormalBG      LONG                           !Normal background color
LOG:IgG4_SelectedFG    LONG                           !Selected forground color
LOG:IgG4_SelectedBG    LONG                           !Selected background color
LOG:IgG4_Style         LONG                           !Field style
LOG:IgG                LIKE(LOG:IgG)                  !List box control field - type derived from field
LOG:IgG_NormalFG       LONG                           !Normal forground color
LOG:IgG_NormalBG       LONG                           !Normal background color
LOG:IgG_SelectedFG     LONG                           !Selected forground color
LOG:IgG_SelectedBG     LONG                           !Selected background color
LOG:IgG_Style          LONG                           !Field style
locPageDescription     LIKE(locPageDescription)       !List box control field - type derived from local data
locPageDescription_NormalFG LONG                      !Normal forground color
locPageDescription_NormalBG LONG                      !Normal background color
locPageDescription_SelectedFG LONG                    !Selected forground color
locPageDescription_SelectedBG LONG                    !Selected background color
locPageDescription_Style LONG                         !Field style
                       STRING(1)                      !Browse hot field - type derived from field - unable to determine correct data type
locType_1              BYTE                           !Browse hot field - type derived from local data (Array Component)
locType_2              BYTE                           !Browse hot field - type derived from local data (Array Component)
locType_3              BYTE                           !Browse hot field - type derived from local data (Array Component)
LOG:Page               LIKE(LOG:Page)                 !Browse key field - type derived from field
LOG:CheckBox           LIKE(LOG:CheckBox)             !Browse key field - type derived from field
LOG:Sort               LIKE(LOG:Sort)                 !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
REL7::Toolbar        CLASS(ToolbarReltreeClass)
TakeEvent            PROCEDURE(<*LONG VCR>,WindowManager WM),VIRTUAL
  END
REL7::SaveLevel      BYTE,AUTO
REL7::Action         LONG,AUTO
Queue:RelTree        QUEUE,PRE()                           ! Browsing Queue
REL7::Display        STRING(200)                           ! Queue display string
REL7::NormalFG       LONG
REL7::NormalBG       LONG
REL7::SelectedFG     LONG
REL7::SelectedBG     LONG
REL7::Level          LONG                                  ! Record level in the tree
REL7::Loaded         SHORT                                 ! Inferior level is loaded
REL7::Position       STRING(1024)                          ! Record POSITION in VIEW
                END
REL7::LoadedQueue    QUEUE,PRE()                           ! Status Queue
REL7::LoadedLevel    LONG                                  ! Record level
REL7::LoadedPosition STRING(1024)                          ! Record POSITION in VIEW
               END
REL7::CurrentLevel   LONG                                  ! Current loaded level
REL7::CurrentChoice  LONG                                  ! Current record
REL7::NewItemLevel   LONG                                  ! Level for a new item
REL7::NewItemPosition STRING(1024)                         ! POSITION of a new record
REL7::LoadAll        LONG
EnhancedFocusManager EnhancedFocusClassType
BRW1::FormatManager  ListFormatManagerClass,THREAD ! LFM object
BRW1::PopupTextExt   STRING(1024)                 ! Extended popup text
BRW1::PopupChoice    SIGNED                       ! Popup current choice
BRW1::PopupChoiceOn  BYTE(1)                      ! Popup on/off choice
BRW1::PopupChoiceExec BYTE(0)                     ! Popup executed
QuickWindow          WINDOW,AT(0,0,510,345),FONT('Arial',11,,FONT:regular),ICON('qkload.ico'),GRAY,IMM,MDI,HLP('LoginReview')
                       LIST,AT(162,0,223,314),USE(?Browse:1),FONT(,,COLOR:Black,FONT:bold,CHARSET:ANSI),VSCROLL,ALRT(MouseRight), |
  FORMAT('26L(3)|M*Y~Code~L(2)@s4@80L(2)|M*Y~Description~@s20@20R(6)|M*Y~E~C(2)@S1@20R(' & |
  '6)|M*Y~G4~C(2)@S1@20R(6)|M*Y~G~C(2)@S1@64L(2)|M*Y~Login Page~@s16@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Log file'),NOBAR,TRN
                       BUTTON('&Insert'),AT(440,0,49,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,HIDE,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       LIST,AT(6,12,150,300),USE(?RelTree),FONT('Courier New',10,,FONT:bold,CHARSET:ANSI),FORMAT('800L*YT@s200@'), |
  FROM(Queue:RelTree),TRN
                       BUTTON('Login Order'),AT(397,10,70,26),USE(?LoginOrder),FONT(,,,FONT:bold),TRN
                       BUTTON('Alpha Order'),AT(397,34,70,26),USE(?AlphaOrder),FONT(,,,FONT:bold),TRN
                       BUTTON('Request Code'),AT(397,58,70,26),USE(?RequestOrder),FONT(,,,FONT:bold),TRN
                       BUTTON('Request Alpha'),AT(397,82,70,26),USE(?RequestAlpha),FONT(,,,FONT:bold),TRN
                       STRING('Total   Discrete'),AT(418,136),USE(?String15),FONT(,,,FONT:bold),TRN
                       BUTTON('&Change'),AT(416,0,49,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT,HIDE, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(432,0,49,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,HIDE,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       BUTTON('Done'),AT(396,276,70,26),USE(?Close),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  MSG('Close Window'),STD(STD:Close),TIP('Close Window'),TRN
                       PANEL,AT(162,0,223,314),USE(?Panel2)
                       PANEL,AT(6,12,150,300),USE(?Panel1)
                       IMAGE('button.jpg'),AT(397,10,70,26),USE(?Image4)
                       IMAGE('button.jpg'),AT(397,34,70,26),USE(?Image3)
                       IMAGE('button.jpg'),AT(397,58,70,26),USE(?Image2)
                       IMAGE('button.jpg'),AT(397,82,70,26),USE(?Image5)
                       IMAGE('button.jpg'),AT(396,276,70,26),USE(?Image1)
                       BUTTON('&Help'),AT(396,0,49,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,HIDE,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                       STRING(@p IgE   <<# p),AT(392,145,50,12),USE(locIgECount),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  LEFT(2),COLOR(COLOR:Red)
                       STRING(@n3),AT(442,145,33,12),USE(locIgECountDiscreet),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Red)
                       STRING(@p IgG4 <<# p),AT(392,158,50,12),USE(locIgG4Count),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  LEFT(2),COLOR(COLOR:Yellow)
                       STRING(@n3),AT(442,158,33,12),USE(locIgG4CountDiscreet),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Yellow)
                       STRING(@p  IgG   <<# p),AT(392,169,50,12),USE(locIgGCount),FONT(,14,COLOR:White,FONT:bold, |
  CHARSET:ANSI),LEFT,COLOR(COLOR:Blue)
                       STRING(@n3),AT(442,169,33,12),USE(locIgGCountDiscreet),FONT(,14,COLOR:White,FONT:bold,CHARSET:ANSI), |
  RIGHT(5),COLOR(COLOR:Blue)
                       STRING('Volume Received'),AT(400,196),USE(?String9),FONT(,,,FONT:bold),TRN
                       STRING('Needed (60ul)'),AT(412,216),USE(?String8),FONT(,,,FONT:bold),TRN
                       STRING(@n6),AT(466,193),USE(locVolumeReceived),FONT(,14,COLOR:Black,FONT:bold),LEFT,COLOR(COLOR:Lime)
                       STRING(@n6),AT(466,214),USE(locNeeded[1]),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI),LEFT, |
  COLOR(COLOR:Lime)
                       STRING('Needed (50ul)'),AT(412,228),USE(?String50),FONT(,,,FONT:bold),HIDE,TRN
                       STRING(@n6),AT(466,225),USE(locNeeded[2]),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI),LEFT, |
  COLOR(COLOR:Lime)
                       STRING(@n6),AT(466,238),USE(locNeeded[3]),FONT(,14,COLOR:Black,FONT:bold,CHARSET:ANSI),LEFT, |
  COLOR(COLOR:Lime)
                       STRING('Needed (40ul)'),AT(412,240),USE(?String40),FONT(,,,FONT:bold),HIDE,TRN
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
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
SetAlerts              PROCEDURE(),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
SetSort                PROCEDURE(BYTE NewOrder,BYTE Force),BYTE,PROC,DERIVED
TakeNewSelection       PROCEDURE(),DERIVED
ValidateRecord         PROCEDURE(),BYTE,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - locSort=1
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - locSort=2
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - locSort=3
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - locSort=4
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
  !------------------------------------
  !Style for ?RelTree
  !------------------------------------
  ?RelTree{PROPSTYLE:FontName, 1}      = gloListFont
  ?RelTree{PROPSTYLE:FontSize, 1}      = gloListFontSize
  ?RelTree{PROPSTYLE:FontStyle, 1}     = gloListFontStyle
  ?RelTree{PROPSTYLE:TextColor, 1}     = gloListFontColor
  ?RelTree{PROPSTYLE:BackColor, 1}     = gloListBgColor
  ?RelTree{PROPSTYLE:TextSelected, 1}  = gloListSelectedFGColor
  ?RelTree{PROPSTYLE:BackSelected, 1}  = gloListSelectedBGColor
  !------------------------------------
!---------------------------------------------------------------------------
ShowPages ROUTINE
  CASE locPage
  OF 0
    locLowLimit  =  0
    locHighLimit =  630
  OF 1
    locLowLimit  =  0
    locHighLimit =  210
  OF 2
    locLowLimit  =  211
    locHighLimit =  420
  OF 3
    locLowLimit  = 421
    locHighLimit = 630
  ELSE
    locPage = 0
  .
  BRW1.ResetFromFile
  ThisWindow.Reset(1)


REL7::NextParent ROUTINE
  GET(Queue:RelTree,CHOICE(?RelTree))
  IF ABS(REL7::Level) > 1
    REL7::SaveLevel = ABS(REL7::Level)-1
    DO REL7::NextSavedLevel
  END

REL7::PreviousParent ROUTINE
  GET(Queue:RelTree,CHOICE(?RelTree))
  IF ABS(REL7::Level) > 1
    REL7::SaveLevel = ABS(REL7::Level)-1
    DO REL7::PreviousSavedLevel
  END

REL7::NextLevel ROUTINE
  GET(Queue:RelTree,CHOICE(?RelTree))
  REL7::SaveLevel = ABS(REL7::Level)
  DO REL7::NextSavedLevel

REL7::NextSavedLevel ROUTINE
  DATA
SavePointer LONG,AUTO
  CODE
  LOOP
    LOOP
      GET(Queue:RelTree,POINTER(Queue:RelTree)+1)
      IF ERRORCODE()
        EXIT                ! Unable to find another record on similar level
      END
    WHILE ABS(REL7::Level) > REL7::SaveLevel
    IF ABS(REL7::Level) = REL7::SaveLevel
      SELECT(?RelTree,POINTER(Queue:RelTree))
      EXIT
    END
    SavePointer = POINTER(Queue:RelTree)
    ?RelTree{PROPLIST:MouseDownRow} = SavePointer
    DO REL7::LoadLevel
    GET(Queue:RelTree,SavePointer)
  END

REL7::PreviousSavedLevel ROUTINE
  DATA
SaveRecords LONG,AUTO
SavePointer LONG,AUTO
  CODE
  LOOP
    LOOP
      GET(Queue:RelTree,POINTER(Queue:RelTree)-1)
      IF ERRORCODE()
        EXIT                ! Unable to find another record on similar level
      END
    WHILE ABS(REL7::Level) > REL7::SaveLevel
    IF ABS(REL7::Level) = REL7::SaveLevel
      SELECT(?RelTree,POINTER(Queue:RelTree))
      EXIT
    END
    SavePointer = POINTER(Queue:RelTree)
    SaveRecords = RECORDS(Queue:RelTree)
    ?RelTree{PROPLIST:MouseDownRow} = SavePointer
    DO REL7::LoadLevel
    IF RECORDS(Queue:RelTree) <> SaveRecords
      SavePointer += 1 + RECORDS(Queue:RelTree) - SaveRecords
    END
    GET(Queue:RelTree,SavePointer)
  END

REL7::PreviousLevel ROUTINE
  GET(Queue:RelTree,CHOICE(?RelTree))
  REL7::SaveLevel = ABS(REL7::Level)
  DO REL7::PreviousSavedLevel

REL7::NextRecord ROUTINE
  DO REL7::LoadLevel
  IF CHOICE(?RelTree) < RECORDS(Queue:RelTree)
    SELECT(?RelTree,CHOICE(?RelTree)+1)
  END

REL7::PreviousRecord ROUTINE
  DATA
SaveRecords LONG,AUTO
SavePointer LONG,AUTO
  CODE
  SavePointer = CHOICE(?RelTree)-1
  LOOP
    SaveRecords = RECORDS(Queue:RelTree)
    ?RelTree{PROPLIST:MouseDownRow} = SavePointer
    DO REL7::LoadLevel
    IF RECORDS(Queue:RelTree) = SaveRecords
      BREAK
    END
    SavePointer += RECORDS(Queue:RelTree) - SaveRecords
  END
  SELECT(?RelTree,SavePointer)

REL7::AssignButtons ROUTINE
  Toolbar.SetTarget(?RelTree)

!---------------------------------------------------------------------------
REL7::Load:LogInPanels ROUTINE
!|
!| This routine is used to load the base level of the RelationTree.
!|
!| First, the Title line is added.
!|
!| Next, each record of the file LogInPanels is read. If the record is not filtered,
!| then the following happens:
!|
!|   First, the queue REL7::LoadedQueue is searched, to see if the tree branch
!|   corresponding to the record is "loaded", that is, if the branch is currently opened.
!|
!|   If the branch is open, then the records for that branch are read from the file
!|   LogInPanelTests. This is done in the routine REL7::Load:LogInPanelTests.
!|
!|   If the branch is not open, then the RelationTree looks for a single record from
!|   LogInPanelTests, to see if any child records are available. If they are, the
!|   branch can be expanded, so REL7::Level gets a -1. This
!|   value is used by the list box to display a "closed" box next to the entry.
!|
!|   Finally, the queue record that corresponds to the LogInPanels record read is
!|   formatted and added to the queue Queue:RelTree. This is done in the routine
!|   REL7::Format:LogInPanels.
!|
  Access:LogInPanels.UseFile
  SET(LogInPanels)
  LOOP
    IF Access:LogInPanels.Next() NOT= Level:Benign
      IF Access:LogInPanels.GetEOF()
        BREAK
      ELSE
        POST(EVENT:CloseWindow)
        EXIT
      END
    END
    REL7::Loaded = 0
    REL7::Position = POSITION(LogInPanels)
    REL7::Level = 1
    REL7::LoadedLevel = ABS(REL7::Level)
    REL7::LoadedPosition = REL7::Position
    GET(REL7::LoadedQueue,REL7::LoadedLevel,REL7::LoadedPosition)
    IF ERRORCODE() AND NOT REL7::LoadAll
      LPT:Panel = LP:PanelNumber
      CLEAR(LPT:TYPE,0)
      CLEAR(LPT:CODE,0)
      Access:LogInPanelTests.UseFile
      SET(LPT:OrderKey,LPT:OrderKey)
      LOOP
        IF Access:LogInPanelTests.Next()
          IF Access:LogInPanelTests.GetEOF()
            BREAK
          ELSE
            POST(EVENT:CloseWindow)
            EXIT
          END
        END
        IF UPPER(LPT:Panel) <> UPPER(LP:PanelNumber) THEN BREAK.
        REL7::Level = -1
        BREAK
      END
      DO REL7::Format:LogInPanels
      ADD(Queue:RelTree,POINTER(Queue:RelTree)+1)
    ELSE
      IF REL7::LoadAll
        ADD(REL7::LoadedQueue,REL7::LoadedLevel,REL7::LoadedPosition)
      END
      REL7::Level = 1
      REL7::Loaded = True
      DO REL7::Format:LogInPanels
      ADD(Queue:RelTree,POINTER(Queue:RelTree)+1)
      DO REL7::Load:LogInPanelTests
    END
  END

!---------------------------------------------------------------------------
REL7::Format:LogInPanels ROUTINE
!|
!| This routine formats a line of the display queue Queue:RelTree to display the
!| contents of a record of LogInPanels.
!|
!| First, the variable DisplayString is assigned the formatted value.
!|
!| Next, the queue variable REL7::Display is assigned the value in
!| DisplayString. It is possible for the display string to be reformatted in
!| the EMBED point "Relation Tree, Before Setting Display on Primary File".
!|
!| Next, any coloring done to the line is performed.
!|
  DisplayString = LP:PanelNumber & ' ' & LP:PanelDescription
  REL7::Display = DisplayString
  REL7::NormalFG = -1
  REL7::NormalBG = -1
  REL7::SelectedFG = -1
  REL7::SelectedBG = -1

!---------------------------------------------------------------------------
REL7::LoadLevel ROUTINE
!|
!| This routine is used to load a single level of the RelationTree.
!|
!| First, we see where the load comes from. Since the alert-key handling sets
!| ?RelTree{PropList:MouseDownRow} to CHOICE, we can rely on this property
!| containing the correct selection.
!|
!| Next, we retrieve the Queue:RelTree record that corresponds to the requested
!| load row. If the requested load row is already loaded, we don't have to do
!| anything. If the requested row is not loaded...
!|
!|   First, we set REL7::Level to a positive value for the selected
!|   row and put that record back into the queue Queue:RelTree. The presence of
!|   records with a greater Level below this record in the queue tells the
!|   listbox that the level is opened.
!|
!|   Next, we add a record the the queue REL7::LoadedQueue. This queue
!|   is used to rebuild the display when necessary.
!|
!|   Next, we retrieve the file record that corresponds to the requested load row.
!|
!|   Finally, we reformat the Queue:RelTree entry. This allows for any changes in icon
!|   and colors based on conditional usage.
!|
  REL7::CurrentChoice = ?RelTree{PROPLIST:MouseDownRow}
  GET(Queue:RelTree,REL7::CurrentChoice)
  IF NOT REL7::Loaded
    REL7::Level = ABS(REL7::Level)
    PUT(Queue:RelTree)
    REL7::Loaded = True
    REL7::LoadedLevel = ABS(REL7::Level)
    REL7::LoadedPosition = REL7::Position
    ADD(REL7::LoadedQueue,REL7::LoadedLevel,REL7::LoadedPosition)
    EXECUTE(ABS(REL7::Level))
      BEGIN
        REGET(LogInPanels,REL7::Position)
        DO REL7::Format:LogInPanels
      END
      BEGIN
        REGET(LogInPanelTests,REL7::Position)
        DO REL7::Format:LogInPanelTests
      END
    END
    PUT(Queue:RelTree)
    EXECUTE(ABS(REL7::Level))
      DO REL7::Load:LogInPanelTests
    END
  END
!---------------------------------------------------------------------------
REL7::UnloadLevel ROUTINE
!|
!| This routine is used to unload a level of the RelationTree.
!|
!| First, we see where the unload comes from. Since the alert-key handling sets
!| ?RelTree{PropList:MouseDownRow} to CHOICE, we can rely on this property
!| containing the correct selection.
!|
!| Next, we retrieve the Queue:RelTree record that corresponds to the requested
!| unload row. If the requested load row isn't loaded, we don't have to do
!| anything. If the requested row is loaded...
!|
!|   First, we set REL7::Level to a negative value for the selected
!|   row and put that record back into the queue Queue:RelTree. Since there
!|   won't be any records at lower levels, we use the negative value to signal
!|   the listbox that the level is closed, but children exist.
!|
!|   Next, we retrieve the record the the queue REL7::LoadedQueue that
!|   corresponds to the unloaded level. This queue record is then deleted.
!|
!|   Next, we retrieve the file record that corresponds to the requested load row.
!|
!|   Next, we reformat the Queue:RelTree entry. This allows for any changes in icon
!|   and colors based on conditional usage.
!|
!|   Finally, we run through all of the Queue:RelTree entries for branches below the
!|   unloaded level, and delete these entries.
!|
  REL7::CurrentChoice = ?RelTree{PROPLIST:MouseDownRow}
  GET(Queue:RelTree,REL7::CurrentChoice)
  IF REL7::Loaded
    REL7::Level = -ABS(REL7::Level)
    PUT(Queue:RelTree)
    REL7::Loaded = False
    REL7::LoadedLevel = ABS(REL7::Level)
    REL7::LoadedPosition = REL7::Position
    GET(REL7::LoadedQueue,REL7::LoadedLevel,REL7::LoadedPosition)
    IF NOT ERRORCODE()
      DELETE(REL7::LoadedQueue)
    END
    EXECUTE(ABS(REL7::Level))
      BEGIN
        REGET(LogInPanels,REL7::Position)
        DO REL7::Format:LogInPanels
      END
      BEGIN
        REGET(LogInPanelTests,REL7::Position)
        DO REL7::Format:LogInPanelTests
      END
    END
    PUT(Queue:RelTree)
    REL7::CurrentLevel = ABS(REL7::Level)
    REL7::CurrentChoice += 1
    LOOP
      GET(Queue:RelTree,REL7::CurrentChoice)
      IF ERRORCODE() THEN BREAK.
      IF ABS(REL7::Level) <= REL7::CurrentLevel THEN BREAK.
      DELETE(Queue:RelTree)
    END
  END
!---------------------------------------------------------------------------
REL7::Load:LogInPanelTests ROUTINE
!|
!| This routine is used to load the base level of the RelationTree.
!|
!| Next, each record of the file LogInPanelTests is read. If the record is not filtered,
!| the queue record that corresponds to this record is formatted and added to the queue
!| Queue:RelTree. This is done in the routine REL7::Format:LogInPanelTests.
!|
  LPT:Panel = LP:PanelNumber
  CLEAR(LPT:TYPE)
  CLEAR(LPT:CODE)
  Access:LogInPanelTests.UseFile
  SET(LPT:OrderKey,LPT:OrderKey)
  LOOP
    IF Access:LogInPanelTests.Next()
      IF Access:LogInPanelTests.GetEOF()
        BREAK
      ELSE
        POST(EVENT:CloseWindow)
        EXIT
      END
    END
    IF LPT:Panel <> LP:PanelNumber THEN BREAK.
    REL7::Loaded = 0
    REL7::Position = POSITION(LogInPanelTests)
    REL7::Level = 2
    DO REL7::Format:LogInPanelTests
    ADD(Queue:RelTree,POINTER(Queue:RelTree)+1)
  END

!-------------------------------------------------------
REL7::Format:LogInPanelTests ROUTINE
!|
!| This routine formats a line of the display queue Queue:RelTree to display the
!| contents of a record of LogInPanelTests.
!|
!| First, the variable DisplayString is assigned the formatted value.
!|
!| Next, the queue variable REL7::Display is assigned the value in
!| DisplayString. It is possible for the display string to be reformatted in
!| the EMBED point "Relation Tree, Before Setting Display on Primary File".
!|
!| Next, any coloring done to the line is performed.
!|
  locPanelTestDescription = LPT:CODE & ' ' &  LPT:TypeDescription & ' ' &  LPT:TestDescription
  DisplayString = locPanelTestDescription
  REL7::Display = DisplayString
  IF LPT:TYPE=1
    REL7::NormalFG = 16777215
    REL7::NormalBG = 255
    REL7::SelectedFG = 255
    REL7::SelectedBG = 16777215
  ELSIF LPT:TYPE=2
    REL7::NormalFG = 16777215
    REL7::NormalBG = 16711680
    REL7::SelectedFG = 16711680
    REL7::SelectedBG = 16777215
  ELSIF LPT:TYPE=3
    REL7::NormalFG = 0
    REL7::NormalBG = 65535
    REL7::SelectedFG = 65535
    REL7::SelectedBG = 0
  ELSE
    REL7::NormalFG = -1
    REL7::NormalBG = -1
    REL7::SelectedFG = -1
    REL7::SelectedBG = -1
  END

!---------------------------------------------------------------------------
REL7::RefreshTree ROUTINE
!|
!| This routine is used to refresh the RelationTree.
!|
!| First, the queue Queue:RelTree is FREEd. The display is always completely rebuilt.
!|
!| Next, the routine REL7::Load:LogInPanels is called. This routine will
!| call any other routines necessary to rebuild the display.
!|
!| Finally, if a new item has been added (via REL7::AddEntry), then the
!| queue is searched for that entry, and the record is highlighted.
!|
  FREE(Queue:RelTree)
  DO REL7::Load:LogInPanels
  IF REL7::NewItemLevel
    REL7::CurrentChoice = 0
    LOOP
      REL7::CurrentChoice += 1
      GET(Queue:RelTree,REL7::CurrentChoice)
      IF ERRORCODE() THEN BREAK.
      IF ABS(REL7::Level) <> ABS(REL7::NewItemLevel) THEN CYCLE.
      IF REL7::Position <> REL7::NewItemPosition THEN CYCLE.
      SELECT(?RelTree,REL7::CurrentChoice)
      BREAK
    END
  END
!---------------------------------------------------------------------------
REL7::ContractAll ROUTINE
!|
!| This routine re-initializes the RelationTree.
!|
!| The two queues used by the RelationTree (Queue:RelTree and REL7::LoadedQueue)
!| are FREEd, and the routine REL7::Load:LogInPanels is called, which loads
!| the first level of the RelationTree.
!|
  FREE(Queue:RelTree)
  FREE(REL7::LoadedQueue)
  DO REL7::Load:LogInPanels
!---------------------------------------------------------------------------
REL7::ExpandAll ROUTINE
!|
!| This routine expands every branch of the RelationTree.
!|
!| First, The two queues used by the RelationTree (Queue:RelTree and REL7::LoadedQueue)
!| are FREEd.
!|
!| Next, the variable REL7::LoadAll is set to true, and the routine REL7::Load:LogInPanels
!| is called. Since REL7::LoadAll is True, all branches are completely loaded.
!|
  FREE(Queue:RelTree)
  FREE(REL7::LoadedQueue)
  REL7::LoadAll = True
  DO REL7::Load:LogInPanels
  REL7::LoadAll = False

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LoginReview')
  SELF.Request = GlobalRequest                    ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                     ! Set this windows ErrorManager to the global ErrorManager
  BIND('locType',locType)                         ! Added by: BrowseBox(ABC)
  BIND('locPageDescription',locPageDescription)   ! Added by: BrowseBox(ABC)
  BIND('locType_1',locType[1])                    ! Added by: BrowseBox(ABC)
  BIND('locType_2',locType[2])                    ! Added by: BrowseBox(ABC)
  BIND('locType_3',locType[3])                    ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                            ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)        ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)        ! Add the close control to the window manger
  END
  CLOSE(LogInPanels)
  CREATE(LogInPanels)
  IF ERRORCODE() THEN STOP('CREATE LP: ' & ERROR()).
  OPEN(LogInPanels)
  CLOSE(LogInPanelTests)
  CREATE(LogInPanelTests)
  IF ERRORCODE() THEN STOP('CREATE LPT: ' & ERROR()).
  OPEN(LogInPanelTests)
  CLOSE(Log)
  CREATE(Log)
  OPEN(Log)
    LOOP I# = 1 TO 30
      IF StdPanelCheckBox[I#] = '1'
        LP:PanelDescription = StdPanelText[I#]
        LP:PanelNumber = gloStdPanelCodes[I#]
        ADD(LogInPanels)
      .
    .
    LOOP I# = 1 TO 20
      IF PanelCheckBox[I#] = '1'
        LP:PanelDescription = PanelText[I#]
        LP:PanelNumber = gloPanelCodes[I#]
        ADD(LogInPanels)
      .
    .
  
  
    SET(LP:OrderKey)
    LOOP
      NEXT(LogInPanels)
      IF ERRORCODE() THEN BREAK.
      PT:PANEL = LP:PanelNumber
      PT:CODE = ''
      PT:TYPE = 0
      SET(PT:ORDER_KEY,PT:ORDER_KEY)
      LOOP
        NEXT(Pnl_Test)
        IF PT:PANEL <> LP:PanelNumber OR ERRORCODE() THEN BREAK.
        LT:Code = PT:CODE
        GET(LogInTests,LT:CodeKey)
        IF ERRORCODE() THEN LT:Description = ERROR().
        LPT:Panel = PT:PANEL
        LPT:CODE = PT:CODE
        LPT:TYPE = PT:TYPE
        IF INRANGE(LPT:TYPE,1,3)
          LPT:TypeDescription = gloTypeDescription[LPT:TYPE]
        ELSE
          LPT:TypeDescription = ''
        .
        LPT:TestDescription = LT:Description
        ADD(LogInPanelTests)
      .
  
    .
     locIgGCountDiscreet = 0
     locIgG4CountDiscreet = 0
     locIgECountDiscreet = 0
        IndexedPage[CurrentPage] = TransferPage
        
        CLOSE(Log)
        CREATE(Log)
        OPEN(Log)
        LOOP CurrentPage = 1 TO 4
          TransferPage = IndexedPage[CurrentPage]                          
          LOOP I# = 1 TO 252
            IF INSTRING('*',AP:Text[I#],1) THEN CYCLE.
            CLEAR(LOG:Record)
            IF AP:Checked[I#] = '1'
              IF AP:IgE[I#]
                LPT:Panel = 0
                LPT:Code =  SUB(AP:Text[I#],2,4)
                LPT:TYPE = 1
                ADD(LogInPanelTests)
                IF ERRORCODE()
                  LOG:IgE = 'D'
                ELSE
                  LOG:IgE = 'X'
                  locIgECountDiscreet += 1
                .
  
              .
              IF AP:IgG[I#]
                LPT:Panel = 0
                LPT:Code =  SUB(AP:Text[I#],2,4)
                LPT:TYPE = 2
                ADD(LogInPanelTests)
                IF ERRORCODE()
                  LOG:IgG = 'D'
                ELSE
                  LOG:IgG = 'X'
                  locIgGCountDiscreet += 1
                .
              .
              IF AP:IgG4[I#]
                LPT:Panel = 0
                LPT:Code =  SUB(AP:Text[I#],2,4)
                LPT:TYPE = 3
                ADD(LogInPanelTests)
                IF ERRORCODE()
                  LOG:IgG4 = 'D'
                ELSE
                  LOG:IgG4 = 'X'
                  locIgG4CountDiscreet += 1
                .
              .
              LOG:Page = CurrentPage
              LOG:CheckBox = I#
              LOG:Code = LEFT(SUB(AP:Text[I#],2,4))
              
              LOG:Sort = SortIndex[VAL(SUB(LOG:Code,1,1))-64]
              LOG:Description = CLIP(LEFT(SUB(AP:Text[I#],6,20))) 
              ADD(Log)
              
        . . .
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                              ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Log.Open                                 ! File Log used by this procedure, so make sure it's RelationManager is open
  Relate:LogInPanels.Open                         ! File LogInPanels used by this procedure, so make sure it's RelationManager is open
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                            ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                          ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  DO REL7::ContractAll
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Log,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                          ! Open window
  ?Browse:1{Prop:LineHeight} = 8
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,LOG:OrderKey)                ! Add the sort order for LOG:OrderKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)            ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,LOG:Page,1,BRW1)      ! Initialize the browse locator using  using key: LOG:OrderKey , LOG:Page
  BRW1.AddSortOrder(,LOG:AlphaKey)                ! Add the sort order for LOG:AlphaKey for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)            ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,LOG:Description,1,BRW1) ! Initialize the browse locator using  using key: LOG:AlphaKey , LOG:Description
  BRW1.AddSortOrder(,LOG:RequestKey)              ! Add the sort order for LOG:RequestKey for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)            ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,LOG:Sort,1,BRW1)      ! Initialize the browse locator using  using key: LOG:RequestKey , LOG:Sort
  BRW1.AddSortOrder(,LOG:RequestAlpha)            ! Add the sort order for LOG:RequestAlpha for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)            ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,LOG:Sort,1,BRW1)      ! Initialize the browse locator using  using key: LOG:RequestAlpha , LOG:Sort
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha) ! Moveable thumb based upon LOG:Page for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,LOG:OrderKey) ! Add the sort order for LOG:OrderKey for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)            ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,LOG:Page,1,BRW1)      ! Initialize the browse locator using  using key: LOG:OrderKey , LOG:Page
  BRW1.SetFilter('(LOG:IgG) OR(locType[3] AND LOG:IgG4))') ! Apply filter expression to browse
  BRW1.AddField(LOG:Code,BRW1.Q.LOG:Code)         ! Field LOG:Code is a hot field or requires assignment from browse
  BRW1.AddField(LOG:Description,BRW1.Q.LOG:Description) ! Field LOG:Description is a hot field or requires assignment from browse
  BRW1.AddField(LOG:IgE,BRW1.Q.LOG:IgE)           ! Field LOG:IgE is a hot field or requires assignment from browse
  BRW1.AddField(LOG:IgG4,BRW1.Q.LOG:IgG4)         ! Field LOG:IgG4 is a hot field or requires assignment from browse
  BRW1.AddField(LOG:IgG,BRW1.Q.LOG:IgG)           ! Field LOG:IgG is a hot field or requires assignment from browse
  BRW1.AddField(locPageDescription,BRW1.Q.locPageDescription) ! Field locPageDescription is a hot field or requires assignment from browse
  BRW1.AddField(locType[1],BRW1.Q.locType_1)      ! Field locType[1] is a hot field or requires assignment from browse
  BRW1.AddField(locType[2],BRW1.Q.locType_2)      ! Field locType[2] is a hot field or requires assignment from browse
  BRW1.AddField(locType[3],BRW1.Q.locType_3)      ! Field locType[3] is a hot field or requires assignment from browse
  BRW1.AddField(LOG:Page,BRW1.Q.LOG:Page)         ! Field LOG:Page is a hot field or requires assignment from browse
  BRW1.AddField(LOG:CheckBox,BRW1.Q.LOG:CheckBox) ! Field LOG:CheckBox is a hot field or requires assignment from browse
  BRW1.AddField(LOG:Sort,BRW1.Q.LOG:Sort)         ! Field LOG:Sort is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize) ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                           ! Add resizer to window manager
  BRW1.AskProcedure = 1
  ?RelTree{Prop:Selected} = 1
  Toolbar.AddTarget(REL7::Toolbar, ?RelTree)
  DO REL7::AssignButtons
  ?RelTree{PROP:Alrt,255} = CtrlRight
  ?RelTree{PROP:Alrt,254} = CtrlLeft
  BRW1::FormatManager.SaveFormat = True
  ! List Format Manager initialization
  BRW1::FormatManager.Init('Alis8','LoginReview',1,?Browse:1,1,BRW1::PopupTextExt,Queue:Browse:1,36,LFM_CFile,LFM_CFile.Record)
  BRW1::FormatManager.BindInterface(,,,'ALIS.INI')
  SELF.SetAlerts()
0{PROP:Wallpaper} = gloWallpaper
    locType[1] = 1
    locType[2] = 2
    locType[3] = 4
    
    locPage = 0
    locSort = 1



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
    Relate:Log.Close
    Relate:LogInPanels.Close
    Relate:Pnl_test.Close
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
    UpdateLog(locField)
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
    OF ?LoginOrder
      ThisWindow.Update
      locSort = 1
      BRW1.ResetFromFile
      ThisWindow.Reset
    OF ?AlphaOrder
      ThisWindow.Update
      locSort=2
      BRW1.ResetFromFile
      ThisWindow.Reset
    OF ?RequestOrder
      ThisWindow.Update
      locSort=3
      BRW1.ResetFromFile
      ThisWindow.Reset
    OF ?RequestAlpha
      ThisWindow.Update
      locSort=4
      BRW1.ResetFromFile
      ThisWindow.Reset
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
  CASE FIELD()
  OF ?RelTree
    CASE EVENT()
    ELSE
      CASE EVENT()
      OF EVENT:AlertKey
        CASE KEYCODE()
        OF CtrlRight
          ?RelTree{PropList:MouseDownRow} = CHOICE(?RelTree)
          POST(EVENT:Expanded,?RelTree)
        OF CtrlLeft
          ?RelTree{PropList:MouseDownRow} = CHOICE(?RelTree)
          POST(EVENT:Contracted,?RelTree)
        END
      END
    END
  END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?RelTree
    CASE EVENT()
    OF EVENT:Expanded
      DO REL7::LoadLevel
    OF EVENT:Contracted
      DO REL7::UnloadLevel
    END
  END
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
  locField =  ?Browse:1{PROPLIST:MouseDownField}
  SELECT(?Close)
    CASE FIELD()
    OF ?RelTree
      CASE KEYCODE()
      OF MouseRight
      OROF AppsKey
        EXECUTE(POPUP('E&xpand All|Co&ntract All'))
          DO REL7::ExpandAll
          DO REL7::ContractAll
        END
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
  locField =  ?Browse:1{PROPLIST:MouseDownField}
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:GainFocus
      REL7::CurrentChoice = CHOICE(?RelTree)
      GET(Queue:RelTree,REL7::CurrentChoice)
      REL7::NewItemLevel = REL7::Level
      REL7::NewItemPosition = REL7::Position
      DO REL7::RefreshTree
    OF EVENT:OpenWindow
      PAT:VOLUME = (Pat:VOLUME1 + Pat:VOLUME2 + Pat:Volume3 + Pat:Volume4 + Pat:Volume5)
      locVolumeReceived = PAT:VOLUME * 1000
      
      SET(LogInPanelTests)
      LOOP
        NEXT(LogInPanelTests)
        IF ERRORCODE() THEN BREAK.
        CASE LPT:TYPE
        OF 1
          locVolume[1] += 1
        OF 2
          locVolume[2] += 1
        OF 3
          locVolume[3] += 1
        .
      .
      locIgECount  = locVolume[1]
      locIgGCount  = locVolume[2]
      locIgG4Count = locVolume[3]
      locNeeded[1] = locVolume[1] * 60 + (locVolume[2] + locVolume[3])
      locNeeded[2] = locVolume[1] * 50 + (locVolume[2] + locVolume[3])
      locNeeded[3] = locVolume[1] * 40 + (locVolume[2] + locVolume[3])
      PAT:NEEDED = locNeeded[1]
      IF PAT:NEEDED/1000 > PAT:VOLUME
        UNHIDE(?String50)
        UNHIDE(?String40)
        locResult += 1
        ?locVolumeReceived{PROP:Color,1} = COLOR:Aqua
        ?locNeeded_1{PROP:Color,1} = COLOR:Aqua
        IF locNeeded[2]/1000 > PAT:VOLUME
          locResult += 2
          ?locNeeded_2{PROP:Color,1} = COLOR:Aqua
        .
        IF locNeeded[3]/1000 > PAT:VOLUME
          locResult += 4
          ?locNeeded_3{PROP:Color,1} = COLOR:Aqua
        .
      ELSE
        HIDE(?locNeeded_2)
        HIDE(?locNeeded_3)
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
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF locSort=1
    RETURN SELF.SetSort(1,Force)
  ELSIF locSort=2
    RETURN SELF.SetSort(2,Force)
  ELSIF locSort=3
    RETURN SELF.SetSort(3,Force)
  ELSIF locSort=4
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


BRW1.SetAlerts PROCEDURE

  CODE
  SELF.EditViaPopup = False
  PARENT.SetAlerts


BRW1.SetQueueRecord PROCEDURE

  CODE
  PARENT.SetQueueRecord
  
  IF (LOG:Page=1)
    SELF.Q.LOG:Code_NormalFG = -1                          ! Set conditional color values for LOG:Code
    SELF.Q.LOG:Code_NormalBG = 11206570
    SELF.Q.LOG:Code_SelectedFG = -1
    SELF.Q.LOG:Code_SelectedBG = -1
  ELSIF (LOG:Page = 2)
    SELF.Q.LOG:Code_NormalFG = -1                          ! Set conditional color values for LOG:Code
    SELF.Q.LOG:Code_NormalBG = 12189695
    SELF.Q.LOG:Code_SelectedFG = -1
    SELF.Q.LOG:Code_SelectedBG = -1
  ELSIF (LOG:Page=3)
    SELF.Q.LOG:Code_NormalFG = -1                          ! Set conditional color values for LOG:Code
    SELF.Q.LOG:Code_NormalBG = 16777134
    SELF.Q.LOG:Code_SelectedFG = -1
    SELF.Q.LOG:Code_SelectedBG = -1
  ELSE
    SELF.Q.LOG:Code_NormalFG = -1                          ! Set color values for LOG:Code
    SELF.Q.LOG:Code_NormalBG = -1
    SELF.Q.LOG:Code_SelectedFG = -1
    SELF.Q.LOG:Code_SelectedBG = -1
  END
  SELF.Q.LOG:Code_Style = 0 ! 
  IF (LOG:Page=1)
    SELF.Q.LOG:Description_NormalFG = -1                   ! Set conditional color values for LOG:Description
    SELF.Q.LOG:Description_NormalBG = 11206570
    SELF.Q.LOG:Description_SelectedFG = -1
    SELF.Q.LOG:Description_SelectedBG = -1
  ELSIF (LOG:Page =2)
    SELF.Q.LOG:Description_NormalFG = -1                   ! Set conditional color values for LOG:Description
    SELF.Q.LOG:Description_NormalBG = 12189695
    SELF.Q.LOG:Description_SelectedFG = -1
    SELF.Q.LOG:Description_SelectedBG = -1
  ELSIF (LOG:Page=3)
    SELF.Q.LOG:Description_NormalFG = -1                   ! Set conditional color values for LOG:Description
    SELF.Q.LOG:Description_NormalBG = 16777134
    SELF.Q.LOG:Description_SelectedFG = -1
    SELF.Q.LOG:Description_SelectedBG = -1
  ELSE
    SELF.Q.LOG:Description_NormalFG = -1                   ! Set color values for LOG:Description
    SELF.Q.LOG:Description_NormalBG = -1
    SELF.Q.LOG:Description_SelectedFG = -1
    SELF.Q.LOG:Description_SelectedBG = -1
  END
  SELF.Q.LOG:Description_Style = 0 ! 
  IF (LOG:IgE = 'X')
    SELF.Q.LOG:IgE_NormalFG = 0                            ! Set conditional color values for LOG:IgE
    SELF.Q.LOG:IgE_NormalBG = 255
    SELF.Q.LOG:IgE_SelectedFG = -1
    SELF.Q.LOG:IgE_SelectedBG = -1
  ELSE
    SELF.Q.LOG:IgE_NormalFG = -1                           ! Set color values for LOG:IgE
    SELF.Q.LOG:IgE_NormalBG = -1
    SELF.Q.LOG:IgE_SelectedFG = -1
    SELF.Q.LOG:IgE_SelectedBG = -1
  END
  SELF.Q.LOG:IgE_Style = 0 ! 
  IF (LOG:IgG4 = 'X')
    SELF.Q.LOG:IgG4_NormalFG = 0                           ! Set conditional color values for LOG:IgG4
    SELF.Q.LOG:IgG4_NormalBG = 65535
    SELF.Q.LOG:IgG4_SelectedFG = -1
    SELF.Q.LOG:IgG4_SelectedBG = -1
  ELSE
    SELF.Q.LOG:IgG4_NormalFG = -1                          ! Set color values for LOG:IgG4
    SELF.Q.LOG:IgG4_NormalBG = -1
    SELF.Q.LOG:IgG4_SelectedFG = -1
    SELF.Q.LOG:IgG4_SelectedBG = -1
  END
  SELF.Q.LOG:IgG4_Style = 0 ! 
  IF (LOG:IgG = 'X')
    SELF.Q.LOG:IgG_NormalFG = 16777215                     ! Set conditional color values for LOG:IgG
    SELF.Q.LOG:IgG_NormalBG = 16711680
    SELF.Q.LOG:IgG_SelectedFG = -1
    SELF.Q.LOG:IgG_SelectedBG = -1
  ELSE
    SELF.Q.LOG:IgG_NormalFG = -1                           ! Set color values for LOG:IgG
    SELF.Q.LOG:IgG_NormalBG = -1
    SELF.Q.LOG:IgG_SelectedFG = -1
    SELF.Q.LOG:IgG_SelectedBG = -1
  END
  SELF.Q.LOG:IgG_Style = 0 ! 
  SELF.Q.locPageDescription_NormalFG = -1                  ! Set color values for locPageDescription
  SELF.Q.locPageDescription_NormalBG = -1
  SELF.Q.locPageDescription_SelectedFG = -1
  SELF.Q.locPageDescription_SelectedBG = -1
  SELF.Q.locPageDescription_Style = 0 ! 


BRW1.SetSort PROCEDURE(BYTE NewOrder,BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.SetSort(NewOrder,Force)
  IF BRW1::LastSortOrder <> NewOrder THEN
     BRW1::FormatManager.SetCurrentFormat(CHOOSE(NewOrder>4,2,NewOrder+2),'SortOrder'&CHOOSE(NewOrder>4,1,NewOrder+1))
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
  CASE LOG:Page
  OF 1
    locPageDescription = 'Pollens'
  OF 2
    locPageDescription = 'Non-Pollen'
  OF 3
    locPageDescription = 'Foods'
  OF 4
    locPageDescription = 'Chemicals'
  .
  BRW1::RecordStatus=ReturnValue
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

REL7::Toolbar.TakeEvent PROCEDURE(<*LONG VCR>,WindowManager WM)
  CODE
  CASE ACCEPTED()
  OF Toolbar:Bottom TO Toolbar:Up
    SELF.Control{PROPLIST:MouseDownRow} = CHOICE(SELF.Control) !! Server routines assume this
    EXECUTE(ACCEPTED()-Toolbar:Bottom+1)
      DO REL7::NextParent
      DO REL7::PreviousParent
      DO REL7::NextLevel
      DO REL7::PreviousLevel
      DO REL7::NextRecord
      DO REL7::PreviousRecord
    END
  ELSE
    PARENT.TakeEvent(VCR,ThisWindow)
  END
!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
Volume PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Volume'),AT(17,73,262,132),FONT('Arial',11,,FONT:regular),GRAY
                       STRING('Volume 3'),AT(70,17),USE(?String1),TRN
                       ENTRY(@n5.1),AT(110,17,29,10),USE(Pat:Volume3),RIGHT(2)
                       BUTTON('Serum Label 3'),AT(150,17,67,12),USE(?SerumLabel3)
                       STRING('Volume 4'),AT(70,35),USE(?String2),TRN
                       ENTRY(@n5.1),AT(110,35,29,10),USE(Pat:Volume4),RIGHT(2)
                       BUTTON('Serum Label 4'),AT(150,35,67,12),USE(?SerumLabel4)
                       STRING('Volume 5'),AT(71,54),USE(?String3),TRN
                       ENTRY(@n5.1),AT(110,54,29,10),USE(Pat:Volume5),RIGHT(2)
                       BUTTON('Serum Label 5'),AT(150,54,67,12),USE(?SerumLabel5)
                       BUTTON('&OK'),AT(182,81,72,26),USE(?VolumeOK),LEFT,ICON(ICON:Tick),DEFAULT,STD(STD:Close)
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('Volume')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?String1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Volume',Window)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
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
  IF SELF.Opened
    INIMgr.Update('Volume',Window)                         ! Save window data to non-volatile store
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
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SerumLabel3
      ThisWindow.Update
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-3"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
    OF ?SerumLabel4
      ThisWindow.Update
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-4"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-4"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
    OF ?SerumLabel5
      ThisWindow.Update
              InitStr = 'N<10>B' & gloLabelXpos & ',' & gloLabelYpos & ',0,3,3,6,70,N,"' & CLIP(PAT:Invoice) & '-5"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A1,180,3,4,1,1,N,"' & CLIP(PAT:Invoice) & '-5"<10>'
              ComPuts(CommPort,InitStr)
              InitStr = 'A40,150,0,3,1,1,N,"' & CLIP(PAT:Last) & ', ' & CLIP(PAT:First) & '"<10>P1<10>'
              ComPuts(CommPort,InitStr)
      
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

!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
GenerateOutput       PROCEDURE                             ! Declare Procedure
      
locCovid             LONG                                  !
locStartTime         LONG                                  !

  CODE
  locCovid = FALSE
  locStartTime = CLOCK()
  CLOSE(TEST)
  SHARE(AddTests)
  IF ERRORCODE() THEN STOP('OPEN AT: ' & ERROR()).
  IndexedPage[CurrentPage] = TransferPage
  K# = -210
  CLEAR(AT:Record)
  AT:Patient = PAT:Invoice
  C# = 0
  T# = CLOCK()

  LOOP CurrentPage = 1 TO 4
    TransferPage = IndexedPage[CurrentPage]
    K# += 252
    LOOP I# = 1 TO 252
      IF INSTRING('*',AP:Text[I#],1) THEN CYCLE.
      IF AP:Checked[I#] = '1'
        AP:Checked[I#] = '0'
        IF AP:IgE[I#]
          AT:Type = 1
          AT:Code = SUB(AP:Text[I#],2,4)
          ADD(AddTests)
          IF ERRORCODE() THEN STOP(ERROR()).
          AP:IgE[I#] = 0
        .
        IF AP:IgG[I#]
          AT:Type = 2
          AT:Code = SUB(AP:Text[I#],2,4)
          ADD(AddTests)
          IF ERRORCODE() THEN STOP(ERROR()).
          AP:IgG[I#] = 0
        .
        IF AP:IgG4[I#]
          AT:Type = 3
          AT:Code = SUB(AP:Text[I#],2,4)
          ADD(AddTests)
          IF ERRORCODE() THEN STOP(ERROR()).
          AP:IgG4[I#] = 0
    . . .
    IndexedPage[CurrentPage] = TransferPage
  .
  
  


 
    LOOP I# = 1 TO 30
      IF stdPanelCheckBox[I#]
        AT:Type = 0
        AT:Code = gloStdPanelCodes[I#]
        ADD(AddTests)
        IF Pat:BILLING = 'I'
          CLEAR(Pnl_test)
          PT:PANEL = gloStdPanelCodes[I#]
          SET(PT:ORDER_KEY,PT:ORDER_KEY)
          LOOP UNTIL EOF(Pnl_test)
            NEXT(Pnl_test)
            IF PT:PANEL <> gloStdPanelCodes[I#] OR ERRORCODE() THEN BREAK.
            IF PT:TYPE > 6 
              locCovid = TRUE
              BREAK
            .
          .
        .
      .
    .


  LOOP I# = 1 TO 20
    IF PanelCheckBox[I#]                          
      AT:Type = 0
      AT:Code = gloPanelCodes[I#]
      ADD(AddTests)
      CLEAR(Pnl_test)
      PT:PANEL = gloStdPanelCodes[I#]
      SET(PT:ORDER_KEY,PT:ORDER_KEY)
      IF Pat:BILLING = 'I' AND ~locCovid
        LOOP UNTIL EOF(Pnl_test)
          NEXT(Pnl_test)
          IF PT:PANEL <> gloStdPanelCodes[I#] OR ERRORCODE() THEN BREAK.
          IF PT:TYPE > 6 
            locCovid = TRUE
            BREAK
          .
      .  .
      
    .
  .
  CLOSE(AddTests)

  locIgE = FALSE
  locIgG = FALSE
  locIgG4 = FALSE


















 OMIT('XXXX')






 SHARE(Login)
 gloTabFileName = '..\Login\' & PAT:Invoice & '.LOG'
 CREATE(TabData)
 OPEN(TabData)
 LOOP I# = 1 TO 630
   IF Selections[I#].Checked
     IF ~locCodes[I#] THEN CYCLE.
     IF Selections[I#].IgE
       TD:Data = '1 ' & locCodes[I#]
       ADD(TabData)
       PageCheckBox[FIELD()].IgE = FALSE
     .
     IF Selections[I#].IgG
       TD:Data = '2 ' & locCodes[I#]
       ADD(TabData)
       PageCheckBox[FIELD()].IgG = FALSE
     .
     IF Selections[I#].IgG4
       TD:Data = '3 ' & locCodes[I#]
       ADD(TabData)
       PageCheckBox[FIELD()].IgG4 = FALSE
     .
 . .
 
 LOOP I# = 1 TO 30
   IF stdPanelCheckBox[I#]
       TD:Data = '0 ' & gloStdPanelCodes[I#]
       (TabData)
   .
 .
 LOOP I# = 1 TO 20
   IF PanelCheckBox[I#]
     TD:Data = '0 ' & gloPanelCodes[I#]
     ADD(TabData)
   .
 .
 CLOSE(TabData)
 LI:Status = 'L'
 LI:Date = TODAY()
 LI:Invoice = PAT:Invoice
 ADD(Login)
 CLOSE(Login)
 locIgE = TRUE
 locIgG = FALSE
 locIgG4 = FALSE

 RETURN
    




 XXXX
!!! <summary>
!!! Generated from procedure template - Source
!!! </summary>
UpdateLog            PROCEDURE  (prmType)                  ! Declare Procedure

  CODE
  IF ~INRANGE(prmType,3,5) THEN RETURN.


  TransferPage = IndexedPage[LOG:Page]
  CASE prmType - 2
  OF 1
    IF LOG:IgE = 'X'
      LOG:IgE = ''
      AP:IgE[LOG:CheckBox] = 0
    ELSE
      LOG:IgE = 'X'
      AP:IgE[LOG:CheckBox] = 1
    .
    
  OF 3
     IF LOG:IgG = 'X'
      LOG:IgG = ''
      AP:IgG[LOG:CheckBox] = 0
    ELSE
      LOG:IgG = 'X'
      AP:IgG[LOG:CheckBox] = 1
    .
 OF 2
     IF LOG:IgG4 = 'X'
      LOG:IgG4 = ''
      AP:IgG4[LOG:CheckBox] = 0
    ELSE
      LOG:IgG4 = 'X'
      AP:IgG4[LOG:CheckBox] = 1
    .
  .
  IF  (AP:IgG4[LOG:CheckBox] + AP:IgG[LOG:CheckBox] + AP:IgE[LOG:CheckBox])
    AP:Checked[LOG:CheckBox] = '1'
  ELSE
    AP:Checked[LOG:CheckBox] = '0'
  .
  PUT(LOG)
  IndexedPage[LOG:Page] = TransferPage  ! Update Indexed Pages

!ActivePage           GROUP,PRE(AP),DIM(210)            ! The Active Page of Allergen Descriptions and Checked Boxes
!Checked                STRING(1)
!IgE                    BYTE
!IgG                    BYTE
!IgG4                   BYTE
!Text                   STRING(25)
!                     .
!TransferPage     BYTE,DIM(SIZE(ActivePage)),OVER(ActivePage) ! Used to Move Data between Active and IndexedPage Storage
!IndexedPage      BYTE,DIM(3,SIZE(TransferPage))              ! Hold All 3 pages of Text and Check Marked Boxes

!      IndexedPage[CurrentPage] = TransferPage    saving active page
!      CurrentPage = 2  ! Pollens
!      TransferPage = IndexedPage[CurrentPage]
!!! <summary>
!!! Generated from procedure template - Window
!!! Adds Tests to Panels when prmAction = 1 in LoginTests
!!! </summary>
AddPanelTests PROCEDURE 

EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW('Adding Tests to Panel'),AT(,,214,90),FONT('Arial',11,,FONT:regular),GRAY
                       STRING(@s9),AT(79,37),USE(gloPanelNumber),FONT(,16,,FONT:bold,CHARSET:ANSI),TRN
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

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
  GlobalErrors.SetProcedureName('AddPanelTests')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?gloPanelNumber
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Pnl_test.SetOpenRelated()
  Relate:Pnl_test.Open                                     ! File Pnl_test used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('AddPanelTests',Window)                     ! Restore window settings from non-volatile store
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
    Relate:Pnl_test.Close
  END
  IF SELF.Opened
    INIMgr.Update('AddPanelTests',Window)                  ! Save window data to non-volatile store
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
    OF EVENT:OpenWindow
        IndexedPage[CurrentPage] = TransferPage
        CLEAR(PT:Record)
        PT:PANEL = gloPanelNumber
        LOOP CurrentPage = 1 TO 3
          TransferPage = IndexedPage[CurrentPage]
          LOOP I# = 1 TO 210
            IF INSTRING('*',AP:Text[I#],1) THEN CYCLE.
            IF AP:Checked[I#] = '1'
              AP:Checked[I#] = '0'
              IF AP:IgE[I#]
                PT:TYPE = 1
                PT:CODE = SUB(AP:Text[I#],2,4)
                ADD(Pnl_Test)
                IF ERRORCODE() THEN STOP(ERROR()).
                AP:IgE[I#] = 0
              .
              IF AP:IgG[I#]
                PT:TYPE = 2
                PT:CODE = SUB(AP:Text[I#],2,4)
                ADD(Pnl_Test)
                IF ERRORCODE() THEN STOP(ERROR()).
                AP:IgG[I#] = 0
              .
              IF AP:IgG4[I#]
                PT:TYPE = 3
                PT:CODE = SUB(AP:Text[I#],2,4)
                ADD(Pnl_Test)
                IF ERRORCODE() THEN STOP(ERROR()).
                AP:IgG4[I#] = 0
          . . .
          IndexedPage[CurrentPage] = TransferPage
        .
        POST(EVENT:CloseWindow)
      
      
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! </summary>
LoginAlpha PROCEDURE (prmAction)

EGG4                 STRING(1)                             !
SelectedTab          LONG                                  !
locEG4               BYTE                                  !
EnhancedFocusManager EnhancedFocusClassType
Window               WINDOW,AT(0,0,678,406),FONT('Arial Narrow',8),GRAY,MDI
                       CHECK,AT(15,15,10,10),USE(AP:Checked[1]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(15,23,10,10),USE(AP:Checked[2]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,33,10,10),USE(AP:Checked[3]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,43,10,10),USE(AP:Checked[4]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,53,10,10),USE(AP:Checked[5]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,63,10,10),USE(AP:Checked[6]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,73,10,10),USE(AP:Checked[7]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,83,10,10),USE(AP:Checked[8]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,93,10,10),USE(AP:Checked[9]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,103,10,10),USE(AP:Checked[10]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,113,10,10),USE(AP:Checked[11]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,123,10,10),USE(AP:Checked[12]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,133,10,10),USE(AP:Checked[13]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,143,10,10),USE(AP:Checked[14]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,153,10,10),USE(AP:Checked[15]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,163,10,10),USE(AP:Checked[16]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,173,10,10),USE(AP:Checked[17]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,183,10,10),USE(AP:Checked[18]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,193,10,10),USE(AP:Checked[19]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,203,10,10),USE(AP:Checked[20]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,213,10,10),USE(AP:Checked[21]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,223,10,10),USE(AP:Checked[22]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,233,10,10),USE(AP:Checked[23]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,243,10,10),USE(AP:Checked[24]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,253,10,10),USE(AP:Checked[25]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,263,10,10),USE(AP:Checked[26]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,273,10,10),USE(AP:Checked[27]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,283,10,10),USE(AP:Checked[28]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,293,10,10),USE(AP:Checked[29]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,303,10,10),USE(AP:Checked[30]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,313,10,10),USE(AP:Checked[31]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,323,10,10),USE(AP:Checked[32]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,333,10,10),USE(AP:Checked[33]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,343,10,10),USE(AP:Checked[34]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,353,10,10),USE(AP:Checked[35]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(15,363,10,10),USE(AP:Checked[36]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,15,10,10),USE(AP:Checked[37]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(110,23,10,10),USE(AP:Checked[38]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,33,10,10),USE(AP:Checked[39]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,43,10,10),USE(AP:Checked[40]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,53,10,10),USE(AP:Checked[41]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,63,10,10),USE(AP:Checked[42]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,73,10,10),USE(AP:Checked[43]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,83,10,10),USE(AP:Checked[44]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,93,10,10),USE(AP:Checked[45]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,103,10,10),USE(AP:Checked[46]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,113,10,10),USE(AP:Checked[47]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,123,10,10),USE(AP:Checked[48]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,133,10,10),USE(AP:Checked[49]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,143,10,10),USE(AP:Checked[50]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,153,10,10),USE(AP:Checked[51]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,163,10,10),USE(AP:Checked[52]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,173,10,10),USE(AP:Checked[53]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,183,10,10),USE(AP:Checked[54]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,193,10,10),USE(AP:Checked[55]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,203,10,10),USE(AP:Checked[56]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,213,10,10),USE(AP:Checked[57]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,223,10,10),USE(AP:Checked[58]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,233,10,10),USE(AP:Checked[59]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,243,10,10),USE(AP:Checked[60]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,253,10,10),USE(AP:Checked[61]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,263,10,10),USE(AP:Checked[62]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,273,10,10),USE(AP:Checked[63]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,283,10,10),USE(AP:Checked[64]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,293,10,10),USE(AP:Checked[65]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,303,10,10),USE(AP:Checked[66]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,313,10,10),USE(AP:Checked[67]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,323,10,10),USE(AP:Checked[68]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,333,10,10),USE(AP:Checked[69]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,343,10,10),USE(AP:Checked[70]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,353,10,10),USE(AP:Checked[71]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(110,363,10,10),USE(AP:Checked[72]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,15,10,10),USE(AP:Checked[73]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(205,23,10,10),USE(AP:Checked[74]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,33,10,10),USE(AP:Checked[75]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,43,10,10),USE(AP:Checked[76]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,53,10,10),USE(AP:Checked[77]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,63,10,10),USE(AP:Checked[78]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,73,10,10),USE(AP:Checked[79]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,83,10,10),USE(AP:Checked[80]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,93,10,10),USE(AP:Checked[81]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,103,10,10),USE(AP:Checked[82]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,113,10,10),USE(AP:Checked[83]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,123,10,10),USE(AP:Checked[84]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,133,10,10),USE(AP:Checked[85]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,143,10,10),USE(AP:Checked[86]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,153,10,10),USE(AP:Checked[87]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,163,10,10),USE(AP:Checked[88]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,173,10,10),USE(AP:Checked[89]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,183,10,10),USE(AP:Checked[90]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,193,10,10),USE(AP:Checked[91]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,203,10,10),USE(AP:Checked[92]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,213,10,10),USE(AP:Checked[93]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,223,10,10),USE(AP:Checked[94]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,233,10,10),USE(AP:Checked[95]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,243,10,10),USE(AP:Checked[96]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,253,10,10),USE(AP:Checked[97]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,263,10,10),USE(AP:Checked[98]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,273,10,10),USE(AP:Checked[99]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,283,10,10),USE(AP:Checked[100]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,293,10,10),USE(AP:Checked[101]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,303,10,10),USE(AP:Checked[102]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,313,10,10),USE(AP:Checked[103]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,323,10,10),USE(AP:Checked[104]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,333,10,10),USE(AP:Checked[105]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,343,10,10),USE(AP:Checked[106]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,353,10,10),USE(AP:Checked[107]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(205,363,10,10),USE(AP:Checked[108]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,15,10,10),USE(AP:Checked[109]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(300,23,10,10),USE(AP:Checked[110]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,33,10,10),USE(AP:Checked[111]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,43,10,10),USE(AP:Checked[112]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,53,10,10),USE(AP:Checked[113]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,63,10,10),USE(AP:Checked[114]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,73,10,10),USE(AP:Checked[115]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,83,10,10),USE(AP:Checked[116]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,93,10,10),USE(AP:Checked[117]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,103,10,10),USE(AP:Checked[118]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,113,10,10),USE(AP:Checked[119]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,123,10,10),USE(AP:Checked[120]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,133,10,10),USE(AP:Checked[121]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,143,10,10),USE(AP:Checked[122]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,153,10,10),USE(AP:Checked[123]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,163,10,10),USE(AP:Checked[124]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,173,10,10),USE(AP:Checked[125]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,183,10,10),USE(AP:Checked[126]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,193,10,10),USE(AP:Checked[127]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,203,10,10),USE(AP:Checked[128]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,213,10,10),USE(AP:Checked[129]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,223,10,10),USE(AP:Checked[130]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,233,10,10),USE(AP:Checked[131]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,243,10,10),USE(AP:Checked[132]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,253,10,10),USE(AP:Checked[133]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,263,10,10),USE(AP:Checked[134]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,273,10,10),USE(AP:Checked[135]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,283,10,10),USE(AP:Checked[136]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,293,10,10),USE(AP:Checked[137]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,303,10,10),USE(AP:Checked[138]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,313,10,10),USE(AP:Checked[139]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,323,10,10),USE(AP:Checked[140]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,333,10,10),USE(AP:Checked[141]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,343,10,10),USE(AP:Checked[142]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,353,10,10),USE(AP:Checked[143]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(300,363,10,10),USE(AP:Checked[144]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,15,10,10),USE(AP:Checked[145]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(395,23,10,10),USE(AP:Checked[146]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,33,10,10),USE(AP:Checked[147]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,43,10,10),USE(AP:Checked[148]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,53,10,10),USE(AP:Checked[149]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,63,10,10),USE(AP:Checked[150]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,73,10,10),USE(AP:Checked[151]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,83,10,10),USE(AP:Checked[152]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,93,10,10),USE(AP:Checked[153]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,103,10,10),USE(AP:Checked[154]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,113,10,10),USE(AP:Checked[155]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,123,10,10),USE(AP:Checked[156]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,133,10,10),USE(AP:Checked[157]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,143,10,10),USE(AP:Checked[158]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,153,10,10),USE(AP:Checked[159]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,163,10,10),USE(AP:Checked[160]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,173,10,10),USE(AP:Checked[161]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,183,10,10),USE(AP:Checked[162]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,193,10,10),USE(AP:Checked[163]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,203,10,10),USE(AP:Checked[164]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,213,10,10),USE(AP:Checked[165]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,223,10,10),USE(AP:Checked[166]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,233,10,10),USE(AP:Checked[167]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,243,10,10),USE(AP:Checked[168]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,253,10,10),USE(AP:Checked[169]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,263,10,10),USE(AP:Checked[170]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,273,10,10),USE(AP:Checked[171]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,283,10,10),USE(AP:Checked[172]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,293,10,10),USE(AP:Checked[173]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,303,10,10),USE(AP:Checked[174]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,313,10,10),USE(AP:Checked[175]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,323,10,10),USE(AP:Checked[176]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,333,10,10),USE(AP:Checked[177]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,343,10,10),USE(AP:Checked[178]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,353,10,10),USE(AP:Checked[179]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(395,363,10,10),USE(AP:Checked[180]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,15,10,10),USE(AP:Checked[181]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(490,23,10,10),USE(AP:Checked[182]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,33,10,10),USE(AP:Checked[183]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,43,10,10),USE(AP:Checked[184]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,53,10,10),USE(AP:Checked[185]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,63,10,10),USE(AP:Checked[186]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,73,10,10),USE(AP:Checked[187]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,83,10,10),USE(AP:Checked[188]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,93,10,10),USE(AP:Checked[189]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,103,10,10),USE(AP:Checked[190]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,113,10,10),USE(AP:Checked[191]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,123,10,10),USE(AP:Checked[192]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,133,10,10),USE(AP:Checked[193]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,143,10,10),USE(AP:Checked[194]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,153,10,10),USE(AP:Checked[195]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,163,10,10),USE(AP:Checked[196]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,173,10,10),USE(AP:Checked[197]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,183,10,10),USE(AP:Checked[198]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,193,10,10),USE(AP:Checked[199]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,203,10,10),USE(AP:Checked[200]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,213,10,10),USE(AP:Checked[201]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,223,10,10),USE(AP:Checked[202]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,233,10,10),USE(AP:Checked[203]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,243,10,10),USE(AP:Checked[204]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,253,10,10),USE(AP:Checked[205]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,263,10,10),USE(AP:Checked[206]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,273,10,10),USE(AP:Checked[207]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,283,10,10),USE(AP:Checked[208]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,293,10,10),USE(AP:Checked[209]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,303,10,10),USE(AP:Checked[210]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,313,10,10),USE(AP:Checked[211]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,323,10,10),USE(AP:Checked[212]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,333,10,10),USE(AP:Checked[213]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,343,10,10),USE(AP:Checked[214]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,353,10,10),USE(AP:Checked[215]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(490,363,10,10),USE(AP:Checked[216]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,15,10,10),USE(AP:Checked[217]),ALRT(MouseRight),HIDE,TRN,VALUE('1','0')
                       CHECK,AT(585,23,10,10),USE(AP:Checked[218]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,33,10,10),USE(AP:Checked[219]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,43,10,10),USE(AP:Checked[220]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,53,10,10),USE(AP:Checked[221]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,63,10,10),USE(AP:Checked[222]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,73,10,10),USE(AP:Checked[223]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,83,10,10),USE(AP:Checked[224]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,93,10,10),USE(AP:Checked[225]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,103,10,10),USE(AP:Checked[226]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,113,10,10),USE(AP:Checked[227]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,123,10,10),USE(AP:Checked[228]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,133,10,10),USE(AP:Checked[229]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,143,10,10),USE(AP:Checked[230]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,153,10,10),USE(AP:Checked[231]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,163,10,10),USE(AP:Checked[232]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,173,10,10),USE(AP:Checked[233]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,183,10,10),USE(AP:Checked[234]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,193,10,10),USE(AP:Checked[235]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,203,10,10),USE(AP:Checked[236]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,213,10,10),USE(AP:Checked[237]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,223,10,10),USE(AP:Checked[238]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,233,10,10),USE(AP:Checked[239]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,243,10,10),USE(AP:Checked[240]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,253,10,10),USE(AP:Checked[241]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,263,10,10),USE(AP:Checked[242]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,273,10,10),USE(AP:Checked[243]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,283,10,10),USE(AP:Checked[244]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,293,10,10),USE(AP:Checked[245]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,303,10,10),USE(AP:Checked[246]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,313,10,10),USE(AP:Checked[247]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,323,10,10),USE(AP:Checked[248]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,333,10,10),USE(AP:Checked[249]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,343,10,10),USE(AP:Checked[250]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,353,10,10),USE(AP:Checked[251]),ALRT(MouseRight),TRN,VALUE('1','0')
                       CHECK,AT(585,363,10,10),USE(AP:Checked[252]),ALRT(MouseRight),TRN,VALUE('1','0')
                       STRING(@s32),AT(25,15,80,10),USE(AP:Text[1]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(25,24,80,10),USE(AP:Text[2]),TRN
                       STRING(@s32),AT(25,34,80,10),USE(AP:Text[3]),TRN
                       STRING(@s32),AT(25,44,80,10),USE(AP:Text[4]),TRN
                       STRING(@s32),AT(25,54,80,10),USE(AP:Text[5]),TRN
                       STRING(@s32),AT(25,64,80,10),USE(AP:Text[6]),TRN
                       STRING(@s32),AT(25,74,80,10),USE(AP:Text[7]),TRN
                       STRING(@s32),AT(25,84,80,10),USE(AP:Text[8]),TRN
                       STRING(@s32),AT(25,94,80,10),USE(AP:Text[9]),TRN
                       STRING(@s32),AT(25,104,80,10),USE(AP:Text[10]),TRN
                       STRING(@s32),AT(25,114,80,10),USE(AP:Text[11]),TRN
                       STRING(@s32),AT(25,124,80,10),USE(AP:Text[12]),TRN
                       STRING(@s32),AT(25,134,80,10),USE(AP:Text[13]),TRN
                       STRING(@s32),AT(25,144,80,10),USE(AP:Text[14]),TRN
                       STRING(@s32),AT(25,154,80,10),USE(AP:Text[15]),TRN
                       STRING(@s32),AT(25,164,80,10),USE(AP:Text[16]),TRN
                       STRING(@s32),AT(25,174,80,10),USE(AP:Text[17]),TRN
                       STRING(@s32),AT(25,184,80,10),USE(AP:Text[18]),TRN
                       STRING(@s32),AT(25,194,80,10),USE(AP:Text[19]),TRN
                       STRING(@s32),AT(25,204,80,10),USE(AP:Text[20]),TRN
                       STRING(@s32),AT(25,214,80,10),USE(AP:Text[21]),TRN
                       STRING(@s32),AT(25,224,80,10),USE(AP:Text[22]),TRN
                       STRING(@s32),AT(25,234,80,10),USE(AP:Text[23]),TRN
                       STRING(@s32),AT(25,244,80,10),USE(AP:Text[24]),TRN
                       STRING(@s32),AT(25,254,80,10),USE(AP:Text[25]),TRN
                       STRING(@s32),AT(25,264,80,10),USE(AP:Text[26]),TRN
                       STRING(@s32),AT(25,274,80,10),USE(AP:Text[27]),TRN
                       STRING(@s32),AT(25,284,80,10),USE(AP:Text[28]),TRN
                       STRING(@s32),AT(25,294,80,10),USE(AP:Text[29]),TRN
                       STRING(@s32),AT(25,304,80,10),USE(AP:Text[30]),TRN
                       STRING(@s32),AT(25,314,80,10),USE(AP:Text[31]),TRN
                       STRING(@s32),AT(25,324,80,10),USE(AP:Text[32]),TRN
                       STRING(@s32),AT(25,334,80,10),USE(AP:Text[33]),TRN
                       STRING(@s32),AT(25,344,80,10),USE(AP:Text[34]),TRN
                       STRING(@s32),AT(25,354,80,10),USE(AP:Text[35]),TRN
                       STRING(@s32),AT(25,364,80,10),USE(AP:Text[36]),TRN
                       STRING(@s32),AT(120,15,80,10),USE(AP:Text[37]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(120,24,80,10),USE(AP:Text[38]),TRN
                       STRING(@s32),AT(120,34,80,10),USE(AP:Text[39]),TRN
                       STRING(@s32),AT(120,44,80,10),USE(AP:Text[40]),TRN
                       STRING(@s32),AT(120,54,80,10),USE(AP:Text[41]),TRN
                       STRING(@s32),AT(120,64,80,10),USE(AP:Text[42]),TRN
                       STRING(@s32),AT(120,74,80,10),USE(AP:Text[43]),TRN
                       STRING(@s32),AT(120,84,80,10),USE(AP:Text[44]),TRN
                       STRING(@s32),AT(120,94,80,10),USE(AP:Text[45]),TRN
                       STRING(@s32),AT(120,104,80,10),USE(AP:Text[46]),TRN
                       STRING(@s32),AT(120,114,80,10),USE(AP:Text[47]),TRN
                       STRING(@s32),AT(120,124,80,10),USE(AP:Text[48]),TRN
                       STRING(@s32),AT(120,134,80,10),USE(AP:Text[49]),TRN
                       STRING(@s32),AT(120,144,80,10),USE(AP:Text[50]),TRN
                       STRING(@s32),AT(120,154,80,10),USE(AP:Text[51]),TRN
                       STRING(@s32),AT(120,164,80,10),USE(AP:Text[52]),TRN
                       STRING(@s32),AT(120,174,80,10),USE(AP:Text[53]),TRN
                       STRING(@s32),AT(120,184,80,10),USE(AP:Text[54]),TRN
                       STRING(@s32),AT(120,194,80,10),USE(AP:Text[55]),TRN
                       STRING(@s32),AT(120,204,80,10),USE(AP:Text[56]),TRN
                       STRING(@s32),AT(120,214,80,10),USE(AP:Text[57]),TRN
                       STRING(@s32),AT(120,224,80,10),USE(AP:Text[58]),TRN
                       STRING(@s32),AT(120,234,80,10),USE(AP:Text[59]),TRN
                       STRING(@s32),AT(120,244,80,10),USE(AP:Text[60]),TRN
                       STRING(@s32),AT(120,254,80,10),USE(AP:Text[61]),TRN
                       STRING(@s32),AT(120,264,80,10),USE(AP:Text[62]),TRN
                       STRING(@s32),AT(120,274,80,10),USE(AP:Text[63]),TRN
                       STRING(@s32),AT(120,284,80,10),USE(AP:Text[64]),TRN
                       STRING(@s32),AT(120,294,80,10),USE(AP:Text[65]),TRN
                       STRING(@s32),AT(120,304,80,10),USE(AP:Text[66]),TRN
                       STRING(@s32),AT(120,314,80,10),USE(AP:Text[67]),TRN
                       STRING(@s32),AT(120,324,80,10),USE(AP:Text[68]),TRN
                       STRING(@s32),AT(120,334,80,10),USE(AP:Text[69]),TRN
                       STRING(@s32),AT(120,344,80,10),USE(AP:Text[70]),TRN
                       STRING(@s32),AT(120,354,80,10),USE(AP:Text[71]),TRN
                       STRING(@s32),AT(120,364,80,10),USE(AP:Text[72]),TRN
                       STRING(@s32),AT(215,15,80,10),USE(AP:Text[73]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(215,24,80,10),USE(AP:Text[74]),TRN
                       STRING(@s32),AT(215,34,80,10),USE(AP:Text[75]),TRN
                       STRING(@s32),AT(215,44,80,10),USE(AP:Text[76]),TRN
                       STRING(@s32),AT(215,54,80,10),USE(AP:Text[77]),TRN
                       STRING(@s32),AT(215,64,80,10),USE(AP:Text[78]),TRN
                       STRING(@s32),AT(215,74,80,10),USE(AP:Text[79]),TRN
                       STRING(@s32),AT(215,84,80,10),USE(AP:Text[80]),TRN
                       STRING(@s32),AT(215,94,80,10),USE(AP:Text[81]),TRN
                       STRING(@s32),AT(215,104,80,10),USE(AP:Text[82]),TRN
                       STRING(@s32),AT(215,114,80,10),USE(AP:Text[83]),TRN
                       STRING(@s32),AT(215,124,80,10),USE(AP:Text[84]),TRN
                       STRING(@s32),AT(215,134,80,10),USE(AP:Text[85]),TRN
                       STRING(@s32),AT(215,144,80,10),USE(AP:Text[86]),TRN
                       STRING(@s32),AT(215,154,80,10),USE(AP:Text[87]),TRN
                       STRING(@s32),AT(215,164,80,10),USE(AP:Text[88]),TRN
                       STRING(@s32),AT(215,174,80,10),USE(AP:Text[89]),TRN
                       STRING(@s32),AT(215,184,80,10),USE(AP:Text[90]),TRN
                       STRING(@s32),AT(215,194,80,10),USE(AP:Text[91]),TRN
                       STRING(@s32),AT(215,204,80,10),USE(AP:Text[92]),TRN
                       STRING(@s32),AT(215,214,80,10),USE(AP:Text[93]),TRN
                       STRING(@s32),AT(215,224,80,10),USE(AP:Text[94]),TRN
                       STRING(@s32),AT(215,234,80,10),USE(AP:Text[95]),TRN
                       STRING(@s32),AT(215,244,80,10),USE(AP:Text[96]),TRN
                       STRING(@s32),AT(215,254,80,10),USE(AP:Text[97]),TRN
                       STRING(@s32),AT(215,264,80,10),USE(AP:Text[98]),TRN
                       STRING(@s32),AT(215,274,80,10),USE(AP:Text[99]),TRN
                       STRING(@s32),AT(215,284,80,10),USE(AP:Text[100]),TRN
                       STRING(@s32),AT(215,294,80,10),USE(AP:Text[101]),TRN
                       STRING(@s32),AT(215,304,80,10),USE(AP:Text[102]),TRN
                       STRING(@s32),AT(215,314,80,10),USE(AP:Text[103]),TRN
                       STRING(@s32),AT(215,324,80,10),USE(AP:Text[104]),TRN
                       STRING(@s32),AT(215,334,80,10),USE(AP:Text[105]),TRN
                       STRING(@s32),AT(215,344,80,10),USE(AP:Text[106]),TRN
                       STRING(@s32),AT(215,354,80,10),USE(AP:Text[107]),TRN
                       STRING(@s32),AT(215,364,80,10),USE(AP:Text[108]),TRN
                       STRING(@s32),AT(310,15,80,10),USE(AP:Text[109]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(310,24,80,10),USE(AP:Text[110]),TRN
                       STRING(@s32),AT(310,34,80,10),USE(AP:Text[111]),TRN
                       STRING(@s32),AT(310,44,80,10),USE(AP:Text[112]),TRN
                       STRING(@s32),AT(310,54,80,10),USE(AP:Text[113]),TRN
                       STRING(@s32),AT(310,64,80,10),USE(AP:Text[114]),TRN
                       STRING(@s32),AT(310,74,80,10),USE(AP:Text[115]),TRN
                       STRING(@s32),AT(310,84,80,10),USE(AP:Text[116]),TRN
                       STRING(@s32),AT(310,94,80,10),USE(AP:Text[117]),TRN
                       STRING(@s32),AT(310,104,80,10),USE(AP:Text[118]),TRN
                       STRING(@s32),AT(310,114,80,10),USE(AP:Text[119]),TRN
                       STRING(@s32),AT(310,124,80,10),USE(AP:Text[120]),TRN
                       STRING(@s32),AT(310,134,80,10),USE(AP:Text[121]),TRN
                       STRING(@s32),AT(310,144,80,10),USE(AP:Text[122]),TRN
                       STRING(@s32),AT(310,154,80,10),USE(AP:Text[123]),TRN
                       STRING(@s32),AT(310,164,80,10),USE(AP:Text[124]),TRN
                       STRING(@s32),AT(310,174,80,10),USE(AP:Text[125]),TRN
                       STRING(@s32),AT(310,184,80,10),USE(AP:Text[126]),TRN
                       STRING(@s32),AT(310,194,80,10),USE(AP:Text[127]),TRN
                       STRING(@s32),AT(310,204,80,10),USE(AP:Text[128]),TRN
                       STRING(@s32),AT(310,214,80,10),USE(AP:Text[129]),TRN
                       STRING(@s32),AT(310,224,80,10),USE(AP:Text[130]),TRN
                       STRING(@s32),AT(310,234,80,10),USE(AP:Text[131]),TRN
                       STRING(@s32),AT(310,244,80,10),USE(AP:Text[132]),TRN
                       STRING(@s32),AT(310,254,80,10),USE(AP:Text[133]),TRN
                       STRING(@s32),AT(310,264,80,10),USE(AP:Text[134]),TRN
                       STRING(@s32),AT(310,274,80,10),USE(AP:Text[135]),TRN
                       STRING(@s32),AT(310,284,80,10),USE(AP:Text[136]),TRN
                       STRING(@s32),AT(310,294,80,10),USE(AP:Text[137]),TRN
                       STRING(@s32),AT(310,304,80,10),USE(AP:Text[138]),TRN
                       STRING(@s32),AT(310,314,80,10),USE(AP:Text[139]),TRN
                       STRING(@s32),AT(310,324,80,10),USE(AP:Text[140]),TRN
                       STRING(@s32),AT(310,334,80,10),USE(AP:Text[141]),TRN
                       STRING(@s32),AT(310,344,80,10),USE(AP:Text[142]),TRN
                       STRING(@s32),AT(310,354,80,10),USE(AP:Text[143]),TRN
                       STRING(@s32),AT(310,364,80,10),USE(AP:Text[144]),TRN
                       STRING(@s32),AT(405,15,80,10),USE(AP:Text[145]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(405,24,80,10),USE(AP:Text[146]),TRN
                       STRING(@s32),AT(405,34,80,10),USE(AP:Text[147]),TRN
                       STRING(@s32),AT(405,44,80,10),USE(AP:Text[148]),TRN
                       STRING(@s32),AT(405,54,80,10),USE(AP:Text[149]),TRN
                       STRING(@s32),AT(405,64,80,10),USE(AP:Text[150]),TRN
                       STRING(@s32),AT(405,74,80,10),USE(AP:Text[151]),TRN
                       STRING(@s32),AT(405,84,80,10),USE(AP:Text[152]),TRN
                       STRING(@s32),AT(405,94,80,10),USE(AP:Text[153]),TRN
                       STRING(@s32),AT(405,104,80,10),USE(AP:Text[154]),TRN
                       STRING(@s32),AT(405,114,80,10),USE(AP:Text[155]),TRN
                       STRING(@s32),AT(405,124,80,10),USE(AP:Text[156]),TRN
                       STRING(@s32),AT(405,134,80,10),USE(AP:Text[157]),TRN
                       STRING(@s32),AT(405,144,80,10),USE(AP:Text[158]),TRN
                       STRING(@s32),AT(405,154,80,10),USE(AP:Text[159]),TRN
                       STRING(@s32),AT(405,164,80,10),USE(AP:Text[160]),TRN
                       STRING(@s32),AT(405,174,80,10),USE(AP:Text[161]),TRN
                       STRING(@s32),AT(405,184,80,10),USE(AP:Text[162]),TRN
                       STRING(@s32),AT(405,194,80,10),USE(AP:Text[163]),TRN
                       STRING(@s32),AT(405,204,80,10),USE(AP:Text[164]),TRN
                       STRING(@s32),AT(405,214,80,10),USE(AP:Text[165]),TRN
                       STRING(@s32),AT(405,224,80,10),USE(AP:Text[166]),TRN
                       STRING(@s32),AT(405,234,80,10),USE(AP:Text[167]),TRN
                       STRING(@s32),AT(405,244,80,10),USE(AP:Text[168]),TRN
                       STRING(@s32),AT(405,254,80,10),USE(AP:Text[169]),TRN
                       STRING(@s32),AT(405,264,80,10),USE(AP:Text[170]),TRN
                       STRING(@s32),AT(405,274,80,10),USE(AP:Text[171]),TRN
                       STRING(@s32),AT(405,284,80,10),USE(AP:Text[172]),TRN
                       STRING(@s32),AT(405,294,80,10),USE(AP:Text[173]),TRN
                       STRING(@s32),AT(405,304,80,10),USE(AP:Text[174]),TRN
                       STRING(@s32),AT(405,314,80,10),USE(AP:Text[175]),TRN
                       STRING(@s32),AT(405,324,80,10),USE(AP:Text[176]),TRN
                       STRING(@s32),AT(405,334,80,10),USE(AP:Text[177]),TRN
                       STRING(@s32),AT(405,344,80,10),USE(AP:Text[178]),TRN
                       STRING(@s32),AT(405,354,80,10),USE(AP:Text[179]),TRN
                       STRING(@s32),AT(405,364,80,10),USE(AP:Text[180]),TRN
                       STRING(@s32),AT(500,15,80,10),USE(AP:Text[181]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(500,24,80,10),USE(AP:Text[182]),TRN
                       STRING(@s32),AT(500,34,80,10),USE(AP:Text[183]),TRN
                       STRING(@s32),AT(500,44,80,10),USE(AP:Text[184]),TRN
                       STRING(@s32),AT(500,54,80,10),USE(AP:Text[185]),TRN
                       STRING(@s32),AT(500,64,80,10),USE(AP:Text[186]),TRN
                       STRING(@s32),AT(500,74,80,10),USE(AP:Text[187]),TRN
                       STRING(@s32),AT(500,84,80,10),USE(AP:Text[188]),TRN
                       STRING(@s32),AT(500,94,80,10),USE(AP:Text[189]),TRN
                       STRING(@s32),AT(500,104,80,10),USE(AP:Text[190]),TRN
                       STRING(@s32),AT(500,114,80,10),USE(AP:Text[191]),TRN
                       STRING(@s32),AT(500,124,80,10),USE(AP:Text[192]),TRN
                       STRING(@s32),AT(500,134,80,10),USE(AP:Text[193]),TRN
                       STRING(@s32),AT(500,144,80,10),USE(AP:Text[194]),TRN
                       STRING(@s32),AT(500,154,80,10),USE(AP:Text[195]),TRN
                       STRING(@s32),AT(500,164,80,10),USE(AP:Text[196]),TRN
                       STRING(@s32),AT(500,174,80,10),USE(AP:Text[197]),TRN
                       STRING(@s32),AT(500,184,80,10),USE(AP:Text[198]),TRN
                       STRING(@s32),AT(500,194,80,10),USE(AP:Text[199]),TRN
                       STRING(@s32),AT(500,204,80,10),USE(AP:Text[200]),TRN
                       STRING(@s32),AT(500,214,80,10),USE(AP:Text[201]),TRN
                       STRING(@s32),AT(500,224,80,10),USE(AP:Text[202]),TRN
                       STRING(@s32),AT(500,234,80,10),USE(AP:Text[203]),TRN
                       STRING(@s32),AT(500,244,80,10),USE(AP:Text[204]),TRN
                       STRING(@s32),AT(500,254,80,10),USE(AP:Text[205]),TRN
                       STRING(@s32),AT(500,264,80,10),USE(AP:Text[206]),TRN
                       STRING(@s32),AT(500,274,80,10),USE(AP:Text[207]),TRN
                       STRING(@s32),AT(500,284,80,10),USE(AP:Text[208]),TRN
                       STRING(@s32),AT(500,294,80,10),USE(AP:Text[209]),TRN
                       STRING(@s32),AT(500,304,80,10),USE(AP:Text[210]),TRN
                       STRING(@s32),AT(500,314,80,10),USE(AP:Text[211]),TRN
                       STRING(@s32),AT(500,324,80,10),USE(AP:Text[212]),TRN
                       STRING(@s32),AT(500,334,80,10),USE(AP:Text[213]),TRN
                       STRING(@s32),AT(500,344,80,10),USE(AP:Text[214]),TRN
                       STRING(@s32),AT(500,354,80,10),USE(AP:Text[215]),TRN
                       STRING(@s32),AT(500,364,80,10),USE(AP:Text[216]),TRN
                       STRING(@s32),AT(595,15,80,10),USE(AP:Text[217]),FONT(,,,FONT:bold),TRN
                       STRING(@s32),AT(595,24,80,10),USE(AP:Text[218]),TRN
                       STRING(@s32),AT(595,34,80,10),USE(AP:Text[219]),TRN
                       STRING(@s32),AT(595,44,80,10),USE(AP:Text[220]),TRN
                       STRING(@s32),AT(595,54,80,10),USE(AP:Text[221]),TRN
                       STRING(@s32),AT(595,64,80,10),USE(AP:Text[222]),TRN
                       STRING(@s32),AT(595,74,80,10),USE(AP:Text[223]),TRN
                       STRING(@s32),AT(595,84,80,10),USE(AP:Text[224]),TRN
                       STRING(@s32),AT(595,94,80,10),USE(AP:Text[225]),TRN
                       STRING(@s32),AT(595,104,80,10),USE(AP:Text[226]),TRN
                       STRING(@s32),AT(595,114,80,10),USE(AP:Text[227]),TRN
                       STRING(@s32),AT(595,124,80,10),USE(AP:Text[228]),TRN
                       STRING(@s32),AT(595,134,80,10),USE(AP:Text[229]),TRN
                       STRING(@s32),AT(595,144,80,10),USE(AP:Text[230]),TRN
                       STRING(@s32),AT(595,154,80,10),USE(AP:Text[231]),TRN
                       STRING(@s32),AT(595,164,80,10),USE(AP:Text[232]),TRN
                       STRING(@s32),AT(595,174,80,10),USE(AP:Text[233]),TRN
                       STRING(@s32),AT(595,184,80,10),USE(AP:Text[234]),TRN
                       STRING(@s32),AT(595,194,80,10),USE(AP:Text[235]),TRN
                       STRING(@s32),AT(595,204,80,10),USE(AP:Text[236]),TRN
                       STRING(@s32),AT(595,214,80,10),USE(AP:Text[237]),TRN
                       STRING(@s32),AT(595,224,80,10),USE(AP:Text[238]),TRN
                       STRING(@s32),AT(595,234,80,10),USE(AP:Text[239]),TRN
                       STRING(@s32),AT(595,244,80,10),USE(AP:Text[240]),TRN
                       STRING(@s32),AT(595,254,80,10),USE(AP:Text[241]),TRN
                       STRING(@s32),AT(595,264,80,10),USE(AP:Text[242]),TRN
                       STRING(@s32),AT(595,274,80,10),USE(AP:Text[243]),TRN
                       STRING(@s32),AT(595,284,80,10),USE(AP:Text[244]),TRN
                       STRING(@s32),AT(595,294,80,10),USE(AP:Text[245]),TRN
                       STRING(@s32),AT(595,304,80,10),USE(AP:Text[246]),TRN
                       STRING(@s32),AT(595,314,80,10),USE(AP:Text[247]),TRN
                       STRING(@s32),AT(595,324,80,10),USE(AP:Text[248]),TRN
                       STRING(@s32),AT(595,334,80,10),USE(AP:Text[249]),TRN
                       STRING(@s32),AT(595,344,80,10),USE(AP:Text[250]),TRN
                       STRING(@s32),AT(595,354,80,10),USE(AP:Text[251]),TRN
                       STRING(@s32),AT(595,364,80,10),USE(AP:Text[252]),TRN
                       IMAGE('yellow.bmp'),AT(192,378,40,6),USE(?IgG4:On),HIDE
                       BUTTON('Review'),AT(324,380,80,25),USE(?Review),FONT(,,,FONT:bold),LEFT,ICON('SteelCheckOn.ico'), |
  TRN
                       BUTTON('Add to Panel'),AT(412,380,80,25),USE(?Add2PanelButton),FONT(,,,FONT:bold),HIDE
                       BUTTON('Pollens'),AT(16,0,79,13),USE(?Page1),FONT(,10,,FONT:bold),DISABLE
                       BUTTON('Non-Pollens'),AT(96,0,79,13),USE(?Page2),FONT(,10,,FONT:bold)
                       BUTTON('Food'),AT(176,0,79,13),USE(?Page3),FONT(,10,,FONT:bold)
                       BUTTON('Chemicals'),AT(256,0,79,13),USE(?Page4),FONT(,10,,FONT:bold)
                       CHECK('IgE'),AT(140,384,40,22),USE(locIgE),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('1', |
  '0')
                       CHECK('IgG'),AT(244,384,40,22),USE(locIgG),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('2', |
  '0')
                       IMAGE('button.jpg'),AT(140,384,40,22),USE(?Image11)
                       IMAGE('button.jpg'),AT(192,384,40,22),USE(?Image10)
                       IMAGE('button.jpg'),AT(244,384,40,22),USE(?Image9)
                       IMAGE('button.jpg'),AT(324,380,80,25),USE(?Image8)
                       IMAGE('button.jpg'),AT(504,380,100,25),USE(?Image7)
                       IMAGE('red.bmp'),AT(140,378,40,6),USE(?IgE:On),HIDE
                       IMAGE('blue.bmp'),AT(244,378,40,6),USE(?IgG:On),HIDE
                       CHECK('IgG4'),AT(192,384,40,22),USE(locIgG4),FONT(,,,FONT:bold),ICON(ICON:None),TRN,VALUE('4', |
  '0')
                       BUTTON('      Done'),AT(504,380,100,25),USE(?Done),FONT(,,,FONT:bold),LEFT,ICON('SteelCheck.ico'), |
  TRN
                       BUTTON('OK'),AT(0,0,35,14),USE(?OkButton),DEFAULT,HIDE
                       BUTTON('Cancel'),AT(0,0,36,14),USE(?CancelButton),HIDE
                       BOX,AT(0,16,16,98),USE(?Box1, 1001),COLOR(COLOR:Red),FILL(COLOR:Red),HIDE,LINEWIDTH(1)
                       BOX,AT(0,212,16,101),USE(?Box2, 1002),COLOR(COLOR:Blue),FILL(COLOR:Blue),HIDE,LINEWIDTH(1)
                       BOX,AT(0,112,16,101),USE(?Box3, 1004),COLOR(COLOR:Yellow),FILL(COLOR:Yellow),HIDE,LINEWIDTH(1)
                       STRING('E'),AT(0,56,16,18),USE(?String211, 2001),FONT(,14,COLOR:White,FONT:bold),CENTER,COLOR(COLOR:Red), |
  HIDE
                       STRING('G'),AT(0,256,16,17),USE(?String212, 2002),FONT(,14,COLOR:White,FONT:bold),CENTER,COLOR(COLOR:Blue), |
  HIDE
                       STRING('G4'),AT(0,160,16,17),USE(?String213, 2004),FONT(,14,COLOR:Black,FONT:bold),CENTER, |
  COLOR(COLOR:Yellow),HIDE
                       IMAGE('red.bmp'),AT(337,0,107,13),USE(?IgE:LED),HIDE
                       IMAGE('blue.bmp'),AT(553,0,107,13),USE(?IgG:LED),HIDE
                       IMAGE('yellow.bmp'),AT(445,0,107,13),USE(?IgG4:LED),HIDE
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
PopupMgr1            PopupClass
PopupMgr2            PopupClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
ShowSelected  ROUTINE
  HIDE(1001,2004)
  UNHIDE(1000+locIgE)
  UNHIDE(2000+locIgE)
  UNHIDE(1000+locIgG)
  UNHIDE(2000+locIgG)
  UNHIDE(1000+locIgG4)
  UNHIDE(2000+locIgG4)
  IF locIgE
    UNHIDE(?IgE:On)
  ELSE
    HIDE(?IgE:On)
  .
  IF locIgG
    UNHIDE(?IgG:On)
  ELSE
    HIDE(?IgG:On)
  .
  IF locIgG4
    UNHIDE(?IgG4:On)
  ELSE
    HIDE(?IgG4:On)
  .
 HIDE(?IgE:LED,?IgG4:LED)
 ENABLE(?Page1,?Page3)
 EXECUTE CurrentPage
 DISABLE(?Page1)
 DISABLE(?Page2)
 DISABLE(?Page3)
 .
 DISPLAY()

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('LoginAlpha')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?AP:Checked_1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Cli_panl.Open                                     ! File Cli_panl used by this procedure, so make sure it's RelationManager is open
  Relate:Client.SetOpenRelated()
  Relate:Client.Open                                       ! File Client used by this procedure, so make sure it's RelationManager is open
  Relate:Login.Open                                        ! File Login used by this procedure, so make sure it's RelationManager is open
  Access:Patient.UseFile                                   ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  SELF.Open(Window)                                        ! Open window
  Do DefineListboxStyle
  PopupMgr1.Init(INIMgr)
  PopupMgr1.AddItem('   0     0      0','0')
  PopupMgr1.AddItem('   0     0     X','1')
  PopupMgr1.AddItem('   0    X    0','2')
  PopupMgr2.Init(INIMgr)
  PopupMgr2.AddItem('===     ===       ====','0')
  PopupMgr2.AddItem('===     ===       IgG4','1')
  PopupMgr2.AddItem('===      IgG       ====','2')
  PopupMgr2.AddItem('===     IgG        IgG4','3')
  PopupMgr2.AddItem('IgE      ===      ====','4')
  PopupMgr2.AddItem('IgE      ===       IgG4','5')
  PopupMgr2.AddItem('IgE       IgG       ====','6')
  PopupMgr2.AddItem('IgE       IgG        IgG4','7')
  SELF.SetAlerts()
  0{PROP:Wallpaper} = gloWallpaper
  CurrentPage = 1
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
    Relate:Cli_panl.Close
    Relate:Client.Close
    Relate:Login.Close
  END
  PopupMgr1.Kill
  PopupMgr2.Kill
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
    IF EVENT() = EVENT:Accepted AND INRANGE(FIELD(),1,252)
  
      UPDATE(?)
      IF AP:Checked[FIELD()] = '1' AND (locIgE + locIgG + locIgG4)
        AP:IgE[FIELD()]  = locIgE
        AP:IgG[FIELD()]  = locIgG
        AP:IgG4[FIELD()] = locIgG4
        IF locIgE
          UNHIDE(?IgE:LED)
        ELSE
          HIDE(?IgE:LED)
        .
        IF locIgG
          UNHIDE(?IgG:LED)
        ELSE
          HIDE(?IgG:LED)
        .
        IF locIgG4
          UNHIDE(?IgG4:LED)
        ELSE
          HIDE(?IgG4:LED)
        .
      ELSE
        AP:IgE[FIELD()]  = FALSE
        AP:IgG[FIELD()]  = FALSE
        AP:IgG4[FIELD()] = FALSE
        AP:Checked[FIELD()] = '0'
        HIDE(?IgE:LED,?IgG4:LED)
      .
  
      DISPLAY(?)
      ReturnValue = 0
      RETURN ReturnValue
    .
    CASE ACCEPTED()
    OF ?Review
      LoginReview
      CurrentPage = SAV:Page
      TransferPage = IndexedPage[CurrentPage]
      IF CurrentPage > 1
        IndexedPage[CurrentPage] = TransferPage
        CurrentPage = 1  ! Pollens
        TransferPage = IndexedPage[CurrentPage]
      .
      POST(EVENT:CloseWindow)
      
      
      !ActivePage           GROUP,PRE(AP),DIM(210)            ! The Active Page of Allergen Descriptions and Checked Boxes
      !Checked                STRING(1)
      !IgE                    BYTE
      !IgG                    BYTE
      !IgG4                   BYTE
      !Text                   STRING(25)
      !                     .
      !TransferPage     BYTE,DIM(SIZE(ActivePage)),OVER(ActivePage) ! Used to Move Data between Active and IndexedPage Storage
      !IndexedPage      BYTE,DIM(3,SIZE(TransferPage))              ! Hold All 3 pages of Text and Check Marked Boxes
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Add2PanelButton
      ThisWindow.Update
      POST(EVENT:CloseWindow)
    OF ?Page1
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 1  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page2
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 2  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page3
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 3  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?Page4
      ThisWindow.Update
      IndexedPage[CurrentPage] = TransferPage
      CurrentPage = 4  ! Pollens
      TransferPage = IndexedPage[CurrentPage]
      DO ShowSelected
    OF ?locIgE
      DO ShowSelected
    OF ?locIgG
      DO ShowSelected
    OF ?locIgG4
      DO ShowSelected
    OF ?Done
      ThisWindow.Update
      IF CurrentPage > 1
        IndexedPage[CurrentPage] = TransferPage
        CurrentPage = 1  ! Pollens
        TransferPage = IndexedPage[CurrentPage]
      .
      POST(EVENT:CloseWindow)
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  IF KEYCODE() = MouseRight
    IF EVENT() <> 16
      ReturnValue = Level:Benign  
      RETURN ReturnValue
    .
    IF AP:IgE[FIELD()]
      UNHIDE(?IgE:LED)
    ELSE
      HIDE(?IgE:LED)
    .
    
    IF AP:IgG[FIELD()]
      UNHIDE(?IgG:LED)
    ELSE
      HIDE(?IgG:LED)
    .
    
    IF AP:IgG4[FIELD()]
      UNHIDE(?IgG4:LED)
    ELSE
      HIDE(?IgG4:LED)
    .
    SETKEYCODE(0)
    OMIT('XXXX')
    locEG4 = AP:IgE[FIELD()] + AP:IgG[FIELD()] + AP:IgG4[FIELD()]
    CASE locEG4
    OF 0
      PopupMgr2.SetItemEnable('0',FALSE)
    OF 1
      PopupMgr2.SetItemEnable('1',FALSE)
    OF 2
      PopupMgr2.SetItemEnable('2',FALSE)
    OF 3
      PopupMgr2.SetItemEnable('3',FALSE)
    OF 4
      PopupMgr2.SetItemEnable('4',FALSE)
    OF 5
      PopupMgr2.SetItemEnable('5',FALSE)
    OF 6
      PopupMgr2.SetItemEnable('6',FALSE)
    OF 7
      PopupMgr2.SetItemEnable('7',FALSE)
    .
  
  EGG4=PopupMgr2.Ask()
    AP:Checked[FIELD()] = '1'
    CASE EGG4
    OF '0'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 0
      AP:Checked[FIELD()] = '0'
    OF '1'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 1
    OF '2'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 0
    OF '3'
      AP:IgE[FIELD()]  = 0
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 1
    OF '4'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 0
    OF '5'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 0
      AP:IgG4[FIELD()] = 1
    OF '6'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 0
    OF '7'
      AP:IgE[FIELD()]  = 4
      AP:IgG[FIELD()]  = 2
      AP:IgG4[FIELD()] = 1
    .
    DISPLAY(FIELD())
  
  
  
    CASE locEG4
    OF 0
      PopupMgr2.SetItemEnable('0',TRUE)
    OF 1
      PopupMgr2.SetItemEnable('1',TRUE)
    OF 2
      PopupMgr2.SetItemEnable('2',TRUE)
    OF 3
      PopupMgr2.SetItemEnable('3',TRUE)
    OF 4
      PopupMgr2.SetItemEnable('4',TRUE)
    OF 5
      PopupMgr2.SetItemEnable('5',TRUE)
    OF 6
      PopupMgr2.SetItemEnable('6',TRUE)
    OF 7
      PopupMgr2.SetItemEnable('7',TRUE)
    .
     XXXX
  .
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
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
      IF prmAction = 1
        CurrentPage = 1
        TransferPage = IndexedPage[CurrentPage]
        UNHIDE(?Add2PanelButton)
        HIDE(?DONE)
        HIDE(?REVIEW)
        IF ~AP:Text[2]
          CLEAR(ActivePage)
          LOOP CurrentPage = 1 TO 3
            gloTabFileName = '..\Login\PAGE' & CurrentPage & '.TXT'
            OPEN(TabData)
            IF ERRORCODE() THEN STOP(CurrentPage & ' PAGE: ' & ERROR()).
            I# = 1
            SET(TabData)
            LOOP UNTIL EOF(TabData)
              NEXT(TabData)
              IF I# > 252 OR ERRORCODE() THEN BREAK.
              AP:Text[I#] = ' ' &  CLIP(SUB(TD:Data,1,4)) & ' ' &  SUB(TD:Data,11,20)
              I# += 1
            .
            CLOSE(TabData)
            IndexedPage[CurrentPage] = TransferPage
        . .
        CLOSE(TabData)
        CurrentPage = 1
        TransferPage = IndexedPage[CurrentPage]
      .
      DO ShowSelected
      IF mdlEntryPoint THEN POST(EVENT:Accepted,?Review).
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

