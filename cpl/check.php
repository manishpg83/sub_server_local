<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"/><meta name="viewport" content="width=800"><title>CPL Patient Status</title>
<style>
table,td,tr{border:1px solid #000;border-collapse: collapse;}
.warn{color:#f00;font-size:1em;margin:0;padding:0;}
pre{margin:0;}
p{margin:0;padding:0;}
h2{margin:5px 0 5px 0;}
button{margin:0;padding:0;width:65px;}
form{display:inline-block;}
</style></head><body><pre>

EOT;
ob_flush();
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$cnts = array(0 ,23 ,35 ,47 ,59 ,71 ,83 ,95 ,107 ,119 ,131 ,143);
$adj = array(0,0,0,2,2,2,1);
$id = $_POST['id'];

$sql = "SELECT COUNT(*),`Patient`,`Lastname`,`Firstname`,`date` FROM `cplPatient` WHERE `ClientID` LIKE '$id' LIMIT 1";
$results = mysqli_query($link,$sql);
list($cnt,$accession,$last,$first,$date ) = mysqli_fetch_array($results, MYSQLI_NUM);
$time = strtotime($date);
$date = date('D F j, Y  g:i a',$time);
echo "$cnt CPL $id, $accession, $date, $last, $first\n";
if($accession > 200000){
  $sql = "SELECT COUNT(*),`Date`,`Last`,`Status`,`ClientID`,`First`,`Last`  FROM `Patient` WHERE `Patient` = $accession";
  $results = mysqli_query($link,$sql);
  list($cnt,$date,$last,$status,$cid,$first,$last ) = mysqli_fetch_array($results, MYSQLI_NUM);
  if($cnt == 0){
    $accession = 0;
    $last = '';
    $first = '';
    $date = '';
	$status = "Patient Record Not Uploaded ";
  }
  else{
    $time = strtotime($date);
    $date = date('D F j, Y',$time);
  }
  echo "$cnt AMX $status $accession $date, $cid $last, $first \n\nCPL Tests\n";
}
else{
  echo "AMX  Patient Not Logged In\n";
}
$sql = "SELECT `Code`,`Type`,`Conc`,`Score`,`obr`,`filename` FROM `cplTest` WHERE `ClientID` LIKE '$id'\n";
$results = mysqli_query($link,$sql);
$error = "No test records found in CPL test table\n";
while(list($code,$type,$conc,$score,$obr,$filename ) = mysqli_fetch_array($results, MYSQLI_NUM)){
  $error='';
  $data = explode('-',$filename);
  $year = substr($data[0],0,4);
  $month = substr($data[0],4,2);
  $day = substr($data[0],6,2);
  $filedate = "$month/$day/$year";
  $time = strtotime($filedate);
  $filedate = date('D m-d,',$time);
  $now = time();
  $age = time() - $time;
  $days = intval($age / 86400) - $adj[$numdow];
  if($days < 0){$days += $adj[$numdow];}
  if(strlen($conc) == 0){$conc='X';}
  if(strlen($score) == 0){$score='X';}
  echo "CPL $id $code$type, $filedate $days days, conc:$conc, score:$score, $obr\n";
}
echo "$error\n<hr>";


$sql = "SELECT `Status`,`Code`,`Type`,`Conc`,`Score` FROM `Test` WHERE `Patient`=$accession";
$results = mysqli_query($link,$sql);
$cnt = intval(mysqli_num_rows($results)); 
while(list($status,$code,$type,$conc,$score) = mysqli_fetch_array($results, MYSQLI_NUM)){ 
  echo "AMX $accession $code$type $status, conc:$conc, score:$score\n";
}
if($cnt == 0){
echo "AMX Tests not yet posted.\n\n";

}

echo '<hr>' . file_get_contents("login/$id.txt") . '<hr>';

$hl7 = glob("/home/amx/public_html/cpl/Results/$id/*.hl7");
$cnt = count($hl7);
echo "$cnt Result HL7 files found\n";
if($cnt > 0){
  foreach($hl7 as $filename){
    echo "$filename\n";
    $data = file_get_contents($filename);
    $lines = explode("\n",$data);
    foreach($lines as $line){
      if(substr($line,0,3) == 'OBX'){
        echo "$line\n";
  	  }
    }
  }
}
if(file_exists("/home/amx/Z/apps/Results/$id/upload.log")){
  echo "\n<hr>\nUpload Log File\n";
  $data = file_get_contents("/home/amx/Z/apps/Results/$id/upload.log");
  $cnt = substr_count($data, $id);
  $size = strlen($data);
  echo "ID count=$cnt\nfile size=$size\n\n";
  echo str_replace('<DIR>','',$data);
  
}else{echo "No Results HL7 file exists\n";}
if(file_exists("/home/amx/Z/PATRICK/apps/Results/$id/fzUploadResultsCPL.script")){
  echo "\n<hr>\nUpload Script\n\n";
  echo file_get_contents("/home/amx/Z/PATRICK/apps/Results/$id/fzUploadResultsCPL.script");
}else{echo "No Upload Filezilla Script file exists\n";}
ob_flush();
exit;










$results = scandir('/home/amx/Z/PATRICK/apps/Results/');
foreach($results as $id){
  if(file_exists("/home/amx/Z/PATRICK/apps/Results/$id/upload.log")){
    $hl7 = glob("/home/amx/Z/PATRICK/apps/Results/$id/*.hl7");
    $cntFiles = count($hl7);
    $data = file_get_contents("/home/amx/Z/PATRICK/apps/Results/$id/upload.log");
    $size = strlen($data);
    $cnt = substr_count($data, $id);
    $patients[$cntFiles][] = array($id,$cntFiles,$cnt,$size);
//    echo "$id $cntFiles $size $cnt<br>\n";
  }

}
  
  foreach($patients as $cnt => $array){
      echo "<hr><h2>$cnt Expect $cnts[$cnt]</h2>\n";
    foreach($array as $data){
        if($data[2] == $cnts[$data[1]]){continue;}
        if(substr($data[0],0,1) == 'T'){continue;}
      echo "<p><form action=\"check.php\" method=\"post\"><button name=\"$data[0]\" value=\"$data[0]\" >$data[0]</button></form> $data[1] $data[2] $data[3] $data[4] " . $ids[$data[0]];
    }
  }
  
  
?>
