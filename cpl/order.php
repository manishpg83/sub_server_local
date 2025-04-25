<?php ob_start("ob_gzhandler");
header('Content-Type: text/plain; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$startTime = microtime(true);



echo"Read in:\n";
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
//var_export($_POST['files']);

$date = date("Ymd00000");
$types = array('','IgE','IgG','IgG4');
$units = array('','kU/L','µg/mL','µg/mL',);
$ranges[1] = array('0' => '<0.01-0.03', '0/1' => '0.4', '1' => '0.05-0.19', '2' => '0.20-0.79','3' => '0.80-2.69','4' => '2.70-13.99','5' => '14.00-24.99','6' => '25+');
$ranges[2] = array('0' => '<<0.75-1.59', '0/1' => '1.60-1.79', '1' => '1.80-3.99', '2' => '4.00-7.99','3' => '8.00-15.99','4' => '16.00-31.99','5' => '32.00-149.99','6' => '150+');
$ranges[3] = array('0' => '<<0.75-1.59', '0/1' => '1.60-1.79', '1' => '1.80-3.99', '2' => '4.00-7.99','3' => '8.00-15.99','4' => '16.00-31.99','5' => '32.00-149.99','6' => '150+');
$obr = array();
$pv1 = array();
$ndx = 1;
$files = $_POST['files'];
if(count($files)==0){
  echo 'No Files to Process';
  $id = $_POST['id'];
  echo "\n$id\n";
  if(strlen($id) > 2){
    $sql = "SELECT  COUNT(*) FROM `cplTest` WHERE `ClientID`='$id'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo "$sql\nerr1: " . mysqli_error($link) . "\n$sql\n";}
    list($records) = mysqli_fetch_array($results, MYSQL_NUM);
	echo "$records Test Records\n";
	$sql = "SELECT `Patient` FROM `Patient` WHERE `ClientID`='$id'";
	$results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo "$sql\nerr2: " . mysqli_error($link) . "\n$sql\n";}
    list($Patient) = mysqli_fetch_array($results, MYSQL_NUM);
    $sql = "SELECT  COUNT(*) FROM `Test` WHERE `Patient`='$Patient'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo "$sql\nerr3: " . mysqli_error($link) . "\n$sql\n";}
    list($records) = mysqli_fetch_array($results, MYSQL_NUM);
	echo "$records Patient Test Records\n";
    $data = file_get_contents("login/$id.txt");
    $data = trim($data);
    file_put_contents("login/$id.txt",$data);
    $lines = explode("\r\n",$data);
    $logins = count($lines) - 5;
	echo "$logins Tests for Import\n";
	$path = "orders/back/*$id.hl7";
    $backed = count(glob($path));
	echo "$backed HL7 Backup Files\n";
	$path = "orders/*$id.hl7";
    $orders = count(glob($path));
	echo "$orders HL7 files\n";
	exit;
  }
}
$parts = explode('-',$files[0]);
list(,,$id) = $parts;
$id = substr($id,0,-4);
$filename = "login/" . $id. '.txt';
//if (file_exists($filename)) {unlink($filename);}
foreach ($files as $ndx => $file){
  echo "$file => ";
  $data = file_get_contents("orders/$file");
  $lines = explode("\r",$data);
  foreach($lines as $line){
    $fields = explode('|',$line);
    if($fields[0] == 'PID'){
      $pid = "$line\n";
      list($lineType,,$id,,,$name,,$dob,$gender) =  $fields;
      list($lastname,$firstname) = explode('^',$name);
      $dob = substr($dob,0,4) . '-' . substr($dob,4,2) . '-' . substr($dob,6,2);
    }
    if($fields[0] == 'OBR'){
      $obr = $line;
      $collection = substr($fields[14],0,4) . '-' . substr($fields[14],4,2) . '-' . substr($fields[14],6,2);
      $fields[4] = trim(str_replace("*", "",$fields[4]));
      $fields[4] = trim(str_replace("IgE", "",$fields[4]));
      $fields[4] = trim(str_replace("IgG", "",$fields[4]));
      $fields[4] = trim(str_replace("IgG4", "",$fields[4]));
      $segments = explode('^',$fields[4]);
      $tests[] = array(substr($segments[0],0,4),substr($segments[0],4,1));
      $Code = substr($segments[0],0,4);
      $Type = intval(substr($segments[0],4,1));
      echo substr($segments[0],0,4) . ' ' . $types[$Type];
      $sql = "INSERT IGNORE INTO `cplTest` (`id`, `ClientID`, `Code`, `Type`,`filename`,`obr`) VALUES (NULL, '$id', '$Code', '$Type','$file','$obr');";
      $results = mysqli_query($link,$sql);
    }
    if($fields[0] == 'PV1'){
        $pv1 = "PV1|||||||$fields[7]";
    }
  }
  
  echo "P $id,$lastname,$firstname,$dob,$gender,$collection\n";    
  $sql = "INSERT IGNORE INTO `cplPatient` (`id`, `ClientID`, `Lastname`, `Firstname`, `DoB`, `Gender`, `Collection`) 
  VALUES (NULL, '$id', '$lastname', '$firstname', '$dob', '$gender','$collection');";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){ echo "$sql\nerr3: " . mysqli_error($link) . "\n$sql\n";}
  if (!file_exists("login/$file")) {
    file_put_contents("login/$id.txt","$lastname\r\n");
    file_put_contents("login/$id.txt","$firstname\r\n", FILE_APPEND);
    file_put_contents("login/$id.txt","$dob\r\n", FILE_APPEND);
    file_put_contents("login/$id.txt","$gender\r\n", FILE_APPEND);
    file_put_contents("login/$id.txt","$collection\r\n", FILE_APPEND);
  }

  //$id,$lastname,$firstname,$dob,$gender\n";
}
$sql = "SELECT `Code`, `Type` FROM `cplTest` WHERE `ClientID`='$id'";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo "$sql\nerr3: " . mysqli_error($link) . "\n$sql\n";}
while (list($Code,$Type) = mysqli_fetch_array($results, MYSQL_NUM)) {
  file_put_contents("login/$id.txt","$Code$Type\r\n", FILE_APPEND);
}
  //echo "$pid\n";
