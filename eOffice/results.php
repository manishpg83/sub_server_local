<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$client = 200424;
$patient = 245854;

echo <<<EOT
Patient ID: $patient
<form id="hl7" action="/home/amx/HL7/200424/results.php method="post"><input type="hidden" name="client" vaule="$client"><input type="hidden" name="patient" vaule="$patient"><submit> </submit>Submit</form>
<script>
document.getElementById("hl7").submit(); 
</script>
EOT;
?>