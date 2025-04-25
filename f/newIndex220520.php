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


  
  
  
  
  
  
  
  
  
  
  
  
/*
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>New Index</title><style>
body{margin:3em;}

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

*/
ob_flush();

/*
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
//var_export($panels);
*/



/*
  foreach($foods as $code){
    $sortFoods[$sort[$code]] = $code;
  }
  ksort($sortedFoods);
echo  "\nOutout Sorted Foods " . number_format(microtime(true) - $startTime,6) . "\n";
  foreach($sortedFoods as $key => $code){
    echo "$key $code $rast[$code]\n";
  }
  
  





foreach($panels as $pdx => $panel){
  echo "<div style=\"float:left;\">\n";
  echo "<span style=\"color:#f00;\">$panel[0] $panel[1]</span><br>\n";
  foreach($panel[3] as $code => $types){
    echo "$code $types[0]$types[1]$types[2]$types[3] $rast[$code]<br>\n";
  }
  echo "</div>\n";
}
echo "\n<p><br><br></p>\n<div style=\"float:none;\"><hr></div>\n\n";

foreach($panels as $pdx => $panel){
  echo "<div style=\"float:left;\">\n";
  echo "<span style=\"color:#f00;\">$panel[0] $panel[1]</span><br>\n";
  foreach($panel[3] as $code => $types){
    echo "$code $types[0]$types[1]$types[2]$types[3] $rast[$code]<br>\n";
  }
  echo "</div>\n";
}
echo "\n<p><br><br></p>\n<div style=\"float:none;\"><hr></div>\n\n";
exit;



  $tdx = 0;
  $pdx = 105;
  $sql = "SELECT `rec`, `description`,`panel` FROM `clientPanels` WHERE `include` = 1 AND `client` = 888888";
  $result = mysql_query($sql);
  while(list($pRec,$description,$panel) =  mysql_fetch_array($result, MYSQL_NUM)){//echo "$pdx $tdx $code $panel $description\n";
    $pt[$pdx][0] = $panel;
    $pt[$pdx][1] = $description;
    $pt[$pdx][3] = array();
    $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
    $results = mysql_query($sql);
    while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
      $t[$sort[$code]] = array($code,$type);
    }
    ksort($t);
  foreach($t as $key => $test){
      if(substr($code,0,3) == '100'){continue;}
      $type = intval($type);
      $pt[$pdx][3][$code][$type] = 1;
     }
    $tdx = 0;
    foreach($pt[$pdx][3] as $code => $type){
      $pt[$pdx][3][$code] = array(intval($matches[$code]),intval($type[1]),intval($type[2]),intval($type[3]));
    }
    $pdx++;
  }
foreach($pt as $pdx => $panel){
  $pCode = $panel[0]; 
  $pName = $panel[1];
  echo "<h4>$pdx $pCode  $pName</h4><table>\n";
  foreach($panel[3] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . $match[$code][$types[4]] . "<td>" . $rast[$code] . "</td></tr>\n";
  }
  echo "</table>\n\n";
 // ob_flush();
}





echo number_format((microtime(true) - $startTime),3);













echo "</table>\n";

*/





if($sub == 0){$sub = intval($_GET['sub']);}
file_put_contents('food.export',"sub=$sub\n",FILE_APPEND);
$rec = intval($_POST['rec']);



if($rec == 0){$rec = intval($_GET['rec']);}
if($rec == 0){
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><head><title>newIndex</title><style>h1{color:#f00;}</style>
<link rel="preload" as="font" href="/barcode.woff2" type="font/woff2" crossorigin="anonymous">
</head><body>

EOT;

}
$client = intval($_POST['client']);
if($client == 0){$client = intval($_POST['id']);}
if($client == 0){$client = intval($_GET['id']);}
if($client == 0){$client = intval($_GET['c']);}
  $sql = "SELECT `client`,`date`,`last`,`first`,`dob`,`address`,`city`,`state`,`zip`,`gender`,`history`,`foods` FROM `history` WHERE `id` = $rec";
  $results = mysql_query($sql);
  $sqlf .= "\n" . mysql_error();
  list($client,$date,$last,$first,$dob,$address,$city,$state,$zip,$gender,$history,$foods ) = @mysql_fetch_array($results, MYSQL_NUM);  
  $sql = "SELECT `Name`,`passcode`  FROM `Client` WHERE `Number` LIKE '$client' LIMIT 1";
  $results = mysql_query($sql);
  if(mysql_errno() == 0 && mysql_num_rows($results) == 1){
    list($name,$passcode) = mysql_fetch_array($results, MYSQL_NUM);
    if($passcode == $c){$match = true;}
  }
$clientName = "<h3>$client, $name</h3>";
if($sub == 3){include('/home/amx/public_html/f/request.php');exit;}
if($sub == 6){chdir('/home/amx/public_html'); include('/home/amx/public_html/requestForm.php');exit;}
if($sub == 14){chdir('/home/amx/public_html'); include('/home/amx/public_html/h/dashboard.php');exit;}
$action = intval($_POST['action']);
$action = 1;////////////////////////////////////////////
//if($action == 1 && $sub ==0 && $CLIENT == 0){$sub = 32;}

if ($action == 0){$action = intval($_GET['action']);}
$c = strtoupper(trim($_POST['c']));
$match = false; //passcode match
if(strlen($c)== 4){
  $sql = "SELECT `Name`,`passcode`,`Number`  FROM `Client` WHERE `passcode` LIKE '$c' LIMIT 1";
  $results = mysql_query($sql);
  if(mysql_errno() == 0 && mysql_num_rows($results) == 1){
    list($name,$passcode,$client) = mysql_fetch_array($results, MYSQL_NUM);
    if($passcode == $c){$match = true;}
  }
}
elseif($client > 199999 && $client < 1000000){
    if($passcode == $c){$match = true;}
    if($sub == 0 && $match){$sub = 16;}
}
else{
  $client = 0;
}
if($sub == 32){  // Done with History, Save
  $posted = array();
  $posted['time'] = date("F j, Y, g:i a");
  foreach($_POST as $k => $v){
    $type = substr($k,0,1);
    if($type == 'a' && strlen($v) > 0){$animals[] = $v;$posted[$k] = $v;continue;}
    if($type == 'm'){$month[$v] = 'emp';$posted[$k] = $v;continue;}
    if($type != 'c'){continue;}
    $symptomtxt[$categories[$v]] .= $checkbox[$v] . '<br>';
    $category[$categories[$v]] += 1; //$scores[$v];
    $inhalantFood[$inhalantFoods[$v]] += 1;
    $inhalantFoodTxt[$inhalantFoods[$v]] .= "$checkbox[$v]<br>\n";
    $posted[$k] = $v;
  }
  $cnt = count($posted);
  $posted['cnt'] = $cnt;
  $jsn = json_encode($posted);
  $history = mysql_real_escape_string($jsn);
  $sqlf = "UPDATE `history` SET `history`='$history' WHERE `id` = '$rec' ";
  mysql_query($sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysql_error();echo $err;}
  file_put_contents('history.log',"$ip $sqlf\n$err\n$jsn\n\n",FILE_APPEND);
}
if($sub == 0){
  $date = trim(urldecode($_POST['dob']));
  $strdob = preg_replace('/ /','',$date);
  $strdob = preg_replace('/-|\./','/',$strdob);
  $date = strtotime($strdob);
  if($date == 0){
    $strdob = '';
    $dobOK = false;
  }
  else{
    $strdob = date('m/d/Y',strtotime($strdob));
    $dobOK = true;
  }
  $tf = array();
  $tf[true] = 'true';
  $tf[false] = 'false';
  $tf[NULL] = 'null';
  $stateOK = false;
  $lastOK = false;
  if($dobOK === true || $sub == 16){$dobid='';}else{$dobid='id="dob"';}
  $gender = intval($_POST['gender']);
  $first = trim(urldecode($_POST['first']));
  $last = trim(urldecode($_POST['last']));
  if(strlen($last) > 1){$lastOK = true;};
  $address = trim(urldecode($_POST['address']));
  $city = trim(urldecode($_POST['city']));
  $states = array('X'=>false,'AK'=>'AK','AL'=>'AL','AR'=>'AR','AZ'=>'AZ','CA'=>'CA','CO'=>'CO','CT'=>'CT','DC'=>'DC','DE'=>'DE','FL'=>'FL','GA'=>'GA','HI'=>'HI','IA'=>'IA','ID'=>'ID','IL'=>'IL','IN'=>'IN','KS'=>'KS','KY'=>'KY','LA'=>'LA','MA'=>'MA','MD'=>'MD','ME'=>'ME','MI'=>'MI','MN'=>'MN','MO'=>'MO','MS'=>'MS','MT'=>'MT','NC'=>'NC','ND'=>'ND','NE'=>'NE','NH'=>'NH','NJ'=>'NJ','NM'=>'NM','NV'=>'NV','NY'=>'NY','OH'=>'OH','OK'=>'OK','OR'=>'OR','PA'=>'PA','RI'=>'RI','SC'=>'SC','SD'=>'SD','TN'=>'TN','TX'=>'TX','UT'=>'UT','VA'=>'VA','VT'=>'VT','WA'=>'WA','WI'=>'WI','WV'=>'WV','WY'=>'WY');
  $state = $states[strtoupper(trim(urldecode($_POST['state'])))];
//  $zip = intval($_POST['zip']);
//  if($zip > 9999 && $zip < 100000){$zipOK = true;}else{$zipOK = false;}
//  list($zstate) = mysql_fetch_array(mysql_query("SELECT `state` FROM `zip` WHERE `zip` = $zip ORDER BY `longitude` ASC "), MYSQL_NUM);
  if(strlen($state) == 2){
    $stateOK = true;
  //  if($zstate == $state){$stateOK = true;}
  }
}

if($sub == 0 && $match && $gender > 0  && $dobOK && $stateOK && $lastOK){
  $dob = date('Y-m-d',strtotime($strdob));
  $today = date('Y-m-d');
  $time = date('Y-m-d g:i a');
  $sqlf = "INSERT INTO `history` (`id`, `client`, `date`, `last`, `first`, `dob`,`address`,`city`,`state`,`zip`, `gender`) VALUES (NULL, $client, '$today', '$last', '$first', '$dob','$address','$city','$state','$zip', '$gender')";
  mysql_query($sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysql_error();}
  $ndx = intval(mysql_insert_id());
  if($ndx > 0){$rec = $ndx;}
  $err = $sqlf . "\n" . mysql_error();
  file_put_contents('history.log',"$ip $time $err\n\n",FILE_APPEND);

  include('/home/amx/public_html/h/index.php');
  exit;
}
if($sub == 4){  // DOC SELECT TESTS
//████████████████████████████████████████████████████████████████████████████████████████████████████████████
//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
$foods = array();
$sql = "SELECT `foods` FROM `history` WHERE `id` = $rec";
$results = mysql_query($sql);
(list($jsn) =  mysql_fetch_array($results, MYSQL_NUM));
$data = json_decode($jsn,1);foreach($data[0] as $code => $x){$foods[] = $code;}
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysql_query($sql);
$matches = array();
$sort = array();
$rast = array();

while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$sort[] = $code; $rast[$code] = $description; $matches[$code] = 0;}
foreach($foods as $code){$matches[$code] = 1;}
$sort = array_flip($sort);
/*

echo'<pre>';
  $sql = "SELECT `code`, `type`,`rec` FROM `PanelTests` WHERE 1";
  echo "$sql\n";
  $results = mysql_query($sql);
  while(list($code,$type,$rec) =  mysql_fetch_array($results, MYSQL_NUM)){
    $sql = "UPDATE `PanelTests` SET`sort` = $sort[$code] WHERE `rec` = $rec";
	echo "$code, $sql\n";
    $result = mysql_query($sql);
  }

exit;

*/


$amxpanels = array('900' => 'Food, Comprehensive','900-5' => 'Food, Comprehensive IgE','900-6' => 'Food, Comprehensive IgG4','950' => 'Food, Standard','950-3' => 'Food, Standard IgE','950-4' => 'Food, Standard IgG4','950-1' => 'Food, Mini','950-5' => 'Food, Mini IgE','950-6' => 'Food, Mini IgG4','255' => 'IBS','255-2' => 'IBS IgE','255-1' => 'IBS IgG4','253' => 'Hidden Foods ','253-1' => 'Hidden Foods IgE','253-2' => 'Hidden Foods IgG4');
$yn = array('No','Yes');
$pdx = 100;
$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE  `include` = 1 AND `client` = $client";
$result = mysql_query($sql);
while(list($pDescription,$pName) =  mysql_fetch_array($result, MYSQL_NUM)){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$pdx = 200;
foreach($amxpanels as $pName => $pDescription){$pSort[$pdx][$pDescription] = $pName;$pdx++;}
$panelIDs = 'var idPanels = {1:[null,null,null,null],10:[null,null,null,null],20:[null,null,null,null],30:[null,null,null,null],40:[null,null,null,null],';

foreach($pSort as $pdx => $array){
	$panelIDs .= "$pdx:[null,null,null,null],";
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
//  $matching = "$pdx:{";
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
//	$matching .= "'$code',";
  }
  $pmatch = array_sum($pmatches);
//  echo '<pre> matches: ';var_export($matches);
//  echo '<pre> pmatches: ';var_export($pmatches);
 // echo '<pre> typeCount: ';var_export($typeCount);
  $panels[$pdx][3] = array(intval($typeCount[0]),intval($typeCount[1]),intval($typeCount[2]),intval($typeCount[3]),intval($typeCount[5]),intval($pmatch));
  $panels[$pdx][8] = $totalIgE;
//  ksort($sortedFoods);
  $pdx++;
}
//echo '<pre>';var_export($panels);exit;
}


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
//  echo'<pre>';var_export($food);
  ksort($food[1]);
  foreach($food[1] as $code){
   $foodE[] = $code;
  }
  ksort($food[3]);
  foreach($food[3] as $code){
   $foodG[] = $code;
  }
  
