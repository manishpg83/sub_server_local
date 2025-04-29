<?php 
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx',$data);
mysql_select_db('amx_portal');
$sub = intval($_POST['sub']);
if(file_exists('/home/amx/public_html/login/done.txt')){
  $data = file_get_contents('/home/amx/public_html/login/done.txt');
  list($code,$client) = explode('|',$data);
}
$accession = intval($_GET['accession']);

if($code == $accession){
  $sql =  "SELECT *  FROM `Client` WHERE `Number` = $client LIMIT 1";
  $results = mysqli_query($link,$sql);
  $cli = mysqli_fetch_array($results, MYSQLI_NUM);
  list($Number,$Name,$Address,$Address2,$City,$State,$PostalCode,$Contact,$Phone,$Email,$Mobile,$Fax,$RecordsCRC,$days,$ip,$LastVisit,$Updated,$Logout,$Session,$Sort,$StatusSort,$Diet,$passcode,$login) = $cli;
  $_POST['d'] = $days;
  $sub = 2;
}
//echo "$code == $accession, client: $client\n";exit;


$error = mysql_error();

if ($sub == 9){
  $id = intval($_POST['id']);
  mysql_query("UPDATE `Patient` SET `Attributes`=0,`Link`=0 WHERE `Client` = $id");
  $sub = 0;
}
if ($sub == 0){
  $passcode = trim($_GET['p']);
  $passcodeh = trim($_POST['pwh']);
  $passcode = trim($_POST['pw']);
  if (strlen($passcodeh) > strlen($passcode)){
    $passcode = $passcodeh;
  }
  $SAVE_ID = intval($_POST['id']);
  if ($SAVE_ID == 0 && strlen($passcode) == 12) {
    $id = substr($passcode,3,6);
  }
  else {
    $id = $SAVE_ID;
  }
  $ip =  $_SERVER['REMOTE_ADDR'];
  if ((hash('ripemd320',$passcode) == '6732f3c024fe3c3c1ccd7dbe5d0fa7d4a53c516f800707bb86a9017c1e1646d9d4a2d7adc56a505d') ){ //&& (substr($ip,0,11)  == '128.30.52.7' || $ip == '99.3.150.55' || $ip == '173.162.23.21' || $ip == '70.197.160.30')){
    $admin = true;
    $clear = '<div id="sc"><form action="enter.php" method="post"><input type="hidden" name="id" value="' . $SAVE_ID . '"><input type="hidden" name="sub" value="9"><button id="clear">Reset Diet Icons</button></form></div>';  
  }
  if ((hash('ripemd320',$passcode) == '437bf7176d5a94fc47b4b04d39fe431a5fba023647eb982c51d7b3bdba8289478877004a0c136a0a') ){ //&& (substr($ip,0,11)  == '128.30.52.7' || $ip == '99.3.150.55' || $ip == '173.162.23.21' || $ip == '70.197.160.30')){
    $admin = true;
    $clear = '<div id="sc"><form action="enter.php" method="post"><input type="hidden" name="id" value="' . $SAVE_ID . '"><input type="hidden" name="sub" value="9"><button id="clear">Reset Diet Icons</button></form></div>';  
  }
  $sql = "SELECT COUNT(*)  FROM `Banned` WHERE `ip` LIKE '$ip'";
  $results = mysql_query($sql);
  $row = mysql_fetch_array($results, MYSQL_NUM);
  if ($row[0] > 0){include '404.shtml';return;}
  $pass = false;
  $error = 1;
  $hash = hash('ripemd320',$passcode);
  $sql =  "SELECT *  FROM `Client` WHERE `Number` = $id LIMIT 1";
  $results = mysql_query($sql);
  $error = mysql_error();
  $rows = mysql_num_rows($results);
  if (strlen($error) == 0 && $rows == 1) {
    $clientNumber = $id;
    $cli = mysql_fetch_array($results, MYSQL_NUM);
    list($Number,$Name,$Address,$Address2,$City,$State,$PostalCode,$Contact,$Phone,$Email,$Mobile,$Fax,$RecordsCRC,$ip,$LastVisit,$Updated,$Logout,$Session,$Sort,$StatusSort,$Diet,$passcode,$login) = $cli;

    if ($cli[12] == $hash || $admin === true || ($id == 888887  && ($passcode = 'allermetrix' || $passcode = 'allermetrics'))) {
      $pass = true;
      $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($id, CURRENT_TIMESTAMP, '$ip', 1, 0, 1, '');";
      @mysql_unbuffered_query($sql);
    }
    else {
      $txt = $id . ' - ' . $passcode;
      $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($id, CURRENT_TIMESTAMP, '$ip', 1, 0, 0, '$txt');";
      @mysql_unbuffered_query($sql);
      $pass = false;
      $error = 4;
      $f = 1;
      $p = $passcode;
      $db = $cli[12];
    }
  }
  else{
    $pass = false;
    $error = 2;
    $f = 2;
    $cli[1] = "ERROR 1: $rows E=$error";
  }
  if ($admin === true) {
    $pass = true ;
  }
  if ($pass === true) {
    $terms = 'true';
    $d =  date('DMjYHisa') .  microtime(true);
    $seed = $_SERVER['REMOTE_ADDR'] . $d;
    $sid = substr(hash('ripemd320',$seed),1,16);
    session_cache_limiter('private');
    session_cache_expire(5);
    session_name('amxs');
    session_id($sid);
    session_start( );
    setcookie("amxc", $id,time()+3600,'/');
    setcookie(session_name('amxs'), '', time() + 3600);
    $link = "logout.php";
    $action = "Log Out";
    $days = intval($cli[13]);
    if ($days == 0) {$days = 5;}
    $sortVal = $cli[19];
    $statusSort = $cli[20];
    $chkStatus[0] = $statusSort;
    if (($statusSort & 2) > 0){$chkStatus[1] = ' checked="checked"';}
    if (($statusSort & 4) > 0){$chkStatus[2] = ' checked="checked"';}
    if (($statusSort & 8) > 0){$chkStatus[3] = ' checked="checked"';}
  }
  else {
     header("Location: https://dev.amxemr.com");exit; 
  }
}
else{

  $id = intval($_COOKIE['amxc']);
  if ($id < 100000){header("Location: https://dev.amxemr.com");exit;} 
  setcookie("amxc", $id,time()+3600,'/');
  if ($sub == 4){
    $name = $_POST['name'];
  }
  elseif ($sub == 2){
    $sortVal = $cli[19];
    $statusSort = $cli[20];
    $chkStatus[0] = $statusSort;
    if (($statusSort & 2) > 0){$chkStatus[1] = ' checked="checked"';}
    if (($statusSort & 4) > 0){$chkStatus[2] = ' checked="checked"';}
    if (($statusSort & 8) > 0){$chkStatus[3] = ' checked="checked"';}
 }
  else{
    $days = intval($_POST['d']);
    if ($days == 0) {$days = 5;}
    $exStatus['R'] = true;
    $exStatus['L'] = true;
    $exStatus['V'] = true;
    $exStatus['T'] = true;
    $exStatus['W'] = true;
    $exStatus['I'] = true;
    $exStatus['Q'] = false;
    
    $exStatus['H'] = false;
    $exStatus['C'] = true;
    $chkTrans['R'] = 1;
    $chkTrans['T'] = 2;
    $chkTrans['C'] = 3;
    $exVal = 0;
    foreach($_POST as $k => $v){
      if (substr($k,0,1)=='x'){
        $ndx = substr($k,1,1);
        $exStatus[$ndx] = false;
        $chkStatus[$chkTrans[$ndx]] = 'checked="checked"' ;
        $exVal += pow(2,$chkTrans[$ndx]);
      }
    }
    $exStatus['W'] = $exStatus['T'];
    $exStatus['I'] = $exStatus['T'];
    $exStatus['L'] = $exStatus['R'];
    $exStatus['V'] = $exStatus['R'];
    $statusSort = intval($_POST['ss']);
    $sortVal = intval($_POST['s']);
    @mysql_unbuffered_query("UPDATE `Client` SET `days` = $days, `Sort`=$sortVal, `StatusSort`=$exVal WHERE `Number`=$id ");
  }
  $sql =  "SELECT *  FROM `Client` WHERE `Number` = $id LIMIT 1";
  $results = mysql_query($sql);
  $error = mysql_error();
  $rows = mysql_num_rows($results);
  if (strlen($error) == 0 && $rows == 1) {
    $cli = mysql_fetch_array($results, MYSQL_NUM);
	$history = ' class="nothidden" ';
	$sql = "SELECT `id` FROM `history` WHERE `client` = $id";
    $results = mysql_query($sql);
    if(mysql_errno() == 0 && mysql_num_rows($results) == 0){$history = ' class="hide" ';}
  }
}

