<?
return;
$rec = $_POST['rec'];
$id = intval($_COOKIE['amxc']);
echo "1. cli=$client, rec=$rec, id=$id<br>\n";


$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$sql = "UPDATE `history` SET `status`='E' WHERE `id` = '$rec'";
$results = mysqli_query($link,$sql);






$client = intval($_POST['client']);
if($client == 0){$client = intval($_POST['id']);}
if($client == 0){$client = intval($_GET['id']);}
if($client == 0){$client = intval($_GET['c']);}
if($client == 0){$client = intval($_GET['client']);}
if($client == 0){$client = intval($_COOKIE['amxc']);}

$_COOKIE['amxc'] = $client;


header("Location: https://dev.amxemr.com/requestForm.php?clent=$client");

exit; 

?>