foreach($tests as $key => $value){break;
  list($Code,$Type) = $value;
  $sql = "INSERT INTO `cplTest` (`id`, `ClientID`, `Code`, `Type`,`filename`) VALUES (NULL, '$id', '$Code', '$Type',$file);";
  $results = mysqli_query($link,$sql);
  $type = intval($value[1]);
  $obx++;
  $text = "OBX|1|ST|$Code^$types[$Type], $description||$Conc|$units[$Type]|" . $ranges[$Type][$Score] . "|H|||F|||$date\n";
//  echo $text;
  $obx++;
  $text = "OBX|2|ST|$Code||CLASS $Score|||H|||F|||$date\n";
//  echo $text;

}

//var_export($tests);

echo "\nRetreive from database\n";
$sql = "SELECT  `Code`, `Type`, Rast.Description, `obr` FROM `cplTest` JOIN `Rast` USING (`Code`) WHERE `ClientID`='$id'";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo "$sql\nerr3: " . mysqli_error($link) . "\n$sql\n";}
while (list($Code,$Type,$description,$obr) = mysqli_fetch_array($results, MYSQL_NUM)) {
  echo "$Code,$types[$Type],$description => $obr\n";
}


$files = $_POST['files'];
$parts = explode('-',$files[0]);
$parts[2] = substr($parts[2],0,-4);
$filename = "login/" . $parts[2] . '.txt';
if (filesize($filename) > 25){
  foreach ($files as $ndx => $file){
    rename("orders/$file","orders/back/$file");
  }
}
$data = file_get_contents("login/$id.txt");
$data = trim($data);
file_put_contents("login/$id.txt",$data);
$lines = explode("\r\n",$data);
$logins = count($lines) - 5;
$path = "orders/back/*$id.hl7";
$backed = count(glob($path));
$orders = count($_POST['files']);
$sql = "SELECT  COUNT(*) FROM `cplTest` WHERE `ClientID`='$id'";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo "$sql\nerr3: " . mysqli_error($link) . "\n$sql\n";}
list($records) = mysqli_fetch_array($results, MYSQL_NUM);
echo "\nHL7 Processed:$orders\nTest Records:$records\nRecords to Import:$logins\nHL7s Archived:$backed\n\nLogin:\n$data";

