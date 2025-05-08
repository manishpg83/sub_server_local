<?php
$c = intval($_POST['c']);
$p = intval($_POST['p']);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
mysqli_query($link,"UPDATE `amx_portal`.`Patient` SET `Done` = $c WHERE `Patient`.`Patient` =$p;");
//$r = mysqli_errno($dbc);
//file_put_contents('checks.txt',"$p,$c,$r\n");
?>