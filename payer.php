<?php  ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet $patient</title>
<style type="text/css">
</style></head><body>
<pre>
EOT;
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510'); @mysqli_select_db($dbc,'amx_portal');


    $header = true;
    $data = array();
    if (($fp = fopen('claims.csv', 'r')) !== FALSE)
    {
      while (($data = fgetcsv($fp, 1000, ',')) !== FALSE){
	  $sql = "INSERT INTO `amx_portal`.`payer` (`PayerId`, `PayerNames`, `States`, `Models`, `Lob`, `Cards`, `ReEnroll`, `Enroll`, `TPO`, `Services`, `Reporting`, `Cob`, `ICD10Ready`, `ICD10Testing`, `ICD10Required`, `Additional`) VALUES ('$data[2]', '$data[3]', '$data[4]', '$data[5]', '$data[6]', '$data[7]', '$data[8]', '$data[9]', '$data[10]', '$data[11]', '$data[12]', '$data[13]', '$data[14]', '$data[15]', '$data[16]', '$data[17]');";
	  mysqli_query($dbc,$sql);
	  }
    }
	fclose($fp);
    print_r($data);
echo '</body></html>';
?>