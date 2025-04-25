<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Cross Reactivity</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin-left:2%;background:#fff;color:#000;padding-bottom:10em; }
#content{width:90%;padding:0;margin:0;}
input[type="radio"],input[type="checkbox"]{
width:2em;
height:2em;
border:2px solid #eee;
outline:2px solid #eee;
display: inline;
margin:1px;
margin-left:4px;
vertical-align: middle;
position: relative;
background:#333;
color:#eee;}
.pozCheck{width:38em;}
fieldset{background:#6cc;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}
td{padding:2px 0 0 6px;border:0;margin:0;}
.hide{display:none;}
.item{color:#0ff;}
h1{text-align:center;}
h2,h3{margin-bottom:0;}
h4{margin-top:0;}
pre{padding:0;margin:0;}
.col{max-height:700px;-webkit-column-count: 4;-moz-column-count: 4;-ms-column-count: 4;-o-column-count: 4;column-count: 4;}
p{margin:0 0 1px 0;padding:0;font:400 1em/1 Arial,sans-serif;}
.hd{
font-size:1em;
font-weight:700;
padding:2px;
margin:4px 0 2px 0;color:#fff;background:#000;}
.s0,.s1,.s2,.s3,.s4,.s5,.tested{font-weight:700;padding:2px;}
.sz1{background:#ff8;color:#000;font-weight:700;padding:2px;}
.sz2{background:#fd0;color:#000;font-weight:700;padding:2px;}
.sz3{background:#fb5;color:#000;font-weight:700;padding:2px;}
.sz4{background:#e60;color:#fff;font-weight:700;padding:2px;}
.sz5{background:#f20;color:#fff;font-weight:700;padding:2px;}
.day{font-size:1.2em;}
.neg{font-weight:700;display:inline;}
.eq{background:#ffc;}
.pos{font-weight:700;display:inline;}
.tested{font-weight:700;display:inline;}
.yellow{background:#ff0;color:#000;display:inline;font-weight:700;}
.untested{padding-left:1em;}
.notTested{padding-left:1em;display:inline-block;}
#hd,.noPrint{background:#6AB4B3;color:#033;max-width:80em;}
button{width:7em;}
@media print
{

.pageBreak {page-break-after:always;}
.noPrint{display:none;}
}
.noPageBreak{}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.strike{text-decoration:line-through;font-weight:700;display:inline;}
.break{clear:both;}
.widthWide{width:26em;}
.widthInside{width:24em;}
.desc{width:14em;display:inline-block;font-weight:700;}
.score{width:2em;display:inline;text-align:center;font-weight:700;}
.plus      {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAANpFJe+0p+FsU/vu6ywAAAAADAAMAAACGoSPqQsRbMZYosoqUJB8vINd1SJBzceM5roUADs=');}
.minus     {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD2pS9Ds1PH68k2wWiwAAAAADAAMAAACFISPqcudAyNEQdg7aNg8uw+GIlAAADs=');}
.checkmark {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD+wS7LfuPv+/F28ZywAAAAADAAMAAACGISPqcsc04IIaDwgaRVzrsFpS3A1UIOiBQA7');}
.blank{margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;border:1px solid #000;}
.divCheck,.divNoCheck{color:#fff;width:16em;
display:inline-block;
padding:6px 0 6px 6px;
margin-bottom:6px;
vertical-align: middle;
position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
input[type="checkbox"],input[type="radio"] {margin-left:4px ;width:2em;height:2em;
display: inline;vertical-align: middle;position: relative;}
pre{font-size:2em;font-weight:700;}
.box{width:96%;border: 1px solid #000;margin:0 auto 0;padding:1em;}
.title{font-weight:700;font-size:1.2em;color:#fff;background:#000;padding:2px;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
.page{padding:8px 0 4px 0;font-weight:700;}
</style></head><body onload="init()">
<div id="header" class="noPrint" onclick="hideHeader()" >
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>

</div><div id="content">
<?php
$startTime = microtime(true);
$template = array();
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
@mysql_select_db('amx_portal');
$checked = array_fill(1,12,'');
$cutOff = array_fill(1,3,'');
$mode = array_fill(1,2,'');
$patient = intval($_GET['p']);
$crossHead = '<div class="box">Allergy patients who suffer from inhalant allergy often exhibit allergic reactions in the lips, mouth and throat when exposed to certain foods.  In many instances, this clinical response to food is due to pollen allergens that contain proteins similar to those found in the specific food ingested.  This concept is referred to as the “pollen-food allergy syndrome” or “oral allergy syndrome”.  Enclosed you will find information regarding the pollen-food interaction and which pollens may affect you based on your test results.</div>';
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
    $sql = "SELECT `Name`, `RecordsCRC`, `Session` FROM `Client`  WHERE `Number` = $client LIMIT 1";
    $results = @mysql_query($sql);
    $error = mysql_error();
    $rows = @mysql_num_rows($results);
    if (strlen($error) == 0 AND $rows == 1){
      $cli = mysql_fetch_array($results, MYSQL_BOTH);
      $clientName = htmlspecialchars($cli[0]);
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
$header = "<div class=\"pageHead\"><p>$clientName Food and Diet Report&#x2003;&#x2003; Patient Name: $pat[2], $pat[1]&#x2003;&#x2003;Lab ID: $patient</p>&#x2003;</div>";
$subhead = "<div class=\"subHead\">Tested Foods:<div class=\"plus\"></div>&#x2002;<span class=\"bold\">Positive</span>&#x2003;<div class=\"minus\"></div>&#x2002;<span class=\"bold\">Negative</span>&#x2003;<div class=\"checkmark\"></div>&#x2002;<span class=\"bold\">Food positive which doctor has included in your diet</span><div class=\"blank\"></div>&#x2002;Untested<br/>&#x2003;</div>";

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
<form method="get" enctype="application/x-www-form-urlencoded" action="https://amxemr.com/cross.php">
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
</fieldset><br/></fieldset><h2>&#x2003;<br/>
Pollen Food<br/>Crossreactivity Rules</h2>
<fieldset class="widthWide"><legend>Display</legend>
<div id="d4"  class="divNoCheck" ><input id="c4"  class="noCheck" type="checkbox" name="C4" value="1" onclick="check(4)" $checked[4] />&#160;&#160;Grocery Page</div><br/>
<div id="d5"  class="divNoCheck" ><input id="c5"  class="noCheck" type="checkbox" name="C5" value="1" onclick="check(5)"  $checked[5]/>&#160;&#160;Diet Page&#160;&#160;</div>
</fieldset><fieldset class="widthWide"><legend>
Display 6-7</legend>
<div id="d6"  class="divNoCheck" ><input id="c6"  class="noCheck" type="checkbox" name="C6" value="1" onclick="check(6)" $checked[6] />&#160;&#160;Physician Page </div><br/>
<div id="d7"  class="divNoCheck" ><input id="c7"  class="noCheck" type="checkbox" name="C7" value="1" onclick="check(7)" $checked[7] />&#160;&#160;Patient Page</div>
</fieldset>
<h2>&#x2003;<br/>
Hidden Food List Rules</h2>
<fieldset class="widthWide"><legend>Display</legend>
<div id="d8"  class="divNoCheck" ><input id="c8"  class="noCheck" type="checkbox" name="C8" value="1" onclick="check(8)"  $checked[8]/>&#160;&#160;Physician Page</div><br/>
<div id="d9"  class="divNoCheck" ><input id="c9"  class="noCheck" type="checkbox" name="C9" value="1" onclick="check(9)" $checked[9] />&#160;&#160;Patient Page</div>
</fieldset>
EOT;
ob_flush();
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
//  $err .= '<br/>CODES<pre>' . var_export($codes,true) . '</pre><br/>';
//  $codes = array_unique($codes);
  $class = array_fill_keys($codes,4);
// $ccc = '<pre>' . var_export($class,true) . '</pre>';
  $count = count($codes);  //echo "<h3>$count Foods";
  $err .="<br/>Codes: $count<br/>";
//  $displayClass = array('strike','strike','hide');
//  $display[1] = array('neg','pos','strike','tested','untested');
//  $display[2] = array('neg','hide','hide','tested','untested');
  $markClass[1] = array('minus','checkmark','plus','hide','hide');
  $markClass[2] = array('minus','checkmark','hide','hide','hide');
  $display[1] = array('tested','tested','strike','tested','untested');
  $display[2] = array('tested','tested','hide','tested','untested');
//  $pozClass = $displayClass[$excludeMethod];
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
$err .= "ExcludeTest:<pre>" . var_export($excludeTest,true) . '</pre>';
echo "</div></div></form></div><div class=\"break\"></div></div>\n$header$subhead";
// ob_flush();
$category = array('Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish &amp; Shellfish','Drinks');
$group = 0;
$saveGroup = 99;
$day = 0;
  $markClass[1] = array('<div class="minus"></div>','<div class="checkmark"></div>','<div class="plus"></div>','','');
  $markClass[2] = array('<div class="minus"></div>','<div class="checkmark"></div>','','','');
  $term[1][1] = '<br/>';
  $termx[1][1] = '&lt;br&gt;';
  $term2[1] = array(1,1,1,0,0);
  $term2[2] = array(1,1,0,0,0);
  
  $spacing = array('&#x2002;','&#x2002;','&#x2002;','','');

$daySpace[1] = "</div></div>\n";
$daySpace[2] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead";
$daySpace[3] = "</div></div>\n";
while (false){
  $day++;
  $t1 = 0;
  echo "<div class=\"box\"><h4 class=\"day\">Day $day</h4>\n<div class=\"col\">\n";
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
	$t2 = $term2[$tpl[3]][$d];

	$space = $spacing[$d];
    $mark = $markClass[$tpl[3]][$d];
    $c = $display[$tpl[3]][$d];
    echo $term[$t1][$t2] . "$mark<p class=\"$c\">$space$row[3]&#x2003;</p>\n";
	$t1 = $t2;
  }
  if ($day > 3){break;}
    echo $daySpace[$day];
}
ob_flush();
/***
echo '</div></div>\n\n<div class="pageBreak"></div>'; 
echo "$header$subhead<div class=\"box\"><h4 class=\"day\">Grocery List&#x2003;Page 1</h4><div class=\"col\">\n";
$t1 = 0;
$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE `day` < 5 AND `Type` > 0   ORDER BY `alpha` ASC , `Description` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $group = ($row[1] & 0x3CFF0000)/ 67108864;
  if ($saveGroup != $group){
    $saveGroup = $group;
    if ($row[2] == 5000){
      echo "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead"; 
      echo "\n<div class=\"box\"><h4 class=\"day\">Grocery List&#x2003; Page 2</h4>\n<div class=\"col\">\n";
	  $t1 = 0;
    }
    echo "<p class=\"hd\">&#x2002;$category[$group]&#x2002;</p>\n";
	$t1 = 0;
  }
  $d = $class[$row[5]];
  $t2 = $term2[$tpl[3]][$d];
  $space = $spacing[$d];
  $mark = $markClass[$tpl[3]][$d];
  $c = $display[$tpl[3]][$d];
  echo $term[$t1][$t2] . "$mark<p class=\"$c\">$space" . "$row[3]&#x2003;</p>\n";
  $t1 = $t2;
}
echo '</div></div>';
$display[1][2] = 'tested';
$familyHead = "<div class=\"box\"><p>Elevated results do not always indicate that you are allergic to the food tested (e.g. IgG and IgG4 tests to eggs and milk have a high reactivity rate,
but many patients do not have symptoms).  Only your physician can determine the meaning of the laboratory results after reviewing your diet
history and clinical symptoms.
<br/>&#x2003;</p><p>
Below are your test results with respect to the various food families.  If you have a positive food result (and are diagnosed to be allergic)
it does not necessary mean that you will be allergic to all foods in that family, however often times patients will have problems with multiple
foods within that grouping.  Your diet plan has been constructed to rotate foods by their respective families according to you physicians instructions.
</p></div>\n";
$pageBreak[0] = "<\n\n<div class=\"pageBreak\"></div>\n$header$subhead$familyHead<p class=\"page\">Food Families&#x2003;Page 1 of 4</p>";
$pageBreak[1] = "</div>\n<div class=\"noPageBreak\"></div>&#x2003;\n</div>";
$pageBreak[2] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead$familyHead<p class=\"page\">Food Families&#x2003;Page 2 of 4</p>";
$pageBreak[3] = "</div><div class=\"noPageBreak\"></div>&#x2003;\n</div>";
$pageBreak[4] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead$familyHead<p class=\"page\">Food Families&#x2003;Page 3 of 4</p>";
$pageBreak[5] = "</div>\n<div class=\"noPageBreak\"></div>&#x2003;\n</div>";
$pageBreak[6] = "</div></div>\n\n<div class=\"pageBreak\"></div>\n$header$subhead$familyHead<p class=\"page\">Food Families&#x2003;Page 4 of 4</p>";
$pageBreak[7] = "</div>\n<div class=\"noPageBreak\"></div>&#x2003;\n</div>";
  // ob_flush();

//  $display[1] = array('neg','yellow','yellow','tested','untested');
//  $display[2] = array('neg','yellow','yellow','tested','untested');
$t1 = 0;

$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group`,`Type` FROM `Allergens` WHERE `day` < 5 OR `Type`=0  ORDER BY `Allergens`.`Family` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  $group = ($row[1] & 0x3CFF0000)/ 67108864;
  if ($saveGroup != $group){
    $saveGroup = $group;
    echo $pageBreak[$group]; 
    echo "<br/>\n<div class=\"box\"><h4 class=\"day\">$category[$group] </h4>\n<div class=\"col\">\n";
	$t1 = 0;
  }
  if ($row[7] == 0){
    echo "<p class=\"hd\">&#x2002;$row[3]&#x2002;</p>\n";
	$t1 = 0;
	continue;
  }
  if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
    $d = 1;
  }
  else{
    $d = $class[$row[5]];
  }
  $t2 = $term2[$tpl[3]][$d];
  $space = $spacing[$d];
  $mark = $markClass[$tpl[3]][$d];
  $c = $display[$tpl[3]][$d];
  echo $term[$t1][$t2] . "$mark<p class=\"$c\">$space$row[3]&#x2003;</p>\n";
  $t1 = $t2;
}
echo '</div></div>';
// ob_flush();
***/


//echo '<pre>' . var_export($class,true) . '</pre>';
$hidden = '<div class="pageBreak"></div>' . $header . $subhead . '</h4><div class="box"><p class="hidden">You have test tested positive to a food that is often refered to as a "Hidden Food" because it is found in other foods and not easy to identify.  Below is a listing of foods/components that contain the food you may be allergic to:</p></div>';
$hiddenShown = false;




/***



if($class['F002'] < 3||$class['F076'] < 3 ||$class['F077'] < 3 ||$class['F078'] < 3 ||$class['F236'] < 3 ||$class['F358'] < 3){

  if (!$hiddenShown){echo $hidden . '<div class="box">';$hiddenShown = true;}
  
$codes = array('F002','F076','F077','F078','F236','F258'); 
$desc = array('Milk, Cow',' Milk, Cow, Lactalbumin, Alpha','Milk, Cow, Lactoglobulin, B.','Milk, Cow, Casein','Milk, Cow,Whey','Milk, Cow, Lactoferrin');
$count = count($codes) - 1;
$ndx = 0;
while(true){
  $d = $class[$codes[$ndx]];
  if ($d < 3 && $d != NULL){
    $space = $spacing[$d];
    $mark = $markClass[$tpl[3]][$d];
    $c = $display[$tpl[3]][$d];
    echo "$mark<p class=\"$c\">$d) $space$desc[$ndx]&#x2003;</p>";
  }
  if ($ndx >= $count){break;}
  $ndx++;
}
  echo <<<EOT
<br>&#x2003;<div>
<p class="title">MILK/MILK RELATED
<div class="col">
<p>Butter (including artificial butter and butter flavored oil)
<p>Casein and caseinates 
<p>Cheese, cheese flavor, cottage cheese, cream cheese, imitation cheese
<p>Cream, whipped cream 
<p>Curds 
<p>Custard 
<p>Dairy product solids
<p>Half & Half 
<p>Hydrolysates 
<p>Ice cream, ice milk, sherbet 
<p>Nougat 
<p>Pudding 
<p>Quark 
<p>Recaldent 
<p>Rennet, rennet casein 
<p>Simplesse 
<p>Sour cream, imitation sour cream
<p>Whey 
<p>Yogurt 
</div></div></div>
EOT;
}   








$codes = array('F001','F075','F245','F357'); 
$desc = array('','','','','');


if($class['F001'] < 3 ||$class['F075'] < 3 ||$class['F245'] < 3 ||$class['F357'] < 3 ){  
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<br/><div class="box">
<p class="title">EGGS
<div class="col">
<p>Albumin
<p>Apovitellin 
<p>Cholesterol free egg substitute
<p>Dried egg
<p>Egg white, egg yolk 
<p>Egg wash 
<p>Eggnog 
<p>Fat substitutes 
<p>Globulin 
<p>Mayonnaise 
</div></div>
EOT;
} 





if($class['F004'] < 3){
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<br/><div class="box">
<p class="title">Wheat 
<div class="col">
<p>Baked goods (check ingredients)
<p>Bran 
<p>Bread (any type made with white flour, wheat flour), bread crumbs
<p>Bulgur 
<p>Cake flour 
<p>Cereal extract 
<p>Crackers, cracker meal 
<p>Farina 
<p>Flour (check ingredients)
<p>Germ 
<p>Gluten 
<p>Malt, malt extract 
<p>Matzah
<p>Noodles 
<p>Pasta 
<p>Tabbouleh 
<p>Unbleached flour 
<p>Wheat sprouts
</div></div>
EOT;
}




$codes = array('F013','F359','F360'); 
$desc = array('','','');


//$hiddenShown = false;
if($class['F013'] < 3 ||$class['F359'] < 3 ||$class['F360'] < 3 ){  
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<br/><div class="box">
<p class="title">PEANUT/PEANUT RELATED
<div class="col">
<p>Arachic oil 
<p>Artificial nuts 
<p>Beer nuts 
<p>Boiled peanuts 
<p>Crushed nuts, crushed peanuts 
<p>Dry roasted peanuts 
<p>Earth nuts 
<p>Goober peas 
<p>Goobers 
<p>Ground nuts, ground peanuts 
<p>Hydrolyzed peanut protein 
<p>Mixed nuts 
<p>Monkey nuts 
<p>Nu nuts flavored nuts 
<p>Nut pieces 
<p>Nutmeat 
<p>Peanut butter, peanut butter chips, peanut butter morsels 
<p>Peanut flour 
<p>Peanut oil 
<p>Peanut paste 
<p>Peanuts sauce, peanut syrup 
<p>Spanish peanuts 
<p>Virginia peanuts 
</div></div>
EOT;
} 





if($class['F014'] < 3){
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<br/><div class="box">
<p class="title">Soybean
<div class="col">
<p>Hydrolyzed soy protein 
<p>Kinnoko flour 
<p>Kyodofu  
<p>Natto 
<p>Okara 
<p>Shoyu sauce 
<p>Soy albumin 
<p>Soy bran 
<p>Soy concentrate 
<p>Soy fiber 
<p>Soy flour 
<p>Soy formula 
<p>Soy grits 
<p>Soy milk 
<p>Soy miso 
<p>Soy nuts 
<p>Soy nut butter 
<p>Soy protein, soy protein concentrate, soy protein isolate 
</div></div>
EOT;
}
//$hiddenShown = false;
         $class['F008'] = 2;
if($class['F008'] < 3){
  if (!$hiddenShown){echo $hidden;$hiddenShown = true;}
  echo <<<EOT
<br/><div class="box">
<p class="title">Corn
<div class="col">
<p>Alcohol
<p>Artificial flavorings
<p>Artificial sweeteners (e.g. Splenda )
<p>Baking powder
<p>Bleached flour
<p>Corn alcohol 
<p>Corn extract
<p>Corn flour
<p>Corn oil 
<p>Corn starch
<p>Corn syrup
<p>Corn, popcorn, cornmeal
<p>Cornstarch, cornflour
<p>Flavorings
<p>Food starch
<p>Fructose
<p>Fruit juice concentrate
<p>Germ/germ meal
<p>Hominy
<p>Iodized salt
<p>Maize
<p>Malt syrup from corn
<p>Malt
<p>Molasses
<p>Saccharin
<p>Salt (iodized salt)
<p>Semolina
<p>Sorbitol
<p>Sorghum
<p>Starch
<p>Sugar (check ingredients)
<p>Vanilla, natural flavoring
<p>Vanilla, pure or extract
<p>Vanillin
<p>Vinegar, distilled white
<p>Vitamins
<p>Xanthan gum
<p>Yeast (check ingredients)
</div></div>
EOT;
}
**/
$tpl[3] = 1;
$codes = array();
$desc = array();
$codes[0] = array('T003','T146','T008','T107','T108','T100','T101','T153','T149'); 
$desc[0] = array(' Birch, Gray',' Birch, Red/River',' Elm, American',' Elm, Chinese ',' Elm,Scrub ',' Alder, European',' Alder,Red ',' Alder, Sitka ',' Hazelnut ');
$desc[1] = array('Sycamore');
$codes[1] = array('T140');
$codes[2] = array('W006','W111','W001'); 
$desc[2] = array('Mugwort','Sagebrush','Common Ragweed');
$codes[3] = array('G002','G003','G004','G005','G006','G008','G009','G010','G013','G014','G015','G017','G020','G021','G022','G023','G024','G025','GZ08','G026');
$desc[3] = array('Bermuda Grass','Orchard Grass','Fescue, Meadow Grass','Rye, perennial Grass','Timothy Grass','June Grass','Bent/Redtop Grass','Johnson Grass','Velvet Grass','Oat,CultivaRed','Wheat, Cultivated','Bahia Grass','Bluegrass,Canada','Brome, Smooth Grass','Canary/Reed Grass','Sweet Vernal Grass','Fescue, Red Grass','Corn Pollen','Grass Mix #1','Common Reed');
$desc[4] = array('Latex');
$codes[4] = array('K082');

$counts = array(8,0,2,19,0);
$markHead = array('<div class="minus"></div>','<div class="checkmark"></div>','<div class="plus"></div>','<div class="blank"></div>','<div class="blank"></div>');
$markHead[NULL] = '<div class="blank"></div>';
  $display[0] = array('tested','tested','tested','tested','notTested');
  $display[1] = array('tested','tested','tested','tested','untested');
  $display[2] = array('tested','tested','tested','tested','untested');
$display[0][NULL] = 'blank';


$cross = array('`Birch`','`Sycamore`','`Mugwort`','`Grasses`','`Latex`');
   $err .= '<br/>DISPLAY CLASS<pre>' . var_export($display,true) . '</pre><br/>';
$ndx = 0;
$pageBreak = array("</div></div>",'</div></div>','</div></div>','</div></div>','</div></div>');

$dump = var_export($desc,true);
$d = $desc[0][0] . $codes[0][0] . "\n" . $desc[1][0] . $codes[1][0] . "\n" . $desc[2][0] . $codes[2][0] . "\n" . $desc[3][0] . $codes[3][0] . "\n" . $desc[4][0] . $codes[4][0] . "\n\n";
//echo "<h4>Descriptions</h4><pre>$d\nDump\n$dump\n</pre>";
echo $crossHead ;
do{
echo <<<EOT
$pageBreak[$ndx] 

<br/><div class="box">
<p class="title">$cross[$ndx]</p>
EOT;
$code = 0;

$lineBreak = array_fill(0,21,'');
$lineBreak[6] = '<br>';
$lineBreak[13] = '<br>';
//$lineBreak[19] = '<br>';


while(true){
  $d = $class[$codes[$ndx][$code]];
  if ($d > 2 || $d == NULL){$d = 4;}
    $space = $spacing[$d];
    $mark = $markHead[$d];
    $c = $display[0][$d];
	$h = $desc[$ndx][$code];
    echo "$mark<p class=\"$c\">$space$h&#x2003;</p>$lineBreak[$code]\n";
  $code++;
  if ($code > $counts[$ndx]){break;}
  
}

echo '<br>&#x2003;<br><div class="col">';


$sql = "SELECT `id`, `Family`,`alpha`,`Description`,`Day`,`Code`,`Group`,`Type` FROM `Allergens` WHERE $cross[$ndx] = 1  ORDER BY `Allergens`.`Description` ASC";
$results = @mysql_query($sql);
while($row = mysql_fetch_array($results, MYSQL_NUM)){
  if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
    $d = 1;
  }
  else{ 
    $d = $class[$row[5]];
  }
  $t2 = $term2[$tpl[3]][$d];
  $space = $spacing[$d];
  $mark = $markClass[$tpl[3]][$d];
  $c = $display[$tpl[3]][$d];
  echo $term[$t1][$t2] . "$mark<p class=\"$c\">$space" . "$row[3]&#x2003;</p>\n";
  $t1 = $t2;
}
$ndx++;
}while ($ndx < 5);
echo '</div></div>';
// ob_flush();








 $t = number_format((microtime(true) - $startTime),3);
echo <<<EOT
<div><p>&#x2003;<br/>Number of Seconds to Generate this Page: $t Seconds</p>
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
<form method="get" enctype="application/x-www-form-urlencoded" action="https://amxemr.com/cross.php">
<div><input type="hidden" name="sub" value="1" /> <br/> </div>
<fieldset class="widthWide"><legend>Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
</fieldset><fieldset>
<button class="login">Get Diet</button></fieldset></form><h1><br/> </h1></div>
</div></body></html>
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