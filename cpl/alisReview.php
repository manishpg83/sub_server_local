<?php
header('Content-Type: text/html; charset=utf-8');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$ranges[1] = array('0' => '<0.04', '0/1' => '0.4', '1' => '0.05-0.19', '2' => '0.20-0.79','3' => '0.80-2.69','4' => '2.70-13.99','5' => '14.00-24.99','6' => '25+','na'=> '');
$ranges[2] = array('0' => '<1.00-3.99', '0/1' => '4.00-4.99', '1' => '5.00-8.74', '2' => '8.75-15.56','3' => '15.57-27.49','4' => '27.50-47.94','5' => '47.95-85.44','6' => '150+');
$ranges[3] = array('0' => '<0.73-1.59', '0/1' => '1.60-1.79', '1' => '1.80-2.92', '2' => '2.93-5.44','3' => '5.45-10.48','4' => '10.49-20.56','5' => '20.57-40.72','6' => '40.73+');
$offScale[0] = array(1 => '<0.04',2 => '<1.0',3=> '<0.73');
$offScale[1] = array(1 => '>50.00',2 => '>600',3=> '>150');
$total = array(1 => 49,2 => 45,3 => 52,4 => 52,5 => 52,6 => 52,7 => 52,8 => 52,9 => 52);
$types = array('','IgE','IgG','IgG4');
$units = array('','kU/L','µg/mL','µg/mL',);

echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Post Review</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style>
body {font:700 1.1em Arial;}
h3{margin:2px 0 3px 1em;}
.c6{background-color:#c00;color:#fff;}
.c5{background-color:#f40;color:#fff;}
.c4{background-color:#ff0;color:#000;}
.c3{background-color:#5f5;color:#000;}
.c2{background-color:#25ffd4;color:#000;}
.c1{background-color:#004cff;color:#fff;}
.c0/1{background-color:#00f;color:#fff;}
tr {padding:0;margin:0;}
td {text-align:center;padding:0 4px 0 4px;border: 1px solid black;}
.left{text-align:left;padding-right:5px;}
.mono{font-family:courier, courier new, serif;padding:0;margin:0;white-space: nowrap;}
</style></head><body><pre>
</pre><h3>Review Results</h3><table>
EOT;

echo '';
$tests =($_POST['test']);
$assession = $_POST['assession'];
$id = $_POST['id'];
$sql = "SELECT `Client`,`Last`,`First`,`DoB`,`Age`,`Sex`,`ClientID` FROM `Patient` WHERE `Patient`=$assession";
$results = mysqli_query($link,$sql);
list($Client,$Last,$First,$DoB,$Age,$gender,$ClientID) = mysqli_fetch_array($results, MYSQL_NUM);
$sql = "SELECT `Name`,`City`,`State` FROM `Client` WHERE `Number`=$Client";
$results = mysqli_query($link,$sql);
list($ClientName,$City,$State) = mysqli_fetch_array($results, MYSQL_NUM);

echo "Client: $Client, $ClientName<br>$City, $State<br>Patient: $First $Last $assession<br>\nDate of Birth: $DoB Age: $Age $gender<br>\n";
foreach($tests as $values){
  list($Code,$Type,$Conc,$Score) = explode('-',$values);
    if($Type == 1){
	if($Conc < .04){$Conc = $offScale[0][1];}  // offScale[hi/low][type]
	if($Conc == 999){$Conc = $offScale[1][1];}
    
  }
  elseif($Type == 2){
	if($Conc < 1){$Conc = $offScale[0][2];}
    if($Conc == 999){$Conc = $offScale[1][2];}
  }
  elseif($Type == 3 AND $Conc < .73){
	if($Conc < .73){$Conc = $offScale[0][3];}
    if($Conc == 999){$Conc = $offScale[1][3];}
  }
$sql = "SELECT `description` FROM `Rast` WHERE `code`='$Code'";
//echo $sql;
/*if($Code == '100'){
  if($Age < 10){
    $ranges[1]['na'] = "<=$total[$age]";
  }
  else{
	  $ranges[1]['na'] = "<=87";
  }
}
*/
$results = mysqli_query($link,$sql);
list($description) = mysqli_fetch_array($results, MYSQL_NUM);

  echo "<tr class=\"c" . $Score . "\"><td>$Code</td><td>$types[$Type]</td><td class=\"left\">$description</td><td>$Conc $units[$Type]</td><td> $Score </td><td>" . $ranges[$Type]["$Score"] . "</td></tr>\n";
}
echo '</table>' ;
?>