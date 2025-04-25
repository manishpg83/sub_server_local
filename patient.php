<?php
session_name('amxemr') ; 
session_start() ;
if(!isset($_SESSION['visit'])) {
  $_SESSION['visit']=rand(111111111,999999999);
}
if (!isset($_COOKIE['amxemr'])) {
  $id = rand(111111111,999999999);
  $returnValue = setcookie("amxemr",  $id, time() + 2592000) ;
}
$current_time = "Date: " . date("m-d-Y") . " Time: ".date("H:i:s"); 
echo '<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
"http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Allermetrix EMR Portal</title><meta http-equiv="content-type" content="application/xhtml+xml;charset=utf-8"/><meta http-equiv="cache-control" content="max-age=300" /><link rel="stylesheet" type="text/css" href="styles.css"/></head><body><div id="b"><img src="amxlogo.jpg" alt="logo" width="332" height="100"/><br/>';
print "<p>$current_time</p><p>Client: $Client</p>";

settype($Client,"integer");


$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
$error = mysql_error();
if (strlen($error) > 0){
  print "DBC: $error <br/>";
}
mysql_select_db('amx_portal');
$error = mysql_error();
if (strlen($error) > 0){
  print "SEL: $error <br/>";
}




$sql = "SELECT *  FROM `Patient` WHERE `Client` = $Client AND DATE_SUB( CURDATE( ) , INTERVAL $days DAY ) <= `Date` ORDER BY `Date` LIMIT 0 , 50";
$results = @mysql_query($sql);
$error = mysql_error();
if (strlen($error) > 0){
  print "FETCH: $error <br/>";
}
WHILE ($row = mysql_fetch_array($results, MYSQL_NUM)) {
  if ($interval) {
    $bgcolor="#b7ffdb";
    $interval = 0;
  }
  else {
    $bgcolor="#ffcece";
    $interval = 1;
  }

  print "<p>$row[1] $row[2] $row[8] " . '<a href="' . 'test.php?Patient=' . "$row[1]" . '">' . "$row[3] $row[4]</a> $row[7] $row[6]</p>";

}



echo "</div></body></html>";
?>
