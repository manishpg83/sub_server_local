<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet Configuration</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin-left:2%;background:#fff;color:#000;padding-bottom:10em; }
#content{width:100%;padding:0;margin:0;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;vertical-align: middle;position: relative;background:#333;color:#eee;}
input[type="number"]{width:2em;}
.check{background:#f00;display:inline;padding:4px 0;}
.nocheck{background:#2985EA;display:inline;padding:4px 0;}
legend{font:700 1em Arial,sans-serif;}
.c1{background:#222;border: 10px solid #0ff;color:#0ff;padding:1em;float:left;}
.c2{min-height:3450px;background:#222;border: 10px solid #f0f;color:#f0f;padding:1em;float:left;}
td{padding:2px 0 0 6px;border:0;margin:0;}
.hide{display:none;}
.item{color:#0ff;}
h1{text-align:center;}
h2,h3{margin-bottom:0;}
pre{padding:0;margin:0;}
.col{-webkit-column-count:4;
-moz-column-count:4;
column-count:4;
width:100%;
max-height:400px;}
.check{background:#f00;}
.nocheck{background:#2985EA;}
.divCheck,.divNoCheck{color:#fff;display:inline;padding:4px 0;width:16em;}
.divNoCheck{background:#2985EA;}
.divCheck{background:#f00;}

p{margin:0 0 1px 0;padding:0;font:400 1em/1 Arial,sans-serif;}
.hd{display:inline;font-size:1em;font-weight:700;margin:0 0 10px; 0;!important;color:#fff;background:#000;}
.s0,.s1,.s2,.s3,.s4,.s5,.tested{font-weight:700;padding:2px;}
.sz1{background:#ff8;color:#000;font-weight:700;padding:2px;}
.sz2{background:#fd0;color:#000;font-weight:700;padding:2px;}
.sz3{background:#fb5;color:#000;font-weight:700;padding:2px;}
.sz4{background:#e60;color:#fff;font-weight:700;padding:2px;}
.sz5{background:#f20;color:#fff;font-weight:700;padding:2px;}
.day{font-size:1.2em;}
.noPrint{float:left;background:#ffb;}
button{width:4em;}
@media print
{
.pageBreak {page-break-after:always;}
.noPrint{display:none;}
}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.strike{text-decoration:line-through;}
.break{clear:both;}
fieldset{width:22em;}
.desc{width:8em;display:inline-block;font-weight:700;}
.score{width:2em;display:inline-block;text-align:center;font-weight:700;}
</style><body>
<div id="header" onclick="hideHeader()" ><img src="amxlogo.jpg" alt="logo" /></div>
<div id="content">
EOT;

$cc=array(0,0,0,0,1,0,0);
$co=array('0/1','1','2');
$cutoff = '0/1';
$check = array('nocheck','check');
$div = array('divNoCheck','divCheck'); 
$checkd = array('','checked');
$ndx= 0;
if (isset($_GET['sub'])){
  foreach ($_GET as $k => $v){
    if (substr($k,0,1)=='c'){
	  if ($v < 4){
		$cc[$v] = 1;
	  }
	  else{
	    $cc[$v] = 1;
		$CO = ($v - 4);
	  }
	}
	elseif ($k == 'desc'){
	
	}
  }
  $cutoff = $co[$CO];
}
else{
  $cc[1] = 1;
}
while (true){
  $ndx++;
  $classChk[$ndx] = $check[$cc[$ndx]];
  $divClass[$ndx] = $div[$cc[$ndx]];
  $checked[$ndx] = $checkd[$cc[$ndx]];
  if ($ndx > 6) {break;}
}
$pat = intval($_GET['p']);
if (strlen($pat) != 6){$pat = 156624;}else{$patient="<br>Patient: $pat";}

echo <<<EOT
<div id="hd" class="noPrint">
<form method="GET" action="dietReportx.php"><input type="hidden" name="sub" value="sub" />&ensp;<br>&ensp;
<input class="desc" type="text" name="p" value="$pat" /><button class="login"> Next </button>&emsp;&emsp;
<fieldset><legend>Exclude</legend>
<div id="divChk1"  class="$divClass[1]" ><input id="chk1"  class="$classChk[1]" type=checkbox name="c1" value="1" $checked[1] onclick="check(1)" />&nbsp;&nbsp;IgE&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div id="divChk2"  class="$divClass[2]" ><input id="chk2"  class="$classChk[2]" type=checkbox name="c2" value="2" $checked[2] onclick="check(2)" />&nbsp;&nbsp;IgG4&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div id="divChk3"  class="$divClass[3]" ><input id="chk3"  class="$classChk[3]" type=checkbox name="c3" value="3" $checked[3] onclick="check(3)" />&nbsp;&nbsp;IgG&nbsp;&nbsp;</div><br>
</fieldset><fieldset>
<legend>Positive Cut Off Score</legend>
<div id="divChk4"  class="$divClass[4]" ><input id="radio1"  class="$classChk[4]" type=radio name="cutOff" value="4" $checked[4] onclick="radio(4)" />&nbsp;&nbsp;0/1&emsp;</div>
<div id="divChk5"  class="$divClass[5]" ><input id="radio2"  class="$classChk[5]" type=radio name="cutOff" value="5" $checked[5] onclick="radio(5)" />&nbsp;&nbsp;1&emsp;</div>
<div id="divChk6"  class="$divClass[6]" ><input id="radio3"  class="$classChk[6]" type=radio name="cutOff" value="6" $checked[6] onclick="radio(6)" />&nbsp;&nbsp;2&emsp;</div>
</fieldset><p>Current Cut Off: $cutoff</p> </form>
<form method="GET" action="dietReportx.php"><input type="hidden" name="Add" value="Add" />&ensp;<br>&ensp;
<fieldset><legend>Description,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Score</legend>
<input class="desc" type="text" name="desc" value="" />&nbsp;<input class="score" type="text" name="score" value="2" /> <button class="login"> Add </button></fieldset>
</form>
<div>
EOT;

$daySpace[1] = "\n</div><hr><p>&emsp;</p><div>\n";
$daySpace[2] = "\n</div><div class=\"pageBreak\"></div><div>\n";
$daySpace[3] = "\n</div><hr><div>";
ob_flush();
$pt = array(0,1,2,2);
$type = array('','IgE','IgG','IgG4');
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
@mysqli_select_db($dbc,'amx_portal');

 
  $class[1]['0'] = ' class="tested" ';
  $class[1]['0/1'] = ' class="strike" ';
  $class[1]['1'] = ' class="strike" ';
  $class[1]['2'] = ' class="strike" ';
  $class[1]['3'] = ' class="strike" ';
  $class[1]['4'] = ' class="strike" ';
  $class[1]['5'] = ' class="strike" ';
  
  $class[2]['0'] = ' class="tested" '; 
  $class[2]['0/1'] = ' class="s0" '; 
  $class[2]['1'] = ' class="s1" ';
  $class[2]['2'] = ' class="s2" ';
  $class[2]['3'] = ' class="s3" ';
  $class[2]['4'] = ' class="s4" ';
  $class[2]['5'] = ' class="s5" ';  
  
  $class[3]['0'] = ' class="tested" '; 
  $class[3]['0/1'] = ' class="s0" '; 
  $class[3]['1'] = ' class="s1" ';
  $class[3]['2'] = ' class="s2" ';
  $class[3]['3'] = ' class="s3" ';
  $class[3]['4'] = ' class="s4" ';
  $class[3]['5'] = ' class="s5" ';  
  $score = array('0' => '-','0/1' => '+','1' => '+','2' => '+','3' => '+','4' => '+','5' => '+');  
  
//  $sql = "SELECT COUNT(*),`Client`  FROM `Patient` WHERE `Patient` = $pat LIMIT 1";
//  $results = @mysqli_query($dbc,$sql);
//  $row = mysqli_fetch_array($results, MYSQLI_NUM);
  $sql = "SELECT `Code`,`Type`,`Score`,`Description`  FROM `Test` WHERE `Patient` =  $pat ORDER BY `Type` ASC,`Score` ASC ";
  $results = @mysqli_query($dbc,$sql);
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
    if ($row[2] >= $cutoff){
	  if ($epos[$row[0]]){continue;}
	  if ($row[1] == 1){$epos[$row[0]] = true;}
      $data[$row[1]][$row[0]] = array($row[2],$row[3],$row[4]);
      $cat = substr($row[0],0,1);
      $c[$row[0]] = $class[$row[1]][$row[2]];
	  $s[$row[0]] = $score[$row[2]];
      $poz[$row[0]] = $pt[$row[1]];
      $pos[$row[1]][$row[0]] = array($row[1],$cat,$row[3],$row[2]);
	}
	else {
	  $s[$row[0]] = $score[0];
	  $c[$row[0]] = $class[$row[1]][$row[2]];
	}
  }
//  echo '<pre>';print_r($s);echo '</pre>';
$label = array('type','class','Food','Score');
echo "<div class=\"noPrint\">";
/*
foreach ($pos as $k => $v1) {
    echo "\n\nType: $k-" . $type[$k] . "\n";
    foreach ($v1 as $ky => $v2) {
      echo "\nCode: $ky ";
      foreach ($v2 as $key => $v3) {
        echo "  $ky $label[$key]: $v3";
      }
    }
}
156810
echo "\n";
*/
//if (isset($_GET['p'])){
if (count($data) > 0){
  echo "<h2>Positives</h2>";
  foreach ($data as $k => $v1) {
    echo "<p class=\"head\">$type[$k]</p><br>";
    foreach ($v1 as $key => $v2) {
        echo "<fieldset><p class=\"inline\">$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d-$v[1]-$k\"  class=\"divNoCheck\" ><input id=\"c-$v[1]-$k\"  class=\"noCheck\" type=checkbox name=\"c-$v[1]-$k\" value=\"7\" onclick=\"check('$v[1]-$k')\" />&nbsp;Include&nbsp;</div></p></fieldset>";
    }
  }
}
else{
echo "<h2>No Positives</h2><p class=\"emp\">Cut Off: $cutoff</p>";
}
//}
echo "</div></div></div><div class=\"break\"><br><h2>Rotation Diet</h2><p>Tested foods are in bold. &ensp;(+) positive&emsp;(-) negative$patient";

ob_flush();
$category = array('Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish & Shellfish','Drinks');

$cclasses = array('c1','c2');
$classes = array(' class="hd" ',' class="item" ');
$group = 0;
$saveGroup = 99;

$bg = 1;
$day = 0;
while (true){
  $day++;
  echo "</div><h3 class=\"day\">Day $day</h3><br><div class=\"col\">\n";
  $sql = "SELECT `id`, `Family`, `Type`, `Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE `Day` = $day   ORDER BY `alpha` ASC , `Description` ASC";
        $results = @mysqli_query($dbc,$sql);
        while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
		//  if ($epos[$row[5]]){continue;}
          $group = ($row[1] & 0x3CFF0000)/ 67108864;
          if ($saveGroup != $group){
            $saveGroup = $group;
            echo "<div><br><p class=\"hd\">&ensp;$category[$group]&ensp;</p></div>\n";
            $bg = $cclasses[($group & 1)];
            continue;
          }
          $clss = $c[$row[5]];
		  $scor = $s[$row[5]];
          if ($row[2] == 1){
            echo "<div><p$clss>&emsp;$scor$row[3]&emsp;</p></div>";
          }
        }
      if ($day > 3){break;}
	  echo $daySpace[$day];
    }

ob_flush();
//var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3'); chk[7] = document.getElementById('chk7');chk[8] = document.getElementById('chk8');chk[9] = document.getElementById('chk9');chk[10] = document.getElementById('chk10');chk[11] = document.getElementById('chk11');chk[12] = document.getElementById('chk12');chk[13] = document.getElementById('chk13');chk[14] = document.getElementById('chk14');chk[15] = document.getElementById('chk15');chk[16] = document.getElementById('chk16');chk[17] = document.getElementById('chk17');chk[18] = document.getElementById('chk18');chk[19] = document.getElementById('radio1');chk[20] = document.getElementById('radio2');chk[21] = document.getElementById('radio3');
//divChk[7] = document.getElementById('divChk7');divChk[8] = document.getElementById('divChk8');divChk[9] = document.getElementById('divChk9');divChk[10] = document.getElementById('divChk10');divChk[11] = document.getElementById('divChk11');divChk[12] = document.getElementById('divChk12');divChk[13] = document.getElementById('divChk13');divChk[14] = document.getElementById('divChk14');divChk[15] = document.getElementById('divChk15');divChk[16] = document.getElementById('divChk16');divChk[17] = document.getElementById('divChk17');divChk[18] = document.getElementById('divChk18');divChk[19] = document.getElementById('divRadio1');divChk[20] = document.getElementById('divRadio2');divChk[21] = document.getElementById('divRadio3');

echo <<<EOT
</div><br><hr></div><<script type="text/javascript">//<![CDATA[
var bg = new Array('#2985EA','#f00');
var hd = document.getElementById('hd');
hd.style.display = 'none';
var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3');chk[4] = document.getElementById('chk4');chk[5] = document.getElementById('chk5');chk[6] = document.getElementById('chk6');
var divChk = new Array();divChk[1] = document.getElementById('divChk1');divChk[2] = document.getElementById('divChk2');divChk[3] = document.getElementById('divChk3');divChk[4] = document.getElementById('divChk4');divChk[5] = document.getElementById('divChk5');divChk[6] = document.getElementById('divChk6');
function radio(n){divChk[4].style.backgroundColor=bg[0];divChk[5].style.backgroundColor=bg[0];divChk[6].style.backgroundColor=bg[0];divChk[n].style.backgroundColor=bg[1];}
function item(n){var div = document.getElementById('D' + n);var cbx = document.getElementById('C' + n);if (cbx.checked){div.style.backgroundColor=bg[1];cbx.style.backgroundColor=bg[1];}else{div.style.backgroundColor=bg[0];cbx.style.backgroundColor=bg[0]}}
function check(n){if (chk[n].checked){divChk[n].style.backgroundColor=bg[1];chk[n].style.backgroundColor=bg[1];}else{divChk[n].style.backgroundColor=bg[0];chk[n].style.backgroundColor=bg[0]}}
function hideHeader(){var disp = hd.style.display;if (disp == 'block'){hd.style.display = 'none';}else{hd.style.display = 'block';}}
</script></body></html>
EOT;
ob_end_flush();
/*
$sql = "SELECT `Group`, COUNT(*) FROM Allergens WHERE `Day` = 1 AND `Type` = 1 GROUP BY `Group`;";
$results = @mysqli_query($dbc,$sql);
while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  $skip[$row[0]] = false ;
}
$sql = "SELECT `Group`, COUNT(*) FROM Allergens WHERE `Day` = 1 AND `Type` != 1 GROUP BY `Group`;";
$results = @mysqli_query($dbc,$sql);
while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  $skip[$row[0]] = false ;
}
*/

?>