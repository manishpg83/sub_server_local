<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>Food Requests</title>
<style type="text/css">
body{background-color:#f0f2f5 ;color:#008;}.ckbx{margin:0;padding:0;}
#col {columns: 200px 5;}
#content{max-width:1920px;margin-left: auto;margin-right: auto;display:block;}
.e,.g4,.g{display:inline-block;}
.e{background-color:#f00;padding:0px 1px;color:#fff;}
.g4{background-color:#00f;padding:0px 1px;color:#fff;}
.g{background-color:#ff0;padding:0px 1px;color:#000;}
h2{margin:0; padding:0;}
#up,#down,#left,#right{display:inline-block;cursor:pointer;padding:0 4px 0 4px;}
#legend{display:inline-block;font-size:1.4em;        }
#margin{display:inline-block;                        }
input[type=checkbox] {transform: scale(1.3);}
</style></head>
<body>
<div id="margin"><div id="up" onclick = "left()"><img src="left.png"/></div><div id="right" onclick = "right()"><img src="right.png"/></div>
<div id="up" onclick = "up()"><img src="up.png"/></div><div id="down" onclick = "down()"><img src="down.png"/></div></div>
<div id="legend"><span class="e">&#x2001; IgE &#x2001;</span><span class="g4">&#x2001; IgG4 &#x2001;</span><span class="g">&#x2001; IgG &#x2001;</span> &#x2001;  </div>

</div>
<div id="content">
<form action="index.php" method="post">
<div id="col">

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx',$data);
mysqli_select_db($dbc,'amx_portal');
echo "<h2>Food</h2>\n";
$sql = "SELECT `code`,`description` FROM `rast` WHERE `type` LIKE 'F%' ORDER BY `rast`.`description` ASC";
$results = mysqli_query($dbc,$sql);
while (list($code,$description) = @mysqli_fetch_array($results, MYSQLI_NUM)) {
  echo "<div class=\"chks\"><div class=\"e\"><input id=\"$code-1\" name=\"$code-1\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g4\"><input id=\"$code-3\" name=\"$code-3\" class=\"ckbx\" type=\"checkbox\" /></div><div class=\"g\"><input id=\"$code-2\" name=\"$code-2\" class=\"ckbx\" type=\"checkbox\" /></div> $description</div>\n";
}


echo <<<EOT
</div>
<button>Submit</button>
<input type="hidden" name="grp" value="food"/>
</form>
<script type="text/javascript"> //<![CDATA[
document.getElementById("col").style.columnCount = 6;
var checks = new Array();
checks = [
EOT;
$values = '';
$json = file_get_contents('checked.jsn');
$checked = json_decode($json,1);
$checks = $checked['food'];
foreach($checks as $k => $v){
  $values = $values . "'$v',";
}
$values = substr($values,0,-1);
echo "$values ];";
echo <<<EOT
document.getElementById("legend").style.position = "absolute";
var xMargin = document.getElementById('legend').getBoundingClientRect().right ;
//alert(xMargin);
function init(){
  document.getElementById('content').style.maxWidth = '1920px';
  document.getElementById('content').style.fontSize = '1.2em';
  pos();
  checks.forEach(element => document.getElementById(element).checked = true);
  
}
function pos(){
  var x = document.getElementById('col').getBoundingClientRect().left ;
 // alert(x + ' > ' + xMargin);
  if(x > xMargin ){document.getElementById("legend").style.left = x + 'px';}else{document.getElementById("legend").style.left = xMargin + 'px';}
  
}
function up(){   document.getElementById('content').style.fontSize = (parseFloat(document.getElementById('content').style.fontSize) + 0.1) + "em";}
function down(){ document.getElementById('content').style.fontSize = (parseFloat(document.getElementById('content').style.fontSize) - 0.1) + "em";}
function left() {document.getElementById('content').style.maxWidth = (parseInt(document.getElementById('content').style.maxWidth) + 50) + "px";pos();}
function right(){document.getElementById('content').style.maxWidth = (parseInt(document.getElementById('content').style.maxWidth) - 50) + "px";pos();}
window.onload = init;  
//window.onresize  = pos;  
//]]>
</script>
</body></html>
EOT;
?>