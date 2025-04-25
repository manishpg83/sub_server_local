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
<html lang="en"><head><title>CPL Patient Review</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style>
body {font:700 1.5em Arial;}
td,tr {border: 1px solid black;}
td {padding: 5px;text-align:center;}
.left{text-align:left;}
</style></head><body>
EOT;
 

$accession = intval($_GET['accession']);
$sql = "SELECT `ClientID` FROM `cplPatient` WHERE `Patient`=$accession";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err1: " . mysqli_error($link) . "\n$sql\n";}
list($id) = mysqli_fetch_array($results, MYSQLI_NUM);
if(mysqli_errno($link)){ echo  "err2: " . mysqli_error($link) . "\n$sql\n";}

//OBX|1|ST|F0032^IgG, Codfish||49.12|µg/mL|47.95-85.44|H|||F|||2022020700000
//OBX|2|ST|F003||CLASS 5|||H|||F|||2022020700000
echo "<table><tr><td>Code</td><td>Description</td><td>Class</td><td>Conc</td><td>Range </td><td>High</td></tr>\n";
$sql = "SELECT `filename`,`Code`,`Type`,`Conc`,`Score`,Rast.Description FROM `cplTest` JOIN `Rast` USING (`Code`) WHERE `ClientID` LIKE '$id' ";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err3: " . mysqli_error($link) . "\n$sql\n";}
while (list($filename,$Code,$Type,$Conc,$Score,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){
//  echo "filename=$filename<br>\n";
  $data = file_get_contents("results/$filename");
//  var_export($data);
  $lines = explode("\n",$data);
  foreach($lines as $line){//ORC|RE|T0089849|600150
	if(substr($line,0,3) == 'ORC'){
	  list(,,$id,$accession) = explode('|',$line);
    }
	if(substr($line,0,3) == 'PID'){//PID|1|T0089849||T0089849|ZTEST^IGE||1985-01-31|2022-01-05
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

?>