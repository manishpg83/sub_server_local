<?
// home/amx/public_html/HL7/postHL7.php
  $client = $_GET['client'];
  $client = 200424;
	chdir("/home/amx/HL7/$client/");
	echo "\nPost Include $client\n";
    include "/home/amx/HL7/$client/makehl7.php";
?>