//if($ip == '173.169.76.167'){include('/home/amx/public_html/new.php');exit;}
//if($ip == '173.162.23.21'){include('/home/amx/public_html/new.php');exit;}


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
html,body{background:#6CC;}
h4{margin:.4em 0;}
.sm{font-size:.5em;color:#5bb;}
fieldset{margin:0;padding:1em;width:12em;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.divCheck,.divNoCheck{font-weight:700;color:#fff;width:95%;display:inline-block;padding:2px 0 2px 2px;margin:2px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
@media only screen and (min-width : 1024px) {table,tr,#keys{max-width:850px;}}}
@media only screen and (min-width : 768px) and (max-width : 1023px) {table,tr,#keys{max-width:850px;}}
@media only screen and (max-width : 767px) {#page,table,tr,#keys{width:100%;}}
#daysValue{text-align:center;}
#page{width:100%;}
#keys{margin:0 auto 0;}
.none{vertical-align: middle;margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{vertical-align: middle;border-image-width:0;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.h1,.h2,.h3,.h4,.h5,.h6,.cnt{height:40px;display:inline-block;}
.h1,.c1{width:15em;}
.h2,.c2{width:7em;}
.h3,.c3{width:7em;}
.h4,.c4{width:8em;}
.h5,.c5,.h5,.x5,.q5,.i5,.w5,.v5{width:18em;}
.cnt{width:50px;}
.c1,.c2,.c3,.c4,.c5,.h5,.x5,.q5,.i5,.w5,.v5,.cnt{border:0;padding:0;margin:0;color:#fff;background:#043234;
background-image: -o-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -moz-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -webkit-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -ms-linear-gradient(bottom, #555 0%, #111 100%);
background-image: linear-gradient(to bottom, #555 0%, #111 100%);}
.c6{background:#000;padding-left:6px;}
.h6,.c6,{width:60px;}
.h5,.x5,.q5{color:#f00;font-weight:700;}
.w5{color:#0f9;}
.i5{color:#f80;}
.v5{color:#ff0;}
.c5{color:#3bf;}
.h1,.h2,.h3,.h4,.h5,.h6,#sub,#lo,#ss,#ph,#clear,#announce,#close,#fh{font-weight:700;border:0;padding:0;margin:0;color:#fff;background:#66CCCC;
background-image: -o-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -moz-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -webkit-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -ms-linear-gradient(bottom, #164 0%, #033 100%);
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
#sub,#lo,#ss,#ph,#clear,.box,#announce,#close,#fh{border:2px ridge #6cc;margin-top:4px;}
.box{margin:1.2%;padding:1%;width:28%;float:left;}
#frmtop,#frmbot{padding:.5em;margin:0;background:#144;color:#69B5B3;font:700 1em Arial,sans-serif;}
.label{padding:0;margin:0;}
td,tr{border:0;padding:0;margin:0;height:40px;}
form,button{border:0;margin:0;padding:0;border-image-width:0;}
.c6,button{width:50px;height:40px;border-spacing:0;}
.row{height:40px;}
.c1,.c5,.h5,.x5,.q5,.i5,.w5,.v5{text-align:left;padding-left:1em;}
#note{width:1000px;height:1em;margin-bottom:.3em;}
#fgtw{text-align:right;width:100%;display:none;margin:0;background:#000;color:#0ff;}
.bold{font-weight:700;}
h2{margin-bottom:0;}
#sub,#lo,#ss,#ph,#clear,#announce,#close,#fh{width:100%;font:700 1em Arial,sans-serif;padding:.25em;}
.check{background:#222;margin:0 1;}
#daysValue{width:4em;font:700 1em Arial,sans-serif;}
#diet,#announceTxt{border:.5em ridge #fff;width:400px;padding:2em;background:#222;color:#fff;position: absolute;top:20em;z-index:10;display:none;}
.inline{display:inline-block;padding:.1em;font-weight:700;}
.range{display:inline-block;padding-top:0;}
#code,#name{width:95%;font:700 1em Arial,sans-serif;}
#inp{display:block;}
#ss{display:none;}
#announceTxt{font: 700 1em/1.5 arial,sans-serif;}
a{display:inline-block;}
a:link {color: #08f;font:400 1.2em arial,sans-serif;}
a:visited {color: #08f;font:400 1.2em arial,sans-serif;}
form,table,#frmtop,#frmbot{border:0;margin:0 auto 0 ;}
#cli{width:100%;text-align:center;}
</style>
</head><body onload="init()">$session
<div id="page"><div id="keys"><h4 id="cli">$id $client</h4>
<div id="frmtop">
<button id="announce" onclick="showAnnounce()">Announcement</button>
<form action="logout.php"><input id="lo" type="submit" value="Log Out" /></form>
<form action="requestForm.php"><input type="hidden" name="id" value="$id" /><input id="fh"$history type="submit" value="Patient Inhalant &amp; Food History with Request Form" /></form>
</div>
<div id="frmbot"><div id="inp">
<form action="enter.php" method="post">
<div class="box"><h3>Search Patients By:</h3>
<p class="label">Client Patient ID</p>
<input id="code" name="code" placeholder="or Begins With" value="" type="search" />
<p class="label">&#x2002;<br/>Patient Last Name</p>
<input id="name" name="name" placeholder="or Begins with" value="" type="search" />
<p class="label">&#x2002;<br/>Number of Business Days</p>
<input type="number" id="daysValue" min="1" size="2" name="d" value="$days" />
&#x2002;( 5 days / week)</div>
<div class="box"><h3>Sort by:</h3>
<div id="d1"  class="divNoCheck" ><input id="c1" class="noCheck" type="radio" name="s" value="1"  onclick="radio(1,1,5)"  $chkSort[1]  />&#x2002;Patient Name</div>
<div id="d2"  class="divNoCheck" ><input id="c2" class="noCheck" type="radio" name="s" value="2"  onclick="radio(2,1,5)"  $chkSort[2]  />&#x2002;Date</div>
<div id="d3"  class="divNoCheck" ><input id="c3" class="noCheck" type="radio" name="s" value="3"  onclick="radio(3,1,5)"  $chkSort[3]  />&#x2002;Status</div>
<div id="d4"  class="divNoCheck" ><input id="c4" class="noCheck" type="radio" name="s" value="4"  onclick="radio(4,1,5)"  $chkSort[4]  />&#x2002;AMX Lab ID</div>
<div id="d5"  class="divNoCheck" ><input id="c5" class="noCheck" type="radio" name="s" value="5"  onclick="radio(5,1,5)"  $chkSort[5]  />&#x2002;Client Patient ID</div>
</div>
<div class="box"><h3>Display the Following:</h3>
<div id="d6"  class="divNoCheck" ><input id="c6" class="noCheck" type="checkbox" name="xR" onclick="check(6)"  $chkStatus[1]  />&#x2002;Received by Lab</div>
<div id="d7"  class="divNoCheck" ><input id="c7" class="noCheck" type="checkbox" name="xT" onclick="check(7)"  $chkStatus[2]  />&#x2002;In Testing</div>
<div id="d8"  class="divNoCheck" ><input id="c8" class="noCheck" type="checkbox" name="xC" onclick="check(8)"  $chkStatus[3]  />&#x2002;Completed</div>
</div>
<input id="sub" type="submit" value="Search" /></div>
<input type="hidden" name="sub" value="1" />
</form>$clear<button id="ss" type="button"  onclick="showSearch()" >Show Search</button>
EOT;
flush();

ob_flush();
readfile ('/home/amx/public_html/announce.html');
$sort[1] = ' ORDER BY `Last` ASC, `First` ASC ';
$sort[2] = ' ORDER BY `Date` DESC,`Last` ASC, `First` ASC' ;
$sort[3] = ' ORDER BY `Status` ASC, `Last` ASC, `First` ASC ';
$sort[4] = ' ORDER BY  `Patient` DESC ';
$sort[5] = ' ORDER BY `ClientID` ASC ';
$sort = $sort[$sortVal];
$hid[0] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >AMX Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td class="h6"><button class="h6" type="button" name="sn6" onmouseover="ontap(event)"  onmouseout="mouseOutDiet()" >Diet</button></td><td class="h6"><button class="h6" type="button" name="sn7" >Done</button></td></tr>';
$hid[1] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h2"  type="button" name="sn2" onclick="stNum(2)" >Patient ID</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >AMX Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td><button class="h6"  type="button" name="sn6" onmouseover="mouseOverDiet()"  onmouseout="mouseOutDiet()" >Diet</button></td><td><button class="h6" type="button" name="sn7" >Done</button></td></tr>';
$pdf['V'][1] = '<td><button class="v5"  type="button">Received';
$pdf['L'][1] = '<td><button class="v5"  type="button">Received';
$pdf['W'][1] = '<td><button class="w5"  type="button">Testing  Due: ';
$pdf['I'][1] = '<td><button class="i5"  type="button">Sendout  Due: ';
$pdf['Q'][1] = '<td><button class="q5"  type="button">QNS';
$pdf['X'][1] = '<td><button class="x5"  type="button">Void';
$pdf['H'][1] = '<td><button class="q5"  type="button">On Hold';
$pdf['C'][1] = '<td><form action="pdf.php" method="get" target="_blank"><button class="c5"  type="submit">Complete ( PDF )</button><input type="hidden" name="p" value="';
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
  $type = "Patient ID: \"$code\" ";
}
else{
  $where = " `Client` = $id AND `Date` > '$date' ";
  $notFound = "<h2>No patients Found between Today and $date</h2>";
  $type = 'Patients between Today and ' . date('l, F j, Y',strtotime($date));
}
//$where .= ' LIMIT 200 ';
/*
$idRow[0] = "";
$SQL = "SELECT COUNT(`ClientID`),`ClientID` FROM `Patient` WHERE $where ";
$results = @mysql_query($SQL);
$rows = @mysql_num_rows($results);
$row = mysql_fetch_array($results, MYSQL_NUM);
$len = strlen(trim($row[1]));
$cntID = $row[1];
if ($rows == 1 && (strlen(trim($row[1])) < 1)){$cid = 0;}else{$cid = 1;}

*/
$cid = 1;
//if($sortVal == 5){$cid = 1;}
$SQL = "SELECT COUNT(`Status`),`Status` FROM `Patient` WHERE $where GROUP BY `Status` ";
$results = @mysql_query($SQL);
$error = mysql_error();
while ($row = @mysql_fetch_array($results, MYSQL_NUM)) {$statusCnt[$row[1]] = $row[0];}
$statusCnt['R'] = $statusCnt['L'] + $statusCnt['V'];
$statusCnt['T'] = $statusCnt['W'] + $statusCnt['I'];
$sql = "SELECT SQL_CALC_FOUND_ROWS `Client`, `Patient`, `Date`, `Status`, `Link`, `ClientID`, `Last`, `First`,`Attributes`, `DoB`,`Done` FROM `Patient` WHERE $where $sort";
$results = @mysql_query($sql);
$error = mysql_error();
$rows = @mysql_num_rows($results);
$more = @mysql_query("SELECT FOUND_ROWS()");
if ($rows == 0){echo "<h4>No $type</h4></div>";}
else {
  $moreRows = mysql_fetch_array($more, MYSQL_NUM);
  $show = "<h4>Today: $today<br/>$type<br/>$moreRows[0] Patients Found: " . $statusCnt['C'] . ' Complete, '  . $statusCnt['T'] . ' Testing, '  . $statusCnt['R'] . ' Received' ;
  if ($rows == 200) {
    $moreRows[0] -= 200;
    $show .= "<br/>200 Patients Shown";
  }
  echo "$show</h4></div>";
  echo '<div id="note"><p id="fgtw"><span class="bold">FGTW</span> is the number of tested <span class="bold">F</span>ood, <span class="bold">G</span>rass, <span class="bold">T</span>ree, and <span class="bold">W</span>eed allergens.  Used by Diet&#x2003;</p></div><div id="diet"><div class="dietblack"></div><p class="inline"> &#x2003;Black: diet report not generated.</p><br/><div class="dietblue"></div><p class="inline"> &#x2003;Blue: Diet Report previously generated</p><br/><div class="dietred"></div><p class="inline"> &#x2003;Red: Multiple result reports linked</p><br/><div class="none"></div><p class="inline"> &#x2003; No Food, Grass, Tree, or Weed found for diet</p></div><table id="tbl">' . $hid[$cid];
  flush();
  ob_flush();
  $checked = array('',' checked="checked"');
  $bg = array(' class="divNoCheck" ',' class="divCheck" ');
  $exStatus['X'] = true;
  while ($row = @mysql_fetch_array($results, MYSQL_NUM)) {
    if ($exStatus[$row[3]]){continue;}
    $time = strtotime($row[2]);
//	$age = date_diff(date_create($row[9]), date_create('today'))->y;
    $date = date('M j, Y',$time );
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[1] AND (`Type` = 7 OR `Type` = 8)  ";
    $result = mysql_query($sql);
    list($covid) = @mysql_fetch_array($result, MYSQL_NUM);
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $row[1]  AND `Code` LIKE 'F%' ";
    $result = mysql_query($sql);
    $cnt = @mysql_fetch_array($result, MYSQL_NUM);
    $i = $row[8];
    if ($cnt[0] > 0 ){$i++; if ($row[4] > 0){$i++;}}
    $dow = intval(date('N',$time ));
	if ($covid > 0){
	  $due = strtotime(date("Y-m-d",strtotime(date('Y-m-d',$time) . ' + '. $covday[intval(date('w',$time))] . 'days')));
	}
	else{
      $due = $time + $addDays[$row[3]] + intval($adjust[$row[3]][$dow]);
	}
    $dueDate[1] = date('M j, Y ( D )',$due );
    $pdf['C'][2] = $row[1] . '" /></form></td>';
    $id = $row[5];
    $check = $checked[$row[10]];
    $idRow[1] = '<td><button class="c2"  type="button" name="sn2" onclick="stNum(2)" >' . $id . '</button></td>';
    if ( $row[2] < '2009-07-27'){
      $status[0] = '<td><button class="q5"  type="button">Call Allermetrix';
    }
    else{
      $status[0] =  $pdf[$row[3]][1] . $dueDate[$dueNeeded[$row[3]]] .  $pdf[$row[3]][2];
    }
    $dietColumn = '<td><form action="' . $dietLink[$i] . '" method="post" target="_blank"><input type="hidden" name="sub" value="1" /><input type="hidden" name="p" value="' . $row[1] . '" /><input type="hidden" name="link" value="' . $row[4] . '" /> <button ' . $icon[$i] . ' type="submit"></button></form></td>';
    $class = $bg[$row[10]];
    echo <<<EOT
<tr>
<td><form action="enter.php" method="post"><input type="hidden" name="sub" value="4" /><input type="hidden" name="name" value="$row[6]" /><button class="c1"  type="submit">$row[6], $row[7]</button></form></td>
$idRow[$cid]
<td><button class="c3"  type="button" name="sn3">$row[1]</button></td>
<td><button class="c4"  type="button" name="sn4">$date</button></td>
$status[0]
$dietColumn
<td><div id="d$row[1]" $class>&#x2009;<input id="c$row[1]" type="checkbox" name="" value="" onChange="chk($row[1])" $check /></div></td>
</tr>
EOT;

  }
  echo '</table>';

}
 $t = number_format((microtime(true) - $startTime),3);

echo <<<EOT
</div><span class="sm">$t</span></div>
<script type="text/javascript">
//<![CDATA[
var at = document.getElementById('announceTxt'); 
var xPos = 0, yPos = 0, mouseX = 0, mouseY = 0;
var bg = new Array('#2985EA','#f00');var div = 0;var c = new Array(8);var d = new Array(8);
while(true){div++;if (div > 8){break;}
d[div] = document.getElementById('d' + div);if (d[div]==null){continue;}c[div] = document.getElementById('c' + div);if (c[div]==null){alert('Null CHK: ' + div);continue;}if (c[div].checked){c[div].style.backgroundColor=bg[1];d[div].style.backgroundColor=bg[1];}}
function check(n){if (c[n].checked){c[n].style.backgroundColor=bg[1];d[n].style.backgroundColor=bg[1];}else{c[n].style.backgroundColor=bg[0];d[n].style.backgroundColor=bg[0];}}
function radio(s,e,n){while(true){d[e].style.backgroundColor=bg[0];c[e].style.backgroundColor=bg[0];e++;if (e > n){break;}}c[s].style.backgroundColor=bg[1];d[s].style.backgroundColor=bg[1];}
function mouseOverFGTW(){document.getElementById('fgtw').style.display='block';}
function mouseOverDiet(){document.getElementById('diet').style.display='block';}
function mouseOutDiet(){document.getElementById('diet').style.display='none';}
function init(){document.getElementById('inp').style.display='none';document.getElementById('ss').style.display='block';var len = document.getElementById('tbl').offsetWidth;len-=20;document.getElementById('frmtop').style.width = (len + 'px');document.getElementById('frmbot').style.width = (len + 'px'); len-=80; at.style.width = (len + 'px'); }
function showSearch(){
  document.getElementById('inp').style.display='block';
  document.getElementById('ss').style.display='none';
  document.getElementById('sc').style.display='none';}
function showAnnounce(){at.style.display='block';at.style.top = '60px' ;}
function hideAnnounce(){document.getElementById('announceTxt').style.display='none';}
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