<?php 
$ip = $_SERVER["REMOTE_ADDR"];
ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$client = intval($_COOKIE['amxc']);
setcookie("amxc", $client,time()+86400);
$patient = preg_replace("/\D/", "", $_POST['p']);
$key = intval($_GET['k']);
if($key > 0){$_GET['p'] = 100005;}
        

if($_GET['p'] == 100005){$client= 888877; $patient = 100005;$_POST['sub'] = 1;}
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
  "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet $patient</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0; }
#content{width:100%;padding:0;margin:0 auto 0;max-width:960px;}
#page1{width:80%;margin-left:10%;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1.1em/1.2 Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1.25em/1 Arial,sans-serif;color:#f00;}
.col{margin:0 0 .3em .3em ;-webkit-column-count: 4;-moz-column-count: 4;-ms-column-count: 4;-o-column-count: 4;column-count: 4;}
p{margin:0 0 1px 0;padding:0;font:400 1em/.9 Arial,sans-serif;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.plus   { vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.minus  { vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.checkmark{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.up{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPhSAv769wAxAGUAdywAAAAADAAMAAACF4SPqQsR3NxTUiYXs8GaI7+A1MSI0FEAADs=');}
.tblank  {vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.blank  {vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ddd;}
.tested  {vertical-align: text-top;display:inline;padding:0 0 0 0;margin:0 0 0 .2em;font:700 .9em Arial,sans-serif;}
.strike  {vertical-align: text-top; display:inline;padding:0 0 0 0;margin:0 0 0 .2em;font:700 .9em Arial,sans-serif;text-decoration:line-through;}
.notTested{vertical-align: text-top; display:inline;padding:0 0 0 0;margin:0 0 0 .2em;font:400 .9em Arial,sans-serif;}
.hide{display:none;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;  display: inline;vertical-align: middle;position: relative;}  
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.desc{width:12em;display:inline-block;font-weight:700;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}

h1{text-align:center;}
h2{margin:.2em;}
h3{margin:.8em .2em 0;}
h4{margin:0 0 .3em 0;padding-left:1em;}
pre{padding:0;margin:0;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
button{width:7em;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:none;}
}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.divCheck,.divNoCheck,.component{font-weight:700;color:#fff;width:14em;display:inline-block;padding:2px 0 2px 2px;margin:2px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck,.nocheck,.component{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
input[type="checkbox"],input[type="radio"] {}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1.2em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{width:100%;padding:0;margin:0 auto 0}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn{width:80%;margin:.5em auto 0;font:700 1.2em Arial,sans-serif;padding:.4em;border-radius: 3px 3px 3px 3px;font: 700 1.3em Arial,Helvetica,Calibri,sans-serif;overflow: visible;border:1px solid #00f;color: #fff;
background-image: -o-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -moz-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -ms-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}

.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
</style></head><body onload="init()"><div id="content"><div style="display:none;">$ip</div>
<div id="header" onclick="hideHdr()" >
<div id="logo" class="noPrint">
<img width="166" height="50" alt="amx logo" src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
</div></div><div id="hd" class="noPrint"><div id="bg">
EOT;
flush();
ob_flush();
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510'); @mysql_select_db('amx_portal');
$tdx = 0;
$t[$tdx] = microtime(true);
 $lnk = intval(preg_replace("[^0-9]", "", $_POST['lnk']));
 if ($lnk > 0){
  @mysql_unbuffered_query("UPDATE `Patient` SET `Link`=0, `Attributes`=0 WHERE `Link`= $lnk");
 }
$sub = intval($_POST['sub']);
if ($sub == 1) {
 foreach ($_POST as $k => $v){
  if (substr($k,0,3) == 'lnk'){
   $links[] = substr($k,3);
   $labid = substr($k,3);
   if ($labid == $patient){continue;}
   $labids .= "<br/>Linked: $labid" ;
  }
 }
 $cnt = count($links);
//    echo $client.' - ' . $patient . '<br><br><pre>LINKS<br/>' . var_export($links,true) . '</pre><br/>';
 if ($cnt == 1){
  mysql_unbuffered_query("UPDATE `Patient` SET `Link`=0 WHERE `Link`= $links[0]");
  mysql_unbuffered_query("DELETE FROM `Link` WHERE `next` = $links[0]"); 
 }
 elseif ($cnt > 1){
  $results = mysql_query("SELECT MAX(`next`) FROM `Link` WHERE 1") ;
  $row = mysql_fetch_array($results, MYSQL_NUM);
  $next = $row[0];
  $next++;
  mysql_unbuffered_query("INSERT INTO `amx_portal`.`Link` (`next`) VALUES (NULL);");
  echo "<h2>$cnt $next</h2>";
  foreach ($links as $v){
   $results = mysql_query("SELECT `Link` FROM `Patient` WHERE `Patient` = $v LIMIT 1");
   $rows = mysql_num_rows($results); 
   if ($rows == 1 ){
    $row = mysql_fetch_array($results, MYSQL_NUM);
    if ($row[0] > 0){
     mysql_unbuffered_query("UPDATE `Patient` SET `Link`=0 WHERE `Link`= $row[0]");
    }
   }
  }
  foreach ($links as $v){
   @mysql_unbuffered_query("UPDATE `Patient` SET `Link`=$next WHERE `patient`= $v");
  }
 } 
}




/*
$results = mysql_query("SELECT * FROM Allergens");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) SELECT time: $et</p>";

$ndx++;$t[$ndx] = microtime(true);
$ndx++;$t[$ndx] = microtime(true);mysql_unbuffered_query("CREATE TABLE Foods200221 SELECT * FROM Allergens");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) CREATE SELECT FROM: $et</p>";
$ndx++;$t[$ndx] = microtime(true);
$ndx++;$t[$ndx] = microtime(true);
mysql_unbuffered_query("CREATE TABLE Foods200220 LIKE Allergens");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) CREATE LIKE: $et</p>";
mysql_unbuffered_query("ALTER TABLE Foods200220 DISABLE KEYS");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) DISABLE KEYS: $et</p>";
mysql_unbuffered_query("INSERT INTO Foods200220 SELECT * FROM $foodsTable ORDER BY `Allergens`.`alpha` ASC, `Allergens`.`Description` ASC");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) NSERT INTO FROM: $et</p>";
mysql_unbuffered_query("ALTER TABLE Foods200220 ENABLE KEYS");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) ENABLE KEYS: $et</p>";
$last = $ndx-5;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) TOTAL: $et</p>";

$ndx++;$t[$ndx] = microtime(true);
$ndx++;$t[$ndx] = microtime(true);
mysql_unbuffered_query("CREATE TABLE Foods200223 LIKE `Allergens`");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) CREATE LIKE: $et</p>";
mysql_unbuffered_query("SELECT * INTO OUTFILE '/tmp/table1.txt' FROM `Allergens`");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) SAVE DATA: $et</p>";
mysql_unbuffered_query("ALTER TABLE Foods200223 DISABLE KEYS");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) DISABLE KEYS: $et</p>";
mysql_unbuffered_query("LOAD DATA INFILE '/tmp/table1.txt' INTO TABLE Foods200223");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) IMPORT DATA: $et</p>";
mysql_unbuffered_query("ALTER TABLE Foods200223 ENABLE KEYS");
$ndx++;$last = $ndx-1;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) ENABLE KEYS: $et</p></div></body></html>";
$last = $ndx-5;$t[$ndx] = microtime(true);$et = number_format($t[$ndx] - $t[$last],5); echo "<p>$ndx) TOTAL: $et</p></div>";

ob_end_flush();
return;


echo <<<EOT
*/

$rows = 0;
$clientNum = intval($_COOKIE['amxc']);
if ($ip == '70.171.4.227'){$rows = 1;}
$time['initialize'] = number_format((microtime(true) - $startTime),3);
$chk = 17;
$template = array();
$checked = array_fill(1,12,'');
$mode = array_fill(1,2,'');
$err .= "<br/>Patient: $patient<br/>";

//  ######################     
//  GET PATIENT AND CLIENT
//  ###################### 
   

if (strlen($patient) == 6){
 if (strlen($lnk) == 6){
  @mysql_unbuffered_query("UPDATE `Patient` SET `Link`=0 WHERE `Link`= $lnk");
 }
 $sql = "SELECT `Client`,`Last`, `First`, `ClientID`,`Attributes`,`Link` FROM `Patient` WHERE `Patient` = $patient";
 $results = @mysql_query($sql);
 $error = mysql_error();
 $rows = @mysql_num_rows($results);
 if (strlen($error) == 0 AND $rows == 1){
  $pat = mysql_fetch_array($results, MYSQL_BOTH);
  $patState = $pat[4];
  $client = $pat[0] ;
  $patID = $pat[3];
  $clientErr = $client;
  $name = '<h3>' . htmlspecialchars($pat[2]) . ', ' . htmlspecialchars($pat[1]);
  $name .= "<br/>Lab ID: $patient $labids";
  
  if (strlen($pat[3]) > 0){
   $name .= '<br/>Client ID: ' . htmlspecialchars($pat[3]);
  }
  $name .= '</h3>';
  $time['patient record'] = number_format((microtime(true) - $startTime),3);
  if ($pat[5] > 0){
    $linked = 1;
    $sql = "SELECT `Patient` FROM `Patient` WHERE `Link` = $pat[5]"; 
    $results = @mysql_query($sql); 
    $ass = $sql;
    $rows = @mysql_num_rows($results);
    if ($rows > 1){
      while ($pats = mysql_fetch_array($results, MYSQL_NUM)){
       $patients[] = $pats[0];
      }
    }
    else{
      $patients[] = $patient;
    }
    $links = count($patients);
    $name = '<form enctype="application/x-www-form-urlencoded" action="link.php" method="post"><div><fieldset class="widthWide"><legend>Patient</legend><input type="hidden" name="sub" value="1" /><input type="hidden" name="lnk" value="' . $pat[5] . '" /><input type="hidden" name="p" value="' . $patient . '" />' . $name . '<button class="btn">Unlink (' . $links . ')</button></fieldset></div></form>';
  }
  else{
   $sql = "SELECT `Link` FROM `Patient` WHERE `Client` = $client AND `Last` LIKE '$pat[1]' AND `First` LIKE '$pat[2]' ";
   $results = @mysql_query($sql); 
   $error = mysql_error();
   $rows = @mysql_num_rows($results);
   $rows--;
   $patients[] = $patient;
   $linked = 1;
   if ($rows > 0){$name = '<form enctype="application/x-www-form-urlencoded" action="link.php" method="post"><div><fieldset class="widthWide"><legend>Patient</legend><input type="hidden" name="sub" value="1" /><input type="hidden" name="lnk" value="0" /><input type="hidden" name="p" value="' . $patient . '" />' . $name . '<br/><button class="btn"> Link (' . $rows . ')</button></fieldset></div></form>';}
  }
  $time['get linked results'] = number_format((microtime(true) - $startTime),3);
  $time['get patient'] = number_format((microtime(true) - $startTime),3);
  $sql = "SELECT `Name`, `RecordsCRC`, `Session`,`Phone`,`Fax`,`Address`,`Address2`,`City`,`State`,`PostalCode` FROM `Client` WHERE `Number` = $client LIMIT 1";
  $results = @mysql_query($sql);
  $error = mysql_error();
  $cliErr = "<h4>$error <br/>$sql</h4>";
  $rows = @mysql_num_rows($results);
  if (strlen($error) == 0 AND $rows == 1){
   $cli = mysql_fetch_array($results, MYSQL_NUM);
   $clientName = htmlspecialchars($cli[0]);
   $clientAddress = $cli[5];
   if (strlen($cli[6]) > 0){$clientAddress .= '<br/>' . $cli[6];}
   if (strlen($cli[4]) > 9){$fax = "Fax: $cli[4]<br/>";}else{$fax = '';}
   $clientAddress .= "<br/>$cli[7] $cli[8] $cli[9]<br/>$client";
   $err .= "<br/>Client Name: $clientName<br/>";
   $sql = "SELECT * FROM `template` WHERE `Client` = 0 AND `Patient` = $patient LIMIT 1"; 
   $results = @mysql_query($sql);
   $error = mysql_error();
   $rows = @mysql_num_rows($results);
   if (strlen($error) != 0 || $rows != 1){
    $err .= "<br/>SEL #1 PAT TPL: $error<br/>$sql<br/>";
    $sql = "SELECT * FROM `template` WHERE `Client` = $client AND `Patient` = 0 LIMIT 1"; 
    $results = @mysql_query($sql);
    $error = mysql_error();
    $rows = @mysql_num_rows($results);
    if (strlen($error) != 0 || $rows != 1){
     $sql = "SELECT * FROM `template` WHERE `Client` = 999999 AND `Patient` = 0 LIMIT 1"; 
     $results = @mysql_query($sql);
     $tpl = mysql_fetch_array($results, MYSQL_BOTH);
     $template[3] = $tpl;
     $sql = "INSERT INTO `amx_portal`.`template` (`Client`, `Patient`, `CutOff`, `excludeMethod`, `CrossreactivityGrocery`, `CrossreactivityDiet`, `CrossreactivityPhycian`, `CrossreactivityPatient`, `HiddenFoodPhysician`, `HiddenFoodPatient`, `ExcludeIgE`, `ExcludeIgG`, `ExcludeIgG4`) VALUES ('$client', '0','$tpl[2]', '$tpl[3]', '$tpl[4]', '$tpl[5]', '$tpl[6]', '$tpl[7]', '$tpl[8]', '$tpl[1]', '$tpl[10]', '$tpl[11]', '$tpl[12]', '$tpl[13]')";
     
    }
    else{
     $tpl = mysql_fetch_array($results, MYSQL_BOTH);
     $template[1] = $tpl;
    }
    $sql = "INSERT INTO `amx_portal`.`template` (`Client`, `Patient`, `CutOff`, `excludeMethod`, `CrossreactivityGrocery`, `CrossreactivityDiet`, `CrossreactivityPhycian`, `CrossreactivityPatient`, `HiddenFoodPhysician`, `HiddenFoodPatient`, `ExcludeIgE`, `ExcludeIgG`, `ExcludeIgG4`) VALUES (0, $patient, '$tpl[2]', '$tpl[3]', '$tpl[4]', '$tpl[5]', '$tpl[6]', '$tpl[7]', '$tpl[8]', '$tpl[1]', '$tpl[10]', '$tpl[11]', '$tpl[12]', '$tpl[13]')";
    $results = @mysql_unbuffered_query($sql);
   }
   else{
    $tpl = mysql_fetch_array($results, MYSQL_BOTH);
    $template[0] = $tpl;
   }
  }
 }
 else{
  $err .= "<br/>ERROR SEL CLI: $error<br/>$sql";
 }
$time['client record'] = number_format((microtime(true) - $startTime),3); 
if (strlen($client) == 6){

 if ($sub > 1){
  $tpl[4] = intval($_POST['C4']);
  $tpl[5] = intval($_POST['C5']);
  $tpl[6] = intval($_POST['C6']);
  $tpl[7] = intval($_POST['C7']);
  $tpl[8] = intval($_POST['C8']);
  $tpl[9] = intval($_POST['C9']);
  $tpl[13] = intval($_POST['R1']);
  $tpl[2] = intval($_POST['R2']);
  $tpl[3] = intval($_POST['R3']);
  $sql = "UPDATE `template` SET 
`CutOff` = $tpl[2],
`CutOffG` = $tpl[13],
`excludeMethod` = $tpl[3],
`CrossreactivityGrocery` = $tpl[4],
`CrossreactivityDiet` = $tpl[5],
`CrossreactivityPhycian` = $tpl[6],
`CrossreactivityPatient` = $tpl[7],
`HiddenFoodPhysician` = $tpl[8],
`HiddenFoodPatient` = $tpl[9] WHERE `Client` = 0 AND `Patient` = $patient";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) > 0){
   $err .= "<br/>UPDATE ERROR PAT TPL: $error<br/>$sql<br/>";
  }
  $template[4] = $tpl;
 }

 elseif ($sub == 1){
  $sql = "UPDATE `template` SET`ExcludeIgE` = $tpl[10],`ExcludeIgG` = $tpl[11],`ExcludeIgG4` = $tpl[12] WHERE `Client` = 0 AND `Patient` = $patient";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) > 0){
   $err .= "<br/>UPDATE ERROR PAT TPL: $error<br/>$sql<br/>";
  }
}
 flush();
 ob_flush();
 $cutOffValues = array('','0/1','1','2','3');
 $cutoff = $cutOffValues[$tpl[2]]; 
 $cutoffG = $cutOffValues[$tpl[13]]; 
//  HEADER AND GLOBALS 

if (strlen($client) == 6 AND strlen($patient) == 6){

 $foodsTable = "`Foods$client`";
 @mysql_unbuffered_query("SELECT 1 FROM $foodsTable LIMIT 1 ");
 if (mysql_errno() == 1146){
  mysql_unbuffered_query("CREATE TABLE $foodsTable LIKE `Allergens`");
  mysql_unbuffered_query("ALTER TABLE $foodsTable DISABLE KEYS");
  mysql_unbuffered_query("INSERT INTO $foodsTable SELECT * FROM `Foods888887` ORDER BY `alpha` ASC,`Description` ASC");
  mysql_unbuffered_query("ALTER TABLE $foodsTable ENABLE KEYS");
 }
 $type = array('Added','IgE','IgG','IgG4');
 $type[9] = 'Added';
 $strike = $tpl[3];
 
 if ($sub == 2){
  foreach($patients as $key=>$value){
    @mysql_unbuffered_query("UPDATE `Test` SET `Exclude` = 0 WHERE `Patient` = $value");
    @mysql_unbuffered_query("DELETE FROM `Exceptions` WHERE `Patient`= $value");
  }
  foreach ($_POST as $k => $v){
    if (substr($k,0,1) == 'e'){
      $code = substr($k,2);
	  foreach($patients as $key=>$value){
        @mysql_unbuffered_query("UPDATE `Test` SET `Exclude` = 1 WHERE `Patient` = $value AND `Code` = '$code' ");
	  }
    }
      elseif (substr($k,0,1) == 'a'){
        $id = substr($k,2);
       $flip[$id] = 4;
     }
   }
 }
 $time['template'] = number_format((microtime(true) - $startTime),3);
 //   ################
  //  BUILD FOOD TABLE        
 //   ################
 $type = array('Added','IgE ','IgG ','IgG4');
 $status = array(array('','NEG','<span style="color:#f00;font-weight:700;">POZ</span>','<span style="color:#eb0;font-weight:700;">EXC</span>','<span style="color:#eb0;font-weight:700;">INC</span>'),
   array('','RMV','<span style="color:#f00;font-weight:700;">INC</span>','<span style="color:#eb0;font-weight:700;">INC</span>','<span style="color:#eb0;font-weight:700;">INC</span>')); 
 $poz = array(0,1,2,2);
 $getPoz = array( // getPoz[tpl[2](cutoff)][score] neg=>1 poz=>2 
  '0/1' => array('0' =>1,'0/1'=>2,'1'=>2,'2'=>2,'3'=>2,'4'=>2,'5'=>2,'6'=>2),
   '1' => array('0' =>1,'0/1'=>1,'1'=>2,'2'=>2,'3'=>2,'4'=>2,'5'=>2,'6'=>2),
   '2' => array('0' =>1,'0/1'=>1,'1'=>1,'2'=>2,'3'=>2,'4'=>2,'5'=>2,'6'=>2),
   '3' => array('0' =>1,'0/1'=>1,'1'=>1,'2'=>1,'3'=>2,'4'=>2,'5'=>2,'6'=>2));
 $iGrey = '<div class="blank"></div>';
 $iMinus = '<div class="minus"></div>';
 $iPoz = array('','<div class="plus"></div>','');
 $iPlus = $iPoz[$strike];
 $iCheck = '<div class="checkmark"></div>';
 $iComp = array('','<div class="up"></div>','');
 $iNeg = $iComp[$strike];
 $iUps = array('<div class="up"></div>','<div class="up"></div>','');
 $iUp = $iUps[$strike];
 $getIcon = array( // getIcon[exc][poz/neg/untested]  $getIcon[$foods[$id][4]][$foods[$id][5]];
     0=> array(0=>$iGrey,1=>$iMinus,2=>$iPlus),
     1=> array(0=>$iGrey,1=>$iMinus,2=>$iCheck),
     3=> array(0=>$iGrey,1=>$iNeg,2=>$iCheck),
     2=> array(0=>$iUp,1=>$iNeg,2=>$iPlus),
     6=> array(0=>$iGrey,1=>$iMinus,2=>$iPlus));
 //   1=> array(0=>xxxx,1=>xxxx,2=>xxxx,3=>xxxx,4=>xxxx,5=>xxxx,6=>xxxx),

 $pBold = '<p class="tested">&#x2009;';
 $pStrike = '<p class="strike">&#x2009;';
 $pRemove = '<p class="hide">;';
 $pStrike = array($pStrike,$pStrike,$pRemove);
 $pPlus = $pStrike[$strike];
 $pRegular = '<p class="notTested">&#x2009;';
 
 
 $getStyle = array(
     0=> array(0=>$pRegular,1=>$pBold,2=>$pPlus),
     1=> array(0=>$pRegular,1=>$pBold,2=>$pBold),
     3=> array(0=>$pPlus,1=>$pPlus,2=>$pPlus),
     2=> array(0=>$pPlus,1=>$pPlus,2=>$pPlus),
     6=> array(0=>$pRegular,1=>$pBold,2=>$pPlus));
    
 $lf = "</p><br/>\n";
 $slf = array($lf,$lf,"</p>\n");
 $strikeLF = $slf[$strike];
 $getLF = array(
    0=> array(0=>$lf,1=>$lf,2=>$strikeLF),
    1=> array(0=>$lf,1=>$lf,2=>$lf),
    3=> array(0=>$strikeLF,1=>$strikeLF,2=>$strikeLF),
    2=> array(0=>$strikeLF,1=>$lf,2=>$strikeLF),
    6=> array(0=>$lf,1=>$lf,2=>$strikeLF));

 $setFlip[1] = array(0,1); // setFlip[pat:status + pat:exclude/checkbox + sub] clears 
 $setFlip[2] = array(0,0);
 $next = 500;
 $chk = 17;
 $setInc = array( 
    0=> array(0=>0,1=>0,2=>0),
    1=> array(0=>0,1=>1,2=>1));
 $time['create icons'] = number_format((microtime(true) - $startTime),3);
 $foods = array();
 //         0    1 v0     2 v6  3 v7 4 v8  5 v9
 $sql = "SELECT `Code`,`Description`,`alpha`,`Day`,`Group`,`id` FROM $foodsTable WHERE `Type` > 0 ORDER BY `alpha` ASC , `Description` ASC";
 $results = mysql_query($sql);
 while ($fd = mysql_fetch_array($results, MYSQL_NUM)){list($Code,$Description,$Alpha,$Day,$Group,$Id ) = $fd;
  $code2id[$fd[0]][] = $fd[5];
  if (isset($foods[$Id])){continue;}
  $grp = $Alpha; //intval($fd[2]);
  $day = $Day;  //intval($fd[3]);
  $foods[$Id] = array($Description,0,0,0,0,0,$Alpha,$Day,$Group,$Code,'','','',0);
  if ($Group == 0 ||($Day & 8 || $Day == 0) ){continue;}
  $groups[$Alpha][$Description] = $Id;
 }
 mysql_free_result($results);
 $time['build food table'] = number_format((microtime(true) - $startTime),3);

 $cutOffValues = array('','0/1','1','2','3');
 $cutoffType = array(0,$cutoff,$cutoffG,$cutoffG);
 foreach ($patients as $p){
  $sql = "SELECT `Code`,`Type`,`Score`,`Exclude` FROM `Test` WHERE `Patient` = $p ";
  $results = @mysql_query($sql);
  while ($row = @mysql_fetch_array($results, MYSQL_NUM)){
   if (count($code2id[$row[0]]) == 0){
    $foods[$next] = array($row[4],0,0,0,0,0,0,9,0,0,'','','');
    $code2id[$row[0]][] = $next;
    $next++;
    $foods[441][13] = $foods[441][5] ;
   }
   $ndx = $row[1]+9;
   $foods[441][14] = $foods[441][5] ; 
 	$pos=14;
   foreach ($code2id[$row[0]] as $k => $id){
	  if($id ==0){continue;} 
    $ndx = $row[1]+9;
    $foods[$id][$ndx] = $row[2];
    $foods[$id][$row[1]] = $getPoz[$cutoffType[$row[1]]][$row[2]];
    $scores = $foods[$id][1] | $foods[$id][2] | $foods[$id][3];
    $foods[$id][5] = $poz[$scores];
    $inc = intval($row[3]); 
    $foods[$id][4] |= $setInc[$inc][$foods[$id][5]];
    if ($row[0] == 'G006'){$pos++;$foods[441][20] = $foods[441][5] ;}
   }
  }
  mysql_free_result($results);
 }
}
$components = array(); 
$priority = array(2,2,0); 
if ($sub == 1){
 $results = mysql_query("SELECT `id`,`value` FROM `Exceptions` WHERE `Patient` = $patient ");
 while ($excpt = mysql_fetch_array($results, MYSQL_NUM)){
  if($excpt[0] ==0){continue;} 
  $foods[$excpt[0]][4] |= 4;
  $foods[$row[0]][4] = 1;
 }
 mysql_free_result($results);
}
$time['combine patient & food'] = number_format((microtime(true) - $startTime),3);
if ($foods[290][5] == 2){ 
 $component = array(290,282, 283, 284, 285, 286, 287, 288, 289,297,296 );
 foreach ($component as $v){
  $components['Milk'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
  $foods[$v][13] = 1;
 }
}
if ($foods[78][5] == 2 || $foods[77][5] == 2 || $foods[58][5] == 2){
 $component = array(78,77,58);
	foreach ($component as $v){
	 $components['Wheat'][] = $v;
   $foods[$v][4] |= $priority[$foods[$v][5]];
	 $foods[$v][13] = 1;
	}
}
if ($foods[298][5] == 2 || $foods[299][5] == 2 || $foods[300][5] == 2 || $foods[301][5] == 2 || $foods[302][5] == 2){
 $component = array(299,300,301,302);
	foreach ($component as $v){
	 $components['Egg'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
	 $foods[$v][13] = 1;
	}
}

if ($foods[128][5] == 2 || $foods[129][5] == 2 || $foods[130][5] == 2 || $foods[131][5] == 2 || $foods[132][5] == 2 || $foods[133][5] == 2 || $foods[134][5] == 2 || $foods[135][5] == 2){
 $component = array(128,129,130,131,132,133,134,135);
 foreach ($component as $v){
  $components['Beans'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
  $foods[$v][13] = 1;
 }
}
if ($foods[59][5] == 2 || $foods[60][5] == 2 || $foods[63][5] == 2 || $foods[64][5] == 2 || $foods[70][5] == 2 ){
 $component = array(59,60,63,64,70);
 foreach ($component as $v){
  $components['Corn'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
  $foods[$v][13] = 1;
 }
}
 if ($foods[98][5] == 2 || $foods[99][5] == 2 || $foods[100][5] == 2 || $foods[101][5] == 2 || $foods[102][5] == 2 ){
 $component = array(98,99,100,101,102);
 foreach ($component as $v){
	 $components['Peppers'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
  $foods[$v][13] = 1;
 }
}
if ($foods[93][5] == 2 || $foods[94][5] == 2 ){
 $component = array(93,94);
 foreach ($component as $v){ 
	$components['Yeast'][] = $v;
  $foods[$v][4] |= $priority[$foods[$v][5]];
  $foods[$v][13] = 1;
 }
}

if (count($flip) > 0){
 foreach ($flip as $k=> $v){
  if($k == 0){continue;}
  $foods[$k][4] |= 4;
 }
}
$foods[441][15] = $foods[441][5] ;
unset($fd,$row,$k,$v);
$time['find components'] = number_format((microtime(true) - $startTime),3);

$ndx = 0;
$cliErr .= "<p>Patient:$patient</p><p>Client:$client</p>";
$pg = 1;
$hdr = "<p class=\"pgHdr\">&#x2003;$clientName Diet and Food Allergy Report&#x2003;&#x2003; Patient Name: $pat[1], $pat[2]&#x2003;&#x2003;Lab ID: $patient</p><div class=\"pgNumber\"><p class=\"right\">&#x2003;&#x2003;&#x2003;&#x2003;&#x2003;&#x2003;Page";
$subHdr = "&#x2003;<div class=\"plus\"></div><p class=\"tested\">&#x2009;Positive Result&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2009;Negative Result&#x2003;</p>
<div class=\"checkmark\"></div><p class=\"tested\">&#x2009;Positive Result, doctor included in diet&#x2003;</p>
<div class=\"tblank\"></div><p class=\"notTested\">&#x2009;Untested</p>";

 //setcookie("amxc", $client,time()+900);

 
//  ########     
 // TEMPLATE
//  ########     

$cutOff[$tpl[2]] = 'checked="checked"';
$cutOffG[$tpl[13]] = 'checked="checked"';
$mode[$tpl[3]] = 'checked="checked"';

$ndx = 4;
$check = array('','checked="checked"','checked="checked"');
do {
 $checked[$ndx] = $check[$tpl[$ndx]]; 
 $ndx++;
}while ($ndx < 13);


$excpetion = array("<div class=\"blank\"></div><p class=\"tested\">&#x2009;",
"<div class=\"blank\"></div><p class=\"strike\">&#x2009;",'<p class="hide">'); //$plus[strike/remove]
$plus = array("<div class=\"plus\"></div><p class=\"tested\">&#x2009;","<div class=\"plus\"></div><p class=\"strike\">&#x2009;",'<p class="hide">'); //$plus[strike/remove]
$icons = array('<div class="blank"></div>','<div class="minus"></div>','<div class="plus"></div>');
$icon[0][NULL] = "<div class=\"tblank\"></div><p class=\"notTested\">&#x2009;";
$icon[0][0] = "<div class=\"tblank\"></div><p class=\"notTested\">&#x2009;";
$icon[1][0] = $icon[0][0];
$icon[0][1] = "<div class=\"minus\"></div><p class=\"tested\">&#x2009;";
$icon[0][2] = $plus[$strike];
$icon[1][1] = "<div class=\"checkmark\"></div><p class=\"tested\">11&#x2009;";
$icon[1][2] = $icon[1][1];

$cap = array(array("</p><br/>\n","</p><br/>\n","</p><br/>\n",'','','',"</p><br/>\n"),
    array("</p><br/>\n","</p><br/>\n","</p><br/>\n",'','','',"</p><br/>\n"),
    array("</p><br/>\n","</p><br/>\n","</p><br/>\n",'','','',"</p></br/\n"));

if ($ip == '70.171.4.227' || $ip == '173.162.23.21' ){
echo <<<EOT
<form method="post" enctype="application/x-www-form-urlencoded" action="#">
<div><input type="hidden" name="sub" value="1" /><br/></div>
<fieldset class="widthWide"><legend>Get New Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
<button class="btn">Get New Patient</button> 
</fieldset></form>

EOT;
}
if(!stripos($_SERVER['HTTP_USER_AGENT'],'irefox')){
echo '<div><a href="https://www.mozilla.org/en-US/firefox/new/"><img width="96" height=96" src="http://dev.amxemr.com/ff.png" /></a><h3>WARNING: FireFox Browser is required to print Diet Plan.</h3></div>';
}
echo <<<EOT
<form method="get" enctype="application/x-www-form-urlencoded" action="http://dev.amxemr.com/editDiet.php">
<div>
<input type="hidden" name="c" value="$client" /><br/></div>
<fieldset class="widthWide"><legend>Client</legend><h3>$clientName<br/>$clientAddress</h3><button class="btn">Edit Foods</button>
</fieldset></form>
$name
<form method="post" enctype="application/x-www-form-urlencoded" action="#">

<div><input type="hidden" name="sub" value="2" /><br/>
<input type="hidden" name="p" value="$patient" /></div>

EOT;
$ca1 = array('a-',true,1);
$ca0 = array('a-',false,1);
$ce1 = array('e-',true,0);
$ce0 = array('e-',false,0);
$cNone = array(true,true,0);
$getChk = array(
   0=> array(0=>$cNone,1=>$cNone,2=>$ce0),
   1=> array(0=>$cNone,1=>$cNone,2=>$ce1),
   2=> array(0=>$ca0,1=>$ca0,2=>$cNone),
   6=> array(0=>$ca1,1=>$ca1,2=>$cNone));
   
	 
//  ################               ################
//  ################ POSITIVE FOOD CHECK BOXES ################
//  ################               ################ 
$pozChk = array(); 
$componentCheckbox = array(); 
$check[2] = '';
foreach ($foods as $k => $v ) { // POSITIVE FOOD CHECK BOXES 
$gc[$v[0]]=array($getChk[$v[4]][$v[5]][0],$v[4],$v[5]);
if ($getChk[$v[4]][$v[5]][0] === true|| $v[7] == 9|| $k == 0){continue;} // (substr($v[9],0,1) !='F' ||
$chk++;
$ic[0] = $v[9];
$ic[1] = $k;
if($foods[$k][13] == 1){continue;}
 $pf = $getChk[$v[4]][$v[5]][0] . $ic[$getChk[$v[4]][$v[5]][2]] ;
	if ($getChk[$v[4]][$v[5]][1]){
  $pozChk[$v[0]] = "<fieldset class=\"pozCheck\">&#x2003;<div class=\"desc\">$v[0]</div><div id=\"d$chk\" class=\"divCheck\" ><input id=\"c$chk\" class=\"check\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\" checked=\"checked\" />&#x2003;Include in Diet</div>&#x2003;&#x45;&#x2009;" . $icons[$v[1]] . "&#x2009;<div class=\"pozIcon\">$v[10]</div>&#x2003;&#x2003;&#x47;&#x34;&#x2009;" . $icons[$v[3]] . "&#x2009;<div class=\"pozIcon\">$v[12]</div>&#x2003;&#x47;&#x2009;" . $icons[$v[2]] . "&#x2009;<div class=\"pozIcon\">$v[11]</div>&#x2003;</fieldset>\n"; 
 }
 else{
 if (strlen($v[0]) < 2){$errNoDesc[] = $v;}
  $pozChk[$v[0]] = "<fieldset class=\"pozCheck\">&#x2003;<div class=\"desc\">$v[0]</div><div id=\"d$chk\" class=\"divNoCheck\" ><input id=\"c$chk\" class=\"noCheck\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\"  />&#x2003;Include in Diet</div>&#x2003;&#x45;&#x2009;" . $icons[$v[1]] . "&#x2009;<div class=\"pozIcon\">$v[10]</div>&#x2003;&#x2003;&#x47;&#x34;&#x2009;" . $icons[$v[3]] . "&#x2009;<div class=\"pozIcon\">$v[12]</div>&#x2003;&#x47;&#x2009;" . $icons[$v[2]] . "&#x2009;<div class=\"pozIcon\">$v[11]</div>&#x2003;</fieldset>\n"; 
	}
}
foreach($components as $key => $val){
 $componentCheckbox[$key] = "<p class=\"cHeader\">$key</p>";
 foreach($val as $ndx => $c){
  $v = $foods[$c];
  $chk++;
  $ic[0] = $v[9];
  $ic[1] = $c;
	$v9 = $v[9];
  $desc = $v[0];
  $pf = $getChk[$v[4]][$v[5]][0] . $ic[$getChk[$v[4]][$v[5]][2]] ;
  if ($v[5] > 0){
   if ($getChk[$v[4]][$v[5]][1]){
	  $componentCheckbox[$key] .= "<fieldset class=\"pozComponent\">&#x2003;<div class=\"desc\">$desc</div><div id=\"d$chk\" class=\"divCheck\" ><input id=\"c$chk\" class=\"check\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\" checked=\"checked\" />&#x2003;Include in Diet</div>&#x2003;&#x45;&#x2009;" . $icons[$v[1]] . "&#x2009;<div class=\"pozIcon\">$v[10]</div>&#x2003;&#x2003;&#x47;&#x34;&#x2009;" . $icons[$v[3]] . "&#x2009;<div class=\"pozIcon\">$v[12]</div>&#x2003;&#x47;&#x2009;" . $icons[$v[2]] . "&#x2009;<div class=\"pozIcon\">$v[11]</div>&#x2003;</fieldset>\n"; 
   }
	  else{
     $componentCheckbox[$key] .= "<fieldset class=\"pozComponent\">&#x2003;<div class=\"desc\">$desc</div><div id=\"d$chk\" class=\"divNoCheck\" ><input id=\"c$chk\" class=\"noCheck\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\"  />&#x2003;Include in Diet</div>&#x2003;&#x45;&#x2009;" . $icons[$v[1]] . "&#x2009;<div class=\"pozIcon\">$v[10]</div>&#x2003;&#x2003;&#x47;&#x34;&#x2009;" . $icons[$v[3]] . "&#x2009;<div class=\"pozIcon\">$v[12]</div>&#x2003;&#x47;&#x2009;" . $icons[$v[2]] . "&#x2009;<div class=\"pozIcon\">$v[11]</div>&#x2003;</fieldset>\n"; 
    
	  }
  }
  else{
	 $chkbx = '';
	 if (!is_numeric($v9)){$chkbx = "&#x2003;&#x45;&#x2009;" . $icon[0][0] . "&#x2009;<div class=\"pozIcon\">$v[10]</div>&#x2003;&#x2002;&#x47;&#x34;&#x2009;" . $icon[0][0] . "&#x2009;<div class=\"pozIcon\">$v[12]</div>&#x2002;&#x47;&#x2009;" . $icon[0][0] . "&#x2009;<div class=\"pozIcon\">$v[11]</div>";
	 }
	 if ($getChk[$v[4]][$v[5]][1]){
    $componentCheckbox[$key] .= "<fieldset class=\"pozComponent\">&#x2003;<div class=\"desc\">$desc</div><div id=\"d$chk\" class=\"divCheck\" ><input id=\"c$chk\" class=\"check\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\" checked=\"checked\" />&#x2003;Include in Diet</div>$chkbx</fieldset>\n"; 
   }
	 else{
    $componentCheckbox[$key] .= "<fieldset class=\"pozComponent\">&#x2003;<div class=\"desc\">$desc</div><div id=\"d$chk\" class=\"component\" ><input id=\"c$chk\" class=\"\" type=\"checkbox\" name=\"$pf\" value=\"2\" onclick=\"check('$chk')\"/>&#x2003;Include in Diet</div>$chkbx</fieldset>\n";
	 }
	}
 }
}

if ((count($pozChk) + count($componentCheckbox)) > 0){
echo "<fieldset class=\"pozBox\"><h2>Positive Foods</h2><p>Check to Include in Diet and Grocery List</p><fieldset><button class=\"btn\">Update</button> </fieldset>";
ksort($pozChk);
foreach ($pozChk as $k => $v){
 echo $v;
}
ksort($componentCheckbox);
foreach ($componentCheckbox as $k => $v){
 echo $v;
}
echo '<br/><button class="btn">Update</button> </fieldset>';
unset($k,$v,$pozChk);
}
else{
echo '<h2><br/>No Positive Results Found</h2>';
}
echo <<<EOT

<fieldset class="widthWide">
<legend>Positive IgE Cutoff</legend> 
<div id="d10" class="divNoCheck" ><input id="c10" class="noCheck" type="radio" name="R2" value="1" onclick="radio(10,10,13)" $cutOff[1] />&#160;&#160;0/1&#x2003;</div><br/>
<div id="d11" class="divNoCheck" ><input id="c11" class="noCheck" type="radio" name="R2" value="2" onclick="radio(11,10,13)" $cutOff[2] />&#160;&#160;1&#x2003;</div><br/>
<div id="d12" class="divNoCheck" ><input id="c12" class="noCheck" type="radio" name="R2" value="3" onclick="radio(12,10,13)" $cutOff[3] />&#160;&#160;2&#x2003;</div>
<div id="d13" class="divNoCheck" ><input id="c13" class="noCheck" type="radio" name="R2" value="4" onclick="radio(13,10,13)" $cutOff[4] />&#160;&#160;3&#x2003;</div>
<p>Current IgE Cutoff: $cutoff<br/>&#x2003;</p>
<legend>Positive IgG/IgG4 Cutoff</legend> 
<div id="d14" class="divNoCheck" ><input id="c14" class="noCheck" type="radio" name="R1" value="1" onclick="radio(14,14,17)" $cutOffG[1] />&#160;&#160;0/1&#x2003;</div><br/>
<div id="d15" class="divNoCheck" ><input id="c15" class="noCheck" type="radio" name="R1" value="2" onclick="radio(15,14,17)" $cutOffG[2] />&#160;&#160;1&#x2003;</div><br/>
<div id="d16" class="divNoCheck" ><input id="c16" class="noCheck" type="radio" name="R1" value="3" onclick="radio(16,14,17)" $cutOffG[3] />&#160;&#160;2&#x2003;</div>
<div id="d17" class="divNoCheck" ><input id="c17" class="noCheck" type="radio" name="R1" value="4" onclick="radio(17,14,17)" $cutOffG[4] />&#160;&#160;3&#x2003;</div>
<p>Current IgG/IgG4 Cutoff: $cutoffG</p>

<button class="btn">Update</button>

</fieldset><div><br/></div><fieldset class="widthWide"><legend>Exclude Method</legend>
<div id="d2" class="divNoCheck" ><input id="c2" class="noCheck" type="radio" name="R3" value="1" onclick="radio(2,2,3)" $mode[1] />&#160;&#160;Strikethrough&#x2003;</div><br/>
<div id="d3" class="divNoCheck" ><input id="c3" class="noCheck" type="radio" name="R3" value="2" onclick="radio(3,2,3)" $mode[2] />&#160;&#160;Remove from Diet&#x2003;</div><br/>
<br/><button class="btn">Update</button> </fieldset>

<fieldset class="widthWide"><legend>Display</legend>
<div id="d5" class="divNoCheck" ><input id="c5" class="noCheck" type="checkbox" name="C5" value="1" onclick="check(5)" $checked[5]/>&#160;&#160;Diet Page&#160;&#160;</div>
<div id="d4" class="divNoCheck" ><input id="c4" class="noCheck" type="checkbox" name="C4" value="1" onclick="check(4)" $checked[4] />&#160;&#160;Grocery Page</div><br/>
<div id="d6" class="divNoCheck" ><input id="c6" class="noCheck" type="checkbox" name="C6" value="1" onclick="check(6)" $checked[6] />&#160;&#160;Food Families </div>
<div id="d7" class="divNoCheck" ><input id="c7" class="noCheck" type="checkbox" name="C7" value="1" onclick="check(7)" $checked[7] />&#160;&#160;Hidden Foods</div>
<div id="d8" class="divNoCheck" ><input id="c8" class="noCheck" type="checkbox" name="C8" value="1" onclick="check(8)" $checked[8]/>&#160;&#160;Cross-Reactivity</div><br/><br/>
<button class="btn">Update</button></fieldset>
<div id="c9"></div><div id="d9"></div>
</form></div></div>

EOT;
flush();
ob_flush();
$time['setp'] = number_format((microtime(true) - $startTime),3);

echo <<<EOT
<div id="cover">
<img width="514" height="154" src="data:image/jpg;base64,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" alt="allergy medicine" />
<h1>&#x2003;<br/>Food Allergy Diet</h1>
<div id="name">
<h4>Prepared For:<span class="red"> $pat[2] $pat[1]</span></h4>
<h4><span class="red">$clientName</span></h4>
</div>

<img width="606" height="208" src="data:image/jpg;base64,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" alt="shots"/>

</div>
<div class="pgBrk"></div>
<div id="page1">
<h2>&#x2003;<br/>An Approach to Food Allergy</h2>
<h3>&#x2003;<br/>Avoid the Offending Food:</h3>
<p class="text1">One of the best approaches to managing food allergy is to avoid (eliminate) or rotate eating the offending food. Enclosed you will find a sample rotation diet based on a 4 day rotation which has been grouped by food families. (The removal of certain foods from your diet may create nutritional problems so you need to consult with your physician prior to changing your current diet).</p>
<h3>Be aware of Pollen/Food Cross-reactivity:</h3>
<p class="text1">Allergy patients who suffer from inhalant allergy often exhibit allergic reactions in the lips, mouth and throat when exposed to certain foods. In many instances, this clinical response to food is due to pollen allergens that contain proteins similar to those found in the allergic food of the patient (referred to as cross-reactivity). The clinical condition is known as the &#x201C;pollen-food allergy syndrome&#x201D; or &#x201C;oral allergy syndrome&#x201D;. Enclosed you will find information regarding the pollen-food interaction and which pollens may affect you based on your test results.</p>
<h3>Learn about Food Families:</h3>
<p class="text1">Food are grouped into families based scientific characteristics that make them similar to one another. If you have a positive result and are diagnosed to be allergic to a food, it may indicate that you will be allergic to other foods in that family. However, it does not necessary mean you will have problems with all foods within that family group. Your diet plan has been constructed to rotate foods by their respective families according to your physician’s instructions. Additionally, information grouping foods by their respective family are presented in your diet plan. When adding new foods to your diet, their family category must be taken into account.</p>
<h3>Read all Food Labels:</h3>
<p class="text1">Read food labels to identify the presence of foods to which you may be allergic. Your diet plan has a &#x201C;hidden food&#x201D; listing for foods to which you are allergic and may not normally associate with other foods that contain them. Become familiar with technical and scientific food names, for example some manufacturers may use the terms gluten and wheat interchangeably. Make sure to read the ingredients label each time you purchase the food, since manufacturers may change items.</p>
<h3>Ask About Ingredients:</h3>
<p class="text1">When eating at restaurants or someone else’s home, question what foods are used in the preparation of the meal. Removing the offending food from the plate may not prevent a reaction, particularly if foods are prepared in the same container.</p>
<h3>Prepare for Emergencies:</h3>
<p class="text1">Learn to identify your food symptoms quickly and have a plan of action. Teach friends and family the warning signs of severe food allergy and how to manage the situation. If you are highly allergic to a certain food or foods, you need to discuss with your physician about carrying an injectable epinephrine device as well as antihistamines to treat accidental ingestion of the offending food. Consider wearing a medical bracelet indicating that you are highly allergic to the foods indicated. If you have an anaphylactic reaction after eating, you should have someone take you to the emergency room immediately, even if the symptoms subside.</p>
<p class="warn"> <br/>The information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor prior to altering your current diet.</p>
</div><div class="pgBrk"></div>
EOT;
flush();
ob_flush();
$cat = array('','Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish &#x26; Shellfish','Drinks');
$time['cover'] = number_format((microtime(true) - $startTime),3);

if ($tpl[5] == 1){  // DIET ##############################    
 $dietSubHdr[1] = "&#x2003;<div class=\"plus\"></div><p class=\"strike\">&#x2009;Positive Result, avoid&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative Result&#x2003;</p>
<div class=\"checkmark\"></div><p class=\"tested\">&#x2009;Positive Result, doctor included in diet&#x2003;</p>
<div class=\"up\"></div><p class=\"tested\">&#x2009;Untested Component of Positive Food&#x2003;</p>
<div class=\"tblank\"></div><p class=\"notTested\">&#x2009;Untested</p>";
 $dietSubHdr[2] = "&#x2003;<div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative Result&#x2003;</p>
<div class=\"checkmark\"></div><p class=\"tested\">&#x2002;Positive Result, avoid, doctor included in diet&#x2003;</p>
<div class=\"tblank\"></div><p class=\"notTested\">&#x2002;Untested</p>";
echo <<< EOT
$hdr 1</p></div><br/>$dietSubHdr[$strike]<p class="title">&#x2003;Diet Plan</p><div class="verbage"><p class="text">One of the best ways to help eliminate your food allergy symptoms is to &#x201C;rotate&#x201D; your foods, or plan a rotation diet. A rotation diet is a method of controlling food allergies by eating biologically related foods on the same day and then waiting at least four days before eating them again. This approach to eating can help those with food allergies by reducing symptoms and potentially from developing new food allergy as well. Below is a listing of foods grouped by &#x201C;family&#x201D; and are to be rotated over a 4 day period. When planning your menu you may select any of the foods indicated for that day. If you add foods not on the list, you should identify their food family for correct rotation. Please note that foods have been placed in categories that do not necessary fall under the scientific listing (e.g. tomato is listed under vegetable instead of fruit).</p></div>
EOT;
$pg = 1;
$grp = 0;
$savGrp = 99;
$day = 0;
$plus = array("<div class=\"plus\"></div><p class=\"tested\">&#x2009;","<div class=\"plus\"></div><p class=\"strike\">&#x2009;",'<p class="hide">'); //$plus[strike/remove]
$grp = 0;
$savGrp = 99;
$lineFeed = array('',"<br/>\n",'');
$dayEnd = array("","</div></div>\n","</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr 2</p></div><br/>$dietSubHdr[$strike]","</div></div>\n");
while (true){
 $day++;
 echo "<p class=\"title\">&#x2003;Day $day of Diet Plan</p>\n<div class=\"box\"><div class=\"col\">\n";
 foreach ($groups as $k => $v ) {
  $title = "<p class=\"hd\">&#x2002;" . $cat[$k] . "&#x2002;</p>\n";
  foreach ($v as $d => $id ) {
   if ($foods[$id][7] != $day){continue;}
//  $d = $foods[$id][4] . $foods[$id][5] . $strike . $d;
   $i = $getIcon[$foods[$id][4]][$foods[$id][5]];
   $s = $getStyle[$foods[$id][4]][$foods[$id][5]];
   $lf = $getLF[$foods[$id][4]][$foods[$id][5]];
   echo $title . $i . $s . $d . $lf ."\n"; 
   $title = '';
  }
 } 
 if ($day > 3){break;}
 echo $dayEnd[$day];
}
echo '</div></div><div class="pgBrk"></div>'; 
$pg += 2;
}
 $time['diet'] = number_format((microtime(true) - $startTime),3);
if ($tpl[4] == 1){ //  GROCERY LIST 
// ob_flush();  
$chkbx = array('<div class=""','','',);
$page1 = true;
$gHdr = "<p class=\"title\">&#x2003;Grocery List&#x2003;</p><div class=\"verbage\"><p class=\"text\">Below is a grocery list designed to aid you in setting up your rotation diet.<br/>Foods with a strike-through should not be purchased.</p></div>";
echo $hdr . ' ' . $pg . "</p></div><br/>$dietSubHdr[$strike]$gHdr<div class=\"box\"><div class=\"col\">\n";
$pg++;
 foreach ($groups as $k => $v ) {
  if ($k == 5 && $page1){
   $page1 = false;
   echo "</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr" . ' ' . $pg . "</p></div><br/>$dietSubHdr[$strike]<p class=\"title\">&#x2003;&#x2003;Grocery List&#x2003;Continued&#x2003;</p>"; 
   $pg++;
   echo "\n<div class=\"box\">\n<div class=\"col\">\n";
  }
  $title = "<p class=\"hd\">&#x2002;" . $cat[$k] . "&#x2002;</p>\n";
  foreach ($v as $d => $id ) { 
   if ($foods[$id][7] == 9){continue;}
   $i = $getIcon[$foods[$id][4]][$foods[$id][5]];
   $s = $getStyle[$foods[$id][4]][$foods[$id][5]];
   $lf = $getLF[$foods[$id][4]][$foods[$id][5]];
   echo $title . $i . $s . $d . $lf ."\n";
   $title = '';
  }
 }
 echo '</div></div><div class="pgBrk"></div>'; 
}

/*
 foreach ($groups as $k => $v ) {
  if ($k == 5 && $page1){
   $page1 = false;
   echo "</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr" . ' ' . $pg . "</p></div><br/>$dietSubHdr[$strike]<p class=\"title\">&#x2003;&#x2003;Grocery List&#x2003;Continued&#x2003;</p>"; 
   $pg++;
   echo "\n<div class=\"box\">\n<div class=\"col\">\n";
  }
  echo "<p class=\"hd\">&#x2002;" . $cat[$k] . "&#x2002;</p>\n";
  foreach ($v as $d => $code ) { 
   if ($foods[$code][7] == 9){continue;}  
  // $d = " S$strike " . "&#x2002;E" . $foods[$code][4] . $foods[$code][5] . $d . 'cap=' ;
   echo $icon[$foods[$code][4]][$foods[$code][5]] . $d . '</p><br/>'; // $cap[$strike][$foods[$code][5]];
  }
 }
 echo '</div></div><div class="pgBrk"></div>'; 
}

$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group` FROM $foodsTable WHERE `day` < 5 AND `Type` > 0  ORDER BY `alpha` ASC , `Description` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
 $grp = ($row[1] & 0x3CFF0000)/ 67108864;
 if ($savGrp != $grp){
  $savGrp = $grp;
  if ($row[2] == 6000){
   echo "</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr" . $pg . "</p></div><br/>$subHdr$gHdr"; 
   $pg++;
   echo "\n<div class=\"box\"><h4 class=\"title\">&#x2003;Grocery List&#x2003;Continued</h4>\n<div class=\"col\">\n";
   $continued = '';
  }
  echo "<p class=\"hd\">&#x2002;$category[$grp]&#x2002;</p>\n";
 }
 $d = $class[$row[5]];
 $d = $exI[$row[5]];
 $mark = $markClass[$tpl[3]][$d];
 $c = $display[$tpl[3]][$d];
 echo "$mark<p class=\"$c\">&#x2002;$row[3]</p><br/>\n";
}
*/
$strike = 0;
$plus[0] = "<div class=\"plus\"></div><p class=\"tested\">&#x2009;";
$icon[0][2] = $plus[0];
$subHdr = "<br/>&#x2003;<div class=\"plus\"></div><p class=\"tested\">&#x2002;Positive Result&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative Result&#x2003;</p>
<div class=\"tblank\"></div><p class=\"notTested\">&#x2002;Untested</p>";
 $time['grocery'] = number_format((microtime(true) - $startTime),3);
if ($tpl[6] == 1){  // FOOD FAMILIES 
$display[0] = array('tested','tested','tested','notTested','notTested');
$display[1] = array('tested','tested','tested','notTested','notTested');
$display[2] = array('tested','tested','tested','notTested','notTested');

$familyHead = "<div class=\"verbage\"><p class=\"text\">Elevated results do not always indicate that you are allergic to the food tested (e.g. IgG and IgG4 tests to eggs and milk have a high reactivity rate, but many patients do not have symptoms). Only your physician can determine the meaning of the laboratory results after reviewing your diet history and clinical symptoms.</p><p class=\"text\">Below are your test results with respect to the various food families. If you have a positive result and are diagnosed to be allergic to a food, it may indicate that you will be allergic to other foods in that family. However, it does not necessary mean you will have problems with all foods within that family group. Your diet plan has been constructed to rotate foods by their respective families according to you physicians instructions.</p></div>\n";
$pgBrk[1] = "<div class=\"pgBrk\"></div>\n$hdr" . ' ' . $pg . "</p></div>$subHdr<p class=\"title\">&#x2003;Food Families&#x2003;</p>$familyHead";
$pgBrk[2] = "</div></div>\n";
$pgBrk[4] = "</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr" . ' ' . ($pg + 1) . "</p></div>$subHdr<p class=\"title\">&#x2003;Food Families&#x2003;Continued</p>";
$pgBrk[3] = "</div></div>";
$pgBrk[5] = "</div></div>\n";
$pgBrk[6] = "</div></div>\n";
$pgBrk[7] = "</div></div>\n\n<div class=\"pgBrk\"></div>\n$hdr" . ($pg + 2) . "</p></div>$subHdr<p class=\"title\">&#x2003;Food Families&#x2003;Continued</p>";
$pgBrk[8] = "</div></div>\n";
$pgBrk[9] = "</div></div>\n";
$pgInc = array(1,0,0,1,0,0,1,0);
$savGrp = 99;
$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group`,`Type` FROM $foodsTable WHERE `alpha` > 0 AND `Family` > 0 ORDER BY $foodsTable.`Family` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
 $grp = $row[2] ;
 if ($grp == 8){break;}
 if ($savGrp != $grp){
  $savGrp = $grp;
  echo $pgBrk[$grp]; 
  echo "\n<p class=\"title\">&#x2003;$cat[$grp]</p><div class=\"box\">\n<div class=\"col\">\n";
 }
 if ($row[7] == 0){
  echo "<p class=\"hd\">&#x2002;$row[3]&#x2002;</p>\n";
  continue;
 }
 
 echo $icon[0][$foods[$row[0]][5]] . $row[3] . "</p><br/>\n";
}
echo '</div></div>';
$pg += 3;
}
 $time['food families'] = number_format((microtime(true) - $startTime),3);
if ($tpl[7] == 1){  //  HIDDEN FOODS
$hidden = '<div class="pgBrk"></div>' . $hdr . ' ' . $pg . '</p></div>' . $subHdr . '<p class="title">&#x2003; Hidden Foods Listing</p><div class="verbage"><p class="text">You have test tested positive to a food that is often referred to &#x201C;Hidden Food&#x201D; because it is found in other foods and not easy to identify. Make sure to read the labels of foods carefully to identify all ingredients.  Below is a listing of foods/food components that contain the food you may be allergic to:</p></div>';
$hiddenShown = false;
$boxes = 0;

if($foods[290][5] == 2||$foods[294][5] == 2 ||$foods[295][5] == 2 ||$foods[293][5] == 2 ||$foods[296][5] == 2 ||$foods[425][5] == 2){
 $boxes++;
 if (!$hiddenShown){echo $hidden . '<p class="title">&#x2003;Milk/Milk Related</p><div class="box">';$hiddenShown = true;$pg++;}
 echo '';
 $codes = array('F002','F076','F077','F078','F236','F358');
 $desc = array('Cow Milk', ' Lactalbumin, Alpha', 'Lactoglobulin, B.', 'Casein', ' Whey', ' Lactoferrin');
 $ndx = 0;
 while(true){
  $id = $code2id[$codes[$ndx]][0];
  if (isset($foods[$id])){
   echo '&#x2002;' . $icon[0][$foods[$id][5]] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
  else{
   echo '&#x2002;' . $icon[0][0] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
   if ($ndx >= 5){break;}
  $ndx++;
 }
 echo <<<EOT
<hr class="divide" />
<div class="col">
<p class="hf">Butter</p>
<p class="hf">Artificial Butter</p>
<p class="hf">Butter Flavored Oil</p>
<p class="hf">Casein and Caseinates</p>
<p class="hf">Cheese</p>
<p class="hf">Cheese Flavor</p>
<p class="hf">Cottage Cheese</p>
<p class="hf">Cream Cheese</p>
<p class="hf">Imitation Cheese</p>
<p class="hf">Cream</p>
<p class="hf">Whipped Cream</p>
<p class="hf">Curds</p>
<p class="hf">Custard</p>
<p class="hf">Dairy Product Solids</p>
<p class="hf">Half &#x26; Half</p>
<p class="hf">Hydrolysates</p>
<p class="hf">Ice Cream</p>
<p class="hf">Ice Milk</p>
<p class="hf">Sherbet</p>
<p class="hf">Nougat</p>
<p class="hf">Pudding</p>
<p class="hf">Quark</p>
<p class="hf">Recaldent</p>
<p class="hf">Rennet, Rennet Casein</p>
<p class="hf">Simplesse</p>
<p class="hf">Sour Cream</p>
<p class="hf">Imitation Sour Cream</p>
<p class="hf">Whey</p>
<p class="hf">Yogurt</p></div></div>
EOT;
}  
if($foods[299][5] == 2 || $foods[301][5] == 2 ||$foods[300][5] == 2 ||$foods[302][5] == 2 ){ 
 $codes = array('F001','F075','F245','F357');
 $desc = array('Egg White','Egg Yolk ','Egg, Whole','Ovomucoid (egg white)');
 $boxes++;
 
 if (!$hiddenShown){echo $hidden;$hiddenShown = true;$pg++;}
 echo '<p class="title">&#x2003;Eggs</p><div class="box">';
 $ndx = 0;
 while(true){
  $id = $code2id[$codes[$ndx]][0];
  if (isset($foods[$id])){
   echo '&#x2002;' . $icon[0][$foods[$id][5]] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
  else{
   echo '&#x2002;' . $icon[0][0] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
  if ($ndx >= 3){break;}
  $ndx++;
 }
 echo <<<EOT
<hr class="divide" />
<div class="col">
<p class="hf">Albumin</p>
<p class="hf">Apovitellin</p>
<p class="hf">Cholesterol Free Egg Substitute</p>
<p class="hf">Dried Egg</p>
<p class="hf">Egg White</p>
<p class="hf">Egg Yolk</p>
<p class="hf">Egg Wash</p>
<p class="hf">Eggnog</p>
<p class="hf">Fat Substitutes</p>
<p class="hf">Globulin</p>
<p class="hf">Mayonnaise</p>

</div></div>
EOT;
} 
if($foods[77][5] == 2 || $foods[78][5] == 2 || $foods[58][5] == 2){
 $boxes++;
 if (!$hiddenShown){echo $hidden;$hiddenShown = true;$pg++;}
$w = $icon[0][$foods[77][5]];
$wg = $icon[0][$foods[78][5]];
$wb = $icon[0][$foods[58][5]];
 echo <<<EOT
<p class="title">&#x2003;Wheat</p>
<div class="box">
&#x2003;$w&#x2009;Wheat&#x2003;</p>
&#x2003;$wg&#x2009;Wheat-Gluten&#x2003;</p>
&#x2003;$wb&#x2009;Wheat-Bran&#x2003;</p>
<hr class="divide" />
<div class="col">
<p class="hf">Baked Goods (Check Ingredients)</p>
<p class="hf">Bran</p>
<p class="hf">Bread (w/White or Wheat Flour)</p>
<p class="hf">Bread Crumbs</p>
<p class="hf">Bulgur</p>
<p class="hf">Cake Flour</p>
<p class="hf">Cereal Extract</p>
<p class="hf">Crackers, Cracker Meal</p>
<p class="hf">Farina</p>
<p class="hf">Flour (Check Ingredients)</p>
<p class="hf">Germ</p>
<p class="hf">Gluten</p>
<p class="hf">Malt, Malt Extract</p>
<p class="hf">Matzah</p>
<p class="hf">Noodles</p>
<p class="hf">Pasta</p>
<p class="hf">Tabbouleh</p>
<p class="hf">Unbleached Flour</p>
<p class="hf">Wheat Sprouts</p>

</div></div>
EOT;
}
if($foods[140][5] == 2 ||$foods[458][5] == 2 ||$foods[457][5] == 2 ){ 
 $codes = array('F013','F359','F360');
 $desc = array('Peanut',' Peanut, Ara h 1',' Peanut, Ara h 2');
 $boxes++;
 if (!$hiddenShown){echo $hidden;$hiddenShown = true;$pg++;}
 echo '<p class="title">&#x2003;Peanut / Peanut Related</p><div class="box">';
 $ndx = 0;
 while(true){
  $id = $code2id[$codes[$ndx]][0];
  if (isset($foods[$id])){
   echo '&#x2002;' . $icon[0][$foods[$id][5]] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
  else{
   echo '&#x2002;' . $icon[0][0] . "$desc[$ndx]&#x2002;&#x2002;</p>\n";
  }
   if ($ndx >= 2){break;}
  $ndx++;
 }
 echo <<<EOT
<hr class="divide" />
<div class="col">
<p class="hf">Arachic Oil</p>
<p class="hf">Artificial Nuts</p>
<p class="hf">Beer Nuts</p>
<p class="hf">Boiled Peanuts</p>
<p class="hf">Crushed Nuts</p>
<p class="hf">Crushed Peanuts</p>
<p class="hf">Dry Roasted Peanuts</p>
<p class="hf">Earth Nuts</p>
<p class="hf">Goober Peas</p>
<p class="hf">Goobers</p>
<p class="hf">Ground Nuts</p>
<p class="hf">Ground Peanuts</p>
<p class="hf">Hydrolyzed&#xa0;Peanut&#xa0;Protein</p>
<p class="hf">Mixed Nuts</p>
<p class="hf">Monkey Nuts</p>
<p class="hf">Nu&#xa0;Nuts&#xa0;Flavored&#xa0;Nuts</p>
<p class="hf">Nut Pieces</p>
<p class="hf">Nutmeat</p>
<p class="hf">Peanut Butter</p>
<p class="hf">Peanut Butter Chips</p>
<p class="hf">Peanut Butter Morsels</p>
<p class="hf">Peanut Flour</p>
<p class="hf">Peanut Oil</p>
<p class="hf">Peanut Paste</p>
<p class="hf">Peanuts Sauce</p>
<p class="hf">Peanut Syrup</p>
<p class="hf">Spanish Peanuts</p>
<p class="hf">Virginia Peanuts</p>

</div></div>
EOT;
} 
if($foods[141][5] == 2){
 $boxes++;
 if (!$hiddenShown){echo $hidden;$hiddenShown = true;$pg++;}
 echo <<<EOT
<p class="title">&#x2003;Soybean</p>
<div class="box">
&#x2003;<div class="plus"></div><p class="tested">&#x2009;Soybean</p>
<hr class="divide" />
<div class="col">
<p class="hf">Hydrolyzed Soy Protein</p>
<p class="hf">Kinnoko Flour</p>
<p class="hf">Kyodofu </p>
<p class="hf">Natto</p>
<p class="hf">Okara</p>
<p class="hf">Shoyu Sauce</p>
<p class="hf">Soy Albumin</p>
<p class="hf">Soy Bran</p>
<p class="hf">Soy Concentrate</p>
<p class="hf">Soy Fiber</p>
<p class="hf">Soy Flour</p>
<p class="hf">Soy Formula</p>
<p class="hf">Soy Grits</p>
<p class="hf">Soy Milk</p>
<p class="hf">Soy Miso</p>
<p class="hf">Soy Nuts</p>
<p class="hf">Soy Nut Butter</p>
<p class="hf">Soy Protein</p>
<p class="hf">Soy Protein Concentrate</p>
<p class="hf">Soy Protein Isolate</p>
<p class="hf">Tofu</p>
</div></div>
EOT;
}
if ($boxes > 4){$hiddenShown = false;}
if($foods[59][5] == 2){
 if (!$hiddenShown){echo $hidden;$hiddenShown = true;$pg++;}
 echo <<<EOT
<p class="title">&#x2003;Corn</p>
<div class="box">
&#x2003;<div class="plus"></div><p class="tested">&#x2009;Corn&#x2003;</p>
<hr class="divide" />
<div class="col">
<p class="hf">Alcohol</p>
<p class="hf">Artificial Flavorings</p>
<p class="hf">Artificial Sweeteners (e.g. Splenda )</p>
<p class="hf">Baking Powder</p>
<p class="hf">Bleached Flour</p>
<p class="hf">Corn Alcohol </p>
<p class="hf">Corn Extract</p>
<p class="hf">Corn Flour</p>
<p class="hf">Corn Oil </p>
<p class="hf">Corn Starch</p>
<p class="hf">Corn Syrup</p>
<p class="hf">Corn, Popcorn, Cornmeal</p>
<p class="hf">Cornstarch, Cornflour</p>
<p class="hf">Flavorings</p>
<p class="hf">Food Starch</p>
<p class="hf">Fructose</p>
<p class="hf">Fruit Juice Concentrate</p>
<p class="hf">Germ/Germ Meal</p>
<p class="hf">Hominy</p>
<p class="hf">Iodized Salt</p>
<p class="hf">Maize</p>
<p class="hf">Malt Syrup from Corn</p>
<p class="hf">Malt</p>
<p class="hf">Molasses</p>
<p class="hf">Saccharin</p>
<p class="hf">Salt (Iodized Salt)</p>
<p class="hf">Semolina</p>
<p class="hf">Sorbitol</p>
<p class="hf">Sorghum</p>
<p class="hf">Starch</p>
<p class="hf">Sugar (Check Ingredients)</p>
<p class="hf">Vanilla, Natural Flavoring</p>
<p class="hf">Vanilla, Pure or Extract</p>
<p class="hf">Vanillin</p>
<p class="hf">Vinegar, Distilled White</p>
<p class="hf">Vitamins</p>
<p class="hf">Xanthan Gum</p>
<p class="hf">Yeast (Check Ingredients)</p>
</div></div>
EOT;
}
}
 $time['hidden'] = number_format((microtime(true) - $startTime),3);
if ($tpl[8] == 1){ //  CROSS REACTIVITY
$ids = array();
$desc = array();
$ids[0] = array(431,433,432,426,427,428,429,430,471);
$desc[0] = array('Alder, European',' Alder, Sitka','Alder,Red','Birch, Gray','Birch, Red/River','Elm, American','Elm, Chinese','Elm,Scrub','Hazelnut');
$ids[1] = array(434);
$desc[1] = array('Sycamore');
$ids[2] = array(435);
$desc[2] = array('Mugwort');
$ids[3] = array(436);
$desc[3] = array('Sagebrush');
$ids[4] = array(459);
$desc[4] = array('Common Ragweed');
$ids[5] = array(448,443,437,449,450,451,470,454,439,453,455,444,442,446,438,440,452,441,445,447);
$desc[5] = array('Bahia','Bent/Redtop','Bermuda','Bluegrass,Canada','Brome, Smooth','Canary/Reed','Common Reed','Corn Pollen','Fescue, Meadow','Fescue, Red','Grass Mix #1','Johnson','June','Oat,CultivaRed','Orchard','Rye, Perennial','Sweet Vernal','Timothy','Velvet','Wheat, Cultivated');
$ids[6] = array(456);
$desc[6] = array('Latex');


$cross = array('Trees','Sycamore Tree','Mugwort','Sagebrush','Common Ragweed','Grasses','Latex');
$crossSQL = array('`Birch`','`Sycamore`','`Mugwort`','`Grasses`','`Latex`');
$pgBrk = array('</div></div>','</div></div>','</div></div>','</div></div>','</div></div>');
$crossHead = '<div class="pgBrk"></div>' . "$hdr $pg</p></div>$subHdr" . '<p class="title">&#x2003;Food Cross-reactivity Listing (Pollens and Foods)</p><div class="verbage"><p class="text">Allergy patients who suffer from inhalant allergy often exhibit allergic reactions in the lips, mouth and throat when exposed to certain foods. In many instances, this clinical response to food is due to pollen allergens that contain proteins similar to those found in the specific food ingested. This concept is referred to as the “pollen-food allergy syndrome” or “oral allergy syndrome”. Enclosed you will find information regarding the pollen-food interaction and which pollens may affect you based on your test results.</p></div>';
$lineBrk[0] = array_fill(0,9,'</p></td><td>');
$lineBrk[0][4] = '</p></td></tr><tr><td>';
$lineBrk[0][8] = '</p></td><td></td></tr></table><hr class="divide"/>';
$lineBrk[1][0] = '</p></td></tr></table><hr class="divide" />';
$lineBrk[2][0] = '</p></td></tr></table><hr class="divide" />';
$lineBrk[3][0] = '</p></td></tr></table><hr class="divide" />';
$lineBrk[4][0] = '</p></td></tr></table><hr class="divide" />';
//$lineBrk[2] = array_fill(0,3,'</p></td><td>');
//$lineBrk[2][2] = '</p></td><td><p class="tested">&#x2003;</p></td><td><p class="tested">&#x2003;</p></td></tr></table><hr class="divide" />';

$lineBrk[5] = array_fill(0,20,'</p></td><td>');
$lineBrk[5][4] = '</p></td></tr><tr><td>';
$lineBrk[5][9] = '</p></td></tr><tr><td>';
$lineBrk[5][14] = '</p></td></tr><tr><td>';
$lineBrk[5][19] = '</p></td><td></td></tr></table><hr class="divide"/>';
$lineBrk[6][0] = '</p></td></tr></table><hr class="divide" />';
$pgBrk = array_fill(0,7,'</div></div>');
$pg++;
$pgBrk[4] = '</div></div><div class="pgBrk"></div>' . "$hdr $pg</p></div>$subHdr" . '<p class="title">&#x2003;Food Cross-reactivity Listing (Pollens and Foods) Continued</p>';

//Trees('F020','F049','F138','F096','F092','F343','F288','F018','F031','F085','F100','F341','43','F259','F017','F153','F208','F134','F351','F132','F033','F283','F112','F144','F095','F013','F094','F263','F313','F150','F314','F210','F128','32','F035','F115','F129','F014','F044','F025','F256','F317','F329','F004');
//Trees('0168','0053','0007','0124','0024','0235','0034','0177','0118','0119','0008','0230','0043','0013','0179','0051','0018','0019','0049','0009','0020','0238','0097','0232','0010','0140','0054','0098','0248','0099','0100','0027','0400','0032','0103','0146','0004','0141','0005','0104','0184','0185','0040','0077');
$cx[0] = array(168,53,7,124,24,235,34,177,118,119,8,230,43,13,179,51,18,19,49,9,20,238,97,232,10,140,54,98,248,99,100,101,27,400,32,103,146,4,141,5,104,184,185,40,77);
//Sycamore('F049','F288','F008','43','F017','F208','F215','F134','F351','F033','F142','F095','F013','F210','32','F129','F044','F329');
//Sycamore('0053','0034','0059','0043','0179','0018','0160','0019','0049','0020','0138','0010','0140','0027','0032','0004','0005','0040');
$cx[1] = array(53,34,59,43,179,18,160,19,49,20,138,10,140,27,32,4,5,40);
//Mugwort('F049','F288','F031','F085','43','F247','F087','F208','F134','F351','F033','F013','F210','32','F129','F044','F329');
//Mugwort('0053','0034','0118','0119','0043','0252','0039','0018','0019','0049','0020','0140','0027','0032','0004','0005','0040');
$cx[2] = array(53,34,118,119,43,252,39,18,19,49,20,140,27,32,4,5,40);
//Sagebrush('F288','F031','F085','43','F208','F134','F351','F033','F013','F210','32','F129','F044','F329');
//Sagebrush('0034','0118','0119','0043','0018','0019','0049','0020','0140','0027','0032','0004','0005','0040');
$cx[3] = array(34,118,119,43,18,19,49,20,140,27,32,4,5,40);
//Ragweed('F092','F288','F244','43','F087','F208','F134','F351','F033','F013','F210','32','F129','F044','F316','F329');
//Ragweed('0024','0034','0144','0043','0039','0018','0019','0049','0020','0140','0027','0032','0004','0005','0264','0040');
$cx[4] = array(24,34,144,43,39,18,19,49,20,140,27,32,4,5,264,40);
//Grass('F356','F300','F301','F302','F303','F015','F288','F304','F008','FZ11','F153','F007','F355','F142','F012','F013','F210','32','F129','F009','F014','F044','F350','F025','F329','F004');
//Grass('0473','0131','0132','0133','0134','0135','0034','0058','0059','0062','0051','0069','0137','0138','0139','0140','0027','0032','0004','0071','0141','0005','0075','0104','0040','0077');
$cx[5] = array(473,131,132,133,134,135,34,58,59,62,51,69,137,138,139,140,27,32,4,71,141,5,75,104,40,77);
//Latex('F049','F096','F092','F305','F031','F085','F103','F087','F153','F127','F035','F025','F329');
//Latex('0053','0124','0024','0038','0118','0119','0174','0039','0051','0045','0103','0104','0040');
$cx[6] = array(53,124,24,38,118,119,174,39,51,45,103,104,40);
$ndx = 0;
$counts = array(8,0,0,0,0,19,0);
echo $crossHead ;

$counts = array(8,0,0,0,0,19,0);
do{
 $counts[$ndx] = count($codes[$ndx]);
 echo <<<EOT
<p class="title">&#x2003;$cross[$ndx]</p><div class="box">
<table summary="Cross-reactivity Allergens $ndx"><tr><td>
EOT;
 $idx = 0;
 foreach ($ids[$ndx] as $id){
  $h = $desc[$ndx];
  if (!is_null($foods[$id][0])){
   echo $icon[0][$foods[$id][5]] . $desc[$ndx][$idx] . $lineBrk[$ndx][$idx] . "\n";
  }
  else{
   echo $icon[0][0] . $desc[$ndx][$idx] . $lineBrk[$ndx][$idx] . "\n";
  
  }
  $idx++;
 }
 echo '<div class="col">';
 foreach ($cx[$ndx] as $f){ 
  echo $icon[0][$foods[$f][5]] . $foods[$f][0] . "</p><br/>\n";
 }
 echo $pgBrk[$ndx];
 $ndx++;
}while ($ndx < 7);
}
unset($lineBrk,$ids,$cx,$desc,$ndx);
 $time['crossX'] = number_format((microtime(true) - $startTime),3);
 $save = $startTime;
 foreach($time as $k =>$t){
   $i = intval($t * 1000);
   $x = $i/1000;
   $x -= $save;
//  echo "$k: $t =>" . number_format($x,3) . "<br/>\n";
  $save = $t;
 }
// echo $t; 
$show .= "\n\n===========================\n\n\n". var_export($time,true) . "\n\n===========================\n\n\n";
$show .= var_export($componentCheckbox,true);
$show .= var_export($foods,true);$show .= "\n\n===========================\n\n\n". var_export($time,true) . "\n\n===========================\n\n\n";
$show .= var_export($componentCheckbox,true);
$show .= var_export($foods,true);
if ($key == 0 || $ip != '70.171.10.12'){$show = '';}

echo <<<EOT
<pre>$show</pre>
</div>
<script type="text/javascript">
//<![CDATA[
var hd = document.getElementById('hd');
hd.style.display = 'none';
var bg = new Array('#2985EA','#f00');
var div = 1;
var c = new Array(13);
var d = new Array(13);
while(true){
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
function init(){hd.style.display='none'; }
//]]>
</script></body></html>
EOT;
flush();
ob_end_flush();
mysql_unbuffered_query("UPDATE `Patient` SET `Attributes` = $linked WHERE `Patient`= $patient ");
}
}
 if (!isset($sub) || $sub == 0){
  if ($key > 0 || $ip == '70.171.10.12' || $ip == '173.162.23.21' ){
  echo <<< EOT
<form method="post" enctype="application/x-www-form-urlencoded" action="#">
<div><input type="hidden" name="sub" value="1" /> <br/> </div>
<fieldset class="widthWide"><legend>Get Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
</fieldset>
<button class="btn">Get Diet</button></fieldset></fieldset></form><h1><br/> </h1></div>
$cliErr</div>
<script type="text/javascript">
//<![CDATA[
function hideHdr(){return;}
function init(){document.getElementById('hd').style.display='block'; }
//]]>
</script></body></html>
EOT;
  }
 }
ob_flush();
ob_end_flush();
if ($sub == 2 && count($flip) > 0){
 mysql_unbuffered_query("DELETE FROM `Exceptions` WHERE `Patient` = $patient");
 foreach ($flip as $k=>$v){
  mysql_unbuffered_query("INSERT INTO `amx_portal`.`Exceptions` (`Patient`, `id`, `Offset`, `value`) VALUES ($patient, '$k', 4, '4')");
 }
}

?>
