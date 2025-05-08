<?php
ob_start("ob_gzhandler");
$time = microtime(true);
header('Content-Type: text/html;charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=50, max=100');

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx',$data);
mysqli_select_db($dbc,'amx_portal');
$ip = $_SERVER['REMOTE_ADDR'];
//$dbc=mysqli_connect('localhost','isl_isl','yes12yes');
//mysqli_select_db($dbc,'isl_portal');

$startTime = microtime(true);
$checkbox = array();
$checkbox[1] = 'mother';
$checkbox[2] = 'father';
$checkbox[3] = 'brother';
$checkbox[4] = 'sister';
$checkbox[5] = 'grandparent';
$checkbox[6] = 'grandparent';
$checkbox[7] = 'chest tightness';
$checkbox[8] = 'coughing';
$checkbox[9] = 'frequent infections';
$checkbox[10] = 'shortness of  breath';
$checkbox[11] = 'swelling of throat';
$checkbox[13] = 'eczema';
$checkbox[20] = 'bloating';
$checkbox[14] = 'flushing';
$checkbox[21] = 'colic';
$checkbox[15] = 'hives';
$checkbox[22] = 'cramps';
$checkbox[16] = 'itching';
$checkbox[23] = 'diarrhea';
$checkbox[17] = 'rashes';
$checkbox[24] = 'nausea';
$checkbox[12] = 'wheezing';
$checkbox[18] = 'red bumps';
$checkbox[25] = 'vomiting';
$checkbox[19] = 'swelling of lips';
$checkbox[26] = 'headaches';
$checkbox[34] = 'ear infections';
$checkbox[41] = 'anaphylaxis';
$checkbox[27] = 'itchy, red, watery eyes';
$checkbox[35] = 'ear pain';
$checkbox[42] = 'cannot sleep';
$checkbox[28] = 'loss of smell';
$checkbox[36] = 'hearing loss';
$checkbox[43] = 'loss of consciousness';
$checkbox[29] = 'nasal congestion';
$checkbox[37] = 'itchy ears';
$checkbox[44] = 'low blood pressure';
$checkbox[30] = 'nasal pain';
$checkbox[38] = 'sinus infection';
$checkbox[31] = 'runny nose';
$checkbox[39] = 'sinus pressure';
$checkbox[32] = 'sinus pressure or pain';
$checkbox[40] = 'vertigo';
$checkbox[33] = 'sneezing';
$checkbox[45] = 'in morning';
$checkbox[50] = 'inside house';
$checkbox[55] = 'at bedtime';
$checkbox[60] = 'outside during morning';
$checkbox[46] = 'in afternoon';
$checkbox[51] = 'when cleaning';
$checkbox[56] = 'windy days';
$checkbox[61] = 'outside during night';
$checkbox[47] = 'in evening';
$checkbox[52] = 'after eating';
$checkbox[57] = 'warm days';
$checkbox[62] = 'during yard work';
$checkbox[48] = 'at work';
$checkbox[53] = 'in basement';
$checkbox[58] = 'cold days';
$checkbox[63] = 'near animals';
$checkbox[49] = 'at school';
$checkbox[54] = 'in bedroom';
$checkbox[59] = 'on clear days';
$checkbox[64] = 'near farms/barns';
$checkbox[65] = 'January';
$checkbox[68] = 'April';
$checkbox[71] = 'July';
$checkbox[74] = 'October';
$checkbox[66] = 'February';
$checkbox[69] = 'May';
$checkbox[72] = 'August';
$checkbox[75] = 'November';
$checkbox[67] = 'March';
$checkbox[70] = 'June';
$checkbox[73] = 'September';
$checkbox[76] = 'December';
$checkbox[77] = 'dog';
$checkbox[78] = 'cat';
$checkbox[79] = 'bird';
$checkbox[80] = 'horse';
$checkbox[81] = 'hamster';
$checkbox[82] = 'rabbit';
$checkbox[83] = 'goat';
$checkbox[84] = 'pig';
$checkbox[85] = 'chicken';
$checkbox[86] = 'sheep';
$checkbox[87] = 'guinea pig';
$checkbox[88] = 'duck';
$checkbox[89] = 'goose';
$checkbox[90] = 'parakeet';
$checkbox[91] = 'parrot';
$checkbox[92] = 'pigeon';
$checkbox[93] = 'cow';
$checked = array_fill(0,92,'');
$label = array('','Parents','Sibling','Grandparents','Respiratory','Skin','Digestive','Head','Whole Body','N/A','');

