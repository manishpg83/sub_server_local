<?php

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx',$data);
mysql_select_db('amx_portal');

$sql = "SELECT `Code`,`description` FROM `Rast` WHERE `Code` LIKE 'F%' ORDER BY `Rast`.`description` ASC";
$results = mysql_query($sql);
while (list($code,$description) = @mysql_fetch_array($results, MYSQL_NUM)) {
  echo "<div class=\"chks\"><input id=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /> $description</div>\n";
}
?>