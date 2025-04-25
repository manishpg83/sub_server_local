<?php ob_start();
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet Configuration</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin-left:2%;background:#fff;color:#000;padding-bottom:10em; }
#content{width:100%;padding:0;margin:0;}
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
.c1{background:#222;border: 10px solid #0ff;color:#0ff;padding:1em;float:left;}
.c2{min-height:3450px;background:#222;border: 10px solid #f0f;color:#f0f;padding:1em;float:left;}
td{padding:2px 0 0 6px;border:0;margin:0;}
.hide{display:none;}
.item{color:#0ff;}
h1{text-align:center;}
h2,h3{margin-bottom:0;}
pre{padding:0;margin:0;}
.col{-webkit-column-count:4;
-moz-column-count:4;
column-count:4;
}
.check{background:#f00;}
.nocheck{background:#2985EA;}
.divCheck,.divNoCheck{color:#fff;display:inline;padding:4px 0;width:16em;}
.divNoCheck{background:#2985EA;}
.divCheck{background:#f00;}
p{margin:0 0 1px 0;padding:0;font:400 1em/1 Arial,sans-serif;}
.hd{display:inline;
font-size:1em;
font-weight:700;
margin:0 0 10px;color:#fff;background:#000;}
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
.tested{font-weight:700;}
.untested{padding-left:1em;}
#hd,.noPrint{background:#6AB4B3;color:#033;max-width:80em;}
button{width:7em;}
@media print
{
.pageBreak {page-break-after:always;}
.noPrint{display:none;}
}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.strike{text-decoration:line-through;font-weight:700;display:inline;}
.break{clear:both;}
.widthWide{width:26em;}
.widthInside{width:24em;}
.desc{width:14em;display:inline-block;font-weight:700;}
.score{width:2em;display:inline-block;text-align:center;font-weight:700;}
.plusx {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-repeat:no-repeat;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEBAP/8/P0AAAAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.minusx{margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-repeat:no-repeat;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEBAP////wDBAAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.minusxx {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhPAA8AJEAAD6qTIrMk8rqzvP89CwAAAAAPAA8AAACcISPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gvH8kzX9o3nV8D3/g8MCgMaweCITCqXzOagODA6p1SkAFrNUrHa7pLrDT8zUnEYbNZCy2nqldz2bob0elCHz+v3/L7/DxgoOEhYaHiImKi4yNhoUQAAOw==');}
.checkmarkx {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhPAA8AJEAAEGxTVi4Y7Hftvb9+CwAAAAAPAA8AAACxYSPqcvtD6OctNqLs968+w+G4kiW5omm6soeQdBOcCwDgSDQD3wPQ65bzAQ+HzDoMhCLRmRiyfTNnNColGqNHmnV7DbWtX43L0ogG51yzjl144wuujXw31xRj98x+eY7LvfRVzRmMGi1d3FIuAB45bHI5Ob4ExIZCBOmNXJ5pclUCElJGSo4GlcK8km6soqaOOIqBksiK6ljO0B7IrtbMqTnxKPpizK86ZSUl0rD45ecMAzNUIxUNo2drb3N3e39DR4u7lEAADs=');}
.plus      {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAANpFJe+0p+FsU/vu6ywAAAAADAAMAAACGoSPqQsRbMZYosoqUJB8vINd1SJBzceM5roUADs=');}
.minus     {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD2pS9Ds1PH68k2wWiwAAAAADAAMAAACFISPqcudAyNEQdg7aNg8uw+GIlAAADs=');}
.checkmark {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD+wS7LfuPv+/F28ZywAAAAADAAMAAACGISPqcsc04IIaDwgaRVzrsFpS3A1UIOiBQA7');}

.divCheck,.divNoCheck{display:inline-block;padding:6px 0 6px 6px;margin-bottom:6px;vertical-align: middle;position: relative;}
.check,.nocheck{display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;
.nocheck{background:#2985EA;
.divCheck{background:#f00;
.check{background:#f00;
input[type="checkbox"],input[type="radio"] {margin-left:4px ;width:2em;height:2em;
display: inline;vertical-align: middle;position: relative;}
pre{font-size:2em;font-weight:700;}
</style><body onload="init()">
<div id="header" onclick="hideHeader()" >
<img width="332" height="100" alt="amx logo" src="data:image/jpg;base64,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"/>
</div><div id="content">
EOT;
ob_flush();
$template = array();
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
@mysql_select_db('amx_portal');
$checked = array_fill(1,12,'');
$cutOff = array_fill(1,3,'');
$mode = array_fill(1,2,'');
$patient = intval($_GET['p']);
$err .= "<br>Patient:  $patient<br/>";
if (strlen($patient) == 6){
  $sql = "SELECT `Client`,`Last`, `First`, `ClientID` FROM `Patient` WHERE `Patient` = $patient";
  $results = @mysql_query($sql);
  $error = mysql_error();
  $rows = @mysql_num_rows($results);
  if (strlen($error) == 0 AND $rows == 1){
    $pat = mysql_fetch_array($results, MYSQL_BOTH);
    $client = $pat[0] ;
    $err .= "<br/>Patient Name: " . trim($pat[2]) . ", $pat[1]<br>";
	$patID = $pat[3];
    $sql = "SELECT `Name`, `RecordsCRC`, `Session` FROM `Client`  WHERE `Number` = $client LIMIT 1";
    $results = @mysql_query($sql);
    $error = mysql_error();
    $rows = @mysql_num_rows($results);
    if (strlen($error) == 0 AND $rows == 1){
      $cli = mysql_fetch_array($results, MYSQL_BOTH);
      $clientName = $cli[0];
      $err .= "<br/>Client Name: $clientName<br>";
      $sql = "SELECT * FROM `template` WHERE `Client` = 0 AND `Patient` = $patient LIMIT 1"; 
      $results = @mysql_query($sql);
      $error = mysql_error();
      $rows = @mysql_num_rows($results);
      if (strlen($error) != 0 || $rows != 1){
        $err .= "<br>SEL #1 PAT TPL: $error<br>$sql<br>";
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
    $err .= "<br>ERROR SEL CLI: $error<br>$sql";
  }
}

$err .= '<br>GET<pre>' . var_export($_GET,true) . '</pre><br>';
$sub = intval($_GET['sub']);
if (strlen($client) == 6 AND strlen($patient) == 6){
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
    $err .= "<br>UPDATE ERROR PAT TPL: $error<br>$sql<br>";
  }
  $template[4] = $tpl;
}
//else{ // not a _POST
  $CutOff = $tpl[2];
  $excludeMethod  = $tpl[3];
//}
$err .= '<br>TEMPLATES:<pre>' . var_export($template,true) . '</pre><br>';
$cutOffValues = array('','0/1','1','2');
$cutoff = $cutOffValues[$tpl[2]]; 
$cutOff[$tpl[2]] = 'checked';
$mode[$tpl[3]] = 'checked';
$ndx = 4;
$check = array('','checked','checked');
do {
  $checked[$ndx] = $check[$tpl[$ndx]]; 
// if ($ndx == 9){$err .= "<br>CHECKED $ndx: $checked[$ndx] tpl[$ndx]=$tpl[$ndx]";}
  $ndx++;
}while ($ndx < 13);
$err .= '<br>TPL<br><pre>' . var_export($tpl,true) . '</pre><br>';
$err .= '<br>CHECKED<pre>' . var_export($checked,true) . '</pre><br>';
echo <<<EOT
<div id="hd" class="noPrint">
<form method="GET" action="http://dev.amxemr.com/diet/">
<input type="hidden" name="sub" value="2" />&ensp;<br>&ensp;
<fieldset class="widthWide"><legend>Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
<button class="login">Update</button>&emsp;&emsp;
</fieldset><br/><fieldset class="widthWide">
<legend>Positive Score Cutoff R2 13-15 </legend>
<div id="d13" class="divNoCheck" ><input id="c13"  class="noCheck" type=radio name="R2" value="1"  onclick="radio(13,13,15)"  $cutOff[1] />&nbsp;&nbsp;0/1&emsp;</div><br/>
<div id="d14" class="divNoCheck" ><input id="c14"  class="noCheck" type=radio name="R2" value="2"  onclick="radio(14,13,15)"  $cutOff[2] />&nbsp;&nbsp;1&emsp;</div><br/>
<div id="d15" class="divNoCheck" ><input id="c15"  class="noCheck" type=radio name="R2" value="3"  onclick="radio(15,13,15)"  $cutOff[3] />&nbsp;&nbsp;2&emsp;</div>
<p><br></p><p>Current Score Cutoff: $cutoff</p>
</fieldset><br><fieldset class="widthWide"><legend>
Exclude</legend>
<div id="d10" class="divNoCheck" >
<input id="c10"  class="noCheck" type=checkbox name="C10" value="1" $checked[10] onclick="check(10)" />
&nbsp;&nbsp;IgE</div><br/>
<div id="d11" class="divNoCheck" ><input id="c11"  class="noCheck" type=checkbox name="C11" value="1" $checked[11] onclick="check(11)" />&nbsp;&nbsp;IgG4</div><br/>
<div id="d12" class="divNoCheck" ><input id="c12"  class="noCheck" type=checkbox name="C12" value="1" $checked[12] onclick="check(12)" />&nbsp;&nbsp;IgG</div>
<p><br></p><fieldset class="widthInside"><legend>Method</legend>
<div id="d2"  class="divNoCheck" ><input id="c2"  class="noCheck" type=radio name="R3" value="1" onclick="radio(2,2,3)" $mode[1] />&nbsp;&nbsp;Strike&emsp;</div><br/>
<div id="d3"  class="divNoCheck" ><input id="c3"  class="noCheck" type=radio name="R3" value="2" onclick="radio(3,2,3)" $mode[2] />&nbsp;&nbsp;Remove&emsp;</div><br/>
</fieldset><br/></fieldset><h2>&emsp;<br>

Pollen Food<br>Crossreactivity Rules</h2>
<fieldset class="widthWide"><legend>Display </legend>
<div id="d4"  class="divNoCheck" ><input id="c4"  class="noCheck" type=checkbox name="C4" value="1" onclick="check(4)" $checked[4] />&nbsp;&nbsp;Grocery Page</div><br/>
<div id="d5"  class="divNoCheck" ><input id="c5"  class="noCheck" type=checkbox name="C5" value="1" onclick="check(5)"  $checked[5]/>&nbsp;&nbsp;Diet Page&nbsp;&nbsp;</div>
</fieldset><fieldset class="widthWide"><legend>
Display 6-7</legend>
<div id="d6"  class="divNoCheck" ><input id="c6"  class="noCheck" type=checkbox name="C6" value="1" onclick="check(6)" $checked[6] />&nbsp;&nbsp;Physician Page </div><br/>
<div id="d7"  class="divNoCheck" ><input id="c7"  class="noCheck" type=checkbox name="C7" value="1" onclick="check(7)" $checked[7] />&nbsp;&nbsp;Patient Page</div>
</fieldset>
<h2>&emsp;<br>

Hidden Food List Rules</h2>
<fieldset class="widthWide"><legend>Display</legend>
<div id="d8"  class="divNoCheck" ><input id="c8"  class="noCheck" type=checkbox name="C8" value="1" onclick="check(8)"  $checked[8]/>&nbsp;&nbsp;Physician Page</div><br/>
<div id="d9"  class="divNoCheck" ><input id="c9"  class="noCheck" type=checkbox name="C9" value="1" onclick="check(9)" $checked[9] />&nbsp;&nbsp;Patient Page</div>
</fieldset>
EOT;
ob_flush();
$chk = 15;

//$err .= '<br>cutOff<pre>' . var_export($cutOff,true) . '</pre><br>';
//$err .= '<br>mode<pre>' . var_export($mode,true) . '</pre><br>';

  $hideHeader = "hd.style.display = 'none';";
  $sql = "SELECT `Code` FROM `Allergens` WHERE `Day` > 0 ORDER BY `alpha` ASC , `Description` ASC";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) > 0){
    $err .= "<br>SEL Allergens: $error<br>$sql<br>";
  }
  $rows = mysql_num_rows($results);
  $err .= "<br>SEL Allergens Rows= $rows<br>";
  $codes = array_fill(0,$rows,0);
  $ndx = 0;
  while($row = mysql_fetch_array($results, MYSQL_NUM)){
    $codes[$ndx] = $row[0];
    $ndx++;
  }
//  $err .= '<br>CODES<pre>' . var_export($codes,true) . '</pre><br>';
//  $codes = array_unique($codes);
  $class = array_fill_keys($codes,4);
  $count = count($codes);  //echo "<h3>$count Foods";
  $err .="<br>Codes: $count<br/>";
  
  
  
  $displayClass = array('strike','strike','hide');
  $markClass[1] = array('minus','checkmark','plus','hide','hide');
  $markClass[2] = array('minus','checkmark','hide','hide','hide');
  $display[1] = array('neg','strike','pos','tested','untested');
  $display[2] = array('neg','hide','pos','tested','untested');
  
  
  
  
  
  
  
  $pozClass = $displayClass[$excludeMethod];
  $err .= '<br>displayClass<pre>' . var_export($displayClass,true) . '</pre><br>';
  $err .="<br>pozClass: $pozClass>";
  $err .="<br>excludeMethod: $excludeMethod<br/>";


//  $marker = array('hide','hide','minus',$markDisplay,$markDisplay);
  $exclude = array(0,$tpl[10],$tpl[12],$tpl[11]);

  ksort($_GET);
  foreach ($_GET as $k => $v){
    if (substr($k,0,1) == 'a'){
      $sql = "INSERT INTO `amx_portal`.`Test` (`Patient`, `Code`, `Type`, `Score`, `Description`,`Attributes`) VALUES ('$patient', '$code', 0, 9, '$v',0)";
      mysql_unbuffered_query($sql);
      if (mysql_error() == 0){
        $add = "<h2><br>$v Added</h2>";
      }
      else {
        $add = "<h2><br>Error Adding $v</h2>";
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
               $add = "<h2><br>$v Added</h2>";
            }
            else {
              $add = "<h2><br>Error Adding $v</h2>";
            }
          }
          elseif  ($rows > 0){
            $add = '<table>';
            while ($row = mysql_fetch_array($results, MYSQL_NUM)) {
            $add .= <<< EOR
<tr><td>
<div class="divNoCheck"><input id="a$row[0]" class="nocheck" name="a$row[0]" value="$row[1]" onclick="chkDay('$row[0]',0)" type="checkbox" />&nbsp;add&nbsp;&nbsp;&nbsp;</div></td>
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
          $err .= "<br>UPDATE TEST ERROR: $error<br>$sql<br>";
	    }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[10]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND `Patient` = $patient AND `Type` = 1" ;
  $results = @mysql_unbuffered_query($sql);
        if (true){ //strlen($error) > 0 ){
          $err .= "<br>UPDATE TEST IgE ERROR: $error<br>$sql<br>";
	    }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[12]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND  `Patient` = $patient AND `Type` = 2" ;
  $results = @mysql_unbuffered_query($sql);
        if (true){ //strlen($error) > 0 ){
          $err .= "<br>UPDATE TEST IgG ERROR: $error<br>SQL: $sql<br>";
	    }
  $sql = "UPDATE `Test` SET `Attributes`= " . $attr[$tpl[11]] . " WHERE `Score` BETWEEN '$cutoff' AND '6' AND  `Patient` = $patient AND `Type` = 3" ;
  $results = @mysql_unbuffered_query($sql);
        if (strlen($error) > 0 ){
          $err .= "<br>UPDATE TEST IgG4 ERROR: $error<br>$sql<br>";
	    }
  if (count($excludeTest) > 0 && $sub == 2 ) {
    foreach ($excludeTest as $k => $v){
      foreach ($v as $type => $x){
        $sql = "UPDATE `Test` SET `Attributes`= 1 WHERE `Patient`=$patient AND  `Code` = '$k' AND `Type` = $type";
        $results = @mysql_unbuffered_query($sql);
        $error = mysql_error();
        $rows = @mysql_num_rows($results);
        if (strlen($error) > 0 ){
          $err .= "<br>UPDATE TEST ERROR: $error<br>$sql<br>";
	    }
	  }
    }
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
 
  $err .= '<br>ExcludeTests: <pre>' . var_export($excludeTest,true) . '<br></pre><br>';

$daySpace[1] = "\n</div><hr><p>&emsp;</p><div>\n";
$daySpace[2] = "\n</div><div class=\"pageBreak\"></div><div>\n";
$daySpace[3] = "\n</div><hr><div>";
ob_flush();
$pt = array(0,1,2,2);
$type = array('Added','IgE','IgG','IgG4');


  $markClass[1] = array('minus','checkmark','plus','hide','hide');
  $markClass[2] = array('minus','checkmark','hide','hide','hide');
  $display[1] = array('neg','strike','strike','tested','untested');
  $display[2] = array('neg','hide','hide','tested','untested');




  $sql = "SELECT `Code`,`Type`,`Score`,`Description`,`Attributes`  FROM `Test` WHERE `Patient` =  $patient ORDER BY `Type` ASC,`Score` ASC ";
  $results = @mysql_query($sql);
  $error = mysql_error();
  $rows = @mysql_num_rows($results);
  if (strlen($error) > 0){
    $err .= "<br>Rows:$rows<br>SEL TST: $error<br>$sql<br>";
  }
  else{
    $err .= "<br>Test Rows:$rows<br>";
  }
  while ($row = mysql_fetch_array($results, MYSQL_NUM)){
	

    if ($class[$row[0]] == 2){continue;}
	$class[$row[0]] = $row[4];
    if ($row[2] >= $cutoff){
	  $excludeTest[$row[0]][$row[1]] = $row[4];

      if ($exclude[$row[2]] == 1){
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
$label = array('type','class','Food','Score');
echo <<<EOT
&ensp;<br>&ensp;
<fieldset class="pozCheck"><legend>Add Food</legend>
Description: <input class="desc" type="text" name="desc" value="" />&nbsp;<button class="login"> Add </button></fieldset>
<div><div class="noPrint">
EOT;
$excludeDivClass = array('divNoCheck','divCheck','divNoCheck');
$excludeChkClass = array('noCheck','check','noCheck');
$check[2] = '';

if (count($data) > 0){
  $err .= '<br>Positive Tests:<br>';
  foreach ($data as $k => $v1) {
    echo "<h2>Positive $type[$k] Foods</h2>";
//	$checked = $check($data[][]);
    foreach ($v1 as $key => $v2) {
	  $chk++;
	  $err .= "$key $k $excludeTest[$key][$k]<br>exType: " . $excludeType[$key][$k] . '<br>';
       if ($v2[0] == '9'){
          echo "<fieldset class=\"pozCheck\"><div class=\"desc\">$v2[1]</div><div id=\"jd-$key-$k\"  class=\"divNoCheck\" ><input id=\"d-$key-$k\"  class=\"noCheck\" type=checkbox name=\"d-$key-$k\" value=\"7\" onclick=\"check('$key-$k') \" />&nbsp;Delete&nbsp;</div></fieldset><br>\n";
       }
//       elseif($excludeTest[$key][$k] == 1 || $exclude[$k] == 1) {
//         echo "<fieldset class=\"pozCheck\">$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d$chk\"  class=\"divCheck\" ><input id=\"c$chk\"  class=\"check\" type=checkbox name=\"e-$key-$k\" value=\"7\" onclick=\"check('$chk')\"  checked />&emsp;Exclude from Positive&nbsp;</div></fieldset><br>\n";  
//	   }
       else {
         echo "<fieldset class=\"pozCheck\">$type[$k] $key <div class=\"desc\">$v2[1]</div><div class=\"score\"> $v2[0]</div><div id=\"d$chk\"  class=\"" . $excludeDivClass[$excludeTest[$key][$k]] . "\" ><input id=\"c$chk\"  class=\" " . $excludeChkClass[$excludeTest[$key][$k]] . "\" type=checkbox name=\"e-$key-$k\" value=\"7\" onclick=\"check('$chk')\" " . $check[$excludeTest[$key][$k]] . " />&emsp;Exclude from Positive&nbsp;</div></fieldset><br>\n";

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

echo "</div></div></form></div><div class=\"break\"><br><h2>$clientName Rotation Diet,&emsp;&emsp;&emsp; Patient Name: " . trim($pat[2]) . ", $pat[1],&emsp;&emsp;Patient ID:$patID &emsp;&emsp;Lab ID: $patient</h2>Tested foods are in <b>bold</b>. &ensp;<div class=\"plus\"></div><b>positive</b>&emsp;<div class=\"minus\"></div><b>negative</b>&emsp;<div class=\"checkmark\"></div><b>Excluded from positive</b>";

ob_flush();
$category = array('Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish & Shellfish','Drinks');
$cclasses = array('c1','c2');
$classes = array(' class="hd" ',' class="item" ');
$group = 0;
$saveGroup = 99;

$bg = 1;
$day = 0;
$daycodes = array();
while (true){
  $day++;
  $ndx = 0;
  echo "</div><h3 class=\"day\">Day $day</h3><br><div class=\"col\">\n";




  $markClass[1] = array('minus','checkmark','plus','hide','hide');
  $markClass[2] = array('minus','checkmark','hide','hide','hide');
  $display[1] = array('neg','pos','strike','tested','untested');
  $display[2] = array('neg','hide','hide','tested','untested');


//  $data[$row[1]][$row[0]] = array($score,$desc[3],$attr[4]);

  $sql = "SELECT `id`, `Family`, `Type`, `Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE `Day` = $day   ORDER BY `alpha` ASC , `Description` ASC";
        $results = @mysql_query($sql);
        while($row = mysql_fetch_array($results, MYSQL_NUM)){
		    $daycodes[$day][$ndx] = $row[5];
			$ndx++;
          $group = ($row[1] & 0x3CFF0000)/ 67108864;
          if ($saveGroup != $group){
            $saveGroup = $group;
            echo "<div><br><p class=\"hd\">&ensp;$category[$group]&ensp;</p></div><br>\n";
            $bg = $cclasses[($group & 1)];
           // continue;
          }
          $scor = $s[$row[5]];
         if($excludeTest[$row[5]][$row[2]] == 1 || ( $excludeTest[$row[5]][$row[2]] == 2 && $exclude[$row[2]] == 2 )){
		   $d = 1;
		 }
		 else{
           $d = $class[$row[5]];
		}
			$mark = $markClass[$tpl[3]][$d];
            $dx = $d . '-' . $row[5] . ' -Mark:' . $mark . ' -Class: ' . $c ;
            $c = $display[$tpl[3]][$d];
		
        echo "<div><div class=\"$mark\"></div><p class=\"$c\">$row[3]&emsp;</p></div>\n";
$err .= 'ET: ' . $excludeTest[$key][$k] . '__ E: ' . $exclude[$k] . "__ d: $d . '-' . $row[5] . '__ Mark:' . $mark . '__ Class: ' . $c <br>";
			
        }
      if ($day > 3){break;}
      echo $daySpace[$day];
    }
  ob_flush();
  $daySpace[4] = "\n</div><br><div class=\"pageBreak\"></div><div class=\"col\">\n";

  
  echo "</div><div class=\"break\"></div><div class=\"col\">\n";
/****
  $cnt = 0;
  $sql = "SELECT `id`, `Family`, `Type`, `Description`,`Day`,`Code`,`Group` FROM `Allergens` WHERE 1  ORDER BY `alpha` ASC , `Description` ASC";
        $results = @mysql_query($sql);
        while($row = mysql_fetch_array($results, MYSQL_NUM)){
		    $daycodes[$day][$ndx] = $row[5];
			$cnt++;
          $group = ($row[1] & 0x3CFF0000)/ 67108864;
          if ($saveGroup != $group){
            $saveGroup = $group;
            echo "<div><br><p class=\"hd\">&ensp;$category[$group]&ensp;</p></div><br>\n";
            $bg = $cclasses[($group & 1)];
           // continue;
          }
          $scor = $s[$row[5]];
          if ($row[2] == 1){
		  
            $mark = $marker[$class[0]];
            $d = $class[$row[5]];
		//	$mark = $markClass[$tpl[3]][$d];
            $dx = $d . '-' . $row[5] . '-Mark:' . $mark . '-Class: ' . $c ;
            $c = $display[$tpl[3]][$d];
            echo "<p class=\"untested\">$cnt $row[3]&emsp;</p>\n";
   // $err .= '<br>MARKER<pre>' . var_export($marker,true) . "</pre> - $mark<br>" . $class[$row[5]] . " - $row[5]<br>";

			}
		  else {
		//    $err .= "<br>NOT 	TYPE1: $row[0],$row[1],$row[2],$row[3],$row[4],$row[5],$row[6]<br>";
		  }
		  if ($cnt > 110){echo "</div><div class=\"pageBreak\"></div><div> </div><h3 class=\"day\">&emsp;</h3><br><div class=\"col\">
" ;$cnt =0;}
        }
 ***/ 
//    $err .= '<br>DAY CODES<pre>' . var_export($daycodes,true) . '</pre><br>';
   $err .= '<br>DISPLAY CLASS<pre>' . var_export($display,true) . '</pre><br>';

echo <<<EOT
</div><br>
</div>
<script type="text/javascript">//<![CDATA[
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
</script></body></html>
EOT;
}
else{
  $patient = $_GET['p'];
  echo <<< EOT
<div id="hd" class="noPrint">
<form method="GET" action="http://dev.amxemr.com/diet/">
<input type="hidden" name="sub" value="1" />&ensp;<br>&ensp;
<fieldset class="widthWide"><legend>Patient</legend> 
<input class="desc" type="text" name="p" value="$patient" />
<button class="login">Get Diet</button>&emsp;&emsp;</form><h1><br/>&emsp;</h1></div>
EOT;

}

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




