<?php ob_start("ob_gzhandler");
$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx','xD1GkuK7a7DK8!');
mysqli_select_db($dbc,'amx_portal');
$sub = intval($_POST['sub']);


$client = intval($_POST['client']);
if($client == 0){$client = intval($_GET['client']);}
if($client == 0){$client = intval($_COOKIE['amxc']);
setcookie("amxc", $client,time()+86400,'/');}
$rec = intval($_POST['rec']);

if($sub == 4){
  $sqlf = "SELECT `client`, `date`, `last`, `first`, `dob`, `gender`, `foods` FROM `history` WHERE `id` = $rec";
  $results = mysqli_query($dbc,$sqlf);
  list($id,$date,$last,$first,$dob,$gender,$jsn) = @mysqli_fetch_array($results, MYSQLI_NUM);
  $strdob = date('M j, Y',strtotime($dob));
  $date = date('M j, Y',strtotime($date));
  $food = json_decode($jsn,true);
  $showE = $food[0];
  $showG4 = $food[1];
  $desc = $food[2];
  $matches = $food[3];
  $_POST = $food[4];
  $diff = date_diff(date_create(),date_create($dob),true);
  $age = $diff->format('%y');
  $sex = array('','M','F');
  $patient = "$last, $first $sex[$gender] $age";
  
 
//$show = var_export($matches,1);
}
else{
  $last = trim(urldecode($_POST['last']));
  $first = trim(urldecode($_POST['first']));
  $len = strlen($last);
  $date = trim(urldecode($_POST['dob']));
  $strdob = preg_replace('/ /','',$date);
  $strdob = preg_replace('/-|\./','/',$strdob);
  $dob = intval(strtotime($strdob));
  if($dob != 0){$strdob = date('Y-m-d',$dob);}
}

