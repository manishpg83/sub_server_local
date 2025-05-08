<?php ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$patient = intval($_GET['p']);
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet $patient</title>
<style type="text/css">
.button,button{width:20em;border:0;display:block;text-align:center;}
button{margin:.1em 30%;}
</style></head><body>
EOT;
ob_flush();
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
@mysqli_select_db($dbc,'amx_portal');
echo mysqli_error($dbc);
$sql ="SELECT `alpha` ,`Description` FROM `Foods` ORDER BY `alpha` ASC, `Description` ASC ";
$results = mysqli_query($dbc,$sql);
echo mysqli_error($dbc);
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  echo "<form action=\"food.php\" method=\"post\"><input name=\"s\" value=\"$row[1]\" type=\"hidden\"><button><div class=\"button\"> $row[1] </div></button></form>";
}
ob_end_flush();


?>