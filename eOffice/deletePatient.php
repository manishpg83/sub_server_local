<?
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$del = $_POST['number'];
echo "\n\n$del";
file_put_contents("temp.txt", $del, FILE_APPEND);
$sql = "UPDATE `history` SET `status`='C' WHERE `id` =  '$del'";
$results = mysqli_query($link,$sql);
exit;
?>