if($id > 199999 && $id < 300000){
$sql = "SELECT `Name` FROM `Client` WHERE `Number`='$client' ";
$results = mysqli_query($dbc,$sql);
list($clientName) = @mysqli_fetch_array($results, MYSQLI_NUM);	
  $sql = "SELECT `Name`  FROM `Client` WHERE `Number` = $id LIMIT 1";
  $results = mysqli_query($dbc,$sql);
  if(mysqli_errno($dbc) == 0 && mysqli_num_rows($results) == 1){
    list($name) = mysqli_fetch_array($results, MYSQLI_NUM);
    $client = "<h3 class=\"client\">$id $name</h3><input type=\"hidden\" name=\"id\" value=\"$id\" />";
  }
  else{$client = mysqli_error($dbc) . '<br>' . $sql ;}
}
$checked = array_fill(1,5,0);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Review Selections</title>
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0; }
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
h1,h2,h3{text-align:center;}
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
.btn,.link,.go{height:2em;width:100%;padding:0;margin:2em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#fff;
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
.go{border:1px solid #f00;color: #fff;

background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.btn{border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}
#post{width:480px;margin:0 auto;background:#fff;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;max-width:14em;}
.dchk{width:100%}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{position:relative;text-align:left;background:#2985EA;padding:0;margin:.1em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pchk{text-align:left;background:#2985EA;width:98%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;;}

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
#patient{padding:1em;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#000;color:#000;border-color:#000;}
legend{margin-top:.4em;}
.desc{width:22em;display:inline-block;}
.client{margin:0;}
#physician,#icd{width:20em;}
.label{width:15em;text-align:left;padding-left:3px;}
.E{margin:0 0 3px 0;height:12px;width:12px; font:400 .5em Times,serif;text-align:center;background:#f00;color:#fff;display:inline-block;}
.G{margin:0 0 3px 0;height:12px;width:12px; font:400 .5em Times,serif;text-align:center;background:#00f;color:#fff;display:inline-block;}
.table{font-weight:400;}

.icdButton{padding:5px 5px 5px 20px;font: 700 1em Arial,sans-serif;width:280px;color:#fff;text-align:left;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#i1,#i2,#i3,#i4,#i5,#i6{font:400 .9em Times,serif;margin:0; padding:0;}
#header{margin:0 auto 0;width:640px;}
</style></head><body>
<div id="header">
<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>
</div>

<div id="page"><div id="post">



<form action="printRequest.php" method="post"><input type="hidden" name="rec" value="$rec"/>
<div id="patient">&#x2003;
$clientName
<input type="hidden" name="id" value="$client"/>
<br><br>Last:<br><input type="text" name="last" value="$last"  size="40"/>
<br><br>First:<br><input type="text" name="first" value="$first"  size="40"/>
<br><br>DoB: (m/d/yyyy)<br><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<hr>Specimen ID:<br><input type="text" name="specimen" value="$specimen"  size="40"/>
<br><br>Collection Date: (m/d/yyyy)<br><input type="text" name="collect" value="$collect" placeholder="m/d/yyyy"  size="40"/><br><br>
Physician:<br><input id="physician" type="text" name="physician" value="$physician"  size="64"/>
<br><br>IDC-10:<br><input id="icd" type="text" name="icd" value="$icd"  size="40"/><br>
<button type="button" class="icdButton" onclick="icdexp('1')">Asthma ICD-10 Codes</button>
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
<button type="button" class="icdButton" onclick="icdexp('2')">Ear Related ICD-10 Codes</button>
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
<button type="button" class="icdButton" onclick="icdexp('3')">Eye Related ICD-10 Codes</button>
<div id="i3">
<div class="icd">H10.10 Acute atopic conjunctivitis, unspecified eye</div>
<div class="icd">H10.11 Acute atopic conjunctivitis, right eye</div>
<div class="icd">H10.12 Acute atopic conjunctivitis, left eye</div>
<div class="icd">H10.13 Acute atopic conjunctivitis, bilateral</div>
<div class="icd">H10.45 Other chronic allergic conjunctivitis</div>
</div>
<button type="button" class="icdButton" onclick="icdexp('4')">Gastrointestinal ICD-10 Codes</button>
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
<button type="button" class="icdButton" onclick="icdexp('5')">Nasal/Sinus ICD-10 Codes</button>
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
<button type="button" class="icdButton" onclick="icdexp('6')">Skin Related ICD-10 Codes</button>
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
<hr>Billing:<br>
<div id="d003" class="dchk"><input id="c003" type="radio" class="chk" name="billing" value="1" onclick="exp('003')" $checked[1]/>&#x2002;
Bill Client </div><br><div id="s003"></div> 
<div id="d004" class="dchk"><input id="c004" type="radio" class="chk" name="billing" value="2" onclick="exp('004')" $checked[2]/>&#x2002;
Bill Medicare</div><br><div id="s004"></div>
<div id="d005" class="dchk"><input id="c005" type="radio" class="chk" name="billing" value="3" onclick="exp('005')" $checked[3]/>&#x2002;
Bill Medcaid </div><br><div id="s005"></div> 
<div id="d006" class="dchk"><input id="c006" type="radio" class="chk" name="billing" value="4" onclick="exp('006')"  $checked[4]/>&#x2002;
Bill Patient</div><br><div id="s006"></div> 
<div id="d007" class="dchk"><input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')"  $checked[5]/>&#x2002;
Bill Insurance</div><br><br><div id="s007"></div> 

<div><br><hr><h3>Request Items</h3>
EOT;
ob_flush();
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx_allermetrix',$data);
mysqli_select_db($dbc,'amx_portal');
$types = array('','IgE','IgG','IgG4');

$sql = "SELECT `panel`, `description` FROM `clientPanels` WHERE `client` = $client";
$results = mysqli_query($dbc,$sql);
while(list($panel,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $panels[$panel] = $description;
}
$fp = fopen("/home/amx/public_html/f/amxpanels.txt", "r");
while (($text= fgets($fp , 72)) !== false) {
  $ndx++;
  if($ndx > 30){break;}
  $panel = trim(substr($text,0,6));
  $panels[$panel] = trim(substr($text,8,128));
}
//$classes = array('','class="ige"','','class="igg4"');

$ordered = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysqli_query($dbc,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code;$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$sort = array_flip($sort);
$cnt = 0;


$typeE  = array('<tr><td></td>' , '<tr><td><div class="E">E</div></td>');
$typeG4 = array('<td></td>' , '<td><div class="G">G<sub>4</sub></div></td>');
$typeG  = array('<td></td>' , '<td class="yellow">G</td>');

$selected = array();
$inputs = '';
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
    echo "<button type=\"button\" class=\"panel\">$key $value</button><br>\n";
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	continue;
  }
  if($post == 'G'){
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
  }
  elseif($post == 'E'){
	$inputs .= '<input type="hidden"  name="' . $key . '" value="' . $value . '" />';
	$code = substr($key,1,4);
	$selected[$code][1] = 1;
  }
}
echo '<div class="table"><table>';
if(count($selected) > 0){
  foreach($selected as $code => $array){
	$types[1] = intval($selected[$code][1]);
	$types[3] = intval($selected[$code][3]);
    $tests[$sort[$code]] = $typeE[$types[1]] . $typeG4[$types[3]] . "<td>&emsp;$desc[$code]</td></tr>\n";;
  }
  ksort($tests);
  foreach($tests as $row){echo $row;}
  echo '</table></div>';
  
}

echo $inputs;





















$show = '';
if($ip == '70.171.10.12'){$show = '<pre>' . var_export($panels,1) .'</pre>';}
echo <<<EOT

<hr>

<input type="hidden" name="sub" value="1" /><input type="submit" value="Submit" class="btn" /></div></form>
<div id="prev"><p><br><br></p></div>
<script> //<![CDATA[
var prev = document.getElementById('prev');
$js
$jsort
var div=0;
var disp = '';
var show = '';
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
var c = new Array;
var d = new Array;
var p = new Array;
toggle = new Array;
toggle[true] = 'checked="checked"';
toggle[false] = '';
bg = new Array;
bg[true] = '#f00';
bg[false] = '#2985EA';
bg[1] = '#000';
bg[3] = '#0ff';
var buttons = {1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};

function panels(id){
  div = document.getElementById(id);
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}
function summary(id){
  div = document.getElementById('post');
  div.style.display=flip[div.style.display];
  div = document.getElementById('s14');
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}

function icdexp(id){
  buttons[id][0].style.display = flip[buttons[id][0].style.display];
}

function cb(id){
  div = document.getElementById(id);
  div.style.backgroundColor=bg[div.checked];
}

function radio(on,off){
  document.getElementById('d' + on).style.backgroundColor=bg[true];
  document.getElementById('d' + off).style.backgroundColor=bg[false];
}

function radio6(on){
  document.getElementById('d003').style.backgroundColor=bg[false];
  document.getElementById('d004').style.backgroundColor=bg[false];
  document.getElementById('d005').style.backgroundColor=bg[false];
  document.getElementById('d006').style.backgroundColor=bg[false];
  document.getElementById('d007').style.backgroundColor=bg[false];
  document.getElementById('d' + on).style.backgroundColor=bg[true];
}

function ck(id){
  var d = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  d.style.backgroundColor=bg[c.checked];
}

function exp(id){
  var div = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  var ex = document.getElementById('s' + id);
  div.style.backgroundColor=bg[c.checked];
  disp = ex.style.display;
  prev.style.display='none';
  ex.style.display= 'none';  //flip[disp];
  prev=ex;
  radio6(id);
}

function pck(id){
 var cb = document.getElementById('c' + id);
 var checked = cb.checked;
  document.getElementById('d' + id).style.backgroundColor=bg[checked];
}

function init(){
var checked,did,idType,i,chk;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "d"){
        i = did.substring(1,6);
        c[i] = document.getElementById('c' + i);
        d[i] = divs[div];
		d[i].style.backgroundColor = bg[c[i].checked];
      }
      if (idType == "s"){
        divs[div].style.display = 'none';
      }
    }
  }
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }

  console.log('buttons');
  console.log(buttons);

  
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