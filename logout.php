<?php
session_name('amxs') ; 
session_start() ;
if(isset($_SESSION['amxs'])) {
  $_SESSION = array();
  $params = session_get_cookie_params();
  setcookie(session_name('amxs'), '', time() - 42000,
  $params["path"], $params["domain"],
  $params["secure"], $params["httponly"]);  
  session_destroy();
}
$id = intval($_COOKIE['amxc']);
if ($id > 99999) {
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
echo mysqli_error($link);
$sql = "UPDATE `amx_portal`.`Client` SET  `Logout`= NOW(), `Session`= ' ' WHERE `Client`.`Number` = $id ";
$results = @mysqli_query($link,$sql);
}
setcookie("amxc",'',time()-1800);
header( "Location: http://allermetrix.com" ) ;
exit;
?>
