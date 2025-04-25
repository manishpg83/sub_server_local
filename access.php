<?
header('Content-Type: text/plain; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=3600');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$sql = "SELECT `Client`, `ip`,COUNT(*) AS `CNT` FROM `access` WHERE CHAR_LENGTH(`ip`) > 10 AND `Client` > 199999 AND `TimeStamp` > '2022-06-10' GROUP BY `client` ORDER BY `CNT` DESC";
$results = mysqli_query($link,$sql);
if (mysqli_errno($link) > 0){echo mysqli_error($link) . "<h4>$sql</h4>";}



while (list($client,$ip,$cnt) = mysqli_fetch_array($results , MYSQLI_NUM)) {	echo "$client $cnt\n";}


//

?>