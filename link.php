<?php
/* ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1); */

header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=300');
$patient = intval($_POST['p']);
$client = intval($_COOKIE['amxc']);
setcookie("amxc", $client,time()+86400);
echo <<<EOT
<!DOCTYPE html>
<html>
<head><title>AMX Diet Links</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css" media="handheld, all" >
@media only screen and (min-width : 1024px) {table,tr,#frm{max-width:850px;}}}
@media only screen and (min-width : 768px) and (max-width : 1023px) {table,tr,#frm{max-width:850px;}}
@media only screen and (max-width : 767px) {#page,table,tr,#frm{width:100%;}}
html,body{background:#66CCCC;}
p{font:700 1em Arial,sans-serif;}
.none{margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.h1,.h2,.h3,.h4,.h5,.h6{height:40px;display:inline-block;}
.h1,.c1{width:12em;}
.h2,.c2{width:15em;}
.h3,.c3{width:8em;}
.h4,.c4{width:4em;}
.h5,.c5{width:12em;}
.h6,.c6{width:40px;}
.c1,.c2,.c3,.c4,.c5,.c6{border:0;padding:0;margin:0;color:#fff;background:#043234;
background-image: -o-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -moz-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -webkit-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -ms-linear-gradient(bottom, #555 0%, #111 100%);
background-image: linear-gradient(to bottom, #555 0%, #111 100%);}
.h1,.h2,.h3,.h4,.h5,.h6,#sbmt{font-weight:700;border:0;padding:0;margin:0;color:#fff;background:#66CCCC;
background-image: -o-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -moz-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -webkit-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -ms-linear-gradient(bottom, #164 0%, #033 100%);
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
#sub,#lo,#ss,.box{border:2px ridge #6cc;margin-top:4px;padding:.5em;}
background-image: linear-gradient(to bottom, #1E504E 0%, #043234 100%);}
td,tr{border:0;padding:0;margin:0;}
.row{height:40px;}
.c1{text-align:left;padding-left:1em;}
.divCheck,.divNoCheck{color:#fff;width:40px;display:inline-block;padding:2px 0 2px 2px;margin:2px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
.cntr{text-align:center;margin:0 auto 0;width:100%;}
input[type="checkbox"],input[type="radio"] {margin-left:4px ;width:2em;height:2em;display: inline;vertical-align: middle;position: relative;}
#sbmt{width:890px;margin:0;font:700 1.1em Arial,sans-serif;padding:.3em;border:2px ridge #6cc;margin-top:4px;}
#frm{margin:0 auto 0;padding:1em;background:#144;color:#69B5B3;font:700 1em Arial,sans-serif;border:.5em ridge #6cc;}
form,table{border:0;margin:0 auto 0 ;}
.red{color:#f00;}
</style>
</head><body onload="init()">
<div id="keys">
<h3>Client ID: $client<br/>Patient AMX Lab ID: $patient</h3>
<div id="frm"><div class="cntr"><h2>Link Additional Results to Diet Report</h2>
<div class="box"><form enctype="application/x-www-form-urlencoded" method="post" action ="d.php">
<input type="hidden" name="p" value="$patient" />
<input type="hidden" name="sub" value="1" /> <br/> 
<table id="tbl">
<tr>
<td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >AMX Lab ID</button></td>
<td><button class="h2"  type="button" name="sn2" onclick="stNum(2)" >Name</button></td>
<td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >DoB</button></td>
<td><button class="h3"  type="button" name="sn4" onclick="stNum(4)" >Age</button></td>
<td><button class="h4"  type="button" name="sn5" onclick="stNum(5)" >Sex</button></td>
EOT;
$hid[0] = '';
$hid[1] = '<td><button class="h5"  type="button" name="sn6" onclick="stNum(6)" >Patient ID</button></td>';
$dbc=mysqli_connect('localhost','amx','xD1GkuK7a7DK8!'); @mysqli_select_db($dbc, 'amx_portal');
  $lnk = intval(preg_replace("[^0-9]", "", $_POST['link']));
  if ($lnk > 0){
    @mysqli_query($dbc, "UPDATE `Patient` SET `Link`=0, `Attributes`=0 WHERE `Link`= $lnk");
  }
$sql = "SELECT `Patient`, `Last`, `First` FROM `Patient` WHERE `Patient` = $patient LIMIT 1";
$results = @mysqli_query($dbc,$sql);
$pat = mysqli_fetch_array($results, MYSQLI_NUM);

$icon = array('class="dietblue"','class="dietred"','class="dietblack"','class="none"');
$x = 0;
$idRow[0] = "";
$SQL = "SELECT COUNT(`ClientID`),`ClientID` FROM `Patient` WHERE `Date` > '2006-3-3' AND `Client` = $client AND `Last` LIKE '$pat[1]' AND `First` LIKE '$pat[2]' ";
$results = @mysqli_query($dbc, $SQL);
$error =  mysqli_error($dbc);
$rows = @mysqli_num_rows($results);
$row = mysqli_fetch_array($results, MYSQLI_NUM);
$len = strlen(trim($row[1]));
$cntID = $row[1];

if ($rows == 1 && (strlen(trim($row[1])) < 1)){$cid = 0;}else{$cid = 1;}
echo <<<EOT
$hid[$cid]
<td><button class="h6"  type="button" name="sn6" onclick="stNum(6)" >Link</button></td>
</tr>
EOT;
$sql = "SELECT  `Last`, `First` ,`DoB`, `Age`, `Sex`, `ClientID`,`Patient` FROM `Patient` WHERE `Date` > '2006-3-3' AND `Client` = $client AND `Last` LIKE '$pat[1]' AND `First` LIKE '$pat[2]'";
$results = @mysqli_query($dbc, $sql);
$chk = 0;
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
  $idRow[1] = '<td><button class="c5"  type="button" name="sn2" onclick="stNum(2)" >' . $row[5] . '</button></td>';
  $chk++;
  $age = date_diff(date_create($row[2]), date_create('today'))->y;
  $labID[] =  $row[6];
  $lnk = "lnk$row[6]";
  	if ($row[6] == $patient){
      $pozChk = "<td><div id=\"d$chk\"  class=\"divCheck\" ><input id=\"c$chk\"  class=\"check\" type=\"checkbox\" name=\"$lnk\" value=\"2\" onclick=\"check('$chk')\" checked=\"checked\" /></div></td>\n"; 
    }
    else{
      $pozChk = "<td><div id=\"d$chk\"  class=\"divNoCheck\" ><input id=\"c$chk\"  class=\"noCheck\" type=\"checkbox\" name=\"$lnk\" value=\"2\" onclick=\"check('$chk')\"   /></div></td>\n"; 
	}
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[6]  AND `Code` LIKE 'F%' ";
    $result = mysqli_query($dbc, $sql);
    $fgtw = mysqli_fetch_array($result, MYSQLI_NUM);
	

  echo <<<EOT
<tr>
<td><button class="c1"  type="button" name="sn1" onclick="stNum(1)" >$row[6]</button></td>
<td><button class="c2"  type="button" name="sn1" onclick="stNum(1)" >$row[0], $row[1]</button></td>
<td><button class="c3"  type="button" name="sn2" onclick="stNum(2)" >$row[2]</button></td>
<td><button class="c3"  type="button" name="sn3" onclick="stNum(3)" >$age</button></td>
<td><button class="c4"  type="button" name="sn4" onclick="stNum(4)" >$row[4]</button></td>
$idRow[$cid]
$pozChk
EOT;
}
if ($chk > 1){
$txt = 'Link Checked Reports';
$note = '<p>If you would like to add other test results to be included in the Diet, check them</p><p>Click “Link Checked Reports”</p>';
}
else{
$txt = 'No Links, Continue to Diet';
$note = '<p>No additional Links were found with the same patient name.</p><p>Click “Continue to Diet”</p>';
}
$note .= '<p>If you do not want to create a diet report, close this tab.</p>';
foreach ($labID as $id){
  $sql = "SELECT COUNT(`Score`),`Score` FROM `Test` WHERE `Patient` = $id  AND `Code` LIKE 'F%' GROUP BY `Score` ORDER BY `Score` ASC";
  $results = @mysqli_query($dbc, $sql);
  $note .= "<p>Food Class Scores for $id:&#x2002; "; 
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
    $note .= "Score:$row[1]=$row[0],&#x2002; "; 
  }
  $note = substr($note,0,-10);
  $note .='</p>';
}

echo <<<EOT
</tr></table><input id="sbmt" type="submit" name="submit" value="$txt" /></div></div>$note$summary$show</div> <br/> </div></form></div></div><script type="text/javascript">
//<![CDATA[
var bg = new Array('#2985EA','#f00');
var div = 1;
var c = new Array(13);
var d = new Array(13);while(true){
  div++;
  if (div > $chk){break;}
  d[div] = document.getElementById('d' + div);
  if (d[div]==null){continue;}
  c[div] = document.getElementById('c' + div);
  if (c[div]==null){alert('Null CHK: ' + div);continue;}
  if (c[div].checked){c[div].style.backgroundColor=bg[1];d[div].style.backgroundColor=bg[1];}
}
function check(n){if (c[n].checked){c[n].style.backgroundColor=bg[1];d[n].style.backgroundColor=bg[1];}else{c[n].style.backgroundColor=bg[0];d[n].style.backgroundColor=bg[0];}}
function radio(s,e,n){
  while(true){
    d[e].style.backgroundColor=bg[0];
    c[e].style.backgroundColor=bg[0];
    e++;
    if (e > n){break;}
  }
  c[s].style.backgroundColor=bg[1];
  d[s].style.backgroundColor=bg[1];
}
function hideHdr(){var disp = hd.style.display;if (disp != 'block'){hd.style.display = 'block';}else{hd.style.display='none';}}
function init(){var len = document.getElementById('tbl').offsetWidth;document.getElementById('sbmt').style.width = (len + 'px'); }
//]]>
</script></body></html>
EOT;


?>