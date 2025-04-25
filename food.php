<?php  ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
echo <<< EOT
<!DOCTYPE html>
<html lang="en">
<head>
<title>Nutrition Foods</title>
<style type="text/css">
body{-ms-text-size-adjust:100%;text-align:left;background:#111;font:700 .9em Arial,sans-serif;color:#ffe;width:100%;padding:1% 0 0 4%;margin:0;}
a,a:link,a:visited,a:hover{text-decoration:none;color:#ffe;}
.cntr{text-align:center;}
.chk {overflow:visible;cursor:pointer;border:0;background:#2985EA;color: #ffe;font: 700 1.8em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align: center;-ms-text-size-adjust:100%;}
.btn {overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding:4px;text-align:center;-ms-text-size-adjust:180%;}
.num {display:inline-block;width:6em;text-align:center;overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #0f0;color: #000;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #ffe;outline:2px solid #ffe;color:#aaa;margin:1px;vertical-align: middle;position: relative;}
input[type="text"]{font:700 .8em Arial,sans-serif;}
.num{width:4em;}
.txt{width:16em;}
.nopad{padding:0;}
.reg{font:400 .8em Arial,sans-serif;}
.hit{color:#ff0;}
.miss{color:#f00;}
.selected{background:#f00;}
#sort{display:none;width:100%;height:40px;}
#setSort{margin-top:6px;padding:8px;position:absolute;left:100px;display:block;border-radius: 3px 3px 3px 3px;}
</style>
</head><body>
EOT;
ob_flush();
$labels = array("","","g",
"Kcal",
"g",
"g",
"g",
"g",
"g",
"g",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"μg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"μg",
"μg",
"μg",
"mg",
"μg",
"IU",
"mg",
"μg",
"μg",
"μg",
"μg",
"μg",
"μg",
"μg",
"mg",
"μg",
"IU",
"μg",
"g",
"g",
"g",
"mg");
$name = array('','Blank', 'Water',
  'Calories' ,
  'Protein' ,
  'Fats' ,
  'Ash',
  'Carbohydrates' ,
  'Fiber' ,
  'Sugar',
  'Calcium' ,
  'Iron' ,
  'Magnesium' ,
  'Phosphorus' ,
  'Potassium' ,
  'Sodium' ,
  'Zinc' ,
  'Copper' ,
  'Manganese',
  'Selenium' ,
  'VitiminC' ,
  'Thiamin' ,
  'Riboflavin' ,
  'Niacin' ,
  'Pantothenic' ,
  'VitaminB6',
  'Folate',
  'FolicAcid',
  'FoodFolate',
  'Folate_DFE',
  'Choline',
  'VitaminB12',
  'VitaminA' ,
  'VitaminA_RAE' ,
  'Retinol' ,
  'Alphacarotene' ,
  'BetaCarotene' ,
  'BetaCryptoxanthin' ,
  'Lycopene' ,
  'LuteinZeaxanthin',
  'VitaminE' ,
  'VitaminD_ug',
  'VitaminD_IU',
  'VitaminK' ,
  'SaturatedFat' ,
  'MonoFat' ,
  'Polyunsaturated',
  'Cholesterol' ,
  'Weight',
  'WeightDescription' ,
  'Weight2' ,
  'Weight2Desc',
  'Waste',
  'Blank');

$order = array("1 ORDER BY `Description` ASC ",
" `Sodium` > .001 ORDER BY `Sodium` ASC ",
" `Fiber` > .001 ORDER BY `Fiber` DESC ",
" `Calcium` > .001 ORDER BY `Calcium` DESC ",
" `Iron` > .001 ORDER BY `Iron` DESC ",
" `VitiminC` > .001 ORDER BY `VitiminC` DESC ",
" `VitaminB6` > .001 ORDER BY `VitaminB6` DESC ",
" `VitaminB12` > .001 ORDER BY `VitaminB12` DESC ",
" `VitaminA` > .001 ORDER BY `VitaminA` DESC ",
" `VitaminE` > .001 ORDER BY `VitaminE` DESC ",
" `VitaminD_ug` > .001 ORDER BY `VitaminD_ug` DESC ",
" `FolicAcid` > .001 ORDER BY `FolicAcid` DESC ",
" `Potassium` > .001 ORDER BY `Potassium` DESC ",
" `BetaCarotene` > .001 ORDER BY `BetaCarotene` DESC ",
" `MonoFat` > .001 ORDER BY `MonoFat` DESC ",
" `Cholesterol` > .001 ORDER BY `Cholesterol` ASC ",
" `Zinc` > .001 ORDER BY `Zinc` DESC ",
" `Magnesium` > .001 ORDER BY `Magnesium` DESC ");

date_default_timezone_set ('America/New_York');
$dbc=mysql_connect('localhost','ps',"Yes12yeS");
mysql_select_db('ps_mobile');
$sql = "SET time_zone = '-4:00';";
@mysql_unbuffered_query($sql);
if (isset($_POST['sort']) && strlen($_POST['sort']) > 0){
  $sort = intval($_POST['sort']);
  $transort = array(53,15,8,10,11,20,25,31,32,40,41,27,14,36,45,47,12);
  $srt = $name[$transort[$sort]];
}
else {
 $sort = 0;
 $srt = 'Blank';
}
 $class[$sort] = ' class="selected" ';
$checked = array();
$checked[$sort] = 'checked';

if (isset($_POST['n']) && strlen($_POST['n']) > 0){
  $n = intval($_POST['n']);
}
else {
 $n = '0';
}
if (isset($_POST['r']) && strlen($_POST['r']) > 1){
  $rows = intval($_POST['r']);
}
else {
 $rows = '40' ;
}
if (isset($_POST['s']) && strlen($_POST['s']) > 1){
  $s = strtoupper($_POST['s']);
$sortorder = array("`Description` LIKE '%$s%'  ORDER BY `Description` ASC ",
" `Description` LIKE '%$s%' AND `Sodium` > .001   ORDER BY `Sodium` ASC  ",
" `Description` LIKE '%$s%' AND `Fiber` > .001 ORDER BY `Fiber` DESC ",
" `Description` LIKE '%$s%' AND `Calcium` > .001 ORDER BY `Calcium` DESC ",
" `Description` LIKE '%$s%' AND `Iron` > .001 ORDER BY `Iron` DESC ",
" `Description` LIKE '%$s%' AND `VitiminC` > .001 ORDER BY `VitiminC` DESC ",
" `Description` LIKE '%$s%' AND `VitaminB6` > .001 ORDER BY `VitaminB6` DESC ",
" `Description` LIKE '%$s%' AND `VitaminB12` > .001 ORDER BY `VitaminB12` DESC ",
" `Description` LIKE '%$s%' AND `VitaminA` > .001 ORDER BY `VitaminA` DESC ",
" `Description` LIKE '%$s%' AND `VitaminE` > .001 ORDER BY `VitaminE` DESC ",
" `Description` LIKE '%$s%' AND `VitaminD_ug` > .001 ORDER BY `VitaminD_ug` DESC ",
" `Description` LIKE '%$s%' AND `FolicAcid` > .001 ORDER BY `FolicAcid` DESC ",
" `Description` LIKE '%$s%' AND `Potassium` > .001 ORDER BY `Potassium` DESC ",
" `Description` LIKE '%$s%' AND `BetaCarotene` > .001 ORDER BY `BetaCarotene` DESC ",
" `Description` LIKE '%$s%' AND `MonoFat` > .001 ORDER BY `MonoFat` DESC ",
" `Description` LIKE '%$s%' AND `Cholesterol` > .001 ORDER BY `Cholesterol` ASC ",
" `Description` LIKE '%$s%' AND `Zinc` > .001 ORDER BY `Zinc` DESC ",
" `Description` LIKE '%$s%' AND `Magnesium` > .001 ORDER BY `Magnesium` DESC ");


  $sql = "SELECT SQL_CALC_FOUND_ROWS `ID`, `Description`, `$srt`   FROM `NDB` WHERE  $sortorder[$sort] LIMIT $n, $rows";  
  $line = $n;
  

}
else {
  $line = $n;
  $sql = "SELECT SQL_CALC_FOUND_ROWS `ID`, `Description`, `$srt` FROM `NDB` WHERE  $order[$sort] LIMIT $n, $rows";
}
$er = "<h4>$sql</h4>";
$results = @mysql_query($sql);
if (strlen(mysql_error()) > 0){
  echo mysql_error() . "<br> $sql<br>";
}
$sql = "SELECT FOUND_ROWS()";
$count = @mysql_query($sql);
$count = mysql_result($count,0);
$next = $n + $rows;
$last = $count - $rows;

if ($n > 0){
  $prev = $n - $rows;
  if ($prev < 0){$prev = 0;}
  echo <<< EOF
<form action="http://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="r" value="$rows" />
<input type="hidden" name="sort" value="$sort" />

<input class="btn" type="submit" value="&emsp;&emsp;Top&emsp;&emsp;" /><br>
</form>
<br>
<form action="http://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="n" value="$prev" />
<input type="hidden" name="r" value="$rows" />
<input class="btn" type="submit" value="&emsp;Page Up&emsp;" />
EOF;

}

echo <<<EOF
<form action="http://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="r" value="$rows" />
<input type="hidden" name="s" value="$s" />
<table><tr>
<td><div id="0" $class[0]><input id="r0" type="radio" name="sort" value="0"  onclick="sel(0)" $checked[0]/>&ensp;Description&emsp;1</div></td>
<td><div id="1" $class[1]><input id="r1" type="radio" name="sort" value="1"  onclick="sel(1)" $checked[1]/>&ensp;Low Sodium&emsp;15</div></td>
<td><div id="2" $class[2]><input id="r2" type="radio" name="sort" value="2"  onclick="sel(2)" $checked[2]/>&ensp;Fiber&emsp;8</div></td>
<td><div id="3" $class[3]><input id="r3" type="radio" name="sort" value="3"  onclick="sel(3)" $checked[3]/>&ensp;Calcium&emsp;10</div></td>
<td><div id="4" $class[4]><input id="r4" type="radio" name="sort" value="4"  onclick="sel(4)" $checked[4]/>&ensp;Iron&emsp;11</div></td>
<td><div id="5" $class[5]><input id="r5" type="radio" name="sort" value="5"  onclick="sel(5)" $checked[5]/>&ensp;Vitimin&nbsp;C&emsp;20</div></td></tr><tr>
<td><div id="6" $class[6]><input id="r6" type="radio" name="sort" value="6"  onclick="sel(6)" $checked[6]/>&ensp;Vitamin&nbsp;B6&emsp;25</div></td>
<td><div id="7" $class[7]><input id="r7" type="radio" name="sort" value="7"  onclick="sel(7)" $checked[7]/>&ensp;Vitamin&nbsp;B12&emsp;31</div></td>
<td><div id="8" $class[8]><input id="r8" type="radio" name="sort" value="8"  onclick="sel(8)" $checked[8]/>&ensp;Vitamin&nbsp;A&emsp;32</div></td>
<td><div id="9" $class[9]><input id="r9" type="radio" name="sort" value="9"  onclick="sel(9)" $checked[9]/>&ensp;Vitamin&nbsp;E&emsp;40</div></td>
<td><div id="10" $class[10]><input id="r10" type="radio" name="sort" value="10" onclick="sel(10)" $checked[10]/>&ensp;Vitamin&nbsp;D&emsp;41</div></td>
<td><div id="16" $class[16]><input id="r16" type="radio" name="sort" value="16" onclick="sel(16)" $checked[16]/>&ensp;Zinc&emsp;16</div></td></tr><tr>
<td><div id="11" $class[11]><input id="r11" type="radio" name="sort" value="11" onclick="sel(11)" $checked[11]/>&ensp;Folic Acid&emsp;27</div></td>
<td><div id="12" $class[12]><input id="r12" type="radio" name="sort" value="12" onclick="sel(12)" $checked[12]/>&ensp;Potassium&emsp;14</div></td>
<td><div id="13" $class[13]><input id="r13" type="radio" name="sort" value="13" onclick="sel(13)" $checked[13]/>&ensp;Beta Carotene&emsp;36</div></td>
<td><div id="14" $class[14]><input id="r14" type="radio" name="sort" value="14" onclick="sel(14)" $checked[14]/>&ensp;Monounsaturated Fat&emsp;45</div></td>
<td><div id="15" $class[15]><input id="r15" type="radio" name="sort" value="15" onclick="sel(15)" $checked[15]/>&ensp;Low Cholesterol&emsp;47</div></td>
<td><div id="17" $class[17]><input id="r17" type="radio" name="sort" value="17" onclick="sel(17)" $checked[17]/>&ensp;Magnesium&emsp;12</div></td></tr>
</table>
<div id="sort">
<input id="setSort" class="btn" type="submit" value="&emsp;&emsp;Set Sort Order&emsp;&emsp;" />
</div>
</form>
<br>
<form action="http://dev.amxemr.com/food.php" method="post">
<input class="txt" type="text" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="r" value="$rows" />
<input class="btn" type="submit" value="&emsp;Search&emsp;" />
</form>$er<br>$srt<table>
EOF;

while ($row = mysql_fetch_array($results, MYSQL_NUM)) {
++$line ;
echo <<<EOR
<tr><td><form action="http://dev.amxemr.com/detail.php" method="post">
<input type="hidden" name="r" value="$rows" />
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="n" value="$n" />
<input type="hidden" name="id" value="$row[0]" />
<input class="btn nopad" type="submit" value="more" />

</form></td><td class="btn nopad" >$line</td><td>$row[1]&emsp;</td><td>&emsp;$row[2] $labels[$sort] $srt</td></tr>
EOR;

}
echo <<<EOF
</table><br>
<form action="http://dev.amxemr.com/food.php" method="post">
<input class="num" type="text" name="r" value="$rows" />
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="n" value="$n" />
<input class="btn" type="submit" value="&emsp;Change Number of Rows&emsp;" />
</form><br>
EOF;
if ($count > ($next)){
echo <<<EOF

<form action="http://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="n" value="$next" />
<input type="hidden" name="r" value="$rows" />
<input class="btn" type="submit" value="&emsp;Page Down&emsp;" /><p>
</form><br>
<form action="http://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="s" value="$s" />
<input type="hidden" name="sort" value="$sort" />
<input type="hidden" name="n" value="$last" />
<input type="hidden" name="r" value="$rows" />
<input class="btn" type="submit" value="&emsp;Last Page&emsp;" /><p>
</form><br>
EOF;
}
else {
  echo "Count=$count";
}

echo <<<EOF
<script type="text/javascript">
var radio = [];
var sort = $sort;
var selected = sort;
var sortBtn;
function sel(n){alert($sort + ' - ' + selected + ' - ' + n);radio[selected].style.backgroundColor="#111";radio[n].style.backgroundColor="#2985EA";radio[$sort].style.backgroundColor="#f00"; var x = radio[n].getBoundingClientRect().left;sortBtn.style.left = x + 'px';sortDiv.style.display = "block";selected=n;if (n == $sort){sortDiv.style.display = "none";};}
function init(){sortBtn = document.getElementById("setSort");sortDiv = document.getElementById("sort");for (var id=0; id<18; id++){radio[id] = document.getElementById(id.toString());}}
window.onload=init;
</script></body></html>
EOF;
ob_end_flush();
?>