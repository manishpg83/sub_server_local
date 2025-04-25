<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Top Allergens</title>
<style>
body{font:400 1em Arial,sans-serif;}
#page{width:400px; margin:120px auto 0;}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table{break-after: always;}
td{padding:0 4px 0 4px;}
.black{color:#000;}
.blue{color:#00f;}
.green{color:#05a011;font-weight:700;}
.orange{color:#ff4b09;font-weight:700;}
.red{color:#f00;font-weight:700;}
.center{text-align:center;}
.right{text-align:right;}
.col{width:45%;float:left;}
.ore{text-align:right;padding: 0 10px 0 0;}
input[type="date"]{font:400 20px Arial;width:150px;}
input[type="number"]{font:400 20px Arial;width:60px;text-align:center;margin:0 0 0 0;}
button{color:#fff;font:400 1.2em Arial;width:200px;margin: 10px 10px 10px 10px;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
.float{float:left;margin:0 0 0 10px;}
.note{font-size:.7em; margin:5px 0 0 0 ;}
</style><body>

EOT;
ob_flush();
$t = microtime(1);
$classes = array('"black"','"blue"','"green"','"orange"','"red"','"red"','"red"');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');






$fish = array('F101','F378','F306','F003','F107','F311','F312','F119','F111','F120','F041','F353','F123','F337','F118','F361','F204','F040','F121');
$shellfish = array('F207','F310','F339','F354','F381','F080','F136','F393','F394','F290','F396','F398','F338','F024','F116');
$nuts = array('F020','F018','F202','F103','F093','F036','F221','F348','F017','F363','F201','F114','F203','F130','F256','F317');
$cats = array('F','G4','M','G','T','W','E','D','H','I','100');
$pollens = array(array(0,0),array(0,0));
$cats = array('F');

$jsn = file_get_contents('dates.jsn');
$dates = json_decode($jsn,1); 

$sub = intval($_POST['sub']);
$start = $_POST['start'];
$end = $_POST['end'];
$_POST['start2'] = '2017-01-01';
$start2 = $_POST['start2'];
 $_POST['end2'] = '2022-06-01';
$end2 = $_POST['end2'];
$type = intval($_POST['type']);
$class = intval($_POST['class']);
$class2 = intval($_POST['class2']);
if(strlen($start) < 8){$start = '2021-06-01';}
if(strlen($end) < 8){$end = '2022-06-01';}
if(strlen($start2) < 8){$start2 = '2019-01-01';}
if(strlen($end2) < 8){$end2 = '2022-06-01';}
if($type == 0){$type = 1;}
if($class == 0){$class = 1;}
if($class2 == 0){$class2 = 1;}

if($sub == 0){
  echo <<<EOT
<div id="page">
<form action="#" method="post" ><div>

<div class="float">
Start Date<br>
<input type="date" name="start" value="$start" min="2017-04-21"/> <br>
<input type="date" name="start2" value="$start2" min="2017-04-21"/>
<p class="note">Between 4/21/17 and 6/1/22</p>
</div>
<div class="float">
End Date<br>
<input type="date" name="end" value="$end" max="2022-06-01" /><br> 
<input type="date" name="end2" value="$end2" max="2019-06-01" />
</div>
<div class="float">
Class<br>
<input type="number" name="class" value="$class" min="1" max="6" value="1" step="1" /><br>
<input type="number" name="class2" value="$class2" min="1" max="6" value="1" step="1" />
</div>
</div><br><div style=" clear: both;"></div><br>
 Ig Type: <input type="number" name="type" value="$type" min="1" max="3" value="1" step="1" /><br>
  <button>Rank Allergens</button>
  <input type="hidden" name="sub" value="1" />
</form></div><script></script></body></html>
EOT;
exit;
}

echo <<<EOT

<form action="#" method="post" >
<input type="hidden" name="start" value="$start" />
<input type="hidden" name="end" value="$end" />
<input type="hidden" name="start2" value="$start2" />
<input type="hidden" name="end2" value="$end2" />
<input type="hidden" name="type" value="$type" />
<input type="hidden" name="class" value="$class" />
<input type="hidden" name="class2" value="$class2" />
<input type="hidden" name="sub" value="0" />
<button>Try Again</button>
</form>

EOT;
$startdate = strtotime($start);
foreach($dates as $time => $accession1){
  if($time >= $startdate ){break;}
}
$enddate = strtotime($end);
foreach($dates as $time => $accession2){
  if($time >= $enddate ){break;}
}
// echo "<br> t=$time a=$accession<br>\n";
//echo date('m/d/Y',$time);
$types = array('','IgE','IgG','IgG4');
$startdate = date('m/d/Y',strtotime($start));
$enddate = date('m/d/Y',strtotime($end));
echo <<<EOT
<div class="col">
<p>start accession: $accession1<br>
end accession: $accession2<br>
<h4>Type:  $types[$type]<br>From: $startdate<br>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$enddate <br>Class: $class+<br></h4>

<table><tr><td>Rank</td><td>Percent</td><td>Allergen</td><td class="right">Code</td><td>Elevated</td><td>Ordered</td></tr>
EOT;
ob_flush();

foreach($cats as $cat){
  
  if($cat == 'G4'){$type = 3;$cat = 'F';}
  if($cat == '100'){
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  else{
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE `Code` LIKE '$cat%' ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  $allergens = array();
  $total = 0;
  $results = mysqli_query($link,$sql);
  while (list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){  $allergens[$code] = $description;}
  $ordered = array();
  foreach($allergens as $code => $description ){
    $sql = "SELECT COUNT(*) FROM `AllergyTests2` WHERE `Code` = '$code' AND `Type`=$type AND  `accession` BETWEEN $accession1 AND $accession2";
//	echo ",<br>$sql";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
  	 // if($cnt < 100){continue;}
  	  $ordered[$code] = $cnt;
	  $total += $cnt;
	//  if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenOrders[$code] += $cnt;}
    }
  }
  $elevated = array();
  foreach($allergens as $code => $description ){
	$sql = "SELECT COUNT(*) FROM `AllergyTests2` WHERE  `Code` = '$code' AND `Type`=$type AND `Score` >= $class AND `accession`  BETWEEN $accession1 AND $accession2";
//	echo "$sql<br>\n";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
 // 	if($cnt < 0){continue;}
 
  	$elevated[$code] = $cnt;
//	if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenElevated[$code] += $cnt;}
    }
  }
/*
  $allergens['F997'] = 'Tree Nuts';
  $allergens['F998'] = 'Fish';
  $allergens['F999'] = 'Shellfish';
  foreach($nuts as $code){
    $elevated['F997'] += $elevated[$code];
	$ordered['F997'] += $ordered[$code];
  }
  foreach($fish as $code){
    $elevated['F998'] += $elevated[$code];
	$ordered['F998'] += $ordered[$code];
  }
  foreach($shellfish as $code){
    $elevated['F999'] += $elevated[$code];
	$ordered['F999'] += $ordered[$code];
  }
*/
  asort($elevated);
  $ranks = array();
  foreach($allergens as $code => $description){
       $ranks[$code]  = 0;
   if($ordered[$code] > 0){
      $ranks[$code] = number_format($elevated[$code]/$ordered[$code] * 100,3);
    }
  }
  arsort($ranks,SORT_NUMERIC);
  $ndx =0;
  $cnt = 0;
  file_put_contents("top$types[$type].txt",'');
  foreach($ranks as $code => $rank){
	  if($code == 'F019' or $code == 'F395'  or $code == 'F372'  or $code == 'F360'  or $code == 'F359'   or $code == 'F358'  or $code == 'F357'  or $code == 'F076' or $code == 'F077'  or $code == 'FZ03' ){continue;}
  //  if($rank < 1){continue;}
  //  if($rank < 1){break;}
    $ndx++;
	if($cnt++ > 50){$cnt=0;ob_flush();}
   // if($ndx > 100){break;}
  // echo "$ndx | $rank | $allergens[$code]<br>";
    if($rank > 9.999){$rank = substr($rank,0,4);}else{$rank = substr($rank,0,3);}
    echo "<tr id=\"$code\"><td>$ndx</td><td class=\"center\">$rank</td><td>$allergens[$code]</td><td>$code</td><td class=\"ore\">$elevated[$code]</td><td class=\"ore\">$ordered[$code]</td></tr>\n";
    file_put_contents("top$types[$type].txt", "$code\n",FILE_APPEND);


  }
  ob_flush();
 
}
$total = number_format($total);
echo <<<EOT
</table>
Total Ordered=$total
<form action="export.php" method="post"><button id="butt" onclick="buttgone()">Export to Food</button><input type="hidden" name="type" value="$type"></form>
</div>

EOT;












$startdate = strtotime($start2);
foreach($dates as $time => $accession1){
  if($time >= $startdate ){break;}
}
$enddate = strtotime($end2);
foreach($dates as $time => $accession2){
  if($time >= $enddate ){break;}
}
// echo "<br> t=$time a=$accession<br>\n";
//echo date('m/d/Y',$time);
$types = array('','IgE','IgG','IgG4');


$startdate = date('m/d/Y',strtotime($start2));
$enddate = date('m/d/Y',strtotime($end2));

echo <<<EOT
<div class="col">
<p>start accession: $accession1<br>
end accession: $accession2<br>
<h4>Type:  $types[$type]<br>From: $startdate<br>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$enddate <br>Class: $class+<br></h4>
<table><tr><td>Rank</td><td>Percent</td><td>Allergen</td><td>Code</td><td>Elevated</td><td class="right">Ordered</td></tr>
EOT;
ob_flush();


foreach($cats as $cat){
  
  if($cat == 'G4'){$type = 3;$cat = 'F';}
  if($cat == '100'){
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  else{
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE `Code` LIKE '$cat%' ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  $allergens = array();
  $total = 0;
  $results = mysqli_query($link,$sql);
  while (list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){  $allergens[$code] = $description;}
  $ordered = array();
  foreach($allergens as $code => $description ){
    $sql = "SELECT COUNT(*) FROM `AllergyTests2` WHERE `Code` = '$code' AND `Type`=$type AND  `accession` BETWEEN $accession1 AND $accession2";
//	echo ",<br>$sql";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
  	 // if($cnt < 100){continue;}
  	  $ordered[$code] = $cnt;
	  $total += $cnt;
	//  if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenOrders[$code] += $cnt;}
    }
  }
  $elevated = array();
  foreach($allergens as $code => $description ){
	$sql = "SELECT COUNT(*) FROM `AllergyTests2` WHERE  `Code` = '$code' AND `Type`=$type AND `Score` >= $class AND `accession`  BETWEEN $accession1 AND $accession2";
//	echo "$sql<br>\n";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
 // 	if($cnt < 0){continue;}
 
  	$elevated[$code] = $cnt;
//	if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenElevated[$code] += $cnt;}
    }
  }
/*
  $allergens['F997'] = 'Tree Nuts';
  $allergens['F998'] = 'Fish';
  $allergens['F999'] = 'Shellfish';
  foreach($nuts as $code){
    $elevated['F997'] += $elevated[$code];
	$ordered['F997'] += $ordered[$code];
  }
  foreach($fish as $code){
    $elevated['F998'] += $elevated[$code];
	$ordered['F998'] += $ordered[$code];
  }
  foreach($shellfish as $code){
    $elevated['F999'] += $elevated[$code];
	$ordered['F999'] += $ordered[$code];
  }
*/
  asort($elevated);
  $ranks = array();
  foreach($allergens as $code => $description){
	  if($code == 'F019' or $code == 'F395'  or $code == 'F372'  or $code == 'F360'  or $code == 'F359'   or $code == 'F358'  or $code == 'F357'  or $code == 'F076' or $code == 'F077'  or $code == 'FZ03' ){continue;}
       $ranks[$code]  = 0;
   if($ordered[$code] > 0){
      $ranks[$code] = number_format($elevated[$code]/$ordered[$code] * 100,3);
    }
  }
  arsort($ranks,SORT_NUMERIC);
  $ndx =0;
  $cnt = 0;
  file_put_contents("top$types[$type].txt",'');
  foreach($ranks as $code => $rank){
  //  if($rank < 1){continue;}
  //  if($rank < 1){break;}
    $ndx++;
	if($cnt++ > 50){$cnt=0;ob_flush();}
   // if($ndx > 100){break;}
  // echo "$ndx | $rank | $allergens[$code]<br>";
     if($rank > 9.999){$rank = substr($rank,0,4);}else{$rank = substr($rank,0,3);}
    echo "<tr id=\"$code\"><td>$ndx</td><td class=\"center\">$rank</td><td>$allergens[$code]</td><td>$code</td><td class=\"ore\">$elevated[$code]</td><td class=\"ore\">$ordered[$code]</td></tr>\n";
    file_put_contents("top$types[$type].txt", "$code\n",FILE_APPEND);


  }
  ob_flush();
 
}
$total = number_format($total);
echo <<<EOT
</table>
Total Ordered=$total
</div>
</div><script>function buttgone(){document.getElementById('butt').style.display='none';}</script><br><br><br><br><br><br></body></html>
EOT;






exit;










 /*

foreach($cats as $cat){
  
  if($cat == 'G4'){$type = 3;$cat = 'F';}
  if($cat == '100'){
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  else{
    $sql = "SELECT `Code`,`description` FROM `Rast` WHERE `Code` LIKE '$cat%' ORDER BY `Code` ASC"; //`Code` LIKE '$cat%' 
  }
  $allergens = array();
  $results = mysqli_query($link,$sql);
  while (list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){$allergens[$code] = $description;}
  $ordered = array();
  $total = 0;
  foreach($allergens as $code => $description ){
    $sql = "SELECT COUNT(*) FROM `AllergyTests` WHERE `Code` = '$code' AND `Type`=$type AND  `accession` BETWEEN $accession1 AND $accession2";
//	echo ",<br>$sql";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
  	 // if($cnt < 100){continue;}
  	  $ordered[$code] = $cnt;
	  $total += $cnt;
	//  if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenOrders[$code] += $cnt;}
    }
  }
  $elevated = array();
  foreach($allergens as $code => $description ){
	$sql = "SELECT COUNT(*) FROM `AllergyTests` WHERE  `Code` = '$code' AND `Type`=$type AND `Score` >= $class2 AND `accession`  BETWEEN $accession1 AND $accession2";
    $results = mysqli_query($link,$sql);
    while (list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){
 // 	if($cnt < 0){continue;}
 
  	$elevated[$code] = $cnt;
//	if($cat == 'G' OR $cat == 'T' OR $cat == 'W'){$pollenElevated[$code] += $cnt;}
    }
  }
/*
  $allergens['F997'] = 'Tree Nuts';
  $allergens['F998'] = 'Fish';
  $allergens['F999'] = 'Shellfish';
  foreach($nuts as $code){
    $elevated['F997'] += $elevated[$code];
	$ordered['F997'] += $ordered[$code];
  }
  foreach($fish as $code){
    $elevated['F998'] += $elevated[$code];
	$ordered['F998'] += $ordered[$code];
  }
  foreach($shellfish as $code){
    $elevated['F999'] += $elevated[$code];
	$ordered['F999'] += $ordered[$code];
  }

echo <<<EOT
<div class="col">
<p>start accession: $accession1<br>
end accession: $accession2<br>
<h4>Type:  $types[$type]<br>From: $startdate<br>To:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$enddate<br>Class: $class2+</h4>
EOT;
ob_flush();
  asort($elevated);
  $ranks = array();
  foreach($allergens as $code => $description){
    $ranks[$code] = 0;
    if($ordered[$code] > 0){
      $ranks[$code] = number_format($elevated[$code]/$ordered[$code] * 100,3);
    }
    arsort($ranks,SORT_NUMERIC);
    $ndx =0;
    echo "</table><table><tr><td>Rank</td><td>Percent</td><td>Elevated</td><td class=\"right\">Ordered</td><td>Allergen</td><td>Code</td></tr>";
    foreach($ranks as $code => $rank){
  //  if($rank < 1){continue;}
  //  if($rank < 1){break;}
    $ndx++;
   // if($ndx > 100){break;}
  // echo "$ndx | $rank | $allergens[$code]<br>";
    echo "<tr id=\"$code\"><td>$ndx</td><td class=\"center\">$rank</td><td class=\"right\">$elevated[$code]</td><td class=\"right\">$ordered[$code]</td><td>$allergens[$code]</td><td>$code</td></tr>\n";
  }
  ob_flush();
 
}
$total = number_format($total);
echo <<<EOT
</table>Total Ordered=$total<br><p> <br> <br> <br> <br> </p>
</div>

EOT;
}
echo "</div><script>function buttgone(){document.getElementById('butt').style.display='none';}</script></body></html>";

exit;




  asort($pollenOrders);
  $ranks = array();
  foreach($pollenOrders as $code => $ordered){
    $ranks[$code] = number_format($elevated[$code]/$ordered[$code] * 100,3);
  }
  arsort($ranks,SORT_NUMERIC);
  $ndx =0;
  
  echo "</table><br><table><tr><td>Rank</td><td>Percents</td><td>Elevated</td><td class=\"right\">Ordered</td><td>Allergen</td><td>Code</td></tr>";
  foreach($ranks as $code => $rank){
   // if($rank < 10){continue;}
  //  if($rank < 1){break;}
    $ndx++;
   // if($ndx > 100){break;}
    echo "<tr id=\"$code\"><td>$ndx</td><td class=\"center\">$rank</td><td class=\"right\">$pollenElevated[$code]</td><td class=\"right\">$pollenOrders[$code]</td><td>$allergens[$code]</td></tr>\n";
  }
 // echo "Pollens</table><br></div>";
  ob_flush();

  
  
  
 


echo "<pre>$cnt\n";var_export($dates);echo"\n";echo microtime(1) - $t;exit;
$sql = "SELECT `Patient`,`Date` FROM `Patient` WHERE 1 ";
$results = mysqli_query($link,$sql);
while (list($Patient,$Date) = mysqli_fetch_array($results, MYSQLI_NUM)){$numdate = strtotime($Date);if($numdate < 1){continue;}$dates[$numdate] = "$Patient"; }
ksort($dates);
$cnt = count($dates);
$jsn = json_encode($dates);
file_put_contents('dates.jsn',$jsn);

$sql = "SELECT  `accession`, `code`, `type`, `conc`, `score` FROM `TestUpdate3` WHERE 1 ";
$results = mysqli_query($link,$sql);
while (list($accession, $code, $type, $conc, $score) = mysqli_fetch_array($results, MYSQLI_NUM)){  
  $grp = substr($code,0,1);
  $sql = "INSERT INTO `AllergyTests` (`rec`, `accession`, `Group`, `Code`, `Type`, `Concentration`, `Score`) VALUES (NULL, $accession, '$grp', '$code', $type, $conc, $score)";
  mysqli_query($link,$sql);
}
exit;

$sql = "SELECT `Patient`,`Date` FROM `Patient` WHERE 1 ORDER BY `Patient`";
ECHO $sql;
$results = mysqli_query($link,$sql);
while (list($Patient,$Date) = mysqli_fetch_array($results, MYSQLI_NUM)){$numdate = strtotime($Date);if($numdate < 1){continue;}$dates[$numdate] = "$Patient"; }
ksort($dates);
$cnt = count($dates);
$jsn = json_encode($dates);
file_put_contents('dates.jsn',$jsn);



exit;

echo memory_get_usage();
$ndx = 0;
$current = 100002;
$sql = "SELECT `accession` FROM `AllergyTests` WHERE 1 ORDER BY `accession`";
$results = mysqli_query($link,$sql);
while (list($accession) = mysqli_fetch_array($results, MYSQLI_NUM)){
  $current++;
  if($accession > $current){
   $dif = $accession - $current;
   echo "$accession - $current = $dif<br>";
   ob_flush();
  }
  $current = $accession;

}
echo $current;;


exit;
$sql = "SELECT `Patient` FROM `Patient` WHERE `Client` BETWEEN 800000 AND 999999 AND `Patient` BETWEEN 180000 AND 400000 ORDER BY `Patient` ";
$results = mysqli_query($link,$sql);
while (list($accession) = mysqli_fetch_array($results, MYSQLI_NUM)){$patients[] = $accession;}
foreach($patients as $accession){
  $sql = "DELETE FROM `AllergyTests2` WHERE `accession` = $accession";
  mysqli_query($link,$sql);
}

exit;

$sql = "SELECT `Group`,`Code` FROM `AllergyTests2` WHERE 1 GROUP BY `Code` ";
$results = mysqli_query($link,$sql);
while (list($group,$code) = mysqli_fetch_array($results, MYSQLI_NUM)){$groups[$code] = $group;}


echo '<pre>';
var_export($groups);




exit;

*/ 
  
  
  
  
  
  ?>