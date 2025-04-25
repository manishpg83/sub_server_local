<?php
header('Content-Type: text/plain; charset=utf-8');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$sql = "TRUNCATE TABLE `Rast`";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){echo mysqli_error($link);}
$handle = fopen("rast.txt", "r");
while (($data = fgetcsv($handle, 128, "|")) !== FALSE) {
  list($Code,$description,$sdescription,$shortdescription) = $data;
  echo "$Code,$description,$sdescription,$shortdescription\n";
  $description = addslashes($description);
  $sdescription = addslashes($sdescription);
  $shortdescription = addslashes($shortdescription);
  $sql = "INSERT INTO `Rast` (`id`, `Code`, `description`, `sdescription`, `shortdescription`) VALUES (NULL,'$Code','$description','$sdescription','$shortdescription');";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){echo mysqli_error($link);echo $sql;exit;}
}
?>