$t = microtime(true) - $startTime;
echo "\n\n$t";
exit;
/*
arn:aws:s3:::amx-alis
 AKIAU6MHWHGZDI7T7O6G
Secret Access Key:
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 
$lines = explode("\r",$data);
//var_export($lines);exit;
foreach($lines as $line){ 
  $fields = explode('|',$line);
  var_export($fields);
 // echo $ndx++ . ' ' . "$line \n";
}

MSH|^~\\&||||^|2021103000000|||ORU^R01||T
PID|1|T3931627|230101|T3931627|Doe^Jane||19790307|F
ORC|RE|T3931627|230101
OBR|1|T3931627|230101|F245^1^Egg, Whole||||||||||20211011000000|||||||||||F
OBX|1|ST|F245^1^Egg, Whole||0.04|µg/mL|0.04|E|||F|||20211103000000
OBX|2|ST|||CLASS 1||||||F|||20211103000000
OBR|2|T3931627|230101|F245^3^Egg, Whole||||||||||20211011000000|||||||||||F
OBX|3|ST|F245^3^Egg, Whole||4.83|µg/mL|4.00-7.99|H|||F|||20211103000000
OBX|4|ST|||CLASS 2||||||F|||20211103000000
*/






$sql =  "SELECT `Patient` FROM `Patient` WHERE `ClientID`= '$id' LIMIT 1";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\n";}
list($accession) = mysqli_fetch_array($results, MYSQLI_NUM);
if(mysqli_errno($link)){ echo  "err5: " . mysqli_error($link) . "\n";}
$filename = "results/$parts[0]-$parts[1]-$parts[2]";

if (!file_exists($filename)) {
file_put_contents($filename, "MSH|^~\\&||||^|$date|||ORU^R01||T\n");
file_put_contents($filename, "PID|1|$id|$accession|$id|$patientName||$gender\n", FILE_APPEND);
file_put_contents($filename, "$pv1\n", FILE_APPEND);
file_put_contents($filename, "ORC|1|$id|$accession\n", FILE_APPEND);
$obx = 0;
}
echo "MSH|^~\\&||||^|$date|||ORU^R01||T\n";
echo "PID|1|$id|$accession|$id|$patientName||$gender\n";
echo "$pv1\n";
echo "ORC|1|$id|$accession\n";

  $sql =  "SELECT `Patient`,`Code`,`Type`,`Conc`,`Score` FROM `Test` WHERE `Patient`=$accession";
//echo "$sql\n";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){ echo  "err6: " . mysqli_error($link) . "\n$sql\n";}
  while (list($Patient,$Code,$Type,$Conc,$Score) = mysqli_fetch_array($results, MYSQL_NUM)) {
    if(mysqli_errno($link)){ echo  "err7: " . mysqli_error($link) . "\n";}
    $sql = "SELECT `description` FROM `Rast` WHERE `Code` LIKE '$Code'";
    $result = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo  "err8: " . mysqli_error($link) . "\n$sql\n";}
    list($description) = mysqli_fetch_array($result, MYSQL_NUM);
    if(mysqli_errno($link)){ echo  "err9: " . mysqli_error($link) . "\n";}
    $sql = "SELECT  `obr` FROM `cpl` WHERE `ClientID`='$id' AND `Code` = '$Code' AND `Type` = $Type";
//echo "$sql\n";    
    $result = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo  "err10: " . mysqli_error($link) . "\n$sql\n";}
    list($obr) = mysqli_fetch_array($result, MYSQL_NUM);
    if(mysqli_errno($link)){ echo  "err11: " . mysqli_error($link) . "\n$sql\n";} 
//echo "\np=$Patient,c=$Code,t=$Type,r=$Conc,s=$Score, d=$description\n";
    echo "$obr\n";
    file_put_contents($filename, "$obr\n", FILE_APPEND);
      $obx++;
  $text = "OBX|1|ST|$Code$Type^$types[$Type], $description||$Conc|$units[$Type]|" . $ranges[$Type][$Score] . "|H|||F|||$date\n";
  echo $text;
  file_put_contents($filename, $text, FILE_APPEND);
  $obx++;
  $text = "OBX|2|ST|$Code||CLASS $Score|||H|||F|||$date\n";
  echo $text;
  file_put_contents($filename, $text, FILE_APPEND);

  }

exit;
foreach($tests as $key => $value){
  file_put_contents($filename, $text, FILE_APPEND);
  $type = intval($value[1]);
  $obx++;
  $text = "OBX|1|ST|$Code^$types[$Type], $description||$Conc|$units[$Type]|" . $ranges[$Type][$Score] . "|H|||F|||$date\n";
  echo $text;
  file_put_contents($filename, $text, FILE_APPEND);
  $obx++;
  $text = "OBX|2|ST|$Code||CLASS $Score|||H|||F|||$date\n";
  echo $text;
  file_put_contents($filename, $text, FILE_APPEND);
}
//var_export($lines);




























?>