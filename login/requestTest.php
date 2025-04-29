<?php
$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];

if($phone > 0){$phone = substr($phone,0,3) . '-' . substr($phone,3,3) . '-' . substr($phone,6,4);}
$sub = intval($_POST['sub']);
$client = intval($_POST['client']);
$attest = intval($_POST['attest']);
$initials = substr($_POST['attest'],1,4);
$sql = "UPDATE `orders` SET `status`= 'O', `attest`= $attest,`initials`='$initials' WHERE `id` = $rec";
mysqli_query($link,$sql);
$needed = trim($_POST['needed']);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=3600');

echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice Request Form</title>
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;background:#f7f7fb;color:#000;padding:0; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;}
#post{width:440px;margin:0 auto;background:#f7f7fb;}
pre{color:#000;}
#end,#s888{float:none;color:#fff;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1em Arial,sans-serif;}
.red{color:#f00;font:700 .7em Arial,sans-serif;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.hf{font:400 .9em/1.1 Arial,sans-serif;}
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
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:center;margin:20px 0 5px 0}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
.pgBrkB4 {display:none;}
@media print{
.pgBrk {page-break-after:always;}
.pgBrkB4 {page-break-before:always;display:block;}
.noPrint{display:block;}
.fchk,.pchk,input[type="radio"],.dchk,.dchk3,.dchk4,.chk{background:#fff;}
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
td,tr{padding:0;margin:0;}

#cover{text-align:center;font-size:2em;padding-top:2em;} 
#name{text-align:left;margin:3em 0 5em 7em;}
.link{border:1px solid #69B5B3;color: #fff;background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
.go{border:1px solid #f00;color: #fff;background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.btn{padding:8px 8px 8px 8px;font:700 1em Arial,serif;width:100%;border:1px solid #2985EA;color: #fff;background-color:#2985EA;margin:0 0 50px 0;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}

#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
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
.e > input:checked + span::before {color: #fff;}

.patient{width:265px;}
input[type="checkbox"]{width:1.5em;height:1.5em;border-radius: 3px 3px 3px 3px;outline:0;display: inline-block;margin:0;vertical-align: middle;color:#eee;vertical-align: middle;}   
input[type="radio"],input[type="checkbox"]{opacity:1;width:1.5em;height:1.5em;border:2px solid #fff;outline:2px solid #fff;display: inline-block;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#fff;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
input[type="date"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}

.pnumber{width:3em;display:inline-block;}
.descE,.descG4{font-size:.9em;width:11em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1em Arial;margin:0 0 0px 240px;color:#f00;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#000;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.row{padding:0;margin:0;}
::placeholder{color:#f00; 
  opacity: 1;
}
.xpanel{width:18em;padding:0 .1em 0 .1em;display:inline-block;font-weight:700;border:0;}
.panel{width:400px;text-align:left;font:700 1em Arial,sans-serif;color:#fff;padding:4px 0 4px 4px;background:linear-gradient(to bottom, #398bd3 0%, #1f70b7 100%);}
.pnum{display:inline-block;width:70px;}
.pdesc{display:inline-block;width:300px;}

.radio{display:inline-block;}
#gender{padding: 0 0 0 14px;}
.types{float:right;display:inline-block;width:6em;}
#patient{padding:1em;background:#f7f7fb;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#000;color:#000;border-color:#000;}
legend{margin-top:.4em;}

.client{margin:0;}
.icdtxt,#physician,#specimen,#collect,.row{margin: 2px 2px 2px 2px;}
.icd{margin: 2px 2px 2px 2px;width:75px;}
.label{width:160px;display:inline-block;text-align:right;}
.plabel{width:75px;display:inline-block;text-align:right;}
.icdButton{margin: 0 0 0 0;padding:5px 5px 5px 100px;font: 700 1em Arial,sans-serif;width:100%;color:#fff;text-align:left;
background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
#physican{display:inline-block;width:230px;}
#show{margin: 0 0 0 0;padding:5px 5px 5px 5px;font: 700 .9em Arial,sans-serif;width:100%;color:#fff;text-align:center;
background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
#i1,#i2,#i3,#i4,#i5,#i6{display:none;font:400 .9em Times,serif;margin:0 0 0 0; padding:0 0 0 0;width:100%;}
#header{margin:0 auto 0;width:640px;}
#requests{width:98%; margin:0 auto 0;}
#tests{margin:0 0 0 70px;}
#patientaddress{display:none;}
#medical{background:#f7f7fb;}
#enablesub{display:none;}
#billing{display:none;margin:0 0 0 0:0;width:20px; font:400 .6em Times,serif;text-align:center;background:#f00;color:#fff;}
.G{padding:4px 0 4px 0;margin:0;width:20px; font:400 .6em Times,serif;text-align:center;background:#00f;color:#fff;display:inline-block;}
.G4{padding:4px 0 4px 0;margin:0;width:20px; font:400 .6em Times,serif;text-align:center;background:#ff0;color:#000;display:inline-block;}
.table{font-weight:400;}
#counts{display:none;margin:0 0 0 77px;}
.countTests{background:#ddd;color:#000;}
.countIgG{background:#00f;color:#fff;}
.countIgG4{background:#ff0;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches{max-width:33px;text-align:center;padding:1px 1px 1px 1px;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches,.pname{font:700 .9em Arial,sans-serif;display:inline-block;margin:0;width:100%;}
.countIgE{background:#f00;color:#fff;margin:0 0 0 40px;}
.treq{margin:25px auto 8px auto;padding:0 0 0 0;width:300px; font:700 1.2em Arial,sans-serif;} 
.preq{margin:25px auto 8px auto;padding:0 50px 0 0;width:300px; font:700 1.2em Arial,sans-serif;} 
.tiny{font-size:.6em;}
.subhead{font:400 .8em Times,serif;margin: 0 0 0 40px;}

.xyz{letter-spacing: -.7px;color:#004;}
#serum{margin:3px 0 20px 0; padding:8px 0 8px 0;font:700 1.2em Arial,sans-serf;width:100%;text-align:center;color:#f00;background:#ff0;
background: linear-gradient(to bottom, rgba(255,255,0,1) 0%, rgba(222,222,0,.6) 100%);}
.submit{margin:5px 0 5px 0;font:700 1em Arial,sans-serif;cursor:pointer;padding:12px 0 12px 7px;border:1px solid #69B5B3;color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,44,1) 100%);width:100%;}
#note{min-width:440px;}
#client{margin:0 auto 0;text-align:center;} 
#attest{display:inline-block;width:500px;margin:0;}
#footer{margin:0 auto 200px auto;width:440px;}
#total{margin:20px 0 3px 0; font:700 1.1em Arial,sans-serf;}
.indent{margin:0 0 0 20px;; font:700 1em Arial,sans-serf;}
.footnote{margin:1px 0 1px 0;font:400 12px Arial,sans-serif;}
#mi{display:none;color:#f00;font:700 1.2em Arial;}
.excess{font-size:.9em;}
#med{margin: 0 0 15px 0;}
#address{font:700 1em Arial;margin:15px; 0 15px 0;color:#f00;}
#icdrequest{font:700 1em Arial;margin:15px; 0 15px 0;color:#f00;}
#bdi{color:#b11;font-weight:700;}
#hcp{width:500px;}
.hide{display:none;}
textarea{width:100%;margin-bottom:10px;}
#provider{display:none;border-style: outset;margin:10px 0 10px 0;}
#initals{display:none;margin:5px 0 10px 0;}
input::placeholder {
    font-weight: bold;
    opacity: .6;
    color: red;
}
.required{color:#f00;font-weight:700;font-size:1em;display:inline-block;}
#asteriskFirst{display:none;}
#asteriskLast{display:none;}
</style></head><body>

<div id="header">

<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>
<div id="client">$clientname &#x2003; Order Number: $rec <br>
Patient:$first $last &#x2003; Billing: $billingType[$billing]  &#x2003; Needed: $needed mL</div>
</div>
<div id="post">

EOT;

ob_flush();
//Full texts	id Descending 1	status	accession	date	client	first	last	gender	address	city	state	zip	phone	dob	collection	volume	physician	icd101	icd102	icd103	clientID	followup	a
$NPI = trim($_POST['npi']);
$icd1 = trim($_POST['icd1']);
$icd2 = trim($_POST['icd2']);
$icd3 = trim($_POST['icd3']);
$Abnchk = intval($_POST['Abnchk']);
$collect = '';
if($Accession == 0){
  $collect = '<div class="row"><div class="label">Collection Date:</div> <input id="collect" type="date" name="collection" value="$collection" /></div>';
}
$sql = "SELECT COUNT(*),`physician`,`npi`,`first`,`last` FROM `physicians` WHERE `client` = $client GROUP BY `physician` ";
$results = mysqli_query($link,$sql);
$cnt = mysqli_num_rows($results);
$option = '';
$jsnpi = 'const npi = {'; 
$phy = "<div id=\"hcp\"><div class=\"label\">Healthcare Provider:</div> <input id=\"physican\" type=\"text\" name=\"physican\" value=\"$physician\"  autocomplete=\"off\"  onkeyup=\"getlength();\" />";

if($cnt > 0){
   $phy = "<div class=\"row\"><div class=\"label\">Healthcare Provider:</div> <input id=\"physican\" type=\"text\" name=\"physican\" value=\"$physician\"  list=\"phy\"placeholder=\"Click for List or Type Name\" autocomplete=\"off\" oninput=\"getnpi();\"/><span class=\"red\"> &#x2731;&#x2731;</span></div><datalist id=\"phy\" >";
   while(list($code,$physician,$npi) = mysqli_fetch_array($results, MYSQLI_NUM)){$random = rand(100000,999999);
     $phy .= " <option name=\"r$random\" value=\"$physician\">$physician</option>\n";
     $jsnpi .= "'$physician':'$npi',";
  }
  $phy .= "</datalist>\n"; 
}
$phy .= "<div id=\"provider\"><span class=\"red\">&ensp;Required</span><br>
<p id=\"attest\"><input id=\"confirmation\" type=\"radio\" name=\"attest\" value=\"1\" required  onclick=\"confirm(1);\" >
 I attest I am this provider.</p>
 
 <p id=\"attest\"><input id=\"confirmation\" type=\"radio\" name=\"attest\" value=\"2\" required  onclick=\"confirm(2);\" >
 I attest I am authorized to order on the behalf of this provider.</br>
 <p id=\"initals\">&emsp;Your Initials <input id=\"initial\" type=\"text\" name=\"initals\" onkeyup=\"chkinitials()\"></p>
 
 <p id=\"attest\"><input id=\"confirmation\" type=\"radio\" name=\"attest\" value=\"3\" required onclick=\"confirm(3);\">
 Provider will sign this request.</p></div>";
//$phy = "<div class=\"row\"><div class=\"label\">NPI:</div> <input id=\"NPI\" type=\"text\" name=\"mpi\" value=\"$npi\"   autocomplete=\"off\" ;/>";

$jsnpi .= '};';
$addrequest = array('','','','','','','');
//echo "<br>a " . strlen($address) . ', z ' . strlen($zip) . ', s ' . strlen($state) . ', c ' . strlen($city) . "<br>";
if(strlen($address) < 5 || strlen($zip) < 5 || strlen($state) != 2 || strlen($city) < 3 ){
  $addrequest[2] = '<div id="address">Patient Address is optional for Medicare.  <br>If you have it available now, <br>please enter it now.</div>';
  $addrequest[3] = '<div id="address">Patient Address is optional for Medicaid.  <br>If you have it available now, <br>please enter it now.</div>';
  $addrequest[4] = '<div id="address">Patient Address is essential for Patient Pay.  <br>If you have it available now, <br>please enter it now.</div>';
  $addrequest[5] = '<div id="address">Patient Address is essential for Insurance.  <br>If you have it available now, <br>please enter it now.</div>';
  $addrequest[6] = '<div id="address">Patient Address is essential for Patient Pay.  <br>If you have it available now, <br>please enter it now.</div>';
}
$icdrequest = array('','','','','','','');
if(strlen($icd) < 3){
   $icdrequest[2] = '<div id="icdrequest">ICD 10 Code is essential for Medicare.</div>';
   $icdrequest[3] = '<div id="icdrequest">ICD 10 Code is essential for Medicaid.</div>';
   $icdrequest[5] = '<div id="icdrequest">ICD 10 Code is essential for Insurance.</div>';
}
$checked = array('','','','','','','');
$checked[$gender] = 'checked';


// $spanLast = '';
// if(strlen($last) < 3){$spanLast = '<span id="asteriskLast"> &#x2731;&#x2731;</span>';}
// $spanFirst = '';
// if(strlen($first) < 3){$spanFirst = '<span id="asteriskFirst"> &#x2731;&#x2731;</span>';}




//$day = 




echo <<<EOT
<div id="page">
<form id="frm" action="./" method="post">
<div id="patient">&#x2003;
<p>Fields with <span class="required" > &#x2731;&#x2731;</span> are Required.</br>
Fields with <span class="required" > &#x2731;</span> are Needed.<br>
Needed fields, if blank, may put order on hold.
</p>$clientName

<div class="row"><div class="plabel">Last:</div> <input id="last" class="patient" type="text" name="last" value="$last"  required/><span id="asteriskLast"> &#x2731;&#x2731;</span></div>
<div class="row"><div class="plabel">First:</div> <input id="first" class="patient" type="text" name="first" value="$first" required/><span id="asteriskFirst"> &#x2731;&#x2731;</span></div>
<div class="row"><div class="plabel">DoB:</div> <input id="dob" type="date" name="dob" value="$dob" /><span class="red"> &#x2731;</span></div>
<div id="gender">Gender:
<div class="radio"><input type="radio"  name="gender" value="1" $checked[1] required/>&thinsp;Male&#x2002;</div>
<div class="radio"><input type="radio"  name="gender" value="2" $checked[2] />&thinsp;Female</div><span class="red"> &#x2731;</span></div>

EOT;
if($billing != 1){
echo <<<EOT
$addrequest[$billing]
<div class="row"><div class="plabel">Address:</div> <input class="patient" type="text" name="Address" value="$address" /></div>
<div class="row"><div class="plabel">City:</div> <input class="patient" id="city" type="text" name="city" value="$city" /></div>
<div class="row"><div class="plabel">State:</div> <input class="patient" id="state" type="text" name="state" value="$state" /></div>
<div class="row"><div class="plabel">Zip:</div> <input class="patient" id="zip" type="text" name="zip" value="$zip" /></div>
<div class="row"><div class="plabel">Phone:</div> <input class="patient" id="phone" type="text" name="phone" value="$phone" /></div>
<div class="row"><div class="plabel">eMail:</div> <input class="patient" id="email" type="text" name="email" value="$email" /></div>
</div>
EOT;
}


echo <<<EOT
<br><hr><br>
<div id="medical">
<div id="med">If you have the information below available to you now, please enter it now.<br></div>
$collect
<div class="row"><div class="label">Your Specimen ID:</div> <input id="specimen" type="text" name="specimen" value="$specimen"  size="20"/></div>


<input id="NPI" type="hidden" name="npi" value="$NPI" />
EOT;
$icd = '';
if($billing != 1 && $billing != 4){ 
$icd = "
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none';
  }
";
echo <<<EOT
<div id="icd">
<hr>
$icdrequest[$billing]
<h3>Diagnostic Code(s)</h3>
<div class="row"><div class="label">ICD-10:</div> <input class="icd" type="text" name="icd1" value="$icd1"  size="20" /></div>
<div class="row"><div class="label">ICD-10:</div> <input class="icd" type="text" name="icd2" value="$icd2"  size="20" /></div>
<div class="row"><div class="label">ICD-10:</div> <input class="icd" type="text" name="icd3" value="$icd3"  size="20" /></div>
<button type="button" class="icdButton" onclick="exp('1')">Asthma ICD-10 Codes</button>
</div>
<div id="i1">
<div class="icdtxt">J45.2 Mild intermittent asthma</div>
<div class="icdtxt">J45.20 Mild intermittent asthma, uncomplicated</div>
<div class="icdtxt">J45.21 Mild intermittent asthma with (acute) exacerbation</div>
<div class="icdtxt">J45.22 Mild intermittent asthma with status asthmaticus</div>
<div class="icdtxt">J45.3 Mild persistent asthma</div>
<div class="icdtxt">J45.30 Mild persistent asthma uncomplicated</div>
<div class="icdtxt">J45.31 Mild persistent asthma with (acute) exacerbation</div>
<div class="icdtxt">J45.32 Mild persistent asthma with status asthmaticus</div>
<div class="icdtxt">J45.4 Moderate persistent asthma</div>
<div class="icdtxt">J45.40 Moderate persistent asthma, uncomplicated</div>
<div class="icdtxt">J45.41 Moderate persistent asthma with (acute) exacerbation</div>
<div class="icdtxt">J45.42 Moderate persistent asthma with status asthmaticus</div>
<div class="icdtxt">J45.5 Severe persistent asthma</div>
<div class="icdtxt">J45.50 Severe persistent asthma, uncomplicated</div>
<div class="icdtxt">J45.51 Severe persistent asthma with (acute) exacerbation</div>
<div class="icdtxt">J45.52 Severe persistent asthma with status asthmaticus</div>
<div class="icdtxt">J45.9 Other and unspecified asthma</div>
<div class="icdtxt">J45.90 Unspecified asthma</div>
<div class="icdtxt">J45.901 Unspecified asthma with (acute) exacerbation</div>
<div class="icdtxt">J45.902 Unspecified asthma with status asthmaticus</div>
<div class="icdtxt">J45.909 Unspecified asthma uncomplicated</div>
<div class="icdtxt">J45.99 Other asthma</div>
<div class="icdtxt">J45.990 Exercise induced bronchospasm</div>
<div class="icdtxt">J45.991 Cough variant asthma</div>
<div class="icdtxt">J45.998 Other asthma</div>
</div>
<button type="button" class="icdButton" onclick="exp('2')">Ear Related ICD-10 Codes</button>
<div id="i2">
<div class="icdtxt">H65.11 Acute and subacute allergic otitis media (mucoid)(sanguinous) (serous)</div>
<div class="icdtxt">H65.111 Acute and subacute allergic otitis media, right ear</div>
<div class="icdtxt">H65.112 Acute and subacute allergic otitis media, left ear</div>
<div class="icdtxt">H65.113 Acute and subacute allergic otitis media, bilateral</div>
<div class="icdtxt">H65.114 Acute and subacute allergic otitis media, recurrent, right ear</div>
<div class="icdtxt">H65.115 Acute and subacute allergic otitis media, recurrent, left ear</div>
<div class="icdtxt">H65.116 Acute and subacute allergic otitis media, recurrent, bilateral</div>
<div class="icdtxt">H65.117 Acute and subacute allergic otitis media, recurrent, unspecified ear</div>
<div class="icdtxt">H65.119 Acute and subacute allergic otitis media, unspecified ear</div>
<div class="icdtxt">H65.20 Chronic serous otitis media, unspecified ear</div>
<div class="icdtxt">H65.21 Chronic serous otitis media, right ear</div>
<div class="icdtxt">H65.22 Chronic serous otitis media, left ear</div>
<div class="icdtxt">H65.23 Chronic serous otitis media, bilateral</div>
<div class="icdtxt">H65.30 Chronic mucoid otitis media, unspecified ear</div>
<div class="icdtxt">H65.31 Chronic mucoid otitis media, right ear</div>
<div class="icdtxt">H65.32 Chronic mucoid otitis media, left ear</div>
<div class="icdtxt">H65.33 Chronic mucoid otitis media, bilateral</div>
<div class="icdtxt">H69.80 Other specified disorders of Eustachian tube,unspecified ear</div>
<div class="icdtxt">H69.81 Other specified disorders of Eustachian tube, right ear</div>
<div class="icdtxt">H69.82 Other specified disorders of Eustachian tube, left ear</div>
<div class="icdtxt">H69.30 Other specified disorders of Eustachian tube, bilateral</div>
</div>
<button type="button" class="icdButton" onclick="exp('3')">Eye Related ICD-10 Codes</button>
<div id="i3">
<div class="icdtxt">H10.10 Acute atopic conjunctivitis, unspecified eye</div>
<div class="icdtxt">H10.11 Acute atopic conjunctivitis, right eye</div>
<div class="icdtxt">H10.12 Acute atopic conjunctivitis, left eye</div>
<div class="icdtxt">H10.13 Acute atopic conjunctivitis, bilateral</div>
<div class="icdtxt">H10.45 Other chronic allergic conjunctivitis</div>
</div>
<button type="button" class="icdButton" onclick="exp('4')">Gastrointestinal ICD-10 Codes</button>
<div id="i4">
<div class="icdtxt">K52 Other and unspecified noninfective gastroenteritis and colitis Allergy</div>
<div class="icdtxt">K52.2 gastrointestinal </div>
<div class="icdtxt">K52.2 milk protein </div>
<div class="icdtxt">K52.2 Colitis (acute) (catarrhal) (chronic) (noninfective) (hemorrhagic) </div>
<div class="icdtxt">K52.9 allergic </div>
<div class="icdtxt">K52.2 dietetic K52.2 due to food hypersensitivity </div>
<div class="icdtxt">K52.2 Diarrhea, diarrheal (disease) (infantile) (inflammatory) </div>
<div class="icdtxt">R19.7 allergic </div>
<div class="icdtxt">K52.2 dietetic </div>
<div class="icdtxt">K52.2 due to food hypersensitivity </div>
<div class="icdtxt">K52.2 Enteritis (acute) (diarrheal) (hemorrhagic) (noninfective) (septic) </div>
<div class="icdtxt">K52.9 allergic </div>
<div class="icdtxt">K52.2 dietetic </div>
<div class="icdtxt">K52.2 due to food hypersensitivity </div>
<div class="icdtxt">K52.2 Gastroenteritis (acute) (chronic) (noninfectious)-see also Enteritis </div>
<div class="icdtxt">K52.9 allergic </div>
<div class="icdtxt">K52.2 dietetic </div>
<div class="icdtxt">K52.2 food hypersensitivity </div>
<div class="icdtxt">K52.2 Hypersensitive, hypersensitiveness, hypersensitivity gastrointestinal </div>
</div>
<button type="button" class="icdButton" onclick="exp('5')">Nasal/Sinus ICD-10 Codes</button>
<div id="i5">
<div class="icdtxt">J30.1 Allergic rhinitis due to pollen</div>
<div class="icdtxt">J30.2 Other seasonal allergic rhinitis</div>
<div class="icdtxt">J30.5 Allergic rhinitis due to food</div>
<div class="icdtxt">J30.81 Allergic rhinitis due to animal (cat) (dog) hair and dander</div>
<div class="icdtxt">J30.89 Other allergic rhinitis</div>
<div class="icdtxt">J30.9 Allergic rhinitis, unspecified</div>
<div class="icdtxt">J31.0 Chronic rhinitis</div>
<div class="icdtxt">J31.1 Chronic nasopharyngitis</div>
<div class="icdtxt">J31.2 Chronic pharyngitis</div>
<div class="icdtxt">J32.0 Chronic maxillary sinusitis</div>
<div class="icdtxt">J32.1 Chronic frontal sinusitis</div>
<div class="icdtxt">J32.2 Chronic ethmoidal sinusitis</div>
<div class="icdtxt">J32.3 Chronic sphenoidal sinusitis</div>
<div class="icdtxt">J32.4 Chronic pansinusitis</div>
<div class="icdtxt">J32.8 Other chronic sinusitis</div>
<div class="icdtxt">J32.9 Chronic sinusitis, unspecified</div>
<div class="icdtxt">J33.0 Polyp of nasal cavity</div>
<div class="icdtxt">J33.1 Polypoid sinus degeneration</div>
<div class="icdtxt">J33.8 Other polyp of sinus</div>
<div class="icdtxt">J33.9 Nasal polyp, unspecified</div>
<div class="icdtxt">J35.0 Chronic tonsillitis and adenoiditis</div>
<div class="icdtxt">J35.01 Chronic tonsillitis</div>
<div class="icdtxt">J35.02 Chronic adenoiditis</div>
<div class="icdtxt">J35.03 Chronic tonsillitis and adenoiditis</div>
<div class="icdtxt">J35.1 Hypertrophy of tonsils</div>
<div class="icdtxt">J35.2 Hypertrophy of adenoids</div>
<div class="icdtxt">J35.3 Hypertrophy of tonsils with hypertrophy of adenoids</div>
<div class="icdtxt">J35.8 Other chronic diseases of tonsils and adenoids</div>
<div class="icdtxt">J35.9 Chronic disease of tonsils and adenoids, unspecified</div>
<div class="icdtxt">J37.0 Chronic laryngitis</div>
<div class="icdtxt">J37.1 Chronic laryngotracheitis</div>
<div class="icdtxt">J38.4 Edema of larynx</div>
<div class="icdtxt">J38.5 Laryngeal spasm</div>
<div class="icdtxt">J38.6 Stenosis of larynx</div>
<div class="icdtxt">J38.7 Other diseases of larynx</div>
<div class="icdtxt">J39.2 Other diseases of pharynx</div>
</div>
<button type="button" class="icdButton" onclick="exp('6')">Skin Related ICD-10 Codes</button>
<div id="i6">
<div class="icdtxt">L23 Allergic contact dermatitis</div>
<div class="icdtxt">L23.3 Allergic contact dermatitis due to drugs in contact with skin</div>
<div class="icdtxt">L23.4 Allergic contact dermatitis due to dyes</div>
<div class="icdtxt">L23.5 Allergic contact dermatitis due to other chemical products</div>
<div class="icdtxt">L23.6 Allergic contact dermatitis due to food in contact with the skin</div>
<div class="icdtxt">L23.81 Allergic contact dermatitis due to animal (cat) (dog) dander</div>
<div class="icdtxt">L23.89 Allergic contact dermatitis due to other agents</div>
<div class="icdtxt">L23.9 Allergic contact dermatitis, unspecified cause</div>
<div class="icdtxt">L27.0 Generalized skin eruption due to drugs and medicaments taken internally</div>
<div class="icdtxt">L27.1 Localized skin eruption due to drugs and medicaments taken internally</div>
<div class="icdtxt">L27.2 Dermatitis due to ingested food</div>
<div class="icdtxt">L27.8 Dermatitis due to other substances taken internally</div>
<div class="icdtxt">L27.9 Dermatitis due to unspecified substance taken internally</div>
<div class="icdtxt">L50.0 Allergic urticaria</div>
<div class="icdtxt">L50.1 Idiopathic urticaria</div>
<div class="icdtxt">L50.2 Urticaria due to cold and heat</div>
<div class="icdtxt">L50.3 Dermatographic urticaria</div>
<div class="icdtxt">L50.4 Vibratory urticaria</div>
<div class="icdtxt">L50.5 Cholinergic urticaria</div>
<div class="icdtxt">L50.6 Contact urticaria</div>
<div class="icdtxt">L50.8 Other urticaria</div>
<div class="icdtxt">L50.9 Urticaria, unspecified</div>
</div>
EOT;
}
echo <<<EOT
<hr>
<div id="billing">

<div id="i7">
EOT;
ob_flush();

foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
  }
  elseif($post == 'E'){
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';

  }  
  elseif($post == 'G'){
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
 }
  elseif($post == '4'){
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
  }
}
/*
$types = array('','IgE','IgG','IgG4');

 
//$classes = array('','class="ige"','','class="igg4"');

$ordered = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysqli_query($link,$sql);
while(list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code;$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$sort = array_flip($sort);
$cnt = 0;


$typeE  = array('<tr><td></td>' , '<tr><td><div class="E">E</div></td>');
$typeG4 = array('<td></td>' , '<td><div class="G4">G<sub>4</sub></div></td>');
$typeG  = array('<td></td>' , '<td class="G">G</td>');
$g = 0;
$g4 = 0;
$e = 0;
$p = 0;
$selected = array();
$inputs = '';
foreach($_POST as $key => $value){//••••••••••••••••••••••••••••••••••••••••••••••••••••••
  $post = substr($key,0,1);
  if($post == 'P'){$p = 1;break;}
}
$tPicker = array('','<div class="treq">Individual Tests Requested</div>');
$pPicker = array('','<h3 class="preq">Panels Requested</h3>');
echo '<div id="requests">'. $pPicker[$p];
$t = 0;
$duptxt = '';
$paneltxt = '';
$count = array();
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
	$panel = substr($key,1);
    echo "<button type=\"button\" class=\"panel\"><div class=\"pnum\">$panel</div><div class=\"pdesc\">$value</div></button><br>\n";
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$panels[$panel] = $value;
	$p++;
	continue;
  }
  elseif($post == 'E'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][1] = 1;
	$count[$code][1] = 1;
	$ie++;
	continue;
  }  
  elseif($post == 'G'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][2] = 1;
	$count[$code][2] = 1;
	$ig++;
	continue;
  }
  elseif($post == '4'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
	$count[$code][3] = 1;
	$ig4++;
  }
}
//<div class="subhead">Number of each Ig type</div>
//<div class="countIgE">$e<div class="tiny">IgE</div></div>
//<div class="countIgG4">$g4<div class="tiny">IgG<sub>4</sub></div></div>
//<div class="countIgG">$g<div class="tiny">IgG</div></div><br>
echo <<<EOT
<div class="table">
$tPicker[$t]
<div id="tests">

<br>
EOT;
if(count($selected) > 0){
  echo '<table>';
  foreach($selected as $code => $array){
	$types[1] = intval($selected[$code][1]);
	$types[2] = intval($selected[$code][2]);
	$types[3] = intval($selected[$code][3]);
    $tests[$sort[$code]] = $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . "<td class=\"xyz\">&ensp;$desc[$code]</td></tr>\n";
  }

  ksort($tests);
  foreach($tests as $row){echo $row;}
  echo '</table>'; 
}
echo '</div>';
unset($tests);
echo "</div></div>";
ob_flush();
/*
$total = 0;
foreach($panels as $panel){
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$panel' ";
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){$count[$code][intval($type)] = 1;}
}

foreach($count as $code => $types){
  $total += (intval($types[1]) + intval($types[2]) + intval($types[3]));
}

$ptests = 0;
$pcount = array();
if(count($panels) > 0){
  foreach($panels as $panel => $description){
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$panel'"; 
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){if(substr($code,0,3) == '100'){continue;}$count[$code][intval($type)] = 1;$pcount[$code][intval($type)] = 1;$ptests++;}
  }
}
foreach($pcount as $code => $counts){
  $pe += $counts[1];
  $pg += $counts[2];
  $pg4 += $counts[3];
  
}
$ptotal += $pe + $pg + $pg4;
foreach($count as $code => $property){
  $e  += $count[$code][1]; 
  $g4 += $count[$code][3]; 
  $g  += $count[$code][2]; 
  if($count[$code][1] == 1){$login[] = $code . '1';$logtext .=  $code . "1\n";}
  if($count[$code][2] == 1){$login[] = $code . '2';$logtext .=  $code . "2\n";}
  if($count[$code][3] == 1){$login[] = $code . '3';$logtext .=  $code . "3\n";}
}
$total += $e + $g4 + $g;
$itests = $ie + $ig + $ig4;


$vacutainers = 0;
$needed = ceil(($e * 60 + ($g4 + $g))/100)/10 ;
if($needed > 0){$vacutainers = 1;}
if($needed > 3.5){$vacutainers =  ceil($needed / 3.5);}
$needed += 3 * $celiac;
$vacutainers += $celiac;

$vacutainers = 1;
$needed = ceil(($e * 60 + ($g4 + $g))/100)/10;
if($needed > 3.5){$vacutainers =  ceil($needed / 3.5);}
$needed += 3 * $celiac;
$vacutainers += $celiac;
$mi = '';
if(($e > 62 || ($g + $g4) > 20) ){
  $diff = ($e - 62); 
  if($diff > 0){$excess += $diff;}
  $diff = ($g + $g4) - 20; 
  if($diff > 0){$excess += $diff;}
  $mi = "document.getElementById('mi').style.display = 'block';";
}

if($excess < 1){$submit[$billing] = $submit[1];}
$gs = $g + $g4;
*/
$needed = $_POST['needed'];
$bdi = '';
if($Accession < 100000){$bdi = '<input type="checkbox" name="bdi" value="1" ><span id="bdi">&ensp;Include Blood Draw Instructions</span><br>';}
echo <<<EOT

<div id="i0"></div>
</div>

</div>$inputs
<div id="footer">
<div id="counts">
<p id="total">Total Tests Ordered: $total</p>
<p class="indent">IgE:&emsp;$e</p>
<p class="indent">IgG<sub>4</sub>&ensp; $g4</p>
<p class="indent">IgG:&emsp;$g</p><br>
</div>
<div id="mi">

</div>

<label for="note">Comments</label>
<textarea id="note" name="note" rows="2">$note</textarea>

$bdi
<br>
$phy


<input id="enablesub" class="submit" type="submit" value="Submit to Allermetrix and Print" />
<input id="sub" type="hidden" name="sub" value="52" />
<input type="hidden" name="needed" value="$needed"/>
<input type="hidden" name="client" value="$client"/>
<input type="hidden" name="Abnchk" value="$Abnchk"/>
<input type="hidden" name="rec" value="$rec" > 
<input type="hidden" name="volume" value="$volume" >
<input type="hidden" name="Accession" value="$Accession" >
<input type="hidden" name="billing" value="$billing" >
<input type="hidden" name="celiac" value="$celiac" >
<input type="hidden" name="onhold" value="$onhold" >
<input type="hidden" name="gs" value="$gs" >

</div></form></div></div>
<div class="hide">
<iframe id='abnG' src="https://dev.amxemr.com/login/abnG.pdf" height="200" width="300"></iframe>
<iframe id='abnE' src="https://dev.amxemr.com/login/abnE.pdf" height="200" width="300"></iframe>
</div>
<script>
$jsnpi
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';

var text = new Array();
text[''] = 'Hide Order Details';
text[null] = 'Hide Order Details';
text['none'] = 'Show Order Details';
text['block'] = 'Hide Order Details';
var first = document.getElementById('first');
var last = document.getElementById('last');
var phy = document.getElementById('physican');
var attest = document.getElementsByName('attest');
var enablesub = document.getElementById('enablesub');
var initials = document.getElementById('initials');
var initial = document.getElementById('initial');
var provider = document.getElementById('provider');
var buttons = {0:[null],1:[null],2:[null],3:[null],4:[null],5:[null],6:[null],7:[null]};
var prev = 0;
function init(){
  $mi
  $icd

  attest[0].checked = false;
  attest[1].checked = false;
  attest[2].checked = false;
  initial.value = '';
  if(last.value.length > 1){asteriskLast.style.display = 'none';}
  console.log(last.value.length);
  if(first.value.length > 1){asteriskFirst.style.display = 'none';}
}
function exp(id){
  var e = buttons[id][0].style.display;
  buttons[prev][0].style.display='none';
  buttons[id][0].style.display=flip[e];
  prev=id;
}

function getnpi(){
  let val = phy.value;
  console.log('phy val: ' + val);
  enablesub.style.display = 'none';
	if(npi[val] == undefined){
	  let trimed = val.trim();
      let len = trimed.length;
	  console.log('phy len: ' + len);
	  if (len > 4){
        provider.style.display = 'block';
		
      }
	  else{
		provider.style.display = 'none';
        attest[0].checked = false;
	    attest[1].checked = false;
	    attest[2].checked = false;
      }
    }
  	else{
      let pnpi = npi[val];
      document.getElementById('NPI').value  = pnpi;
      provider.style.display = 'block';
	}
}

function confirm(num){
  if(num == 1 || num == 3 ){
    enablesub.style.display = 'block';
	initals.style.display = 'none';
	initial.value = '';
  }
  else{
    initals.style.display = 'block';
	let val = initial.value; 
	let len = val.length;
	enablesub.style.display = 'none';
	if(len > 1){enablesub.style.display = 'block';}
  }
}
function getlength(num){
	if(document.getElementById('physican').value.length > 3){
      document.getElementById('provider').style.display = 'block';
	}
	else{
      provider.style.display = 'none';
	  initals.style.display = 'none';
	  enablesub.style.display = 'none';
	  attest[0].checked = false;
	  attest[1].checked = false;
	  attest[2].checked = false;
	}
	
}
function chkinitials(){
  let val = initial.value;
  let len = val.length;
  enablesub.style.display = 'none';
  if(len > 1){enablesub.style.display = 'block';}
}
window.onload = init;


</script>
EOT;
ob_end_flush();



//var_export($selected);
echo <<<EOT


<hr>




<p><br><br></p></div>

</div></div><pre>$sho</pre></div></body></html>';
EOT;

//();
/*
echo $inputs;
echo '<pre>POST: ';
var_export($_POST);
echo '<pre>selected: ';
var_export($selected);
<div id="s006" class="expand">
<br><legend>Patient Last:</legend><input type="text" name="blast" value="$plast" size="40" />
<br><legend>Patient First:</legend><input type="text" name="bfirst" value="$pfirst" size="40" />
<br><legend>Patient DoB: (m/d/yyyy)</legend><input type="text" name="pDoB " value="$pstrdob" placeholder="m/d/yyyy"  size="40"/>
<br><br><legend>Patient Address:</legend><input type="text" name="Address" value="$paddress" size="40"/>
<br><legend>Patient City State Zip:</legend><input type="text" name="city" value="$pcity" size="40" />
<br><legend>Patient Phone: (with Area Code)</legend><input type="text" name="Address" value="$pphone" size="40"/>
<br><legend>Patient SSN:</legend><input type="text" name="Address" value="$pssn" size="40"/>
<br><legend>Patient Email:</legend><input type="text" name="email" value="$pemal" size="40"/>
<br><br>Must complete Credit Card Payment section or CONTACT 877-992-4100 prior to shipping)-*
</div>
<div id="d007" class="dchk">
<input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')"  $checked[5]/>&#x2002;Bill Insurance</div>
<br><div id="s007" class="expand">
<br><legend>Insured Last:</legend><input type="text" name="blast" value="$blast" size="40" />
<br><legend>Insured First:</legend><input type="text" name="bfirst" value="$bfirst" size="40" />
<br><legend>Insured DoB: (m/d/yyyy)</legend><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br><legend>Insured Address:</legend><input type="text" name="Address" value="$address" size="40"/>
<br><legend>Insured City State Zip:</legend><input type="text" name="city" value="$city" size="40" />
<br><legend>Insured Phone: (with Area Code)</legend><input type="text" name="Address" value="$phone" size="40"/>
<br><legend>Insured SSN:</legend></legend><input type="text" name="Address" value="$ssn" size="40"/>
<br><br>
Enclose a copy of the insurance card and complete Insurance Billing and Credit Card Payment sections</div>


<div class="row"><div class="label">Physician:</div> <input type="text" name="physican"  /></div>
<div class="row"><div class="label">Physician:</div> <input id="physican" type="text" name="phy" list="phy" placeholder="Double Click for List" /></div><datalist id="phy" >
<option>Dr Patrick</option><option>Dr Kildare MD</option></datalist>
$phy
*/
?>