<?php

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx',$data);
mysqli_select_db($dbc,'amx_portal');

$sql = "SELECT `Code`,`description` FROM `Rast` WHERE `Code` LIKE 'F%' ORDER BY `Rast`.`description` ASC";
$results = mysqli_query($dbc,$sql);
while (list($code,$description) = @mysqli_fetch_array($results, MYSQLI_NUM)) {
  echo "<div class=\"chks\"><input id=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /> $description</div>\n";
}
?>