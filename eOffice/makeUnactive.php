<?

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$rec = $_POST['rec'];
$sql = "UPDATE `history` SET `status`='C' WHERE `id` = '$rec'";
$results = mysqli_query($link,$sql);
$id = intval($_COOKIE['amxc']);
//echo "\ncookie1: $id\n";
$_COOKIE['amxc'] = $id;

$client = $id;

header("Location: http://dev.amxemr.com/requestForm.php?client=$client");
//echo "\ncookie2: $client\n";
exit; 

?>