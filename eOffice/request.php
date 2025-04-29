<?php //ob_start("ob_gzhandler");

$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));

$history = intval($_POST['history']);
$sql = "SELECT SELECT `status`, `client`, `date`, `last`, `first`, `dob`, `address`, `city`, `state`, `zip` FROM `history` WHERE `id` = $history";
$results = mysqli_query($link,$sql);

list($client,$date,$last,$first,$dob, $address, $city, $state, $zip) =  mysqli_fetch_array($results, MYSQLI_NUM);
$state = strtoupper($state);

$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];
$sub = intval($_POST['sub']);

if($client == 0){$client = intval($_POST['client']);}
if($client == 0){$client = intval($_GET['client']);}
if($client == 0){$client = intval($_COOKIE['amxc']);}
setcookie("amxc", $client,time()+86400,'/');
  $file = '/home/amx/public_html/login/foodsBase.jsn';
  $foods = json_decode(file_get_contents($file),1);
  $file = '/home/amx/public_html/login/foodBase.jsn';
  $food = json_decode(file_get_contents($file),1);
  foreach($_POST as $key =>$value){
    $type = intval($value);
    if(substr($key,0,1) == 'a'){$code = substr($key,2,4);$foods[$code][$type]=1; $foods[$code][0]=1;  $food[$code][$type]=1;$food[$code][0]=1;}
  }
  chdir('/home/amx/public_html/login/');
  foreach(glob("$id*.jsn") as $file){unlink($file);}
  $sql = "INSERT INTO `orders` (`id`,`date`, `status`,`client`, `first`, `last`, `address`, `city`, `state`,`zip`,`phone`, `dob`, `collection`,`volume`, `physician`, `icd101`, `icd102`, `icd103`, `clientID`, `jsn`) VALUES (NULL,NULL,'E', '$client', '$first', '$last', '$address', '$city', '$state','$zip','$phone', '$dob', '$collect','$volume', '$physician', '$icd1', '$icd2', '$icd3', '$specimen', '$jsn')";
//echo $sql;exit;
  mysqli_query($link,$sql);
  $err = mysqli_error($link);
  if(strlen($err) > 0){$err = ' Error: ' & $err;}
  $rec = mysqli_insert_id($link);
  
  $jsn = json_encode($foods);
  $file = "/home/amx/public_html/login/$id" . "foods.jsn";
  file_put_contents($file,$jsn);
 // echo '<pre>';var_export($foods);exit;
  $jsn = json_encode($food);
  $file = "/home/amx/public_html/login/$id" . "food.jsn";
  file_put_contents($file,$jsn);
  
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT

