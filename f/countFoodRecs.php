<?php
header('Content-Type: text/plain; charset=utf-8');
ob_start("ob_gzhandler");
$startTime = microtime(true);
$err = '';
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=@mysql_connect('localhost','amx',$data);
@mysql_select_db('amx_portal');

$sql = "SELECT `client`,COUNT(*) FROM `history` WHERE 1 GROUP BY `client`ORDER BY `client` ";
$results = mysql_query($sql);
while(list($client,$count) =  mysql_fetch_array($results, MYSQL_NUM)){
  $buttons[] = $client;
  $counts[$client] = $count;
}
var_export($counts);exit;

$sql ="SELECT `id`, `client`,`foods` FROM `history` WHERE 1";
$results = mysql_query($sql);
while(list($id,$client,$jsn) =  mysql_fetch_array($results, MYSQL_NUM)){
  $data = json_decode($jsn,1);
  $cnt = count($data[0]);
  echo "$id $client, $cnt\n";
  if($cnt < 5){
    $sql = "DELETE FROM `history` WHERE `id` = $id";
	$result = mysql_query($sql);
  }
  
}
exit;


$sql = "SELECT `foods` FROM `history` WHERE `id` = 198";
$results = mysql_query($sql);
(list($jsn) =  mysql_fetch_array($results, MYSQL_NUM));
$data = json_decode($jsn,1);foreach($data[0] as $code => $x){$foods[] = $code;}
var_export($foods);

?>

