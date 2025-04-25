<?

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$text = file_get_contents("/home/amx/HL7/postHL7500258.txt");
list($client,$accession,$specimen) = explode('|',$text);
chdir("/home/amx/HL7/$client/");
include "/home/amx/HL7/$client/makehl7.php";





?>