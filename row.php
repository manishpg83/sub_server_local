<?php
$ip =  $_SERVER['REMOTE_ADDR'];
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=900');
$date = date('l, F j, Y',time());
//$client = preg_replace("/\D/", "", $_POST['c']);
$client = intval($_COOKIE['amxc']);
$id = $client;
setcookie("amxc", $client,time()+900);
//if ($client < 100000){include('/home/amx/public_html/index.php');return;}
echo <<<EOT
<!DOCTYPE html>
<html>
<head><title>AMX EMR</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css" media="handheld, all" >
html,body{background:#6CC;}
@media only screen and (min-width : 1024px) {table,tr,#keys{max-width:540px;}#page{max-width:600px;}}
@media only screen and (min-width : 768px) and (max-width : 1023px) {table,tr,#keys{max-width:540px;}#page{max-width:600px;}}
@media only screen and (max-width : 767px) {table,tr,#keys{width:100%;padding:.5em 0 2em 0;}}
table{min-width:100%}
.none{margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{border-image-width:0;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.h1,.h2,.h3,.h4,.h5,.h6,.cnt{height:40px;display:inline-block;}
.h1,.c1{width:15em;}
.h2,.c2{width:7em;}
.h3,.c3{width:7em;}
.h4,.c4{width:8em;}
.h5,.c5,.h5,.x5,.q5,.i5,.w5,.v5{width:18em;}
.h6,.c6,.cnt{width:50px;}
.c1,.c2,.c3,.c4,.c5,.c6,.h5,.x5,.q5,.i5,.w5,.v5,.cnt{border:0;padding:0;margin:0;color:#fff;background:#043234;
background-image: -o-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -moz-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -webkit-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -ms-linear-gradient(bottom, #555 0%, #111 100%);
background-image: linear-gradient(to bottom, #555 0%, #111 100%);}
.h5,.x5,.q5{color:#f00;}
.w5{color:#0f9;}
.i5{color:#f80;}
.v5{color:#ff0;}
.c5{color:#3bf;}
.h1,.h2,.h3,.h4,.h5,.h6{font-weight:700;border:0;padding:0;margin:0;color:#fff;background:#66CCCC;
background-image: -o-linear-gradient(bottom, #1E504E 0%, #043234 100%);
background-image: -moz-linear-gradient(bottom, #1E504E 0%, #043234 100%);
background-image: -webkit-linear-gradient(bottom, #1E504E 0%, #043234 100%);
background-image: -ms-linear-gradient(bottom, #1E504E 0%, #043234 100%);
background-image: linear-gradient(to bottom, #1E504E 0%, #043234 100%);}
td,tr{border:0;padding:0;margin:0;height:40px;}
form,button{border:0;margin:0;padding:0;border-image-width:0;}
.c6,button,form{width:50px;height:40px;border-spacing:0;}
.row{height:40px;}
.c1,.c5,.h5,.x5,.q5,.i5,.w5,.v5{text-align:left;padding-left:1em;}
#note{width:1000px;height:1em;margin-bottom:.3em;}
#fgtw{text-align:right;width:100%;display:none;margin:0;background:#000;color:#0ff;}
.bold{font-weight:700;}
h2{margin-bottom:0;}
</style>
</head><body>
<div id="page"><h2>$client<br/>Today: $date</h2><div id="keys">
<div id="note"><p id="fgtw"><span class="bold">FGTW</span> is the number of tested <span class="bold">F</span>ood, <span class="bold">G</span>rass, <span class="bold">T</span>ree, and <span class="bold">W</span>eed allergens.  Used by Diet&#x2003;</p></div>
<table>
EOT;
$hid[0] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >AMX Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td><button class="h6"  type="button" name="sn6" onmouseout="mouseOutFGTW()" onmouseover="mouseOverFGTW()" >FGTW</button></td><td><button class="h6"  type="button" name="sn6" onclick="stNum(6)" >Diet</button></td></tr>';
$hid[1] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h2"  type="button" name="sn2" onclick="stNum(2)" >Patient ID</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >AMX Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td><button class="h6"  type="button" name="sn6" onmouseout="mouseOutFGTW()" onmouseover="mouseOverFGTW()" >FGTW</button></td><td><button class="h6"  type="button" name="sn6" onclick="stNum(6)" >Diet</button></td></tr>';
$pdf['V'][1] = '<td><button class="v5"  type="button">Received';
$pdf['L'][1] = '<td><button class="v5"  type="button">Received';
$pdf['W'][1] = '<td><button class="w5"  type="button">Testing  Due: ';
$pdf['I'][1] = '<td><button class="i5"  type="button">Sendout  Due: ';
$pdf['Q'][1] = '<td><button class="q5"  type="button">QNS';
$pdf['X'][1] = '<td><button class="x5"  type="button">Void';
$pdf['H'][1] = '<td><button class="h5"  type="button">On Hold';
$pdf['C'][1] = '<td><form action="https://dev.amxemr.com/pdf.php" method="get" target="_blank"><button class="c5"  type="submit">Complete ( PDF )</button><input type="hidden" name="p" value="';
$pdf['V'][2] = '</button></td>';
$pdf['L'][2] = '</button></td>';
$pdf['Q'][2] = '</button></td>';
$pdf['X'][2] = '</button></td>';
$pdf['H'][2] = '</button></td>';
$pdf['W'][2] = '</button></td>';
$pdf['I'][2] = '</button></td>';
$pdf['C'][2] = '';
$dueNeeded['V'] = 0;
$dueNeeded['L'] = 0;
$dueNeeded['Q'] = 0;
$dueNeeded['X'] = 0;
$dueNeeded['H'] = 0;
$dueNeeded['C'] = 0;
$addDays['V'] = 0;
$addDays['L'] = 0;
$addDays['Q'] = 0;
$addDays['X'] = 0;
$addDays['H'] = 0;
$addDays['C'] = 0;

$dueNeeded['I'] = 1;
$dueNeeded['W'] = 1;
$addDays['I'] = 604800;
$addDays['W'] = 172800;
$icon = array('class="none"','class="dietblack"','class="dietblue"','class="dietred"','class="none"');
$dietLink = array('','link.php','d.php','d.php','');
$diet[0] = '<td class="c6"><button ' . $icon[0] . ' type="submit"></button></td>';
$dueDate = array('','');
$name = trim($_POST['name']);
$code = trim($_POST['code']);
$adjust['W'] = array(0,0,0,0,172800,172800,0,0);
if (isset($_POST['daysOn'])){
  $days = intval($_POST['d']);
  if ($days > 0){
    $days *= 86400;
  }
  else{
    $days = 7 * 86400;
  }
  $date = date('Y-m-d',time()-$days);
}
else{
   $date = '2006-03-03';
}
  $dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510'); @mysqli_select_db($dbc,'amx_portal');
 if (strlen($name) > 0 ) {
  $where = " `Client` = $client AND `last` LIKE '$name%' AND  `Date` > '$date' ORDER BY `Last` ASC LIMIT 200 ";
  $searchType = 1;
  $type = "Name: $name ";
  $termLength = 1;
}
elseif (strlen($code) > 0) {
  $where = " `Client` = $client   AND `Date` > '$date'   AND  (`ClientID` LIKE '$code%' || `Patient` LIKE '$code%')  LIMIT 200 ";
  $searchType = 2;
  $type = "Patient ID: $code ";
  $termLength = strlen($code);
}
else{
  $where = " `Client` = $client AND `Date` > '$date' ORDER BY `Last` ASC, `First` ASC  ";

  $sql = "SELECT COUNT(`ClientID`),`ClientID` FROM `Patient` WHERE $where ";
}
echo "<h4>$where</h4>";
$sql = "SELECT COUNT(`ClientID`),`ClientID` FROM `Patient` WHERE $where ";
$results = @mysqli_query($dbc,$sql);
$rows = @mysqli_num_rows($results);
$row = mysqli_fetch_array($results, MYSQLI_NUM);
$len = strlen(trim($row[1]));
$cntID = $row[1];
if ($rows == 1 && (strlen(trim($row[1])) < 1)){$cid = 0;}else{$cid = 1;}
echo $hid[$cid];
//  $sql = "SELECT `Client`, `Patient`, `Date`, `Status`, `Link`, `ClientID`, `Last`, `First`,`Attributes` FROM `Patient` WHERE `Client` = $client AND `Date` > '$date' ORDER BY `Last` ASC, `First` ASC  ";
$sql = "SELECT `Client`, `Patient`, `Date`, `Status`, `Link`, `ClientID`, `Last`, `First`,`Attributes` FROM `Patient` WHERE $where";

$results = @mysqli_query($dbc,$sql);
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
    $time = strtotime($row[2]);
	$date = date('M j, Y',$time );
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[1]  AND (`Code` LIKE 'F%' || `Code` LIKE 'T%' || `Code` LIKE 'G%' || `Code` LIKE 'W%')";
    $result = mysqli_query($dbc,$sql);
    $cnt = mysqli_fetch_array($result, MYSQLI_NUM);
	$i = $row[8];
    if ($cnt[0] > 0 ){$i++; if ($row[4] > 0){$i++;}}
    $dow = intval(date('N',$time ));
    $due = $time + $addDays[$row[3]] + intval($adjust[$row[3]][$dow]);
    $dueDate[1] = date('M j, Y ( D )',$due );
	$pdf['C'][2] = $row[1] . '" /></form></td>';
$id = $row[5]; 
$idRow[1] = '<td><button class="c2"  type="button" name="sn2" onclick="stNum(2)" >' . $id . '</button></td>';
$idRow[0] = "";
$status[0] =  $pdf[$row[3]][1] . $dueDate[$dueNeeded[$row[3]]] .  $pdf[$row[3]][2];
$dietColumn = '<td class="c6"><form action="' . $dietLink[$i] . '" method="post" target="_blank"><input type="hidden" name="sub" value="1" /><input type="hidden" name="p" value="' . $row[1] . '" /><input type="hidden" name="link" value="' . $row[4] . '" /> <button ' . $icon[$i] . ' type="submit"></button></form></td>';


echo <<<EOT
<tr>
<td><button class="c1"  type="button" name="sn1" onclick="stNum(1)" >$row[6], $row[7]</button></td>
$idRow[$cid]
<td><button class="c3"  type="button" name="sn3" onclick="stNum(3)" >$row[1]</button></td>
<td><button class="c4"  type="button" name="sn4" onclick="stNum(4)" >$date</button></td>
$status[0]
<td><button class="cnt"  type="button" name="sn7" onclick="stNum(5)" >$cnt[0]</button></td>
$dietColumn
</tr>
EOT;

$out[] = $sql;
}
//$show = "<br><br><pre>" . var_export($out,true)  . '</pre><br/>';
echo <<<EOT
</table>$show</div></div>
<script type="text/javascript">
//<![CDATA[
function mouseOverFGTW(){document.getElementById('fgtw').style.display='block';}
function mouseOutFGTW(){document.getElementById('fgtw').style.display='none';}
//]]>
</script></body></html>
EOT;
$days /= 86400;
@mysqli_query($dbc,"UPDATE `Client` SET `days` = $days WHERE `Number`=$client ");

?>