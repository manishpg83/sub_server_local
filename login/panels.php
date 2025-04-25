<?php
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$alpha = intval($_POST['Alpha']);
$tab = 5;
$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$t = microtime(1);
$tabs = array('foods','food','pollen','environmental','chemicals','panels','','');

$vol = $volume;
$useragent = $_SERVER['HTTP_USER_AGENT'];
$err = '';
if($sub == 57){
  foreach(glob("$id*.jsn") as $file){unlink($file);}

  $sql = "INSERT INTO `orders` (`id`,`date`, `status`,`client`,`billing`, `first`, `last`, `gender`,`address`, `city`, `state`,`zip`,`phone`, `dob`, `collection`,`volume`, `physician`, `icd101`, `icd102`, `icd103`, `clientID`, `useragent`) VALUES (NULL,NULL,'E', '$client', '$billing','$first', '$last','$gender', '$address', '$city', '$state','$zip','$phone', '$dob', '$collect','$volume', '$physician', '$icd1', '$icd2', '$icd3', '$specimen', '$useragent')";    
  mysqli_query($link,$sql);
  $err = mysqli_error($link);
  if(strlen($err) > 0){$err = ' Error: ' & $err;}
  $rec = mysqli_insert_id($link);
}

echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Allermetrix eOffice Panels</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{width:100%;font:400 0.9em Arial,sans-serif;margin:0;color:#004;padding:0;background:#f7f7fb;}
#page{margin:0 auto;padding:1em 0 0 1em;border:0;max-width:1120px;}
h3{margin:10px 0 1px 0;}
#cp{margin:0 28px 0 10px;float:left;width:470px;}
#nocp{margin:0 auto 0;width:600px;}
#ap{margin:0 0 0 0;float:left;}
button{width: 195px;}
button,.bold{font-weight:700;}
form,button,.inline{display:inline;}
.small{font-size:.9em;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
.pt{margin: 0 0 0 2em;}
.top20{border:1px solid #0f0;}

.link{font:700 1em Arial,sans-serif;cursor:pointer;padding:6px 0 6px 7px;border:1px solid #69B5B3;color: #fff;
background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}

pre{padding:0;margin:0;color:#333;}
#alpha{margin-left:1em;width:15em;}
.alert{background:#f00;color:#fff;}
.col{columns: 4 auto;}
.cat{margin: 0 0 0 3em;font:700 1em Arial;display:inline-block;}
.gray{color:#aaa;}
form{margin:0 auto 0;}
table{display: inline-block;padding:0 0 0 40px;}
caption{font:700 1em Arial;text-align: left;}
.cap{font:700 1em Arial,sans-serif;margin: 0 0 2px 2.5em;}
.cat{margin:2px 0 0 2.5em;}
.hide{display:none;}
.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
.dchk{text-align:left;}
.ec{cursor:pointer;font:400 .9em Arial;padding:0 0 4px 0;margin: 0 5px 0 0; width:1.2em; height:.9em;color:#fff;background:#80afcd;display:inline-block;text-align:center;}
.red{width:22px;text-align:center;font-size: 0.7em;color:#fff;background:#f00;}
.yellow{width:22px;text-align:center;font-size: 0.7em;color:#000;background:#ff0;}
.blue{width:22px;text-align:center;font-size: 0.7em;color:#fff;background:#00f;}
.blank{width:22px;text-align:center;font-size: 0.7em;color:#fff;}
.chk {margin: 0;display: inline-block;height:0;cursor: pointer;position: relative;}
.chk > span {color: #fff; padding: 0; margin:0; height:0; display: inline-block;}
.chk > input {height: 1.3em;width: 1.5em;margin:0 1px 0 1px;padding:4px 0 0 0 ;appearance: none; border: 1px solid #000;border-radius: 4px;outline: none;transition-duration: 0.4s;cursor: pointer;}
.chk > input:checked {border: 1px solid #000;}
.chk > input:checked + span::before {font-weight:700;content: '✓';color: #fff; display: block;text-align: center;position: absolute;left: 0.34rem;top: -0.15rem;}
.chk > input:active {border: 2px solid #000;}

.e  > input{background-color: #fff;}
.e  > input:checked{background-color: #f00;}
.e  > input + span::before {font-weight:400;color:#999;display: block;text-align: center;position: absolute;left: 0.4rem;top: 0.05rem;}
.dim > input:not(:checked){background-color: #3574f8;}

.g4 > input{background-color: #fff;}
.g4 > input:checked{background-color: #ff0;}
.g4 > input + span::before {font-weight:400;content: 'G4';color:#999;display: block;text-align: center;position: absolute;left: 0.15rem;top: 0.05rem;}

.g  > input{background-color: #fff;}
.g  > input:checked{background-color: #00f;}
.g  > input + span::before {font-weight:400;content: 'G';color:#999;display: block;text-align: center;position: absolute;left: 0.35rem;top: 0.05rem;}
.g,.e > input:checked + span::before {color: #fff;}
.g4 > input:checked + span::before {color: #000;}

.row{font:700 1.2em Arial,sans-serif;margin:4px;}
.pnum{display:inline-block;width:60px;}
.pdesc{display:inline-block;width:300px;background:#6bc8f5;padding:2px 0 2px 41px;font:700 1.2em Arial,sans-serif;}
.pdim{color:#ffffffab;}
.clk{cursor:pointer;display:inline-block;margin: 0 0 0 0;padding:3.5px 2px 2.3px 10px;font: 700 .9em Arial,sans-serif;width:300px;color:#fff;text-align:left;background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
.ckback{display:inline-block;background: linear-gradient(to bottom, #2af 0%, #02f 100%);padding:2px 3px 0 2px;padding:2px 3px 0 2px;margin:0;}
.ige{color:#fff;background:#f00;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.igg{color:#fff;background:#00f;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.igg4{color:#000;background:#ff0;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.total{color:#000;background:#ddd;text-align:center;width:30px;display:inline-block;border 2px solid #f00;padding:2px 0 2px 0;margin:0;}
#pat{margin:0 0 0 555px;display:inline-block;vertical-align:-5px;}
#reviewtext{width:320px;display:inline-block;margin:0 0 0 42px;font-size:0.9em;vertical-align:top;}
#available{padding:0 0 0 13px;display:inline-block;width:400px;font:700 1em Arial;}
#b6{display:inline-block;margin:0 0 0 0px;vertical-align:top;}



</style>
</head><body><div id="content"><div id="page"><img src="logo.gif" alt="logo" /><div id="pat"><span class="bold">$clientname</span> <br>Order: $rec <br>Patient: $first $last <br>Billing: $billingType[$billing]</div>
<form action="#" method="post">
<input type="hidden" name="sub" value="41" />
<input type="hidden" name="prior" value="5"/>

<br>
<button id="b0" class="link" name="tab" value="0">Food by Category</button><button id="b1" class="link" name="tab" value="1">Food Alphabetical</button><button id="b2" class="link" name="tab" value="2">Pollen</button><button id="b3" class="link" name="tab" value="3">Environmental</button><button id="b4" class="link" name="tab" value="4">Chemical</button>
<br><br>

EOT;
ob_flush();
include('hidden.php');
$err1 = 0;
$physician = '';
$disallowG = false;
$addon = false;
$available = '';
if($Accession > 200000){
  $addon = true;
  $sql = "SELECT  `Date` FROM `Patient` WHERE `Patient` = $Accession ";
  $results = mysqli_query($link,$sql);
  list($date) = mysqli_fetch_array($results, MYSQLI_NUM);
  $Etest = floor($volume * 1000 / 60);
  $available = "$Etest IgE Tests Available";
  $collection = $date;
  $time = strtotime($date);
  $strdate = date('m/d/y',$time);
  $time = time() - $time;
  $days = ceil($time / 86400);
  if($days > 60){$disallowG = true; $available .= '<br>IgG/IgG<sub>4</sub> No Longer Viable<br>Panels Containing IgG/IgG<sub>4</sub> have been removed';}
  else{$available .= '<br>100+ IgG/IgG<sub>4</sub> tests available';}
}

echo <<<EOT
<div id="review"><div id="available">$available</div>
<div id="reviewtext">
When done making your selections or to review what you have selected so far, click Review.</div><button id="b6" class="link" name="tab" value="6">Review</button>
</div>

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$td = array(array('<td></td>','<td></td>','<td></td>','<td></td>'),array('<td></td>','<td class="red">E</td>','<td class="blue">G</td>','<td class="yellow">G<sub>4</ sub></td>')); 
$dimmer = ['',' class="pdim" '];
$bg = ['','dim '];
$disabled = ['','disabled '];
$checkmark = array('','checked');
$tabs = array('','food','pollen','environmental','chemicals','panels','');
$allergens = array();
$sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysqli_query($link,$sql);
while (list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){$allergens[$code] = $description;}
$cp = array();
$file = $id . 'panels.jsn';
if(file_exists($file)){
  $exists = true;
  $selected = json_decode(file_get_contents($file),1);
}
else{
  $sql = "SELECT `description`,`panel`,`e`,`g`,`g4`,`total` FROM `clientPanels` WHERE `client` = $client ORDER BY `clientPanels`.`description` ASC";
  $panelTest = array();
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>2){exit;}}
  while (list($description,$panel,$e,$g,$g4,$total) = mysqli_fetch_array($results, MYSQLI_NUM)){
	$dim = 0;
	if($disallowG && ($g + $g4) > 0){continue;}
	if($panel == '260' && $addon){continue;}
	//if($available < $e){$dim = 1;}
    $description = preg_replace('/\(.+\)/','',$description);
    $selected[1][$panel] = array(0,1,0,0,$description,$e,$g,$g4,$total,$dim);
    $panels[$panel] = $description;
	$cp[$panel] = $panel;
  }
  $sql = "SELECT `description`,`panel`,`e`,`g`,`g4`,`total` FROM `clientPanels` WHERE  `client`=999001 ORDER BY `description`";
  $results = mysqli_query($link,$sql);
  while (list($description,$panel,$e,$g,$g4,$total) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if($disallowG && ($g + $g4) > 0){continue;}
	if($panel == '260' && $addon){continue;}
    if(in_array($panel,$cp)){continue;}
	$dim = 0;
	$selected[0][$panel] = array(0,1,0,0,$description,$e,$g,$g4,$total,$dim);
  }
  $file = $id . 'panels.jsn';
  $jsn = json_encode($selected);
  file_put_contents($file,$jsn);
}
$ndx = 0;
$checks = 'var checks = {';
if(count($selected[1]) > 0){
   echo "<div id=\"cp\"><h3>Your Panels</h3><div class=\"pdesc\">Panel&emsp;&emsp;Description</div><div class=\"ige\">E</div><div class=\"igg\">G</div><div class=\"igg4\">G<sub>4</sub></div><div class=\"total\">T</div><div id=\"e$ndx\" >\n";

  foreach($selected[1] as $panel => $property){
    if(intval($property[1]) == 0){continue;}
    $ndx++;
    $checks .= "$ndx:[null,null],";
    $dim = 0;//intval($property[9]);
    echo "\n<div class=\"row\"><div class=\"ckback\"><div class=\"dchk\"><label class=\"e chk $bg[$dim]\"><input id=\"c$ndx\" type=\"checkbox\" class=\"chk\" name=\"a$panel" . "\" value=\"1\"" . $checkmark[$property[0]] . " $disabled[$dim] /><span></span></label></div></div><div class=\"clk\" onclick=\"ec('$ndx')\"><span $dimmer[$dim]><div class=\"pnum\" >$panel</div> $property[4]</div></span><div class=\"ige\">$property[5]</div><div class=\"igg\">$property[6]</div><div class=\"igg4\">$property[7]</div><div class=\"total\">$property[8]</div></div><div id=\"e$ndx\" >\n";
    $sql = "SELECT `code`,`type` FROM `PanelTests` WHERE `number` = '$panel' ORDER BY `sort`";
    $results = mysqli_query($link,$sql);
    $types = array();
    while (list($code,$type) = mysqli_fetch_array($results, MYSQLI_NUM)){
  	if(substr($code,0,3) == '100'){continue;}
  	$type = intval($type);
  	if($type == 0){continue;}
  	$types[$code][$type] = 1;
    }
    echo "<table>\n"; 
    foreach($types as $code => $types){
  	echo "<tr>" . $td[intval($types[1])][1] . $td[intval($types[2])][2] . $td[intval($types[3])][3] . "<td>&ensp;$allergens[$code]</td></tr>\n";
    }
    echo "</table></div>\n";
    $apclass = 'ap';
  }
}
else{
  $apclass = 'nocp';
  $selected[1] = array();
}

echo "</div></div><div id=\"$apclass\"><h3>Allermetrix Panels</h3><div class=\"pdesc\">Panel&emsp;&emsp;Description</div><div class=\"ige\">E</div><div class=\"igg\">G</div><div class=\"igg4\">G<sub>4</sub></div><div class=\"total\">T</div><div id=\"e$ndx\" >\n";
ob_flush();

foreach($selected[0] as $panel => $property){
	if(in_array($panel,$cp)){continue;}
 // if(intval($property[1]) == 1){continue;}
  $ndx++;
  $checks .= "$ndx:[null,null],";
  $dim = 0; //$property[9];
 // echo "<div class=\"row\"><div class=\"ckback\"><div class=\"dchk\"><label class=\"e chk\"><input id=\"c$ndx\" type=\"checkbox\" class=\"chk\" name=\"a$panel" . "\" value=\"1\"" . $checkmark[$property[0]] . " /><span></span></label></div></div><div class=\"clk\" onclick=\"ec('$ndx')\"></div><div class=\"pnum\"> $panel</div><span class=\"$dimmer[$dim]\"> $property[4]</span></div></div><div class=\"e\">$property[5]</div><div class=\"g\">$property[6]</div><div class=\"g4\">$property[7]</div><div class=\"total\">$property[8]</div><div id=\"e$ndx\" >\n";
  echo "\n<div class=\"row\"><div class=\"ckback\"><div class=\"dchk\"><label class=\"e chk $bg[$dim]\"><input id=\"c$ndx\" type=\"checkbox\" class=\"chk\" name=\"a$panel" . "\" value=\"1\"" . $checkmark[$property[0]] . " $disabled[$dim] /><span></span></label></div></div><div class=\"clk\" onclick=\"ec('$ndx')\"><span $dimmer[$dim]><div class=\"pnum\" >$panel</div> $property[4]</div><div class=\"ige\">$property[5]</div><div class=\"igg\">$property[6]</div><div class=\"igg4\">$property[7]</div><div class=\"total\">$property[8]</div></div><div id=\"e$ndx\" >\n";
  $sql = "SELECT `code`,`type` FROM `PanelTests` WHERE `number` = '$panel' ORDER BY `sort`";
  $results = mysqli_query($link,$sql);
  $codes = array();
  $panelTest = array();
  $sort = array();
  while (list($code,$type) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if(substr($code,0,3) == '100'){continue;}
	$type = intval($type);
	$codes[$code][$type] = 1;
    $panelTest[$code] = array(0,0,0,0);
  }
  foreach($codes as $code => $types){
    foreach($types as $type => $value){
      $panelTest[$code][$type] = 1;
	}
  }
  echo "<table>\n"; 
  foreach($panelTest as $code => $types){
	echo "<tr>" . $td[$types[1]][1] . $td[$types[2]][2] . $td[$types[3]][3] . "<td>&ensp;$allergens[$code]</tr>\n";
  }
  echo "</table></div>\n";
}
$checks = substr($checks,0,-1) . "};";
$t = number_format( microtime(1) - $t,3);
echo <<<EOT



</div></form></div><div id="ec"><p><br> <br> <br> <br> <br> <br> <br> <br> <br> <br> </p></div></div>
<script>
$checks

var prior = 1;
var disp = '';
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';

function init(){console.log('init');
  for (id in checks){
    checks[id][0] = document.getElementById('e' + id);
    checks[id][0].style.display = 'none';
  }
}
function ec(id){
  var e = checks[id][0].style.display;
  checks[prior][0].style.display='none';
  checks[id][0].style.display=flip[e];
  prior=id;
}
window.onload = init;
</script></body></html>
EOT;
ob_flush();

