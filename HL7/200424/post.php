<?
$filename = $_GET['filename'];
//$filename = 'postHL72307171549.txt';
echo "<pre>Begin Filename = $filename \n";
 
chdir("/home/amx/HL7/200424/");

include('/home/amx/HL7/200424/makehl7.php');
include('/home/amx/HL7/200424/sftpUpload.php');
?>