$categories = array(9,1,1,2,2,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9);
$category = array(0=>0,1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0,9=>0,10=>0);
$inhalantFoodTitles = array('Inhalants and Foods','Inhalants','Foods');
$inhalantFoodTxt = array('','','');
$inhalantFoods = array(9,5,5,5,5,5,5,0,0,1,0,0,0,2,2,0,0,2,2,2,2,2,2,2,2,2,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
$month = array('month','month','month','month','month','month','month','month','month','month','month','month');
$today = date('Y-m-d');
$inhalantFood = array(0,0,0,0,0);
$animal = array('dog','cat','bird','horse',' hamster ','rabbit','goat','pig','chicken','sheep',' guinea pig ','duck','goose','parakeet','parrot','pigeon','cow');
$sub = intval($_POST['sub']);
$rec = intval($_POST['rec']);
if($rec == 0){$rec = intval($_GET['rec']);}
if($sub == 0 && $rec == 0){$sub = 4;$rec = 198;}

if($ip == '70.171.10.12' && $sub == 0){$bw = 'fff';$comment = '';$sub = 99;$rec = 198;}else{$bw = 'fff';$comment = '';}
  $sqlf = "SELECT `client`, `date`, `last`, `first`, `dob`,`state`, `gender`, `history` FROM `history` WHERE `id` = $rec";
  $results = mysqli_query($dbc,$sqlf);
  $sqlf .= "\n" . mysqli_error($dbc);
  list($client,$date,$last,$first,$dob,$state,$gender,$jsn) = @mysqli_fetch_array($results, MYSQLI_NUM);
  $strdob = date('M j, Y',strtotime($dob));
  $date = date('M j, Y',strtotime($date));
  $history = json_decode($jsn,true);
  $diff = date_diff(date_create(),date_create($dob),true);
  $age = $diff->format('%y');
  if (count($history) > 0){
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
if($sub == 4 || $sub == 14){
$id = intval($_COOKIE['amxc']);
$cookies = ''; //var_export($_COOKIE);
//$exit = "<form class=\"inline\" action=\"https://dev.amxemr.com/requestForm.php\" <input type=\"hidden\" name=\"id\" value=\"$id\"><input type=\"hidden\" name=\"sub\" value=\"4\"><button id=\"done\">Done</button></form>";
}
elseif($sub == 64 || $sub == 99){




}
$exit = "<form class=\"inline\" action=\"patient.php\" method=\"post\"><input type=\"hidden\" name=\"sub\" value=\"$sub\"/><input type=\"hidden\" name=\"id\" value=\"$id\"><button>Done</button></form>";
if(isset($posted['c77'])){$animals[] = $animal[0];}
if(isset($posted['c78'])){$animals[] = $animal[1];}
if(isset($posted['c79'])){$animals[] = $animal[2];}
if(isset($posted['c80'])){$animals[] = $animal[3];}
if(isset($posted['c81'])){$animals[] = $animal[4];}
if(isset($posted['c82'])){$animals[] = $animal[5];}
if(isset($posted['c83'])){$animals[] = $animal[6];}
if(isset($posted['c84'])){$animals[] = $animal[7];}
if(isset($posted['c85'])){$animals[] = $animal[8];}
if(isset($posted['c86'])){$animals[] = $animal[9];}
if(isset($posted['c87'])){$animals[] = $animal[10];}
if(isset($posted['c88'])){$animals[] = $animal[11];}
if(isset($posted['c89'])){$animals[] = $animal[12];}
if(isset($posted['c90'])){$animals[] = $animal[13];}
if(isset($posted['c91'])){$animals[] = $animal[14];}
if(isset($posted['c92'])){$animals[] = $animal[15];}
if(isset($posted['c93'])){$animals[] = $animal[16];}

if(isset($posted['c1'])){$mother = '<circle cx="114.141" cy="421.263" r="36.305"/><path d="m 109.114,154.839 0,-126.2304 c -0.19,-22.93453 -34.3281,-22.93453 -34.6296,0 l 0,126.2304 -44.6836,0 48.0349,168.679 -7.8198,0 -27.927,-96.069 C 35.0288,206.202 6.29761,214.804 13.0444,237.503 L 44.323,341.392 c 3.5969,11.93 18.6331,32.997 44.6836,33.512 l 50.2694,0 c 25.3,-0.515 40.398,-21.761 44.683,-33.512 l 42.15062,-107.36792 c 6.345,-22.587 -22.159,-31.859 -29.045,-10.054 L 158.266,323.518 l -8.937,0 49.152,-168.679 -45.8,0 0,-126.2304 c 0.357,-22.93453 -33.647,-22.82198 -33.513,0 l 0,126.2304 z"/>';}
if(isset($posted['c2'])){$father = '<circle cx="320.524" cy="430.731" r="37.2365"/><path d="m 407,219 0,115 c 0,24 -19,49 -48,49 l -74,0 c -24,0 -34,-13 -43,-40 L 197.86784,232.69541 c -7,-21 23,-31 30,-10 L 270,325 l 4,0 0,-291 c 0,-31 43,-30 43,0 l 0,169 6,0 0,-169 c 1,-30 44,-31 44,0 l 0,291 8,0 0,-106 c 0,-22 32,-22 32,0 z"/>';}


$jan = $month[0];
$feb = $month[1];
$mar = $month[2];
$apr = $month[3];
$may = $month[4];
$jun = $month[5];
$jly = $month[6];
$aug = $month[7];
$sept = $month[8];
$oct = $month[9];
$nov = $month[10];
$dec = $month[11];
$show = "<br/>$inhalantFoodTitles[0] = $inhalantFood[0]<br/>$inhalantFoodTitles[1] = $inhalantFood[1]<br/>$inhalantFoodTitles[2] = $inhalantFood[2]<hr/>$show<\n\n";
$show .= var_export($category,1);
$show .=  "\n\n";
$show .= var_export($inhalantFood,1);
$show .=  "<br/><br/>\n\n";
$show .= var_export($inhalantFood,1);
$totalSymptoms = $category[4] + $category[5] + $category[6] + $category[7] + $category[8] ;

$familyText = array('','','');
$family = array(array(
0=>'Odds that a child, with neither parent',
1=>'allergic, will still develop allergies:',
2=>'5-15%',
3=>''),
array(
0=>'Odds that a child, with one ',
1=>'allergic parent, will develop allergies: ',
2=>'35%',
3=>'',),
array(
0=>'Odds that a child, with two ',
1=>'allergic parents, will develop allergies: ',
2=>'65%',
3=>''));
$familyText = $family[$category[1]];

$recommend = array('No','No','No');
if($inhalantFood[2] > 0){$recommend[0] = 'Yes';}
if($inhalantFood[1] > 0){$recommend[1] = 'Yes';}
if($inhalantFood[0] > 0){$recommend[0] = 'Yes'; $recommend[2] = 'Yes';}
if(count($animals) + $inhalantFood[4] > 0){$recommend[1] = 'Yes';}else{$animals[] = 'NONE';}
$show .=  "\n\n";
$show .= var_export($animals,1);
$pollen = '';
if(file_exists("/home/amx/public_html/h/$state.jsn")){
  $pollen = json_decode(file_get_contents("/home/amx/public_html/h/$state.jsn"),1);
}
else{
$pollen = '';
$state = '??';
}
$trees = $pollen[2];
$grasses = $pollen[1];
$weeds = $pollen[0];



echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Dashboard</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style type="text/css">
.num{fill: #ffffff; font: 700 3em Arial,sans-serif;text-anchor:middle; }
.desc{fill: #fff; font: 700 1.5em Arial,sans-serif;text-anchor:middle; }
.recomend{fill: #8f0; font: 700 2em Arial,sans-serif;text-anchor:middle; }
.head{fill: #fff; font: 700 2.5em Arial,sans-serif;text-anchor:middle; }
.pollen{fill: #fff; font: 700 1.2em Arial,sans-serif; }
.title{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.value{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.txt{fill: #fff; font: 400 1em Arial,sans-serif;text-anchor:middle; }
#done{width:150px;height:50px;}

.inline{display:inline;}
#content{width:1200px;margin:0 auto;position:reletive;top:0;z-index:1;}
.oval{background:#fff;}
button{width:100px;padding:0;margin:.7em 0 0 0;border-radius: 9px 9px 9px 9px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;border:1px solid #69B5B3;color: #fff;background-color:#144;}
#headline{text-align:center;margin:0 0 .2em 0 ;width:1000px;display:inline-block;}



#rtarget{position:absolute;top:0;left:600px;top:160px;width:140px;height:130px;background:#fff;opacity:.1;z-index:9;}
#rtxt,#htxt,#dtxt,#stxt,#wtxt,#ftxt,#itxt,#btxt{text-align:center;display:none;background:#111;color:#0bf;position:absolute;left:420px;top:255px;width:410px;min-height:200px;font: 700 1.2em Arial,sans-serif;padding:2em;border-radius: 20px 20px 20px 20px;}
</style>
</head>
<body>

<div id="content">

<div id="rtxt" >$symptomtxt[4] </div>
<div id="htxt" >$symptomtxt[7] </div>
<div id="dtxt" >$symptomtxt[6] </div>
<div id="stxt" >$symptomtxt[5] </div>
<div id="wtxt" >$symptomtxt[8] </div>
<div id="ftxt" >$inhalantFoodTxt[2] </div>
<div id="itxt" >$inhalantFoodTxt[1] </div>
<div id="btxt" >$inhalantFoodTxt[0] </div>
$exit
<h1 id="headline">Allermetrix e-Office Dashboard</h1>
<svg id="db" class="oval" xmlns="http://www.w3.org/2000/svg"
xmlns:xlink="http://www.w3.org/1999/xlink"
width="1200" height="1200" viewBox="0 0 1500 1500">
<style type="text/css">
.num{fill: #fff; font: 700 3em Arial,sans-serif;text-anchor:middle; }
.desc{fill: #fff; font: 700 1.5em Arial,sans-serif;text-anchor:middle; }
.recomend{fill: #8f0; font: 700 2em Arial,sans-serif;text-anchor:middle; }
.head{fill: #fff; font: 700 2.5em Arial,sans-serif;text-anchor:middle; }
.pollen{fill: #fff; font: 700 1.2em Arial,sans-serif; }
.title{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.value{fill: #fff; font: 700 1.5em Arial,sans-serif; }
.month{fill: #fff; font: 400 1.2em Arial,sans-serif;text-anchor:middle;}
.txt{fill: #fff; font: 400 1em Arial,sans-serif;text-anchor:middle; }
.emp{fill: #0bf; font: 700 1.2em Arial,sans-serif;text-anchor:middle; }
.txtstart{text-anchor:start;}
.txtmiddle{text-anchor:middle;}
.txtend{text-anchor:end;}
</style>
<defs>
<ellipse id="moval" rx="300" ry="150" fill="#111" />
<ellipse id="ioval" rx="205" ry="205" fill="#111" />
<ellipse id="bgOval" rx="600" ry="320" fill="#659CD7" />

<g id="more">
	 <circle
     style="fill:#111;stroke:#0bf;stroke-width:2px;"
     cx="0"
     cy="0"
     r="11" />
<text class="head" x="0" y="6" style="fill:#0bf;  font:400 1em serif; ">i</text>
</g>
<g id="oval">
  <ellipse rx="100" ry="90" fill="#111" />
  <use x="0" y="55" xlink:href = "#more"/>
  </g>
</defs>
<rect x="0" y="672" height="500" width="1500" rx="55" ry="35" fill="#659CD7"/>
<use x="750" y="825" xlink:href = "#moval"/>
<use id="topoval" x="750" y="320" xlink:href = "#bgOval"/>

<use x="210" y="900" xlink:href = "#ioval"/>
<text class="head" x="210" y="880">Family History</text>
<text class="txt" x="210" y="920">$familyText[0]</text>
<text class="txt" x="210" y="940">$familyText[1]</text>
<text class="num" x="210" y="1020">$familyText[2]</text>
<text class="txt" x="210" y="1080">$familyText[3]</text>

<use x="1290" y="900" xlink:href = "#ioval"/>
<text class="head" x="500" y="750"></text>
<text class="desc" x="1290" y="775"></text>
<text class="head" x="750" y="780">Symptoms by Category</text>
<text class="title" x="630" y="835">Foods: </text> <text x="790" y="830" class="num"> $inhalantFood[2]</text>
<use x="600" y="825" xlink:href = "#more" onmousedown="show('ftxt')"; onmouseup="disappear('ftxt')" onmouseout="disappear('ftxt')" />
<text class="title" x="630" y="875">Inhalants: </text> <text x="790" y="885" class="num"> $inhalantFood[1]</text>
<use x="600" y="865" xlink:href = "#more" onmousedown="show('itxt')"; onmouseup="disappear('itxt')" onmouseout="disappear('itxt')" />
<text class="title" x="630" y="915">Both: </text> <text x="790" y="930" class="num"> $inhalantFood[0]</text>
<use x="600" y="905" xlink:href = "#more" onmousedown="show('btxt')"; onmouseup="disappear('btxt')" onmouseout="disappear('btxt')"/>

<text class="recomend" x="1290" y="840">Recommendations</text>
<text class="title" x="1180" y="890">Test Inhalants: </text> <text x="1360" y="890" class="value"> $recommend[2]</text>
<text class="title" x="1180" y="930">Test Animals: </text> <text x="1360" y="930" class="value"> $recommend[1]</text>
<text class="title" x="1180" y="970">Test Foods: </text> <text x="1360" y="970" class="value"> $recommend[0]</text>

<g transform="translate(170,830)scale(.2,-.2)" fill="#fff">
$mother
$father
</g>
<use x="350" y="220" xlink:href = "#oval" onmousedown="show('rtxt')"; onmouseup="disappear('rtxt')" onmouseout="disappear('rtxt')" />
<text class="desc" x="350" y="240">Respiratory</text>
<text class="num" x="350" y="210">$category[4]</text>

<use x="540" y="140" xlink:href = "#oval" onmousedown="show('htxt')"; onmouseup="disappear('htxt')"  onmouseout="disappear('htxt')" />
<text class="desc" x="540" y="160">Head</text>
<text class="num" x="540" y="130">$category[7]</text>

<use x="750" y="110" xlink:href = "#oval" onmousedown="show('dtxt')"; onmouseup="disappear('dtxt')" onmouseout="disappear('dtxt')"/>
<text class="desc" x="750" y="130">Digestive</text>
<text class="num" x="750" y="100">$category[6]</text>

<use x="960" y="140" xlink:href = "#oval" onmousedown="show('stxt')"; onmouseup="disappear('stxt')" onmouseout="disappear('stxt')"/>
<text class="desc" x="960" y="170">Skin</text>
<text class="num" x="960" y="130">$category[5]</text>

<use x="1150" y="220" xlink:href = "#oval" onmousedown="show('wtxt')"; onmouseup="disappear('wtxt')" onmouseout="disappear('wtxt')"/>

<text class="desc" x="1150" y="240">Whole Body</text>
<text class="num" x="1150" y="200">$category[8]</text>

<rect id="totalsym" x="450" y="255" width="600" height="70" rx="35" ry="20"  fill="#111" />
<text  x="750" y="305"><tspan class="head">Total Symptoms:</tspan><tspan class="num"> $totalSymptoms</tspan></text>

<rect x="500" y="1010" width="500" height="150" fill="#111" rx="50" ry="25"/>

<g transform="translate(910,1010) scale(.15)">
  <path style="fill:#fff;stroke:#fff;" d="m151.35 307.2h113c0-16.06-1.15-19.25-27.75-19.25 4.25-12.75 21.52-43.59 31.12-43.59 8.5 0 18.63 0.47 18.63 19.84 0 22 37.02 57.48 46 43 13.38-21.56-23-14.98-23-67 0-71.15 41.52-61.02 41.52-101 0-20-5.52-22.7-5.52-37 0-18.893 16.65-17.796 13.41-33.465-2.24-10.823-3.99-19.503-5.29-32.591-0.93-9.287-1.23-19.185-10.87-18.787-11.33 0.468-15.63 20.417-33.25 21.848-17.58 1.427-32.57-14.967-39.38-12.625-6.74 2.321-4.62 20.625-0.62 33.625 6.29 20.432 20 46.995-5 50.995s-68 8-99 49-29.86 89.12-42 104c-40.759 49.96-82.526 29.45-82.526 71 0 18.61 31.525 32 36.525 26s-42.485-23.87 10.646-45c45.395-18.04 49.445-21.72 63.355-9z"/>
</g>
<g transform="translate(500,1010) scale(.2)"> 
<path fill="#fff" stroke="#fff" d="m341.44 72.48c-4.996 5.373-16.788 6.249-19.439 15.36s-12.298 50.862-24.24 70.56c-1.711 22.575-5.242 43.325-1.92 68.16 0.512 3.827 2.866 6.739 3.6 10.8 2.746 2.787 11.308 2.142 11.04 7.2-0.214 4.048-15.984 4.37-19.199 1.68-6.181-5.172-4.091-18.73-9.12-24.48 0.391 7.822-1.031 15.667 2.399 21.36 1.779 2.952 9.235 4.252 9.12 8.4-0.185 6.643-18.83 1.623-20.16-0.48-2.101-3.322-1.912-9.327-3.84-14.399-2.19-5.765-3.423-5.582-3.12-12.96 0.308-7.478-2.403-17.44-3.6-25.681-1.598-11-2.987-21.504-6-28.8-33.955-4.925-58.845-18.915-96.24-20.4-14.532 23.549-37.729 38.432-58.8 55.44-1.453 6.972 1.004 14.763 1.44 22.08 2.946 1.99 9.732 0.78 9.6 5.28-0.109 3.701-13.088 4.427-16.56 2.159-6.799-4.439-3.471-22.006-8.4-28.079-14.843 4.438-17 23.64-22.32 38.399 2.486 2.285 9.844 2.29 7.92 6.96-2.098 5.092-19.677 1.365-20.4-2.399-1.232-6.421 3.276-16.929 4.56-22.801 1.385-6.33 1.811-17.056 4.8-22.56 0.893-1.644 4.24-2.775 5.52-4.08 5.983-6.097 16.533-14.781 18.72-23.76 3.528-14.487 8.287-30.359 7.2-48.72-4.202 16.561-11.877 27.42-24.72 34.56-15.535 8.636-36.694 1.528-54.96 1.92 9.262-6.627 28.635-3.066 41.04-5.28 35.111-6.264 21.791-55.728 52.8-67.2 20.893-7.729 42.031-12 71.52-12 9.277 0 48.22-1.306 60.72-3.12s26.796-11.99 41.04-19.68 29.986-35.007 53.28-36.72c11.954-0.879 20.691 3.304 26.4 9.12 8.817 8.984 9.726 22.967 22.08 29.52 2.517 1.335 4.622 0.951 5.04 3.6 0.617 3.918-3.49 10.69-5.521 12.72-10.04 10.039-31.3 5.056-41.28-1.68z"/>
</g>


<text class="head" x="750" y="1050">Animal Exposure</text>



<text class="desc" x="630" y="1080">$animals[7]</text>
<text class="desc" x="770" y="1080">$animals[6]</text>
<text class="desc" x="920" y="1080">$animals[8]</text>

<text class="desc" x="630" y="1110">$animals[1]</text>
<text class="desc" x="770" y="1110">$animals[0]</text>
<text class="desc" x="920" y="1110">$animals[2]</text>

<text class="desc" x="630" y="1140">$animals[4]</text>
<text class="desc" x="770" y="1140">$animals[3]</text>
<text class="desc" x="920" y="1140">$animals[5]</text>

<rect id="rec1" x="420" y="333" width="660" height="175" fill="#111" rx="50" ry="25"/>
<text class="head" x="750" y="380">Months Symptoms Occur</text>
<text x="790" y="410">
<tspan class="$jan">Jan </tspan>
<tspan class="$feb">Feb </tspan>
<tspan class="$mar">Mar </tspan>
<tspan class="$apr">Apr </tspan>
<tspan class="$may">May </tspan>
<tspan class="$jun">Jun </tspan>
<tspan class="$jly">Jly </tspan>
<tspan class="$aug">Aug </tspan>
<tspan class="$sept">Sept </tspan>
<tspan class="$oct">Oct </tspan>
<tspan class="$nov">Nov </tspan>
<tspan class="$dec">Dec</tspan>
</text>
<rect x="420" y="470" width="660" height="110" fill="#111" rx="50" ry="25"/>
<text class="desc" x="750" y="450">Pollination information for $state</text>
<text x="460" y="480" class="pollen">Weeds: </text>
<text x="790" y="480">$trees</text>
<text x="460" y="510" class="pollen">Grasses: </text><text x="790" y="510">$grasses</text>

<text x="460" y="540" class="pollen">Trees: </text><text x="790" y="540">$weeds</text>
<rect x="480" y="642" height="28" width="580" rx="55" ry="35" fill="#f90"/>
<circle style="fill:#fff;" cx="695" cy="656" r="13" />
<text x="670" y="663" class="txtend" font-size="22" font-weight="bold" >Click and hold</text>
<text x="720" y="663" class="txtstart" font-size="22" font-weight="bold">to reveal the specific symptoms.</text>
<use x="695" y="656" xlink:href = "#more" />
<rect x="0" y="1190" height="50" width="1500" rx="55" ry="35" fill="#f90"/>
<text x="750" y="1222" class="txtmiddle">The information presented in this report does not constitute medical advice and is for your general information only. Consult with the doctor if  you have any concerns, or, specific questions regarding this information.</text>
</svg>

</div>
<script type="text/javascript"> //<![CDATA[
var content = document.getElementById('content');
var totalsym = document.getElementById('totalsym');
var xpos = 0;
var ypos = 0;
var rtxt = document.getElementById('rtxt');
var htxt = document.getElementById('htxt');
var dtxt = document.getElementById('dtxt');
var stxt = document.getElementById('stxt');
var wtxt = document.getElementById('wtxt');
var ftxt = document.getElementById('ftxt');
var itxt = document.getElementById('itxt');
var btxt = document.getElementById('btxt');

function show(id){
var txt = document.getElementById(id);
$comment txt.style.display = 'block';
}
function disappear(id){
var txt = document.getElementById(id);
txt.style.display = 'none';
}

function init(){

xpos = parseInt(content.offsetLeft);
ypos = parseInt(content.offsetTop);
xpos += (parseInt(totalsym.getAttribute("x")) - 90);
ypos += (parseInt(totalsym.getAttribute("y")) - 8);
rtxt.style.left = xpos + 'px';
htxt.style.left = xpos + 'px';
dtxt.style.left = xpos + 'px';
stxt.style.left = xpos + 'px';
wtxt.style.left = xpos + 'px';

ftxt.style.left = xpos + 'px';
itxt.style.left = xpos + 'px';
btxt.style.left = xpos + 'px';

rtxt.style.top = ypos + 'px';
htxt.style.top = ypos + 'px';
dtxt.style.top = ypos + 'px';
stxt.style.top = ypos + 'px';
wtxt.style.top = ypos + 'px';

ftxt.style.top = ypos + 'px';
itxt.style.top = ypos + 'px';
btxt.style.top = ypos + 'px';
}
//]]>
window.onload = init;
window.onresize = init;
</script>
<PRE>

EOT;
if($ip == '70.171.10.12'){
$time = microtime(true) - $time;
echo "$sqlf\n$sub\n$time\ninhalantFoodTxt\n";
var_export($history);
var_export($_POST);
echo "\n==============\n$show";
}
echo '</PRE></body></html>';
?>