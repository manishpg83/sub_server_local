<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>CPL Results</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style>
body {font:700 1.1em Arial;}
p{margin:2px;}
tr {padding:0;margin:0;}
td {text-align:center;padding:0 4px 0 4px;border: 1px solid black;}
.left{text-align:left;}
.small{font-size:.7em;}
.mono{font-family:courier, courier new, serif;padding:0;margin:0;white-space: nowrap;}
</style></head><body>

EOT;

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

$id = $_GET['id'];  
$accession = intval($_GET['accession']);

$sql = "UPDATE `cplPatient` SET `Patient`='$accession' WHERE `ClientID`= '$id'";
$Results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\n";}
$sql = "SELECT `Code`,`Type`,`Conc`,`Score` FROM `Test` WHERE `Patient`='$accession'";
$Results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\n";}
while (list($Code, $Type, $Conc, $Score) = mysqli_fetch_array($Results, MYSQLI_NUM)){
  $sql = "UPDATE `cplTest` SET `Conc`='$Conc',`Score`='$Score' WHERE `ClientID`='$id' AND `Code`='$Code' AND `Type`= '$Type'";
  $result = mysqli_query($link,$sql);
}

$sql = "SELECT  `Lastname`, `Firstname`, `DoB`, `Gender` FROM `cplPatient` WHERE `ClientID`='$id'";
$Results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err4: " . mysqli_error($link) . "\n$sql\n";}
list($Lastname, $Firstname, $DoB, $Gender) = mysqli_fetch_array($Results, MYSQLI_NUM);
if(mysqli_errno($link)){ echo  "err5: " . mysqli_error($link) . "\n";}

$DoB = str_replace('-','',$DoB);
$pid = "PID|1|$id|$patient|$id|$Lastname^$Firstname||$DoB|$Gender\n";
$HL7 = $pid;
$orc = "ORC|RE|$id|$accession\n";
$HL7 .= $orc;
$posts = 0;
$values = 0; 
@mkdir("./Results/$id", 0755);
$sql = "SELECT  `Code`, `Type`,`Conc`, `Score`, Rast.Description,`filename`, `obr` FROM `cplTest` JOIN `Rast` USING (`Code`) WHERE `ClientID`='$id'";
$Results = mysqli_query($link,$sql);
$script1 = 'connect sftp://amx:xD1GkuK7a7DK8!@amxemr.com/home/amx/public_html/cpl/Results' . "/$id \ndir\n" . 'lcd C:\\\\apps\\\\Results\\\\' . "$id\nldir\n";
$script2 = "dir\ndisconnect\nconnect" .  ' sftp://allermetrix_reflab:allermetrix_reflab@edi.sonichealthcareusa.com:9506/Allermetrix/Results' . "\n" . 'lcd C:\\\\Apps\\\\Results\\\\'. "$id\n";
$script3 = "dir\n";
$script4 = ''; 
while (list($Code, $Type, $Conc, $Score,$description,$filename, $obr) = mysqli_fetch_array($Results, MYSQLI_NUM)){
  $filenames[] = $filename;
  $script1 .= 'get --exists s ' . "$filename\n";
  $script2 .= 'put --exists s ' . "$filename\n";
  $script3 .= 'ren //Allermetrix//Results//' . $filename . ' //Allermetrix//Results//In//'. $filename . "\n";
  $script4 .= 'del //Allermetrix//Orders//Out//'. $filename . "\n";
  if(strlen($Conc) > 0 AND strlen($Score) > 0 ){$values++;}
  $return = file_put_contents("Results/$id/$filename", "MSH|^~\\&||||^|$date||ORU^R01||P\n");
  $return = file_put_contents("Results/$id/$filename",$pid , FILE_APPEND);
  $return = file_put_contents("Results/$id/$filename",$orc, FILE_APPEND);

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

  $text = "$obr\nOBX|1|ST|$Code$Type^$types[$Type], $description||$Conc|$units[$Type]|" . $ranges["$Type"] . "|" . $HEN["$Score"] . "|||F|||$date\n";
  file_put_contents("Results/$id/$filename", $text, FILE_APPEND);
  $text = "OBX|2|ST|$Code||CLASS $Score|||" . $HEN["$Score"] . "|||F|||$date\n";
  file_put_contents("Results/$id/$filename", $text, FILE_APPEND);
}
$path = "Results/*$id.hl7";
$Results = count(glob($path));
if($Results != $values){                         
//	echo "*********************************\n****Tests not equal to values*****\n*********************************\n";
}



echo "<p>Posted Results for $accession $id</p><p class=\"small\">These values come from the result HL7 files</p><table><tr><td>Code</td><td>Description</td><td>Class</td><td>Conc</td><td>Range </td><td>High</td></tr>\n";
$sql = "SELECT `filename`,`Code`,`Type`,`Conc`,`Score`,Rast.Description FROM `cplTest` JOIN `Rast` USING (`Code`) WHERE `ClientID` LIKE '$id' ";
$Results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err3: " . mysqli_error($link) . "\n$sql\n";}
while (list($filename,$Code,$Type,$Conc,$Score,$description) = mysqli_fetch_array($Results, MYSQLI_NUM)){
  $data = file_get_contents("Results/$id/$filename");
  $lines = explode("\n",$data);
  foreach($lines as $line){
	if(substr($line,0,3) == 'ORC'){
	  list(,,$id,$accession) = explode('|',$line);
    }
	if(substr($line,0,3) == 'PID'){
	  list(,,$id,,,$name,,$dob,$gender) = explode('|',$line);
	  $DoB = date("F j, Y",strtotime($dob));
	  list($last,$first) = explode("^",$name);
    }
    if(substr($line,0,5) == 'OBX|1'){
      list(,,,$allergen,,$Conc,$units,$range,$high) = explode('|',$line);
	  list($Code,$description) = explode("^",$allergen); 
      echo "<tr><td>$Code</td><td class=\"left\">$description</td><td>$Score  </td><td>$Conc </td><td>$range </td><td>$high</td></tr>\n";
	}
  }
}
echo "</table><br>\n";

echo "Accession=$accession<br>\nLab ID: $id<br>\n";
echo "Last: $last<br>First: $first<br>Lab ID: $id<br>Dob: $dob ($DoB)<br> Gender:$gender<br>\n";
echo "<pre>";
foreach($filenames as $filename){
  @unlink("/home/amx/public_html/cpl/orders/$filename");
  echo file_get_contents("Results/$id/$filename");
  echo "\n";
}
$script3 .= "dir\n";
$script4 .= "disconnect\nquit\n";
file_put_contents("Results/$id/fzUploadResultsCPL.script","$script1$script2$script3$script4");
echo "$script1$script2$script3$script4</pre><br> <br> </body></html>";
?>