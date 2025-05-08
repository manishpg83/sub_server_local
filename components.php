<?php
header('Content-Type: text/plain; charset=utf-8');
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
@mysqli_select_db($dbc, 'amx_portal');
$sql = "SELECT `Description`, `Code` FROM `Foods888887` WHERE `Type` = 0 AND `Description` NOT LIKE '%Family%'";
$results = mysqli_query($dbc, $sql);
while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  echo "$row[1] $row[0] \n";
}
echo "Food Components\n\n";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (128,129,130,131,132,133,134,135)";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (59,60,63,64,70)";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (98,99,100,101,102)";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (131,132,133,134,135)";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (93,94)";
$sql[] = "SELECT `Code`,`Description` FROM `Foods` WHERE `id` IN (290,282, 283, 284, 285, 286, 287, 288, 289,297 )";
foreach ($sql as $q){
  $results = mysqli_query($dbc, $q);
  while($row = mysqli_fetch_array($results, MYSQLI_NUM)){
    if(is_numeric($row[0])){$row[0] = '----';}
    echo "$row[0] $row[1]\n";
  }
  echo "\n\n";
}









?>
