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
#hd,.noPrint{float:left;background:#ffb;color:#000;}
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
</style><body onload="init()">
<div id="header" onclick="hideHeader()" ><img src="amxlogo.jpg" alt="logo" /></div>
<div id="content">
EOT;
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
@mysqli_select_db($dbc,'amx_portal');
$mode = 1;
$exclude = array(0,0,0,0);
$cx=array(0,1,0,0);
$cc=array(0,0,0,0);
$co=array('0/1','0/1','1','2');
$cutoff = '0/1';
$coDivClass = array('divNoCheck','divNoCheck','divNoCheck','divNoCheck');
$cxDivClass =array('divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck');

$coChkClass = array('nocheck','nocheck','nocheck','nocheck');
$cxChkClass = array('nocheck','nocheck','nocheck','nocheck','nocheck','nocheck');
$cxChecked = array('','','','','');
$coChecked = array('','','','','');

$chkClasses = array('nocheck','nocheck','nocheck','nocheck');
$divClasses = array('divNoCheck','divNoCheck','divNoCheck','divNoCheck'); 
$checkd = array('','checked');
$default = 1;
$mode = 4;
//{$pat = 156624;}else
$pat = intval($_GET['p']);
if (strlen($pat) == 6){
  $patient="<br>Patient: $pat";
  $hideHeader = "hd.style.display = 'none';";
if (isset($_GET['sub'])){
  foreach ($_GET as $k => $v){
    if (substr($k,0,1) == 'x'){
      $cxChecked[$v] = 'checked';
      $cxChkClass[$v] = 'check';
      $cxDivClass[$v] = 'divCheck'; 
    }
    elseif ($k == 'm'){
      $mode += $v;
    }
    elseif ($k == 'co'){
      $default = $v;
      $cc[1] = 0;
      $cc[$v] = 1;
    }
    elseif ($k == 'desc' && strlen($v) > 0){
      $sql = "SELECT `id`,`Code`,`Description` FROM `Allergens` WHERE `Description` LIKE '%$v%' GROUP BY `Description`";
      $results = @mysqli_query($dbc,$sql);
      $rows = mysqli_num_rows($results);
      if ($rows == 1){
        $row = mysqli_fetch_array($results, MYSQLI_NUM);
        $sql = "INSERT INTO `amx_portal`.`Test` (`Patient`, `Code`, `Type`, `Score`, `Description`) VALUES ('$pat', '$row[1]', 0, 9, '$row[2]')";
        mysqli_query($dbc,$sql);
        if (mysql_error() == 0){
           $add = "<h2><br>$v Added</h2>";
        }
        else {
          $add = "<h2><br>Error Adding $v</h2>";
        }
      }
      elseif  ($rows > 0){
        $add = '<table>';
        while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {

        $add .= <<< EOR
<tr><td>
<div class="divNoCheck"><input id="a$row[0]" class="nocheck" name="a$row[0]" value="$row[1]" onclick="chkDay('$row[0]',0)" type="checkbox" />&nbsp;add&nbsp;&nbsp;&nbsp;</div></td>
<td>$row[2]</td></tr>
EOR;
        }
        $add .= '</table>';
      }
      else{
        $add = '<h2>$v Not found</h2>';
      }
      
    
    }
    elseif (substr($k,0,1) == 'a'){
      $sql = "INSERT INTO `amx_portal`.`Test` (`Patient`, `Code`, `Type`, `Score`, `Description`) VALUES ('$pat', '$code', 0, 9, '$v')";
      mysqli_query($dbc,$sql);
      if (mysql_error() == 0){
        $add = "<h2><br>$v Added</h2>";
      }
      else {
        $add = "<h2><br>Error Adding $v</h2>";
      }
    }
  }
}

}
else{
  $hideHeader = "hd.style.display = 'block';";
  $add = '';
}

$coChecked[$default] = 'checked';
$coChkClass[$default] = 'check';
$coDivClass[$default] = 'divCheck'; 
$cutoff = $co[$default];
$cxChkClass[$mode] = 'check';
$cxDivClass[$mode] = 'divCheck';
$cxChecked[$mode] = 'checked';

