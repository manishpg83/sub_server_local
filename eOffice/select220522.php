<?php
ob_start("ob_gzhandler");

header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><head><title>Allermetrix eOffice 2</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:400 1em Arial,sans-serif;margin:0;color:#000;padding:0;background:#fff;}
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#fff;}
pre{color:#ff0;}
#end,#s888{float:none;color:#fff;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1em Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
input[type="submit"]{padding:.5em;}
input[type="text"]{font:700 1em Arial,sans-serif;}
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:center;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:block;}
}
.emp{font:700 1em/1 Arial,sans-serif;}
.inline{display:inline;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{padding:0;margin:0;width:640px}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go,.submit{width:100%;padding:0.5em;margin:.3em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,sans-serif;overflow: visible;}
.panel,.link{border:1px solid #69B5B3;color: #fff;background-color:#fff;background: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.go {
color : #fff;
background : rgb(170, 198, 147);
background : linear-gradient(to bottom, rgb(101, 152, 59, 1) 0%, rgb(45, 72, 31) 100%);
} 
.select{ background: rgb(119,119,167);background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);}
.expand,#bs{width:640px;display:block;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;background:#fff;}
#post{width:640px;margin:0 auto;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}

.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.pchk{text-align:left;width:98%;padding:0;margin:.1em 0;color:#000;display:inline-block;font:700 1em Arial,sans-serif;}
.pnumber{width:3em;display:inline-block;}
.panel{width:18em;padding:.3em .1em .25em .1em;display:inline-block;font-weight:700;}

.col{width:640px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:4em;height:1.5em;display:inline-block;margin:0;padding:.3em 0 0 0;}
.legend{padding-left:20.4em;}
.row{padding:0;margin:0;}
.ige,.pige,.IgE,.descE{background:#e74c3c;color:#000;font-weight:700;}
.igg4,.pigg4,.IgG4,.descG4{background:#5499c7;color:#000;font-weight:700;}



.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:1.5em;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:1.7em;height:1.5em;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.total{background:#00f;color:#fff;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
#patient{width:15em;margin:0 auto;}
#checkboxes{padding-left:7px;}
.ige{display:inline-block;width: 297px;margin: 5px 0 3px 0;font-size: .9em;  padding: 9.5px 0 9.5px 0;
background:#f00;color:#fff;text-align:center;}
.igg{display:inline-block;width: 298px;margin: 5px 0 3px 21px;font-size: .9em;  padding: 9.5px 0 9.5px 0;
background:#00f;text-align:center;color:#fff;font-weight:700;}
eckbg{inline-block;background:#111;}
.fchk{cursor:pointer;position:relative;text-align:left;background:#2985EA;padding:0;margin:2px;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.echk{cursor:pointer;position:relative;text-align:left;background-color:#e74c3c;background:#e74c3c;   padding:0 0 0 .5em;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#5499c7;   padding:0 0 0 .5em;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.descE{color:#fff;}
.select,.valuebutton{margin:3px 0 0 .2em;border:0;color:#fff;font:700 1em Arial;height:2em;background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);padding:0;display:inline-block;}
.panel,.titlebutton,.typebutton,.select,.valuebutton,.blueLG,.submit{text-align:center;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);} 
.redLG{background: linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%);} 
.select{width:148px;}
.testRow{margin:0 0 0 40px;padding:0;text-align:left;}
.red,.blue,.yellow{width: 22px;margin:3px;text-align: center;font-size: 0.5em;color: #fff;} 
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.testDesc{text-align:left;font-size:.9em;margin-left:40px;}
.submit{color:#fff;width:100%;}
#dob{background:#f00;color:#fff;}
#b1000,#b1001,#b1002,#b1003,#b1004{display:none;}
.ptext{font-size:1.1em;text-align:left;}
.text{font-size:1.1em;text-align:left;display:inline-block;margin:5px 0 0 0;padding:5px 0 0 0 ;}
.red,.blue,.yellow,.match{width: 20px;  text-align: center;font-size: 0.6em;color: #fff;}
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.box{border:2px;border-color:#fff;}
.match{text-align:center;background:#58d68d;font-weight:700;}
.nomatch{background:#ddd;color:#555;}
.matches{background:#58d68d;}
.countIgE{background:#f00;color:#fff;}
.countTests{background:#ddd;color:#000;}
.countIgG{background:#ff0;}
.countIgG4{background:#00f;color:#fff;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches{max-width:30px;text-align:center;padding:6px 7px 6px 7px;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches,.pname{font:700 1em Arial,sans-serif;display:inline-block;margin:0;width:100%;}
.pname{max-width:300px;padding:0;}
.pname{color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);margin:3px 0 0 0;text-align:left;}
input[type="checkbox"]{width:1.5em;height:1.5em;border-radius: 3px 3px 3px 3px;margin-color:#fff;outline:0;display: inline-block;margin:1px;margin:0;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
.colWidthE{width:320px;display:inline-block;border-right-color:#f00;border-right-width:3px;}
.colWidthG{width:250px;display:inline-block;border-left-color:#00f;}
.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
.dchk{text-align:left;}
.chk {margin: 0;display: inline-block;height:0;cursor: pointer;position: relative;}
.chk > span {color: #fff; padding: 0; margin:0; height:0; display: inline-block;}
.chk > input {height: 1.77em;width: 1.77em;margin:0 1px 0 1px;padding:4px 0 0 0 ;appearance: none; border: 1px solid #000;border-radius: 4px;outline: none;transition-duration: 0.4s;cursor: pointer;}
.chk > input:checked {border: 1px solid #000;}
.chk > input:checked + span::before {font-weight:700;content: '✓';color: #fff; display: block;text-align: center;position: absolute;left: 0.5rem;top: 0.1rem;}
.chk > input:active {border: 2px solid #000;}
.e  > input{background-color: #fff;}
.e  > input:checked{background-color: #f00;}
.e  > input + span::before {font-weight:400;content: 'E';color:#999;display: block;text-align: center;position: absolute;left: 0.4rem;top: 0.3rem;}
.g4 > input{background-color: #fff;}
.g4 > input:checked{background-color: #00b;}
.g4 > input + span::before {font-weight:400;content: 'G4';color:#999;display: block;text-align: center;position: absolute;left: 0.15rem;top: 0.3rem;}
.g  > input{background-color: #fff;}
.g  > input:checked{background-color: #ff0;}
.g  > input + span::before {font-weight:400;content: 'G';color:#999;display: block;text-align: center;position: absolute;left: 0.35rem;top: 0.05rem;}
.g,.e > input:checked + span::before {color: #fff;}
.g4 > input:checked + span::before {color: #fff;}
<
.tige{margin-left:87px;}
.checkbox{border: 1px solid #000;width:1.5em;text-align:center;
	border-radius: 4px;	outline: none;
	transition-duration: 0.4s;
	cursor: pointer;}
.pexp{padding-left:4em;margin:auto 10px auto;}
@font-face {font-family: 'barcode';  font-weight: 400;  font-style: normal;  font-display: swap; /* Read next point */  unicode-range: U+000-5FF; /* Download only latin glyphs */  src: local('Barcode Font'),       url('barcode.woff2') format('woff2');}
.click{display:inline-block;width:250px;cursor:pointer;padding:6px 0 6px 7px;}
#header{margin:0 auto 0;width:640px;}
</style></head><body>
<div id="header"><img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>The Select Version</div>
<div id="page"><div id="sub" $sub"></div>$err
EOT;
ob_flush();
$startTime = microtime(true);
$strdob = date('Y-m-d',strtotime($dob));
$foods = array();
$sql = "SELECT `client`,`last`,`first`,`dob`,`address`,`city`,`state`,`zip`,`foods` FROM `history` WHERE `id`= $rec";
$results = mysql_query($sql);
(list($client, $last, $first,$dob,$address,$city,$state,$zip,$jsn) =  mysql_fetch_array($results, MYSQL_NUM));
$data = json_decode($jsn,1);
foreach($data[0] as $code => $x){$foods[] = $code;}


$patient = "$first $last";
foreach($data[0] as $code => $x){$foods[] = $code;}
$matches = array();
$sort = array();
$rast = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysql_query($sql);
while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$sort[] = $code; $rast[$code] = $description; $matches[$code] = 0;}
foreach($foods as $code){$matches[$code] = 1;}
$sort = array_flip($sort);
$amxpanels = array('900' => 'Food, Comprehensive','900-5' => 'Food, Comprehensive IgE','900-6' => 'Food, Comprehensive IgG4','950' => 'Food, Standard','950-3' => 'Food, Standard IgE','950-4' => 'Food, Standard IgG4','950-1' => 'Food, Mini','950-5' => 'Food, Mini IgE','950-6' => 'Food, Mini IgG4','255' => 'IBS','255-2' => 'IBS IgE','255-1' => 'IBS IgG4','253' => 'Hidden Foods ','253-1' => 'Hidden Foods IgE','253-2' => 'Hidden Foods IgG4');
$yn = array('No','Yes');
$pdx = 100;
$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE  `include` = 1 AND `client` = $client ORDER BY `description` ASC";
$result = mysql_query($sql);
while(list($pDescription,$pName) =  mysql_fetch_array($result, MYSQL_NUM)){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$pdx = 200;
foreach($amxpanels as $pName => $pDescription){$pSort[$pdx][$pDescription] = $pName;$pdx++;}

$idPanels = 'var idPanels = {1:[null,null,null,null],10:[null,null,null,null],20:[null,null,null,null],30:[null,null,null,null],40:[null,null,null,null],';
foreach($pSort as $pdx => $array){
  $idPanels .= "$pdx:[null,null,null,null],";
  foreach($array as $pDescription => $pName){
    $panels[$pdx][0] = $pdx;
    $panels[$pdx][1] = $pName;
    $panels[$pdx][2] = $pDescription;
    $panels[$pdx][3] = array();
    $clientPanels .= "$pdx:[null,null],";
    $type = 0;
    $typeCount = array(0,0,0,0);
    $totalIgE = 0;
    $pmatches=array();
    $types=array();
    $food = array();
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$pName' ORDER BY `sort`";
    $results = mysql_query($sql);
    while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
  	  $type = intval($type);
      if(substr($code,0,3) == '100'){$totalIgE = 1;continue;}
      $sortedFoods[$sort[$code]] = $code;
      $types[$code][$type] = 1;
      $typeCount[$type] += 1;
      $typeCount[0] += 1;  // total number of tests
      $panels[$pdx][4][$code] = array($matches[$code],intval($types[$code][1]),intval($types[$code][2]),intval($types[$code][3]));
  	  $pmatches[$code] = $matches[$code];
    }
    $pmatch = array_sum($pmatches);
    $panels[$pdx][3] = array(intval($typeCount[0]),intval($typeCount[1]),intval($typeCount[2]),intval($typeCount[3]),intval($typeCount[5]),intval($pmatch));
    $panels[$pdx][8] = $totalIgE;
    $pdx++;
  }
}
$idPanels    = substr($idPanels,0,-1) . "};\n";

echo <<<EOT
<div id="post">
 
$clientName
$t
<form action="#" method="post">
<div>
<button id="c40" class="link" type="button" onclick ="expb('40')">Help</button>
<div id="e40" class="expand">
</div>
<input type="hidden" name="rec" value="$rec"/>

<button id="c10" class="link" type="button" onclick ="expb('10')">Patient: $patient</button><br>
<div id="e10">
<br>Last: <br><input $lclass type="text" name="last" value="$last"  required />
<br>First: <br><input type="text" name="first" value="$first" required  />
<br>DoB: <br><input $dclass $dobid type="date" name="dob" value="$strdob" required  />
<br>Address: <br><input name="address" type="text" value="$address" /><br>
City: <br><input name="city" type="text" value="" /><br>
State: (2 character)<br><input $sclass name="state" type="text" value="$state" required  />&#x2002;<br>
Zip: <br><input name="zip" type="text" value="$zip" /><br>
<p>&#x2003;<br>
<br><hr/>$rec<br></div></div>
<button id="c20" class="link" type="button" onclick ="expb('20')">Your Panels</button><div id="d20"></div><div id="e20" class="expand">

EOT;
$TIgE = array('','<div class="tige">Total IgE</div>');
$countMatches = $panels[$pdx][3][4];
$countTests = $panels[$pdx][3][0];
$countIgE = $panels[$pdx][3][1];
$countIgG = $panels[$pdx][3][2];
$countIgG4 = $panels[$pdx][3][3];
$typeE  = array('<tr style="font-weight:400;"><td></td>' , '<tr><td class="red"><div class="box">E</div></td>');
$typeG4 = array('<td></td>' , '<td class="blue">G<sub>4</sub></td>');
$typeG  = array('<td></td>' , '<td class="yellow">G</td>');
$match = array('<td class="nomatch">&#10005;</td>','<td class="match">&#10003;</td>');
foreach($panels as $pdx => $panel){
  $matches = $panels[$pdx][3][5];
  $countTests = $panels[$pdx][3][0];
  $countIgE = $panels[$pdx][3][1];
  $countIgG = $panels[$pdx][3][2];
  $countIgG4 = $panels[$pdx][3][3];
  if($pdx == 200){
    echo "</div><button id=\"c30\" class=\"link\" type=\"button\" onclick =\"expb('30')\">Allermetrix Panels</button><div id=\"e30\" class=\"expand\">";
  }
  echo "<div><input id=\"c$pdx\" type=\"checkbox\"  name=\"P" .  $panels[$pdx][1]  . "\" value=\"" . $panels[$pdx][2] . "\" />&#x2003;<div class=\"pname\"  onclick =\"exp('$pdx')\"><div class=\"click\" >$panel[2]&#x2003;</div></div><div class=\"matches\">$matches</div><div class=\"countIgE\"> $countIgE</div><div class=\"countIgG4\"> $countIgG4</div><div class=\"countIgG\"> $countIgG</div><div class=\"countTests\">$countTests</div></div>" . $TIgE[$panels[$pdx][6]] . "\n<div id=\"e$pdx\" class=\"pexp\"><table>\n";
  foreach($panel[4] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . $match[$types[0]] . "<td class=\"ptext\">$rast[$code]</td></tr>\n";
  }
  echo "</table>\n</div>\n";
  ob_flush;
}


echo <<<EOT
</div><br><hr><br><div id="checkboxes">
<button id="c003" type="button" class="select" name="C" value="15" onclick="showtop(15)" >&#x2002;
Top 15</button><button id="c010" type="button" class="select" name="C" value="20" onclick="showtop(20)" >&#x2002;
Top 20</button><button id="c004" type="button" class="select" name="C" value="30" onclick="showtop(30)">&#x2002;
Top 30</button><button id="c005" type="button" class="select" name="C" value="40" onclick="showtop(40)">&#x2002;
Top 40</button><br><button id="c007" type="button" class="select" name="C" value="999" onclick="clearAll(true,0)">&#x2002;
Select All</button><button id="c006" type="button" class="select" name="C" value="0" onclick="clearAll(false,0)" >&#x2002;
Clear All</button><button id="c008" type="button" class="select" name="C" value="999" onclick="clearAll(false,1)" >&#x2002;
Clear IgE</button><button id="c009" type="button" class="select" name="C" value="999" onclick="clearAll(false,3)" >&#x2002;
Clear IgG4</button>
<div class="ige">IgE</div><div class="igg">IgG4</div>
EOT;


$e = 'const e = [';
$g = 'const g = [';
$Echecks = 'var EcheckBoxes = {';
$Gchecks = 'var GcheckBoxes = {';
$food = array();
$codesE = file_get_contents('rankIgE.txt');
$rankedE = explode("\n",$codesE);
$codesE = array();
$codesE = array_flip($rankedE);
$codesG = file_get_contents('rankIgG4.txt');
$rankedG = explode("\n",$codesG);
$codesG = array_flip($rankedG);
foreach($foods as $code){
  $food[1][$codesE[$code]] = $code;
  $food[3][$codesG[$code]] = $code;
}
ksort($food[1]);
foreach($food[1] as $code){
  $foodE[] = $code;
  $idE[] =  '1' . substr($code,1);
}
ksort($food[3]);
foreach($food[3] as $code){
  $foodG[] = $code;
  $idG[] =  '3' . substr($code,1);
}
foreach($foodE as $key => $code){
  $Echecks .= "$idE[$key]:[1,null,null,null,null,null],";
  $Gchecks .= "$idG[$key]:[3,null,null,null,null,null],";
  $g .= "$idG[$key],";
  $e .= "$idE[$key],";
  echo '<div class="row"  ><div class="colWidthE"><div class="dchk"><label class="e chk"><input  type="checkbox" id="c1' . substr($code,1) .  '" class="chk" name="E' . $code . '" value="1" /><span></span></label></div><div class="text">&nbsp;' . $rast[$code] . '</div>  </div>
<div class="colWidthG"><div class="dchk"><label class="g4 chk"><input  type="checkbox" id="c3' .  substr($foodG[$key],1) . '" class="chk" name="G' . $foodG[$key] .'" value="3" /><span></span></label></div><div class="text">&nbsp;' . $rast[$foodG[$key]] . '</div></div></div>';
}
ob_flush;
$Echecks = substr($Echecks,0,-1) . "};";
$Gchecks = substr($Gchecks,0,-1) . "};";
$g = substr($g,0,-1) . "];";
$e = substr($e,0,-1) . "];";
echo <<<EOT
<br>
<hr>
<input type="hidden" name="id" value="$client" />
<input type="hidden" name="client" value="$client" />
<input type="hidden" name="sub" value="3" />
<input type="submit" value="Create Request Form" class="submit" />
</div></form></div></div></div>
<div id="e1" ></div>
<script> 
var bg = {1:[false,true],10:[false,true],3:[false,true],30:[false,true]};console.log('bg');
var prev = 1;
var prior = 1;
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
toggle = {};
toggle[true] = false;
toggle[false] = true;
var panelButtons = {};
var idTypes = 0;
var panelBackground = [];
panelBackground[false]  = 'linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%)';
panelBackground[true]   = 'linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%)';
var checkBoxBackground = {1:['#cb4335'],3:['#5499c7']};
$idPanels
console.log(idPanels);
$e
$g
$Echecks
$Gchecks
var id = 0;
function init(){console.log('init');
  for (var id in EcheckBoxes){
    EcheckBoxes[id][2] = document.getElementById('c' + id);
    EcheckBoxes[id][2].checked = false;
  }
  for (var id in GcheckBoxes){
    GcheckBoxes[id][2] = document.getElementById('c' + id);
    GcheckBoxes[id][2].checked = false;
  }
  for (var id in idPanels){
    idPanels[id][2] = document.getElementById('e' + id);
    idPanels[id][2].style.display = 'none';
  }
  console.log('idPanels');
  console.log(idPanels);
}
function clearAll(tf,type){
  var set = {0:[false,false,false,false],1:[false,false,true,true],2:[true,true,true,true],3:[false,true,false,false]};
  for (var id in EcheckBoxes){if ( set[type][1]){break;}
    EcheckBoxes[id][2].checked = tf;
  }
  for (var id in GcheckBoxes){if (set[type][3]){break;}
    GcheckBoxes[id][2].checked = tf;
  }
}
function showtop(cnt){cnt -=2;
  for (var ndx in e){id = e[ndx];
    EcheckBoxes[id][2].checked = true;
    if(ndx > cnt){break;}
  }   
  for (var ndx in g){id = g[ndx];
    GcheckBoxes[id][2].checked = true;
    if(ndx > cnt){break;}
  }
}
function exp(id){
  var e = idPanels[id][2].style.display;
  idPanels[prev][2].style.display='none';
  idPanels[id][2].style.display=flip[e];
  prev=id;
}
function expb(id){
  var e = idPanels[id][2].style.display;
  idPanels[prior][2].style.display='none';
  idPanels[id][2].style.display=flip[e];
  prior=id;
}
window.onload = init;
</script>

<div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;















?>