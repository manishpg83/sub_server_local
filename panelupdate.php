<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$err1= 0;
$err2 = 0;
$err3 = 0;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$t = microtime(1);
$ndx = 0;
$recs = 0;
$sql = "TRUNCATE `amx_portal`.`Panels`";
mysqli_query($link,$sql);
$data = explode("\r\n",file_get_contents('/home/amx/update/panels.txt'));
foreach($data as $key => $line){
  list($number,$description,$fee,$tests) = explode('|',$line);
 // echo "PAN Line= $line<br>\n";
  $number = trim($number);
  $description = trim($description);
  $description = str_replace('©','',$description);
  $description = addslashes($description);
  $tests = intval($tests);
  $sql = "INSERT INTO `Panels`(`rec`,`number`,`description`,`fee`,`tests`,`e`,`g`,`g4`,`total`) VALUES(NULL,'$number','$description','$fee',$tests,0,0,0,0) ON DUPLICATE KEY UPDATE `description` = '$description',`fee`= '$fee',`tests`=$tests;";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}
  $panels++;
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
}
unset($data);

$sql = "TRUNCATE `amx_portal`.`clientPanels`";
mysqli_query($link,$sql);
$data = explode("\r\n",file_get_contents('/home/amx/update/clientpanels.txt'));
foreach($data as $key => $line){
  list($client,$panel,$description,$fee) = explode('|',$line);
  $description = trim($description);
  $panel = trim($panel);
  $description = addslashes($description);
//  echo "CP Line = $line<br>\n";
  $sql = "INSERT INTO `clientPanels`(`rec`,`client`, `panel`,`description`,`fee`,`include`,`e`,`g`,`g4`,`total`) VALUES(NULL,'$client','$panel','$description','$fee',0,0,0,0,0) ON DUPLICATE KEY UPDATE `description` = '$description',`fee`= '$fee';";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err2++; if($err2>10){exit;}}
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
}
unset($data);
$sql = "TRUNCATE `amx_portal`.`PanelTests`";
mysqli_query($link,$sql);
$data = explode("\r\n",file_get_contents('/home/amx/update/paneltests.txt'));
foreach($data as $key => $line){
  list($number,$code, $type) = explode('|',$line);
  $code = trim($code);
  $number = trim($number);
//  echo "PT Line = $line<br>\n";
  $sql = "INSERT INTO `PanelTests`(`rec`,`sort`,`number`,`code`,`type`) VALUES(NULL,0, '$number', '$code', '$type') ON DUPLICATE KEY UPDATE `code` = '$code', `type` = '$type';";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err3++; if($err3>10){exit;}}
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
}

echo "errors= $err1, $err2, $err3";
unset($data);
include('rastupdate.php');
include('panelcounts.php');
include('sortcount.php');















?>