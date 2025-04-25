<?


include('/home/amx/HL7/200424/makehl7.php');
exit;

include('/home/amx/HL7/200424/UpdateResults.php');
exit;

$details = explode("\n",file_get_contents('post200424.txt'));
foreach($details as $text){
chdir("/home/amx/HL7/");

}
?>