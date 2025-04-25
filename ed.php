<?php ob_start("ob_gzhandler");

$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
@mysql_select_db('amx_portal');
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Edit Rotation Diet</title>
<style type="text/css">
body{width:100%;font:700 1em/1.5 Arial,sans-serif;margin-left:2%;background:#111;color:#eee; }
#content{width:60em;margin-top:80px;padding:0 2em 0 0;}
.set{width:20em;}
input[type="radio"],input[type="checkbox"]{margin:0 0 0 4px;padding:0;width:2em;height:2em;border:2px solid #fff;outline:2px solid #fff;display: inline;vertical-align: middle;position: relative;color:#fff;}
.check{background:#f00;}
.nocheck{background:#2985EA;}
.divCheck,.divNoCheck{color:#fff;display:inline;padding:4px 0;width:16em;}
.divNoCheck{background:#2985EA;}
.divCheck{background:#f00;}
legend{font:700 1em Arial,sans-serif;}
.c1{background:#222;border: 10px solid #0ff;color:#0ff;padding:1em;float:left;}
.c2{background:#222;border: 10px solid #0f0;color:#0f0;padding:1em;float:left;}
td{padding:2px 0 2px 6px;border-bottom:1px solid #ff0;margin:0;}
.blank{border:0;}
tr{border-bottom:3px solid #f0f;}
.head{color:#ff0;font-size:1.2em;}
.item{color:#0ff;}
h1{text-align:center;}
.break{clear:both;}
button{width:100%;font:700 1.1em Arial,sans-serif;padding:.4em;}
.cross{display:none;}
</style><body onload="init()"><div id="content">
<div id="header" onclick="hideHdr()" >
</div>

EOT;
ob_flush();
$ip =  $_SERVER['REMOTE_ADDR'];
$cc=array(0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1);
$check = array('nocheck','check');
$div = array('divNoCheck','divCheck'); 
$checkd = array('','checked');
$ndx= 0;
if ($ip == '99.3.150.55' || $ip == '173.162.23.21' ){

  echo "<h2>Default Foods Table</h2><button onclick=\"unhide()\">Show Cross Reactivity</button><div>";
}
else{
  echo "<h2>Default Foods Table</h2><div>";
}
EOT;
ob_flush();
$a = array(0,0,0,0,0,0);
$row = array_fill(1,424,$a); 

if (isset($_GET['sub'])){
  foreach ($_GET as $k => $v){
	if (substr($k,0,1)=='s'){continue;}
	if (substr($k,0,1)=='c'){continue;}
    if (substr($k,0,1)=='C'){
      $cr = intval(substr($k,1,1));
	  $id = intval(substr($k,2));
	  $row[$id][$cr] = 1;
    }
    else{
      $row[$k][0] = $v;
    }
    
  }
  foreach ($row as $k => $v){
  $sql = "UPDATE `Foods` SET  `Day`= '$v[0]',`Birch`='$v[1]', `Sycamore`='$v[2]', `Mugwort`='$v[3]', `Grasses`='$v[4]', `Latex`='$v[5]' WHERE `id`=$k";
    @mysql_unbuffered_query($sql);
	$error = mysql_error();
	if (strlen($error) > 0){echo "$error<br>$sql";break;}
  }
}
$check = array('nocheck','check');
$checkd = array('','checked');
$ndx= 0;
while (true){
  $ndx++;
  $classChk[$ndx] = $check[$cc[$ndx]];
  $checked[$ndx] = $checkd[$cc[$ndx]];
  if ($ndx > 20) {break;}
}
$category = array('','Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish & Shellfish','Drinks');
$cclasses = array('c1','c2');
$classes = array(' class="head" ',' class="item" ');
//$sql = "SELECT * FROM `Allergens`";
$group = 0;
$saveGroup = 99;
$bg = 1;
//  
$id = 0;
//                                                         5         6           7          8          9
$sql = "SELECT `id`,`Family`, `Type`, `Description`,`Day`,`Birch`, `Sycamore`, `Mugwort`, `Grasses`, `Latex`,`alpha` FROM `Foods` WHERE `alpha` > 0 ORDER BY `alpha` ASC, `Group` ASC,`Type` ASC, `Description` ASC";
        $results = @mysql_query($sql);
//		if (mysql_errno > 0){echo mysql_error() . '<br/>' . $sql;}
//		echo $sql;

        while($row = mysql_fetch_array($results, MYSQL_NUM)){
		  $group = $row[10]; 
		  if ($saveGroup != $group){
		    
		    $saveGroup = $group;
		    $bg = $cclasses[($group & 1)];
		    echo "</table>\n";
		    $cat = "<h1>$category[$group]</h1><button>&emsp;&emsp;Save&emsp;&emsp;</button>";
		    echo "</div>\n<div class=\"$bg\">$cat<table>";
		  }
		  $class = $classes[$row[2]];
		  if ($row[2] == 1){
		    $checkClass = array_fill(0,10,'nocheck'); //,'nocheck','nocheck','nocheck','nocheck','nocheck','nocheck','nocheck','nocheck','nocheck');
			$checkClass[$row[4]] = 'check';
		    $divClass = array_fill(0,10,'divNoCheck'); //,'divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck','divNoCheck');
			$divClass[$row[4]] = 'divCheck';
			$cr8 = $row[5];
			$cr9 = $row[6];
			$cr10 = $row[7];
			$cr11 = $row[8];
			$cr12 = $row[9];
		    $checked = array();
			$checked[$row[4]] = ' checked ';
			$id++;
		    echo <<< EOR
<tr><td>
<div id="D01$row[0]" class="$divClass[1]"><input id="C1$row[0]" class="$checkClass[1]" name="$row[0]" value="1" onclick="chkDay('$row[0]',1)" type="radio" $checked[1] />&nbsp;1&nbsp;&nbsp;&nbsp;</div>
<div id="D02$row[0]" class="$divClass[2]"><input id="C2$row[0]" class="$checkClass[2]" name="$row[0]" value="2" onclick="chkDay('$row[0]',2)" type="radio" $checked[2] />&nbsp;2&nbsp;&nbsp;&nbsp;</div>
<div id="D03$row[0]" class="$divClass[3]"><input id="C3$row[0]" class="$checkClass[3]" name="$row[0]" value="3" onclick="chkDay('$row[0]',3)" type="radio" $checked[3] />&nbsp;3&nbsp;&nbsp;&nbsp;</div>
<div id="D04$row[0]" class="$divClass[4]"><input id="C4$row[0]" class="$checkClass[4]" name="$row[0]" value="4" onclick="chkDay('$row[0]',4)" type="radio" $checked[4] />&nbsp;4&nbsp;&nbsp;&nbsp;</div>
<div id="D00$row[0]" class="$divClass[0]"><input id="C0$row[0]" class="$checkClass[9]" name="$row[0]" value="9" onclick="chkDay('$row[0]',0)" type="radio" $checked[9] />&nbsp;X&nbsp;&nbsp;&nbsp;</div>
<div id="c$id" class="cross">
<div id="D08$row[0]" class="$divClass[$cr8]"><input id="C8$row[0]" class="$checkClass[$cr8]" name="C1$row[0]" value="1" onclick="chk('$row[0]',8)" type="checkbox" $checkd[$cr8] /></div>
<div id="D09$row[0]" class="$divClass[$cr9]"><input id="C9$row[0]" class="$checkClass[$cr9]" name="C2$row[0]" value="1" onclick="chk('$row[0]',9)" type="checkbox" $checkd[$cr9] /></div>
<div id="D10$row[0]" class="$divClass[$cr10]"><input id="C10$row[0]" class="$checkClass[$cr10]" name="C3$row[0]" value="1" onclick="chk('$row[0]',10)" type="checkbox" $checkd[$cr10] /></div>
<div id="D11$row[0]" class="$divClass[$cr11]"><input id="C11$row[0]" class="$checkClass[$cr11]" name="C4$row[0]" value="1" onclick="chk('$row[0]',11)" type="checkbox" $checkd[$cr11] /></div>
<div id="D12$row[0]" class="$divClass[$cr12]"><input id="C12$row[0]" class="$checkClass[$cr12]" name="C5$row[0]" value="1" onclick="chk('$row[0]',12)" type="checkbox" $checkd[$cr12] /></div>
</td>
</div>
EOR;
echo "<td>$row[3]</td></tr>";
		  }
		  else{
            echo <<<EOT
<tr><td class="blank">&emsp;</td><td class="blank">&emsp;</td></tr>
<tr><td>&emsp;</td><td$class>$row[3]</td>
</tr>\n
EOT;
		  }
        }
ob_flush();
echo "</table>$cat</div></form>";

echo <<<EOT
</div><hr class="break"><br>
<script type="text/javascript">//<![CDATA[
var bg = new Array('#2985EA','#f00');
var chk = new Array();chk[1] = document.getElementById('chk1');chk[2] = document.getElementById('chk2');chk[3] = document.getElementById('chk3');chk[4] = document.getElementById('chk4');chk[5] = document.getElementById('chk5');chk[6] = document.getElementById('chk6');chk[7] = document.getElementById('chk7');chk[8] = document.getElementById('chk8');chk[9] = document.getElementById('chk9');chk[10] = document.getElementById('chk10');chk[11] = document.getElementById('chk11');chk[12] = document.getElementById('chk12');chk[13] = document.getElementById('chk13');chk[14] = document.getElementById('chk14');chk[15] = document.getElementById('chk15');chk[16] = document.getElementById('chk16');chk[17] = document.getElementById('chk17');chk[18] = document.getElementById('chk18');chk[19] = document.getElementById('radio1');chk[20] = document.getElementById('radio2');chk[21] = document.getElementById('radio3');
var divChk = new Array();divChk[1] = document.getElementById('divChk1');divChk[2] = document.getElementById('divChk2');divChk[3] = document.getElementById('divChk3');divChk[4] = document.getElementById('divChk4');divChk[5] = document.getElementById('divChk5');divChk[6] = document.getElementById('divChk6');divChk[7] = document.getElementById('divChk7');divChk[8] = document.getElementById('divChk8');divChk[9] = document.getElementById('divChk9');divChk[10] = document.getElementById('divChk10');divChk[11] = document.getElementById('divChk11');divChk[12] = document.getElementById('divChk12');divChk[13] = document.getElementById('divChk13');divChk[14] = document.getElementById('divChk14');divChk[15] = document.getElementById('divChk15');divChk[16] = document.getElementById('divChk16');divChk[17] = document.getElementById('divChk17');divChk[18] = document.getElementById('divChk18');divChk[19] = document.getElementById('divRadio1');divChk[20] = document.getElementById('divRadio2');divChk[21] = document.getElementById('divRadio3');
function chkDay(n,d){
var div1 = document.getElementById('D1' + n);
var div2 = document.getElementById('D2' + n);
var div3 = document.getElementById('D3' + n);
var div4 = document.getElementById('D4' + n);
div1.style.backgroundColor=bg[0];
div2.style.backgroundColor=bg[0];
div3.style.backgroundColor=bg[0];
div4.style.backgroundColor=bg[0];
var chk = document.getElementById('D' + d + n);
chk.style.backgroundColor=bg[1];
}
function radio(n){divChk[19].style.backgroundColor=bg[0];chk[19].style.backgroundColor=bg[0];divChk[20].style.backgroundColor=bg[0];chk[20].style.backgroundColor=bg[0];divChk[21].style.backgroundColor=bg[0];chk[21].style.backgroundColor=bg[0];check(n);}
function item(n){var div = document.getElementById('D' + n);var cbx = document.getElementById('C' + n);if (cbx.checked){div.style.backgroundColor=bg[1];cbx.style.backgroundColor=bg[1];}else{div.style.backgroundColor=bg[0];cbx.style.backgroundColor=bg[0]}}
function check(n){if (chk[n].checked){divChk[n].style.backgroundColor=bg[1];chk[n].style.backgroundColor=bg[1];}else{divChk[n].style.backgroundColor=bg[0];chk[n].style.backgroundColor=bg[0]}}
function unhide(){
  var id = 0;
  while(true){
    id++;
    document.getElementById('c' + id).style.display='inline-block';
    if (id > $id){break;}
  }
}
function init(){return;}
//]]>
</script></body></html>
EOT;
ob_end_flush();
?>