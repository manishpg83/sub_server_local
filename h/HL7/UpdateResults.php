<?
 chdir("/home/amx/HL7/");
echo "<pre>\n";
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$details = explode("\n",file_get_contents('postHL72304201952.txt'));  // list of patients ($client,$accession,$specimen)
var_export($details);
foreach($details as $text){

  list($client,$accession,$specimen) = explode("|",$text);
$specimen = trim($specimen);
echo "\nc=$client, a=$accession, s=$specimen";




  $text = file_get_contents($accession . '.txt');
  $lines = explode("\n",$text);
  var_export($lines);
  foreach($lines as $data){
    list($code,$type,$value,$score) = explode("|",$data);
    echo "\n$code,$type,$value,$score\n ";
	if($type == 0){continue;}
	if($code == 'A999'){continue;}
	$sql = "INSERT INTO `hl7Test` (`id`, `Client`, `ClientID`, `Patient`, `Code`, `Type`, `Conc`, `Score`, `filename`, `obr`, `hl7`) VALUES (NULL, '500258', '$specimen', '$accession', '$code', '$type', $value, '$score', '', '', '{}')";
	$results = mysqli_query($link,$sql);
    $sql = "UPDATE `hl7Test` SET  `Conc`=$value,`Score`='" . trim($score) . "',`Patient`=$accession WHERE `Client`=500258 AND `ClientID`='$specimen' AND `Code`='" . trim($code) . "' AND `Type`='" . trim($type) . "'";
    $results = mysqli_query($link,$sql);
    echo "\n$sql\n";
  }
}
?>