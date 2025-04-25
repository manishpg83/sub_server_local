<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"/><meta name="viewport" content="width=800"><title>New Orders</title>
<style>
table,td,tr{border:1px solid #000;border-collapse: collapse;}
.center{text-align:center;}
.warn{color:#f00;}
button{margin:0;padding:0;width:65px;font-size:.7em;color:#fff;background: linear-gradient(to bottom, #00f 0%, #004 100%);}
form{display:inline-block;}
.name{display:inline-block;width:100px;margin:0 5px 0 0;padding:0;overflow: hidden;}
</style></head><body><pre>

EOT;
ob_flush();
//$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
//$link = mysqli_connect('localhost','amx',$data,'amx_portal');

date_default_timezone_set('America/Chicago');
$time = time() - 1209600; // 14 days back
$date = date('Y-m-d',$time);
/*

$sql = "SELECT `ClientID`,`Patient` FROM `hl7Patient` WHERE `date` > '$date' ";
$results = mysqli_query($link,$sql);
while (list($id,$accession) = mysqli_fetch_array($results, MYSQLI_NUM)){if($accession < 200000){continue;}$accessions[$id] = $accession;}
$min = min($accessions);
$max = max($accessions);
$sql = "SELECT `Patient`,`ClientID`,`Status`,`Date` FROM `Patient` WHERE  `Patient` BETWEEN $min AND $max  AND `Client` = 200032";
$results = mysqli_query($link,$sql);
while (list($accession,$id,$status,$date) = mysqli_fetch_array($results, MYSQLI_NUM)){$loginDates[$id] = $date;$clientid[$accession] = "$id";$stats[$id] = $status;}
$startTime = microtime(true);
$today = date("Ymd");
$time = date('D m-d g:i a');
$logfile = '/home/amx/public_html/HL7/log/' . $today . '.log';
if(!file_exists($logfile)){
  file_put_contents($logfile,"Start $time\n");
}
else{
  file_put_contents($logfile,"\n\nStart $time ********************\n", FILE_APPEND);
}


*/

$logfile = '/home/amx/HL7/200424/log.txt';
file_put_contents($logfile,'');
$client = 200424;
//$data = file_get_contents('/home/amx/HL7/200424/Orders/*.HL7'); 
$id = 200424;
$path = "/home/amx/HL7/200424/Orders/*.hl7";
$orders = glob($path);
$cntFiles = count($orders);
if($cntFiles == 0){
  echo file_get_contents($logfile);
  exit;
}
foreach($orders as $file){

  $HL7 = file_get_contents($file);
  echo "\n$HL7\n";
  chdir("/home/amx/HL7/$client/");
  include "/home/amx/HL7/$client/readHL7.php";

}
echo "<pre>";
var_export($orders);
exit;





$logfile = '/home/amx/HL7/200424/log.txt';
file_put_contents($logfile,'');
$id = 200424;
$path = "/home/amx/HL7/200424/Orders/*.hl7";
$orders = glob($path);
$cntFiles = count($orders);
file_put_contents($logfile,"$date $time $cntFiles HL7 orders found \n", FILE_APPEND);
if($cntFiles == 0){
  echo file_get_contents($logfile);
  exit;
}
var_export($orders);
$text = '';
$files = array();
$save = '';
$ndx = 1;
$adj = array(0,0,0,2,2,2,1);
foreach ($orders as $key => $filename){
	//break;
    $text = '';
    $file = substr($filename,7);
    $data = explode('-',$file);
    $year = substr($data[0],0,4);
    $month = substr($data[0],4,2);
    $day = substr($data[0],6,2);
    $filedate = "$month/$day/$year";
    $time = strtotime($filedate);
    $filedate = date('D m-d',$time);
    $dow = date('D',$time);
    $numdow = date('w',$time);
    $now = time();
    $age = time() - $time;
    $days = intval($age / 86400) - $adj[$numdow];
	if($days < 0){$days += $adj[$numdow];}
    list(,,$id) = explode('-',$filename);
    $id = substr($id,0,-4);
    $text = "$days days old";
    if($days > 4){$text = "<span class=\"warn\">$days days old! ◄————— </span>";}
    $sql = "SELECT `Code` FROM `hl7Test` WHERE `ClientID` LIKE '$id'";
    $results = mysqli_query($link,$sql);
    $cnt = intval(mysqli_num_rows($results)); 
    $logins = 0;
    $loginFile = "login/$id.txt";
    if (file_exists($loginFile)){
      $data = file_get_contents($loginFile);
      $lines = explode("\r\n",$data);
      if(strlen($lines[2]) != 10 && strlen($lines[3]) > 1){echo "deleted $loginfile\n";unlink($loginFile);$logins = 0;}
      $logins = count($lines) - 6;
      if($logins != $cnt){unlink($loginFile);$logins = 0;}
    }
    if($logins > 0 && $cnt > 0 && $logins == $cnt){
	  if($id != $save){
		$logdate = date('m-d D',strtotime($loginDates[$id]));
		if($logdate == '12-31 Wed'){
		  if($accessions[$id] > 200000){$logdate = 'Serum received&emsp;&emsp;&emsp;&emsp;';}
		  else{$logdate = $logdate . 'serum not received&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;';}
		}                 
        file_put_contents($logfile,"$ndx Login:$logins, hl7Test:$cnt<form action=\"check.php\" method=\"post\"><button name=\"id\" value=\"$id\" >$id</button></form><div class=\"name\"> $lines[0]</div> $stats[$id] $accessions[$id] $logdate " . $clientid[$accessions[$id]] . " $filedate $text\n", FILE_APPEND);
        $save = $id;
      }
      $ndx++;
	  $save = $id;
      rename("/home/amx/HL7/orders/$file","/home/amx/public_html/hl7/orders/back/$file");
      continue;
    }
    $files[$id][] = $file;
}


//$logfile = '/home/amx/public_html/HL7/500258/log.txt';
//file_put_contents($logfile,'');
$post = array();
foreach($files as $id => $filenames){
  foreach($filenames as $file){
    $sql = "SELECT COUNT(*) FROM `hl7Patient` WHERE `ClientID`='$id'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){file_put_contents($logfile,mysqli_error($link), FILE_APPEND);}
    list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM);
    $data = file_get_contents($file);
    $lines = explode("\r",$data);
    $loginFile = "/home/amx/HL7/200424/Orders/login$id.txt";
    $exists = file_exists($loginFile);
    foreach($lines as $line){
      if(substr($line,0,3) == 'PID'){
        $pid = "$line\n";
        list(,,$id,,,$name,,$dob,$gender) = explode('|',$line);
        list($lastname,$firstname) = explode('^',$name);
        $dob = substr($dob,0,4) . '-' . substr($dob,4,2) . '-' . substr($dob,6,2);
      }
      if(!$exists AND substr($line,0,3) == 'OBR'){
        list(,,,,,,,,,,,,,,$collection) = explode('|',$line);
        $collection = substr($collection,0,4) . '-' . substr($collection,4,2) . '-' . substr($collection,6,2);
        if(strlen($collection) < 8){$collection = '';}
        $lastname = mysqli_real_escape_string($link, $lastname);
        $sql = "INSERT IGNORE INTO `hl7Patient` (`id`, `ClientID`, `Lastname`, `Firstname`, `DoB`, `Gender`, `Collection`,`file`) 
        VALUES (NULL, '$id', '$lastname', '$firstname', '$dob', '$gender','$collection','$file');";
        $results = mysqli_query($link,$sql);
        if(mysqli_errno($link)){file_put_contents($logfile,"ERROR $id: " . mysqli_error($link) . "\n", FILE_APPEND);}
        file_put_contents($loginFile,"$lastname\r\n");
        file_put_contents($loginFile,"$firstname\r\n", FILE_APPEND);
        file_put_contents($loginFile,"$dob\r\n", FILE_APPEND);
        file_put_contents($loginFile,"$gender\r\n", FILE_APPEND);
        file_put_contents($loginFile,"$collection\r\n", FILE_APPEND);
        $sql = "SELECT `id`  FROM `hl7Patient` WHERE `ClientID` LIKE '$id'";//echo "hl7Pat $sql\n";
        $results = mysqli_query($link,$sql);
        list($cnt) = mysqli_fetch_array($results, MYSQLI_NUM);
        if($cnt == 0){file_put_contents($logfile,"<span class=\"warn\"ERROR</span> $id Not Added to hl7Patient\n", FILE_APPEND);}
        $results = mysqli_query($link,$sql);
        break 2;
      }
    } 
  }
}
foreach($files as $id => $filenames){
  $ids[$id] = intval($ids[$id]) + 1;
  foreach($filenames as $file){
    $data = explode('-',$file);
    $year = substr($data[0],0,4);
    $month = substr($data[0],4,2);
    $day = substr($data[0],6,2);
    $filedate = "$month/$day/$year";
    $data = file_get_contents("$file");
    $lines = explode("\r",$data);
    foreach($lines as $line){
      if(substr($line,0,3) == 'OBR'){
        list($a,$b,$c,,$allergen,$d,$collection) = explode("|",$line);
        $Code = substr($allergen,0,4);
        $Type = substr($allergen,4,1); 
        $sql = "INSERT IGNORE INTO `hl7Test` (`id`, `ClientID`, `Code`, `Type`,`filename`,`obr`) VALUES (NULL, '$id', '$Code', '$Type','$file','$line');";
        $results = mysqli_query($link,$sql);
        file_put_contents("/home/amx/HL7/500258/Orders/login$id.txt","$Code$Type\r\n", FILE_APPEND);
      }
    }
 //   rename("/home/amx/public_html/hl7/orders/$file","/home/amx/public_html/hl7/orders/back/$file");
  }
}
if(count($ids) > 0){
  foreach($ids as $id => $recs){
    $logins = 0;
    $loginFile = "login/$id.txt";
    if (file_exists($loginFile)){
      $data = file_get_contents($loginFile);
      $lines = explode("\r\n",$data);
      $logins = count($lines) - 6;
      if($logins < 1){unlink($loginFile);$logins = 0;}
    }
    $sql = "SELECT `Code` FROM `hl7Test` WHERE `Client` LIKE '$id'";//echo "$sql\n";
    $results = mysqli_query($link,$sql);
    $cnt = intval(mysqli_num_rows($results)); 
    $class= '<span>';
    if($cnt != $logins){
      $class = '<span class="warn">';
    }
    file_put_contents($logfile,"$ndx $id processed $class $logins Login records,  $cnt hl7Test records</span>\n", FILE_APPEND);
    $ndx++;
  }
}
echo file_get_contents($logfile);

?>





















