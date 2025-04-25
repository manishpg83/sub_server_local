<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>CPL Patient Verify</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style>
body {font:700 1.2em Arial;}
td,tr {border: 1px solid black;padding:4px;}
.mono{font-family:courier, courier new, serif;padding:0;margin:0;white-space: nowrap;}
h3{margin-bottom:0;}
h4{margin:0 0 .5em 0;}
table{margin-left:5em;}
p{margin:0 0 0 5em;}
.red{color:#f00;}
</style></head><body>

EOT;
$text = '';
$overwrite = 0;
$types = array('','IgE','IgG','IgG4');
$id = $_GET['id'];
$assession = $_GET['assession'];

$sql = "SELECT  COUNT(*),`Lastname`,`Firstname`,`DoB`,`Gender`,`Collection`,`Patient` FROM `cplPatient` WHERE `ClientID`='$id'";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err1: " . mysqli_error($link) . "\n$sql\n";}
list($cnt,$Lastname,$Firstname,$DoB,$Gender,$Collection,$Patient) = mysqli_fetch_array($results, MYSQLI_NUM);
if($Collection == '0000-00-00'){$Collection = 'Not Given';}
if(mysqli_errno($link)){ echo  "err2: " . mysqli_error($link) . "\n";}
if($cnt == 1){
  if($Patient == 0){
    $sql = "UPDATE `cplPatient` SET `Patient`=$assession WHERE `ClientID`='$id'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ 
      echo  "<h2>Record Not Updated: " . mysqli_error($link) . "</h2>\n$sql\n";
    }
  }
  else{
    $text = "<h3 class=\"red\">ERROR: Attempt to Overwrite accession: $Patient with $assession for ID $id</h3>";
	$overwrite = 1;
	$assession = $Patient;
  }
  echo "<h3>Check Patient $assession has these allergens </h3>\n";
    echo "<h4>Check Client ID is $id</h4>\n";
    echo "<p>Last: $Lastname</p><p>First: $Firstname</p><p>Lab ID: $id</p><p>Dob: $DoB</p><p>Gender: $Gender</p><p>Collection: $Collection<br>\n";
    if($overwrite == 1){echo $text;}
    echo "<br><table><tr><td>Code</td><td>Type</td><td>Description</td></tr>\n";
    $sql = "SELECT `filename`, `Code`,`Type`,Rast.Description FROM `cplTest` JOIN `Rast` USING (`Code`) WHERE `ClientID` LIKE '$id' ";
    $results = mysqli_query($link,$sql);
    while(list($filename,$Code,$Type,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){
      echo "<tr><td>$Code</td><td>$types[$Type]</td><td>$description</td></tr>\n";
      $data = file_get_contents("orders/back/$filename");
      $lines = explode("\r",$data);
       foreach($lines as $line){
         if(substr($line,0,3) == 'PID'){$pid = "<p class=\"mono\">$line</p>";}
         if(substr($line,0,3) == 'OBR'){
           $obr .= "<p class=\"mono\">$line</p>";
         }
       }
    }
    echo '</table><br>';

  echo $pid . $obr;
  $sql = "SELECT `ClientID`,`Patient` FROM `cplPatient` WHERE `Patient`='$assession'";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){ echo  "err1: " . mysqli_error($link) . "\n$sql\n";}
  list($ClientID,$patient) = mysqli_fetch_array($results, MYSQLI_NUM);
  if(mysqli_errno($link)){ echo  "err2: " . mysqli_error($link) . "\n";}
  if($patient == $assession){
    echo "<p><br>Patient assession number $assession updated successful</p>";
  }
  else{
    echo "<h2 class=\"red\">Patient assession update Failed</h2>";
  }
}
else{
  if($cnt == 0){
    echo "<h2>Cannot update $id:  Record Not Found</h2>";
  }
  else{
    echo "<h2>Cannot update $id: Duplicate Records, $cnt Found</h2>";
  }  
}
?>