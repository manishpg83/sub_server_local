<?
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$logfile = "/home/amx/public_html/HL7/500258/log.txt";
file_put_contents($logfile,'');
$data = file_get_contents('Allermetrix_01302022.HL7');
$lines = explode("\r",$data);
$data = '';
echo '<pre>';//var_export($lines);//echo '</pre>';
$time = microtime(1);
$id = 1000;
$client = 500258;
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
$hl7 = array('msh' => "MSH|^~\&|Allermetrix||||$microtime||ORU^O01|$microtime||2.3||||||UTF-8",'pid' => '','orc' => '','obr' => '');
foreach($lines as $line){
  if(strlen($line) < 1){continue;}
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
	$hl7['obr'] = $line;
    list(,,$specimen,,$allergen,,,$collection,,,,,,,,,,,,,$cerners,,$dateProcessed,,,,,) = explode('|',$line);
    $Code = substr($allergen,0,4);
    $Type = substr($allergen,4,1);
    list(,$cerners) = explode('^',$cerners);
    list(,$cerner) = explode('~',$cerners);
    $collection = substr($collection,0,4) . '-' . substr($collection,4,2) . '-' . substr($collection,6,2);
    if(strlen($collection) < 8){$collection = '';}
    $patients[$client][$id] = "$specimen|$lastname|$firstname|$dob|$gender|$collection|$address|$address2|$city|$state|$zip|$encounter|$npi|$physician|$cerner|$dateProcessed";
    $allergens[$id][$Code] = "$Type";
  } 
}
$jsn = json_encode($hl7);
$lastname = mysqli_real_escape_string($link, $lastname);
$sql = "INSERT IGNORE INTO `hl7Patient` (`id`,`Client`,`ClientID`, `Patient`, `Lastname`, `Firstname`, `DoB`, `Gender`, `Collection`,`hl7`) 
VALUES (NULL, '$client','$specimen', '','$lastname', '$firstname', '$dob', '$gender','$collection','$jsn');";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){file_put_contents($logfile,"ERROR $client => $specimen: " . mysqli_error($link) . "\n", FILE_APPEND);}
echo"<br><br><pre>";
echo "\n\n" . microtime(1) - $time . "\n";
$file = "/home/amx/orders/$specimen" . "login.txt";
foreach($patients as $client => $patient){
  foreach($patient as $id => $details){
    list($specimen,$lastname,$firstname,$dob,$gender,$collection,$address,$address2,$city,$state,$zip,$encounter,$npi,$physician,$cerner,$dateProcessed) = explode('|', $patients[$client][$id]);
    $data =  "$onhold\r\n0\r\n$client\r\n$Accession\r\n$bill[$billing]\r\n$lastname\r\n$firstname\r\n$gender\r\n$dob\r\n$address $address2\r\n$city\r\n$state\r\n$zip\r\n$phone\r\n$email\r\n$note\r\n$collection\r\n$specimen $encounter\r\n$physician\r\n$npi\r\n$icd1\r\n$icd2\r\n$icd3\r\n";
    foreach($allergens[$id] as $Code => $details){$data .= "$Code$details\r\n";}
	file_put_contents($file,$data);
  }
}
echo file_get_contents($file);

echo "\n\n" . microtime(1) - $time . "\n\n"; 
var_export($hl7);
?>