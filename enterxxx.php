<?php 
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$error = mysqli_error($link);
$sub = intval($_POST['sub']);
$client = intval($_POST['id']);
$code = 1;
if(file_exists('/home/amx/public_html/login/done.txt')){
  $data = file_get_contents('/home/amx/public_html/login/done.txt');
  list($code,$client) = explode('|',$data);
  unlink('/home/amx/public_html/login/done.txt');
  $accession = intval($_GET['accession']);
  if($code == $accession){
    $sql =  "SELECT *  FROM `Client` WHERE `Number` = $client LIMIT 1";
    $results = mysqli_query($link,$sql);
    $cli = mysqli_fetch_array($results, MYSQLI_NUM);
    list($Number,$Name,$Address,$Address2,$City,$State,$PostalCode,$Contact,$Phone,$Email,$Mobile,$Fax,$RecordsCRC,$days,$ip,$LastVisit,$Updated,$Logout,$Session,$Sort,$StatusSort,$Diet,$passcode,$login) = $cli;
    $_POST['d'] = $days;
    $sub = 2;
  }
}
if ($sub == 9){ // clear diet
  mysqli_query($link,"UPDATE `Patient` SET `Attributes`=0,`Link`=0 WHERE `Client` = $client");
  $sub = 0;
}

if ($sub == 0){
  $passcode = trim($_GET['p']);
  $passcodeh = trim($_POST['pwh']);
  $passcode = trim($_POST['pw']);
  if (strlen($passcodeh) > strlen($passcode)){
    $passcode = $passcodeh;
  }
  $admin = false;
  $ip =  $_SERVER['REMOTE_ADDR'];
  if ((hash('ripemd320',$passcode) == '6732f3c024fe3c3c1ccd7dbe5d0fa7d4a53c516f800707bb86a9017c1e1646d9d4a2d7adc56a505d') ){ //&& (substr($ip,0,11)  == '128.30.52.7' || $ip == '99.3.150.55' || $ip == '173.162.23.21' || $ip == '70.197.160.30')){
    $admin = true;
	$pass = true ;
  }
  $clear = '';
  $sql = "SELECT COUNT(*)  FROM `Banned` WHERE `ip` LIKE '$ip'";
  $results = mysqli_query($link,$sql);
  $row = mysqli_fetch_array($results, MYSQLI_NUM);
  if ($row[0] > 0){include '404.shtml';return;}
  $pass = false;
  $error = 1;
  $hash = hash('ripemd320',$passcode);
  $sql =  "SELECT *  FROM `Client` WHERE `Number` = $client LIMIT 1";
  $results = mysqli_query($link,$sql);
  $error = mysqli_error($link);
  $rows = mysqli_num_rows($results);
  if (strlen($error) == 0 && $rows == 1) {
	$orderbutton = '';
    $clientNumber = $client;
    $cli = mysqli_fetch_array($results, MYSQLI_NUM);
    list($Number,$Name,$Address,$Address2,$City,$State,$PostalCode,$Contact,$Phone,$Email,$Mobile,$Fax,$RecordsCRC,$days,$ip,$LastVisit,$Updated,$Logout,$Session,$Sort,$StatusSort,$Diet,$passcode,$login) = $cli;
    if($login == 1 || $admin || $admin == 1){
      $orderbutton = '<form action="./login/" method="post"><input id="oo" type="submit" value="Create Request Form" /><input type="hidden" name="client" value="' . $client . '" /><input type="hidden" name="sub" value="40" /><input type="hidden" name="prior" value="6" /><input type="hidden" name="tab" value="5" /></form>';
    }
    if ($cli[12] == $hash || $admin ) {
      $pass = true;
      $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($client, CURRENT_TIMESTAMP, '$ip', 1, 0, 1, '');";
      mysqli_query($link,$sql);
    }
    else {
      $txt = $client . ' - ' . $passcode;
      $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($client, CURRENT_TIMESTAMP, '$ip', 1, 0, 0, '$txt');";
      mysqli_query($link,$sql);
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
    setcookie("amxc", $client,time()+3600,'/');
    setcookie(session_name('amxs'), '', time() + 3600);
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
  $client = intval($_COOKIE['amxc']);
  if ($client < 100000){header("Location: https://dev.amxemr.com");exit;} 
  setcookie("amxc", $client,time()+3600,'/');
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
    mysqli_query($link,"UPDATE `Client` SET `days` = $days, `Sort`=$sortVal, `StatusSort`=$exVal WHERE `Number`=$client ");
  }
  $sql =  "SELECT *  FROM `Client` WHERE `Number` = $client LIMIT 1";
  $results = mysqli_query($link,$sql);
  $error = mysqli_error($link);
  $rows = mysqli_num_rows($results);
  if (strlen($error) == 0 && $rows == 1) {
    $cli = mysqli_fetch_array($results, MYSQLI_NUM);
    list($Number,$Name,$Address,$Address2,$City,$State,$PostalCode,$Contact,$Phone,$Email,$Mobile,$Fax,$RecordsCRC,$days,$ip,$LastVisit,$Updated,$Logout,$Session,$Sort,$StatusSort,$Diet,$passcode,$login) = $cli;
    if($login == 1 || $admin || $admin == 1){
      $orderbutton = '<form action="./login/" method="post"><input id="oo" type="submit" value="Create Request Form" /><input type="hidden" name="client" value="' . $client . '" /><input type="hidden" name="sub" value="40" /><input type="hidden" name="prior" value="6" /><input type="hidden" name="tab" value="5" /></form>';
    }
	$history = ' class="nothidden" ';
	$sql = "SELECT `id` FROM `history` WHERE `client` = $client";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link) == 0 && mysqli_num_rows($results) == 0){$history = ' class="hide" ';}
  }
}

