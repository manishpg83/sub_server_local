<?php
$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];
$npi = trim($_POST['npi']);
$note = str_replace("\r\n",' ',trim($_POST['note']));
$npi = trim($_POST['npi']);
$icd1 = trim($_POST['icd1']);
$icd2 = trim($_POST['icd2']);
$icd3 = trim($_POST['icd3']);
$specimen = trim($_POST['specimen']);
$needed = $_POST['needed'];
$collection = $_POST['collection'];
$physician = trim($_POST['physican']);
$gs = intval($_POST['gs']);
$Abnchk = $_POST['Abnchk'];
if($Abnchk == 1){
  $abn = '<div id="abn">&#9830;&#9830;&#9830;  Medicare ABN Form Required  &#9830;&#9830;&#9830;</div>';
}
$bdi = intval($_POST['bdi']);
$vacutainers = 0;
$needed -= 3 * $celiac;
if($needed > 0){$vacutainers = 1;}
if($needed > 3.5){$vacutainers =  ceil($needed / 3.5);}
$needed += 3 * $celiac;
$vacutainers += $celiac;
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=3600');
//if($id == 0){$id = intval($_COOKIE['amxc']);}
//if($id == 0){$id = intval($_COOKIE['amxp']);}
//setcookie("amxc", $id,time() 86400,'/');
$cmargin = '0';
$imargin = '0';
$smargin = '0';
$bc = array(0 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',1 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',2 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',3 => '<div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',4 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',5 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',6 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',7 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',8 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',9 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>','*' => '<div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>');$barcode = $bc['*'];
$digits = str_split("$rec");
$barcode = $bc['*'];
foreach($digits as $digit){$barcode .= $bc[$digit];}
$barcode .= $bc['*'];
$len = strlen($collection);
$collect = date('m/d/Y',strtotime($collection));
$collect = "<div id=\"collect\">Collection Date: $collection</div>";
if($len < 8){$collect = '<div id="collect">Collection Date:_____________</div>';}
$serum = "<div id=\"needed\">  Serum Needed: $needed ml, $vacutainers Vacutainer (8.5mL SST)</div><div id=\"bc\">$barcode</div>";
$attest = intval($_POST['attest']);
$initals = $_POST['initals'];
$sql = "UPDATE `orders` SET `status`='C',`accession`=$Accession,`first`= '$first',`last`= '$last',`gender`='$gender',`address`='$address',`city`= '$city',`state`= '$state',`zip`= '$zip',`phone`='$phone', `dob` = '$dob', `collection` = '$collection', `physician` = '$physician', `icd101` = '$icd1', `icd102` = '$icd2', `icd103` = '$icd3', `clientID` = '$specimen',`attest`= $attest, `initials`='$initials'  WHERE `id` = $rec";
mysqli_query($link,$sql);
file_put_contents('update.sql',$sql);

$DOB = $dob;
$dob = date('m/d/Y',strtotime($dob));
$space = '';

if($attest == 3){
  $space = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
  $sig = '<div id="hps">Healthcare Provider Signature: x_________________________________</div>';
}
elseif($attest == 1){
  $sig = "<div id=\"hps\">Electronic Attestation made by Provider</div>";
}
else{
  $initials = $_POST['initials'];
  $sig  = "<div id=\"hps\">Authorized Electronic Attestation</div>";
}

$len = strlen($specimen);
$spec = "<div id=\"specimen\">Specimen ID: $specimen$collect</div>";
if($len == 0){$spec = '<div id="specimen">Client Specimen ID:_________________</div>' . "$collect";$smargin = '15px';}
if(strlen($physician) > 2){$phy = "<div>Healthcare Provider Name: $space $physician $npi $initials</div>";}

else{$phy = '<div id="hpname">Healthcare Provider Name:______________________________________ </div>';}
$len = strlen($icd1);
$icd = "<div id=\"icd\">ICD-10 Code: $icd1 $icd2 $icd3 </div>\n";
if($len < 3){$icd = "<div id=\"icd\">ICD-10 Code:________________</div>";$imargin = '15px';if($billing == 1 || $billing == 4){$icd = '';$imargin = 0;}}


$copy = array(
0 => '',
1 => '',
2 => '<p id="copy">Attach a photo copy of the front and back of the insurance card</p>',
3 => '<p id="copy">Attach a photo copy of the front and back of the insurance card</p>',
4 => '',
5 => '<p id="copy">Attach a photo copy of the front and back of the insurance card</p>',
6 => '');
//if (strlen($specimen) < 1){$specimen = substr($first,0,1) . substr($last,0,1) . date('mdy',strtotime($strdob));}
$billingType = array('','Client','Medicare','Medicaid','Patient','Insurance');
$billingCheck = $billingType[$billing];
$fax = '';
if($Accession > 99999){
	$fax = '<div id="fax">FAX this Add On Request ASAP to Allermetrix at (615) 599-4648</div>';
	$serum = "<div id=\"needed\" ><span class=\"black\"> Allermetrix #: $Accession $volume mL</span></div><div id=\"bc\">$barcode</div>";
	$spec = '';
	$collect = '';
}
$hold = ['','*'];
$comments = '';
if(strlen($note) > 1){
  $comments = "<div id=\"note\">Comments: $note</div>";
}
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head>
<title>Allermetrix eOffice</title>
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0;}
#page{margin:0 auto 0;padding:0;border:0;background:#fff;width:620px;}
#leftcolumn{padding:0 1em 0 1em;display:inline-block;width:155px;vertical-align:top;}
.inline{display:inline-block;}
#form,form{display:inline-block;vertical-align:top;}
#nav{vertical-align:top;}
#bottom{height:50px;}
#horz{display:none;}
@media print{
.pgBrkB4 {page-break-before:always;display:block;}
.pgBrk {page-break-after:always;display:block;}
.noPrint{display:block;}
#nav,#bottom{display:none;}
#horz{display:block;}
}
#fax{font:700 1.1em Arial,sans-serif;color:#f00;padding:2px 0 2px 0;}
.emp{font:700 1em/1.4 Arial,sans-serif;}
.black{color:#000;}
.bold{font-weight:700;}
.short{font-size:.8em;}
h2{text-align:left;margin:5px 0 10px 0;font:700 1em Arial;}
h3{text-align:left;margin:0 0 0 0;font:700 1em Arial;}
.multi{font:400 .7em Arial;margin-top:-3px;}
.panel{padding: 2px 0 2px 10px;margin:0 0 0 0;width:400px;font-weight:400;border: solid 1px #000;}
img{vertical-align: top;}
hr{background:#fff;color:#fff;border-color:#fff;}
img{vertical-align: top;}

.chk{margin:0 0 0 0;padding:2px 0 0 0;height:16px;width:20px;text-align:center;background:#fff;color:#000;font:400 .8em Arial;display:inline-block;border: solid #000 1px;border-radius: 3px 3px 3px 3px;}
.table{font:400 1em Times,serif; column-count: 2;column-width: 275px;letter-spacing: -.7px;} 
table{padding:0;margin:0;}
tr {padding:0;margin:0;}
td {text-align:center;padding:3px 0 0 0;}
#panels,#celiac,#individual,#chemicals{margin:5px 0 0 0;}
#celiac{font:700 1em Arial;margin:5px 0 0 0;}
.panelnum{width:70px;display:inline-block;}
.small{font-size:12px;margin:4px 0 4px 0;}
.link{display:inline-block;font-size:1em; font-weight:700; width:205px;padding:1px 0 4px 0;border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}

#patient{clear:both;display:inline-block;width:255px;}
#dob{display:inline-block;width:181px;}
#order{display:inline-block;text-align:right;font-weight:700;}
#bc{display:inline-block;height:21px;padding:0 0 0 0;vertical-align: text-top;}
#needed{display:inline-block;width:490px;margin:0 0 0 0;font:700 1em Arial;color:#f00;}
#collect{display:inline-block;margin:0 0 0 25px;}
#specimen{margin:0 0 0 0;display:inline-block;}
#icd{display:inline-block;margin:$imargin 0 0 0;}
#billing{display:inline-block;margin:2px 25px 0 0;}

#note{max-width:700px;font:700 1em Arial;padding:3px 0 0 0;}
#copy{color:#f00;font-size:1.25em;margin:5px 0 0 0;width:100%;}
#hps{margin:5px 0 1px 0;font-weight:700;}
#hpname{margin:5px 0 5px 0;}
#tests{width:620px;margin:0 0 0 0;font-weight:400;}
#bdi{font:400 1.2em Arial;margin: 20px auto 0;width:725px;font-size:1.1em;clear:both;}
#patientresp{margin: 0px auto 0;width:620px;font-size:1.1em;clear:both;}
#pr{margin:20px 0 0 0; font:400 1em/1.5 Arial,sans-serif;}
#cc{line-height: 40px;margin:20px 0 0 0;}
#ccsig{font-weight:700;margin:25px 0 0 0;}

#caption{font-style: italic;font:700 13px Arial,sans-serif;margin:0 0 0 20px;}
#tele{vertical-align:15px;display:inline-block;margin:0 0 0 120px;}
.nb{width:1px;height:100%;background:#000;display:inline-block;}
.wb{width:2px;height:100%;background:#000;display:inline-block;}
.ns{width:1px;height:100%;background:#fff;display:inline-block;}
.ws{width:2px;height:100%;background:#fff;display:inline-block;}
#spacer{display:inline-block;width:380px;}
p{margin:5px 0 5px 0;}
.bullet{margin:2px 0 2px 15px;}
#abn{font-weight:700;padding:5px 0 5px 0;}
#address{display:inline-block;margin:10px 0 0 85px;}
.address{display:inline-block;margin:15px 0 0 40px;}
</style>
</head><body>

<div id="page">

<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<div id="address">400 Sugartree Lane, Suite 510, Franklin TN 37064<br>Tel: (877) 992-4100 Fax:&ensp;(615) 599-4648</div>
<div id="horz">&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;&#x2500;</div>
<div id="form">
<div id="nav">
<button class="link" onclick="prn()">Print</button><form action="./" method="post"><button class="link" name="sub" value="60" >Done</button><button name="sub" value="53" class="link">Next Patient</button><br>
<input type="hidden" name="client" value="$client"/>
</form>

</div>$fax
<div id="patient">Patient: $first $last</div>
<div id="dob">DoB: $dob </div>
<div id="order"> Order Number: $rec$hold[$onhold]</div><br>
$serum
$spec 
<br><div id="billing">Billing: $billingType[$billing]</div>$icd
$sig
$phy
$client $clientname
$abn
$comments
$copy[$billing]
</div>
<div id="tests">

EOT;
ob_flush();
$bill = array('','C','M','A','P','I','N');

$icd1 = str_replace('.','',$icd1);
$icd2 = str_replace('.','',$icd2);
$icd3 = str_replace('.','',$icd3);
$genders = ['','M','F'];
$npiRequired = [false,false,true,true,false,true,false];
if($npiRequired[$billing] && $npi > 999999999){
 // $sql = "SELECT `first`,`last` FROM `physicians` WHERE `npi` = $npi AND `client`=$client LIMIT 1";
  $sql = "SELECT `first`,`last` FROM `physicians` WHERE `npi` = $npi AND `first` != '' AND `last` != ''";
  $results = mysqli_query($link,$sql);
  list($First,$Last) =  mysqli_fetch_array($results, MYSQLI_NUM);
  if (strlen($Last) > 0 && strlen($First) > 0){
    $physician = "$Last*$First";
  }
}
$logtext = "$onhold\r\n$client\r\n$Accession\r\n$bill[$billing]\r\n$last\r\n$first\r\n$genders[$gender]\r\n$DOB\r\n$address\r\n$city\r\n$state\r\n$zip\r\n$phone\r\n$email\r\n$note\r\n$collection\r\n$specimen\r\n$physician\r\n$npi\r\n$icd1\r\n$icd2\r\n$icd3\r\n";



$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysqli_query($link,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code; $desc[$code] = $description;}




$cnt = 0;
$typeE  = array('<div><div></div>' , '<div><div><div class="E">&#10004;</div></div>');
$typeG4 = array('<div><div class="G4"></div></div>' , '<div><div class="G4">&#10004;</div></div>');
$typeG  = array('<div><div class="G" style="color:#fff;">&#10004;</div></div>' , '<div ><div class="G">&#10004;</div></div>');
$chemical = 0;
$celiac = 0;
$selected = array();
$inputs = '';
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
	$key = substr($key,1);
	if($key == '260'){$celiac = 2; continue;}
    $panels[] ="<div class=\"panel\"><span class=\"panelnum\">$key</span> &nbsp; $value</div>\n";
	
	$logtext .= $key . "0\r\n";
	$numtests++;
	$orders = 1;
	continue;
  }
  elseif($post == 'E'){
	$code = substr($key,1,4);
	if(substr($code,0,2) == 'S0'){$chemical = 4;$chemicals[] = "$code $desc[$code]";continue;}
	$selected[$code][1] = 1;
	$logtext .= $code . "1\r\n";
	$numtests++;
	$orders = 1;
  }
  elseif($post == '4'){
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
	$logtext .= $code . "3\r\n";
	$numtests++;
	$orders = 1;
  }
  elseif($post == 'G'){
	$code = substr($key,1,4);
	$selected[$code][2] = 1;
	$logtext .= $code . "2\r\n";
	$numtests++;
	$orders = 1;
  }
}
$orders += $chemical;
$orders += $celiac;

if(count($panels) > 0){
  echo "<div id=\"panels\"><h3>Panels Ordered</h3>";
  foreach($panels as $text){echo $text;}
  echo '</div>';
}
$multi = '';
if($orders > 1 && $orders & 1){
  $multi = "<div class=\"multi\" >Will be assigned a seperate accession number</div>";
}
if($celiac == 2){
  echo "\n<div id=\"celiac\">Celiac Panel</div>$multi<div class=\"panel\"><span class=\"panelnum\">2600</span> &nbsp; Celiac Panel</div></div>\n";
  $multi = "<div class=\"multi\" >Will be assigned a seperate accession number</div>";
}

if(count($chemicals) > 0){
  foreach($chemicals as $code){
    $logtext .=  substr($code,0,4) . "1\r\n";
  }
}
$logtext = "$orders\r\n" . $logtext;

$file = "/home/amx/orders/$rec" . "login.txt";
file_put_contents($file,$logtext);

if(count($selected) > 0){
  $sort = array_flip($sort);
  foreach($selected as $code => $types){
    $tests[$sort[$code]]= intval($types[1]) . '|' . intval($types[3]) . '|' .intval($types[2]) . '|' . $code . '|';
  }
  ksort($tests);
  echo <<<EOT
  
<div id="individual">
<h3>Individual Tests Ordered</h3>
<div class="table">

EOT;
  $classE = array('&ensp;','E');
  $classG4 = array('&ensp;','G<sub>4</sub>');
  $classG = array('&ensp;','G');
  foreach($tests as $key => $data){
    list($etype,$g4type,$gtype,$code) = explode('|',$data);
    $e = $classE[$etype];
    $g4 = $classG4[$g4type];
    $g = $classG[$gtype];
    echo <<<EOT

<div><div class="chk" >$e</div> <div class="chk">$g4</div> <div class="chk">$g</div>&ensp;$code $desc[$code]</div>

EOT;
  }
  echo '</div>';
}





if(count($chemicals) > 0){
	
	echo "<div id=\"chemicals\"><h3>Chemicals $multi</h3>\n<div class=\"table\">\n";
  foreach($chemicals as $test){
    echo '<div><div class="chk" >E</div>&ensp;' . $test . "</div>\n";
  }
  echo '</div>';
}
  echo '</div></div></div></div><div id="bottom"></div>';

$abn = '';
if($Abnchk == 1){$abn = '<br><p class="bullet">&#9830; A signed Medicare Advance Beneficiary Notice of Non-coverage';}
$insBullet = array();
$insBullet[] = '';
$insBullet[2] = '<p class="bullet">&#9830; Medicare Information' . $abn;
$insBullet[3] = '<p class="bullet">&#9830; Medicaid Information' . $abn;
$insBullet[4] = '';
$insBullet[5] = '<p class="bullet">&#9830; Insurance Information';

$abn = '';
if($Abnchk == 1){$abn = '<br><p class="bullet">&#9830;  and signed  Advance Beneficiary Notice of Non-coverage';}
$insurance = array();
$insurance[1] = '';
$insurance[2] = '<p class="bullet">&#9830; Medicare Information' . $abn;
$insurance[3] = '<p>You will also need to provide  your Medicaid Information' . $abn;
$insurance[4] = '<p>You will also need to provide your completed and signed Patient Responsibility Form';
$insurance[5] = '<p>You will also need to provide your Insurance Information';
$patientResponsibility = <<<EOT

<p class="bullet">&#9830; Patient Responibility Form<br></p>
<p><span class="bold">You must complete and sign the Patient Responibility Form </span><br>
We will be unable to test your serum if we do not have your patient responibility signature, payment method, or the requerst form signed by your healthcare provider. 
EOT;
if($billing == 1 | $billing == 2 | $billing == 3){$patientResponsibility = '';}
$instructions = '<p class="bullet">&#9830; Instructions for the drawing location <br><br></p>';
$JSinstruction = "document.getElementById('bdi').style.display = 'block';";
if($bdi == 0){
  $instructions = '<br><br></p>';
  $JSinstruction = "document.getElementById('bdi').style.display = 'none';";
}
$qty = array('One','One','TWO','THREE','FOUR','FIVE','SIX','SEVEN','EIGHT',NINE);
$freeze = '';
if($gs > 0){$freeze = 'DO NOT FREEZE.</p>';}
echo <<<EOT
<div class="pgBrkB4"></div>
<div id="bdi">
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<div id="caption" style="font-style:italic;">improving allergy outcomes</div>
<p><br>Dear Patient,</p>
<p>Please find enclosed supplies for your serum sample to be sent to Allermetrix.  </p>
<p class="bullet">&#9830; Small screw capped serum tube 
<p class="bullet">&#9830; Larger plastic transport tube 
<p class="bullet">&#9830; Glass Vacutainer blood collection tube
<p class="bullet">&#9830; Biohazard plastic bag</p>
<p class="bullet">&#9830; US Postal Service Prepaid Priority Padded Envelope.<span class="bold"> Record the Tracking Number</span></p>
$instructions

<p class="bold">You will also need</p>
<p class="bullet">&#9830;  An Allermetrix request form signed by your healthcare provider.</p>  
$patientResponsibility
$insurance[$billing]
<p><br>After your blood has been processed, your serum will be in the USPS Priority Mail envelope.<br>
Make sure the envelope contains:
<p class="bullet">&#9830; Your Serum
<p class="bullet">&#9830; The Request Form
$insBullet[$billing]
<p>Either you, or the blood draw location, can mail the envelope.<br><br></p>
<p><span class="bold">NOTE:</span> Allermetrix has a National Contract with A<span class="short">NY</span>L<span class="short">AB</span>T<span class="short">EST</span>N<span class="short">OW</span> drawing centers. <br>
The A<span class="short">NY</span>L<span class="short">AB</span>T<span class="short">EST</span>N<span class="short">OW</span> cost is $30.00 for the blood drawing.  
<br>If you use A<span class="short">NY</span>L<span class="short">AB</span>T<span class="short">EST</span>N<span class="short">OW</span>, you may need to inform them of the National Contract. 
<p>The results of your tests will be sent to your doctor.</p>
<p>Thank you for using Allermetrix.</p>
<p>If you have any questions, please contact Client Services at Allermetrix, 877-992-4100.</p>
<div class="pgBrkB4"></div>
<div class="inline">
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<div id="caption" style="font-style:italic;">improving allergy outcomes</div></div>
<div id="tele">Allermetrix Telephone:  877-992-4100</div>
<h2>Instructions for Serum Preparation and Shipping</h2>
Patient: $first $last
<p class="bold">Draw a MINIMUM of $qty[$vacutainers], 8.5mL SST Tubes<br>
MINIMUM serum required is $needed mL</P>
<p>Use the provided red/gray-top 8.5mL tube SST (inside the large, plastic shipping tube).</p>
<p>Note: The 8.5 ml SST tube will yield approximately 3.5 ml sera.</p>
<p>Label drawing tube with patient’s full name and collection date.<BR></p>
<p>No special patient preparation is necessary for testing (e.g., diet).<br></p>


<p><span class="bold">Preparation</span><br>
&#9830; Gently invert collection tube 5 times (this will mix clot activator).</p>
<p>&#9830; Allow blood to clot in a vertical position for a minimum of 30 minutes (a dense clot should be observed).</p>
<p>&#9830; Centrifuge 10 minutes at full speed (1100-1300g) for swinging head units (15 minutes for fixed angle centrifuge).</p>
<p>A barrier will form between the clot and serum.</p>
<p>&#9830; Label graduated transport tube (provided by Allermetrix) with patient’s full name and collection date. Verify the volume meets testing requirement. <br>
Two identifiers on the tube must be indicated (please include Date of Birth).</p>
<p>&#9830; Pour serum from the vacutainer tube into the small patient transport tube and secure the cap on tightly.<br></p>

<p><span class="bold">Storage</span> (if necessary)</span><br>
If serum is not going to be sent immediately, store in refrigerator (for no longer than 4 weeks). <br>The specimen is stable at room temperature for up to one week. 
$freeze
<p><span class="bold">Shipping</span><br>
Place the small patient transport tube into the large screw-top plastic container securing tightly (provided by Allermetrix). Place in zip lock pocket of the biohazard bag (provided by Allermetrix).</p>
<p>Place the request form in the non-zip portion of the biohazard bag.</p>
<p>Place the biohazard bag in the provided Priority Mail padded envelope which has a completed prepaid label affixed to the shipping bag. Record the tracking number found on the label. No additional paperwork is needed.</p>
<p>If you have daily mail pickup, you can put the envelope in your outgoing mail. If you or the patient prefer, give the enveope to the patient.</p>
<p>The package can be tracked by going to www.usps.com and entering the tracking number.</p>
<p>Licenses: CAP No 7195967/CLIA No 44D1053766/TN No 0000004128    </p>
</div>
<div class="pgBrkB4"></div>
EOT;
if($billing < 4){
  echo <<<EOT
<script>
$JSinstruction
function prn(){
  window.print();
}
</script>
</body></html>

EOT;
$jsn = json_encode($logtext);
$sql = "UPDATE `orders` SET `jsn` = '$jsn' WHERE `id` = $rec";
mysqli_query($link,$sql);

//echo $sql;





exit;
}
























echo <<<EOT
<div id="patientresp">
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<div class="address">400 Sugartree Lane, Suite 510, Franklin TN 37064<br>Tel: (877) 992-4100 Fax:&ensp;(615) 599-4648</div>
<br>
<h3><br>Patient Responsibility<br>&emsp;</h3>
EOT;
ob_flush();
$responseability[5] = 'I understand that if I elect to receive the services and my healthcare insurance company determines that the services are part of  my Deductible, Coinsurance, Out-of-Network, are Investigational Services, are not Covered Services, are not considered to be Medically Necessary or Medically Appropriate:<br><br>
<span class="emp">I will be responsible to pay for all costs associated  with the laboratory services that are not paid by my insurance policy. I authorize the use of my credit/HSA card and understand that I will be informed of the costs prior to Allermetrix withdrawing funds via my payment choice indicated below:</span></p>';
$responseability[4] = 'I will be responsible to pay for all costs associated with the laboratory services that my healthcare provider has ordered for testing at Allermetrix.'; 
if($phone > 0){$phone = substr($phone,0,3) . '-' . substr($phone,3,3) . '-' . substr($phone,6,4);}
echo <<<EOT
$inputs

$first $last<br>
$address $city $state $zip<br>
$phone
<p id="pr">$responseability[$billing]</p>
<div id="ccsig">Signature: x______________________________________________________</div>
<div id="cc">
 &xcirc; Call me for credit card information <br>
Phone: _________-________-___________ <br>
Best time to call:___________________________<br>

Credit Card Type: &xcirc; Visa &emsp; &xcirc; Mastercard &emsp; &xcirc; Discover &emsp;  &xcirc; AMEX<br>
Is this a Healthcare card (FSA HSA HRA): &xcirc; Yes &emsp; &xcirc; No<br>
Number: ___________________________<br>Exp Date: _____/_____<br>CVV <span class="small">(3 digit security code on back of card)</span>: __________<br>
</div></div>



<script>
$JSinstruction
function prn(){
  window.print();
}

</script>
--
</body></html>
EOT;
ob_flush();

$jsn = json_encode($logtext);
$sql = "UPDATE `orders` SET `jsn` = '$jsn' WHERE `id` = $rec";
mysqli_query($link,$sql);
    $err = mysqli_error($link);
  echo "<br><br>Error: $err";
echo "_________________________________________";



/*
if($billing < 4){
  echo <<<EOT
<script>
$JSinstruction

</script>
EOT;
exit;
*/
?>












