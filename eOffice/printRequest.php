<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx',$data);
mysql_select_db('amx_portal');
$id = intval($_POST['id']);
//if($id == 0){$id = intval($_COOKIE['amxc']);}
//if($id == 0){$id = intval($_COOKIE['amxp']);}
//setcookie("amxc", $id,time()+86400,'/');
$rec = intval($_POST['rec']);
$genders = array('Not Given','Male','Female');
$gender = $genders[intval($_POST['gender'])];
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$billing = intval($_POST['billing']);
$last = $_POST['last'];
$first = $_POST['first'];
$dob = $_POST['dob'];
$icd = $_POST['icd'];
$physician = $_POST['physician'];
$date = strtotime($_POST['collect']);
$strdob = date('m/d/Y',$dob);
if($date == 0){
  $collect = '___________________';
}
else{
  $collect = date('m/d/Y',$date);
}
$specimen = $_POST['specimen'];
if(strlen(trim($specimen)) == 0){ $specimen = '___________________';}
//if (strlen($specimen) < 1){$specimen = substr($first,0,1) . substr($last,0,1) . date('mdy',strtotime($strdob));}
$billingType = array('','Client','Medicare','Medicaid','Patient','Insurance');
$billingCheck = $billingType[$billing];


echo <<<EOT
<!DOCTYPE html><html lang="en">
<head>
<title>Print Request</title>
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0;background:#6cc; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#144;}
body,#page{width:768px;background:#fff;}
pre{color:#ff0;}
#end,#s888{float:none;color:#144;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 5px 5px;padding:2px 0 2px 10px;width:440px;display:inline-block;height:22px;vertical-align: middle;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1em Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:left;margin:20px 0 0 0;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
.pgBrkB4,.pgBrk {display:none;}

@media print{
.pgBrkB4 {page-break-before:always;display:block;margin:3em 0 0;}
.pgBrk {page-break-after:always;display:block;padding:100px 0 0 0;}
.noPrint{display:block;}
#nav{display:none;}
#i1,#i2,#i3,#i4,#i5,#i6{display:none;}
}
.emp{font:700 1em/1 Arial,sans-serif;}
.inline,form{display:inline;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}

td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.link{font-size:1em; font-weight:700; width:180px;padding:1px 0 4px 0;border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}

.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}
#post{width:480px;margin:0 auto;background:#144;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{position:relative;text-align:left;background:#2985EA;padding:0;margin:.1em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pchk{text-align:left;background:#2985EA;width:90%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;;}
.pnumber{width:3em;display:inline-block;}
.descE,.descG4{font-size:.9em;width:12em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 1em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 .2em .3em 0;padding:.3em 0 0 0;}
.legend{padding-left:13em;display:inline-block;font-wight:700;}
.row{padding:0;margin:0;}
.both{background-color:#fff;}
.igg4{background-color:#fff;}
.ige{background-color:#fff;}
.panel{padding: 2px 0 2px 10px;margin:0 0 0 0;width:250px;font-weight:400;border: solid 1px #000;}
img{vertical-align: top;}
.both,.ige,.igg4,{vertical-align: top;display:inline-block;font-weight:700;margin:0;border:1px solid #144;text-align:left;width:70%;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:25px;height:25px;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
#patient{padding:1em;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#fff;color:#fff;border-color:#fff;}
legend{margin-top:.4em;}
#tests{width:800px;margin:0 0 0 85px;font-weight:400;}
#form{display:inline-block;position:absolute;top:0;left:190px;}
#leftcolumn{padding:1em 0 0 1em;width:190px;height:235px;display:inline-block;}

#ins{padding: 0 0 0 1em;display:none;margin:0 0 0 65px ;}
legend{display:inline-block;}
.hide{display:none;}

.name{width:8em;}
.date{width:8em;}

#inscard{color:#f00;text-align:center;font-size:1.4em;}
#physician{padding:0 0 2px 0;width:125px;display:inline-block;text-align:right;vertical-align: middle;}
#icd{padding:0 0 2px 0;width:125px;display:inline-block;text-align:right;vertical-align: middle;}
.label{width:10em;text-align:right;padding-right:3px;display:inline-block;}
.chk{margin:0 0 0 0;padding:0 0 2px 0;height:16px;width:20px;text-align:center;background:#fff;color:#000;font:400 .8em Arial;;display:inline-block;border: solid #000 1px;border-radius: 3px 3px 3px 3px;}
.table{font:400 1em Times,serif; column-count: 3;column-width: 250px;} 
table{padding:0;margin:0;}
tr {padding:0;margin:0;}
td {text-align:center;padding:3px 0 0 0;}
.icdButton{font: 700 1em Arial,sans-serif;width:280px;color:#fff;text-align:left;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#i1,#i2,#i3,#i4,#i5,#i6{font:400 .9em Times,serif;margin:0; padding:0;}
#icdb{margin:0 0 0 170px;}
#sig{margin:0 0 0 5em;}
#psig{margin:5px 0 0 0;}
.small{font-size:12px;margin:4px 0 4px 0;}
#copy{margin:5px 0 5px 0;}



</style></head><body><div id="page">















<div id="leftcolumn">
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<p>400 Sugartree Ln.<br/>Suite 510<br/>Franklin TN 37064</p>
<p>Tel :(877) 992-4100<br/>
Fax:(615) 599-4648</p>
Client: $id<br/>Billing:$billingCheck
</div><div id="form">
<div id="nav"><button class="link" onclick="prn()">Print</button> 
<form action="https://amxemr.com/requestForm.php" method="post">
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="rec" value="$rec" />
<input type="hidden" name="sub" value="6" /> 
<button class="link">Complete</button>
</form>
</div>
<input type="hidden" name="last" value="$last" />
<input type="hidden" name="first" value="$first" />
<input type="hidden" name="dob" value="$strdob" />
<input type="hidden" name="specimen" value="$specimen"/>
<input type="hidden" name="collect" value="$collect" />
<input type="hidden" name="physician" value="$physician" />
<input type="hidden" name="icd" value="$icd" />



<p>Patient: $first $last<br>
DoB: $strdob  <br>Specimen ID:$specimen &emsp; Collection Date: $collect
</p>
<img id="hdr" width="590"  src="requestHead590.jpg" />
</div>
<div id="sig">
<p>Phys. Signature: x___________________________________________________
<br>
<div><div id="physician">Physician Name:</div><div class="box">$physician</div></div>
<div><div id="icd">ICD-10 Code:</div><div class="box"> $icd</div></div> 
</div>






<div class="hide">
<div id="d003" class="dchk"><input id="c003" type="radio" class="chk" name="billing" value="1" onclick="exp('003')" $checked[0]/>&#x2002;
Bill Client </div><br/><div id="s003"></div> 
<div id="d004" class="dchk"><input id="c004" type="radio" class="chk" name="billing" value="2" onclick="exp('004')" $checked[1]/>&#x2002;
Bill Medicare</div><br/><div id="s004"></div>
<div id="d005" class="dchk"><input id="c005" type="radio" class="chk" name="billing" value="3" onclick="exp('005')" $checked[2]/>&#x2002;
Bill Medcaid </div><br/><div id="s005"></div> 
<div id="d006" class="dchk"><input id="c006" type="radio" class="chk" name="billing" value="4" onclick="exp('006')" $checked[3]/>&#x2002;
Bill Patient</div><br/>
<div id="s006" class="expand hide">
<br/><legend>Patient Last:</legend><input type="text" name="blast" value="$plast" size="40" />
<br/><legend>Patient First:</legend><input type="text" name="bfirst" value="$pfirst" size="40" />
<br/><legend>Patient DoB: (m/d/yyyy)</legend><input type="text" name="pDoB " value="$pstrdob" placeholder="m/d/yyyy"  size="40"/>
<br/><br/><legend>Patient Address:</legend><input type="text" name="address" value="$paddress" size="40"/>
<br/><legend>Patient City State Zip:</legend><input type="text" name="city" value="$pcity" size="40" />
<br/><legend>Patient Phone: (with Area Code)</legend><input type="text" name="address" value="$pphone" size="40"/>
<br/><legend>Patient SSN:</legend><input type="text" name="address" value="$pssn" size="40"/>
<br/><legend>Patient Email:</legend><input type="text" name="email" value="$pemal" size="40"/>
<br/><br/>Must complete Credit Card Payment section or CONTACT 877-992-4100 prior to shipping)-*

</div>
<div id="d007" class="dchk">
<input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')" $checked[1]/>&#x2002;Bill Insurance</div>
<br/><div id="s007" class="expand hide">
<br/><legend>Insured Last:</legend><input type="text" name="blast" value="$blast" size="40" />
<br/><legend>Insured First:</legend><input type="text" name="bfirst" value="$bfirst" size="40" />
<br/><legend>Insured DoB: (m/d/yyyy)</legend><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br/><legend>Insured Address:</legend><input type="text" name="address" value="$address" size="40"/>
<br/><legend>Insured City State Zip:</legend><input type="text" name="city" value="$city" size="40" />
<br/><legend>Insured Phone: (with Area Code)</legend><input type="text" name="address" value="$phone" size="40"/>
<br/><legend>Insured SSN:</legend></legend><input type="text" name="address" value="$ssn" size="40"/>
</div><br/><br/><hr/></div>

<div id="inscard"><p id="copy">Please attach a photo copy of the front and back of the insurance card</p></div>

<div id="ins">
<p class="small">I authorize the use of my credit/HSA card and understand that I will be informed of the costs prior to Allermetrix withdrawing funds via my choice indicated below: </p>
<p id="psig" class="small">Patient Signature (Required) x___________________________________________________
<p class="small">[&#x2003;] telephone (ok to leave voice mail) 
<p class="small">[&#x2003;] e-mail _________________________@_______________________________
</div>
<hr/>
<div id="tests">

EOT;
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysqli_query($link,$sql);
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code;$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$sort = array_flip($sort);
$cnt = 0;

$countTests = $panels[$pdx][3][0];
$countIgE = $panels[$pdx][3][1];
$countIgG = $panels[$pdx][3][2];
$countIgG4 = $panels[$pdx][3][3];
$typeE  = array('<div><div></div>' , '<div><div><div class="E">&#10004;</div></div>');
$typeG4 = array('<div><div class="G4"></div></div>' , '<div><div class="G4">&#10004;</div></div>');
$typeG  = array('<div><div class="G" style="color:#fff;">&#10004;</div></div>' , '<div ><div class="G">&#10004;</div></div>');


$selected = array();
$inputs = '';
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
	$key = substr($key,1);
    $panels[] ="<div class=\"panel\">$key &nbsp; $value</div>\n";
	continue;
  }
  if($post == 'G'){
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
//	echo "G$code $desc[$code]<br>";
  }
  elseif($post == 'E'){
	$code = substr($key,1,4);
	$selected[$code][1] = 1;
  }
}

if(count($panels) > 0){
  echo "<h3>Panels Ordered</h3>";
  foreach($panels as $text){echo $text;}
}

if(count($selected) > 0){
  foreach($selected as $code => $types){
    $tests[$sort[$code]]= intval($types[1]) . '|' . intval($types[3]) . '|' . $code;
  }
  ksort($tests);
  echo <<<EOT
  <h3>Tests Ordered<br></h3>
<div>
  <div class="chk" >E</div><div class="chk">G<sub>4</sub></div><div class="chk" >G</div>&ensp;</div> 
  <div class="table">
EOT;
$classE = array('&xcirc;','&#10004;');
$classG4 = array('&xcirc;','&#10004;');



$circle = "&xcirc;";



foreach($tests as $key => $data){
  list($etype,$g4type,$code) = explode('|',$data);
  $e = $classE[$etype];
  $g4 = $classG4[$g4type];
  echo <<<EOT
<div><div class="chk" >$e</div><div class="chk">$g4</div><div class="chk" >&xcirc;</div>&ensp;$desc[$code]</div>

EOT;
}
  

}

echo $inputs;



echo '<div style="min-height:10em;"><p>&#x2003;<br/>&#x2003;</p></div></div></div>';
echo <<<EOT


<script> //<![CDATA[';
function prn(){
  window.print()
}
EOT;

if($billing == 1){ // patient submits foods
$id = intval($_POST['id']);
echo <<< EOT

function init(){
  document.getElementById('ins').style.display = 'none';
  document.getElementById('inscard').style.display = 'none';
  document.getElementById('hdr').style.display = 'none';
}
window.onload = init;
//]]> 
</script

EOT;
}
elseif($billing < 4){  // medicare medicad

echo <<< EOT

function init(){
  document.getElementById('ins').style.display = 'none';
  document.getElementById('inscard').style.display = 'block';
  document.getElementById('hdr').style.display = 'none';
}
window.onload = init;
//]]> 
</script>
EOT;
}

elseif($billing == 4){  // patient

echo <<< EOT

function init(){
  document.getElementById('ins').style.display = 'block';
  document.getElementById('inscard').style.display = 'none';
  document.getElementById('hdr').style.display = 'block';
}
window.onload = init;
//]]> 
</script>

EOT;
}
else{  // insurance
echo <<< EOT

function init(){
  document.getElementById('ins').style.display = 'block';
  document.getElementById('inscard').style.display = 'block';
  document.getElementById('hdr').style.display = 'block';
}
window.onload = init;
//]]> 
</script>
EOT;
}
$specimen = mysql_real_escape_string($specimen);
$physician = mysql_real_escape_string($physician);
$request = mysql_real_escape_string(json_encode($ordered));
$sql = "UPDATE `history` SET `specimen`='$specimen', `collection` = '$collection',`physician` = '$physician',`idc` = '$idc', `request` = '$request' WHERE `id` = '$rec'";
mysql_query($sql);
if(mysql_errno() > 0){echo mysql_error() . "<br/>\n$sql";}

echo '</body></html>';
?>