echo <<<EOT
<div id="hd" class="noPrint">
<form method="GET" action="dietReportx.php"><input type="hidden" name="sub" value="sub" />&ensp;<br>&ensp;
<fieldset><legend>Exclude</legend>
<div id="divChk1"  class="$cxDivClass[1]" ><input id="chk1"  class="$cxChkClass[1]" type=checkbox name="x1" value="1" $cxChecked[1] onclick="check(1)" />&nbsp;&nbsp;IgE&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div id="divChk2"  class="$cxDivClass[2]" ><input id="chk2"  class="$cxChkClass[2]" type=checkbox name="x2" value="2" $cxChecked[2] onclick="check(2)" />&nbsp;&nbsp;IgG4&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div id="divChk3"  class="$cxDivClass[3]" ><input id="chk3"  class="$cxChkClass[3]" type=checkbox name="x3" value="3" $cxChecked[3] onclick="check(3)" />&nbsp;&nbsp;IgG&nbsp;&nbsp;</div><br>
<div id="divChk7"  class="$cxDivClass[4]" ><input id="radio4"  class="$cxChkClass[4]" type=radio name="m" value="0" $cxChecked[4] onclick="mode(7)" />&nbsp;&nbsp;Strike&emsp;</div>&emsp;
<div id="divChk8"  class="$cxDivClass[5]" ><input id="radio5"  class="$cxChkClass[5]" type=radio name="m" value="1" $cxChecked[5] onclick="mode(8)" />&nbsp;&nbsp;Remove&emsp;</div>&emsp;

</fieldset><fieldset>  
<legend>Positive Score Cutoff</legend>
<div id="divChk4"  class="$coDivClass[1]" ><input id="radio1"  class="$coChkClass[1]" type=radio name="co" value="1" $coChecked[1] onclick="radio(4)" />&nbsp;&nbsp;0/1&emsp;</div>&emsp;
<div id="divChk5"  class="$coDivClass[2]" ><input id="radio2"  class="$coChkClass[2]" type=radio name="co" value="2" $coChecked[2] onclick="radio(5)" />&nbsp;&nbsp;1&emsp;</div>&emsp;
<div id="divChk6"  class="$coDivClass[3]" ><input id="radio3"  class="$coChkClass[3]" type=radio name="co" value="3" $coChecked[3] onclick="radio(6)" />&nbsp;&nbsp;2&emsp;</div>
<p>Current Score Cutoff: $cutoff</p></fieldset>
<br><fieldset><legend>Patient</legend> <input class="desc" type="text" name="p" value="$pat" /><button class="login"> Next </button>&emsp;&emsp;</fieldset>
$add
EOT;

$daySpace[1] = "\n</div><hr><p>&emsp;</p><div>\n";
$daySpace[2] = "\n</div><div class=\"pageBreak\"></div><div>\n";
$daySpace[3] = "\n</div><hr><div>";
ob_flush();
$pt = array(0,1,2,2);
$type = array('Added','IgE','IgG','IgG4');
 
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
if (strlen($pat) == 6){
  $sql = "SELECT `Code`,`Type`,`Score`,`Description`  FROM `Test` WHERE `Patient` =  $pat ORDER BY `Type` ASC,`Score` ASC ";
  $results = @mysqli_query($dbc,$sql);
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
    if ($row[2] >= $cutoff){
      if ($epos[$row[0]]){continue;}
      $epos[$row[0]] = true;      
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
echo <<<EOT
<input type="hidden" name="Add" value="Add" />&ensp;<br>&ensp;
<fieldset><legend>Add Food</legend>
Description: <input class="desc" type="text" name="desc" value="" />&nbsp;<button class="login"> Add </button></fieldset>
</form>
<div><div class=\"noPrint\">";
EOT;
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
  foreach ($data as $k => $v1) {
    echo "<h2>Positive $type[$k] Foods</h2>";
    foreach ($v1 as $key => $v2) {
       if ($v2[0] == '9'){
          echo "<fieldset><div class=\"desc\">$v2[1]</div><div id=\"d-$key-$k\"  class=\"divNoCheck\" ><input id=\"c-$key-$k\"  class=\"noCheck\" type=checkbox name=\"c-$key-$k\" value=\"7\" onclick=\"check('$key-$k')\" />&nbsp;Include&nbsp;</div></fieldset>";
       }
       else {
         echo "<fieldset>$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d-$key-$k\"  class=\"divNoCheck\" ><input id=\"c-$key-$k\"  class=\"noCheck\" type=checkbox name=\"c-$key-$k\" value=\"7\" onclick=\"check('$key-$k')\" />&nbsp;Include&nbsp;</div></fieldset>\n";
       }
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
            echo "<div><p$clss>&emsp;$scor$row[3]&emsp;</p></div>\n";
          }
        }
      if ($day > 3){break;}
      echo $daySpace[$day];
    }
  ob_flush();
}