//  echo'<pre>';var_export($foodG);var_export($foodE);exit;
  
  foreach($foodE as $key => $code){
    $list .= '

<div class="row"  ><div class="colWidthE">
<div class="dchk"><label class="e chk"><input  type="checkbox" id="c1' . substr($code,1) .  '" class="chk" name="E' . $code . '" value="1" /><span></span></label></div><div class="text">&nbsp;' . $rast[$code] . '</div>  </div>
<div class="colWidthG">
<div class="dchk"><label class="g4 chk"><input  type="checkbox" id="c3' .  substr($foodG[$key],1) . '" class="chk" name="G' . $code .'" value="3" /><span></span></label></div><div class="text">&nbsp;' . $rast[$foodG[$key]] . '</div>
</div></div>';
  }

 


$panelIDs    = substr($panelIDs,0,-1) . "};\n";
$jsort    = substr($jsort,0,-1) . "};\n";






  $checked[$gender] = 'checked="checked"';
  $sex = array('','M','F');
  $patient = "$last, $first $sex[$gender] $age";
  $checked[$gender] = 'checked="checked"';
  
  $sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description`";
 
  $results = mysql_query($sql);
  while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$desc[$code] = $description; $codeSort[] = $code;}
  array_flip($codeSort);
 
  $codesE = file_get_contents('rankIgE.txt');
  $rankedE = explode("\n",$codesE);
  $codesE = array();
  $codesE = array_flip($rankedE);
  $codesG = file_get_contents('rankIgG4.txt');
  $rankedG = explode("\n",$codesG);
  $codesG = array_flip($rankedG);
//  $jsn = '{"F027":64,"F083":157,"F307":169,"F376":82,"F081":156,"F003":134,"F040":148,"F096":50,"F025":63,"F009":90,"F079":83,"F343":124,"F263":71,"F024":129,"F350":162,"F260":171,"F031":97,"F215":145,"F048":138,"F054":158,"F035":101}';
//  $data = json_decode($jsn,1); 
  foreach($foods as $code ){
    $Efoods[$codesE[$code]] = $code;
    $Gfoods[$codesG[$code]] = $code;
  }
  ksort($Efoods);
  $saveEfoods = var_export($Efoods,1);
  ksort($Gfoods);
  $saveGfoods = var_export($Gfoods,1);
 // $foods = array();
  $foods1 = '{';
  $foods3 = '{';
  $e = 'const e = [';
  $g = 'const g = [';
  foreach($Gfoods as $key => $code){
    
    $id = '3' . substr($code,1);
    $sortG[] = $id;
    $g .= "$id,";
    $foods3 .= "$id:[3,null,null,null,null,null],";
    $gcode[] = $code; 
    $gkey[] = "$key";
  }  
  $g .= '];';
  $ndx = 0;
  //// ███████████████████████████████████████████████████████████████████████████████████
  foreach($Efoods as $key => $code){
    $id = '1' . substr($code,1);
    $sortE[] = $id;
    $e .= "$id,";
    $foods1 .= "$id:[1,null,null,null,null,null],";
/*
<div class="row">
<input type="checkbox"  id="c$id"  value="$code" name="E$code" onclick="eck($id)"/><div class="inline">xxx</div>
  <div id="d$id" class="echk" title="1" /> 
    <div id="dc$id" class="descE" onclick="eclick($id)">&#x2002;&#x2002;$key $desc[$code]
	</div>
  </div>&#x2003;
EOT;

$id = $gid[$ndx];
$description = $desc[$gcode[$ndx]];

    $list .= <<<EOT

<div class="row"  >
  <div class="colWidthE">
    <div class="dchk"><label class="e chk"><input  type="checkbox" id="c$id" class="chk" name="E$code" value="1" /><span></span></label></div>
    <div class="inline">&nbsp;$desc[$code]</div>
  </div>
  <div class="colWidthG">
    <div class="dchk"><label class="g chk"><input  type="checkbox" id="c$id" class="chk" name="G$code" value="1" /><span></span></label></div>
    <div class="inline">&nbsp;$key $description</div>
  </div>
</div>
EOT;
$ndx++;
*/
  }
  $e .= '];';
  $foods1 = substr($foods1,0,-1); 
  $foods3 = substr($foods3,0,-1); 
  $Echecks = 'var EcheckBoxes = ' . $foods1 . '}';
  $Gchecks = 'var GcheckBoxes = ' . $foods3 . '}';
 $num = 200;

}

if( $sub == 64){   // PATIENT DONE WITH FOODS, SAVE
  file_put_contents('food.export',"Saving Food\n",FILE_APPEND);
  foreach($_POST as $code => $v){
    if(substr($code,0,1) == 'F'){
      $showE[$code] = $rank[1][$code]; //intval($rank[1][$code]);
      $showG4[$code] = $rank[3][$code]; // intval($rank[3][$code]);
      $ratedCount++;
      $descriptions[$code][1] = 1;
      $matches[$code] = 1;
    }
    elseif($k == 'C'){
      $limit = intval($v);
    }
  }
  
  $save = var_export($showE,TRUE);
  file_put_contents('food.export',"showE: $save\n\n",FILE_APPEND);
  $save = var_export($showG4,TRUE);
  file_put_contents('food.export',"showG4: $save\n\n",FILE_APPEND);
  $food = array();
  $food['time'] = date("F j, Y, g:i a");
  $food['rec'] = $rec;
  $food[0] = $showE;
  $food[1] = $showG4;
  $food[2] = $desc;
  $food[3] = $matches;
  $food['post'] = $_POST;
  $save = var_export($food,TRUE);
  file_put_contents('food.export',"food: $save\n\n",FILE_APPEND);
  $foods = $food;
  $foods['limit'] = $limit;
  $save = var_export($foods,TRUE);
  file_put_contents('food.export',"foods: $save\n\n",FILE_APPEND);
  $today = date('Y-m-d');
  $jsn = json_encode($foods);
  switch (json_last_error()){
    case JSON_ERROR_NONE:$save = ' - No errors';  break;
    case JSON_ERROR_DEPTH:$save = ' - Maximum stack depth exceeded';  break;
    case JSON_ERROR_STATE_MISMATCH:$save = ' - Underflow or the modes mismatch';  break;
    case JSON_ERROR_CTRL_CHAR:$save = ' - Unexpected control character found';  break;
    case JSON_ERROR_SYNTAX:$save = ' - Syntax error, malformed JSON';break;
    case JSON_ERROR_UTF8:$save = ' - Malformed UTF-8 characters, possibly incorrectly encoded';break;
    default:$save = ' - Unknown error';break;
  }


  file_put_contents('food.export',"json error: $save\n\n",FILE_APPEND);
  file_put_contents('food.export',"jsn: $jsn\n\n",FILE_APPEND);
  $jsnFood = json_decode($jsn,1);
  $save = var_export($jsnFood,TRUE);
  file_put_contents('food.export',"jsnArray: $save\n\n",FILE_APPEND);
  $foods = mysql_real_escape_string($jsn);
  $sqlf = "UPDATE `history` SET `foods`='$foods' WHERE `id` = '$rec' ";
  mysql_query($sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysql_error();}
  file_put_contents('food.log',"$ip $sqlf\n$err\n$jsn\n",FILE_APPEND);
  include('/home/amx/public_html/h/dashboard.php');
  exit;
}

$ratedCount = 0;
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><head><title>New Index</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:400 1em Arial,sans-serif;margin:0;color:#000;padding:0;background:#fff; }
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
.dchkXXXXXXX,.dchkXXXXXXX3,.dchkXXXXXXX4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.dchkXXXXXXX{width:100%;max-width:200px;}
.dchkXXXXXXX3{width:31.7%;display:inline-block;}
.dchkXXXXXXX4{width:23.5%;display:inline-block;}
.dchkXXXXXXX,.dchkXXXXXXX3,.dchkXXXXXXX4,.chkXXXXXXX,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}

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



.both{background:#fA4;color:#000;}
.both,.IgE,.IgG4{display:inline-block;font-weight:700;margin:0;border:1px solid #fff;padding:.2em 0 0 .4em;text-align:left;width:70%;}
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


// blue G4 5499c7 
//red E #ec7063,  #e74c3c 

eckbg{inline-block;background:#111;}

.fchk{cursor:pointer;position:relative;text-align:left;background:#2985EA;padding:0;margin:2px;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.echk{cursor:pointer;position:relative;text-align:left;background-color:#e74c3c;background:#e74c3c;   padding:0 0 0 .5em;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#5499c7;   padding:0 0 0 .5em;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.chkXXXXXXX{color:#fff;display:inline;padding:6px 0 6px 6px;outline:2px solid #000;margin:0;}
input[type="radio"],.descE,.descG4{font-size:.9em;width:259px;display:inline-block;font-weight:700;padding: 4.7px 0 6.3px 0;margin: 5px 5px 5px 0;}
.descE{color:#fff;}
.select,.valuebutton{margin:3px 0 0 .2em;border:0;color:#fff;font:700 1em Arial;height:2em;background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);padding:0;display:inline-block;}

.panel,.titlebutton,.typebutton,.select,.valuebutton,.blueLG,.submit{text-align:center;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);} 
.redLG{background: linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%);} 

.typehead,.typebutton,.typebuttonx{width:50px;;font:700 1em Arial;}
.titlehead,.titlebuttonx,.titlebutton{width:250px;font:700 1em Arial;}
.titlehead,.typehead{color:#000;background:#fff;border:0;}
.select{width:148px;}
.titlebuttonx,.typebuttonx{background:#fff;border:0;}
                               //███████████████████████████████████████████████████████████████████

.testRow{margin:0 0 0 40px;padding:0;text-align:left;}
.red,.blue,.yellow{width: 22px;margin:3px;text-align: center;font-size: 0.5em;color: #fff;} 
.blue{background: #00f;}
.red{background: #f00;}
.yellow{background: #ff0;color:#000;}
.testDesc{text-align:left;font-size:.9em;margin-left:40px;}

.submit{color:#fff;width:100%;}
#pnum{width:4em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#fff;}
#pname{width:18em;border:0;margin:0;text-align:left;font:700 1em Arial;background-color:#fff;}
#pigE{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#ff0;}
#pigG4{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#0ff;}
#dob{background:#f00;color:#fff;}
#b1000,#b1001,#b1002,#b1003,#b1004{display:none;}
.alert{background:#f00;color:#fff;}

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
</style></head><body><div id="page"><div id="sub" $sub"></div>$err
EOT;

ob_flush();

//echo "font: <div style=\"font-family:barcode;font-size:2em;\">123456|123456</div>";exit;

/*if($sub == 64){  // PATIENT DONE EXIT
  echo <<<EOT
  $err
<div class="center">
<h4><br>Your diet history has been sent to your doctor's office<br>&#x2003;</h4>
</div></div></body></html>
EOT;
  exit;
}
*/

if($sub == 0){  // NEW PATIENT OR MISSING VALUES
if($match){
  $code='<input type="hidden" name="c" value="' . $c . '"/>';
  $alerts = array(true=>'',false=>'class="alert"',0=>'class="alert"',1=>'',2=>'');
  $gclass = $alerts[$gender];
  $dclass = $alerts[$dobOK];
  $sclass = $alerts[$stateOK];
  $lclass = $alerts[$lastOK];
}
else {
  if(strlen($c) > 0){$class='class="alert"';}
  $code = '<br>Code: <input ' . $class . ' type="text" name="c" value="' . $c . '" />';
}

echo <<<EOT
<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="post">

<form action="#" method="post"><div id="patient">
$code<br>
<br>Last: <br><input $lclass type="text" name="last" value="$last" />
<br>First: <br><input type="text" name="first" value="$first" />
<br><br>DoB: m&thinsp;/&thinsp;d&thinsp;/&thinsp;yyyy&#x2003;<input $dclass $dobid type="text" name="dob" value="$strdob" placeholder="m/d/yyyy" /><br><br>
<div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $checked[1]/>&#x2002;Male </div><br>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $checked[2]/>&#x2002;Female</div><br>
<br><br>Address: <br><input name="address" type="text" value="$address" /><br>
City: <br><input name="city" type="text" value="" /><br>
State: (2 character)<br><input $sclass name="state" type="text" value="$state" />&#x2002;<br>
Zip: <br><input name="zip" type="text" value="$zip" /><br>
<p>&#x2003;<br>Enter Your Name, Date of Birth, Gender, and Address<br>
<p>Then Click Begin</p>
<input type="hidden" name="rec" value="0"/>
<input type="submit" value="Begin" class="btn" />
</div></form></div>
<div id="warn">
<h3 class="red">HIPAA WARNING</h3>
<p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and  § 164
</p><p>Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p>
<p>For site security purposes and to ensure that this service remains available to all authorized users, this computer system employs software programs to monitor network traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.</p>
<p>Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply with its policies and procedures.</p>
</div></div>
EOT;
ob_flush();
exit;
}


if($sub == 32){  // SELECT FOODS NEXT HISTORY
  echo'<div id="col"><form action="#" method="post"><div id="post">';
  $showE = array();
  $showG4 = array();
  $checked = array();
  $today = date('Y-m-d');
  $dob = date('Y-m-d',strtotime($strdob));



echo <<<EOT
<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="msg">
$err
<button id="c10" class="link" type="button" onclick ="exp('10')">Patient Instructions:</button>
<div id="d10">
<p class="bold center red">You must click the "Next" button to post to your physician after making your selections</p>
<p>Click Food Category to expand / contract.</p>
<p>Check off the foods you currently eat <span class="bold">at least three times per week.</span></p>
<p>Complete all Categories</p>
<p>When finished, select the "Next" button.</p></div>
<p class="bold center red"><br>Check ONLY foods you eat AT LEAST THREE TIMES per week.</p>
<button id="b1" class="link" type="button" onclick ="exp('s1')">Meat &amp; Eggs</button>
<div id="s1" class="columns2">

<div id="d027" class="dchk"><input type="checkbox"  id="c027" class="chk" name="F027" value="027" onclick="ck('027')" $checked[027]/>&#x2002;Beef </div>
<div id="d083" class="dchk"><input type="checkbox"  id="c083" class="chk" name="F083" value="083" onclick="ck('083')" $checked[083]/>&#x2002;Chicken</div>
<div id="p206" class="dchk"><input type="checkbox"  id="c106" class="chk" name="F106" value="106" onclick="ck('106')" $checked[106]/>&#x2002;Duck </div>
<div id="d001" class="dchk"><input type="checkbox"  id="c001" class="chk" name="F001" value="001" onclick="ck('001')" $checked[001]/>&#x2002;Egg, White </div>
<div id="d245" class="dchk"><input type="checkbox"  id="c245" class="chk" name="F245" value="245" onclick="ck('245')" $checked[245]/>&#x2002;Egg, Whole </div>
<div id="d075" class="dchk"><input type="checkbox"  id="c075" class="chk" name="F075" value="075" onclick="ck('075')" $checked[075]/>&#x2002;Egg, Yolk </div>
<div id="p258" class="dchk"><input type="checkbox"  id="c158" class="chk" name="F158" value="158" onclick="ck('158')" $checked[158]/>&#x2002;Lamb </div>
<div id="d026" class="dchk"><input type="checkbox"  id="c026" class="chk" name="F026" value="026" onclick="ck('026')" $checked[026]/>&#x2002;Pork</div>
<div id="d416" class="dchk"><input type="checkbox"  id="c416" class="chk" name="F416" value="416" onclick="ck('416')" $checked[416]/>&#x2002;Rabbit</div>
<div id="d284" class="dchk"><input type="checkbox"  id="c284" class="chk" name="F284" value="284" onclick="ck('284')" $checked[284]/>&#x2002;Turkey</div>
<div id="d410" class="dchk"><input type="checkbox"  id="c410" class="chk" name="F410" value="410" onclick="ck('410')" $checked[410]/>&#x2002;Venison</div>

</div><button id="b2" class="link" type="button" onclick ="exp('s2')">Dairy</button><div id="s2" class="columns2">
<div id="d307" class="dchk"><input type="checkbox"  id="c307" class="chk" name="F307" value="307" onclick="ck('307')" $checked[307]/>&#x2002;Cheese, American</div>
<div id="d376" class="dchk"><input type="checkbox"  id="c376" class="chk" name="F376" value="376" onclick="ck('376')" $checked[376]/>&#x2002;Butter</div>
<div id="d081" class="dchk"><input type="checkbox"  id="c081" class="chk" name="F081" value="081" onclick="ck('081')" $checked[081]/>&#x2002;Cheese, Cheddar </div>
<div id="d411" class="dchk"><input type="checkbox"  id="c411" class="chk" name="F411" value="411" onclick="ck('411')" $checked[411]/>&#x2002;Cheese, Goat's </div>
<div id="d379" class="dchk"><input type="checkbox"  id="c379" class="chk" name="F379" value="379" onclick="ck('379')" $checked[379]/>&#x2002;Cheese, Gouda </div>
<div id="d082" class="dchk"><input type="checkbox"  id="c082" class="chk" name="F082" value="082" onclick="ck('082')" $checked[082]/>&#x2002;Cheese, Mold </div>
<div id="d380" class="dchk"><input type="checkbox"  id="c380" class="chk" name="F380" value="380" onclick="ck('380')" $checked[380]/>&#x2002;Cheese, Parmesan</div>
<div id="p217" class="dchk"><input type="checkbox"  id="c117" class="chk" name="F117" value="117" onclick="ck('117')" $checked[117]/>&#x2002;Cheese, Swiss </div>
<div id="d002" class="dchk"><input type="checkbox"  id="c002" class="chk" name="F002" value="002" onclick="ck('002')" $checked[002]/>&#x2002;Milk, Cow's </div>
<div id="d236" class="dchk"><input type="checkbox"  id="c236" class="chk" name="F236" value="236" onclick="ck('236')" $checked[236]/>&#x2002;Milk, Cow's Whey</div>
<div id="p247" class="dchk"><input type="checkbox"  id="c147" class="chk" name="F147" value="147" onclick="ck('147')" $checked[147]/>&#x2002;Milk, Goat's</div>
<div id="d319" class="dchk"><input type="checkbox"  id="c319" class="chk" name="F319" value="319" onclick="ck('319')" $checked[319]/>&#x2002;Yogurt </div>

</div><button id="b3" class="link" type="button" onclick ="exp('s3')">Fish</button><div id="s3" class="columns2">
<div id="d032" class="dchk"><input type="checkbox"  id="c032" class="chk" name="F032" value="032" onclick="ck('032')" $checked[032]/>&#x2002;Anchovy</div>
<div id="p201" class="dchk"><input type="checkbox"  id="c101" class="chk" name="F101" value="101" onclick="ck('101')" $checked[101]/>&#x2002;Bass, Black</div>
<div id="d306" class="dchk"><input type="checkbox"  id="c306" class="chk" name="F306" value="306" onclick="ck('306')" $checked[306]/>&#x2002;Catfish</div>
<div id="d378" class="dchk"><input type="checkbox"  id="c378" class="chk" name="F378" value="378" onclick="ck('378')" $checked[378]/>&#x2002;Carp</div>
<div id="d003" class="dchk"><input type="checkbox"  id="c003" class="chk" name="F003" value="003" onclick="ck('003')" $checked[003]/>&#x2002;Cod</div>
<div id="p207" class="dchk"><input type="checkbox"  id="c107" class="chk" name="F107" value="107" onclick="ck('107')" $checked[107]/>&#x2002;Eel</div>
<div id="d311" class="dchk"><input type="checkbox"  id="c311" class="chk" name="F311" value="311" onclick="ck('311')" $checked[311]/>&#x2002;Flounder</div>
<div id="d312" class="dchk"><input type="checkbox"  id="c312" class="chk" name="F312" value="312" onclick="ck('312')" $checked[312]/>&#x2002;Haddock</div>
<div id="p219" class="dchk"><input type="checkbox"  id="c119" class="chk" name="F119" value="119" onclick="ck('119')" $checked[119]/>&#x2002;Halibut</div>
<div id="p211" class="dchk"><input type="checkbox"  id="c111" class="chk" name="F111" value="111" onclick="ck('111')" $checked[111]/>&#x2002;Mackerel</div>
<div id="d394" class="dchk"><input type="checkbox"  id="c394" class="chk" name="F394" value="394" onclick="ck('394')" $checked[394]/>&#x2002;Octopus</div>
<div id="p220" class="dchk"><input type="checkbox"  id="c120" class="chk" name="F120" value="120" onclick="ck('120')" $checked[120]/>&#x2002;Perch, Lake</div>
<div id="d396" class="dchk"><input type="checkbox"  id="c396" class="chk" name="F396" value="396" onclick="ck('396')" $checked[396]/>&#x2002;Pike</div>
<div id="d041" class="dchk"><input type="checkbox"  id="c041" class="chk" name="F041" value="041" onclick="ck('041')" $checked[041]/>&#x2002;Salmon, Atlantic</div>
<div id="d353" class="dchk"><input type="checkbox"  id="c353" class="chk" name="F353" value="353" onclick="ck('353')" $checked[353]/>&#x2002;Salmon, Pacific</div>
<div id="p223" class="dchk"><input type="checkbox"  id="c123" class="chk" name="F123" value="123" onclick="ck('123')" $checked[123]/>&#x2002;Snapper, Red</div>
<div id="d398" class="dchk"><input type="checkbox"  id="c398" class="chk" name="F398" value="398" onclick="ck('398')" $checked[398]/>&#x2002;Sardine</div>
<div id="d337" class="dchk"><input type="checkbox"  id="c337" class="chk" name="F337" value="337" onclick="ck('337')" $checked[337]/>&#x2002;Sole</div>
<div id="p216" class="dchk"><input type="checkbox"  id="c116" class="chk" name="F116" value="116" onclick="ck('116')" $checked[116]/>&#x2002;Squid </div>
<div id="p218" class="dchk"><input type="checkbox"  id="c118" class="chk" name="F118" value="118" onclick="ck('118')" $checked[118]/>&#x2002;Swordfish</div>
<div id="d361" class="dchk"><input type="checkbox"  id="c361" class="chk" name="F361" value="361" onclick="ck('361')" $checked[361]/>&#x2002;Tilapia</div>
<div id="d204" class="dchk"><input type="checkbox"  id="c204" class="chk" name="F204" value="204" onclick="ck('204')" $checked[204]/>&#x2002;Trout</div>
<div id="d040" class="dchk"><input type="checkbox"  id="c040" class="chk" name="F040" value="040" onclick="ck('040')" $checked[040]/>&#x2002;Tuna</div>
<div id="p221" class="dchk"><input type="checkbox"  id="c121" class="chk" name="F121" value="121" onclick="ck('121')" $checked[121]/>&#x2002;Whitefish</div>

</div><button id="b4" class="link" type="button" onclick ="exp('s4')">Fruit</button><div id="s4" class="columns2">
<div id="d049" class="dchk"><input type="checkbox"  id="c049" class="chk" name="F049" value="049" onclick="ck('049')" $checked[049]/>&#x2002;Apple </div>
<div id="p238" class="dchk"><input type="checkbox"  id="c138" class="chk" name="F138" value="138" onclick="ck('138')" $checked[138]/>&#x2002;Apricot</div>
<div id="f096" class="dchk"><input type="checkbox"  id="cf096" class="chk" name="F096" value="096" onclick="ckf('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="d092" class="dchk"><input type="checkbox"  id="c092" class="chk" name="F092" value="092" onclick="ck('092')" $checked[092]/>&#x2002;Banana </div>
<div id="p239" class="dchk"><input type="checkbox"  id="c139" class="chk" name="F139" value="139" onclick="ck('139')" $checked[139]/>&#x2002;Blackberry</div>
<div id="d288" class="dchk"><input type="checkbox"  id="c288" class="chk" name="F288" value="288" onclick="ck('288')" $checked[288]/>&#x2002;Blueberry </div>
<div id="d305" class="dchk"><input type="checkbox"  id="c305" class="chk" name="F305" value="305" onclick="ck('305')" $checked[305]/>&#x2002;Cantaloupe  </div>
<div id="p200" class="dchk"><input type="checkbox"  id="c100" class="chk" name="F100" value="100" onclick="ck('100')" $checked[100]/>&#x2002;Cherry, Bing</div>
<div id="p204" class="dchk"><input type="checkbox"  id="c104" class="chk" name="F104" value="104" onclick="ck('104')" $checked[104]/>&#x2002;Cranberry  </div>
<div id="p205" class="dchk"><input type="checkbox"  id="c105" class="chk" name="F105" value="105" onclick="ck('105')" $checked[105]/>&#x2002;Date </div>
<div id="d259" class="dchk"><input type="checkbox"  id="c259" class="chk" name="F259" value="259" onclick="ck('259')" $checked[259]/>&#x2002;Grape/Raisin </div>
<div id="d209" class="dchk"><input type="checkbox"  id="c209" class="chk" name="F209" value="209" onclick="ck('209')" $checked[209]/>&#x2002;Grapefruit </div>
<div id="d087" class="dchk"><input type="checkbox"  id="c087" class="chk" name="F087" value="087" onclick="ck('087')" $checked[087]/>&#x2002;Honeydew </div>
<div id="p253" class="dchk"><input type="checkbox"  id="c153" class="chk" name="F153" value="153" onclick="ck('153')" $checked[153]/>&#x2002;Kiwi </div>
<div id="d208" class="dchk"><input type="checkbox"  id="c208" class="chk" name="F208" value="208" onclick="ck('208')" $checked[208]/>&#x2002;Lemon </div>
<div id="p234" class="dchk"><input type="checkbox"  id="c134" class="chk" name="F134" value="134" onclick="ck('134')" $checked[134]/>&#x2002;Lime </div>
<div id="d351" class="dchk"><input type="checkbox"  id="c351" class="chk" name="F351" value="351" onclick="ck('351')" $checked[351]/>&#x2002;Mango</div>
<div id="p232" class="dchk"><input type="checkbox"  id="c132" class="chk" name="F132" value="132" onclick="ck('132')" $checked[132]/>&#x2002;Nectarine</div>
<div id="f124" class="dchk"><input type="checkbox"  id="cf124" class="chk" name="F124" value="124" onclick="ckf('124')" $checked[124]/>&#x2002;Olive, Black </div>
<div id="f342" class="dchk"><input type="checkbox"  id="cf342" class="chk" name="F342" value="342" onclick="ckf('342')" $checked[342]/>&#x2002;Olive, Green</div>
<div id="d033" class="dchk"><input type="checkbox"  id="c033" class="chk" name="F033" value="033" onclick="ck('033')" $checked[033]/>&#x2002;Orange </div>
<div id="p227" class="dchk"><input type="checkbox"  id="c127" class="chk" name="F127" value="127" onclick="ck('127')" $checked[127]/>&#x2002;Papaya </div>
<div id="d095" class="dchk"><input type="checkbox"  id="c095" class="chk" name="F095" value="095" onclick="ck('095')" $checked[095]/>&#x2002;Peach</div>
<div id="d094" class="dchk"><input type="checkbox"  id="c094" class="chk" name="F094" value="094" onclick="ck('094')" $checked[094]/>&#x2002;Pear </div>
<div id="d210" class="dchk"><input type="checkbox"  id="c210" class="chk" name="F210" value="210" onclick="ck('210')" $checked[210]/>&#x2002;Pineapple </div>
<div id="p228" class="dchk"><input type="checkbox"  id="c128" class="chk" name="F128" value="128" onclick="ck('128')" $checked[128]/>&#x2002;Plum/Prune  </div>
<div id="d021" class="dchk"><input type="checkbox"  id="c021" class="chk" name="F021" value="021" onclick="ck('021')" $checked[021]/>&#x2002;Pomegranate  </div>
<div id="p229" class="dchk"><input type="checkbox"  id="c129" class="chk" name="F129" value="129" onclick="ck('129')" $checked[129]/>&#x2002;Raspberry  </div>
<div id="d044" class="dchk"><input type="checkbox"  id="c044" class="chk" name="F044" value="044" onclick="ck('044')" $checked[044]/>&#x2002;Strawberry</div>
<div id="p255" class="dchk"><input type="checkbox"  id="c155" class="chk" name="F155" value="155" onclick="ck('155')" $checked[155]/>&#x2002;Tangerine </div>
<div id="f025" class="dchk"><input type="checkbox"  id="cf025" class="chk" name="F025" value="025" onclick="ckf('025')" $checked[025]/>&#x2002;Tomato </div>
<div id="d404" class="dchk"><input type="checkbox"  id="c404" class="chk" name="F404" value="404" onclick="ck('404')" $checked[404]/>&#x2002;Vinegar, Wine </div>
<div id="d329" class="dchk"><input type="checkbox"  id="c329" class="chk" name="F329" value="329" onclick="ck('329')" $checked[329]/>&#x2002;Watermelon </div>
<div id="d406" class="dchk"><input type="checkbox"  id="c406" class="chk" name="F406" value="406" onclick="ck('406'\)" $checked[406]/>&#x2002;Wine, Red </div>
<div id="d407" class="dchk"><input type="checkbox"  id="c407" class="chk" name="F407" value="407" onclick="ck('407'\)" $checked[407]/>&#x2002;Wine, White </div>
<div id="d408" class="dchk"><input type="checkbox"  id="c408" class="chk" name="F408" value="408" onclick="ck('408'\)" $checked[408]/>&#x2002;Yeast, Wine </div>
   
</div><button id="b5" class="link" type="button" onclick ="exp('s5')">Bread, Cereal, Rice, &amp; Grains</button><div id="s5" class="columns2">
<div id="d006" class="dchk"><input type="checkbox"  id="c006" class="chk" name="F006" value="006" onclick="ck('006')" $checked[006]/>&#x2002;Barley </div>
<div id="d304" class="dchk"><input type="checkbox"  id="c304" class="chk" name="F304" value="304" onclick="ck('304')" $checked[304]/>&#x2002;Bran, Wheat </div>
<div id="p202" class="dchk"><input type="checkbox"  id="c102" class="chk" name="F102" value="102" onclick="ck('102')" $checked[102]/>&#x2002;Buckwheat  </div>
<div id="d008" class="dchk"><input type="checkbox"  id="c008" class="chk" name="F008" value="008" onclick="ck('008')" $checked[008]/>&#x2002;Corn </div>
<div id="p225" class="dchk"><input type="checkbox"  id="c125" class="chk" name="F125" value="125" onclick="ck('125')" $checked[125]/>&#x2002;Hops</div>
<div id="d090" class="dchk"><input type="checkbox"  id="c090" class="chk" name="F090" value="090" onclick="ck('090')" $checked[090]/>&#x2002;Malt</div>
<div id="p257" class="dchk"><input type="checkbox"  id="c157" class="chk" name="F157" value="157" onclick="ck('157')" $checked[157]/>&#x2002;Millet</div>
<div id="d007" class="dchk"><input type="checkbox"  id="c007" class="chk" name="F007" value="007" onclick="ck('007')" $checked[007]/>&#x2002;Oat </div>
<div id="d369" class="dchk"><input type="checkbox"  id="c369" class="chk" name="F369" value="369" onclick="ck('369')" $checked[369]/>&#x2002;Quinoa</div>
<div id="d009" class="dchk"><input type="checkbox"  id="c009" class="chk" name="F009" value="009" onclick="ck('009')" $checked[009]/>&#x2002;Rice</div>
<div id="d005" class="dchk"><input type="checkbox"  id="c005" class="chk" name="F005" value="005" onclick="ck('005')" $checked[005]/>&#x2002;Rye </div>
<div id="p231" class="dchk"><input type="checkbox"  id="c131" class="chk" name="F131" value="131" onclick="ck('131')" $checked[131]/>&#x2002;Tapioca  </div>
<div id="d004" class="dchk"><input type="checkbox"  id="c004" class="chk" name="F004" value="004" onclick="ck('004')" $checked[004]/>&#x2002;Wheat </div>
<div id="d079" class="dchk"><input type="checkbox"  id="c079" class="chk" name="F079" value="079" onclick="ck('079')" $checked[079]/>&#x2002;Wheat, Gluten </div>

</div><button id="b6" class="link" type="button" onclick ="exp('s6')">Yeast</button><div id="s6" class="columns2">
<div id="d318" class="dchk"><input type="checkbox"  id="c318" class="chk" name="F318" value="318" onclick="ck('318')" $checked[318]/>&#x2002;Yeast, Bakers  </div>
<div id="d045" class="dchk"><input type="checkbox"  id="c045" class="chk" name="F045" value="045" onclick="ck('045')" $checked[045]/>&#x2002;Yeast, Brewers</div>

</div><button id="b7" class="link" type="button" onclick ="exp('s7')">Peas, Beans, &amp; Legumes</button><div id="s7" class="columns2">
<div id="d356" class="dchk"><input type="checkbox"  id="c356" class="chk" name="F356" value="356" onclick="ck('356')" $checked[356]/>&#x2002;Bean, Black </div>
<div id="d022" class="dchk"><input type="checkbox"  id="c022" class="chk" name="F022" value="022" onclick="ck('022')" $checked[022]/>&#x2002;Bean, Carob </div>
<div id="d417" class="dchk"><input type="checkbox"  id="c417" class="chk" name="F417" value="417" onclick="ck('417')" $checked[417]/>&#x2002;Bean, Green </div>
<div id="d300" class="dchk"><input type="checkbox"  id="c300" class="chk" name="F300" value="300" onclick="ck('300')" $checked[300]/>&#x2002;Bean, Kidney </div>
<div id="d301" class="dchk"><input type="checkbox"  id="c301" class="chk" name="F301" value="301" onclick="ck('301')" $checked[301]/>&#x2002;Bean, Lima</div>
<div id="d302" class="dchk"><input type="checkbox"  id="c302" class="chk" name="F302" value="302" onclick="ck('302')" $checked[302]/>&#x2002;Bean, Pinto </div>
<div id="d303" class="dchk"><input type="checkbox"  id="c303" class="chk" name="F303" value="303" onclick="ck('303')" $checked[303]/>&#x2002;Bean, Wax String </div>
<div id="d015" class="dchk"><input type="checkbox"  id="c015" class="chk" name="F015" value="015" onclick="ck('015')" $checked[015]/>&#x2002;Bean, White/Navy </div>
<div id="d355" class="dchk"><input type="checkbox"  id="c355" class="chk" name="F355" value="355" onclick="ck('355')" $checked[355]/>&#x2002;Pea, Black-Eyed</div>
<div id="p242" class="dchk"><input type="checkbox"  id="c142" class="chk" name="F142" value="142" onclick="ck('142')" $checked[142]/>&#x2002;Pea, Chick</div>
<div id="d012" class="dchk"><input type="checkbox"  id="c012" class="chk" name="F012" value="012" onclick="ck('012')" $checked[012]/>&#x2002;Pea, Green</div>
<div id="p226" class="dchk"><input type="checkbox"  id="c126" class="chk" name="F126" value="126" onclick="ck('126')" $checked[126]/>&#x2002;Lentil</div>
<div id="d014" class="dchk"><input type="checkbox"  id="c014" class="chk" name="F014" value="014" onclick="ck('014')" $checked[014]/>&#x2002;Soybean </div>

</div><button id="b8" class="link" type="button" onclick ="exp('s8')">Seeds, Spices &amp; Peppers</button><div id="s8" class="columns2">
<div id="d373" class="dchk"><input type="checkbox"  id="c373" class="chk" name="F373" value="373" onclick="ck('373')" $checked[373]/>&#x2002;Allspice</div>
<div id="d374" class="dchk"><input type="checkbox"  id="c374" class="chk" name="F374" value="374" onclick="ck('374')" $checked[374]/>&#x2002;Aniseed</div>
<div id="d343" class="dchk"><input type="checkbox"  id="c343" class="chk" name="F343" value="343" onclick="ck('343')" $checked[343]/>&#x2002;Basil</div>
<div id="d347" class="dchk"><input type="checkbox"  id="c347" class="chk" name="F347" value="347" onclick="ck('347')" $checked[347]/>&#x2002;Bay leaf</div>
<div id="p259" class="dchk"><input type="checkbox"  id="c159" class="chk" name="F159" value="159" onclick="ck('159')" $checked[159]/>&#x2002;Canola Seed </div>
<div id="d023" class="dchk"><input type="checkbox"  id="c023" class="chk" name="F023" value="023" onclick="ck('023')" $checked[023]/>&#x2002;Chives </div>
<div id="d308" class="dchk"><input type="checkbox"  id="c308" class="chk" name="F308" value="308" onclick="ck('308')" $checked[308]/>&#x2002;Cinnamon</div>
<div id="p246" class="dchk"><input type="checkbox"  id="c146" class="chk" name="F146" value="146" onclick="ck('146')" $checked[146]/>&#x2002;Cloves</div>
<div id="d309" class="dchk"><input type="checkbox"  id="c309" class="chk" name="F309" value="309" onclick="ck('309')" $checked[309]/>&#x2002;Cottonseed  </div>
<div id="p240" class="dchk"><input type="checkbox"  id="c140" class="chk" name="F140" value="140" onclick="ck('140')" $checked[140]/>&#x2002;Cumin</div>
<div id="p241" class="dchk"><input type="checkbox"  id="c141" class="chk" name="F141" value="141" onclick="ck('141')" $checked[141]/>&#x2002;Curry powder </div>
<div id="d341" class="dchk"><input type="checkbox"  id="c341" class="chk" name="F341" value="341" onclick="ck('341')" $checked[341]/>&#x2002;Dill</div>
<div id="d382" class="dchk"><input type="checkbox"  id="c382" class="chk" name="F382" value="382" onclick="ck('382')" $checked[382]/>&#x2002;Fennel (Fresh)</div>
<div id="p243" class="dchk"><input type="checkbox"  id="c143" class="chk" name="F143" value="143" onclick="ck('143')" $checked[143]/>&#x2002;Flaxseed</div>
<div id="d345" class="dchk"><input type="checkbox"  id="c345" class="chk" name="F345" value="345" onclick="ck('345')" $checked[345]/>&#x2002;Ginger </div>
<div id="d387" class="dchk"><input type="checkbox"  id="c387" class="chk" name="F387" value="387" onclick="ck('387')" $checked[387]/>&#x2002;Horseradish</div>
<div id="d392" class="dchk"><input type="checkbox"  id="c392" class="chk" name="F392" value="392" onclick="ck('392')" $checked[392]/>&#x2002;Mint</div>
<div id="d089" class="dchk"><input type="checkbox"  id="c089" class="chk" name="F089" value="089" onclick="ck('089')" $checked[089]/>&#x2002;Mustard </div>
<div id="p248" class="dchk"><input type="checkbox"  id="c148" class="chk" name="F148" value="148" onclick="ck('148')" $checked[148]/>&#x2002;Nutmeg</div>
<div id="d283" class="dchk"><input type="checkbox"  id="c283" class="chk" name="F283" value="283" onclick="ck('283')" $checked[283]/>&#x2002;Oregano</div>
<div id="d391" class="dchk"><input type="checkbox"  id="c391" class="chk" name="F391" value="391" onclick="ck('391')" $checked[391]/>&#x2002;Orris Root</div>
<div id="p212" class="dchk"><input type="checkbox"  id="c112" class="chk" name="F112" value="112" onclick="ck('112')" $checked[112]/>&#x2002;Paprika </div>
<div id="p244" class="dchk"><input type="checkbox"  id="c144" class="chk" name="F144" value="144" onclick="ck('144')" $checked[144]/>&#x2002;Parsley </div>
<div id="d263" class="dchk"><input type="checkbox"  id="c263" class="chk" name="F263" value="263" onclick="ck('263')" $checked[263]/>&#x2002;Pepper, Green/Bell </div>
<div id="d313" class="dchk"><input type="checkbox"  id="c313" class="chk" name="F313" value="313" onclick="ck('313')" $checked[313]/>&#x2002;Pepper, Black/White</div>
<div id="d314" class="dchk"><input type="checkbox"  id="c314" class="chk" name="F314" value="314" onclick="ck('314')" $checked[314]/>&#x2002;Pepper, Chili </div>
<div id="d011" class="dchk"><input type="checkbox"  id="c011" class="chk" name="F011" value="011" onclick="ck('011')" $checked[011]/>&#x2002;Pepper, Jalapeno</div>
<div id="p250" class="dchk"><input type="checkbox"  id="c150" class="chk" name="F150" value="150" onclick="ck('150')" $checked[150]/>&#x2002;Pepper, Red </div>
<div id="p237" class="dchk"><input type="checkbox"  id="c137" class="chk" name="F137" value="137" onclick="ck('137')" $checked[137]/>&#x2002;Poppy Seed</div>
<div id="d352" class="dchk"><input type="checkbox"  id="c352" class="chk" name="F352" value="352" onclick="ck('352')" $checked[352]/>&#x2002;Rosemary</div>
<div id="d349" class="dchk"><input type="checkbox"  id="c349" class="chk" name="F349" value="349" onclick="ck('349')" $checked[349]/>&#x2002;Safflower seed</div>
<div id="p251" class="dchk"><input type="checkbox"  id="c151" class="chk" name="F151" value="151" onclick="ck('151')" $checked[151]/>&#x2002;Sage</div>
<div id="d010" class="dchk"><input type="checkbox"  id="c010" class="chk" name="F010" value="010" onclick="ck('010')" $checked[010]/>&#x2002;Sesame Seed</div>
<div id="d316" class="dchk"><input type="checkbox"  id="c316" class="chk" name="F316" value="316" onclick="ck('316')" $checked[316]/>&#x2002;Sunflower Seed </div>
<div id="d340" class="dchk"><input type="checkbox"  id="c340" class="chk" name="F340" value="340" onclick="ck('340')" $checked[340]/>&#x2002;Tea, Black</div>

<div id="d409" class="dchk"><input type="checkbox"  id="c409" class="chk" name="F409" value="409" onclick="ck('409')" $checked[409]/>&#x2002;Tea, Camomile</div>
<div id="p256" class="dchk"><input type="checkbox"  id="c156" class="chk" name="F156" value="156" onclick="ck('156')" $checked[156]/>&#x2002;Thyme</div>
<div id="d016" class="dchk"><input type="checkbox"  id="c016" class="chk" name="F016" value="016" onclick="ck('016')" $checked[016]/>&#x2002;Turmeric</div>

</div><button id="b9" class="link" type="button" onclick ="exp('s9')">Shellfish</button><div id="s9" class="columns2">
<div id="d207" class="dchk"><input type="checkbox"  id="c207" class="chk" name="F207" value="207" onclick="ck('207')" $checked[207]/>&#x2002;Clam</div>
<div id="d310" class="dchk"><input type="checkbox"  id="c310" class="chk" name="F310" value="310" onclick="ck('310')" $checked[310]/>&#x2002;Crab, Blue </div>
<div id="d339" class="dchk"><input type="checkbox"  id="c339" class="chk" name="F339" value="339" onclick="ck('339')" $checked[339]/>&#x2002;Crab, Alaskan </div>
<div id="d354" class="dchk"><input type="checkbox"  id="c354" class="chk" name="F354" value="354" onclick="ck('354')" $checked[354]/>&#x2002;Crab,Dungeness </div>
<div id="d381" class="dchk"><input type="checkbox"  id="c381" class="chk" name="F381" value="381" onclick="ck('381')" $checked[381]/>&#x2002;Crayfish </div>
<div id="d080" class="dchk"><input type="checkbox"  id="c080" class="chk" name="F080" value="080" onclick="ck('080')" $checked[080]/>&#x2002;Lobster, Maine</div>
<div id="p236" class="dchk"><input type="checkbox"  id="c136" class="chk" name="F136" value="136" onclick="ck('136')" $checked[136]/>&#x2002;Lobster, Spiny </div>
<div id="d393" class="dchk"><input type="checkbox"  id="c393" class="chk" name="F393" value="393" onclick="ck('393')" $checked[393]/>&#x2002;Mussel </div>
<div id="d290" class="dchk"><input type="checkbox"  id="c290" class="chk" name="F290" value="290" onclick="ck('290')" $checked[290]/>&#x2002;Oyster </div>
<div id="d338" class="dchk"><input type="checkbox"  id="c338" class="chk" name="F338" value="338" onclick="ck('338')" $checked[338]/>&#x2002;Scallop</div>
<div id="d024" class="dchk"><input type="checkbox"  id="c024" class="chk" name="F024" value="024" onclick="ck('024')" $checked[024]/>&#x2002;Shrimp</div>

</div><button id="b10" class="link" type="button" onclick ="exp('s10')">Sugar</button><div id="s10" class="columns2">
<div id="p245" class="dchk"><input type="checkbox"  id="c145" class="chk" name="F145" value="145" onclick="ck('145')" $checked[145]/>&#x2002;Beet, Sugar</div>
<div id="d247" class="dchk"><input type="checkbox"  id="c247" class="chk" name="F247" value="247" onclick="ck('247')" $checked[247]/>&#x2002;Honey </div>
<div id="d388" class="dchk"><input type="checkbox"  id="c388" class="chk" name="F388" value="388" onclick="ck('388')" $checked[388]/>&#x2002;Maple Syrup </div>
<div id="d350" class="dchk"><input type="checkbox"  id="c350" class="chk" name="F350" value="350" onclick="ck('350')" $checked[350]/>&#x2002;Sugar, Cane</div>

</div><button id="b11" class="link" type="button" onclick ="exp('s11')"> Nuts</button><div id="s11" class="columns2">
<div id="d020" class="dchk"><input type="checkbox"  id="c020" class="chk" name="F020" value="020" onclick="ck('020')" $checked[020]/>&#x2002;Almond </div>
<div id="d018" class="dchk"><input type="checkbox"  id="c018" class="chk" name="F018" value="018" onclick="ck('018')" $checked[018]/>&#x2002;Brazil Nut </div>
<div id="d202" class="dchk"><input type="checkbox"  id="c202" class="chk" name="F202" value="202" onclick="ck('202')" $checked[202]/>&#x2002;Cashew </div>
<div id="p203" class="dchk"><input type="checkbox"  id="c103" class="chk" name="F103" value="103" onclick="ck('103')" $checked[103]/>&#x2002;Chestnut </div>
<div id="d093" class="dchk"><input type="checkbox"  id="c093" class="chk" name="F093" value="093" onclick="ck('093')" $checked[093]/>&#x2002;Chocolate/Cacao</div>
<div id="d036" class="dchk"><input type="checkbox"  id="c036" class="chk" name="F036" value="036" onclick="ck('036')" $checked[036]/>&#x2002;Coconut </div>
<div id="d221" class="dchk"><input type="checkbox"  id="c221" class="chk" name="F221" value="221" onclick="ck('221')" $checked[221]/>&#x2002;Coffee</div>
<div id="d348" class="dchk"><input type="checkbox"  id="c348" class="chk" name="F348" value="348" onclick="ck('348')" $checked[348]/>&#x2002;Cola nut </div>
<div id="d017" class="dchk"><input type="checkbox"  id="c017" class="chk" name="F017" value="017" onclick="ck('017')" $checked[017]/>&#x2002;Hazelnut </div>
<div id="d363" class="dchk"><input type="checkbox"  id="c363" class="chk" name="F363" value="363" onclick="ck('363')" $checked[363]/>&#x2002;Macadamia</div>
<div id="d013" class="dchk"><input type="checkbox"  id="c013" class="chk" name="F013" value="013" onclick="ck('013')" $checked[013]/>&#x2002;Peanut </div>
<div id="d201" class="dchk"><input type="checkbox"  id="c201" class="chk" name="F201" value="201" onclick="ck('201')" $checked[201]/>&#x2002;Pecan</div>
<div id="p214" class="dchk"><input type="checkbox"  id="c114" class="chk" name="F114" value="114" onclick="ck('114')" $checked[114]/>&#x2002;Pine Nut </div>
<div id="d203" class="dchk"><input type="checkbox"  id="c203" class="chk" name="F203" value="203" onclick="ck('203')" $checked[203]/>&#x2002;Pistachio </div>
<div id="p230" class="dchk"><input type="checkbox"  id="c130" class="chk" name="F130" value="130" onclick="ck('130')" $checked[130]/>&#x2002;Vanilla  </div>
<div id="d256" class="dchk"><input type="checkbox"  id="c256" class="chk" name="F256" value="256" onclick="ck('256')" $checked[256]/>&#x2002;Walnut, Black </div>
<div id="d317" class="dchk"><input type="checkbox"  id="c317" class="chk" name="F317" value="317" onclick="ck('317')" $checked[317]/>&#x2002;Walnut, English </div>

</div><button id="b12" class="link" type="button" onclick ="exp('s12')">Vegatables</button><div id="s12" class="columns2">
<div id="p222" class="dchk"><input type="checkbox"  id="c122" class="chk" name="F122" value="122" onclick="ck('122')" $checked[122]/>&#x2002;Artichoke   </div>
<div id="p235" class="dchk"><input type="checkbox"  id="c135" class="chk" name="F135" value="135" onclick="ck('135')" $checked[135]/>&#x2002;Asparagus</div>
<div id="v096" class="dchk"><input type="checkbox"  id="cv096" class="chk" name="F096" value="096" onclick="ckv('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="p252" class="dchk"><input type="checkbox"  id="c152" class="chk" name="F152" value="152" onclick="ck('152')" $checked[152]/>&#x2002;Beet </div>
<div id="d260" class="dchk"><input type="checkbox"  id="c260" class="chk" name="F260" value="260" onclick="ck('260')" $checked[260]/>&#x2002;Broccoli </div>
<div id="p254" class="dchk"><input type="checkbox"  id="c154" class="chk" name="F154" value="154" onclick="ck('154')" $checked[154]/>&#x2002;Brussel Sprouts</div>
<div id="d216" class="dchk"><input type="checkbox"  id="c216" class="chk" name="F216" value="216" onclick="ck('216')" $checked[216]/>&#x2002;Cabbage Mix </div>
<div id="d031" class="dchk"><input type="checkbox"  id="c031" class="chk" name="F031" value="031" onclick="ck('031')" $checked[031]/>&#x2002;Carrot</div>
<div id="d291" class="dchk"><input type="checkbox"  id="c291" class="chk" name="F291" value="291" onclick="ck('291')" $checked[291]/>&#x2002;Cauliflower</div>
<div id="d085" class="dchk"><input type="checkbox"  id="c085" class="chk" name="F085" value="085" onclick="ck('085')" $checked[085]/>&#x2002;Celery</div>
<div id="d030" class="dchk"><input type="checkbox"  id="c030" class="chk" name="F030" value="030" onclick="ck('030')" $checked[030]/>&#x2002;Cilantro</div>
<div id="d244" class="dchk"><input type="checkbox"  id="c244" class="chk" name="F244" value="244" onclick="ck('244')" $checked[244]/>&#x2002;Cucumber</div>
<div id="p208" class="dchk"><input type="checkbox"  id="c108" class="chk" name="F108" value="108" onclick="ck('108')" $checked[108]/>&#x2002;Eggplant  </div>
<div id="d047" class="dchk"><input type="checkbox"  id="c047" class="chk" name="F047" value="047" onclick="ck('047')" $checked[047]/>&#x2002;Garlic </div>
<div id="p233" class="dchk"><input type="checkbox"  id="c133" class="chk" name="F133" value="133" onclick="ck('133')" $checked[133]/>&#x2002;Gelatin </div>
<div id="d370" class="dchk"><input type="checkbox"  id="c370" class="chk" name="F370" value="370" onclick="ck('370')" $checked[370]/>&#x2002;Kale</div>
<div id="d414" class="dchk"><input type="checkbox"  id="c414" class="chk" name="F414" value="414" onclick="ck('414')" $checked[414]/>&#x2002;Leek</div>

<div id="d215" class="dchk"><input type="checkbox"  id="c215" class="chk" name="F215" value="215" onclick="ck('215')" $checked[215]/>&#x2002;Lettuce</div>
<div id="d212" class="dchk"><input type="checkbox"  id="c212" class="chk" name="F212" value="212" onclick="ck('212')" $checked[212]/>&#x2002;Mushroom</div>
<div id="d028" class="dchk"><input type="checkbox"  id="c028" class="chk" name="F028" value="028" onclick="ck('028')" $checked[028]/>&#x2002;Okra</div>

<div id="v124" class="dchk"><input type="checkbox"  id="cv124" class="chk" name="F124" value="124" onclick="ckv('124')" $checked[124]/>&#x2002;Olive, Black </div>
<div id="v342" class="dchk"><input type="checkbox"  id="cv342" class="chk" name="F342" value="342" onclick="ckv('342')" $checked[342]/>&#x2002;Olive, Green</div>

<div id="d048" class="dchk"><input type="checkbox"  id="c048" class="chk" name="F048" value="048" onclick="ck('048')" $checked[048]/>&#x2002;Onion </div>
<div id="d054" class="dchk"><input type="checkbox"  id="c054" class="chk" name="F054" value="054" onclick="ck('054')" $checked[054]/>&#x2002;Potato, Sweet</div>
<div id="d035" class="dchk"><input type="checkbox"  id="c035" class="chk" name="F035" value="035" onclick="ck('035')" $checked[035]/>&#x2002;Potato, White</div>
<div id="p215" class="dchk"><input type="checkbox"  id="c115" class="chk" name="F115" value="115" onclick="ck('115')" $checked[115]/>&#x2002;Pumpkin  </div>
<div id="p249" class="dchk"><input type="checkbox"  id="c149" class="chk" name="F149" value="149" onclick="ck('149')" $checked[149]/>&#x2002;Radish</div>
<div id="d415" class="dchk"><input type="checkbox"  id="c415" class="chk" name="F415" value="415" onclick="ck('415')" $checked[415]/>&#x2002;Rhubarb</div>
<div id="d214" class="dchk"><input type="checkbox"  id="c214" class="chk" name="F214" value="214" onclick="ck('214')" $checked[214]/>&#x2002;Spinach </div>
<div id="d346" class="dchk"><input type="checkbox"  id="c346" class="chk" name="F346" value="346" onclick="ck('346')" $checked[346]/>&#x2002;Squash, Yellow </div>
<div id="d344" class="dchk"><input type="checkbox"  id="c344" class="chk" name="F344" value="344" onclick="ck('344')" $checked[344]/>&#x2002;Squash, Zucchini</div>
<div id="v025" class="dchk"><input type="checkbox"  id="cv025" class="chk" name="F025" value="025" onclick="ckv('025')" $checked[025]/>&#x2002;Tomato </div>
</div>

<input type="hidden" name="sub" value="64" />
<input type="hidden" name="rec" value="$rec" />
<input type="submit" value="Next" class="btn" /></div></form>

</div>
EOT;

ob_flush();
}
if($sub == 4){        // DOCS SELECT TESTS ███████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████


  $ratedCount = 0;
 // $matches = array();
  $s14 = 'block';
    $sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `Code`";  
    $results = mysql_query($sql);
    while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){
        //$desc[$code] = $description;

    }
/*
//    $rank = unserialize(file_get_contents('/home/amx/public_html/rank.ser'));
  //  $rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
  //  $rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);

$rankTxt = file_get_contents('rankIgE.txt');
$rankIgX = explode("\n",$rankTxt);
foreach($rankIgX as $v => $k){
    $v++;
    $rank[1][$k] = $v;
}
//var_export($rank[1]);

$rankTxt = file_get_contents('rankIgG4.txt');
$rankIgX = explode("\n",$rankTxt);
foreach($rankIgX as $v => $k){
    $rank[3][$k] = ++$v;
}
*/
  
/*  if($sub == 2){
    foreach($_POST as $code => $v){
      if(substr($code,0,1) == 'F'){
        $showE[$code] = $rank[1][$code]; //intval($rank[1][$code]);
        $showG4[$code] = $rank[3][$code]; // intval($rank[3][$code]);
        $ratedCount++;
        $descriptions[$code][1] = 1;
        $matches[$code] = 1;
      }
      elseif($k == 'C'){
        $limit = intval($v);
      }
    }
    $food[0] = $showE;
    $food[1] = $showG4;
    $food[2] = $desc;
    $food[3] = $matches;
    $food[4] = $_POST;
    $foods = $food;

    $foods['limit'] = $limit;
    $fp = fopen($client . 'food.jsn','w');
    $jsn = mysql_real_escape_string(json_encode($foods));
    fwrite($fp,$jsn);
  }
*/

$startTime = microtime(true);
$strdob = date('m/d/Y',strtotime($dob));
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
<button id="c10" class="link" type="button" onclick ="expb('10')">$patient</button><br>
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

EOT;
  $rated = array();
  $js = 'var Rated = {';
  $Checks = 'var Checks = {';
  $icon = array('tblankx','plus');
  $jsort =  "var checkBoxes = {10:['none',null,null,false,false,false,false,false,false,false],20:['none',null,null,false,false,false,false,false,false,false],30:['none',null,null,false,false,false,false,false,false,false],40:['none',null,null,false,false,false,false,false,false,false]";
}
/*
//███████████████████████████████████████████████████████████████████████████████████████████████████████
$pdx = 105;
$ndx = 0;
$types = array('','IgE','IgG','IgG4');
$jspc = "var panelCodes = {10:[null,null],20:[null,null],30:[null,null],";
$cpanels = array();
$sql = "SELECT `rec`, `description`,`panel` FROM `clientPanels` WHERE `include` = 1 AND `client` = $client";
$result = mysql_query($sql);
$cnt = 0;
while(list($pRec,$description,$panel) =  mysql_fetch_array($results, MYSQL_NUM)){
  $cnt++;
  $cpanels[$pdx][0] = $panel;
  $cpanels[$pdx][1] = $description;
  $TestTypeCount = array(0,0,0,0,0,0,0,0,0);
  $codes = '';
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
  $results = mysql_query($sql);
  $hits = 0;
  $cp = array();
  while(list($code,$type) =  mysql_fetch_array($result, MYSQL_NUM)){
    $jsort .= "$pdx:[0,null,null,false,false,false,false],";
    $cpanels[$pdx][3][$codeSort[$code]] = $code;
    $cpanels[$pdx][4][$code][$type] = 1;
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$pdx][$code] = array($desc[$code],intval($tests[$pdx][$code][1]) + pow(2,$type));}
    $TestTypeCount[$type]++;
    $hits++;
    $c = intval($type . substr($code,1));
    if($rated[$c]){
      $codes .=  "$c,";
    }
  }
  $panels[0][$pdx] =array("$panel $description","$TestTypeCount[1]","$TestTypeCount[3]",$hits,$panel);
  $codes = substr($codes,0,-1) . ']';
  $jspc .= "$pdx:[null,null],";
  $pdx++;
}

$cfp = '';
if($cnt > 0){
  $cfp = 'Custom Food Panels';
}
//  $panels[$pdx][1] = $pName;
//  $panels[$pdx][2] = $pDescription;
*/

/*
$p100 = $panels[100][2];
$p101 = $panels[101][2];
$p102 = $panels[102][2];
$p103 = $panels[103][2];
$p104 = $panels[104][2];
echo <<<EOT
<div class="col"><div class="col">
<button id="c20" class="link" type="button" onclick ="exp(20)">Panels</button>
<div id="d20" class="expand">
<table><tr><td><button type="button" class="titlehead">IgE and IgG4</button></td><td><button type="button" class="typehead">Only</button></td><td><button type="button" class="typehead">Only</button></td><td></td><td><button class="titlehead">$cfp</button></td></tr>
<tr>
<td><div id="p200"></div><button id="b200" type="button" class="titlebutton" onclick="showPanel('200')">Comprehensive</button></td>
<td><div id="p201"></div><button id="b201" type="button" class="typebutton"  onclick="showPanel('201')">IgE</button></td>
<td><div id="p202"></div><button id="b202" type="button" class="typebutton"  onclick="showPanel('202')">IgG4</button></td>
<td>&#x2003;</td>
<td><div id="p100" class="titlebutton" onclick="showPanel('100')">$p100</div></td>
</tr>
<tr>
<td><div id="p203"></div><button id="b203" type="button" class="titlebutton" onclick="showPanel('203')">Standard</button></td>
<td><div id="p204"></div><button id="b204" type="button" class="typebutton"  onclick="showPanel('204')">IgE</button></td>
<td><div id="p205"></div><button id="b205" type="button" class="typebutton"  onclick="showPanel('205')">IgG4</button></td>
<td>&#x2003;</td>
<td><div id="p101" class="titlebutton" onclick="showPanel('101')">$p101</div></td>
</tr>
<tr>
<td><div id="p206"></div><button id="b206" type="button" class="titlebutton" onclick="showPanel('206')">Mini</button></td>
<td><div id="p207"></div><button id="b207" type="button" class="typebutton"  onclick="showPanel('207')">IgE</button></td>
<td><div id="p208"></div><button id="b208" type="button" class="typebutton"  onclick="showPanel('208')">IgG4</button></td>
<td>&#x2003;</td>
<td><div id="p102" class="titlebutton" onclick="showPanel('102')">$p102</div></td>
</tr>
<tr>
<td><div id="p209"></div><button id="b209" type="button" class="titlebutton" onclick="showPanel('209')">IBS</button></td>
<td><div id="p210"></div><button id="b210" type="button" class="typebutton"  onclick="showPanel('210')">IgE</button></td>
<td><div id="p211"></div><button id="b211" type="button" class="typebutton"  onclick="showPanel('211')">IgG4</button></td>
<td>&#x2003;</td>
<td><div id="p103" class="titlebutton" onclick="showPanel('103')">$p103</div></td>
</tr>
<tr>
<td><div id="p212"></div><button id="b212" type="button" class="titlebutton" onclick="showPanel('212')">Hidden Foods</button></td>
<td><div id="p213"></div><button id="b213" type="button" class="typebutton" onclick="showPanel('213')">IgE</button></td>
<td><div id="p214"></div><button id="b214" type="button" class="typebutton" onclick="showPanel('214')">IgG4</button></td>
<td>&#x2003;</td>
<td><div id="p104" class="titlebutton" onclick="showPanel('104')">$p104</div></td>
</tr>
EOT;
$cnt = count($cp) - 5;
$pdx = 105;
while($cnt > 0){
  $cnt--;
  echo <<<EOT
<td><button type="button" class="titlebuttonx"></button></td>
<td><button type="button" class="typebuttonx" "></button></td>
<td><button type="button" class="typebuttonx" ></button></td>
<td>&#x2003;</td>
<td><button id="b$pdx" type="button" class="titlebutton" onclick="showPanel('$pdx')">$desc[$pdx]</button></td>
</tr>

EOT;
  $pdx++;
}

  echo <<<EOT
</table>

<button id="pname"></button>
<button id="pigE"></button>
<button id="pigG4"></button>
EOT;
ob_flush();
*/
echo <<<EOT
<button id="c20" class="link" type="button" onclick ="expb('20')">Your Panels</button><div id="d20"></div><div id="e20" class="expand">

EOT;

/*
$pdx = 200;
$ndx = 0;
$fp = fopen("/home/amx/public_html/f/amxpanels.txt", "r");
while (($text= fgets($fp , 72)) !== false) {
  $ndx++;
  if($ndx > 30){break;}
  $panel = trim(substr($text,0,5));
  $description = trim(substr($text,8,128));
  $TestTypeCount = array(0,0,0,0,0,0,0);
  $codes = '';
  $show = "$panel: $text\n";
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
  $results = mysql_query($sql);
  $hits = 0;
  $tdx = 0;
  while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$pdx][$code] = array($desc[$code],intval($tests[$pdx][$code][1]) + pow(2,$type));}
    $TestTypeCount[$type]++;
    $hits++;
    $c = intval($type . substr($code,1));
    if($rated[$c]){
      $codes .= "$c,";
    }
    $tdx++;
  }
  $panels[1][$pdx] = array($description,"$TestTypeCount[1]","$TestTypeCount[3]",$hits,$panel);
  $codes = substr($codes,0,-1) . ']';
  $pdx++;
  $savePanels = var_export($panels,1);
  
}
*/





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
  echo "<div><input id=\"c$pdx\" type=\"checkbox\"  />&#x2003;<div class=\"pname\"  onclick =\"exp('$pdx')\"><div class=\"click\" >$panel[2]&#x2003;</div></div><div class=\"matches\">$matches</div><div class=\"countIgE\"> $countIgE</div><div class=\"countIgG4\"> $countIgG4</div><div class=\"countIgG\"> $countIgG</div><div class=\"countTests\">$countTests</div></div>" . $TIgE[$panels[$pdx][6]] . "\n<div id=\"e$pdx\" class=\"pexp\"><table>\n";
  foreach($panel[4] as $code => $types){
    echo $typeE[$types[1]] . $typeG4[$types[3]] . $typeG[$types[2]] . $match[$types[0]] . "<td class=\"ptext\">$rast[$code]</td></tr>\n";
  }
  echo "</table>\n</div>\n";
}











/*
$ndx = 0;
$panelTitle = array('<h3>Your Custom Food Panels</h3>','<h3>Allermetrix Food Panels</h3>');
$panelType = array('C','P');
ksort($panels);
$savType = 0;
$matches = $food[3];
$idPanels = 'var idPanels = {10:[null,null],20:[null,null],30:[null,null],';

foreach($panels as $type => $array){
  echo $panelTitle[$type] ;
  foreach($array as $pRec => $v){
    $title = $panels[$type][$pRec][0];
    $cntE = $panels[$type][$pRec][1];
    $cntG4 = $panels[$type][$pRec][2];
    $panel = $panels[$type][$pRec][4];
    $idPanels .= "$pRec:['none',null],";
    $jscp .=  "$pRec:[null,null],";
    echo <<<EOT

<div  class="pchk" >
  <input type="checkbox"  id="c$panel[$pdx]" class="chk" name="$panelType[$type]$type$panel" value="$panel" />
  <div class="inline" onclick="exp('$pRec')">
    <div class="panel">&#x2002;$v[0]
    </div>
  </div>  
</div>  
EOT;


   if(count($tests[$pRec]) > 0){
     asort($tests[$pRec]);
     echo "<div id=\"d$pRec\" class=\"expand\" style=\"padding-left:2.5em;\">\n";
     echo '<table>';
      foreach($tests[$pRec] as $code => $array){
        list($description,$class) = $array;
        $match = $icon[$matches[$code]];
        $match = 'tblankx';                            //  calculate matches and remove
        $description = $array[0];
        $c = substr($code,1);
        $boxType = $testType[$pdx][$code];
        echo $typeE[$boxType[1]] . $typeG4[$boxType[3]] . $typeG[$boxType[2]] . "<td class=\"testDesc\">&#x2002;$showType[1]$showType[3]$showType[2]$description</td></tr>";
      }
      echo "</table><div class=\"row\"><div class=\"plus\"></div> Patient Selected &#x2003;<div class=\"tblank\"></div> Not Selected</div></div>\n";
    }
    else{
      echo "<div id=\"EXP$panel\" class=\"expand\">No Tests Found </div>\n";
    }
  }
}//████████████████████████████████████████████████████████████████████████████████████████████████████
*/
$jsort = substr($jsort,0,-1) . "};\n";
$jspc = substr($jspc,0,-1) . "};\n";
$js = substr($js,0,-1) . "};\n";
$idPanels = substr($idPanels,0,-1) . "};\n";
echo <<<EOT
</div><br><hr><br><div id="checkboxes">
<button id="c003" type="button" class="select" name="C" value="15" onclick="showtop(15)" >&#x2002;
Top 15</button>
<button id="c010" type="button" class="select" name="C" value="20" onclick="showtop(20)" >&#x2002;
Top 20</button>
<button id="c004" type="button" class="select" name="C" value="30" onclick="showtop(30)">&#x2002;
Top 30</button>
<button id="c005" type="button" class="select" name="C" value="40" onclick="showtop(40)">&#x2002;
Top 40</button><br>
<button id="c007" type="button" class="select" name="C" value="999" onclick="clearAll(true,0)">&#x2002;
Select All</button>
<button id="c006" type="button" class="select" name="C" value="0" onclick="clearAll(false,0)" >&#x2002;
Clear All</button>
<button id="c008" type="button" class="select" name="C" value="999" onclick="clearAll(false,1)" >&#x2002;
Clear IgE</button>
<button id="c009" type="button" class="select" name="C" value="999" onclick="clearAll(false,3)" >&#x2002;
Clear IgG4</button>
<div class="ige">IgE</div><div class="igg">IgG4</div>
$list
<br>

<hr>
<input type="submit" value="Create Request Form" class="submit" />
</div></form></div></div></div>
<div id="e1" ></div>
EOT;
ob_flush();
if($ip == '70.171.18.10'){echo "<pre>. $show</pre> ";}


  

  

/*




array (
  49 => 'F096',
  62 => 'F025',
  63 => 'F027',
  70 => 'F263',
  81 => 'F376',
  82 => 'F079',
  89 => 'F009',
  96 => 'F031',
  100 => 'F035',
  123 => 'F343',
  128 => 'F024',
  133 => 'F003',
  137 => 'F048',
  144 => 'F215',
  147 => 'F040',
  155 => 'F081',
  156 => 'F083',
  157 => 'F054',
  161 => 'F350',
  168 => 'F307',
  170 => 'F260',
)array (
  12 => 'F096',
  20 => 'F079',
  21 => 'F376',
  34 => 'F081',
  51 => 'F263',
  52 => 'F025',
  61 => 'F350',
  69 => 'F027',
  72 => 'F307',
  87 => 'F083',
  98 => 'F215',
  109 => 'F048',
  112 => 'F343',
  118 => 'F009',
  124 => 'F035',
  130 => 'F031',
  131 => 'F024',
  134 => 'F040',
  137 => 'F054',
  143 => 'F003',
  144 => 'F260',
)
*/
echo <<<EOT
<script> 
//▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
//$idPanels
$panelIDs
console.log('idPanels');
console.log(idPanels);

var bg = {1:[false,true],10:[false,true],3:[false,true],30:[false,true]};console.log('bg');


var panelCodes = {999:[null,false,false,false,false]};
var checkObj = {1329:[null,null,null,null]};

$e
$Echecks
$g
$Gchecks
console.log('GcheckBoxes');
console.log(GcheckBoxes);


var checkObj = {1329:[null,null,null,null]};

var ip = '$ip';
var prev = 1;
var prior = 1;
var previousPanel = 200;
var div=0;
var disp = '';
var show = '';
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';

var id = 0;
var c = {};
var d = {};
var b = new Array;
var p = new Array;

var idType = 0;
toggle = {};
toggle[true] = false;
toggle[false] = true;
var panelButtons = {};
var idTypes = 0;
var pnum = document.getElementById('pnum');
var pname = document.getElementById('pname');
var pigE = document.getElementById('pigE');
var pigG4 = document.getElementById('pigG4');


var panelBackground = [];
panelBackground[false]  = 'linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%)';
panelBackground[true]   = 'linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%)';






// blue G4 5499c7 
//red E #ec7063,  #e74c3c,  #cb4335  
var ratedCount = 0
var checkBoxBackground = {1:['#cb4335'],3:['#5499c7']};
var checkBoxBorderColor = {1:['#cb4335','#fff'],3:['#5499c7','#fff']};

//1:[false,true]
//3:[false,true]
//10:[false,true]
//30:[false,true]

//checkBoxes[id][1] object for border of checkbox (red when checked yellow when not
//checkBoxes[id][2] object for the actual input[checkbox]
//checkBoxes[id][3] object for checkbox text background
function init(){//███████████████████████████████████████████████████████████████████████████████████████████████████████████████████
var id = 0;
  for (var id in EcheckBoxes){
  //  EcheckBoxes[id][1] = document.getElementById('d' + id);
     EcheckBoxes[id][2] = document.getElementById('c' + id);
  //  EcheckBoxes[id][3] = document.getElementById('dc' + id);
    EcheckBoxes[id][2].checked = false;
 //   EcheckBoxes[id][1].style.background = checkBoxBorderColor[1][0];
 //   EcheckBoxes[id][3].style.background = checkBoxBorderColor[1][0];
  }
  for (var id in GcheckBoxes){
  //  GcheckBoxes[id][1] = document.getElementById('d' + id);
    GcheckBoxes[id][2] = document.getElementById('c' + id);
  //  GcheckBoxes[id][3] = document.getElementById('dc' + id);
    GcheckBoxes[id][2].checked = false;
  //  GcheckBoxes[id][1].style.background = checkBoxBorderColor[3][0];
  //  GcheckBoxes[id][3].style.background = checkBoxBorderColor[3][0];
  }
  for (var id in idPanels){
    //idPanels[id][1] = document.getElementById('c' + id);
	
    idPanels[id][2] = document.getElementById('e' + id);
    idPanels[id][2].style.display = 'none';
  }
  console.log('idPanels');
  console.log(idPanels);
}
function eck(id){
  EcheckBoxes[id][1].style.background = checkBoxBorderColor[EcheckBoxes[id][0]][Number(EcheckBoxes[id][2].checked)];
  var cls = EcheckBoxes[id][1].className;
  console.log('cls=' + cls);
}
function gck(id){
  GcheckBoxes[id][1].style.background = checkBoxBorderColor[GcheckBoxes[id][0]][Number(GcheckBoxes[id][2].checked)];
}

function eclick(id){
  EcheckBoxes[id][2].checked = toggle[EcheckBoxes[id][2].checked];
  eck(id);

}
function gclick(id){
  GcheckBoxes[id][2].checked = toggle[GcheckBoxes[id][2].checked];
  gck(id);
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
function clickit(id){
 // if(!Rated[id][1].disabled){
 //   Rated[id][1].checked=toggle[Rated[id][1].checked];
    ck(id);
//  }
}
//                            ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
function showtop(cnt){cnt -=2;
  for (var ndx in e){id = e[ndx];
    EcheckBoxes[id][2].checked = true;
  //  EcheckBoxes[id][3].style.background = checkBoxBackground[1];
  //  EcheckBoxes[id][1].style.background = checkBoxBackground[1];
 //   EcheckBoxes[id][1].style.background = checkBoxBorderColor[1][0];
  //  EcheckBoxes[id][1].style.background =  checkBoxBorderColor[1][1];    
    if(ndx > cnt){break;}
  }   
  for (var ndx in g){id = g[ndx];
 //   if(GcheckBoxes[id][2].disabled){ndx++;continue;}
    GcheckBoxes[id][2].checked = true;
  ////  GcheckBoxes[id][3].style.background = checkBoxBackground[GcheckBoxes[id][3]];
  //  GcheckBoxes[id][1].style.background = checkBoxBackground[GcheckBoxes[id][3]];
  //  GcheckBoxes[id][1].style.background = checkBoxBorderColor[3][0];
  //  GcheckBoxes[id][1].style.background =  checkBoxBorderColor[3][1];
    if(ndx > cnt){break;}
  }


  
  return;
  
  
  var ndx = 0;
  for (var id in GcheckBoxes){
    for (var id=0; id<GcheckBoxes.length; div++){
     if(GcheckBoxes[id][1].disabled){ndx++;continue;}
       if(ndx < cnt){
         GcheckBoxes[id][0].style.background=bg[true][idType];
         GcheckBoxes[id][1].checked=true;
         GcheckBoxes[id][1].disabled=false;
         GcheckBoxes[id][1].style.opacity=1;
      }
      else{
        GcheckBoxes[id][0].style.backgroundColor=bg[false][idType];
        GcheckBoxes[id][1].checked=false;
        GcheckBoxes[id][1].disabled=false;
        GcheckBoxes[id][1].style.opacity=1;
      }
      ndx++;
      if(ndx > cnt){return;}
    }
  }
 ratedCount = cnt;
 // C.style.backgroundColor=bg[false][idType];
}
function showPanel(id){//◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙◙
  var check = idPanels[id][1].checked;
  idPanels[previousPanel][1].style.background = panelBackground[true];
  idPanels[previousPanel][1].checked = false;
  idPanels[id][1].checked = toggle[check];
  idPanels[id][1].style.background = panelBackground[idPanels[id][1].checked];
  previousPanel = id;
 // pck(id);

}

function pck(id){
  var checked = idPanels[id][1].checked;
  idPanels[id][1].style.backgroundColor=bg[checked];
//  for (var r in Rated){
//    Rated[r][0].style.backgroundColor=bg[false];
//    Rated[r][1].checked=false;
//    Rated[r][1].disabled=false;
//    Rated[r][1].style.opacity=1;
//  }
  for (var r in idPanels){
    idPanels[r][3].style.backgroundColor = '#006';
    idPanels[r][0].style.backgroundColor = bg[false];
    idPanels[r][1].checked = false;
  } 
  if(checked){
    idPanels[id][1].style.backgroundColor = '#f00';
    pname.innerHTML = idPanels[id][4];
    pigE.innerHTML = idPanels[id][5];
    pigG4.innerHTML = idPanels[id][6];
   // for (var div=0; div<panelCodes[id].length; div++){
   //   Rated[panelCodes[id][div]][0].style.backgroundColor=bg[Rated[panelCodes[id][div]][0].title];
   //   Rated[panelCodes[id][div]][1].disabled=true;
    //  Rated[panelCodes[id][div]][1].checked=true;
   //   Rated[panelCodes[id][div]][1].style.opacity=1;
    //  Rated[panelCodes[id][div]][1].style.backgroundColor=bg[Rated[panelCodes[id][div]][0].title];
   // }
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
}                      //▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲








window.onload = init;
</script>
EOT;
/*

  idPanels[10][2] = document.getElementById('e10');
  idPanels [10][2].style.display = 'none';
  idPanels[30][2] = document.getElementById('e20');
  idPanels [30][2].style.display = 'none';
  console.log('checkBoxes after init');
  console.log(EcheckBoxes);
  console.log(GcheckBoxes);
  console.log(idPanels);
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


function cb(id){
  div = document.getElementById(id);
  div.style.backgroundColor=bg[div.checked][idType];
}

function radio(on,off){
  document.getElementById('d' + on).style.backgroundColor=bg[true][idType];
  document.getElementById('d' + off).style.backgroundColor=bg[false][idType];
}


function swap(){
  var req = document.getElementById('s18');
  var panel = document.getElementById('s15');
  panel.style.display = flip[panel.style.display];
  req.style.display = flip[req.style.display];
  var btn = document.getElementById('b15');
  if(btn.innerHTML == 'Get Request Form'){
    btn.innerHTML = 'Get Food Panels';
  }
  else{
    btn.innerHTML = 'Get Request Form';
  }
}

EOT;
*/

if($sub == 9999){  //  DOCS SELECT TESTS
//if($sub == 4){  //  DOCS SELECT TESTS

echo <<<EOT

function pck(id){console.log('pck' + id);
  var checked = checkBoxes[id][1].checked;
  checkBoxes[id][0].style.backgroundColor=bg[checked][idType];
  checkBoxes[id][3].style.backgroundColor=bg[checked][idType];
  for (var r in checkBoxes){
    checkBoxes[r][0].style.backgroundColor=bg[false][idType];
    checkBoxes[r][4].checked=false;
    checkBoxes[r][4].disabled=false;
  }
  for (var r in checkBoxes){
    if (document.getElementById('b' + r) == null){continue;}
    checkBoxes[r][3].style.backgroundColor = '#006';
    checkBoxes[r][0].style.backgroundColor = bg[false][idType];
    checkBoxes[r][1].checked = false;
  } 
  if(checked){
    checkBoxes[id][3].style.backgroundColor = '#f00';
    for (var div=0; div<panelCodes[id].length; div++){
      checkBoxes[div][0].style.backgroundColor=bg[checkObj[panelCodes[id][div]][0].title][idType];
      checkBoxes[div][3].checked=true;
      checkBoxes[div][3].style.backgroundColor=bg[checkObj[panelCodes[id][div]][0].title][idType];
    }
    var y=foods.offsetTop;
    window.scrollTo(0, y);
  }
  else{
    pname.innerHTML = '';
    pigE.innerHTML = '';
    pigG4.innerHTML = '';
  }
  checkBoxes[id][1].checked=checked;
  checkBoxes[id][0].style.backgroundColor=bg[checked][idType];
}


function ck2(id){
  idType = id.substring(0,1);
  f[id].style.backgroundColor=bg[cf[id].checked][idType];
  v[id].style.backgroundColor=bg[cv[id].checked][idType];
}


//  ▓  178
//  ▒  177
//  ░  176
//  █  219
//  ♦    4
//  •    7
//  ■  254
//  … 0201
//  ∙  249
//  °  248
//  ═  205
//  ─   22
//  ▬  196 
//  ◙   10
//  ▲   30

function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
function showPanel(id){//███████████████████████████████████
  var check = checkBoxes[id][2].checked;
  checkBoxes[previousPanel].style.background = panelBackground[false];
  checkBoxes[previousPanel].checked = false;
  checkBoxes[id][2].checked = toggle[check];
  checkBoxes[id].style.background = panelBackground[checkBoxes[id].checked];
  previousPanel = id;
  pck(id);
}

function showtop(cnt){  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
  for (var idType=1; idType<4; idType+=2){
  for(
    var ndx = 0;
    for (var div=0; div<checkBoxes.length; div++){
     if(checkBoxes[div[idType]][1].disabled){ndx++;continue;};
     if(ndx < off){
        checkBoxes[div][idType]][0].style.backgroundColor=bg[true][idType];
        checkBoxes[div][idType]][1].checked=true;
        checkBoxes[div][idType]][1].disabled=false;
        checkBoxes[div[idType]][1].style.opacity=1;
      }
      else{
        checkBoxes[div][idType]][0].style.backgroundColor=bg[false][idType];
        checkBoxes[div][idType]][1].checked=false;
        checkBoxes[div][idType]][1].disabled=false;
        checkBoxes[div][idType]][1].style.opacity=1;
      }
      ndx++;
    }
  }
  ratedCount = off;
 // C.style.backgroundColor=bg[false][idType];
}



var foods = document.getElementById('s16');
var panel = document.getElementById('s15');
var ratedCount = $ratedCount;
document.getElementById('s0').style.display = 'none';

var panelname = [['','','','',''],['','900','950','950-1','255'],['','900-5','950-3','950-5','255-2'],['','900-6','950-4','950-6','255-1']];


function clearIgX(X){
  for (var div=0; div<checkBoxes.length; div++){
      if(checkObj[div][X]][1].disabled){continue;};
      checkBoxes[div[X]][0].style.backgroundColor=bg[false][X];
      checkBoxes[div[X]][1].checked=false;
      checkBoxes[div[X]][1].disabled=false;
      checkBoxes[div[X]][1].style.opacity=1;
  }
}
function buttons(X){
  var divs = document.getElementsByTagName("button");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "b"){
          i = did.substring(1,6);
          b[i] = document.getElementById('b' + i);
        if (checkBoxes[i] != null){
          checkBoxes[i][3] = divs[div]; 
        }
      }
      else if(idType == 'p'){document.getElementById('p' + i);
        p[i] = document.getElementById('p' + i);
      }
    }
  }
  prev = document.getElementById('S1');

  if(foods != null){
    var foffset = foods.clientOffset;
    var poffset = panel.clientOffset;
    var diff = poffset - foffset;
    foods.style.display = 'none';
  }
  if(diff > 10){
    // foods.style.display = 'none';
  }
  else{
    panel.style.display = 'none';
    foods.style.display = 'block';
  }
   document.getElementById('S1').style.display = 'block';

  document.getElementById('d001').style.backgroundColor = '#008';
  document.getElementById('d002').style.backgroundColor = '#008';

  //  var y=foods.offsetTop;
    window.scrollTo(0, 0);
  
  clearAll();
  panel.style.display = 'none';
  foods.style.display = 'none';
  previousPanel == 200;
}


*/
echo <<<EOT


window.onload = init;
</script>

EOT;


} //end of sub == 4
else if ($sub == 32){
if ($sub == 32){
echo <<<EOT
  d.style.backgroundColor=bg[true][idType];
  var d = document.getElementById('d' + id);
function ck(id){
  var d = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  d.style.backgroundColor=bg[checkBoxes.checked][idType];
}
function ckf(id){
  var df = document.getElementById('f' + id);
  var cf = document.getElementById('cf' + id);
  df.style.backgroundColor=bg[cf.checked][idType];
  document.getElementById('v' + id).style.backgroundColor=bg[cf.checked][idType];
  document.getElementById('cv' + id).checked = cf.checked;
}
function ckv(id){
  var dv = document.getElementById('v' + id);
  var cv = document.getElementById('cv' + id);
  dv.style.backgroundColor=bg[cv.checked][idType];
  document.getElementById('f' + id).style.backgroundColor=bg[cv.checked][idType];
  document.getElementById('cf' + id).checked = cv.checked;
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  var did = prev.getAttribute("id");
  did = 'b' + did.substr(1,3);
  document.getElementById(did).style.color='#0ff';
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
EOT;

//c[id] checkboxes object
//var checkObj = {id:[false,false]

//checkBoxes.checked (true or false)) 
//checkBoxes.background (true or false)
// checkBoxes = {id:[false,false]}

//checkBoxes.[id].checked (true or false)
//panelBackground[checkBoxes.checked[id]]
//checkBoxes.background (true or false)
// var checkBoxes[id] = {id:[checked],[back]}
echo <<<EOT
function init(){
var checked,did,idType,i,chk;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "d"){
        i = did.substring(1,6);
        checkBoxes[i] = document.getElementById('c' + i);
        d[i] = divs[div];
      }
      if (idType == "s"){
        divs[div].style.display = 'none';
      }
    }
  }
  prev = document.getElementById('s0');
  prev.style.display = 'block';
  console.log(checkBoxes);
}
</script>
echo <<<EOT


function ck(id){
  var c = document.getElementById('c' + id)
  var d = document.getElementById('d' + id)
  c.style.backgroundColor=bg[checkBoxes.checked][idType];
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}


function zip(zipcode){
    xmlhttp=null;
    var Url="zip.php"
  if (window.XMLHttpRequest){  // Fuckin\' Microsoft!
    xmlhttp=new XMLHttpRequest();
  }
  else if (window.ActiveXObject){ // Fuck Fuckin\' Microsoft!
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (xmlhttp!=null){
    xmlhttp.onreadystatechange=getCity;
    xmlhttp.open("POST", Url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xmlhttp.send( 'zc=' + zipcode);
    
  }else{
    alert("UNEXPECTED ERROR: XMLHttpRequest not supported");
  }
};
function  getCity(){
  var retVals = '';
  if (xmlhttp.readyState==4){
    if (xmlhttp.status==200){
      var retVal=xmlhttp.responseText;
      if(retVal == 1){document.getElementById('m' + mp3).style.display = 'none';if(current == mp3){next();}}else{alert('WTF:' + retVal);}
      
    }
    else{
      alert("UNEXPECTED AJAX ERROR: " + xmlhttp.statusText + "HTTP Status: " + xmlhttp.status);
    }
  }
};





function init(){
  document.getElementById('post').style.display = 'block';
  ck('001');
  ck('002');
}




EOT;
}
}
echo number_format(microtime(true) - $startTime,3);
echo <<<EOT

</pre><div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>






EOT;
ob_end_flush();

?>