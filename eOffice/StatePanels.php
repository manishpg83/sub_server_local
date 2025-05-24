<?php
header('Content-Type: text/html; charset=utf-8');
echo <<<EOT
<!DOCTYPE html><head><title>Allermetrix eOffice</title>
<style>
.link{width:95%;padding:0.5em;margin:5px 0 0 .8em;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.ptext{font-size:1.1em;text-align:left;}
.text{font-size:1.1em;text-align:left;display:inline-block;margin:5px 0 0 0;padding:5px 0 0 0 ;}
.red,.blue,.yellow,.match{width: 20px;  text-align: center;font-size: 0.6em;color: #fff;}
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.click{display:inline-block;width:200px;cursor:pointer;padding:6px 0 6px 7px;text-align:center;}

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
.pname{max-width:200px;padding:0;}
.pname{color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);margin:3px 0 0 0;text-align:left;}
input[type="checkbox"]{width:1.5em;height:1.5em;border-radius: 3px 3px 3px 3px;border-color:#fff;outline:0;display: inline-block;margin:1px;margin:0;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
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
.tige{margin-left:87px;}
.checkbox{border: 1px solid #000;width:1.5em;text-align:center;
	border-radius: 4px;	outline: none;
	transition-duration: 0.4s;
	cursor: pointer;}
.texp{padding-left:4em;margin:auto 10px auto;}

</style></head><body><div>

EOT;



$statePanels = array ( 'AK' => '200AK', 'AL' => '200AL', 'AR' => '200AR', 'AZ' => '200AZ', 'CA' => '200CA', 'CO' => '200CO', 'CT' => '200CT', 'In' => '200DE', 'FL' => '200FL', 'GA' => '200GA', 'ID' => '200ID', 'IL' => '200IL', 'IN' => '200IN', 'KS' => '200KS', 'KY' => '200KY', 'LA' => '200LA', 'MA' => '200MA', 'MD' => '200MD', 'MI' => '200MI', 'MO' => '200MO', 'MS' => '200MS', 'MT' => '200MT', 'NC' => '200NC', 'NH' => '200NH', 'NJ' => '200NJ', 'NM' => '200NM', 'NV' => '200NV', 'NY' => '200NY', 'OH' => '200OH', 'OK' => '200OK', 'OR' => '200OR', 'PA' => '200PA', 'SC' => '200SC', 'TN' => '200TN', 'TX' => '200TX', 'VA' => '200VA', 'WA' => '200WA', 'WI' => '200WI', 'WV' => '200WV', 'WY' => '200WY');

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');


$sort = array();
$rast = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysqli_query($link,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code; $rast[$code] = $description; }
$sort = array_flip($sort);
$pdx = 200;
foreach($statePanels as $pDescription => $pName){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$cnt = 0;
$idPanels = 'var idPanels = {0:[false],';
foreach($pSort as $pdx => $array){
  $idPanels .= "$pdx:[false],";
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
    $results = mysqli_query($link,$sql);
    while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){$cnt++;
  	  $type = intval($type);
      if(substr($code,0,3) == '100'){$totalIgE = 1;continue;}
      $sortedFoods[$sort[$code]] = $code;
      $types[$code][$type] = 1;
      $typeCount[$type] += 1;
      $typeCount[0] += 1;  // total number of tests
      $panels[$pdx][4][$code] = array(0,intval($types[$code][1]),intval($types[$code][2]),intval($types[$code][3]));
    }
	
    $pmatch = array_sum($pmatches);
    $panels[$pdx][3] = array(intval($typeCount[0]),intval($typeCount[1]),intval($typeCount[2]),intval($typeCount[3]),intval($typeCount[5],$cnt));
    $panels[$pdx][8] = $totalIgE;
    $pdx++;
	$cnt = 0;
  }
}
$idPanels    = substr($idPanels,0,-1) . "};\n";
//var_export($panels);exit;



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
  }
  echo "<div><div class=\"pname\"  onclick =\"exp('$pdx')\"><div class=\"click\" >$panel[2]&#x2003;</div></div><div class=\"countIgE\"> $countIgE</div><div class=\"countIgG4\"> $countIgG4</div><div class=\"countIgG\"> $countIgG</div><div class=\"countTests\">$countTests</div></div>" . $TIgE[$panels[$pdx][6]] . "\n<div id=\"e$pdx\" class=\"texp\"><table>\n";
  foreach($panel[4] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . "<td class=\"ptext\">$rast[$code]</td></tr>\n";
  }
  echo "</table>\n</div>\n";
  ob_flush();
flush();
}
echo <<<EOT

<div id="e0"></div>
<script> 
var prev = 200;
var prior = 200;
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
function init(){

  for (id in idPanels){console.log('id=' + id);
    idPanels[id][0] = document.getElementById('e' + id);
    idPanels[id][0].style.display = 'none';
  }
  console.log('idPanels');
  console.log(idPanels);
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

</body></html>





EOT;









