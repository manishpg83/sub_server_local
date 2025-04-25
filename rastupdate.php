<?php

$err1= 0;
$err2 = 0;
$err3 = 0;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
mysqli_set_charset($link, "utf8");
mysqli_query($link,"SET character_set_results = 'utf8', character_set_client = 'utf8', character_set_connection = 'utf8', character_set_database = 'utf8', character_set_server = 'utf8'");
$t = microtime(1);
$ndx = 0;
$recs = 0;
$data = explode("\r\n",file_get_contents('/home/amx/update/rast.txt'));
$patients = 0;
foreach($data as $key => $line){
  list($Code,$description,$sdescription,$shortdescription) = explode('|',$line);

 // echo "RAST Line= $line<br>\n";
  $number = trim($number);
  $description = trim($description);
  $description = addslashes($description);
  $sdescription = addslashes($sdescription);
  $description = addslashes($description);
  $shortdescription = addslashes($shortdescription);
  $tests = intval($tests);
  $sql = "INSERT INTO `Rast`(`id`,`Code`, `description`, `sdescription`, `shortdescription`) VALUES(NULL,'$Code','$description','$sdescription','$shortdescription') ON DUPLICATE KEY UPDATE `description` = '$description',`shortdescription`= '$shortdescription',`sdescription`='$sdescription';";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){ $err1++; if($err1>10){exit;}}
  $panels++;
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
 
  //echo "$number,$description,$fee,$tests<br>\n";
}
unset($data);
//echo "<br>Errors: $err1 ";
?>