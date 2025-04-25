<?php ob_start("ob_gzhandler");
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx_allermetrix',$data);
mysql_select_db('amx_portal');
header('Content-Type: text/plain; charset=utf-8');

$sql = "SELECT `rec`,`panel`, `description` FROM `clientPanels` WHERE `number` =0";
$results = mysql_query($sql);
while(list($rec,$panel,$description) =  mysql_fetch_array($results, MYSQL_NUM)){
  $sql = "UPDATE `PanelTests` SET `number` = $rec WHERE `panel`='$panel'";
  $result = mysql_query($sql);
  if(mysql_errno() != 0){echo mysql_errno() . "<br/>\n$sql";break;}
}

exit;

$sub = intval($_POST['sub']);
$id = intval($_POST['id']);
if($id == 0){$id = intval($_GET['id']);}
//if($id == 0){$id = intval($_COOKIE['amxc']);}
$rec = intval($_POST['rec']);

//setcookie("amxc", $id,time()+86400,'/');
if($sub == 4){
 // $rec = intval($_POST['rec']);
  $sqlf = "SELECT `client`, `date`, `last`, `first`, `dob`, `gender`, `foods` FROM `history` WHERE `id` = $rec";
  $results = mysql_query($sqlf);
  list($id,$date,$last,$first,$dob,$gender,$jsn) = @mysql_fetch_array($results, MYSQL_NUM);
  $strdob = date('M j, Y',strtotime($dob));
  $date = date('M j, Y',strtotime($date));
  $food = json_decode($jsn,true);
  $showE = $food[0];
  $showG4 = $food[1];
  $desc = $food[2];
  $matches = $food[3];
  $_POST = $food[4];
  $diff = date_diff(date_create(),date_create($dob),true);
  $age = $diff->format('%y');
  $sex = array('','M','F');
  $patient = "$last, $first $sex[$gender] $age";
  
 
//$show = var_export($matches,1);
}
else{
  $genderCheck = array_fill(1,2,'');
  $gender = intval($_POST['gender']);
  $genderCheck[$gender] = 'checked="checked"';
  $last = trim(urldecode($_POST['last']));
  $first = trim(urldecode($_POST['first']));
  $len = strlen($last);
  $date = trim(urldecode($_POST['dob']));
  $strdob = preg_replace('/ /','',$date);
  $strdob = preg_replace('/-|\./','/',$strdob);
  $dob = intval(strtotime($strdob));
  if($dob != 0){$strdob = date('m/d/Y',$dob);}
}
if($id > 199999 && $id < 300000){
  $sql = "SELECT `Name`  FROM `Client` WHERE `Number` = $id LIMIT 1";
  $results = mysql_query($sql);
  if(mysql_errno() == 0 && mysql_num_rows($results) == 1){
    list($name) = mysql_fetch_array($results, MYSQL_NUM);
    $client = "<h3 class=\"client\">$name</h3><input type=\"hidden\" name=\"id\" value=\"$id\" />";
  }
  else{$client = mysql_error() . '<br/>' . $sql ;}
}
$checked = array_fill(1,5,0);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/><title>Food Exposure</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;background:#fff;color:#ff0;padding:0;background:#6cc; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;}
pre{color:#ff0;}
#end,#s888{float:none;color:#144;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
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
h1,h2,h3{text-align:center;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:block;}
}
.emp{font:700 1em/1 Arial,sans-serif;}
.inline{display:inline;}
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
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go{width:100%;padding:0;margin:.7em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: -o-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -moz-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -webkit-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -ms-linear-gradient(bottom, #164 0%, #033 100%);
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
.go{border:1px solid #f00;color: #fff;
background-image: -o-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -moz-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -webkit-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -ms-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.btn{border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: -o-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -moz-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -ms-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}
#post{width:480px;margin:0 auto;background:#144;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;max-width:14em;}
.dchk{width:100%}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{position:relative;text-align:left;background:#2985EA;padding:0;margin:.1em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pchk{text-align:left;background:#2985EA;width:98%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;;}
.pnumber{width:3em;display:inline-block;}
.descE,.descG4{font-size:.9em;width:11em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.row{padding:0;margin:0;}
.pige,.pigg4,.pigg,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 .2em .3em 0;padding:.3em 0 0 0;}

.pige,.pigg4,.pigg{width:2.4em;}
.legend{padding-left:20.75em;}
.both,.ige,.igg4,.panel{display:inline-block;font-weight:700;margin:0;border:1px solid #144;padding:.2em 0 0 .4em;text-align:left;width:98%;}
.both,.cboth{background:#fa4;color:#000;}
.ige,.pige,.cige{background:#ff0;color:#000;}
.igg4,.pigg4,.cigg4{background:#0ff;color:#000;}
.pigg,.cigg{background:#0f8;color:#000}


.xpanel{width:18em;padding:0 .1em 0 .1em;display:inline-block;font-weight:700;border:0;}
.panel{background:#000;color:#fff;padding:.6em 0 .6em .4em;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:25px;height:25px;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
#patient{padding:1em;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#ff0;color:#ff0;border-color:#ff0;}
legend{margin-top:.4em;}
.desc{width:22em;display:inline-block;}
.client{margin:0;}
</style></head><body><div id="page"><div id="post">

<form action="printRequest.php" method="post"><input type="hidden" name="rec" value="$rec"/><div id="patient">&#x2003;
$client<input type="hidden" name="id" value="$id"/>
<br/>Last:<br/><input type="text" name="last" value="$last"  size="40"/>
<br/>First:<br/><input type="text" name="first" value="$first"  size="40"/>
<br/>DoB: (m/d/yyyy)<br/><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br/>Gender:<br/><div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $genderCheck[1]/>&#x2002;Male </div><br/>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $genderCheck[2]/>&#x2002;Female</div>
<hr/><br/>Specimen ID:<br/><input type="text" name="specimen" value="$specimen"  size="40"/>
<br/>Collection Date: (m/d/yyyy)<br/><input type="text" name="collect" value="$collect" placeholder="m/d/yyyy"  size="40"/><br/><br/>
<br/>Physician:<br/><input type="text" name="physician" value="$physician"  size="40"/>
<br/>IDC-10:<br/><input type="text" name="icd" value="$icd"  size="40"/>
<hr/><br/>Billing:<br/>
<div id="d003" class="dchk"><input id="c003" type="radio" class="chk" name="billing" value="1" onclick="exp('003')" $checked[1]/>&#x2002;
Bill Client </div><br/><div id="s003"></div> 
<div id="d004" class="dchk"><input id="c004" type="radio" class="chk" name="billing" value="2" onclick="exp('004')" $checked[2]/>&#x2002;
Bill Medicare</div><br/><div id="s004"></div>
<div id="d005" class="dchk"><input id="c005" type="radio" class="chk" name="billing" value="3" onclick="exp('005')" $checked[3]/>&#x2002;
Bill Medcaid </div><br/><div id="s005"></div> 
<div id="d006" class="dchk"><input id="c006" type="radio" class="chk" name="billing" value="4" onclick="exp('006')"  $checked[4]/>&#x2002;
Bill Patient</div><br/>
<div id="s006" class="expand">
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
<input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')"  $checked[5]/>&#x2002;Bill Insurance</div>
<br/><div id="s007" class="expand">
<br/><legend>Insured Last:</legend><input type="text" name="blast" value="$blast" size="40" />
<br/><legend>Insured First:</legend><input type="text" name="bfirst" value="$bfirst" size="40" />
<br/><legend>Insured DoB: (m/d/yyyy)</legend><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br/><legend>Insured Address:</legend><input type="text" name="address" value="$address" size="40"/>
<br/><legend>Insured City State Zip:</legend><input type="text" name="city" value="$city" size="40" />
<br/><legend>Insured Phone: (with Area Code)</legend><input type="text" name="address" value="$phone" size="40"/>
<br/><legend>Insured SSN:</legend></legend><input type="text" name="address" value="$ssn" size="40"/>
<br/><br/>
Enclose a copy of the insurance card and complete Insurance Billing and Credit Card Payment sections</div>
<div><br/><hr/><h3>Request Items</h3>
EOT;
ob_flush();
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx_allermetrix',$data);
mysql_select_db('amx_portal');
$types = array('','IgE','IgG','IgG4');

$sql = "SELECT `panel`, `description` FROM `clientPanels` WHERE `client` = $id";
$results = mysql_query($sql);
while(list($panel,$description) =  mysql_fetch_array($results, MYSQL_NUM)){
  $panels[$panel] = $description;
}
$fp = fopen("/home/amx/public_html/f/panels.txt", "r");
while (($text= fgets($fp , 72)) !== false) {
  $ndx++;
  if($ndx > 30){break;}
  $panel = trim(substr($text,0,8));
  $panels[$panel] = trim(substr($text,10,128));
}
//$classes = array('','class="ige"','','class="igg4"');
$classes = array();
$classes[0] = 'class="left"';
$classes[1] = 'class="left"';
$classes[2] = 'class="ige"';
$classes[4] = 'class="left"';
$classes[6] = 'class="ige"';
$classes[12] = 'class="left"';
$classes[8] = 'class="igg4"';
$classes[10] = 'class="both"';
$types = array();
$types[0] = '';
$types[1] = '';
$types[2] = 'IgE';
$types[4] = 'IgG';
$types[6] = 'IgE IgG';
$types[12] = 'IgG IgG4';
$types[8] = 'IgG4';
$types[10] = 'IgE IgG4';
$ordered = array();
$sql = "SELECT `Code`, `shortdescription` FROM `Rast` WHERE `Code` LIKE'F%' ORDER BY `Code`";  
$results = mysql_query($sql);
while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
foreach($_POST as $key => $code){$post = substr($key,0,1);
  if($post == 'G'){
    $class[$code] = intval($class[$code]) + pow(2,3);
    $c = $classes[$class[$code]];
    $type = $types[$class[$code]];
    $ordered[$desc[$code]] = "<button type=\"button\" $c><div class=\"desc\">$desc[$code]</div>$code &#x2003;$type </button><br/>\n" ;
    $inputs .=  "<input type=\"hidden\" name=\"$key\" value=\"$code\" />\n";
  	}
  elseif($post == 'E'){
    $class[$code] = intval($class[$code]) + pow(2,1);
    $c = $classes[$class[$code]];
    $type = $types[$class[$code]];
    $ordered[$desc[$code]] = "<button type=\"button\" $c><div class=\"desc\">$desc[$code]</div>$code &#x2003;$type </button><br/>\n" ;
    $inputs .=  "<input type=\"hidden\" name=\"$key\" value=\"$code\" />\n";
  }
  elseif($post == 'P'){
    $inputs .=  "<input type=\"hidden\" name=\"$key\" value=\"$code\" />\n";
    echo "<button type=\"button\" class=\"panel\">$panels[$code]</button><br/>\n";
  }
}
if(count($ordered) > 0){
  ksort($ordered);
  foreach($ordered as $html){echo $html;}
  $inputs .= '<br/><span class="cige">&#x2003;IgE&#x2003;</span>&#x2003;<span class="cigg4">&#x2003;IgG4&#x2003;</span>&#x2003;<span class="cboth">&#x2003;IgE &amp; IgG4&#x2003;</span>';

}
echo $inputs;
$t = microtime(true) - $startTime;
$ndx = 0;
$types = array('','IgE','IgG','IgG4');
$jsp .= 'var panelCodes = {';
$panels = array();
$sqlcp = "SELECT `number`, `description` FROM `clientPanels` WHERE `client` = $id";
$results = mysql_query($sqlcp);
while(list($panel,$description) =  mysql_fetch_array($results, MYSQL_NUM)){
  $TestTypeCount = array(0,0,0,0,0,0,0);
  $codes = '';
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `panel` = '$panel'";
  $result = mysql_query($sql);
  while(list($code,$type) =  mysql_fetch_array($result, MYSQL_NUM)){
 //   if(substr($code,0,1) != 'F'){continue;}
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$panel][$code] = array($desc[$code],intval($tests[$panel][$code][1]) + pow(2,$type));}
    $TestTypeCount[$type]++;
  }
  $panels[0][$panel] =array($description,$TestTypeCount[1],$TestTypeCount[3],$TestTypeCount[2]);
}
foreach($panels as $type => $array){
  echo $panelTitle[$type] . '<hr/><h3>Add-On Panels</h3><div class="legend"><div class="pige" style="width:2.4em">IgE</div><div class="pigg4" style="width:2.4em">IgG4</div><div class="pigg" style="width:2.4em">IgG</div></div>';
  foreach($array as $panel => $v){
//  $js .= "$panel:[null,null,null],";
  echo <<<EOT
  <div id="d$panel" class="pchk">
    <input type="checkbox"  id="c$panel" class="chk" name="X$panel" value="$panel" onclick="pck('$panel')" />
    <div class="xpanel">&#x2002;$v[0]</div>
    <div class="inline" onclick="exp('EXP$panel')">
      <div class="pige">$v[1]</div><div class="pigg4">$v[2]</div><div class="pigg">$v[3]</div>
    </div>
    <br/>
  </div>
EOT;
  }
}
echo <<<EOT



<input type="hidden" name="sub" value="1" /><input type="submit" value="Submit" class="btn" /></div></form>
<div id="prev"></div>
<script type="text/javascript"> //<![CDATA[
var prev = document.getElementById('prev');
$js
$jsort

var div=0;
var disp = '';
var show = '';
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
var c = new Array;
var d = new Array;
var p = new Array;
toggle = new Array;
toggle[true] = 'checked="checked"';
toggle[false] = '';
bg = new Array;
bg[true] = '#f00';
bg[false] = '#2985EA';
bg[1] = '#ff0';
bg[3] = '#0ff';
function panels(id){
  div = document.getElementById(id);
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}
function summary(id){
  div = document.getElementById('post');
  div.style.display=flip[div.style.display];
  div = document.getElementById('s14');
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}


function cb(id){
  div = document.getElementById(id);
  div.style.backgroundColor=bg[div.checked];
}
function radio(on,off){
  document.getElementById('d' + on).style.backgroundColor=bg[true];
  document.getElementById('d' + off).style.backgroundColor=bg[false];
}
function radio6(on){
  document.getElementById('d003').style.backgroundColor=bg[false];
  document.getElementById('d004').style.backgroundColor=bg[false];
  document.getElementById('d005').style.backgroundColor=bg[false];
  document.getElementById('d006').style.backgroundColor=bg[false];
  document.getElementById('d007').style.backgroundColor=bg[false];
  document.getElementById('d' + on).style.backgroundColor=bg[true];
}

function ck(id){
  var d = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  d.style.backgroundColor=bg[c.checked];
}
function exp(id){
  var div = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  var ex = document.getElementById('s' + id);
  div.style.backgroundColor=bg[c.checked];
  disp = ex.style.display;
  prev.style.display='none';
  ex.style.display= 'none';  //flip[disp];
  prev=ex;
  radio6(id);
}
function pck(id){
 var cb = document.getElementById('c' + id);
 var checked = cb.checked;
  document.getElementById('d' + id).style.backgroundColor=bg[checked];
}
function init(){
var checked,did,idType,i,chk;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "d"){
        i = did.substring(1,6);
        c[i] = document.getElementById('c' + i);
        d[i] = divs[div];
		d[i].style.backgroundColor = bg[c[i].checked];
      }
      if (idType == "s"){
        divs[div].style.display = 'none';
      }
    }
  }
  var divs = document.getElementsByTagName("input");


  
}
window.onload = init;


//]]>
</script>
</div></div><pre>$sho</pre></div></body></html>';
EOT;
ob_end_flush();
?>