//var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3'); chk[9] = document.getElementById('chk9');chk[10] = document.getElementById('chk10');chk[11] = document.getElementById('chk11');chk[12] = document.getElementById('chk12');chk[13] = document.getElementById('chk13');chk[14] = document.getElementById('chk14');chk[15] = document.getElementById('chk15');chk[16] = document.getElementById('chk16');chk[17] = document.getElementById('chk17');chk[18] = document.getElementById('chk18');chk[19] = document.getElementById('radio1');chk[20] = document.getElementById('radio2');chk[21] = document.getElementById('radio3');
//divChk[9] = document.getElementById('divChk9');divChk[10] = document.getElementById('divChk10');divChk[11] = document.getElementById('divChk11');divChk[12] = document.getElementById('divChk12');divChk[13] = document.getElementById('divChk13');divChk[14] = document.getElementById('divChk14');divChk[15] = document.getElementById('divChk15');divChk[16] = document.getElementById('divChk16');divChk[17] = document.getElementById('divChk17');divChk[18] = document.getElementById('divChk18');divChk[19] = document.getElementById('divRadio1');divChk[20] = document.getElementById('divRadio2');divChk[21] = document.getElementById('divRadio3');

echo <<<EOT
</div><br><hr></div><script type="text/javascript">//<![CDATA[
var bg = new Array('#2985EA','#f00');
var hd = document.getElementById('hd');
hd.style.display = 'none';
var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3');chk[4] = document.getElementById('chk4');chk[5] = document.getElementById('chk5');chk[6] = document.getElementById('chk6');chk[7] = document.getElementById('chk7');chk[8] = document.getElementById('chk8');
var divChk = new Array();divChk[1] = document.getElementById('divChk1');divChk[2] = document.getElementById('divChk2');divChk[3] = document.getElementById('divChk3');divChk[4] = document.getElementById('divChk4');divChk[5] = document.getElementById('divChk5');divChk[6] = document.getElementById('divChk6');divChk[7] = document.getElementById('divChk7');divChk[8] = document.getElementById('divChk8');
function radio(n){divChk[4].style.backgroundColor=bg[0];divChk[5].style.backgroundColor=bg[0];divChk[6].style.backgroundColor=bg[0];divChk[n].style.backgroundColor=bg[1];}
function mode(n){divChk[7].style.backgroundColor=bg[0];divChk[8].style.backgroundColor=bg[0];divChk[n].style.backgroundColor=bg[1];}
function item(n){var div = document.getElementById('D' + n);var cbx = document.getElementById('C' + n);if (cbx.checked){div.style.backgroundColor=bg[1];cbx.style.backgroundColor=bg[1];}else{div.style.backgroundColor=bg[0];cbx.style.backgroundColor=bg[0]}}
function check(n){if (chk[n].checked){divChk[n].style.backgroundColor=bg[1];chk[n].style.backgroundColor=bg[1];}else{divChk[n].style.backgroundColor=bg[0];chk[n].style.backgroundColor=bg[0]}}
function hideHeader(){var disp = hd.style.display;if (disp == 'block'){hd.style.display = 'none';}else{hd.style.display = 'block';}}
function init(){ $hideHeader }
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