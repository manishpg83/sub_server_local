<?
 
//Located /home/amx/public_html/HL7/500258

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
ob_start("ob_gzhandler");
header('Content-Type: text/plain; charset=UTF-8');

$client = 500258;
$data = file_get_contents('./230403-10003.HL7');
$data = str_replace("'", '', $data);

$logfile = "/home/amx/public_html/HL7/$client/log.txt";
file_put_contents($logfile,'');
$lines = explode("\r",$data);
$data = '';

$id = 1000;
$savePID = -1;
$onhold = '1';
$billing = 1;
$email = '';
$phone = '';
$Accession = '';
$blank = 0;
$cnt = 1;
$genders = ['','M','F'];
$bill = array('','C','M','A','P','I','N');
$allergens = array();
$patients = array();
$microtime = intval(date("YmdHis").gettimeofday()["usec"]/10);
$cnt = 0;
$specimen = '';
$hl7 = array('pid' => '','orc' => '','obr' => '');
echo "Reading in HL7\n";
$time = microtime(1);
foreach($lines as $line){
  if(strlen($line) < 1){continue;}
  if(substr($line,0,3) == 'MSH'){
    if($cnt == 0){$cnt++;continue;}
    
  }
  if(substr($line,0,3) == 'PID'){
    $hl7['pid'] = $line;
    list(,,$id,,,$name,,$dob,$gender,,,$acsz,,,,,,,$encounter) = explode('|',$line);
    list($lastname,$firstname) = explode('^',$name);
    $dob = substr($dob,0,4) . '-' . substr($dob,4,2) . '-' . substr($dob,6,2);
    list($address,$address2,$city,$state,$zip) = explode('^',$acsz);

  }
  if(substr($line,0,3) == 'ORC'){
	$hl7['orc'] = $line;
    list(,,$specimen,,,,,,,,,,$phy) = explode('|',$line);
    list($npi,,$physician) = explode('^',$phy);
  }
  if(substr($line,0,3) == 'OBR'){
    if($specimen <> $savePID){
      $hl7['obr'] = $line;
      $jsn = json_encode($hl7);
	  
	  
	  
      $sql = "INSERT IGNORE INTO `hl7Patient` (`id`,`Client`,`ClientID`, `Patient`, `Lastname`, `Firstname`, `DoB`, `Gender`, `Collection`,`hl7`) 
      VALUES (NULL, '$client','$specimen', '','$lastname', '$firstname', '$dob', '$gender','$collection','$jsn');";


      $sql = "UPDATE `hl7Patient` SET `hl7`= '$jsn' WHERE `ClientID` = $specimen";


      $results = mysqli_query($link,$sql);
      if(mysqli_errno($link)){file_put_contents($logfile,"ERROR $client => $specimen: " . mysqli_error($link) . "\n$sql\n", FILE_APPEND);}
      $savePID = $specimen;
      $hl7 = array('pid' => '','orc' => '','obr' => '');
echo "\nPatient:$sql\n";
    }
	
	
	


    list(,,$specimen,,$allergen,,,$collection,,,,,,,,,,,,,,,$dateProcessed,,,,,) = explode('|',$line);
	list($allergen,$desc) = explode('^',$allergen);
    $Code = substr($allergen,0,-1);
    $Type = substr($allergen,-1);
	list($specimen,$x) = explode('^',$specimen);
    $collection = substr($collection,0,4) . '-' . substr($collection,4,2) . '-' . substr($collection,6,2);
    if(strlen($collection) < 8){$collection = '';}
    $patients[$client][$specimen] = "$specimen|$lastname|$firstname|$dob|$gender|$collection|$address|$address2|$city|$state|$zip|$encounter|$npi|$physician||$dateProcessed";
    $allergens[$specimen][$Code] = "$Type";
    $lastname = mysqli_real_escape_string($link, $lastname);
    $sql = "INSERT INTO `hl7Test` (`id`, `Client`, `ClientID`, `Patient`, `Code`, `Type`, `Conc`, `Score`, `filename`, `hl7`) VALUES (NULL, '$client', '$specimen', 0, '$Code', '$Type', '', '', '','$jsn')";
    $results = mysqli_query($link,$sql);
	$tests[$specimen][]= "$Code$Type";
//echo "\nTest: $sql\n";
    if(mysqli_errno($link)){file_put_contents($logfile,"ERROR $client => $specimen => : " . mysqli_error($link) . "\n$sql\n", FILE_APPEND);}
//var_export($hl7);
echo number_format((microtime(1) - $time) * 1000,3 ) . " mS $specimen $Code$Type $desc\n";

  }
}
echo "\n" . number_format((microtime(1) - $time) * 1000,3 ) . " mS Done Reading HL7\n\nSort and Format Data\n";
echo "---------------------------------------------\n";







foreach($patients[$client] as $key => $details){
  echo  number_format((microtime(1) - $time) * 1000,3 )  . " ms $details\n";
  foreach($tests[$key] as $code){
    echo "          $code\n";
  }
 // var_export($tests[$key]);
  echo "\n";
}


echo "\n" . number_format((microtime(1) - $time) * 1000,3 ) . " mS Done Sorting and Formating Data\n\nCreating Text Order Input Files\n";
echo "-------------------" . number_format((microtime(1) - $time) * 1000,3 ) . " mS \n";

foreach($patients as $client => $patient){
  foreach($patient as $specimen => $details){
    list($specimen,$lastname,$firstname,$dob,$gender,$collection,$address,$address2,$city,$state,$zip,$encounter,$npi,$physician,$cerner,$dateProcessed) = explode('|', $patients[$client][$specimen]);
    $file = "/home/amx/orders/$specimen" . "login.txt";
    $data =  "$onhold\r\n0\r\n$client\r\n$Accession\r\n$bill[$billing]\r\n$lastname\r\n$firstname\r\n$gender\r\n$dob\r\n$address $address2\r\n$city\r\n$state\r\n$zip\r\n$phone\r\n$email\r\n$note\r\n$collection\r\n$specimen $encounter\r\n$physician\r\n$npi\r\n$icd1\r\n$icd2\r\n$icd3\r\n";
    foreach($allergens[$specimen] as $Code => $details){$data .= "$Code$details\r\n";}
	file_put_contents($file,$data);
	echo file_get_contents($file) . "-------------------" . number_format((microtime(1) - $time) * 1000,3 ). " mS\n";
  }
  
}


echo "\nTotal Time: " . (microtime(1) - $time) * 1000 . " mS\n\n";

?>