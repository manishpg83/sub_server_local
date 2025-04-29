<?php
$id = intval($_COOKIE['amxc']);
//if($id == 0){$id = intval($_GET['id']);}
//if($id == 0){$id = intval($_POST['id']);}
$ip = $_SERVER['REMOTE_ADDR'];
if(substr($ip,0,10) == '70.171.10.' && $id == 0){$id = intval($_GET['id']);}

setcookie("amxc", $id,time()+86400,'/');
//header('Cache-Control: max-age=120');

//  $id = 999999;




$crc = '';//abs(crc32('200036'));


echo <<<EOT
<!DOCTYPE html>
<html>
<head><title>Food Histories</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style type="text/css" media="all" >
html,body{background:#f7f7fb;}
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
.dietred,.dietblue,.dietblack,.none,.c1,.c2,.c3,.c4,.c5,.c6,.cnt{height:40px;display:inline-block;}

.h1,.c1,.ck1{width:15em;}
.h2,.c2{width:7em;}
.h3,.c3{width:7em;}
.h4,.c4{width:8em;}
.h5,.c5,.h5,.x5,.q5,.i5,.w5,.v5{width:18em;}
.cnt{width:50px;}
.c1,.c2,.c3,.c4,.c5,.h5,.x5,.q5,.i5,.w5,.v5,.cnt{border:0;padding:0;margin:0;color:#fff;background:#043234;
background-image: linear-gradient(to bottom, #1e3c72 0%, #2a5298 100%);} 
.c6{background:#000;padding-left:6px;}
.h6,.c6,{width:60px;}
.h5,.x5,.q5{color:#f00;font-weight:700;}
.w5{color:#0f9;}
.i5{color:#f80;}
.v5{color:#ff0;}
.c5{color:#3bf;}
.ck1,.h1,.h2,.h3,.h4,.h5,.h6,#sub,#lo,#ss,#clear,#announce,#close{border:0;padding:0;margin:0;color:#fff;}
#sub,#lo,#ss,#clear,.box,#announce,#close{margin-top:4px;}
.box{margin:1.2%;padding:1%;width:28%;float:left;height:255px;} 
#frmtop,#frmbot{padding:.5em;margin:0;background:#144;color:#69B5B3;font:700 1em Arial,sans-serif;}
.label{padding:0;margin:0;}
td,tr{border:0;padding:0;margin:0;height:40px;}

form,.ck1{border:0;margin:0;padding:0;}
.c6,.ck1{height:40px;border-spacing:0;}
.row{height:40px;}
.c1,.c5,.h5,.x5,.q5,.i5,.w5,.v5{text-align:left;padding-left:1em;}
.ck1{color:#fff;text-align:left;padding-left:10px;}
#note{width:1000px;height:1em;margin-bottom:.3em;}
#fgtw{text-align:right;width:100%;display:none;margin:0;background:#000;color:#0ff;}
.bold{font-weight:700;}
h2{margin-bottom:0;}
#sub,#lo,#ss,#clear,#announce,#close{width:100%;font:700 1em Arial,sans-serif;padding:.25em;}
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
.history{border:0;padding:0;margin:0;height:40px;width:40px;background-image: url('https://dev.amxemr.com/dashboard40.jpg');}
.foods{border:0;padding:0;margin:0;height:40px;width:40px;vertical-align: middle;border-image-width:0;border:0;margin:0;padding:0;width:40px;background-image: url('data:image/gif;base64,R0lGODlhKAAoAKIAAAMBA5qbmk5NTv3+/YqKivb29m1sbR4dHiwAAAAAKAAoAAADjgi63P4wykmrvTjrzZsABxR2y2CYgzA8K6mgquoUrQun9Tvk3S2XOx4Hdfrpdq5XEccICjeDQHRAyDmTAGewuU1qkUCw7csVd0LaT/g53I3W2KPjGu+W2VDzEa+xw+t6coBsgT2FWXwZflxxiISJGItAjZI6lIeHeY+Xm4MQmX2YkBeVWQWNqKmqq6ytCwkAOw==');}
#ph,#lo{font:700 1.1em Arial,sans-serif;color:#fff;margin:4px 0 4px;width:100%;height:40px;}
#ph{color:#fff;background-image: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
#lo{color:#fff;background-image: linear-gradient(to bottom, #004 0%, #00f 100%);height:63px;width:20em;}
.ck1{background-image: linear-gradient(to bottom, #1e3c72 0%, #2a5298 100%);}
#btn{visibility: visable;text-align:center;width:55px; background-color: #ff0000;color: white;margin-left: 540px;height: 2em;}
.head{margin:0;height:27px;}
.h1,.h2,.h3,.h4,.h5,.h6{display:inline-block;}
.h1,.h2,.h3,.h4,.h5,.h6,.h7{background-image:linear-gradient(to bottom, #a3bded 0%, #6991c7 100%);font-weight:700;height:42px;color:#000;margin-bottom:0;}    
#DelHead{margin-left:5em;font:700 1em Arial;}
</style>
</head><body>
<div id="page">
<form style="display:inline-block;" action="https://dev.amxemr.com/eOffice/" method="post"><div>
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="action" value="1" />
<button style="background:#fff;padding:.6em;border:4px groove #000;">
<img style="vertical-align:middle;" width="46" height ="40" src="data:image/gif;base64,R0lGODlhLgAoAKIAAAUyNP3+/nCxumiPkw5wgafN0mertNDk5ywAAAAALgAoAAAD/hi63P4wyknrO4LoUew6RwF6QcYVBQEQB1UIRiwLImWwjYZD2EC3oIKsE0k9UhpIwddyYGCCpoMgOOqqjSVRaYAZpIsCALzQJRkHDgXadQgAWMbATGi0113YVpGhhukaUloVUAIwYH2AgAyHFAd5hgZ7SIp0H3cThZFxCpV0W0JfE0KGpTBZnjoMoXsOpKaRZImKYKSSF5qwoqi0WXldIkFesKa7rnMEt66QMs3EumQkj8/UupwkC7nVxMrYq5Db3NF2yD4P4OGlmA8DAO5z7gADvunFxg0H7w3t7vT1jRD6PVAhMAy6Z zHGdQIQgZ+8LMO4dVEYQIyBhvEAtKroWaUZsAntKBLUdwGFSYoMCjowkFGlN3wk7bR0+fJDvHlhHLbcWDNfRg0zW9YMGLQozaEBdBq9idTV0pk8kSo1irOpg6fxrEZ4WkcrxqBVvUYQMKCsObFohyYAADs=" alt="Allermetrix e-Office"/>
<span style="font:700 1.5em 'Comic Sans MS',sans-serif;color:#000;" >Allermetrix e-Office</span>
</button></form>

<button id="lo" onclick="history.back()">Patient Records</button>

</div><h2>Patient Inhalant and Food History<br></h2>
EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

//$dbc=mysql_connect('localhost','isl_isl','yes12yes');
//mysql_select_db('isl_portal');
$sub = intval($_GET['sub']);
if($sub == 20){
  $rec = intval($_POST['rec']);
  

}
if($sub == 0){$sub = intval($_POST['sub']);}
$rec = intval($_POST['rec']);
if($sub == 6 && $rec > 0){
  $sql = "UPDATE `history` SET `status`= 'C' WHERE `id`=$rec";
  mysqli_query($link,$sql);
}
  $js = "var completed = false;\nvar entered = false;\n";
  $sql = "SELECT `id`,`date`, `last`, `first`, `dob`, `gender` FROM `history` WHERE `client` = $id AND `status` = 'E'  ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysqli_query($link,$sql);
  if(mysqli_num_rows($results) > 0){
    $js .= "entered = true;\n";
    echo <<<EOT

<div id="s0">
<table><tr class="head">
<td class="head"><button class="h1"  type="submit">Name</button></td>
<td class="head"><button class="h4"  type="button" name="sn4">DoB</button></td>
<td class="head"><button class="h3"  type="button" name="sn4">Entered</button></td>
<td></td><td></td>
<td id="DelHead">Delete</td>
<td></td>
</tr>
EOT;
    $bnts = 0;
    while (list($rec,$date,$last,$first,$dob,$gender) = mysqli_fetch_array($results, MYSQLI_NUM)) {
      $dob = date('M j, Y',strtotime($dob));
      $date = date('M j, Y',strtotime($date));
      $diff = date_diff(date_create(),date_create($dob),true);
      $age = $diff->format('%y');
      $sex = array('','M','F');
      $patient = "$last, $first $sex[$gender] $age";

      echo <<<EOT
<tr id="r$rec">
<td>
<button class="ck1"  type="submit">$patient</button><input type="hidden" name="client" value="$id" /></form></td>
<td><button class="c4"  type="submit">$dob</button></td>
<td><button class="c3"  type="submit">$date</button></td>
<td><form action="./eOffice/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="30" /><button class="history"></button></form></td>
<td><form action="./eOffice/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="20" /><input type="hidden" name="client" value="$id" /><button class="foods"></button></form></td>
<td><input type="checkbox" id="i$rec" class="clrchk" name="i$rec" value="" onclick = "cntbtns($rec);" /></td>
</tr>
EOT;
      $buttons[] = $rec;
      $bnts += 1;
    }
    echo '</table><input type="hidden" name="sub" value="6" /></form></div>'; //<button id="btn" onclick=delbtn()>Delete</button></form></div>'; 
  }
  else{
    echo '<div id="s0">No Patients</div>';
  }
  
  
  
  
  
  
  
  
  $sql = "SELECT `id`,`date`, `last`, `first`, `dob`, `gender`,`client` FROM `history` WHERE `client` = $id AND `status` = 'C' ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "<br/>\n$sql";}
  
  //
 // if(mysqli_num_rows($results) > 0){ exit;
 if(false){
  $js .= "completed = true;\n";
  echo <<<EOT
<button id="ph" type="button"  onclick="exp('s1')" >Completed Patient Histories</button>
<div id="s1">
<table><tr class="head"> 

<td class="head"><button class="h1"  type="submit">Name</button></td>
<td class="head"><button class="h4"  type="button" name="sn4">DoB</button></td>
<td class="head"><button class="h3"  type="button" name="sn4">Entered</button></td>
</tr>
EOT;

  while (list($rec,$date,$last,$first,$dob,$gender) = mysqli_fetch_array($results, MYSQL_NUM)) {
    $dob = date('M j, Y',strtotime($dob));
    $date = date('M j, Y',strtotime($date));
    $diff = date_diff(date_create(),date_create($dob),true);
    $age = $diff->format('%y');
    $sex = array('','M','F');
    $patient = "$last, $first $sex[$gender] $age";


//<td><form action="./eOffice/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="20" /><button class="ck1"  type="submit">$patient</button></form></td>


    echo <<<EOT
<tr>
<td><button class="ck1" >$patient</button></td>
<td><button class="c4"  type="submit">$dob</button></td>
<td><button class="c3"  type="submit">$date</button></td>
<td><form action="./eOffice/dashboard.php" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="30" /><button class="history"></button></form></td>
<td><form action="./eOffice/" method="post"><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="20" /><button class="foods"></button></form></td>

</tr>

EOT;

  }
  echo '</table>';

}
else{
  echo '<div id="s1"></div>';
}
//echo "bnts=$bnts\n";

echo <<<EOT

</div></div>

<script type="text/javascript"> //<![CDATA[
$js
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';

var buttons = new Array();
EOT;
if($bnts > 0){
  foreach  ($buttons as $key => $value) {
  //  echo "\nvar i$value = 0;";
	//echo "\nbuttons[] = $value;";
  }
}

echo <<<EOT


var cnt = 0;
var prev = document.getElementById('s0');
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
function delbtn(){
var butt = document.getElementById(btn);
var btncnt = $bnts;
alert('btncnt $bnts: ' + butt);
}
function cntbtns(rec){
 // alert('check: ' + rec);
  var record = document.getElementById('r' + rec);
  var chk = document.getElementById('i' + rec).checked;

 // alert(rec + '=' + chk);
  record.style.display = 'none';
  setStatus(rec);

}
function uncheckAll() {
 let  inputs = document.querySelectorAll('.clrchk');
 for (let i = 0; i < inputs.length; i++) { //alert( inputs[i].checked );
   inputs[i].checked = false;
   
 }
}
uncheckAll();

function setStatus(id){
  xmlhttp=null;
  var Url="./eOffice/deletePatient.php"
  if (window.XMLHttpRequest) {  // Fuckin\' Microsoft!
      xmlhttp=new XMLHttpRequest();
  }
  else if (window.ActiveXObject) { // Fuck Fuckin\' Microsoft!
     xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (xmlhttp!=null) {
     xmlhttp.open("POST", Url, true);
     xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
     xmlhttp.send( "number=" + id ); 
  } else {
     alert("UNEXPECTED ERROR: XMLHttpRequest not supported");
  }
}

//]]>
</script>
</body></html>
EOT;

?>
















