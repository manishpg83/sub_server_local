<?php
header('Content-Type: text/plain; charset=utf-8');
ob_start("ob_gzhandler");
$startTime = microtime(true);
$err = '';
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=@mysqli_connect('localhost','amx',$data);
@mysqli_select_db($dbc,'amx_portal');

$sql = "SELECT `client`,COUNT(*) FROM `history` WHERE 1 GROUP BY `client`ORDER BY `client` ";
$results = mysqli_query($dbc,$sql);
while(list($client,$count) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $buttons[] = $client;
  $counts[$client] = $count;
}
var_export($counts);exit;

$sql ="SELECT `id`, `client`,`foods` FROM `history` WHERE 1";
$results = mysqli_query($dbc,$sql);
while(list($id,$client,$jsn) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $data = json_decode($jsn,1);
  $cnt = count($data[0]);
  echo "$id $client, $cnt\n";
  if($cnt < 5){
    $sql = "DELETE FROM `history` WHERE `id` = $id";
	$result = mysqli_query($dbc,$sql);
  }
  
}
exit;


$sql = "SELECT `foods` FROM `history` WHERE `id` = 198";
$results = mysqli_query($dbc,$sql);
(list($jsn) =  mysqli_fetch_array($results, MYSQLI_NUM));
$data = json_decode($jsn,1);foreach($data[0] as $code => $x){$foods[] = $code;}
var_export($foods);

?>

