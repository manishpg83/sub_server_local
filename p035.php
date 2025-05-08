<!DOCTYPE html>
<html lang="en"><head>
  <title>Restricted</title>
<style>body{margin:2% 20% 0 20%;background-color:#272727;color:#e2e2e2}#link{text-decoration:none; color:white;}#sub{font-size:2em;width:300px}</style></head>
<body><pre>
<?php


if ( $_SERVER['REMOTE_ADDR'] == '99.3.148.16' || $_SERVER['REMOTE_ADDR'] == '173.162.23.21' ){
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
$error = mysqli_error($dbc);
if (strlen($error) > 0){
  print "DBC: $error <br/>";
}
mysqli_select_db($dbc,'amx_portal');
$error = mysqli_error($dbc);

$fp = fopen('Patients035x.csv',"w");
$sql = "SELECT `Patient`, `Last`,`First`,`Date` FROM `Patient` WHERE `Client` = 200035";
$results = @mysqli_query($dbc,$sql);
$error = mysqli_error($dbc);
if (strlen($error > 0)) {
echo "<p>$error</p>";
}
WHILE ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
  list($year, $month, $day) = split('[/.-]', $row[3]);
  $line = $row[0] . ',"' . $row[1] .'","' . $row[2] .'",' . "$month-$day-$year"  . "\n";
  fwrite($fp,$line);
  echo $line . '<br>';
 }
}
?>
