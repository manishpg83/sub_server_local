<?php
$id = intval($_POST['id']);

if($id == 0){$id = intval($_GET['id']);}
if($id == 0){$id = intval($_COOKIE['amxc']);}

$crc = '';//abs(crc32('200036'));
setcookie("amxc", $id,time()+86400,'/');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html>
<html>
<head><title>Food Histories</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css" media="all" >
html,body{background:#6CC;}
h4{margin:.4em 0;}
.sm{font-size:.5em;color:#5bb;}
fieldset{margin:0;padding:1em;width:12em;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.divCheck,.divNoCheck{font-weight:700;color:#fff;width:95%;display:inline-block;padding:2px 0 2px 2px;margin:2px;vertical-align: middle;position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
@media only screen and (min-width : 1024px) {table,tr,#keys{max-width:850px;}}}
@media only screen and (min-width : 768px) and (max-width : 1023px) {table,tr,#keys{max-width:850px;}}
@media only screen and (max-width : 767px) {#page,table,tr,#keys{width:100%;}}
#daysValue{text-align:center;}
#page{width:640px;margin:0 auto;}
#keys{margin:0 auto 0;}
.none{vertical-align: middle;margin:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJEAABkaGsYJCXNBQMQ+PSwAAAAAKAAoAAAC6ISPqcvtD6OctFokhth5X9AlQjAE5nlqQmI2Y3uU6DyvBsq88KxyGa0L2BZBlMZFMw1zvCUS5WTUJsaIDBqhDR66q/BhPEURsuN1fBP/SM+v4bzAgsRMWIyOkL+VjLICnsaHYbK1INNHp3egI2X3l4QmM3biANQWx9bghWbAqECZ4+VGBMriiCEq+KlKdtoJp9hZmuCHihfk9FKooGvLits6uuq2Jix7i2dICALIi1VbR9JMmpKMOMWVZBVbmSKBDSHKeZBkLFLOiSvuw9HEfUxcnnQ0N3uem2qU6zqxUUb/IaDAgQQLFgAAOw==');}
.dietblack{vertical-align: middle;border-image-width:0;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
.dietred{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AOQAE/////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietblue{vertical-align: middle;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAJH/AAAA//////3+/fb29iwAAAAAKAAoAAACd4SPqcvtD6OctNqLachIAA8uHmeEYTKMpPklwkuW7Vm+Ksfe9p3lnR2bCQ+74A5IRK6OOiWO+YMZi1He00qdYp3LrVSryMa4H3LvGw3WrDV1mV12m+PqObrLuF/z8Iu9b/Enp9dWR0gHJgJYYTfg9ggZKTlJeVAAADs=');}
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.h1,.h2,.h3,.h4,.h5,.h6,.cnt{height:40px;display:inline-block;}
.h1,.c1,.ck1{width:15em;}
.h2,.c2{width:7em;}
.h3,.c3{width:7em;}
.h4,.c4{width:8em;}
.h5,.c5,.h5,.x5,.q5,.i5,.w5,.v5{width:18em;}
.cnt{width:50px;}
.c1,.c2,.c3,.c4,.c5,.h5,.x5,.q5,.i5,.w5,.v5,.cnt{border:0;padding:0;margin:0;color:#fff;background:#043234;
background-image: -o-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -moz-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -webkit-linear-gradient(bottom, #555 0%, #111 100%);
background-image: -ms-linear-gradient(bottom, #555 0%, #111 100%);
background-image: linear-gradient(to bottom, #555 0%, #111 100%);}
.c6{background:#000;padding-left:6px;}
.h6,.c6,{width:60px;}
.h5,.x5,.q5{color:#f00;font-weight:700;}
.w5{color:#0f9;}
.i5{color:#f80;}
.v5{color:#ff0;}
.c5{color:#3bf;}
.ck1,.h1,.h2,.h3,.h4,.h5,.h6,#sub,#lo,#ss,#ph,#clear,#announce,#close{font-weight:700;border:0;padding:0;margin:0;color:#fff;background:#66CCCC;
background-image: -o-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -moz-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -webkit-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -ms-linear-gradient(bottom, #164 0%, #033 100%);
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
#sub,#lo,#ss,#ph,#clear,.box,#announce,#close{border:2px ridge #6cc;margin-top:4px;}
.box{margin:1.2%;padding:1%;width:28%;float:left;}
#frmtop,#frmbot{padding:.5em;margin:0;background:#144;color:#69B5B3;font:700 1em Arial,sans-serif;}
.label{padding:0;margin:0;}
td,tr{border:0;padding:0;margin:0;height:40px;}
form,.ck1{border:0;margin:0;padding:0;}
.c6,.ck1{height:40px;border-spacing:0;}
.row{height:40px;}
.c1,.ck1.c5,.h5,.x5,.q5,.i5,.w5,.v5{text-align:left;padding-left:1em;}
.ck1{color:#fff;text-align:left;padding-left:40px;}
#note{width:1000px;height:1em;margin-bottom:.3em;}
#fgtw{text-align:right;width:100%;display:none;margin:0;background:#000;color:#0ff;}
.bold{font-weight:700;}
h2{margin-bottom:0;}
#sub,#lo,#ss,#ph,#clear,#announce,#close{width:100%;font:700 1em Arial,sans-serif;padding:.25em;}
#daysValue{width:4em;font:700 1em Arial,sans-serif;}
#diet,#announceTxt{border:.5em ridge #fff;width:400px;padding:2em;background:#222;color:#fff;position: absolute;top:20em;z-index:10;display:none;}
.inline{display:inline-block;padding:.1em;font-weight:700;}
.range{display:inline-block;padding-top:0;}
#code,#name{width:95%;font:700 1em Arial,sans-serif;}
#inp{display:block;}
#ss{display:none;}
#announceTxt{font: 700 1em/1.5 arial,sans-serif;}
a,form{display:inline-block;}
a:link {color: #08f;font:400 1.2em arial,sans-serif;}
a:visited {color: #08f;font:400 1.2em arial,sans-serif;}
form,table,#frmtop,#frmbot{border:0;margin:0 auto;}
#cli{width:100%;text-align:center;}
h2{text-align:center;}
input[type="text"]{width:5em;}
#lo{width:20em;display:inline-block;padding:1.2em;}
</style>
</head><body>
<div id="page">
<form style="display:inline-block;" action="http://dev.amxemr.com/f/" method="post"><div>
<input type="hidden" name="id" value="$id" />
<button style="background:#fff;padding:.6em;border:4px groove #000;">
<img style="vertical-align:middle;" width="46" height ="40" src="data:image/gif;base64,R0lGODlhLgAoAKIAAAUyNP3+/nCxumiPkw5wgafN0mertNDk5ywAAAAALgAoAAAD/hi63P4wyknrO4LoUew6RwF6QcYVBQEQB1UIRiwLImWwjYZD2EC3oIKsE0k9UhpIwddyYGCCpoMgOOqqjSVRaYAZpIsCALzQJRkHDgXadQgAWMbATGi0113YVpGhhukaUloVUAIwYH2AgAyHFAd5hgZ7SIp0H3cThZFxCpV0W0JfE0KGpTBZnjoMoXsOpKaRZImKYKSSF5qwoqi0WXldIkFesKa7rnMEt66QMs3EumQkj8/UupwkC7nVxMrYq5Db3NF2yD4P4OGlmA8DAO5z7gADvunFxg0H7w3t7vT1jRD6PVAhMAy6Z zHGdQIQgZ+8LMO4dVEYQIyBhvEAtKroWaUZsAntKBLUdwGFSYoMCjowkFGlN3wk7bR0+fJDvHlhHLbcWDNfRg0zW9YMGLQozaEBdBq9idTV0pk8kSo1irOpg6fxrEZ4WkcrxqBVvUYQMKCsObFohyYAADs=" alt="Allermetrix e-Office"/>
<span style="font:700 1.5em 'Comic Sans MS',sans-serif;color:#000;" >Allermetrix e-Office</span>
</button></form>
<form action="http://dev.amxemr.com/enter.php" method="post">
<input id="lo" type="submit" value="Patient Portal" />
<input type="hidden" name="sub" value="2" /></form>
</div><h2>Patient Food History<br></h2>
EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx_allermetrix',$data);
mysql_select_db('amx_portal');
$sub = intval($_POST['sub']);
$rec = intval($_POST['rec']);
if($sub == 6 && $rec > 0){
  $sql = "UPDATE `history` SET `status`= 'C' WHERE `id`=$rec";
  mysql_query($sql);
}
  $js = "var completed = false;\nvar entered = false;\n";
  $sql = "SELECT `id`,`date`, `last`, `first`, `dob`, `gender` FROM `history` WHERE `client` = $id AND `status` = 'E'  ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysql_query($sql);
  if(mysql_num_rows($results) > 0){
  $js .= "entered = true;\n";
  echo <<<EOT
<button id="ph" type="button"  onclick="exp('s0')" >New Patient Histories</button>
<div id="s0">
<table><tr>
<td><button class="c1"  type="submit">Name</button></td>
<td><button class="c4"  type="button" name="sn4">DoB</button></td>
<td><button class="c3"  type="button" name="sn4">Entered</button></td>
</tr>
EOT;

  while (list($rec,$date,$last,$first,$dob,$gender) = @mysql_fetch_array($results, MYSQL_NUM)) {
    $dob = date('M j, Y',strtotime($dob));
    $date = date('M j, Y',strtotime($date));
    $diff = date_diff(date_create(),date_create($dob),true);
    $age = $diff->format('%y');
    $sex = array('','M','F');
    $patient = "$last, $first $sex[$gender] $age";

    echo <<<EOT
<tr>
<td><form action="./f/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="4" />
<button class="ck1"  type="submit">$patient</button></form></td>
<td><button class="c4"  type="submit">$dob</button></td>
<td><button class="c3"  type="submit">$date</button></td>
</tr>
EOT;

    }
    echo '</table></div>';
}
else{
  echo '<div id="s0"></div>';
}
  $sql = "SELECT `id`,`date`, `last`, `first`, `dob`, `gender`,`client` FROM `history` WHERE `client` = $id AND `status` = 'C' ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysql_query($sql);
  if(mysql_errno() > 0){echo mysql_error() . "<br/>\n$sql";}
  
  if(mysql_num_rows($results) > 0){
  $js .= "completed = true;\n";
  echo <<<EOT
<button id="ph" type="button"  onclick="exp('s1')" >Completed Patient Histories</button>
<div id="s1">
<table><tr>

<td><button class="c1"  type="submit">Name</button></td>
<td><button class="c4"  type="button" name="sn4">DoB</button></td>
<td><button class="c3"  type="button" name="sn4">Entered</button></td>
</tr>
EOT;
  while (list($rec,$date,$last,$first,$dob,$gender,$id) = @mysql_fetch_array($results, MYSQL_NUM)) {
    $dob = date('M j, Y',strtotime($dob));
    $date = date('M j, Y',strtotime($date));
    echo <<<EOT
<tr>

<td><form action="http://dev.amxemr.com/f/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="4" />
<button class="ck1"  type="submit">$last, $first</button></form></td>
<td><button class="c4"  type="submit">$dob</button></td>
<td><button class="c3"  type="submit">$date</button></td>
</tr>
EOT;

    }
    echo '</table>';
}
else{
  echo '<div id="s1"></div>';
}
echo <<<EOT

</div></div>
<script type="text/javascript"> //<![CDATA[
$js
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
var prev = document.getElementById('s0');
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
function init(){
  if(completed && entered){document.getElementById('s1').style.display='none';}
}
window.onload = init;
//]]>
</script>
</body></html>
EOT;
?>