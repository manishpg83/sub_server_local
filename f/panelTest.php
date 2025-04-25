<?php
header('Content-Type: text/html; charset=utf-8');
ob_start("ob_gzhandler");
$startTime = microtime(true);
$err = '';
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=@mysql_connect('localhost','amx',$data);
@mysql_select_db('amx_portal');
$ip = $_SERVER['REMOTE_ADDR'];
$sub = intval($_POST['sub']);
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>New Index</title><style>
body{margin:3em;}
.text{font-size:1.1em;}
.red,.blue,.yellow,.match{width: 20px;  text-align: center;font-size: 0.6em;color: #fff;}
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.box{border:2px;border-color:#fff;}
.match{text-align:center;background:#58d68d;font-weight:700;}
.nomatch{background:#ddd;color:#555;}
h4{margin-bottom:3px;}
.matches{background:#58d68d;}
.countIgE{background:#f00;color:#fff;}
.countTests{background:#ddd;color:#000;}
.countIgG{background:#ff0;}
.countIgG4{background:#00f;color:#fff;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches{max-width:30px;text-align:center;padding:7px 7px 9px 7px;}
.countIgG4,.countIgG,.countIgE,.countTests,.matches,.pname{font:700 1em Arial,sans-serif;display:inline-block;margin:0;width:100%;}
.pname{max-width:300px;padding:2px;}
.pname{color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);margin:8px 0 .2em 0;}
input[type="checkbox"]{width:1.5em;height:1.5em;border:0;margin:0;outline:0;display: inline-block;margin:1px;margin:5px 0 5px 5px;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
.tige{margin-left:87px;}

.pexp{padding-left:2em;margin:auto 10px auto;}
.click{display:inline-block;width:250px;cursor:pointer;}
.checkbox{border: 1px solid #000;width:1.5em;text-align:center;
	border-radius: 4px;	outline: none;
	transition-duration: 0.4s;
	cursor: pointer;}
</style></head><body>
EOT;
ob_flush();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysql_query($sql);
$matches = array();
$sort = array();
$rast = array();
foreach($foods as $code){$matches[$code] = 1;}
while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$sort[] = $code; $rast[$code] = $description; $matches[$code] = 0;}
$sort = array_flip($sort);
$amxpanels = array('900' => 'Food, Comprehensive','900-5' => 'Food, Comprehensive IgE','900-6' => 'Food, Comprehensive IgG4','950' => 'Food, Standard','950-3' => 'Food, Standard IgE','950-4' => 'Food, Standard IgG4','950-1' => 'Food, Mini','950-5' => 'Food, Mini IgE','950-6' => 'Food, Mini IgG4','255' => 'IBS','255-2' => 'IBS IgE','255-1' => 'IBS IgG4','253' => 'Hidden Foods ','253-1' => 'Hidden Foods IgE','253-2' => 'Hidden Foods IgG4');
$yn = array('No','Yes');
$foods = array('F027','F083','F245','F026','F284','F376','F081','F411','F379','F380','F117','F002','F236','F319','F096','F092','F139','F095','F044','F025','F329','F008','F009','F004','F079','F318','F343','F345','F089','F283','F263','F313','F409','F016','F247','F350','F020','F202','F093','F203','F130','F030','F047','F215','F048','F035','F027','F083','F245','F026','F284','F376','F081','F411','F379','F380','F117','F002','F236','F319','F096','F092','F139','F095','F044','F025','F329','F008','F009','F004','F079','F318','F343','F345','F089','F283','F263','F313','F409','F016','F247','F350','F020','F202','F093','F203','F130','F030','F047','F215','F048','F035');
foreach($foods as $code){$matches[$code] = 1;}
$pdx = 100;
$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE  `include` = 1 AND `client` = 888888";
$result = mysql_query($sql);
while(list($pDescription,$pName) =  mysql_fetch_array($result, MYSQL_NUM)){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$pdx = 200;
foreach($amxpanels as $pName => $pDescription){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$clientPanels = 'var expButtons = {';

 //foreach($pSport as $pdx => )
foreach($pSort as $pdx => $array){
	foreach($array as $pDescription => $pName){
$clientPanels .= "$pdx:[null,null],";
  $panels[$pdx][0] = $pdx;
  $panels[$pdx][1] = $pName;
  $panels[$pdx][2] = $pDescription;
  $panels[$pdx][3] = array();
  $clientPanels .= "$pdx:[null,null],";
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$pName'";
  $results = mysql_query($sql);
  $typeCount = array(0,0,0,0);
  $totalIgE = 0;
  $pmatches=array();
  $types=array();
  while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
    if(substr($code,0,3) == '100'){$totalIgE = 1;continue;}
    $type = intval($type);
    $sortedFoods[$sort[$code]] = $code;
    $types[$code][$type] = 1;
    $typeCount[$type] += 1;
    $typeCount[0] += 1;  // total number of tests
	$pmatches[$code] = $matches[$code];
    $panels[$pdx][4][$code] = array($matches[$code],intval($types[$code][1]),intval($types[$code][2]),intval($types[$code][3]));
  }
  $pmatch = array_sum($pmatches);
  $panels[$pdx][3] = array(intval($typeCount[0]),intval($typeCount[1]),intval($typeCount[2]),intval($typeCount[3]),intval($typeCount[5]),intval($pmatch));
  $panels[$pdx][8] = $totalIgE;
  ksort($sortedFoods);
  $pdx++;
}}
$TIgE = array('','<div class="tige">Total IgE</div>');
$startTime = microtime(true);
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
  echo "<div><div class=\"pname\"><input id=\"c$pdx\" type=\"checkbox\"  />&#x2003;<div class=\"click\" onclick =\"exp('$pdx')\">$panel[2]&#x2003;</div></div><div class=\"matches\">$matches</div><div class=\"countIgE\"> $countIgE</div><div class=\"countIgG4\"> $countIgG4</div><div class=\"countIgG\"> $countIgG</div><div class=\"countTests\">$countTests</div></div>" . $TIgE[$panels[$pdx][6]] . "\n<div id=\"d$pdx\" class=\"pexp\"><table>\n";
  foreach($panel[4] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . $match[$types[0]] . "<td class=\"text\">$rast[$code]</td></tr>\n";
  }
  echo "</table>\n</div>\n";
}
$clientPanels .= '}';
echo <<<EOT
<script>
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
var expButtons = {100:[null,null],101:[null,null],102:[null,null],103:[null,null],104:[null,null],105:[null,null],106:[null,null],107:[null,null]};
$clientPanels
function init(){
  for (var id in expButtons){
    expButtons[id][0] = document.getElementById('d' + id);
    expButtons[id][0].style.display = 'none';
  }
}
function exp(id){
  var disp = flip[expButtons[id][0].style.display];
  var i = id;
  for (var id in expButtons){expButtons[id][0].style.display = 'none'}
  expButtons[i][0].style.display=disp;
}
function ck(id){
}
window.onload = init;
</script></body></html>





EOT;
?>