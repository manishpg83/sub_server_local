<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$address= trim($cli[3]);
if (strlen($address) > 3){ $address .= ' ';}
$address .=  trim($cli[4]) . ' ' . trim($cli[5]) . ' ' . trim($cli[6]);
$client = "$cli[1] $cli[2] $address</p>";
$days = intval($cli[13]);
if ($days == 0) {$days = 5;}
$sortVal = $cli[19];
$statusSort = $cli[20];
$chkStatus[0] = $statusSort;
if (($statusSort & 2) > 0){$chkStatus[1] = ' checked="checked"';}
if (($statusSort & 4) > 0){$chkStatus[2] = ' checked="checked"';}
if (($statusSort & 8) > 0){$chkStatus[3] = ' checked="checked"';}
$chkSort = array_fill(1,5,'');
$chkSort[$sortVal] = 'checked="checked"';
$today = date('l, F j, Y',time());
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html>
<html>
<head><title>AMX EMR</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css" media="handheld, all" >
html,body{background:#f7f7fb;}
#page{width:100%;}
#keys{margin:0 auto 0;width:800px;}
h4{margin:.4em 0;}
.sm{font-size:.5em;color:#5bb;}
fieldset{margin:0;padding:1em;width:12em;}
input[type="radio"],input[type="checkbox"]{width:1.2em;height:1.2em;border:0px solid #eee;outline:0px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.divCheck,.divNoCheck{font-weight:700;color:#fff;width:95%;display:inline-block;padding:0px 0 0px 2px;margin:2px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:0px 0 0px 6px;margin-bottom:0px;outline:0 solid #000;}
.check{background:#f00;}
#daysValue{text-align:center;}

.none{vertical-align: middle;margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{vertical-align: middle;border-image-width:0;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.h1,.h2,.h3,.h4,.h5,.h6,.cnt{display:inline-block;}
.h1,.c1{font:700 .9em Arial,sans-serif;text-align:left;padding: 0px 2px 0px 4px;}
.h2,.c2{font:700 .9em Arial,sans-serif;text-align:left;padding: 0px 2px 0px 4px;}
.h3,.c3{font:700 .9em Arial,sans-serif;text-align:left;padding: 0px 2px 0px 4px;}
.h4,.c4{font:700 .9em Arial,sans-serif;text-align:left;padding: 0px 2px 0px 4px;}
.h5,.c5,.h5,.x5,.q5,.i5,.w5,.v5{width:200px;padding:2px 0px 2px 0px;}
.cnt{width:50px;}
.c5{border:0;padding:2.5px 2px 2.5px 2px;margin:0;color:#fff;background:#043234;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
.c6{background:#000;padding-left:6px;}
.h6,.c6,{width:60px;}
.h5,.x5,.q5{color:#f00;font-weight:700;}
.w5{color:#0f9;background:#000;}
.i5{color:#f80;background:#000;}
.v5{color:#ff0;background:#000;}
.c5{color:#fff;}
#patients{letter-spacing:-.35px;}
table{border-spacing: 0;}
td{padding:0;font-size:1em;border:0;}
tr{padding:2px 0 2px 0;}
.name{text-align:left;padding:0px 10px 0px 2px;}
.id{text-align:left;padding:0px 2px 0px 4px;}
.date{text-align:left;padding:0px 2px 0px 2px;}
.box{margin:1.2%;padding:1%;width:28%;float:left;height:275px;}
#frmtop,#frmbot{padding:.5em;margin:0;font:400 1em Arial,sans-serif;}
.label{padding:0;margin:0;}

form,button{border:0;margin:0;padding:0;border-image-width:0;}
.c6,button{width:50px;border-spacing:0;}
.c1,.c5,.h5,.x5,.q5,.i5,.w5,.v5{text-align:left;padding-left:1em;}
#note{width:1000px;height:1em;margin-bottom:.3em;}
#fgtw{text-align:right;width:100%;display:none;margin:0;background:#000;color:#0ff;}
.bold{font-weight:700;}
h2{margin-bottom:0;}
#sub,#lo,#ph,#clear,#announce,#close,#fh{font-weight:700;border:0;padding:0;margin:0;color:#fff;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
#sub,#lo,#ss,#ph,#clear,.box,#announce,#close,#fh{border:2px ridge #2392f3c9;margin-top:4px;}
#sub,#lo,#ss,#ph,#clear,#announce,#close,#fh{width:100%;font:700 1em Arial,sans-serif;padding:10px;}
#ss{color:#fff;background-image: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
.check{background:#222;margin:0 1;}
#daysValue{width:4em;font:700 1em Arial,sans-serif;}
#diet,#announceTxt{border:.5em ridge #fff;width:400px;padding:2em;background:#222;color:#fff;position: absolute;top:20em;z-index:10;display:none;}
.inline{display:inline-block;padding:.1em;font-weight:700;}
.range{display:inline-block;padding-top:0;}
#code,#name{width:95%;font:400 1em Arial,sans-serif;}
#inp{display:block;}

#announceTxt{font: 700 1em/1.5 arial,sans-serif;}
a{display:inline-block;}
a:link {color: #08f;font:400 1.2em arial,sans-serif;}
a:visited {color: #08f;font:400 1.2em arial,sans-serif;}
form,table,#frmtop,#frmbot{border:0;margin:0 auto 0 ;}
#cli{width:100%;text-align:center;}
table, th, td {
  border: 1px solid black;
  	border-collapse: collapse;
}
table {
  border-spacing: 0px;
}
</style>
</head><body>
<div id="page"><div id="keys">$ip<h4 id="cli">$id $client</h4>
<div id="frmtop">
<button id="announce" onclick="flip(1)">Announcements</button>
<div id="e1">
EOT;

include('/home/amx/public_html/announce.php');

echo <<<EOT
</div>
<form action="./login/" method="post"><input id="lo" type="submit" value="Place New Order" /><input type="hidden" name="client" value="$id" /><input type="hidden" name="sub" value="40" /></form>
<form action="logout.php"><input id="lo" type="submit" value="Log Out" /></form>
<form action="requestNew.php"><input type="hidden" name="id" value="$id" /><input id="fh"$history type="submit" value="Patient Inhalant &amp; Food History with Request Form" /></form>
</div>
<div id="frmbot"><button id="ss" type="button"  onclick="flip(2)" >Search Sort and Settings</button><div id="e2">
<form action="new.php" method="post">
<div class="box"><h3>Search Patients By:</h3>
<p class="label">Your Patient ID</p>
<input id="code" name="code" placeholder="or Begins With" value="" type="search" />
<p class="label">&#x2002;<br/>Patient Last Name</p>
<input id="name" name="name" placeholder="or Begins with" value="" type="search" />
<p class="label">&#x2002;<br/>Number of Business Days</p>
<input type="number" id="daysValue" min="1" size="2" name="d" value="$days" />
&#x2002;( 5 days / week)
<input id="sub" type="submit" value="Search" /></div>

<div class="box"><h3>Sort by:</h3>
<div id="d1"  class="divNoCheck" ><input id="c1" class="noCheck" type="radio" name="s" value="1"  onclick="radio(1,1,5)"  $chkSort[1]  />&#x2002;Patient Name</div>
<div id="d2"  class="divNoCheck" ><input id="c2" class="noCheck" type="radio" name="s" value="2"  onclick="radio(2,1,5)"  $chkSort[2]  />&#x2002;Date</div>
<div id="d3"  class="divNoCheck" ><input id="c3" class="noCheck" type="radio" name="s" value="3"  onclick="radio(3,1,5)"  $chkSort[3]  />&#x2002;Status</div>
<div id="d4"  class="divNoCheck" ><input id="c4" class="noCheck" type="radio" name="s" value="4"  onclick="radio(4,1,5)"  $chkSort[4]  />&#x2002;Lab ID</div>
<div id="d5"  class="divNoCheck" ><input id="c5" class="noCheck" type="radio" name="s" value="5"  onclick="radio(5,1,5)"  $chkSort[5]  />&#x2002;Your Patient ID</div>
</div>
<div class="box"><h3>Display the Following:</h3>
<div id="d6"  class="divNoCheck" ><input id="c6" class="noCheck" type="checkbox" name="xR" onclick="check(6)"  $chkStatus[1]  />&#x2002;Received by Lab</div>
<div id="d7"  class="divNoCheck" ><input id="c7" class="noCheck" type="checkbox" name="xT" onclick="check(7)"  $chkStatus[2]  />&#x2002;In Testing</div>
<div id="d8"  class="divNoCheck" ><input id="c8" class="noCheck" type="checkbox" name="xC" onclick="check(8)"  $chkStatus[3]  />&#x2002;Completed</div>
</div>

<input type="hidden" name="sub" value="1" />
</form></div>
EOT;

readfile ('/home/amx/public_html/announce.html');
$sort[1] = ' ORDER BY `Last` ASC, `First` ASC ';
$sort[2] = ' ORDER BY `Date` DESC,`Last` ASC, `First` ASC' ;
$sort[3] = ' ORDER BY `Status` ASC, `Last` ASC, `First` ASC ';
$sort[4] = ' ORDER BY  `Patient` DESC ';
$sort[5] = ' ORDER BY `ClientID` ASC ';
$sort = $sort[$sortVal];
$hid[0] = '<tr><td>Name</td><td>AMX Lab ID</td><td>Date</td><td>Status</td><td class="h6">Diet</td><td class="h6">Done</td></tr>';
$hid[1] = '<tr><td>Name</td><td>Your ID</td><td>Lab ID</td><td>Date</td><td>Status</td><td>Diet</button></td><td>Done</td></tr>';
$pdf['V'][1] = '<td><button class="v5"  type="button">Received';
$pdf['L'][1] = '<td><button class="v5"  type="button">Received';
$pdf['W'][1] = '<td><button class="w5"  type="button">Testing  Due: ';
$pdf['I'][1] = '<td><button class="i5"  type="button">Sendout  Due: ';
$pdf['Q'][1] = '<td><button class="q5"  type="button">QNS';
$pdf['X'][1] = '<td><button class="x5"  type="button">Void';
$pdf['H'][1] = '<td><button class="q5"  type="button">On Hold';
$pdf['C'][1] = '<td><form action="pdf.php" method="get" target="_blank"><button class="c5"  type="submit">Complete, View Results</button><input type="hidden" name="p" value="';
$pdf['V'][2] = '</button></td>';
$pdf['L'][2] = '</button></td>';
$pdf['Q'][2] = '</button></td>';
$pdf['X'][2] = '</button></td>';
$pdf['H'][2] = '</button></td>';
$pdf['W'][2] = '</button></td>';
$pdf['I'][2] = '</button></td>';
$pdf['C'][2] = '';
$statusCnt['L'] = 0;
$statusCnt['V'] = 0;
$statusCnt['W'] = 0;
$statusCnt['I'] = 0;
$statusCnt['Q'] = 0;
$statusCnt['X'] = 0;
$statusCnt['H'] = 0;
$statusCnt['C'] = 0;
$dueNeeded['V'] = 0;
$dueNeeded['L'] = 0;
$dueNeeded['Q'] = 0;
$dueNeeded['X'] = 0;
$dueNeeded['H'] = 0;
$dueNeeded['C'] = 0;
$dueNeeded['I'] = 1;
$dueNeeded['W'] = 1;
/*
62	H	
63	Q	
76	E	
145	V	
614	I	
705	X	
1342	W	
16025	L	
123316	C	

*/
$addDays['V'] = 0;
$addDays['L'] = 0;
$addDays['Q'] = 0;
$addDays['X'] = 0;
$addDays['H'] = 0;
$addDays['C'] = 0;
$addDays['I'] = 604800;
$addDays['W'] = 172800;
$covday = array(3,2,1,2,1,5,4);
$icon = array('class="none"','class="dietblack"','class="dietblue"','class="dietred"','class="none"');
$dietLink = array('','link.php','d.php','d.php','');
$diet[0] = '<td class="c6"><button ' . $icon[0] . ' type="submit"></button></td>';
$dueDate = array('','');
$name = trim($_POST['name']);
$code = trim($_POST['code']);
$adjust['W'] = array(0,0,0,0,172800,172800,0,0);
$adjDays = array(0,0,0,0,0,0,86400,172800);
$weeks = intval(($days / 5) ) ;
$days += ($weeks * 2);
$minutes = $days * 86400;
$date = time() - $minutes;
$dow = intval(date('N',$date ));
$adj = $adjDays[$dow];
$date -= $adjDays[$dow];
if (strlen($name) == 0){$date = date('Y-m-d',$date);}else{$date = '2006-03-03';}
if (strlen($name) > 0 ) {
  $where = " `Client` = $id AND `last` LIKE '$name%' AND  `Date` > '2006-03-03'";
  $type = "Patient Last Name: \"$name\" ";
  $sort = ' ORDER BY `Last` ASC, `First` ASC, `DoB` DESC';
}
elseif (strlen($code) > 0) {
  if (is_numeric($code) && $code > 100000 && $code < 999999 ){
    $where = " `Client` = $id  AND  `Date` > '2006-03-03'  AND (`ClientID` LIKE '$code%' || `Patient` = $code) ";
  }
  else{
    $where = " `Client` = $id  AND  `Date` > '2006-03-03'  AND `ClientID` LIKE '$code%' ";
  }
  $type = "Your ID: \"$code\" ";
}
else{
  $where = " `Client` = $id AND `Date` > '$date' ";
  $notFound = '';//"<h2>No patients Found between Today and $date</h2>";
  $type = '';// 'Patients between Today and ' . date('l, F j, Y',strtotime($date));
}

$cid = 1;
$SQL = "SELECT COUNT(`Status`),`Status` FROM `Patient` WHERE $where GROUP BY `Status` ";
$results = @mysqli_query($dbc,$SQL);
$error = mysql_error();
while ($row = @mysqli_fetch_array($results, MYSQLI_NUM)) {$statusCnt[$row[1]] = $row[0];}
$statusCnt['R'] = $statusCnt['L'] + $statusCnt['V'];
$statusCnt['T'] = $statusCnt['W'] + $statusCnt['I'];
$sql = "SELECT SQL_CALC_FOUND_ROWS `Client`, `Patient`, `Date`, `Status`, `Link`, `ClientID`, `Last`, `First`,`Attributes`, `DoB`,`Done` FROM `Patient` WHERE $where $sort";
$results = @mysqli_query($dbc,$sql);
$error = mysql_error();
$rows = @mysqli_num_rows($results);
$more = @mysqli_query($dbc,"SELECT FOUND_ROWS()");
if ($rows == 0){echo "<h4>No $type</h4></div>";}
else {
  $moreRows = mysqli_fetch_array($more, MYSQLI_NUM);
  $show = '';//"<p>$type<br/>$moreRows[0] Patients Found: " . $statusCnt['C'] . ' Complete, '  . $statusCnt['T'] . ' Testing, '  . $statusCnt['R'] . ' Received' ;
  if ($rows == 200) {
    $moreRows[0] -= 200;
    $show .= "<br/>200 Patients Shown";
  }
  echo "$show</p></div>";
  echo '<div id="note"><p id="fgtw"><span class="bold">FGTW</span> is the number of tested <span class="bold">F</span>ood, <span class="bold">G</span>rass, <span class="bold">T</span>ree, and <span class="bold">W</span>eed allergens.  Used by Diet&#x2003;</p></div><div id="diet"><div class="dietblack"></div><p class="inline"> &#x2003;Black: diet report not generated.</p><br/><div class="dietblue"></div><p class="inline"> &#x2003;Blue: Diet Report previously generated</p><br/><div class="dietred"></div><p class="inline"> &#x2003;Red: Multiple result reports linked</p><br/><div class="none"></div><p class="inline"> &#x2003; No Food, Grass, Tree, or Weed found for diet</p></div><div id="patients"><table id="tbl">' . $hid[$cid];
  ob_flush();
  $checked = array('',' checked="checked"');
  $bg = array(' class="divNoCheck" ',' class="divCheck" ');
  $exStatus['X'] = true;
  while ($row = @mysqli_fetch_array($results, MYSQLI_NUM)) {//list($Client, $Patient, $Date, $Status, $Link, $ClientID, $Last, $First, $Attributes, $DoB, $Done) = $row;
    if ($exStatus[$row[3]]){continue;}
    $time = strtotime($row[2]);
    $date = date('M j, Y',$time );
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[1] AND (`Type` = 7 OR `Type` = 8)  ";
    $result = mysqli_query($dbc,$sql);
    list($covid) = @mysqli_fetch_array($result, MYSQLI_NUM);
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[1]  AND `Code` LIKE 'F%' ";
    $result = mysqli_query($dbc,$sql);
    $cnt = @mysqli_fetch_array($result, MYSQLI_NUM);
    $i = $row[8];
    if ($cnt[0] > 0 ){$i++; if ($row[4] > 0){$i++;}}
    $dow = intval(date('N',$time ));
	if ($covid > 0){
	  $due = strtotime(date("Y-m-d",strtotime(date('Y-m-d',$time) . ' + '. $covday[intval(date('w',$time))] . 'days')));
	}
	else{
      $due = $time + $addDays[$row[3]] + intval($adjust[$row[3]][$dow]);
	}
    $dueDate[1] = date('D m-d-y',$due );
    $pdf['C'][2] = $row[1] . '" /></form></td>';
    $id = $row[5];
    $check = $checked[$row[10]];
    $idRow[1] = '<td class="id">' . $id . '</td>';
    if ( $row[2] < '2009-07-27'){
      $status[0] = '<td><button class="q5"  type="button">Call Allermetrix';
    }
    else{
      $status[0] =  $pdf[$row[3]][1] . $dueDate[$dueNeeded[$row[3]]] .  $pdf[$row[3]][2];
    }
    $dietColumn = '<td><form action="' . $dietLink[$i] . '" method="post" target="_blank"><input type="hidden" name="sub" value="1" /><input type="hidden" name="p" value="' . $row[1] . '" /><input type="hidden" name="link" value="' . $row[4] . '" /> <button ' . $icon[$i] . ' type="submit"></button></form></td>';
    $class = $bg[$row[10]];
    echo <<<EOT
<tr><td class="name">$row[6], $row[7]</form></td>$idRow[$cid]<td class="id">$row[1]</td><td class="date">$date</td>$status[0]$dietColumn<td><div id="d$row[1]" $class>&#x2009;<input id="c$row[1]" type="checkbox" name="" value="" $check /></div></td></tr>

EOT;

  }
  echo '</table></div>';

}
 $t = number_format((microtime(true) - $startTime),3);

echo <<<EOT
</div><span class="sm">$t</span></div>
<script>
//<![CDATA[
var exp = [null,null,null];
var toggle = new Array();
toggle[''] = 'block';
toggle[null] = 'block';
toggle['none'] = 'block';
toggle['block'] = 'none';
exp[1] = document.getElementById('e1');
exp[2] = document.getElementById('e2');


exp[1].style.display = 'none';
exp[2].style.display = 'none';

var xPos = 0, yPos = 0, mouseX = 0, mouseY = 0;
var bg = new Array('#2985EA','#f00');var div = 0;var c = new Array(8);var d = new Array(8);
while(true){div++;if (div > 8){break;}
d[div] = document.getElementById('d' + div);if (d[div]==null){continue;}c[div] = document.getElementById('c' + div);if (c[div]==null){alert('Null CHK: ' + div);continue;}if (c[div].checked){c[div].style.backgroundColor=bg[1];d[div].style.backgroundColor=bg[1];}}
function check(n){if (c[n].checked){c[n].style.backgroundColor=bg[1];d[n].style.backgroundColor=bg[1];}else{c[n].style.backgroundColor=bg[0];d[n].style.backgroundColor=bg[0];}}
function radio(s,e,n){while(true){d[e].style.backgroundColor=bg[0];c[e].style.backgroundColor=bg[0];e++;if (e > n){break;}}c[s].style.backgroundColor=bg[1];d[s].style.backgroundColor=bg[1];}
function mouseOverFGTW(){document.getElementById('fgtw').style.display='block';}
function mouseOverDiet(){document.getElementById('diet').style.display='block';}
function mouseOutDiet(){document.getElementById('diet').style.display='none';}
function flip(id){exp[id].style.display = toggle[exp[id].style.display];}


function ontap(e){
  var diet = document.getElementById('diet');
  if (!e) var e = window.event;
  if (e.pageX || e.pageY) {mouseX = e.pageX;mouseY = e.pageY;}
  else if (e.clientX || e.clientY) {mouseX = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;mouseY = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;}
  var s = document.documentElement.scrollTop;
  var th = diet.offsetHeight ;
  var tw = diet.offsetWidth ;
//  tw += 50;
  mouseX -= tw;
  diet.style.left = mouseX + 'px' ;
  if (mouseY > (th + s)) {mouseY -= th;}
  diet.style.top = mouseY + 'px' ;
  diet.style.display = "block";
 // alert('s: ' + s + '\u000A mouseX: ' + mouseX + '\u000A mouseY: ' + mouseY + '\u000A tap y: ' + mouseY + '\u000A tap height=' + th );
  return false;

}
function chk(id){
var c = document.getElementById('c' + id).checked;
var v = 0;
if(c){v = 1;}
document.getElementById('d' + id).style.backgroundColor  = bg[v];
  xmlhttp=null;
  var Url="postResult.php"
  if (window.XMLHttpRequest) {  // Fuckin\' Microsoft!
      xmlhttp=new XMLHttpRequest();
  }
  else if (window.ActiveXObject) { // Fuck Fuckin\' Microsoft!
     xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (xmlhttp!=null) {
     xmlhttp.open("POST", Url, true);
     xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
     xmlhttp.send( "p=" + id + "&c=" + v ); 
  } else {
     alert("UNEXPECTED ERROR: XMLHttpRequest not supported");
  }
}
//]]>
</script></body></html>
EOT;
?>