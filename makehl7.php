<?php

/*
header('Content-Type: text/plain; charset=utf-8');
$client = array();
$client[200424] = array();

$client[200424][] = 246022;
$client[200424][] = 246023;
$client[200424][] = 246024;

var_export($client);

exit;
*/

ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>Make HL7</title>
<style>#back{margin:40px 0 0 200px;width:200px;}
#back{height:32px;background-image: linear-gradient(to bottom, rgba(0,0,180,1) 0%, rgba(0,0,30,1) 100%);color:#fff;}
</style
</head><body>
<button id="back" onclick="back()";>Back</button>
EOT;
ob_flush();
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$HEN = array('0' => '', '0/1' => '', '1' => 'H', '2' => 'H','3' => 'H','4' => 'H','5' => 'H','6' => 'H');
$ranges[1] =  '<0.05';//array('0' => '<0.04', '0/1' => '0.4', '1' => '0.05-0.19', '2' => '0.20-0.79','3' => '0.80-2.69','4' => '2.70-13.99','5' => '14.00-24.99','6' => '25+');
$ranges[2] = '<4.00';//array('0' => '<1.00-3.99', '0/1' => '4.00-4.99', '1' => '5.00-8.74', '2' => '8.75-15.56','3' => '15.57-27.49','4' => '27.50-47.94','5' => '47.95-85.44','6' => '150+');
$ranges[3] = '<1.80';//array('0' => '<0.73-1.59', '0/1' => '1.60-1.79', '1' => '1.80-2.92', '2' => '2.93-5.44','3' => '5.45-10.48','4' => '10.49-20.56','5' => '20.57-40.72','6' => '40.73+');
$offScale[0] = array(1 => '<0.05',2 => '<5.00',3=> '<1.80');
$offScale[1] = array(1 => '>50.00',2 => '>600',3=> '>150');
$types = array('','IgE','IgG','IgG4');
$units = array('','kU/L','ug/mL','ug/mL',);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$date = date("Ymd00000");
$seq = 0;
$client = intval($_POST[client]);
$accession = intval($_POST[accession]);
$patient = $accession;
$sql = "SELECT `Client`,`ClientID`, `Last`, `First`,`DoB`, `Sex` FROM `Patient` WHERE `Client`=$client AND `Patient`= $accession ";
$results = mysqli_query($link,$sql);
$rows=mysqli_num_rows($results);
if(mysqli_errno($link) | $rows == 0){echo "$client, $accession invalid accession number";echo "<script>async function back() {await sleep(500);history.back();}window.addEventListener(\"load\", (event) => {back();});function sleep(ms) {return new Promise(resolve => setTimeout(resolve, ms));}</script>"; mysqli_error($link); echo "</body><html>";exit;}
list($client,$clientID,$Lastname, $Firstname,$DoB, $Gender) = mysqli_fetch_array($results, MYSQLI_NUM);
/*
  $sql = "UPDATE `hl7Patient` SET `Patient`='$accession' WHERE `Client`=$client AND `Patient`= '$accession'";
  //echo " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++<br>\n$sql <br>\r";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\r";}
*/
  $sql = "SELECT `Code`,`Type`,`Conc`,`Score` FROM `Test` WHERE `Client`=$client AND `Patient`=$accession ";
  $results = mysqli_query($link,$sql);
  $error = mysqli_error($link);
  //echo "\n<br>$sql $error<br>\r";
  //if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\r";}
  while (list($Code, $Type, $Conc, $Score) = mysqli_fetch_array($results, MYSQLI_NUM)){
    if($Code == 'A999'){continue;}
    $sql = "INSERT INTO `hl7Test` (`id`, `Client`, `Patient`, `Code`, `Type`, `Conc`, `Score`, `filename`, `obr`) VALUES (NULL, '$client', '$accession', '$Code', '$Type', '$Conc', '$Score', '', '');";
    $result = mysqli_query($link,$sql);
    $error = mysqli_error($link);
   // echo "\n<br>$sql<br $error<br>\r";  
   
    $sql = "UPDATE `hl7Test` SET `Conc`='$Conc',`Score`='$Score' WHERE `Client`=$client AND `Patient`= '$accession' AND `Code`='$Code' AND `Type`= '$Type'";
    $result = mysqli_query($link,$sql);
    $error = mysqli_error($link);
    //echo "\n<b r>$sql<br> $error<br>\r";
  }
  $sql = "SELECT `Code`,`Type`,`Conc`,`Score` FROM `hl7Test` WHERE `Client`=$client AND `Patient`=$accession";
  $results = mysqli_query($link,$sql);
  while(list($Code, $Type, $Conc, $Score) = mysqli_fetch_array($results, MYSQLI_NUM)){
	  echo "\r<pre>\r\rAllergen: $Code$Type, Concentration: $Conc, Score: $Score\r";
 //   echo "<br>$Lastname, $Firstname, $DoB, $Gender: $Code, $Type, $Conc, $Score<br>\r";
    if($Score == ''){continue;}
    $pid = "MSH|^~\&||||^|$date||ORU^R01||P\rPID|1|$ClientID|$patient|$clientID|$Lastname^$Firstname||$DoB|$Gender\r";
    $HL7 = $pid;
    $orc = "ORC|RE|$clientID|$accession\r";
    $HL7 .= $orc;
    $posts = 0;
    $values = 0; 
    $sql = "SELECT `description` FROM `rast` WHERE `code`='$Code' ";
    $Results = mysqli_query($link,$sql);
    list($description) = mysqli_fetch_array($Results, MYSQLI_NUM);
    $obr = "OBR|1|$clientID||$Code$Type^" . $types[$Type] . ",$description|||$date||||N|||||||CPL||$Code$Type^" . $types[$Type] . ",$description\r";
    $HL7 .= $obr;
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
      $seq++;
      $filename = "/home/amx/serolab/results/" .  date('Ymd') . "-$clientID-$accession-" . substr('000' . $seq,-3) . '.hl7';
      $text = "OBX|1|ST|$Code$Type^" . $types[$Type] . ",$description||$Conc|$units[$Type]|" . $ranges[$Type] . "|" . $HEN["$Score"] . "|||F|||$date\r";
      file_put_contents($filename, $HL7 . $text);
      $text = "NTE|1||CLASS $Score|\r";
      file_put_contents($filename, $text, FILE_APPEND);
    echo date('Ymd') . "-$clientID-$accession-" . substr('000' . $seq,-3) . ".hl7<br>\r" . file_get_contents($filename) . '</pre>';
  }

echo <<<EOT
<script>function back(){  history.back();}</script></body><html>

EOT;





//while (list($accession,$clientID) = mysqli_fetch_array($results, MYSQLI_NUM)){
 // createHL7($client,$accession,$clientID);
  
//}



//echo "Allermetrix#: $patient<br>";
//echo "Client's ID: $clientID<br>";
//include "/home/amx/public_html/results.php";


?>