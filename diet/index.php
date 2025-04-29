<?php include('indexNew.php');exit;
$ip = $_SERVER["REMOTE_ADDR"];
if(substr($ip,0,11)  == '128.30.52.7' || $ip == '70.171.10.12' || $ip == '173.162.23.21' ){}
ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0; }
#content{width:100%;padding:0;margin:0 auto 0;max-width:960px;}
.box {border: 1px solid #000;margin:.2em 0 .3em 0;padding:.0 0 .2em 0;}
.verbage{border: 1px solid #000;margin:.5em 0 0 0;padding:.1em .5em .1em .5em;margin:.3em 0 .1em;}
.text{padding:.2em;margin-bottom:.2em;font:400 1.1em/1 Arial,sans-serif;}
.warn{padding:.2em;margin-bottom:.2em;font:700 1.25em/1 Arial,sans-serif;color:#f00;}
.col{margin:0 0 .3em .3em ;-webkit-column-count: 4;-moz-column-count: 4;-ms-column-count: 4;-o-column-count: 4;column-count: 4;}
p{margin:0 0 1px 0;padding:0;font:400 1em/.9 Arial,sans-serif;}
.hd{font-size:1em;font-weight:700;padding:2px 0 2px 1px; margin:2px 0 1px 0;color:#fff;background:#000;}
.divide{width:75%;margin:2px 0 2px 12%;padding:0;}
.plus     {margin:0;display:inline-block;width:12px;height:12px;border:1px solid #f00;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.minus    {margin:0;display:inline-block;width:12px;height:12px;border:1px solid #090;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.checkmark{margin:0;display:inline-block;width:12px;height:12px;border:1px solid #b80;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.blank    {margin:0;display:inline-block;width:12px;height:12px;border:1px solid #000;background:#eee;}

.tested   {display:inline;padding:0 0 1px 0;margin:0 0 0 .2em;font-weight:700;}
.strike   {display:inline;padding:0 0 1px 0;margin:0 0 0 .2em;font-weight:700;text-decoration:line-through;}
.notTested{display:inline;padding:0 0 1px 0;margin:0 0 0 .2em;}
.pageHead{padding:0 0 .3em 1em;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.pozCheck{width:38em;}
fieldset{background:#6cc;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}
.hide{display:none;}
h1{text-align:center;}
h2,h3{margin-bottom:0;}
h4{margin:0  0 .3em 0;padding-left:1em;}
pre{padding:0;margin:0;}
#hd,.noPrint{max-width:80em;}
button{width:7em;}
@media print{
.pageBreak {page-break-after:always;}
.noPrint{display:none;}
}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.break{clear:both;}
.widthWide{width:26em;padding-top:2em;}
.widthInside{width:24em;padding-top:2em;}
.desc{width:14em;display:inline-block;font-weight:700;}
.score{width:2em;display:inline;text-align:center;font-weight:700;}
.divCheck,.divNoCheck{color:#fff;width:16em;display:inline-block;padding:6px 0 6px 6px;margin-bottom:6px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
input[type="checkbox"],input[type="radio"] {margin-left:4px ;width:2em;height:2em;
display: inline;vertical-align: middle;position: relative;}
pre{font-size:2em;font-weight:700;}
.page,.title{font-weight:700;font-size:1.2em;color:#fff;background:#000;padding:2px;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{width:100%;padding:0;margin:0 auto 0}
td,tr{padding:0;margin:0}
td{width:150px;display:inline-block;}
</style></head><body onload="init()"><div id="content">
<div id="header" class="noPrint" onclick="hideHeader()" >

</div>
EOT;
ob_flush();
flush();
$template = array();
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
@mysql_select_db('amx_portal');
$checked = array_fill(1,12,'');
$cutOff = array_fill(1,3,'');
$mode = array_fill(1,2,'');
$patient = intval($_GET['p']);
$err .= "<br/>Patient:  $patient<br/>";
if (strlen($patient) == 6){

  $sql = "SELECT `Client`,`Last`, `First`, `ClientID` FROM `Patient` WHERE `Patient` = $patient";
  $results = @mysql_query($sql);
  $error = mysql_error();
  $rows = @mysql_num_rows($results);
  if (strlen($error) == 0 AND $rows == 1){
    $pat = mysql_fetch_array($results, MYSQL_BOTH);
    $client = $pat[0] ;
    $err .= "<br/>Patient Name: " . htmlspecialchars($pat[2]) . ', ' . htmlspecialchars($pat[1]) . '<br/>';
    $patID = $pat[3];
    $sql = "SELECT `Name`, `RecordsCRC`, `Session`,`Phone`,`Fax`,`Address`,`Address2`,`City`,`State`,`PostalCode` FROM `Client`  WHERE `Number` = $client LIMIT 1";
    $results = @mysql_query($sql);
    $error = mysql_error();
	$cliErr =  "<h4>$error <br/>$sql</h4>";
    $rows = @mysql_num_rows($results);
    if (strlen($error) == 0 AND $rows == 1){
      $cli = mysql_fetch_array($results, MYSQL_BOTH);
      $clientName = htmlspecialchars($cli[0]);
	  $clientAddress = $cli[5];
	  if (strlen($cli[6]) > 0){$clientAddress .= '<br/>' . $cli[6];}
	  if (strlen($cli[4]) > 9){$fax = "Fax: $cli[4]<br/>";}else{$fax = '';}
	  
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
          $sql = "INSERT INTO `amx_portal`.`template` (`Client`, `Patient`, `CutOff`, `excludeMethod`, `CrossreactivityGrocery`, `CrossreactivityDiet`, `CrossreactivityPhycian`, `CrossreactivityPatient`, `HiddenFoodPhysician`, `HiddenFoodPatient`, `ExcludeIgE`, `ExcludeIgG`, `ExcludeIgG4`) VALUES ('$client', '0','$tpl[2]', '$tpl[3]', '$tpl[4]', '$tpl[5]', '$tpl[6]', '$tpl[7]', '$tpl[8]', '$tpl[1]', '$tpl[10]', '$tpl[11]', '$tpl[12]')";
          $results = @mysql_unbuffered_query($sql);
        }
        else{
          $tpl = mysql_fetch_array($results, MYSQL_BOTH);
          $template[1] = $tpl;
        }
        $sql = "INSERT INTO `amx_portal`.`template` (`Client`, `Patient`, `CutOff`, `excludeMethod`, `CrossreactivityGrocery`, `CrossreactivityDiet`, `CrossreactivityPhycian`, `CrossreactivityPatient`, `HiddenFoodPhysician`, `HiddenFoodPatient`, `ExcludeIgE`, `ExcludeIgG`, `ExcludeIgG4`) VALUES (0, $patient, '$tpl[2]', '$tpl[3]', '$tpl[4]', '$tpl[5]', '$tpl[6]', '$tpl[7]', '$tpl[8]', '$tpl[1]', '$tpl[10]', '$tpl[11]', '$tpl[12]')";
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
}
$cliErr .= "<p>Patient:$patient</p><p>Client:$client</p>";
$header = "<div class=\"pageHead\"><p>$clientName Food and Diet Report&#x2003;&#x2003; Patient Name: $pat[2], $pat[1]&#x2003;&#x2003;Lab ID: $patient</p></div>";
$subhead = "<div class=\"subHead\"><div class=\"plus\"></div><p class=\"strike\">&#x2002;Positive&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative&#x2003;</p><div class=\"checkmark\"></div><p class=\"tested\">&#x2002;Positive, doctor included in diet&#x2003;</p><div class=\"blank\"></div><p class=\"notTested\">&#x2002;Untested</p></div>";

$err .= '<br/>GET<pre>' . var_export($_GET,true) . '</pre><br/>';
$sub = intval($_GET['sub']);
if (strlen($client) == 6 AND strlen($patient) == 6){
echo <<<EOT
<div class="noPrint">
EOT;
  if ($sub > 1){
    $tpl[4]  = intval($_GET['C4']);
    $tpl[5]  = intval($_GET['C5']);
    $tpl[6]  = intval($_GET['C6']);
    $tpl[7]  = intval($_GET['C7']);
    $tpl[8]  = intval($_GET['C8']);
    $tpl[9]  = intval($_GET['C9']);
    $tpl[10]  = intval($_GET['C10']);
    $tpl[11]  = intval($_GET['C11']);
    $tpl[12]  = intval($_GET['C12']);
    $tpl[2] = intval($_GET['R2']);
    $tpl[3]  = intval($_GET['R3']);
    $sql = "UPDATE `template` SET 
`CutOff` = $tpl[2],
`excludeMethod`  = $tpl[3],
`CrossreactivityGrocery` = $tpl[4],
`CrossreactivityDiet` = $tpl[5],
`CrossreactivityPhycian` = $tpl[6],
`CrossreactivityPatient` = $tpl[7],
`HiddenFoodPhysician` = $tpl[8],
`HiddenFoodPatient` = $tpl[9],
`ExcludeIgE` = $tpl[10],
`ExcludeIgG` = $tpl[11],
`ExcludeIgG4` = $tpl[12]  WHERE `Client` = 0 AND `Patient` = $patient";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) > 0){
    $err .= "<br/>UPDATE ERROR PAT TPL: $error<br/>$sql<br/>";
  }
  $template[4] = $tpl;
}
//else{ // not a _POST 
  $CutOff = $tpl[2];
  $excludeMethod  = $tpl[3];
//}
$err .= '<br/>TEMPLATES:<pre>' . var_export($template,true) . '</pre><br/>';
$cutOffValues = array('','0/1','1','2');
$cutoff = $cutOffValues[$tpl[2]]; 
$cutOff[$tpl[2]] = 'checked="checked"';
$mode[$tpl[3]] = 'checked="checked"';
$ndx = 4;
$check = array('','checked="checked"','checked="checked"');
do {
  $checked[$ndx] = $check[$tpl[$ndx]]; 
// if ($ndx == 9){$err .= "<br/>CHECKED $ndx: $checked[$ndx] tpl[$ndx]=$tpl[$ndx]";}
  $ndx++;
}while ($ndx < 13);
$err .= '<br/>TPL<br/><pre>' . var_export($tpl,true) . '</pre><br/>';
$err .= '<br/>CHECKED<pre>' . var_export($checked,true) . '</pre><br/>';
echo <<<EOT
<div id="hd" class="noPrint">
<div  onclick="hideHeader()"><img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/></div>

<form method="get" enctype="application/x-www-form-urlencoded" action="https://dev.amxemr.com/diet.php">
<div><input type="hidden" name="sub" value="2" /> <br/> </div>
<fieldset class="widthWide"><legend>Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
<button class="login">Update</button>  
</fieldset><div><br/></div><fieldset class="widthWide">
<legend>Positive Score Cutoff</legend>
<div id="d13" class="divNoCheck" ><input id="c13"  class="noCheck" type="radio" name="R2" value="1"  onclick="radio(13,13,15)"  $cutOff[1] />&#160;&#160;0/1&#x2003;</div><br/>
<div id="d14" class="divNoCheck" ><input id="c14"  class="noCheck" type="radio" name="R2" value="2"  onclick="radio(14,13,15)"  $cutOff[2] />&#160;&#160;1&#x2003;</div><br/>
<div id="d15" class="divNoCheck" ><input id="c15"  class="noCheck" type="radio" name="R2" value="3"  onclick="radio(15,13,15)"  $cutOff[3] />&#160;&#160;2&#x2003;</div>
<p><br/></p><p>Current Score Cutoff: $cutoff</p>
</fieldset><div><br/></div><fieldset class="widthWide"><legend>
Exclude</legend>
<div id="d10" class="divNoCheck" >
<input id="c10"  class="noCheck" type="checkbox" name="C10" value="1" $checked[10] onclick="check(10)" />
&#160;&#160;IgE</div><br/>
<div id="d11" class="divNoCheck" ><input id="c11"  class="noCheck" type="checkbox" name="C11" value="1" $checked[11] onclick="check(11)" />&#160;&#160;IgG4</div><br/>
<div id="d12" class="divNoCheck" ><input id="c12"  class="noCheck" type="checkbox" name="C12" value="1" $checked[12] onclick="check(12)" />&#160;&#160;IgG</div>
<p><br/></p><fieldset class="widthInside"><legend>Method</legend>
<div id="d2"  class="divNoCheck" ><input id="c2"  class="noCheck" type="radio" name="R3" value="1" onclick="radio(2,2,3)" $mode[1] />&#160;&#160;Strike&#x2003;</div><br/>
<div id="d3"  class="divNoCheck" ><input id="c3"  class="noCheck" type="radio" name="R3" value="2" onclick="radio(3,2,3)" $mode[2] />&#160;&#160;Remove&#x2003;</div><br/>
</fieldset><br/><button class="login">Update</button> </fieldset><h2>&#x2003;<br/>
Pollen Food<br/>Crossreactivity Rules</h2>
<fieldset class="widthWide"><legend>Display</legend>
<div id="d4"  class="divNoCheck" ><input id="c4"  class="noCheck" type="checkbox" name="C4" value="1" onclick="check(4)" $checked[4] />&#160;&#160;Grocery Page</div><br/>
<div id="d5"  class="divNoCheck" ><input id="c5"  class="noCheck" type="checkbox" name="C5" value="1" onclick="check(5)"  $checked[5]/>&#160;&#160;Diet Page&#160;&#160;</div>
</fieldset><fieldset class="widthWide"><legend>
Display 6-7</legend>
<div id="d6"  class="divNoCheck" ><input id="c6"  class="noCheck" type="checkbox" name="C6" value="1" onclick="check(6)" $checked[6] />&#160;&#160;Physician Page </div><br/>
<div id="d7"  class="divNoCheck" ><input id="c7"  class="noCheck" type="checkbox" name="C7" value="1" onclick="check(7)" $checked[7] />&#160;&#160;Patient Page</div>
<br/><button class="login">Update</button> </fieldset>
<h2>&#x2003;<br/>
Hidden Food List Rules</h2>
<fieldset class="widthWide"><legend>Display</legend>
<div id="d8"  class="divNoCheck" ><input id="c8"  class="noCheck" type="checkbox" name="C8" value="1" onclick="check(8)"  $checked[8]/>&#160;&#160;Physician Page</div><br/>
<div id="d9"  class="divNoCheck" ><input id="c9"  class="noCheck" type="checkbox" name="C9" value="1" onclick="check(9)" $checked[9] />&#160;&#160;Patient Page</div>
<br/><button class="login">Update</button> </fieldset>
EOT;
// ob_flush();
$chk = 15;
//$err .= '<br/>cutOff<pre>' . var_export($cutOff,true) . '</pre><br/>';
//$err .= '<br/>mode<pre>' . var_export($mode,true) . '</pre><br/>';
  $hideHeader = "hd.style.display = 'none';";
  $sql = "SELECT `Code` FROM `Allergens` WHERE `Day` > 0 ORDER BY `alpha` ASC , `Description` ASC";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) > 0){
    $err .= "<br/>SEL Allergens: $error<br/>$sql<br/>";
  }
  $rows = mysql_num_rows($results);
  $err .= "<br/>SEL Allergens Rows= $rows<br/>";
  $codes = array_fill(0,$rows,3);
  $ndx = 0;
  while($row = mysql_fetch_array($results, MYSQL_NUM)){
    $codes[$ndx] = $row[0];
    $ndx++;
  }
  $class = array_fill_keys($codes,4);
  $count = count($codes); 

$display[0] = array('tested','tested','tested','','notTested');
$display[1] = array('tested','tested','strike','','notTested');
$display[2] = array('tested','tested','hide','','notTested');
$display[0][NULL] = 'blank';

  $exclude = array(0,$tpl[10],$tpl[12],$tpl[11]);
  ksort($_GET);
  foreach ($_GET as $k => $v){
    if (substr($k,0,1) == 'a'){
      $sql = "INSERT INTO `amx_portal`.`Test` (`Patient`, `Code`, `Type`, `Score`, `Description`,`Attributes`) VALUES ('$patient', '$code', 0, 9, '$v',0)";
      mysql_unbuffered_query($sql);
      if (mysql_error() == 0){
        $add = "<h2><br/>$v Added</h2>";
      }
      else {
        $add = "<h2><br/>Error Adding $v</h2>";
      }
    }
    elseif (substr($k,0,1) == 'e'){
      $val = preg_split('/-/',$k);
      $excludeTest[$val[1]][$val[2]] = 1;
    }
    elseif (substr($k,0,1) == 'd'){
      if ($k == 'desc'){
        if (strlen($v) > 0){
          $sql = "SELECT `id`,`Code`,`Description` FROM `Allergens` WHERE `Type`=1 AND `Description` LIKE '%$v%' GROUP BY `Description`";
          $results = @mysql_query($sql);
          $rows = mysql_num_rows($results);
          if ($rows == 1){
            $row = mysql_fetch_array($results, MYSQL_NUM);
            $sql = "INSERT INTO `amx_portal`.`Test` (`Patient`, `Code`, `Type`, `Score`, `Description`,`Attributes`) VALUES ('$patient', '$row[1]', 9, 9, '$row[2]',0)";
            mysql_unbuffered_query($sql);
            if (mysql_error() == 0){
               $add = "<h2><br/>$v Added</h2>";
            }
            else {
              $add = "<h2><br/>Error Adding $v</h2>";
            }
          }
          elseif  ($rows > 0){
            $add = '<table>';
            while ($row = mysql_fetch_array($results, MYSQL_NUM)) {
            $add .= <<< EOR
<tr><td>
<div class="divNoCheck"><input id="a$row[0]" class="nocheck" name="a$row[0]" value="$row[1]" onclick="chkDay('$row[0]',0)" type="checkbox" />&#160;add&#160;&#160;&#160;</div></td>
<td>$row[2]</td></tr>
EOR;
            }
            $add .= '</table>';
          }
          else{
            $add = '<h2>$v Not found</h2>';
          }
        }
      }
      else{
        $val = preg_split('/-/',$k);
        $sql = "DELETE FROM `Test` WHERE `Patient` = '$patient' AND `Code` = '$val[1]' AND `Type`='0' ";
        @mysql_unbuffered_query($sql);
      }
    }
    elseif ($k == 'l'){
      $list = $v;
    }
  }  // end of foreach $_GET
//TYPE:IgE             EQUATE(1)
//TYPE:IgG             EQUATE(2)
//TYPE:IgG4            EQUATE(3)
$attr = array(2,1);
if ($sub > 1){
  $sql = "UPDATE `Test` SET `Attributes`= 0 WHERE `Patient` = $patient" ;
  $results = @mysql_unbuffered_query($sql);
        if (strlen($error) > 0 ){
          $err .= "<br/>UPDATE TEST ERROR: $error<br/>$sql<br/>";
        }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[10]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND `Patient` = $patient AND `Type` = 1" ;
  $results = @mysql_unbuffered_query($sql);
        if (true){ //strlen($error) > 0 ){
          $err .= "<br/>UPDATE TEST IgE ERROR: $error<br/>$sql<br/>";
        }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[12]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND  `Patient` = $patient AND `Type` = 2" ;
  $results = @mysql_unbuffered_query($sql);
        if (true){ //strlen($error) > 0 ){
          $err .= "<br/>UPDATE TEST IgG ERROR: $error<br/>SQL: $sql<br/>";
        }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[11]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND  `Patient` = $patient AND `Type` = 3" ;
  $results = @mysql_unbuffered_query($sql);
        if (strlen($error) > 0 ){
          $err .= "<br/>UPDATE TEST IgG4 ERROR: $error<br/>$sql<br/>";
        }
  if (count($excludeTest) > 0 && $sub == 2 ) {
    foreach ($excludeTest as $k => $v){
      foreach ($v as $type => $x){
        $sql = "UPDATE `Test` SET `Attributes`= 1 WHERE `Patient`=$patient AND  `Code` = '$k' AND `Type` = $type";
        $results = @mysql_unbuffered_query($sql);
        $error = mysql_error();
        $rows = @mysql_num_rows($results);
        if (strlen($error) > 0 ){
          $err .= "<br/>UPDATE TEST ERROR: $error<br/>$sql<br/>";
        }
      }
    }
  }
}
  $err .= '<br/>ExcludeTests: <pre>' . var_export($excludeTest,true) . '<br/></pre><br/>';
// ob_flush();
$pt = array(0,1,2,2);
$type = array('Added','IgE','IgG','IgG4');
  $sql = "SELECT `Code`,`Type`,`Score`,`Description`,`Attributes`  FROM `Test` WHERE `Patient` =  $patient ORDER BY `Type` ASC,`Score` ASC ";
  $results = @mysql_query($sql);
  $error = mysql_error();
  $rows = @mysql_num_rows($results);
  if (strlen($error) > 0){
    $err .= "<br/>Rows:$rows<br/>SEL TST: $error<br/>$sql<br/>";
  }
  else{
    $err .= "<br/>Test Rows:$rows<br/>";
  }
  while ($row = mysql_fetch_array($results, MYSQL_NUM)){
  $desc[$row[0]] = $row[3];
    if ($class[$row[0]] == 2){continue;}
    $class[$row[0]] = $row[4];
    if ($row[2] >= $cutoff){
      $excludeTest[$row[0]][$row[1]] = $row[4];
      if ($exclude[$row[1]] == 1){
        $class[$row[0]] = 1;
      }
      else {
        $class[$row[0]] = $row[4];
      }
	   
      $data[$row[1]][$row[0]] = array($row[2],$row[3],$row[4]);
      $posbg[$row[0]] = 2;
      if (!$row[1] ){$epos[$row[0]] = true;}
      $cat = substr($row[0],0,1);
      $c[$row[0]] = $class[$row[2]];
      $s[$row[0]] = $score[$row[2]];
  !   $poz[$row[0]] = $pt[$row[1]];
      $pos[$row[1]][$row[0]] = array($row[1],$cat,$row[3],$row[2]);
    }
    else {
      if ($list == 1){$data[$row[1]][$row[0]] = array($row[2],$row[3],$row[4]);}
      $posbg[$row[0]] = 0;
      $s[$row[0]] = $score[0];
      $c[$row[0]] = $class[$row[2]];
      $class[$row[0]] = 0;
    }
    if ($row[2] == '9'){$class[$row[0]] = 2;}
  }
echo <<<EOT
<p> <br/> </p>
<fieldset class="pozCheck"><legend>Add Food</legend>
Description: <input class="desc" type="text" name="desc" value="" />&#160;<button class="login"> Add </button></fieldset>
<div><div class="noPrint">
EOT;
$excludeDivClass = array('divNoCheck','divCheck','divNoCheck');
$excludeChkClass = array('noCheck','check','noCheck');
$check[2] = '';
if (count($data) > 0){
  $err .= '<br/>Positive Tests:<br/>';
  foreach ($data as $k => $v1) {
    echo "<h2>Positive $type[$k] Foods</h2>";
//    $checked = $check($data[][]);
    foreach ($v1 as $key => $v2) {
	  if (substr($key,0,1) != 'F'){continue;}
      $chk++;
//      $err .= "$key $k $excludeTest[$key][$k]<br/>exType: " . $excludeType[$key][$k] . '<br/>';
       if ($v2[0] == '9'){
          echo "<fieldset class=\"pozCheck\"><div class=\"desc\">$v2[1]</div><div id=\"jd-$key-$k\"  class=\"divNoCheck\" ><input id=\"d-$key-$k\"  class=\"noCheck\" type=\"checkbox\" name=\"d-$key-$k\" value=\"7\" onclick=\"check('$key-$k') \" />&#160;Delete&#160;</div></fieldset><br/>\n";
       }
//       elseif($excludeTest[$key][$k] == 1 || $exclude[$k] == 1) {
//         echo "<fieldset class=\"pozCheck\">$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d$chk\"  class=\"divCheck\" ><input id=\"c$chk\"  class=\"check\" type=\"checkbox\" name=\"e-$key-$k\" value=\"8\" onclick=\"check('$chk')\"  checked />&#x2003;Exclude from Positive&#160;</div></fieldset><br/>\n";  
//       }
       else {
         echo "<fieldset class=\"pozCheck\">$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d$chk\"  class=\"" . $excludeDivClass[$excludeTest[$key][$k]] . "\" ><input id=\"c$chk\"  class=\"" . $excludeChkClass[$excludeTest[$key][$k]] . "\" type=\"checkbox\" name=\"e-$key-$k\" value=\"7\" onclick=\"check('$chk')\" " . $check[$excludeTest[$key][$k]] . "  />&#x2003;Exclude from Positive&#160;</div></fieldset><br/>\n";
         $et = $excludeType[$key][$k] ;
         $edc = $excludeDivClass[$excludeType[$key][$k]];
         $err .= "K: $k Type:$type[$k] Key: $key excludeType: $et excludeDivClass: $edc";
       }
    }
  } 
}
else{
  echo "<h2>No Positives</h2><p class=\"emp\">Cut Off: $cutoff</p>";
}
echo '<br/><button class="login">Update</button><p>&#x2003;<br/>&#x2003;</p><hr class="divide" />';
echo <<<EOT
</div></div></form></div><div class="break"></div></div>
<div  onclick="hideHeader()"><img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/></div>
<h2>An Approach to Food Allergy</h2>
<h3>Avoid the Offending Food:</h3>
<p class="text">One of the best approaches to managing food allergy is to avoid or rotate eating the offending food.  Enclosed you will find a sample rotation diet based on a 4 day rotation which has been grouped by food families.  (The removal of certain foods from your diet may create nutritional problems so you need to consult with your physician prior to changing your diet)</p>
<h3>Be aware of Pollen/Food Cross-reactivity:</h3>
<p class="text">Allergy patients who suffer from inhalant allergy often exhibit allergic reactions in the lips, mouth and throat when exposed to certain foods.  In many instances, this clinical response to food is due to pollen allergens that contain proteins similar to those found in (the cross-reactivity  of various trees, weeds or grass pollen (to which the patient has sensitivity) with the specific food ingested.  This concept is referred to as the “pollen-food allergy syndrome” or “oral allergy syndrome”.  Enclosed you will find information regarding the pollen-food interaction and which pollens may affect you based on your test results.</p>
<h3>Learn about Food Families:</h3>
<p class="text">If you have a positive food result and are diagnosed to be allergic, it does not necessarily mean that you will be allergic to all foods in that family.  However often patients will have problems with multiple foods within that family group.  Your diet plan has been constructed to rotate foods by their respective families according to your physician’s instructions.	 Additionally, information grouping foods by their respective family are presented in your diet plan.</p>
<h3>Read all Food Labels:</h3>
<p class="text">Read food labels to identify the presence of foods to which you may be allergic.  Your diet plan has a “hidden food” listing for foods to which you are allergic and may not normally be associated with other foods that contain them.</p>
<p class="text">Become familiar with technical and scientific food names, for example some manufactures may use the terms gluten and wheat interchangeably. </p>
<p class="text">·Make sure to read the ingredients each time you purchase the food, since manufactures may change items.</p>
<h3>Ask About Ingredients:</h3>
<p class="text">When eating at restaurants or someone else’s home, question what foods are used in the preparation of the meal.  Removing the offending food from the plate may not prevent a reaction.</p>
<h3>Prepare for Emergencies:</h3>
<p class="text">Learn to identify your food symptoms quickly and have a plan of action.</p>
<p class="text">Teach friends and family the warning signs of severe food allergy and how to manage the situation.</p>

<p class="text">If you are highly allergic to a certain food or foods, you need to discuss with your physician about carrying injectable epinephrine and antihistamines to treat accidental ingestion of the offending food.</p>
<p class="text">Consider wearing a medical bracelet indicating that you are highly allergic to the foods indicated.</p>
<p class="text">If you have an anaphylactic reaction after eating, you should have someone take you to the emergency room immediately, even if the symptoms subside.</p>
<p class="warn"> <br/>The information presented in this report does not constitute medical advice and is for your general information only.</p><p class="warn">Consult with the doctor prior to altering your current diet.</p>
<p class="text">$clientName<br/>Phone:$cli[3]<br/>$fax$clientAddress<br/>$cli[7], $cli[8] $cli[9]<br/></p>
<div class="pageBreak"></div>
$header$subhead<div class="verbage"><p class="text">One of the best ways to help eliminate your food allergy symptoms is to &#x201C;rotate&#x201D; your foods, or plan a rotation diet. A rotation diet is a method of controlling food allergies by eating biologically related foods on the same day and then waiting at least four days before eating them again. This approach to eating can help those with food allergies by reducing symptoms and potentially from developing new food allergy as well.</p><p class="text">Below is a listing of foods grouped by &#x201C;family&#x201D; and are to be rotated over a 4 day period.  When planning your menu you may select any of the foods indicated for that day.  If you add foods not on the list, you should identify their food family for correct rotation.</p><p class="text">Please note that foods have been placed in categories that do not necessary fall under the scientific listing (e.g. tomato is listed under vegetable instead of fruit).</p></div>
EOT;
// ob_flush();
$category = array('Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish &amp; Shellfish','Drinks');
$group = 0;
$saveGroup = 99;
$day = 0;
$markClass[0] = array('<div class="minus"></div>','<div class="checkmark"></div>','<div class="plus"></div>','<div class="blank"></div>','<div class="blank"></div>');
$markClass[1] = array('<div class="minus"></div>','<div class="checkmark"></div>','<div class="plus"></div>','<div class="blank"></div>','<div class="blank"></div>');
$markClass[2] = array('<div class="minus"></div>','<div class="checkmark"></div>','','<div class="blank"></div>','<div class="blank"></div>');
$daySpace[1] = "</div></div>\n";
$daySpace[2] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead";
$daySpace[3] = "</div></div>\n";
while (true){
  $day++;
  echo "<div class=\"box\"><h4 class=\"title\">Day $day </h4>\n<div class=\"col\">\n";
//  $data[$row[1]][$row[0]] = array($score,$desc[3],$attr[4]);
  $sql = "SELECT `id`, `Family`, `Type`, `Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE `Day` = $day AND `Type` > 0   ORDER BY `alpha` ASC , `Description` ASC";
  $results = @mysql_query($sql);
  while($row = mysql_fetch_array($results, MYSQL_NUM)){
    $group = ($row[1] & 0x3CFF0000)/ 67108864;
    if ($saveGroup != $group){
      $saveGroup = $group;
      echo "<p class=\"hd\">&#x2002;$category[$group]&#x2002;</p>\n";
    }
    if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
      $d = 1;
    }
    else{
      $d = $class[$row[5]];
    }
    $mark = $markClass[$tpl[3]][$d];
    $c = $display[$tpl[3]][$d];
    echo "$mark<p class=\"$c\">&#x2002;$row[3]</p><br/>\n";
  }
  if ($day > 3){break;}
    echo $daySpace[$day];
}
// ob_flush();	
echo '</div></div><div class="pageBreak"></div>'; 
$gHead = "<div class=\"verbage\"><p class=\"text\">Below is a grocery list designed to aid you in setting up your rotation/elimination diet:</p></div>";
echo "$header$subhead$gHead<div class=\"box\"><h4 class=\"title\">Grocery List&#x2003;Page 1</h4><div class=\"col\">\n";
$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE `day` < 5 AND `Type` > 0   ORDER BY `alpha` ASC , `Description` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $group = ($row[1] & 0x3CFF0000)/ 67108864;
  if ($saveGroup != $group){
    $saveGroup = $group;
    if ($row[2] == 5000){
      echo "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead$gHead"; 
      echo "\n<div class=\"box\"><h4 class=\"title\">Grocery List&#x2003; Page 2</h4>\n<div class=\"col\">\n";
    }
    echo "<p class=\"hd\">&#x2002;$category[$group]&#x2002;</p>\n";
  }
  $d = $class[$row[5]];
  $mark = $markClass[$tpl[3]][$d];
  $c = $display[$tpl[3]][$d];
  echo "$mark<p class=\"$c\">&#x2002;$row[3]</p><br/>\n";
}
$subhead = "<div class=\"subHead\"><div class=\"plus\"></div><p class=\"tested\">&#x2002;Positive Test Results&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative Test Results&#x2003;</p><div class=\"checkmark\"></div><p class=\"tested\">&#x2002;Positive, doctor included in diet&#x2003;</p><div class=\"blank\"></div><p class=\"notTested\">&#x2002;Untested</p></div>";
$display[0] = array('tested','tested','tested','','notTested');
$display[1] = array('tested','tested','tested','','notTested');
$display[2] = array('tested','tested','tested','','notTested');

$familyHead = "<div class=\"verbage\"><p class=\"text\">Elevated results do not always indicate that you are allergic to the food tested (e.g. IgG and IgG4 tests to eggs and milk have a high reactivity rate, but many patients do not have symptoms).  Only your physician can determine the meaning of the laboratory results after reviewing your diet history and clinical symptoms.</p><p class=\"text\">Below are your test results with respect to the various food families.  If you have a positive food result (and are diagnosed to be allergic) it does not necessary mean that you will be allergic to all foods in that family, however often times patients will have problems with multiple foods within that grouping.  Your diet plan has been constructed to rotate foods by their respective families according to you physicians instructions.</p></div>\n";
$pageBreak[0] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead<p class=\"page\">Food Families&#x2003;Page 1 of 3</p>$familyHead";
$pageBreak[1] = "</div></div>\n";
$pageBreak[3] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead<p class=\"page\">Food Families&#x2003;Page 2 of 3</p>$familyHead";
$pageBreak[2] = "</div></div>";
//$pageBreak[4] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead<p class=\"page\">Food Families&#x2003;Page 3 of 4</p>$familyHead";
$pageBreak[4] = "</div></div>\n";
$pageBreak[5] = "</div></div>\n";
$pageBreak[6] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead<p class=\"page\">Food Families&#x2003;Page 3 of 3</p>$familyHead";
$pageBreak[7] = "</div></div>\n";
  // ob_flush();

$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group`,`Type` FROM `Allergens` WHERE `day` < 5 OR `Type`=0  ORDER BY `Allergens`.`Family` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $group = ($row[1] & 0x3CFF0000)/ 67108864;
  if ($saveGroup != $group){
    $saveGroup = $group;
    echo $pageBreak[$group]; 
    echo "\n<div class=\"box\"><h4 class=\"title\">$category[$group]</h4>\n<div class=\"col\">\n";
  }
  if ($row[7] == 0){
    echo "<p class=\"hd\">&#x2002;$row[3]&#x2002;</p>\n";
	continue;
  }
  if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
    $d = 1;
  }
  else{
    $d = $class[$row[5]];
  }
  $mark = $markClass[0][$d];
  $c = $display[0][$d];
  echo "$mark<p class=\"$c\">&#x2002;$row[3]</p><br/>\n";
}  
echo '</div></div>';
$hidden = '<div class="pageBreak"></div>' . $header . $subhead . '<div class="verbage"><h2>Hidden Foods Listing</h2><p class="text">You have test tested positive to a food that is often refered to &#x201C;Hidden Food&#x201D; because it is found in other foods and not easy to identify.  Make sure to read the labels of foods carefully to identify all ingredients.   Below is a listing of foods/components that contain the food you may be allergic to:</p></div>';
$hiddenShown = false;
$boxes = 0;
if($class['F002'] == 2||$class['F076'] == 2 ||$class['F077'] == 2 ||$class['F078'] == 2 ||$class['F236'] == 2 ||$class['F358'] == 2){
  $boxes++;
  if (!$hiddenShown){echo $hidden . '<div class="box">';$hiddenShown = true;}
  $codes = array('F002','F076','F077','F078','F236','F358');
  $desc = array('Cow Milk', ' Lactalbumin, Alpha', 'Lactoglobulin, B.', 'Casein', ' Whey', ' Lactoferrin');
  $ndx = 0;
  while(true){
    $d = $class[$codes[$ndx]];
    $mark = $markClass[0][$d];
    $c = $display[0][$d];
    echo "&#x2003;$mark<p class=\"$c\">&#x2009;$desc[$ndx]&#x2003;&#x2003;</p>";
    if ($ndx >= 5){break;}
    $ndx++;
  }
  echo <<<EOT
<p class="title">MILK/MILK RELATED</p>
<div class="col">
<p>Butter (including artificial butter and butter flavored oil)</p>
<p>Casein and caseinates</p>
<p>Cheese, cheese flavor, cottage cheese, cream cheese, imitation cheese</p>
<p>Cream, whipped cream</p>
<p>Curds</p>
<p>Custard</p>
<p>Dairy product solids</p>
<p>Half &amp; Half</p>
<p>Hydrolysates</p>
<p>Ice cream, ice milk, sherbet</p>
<p>Nougat</p>
<p>Pudding</p>
<p>Quark</p>
<p>Recaldent</p>
<p>Rennet, rennet casein</p>
<p>Simplesse</p>
<p>Sour cream, imitation sour cream</p>
<p>Whey</p>
<p>Yogurt</p>
</div></div>
EOT;
}   
if($class['F001'] == 2 ||$class['F075'] == 2 ||$class['F245'] == 2 ||$class['F357'] == 2 ){  
  $codes = array('F001','F075','F245','F357');
  $desc = array('Egg White','Egg Yolk ','Egg, Whole','Ovomucoid (egg white)');
  $boxes++;
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo '<div class="box">';
  $ndx = 0;
  while(true){
    $d = $class[$codes[$ndx]];
//    if ($d < 3 && $d != NULL){
      $mark = $markClass[0][$d];
      $c = $display[0][$d];
      echo "&#x2003;$mark<p class=\"$c\">&#x2009;$desc[$ndx]&#x2003;&#x2003;</p>";
//    }
    if ($ndx >= 3){break;}
    $ndx++;
  }
  echo <<<EOT
<p class="title">EGGS</p>
<div class="col">
<p>Albumin</p>
<p>Apovitellin</p>
<p>Cholesterol free egg substitute</p>
<p>Dried egg</p>
<p>Egg white, egg yolk</p>
<p>Egg wash</p>
<p>Eggnog</p>
<p>Fat substitutes</p>
<p>Globulin</p>
<p>Mayonnaise</p>
</div></div>
EOT;
} 
if($class['F004'] == 2){
  $boxes++;
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<div class="box">
&#x2003;<div class="plus"></div><p class="tested">&#x2002;Wheat&#x2003;</p>
<p class="title">Wheat</p>
<div class="col">
<p>Baked goods (check ingredients)</p>
<p>Bran</p>
<p>Bread (any type made with white flour, wheat flour), bread crumbs</p>
<p>Bulgur</p>
<p>Cake flour</p>
<p>Cereal extract</p>
<p>Crackers, cracker meal</p>
<p>Farina</p>
<p>Flour (check ingredients)</p>
<p>Germ</p>
<p>Gluten</p>
<p>Malt, malt extract</p>
<p>Matzah</p>
<p>Noodles</p>
<p>Pasta</p>
<p>Tabbouleh</p>
<p>Unbleached flour</p>
<p>Wheat sprouts</p>
</div></div>
EOT;
}
if($class['F013'] == 2 ||$class['F359'] == 2 ||$class['F360'] == 2 ){  
  $codes = array('F013','F359','F360');
  $desc = array('Peanut',' Peanut, Ara h 1',' Peanut, Ara h 2');
  $boxes++;
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo '<div class="box">';
  $ndx = 0;
  while(true){
    $d = $class[$codes[$ndx]];
    $mark = $markClass[0][$d];
    $c = $display[0][$d];
    echo "&#x2003;$mark<p class=\"$c\">&#x2009$desc[$ndx]&#x2003;&#x2003;</p>";
    if ($ndx >= 2){break;}
    $ndx++;
  }
  echo <<<EOT
<p class="title">PEANUT/PEANUT RELATED</p>
<div class="col">
<p>Arachic oil</p>
<p>Artificial nuts</p>
<p>Beer nuts</p>
<p>Boiled peanuts</p>
<p>Crushed nuts, crushed peanuts</p>
<p>Dry roasted peanuts</p>
<p>Earth nuts</p>
<p>Goober peas</p>
<p>Goobers</p>
<p>Ground nuts, ground peanuts</p>
<p>Hydrolyzed peanut protein</p>
<p>Mixed nuts</p>
<p>Monkey nuts</p>
<p>Nu nuts flavored nuts</p>
<p>Nut pieces</p>
<p>Nutmeat</p>
<p>Peanut butter, peanut butter chips, peanut butter morsels</p>
<p>Peanut flour</p>
<p>Peanut oil</p>
<p>Peanut paste</p>
<p>Peanuts sauce, peanut syrup</p>
<p>Spanish peanuts</p>
<p>Virginia peanuts</p>
</div></div>
EOT;
} 





if($class['F014'] == 2){
  $boxes++;
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  
  echo <<<EOT
<div class="box">
&#x2003;<div class="plus"></div><p class="tested">&#x2002;Soybean</p>;
<p class="title">Soybean</p>
<div class="col">
<p>Hydrolyzed soy protein</p>
<p>Kinnoko flour</p>
<p>Kyodofu </p>
<p>Natto</p>
<p>Okara</p>
<p>Shoyu sauce</p>
<p>Soy albumin</p>
<p>Soy bran</p>
<p>Soy concentrate</p>
<p>Soy fiber</p>
<p>Soy flour</p>
<p>Soy formula</p>
<p>Soy grits</p>
<p>Soy milk</p>
<p>Soy miso</p>
<p>Soy nuts</p>
<p>Soy nut butter</p>
<p>Soy protein, soy protein concentrate, soy protein isolate</p>
</div></div>
EOT;
}
if ($boxes > 4){$hiddenShown = false;}
if($class['F008'] == 2){
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<div class="box">
&#x2003;<div class="plus"></div><p class="tested">&#x2002;Corn&#x2003;</p>
<p class="title">Corn</p>
<div class="col">
<p>Alcohol</p>
<p>Artificial flavorings</p>
<p>Artificial sweeteners (e.g. Splenda )</p>
<p>Baking powder</p>
<p>Bleached flour</p>
<p>Corn alcohol </p>
<p>Corn extract</p>
<p>Corn flour</p>
<p>Corn oil </p>
<p>Corn starch</p>
<p>Corn syrup</p>
<p>Corn, popcorn, cornmeal</p>
<p>Cornstarch, cornflour</p>
<p>Flavorings</p>
<p>Food starch</p>
<p>Fructose</p>
<p>Fruit juice concentrate</p>
<p>Germ/germ meal</p>
<p>Hominy</p>
<p>Iodized salt</p>
<p>Maize</p>
<p>Malt syrup from corn</p>
<p>Malt</p>
<p>Molasses</p>
<p>Saccharin</p>
<p>Salt (iodized salt)</p>
<p>Semolina</p>
<p>Sorbitol</p>
<p>Sorghum</p>
<p>Starch</p>
<p>Sugar (check ingredients)</p>
<p>Vanilla, natural flavoring</p>
<p>Vanilla, pure or extract</p>
<p>Vanillin</p>
<p>Vinegar, distilled white</p>
<p>Vitamins</p>
<p>Xanthan gum</p>
<p>Yeast (check ingredients)</p>
</div></div>
EOT;
}
$subhead = "<div class=\"subHead\"><div class=\"plus\"></div><p class=\"tested\">&#x2002;Positive Test Results&#x2003;</p><div class=\"minus\"></div><p class=\"tested\">&#x2002;Negative Test Results&#x2003;</p><div class=\"blank\"></div><p class=\"notTested\">&#x2002;Untested</p></div>";

$codes = array();
$desc = array();
$codes[0] = array('T003','T146','T008','T107','T108','T100','T101','T153','T149'); 
$desc[0] = array(' Birch, Gray',' Birch, Red/River',' Elm, American',' Elm, Chinese ',' Elm,Scrub ',' Alder, European',' Alder,Red ',' Alder, Sitka ',' Hazelnut ');
$desc[1] = array('Sycamore');
$codes[1] = array('T140');
$codes[2] = array('W006','W111','W001'); 
$desc[2] = array('Mugwort','Sagebrush','CommonRagweed');
$codes[3] = array('G002','G003','G004','G005','G006','G008','G009','G010','G013','G014','G015','G017','G020','G021','G022','G023','G024','G025','GZ08','G026');
$desc[3] = array('Bermuda','Orchard','Fescue, Meadow','Rye, perennial','Timothy','June','Bent/Redtop','Johnson','Velvet','Oat,CultivaRed','Wheat, Cultivated','Bahia','Bluegrass,Canada','Brome, Smooth','Canary/Reed','Sweet Vernal','Fescue, Red','Corn Pollen','Grass Mix #1','Common Reed');
$desc[4] = array('Latex');
$codes[4] = array('K082');

$markHead = array('<div class="minus"></div>','<div class="checkmark"></div>','<div class="plus"></div>','<div class="blank"></div>','<div class="blank"></div>');
$markHead[NULL] = '<div class="blank"></div>';
$cross = array('Trees','Sycamore Tree','Weeds','Grasses','Latex');
$crossSQL = array('`Birch`','`Sycamore`','`Mugwort`','`Grasses`','`Latex`');

$pageBreak = array('</div></div>','</div></div>','</div></div>','</div></div>','</div></div>');
$crossHead = '<div class="pageBreak"></div>' . $header . $subhead . '<div class="verbage"><h4>Food Cross-reactivity Listing (Pollens and Foods)</h4><p class="text">Allergy patients who suffer from inhalant allergy often exhibit allergic reactions in the lips, mouth and throat when exposed to certain foods.  In many instances, this clinical response to food is due to pollen allergens that contain proteins similar to those found in the specific food ingested.  This concept is referred to as the “pollen-food allergy syndrome” or “oral allergy syndrome”.  Enclosed you will find information regarding the pollen-food interaction and which pollens may affect you based on your test results.</p></div>';
$lineBreak[0] = array_fill(0,9,'</td><td>');
$lineBreak[0][4] = '</td></tr><tr><td>';
$lineBreak[0][8] = '</td><td></td></tr></table><hr class="divide"/>';
$lineBreak[1][0] = '</td></tr></table><hr class="divide" />';
$lineBreak[2] = array_fill(0,3,'</td><td>');
$lineBreak[2][2] = '</td><td><p class="tested">&#x2003;</p></td><td><p class="tested">&#x2003;</p></td></tr></table><hr class="divide" />';
$lineBreak[3] = array_fill(0,20,'</td><td>');
$lineBreak[3][4] = '</td></tr><tr><td>';
$lineBreak[3][9] = '</td></tr><tr><td>';
$lineBreak[3][14] = '</td></tr><tr><td>';
//$lineBreak[3][15] = '</td></tr><tr><td>';
$lineBreak[3][19] = '</td><td></td></tr></table><hr class="divide"/>';
$lineBreak[4][0] = '</td></tr></table><hr class="divide" />';
$ndx = 0;
$counts = array(8,0,2,19,0);
echo $crossHead ;
$counts = array(8,0,2,19,0);
do{
  echo <<<EOT
<div class="box">
<p class="title">&#x2002;$cross[$ndx]</p><table summary="Cross-reactivity Allergens $ndx"><tr><td>
EOT;
  $code = 0;
  while(true){
    $d = $class[$codes[$ndx][$code]];
    if ($d > 2 || $d == NULL){$d = 4;}
    $mark = $markHead[$d];
    $c = $display[0][$d];
    $h = $desc[$ndx][$code];
    echo "$mark<p class=\"$c\">$h&#x2003;</p>" . $lineBreak[$ndx][$code] . "\n";
    $code++;
    if ($code > $counts[$ndx]){break;}
  }
  
  echo '<div class="col">';
  $sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group`,`Type` FROM `Allergens` WHERE $crossSQL[$ndx] = 1  ORDER BY `Allergens`.`Description` ASC";
  $results = @mysql_query($sql);
  $error = mysql_error();
  while($row = mysql_fetch_array($results, MYSQL_NUM)){
    if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
      $d = 1;
    }
    else{ 
      $d = $class[$row[5]];
    }
    $mark = $markClass[0][$d];
    $c = $display[0][$d];
    echo "$mark<p class=\"$c\">&#x2002;$row[3]</p><br/>\n";
  }
  echo $pageBreak[$ndx];
  
  
  
      // echo "<p>Error: $error<br>Query:  $sql</p>$pageBreak[$ndx]";
  
  
  
  
  
  
  
  
  
  $ndx++;
}while ($ndx < 5);


 $t = number_format((microtime(true) - $startTime),3);
echo <<<EOT
</div><div><p>&#x2003;<br/>Number of Seconds to Generate this Page: $t Seconds</p>
</div>
<script type="text/javascript">
//<![CDATA[
var c = new Array(13);
var d = new Array(13);
var bg = new Array('#2985EA','#f00');
var hd = document.getElementById('hd');
hd.style.display = 'none';
var div = 1;
while(true){
  div++;
  if (div > $chk){break;}
  d[div] = document.getElementById('d' + div);
  if (d[div]==null){alert('Null DIV: ' + div);continue;}
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
function hideHeader(){var disp = hd.style.display;if (disp != 'block'){hd.style.display = 'block';}else{hd.style.display='none';}}
function init(){ hd.style.display='none'; }
//]]>
</script></body></html>
EOT;
}
else{
  $patient = $_GET['p'];
  echo <<< EOT
<div id="hd" class="noPrint">
<form method="get" enctype="application/x-www-form-urlencoded" action="https://dev.amxemr.com/diet.php">
<div><input type="hidden" name="sub" value="1" /> <br/> </div>
<fieldset class="widthWide"><legend>Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
</fieldset><fieldset>
<button class="login">Get Diet</button></fieldset></form><h1><br/> </h1></div>
$cliErr</div></body></html>
EOT;
}
ob_flush();
ob_end_flush();
/*
$sql = "SELECT `Group`, COUNT(*) FROM Allergens WHERE `Day` = 1 AND `Type` = 1 GROUP BY `Group`;";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $skip[$row[0]] = false ;
}
$sql = "SELECT `Group`, COUNT(*) FROM Allergens WHERE `Day` = 1 AND `Type` != 1 GROUP BY `Group`;";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $skip[$row[0]] = false ;
}
*/
/*
SELECT * FROM `Patient` WHERE `Patient` = 156810 
*/
?>