$address= trim($cli[3]);
if (strlen($address) > 3){ $address .= ' ';}
$address .=  trim($cli[4]) . ' ' . trim($cli[5]) . ' ' . trim($cli[6]);
$clientname = "$cli[1] $cli[2] $address";
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
$history = '<form action="requestForm.php"><input id="fh" type="submit" value="Patient Inhalant &amp; Food History" /></form>';
$sql = "SELECT COUNT(*) FROM `history` WHERE `client`=$client LIMIT 1 ";
$result = mysqli_query($link,$sql);
list($cnt) = mysqli_fetch_array($result, MYSQLI_NUM);
if($cnt == 0){$history = '';}
$announce = '<button id="announce" onclick="showAnnounce()">Announcement</button>';
$announce = '';
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>AMX EMR</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
html,body{}
h4{margin:.4em 0;}
.sm{font-size:.5em;color:#5bb;}
fieldset{margin:0;padding:1em;width:12em;}
input[type="radio"],input[type="checkbox"]{width:25px;height:25px;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.divCheck,.divNoCheck{width:32px;font-weight:700;color:#fff;display:inline-block;padding:4px 4px 4px 3px;vertical-align: middle;position: relative;border:2px outset #dadada;border-top-color: #e3e3e3;border-left-color: #e3e3e3; }
.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;width:50px;} 
.divNoCheck{background:#e74c3c;}
.nocheckx{background:#e74c3c;}
.divCheck{background:#aed6f1;}
#daysValue{text-align:center;}
#page{width:100%;background:#f7f7fb;}
#keys{margin:0 auto 0;width:850px;}
.none{width:50px;vertical-align: middle;margin:0;background:url('redX.gif');}
#x{width:500px;height:400px;color:#f00;background:#000;font: 700 5em Arial;text-align:center;padding:200px 0 0 0;}
.xx{background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{width:50px;vertical-align: middle;border-image-width:0;border:0;margin:0;padding:0;background:url('blackDiet.gif');}
.x{background-color:#fff;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{width:50px;vertical-align: middle;border:0;margin:0;padding:0;width:50px;;background:url('redDiet.gif');}
.xxx{background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{width:50px;vertical-align: middle;border:0;margin:0;padding:0;width:50px;;background:url('blueDiet.gif');}
.xxxx{background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c6,.h1,.h2,.h3,.h4,.h5,.h6,.h7,.cnt{height:40px;display:inline-block;}
.h1,.c1{color:#fff;width:200px;;text-align:left;padding: 0 0 0 10px;background-image: linear-gradient(to bottom, #1e3c72 0%, #2a5298 100%);}
.h2{width:120px;text-align:center;}
.c2{width:120px;text-align:left;padding:0 0 0 3px;}
.h3,.c3{width:60px;}
.h4,.c4{width:100px;}
.h1,.h2,.h3,.h4,.h5,.h6,.h7{background-image:linear-gradient(to bottom, #a3bded 0%, #6991c7 100%);font-weight:700;color:#000;margin-bottom:0;}    
.cnt{width:50px;}
.c2,.c3,.c4,.c5,.cnt{color:#fff;
background-image: linear-gradient(to bottom, #1e3c72 0%, #2a5298 100%);}
.c5,.x5,.q5,.i5,.w5,.v5,.o5,.h5{width:240px;;font-weight:700;text-align:left;padding-left:1em;height:40px;width:240px;}
.i5{color:#000;background-image: linear-gradient(to bottom, #bfffc7  0%, #b9d489 100%);}/* sendout   */
.i5{color:#000;background-image: linear-gradient(to bottom, #39f1d7  0%, #318f98 100%);}/* sendout   */
.i5{color:#000;background-image: linear-gradient(to bottom, #0be  0%, #4dd 100%);}/* sendout   */
.v5{background-image: linear-gradient(to bottom, #ffb810  0%, #fc940c 100%);}/* received */
.w5{background-image: linear-gradient(to bottom, #56ceea  0%, #24a0bf   100%);}/* testing */
.x5{background-image: linear-gradient(to bottom, #868f96  0%, #596164 100%);}/* void */
.o5,.q5{color:#fff;background-image: linear-gradient(to bottom, rgba(200,0,0,1) 0%, rgba(175,0,0,1) 100%);}/* hold  and QNS*/
.c5{cursor:pointer;font:700 1.1em Arial,sans-serif;width:240px;letter-spacing:1px;}
.o5,.q5{font:700 1.1em Arial,sans-serif;letter-spacing:1px;}
.c6{background:#000;padding-left:6px;}
.c6{width:100%}
.h6{width:49px;padding:0 2px 0 2px;}
.h7{width:43px;padding:0 2px 0 2px;}
#announce,#lo,#fh,#oo,#clear,#ss,#sub,#close{font:700 1.1em Arial,sans-serif;color:#fff;margin:4px 0 4px;width:100%;height:40px;}
#announce,#ss{color:#fff;background-image: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
#lo,#fh,#oo,#clear,#sub,.c5,#close{background-image: linear-gradient(to bottom, rgba(0,0,180,1) 0%, rgba(0,0,30,1) 100%);}
.box{border:2px ridge #00f;float:left;height:270px;width:250px;margin:5px;padding:5px 0 5px 15px;}
.label{padding:0;margin:0;}
td,tr{border:0;padding:0;margin:0;border-collapse: collapse;}
table{border:0;padding:0;margin:0;border-spacing:1px;}
form{border:0;margin:0;padding:0;border-image-width:0;}
.c6{width:50px;border-spacing:0;}
.row{height:40px;}
.bold{font-weight:700;}
#daysValue{width:4em;font:700 1em Arial,sans-serif;}
#diet,#announceTxt{border:.5em ridge #fff;width:770px;padding:2em;background:#222;color:#fff;position: absolute;top:20em;z-index:10;display:none;}
.inline{display:inline-block;padding:.1em;font-weight:700;}
.range{display:inline-block;padding-top:0;}
#code,#name{width:200px;;font:700 1em Arial,sans-serif;}
#inp{display:none;}
#inp{margin:30px 0 0 0;}
#announceTxt{font: 700 1em/1.5 arial,sans-serif;}
a{display:inline-block;}
a:link {color: #08f;font:400 1.2em arial,sans-serif;}
a:visited {color: #08f;font:400 1.2em arial,sans-serif;}
form,table,#frmtop,#frmbot{border:0;margin:0 auto 0 ;}
#cli{width:100%;text-align:center;}
#frmtop,#frmbot{color:#000;font:700 1em Arial,sans-serif;}
.title{font:700 1.2em Arial,sans-serif;margin:0 0 10px 0;}
.searchNotChecked,.searchChecked{font-weight:700;color:#fff;display:inline-block;padding:4.5px 0px 5px 4.5px;margin:2px;vertical-align: middle;position: relative;}
.searchNotChecked{background:#aed6f1; }
.searchChecked{background:#e74c3c;}
</style>
</head><body onload="init()">
<div id="page"><div id="keys"><h4 id="cli">$client $clientname</h4>
<div id="frmtop">
$announce
<form action="logout.php"><input id="lo" type="submit" value="Log Out" /></form>
$history
$orderbutton
</div>
<div id="frmbot"><div id="inp">
<form action="./enter.php" method="post">
<div class="box"><div class="title">Search Patients By:</div>
<p class="label">Your Patient ID</p>
<input id="code" name="code" placeholder="or Begins With" value="" type="search" />
<p class="label">&#x2002;<br/>Patient Last Name</p>
<input id="name" name="name" placeholder="or Begins with" value="" type="search" />
<p class="label">&#x2002;<br/>Number of Business Days</p>
<input type="number" id="daysValue" min="1" name="d" value="$days" />
&#x2002;( 5 days / week)</div>
<div class="box"><div class="title">Sort by:</div>
<div id="d1"  class="searchNotChecked" ><input id="c1" class="noCheck" type="radio" name="s" value="1"  onclick="checks()"  $chkSort[1]  />&#x2002;</div>Patient Name<br>
<div id="d2"  class="searchNotChecked" ><input id="c2" class="noCheck" type="radio" name="s" value="2"  onclick="checks()"  $chkSort[2]  />&#x2002;</div>Date<br>
<div id="d3"  class="searchNotChecked" ><input id="c3" class="noCheck" type="radio" name="s" value="3"  onclick="checks()"  $chkSort[3]  />&#x2002;</div>Status<br>
<div id="d4"  class="searchNotChecked" ><input id="c4" class="noCheck" type="radio" name="s" value="4"  onclick="checks()"  $chkSort[4]  />&#x2002;</div>Lab ID<br>
<div id="d5"  class="searchNotChecked" ><input id="c5" class="noCheck" type="radio" name="s" value="5"  onclick="checks()"  $chkSort[5]  />&#x2002;</div>Your Patient ID<br>
</div>
<div class="box"><div class="title">Display the Following:</div>
<div id="d6"  class="searchNotChecked" ><input id="c6" class="noCheck" type="checkbox" name="xR" onclick="checks()"  $chkStatus[1]  />&#x2002;</div>Received by Lab<br>
<div id="d7"  class="searchNotChecked" ><input id="c7" class="noCheck" type="checkbox" name="xT" onclick="checks()"  $chkStatus[2]  />&#x2002;</div>In Testing<br>
<div id="d8"  class="searchNotChecked" ><input id="c8" class="noCheck" type="checkbox" name="xC" onclick="checks()"  $chkStatus[3]  />&#x2002;</div>Completed<br>
</div>
<input id="sub" type="submit" value="Search" />
<input type="hidden" name="sub" value="1" />
</form></div></div><button id="ss" type="button"  onclick="showSearch()" >Show Search</button>
EOT;
ob_flush();
readfile ('/home/amx/public_html/announce.html');
$sort[1] = ' ORDER BY `Last` ASC, `First` ASC LIMIT 1000 ';
$sort[2] = ' ORDER BY `Date` DESC,`Last` ASC, `First` ASC LIMIT 1000 ' ;
$sort[3] = ' ORDER BY `Status` ASC, `Patient` DESC LIMIT 1000 ';
$sort[4] = ' ORDER BY  `Patient` DESC LIMIT 1000 ';
$sort[5] = ' ORDER BY `ClientID` DESC LIMIT 1000 ';
$sort = $sort[$sortVal];
$hid[0] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td class="h6"><button class="h6" type="button" name="sn6" onmouseover="ontap(event)"  onmouseout="mouseOutDiet()" >Diet</button></td><td class="h7"><button class="h7" type="button" name="sn7" >Done</button></td></tr>';
$hid[1] = '<tr><td><button class="h1"  type="button" name="sn1" onclick="stNum(1)" >Name</button></td><td><button class="h2"  type="button" name="sn2" onclick="stNum(2)" >Patient ID</button></td><td><button class="h3"  type="button" name="sn3" onclick="stNum(3)" >Lab ID</button></td><td><button class="h4"  type="button" name="sn4" onclick="stNum(4)" >Date</button></td><td><button class="h5"  type="button" name="sn5" onclick="stNum(5)" >Status</button></td><td><button class="h6"  type="button" name="sn6" onmouseover="mouseOverDiet()"  onmouseout="mouseOutDiet()" >Diet</button></td><td><button class="h7" type="button" name="sn7" >Done</button></td></tr>';
$pdf['W'][1] = '<td><button class="w5"  type="button">Testing Due: ';
$pdf['I'][1] = '<td><button class="i5"  type="button">Sendout Due: ';
$pdf['Q'][1] = '<td><button class="q5"  type="button">QNS';
$pdf['X'][1] = '<td><button class="x5"  type="button">Void';
$pdf['H'][1] = '<td><button class="o5"  type="button">On Hold';
$pdf['C'][1] = '<td><form action="pdf.php" method="get" target="_blank"><button class="c5"  type="submit">Complete (PDF)</button><input type="hidden" name="p" value="';
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
$dietLink = array('#','link.php','d.php','d.php','');
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
  $where = " `Client` = $client AND `last` LIKE '$name%' ";
  $type = "Patient Last Name: \"$name\" <br>";
  $sort = ' ORDER BY `Last` ASC, `First` ASC, `DoB` DESC LIMIT 1000';
}
elseif (strlen($code) > 0) {
  $where = " `Client` = $client  AND `ClientID` LIKE '$code%' ";
  $type = "Patient ID: \"$code\" <br>";
}
else{
  $where = " `Client` = $client AND `Date` > '$date' AND `Status` NOT LIKE 'X' ";
  $notFound = "<h2>No patients Found between Today and $date</h2>";
  $type = 'Showing patients tested after ' . date('l, F j, Y',strtotime($date)) . '<br>';
}
$cid = 1;
$sql = "SELECT`ClientID` FROM `Patient` WHERE `Client` = $client AND `Date` = $date AND `ClientID` LIMIT 1";
$results = mysqli_query($link,$sql);
$idcnt = 0;
if(mysqli_num_rows($results) > 0){$idcnt = 1;}

$sql = "SELECT COUNT(`Status`),`Status` FROM `Patient` WHERE $where GROUP BY `Status` ";
$results = mysqli_query($link,$sql);
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {$statusCnt[$row[1]] = $row[0];}
$error = mysqli_error($link);
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {$statusCnt[$row[1]] = $row[0];}
$statusCnt['R'] = $statusCnt['L'] + $statusCnt['V'] +  $statusCnt['H'] +  $statusCnt['Q'];
$statusCnt['T'] = $statusCnt['W'] + $statusCnt['I'];
$qns = '';
$hold = '';
if($statusCnt['Q'] > 0){$qns  = ', ' . $statusCnt['Q'] . ' QNS';}
if($statusCnt['H'] > 0){$hold = ', ' .  $statusCnt['H'] . ' on Hold';}
$sql = "SELECT `Client`, `Patient`, `Date`, `Status`, `Link`, `ClientID`, `Last`, `First`,`Attributes`, `DoB`,`Done` FROM `Patient` WHERE $where $sort";
$results = mysqli_query($link,$sql);
$error = mysqli_error($link);
$rows = mysqli_num_rows($results);
$error .= mysqli_error($link);
$more = mysqli_query($link,"SELECT FOUND_ROWS()");
if ($rows == 0){ 
  echo "<h4>No $type</h4></div>";
}
else {
  $moreRows = mysqli_fetch_array($more, MYSQLI_NUM);
  $show = "<h4>Today: $today<br/>$type<br/>$rows Patients Found, " . $statusCnt['C'] . ' Complete, '  . ($statusCnt['T'] + $statusCnt['R']) . ' In Testing' . "$qns$hold";
  if ($rows == 200) {
    $moreRows[0] -= 200;
    $show .= "<br/>200 Patients Shown";
  }
  echo "$show</h4><hr>";
  echo '<div id="note"><div id="diet"><div class="dietblack"></div><p class="inline"> &#x2003;Black: diet report not generated.</p><br/><div class="dietblue"></div><p class="inline"> &#x2003;Blue: Diet Report previously generated</p><br/><div class="dietred"></div><p class="inline"> &#x2003;Red: Multiple result reports linked</p><br/><div class="none"></div><p class="inline"> &#x2003; No Food, Grass, Tree, or Weed found for diet</p></div></div><table id="tbl">' . $hid[$cid];
  flush();
  ob_flush();
  $checked = array('',' checked="checked"');
  $bg = array(' class="divNoCheck" ',' class="divCheck" ');
  $exStatus['X'] = true; //$admin;
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
	list($Client, $accession, $Date, $Status, $Link, $ClientID, $Last, $First, $Attributes, $DoB, $Done) = $row;
    if ($exStatus[$Status]){continue;}
    $time = strtotime($Date);
	$daysago = floor((time() - $time) / 86400);
	
	$pdf['V'][1] = '<td><button class="v5"  type="button">Received ' . $daysago . ' days ago';
    $pdf['L'][1] = '<td><button class="v5"  type="button">Received ' . $daysago . ' days ago';
    $date = date('M j, Y',$time );
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $accession AND (`Type` = 7 OR `Type` = 8)  ";
    $result = mysqli_query($link,$sql);
    list($covid) = mysqli_fetch_array($result, MYSQLI_NUM);
    $sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $accession  AND `Code` LIKE 'F%' ";
    $result = mysqli_query($link,$sql);
    $cnt = mysqli_fetch_array($result, MYSQLI_NUM);
    $i = $Attributes;
    if ($cnt[0] > 0 ){$i++; if ($Link > 0){$i++;}}
    $dow = intval(date('N',$time ));
    $due = $time + $addDays[$Status] + intval($adjust[$row[3]][$dow]);
    $dueDate[1] = date('D M j, Y',$due );
    $pdf['C'][2] = $accession . '" /></form></td>';
    $check = $checked[$Done];
    $idRow[1] = '<td><button class="c2"  type="button" name="sn2" onclick="stNum(2)" >' . $ClientID . '</button></td>';
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
<td><button class="c1"  type="submit">$Last, $First</button></td>
<td><button class="c2"  type="button" name="sn2" onclick="stNum(2)" >$ClientID</button></td>
<td><button class="c3"  type="button" name="sn3">$row[1]</button></td>
<td><button class="c4"  type="button" name="sn4">$date</button></td>
$status[0]
$dietColumn
<td><div id="d$row[1]" $class><input id="c$row[1]" type="checkbox" class="doneCk" name="n$row[1]" value="" onChange="chk($row[1])" $check /></div></td>
</tr>
EOT;
  }
  echo '</table>';
}
 $t = number_format((microtime(true) - $startTime),3);
echo <<<EOT
<span class="sm">$t</span></div></div>
<script>
//<![CDATA[
const flip = [];
flip[true] = false;
flip[false] = true;
var bg = new Array('#e74c3c','#aed6f1');
const checked = [];
checked[true] = bg[0];
checked[false] = bg[1];
var radio = {1:[null,null],2:[null,null],3:[null,null],4:[null,null],5:[null,null],6:[null,null],7:[null,null],8:[null,null]};
var at = document.getElementById('announceTxt'); 
function checks(){
  for (var id in radio){
    radio[id][0].style.backgroundColor = checked[radio[id][1].checked];
  }
}
function showSearch(){
  document.getElementById('ss').style.display = 'none';
}
function init(){
  for (var id in radio){
    radio[id][0] = document.getElementById('d' + id);
    radio[id][1] = document.getElementById('c' + id);
  }
  checks()
  document.getElementById('inp').style.display='none';
  document.getElementById('ss').style.display='block';

 }
  function showSearch(){
  document.getElementById('ss').style.display = 'none';
  document.getElementById('inp').style.display = 'block';
}
function mouseOverFGTW(){document.getElementById('fgtw').style.display='block';}
function mouseOverDiet(){document.getElementById('diet').style.display='block';}
function mouseOutDiet(){document.getElementById('diet').style.display='none';}
function showAnnounce(){at.style.display='block';at.style.top = '60px' ;}
function hideAnnounce(){document.getElementById('announceTxt').style.display='none';}
function ontap(e){
  document.getElementById('diet').style.display = 'block';
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