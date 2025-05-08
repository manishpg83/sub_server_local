<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Food Requests</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style type="text/css">body{background-color:#d6eaf8;color:#008;}.ckbx{margin:0;padding:0;}
#col {
  columns: 100px 4;
}
</style></head>
<body>
<form action="index.php" method="post">
<div id="col">

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx',$data);
mysqli_select_db($dbc,'amx_portal');

$sql = "SELECT `code`,`description` FROM `rast` WHERE `type` LIKE 'S' ORDER BY `rast`.`description` ASC";
$results = mysqli_query($dbc,$sql);
while (list($code,$description) = @mysqli_fetch_array($results, MYSQLI_NUM)) {
  echo "<div class=\"chks\"><input id=\"$code-1\" name=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-3\" name=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /><input id=\"$code-2\" name=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /> $description</div>\n";
}

echo <<<EOT
</div>
<button>Submit</button>
<input type="hidden" name="grp" value="chemical"/>
</form>
<script type="text/javascript"> //<![CDATA[
var checks = new Array();
checks = [
EOT;
$values = '';
$json = file_get_contents('checked.jsn');
$checked = json_decode($json,1);
$checks = $checked['chemical'];
foreach($checks as $k => $v){
  $values = $values . "'$v',";
}
$values = substr($values,0,-1);
echo "$values ];";
echo <<<EOT

function init(){
  checks.forEach(element => document.getElementById(element).checked = true);
 // checks.forEach(element => console.log(element));
}
window.onload = init;
//]]>
</script>
</body></html>
EOT;
?>