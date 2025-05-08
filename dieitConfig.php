<?php ob_start("ob_gzhandler");

header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
         // 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3
$cc=array(0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1);
$check = array('nocheck','check');
$checkd = array('','checked');
$ndx= 0;
while (true){
  $ndx++;
  $classChk[$ndx] = $check[$cc[$ndx]];
  $checked[$ndx] = $checkd[$cc[$ndx]];
  if ($ndx > 20) {break;}
}
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet Configuration</title>
<style type="text/css">
body{width:100%;font:700 1em/1.5 Arial,sans-serif;margin-left:2%;background:#111;color:#eee; }
#content{width:20em;margin-top:80px;padding:0 2em 0 0;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.check{background:#f00;display:inline;padding:4px 0;}
.nocheck{background:#2985EA;display:inline;padding:4px 0;}
legend{font:700 1em Arial,sans-serif;}
.c1{min-height:3450px;background:#222;border: 10px solid #0ff;color:#0ff;padding:1em;float:left;}
.c2{min-height:3450px;background:#222;border: 10px solid #f0f;color:#f0f;padding:1em;float:left;}
td{padding:2px 0 0 6px;border:0;margin:0;}
.head{color:#ff0;font-size:1.2em;}
.item{color:#0ff;}
h1{align-text:center;}
</style><body>
<div id="header"></div>
<div id="content">
<h2>Rotation Diet Tests</h2><pre>
EOT;
ob_flush();
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
@mysqli_select_db($dbc,'amx_portal');
//if (isset($_GET['p'])){
  $sql = "SELECT COUNT(*),`Client`  FROM `Patient` WHERE `Patient` = 156624 LIMIT 1";
  $results = @mysqli_query($dbc,$sql);
  $row = mysqli_fetch_array($results, MYSQLI_NUM);
  $sql = "SELECT `Code`,`Type`,`Score`,`Description`  FROM `Test` WHERE `Patient` =  156624 ORDER BY `Score` ASC ";
  $results = @mysqli_query($dbc,$sql);
  $cutoff = $_GET['cutOff'];
  $cutoff = '0/1';
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
	$data[$row[1]][$row[0]] = $row[2];
	$cat = substr($row[0],0,1);
	if ($row[2] >= $cutoff){$poz[] = array($row[1],$cat,$row[3],$row[2],$row[0]);};
  }
//}
         // 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3

$cc=array(0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1);
$check = array('nocheck','check');
$checkd = array('','checked');
$ndx= 0;
while (true){
  $ndx++;
  $classChk[$ndx] = $check[$cc[$ndx]];
  $checked[$ndx] = $checkd[$cc[$ndx]];
  if ($ndx > 20) {break;}
}

echo <<<EOT

<form method="get" action="https://dev.amxemr.com/client/">
<fieldset>
<legend>Display</legend>
<div id="divChk1"  class="$classChk[1]" ><INPUT id="chk1"  class="$classChk[1]" type=checkbox name="grocery" value="1" $checked[1] onclick="check(1)" /></div>&nbsp;&nbsp;Grocery Page<br>
<div id="divChk2"  class="$classChk[2]" ><INPUT id="chk2"  class="$classChk[2]" type=checkbox name="diet" value="1" $checked[2] onclick="check(2)" /></div>&nbsp;&nbsp;Diet Page&nbsp;&nbsp;
</fieldset><fieldset>
<legend>Exclude</legend>
<div id="divChk3"  class="$classChk[3]" ><INPUT id="chk3"  class="$classChk[3]" type=checkbox name="xE" value="1" $checked[3] onclick="check(3)" /></div>&nbsp;&nbsp;IgE&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk4"  class="$classChk[4]" ><INPUT id="chk4"  class="$classChk[4]" type=checkbox name="xG4" value="1" $checked[4] onclick="check(4)" /></div>&nbsp;&nbsp;IgG4&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk5"  class="$classChk[5]" ><INPUT id="chk5"  class="$classChk[5]" type=checkbox name="xG" value="1" $checked[5] onclick="check(5)" /></div>&nbsp;&nbsp;IgG&nbsp;&nbsp;
</fieldset><fieldset>
<legend>Strike Through</legend>
<div id="divChk6"  class="$classChk[6]" ><INPUT id="chk6"  class="$classChk[6]" type=checkbox name="stE" value="1" $checked[6] onclick="check(6)" /></div>&nbsp;&nbsp;IgE&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk7"  class="$classChk[7]" ><INPUT id="chk7"  class="$classChk[7]" type=checkbox name="stG4" value="1" $checked[7] onclick="check(7)" /></div>&nbsp;&nbsp;IgG4&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk8"  class="$classChk[8]" ><INPUT id="chk8"  class="$classChk[8]" type=checkbox name="stG" value="1" $checked[7] onclick="check(8)" /></div>&nbsp;&nbsp;IgG&nbsp;&nbsp;
</fieldset><fieldset>
<legend>Remove</legend>
<div id="divChk9"  class="$classChk[9]" ><INPUT id="chk9"  class="$classChk[9]" type=checkbox name="rE" value="1" $checked[9] onclick="check(9)" /></div>&nbsp;&nbsp;IgE&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk10"  class="$classChk[10]" ><INPUT id="chk10"  class="$classChk[10]" type=checkbox name="rG4" value="1" $checked[10] onclick="check(10)" /></div>&nbsp;&nbsp;IgG4&nbsp;&nbsp;&nbsp;&nbsp;
<div id="divChk11"  class="$classChk[11]" ><INPUT id="chk11"  class="$classChk[11]" type=checkbox name="rG" value="1" $checked[11] onclick="check(11)" /></div>&nbsp;&nbsp;IgG&nbsp;&nbsp;
</fieldset>
<h2>Food Family Rules</h2>
<fieldset>
<legend>Display</legend>
<div id="divChk12"  class="$classChk[12]" ><INPUT id="chk12"  class="$classChk[12]" type=checkbox name="grocery" value="1" $checked[12] onclick="check(12)" /></div>&nbsp;&nbsp;Food Family information<br>
<div id="divChk13"  class="$classChk[13]" ><INPUT id="chk13"  class="$classChk[13]" type=checkbox name="diet" value="1" $checked[13] onclick="check(13)" /></div>&nbsp;&nbsp;Tested Foods<br>
<div id="divChk14"  class="$classChk[14]" ><INPUT id="chk14"  class="$classChk[14]" type=checkbox name="diet" value="1" $checked[14] onclick="check(14)" /></div>&nbsp;&nbsp;Positive Foods
</fieldset><fieldset>
<legend>Positive Cut Off Score</legend>
<div id="divRadio1"  class="$classChk[19]" ><INPUT id="radio1"  class="$classChk[19]" type=radio name="cutOff" value="1" $checked[19] onclick="radio(19)" /></div>&nbsp;&nbsp;0/1<br>
<div id="divRadio2"  class="$classChk[20]" ><INPUT id="radio2"  class="$classChk[20]" type=radio name="cutOff" value="1" $checked[20] onclick="radio(20)" /></div>&nbsp;&nbsp;1<br>
<div id="divRadio3"  class="$classChk[21]" ><INPUT id="radio3"  class="$classChk[21]" type=radio name="cutOff" value="1" $checked[21] onclick="radio(21)" /></div>&nbsp;&nbsp;2
</fieldset>
<h2>Pollen Food Crossreactivity Rules</h2>
<fieldset>
<legend>Display</legend>
<div id="divChk15"  class="$classChk[15]" ><INPUT id="chk15"  class="$classChk[15]" type=checkbox name="grocery" value="1" $checked[15] onclick="check(15)" /></div>&nbsp;&nbsp;Physician Page <br>
<div id="divChk16"  class="$classChk[16]" ><INPUT id="chk16"  class="$classChk[16]" type=checkbox name="diet" value="1" $checked[16] onclick="check(16)" /></div>&nbsp;&nbsp;Patient Page
</fieldset>
<h2>Hidden Food List Rules</h2>
<fieldset>
<legend>Display</legend>
<div id="divChk17"  class="$classChk[17]" ><INPUT id="chk17"  class="$classChk[17]" type=checkbox name="grocery" value="1" $checked[17] onclick="check(17)" /></div>&nbsp;&nbsp;Physician Page <br>
<div id="divChk18"  class="$classChk[18]" ><INPUT id="chk18"  class="$classChk[18]" type=checkbox name="diet" value="1" $checked[18] onclick="check(18)" /></div>&nbsp;&nbsp;Patient Page
</fieldset>
</div><pre>
EOT;

//if (isset($_GET['p'])){
print_r($data);
asort($poz);
print_r($poz);
$type = array('','IgE','IgG','IgG4');
echo "_______________________________\n";
foreach ($data as $k => $v1) {
    echo $type[$k] . "\n";
    foreach ($v1 as $key => $v2) {
        echo "$key $v2\n";
    }
}
foreach ($poz as  $v) {
    echo "$v[3] $v[2] \n";
}
//}
echo '</pre><div><table>';

ob_flush();
$category = array('Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish & Shellfish','Drinks');

$cclasses = array('c1','c2');
$classes = array(' class="head" ',' class="item" ');
//$sql = "SELECT * FROM `Allergens`";
$group = 0;
$saveGroup = 99;

$bg = 1;


$sql = "SELECT `id`, `Family`, `Type`, `Description` FROM `Allergens` ORDER BY `Family` ASC";
        $results = @mysqli_query($dbc,$sql);
        while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
		$group = ($row[1] & 0x3CFF0000)/ 67108864;
		if ($saveGroup != $group){
		  $saveGroup = $group;
		  $bg = $cclasses[($group & 1)];
		  echo "</table>$cat";
		  $cat = "<h1>$category[$group]</h1>";
		  echo "</div>\n<div class=\"$bg\">$cat<table>";
		}
		  $class = $classes[$row[2]];
		  
		  if ($row[2] == 1){
            echo "<tr$class><td><div id=\"D$row[0]\"  class=\"check\" ><INPUT id=\"C$row[0]\"  class=\"check\" type=checkbox name=\"I$row[0]\" value=\"1\" checked onclick=\"item($row[0])\" /></div></td><td>$row[3]</td></tr>\n";
		  }
		  else{
            echo "<tr><td>&emsp;</td><td>&emsp;</td></tr><tr><td>&emsp;</td><td$class>$row[3]</td></tr>\n";
		  }
        }

ob_flush();

echo <<<EOT
</pre></table>$cat</div></form><script type="text/javascript">//<![CDATA[
var bg = new Array('#2985EA','#f00');
var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3');chk[4] = document.getElementById('chk4');chk[5] = document.getElementById('chk5');chk[6] = document.getElementById('chk6');chk[7] = document.getElementById('chk7');chk[8] = document.getElementById('chk8');chk[9] = document.getElementById('chk9');chk[10] = document.getElementById('chk10');chk[11] = document.getElementById('chk11');chk[12] = document.getElementById('chk12');chk[13] = document.getElementById('chk13');chk[14] = document.getElementById('chk14');chk[15] = document.getElementById('chk15');chk[16] = document.getElementById('chk16');chk[17] = document.getElementById('chk17');chk[18] = document.getElementById('chk18');chk[19] = document.getElementById('radio1');chk[20] = document.getElementById('radio2');chk[21] = document.getElementById('radio3');
var divChk = new Array();divChk[1] = document.getElementById('divChk1');divChk[2] = document.getElementById('divChk2');divChk[3] = document.getElementById('divChk3');divChk[4] = document.getElementById('divChk4');divChk[5] = document.getElementById('divChk5');divChk[6] = document.getElementById('divChk6');divChk[7] = document.getElementById('divChk7');divChk[8] = document.getElementById('divChk8');divChk[9] = document.getElementById('divChk9');divChk[10] = document.getElementById('divChk10');divChk[11] = document.getElementById('divChk11');divChk[12] = document.getElementById('divChk12');divChk[13] = document.getElementById('divChk13');divChk[14] = document.getElementById('divChk14');divChk[15] = document.getElementById('divChk15');divChk[16] = document.getElementById('divChk16');divChk[17] = document.getElementById('divChk17');divChk[18] = document.getElementById('divChk18');divChk[19] = document.getElementById('divRadio1');divChk[20] = document.getElementById('divRadio2');divChk[21] = document.getElementById('divRadio3');
function radio(n){divChk[19].style.backgroundColor=bg[0];chk[19].style.backgroundColor=bg[0];divChk[20].style.backgroundColor=bg[0];chk[20].style.backgroundColor=bg[0];divChk[21].style.backgroundColor=bg[0];chk[21].style.backgroundColor=bg[0];check(n);}
function item(n){var div = document.getElementById('D' + n);var cbx = document.getElementById('C' + n);if (cbx.checked){div.style.backgroundColor=bg[1];cbx.style.backgroundColor=bg[1];}else{div.style.backgroundColor=bg[0];cbx.style.backgroundColor=bg[0]}}
function check(n){if (chk[n].checked){divChk[n].style.backgroundColor=bg[1];chk[n].style.backgroundColor=bg[1];}else{divChk[n].style.backgroundColor=bg[0];chk[n].style.backgroundColor=bg[0]}}
//]]>
</script></body></html>
EOT;
ob_end_flush();
?>