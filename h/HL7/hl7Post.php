<?
header('Content-Type: text/html; charset=utf-8');
$filename = $_GET['filename'];
echo "$filename<br>\n";
echo '/home/amx/HL7/' . $filename;
$data = file_get_contents('/home/amx/HL7/' . $filename);
str_replace("\r",'',$data);
$hl7 = explode("\n",$data);
$t = microtime(true);
foreach($hl7 as $text){
  list($client,$accession) = explode('|',$text);
  if($client > 99999 AND $accession > 100000){
	chdir("/home/amx/HL7/$client/");
    include "/home/amx/HL7/$client/makehl7.php";
  }
}
$t =  microtime(true) - $t;
echo $t;
exit;





?>