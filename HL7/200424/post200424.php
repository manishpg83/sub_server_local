<?
$filename = $_GET['filename'];
//$filename = 'postHL72308261432.txt';
echo "<pre>Begin post200424.php Filename = $filename \n";
chdir("/home/amx/HL7/200424/");
include('/home/amx/HL7/200424/makehl7.php');
//include('/home/amx/HL7/200424/sftpUpload.php');
?>