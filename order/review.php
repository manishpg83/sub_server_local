<?php
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$sql = "UPDATE `orders` SET `status`= 'R' WHERE `id` = $rec";

mysqli_query($link,$sql);
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Allermetrix eOffice Review</title>
<meta name="viewport" content="width=400, initial-scale=1.0" />
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:0;color:#004;padding:0;background:#f7f7fb;}
body ::selection{background:#00f;color:#ff0;}
.row{margin:0;padding:0;}
.bold{font-weight:700;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.emp{font:700 1em Arial;color:#f00;}
.cap{font:700 1em Arial,sans-serif;margin:12px 0 2px 0;}
.cat{margin:2px 0 0 0;}
.footnote{font:400 .9em Arial;color:#000;}
.none{margin:0 0 0 0;font:400 12px Arial,sans-serif;color:#000;}
#page{margin:0 auto;padding:1em 0 1em 10px;border:0;min-width:1120px;max-width:1120px;}
.hide{display:none;}
.gray{color:#aaa;}
.inline{display: inline-block;}
#cp{width:470px;}
table{margin:10px 0 0 100px;border-spacing: 0;padding:0;}
td,tr{padding:0;margin:0;font:400 1em Times,serif;}
td{padding:0;border:0;margin:0;} 
caption{text-align: left;font:700 1em Arial,sans-serif;min-width:200px;}
.link{width:16%;font:700 1em Arial,sans-serif;cursor:pointer;padding:6px 0 6px 7px;border:1px solid #69B5B3;color: #fff;background-color:#144;font-weight:700;
      background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,44,1) 100%);}.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
.E{border:solid 1px #f00;padding:4px 0 4px 0;margin:0 1px 0 0;width:20px; font:400 .6em Times,serif;text-align:center;background:#f00;color:#fff;display:inline-block;}
.G4{border:solid 1px #ff0;padding:4px 0 2.5px 0;margin:0 1px 0 0;width:20px; font:400 .6em Times,serif;text-align:center;background:#ff0;color:#000;display:inline-block;}
.G{border:solid 1px #00f;padding:4px 0 4px 0;margin:0 1px 0 0;width:20px; font:400 .6em Times,serif;text-align:center;background:#00f;color:#fff;display:inline-block;}
.not{border:solid 1px #000;padding:4px 0 4px 0;margin:0 1px 0 0;width:20px; font:400 .6em Times,serif;text-align:center;background:#fff;color:#888;display:inline-block;}
.notg4{border:solid 1px #000;padding:4px 0 2.5px 0;margin:0 1px 0 0;width:20px; font:400 .6em Times,serif;text-align:center;background:#fff;color:#888;display:inline-block;}
.panel{width:400px;height:40px;text-align:left;font:700 1em Arial,sans-serif;color:#fff;padding:0 0 0 5px;background:linear-gradient(to bottom, #398bd3 0%, #1f70b7 100%);}
.pnum{display:inline-block;width:60px;padding:3px 0 0 5px;}
.pdesc{display:inline-block;padding:3px 0 0 5px;}
.pnum,.pdesc,.panel{;background-image:linear-gradient(to bottom, #1e3c72 0%, #2a5298 100%);}
#footer{font:400 1em Arial,sans-serif;margin:0 0 20px 5px;}
#revise,.col{margin:0 auto 0;width:395px;}
#total{margin:14px 0 3px 0; font:700 1em Arial,sans-serf;}
#serum{margin:3px 0 20px 0; padding:8px 0 8px 0;font:700 1.2em Arial,sans-serf;width:100%;text-align:center;color:#f00;background:#ff0; 
background: linear-gradient(to bottom, rgba(255,255,0,1) 0%, rgba(222,222,0,.6) 100%);}
#submit,#revise{font:700 1em Arial,sans-serif;cursor:pointer;padding:12px 0 12px 7px;border:1px solid #69B5B3;color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,44,1) 100%);width:395px;text-align:center;}
#disabled{color:#bbb;font:700 1em Arial,sans-serif;cursor:pointer;padding:12px 0 12px 7px;border:1px solid #69B5B3;background: linear-gradient(to bottom, rgba(0,0,255,.6) 0%, rgba(0,0,44,.7) 100%);width:100%;}
.hf{font:400 .9em/1.1 Arial,sans-serif;}
#mi{display:none;color:#f00;font:400 1em Arial,sans-serif;margin-top:15px; line-height: 1.4;}
.submit{margin:5px 0 5px 0;font:700 1em Arial,sans-serif;cursor:pointer;padding:12px 0 12px 7px;border:1px solid #69B5B3;color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,44,1) 100%);width:100%;}
.note{color:#000;margin-top:0;}
.totals{padding:0;margin:0px 0 0 0}
.totals,.classe,.classg,.classg4,.classmx{display:inline-block;width:42px;}
.total{display:inline-block; width:26px;text-align:right;}
.classe,.classg,.classg4,.classmx{font:700 1em Arial;color:#f00;padding:0;margin:0px 0 0 0;}
.footnote{margin:1px 0 1px 0;font:400 12px Arial,sans-serif;}
#pat{margin:0 0 0 0;display:inline-block;vertical-align:12px;text-align:center;width:800px;}
form{margin:0 0 10px 0;}
#vol,#remove{font: 700 20px Arial;color:#f00; margin:3px 0 10px 0; }
#note{font: 700 18px Arial;}
#hold,#onhold{color:#f00;display:none;font-size:.9em;margin:10px 0 10px 0;}
#bottom{height:200px;width:395px;margin:0 auto 0;}
input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #fff;outline:2px solid #fff;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#fff;   display: inline;vertical-align: middle;position: relative;}   
</style></head><body>

<div id="page">
<img src="logo.gif" alt="logo" /><div id="pat">$clientname $patient &#x2003;Order: $rec &#x2003;Patient: $first $last &#x2003;Billing: $billingType[$billing]</div>
<form action="./" method="post">
<button id="b0" class="link" name="tab" value="0">Food by Category</button><button id="b1" class="link" name="tab" value="1">Food Alphabetical</button><button id="b2" class="link" name="tab" value="2">Pollen</button><button id="b3" class="link" name="tab" value="3">Environmental</button><button id="b4" class="link" name="tab" value="4">Chemical</button><button id="b5" class="link" name="tab" value="5">Panels</button>
<input type="hidden" name="prior" value="6" />
<input type="hidden" name="sub" value="50" /> 
EOT;
include('hidden.php');
echo '</form><div class="col">';
ob_flush();
$t = microtime(1);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
if($billing == 2){
  $patients = array();
  $mtypes = array(0,0,0,0);
  $sql = "SELECT `Patient` FROM `Patient` WHERE `Status` LIKE 'C' AND `Date` > '2021-10-24' AND `Last` LIKE 'knox' AND `DoB` = '1992-06-28'";
  $results = mysqli_query($link,$sql);
  while(list($patient) = mysqli_fetch_array($results, MYSQLI_NUM)){
    $patients[] = $patient;
  }
  foreach($patients as $patient){
    $sql = "SELECT `Type`, COUNT(*) FROM `Test` WHERE `Patient` = $patient AND `Status`= 'C' GROUP BY `Type`";
    $results = mysqli_query($link,$sql);
    while(list($type,$cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
      $mtypes[$type] = $cnt;
    }
    $g = $mtypes[2] + $mtypes[3];
  }
  $mt = $t - microtime(1);
}

$tabs = array('foods','food','pollen','environmental','chemicals','panels','','');
$date = date("Ymd00000");
$none = '';
$typeE  = array('<tr><td></td>' , '<tr><td><div class="E">E</div></td>');
$typeG4 = array('<td></td>' , '<td><div class="G4">G<sub>4</sub></div></td>');
$typeG  = array('<td></td>' , '<td class="G">G</td>');
$ndx = 1;
$checkmark = array('','checked');
$file = $id . $tabs[5] . '.jsn';
if(file_exists($file)){
  $panels = json_decode(file_get_contents($file),1);
}
else{
  $panels = array(array(),array());
}
foreach($panels[1] as $panel => $property){
    if($property[0] == 1){
      $p[$panel] = $property[4];
    }
}
if($Accession > 200000){
  $addon = true;
  $sql = "SELECT  `Date` FROM `Patient` WHERE `Patient` = $Accession ";
  $results = mysqli_query($link,$sql);
  list($date) = mysqli_fetch_array($results, MYSQLI_NUM);
  $collection = $date;
  $time = strtotime($date);
  $strdate = date('m/d/y',$time);
  $time = time() - $time;
  $days = ceil($time / 86400);
}
$patient = '';
if($Accession > 100000){
$patient = "Allermetrix Accesssion: $Accession<br>Test Date: $strdate<br><hr>";
}
echo $patient;
foreach($panels[0] as $panel => $property){if($property[0] == 1){$p[$panel] = $property[4];}}
if(count($p) > 0){
echo <<<EOT

<div class="cap">Panels</div>
EOT;
  foreach($p as $panel => $description){
    echo "<button type=\"button\" class=\"panel\"><div class=\"pnum\">$panel</div><div class=\"pdesc\">$description</div></button><br>\n";
    $hidden[0][$description] = "<input type=\"hidden\" name=\"P$panel\" value=\"$description\" size=\"50\" />";
  }
}
$mixes = array('IZ17','EZ06','HZ05','EZ06','EZ04','EZ07','EZ12','FZ03','FZ11','FZ13','FZ16','GZ08','IZ17','MZ02','MZ15','TZ01','TZ13','TZ09','WZ16','WZ10');

$nones = '';
$cnt = 0; 
$count = array();
$EG = array('','E','G','4');
$input = array(0=>array('',"\n<input type=\"hidden\" name=\""),1=>array('',"\" value=\""),2=>array('',"\" size=\"50\" />"));
for($tab=0;$tab<5;$tab++){if($tab == 1){continue;}
  $file = $id . $tabs[$tab] . '.jsn';
  if(!file_exists($file)){continue;}
  $selected = json_decode(file_get_contents($file),1);
  $endTable = '</table>';
  $none = '';

  foreach($selected as $code => $types){
    if($types[0] == 0){continue;}
    if($types[1] + $types[2] + $types[3] > 0 && $types[0] != 5){
      for($ig=1;$ig<4;$ig++){
        $name = array('',$EG[$ig] . $code);
        $value = array('',"$EG[$ig]$code $ig $types[4]");
        $hidden[1][$types[4] . $ig] = $input[0][$types[$ig]] . $name[$types[$ig]] . $input[1][$types[$ig]] . $value[$types[$ig]] . $input[2][$types[$ig]];
      }
    }
    if($types[0] == 5){
      echo "\n$endTable";
      $nones .= $none;
      $table = "<table>\n<caption>$types[4]</caption>\n";
      $endTable = ''; 
      $none = "<p class=\"none\">No " . $types[4] . '</p>'; 
      continue;
    }   //$none . '<p class="cat">' . $selected[$code][4] . "</p>\n";$none = "<p class=\"none\">No " . $selected[$code][4] . '</p>';continue;}
    $endTable = '</table>';
    echo $table;
    echo $typeE[intval($types[1])] . $typeG4[intval($types[3])] . $typeG[intval($types[2])] . '<td>&ensp;' . $types[4] . "</td></tr>\n";
    $count[$code][1] = intval($types[1]);
    $count[$code][2] = intval($types[2]);
    $count[$code][3] = intval($types[3]);
    $none = ''; 
    $table = '';
    $cnt++;
  }
  $nones .= $none;
  
}
echo "$endTable<br>\n";
ob_flush();
$tests = 0;
foreach($count as $code => $property){
  $tests += $count[$code][1] + $count[$code][2] + $count[$code][3];
}
$celiac = 0;
$dups = 0;
$ptests = 0;
$totalE = 0;
if(count($p) > 0){
  foreach($p as $panel => $description){
    if($panel == '260'){$celiac = 1;continue;}
    $sql = "SELECT  `code`,`type` FROM `PanelTests` WHERE `number`='$panel' "; 
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){
      if(substr($code,0,3) == '100'){$totalE = 1; continue;}
      $count[$code][intval($type)] = 1;
      $ptests++;
    }
  }
}
$ige = 0;
$igg = 0;
$igg4 = 0;
$mix = 0;
$total = 0;
foreach($count as $code => $property){
  $total += $count[$code][1] + $count[$code][2] + $count[$code][3]; 
  if(in_array($code,$mixes)){$mix += ($count[$code][1] + $count[$code][2] + $count[$code][3]);}
  $ige  += $count[$code][1]; 
  $igg4 += $count[$code][3]; 
  $igg  += $count[$code][2]; 
}

$vacutainers = 0;
$needed = ceil(($ige * 60 + ($igg4 + $igg))/100)/10 ;
if($needed > 0){$vacutainers = 1;}
if($needed > 3.5){$vacutainers =  ceil($needed / 3.5);}
$needed += 3 * $celiac;
$vacutainers += $celiac;

$abn = array();
$abn[0][0] = '';
$abn[0][1] = '';
$abn[0][2] = '<button class="submit" onclick="document.getElementById(\'abnG\').contentWindow.print()">Print IgG/IgG<sub>4</sub> ABN</button><button class="submit" onclick="document.getElementById(\'abnE\').contentWindow.print()">Print IgE ABN</button>';
$abn[0][3] = '';//<button class="submit" onclick="document.getElementById(\'abnG\').contentWindow.print()">Print IgG/IgG<sub>4</sub> ABN</button><button class="submit" onclick="document.getElementById(\'abnE\').contentWindow.print()">Print IgE ABN</button>';
$abn[0][4] = '';
$abn[0][5] = '';

$abn[1][0] = '';
$abn[1][1] = '<div id="abnchk"></div><div id="onhold"></div>';
$abn[1][2] = '<span class="red">Either revise the order or <br>patient can sign an Advanced Benefits Notice (ABN).</span></span><br><input id="abnchk" type="checkbox" name="Abnchk" value="1" onclick="abn()"/>&ensp;Will Submit ABN</span><br><div id="onhold">This patient will be on hold until the signed ABN is received.</div>';
$abn[1][3] = '<div id="abnchk"></div><div id="onhold">';//<br><span class="red">Either revise the order or patient can sign an Advanced Benefits Notice (ABN).</span></span><br><input id="abnchk" type="checkbox" name="Abnchk" value="1" onclick="abn()"/>&ensp;Will Submit ABN</span><br>';
$abn[1][4] = '<div id="abnchk"></div><div id="onhold">';
$abn[1][5] = '<div id="abnchk"></div><div id="onhold">';


$vol = '';
$classe = 'totals';
$classg = 'totals';
$classg4 = 'totals';
$classmx = 'totals';
$igeExcess = ($ige - 62);
if($igeExcess < 0){$igeExcess = 0;}
$excess = 0;
$medicare = [false,false,true,false,false,true,false];
$mi = '';
$IgExcess = '';
$IgGxcess = '';
$miXcess = '';
if(($igeExcess > 0 || ($igg + $igg4) > 20 || $mix > 2) && $medicare[$billing] ){
  $excess = $igeExcess; 
  $diff = ($igg + $igg4) - 20; 
  if($diff > 0){
    $excess += $diff;
    $IgGxcess = "<br><span class=\"hf\">Limit for IgG + IgG<sub>4</sub> is 20, limit exceeded by $diff</span>";
    if($igg > 0){$classg = 'classg';}
    if($igg4 > 0){$classg4 = 'classg4';}
  }
  if ($igeExcess > 0){
    $IgExcess = "<br><span class=\"hf\">Limit for IgE is 62, limit exceeded by $igeExcess</span>";
    $classe = 'classe';
  }
  if($mix > 2){$mxcess = $mix - 2;$excess += $mxcess;$miXcess = "<br><span class=\"hf\">Limit for Mixes is 2, limit exceeded by $mxcess</span>";$classmx = 'classmx';}
  
  $mi = "document.getElementById('mi').style.display = 'block';";
}

$limits = array( 
1 =>'',
2 => '<span class="bold">EXCEEDS MEDICARE LIMITS</span>' . $IgExcess . $IgGxcess . $miXcess . '<br>',
3 => '',  //<span class="bold">EXCEEDS MEDICAID LIMITS<br></span><span class="hf">Limit for IgE is 62' . $IgExcess . '</span><br><span class="hf">Limit for IgG + IgG<sub>4</sub> is 20' . $IgGxcess . '<br><br>Revise test order to be within limits.  <br>Additional tests may be run if patient signs an Advanced Benefits Notice (ABN) which <span class="bold">requires an additional request form with billing type "Bill Patient".</span></span>',
4 => '',
5 => '<span class="bold">EXCEEDS INSURANCE LIMITS</span>' . $IgExcess . $IgGxcess . '<br><br>Patient will be billed seperately for the tests that exceded their insurance limit<br><input id="abnchk" type="checkbox" onclick="abn()"/>&ensp;Will Submit Patient Responsibility Form',
6 => '');

$submit = '<form action="./" method="post">
<button id="submit">Create Request Form</button><br>';
if(($medicare[$billing] && $excess > 0) ){
  $onhold = 1;
  $submitJS= "document.getElementById('submit').style.display='none';";
}
$notviable = false;
$addon = false;
$ext = '';
if($celiac == 1){$ext = '<br><span class="footnote">Includes 1 Vacutainer for Celiac Panel</span>';}
$serum = "<p id=\"serum\">Serum Needed: $needed mL<br>$vacutainers Vacutainers (8.5mL SST) needed $ext</p>";
    $ebilling[1] = '';
    $ebilling[2] = '';
    $ebilling[3] = '';
    $ebilling[4] = '';
    $ebilling[5] = '';

if($Accession > 100000){
  $serum = '';
  
  
  if($igeExcess > 0){
    $ebilling[2] = ' and Exceeds Limits';
    $ebilling[3] = '';// and Exceeds Limits';
    $ebilling[5] = ' and Exceeds Limits';
  }

  $Etest = floor($volume * 1000 / 60);
  $IgG = '<br><span class="bold">&#9830; 100+ IgG/IgG<sub>4</sub> tests available</span>';
  if (($igg + $igg4) == 0) {$IgG = '';}
  if($days > 60 && ($igg + $igg4) > 0){
     $IgG = '<br><span class="bold">&#9830; IgG/IgG<sub>4</sub> testing is no longer viable</span>';
    if($igg + $igg4 > 0){ $IgG = '<br><span class="emp">&#9830; IgG/IgG<sub>4</sub> testing is no longer viable</span>';$notviable=true;}
  }
  $phone = intval(preg_replace('/\D/','',$phone));
  if($phone == 0){
    $phone = '';
  }
  else{
    if($phone > 0){$phone = substr($phone,0,3) . '-' . substr($phone,3,3) . '-' . substr($phone,6,4);}
  }
  
  
  
  $insufficient = '';
  $available = $Etest - $ige;
  if($available < 0){
    $remove = $ige - $Etest;
    $vol = "<div id=\"vol\">Insufficient Serum on hand: $volume mL<br>$remove IgE tests MUST be removed</div>";
    $insufficient = '<span class="emp">Insufficient Serum' .  $ebilling[$billing] . '</span>';
    $submitJS= "document.getElementById('submit').style.display='none';";
    $available = ' No';
	$limits[5] = '';
  }

  $viableG = '';
  $viable4 = '';
  if($notviable){
    $limits[2] = '';
    $limits[3] = '';
    $abn[1][2] = '<div id="abnchk"></div>';
    $abn[1][3] = '<div id="abnchk"></div>';
    $limits[5] = '<div id="abnchk"></div>';
    $submitJS= "document.getElementById('submit').style.display='none';";
	$removeg = '';
	$and = '';
    if($igg > 0){
      $classg = 'classg';$viableG = '<span class="emp"> No longer viable</span>';
	  $removeg = '<span id="remove">IgG tests MUST be removed</span>';
	  $and = 'IgG and';
    }
    if($igg4 > 0){
      $classg4 = 'classg4';$viable4 = '<span class="emp">No longer viable</span>';
	  $removeg = '<span id="remove">' . $and . ' IgG<sub>4</sub> MUST be removed</span>';
    }
  }

  
  echo <<<EOT
  
<div id="ao">
<span class="bold">$available IgE Test Still Available</span> 
<br>&#9830; Serum Volume on hand: $volume mL

EOT;
}  //                   End of Add On
 if($excess == 0){$abn[1][$billing] = '<div id="abnchk"></div>';}
$iggTotals = '';
if($ige > 0){$iggTotals .= "<div class=\"$classe\">IgE:</div><div class=\"$classe total\">$ige</div> $insufficient<br>";}
if($igg4 > 0){$iggTotals .= "<div class=\"$classg4\">IgG<sub>4</sub>:</div><div class=\"total $classg4\">$igg4</div> $viable4<br>";}
if($igg > 0){$iggTotals .= "<div class=\"$classg\">IgG:</div><div class=\"total $classg\">$igg</div> $viableG<br>";}
if($mix > 0){$iggTotals .= "<div class=\"$classmx\">Mix:</div><div class=\"total $classmx\">$mix</div><br>";}
$iggTotals .= '</div>';
if($total > 100){$onhold = 1;}
$total += $totalE;
if($total == 0 && $celiac == 0){$submitJS= "document.getElementById('submit').style.display='none';";}
$hold = "<div id=\"hold\"></div>\n";
if($billing == 5){
  $hold = '<div id="hold">This patient will be on hold until the signed Patient Reponsibility is received</div>';
}
echo <<<EOT

<div id="footer"><hr>
$serum
<p id="total">Total Tests Ordered: <span class="inline">$total</span></p>
$iggTotals
<div id="mi">
$limits[$billing]
<br>
</div>
$vol
$removeg


<form action="./" method="post">
{$abn[1][$billing]}

<button id="submit">Create Request Form</button><br>
<input type="hidden" name="sub" value="51"/>
<input type="hidden" name="needed" value="$needed"/>
EOT;
$g = $mtyps[2] + $mtypes[3];
ob_flush();
include('hidden.php');
if(count($hidden[0]) > 0){
  foreach($hidden[0] as $description => $text){echo "$text\n";} 
}
if(count($hidden[1]) > 0){
  foreach($hidden[1] as $text){echo "$text\n";} 
}

echo <<<EOT
</form>

{$abn[0][$billing]}





</div>


</div>

<div class="hide">
<iframe id='abnG' src="./abnG.pdf" height="200" width="300"></iframe>
<iframe id='abnE' src="./abnE.pdf" height="200" width="300"></iframe>
</div>
<div id="bottom"><button id="revise" onclick="revise();">Revise Order</button></div>



<script>
toggle = new Array;
toggle[true] = 'block';
toggle[false] = 'none';
var sub = document.getElementById('submit');
var abnchk = document.getElementById('abnchk');
abnchk.checked= false;
//var onhold = document.getElementById('onhold');
//var hold = document.getElementById('hold');

function init(){
  abnchk.checked = false;
//  onhold.style.display = 'none';
}
function abn(){
  sub.style.display = toggle[abnchk.checked];
 // onhold.style.display = toggle[abnchk.checked];
}
function revise(){
  document.getElementById('b5').click();
}
$mi
$submitJS
window.onload = init;
</script>

</body></html>
EOT;
ob_end_flush();

/*
which <span class="bold">requires an additional request form with billing type "Bill Patient"




  $note = '<form action="./" method="post" ><button>Revise Order</button>';
  include('hidden.php');
  $note .= '<input type="hidden" name="tab" value="5"/>
  <input type="hidden" name="prior" value="6"/>
  </form>';

*/









?>