<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice Billing</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#content{max-width:640px;margin:0 auto 0 ;padding:20px;}
.red{color:#f00;font:700 .7em Arial,sans-serif;}
#billing{margin:100px auto 0 auto;padding:0 0px 0 0;width:200px; font:700 1em Arial,sans-serif;background:#f7f7fb;} 
input[type="radio"], input[type="checkbox"] {width: 1.3em;height: 1.3em;display: inline;margin: 1px;margin-left: 4px;vertical-align: middle;position: relative;background: #333;background-color: rgb(51, 51, 51);color: #eee;}
button{width:100%;font:700 1em Arial,sans-serif;cursor:pointer;padding:6px 0 6px 7px;border:1px solid #69B5B3;color: #fff;background-color:#144;font-weight:700;
      background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
</style></head><body>
<div id="billing"> 
<form action="https://dev.amxemr.com/login/"  method="post" >
<div style="inline-block;">Billing:<span class="red"> &#x2731;</span></div>
<div id="d003"><input id="c003" type="radio" name="billing" value="1"  $checked[1] required />&#x2002;
Bill Client </div><div id="s003"></div>
<div id="d004"><input id="c004" type="radio" name="billing" value="2"  $checked[2] onchange="billingChange()"/>&#x2002;
Bill Medicare</div><div id="s004"></div>
<div id="d005"><input id="c005" type="radio" name="billing" value="3"  $checked[3] onchange="billingChange()"/>&#x2002;
Bill Medcaid </div><div id="s005"></div>
<div id="d006"><input id="c006" type="radio" name="billing" value="4"  $checked[4] onchange="billingChange()"/>&#x2002;
Bill Patient</div><div id="s006"></div>
<div id="d007"><input id="c007" type="radio" name="billing" value="5"  $checked[5] onchange="billingChange()"/>&#x2002;
Bill Insurance</div><div id="s007"></div>
<input type="hidden" name="history" value="$history" />
<input type="hidden" name="client" value="$client" />
<input type="hidden" name="sub" value="70" />
<button>Next</button>
</div>
  
EOT;
exit;
  $code = rand(100000,999999);
  file_put_contents('/home/amx/public_html/login/next.txt',"$code|$client|$history");
  header("Location: https://dev.amxemr.com/login?session=$code");
  exit;


$checked = array_fill(1,5,0);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice Request Form</title> 
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;background:#f7f7fb;color:#000;padding:0; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;}
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
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;} 
#name{text-align:left;margin:3em 0 5em 7em;}
.link{border:1px solid #69B5B3;color: #fff;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
.go{border:1px solid #f00;color: #fff;

background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.btn{padding:8px 8px 8px 8px;font:700 1em Arial,serif;width:100%;border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}
#post{width:480px;margin:0 auto;background:#f7f7fb;}
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

input[type="checkbox"]{width:1.5em;height:1.5em;border-radius: 3px 3px 3px 3px;margin-color:#fff;outline:0;display: inline-block;margin:1px;margin:0;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
input[type="radio"],input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #fff;outline:2px solid #fff;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#fff;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
input[type="date"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}

.pnumber{width:3em;display:inline-block;}
.descE,.descG4{font-size:.9em;width:11em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#000;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.row{padding:0;margin:0;}
.pige,.pigg4,.pigg,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 .2em .3em 0;padding:.3em 0 0 0;}

.pige,.pigg4,.pigg{width:2.4em;}
.legend{padding-left:20.75em;}
.both,.ige,.igg4,.panel{display:inline-block;font-weight:700;margin:0;border:1px solid #fff;padding:.2em 0 0 .4em;text-align:left;width:98%;}
.both,.cboth{background:#fa4;color:#000;}
.ige,.pige,.cige{background:#ff0;color:#000;}
.igg4,.pigg4,.cigg4{background:#0ff;color:#000;}
.pigg,.cigg{background:#0f8;color:#000}


.xpanel{width:18em;padding:0 .1em 0 .1em;display:inline-block;font-weight:700;border:0;}
.panel{background:#00f;color:#fff;padding:.6em 0 .6em .4em;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:25px;height:25px;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
#patient{padding:1em;background:#f7f7fb;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#000;color:#000;border-color:#000;}
legend{margin-top:.4em;}
.desc{width:22em;display:inline-block;}
.client{margin:0;}
#icd,#physician,#specimen,#collect,.row{margin: 2px 2px 2px 2px;}
.label{width:150px;display:inline-block;text-align:right;}
.icdButton{margin: 0 0 0 4em;padding:5px 5px 5px 20px;font: 700 1em Arial,sans-serif;width:280px;color:#fff;text-align:left;
background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
#i1,#i2,#i3,#i4,#i5,#i6{font:400 .9em Times,serif;margin:0; padding:0;}
#header{margin:0 auto 0;width:640px;}
#requests{width:340px; margin:0 auto 0;}
#tests{margin:0 0 0 70px;}
#medical{background:#f7f7fb;}
#billing{margin:0 auto 0 auto;padding:0 120px 0 0;width:200px; font:700 1.2em Arial,sans-serif;background:#f7f7fb;} 
.E{padding:4px 0 4px 0;margin:0;width:20px; font:400 .6em Times,serif;text-align:center;background:#f00;color:#fff;display:inline-block;}
.G{padding:4px 0 4px 0;margin:0;width:20px; font:400 .6em Times,serif;text-align:center;background:#ff0;color:#000;display:inline-block;}
.table{font-weight:400;}
.countIgE{background:#f00;color:#fff;}
.countTests{background:#ddd;color:#000;}
.countIgG{background:#00f;color:#fff;}
.countIgG4{background:#ff0;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches{max-width:33px;text-align:center;padding:1px 1px 1px 1px;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches,.pname{font:700 .9em Arial,sans-serif;display:inline-block;margin:0;width:100%;}
.treq{margin:25px auto 8px auto;padding:0 0 0 0;width:300px; font:700 1.2em Arial,sans-serif;} 
.preq{margin:25px auto 8px auto;padding:0 50px 0 0;width:300px; font:700 1.2em Arial,sans-serif;} 
.tiny{font-size:.6em;}
.subhead{font:400 .8em Times,serif;}
.required{font:700 1.2em Arial,sans-serif;color:#f00;display:inline-block;padding:5px 0 0 0;margin:5px 0 0 0;}
.msg{color:#f00;font:400 1em Times,serif;}
input[type="submit"]{margin:0 0 0 0;}
</style></head><body>
<div id="header">
<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>
</div>
EOT;

ob_flush();
echo <<<EOT
<div id="page"><div id="post">

<form action="./" method="post">

<div id="patient">&#x2003;
<div class="msg">* Required</div>
$clientName
</div>
<div class="row"><div class="label">Last:<div class="required">*</div></div> <input type="text" name="last" value="$last"  size="20" required/></div>
<div class="row"><div class="label">First:<div class="required">*</div></div> <input type="text" name="first" value="$first" size="20" required/></div>
<div class="row"><div class="label">DoB:<div class="required">*</div></div> <input id="dob" type="date" name="dob" value="$dob" /></div>

<br><hr><br>
<div id="medical">
<div class="row"><div class="label">Collection Date:</div> <input id="collect" type="date" name="collect" value="$collect" /></div>
<div class="row"><div class="label">Your Specimen ID:</div> <input id="specimen" type="text" name="specimen" value="$specimen"  size="20"/></div>
<div class="row"><div class="label">Physician:</div> <input id="physician" type="text" name="physician" value="$physician"  size="20" /></div>
<div class="row"><div class="label">IDC-10:</div> <input id="icd" type="text" name="icd" value="$icd"  size="20" /></div>
<button type="button" class="icdButton" onclick="exp('1')">Asthma ICD-10 Codes</button>
</div>
<div id="i1">
<div class="icd">J45.2 Mild intermittent asthma</div>
<div class="icd">J45.20 Mild intermittent asthma, uncomplicated</div>
<div class="icd">J45.21 Mild intermittent asthma with (acute) exacerbation</div>
<div class="icd">J45.22 Mild intermittent asthma with status asthmaticus</div>
<div class="icd">J45.3 Mild persistent asthma</div>
<div class="icd">J45.30 Mild persistent asthma uncomplicated</div>
<div class="icd">J45.31 Mild persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.32 Mild persistent asthma with status asthmaticus</div>
<div class="icd">J45.4 Moderate persistent asthma</div>
<div class="icd">J45.40 Moderate persistent asthma, uncomplicated</div>
<div class="icd">J45.41 Moderate persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.42 Moderate persistent asthma with status asthmaticus</div>
<div class="icd">J45.5 Severe persistent asthma</div>
<div class="icd">J45.50 Severe persistent asthma, uncomplicated</div>
<div class="icd">J45.51 Severe persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.52 Severe persistent asthma with status asthmaticus</div>
<div class="icd">J45.9 Other and unspecified asthma</div>
<div class="icd">J45.90 Unspecified asthma</div>
<div class="icd">J45.901 Unspecified asthma with (acute) exacerbation</div>
<div class="icd">J45.902 Unspecified asthma with status asthmaticus</div>
<div class="icd">J45.909 Unspecified asthma uncomplicated</div>
<div class="icd">J45.99 Other asthma</div>
<div class="icd">J45.990 Exercise induced bronchospasm</div>
<div class="icd">J45.991 Cough variant asthma</div>
<div class="icd">J45.998 Other asthma</div>
</div>
<button type="button" class="icdButton" onclick="exp('2')">Ear Related ICD-10 Codes</button>
<div id="i2">
<div class="icd">H65.11 Acute and subacute allergic otitis media (mucoid)</div>
<div class="icd">(sanguinous) (serous)</div>
<div class="icd">H65.111 Acute and subacute allergic otitis media, right ear</div>
<div class="icd">H65.112 Acute and subacute allergic otitis media, left ear</div>
<div class="icd">H65.113 Acute and subacute allergic otitis media, bilateral</div>
<div class="icd">H65.114 Acute and subacute allergic otitis media, recurrent, right ear</div>
<div class="icd">H65.115 Acute and subacute allergic otitis media, recurrent, left ear</div>
<div class="icd">H65.116 Acute and subacute allergic otitis media, recurrent, bilateral</div>
<div class="icd">H65.117 Acute and subacute allergic otitis media, recurrent, unspecified ear</div>
<div class="icd">H65.119 Acute and subacute allergic otitis media, unspecified ear</div>
<div class="icd">H65.20 Chronic serous otitis media, unspecified ear</div>
<div class="icd">H65.21 Chronic serous otitis media, right ear</div>
<div class="icd">H65.22 Chronic serous otitis media, left ear</div>
<div class="icd">H65.23 Chronic serous otitis media, bilateral</div>
<div class="icd">H65.30 Chronic mucoid otitis media, unspecified ear</div>
<div class="icd">H65.31 Chronic mucoid otitis media, right ear</div>
<div class="icd">H65.32 Chronic mucoid otitis media, left ear</div>
<div class="icd">H65.33 Chronic mucoid otitis media, bilateral</div>
<div class="icd">H69.80 Other specified disorders of Eustachian tube,unspecified ear</div>
<div class="icd">H69.81 Other specified disorders of Eustachian tube, right ear</div>
<div class="icd">H69.82 Other specified disorders of Eustachian tube, left ear</div>
<div class="icd">H69.30 Other specified disorders of Eustachian tube, bilateral</div>
</div>
<button type="button" class="icdButton" onclick="exp('3')">Eye Related ICD-10 Codes</button>
<div id="i3">
<div class="icd">H10.10 Acute atopic conjunctivitis, unspecified eye</div>
<div class="icd">H10.11 Acute atopic conjunctivitis, right eye</div>
<div class="icd">H10.12 Acute atopic conjunctivitis, left eye</div>
<div class="icd">H10.13 Acute atopic conjunctivitis, bilateral</div>
<div class="icd">H10.45 Other chronic allergic conjunctivitis</div>
</div>
<button type="button" class="icdButton" onclick="exp('4')">Gastrointestinal ICD-10 Codes</button>
<div id="i4">
<div class="icd">K52 Other and unspecified noninfective gastroenteritis and colitis Allergy, allergic (reaction) (to)colitis </div>
<div class="icd">K52.2 gastrointestinal </div>
<div class="icd">K52.2 milk protein </div>
<div class="icd">K52.2 Colitis (acute) (catarrhal) (chronic) (noninfective) (hemorrhagic) </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Diarrhea, diarrheal (disease) (infantile) (inflammatory) </div>
<div class="icd">R19.7 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Enteritis (acute) (diarrheal) (hemorrhagic) (noninfective) (septic) </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Gastroenteritis (acute) (chronic) (noninfectious)-see also Enteritis </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 food hypersensitivity </div>
<div class="icd">K52.2 Hypersensitive, hypersensitiveness, hypersensitivity gastrointestinal </div>
</div>
<button type="button" class="icdButton" onclick="exp('5')">Nasal/Sinus ICD-10 Codes</button>
<div id="i5">
<div class="icd">J30.1 Allergic rhinitis due to pollen</div>
<div class="icd">J30.2 Other seasonal allergic rhinitis</div>
<div class="icd">J30.5 Allergic rhinitis due to food</div>
<div class="icd">J30.81 Allergic rhinitis due to animal (cat) (dog) hair and dander</div>
<div class="icd">J30.89 Other allergic rhinitis</div>
<div class="icd">J30.9 Allergic rhinitis, unspecified</div>
<div class="icd">J31.0 Chronic rhinitis</div>
<div class="icd">J31.1 Chronic nasopharyngitis</div>
<div class="icd">J31.2 Chronic pharyngitis</div>
<div class="icd">J32.0 Chronic maxillary sinusitis</div>
<div class="icd">J32.1 Chronic frontal sinusitis</div>
<div class="icd">J32.2 Chronic ethmoidal sinusitis</div>
<div class="icd">J32.3 Chronic sphenoidal sinusitis</div>
<div class="icd">J32.4 Chronic pansinusitis</div>
<div class="icd">J32.8 Other chronic sinusitis</div>
<div class="icd">J32.9 Chronic sinusitis, unspecified</div>
<div class="icd">J33.0 Polyp of nasal cavity</div>
<div class="icd">J33.1 Polypoid sinus degeneration</div>
<div class="icd">J33.8 Other polyp of sinus</div>
<div class="icd">J33.9 Nasal polyp, unspecified</div>
<div class="icd">J35.0 Chronic tonsillitis and adenoiditis</div>
<div class="icd">J35.01 Chronic tonsillitis</div>
<div class="icd">J35.02 Chronic adenoiditis</div>
<div class="icd">J35.03 Chronic tonsillitis and adenoiditis</div>
<div class="icd">J35.1 Hypertrophy of tonsils</div>
<div class="icd">J35.2 Hypertrophy of adenoids</div>
<div class="icd">J35.3 Hypertrophy of tonsils with hypertrophy of adenoids</div>
<div class="icd">J35.8 Other chronic diseases of tonsils and adenoids</div>
<div class="icd">J35.9 Chronic disease of tonsils and adenoids, unspecified</div>
<div class="icd">J37.0 Chronic laryngitis</div>
<div class="icd">J37.1 Chronic laryngotracheitis</div>
<div class="icd">J38.4 Edema of larynx</div>
<div class="icd">J38.5 Laryngeal spasm</div>
<div class="icd">J38.6 Stenosis of larynx</div>
<div class="icd">J38.7 Other diseases of larynx</div>
<div class="icd">J39.2 Other diseases of pharynx</div>
</div>
<button type="button" class="icdButton" onclick="exp('6')">Skin Related ICD-10 Codes</button>
<div id="i6">
<div class="icd">L23 Allergic contact dermatitis</div>
<div class="icd">L23.3 Allergic contact dermatitis due to drugs in contact with skin</div>
<div class="icd">L23.4 Allergic contact dermatitis due to dyes</div>
<div class="icd">L23.5 Allergic contact dermatitis due to other chemical products</div>
<div class="icd">L23.6 Allergic contact dermatitis due to food in contact with the skin</div>
<div class="icd">L23.81 Allergic contact dermatitis due to animal (cat) (dog) dander</div>
<div class="icd">L23.89 Allergic contact dermatitis due to other agents</div>
<div class="icd">L23.9 Allergic contact dermatitis, unspecified cause</div>
<div class="icd">L27.0 Generalized skin eruption due to drugs and medicaments taken internally</div>
<div class="icd">L27.1 Localized skin eruption due to drugs and medicaments taken internally</div>
<div class="icd">L27.2 Dermatitis due to ingested food</div>
<div class="icd">L27.8 Dermatitis due to other substances taken internally</div>
<div class="icd">L27.9 Dermatitis due to unspecified substance taken internally</div>
<div class="icd">L50.0 Allergic urticaria</div>
<div class="icd">L50.1 Idiopathic urticaria</div>
<div class="icd">L50.2 Urticaria due to cold and heat</div>
<div class="icd">L50.3 Dermatographic urticaria</div>
<div class="icd">L50.4 Vibratory urticaria</div>
<div class="icd">L50.5 Cholinergic urticaria</div>
<div class="icd">L50.6 Contact urticaria</div>
<div class="icd">L50.8 Other urticaria</div>
<div class="icd">L50.9 Urticaria, unspecified</div>
</div>
<hr>
<div id="billing">

<div style="inline-block;">Billing:<div class=required>*</div></div><br>
<div id="d003"><input id="c003" type="radio"  name="billing" value="1"  $checked[1] required/>&#x2002;
Bill Client </div><div id="s003"></div> 
<div id="d004" ><input id="c004" type="radio"  name="billing" value="2"  $checked[2]/>&#x2002;
Bill Medicare</div><div id="s004"></div>
<div id="d005"><input id="c005" type="radio" name="billing" value="3"  $checked[3]/>&#x2002;
Bill Medcaid </div><div id="s005"></div> 
<div id="d006"><input id="c006" type="radio"  name="billing" value="4"   $checked[4]/>&#x2002;
Bill Patient</div><div id="s006"></div> 
<div id="d007"><input id="c007" type="radio" name="billing" value="5"   $checked[5]/>&#x2002;
Bill Insurance</div><div id="s007"></div> 
</div>
<div><hr>
EOT;
//ob_flush();

$types = array('','IgE','IgG','IgG4');


//$classes = array('','class="ige"','','class="igg4"');

$ordered = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysqli_query($link,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code;$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$sort = array_flip($sort);
$cnt = 0;


$typeE  = array('<tr><td></td>' , '<tr><td><div class="E">E</div></td>');
$typeG4 = array('<td></td>' , '<td><div class="G">G<sub>4</sub></div></td>');
$typeG  = array('<td></td>' , '<td class="yellow">G</td>');
$g = 0;
$g4 = 0;
$e = 0;
$selected = array();
$inputs = '';
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){$p = 1;}
}
$tPicker = array('','<div class="treq">Individual Tests Requested</div>');
$pPicker = array('','<h3 class="preq">Panels Requested</h3>');
echo '<div id="requests">'. $pPicker[$p];
$t = 0;
$duptxt = '';
$paneltxt = '';
$panels = array();
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
	$panel = substr($key,1);
    echo "<button type=\"button\" class=\"panel\">$panel &emsp; $value</button><br>\n";
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$panels[] = $panel;
	$duptxt = "<br>Duplicates, if any, were removed";
	$paneltxt = ", Panel Tests + Individual";
	continue;
  }
  if($post == 'E'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][1] = 1;
	$count[$code][1] = 1;
	$e++;
	continue;
  }  
  if($post == 'G'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][2] = 1;
	$count[$code][2] = 1;
	$g++;
	continue;
  }
  if($post == '4'){
    $t = 1;
	$inputs .= "\n" . '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
	$count[$code][3] = 1;
	$g4++;
  }

}
echo <<<EOT
<div class="table">
$tPicker[$t]
<div id="tests">
<div class="subhead">Number of each Ig type</div>
<div class="countIgE">$e<div class="tiny">IgE</div></div>
<div class="countIgG4">$g<div class="tiny">IgG<sub>4</sub></div></div>
<div class="countIgG">0<div class="tiny">IgG</div></div><br>
<br><table>
EOT;
if(count($selected) > 0){
  foreach($selected as $code => $array){
	$types[1] = intval($selected[$code][1]);
	$types[2] = intval($selected[$code][2]);
	$types[3] = intval($selected[$code][3]);
    $tests[$sort[$code]] = $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . "<td>&ensp;
	$desc[$code]</td></tr>\n";
  }
  ksort($tests);
  foreach($tests as $row){echo $row;}
  echo '</table></div></div>'; 
}
echo "</div>$inputs<pre>";
ob_flush();

$total = 0;
if(count($panels) > 0){
  foreach($panels as $panel){
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$panel' ";
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){$count[$code][intval($type)] = 1;}
  }
}
foreach($count as $code => $types){
  $total += (intval($types[1]) + intval($types[2]) + intval($types[3]));
}
ob_flush();
echo <<<EOT
<div id="i0"></div>
<hr>
<p class="center">Total Tests Ordered$paneltxt: <span class="bold">$total</span>$duptxt</p>
<input type="submit" value="Submit" class="btn" />
<input type="hidden" name="rec" value="$rec"/>
<input type="hidden" name="client" value="$client" />
<input type="hidden" name="id" value="$client"/>
<input type="hidden" name="sub" value="22" />

</div></form>
<p><br><br></p></div>
<script> //<![CDATA[


var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';


var buttons = {0:[null],1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};
var prev = 0;
function init(){
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }
}
function exp(id){
  var e = buttons[id][0].style.display;
  buttons[prev][0].style.display='none';
  buttons[id][0].style.display=flip[e];
  prev=id;
}


window.onload = init;


//]]>
</script>
</div></div><pre>$sho</pre></div></body></html>';
EOT;
ob_end_flush();
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
<br><br><legend>Patient Address:</legend><input type="text" name="address" value="$paddress" size="40"/>
<br><legend>Patient City State Zip:</legend><input type="text" name="city" value="$pcity" size="40" />
<br><legend>Patient Phone: (with Area Code)</legend><input type="text" name="address" value="$pphone" size="40"/>
<br><legend>Patient SSN:</legend><input type="text" name="address" value="$pssn" size="40"/>
<br><legend>Patient Email:</legend><input type="text" name="email" value="$pemal" size="40"/>
<br><br>Must complete Credit Card Payment section or CONTACT 877-992-4100 prior to shipping)-*
</div>
<div id="d007" class="dchk">
<input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')"  $checked[5]/>&#x2002;Bill Insurance</div>
<br><div id="s007" class="expand">
<br><legend>Insured Last:</legend><input type="text" name="blast" value="$blast" size="40" />
<br><legend>Insured First:</legend><input type="text" name="bfirst" value="$bfirst" size="40" />
<br><legend>Insured DoB: (m/d/yyyy)</legend><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br><legend>Insured Address:</legend><input type="text" name="address" value="$address" size="40"/>
<br><legend>Insured City State Zip:</legend><input type="text" name="city" value="$city" size="40" />
<br><legend>Insured Phone: (with Area Code)</legend><input type="text" name="address" value="$phone" size="40"/>
<br><legend>Insured SSN:</legend></legend><input type="text" name="address" value="$ssn" size="40"/>
<br><br>
Enclose a copy of the insurance card and complete Insurance Billing and Credit Card Payment sections</div>
*/
?>