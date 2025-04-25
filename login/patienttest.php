<?php
header('Content-Type: text/plain charset=utf-8');

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
  $sql = "SELECT `Patient`,`Client` FROM `Patient` WHERE `Patient` > 230000 ORDER BY `Client`";
//echo $sql;exit;
  $results = mysqli_query($link,$sql);
  while (list($accession,$client) = mysqli_fetch_array($results, MYSQLI_NUM)){
	$sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $accession LIMIT 1";
	$result = mysqli_query($link,$sql);
	list($cnt) = mysqli_fetch_array($result, MYSQLI_NUM);
  $patients[$accession] = "$cnt | $accession | $client";
  } 
var_export($patients);

?>