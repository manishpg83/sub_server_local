<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en" ><head><title>Allermetrix eOffice Select</title>
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:0;color:#000;padding:0;background:#f7f7fb;}
#page{max-width:1990px;margin:0 auto 0;padding:0;border:0;background:#f7f7fb;}
pre{color:#000;}
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
input[type="text"],input[type="date"]{font:700 1em Arial,sans-serif;}
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
.center{text-align:center;margin:0 auto 0;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1em;color:#fff;background:#f7f7fb;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{padding:0;margin:0;width:640px}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.link{width:95%;padding:0.5em;margin:5px 0 0 .8em;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;
background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
.submit{width:95%;padding:0.5em;margin:5px 0 0 .8em;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}

.expand,#bs{width:640px;display:block;font-weight:400;margin:0 0 .5em;padding:.2em .2em .2em 2em;text-align:center;background:#fff;text-align:left;}
#post{width:640px;margin:0 auto 0;}
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
#patient{width:15em;margin:0 auto 0;}
#checkboxes{padding-left:7px;clear:both;}
.ige{display:inline-block;width: 297px;margin: 5px 0 3px 0;font-size: .9em;  padding: 9.5px 0 9.5px 0;
background:#f00;color:#fff;text-align:center;}
.igg{display:inline-block;width: 295px;margin: 5px 0 3px 21px;font-size: .9em;  padding: 9.5px 0 9.5px 0;
background:#ff0;text-align:center;color:#000;font-weight:700;}
eckbg{display:inline-block;background:#111;}
.fchk{cursor:pointer;position:relative;text-align:left;background:#2985EA;padding:0;margin:2px;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.echk{cursor:pointer;position:relative;text-align:left;background-color:#e74c3c;background:#e74c3c;   padding:0 0 0 .5em;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#5499c7;   padding:0 0 0 .5em;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.descE{color:#fff;}
.select,.valuebutton{margin:3px 0 0 .2em;border:0;color:#fff;font:700 1em Arial;height:2em;background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);padding:0;display:inline-block;}
.panel,.titlebutton,.typebutton,.select,.valuebutton,.blueLG{text-align:center;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);} 
.redLG{background: linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%);} 
.select{width:150px;}
.testRow{margin:0 0 0 40px;padding:0;text-align:left;}
.red,.blue,.yellow{width: 22px;margin:3px;text-align: center;font-size: 0.5em;color: #fff;} 
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.testDesc{text-align:left;font-size:.9em;margin-left:40px;}

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
.countIgG{background:#00f;color:#fff;}
.countIgG4{background:#ff0;}

.countIgG4,.countIgG,.countIgE,.countTests,.matches{max-width:30px;text-align:center;padding:6px 7px 6px 7px;height:20px;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches,.pname{font:700 1em Arial,sans-serif;display:inline-block;margin:0;width:100%;vertical-align: middle;}
.pname{max-width:300px;padding:0;}
.pname{color:#fff;
background: linear-gradient(to bottom, #2bf 0%, #02f 100%);margin:3px 0 0 0;text-align:left;}
input[type="checkbox"]{width:1.5em;height:1.5em;border-radius: 3px 3px 3px 3px;outline:0;display: inline-block;margin:1px;margin:0;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
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
.g4 > input:checked{background-color: #ff0;}
.g4 > input + span::before {font-weight:400;content: 'G4';color:#999;display: block;text-align: center;position: absolute;left: 0.15rem;top: 0.3rem;}
.g4 > input:checked + span::before {color: #000;}
.g  > input{background-color: #000;}
.g  > input:checked{background-color: #00f;}
.g  > input + span::before {font-weight:400;content: 'G';color:#999;display: block;text-align: center;position: absolute;left: 0.35rem;top: 0.05rem;}
.g,.e > input:checked + span::before {color: #fff;}
.tige{margin-left:87px;}
.checkbox{border: 1px solid #000;width:1.5em;text-align:center;
    border-radius: 4px;    outline: none;
    transition-duration: 0.4s;
    cursor: pointer;}
.texp{padding:0 0 0 23px;margin:auto 10px auto;}
@font-face {font-family: 'barcode';  font-weight: 400;  font-style: normal;  font-display: swap; /* Read next point */  unicode-range: U+000-5FF; /* Download only latin glyphs */  src: local('Barcode Font'),       url('barcode.woff2') format('woff2');}
.click{display:inline-block;width:290px;cursor:pointer;padding:6px 0 6px 7px;}
#header{margin:0 auto 0;width:640px;}
.idea{vertical-align: middle;display:inline-block;width:30px;height:30px;background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAAAAAAeW/F+AAAACXBIWXMAAC4jAAAuIwF4pT92AAACWklEQVR42m1SXUtUURTdE6gpBg7G6KAPGvQxEJUE+dBThD31HpRvUlQQREEvmX0IQvQHwoKoiMCHskchsmCClEgRKSm1mjHNwY90bO7ce84+q33OvTN90OJyz717nb33OmsfAmBgWF5g/LzavSaL/GhjI6CItTxjpb52Ifo0jieXjbwNaCxvpnmbqPED5Wwd9KSywjMv7WiZd6UWdp4q6DDbcH43tbznQMFBKZ7eRq1LzGFxNrlUzbiQuecPHg6vyIaZxtZvVmIoTWNuCpjuqiPB1nNzQDYjwbI0u/FpnOhA54n9RMkXtmQozR5Lc4ChTXT0rW09eoRqRk0gQaEolMPLSToji1KS00W7ChzGJdvLZL6gj9qNcAKlVRvdxddMxpPsIl7GYsnCXnqGwLYz8DFAh3WCaBhFodPxuj0fK2qXDVsx4pJZqKxf3JdIvIYvxdXq0tokbdfGhP0Mis2U2VhbV2VpnyjplbLZ5OMVubI0YzRvNMQmtQpppd9RSjOb6GCixnTSRRRhlctyli6w/3vecsg3sepX4qNAY6iyaiqyjZzlH8ZwnuKDtqDmgS3Uh7EJZzrZbbPNVeP6GNGgCQIzQHQaE9UNU3ADZV5pprbPCsfpPnwfd+gkgmw7JezAyV6W6+2r8EwvPdKep+/RTfaQP3gt0CaUJm04MJfpiZX2mG7IvEJ/nTR3jX10U+9IOj3SQ72wp7LzjC6yPD4uUYQr4sMfF9khQF+iqVHQlLglPxHKtEEgRjq4wf5DMxY7Djl0fA/t+4vWmC31noH6T/H1/tsO/evgUvQXtxfRRwBO4xYAAAAASUVORK5CYII=');}
.ideatext{vertical-align: middle;display:inline-block;}
#e10{margin:0 0 10px 0;}
.head{font:700 1.1em Arial,sans-serif;margin:0 0 2px 0;}
#fs{float:left;margin:0 0 0 0;}
#is{float:left;margin:0 0 0 40px;}
#fis{float:left;margin:0 0 0 40px;}
.hide{display:none;}
</style></head><body>
<div id="header"><img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br></div>
<div id="page"><div id="sub:$sub"></div>

EOT;
ob_flush();
$startTime = microtime(true);
$strdob = date('Y-m-d',strtotime($dob));
$foods = array();
$sql = "SELECT `client`,`last`,`first`,`dob`,`address`,`city`,`state`,`zip`,`history`,`foods` FROM `history` WHERE `id`= $rec";
$results = mysqli_query($link,$sql);
list($client, $last, $first,$dob,$address,$city,$state,$zip,$history,$jsn) =  mysqli_fetch_array($results, MYSQLI_NUM);
$data = json_decode($jsn,1);
$cnt = count($data[0]);
if($cnt == 0){
echo "<p>There were no foods selected by this patient, where record number=$rec.</p>";
  exit;
}

foreach($data[0] as $code => $x){$foods[] = $code;}
$patient = "$first $last";
foreach($data[0] as $code => $x){$foods[] = $code;}
$matches = array();
$sort = array();
$rast = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysqli_query($link,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code; $rast[$code] = $description; $matches[$code] = 0;}
foreach($foods as $code){$matches[$code] = 1;}
$sort = array_flip($sort);
$text = '';
$amxpanels = array('900' => 'Food, Comprehensive','900-5' => 'Food, Comprehensive IgE','900-6' => 'Food, Comprehensive IgG4','950' => 'Food, Standard','950-3' => 'Food, Standard IgE','950-4' => 'Food, Standard IgG4','950-1' => 'Food, Mini','950-5' => 'Food, Mini IgE','950-6' => 'Food, Mini IgG4','253' => 'Hidden Foods ','253-1' => 'Hidden Foods IgE','253-2' => 'Hidden Foods IgG4','220'=>'Peanut Risk','252'=>'Mold');
$statePanels = array ( 'AK' => '200AK', 'AL' => '200AL', 'AR' => '200AR', 'AZ' => '200AZ', 'CA' => '200CA', 'CO' => '200CO', 'CT' => '200CT', 'In' => '200DE', 'FL' => '200FL', 'GA' => '200GA', 'ID' => '200ID', 'IL' => '200IL', 'IN' => '200IN', 'KS' => '200KS', 'KY' => '200KY', 'LA' => '200LA', 'MA' => '200MA', 'MD' => '200MD', 'MI' => '200MI', 'MO' => '200MO', 'MS' => '200MS', 'MT' => '200MT', 'NC' => '200NC', 'NH' => '200NH', 'NJ' => '200NJ', 'NM' => '200NM', 'NV' => '200NV', 'NY' => '200NY', 'OH' => '200OH', 'OK' => '200OK', 'OR' => '200OR', 'PA' => '200PA', 'SC' => '200SC', 'TN' => '200TN', 'TX' => '200TX', 'VA' => '200VA', 'WA' => '200WA', 'WI' => '200WI', 'WV' => '200WV', 'WY' => '200WY');
$statePanel = $statePanels[$state];
if(strlen($statePanel) > 4){
  $amxpanels[$statePanel] = "$state Inhalants";
}
$cPanels = 0;
$pdx = 100;
$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE  `include` = 1 AND `client` = $client ORDER BY `description` ASC";
$result =mysqli_query($link,$sql);
while(list($pDescription,$pName) =  mysqli_fetch_array($result, MYSQLI_NUM)){$cPanels++;$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$pdx = 200;
foreach($amxpanels as $pName => $pDescription){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$idPanels = 'var idPanels = {1:[false],10:[false],20:[false],30:[false],40:[false],';
foreach($pSort as $pdx => $array){
  $idPanels .= "$pdx:[false],";
  foreach($array as $pDescription => $pName){
    $panels[$pdx][0] = $pdx;
    $panels[$pdx][1] = $pName;
    $panels[$pdx][2] = $pDescription;
    $panels[$pdx][3] = array();
    $type = 0;
    $typeCount = array(0,0,0,0);
    $totalIgE = 0;
    $pmatches=array();
    $types=array();
    $food = array();
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$pName' ORDER BY `sort`";
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){
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
<p style="margin-left:15px;">Patient: $first $last</p>
<form action="#" method="post">
<div>
<div class="hide">
<button id="c40" class="link" type="button" onclick ="expb('40')">Help</button>
<div id="e40" class="expand" style="{text-align:left;}">

<hr><br><div class="idea"><p class="ideatext"></div><p>Use your Browser's zoom out function to see more tests at one time.</p><hr><br>
<p class="bold">Click the Panels Bar to see contents of the panel</p>
<img src="eOfficePanelTests.jpg" width="570" height="234" alt="allergy panel tests" /> <br>

</div></div>

EOT;
  $history = json_decode($history,true);
if (count($history) > 0){
  $checkbox = array(1 => 'mother',2 => 'father',3 => 'brother',4 => 'sister',5 => 'grandparent',6 => 'grandparent',7 => 'chest tightness',8 => 'coughing',9 => 'frequent infections',10 => 'shortness of  breath',11 => 'swelling of throat',13 => 'eczema',20 => 'bloating',14 => 'flushing',21 => 'colic',15 => 'hives',22 => 'cramps',16 => 'itching',23 => 'diarrhea',17 => 'rashes',24 => 'nausea',12 => 'wheezing',18 => 'red bumps',25 => 'vomiting',19 => 'swelling of lips',26 => 'headaches',34 => 'ear infections',41 => 'anaphylaxis',27 => 'itchy, red, watery eyes',35 => 'ear pain',42 => 'cannot sleep',28 => 'loss of smell',36 => 'hearing loss',43 => 'loss of consciousness',29 => 'nasal congestion',37 => 'itchy ears',44 => 'low blood pressure',30 => 'nasal pain',38 => 'sinus infection',31 => 'runny nose',39 => 'sinus pressure',32 => 'sinus pressure or pain',40 => 'vertigo',33 => 'sneezing',45 => 'in morning',50 => 'inside house',55 => 'at bedtime',60 => 'outside during morning',46 => 'in afternoon',51 => 'when cleaning',56 => 'windy days',61 => 'outside during night',47 => 'in evening',52 => 'after eating',57 => 'warm days',62 => 'during yard work',48 => 'at work',53 => 'in basement',58 => 'cold days',63 => 'near animals',49 => 'at school',54 => 'in bedroom',59 => 'on clear days',64 => 'near farms/barns',65 => 'January',68 => 'April',71 => 'July',74 => 'October',66 => 'February',69 => 'May',72 => 'August',75 => 'November',67 => 'March',70 => 'June',73 => 'September',76 => 'December',77 => 'dog',78 => 'cat',79 => 'bird',80 => 'horse',81 => 'hamster',82 => 'rabbit',83 => 'goat',84 => 'pig',85 => 'chicken',86 => 'sheep',87 => 'guinea pig',88 => 'duck',89 => 'goose',90 => 'parakeet',91 => 'parrot',92 => 'pigeon',93 => 'cow');
  $categories = array(9,1,1,2,2,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9);
  $category = array(0=>0,1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0,9=>0,10=>0);
  $inhalantFoodTitles = array('Inhalants and Foods','Inhalants','Foods');
  $inhalantFoodTxt = array('','','');
  $inhalantFoods = array(9,5,5,5,5,5,5,0,0,1,0,0,0,2,2,0,0,2,2,2,2,2,2,2,2,2,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
  $month = array('month','month','month','month','month','month','month','month','month','month','month','month');
  $today = date('Y-m-d');
  $inhalantFood = array(0,0,0,0,0);
  $animal = array('dog','cat','bird','horse',' hamster ','rabbit','goat','pig','chicken','sheep',' guinea pig ','duck','goose','parakeet','parrot','pigeon','cow');
  foreach($history as $k => $v){
    $type = substr($k,0,1);
    if($type == 'a' && strlen($v) > 0){$animals[] = $v;continue;}
    if($type == 'm'){$month[$v] = 'emp';continue;}
    $category[$categories[$v]] += 1; 
    $symptomtxt[$categories[$v]] .= $checkbox[$v] . '<br/>';
    $inhalantFood[$inhalantFoods[$v]] += 1;
    $inhalantFoodTxt[$inhalantFoods[$v]] .= "$checkbox[$v]<br/>\n";
    $posted[$k] = $v;
  }
}
$food = $inhalantFoodTxt[2];
$inhalant = $inhalantFoodTxt[1] ;
$both = $inhalantFoodTxt[0]; 
$symptoms[] = $inhalantFoodTxt[2];
$symptoms[] = $inhalantFoodTxt[1];
$symptoms[] = $inhalantFoodTxt[0]; 
$jsn = json_encode($symptoms);
$jsn = mysqli_real_escape_string($link,$jsn);
echo <<<EOT
<button id="c10" class="link" type="button" onclick ="expb('10')">Symptoms</button><div id="e10" class="expand">
<br>
<div id="fs">
<p class="head">Food Symptoms</p>
$food
</div><div id="fis">
<p class="head">Foods and Inhalants</p>
$both
</div>
<div id="is">
<p class="head">Inhalant Symptoms</p>
$inhalant
</div>

</div>
EOT;
ob_flush();
/*
$cp = 'class="hide"';
if($cPanels > 0){$cp = '';}

echo <<<EOT
<div class="hide">
<div $cp>
<button id="c20" class="link" type="button" onclick ="expb('20')">Your Panels</button><div id="d20"></div><div id="e20" class="expand">


EOT;
$TIgE = array('','<div class="tige">Total IgE</div>');
$countMatches = $panels[$pdx][3][4];
$countTests = $panels[$pdx][3][0];
$countIgE = $panels[$pdx][3][1];
$countIgG = $panels[$pdx][3][2];
$countIgG4 = $panels[$pdx][3][3];
$typeE  = array('<tr style="font-weight:400;"><td></td>' , '<tr><td class="red"><div class="box">E</div></td>');
$typeG4 = array('<td></td>' , '<td class="yellow">G<sub>4</sub></td>');
$typeG  = array('<td></td>' , '<td class="blue">G</td>');
$match = array('<td class="nomatch">&#10005;</td>','<td class="match">&#10003;</td>');
foreach($panels as $pdx => $panel){
  $matches = $panels[$pdx][3][5];
  $countTests = $panels[$pdx][3][0];
  $countIgE = $panels[$pdx][3][1];
  $countIgG = $panels[$pdx][3][2];
  $countIgG4 = $panels[$pdx][3][3];
  if($pdx == 200){
  echo <<<EOT
<p class="bold">What the numbers mean:</p>
<div class="matches"> </div> number of foods that match what the patient eats often<br>
<div class="countIgE"> </div> number of IgE tests
<div class="countIgG4"> </div> number of IgG<sub>4</sub> tests<br>
<div class="countIgG"> </div> number of IgG tests
<div class="countTests"> </div> total number of tests<br>
</div>
</div><button id="c30" class="link" type="button" onclick ="expb('30')">Allermetrix Panels</button>

<div id="e30" class="expand">

EOT;
  }
  echo "<div><input id=\"c$pdx\" type=\"checkbox\"  name=\"P" .  $panels[$pdx][1]  . "\" value=\"" . $panels[$pdx][2] . "\" />&#x2003;<div class=\"pname\"  onclick =\"exp('$pdx')\"><div class=\"click\" >$panel[1] $panel[2]&#x2003;</div></div><div class=\"matches\">$matches</div><div class=\"countIgE\"> $countIgE</div><div class=\"countIgG4\"> $countIgG4</div><div class=\"countIgG\"> $countIgG</div><div class=\"countTests\">$countTests</div></div>" . $TIgE[$panels[$pdx][6]] . "\n<div id=\"e$pdx\" class=\"texp\"><table>\n";
  foreach($panel[4] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . $match[$types[0]] . "<td class=\"ptext\">$rast[$code]</td></tr>\n";
  }
echo <<<EOT
</table>

</div>
EOT;
}



<p class="bold">What the numbers mean:</p>
<div class="matches"> </div> number of foods that match what the patient eats often<br>
<div class="countIgE"> </div> number of IgE tests&nbsp;&nbsp;&nbsp;&nbsp;
<div class="countIgG4"> </div> number of IgG<sub>4</sub> tests<br>
<div class="countIgG"> </div> number of IgG tests&nbsp;&nbsp;&nbsp;&nbsp;
<div class="countTests"> </div> total number of tests<br>
</div>
*/
echo <<<EOT
</div><br><div id="checkboxes">
<button id="c003" type="button" class="select" name="C" value="15" onclick="showtop(13)" >&#x2002;
Top 15</button><button id="c010" type="button" class="select" name="C" value="20" onclick="showtop(18)" >&#x2002;
Top 20</button><button id="c004" type="button" class="select" name="C" value="30" onclick="showtop(28)">&#x2002;
Top 30</button><button id="c005" type="button" class="select" name="C" value="40" onclick="showtop(38)">&#x2002;
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
  $Echecks .= "$idE[$key]:[false],";
  $Gchecks .= "$idG[$key]:[false],";
  $g .= "$idG[$key],";
  $e .= "$idE[$key],";  
  echo '<div class="row">
<div class="colWidthE"><div class="dchk"><label class="e chk"> <input  type="checkbox" id="c1' . substr($code,1) .  '" class="chk" name="aE' . $code . '" value="1" /><span></span></label></div><div class="text">&nbsp;' . $rast[$code] . '</div>  </div>
<div class="colWidthG"><div class="dchk"><label class="g4 chk"><input  type="checkbox" id="c3' . substr($foodG[$key],1) . '" class="chk" name="a4' . $foodG[$key] .'" value="3" /><span></span></label></div><div class="text">&nbsp;' . $rast[$foodG[$key]] . '</div></div></div>';
}
ob_flush();
flush();
if(strlen($g) > 13){
  $Echecks = substr($Echecks,0,-1) . "};";
  $Gchecks = substr($Gchecks,0,-1) . "};";
  $g = substr($g,0,-1) . "];";
  $e = substr($e,0,-1) . "];";
}
else{
$Echecks = $Echecks . '};';
$Gchecks = $Gchecks . '};';
$e = $e . '];';
$g = $g . '];';
}
echo <<<EOT
<br>
<hr>

<input type="hidden" name="history" value="$rec" />
<input type="hidden" name="client" value="$client" />
<input type="hidden" name="sub" value="21" />
<input type="submit" value="Next" class="submit" />
</div></div></div></form></div></div>
<div id="e1" ></div>
<script> 
var prev = 1;
var prior = 1;
var id = 0;
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
$idPanels
const set = {0:[false,false,false,false],1:[false,false,true,true],2:[true,true,true,true],3:[false,true,false,false]};
$Echecks
$Gchecks
$g
$e
var ndx = 0;
function init(){console.log('init');
  for (id in EcheckBoxes){
    EcheckBoxes[id][0] = document.getElementById('c' + id);
    EcheckBoxes[id][0].checked = false;
  }
  for (id in GcheckBoxes){
    GcheckBoxes[id][0] = document.getElementById('c' + id);
    GcheckBoxes[id][0].checked = false;
  }
  for (id in idPanels){
    idPanels[id][0] = document.getElementById('e' + id);
    idPanels[id][0].style.display = 'none';
  }
  console.log('idPanels');
  console.log(idPanels);
} 
function clearAll(tf,type){
  for (id in EcheckBoxes){if ( set[type][1]){break;}
    EcheckBoxes[id][0].checked = tf;
  }
  for (id in GcheckBoxes){if ( set[type][3]){break;}
    GcheckBoxes[id][0].checked = tf;
  }
}
function showtop(cnt){
  for (var ndx in e){id = e[ndx];
    EcheckBoxes[id][0].checked = true;
    if(ndx > cnt){break;}
  }   
  for (var ndx in g){id = g[ndx];
    GcheckBoxes[id][0].checked = true;
    if(ndx > cnt){break;}
  }
}
function exp(id){
  var e = idPanels[id][0].style.display;
  idPanels[prev][0].style.display='none';
  idPanels[id][0].style.display=flip[e];
  prev=id;
}
function expb(id){
  var e = idPanels[id][0].style.display;
  idPanels[prior][0].style.display='none';
  idPanels[id][0].style.display=flip[e];
  prior=id;
}
window.onload = init;
</script>

<div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;

ob_end_flush();













?>