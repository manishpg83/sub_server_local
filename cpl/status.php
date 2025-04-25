<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"/><meta name="viewport" content="width=800"><title>Check Orders</title>
<style>
body{margin:0 0 150px 0;}
table,td,tr{border:1px solid #000;border-collapse: collapse;}
.center{text-align:center;}
.warn{color:#f00;}
button{margin:0;padding:0;width:65px;font-size:.7em;color:#fff;background: linear-gradient(to bottom, #00f 0%, #004 100%);}
form{display:inline-block;}
.name{display:inline-block;width:100px;margin:0 5px 0 0;padding:0;overflow: hidden;}
span{margin:0;padding:0;}
</style></head><body><pre>

EOT;
ob_flush();
date_default_timezone_set('America/Chicago');
$cnts = array(0 ,23 ,35 ,47 ,59 ,71 ,83 ,95 ,107 ,119 ,131 ,143,'?','?','?',191);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$time = time() - (1728000); // 20 days back
//$time = time() - (1209600); // 14 days back
$date = date('Y-m-d',$time);
$sql = "SELECT `ClientID`,`Patient`,`date`,`Lastname` FROM `cplPatient` WHERE `date` > '$date' ";
$in = '(';
$inAMX = '(';
$results = mysqli_query($link,$sql);
while (list($id,$accession,$time,$last) = mysqli_fetch_array($results, MYSQLI_NUM)){$in .= "'$id',"; $times[$id] = $time;if($accession > 200000){$inAMX .= "'$accession',";  $accessions[$id] = $accession; }}
$in = trim($in,','). ')';
$inAMX = trim($inAMX,','). ')';
$sql = "SELECT `ClientID`,COUNT(*) FROM `cplTest` WHERE `ClientID` IN $in GROUP BY `ClientID` ";
$results = mysqli_query($link,$sql);
while (list($id,$cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){$tests[$id] = intval($cnt);}

$sql = "SELECT `Patient`,COUNT(*) FROM `Test` WHERE `Patient` IN $inAMX GROUP BY `Patient`";
$results = mysqli_query($link,$sql);
while (list($accession,$cnt) = mysqli_fetch_array($results, MYSQLI_NUM)){$testsAMX[$accession] = intval($cnt);}
$total = 0;
$ndx = 0;
$patients = 0;
$min = min($accessions);
$max = max($accessions);
$sql = "SELECT `Patient`,`ClientID`,`Status` FROM `Patient` WHERE  `Patient` BETWEEN $min AND $max  AND `Client` = 200032";
$results = mysqli_query($link,$sql);
while (list($accession,$id,$status) = mysqli_fetch_array($results, MYSQLI_NUM)){$clientid[$id][] = $accession; $stats[$accession] = $status;$patients++;}
foreach($accessions as $id => $accession){
  $text = '';
  $cclass = '<span>';
  $time = strtotime($times[$id]);
  $age = time() - $time;
  $days = intval($age / 86400);
  $date = date('m-d-y',$time);
  if($stats[$accession] == 'C'){ 
    $hl7 = glob("/home/amx/public_html/cpl/Results/$id/*.hl7");
	$hl7s = count($hl7);
	$text = " <span class=\"warn\"> Zero HL7 result files</span>";
	$class = '<span>';
    if($testsAMX[$accession] != $hl7s){$class = "<span class=\"warn\">";}
	if(($tests[$id] + $testsAMX[$accession]) / 2 != $hl7s){$cclass = '<span class="warn">';}
    if($hl7s > 0){
	  $text = "$class $hl7s HL7 result files</span>";
	
      if(file_exists("/home/amx/Z/apps/Results/$id/upload.log")){
        $data = file_get_contents("/home/amx/Z/apps/Results/$id/upload.log");
        $cnt = substr_count($data, $id);
		$text .= ", upload ID count: $cnt";
		if($cnt != $cnts[$hl7s]){$text .= " $cnts[$hl7s] expected";}
        $size = strlen($data);
	    $text .= ", size: $size";
		
	  }
    }
  }
  echo"$days $date <form action=\"check.php\" method=\"post\"><button name=\"id\" value=\"$id\" >$id</button> $stats[$accession] $accession $cclass" . intval($tests[$id]) . " $testsAMX[$accession]</span>$text\n";

  $ndx++;
  $total += $testsAMX[$accession];
  if($ndx == 20){$ndx=1;ob_flush();}
}
echo "<hr>$patients Patients\n$total Tests <hr>\n";

ob_flush();

echo "\nChecking for  duplicate accession numbers for each Client ID\n";
foreach($clientid as $id => $array){
  if(count($array) > 1){
	$class = '<span>';
	$cnt = 0;
	echo "$id\n";
	foreach($array as $accession){
	  if($stats[$accession] != 'X'){$cnt++; if($cnt > 1){$class = '<span class="warn">';}}
	  echo "&emsp;$class$accession $stats[$accession]</span>\n";
	}
  }
}
echo '</pre></body></html>';
ob_flush();//var_export($clientid);
?>