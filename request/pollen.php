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
<style type="text/css">
body{background-color:#f0f2f5 ;color:#008;}.ckbx{margin:0;padding:0;}
#col {columns: 100px 4;}
#content{max-width:1366px;margin-left: auto;margin-right: auto;display:block;font-size:1.3em;}
.e,.g4,.g{display:inline-block;}
.e{background-color:#f00;padding:0px 1px;color:#fff;}
.g4{background-color:#00f;padding:0px 1px;color:#fff;}
.g{background-color:#ff0;padding:0px 1px;color:#000;}
h2{margin:0; padding:0;}
input[type=checkbox] {transform: scale(1.3);}
</style></head>
<body>
<div id="content">
<div id="legend"><span class="e">&#x2001; IgE &#x2001;</span><span class="g4">&#x2001; IgG4 &#x2001;</span><span class="g">&#x2001; IgG &#x2001;</span></div>
<form action="index.php" method="post">
<div id="col">

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx',$data);
mysql_select_db('amx_portal');
echo "<h2>Grass</h2>";
$sql = "SELECT `code`,`description` FROM `rast` WHERE `type` LIKE 'G%' ORDER BY `rast`.`description` ASC";
$results = mysql_query($sql);
while (list($code,$description) = @mysql_fetch_array($results, MYSQL_NUM)) {
  echo "<div class=\"chks\"><div class=\"e\"><input id=\"$code-1\" name=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g4\"><input id=\"$code-3\" name=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g\"><input id=\"$code-2\" name=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /></div> $description</div>\n";
}
echo "<hr/><h2>Tree</h2>";
$sql = "SELECT `code`,`description` FROM `rast` WHERE `type` LIKE 'T%' ORDER BY `rast`.`description` ASC";
$results = mysql_query($sql);
while (list($code,$description) = @mysql_fetch_array($results, MYSQL_NUM)) {
  echo "<div class=\"chks\"><div class=\"e\"><input id=\"$code-1\" name=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g4\"><input id=\"$code-3\" name=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g\"><input id=\"$code-2\" name=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /></div> $description</div>\n";
}
echo "<hr/><h2>Weed</h2>";
$sql = "SELECT `code`,`description` FROM `rast` WHERE `type` LIKE 'W%' ORDER BY `rast`.`description` ASC";
$results = mysql_query($sql);
while (list($code,$description) = @mysql_fetch_array($results, MYSQL_NUM)) {
  echo "<div class=\"chks\"><div class=\"e\"><input id=\"$code-1\" name=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g4\"><input id=\"$code-3\" name=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g\"><input id=\"$code-2\" name=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /></div> $description</div>\n";
}

echo <<<EOT
</div>
<button>Submit</button>
<input type="hidden" name="grp" value="pollen"/>
</form>
<script type="text/javascript"> //<![CDATA[
var checks = new Array();
checks = [
EOT;
$values = '';
$json = file_get_contents('checked.jsn');
$checked = json_decode($json,1);
$checks = $checked['pollen'];
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