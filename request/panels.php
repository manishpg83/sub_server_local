<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Panels</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style type="text/css">
body{background-color:#f0f2f5 ;color:#008;}.ckbx{margin:0;padding:0;}
#col {columns: 100px 2;}
#content{max-width:1366px;margin-left: auto;margin-right: auto;display:block;font-size:1.3em;}
.e,.g4,.g{display:inline-block;}
.e{background-color:#f00;padding:0px 1px;color:#fff;}
.g4{background-color:#00f;padding:0px 1px;color:#fff;}
.g{background-color:#ff0;padding:0px 1px;color:#000;}
h2{margin:0; padding:0;}
input[type=checkbox] {transform: scale(1.3);}
.brk{-webkit-column-break-inside: avoid;
	break-inside: avoid;}
</style></head>
<body>
<div id="content">
<form action="index.php" method="post">
<div>

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx',$data);
mysqli_select_db($dbc,'amx_portal');
echo "<div id=\"yp\"><h2>Your Panels</h2>";
$sql = "SELECT `panel`,`description` FROM `clientPanels` WHERE `client` = 200005 ORDER BY `description` ASC";
$results = mysqli_query($dbc,$sql);
while (list($code,$description) = @mysqli_fetch_array($results, MYSQLI_NUM)) {
  echo "<div class=\"chks\"><input id=\"$panel\" name=\"$panel\" class=\"ckbx\" type=\"checkbox\" /> $description</div>\n";
}
echo '<div id="ap"><h2>Allermetrix Panels</h2>';
$txt = file_get_contents('../login/panels.txt');
$txt = str_replace("\r",'',$txt);
$panels = explode("\n",$txt);
//echo '<pre>';var_export($panels);echo '</pre>';
foreach($panels as $v){
 // if (len(trim($v)) < 3)){continue;}
  $panel = trim(substr($v,0,9));
  $description = trim(substr($v,10));
  echo "<div class=\"chks\"><input id=\"$panel\" name=\"$panel\" class=\"ckbx\" type=\"checkbox\" /> $panel $description</div>\n";
}

echo <<<EOT
</div>
<button>Submit</button>
<input type="hidden" name="grp" value="panels"/>
</form>
<script type="text/javascript"> //<![CDATA[
var checks = new Array();
checks = [
EOT;
$values = '';
$json = file_get_contents('checked.jsn');
$checked = json_decode($json,1);
$checks = $checked['panels'];
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