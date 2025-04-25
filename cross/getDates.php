<?
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$sql = "SELECT `Patient`,`Date` FROM `Patient` WHERE 1 ";
$results = mysqli_query($link,$sql);
while (list($Patient,$Date) = mysqli_fetch_array($results, MYSQLI_NUM)){$numdate = strtotime($Date);if($numdate < 1){continue;}$dates[$numdate] = "$Patient"; }
ksort($dates);
$cnt = count($dates);
$jsn = json_encode($dates);
file_put_contents('dates.jsn',$jsn);

?>