<?php
$startTime = microtime(true);
$s14 = 'none';
$s15 = 'none';
$s16 = 'none';
$sub = intval($_POST['sub']);
$gender = intval($_POST['gender']);
$checked[$gender] = 'checked="checked"';
$last = trim(urldecode($_POST['last']));
$first = trim(urldecode($_POST['first']));
$len = strlen($last);
$date = trim(urldecode($_POST['dob']));
$strdob = preg_replace('/ /','',$date);
$strdob = preg_replace('/-|\./','/',$strdob);
$dob = intval(strtotime($strdob));
if($dob != 0){$strdob = date('m/d/Y',$dob);}
$id = intval($_GET['id']);
//if($id == 0){$id = intval($_COOKIE['amxp']);}
if($id == 0){$id = intval($_POST['id']);}
setcookie("amxp", $id,time()+31536000);
$client = 'ID: <input type="text" name="id" value="" /><br/>';
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx_allermetrix',$data);
mysql_select_db('amx_portal');
if($sub == 3){include('/home/amx/public_html/request.php');exit;}
if($id > 199999 && $id < 300000){
  $sql = "SELECT `Name`  FROM `Client` WHERE `Number` = $id LIMIT 1";
  $results = mysql_query($sql);
  if(mysql_errno() == 0 && mysql_num_rows($results) == 1){
    list($name) = mysql_fetch_array($results, MYSQL_NUM);
    $client = "<h3>$name</h3><input type=\"hidden\" name=\"id\" value=\"$id\" />";
  }
  else{$client = mysql_error() . '<br/>' . $sql ;}
}
$ratedCount = 0;

ob_start();
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
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#144;}
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
button{width:7em;}
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
.expand,#bs{width:480px;display:block;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;}
#post{width:480px;margin:0 auto;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
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
.pchk{text-align:left;background:#2985EA;width:90%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;;}
.pnumber{width:3em;display:inline-block;}
.panel{width:18em;padding:0 .1em 0 .1em;display:inline-block;font-weight:700;}
.descE,.descG4{font-size:.9em;width:12em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 .2em .3em 0;padding:.3em 0 0 0;}
.legend{padding-left:13em;}
.row{padding:0;margin:0;}
.ige,.pige,.IgE,.descE{background:#ff0;color:#000;font-weight:700;}
.igg4,.pigg4,.IgG4,.descG4{background:#0ff;color:#000;font-weight:700;}
.ige,.igg4{position:absolute;right:0;top:.4em;z-index:11;font:700 .8em Arial,sans-serif;text-align:center;width:3em;height:1.5em;display:inline-block;margin:0 0 .3em 0;padding:.3em 0 0 0;color:#000;}
.both{background:#fA4;color:#000;}
.both,.IgE,.IgG4{display:inline-block;font-weight:700;margin:0;border:1px solid #144;padding:.2em 0 0 .4em;text-align:left;width:70%;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:25px;height:25px;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}

.total{background:#00f;color:#fff;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
#patient{width:15em;margin:0 auto;}
</style></head><body><div id="page">
EOT;
           $client = '';
           
if($dob == 0 || $len < 3 || $gender == 0){
echo <<<EOT
<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="post"><form action="#" method="post"><div id="patient">&#x2003;
$client
<br/>Last: <input type="text" name="last" value="$last" />
<br/>First: <input type="text" name="first" value="$first" />
<br/><br/>DoB:&#x2003;<input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy" /><br/><br/>
<div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $checked[1]/>&#x2002;Male </div><br/>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $checked[2]/>&#x2002;Female</div>
<p>&#x2003;<br/>Enter Your Name, Date of Birth, and Gender</p>
<p>Then Click Begin</p>
<input type="hidden" name="sub" value="1" />
<input type="submit" value="Begin" class="btn" />
</div></form></div>
<div id="warn">
<h3 class="red">HIPAA WARNING</h3>
<p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and  § 164
</p><p>Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p>
<p>For site security purposes and to ensure that this service remains available to all authorized users, this computer system employs software programs to monitor network traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.</p>
<p>Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply with its policies and procedures.</p>
</div></div>
EOT;
}
elseif($sub == 1){

  echo'<div id="col"><form action="#" method="post"><div id="post">';

ob_flush();
$showE = array();
$showG4 = array();
$checked = array();


echo <<<EOT
<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>


<div id="msg">
<button class="link" type="button" onclick ="exp('s0')">Patient Instructions:</button><div id="s0">
<p>In order for the doctor to determine which foods to test for potential food allergy, you need to provide a list of the foods you currently eat multiple times per week.</p>
<p>Below you will find selection check boxes for Meat and Eggs. Below that another 11 food categories, click on a category and it will expand that category and contract the current category.</p>
<p>Click the checkbox next to the foods that you eat daily or at least twice per week.</p>
<p>When you are done with a category, click on the category's header (or the next category header) and it will contract.</p>
<p>Select the next category and repeat the process until you have completed all categories.</p>
<p>When finished, select the "Done" button.</p></div>
<button id="b1" class="link" type="button" onclick ="exp('s1')">Meat &amp; Eggs</button><div id="s1" class="columns2">
<div id="d027" class="dchk"><input type="checkbox"  id="c027" class="chk" name="F027" value="027" onclick="ck('027')" $checked[027]/>&#x2002;Beef </div>
<div id="d083" class="dchk"><input type="checkbox"  id="c083" class="chk" name="F083" value="083" onclick="ck('083')" $checked[083]/>&#x2002;Chicken</div>
<div id="d106" class="dchk"><input type="checkbox"  id="c106" class="chk" name="F106" value="106" onclick="ck('106')" $checked[106]/>&#x2002;Duck </div>
<div id="d001" class="dchk"><input type="checkbox"  id="c001" class="chk" name="F001" value="001" onclick="ck('001')" $checked[001]/>&#x2002;Egg, White </div>
<div id="d245" class="dchk"><input type="checkbox"  id="c245" class="chk" name="F245" value="245" onclick="ck('245')" $checked[245]/>&#x2002;Egg, Whole </div>
<div id="d075" class="dchk"><input type="checkbox"  id="c075" class="chk" name="F075" value="075" onclick="ck('075')" $checked[075]/>&#x2002;Egg, Yolk </div>
<div id="d158" class="dchk"><input type="checkbox"  id="c158" class="chk" name="F158" value="158" onclick="ck('158')" $checked[158]/>&#x2002;Lamb </div>
<div id="d026" class="dchk"><input type="checkbox"  id="c026" class="chk" name="F026" value="026" onclick="ck('026')" $checked[026]/>&#x2002;Pork</div>
<div id="d284" class="dchk"><input type="checkbox"  id="c284" class="chk" name="F284" value="284" onclick="ck('284')" $checked[284]/>&#x2002;Turkey</div>

</div><button id="b2" class="link" type="button" onclick ="exp('s2')">Dairy</button><div id="s2" class="columns2">
<div id="d081" class="dchk"><input type="checkbox"  id="c081" class="chk" name="F081" value="081" onclick="ck('081')" $checked[081]/>&#x2002;Cheese, Cheddar </div>
<div id="d082" class="dchk"><input type="checkbox"  id="c082" class="chk" name="F082" value="082" onclick="ck('082')" $checked[082]/>&#x2002;Cheese, Mold </div>
<div id="d307" class="dchk"><input type="checkbox"  id="c307" class="chk" name="F307" value="307" onclick="ck('307')" $checked[307]/>&#x2002;Cheese, American</div>
<div id="d117" class="dchk"><input type="checkbox"  id="c117" class="chk" name="F117" value="117" onclick="ck('117')" $checked[117]/>&#x2002;Cheese, Swiss    </div>
<div id="d002" class="dchk"><input type="checkbox"  id="c002" class="chk" name="F002" value="002" onclick="ck('002')" $checked[002]/>&#x2002;Milk, Cow's </div>
<div id="d236" class="dchk"><input type="checkbox"  id="c236" class="chk" name="F236" value="236" onclick="ck('236')" $checked[236]/>&#x2002;Milk, Cow's Whey</div>
<div id="d147" class="dchk"><input type="checkbox"  id="c147" class="chk" name="F147" value="147" onclick="ck('147')" $checked[147]/>&#x2002;Milk, Goat's</div>
<div id="d319" class="dchk"><input type="checkbox"  id="c319" class="chk" name="F319" value="319" onclick="ck('319')" $checked[319]/>&#x2002;Yogurt </div>

</div><button id="b3" class="link" type="button" onclick ="exp('s3')">Fish</button><div id="s3" class="columns2">
<div id="d101" class="dchk"><input type="checkbox"  id="c101" class="chk" name="F101" value="101" onclick="ck('101')" $checked[101]/>&#x2002;Bass, Black  </div>
<div id="d306" class="dchk"><input type="checkbox"  id="c306" class="chk" name="F306" value="306" onclick="ck('306')" $checked[306]/>&#x2002;Catfish</div>
<div id="d003" class="dchk"><input type="checkbox"  id="c003" class="chk" name="F003" value="003" onclick="ck('003')" $checked[003]/>&#x2002;Codfish</div>
<div id="d107" class="dchk"><input type="checkbox"  id="c107" class="chk" name="F107" value="107" onclick="ck('107')" $checked[107]/>&#x2002;Eel  </div>
<div id="d311" class="dchk"><input type="checkbox"  id="c311" class="chk" name="F311" value="311" onclick="ck('311')" $checked[311]/>&#x2002;Flounder</div>
<div id="d312" class="dchk"><input type="checkbox"  id="c312" class="chk" name="F312" value="312" onclick="ck('312')" $checked[312]/>&#x2002;Haddock</div>
<div id="d119" class="dchk"><input type="checkbox"  id="c119" class="chk" name="F119" value="119" onclick="ck('119')" $checked[119]/>&#x2002;Halibut  </div>
<div id="d111" class="dchk"><input type="checkbox"  id="c111" class="chk" name="F111" value="111" onclick="ck('111')" $checked[111]/>&#x2002;Mackerel </div>
<div id="d120" class="dchk"><input type="checkbox"  id="c120" class="chk" name="F120" value="120" onclick="ck('120')" $checked[120]/>&#x2002;Perch, Lake</div>
<div id="d041" class="dchk"><input type="checkbox"  id="c041" class="chk" name="F041" value="041" onclick="ck('041')" $checked[041]/>&#x2002;Salmon, Atlantic</div>
<div id="d353" class="dchk"><input type="checkbox"  id="c353" class="chk" name="F353" value="353" onclick="ck('353')" $checked[353]/>&#x2002;Salmon, Pacific</div>
<div id="d123" class="dchk"><input type="checkbox"  id="c123" class="chk" name="F123" value="123" onclick="ck('123')" $checked[123]/>&#x2002;Snapper, Red   </div>
<div id="d337" class="dchk"><input type="checkbox"  id="c337" class="chk" name="F337" value="337" onclick="ck('337')" $checked[337]/>&#x2002;Sole</div>
<div id="d116" class="dchk"><input type="checkbox"  id="c116" class="chk" name="F116" value="116" onclick="ck('116')" $checked[116]/>&#x2002;Squid </div>
<div id="d118" class="dchk"><input type="checkbox"  id="c118" class="chk" name="F118" value="118" onclick="ck('118')" $checked[118]/>&#x2002;Swordfish  </div>
<div id="d361" class="dchk"><input type="checkbox"  id="c361" class="chk" name="F361" value="361" onclick="ck('361')" $checked[361]/>&#x2002;Tilapia </div>
<div id="d204" class="dchk"><input type="checkbox"  id="c204" class="chk" name="F204" value="204" onclick="ck('204')" $checked[204]/>&#x2002;Trout</div>
<div id="d040" class="dchk"><input type="checkbox"  id="c040" class="chk" name="F040" value="040" onclick="ck('040')" $checked[040]/>&#x2002;Tuna</div>
<div id="d121" class="dchk"><input type="checkbox"  id="c121" class="chk" name="F121" value="121" onclick="ck('121')" $checked[121]/>&#x2002;Whitefish   </div>

</div><button id="b4" class="link" type="button" onclick ="exp('s4')">Fruit</button><div id="s4" class="columns2">
<div id="d049" class="dchk"><input type="checkbox"  id="c049" class="chk" name="F049" value="049" onclick="ck('049')" $checked[049]/>&#x2002;Apple </div>
<div id="d138" class="dchk"><input type="checkbox"  id="c138" class="chk" name="F138" value="138" onclick="ck('138')" $checked[138]/>&#x2002;Apricot</div>
<div id="d092" class="dchk"><input type="checkbox"  id="c092" class="chk" name="F092" value="092" onclick="ck('092')" $checked[092]/>&#x2002;Banana </div>
<div id="d139" class="dchk"><input type="checkbox"  id="c139" class="chk" name="F139" value="139" onclick="ck('139')" $checked[139]/>&#x2002;Blackberry</div>
<div id="d288" class="dchk"><input type="checkbox"  id="c288" class="chk" name="F288" value="288" onclick="ck('288')" $checked[288]/>&#x2002;Blueberry </div>
<div id="d305" class="dchk"><input type="checkbox"  id="c305" class="chk" name="F305" value="305" onclick="ck('305')" $checked[305]/>&#x2002;Cantaloupe  </div>
<div id="d100" class="dchk"><input type="checkbox"  id="c100" class="chk" name="F100" value="100" onclick="ck('100')" $checked[100]/>&#x2002;Cherry, Bing</div>
<div id="d104" class="dchk"><input type="checkbox"  id="c104" class="chk" name="F104" value="104" onclick="ck('104')" $checked[104]/>&#x2002;Cranberry  </div>
<div id="d105" class="dchk"><input type="checkbox"  id="c105" class="chk" name="F105" value="105" onclick="ck('105')" $checked[105]/>&#x2002;Date </div>
<div id="d259" class="dchk"><input type="checkbox"  id="c259" class="chk" name="F259" value="259" onclick="ck('259')" $checked[259]/>&#x2002;Grape/Raisin </div>
<div id="d209" class="dchk"><input type="checkbox"  id="c209" class="chk" name="F209" value="209" onclick="ck('209')" $checked[209]/>&#x2002;Grapefruit </div>
<div id="d087" class="dchk"><input type="checkbox"  id="c087" class="chk" name="F087" value="087" onclick="ck('087')" $checked[087]/>&#x2002;Honeydew </div>
<div id="d370" class="dchk"><input type="checkbox"  id="c370" class="chk" name="F370" value="370" onclick="ck('370')" $checked[370]/>&#x2002;Kale</div>
<div id="d153" class="dchk"><input type="checkbox"  id="c153" class="chk" name="F153" value="153" onclick="ck('153')" $checked[153]/>&#x2002;Kiwi </div>
<div id="d208" class="dchk"><input type="checkbox"  id="c208" class="chk" name="F208" value="208" onclick="ck('208')" $checked[208]/>&#x2002;Lemon </div>
<div id="d134" class="dchk"><input type="checkbox"  id="c134" class="chk" name="F134" value="134" onclick="ck('134')" $checked[134]/>&#x2002;Lime </div>
<div id="d351" class="dchk"><input type="checkbox"  id="c351" class="chk" name="F351" value="351" onclick="ck('351')" $checked[351]/>&#x2002;Mango</div>
<div id="d132" class="dchk"><input type="checkbox"  id="c132" class="chk" name="F132" value="132" onclick="ck('132')" $checked[132]/>&#x2002;Nectarine   </div>
<div id="d124" class="dchk"><input type="checkbox"  id="c124" class="chk" name="F124" value="124" onclick="ck('124')" $checked[124]/>&#x2002;Olive, Black </div>
<div id="d342" class="dchk"><input type="checkbox"  id="c342" class="chk" name="F342" value="342" onclick="ck('342')" $checked[342]/>&#x2002;Olive, Green</div>
<div id="d033" class="dchk"><input type="checkbox"  id="c033" class="chk" name="F033" value="033" onclick="ck('033')" $checked[033]/>&#x2002;Orange </div>
<div id="d127" class="dchk"><input type="checkbox"  id="c127" class="chk" name="F127" value="127" onclick="ck('127')" $checked[127]/>&#x2002;Papaya </div>
<div id="d095" class="dchk"><input type="checkbox"  id="c095" class="chk" name="F095" value="095" onclick="ck('095')" $checked[095]/>&#x2002;Peach</div>
<div id="d094" class="dchk"><input type="checkbox"  id="c094" class="chk" name="F094" value="094" onclick="ck('094')" $checked[094]/>&#x2002;Pear </div>
<div id="d210" class="dchk"><input type="checkbox"  id="c210" class="chk" name="F210" value="210" onclick="ck('210')" $checked[210]/>&#x2002;Pineapple </div>
<div id="d128" class="dchk"><input type="checkbox"  id="c128" class="chk" name="F128" value="128" onclick="ck('128')" $checked[128]/>&#x2002;Plum/Prune  </div>
<div id="d129" class="dchk"><input type="checkbox"  id="c129" class="chk" name="F129" value="129" onclick="ck('129')" $checked[129]/>&#x2002;Raspberry  </div>
<div id="d044" class="dchk"><input type="checkbox"  id="c044" class="chk" name="F044" value="044" onclick="ck('044')" $checked[044]/>&#x2002;Strawberry</div>
<div id="d155" class="dchk"><input type="checkbox"  id="c155" class="chk" name="F155" value="155" onclick="ck('155')" $checked[155]/>&#x2002;Tangerine </div>
<div id="d329" class="dchk"><input type="checkbox"  id="c329" class="chk" name="F329" value="329" onclick="ck('329')" $checked[329]/>&#x2002;Watermelon </div>

</div><button id="b5" class="link" type="button" onclick ="exp('s5')">Bread, Cereal, Rice, &amp; Grains</button><div id="s5" class="columns2">
<div id="d006" class="dchk"><input type="checkbox"  id="c006" class="chk" name="F006" value="006" onclick="ck('006')" $checked[006]/>&#x2002;Barley </div>
<div id="d304" class="dchk"><input type="checkbox"  id="c304" class="chk" name="F304" value="304" onclick="ck('304')" $checked[304]/>&#x2002;Bran, Wheat </div>
<div id="d102" class="dchk"><input type="checkbox"  id="c102" class="chk" name="F102" value="102" onclick="ck('102')" $checked[102]/>&#x2002;Buckwheat  </div>
<div id="d008" class="dchk"><input type="checkbox"  id="c008" class="chk" name="F008" value="008" onclick="ck('008')" $checked[008]/>&#x2002;Corn </div>
<div id="d125" class="dchk"><input type="checkbox"  id="c125" class="chk" name="F125" value="125" onclick="ck('125')" $checked[125]/>&#x2002;Hops  </div>
<div id="d090" class="dchk"><input type="checkbox"  id="c090" class="chk" name="F090" value="090" onclick="ck('090')" $checked[090]/>&#x2002;Malt</div>
<div id="d157" class="dchk"><input type="checkbox"  id="c157" class="chk" name="F157" value="157" onclick="ck('157')" $checked[157]/>&#x2002;Millet</div>
<div id="d007" class="dchk"><input type="checkbox"  id="c007" class="chk" name="F007" value="007" onclick="ck('007')" $checked[007]/>&#x2002;Oat </div>
<div id="d369" class="dchk"><input type="checkbox"  id="c369" class="chk" name="F369" value="369" onclick="ck('369')" $checked[369]/>&#x2002;Quinoa</div>
<div id="d009" class="dchk"><input type="checkbox"  id="c009" class="chk" name="F009" value="009" onclick="ck('009')" $checked[009]/>&#x2002;Rice</div>
<div id="d005" class="dchk"><input type="checkbox"  id="c005" class="chk" name="F005" value="005" onclick="ck('005')" $checked[005]/>&#x2002;Rye </div>
<div id="d131" class="dchk"><input type="checkbox"  id="c131" class="chk" name="F131" value="131" onclick="ck('131')" $checked[131]/>&#x2002;Tapioca  </div>
<div id="d004" class="dchk"><input type="checkbox"  id="c004" class="chk" name="F004" value="004" onclick="ck('004')" $checked[004]/>&#x2002;Wheat </div>
<div id="d079" class="dchk"><input type="checkbox"  id="c079" class="chk" name="F079" value="079" onclick="ck('079')" $checked[079]/>&#x2002;Wheat, Gluten </div>

</div><button id="b6" class="link" type="button" onclick ="exp('s6')">Yeast</button><div id="s6" class="columns2">
<div id="d318" class="dchk"><input type="checkbox"  id="c318" class="chk" name="F318" value="318" onclick="ck('318')" $checked[318]/>&#x2002;Yeast, Bakers  </div>
<div id="d045" class="dchk"><input type="checkbox"  id="c045" class="chk" name="F045" value="045" onclick="ck('045')" $checked[045]/>&#x2002;Yeast, Brewers</div>

</div><button id="b7" class="link" type="button" onclick ="exp('s7')">Peas, Beans, &amp; Legumes</button><div id="s7" class="columns2">
<div id="d356" class="dchk"><input type="checkbox"  id="c356" class="chk" name="F356" value="356" onclick="ck('356')" $checked[356]/>&#x2002;Bean, Black </div>
<div id="d300" class="dchk"><input type="checkbox"  id="c300" class="chk" name="F300" value="300" onclick="ck('300')" $checked[300]/>&#x2002;Bean, Kidney </div>
<div id="d301" class="dchk"><input type="checkbox"  id="c301" class="chk" name="F301" value="301" onclick="ck('301')" $checked[301]/>&#x2002;Bean, Lima</div>
<div id="d302" class="dchk"><input type="checkbox"  id="c302" class="chk" name="F302" value="302" onclick="ck('302')" $checked[302]/>&#x2002;Bean, Pinto </div>
<div id="d303" class="dchk"><input type="checkbox"  id="c303" class="chk" name="F303" value="303" onclick="ck('303')" $checked[303]/>&#x2002;Bean, Wax String </div>
<div id="d015" class="dchk"><input type="checkbox"  id="c015" class="chk" name="F015" value="015" onclick="ck('015')" $checked[015]/>&#x2002;Bean, White/Navy </div>
<div id="d154" class="dchk"><input type="checkbox"  id="c154" class="chk" name="F154" value="154" onclick="ck('154')" $checked[154]/>&#x2002;Brussel Sprouts</div>
<div id="d355" class="dchk"><input type="checkbox"  id="c355" class="chk" name="F355" value="355" onclick="ck('355')" $checked[355]/>&#x2002;Pea, Black-Eyed</div>
<div id="d142" class="dchk"><input type="checkbox"  id="c142" class="chk" name="F142" value="142" onclick="ck('142')" $checked[142]/>&#x2002;Pea, Chick</div>
<div id="d012" class="dchk"><input type="checkbox"  id="c012" class="chk" name="F012" value="012" onclick="ck('012')" $checked[012]/>&#x2002;Pea, Green</div>
<div id="d126" class="dchk"><input type="checkbox"  id="c126" class="chk" name="F126" value="126" onclick="ck('126')" $checked[126]/>&#x2002;Lentil   </div>
<div id="d014" class="dchk"><input type="checkbox"  id="c014" class="chk" name="F014" value="014" onclick="ck('014')" $checked[014]/>&#x2002;Soybean </div>

</div><button id="b8" class="link" type="button" onclick ="exp('s8')">Seeds, Spices &amp; Peppers</button><div id="s8" class="columns2">
<div id="d343" class="dchk"><input type="checkbox"  id="c343" class="chk" name="F343" value="343" onclick="ck('343')" $checked[343]/>&#x2002;Basil</div>
<div id="d347" class="dchk"><input type="checkbox"  id="c347" class="chk" name="F347" value="347" onclick="ck('347')" $checked[347]/>&#x2002;Bay leaf</div>
<div id="d159" class="dchk"><input type="checkbox"  id="c159" class="chk" name="F159" value="159" onclick="ck('159')" $checked[159]/>&#x2002;Canola Seed </div>
<div id="d308" class="dchk"><input type="checkbox"  id="c308" class="chk" name="F308" value="308" onclick="ck('308')" $checked[308]/>&#x2002;Cinnamon</div>
<div id="d146" class="dchk"><input type="checkbox"  id="c146" class="chk" name="F146" value="146" onclick="ck('146')" $checked[146]/>&#x2002;Cloves</div>
<div id="d309" class="dchk"><input type="checkbox"  id="c309" class="chk" name="F309" value="309" onclick="ck('309')" $checked[309]/>&#x2002;Cottonseed  </div>
<div id="d140" class="dchk"><input type="checkbox"  id="c140" class="chk" name="F140" value="140" onclick="ck('140')" $checked[140]/>&#x2002;Cumin</div>
<div id="d141" class="dchk"><input type="checkbox"  id="c141" class="chk" name="F141" value="141" onclick="ck('141')" $checked[141]/>&#x2002;Curry powder </div>
<div id="d341" class="dchk"><input type="checkbox"  id="c341" class="chk" name="F341" value="341" onclick="ck('341')" $checked[341]/>&#x2002;Dill</div>
<div id="d143" class="dchk"><input type="checkbox"  id="c143" class="chk" name="F143" value="143" onclick="ck('143')" $checked[143]/>&#x2002;Flaxseed</div>
<div id="d345" class="dchk"><input type="checkbox"  id="c345" class="chk" name="F345" value="345" onclick="ck('345')" $checked[345]/>&#x2002;Ginger </div>
<div id="d089" class="dchk"><input type="checkbox"  id="c089" class="chk" name="F089" value="089" onclick="ck('089')" $checked[089]/>&#x2002;Mustard </div>
<div id="d148" class="dchk"><input type="checkbox"  id="c148" class="chk" name="F148" value="148" onclick="ck('148')" $checked[148]/>&#x2002;Nutmeg</div>
<div id="d283" class="dchk"><input type="checkbox"  id="c283" class="chk" name="F283" value="283" onclick="ck('283')" $checked[283]/>&#x2002;Oregano</div>
<div id="d112" class="dchk"><input type="checkbox"  id="c112" class="chk" name="F112" value="112" onclick="ck('112')" $checked[112]/>&#x2002;Paprika </div>
<div id="d144" class="dchk"><input type="checkbox"  id="c144" class="chk" name="F144" value="144" onclick="ck('144')" $checked[144]/>&#x2002;Parsley </div>
<div id="d263" class="dchk"><input type="checkbox"  id="c263" class="chk" name="F263" value="263" onclick="ck('263')" $checked[263]/>&#x2002;Pepper, Green/Bell </div>
<div id="d313" class="dchk"><input type="checkbox"  id="c313" class="chk" name="F313" value="313" onclick="ck('313')" $checked[313]/>&#x2002;Pepper, Black/White</div>
<div id="d314" class="dchk"><input type="checkbox"  id="c314" class="chk" name="F314" value="314" onclick="ck('314')" $checked[314]/>&#x2002;Pepper, Chili </div>
<div id="d011" class="dchk"><input type="checkbox"  id="c011" class="chk" name="F011" value="011" onclick="ck('011')" $checked[011]/>&#x2002;Pepper, Jalapeno</div>
<div id="d150" class="dchk"><input type="checkbox"  id="c150" class="chk" name="F150" value="150" onclick="ck('150')" $checked[150]/>&#x2002;Pepper, Red </div>
<div id="d137" class="dchk"><input type="checkbox"  id="c137" class="chk" name="F137" value="137" onclick="ck('137')" $checked[137]/>&#x2002;Poppy Seed</div>
<div id="d352" class="dchk"><input type="checkbox"  id="c352" class="chk" name="F352" value="352" onclick="ck('352')" $checked[352]/>&#x2002;Rosemary</div>
<div id="d349" class="dchk"><input type="checkbox"  id="c349" class="chk" name="F349" value="349" onclick="ck('349')" $checked[349]/>&#x2002;Safflower seed</div>
<div id="d151" class="dchk"><input type="checkbox"  id="c151" class="chk" name="F151" value="151" onclick="ck('151')" $checked[151]/>&#x2002;Sage</div>
<div id="d010" class="dchk"><input type="checkbox"  id="c010" class="chk" name="F010" value="010" onclick="ck('010')" $checked[010]/>&#x2002;Sesame Seed</div>
<div id="d316" class="dchk"><input type="checkbox"  id="c316" class="chk" name="F316" value="316" onclick="ck('316')" $checked[316]/>&#x2002;Sunflower Seed </div>
<div id="d340" class="dchk"><input type="checkbox"  id="c340" class="chk" name="F340" value="340" onclick="ck('340')" $checked[340]/>&#x2002;Tea, Black</div>
<div id="d156" class="dchk"><input type="checkbox"  id="c156" class="chk" name="F156" value="156" onclick="ck('156')" $checked[156]/>&#x2002;Thyme</div>
<div id="d016" class="dchk"><input type="checkbox"  id="c016" class="chk" name="F016" value="016" onclick="ck('016')" $checked[016]/>&#x2002;Turmeric</div>

</div><button id="b9" class="link" type="button" onclick ="exp('s9')">Shellfish</button><div id="s9" class="columns2">
<div id="d207" class="dchk"><input type="checkbox"  id="c207" class="chk" name="F207" value="207" onclick="ck('207')" $checked[207]/>&#x2002;Clam</div>
<div id="d310" class="dchk"><input type="checkbox"  id="c310" class="chk" name="F310" value="310" onclick="ck('310')" $checked[310]/>&#x2002;Crab, Blue </div>
<div id="d339" class="dchk"><input type="checkbox"  id="c339" class="chk" name="F339" value="339" onclick="ck('339')" $checked[339]/>&#x2002;Crab, Alaskan </div>
<div id="d354" class="dchk"><input type="checkbox"  id="c354" class="chk" name="F354" value="354" onclick="ck('354')" $checked[354]/>&#x2002;Crab,Dungeness </div>
<div id="d080" class="dchk"><input type="checkbox"  id="c080" class="chk" name="F080" value="080" onclick="ck('080')" $checked[080]/>&#x2002;Lobster, Maine</div>
<div id="d136" class="dchk"><input type="checkbox"  id="c136" class="chk" name="F136" value="136" onclick="ck('136')" $checked[136]/>&#x2002;Lobster, Spiny </div>
<div id="d290" class="dchk"><input type="checkbox"  id="c290" class="chk" name="F290" value="290" onclick="ck('290')" $checked[290]/>&#x2002;Oyster </div>
<div id="d338" class="dchk"><input type="checkbox"  id="c338" class="chk" name="F338" value="338" onclick="ck('338')" $checked[338]/>&#x2002;Scallop</div>
<div id="d024" class="dchk"><input type="checkbox"  id="c024" class="chk" name="F024" value="024" onclick="ck('024')" $checked[024]/>&#x2002;Shrimp</div>

</div><button id="b10" class="link" type="button" onclick ="exp('s10')">Sugar</button><div id="s10" class="columns2">
<div id="d145" class="dchk"><input type="checkbox"  id="c145" class="chk" name="F145" value="145" onclick="ck('145')" $checked[145]/>&#x2002;Beet, Sugar</div>
<div id="d247" class="dchk"><input type="checkbox"  id="c247" class="chk" name="F247" value="247" onclick="ck('247')" $checked[247]/>&#x2002;Honey </div>
<div id="d350" class="dchk"><input type="checkbox"  id="c350" class="chk" name="F350" value="350" onclick="ck('350')" $checked[350]/>&#x2002;Sugar, Cane</div>

</div><button id="b11" class="link" type="button" onclick ="exp('s11')"> Nuts</button><div id="s11" class="columns2">
<div id="d013" class="dchk"><input type="checkbox"  id="c013" class="chk" name="F013" value="013" onclick="ck('013')" $checked[013]/>&#x2002;Peanut </div>
<div id="d020" class="dchk"><input type="checkbox"  id="c020" class="chk" name="F020" value="020" onclick="ck('020')" $checked[020]/>&#x2002;Almond </div>
<div id="d018" class="dchk"><input type="checkbox"  id="c018" class="chk" name="F018" value="018" onclick="ck('018')" $checked[018]/>&#x2002;Brazil Nut </div>
<div id="d202" class="dchk"><input type="checkbox"  id="c202" class="chk" name="F202" value="202" onclick="ck('202')" $checked[202]/>&#x2002;Cashew </div>
<div id="d103" class="dchk"><input type="checkbox"  id="c103" class="chk" name="F103" value="103" onclick="ck('103')" $checked[103]/>&#x2002;Chestnut </div>
<div id="d093" class="dchk"><input type="checkbox"  id="c093" class="chk" name="F093" value="093" onclick="ck('093')" $checked[093]/>&#x2002;Chocolate/Cacao</div>
<div id="d036" class="dchk"><input type="checkbox"  id="c036" class="chk" name="F036" value="036" onclick="ck('036')" $checked[036]/>&#x2002;Coconut </div>
<div id="d221" class="dchk"><input type="checkbox"  id="c221" class="chk" name="F221" value="221" onclick="ck('221')" $checked[221]/>&#x2002;Coffee</div>
<div id="d348" class="dchk"><input type="checkbox"  id="c348" class="chk" name="F348" value="348" onclick="ck('348')" $checked[348]/>&#x2002;Cola nut </div>
<div id="d017" class="dchk"><input type="checkbox"  id="c017" class="chk" name="F017" value="017" onclick="ck('017')" $checked[017]/>&#x2002;Hazelnut </div>
<div id="d363" class="dchk"><input type="checkbox"  id="c363" class="chk" name="F363" value="363" onclick="ck('363')" $checked[363]/>&#x2002;Macadamia</div>
<div id="d201" class="dchk"><input type="checkbox"  id="c201" class="chk" name="F201" value="201" onclick="ck('201')" $checked[201]/>&#x2002;Pecan</div>
<div id="d114" class="dchk"><input type="checkbox"  id="c114" class="chk" name="F114" value="114" onclick="ck('114')" $checked[114]/>&#x2002;Pine Nut </div>
<div id="d203" class="dchk"><input type="checkbox"  id="c203" class="chk" name="F203" value="203" onclick="ck('203')" $checked[203]/>&#x2002;Pistachio </div>
<div id="d130" class="dchk"><input type="checkbox"  id="c130" class="chk" name="F130" value="130" onclick="ck('130')" $checked[130]/>&#x2002;Vanilla  </div>
<div id="d256" class="dchk"><input type="checkbox"  id="c256" class="chk" name="F256" value="256" onclick="ck('256')" $checked[256]/>&#x2002;Walnut, Black </div>
<div id="d317" class="dchk"><input type="checkbox"  id="c317" class="chk" name="F317" value="317" onclick="ck('317')" $checked[317]/>&#x2002;Walnut, English </div>

</div><button id="b12" class="link" type="button" onclick ="exp('s12')">Vegatables</button><div id="s12" class="columns2">
<div id="d122" class="dchk"><input type="checkbox"  id="c122" class="chk" name="F122" value="122" onclick="ck('122')" $checked[122]/>&#x2002;Artichoke   </div>
<div id="d135" class="dchk"><input type="checkbox"  id="c135" class="chk" name="F135" value="135" onclick="ck('135')" $checked[135]/>&#x2002;Asparagus</div>
<div id="d096" class="dchk"><input type="checkbox"  id="c096" class="chk" name="F096" value="096" onclick="ck('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="d152" class="dchk"><input type="checkbox"  id="c152" class="chk" name="F152" value="152" onclick="ck('152')" $checked[152]/>&#x2002;Beet </div>
<div id="d260" class="dchk"><input type="checkbox"  id="c260" class="chk" name="F260" value="260" onclick="ck('260')" $checked[260]/>&#x2002;Broccoli </div>
<div id="d216" class="dchk"><input type="checkbox"  id="c216" class="chk" name="F216" value="216" onclick="ck('216')" $checked[216]/>&#x2002;Cabbage Mix </div>
<div id="d031" class="dchk"><input type="checkbox"  id="c031" class="chk" name="F031" value="031" onclick="ck('031')" $checked[031]/>&#x2002;Carrot</div>
<div id="d291" class="dchk"><input type="checkbox"  id="c291" class="chk" name="F291" value="291" onclick="ck('291')" $checked[291]/>&#x2002;Cauliflower</div>
<div id="d085" class="dchk"><input type="checkbox"  id="c085" class="chk" name="F085" value="085" onclick="ck('085')" $checked[085]/>&#x2002;Celery</div>
<div id="d244" class="dchk"><input type="checkbox"  id="c244" class="chk" name="F244" value="244" onclick="ck('244')" $checked[244]/>&#x2002;Cucumber</div>
<div id="d108" class="dchk"><input type="checkbox"  id="c108" class="chk" name="F108" value="108" onclick="ck('108')" $checked[108]/>&#x2002;Eggplant  </div>
<div id="d047" class="dchk"><input type="checkbox"  id="c047" class="chk" name="F047" value="047" onclick="ck('047')" $checked[047]/>&#x2002;Garlic </div>
<div id="d133" class="dchk"><input type="checkbox"  id="c133" class="chk" name="F133" value="133" onclick="ck('133')" $checked[133]/>&#x2002;Gelatin </div>
<div id="d215" class="dchk"><input type="checkbox"  id="c215" class="chk" name="F215" value="215" onclick="ck('215')" $checked[215]/>&#x2002;Lettuce</div>
<div id="d212" class="dchk"><input type="checkbox"  id="c212" class="chk" name="F212" value="212" onclick="ck('212')" $checked[212]/>&#x2002;Mushroom</div>
<div id="d048" class="dchk"><input type="checkbox"  id="c048" class="chk" name="F048" value="048" onclick="ck('048')" $checked[048]/>&#x2002;Onion </div>
<div id="d054" class="dchk"><input type="checkbox"  id="c054" class="chk" name="F054" value="054" onclick="ck('054')" $checked[054]/>&#x2002;Potato, Sweet</div>
<div id="d035" class="dchk"><input type="checkbox"  id="c035" class="chk" name="F035" value="035" onclick="ck('035')" $checked[035]/>&#x2002;Potato, White</div>
<div id="d115" class="dchk"><input type="checkbox"  id="c115" class="chk" name="F115" value="115" onclick="ck('115')" $checked[115]/>&#x2002;Pumpkin  </div>
<div id="d149" class="dchk"><input type="checkbox"  id="c149" class="chk" name="F149" value="149" onclick="ck('149')" $checked[149]/>&#x2002;Radish</div>
<div id="d214" class="dchk"><input type="checkbox"  id="c214" class="chk" name="F214" value="214" onclick="ck('214')" $checked[214]/>&#x2002;Spinach </div>
<div id="d346" class="dchk"><input type="checkbox"  id="c346" class="chk" name="F346" value="346" onclick="ck('346')" $checked[346]/>&#x2002;Squash, Yellow </div>
<div id="d344" class="dchk"><input type="checkbox"  id="c344" class="chk" name="F344" value="344" onclick="ck('344')" $checked[344]/>&#x2002;Squash, Zucchini</div>
<div id="d025" class="dchk"><input type="checkbox"  id="c025" class="chk" name="F025" value="025" onclick="ck('025')" $checked[025]/>&#x2002;Tomato </div>
</div>
<input type="hidden" name="first" value="$first" />
<input type="hidden" name="last" value="$last" />
<input type="hidden" name="dob" value="$strdob" />
<input type="hidden" name="gender" value="$gender" />
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="sub" value="2" />
<input type="submit" value="Done" class="btn" /></div></form>
</div>
EOT;
}
else{
  $ratedCount = 0;
  $matches = array();
  $s14 = 'block';
  
  if($sub == 2){
    $num = 200;
    $sql = "SELECT `Code`, `description` FROM `Rast` WHERE `Code` LIKE'F%' ORDER BY `Code`";  
    $results = mysql_query($sql);
    while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
//    $rank = unserialize(file_get_contents('/home/amx/public_html/rank.ser'));
    $rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
    $rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);
  $data = array_diff_key($rank[10] ,$rank[1] );
  foreach($data as $code => $num){
    $rank[1][$code] =  $num;
  }
  $data = array_diff_key($rank[10] ,$rank[3] );
  foreach($data as $code => $num){
    $rank[3][$code] =  $num;
  }
    foreach($_POST as $code => $v){
      if(substr($code,0,1) == 'F'){
        $showE[$code] = $rank[1][$code]; //intval($rank[1][$code]);
        $showG4[$code] = $rank[3][$code]; // intval($rank[3][$code]);
        $ratedCount++;
        $descriptions[$code][1] = 1;
        $matches[$code] = 1;
      }
      elseif($k == 'C'){
        $limit = intval($v);
      }
    }

    $food[0] = $showE;
    $food[1] = $showG4;
    $food[2] = $desc;
    $food[3] = $matches;
    $food[4] = $_POST;
    $foods = $food;
    $foods['limit'] = $limit;
    $fp = fopen($id . 'food.jsn','w');
    fwrite($fp,json_encode($foods));
  }
  else{
   $foods = json_decode(file_get_contents($id . 'food.jsn'),true);
    $showE = $foods[0];
    $showG4 = $foods[1];
    $desc = $foods[2];
    $matches = $foods[3];
    foreach($_POST as $k => $v){
      $code = substr($k,1);
      if(substr($k,0,1) == 'E'){
        $checkedE[$code] = 'checked="checked"';
      }
      if(substr($k,0,1) == 'E'){
        $checkedG[$code] = 'checked="checked"';
      }
    }
  }
echo <<<EOT
<div id="post">
<form action="#" method="post"><div>
<input type="hidden" name="sub" value="3"/>
<button class="link" type="button" onclick ="exp('s0')">Patient Info</button><br><div id="s0">
<br/>Last: <input type="text" name="last" value="$last" />
<br/>First: <input type="text" name="first" value="$first" />
<br/><br/>DoB:&#x2003;<input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy" /><br/><br/>
<div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $checked[1]/>&#x2002;Male </div><br/>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $checked[2]/>&#x2002;Female</div>
<br/><hr/><br/></div></div>
EOT;
echo <<<EOT
<br/>
<div id="d003" class="dchk4"><input id="c003" type="radio" class="chk" name="C" value="15" onclick="showtop('003',30)" $checked[3]/>&#x2002;Top 15</div>
<div id="d004" class="dchk4"><input id="c004" type="radio" class="chk" name="C" value="30" onclick="showtop('004',60)" $checked[4]/>&#x2002;Top 30</div>
<div id="d005" class="dchk4"><input id="c005" type="radio" class="chk" name="C" value="40" onclick="showtop('005',80)" $checked[5]/>&#x2002;Top 40</div>
<div id="d007" class="dchk4"><input id="c007" type="radio" class="chk" name="C" value="999" onclick="showtop('007',999)" $checked[5]/>&#x2002;Sel. All</div><br/>
<div id="d006" class="dchk3"><input id="c006" type="radio" class="chk" name="C" value="0" onclick="showtop('006',0)" $checked[5]/>&#x2002;Clear All</div>
<div id="d008" class="dchk3"><input id="c008" type="radio" class="chk" name="C" value="999" onclick="clearIgX('008',1)" $checked[5]/>&#x2002;Clear IgE</div>
<div id="d009" class="dchk3"><input id="c009" type="radio" class="chk" name="C" value="999" onclick="clearIgX('009',0)" $checked[5]/>&#x2002;Clear IgG4</div>
EOT;

echo <<<EOT
<h3>Patient Summary</h3>

<div class="col">
<button id="b16" class="link" type="button" onclick ="panels('s16')">Patient's Top Ranked Foods</button>
<div id="s16" class="expand">
  <div class="row">
  <div class="halfhead">Ranking<div class="ige">IgE </div></div><div class="halfhead">Ranking<div class="igg4">IgG4</div> </div>
  </div><br/>
EOT;
$rated = array();
$js = 'var Rated = {';
ob_flush();
$icon = array('tblank','plus');
$cnt = count($showE);
if ($cnt > 0){
  asort($showE);
  asort($showG4);
  reset($showE);
  reset($showG4);
  $ndx = 0;
  while($ndx < $cnt){
    $g4 = current($showG4);
    $e  = current($showE);
    $ndx++;
    $ke = key($showE);
    
//   echo "<p>$ke=>$e | $kg4=>$g4</p> ";
   $num = substr($ke,1);
   $idde = "R1$num" ;
   $idce = "c1$num";
   $ce = "1$num";
   $js .= "$ce:[null,null],";
   $rated[$ce] = true;
   
   $kg4 = key($showG4);
   $num = substr($kg4,1);
   $idcg4 = "c3$num";
   $iddg4 = "R3$num";
   $cg4 = "3$num" ;
   $js .= "$cg4:[null,null],";
   $rated[$cg4] = true;
    echo <<<EOT
  <div class="row">
  
  <div id="$idde" class="fchk" title="1" ><input type="checkbox"  id="$idce" class="chk" name="E$ke" value="$ce" onclick="ck('$ce')" $checkedE[$ke] /><div class="descE">&#x2002;$ndx&#x2002;$desc[$ke]</div></div>&#x2003;  
  <div id="$iddg4" class="fchk" title="3" ><input type="checkbox"  id="$idcg4" class="chk" name="G$kg4" value="$kg4" onclick="ck('$cg4')" $checkedG[$kg4] /><div class="descG4">&#x2002;$ndx&#x2002;$desc[$kg4]</div></div> <br/> 
  </div>
EOT;
    next($showE);
    next($showG4);

  }
}
$js = substr($js,0,-1) . "};\n";
echo <<<EOT
</div></div><div class="col"><button id="b15" class="link" type="button" onclick ="panels('s15')">Panels</button>
<div id="s15" class="expand"><h3>Allermetrix Food Panels</h3>
<div class="legend">
<div class="pige" style="width:2.4em">IgE</div>
<div class="pigg4" style="width:2.4em">IgG4</div>
</div>
EOT;
$types = array('','IgE','IgG','IgG4');
$js .= 'var panelCodes = {';
$panels = array();
$ndx = 0;
$fp = fopen("/home/amx/public_html/f/panels.txt", "r");
while (($text= fgets($fp , 72)) !== false) {
  $ndx++;
  if($ndx > 30){break;}
  $panel = trim(substr($text,0,8));
  $description = trim(substr($text,10,128));
  $TestTypeCount = array(0,0,0,0,0,0,0);
  $total = '-';
  $codes = '';
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `panel` = '$panel'";
  $results = mysql_query($sql);
  while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$panel][$code] = array($desc[$code],intval($tests[$panel][$code][1]) + pow(2,$type));}
    //$show .= "$tests[$panel][$code];
    $TestTypeCount[$type]++;
    $c = intval($type . substr($code,1));
    if($rated[$c]){
      $codes .= "$c,";
    }
  }
  $panels[$panel] =array($description,$TestTypeCount[1],$TestTypeCount[3],$total);
  $codes = substr($codes,0,-1) . ']';
  $js .= "$panel:[$codes,";
}
$js = substr($js,0,-1) . "};\n";
$classes = array();
$classes[0] = 'left';
$classes[1] = 'left';
$classes[2] = 'IgE';
$classes[4] = 'left';
$classes[6] = 'IgE';
$classes[12] = 'left';
$classes[8] = 'IgG4';
$classes[10] = 'both';
$types = array();
$types[0] = '';
$types[1] = '';
$types[2] = 'IgE';
$types[4] = 'IgG';
$types[6] = 'IgE IgG';
$types[12] = 'IgG IgG4';
$types[8] = 'IgG4';
$types[10] = 'IgE IgG4';
$js .= 'var foodPanels = {';
$ndx = 0;
foreach($panels as $panel => $v){
$js .= "$panel:[null,null,null],";
echo <<<EOT
<div id="P$panel" class="pchk">
  <input type="checkbox"  id="c$panel" class="chk" name="P$panel" value="$panel" onclick="pck('$panel')" />
  <div class="panel">&#x2002;$v[0]</div>
  <div class="inline" onclick="exp('EXP$panel')">
    <div class="pige">$v[1]</div><div class="pigg4">$v[2]</div><div class="downarrow"></div>
  </div>
  <br/>
</div>

EOT;
 // $panel = intval(preg_replace('/^D/','',$panel));

  if(count($tests[$panel]) > 0){
    asort($tests[$panel]);
    echo "<div id=\"EXP$panel\" class=\"expand\">\n";
    foreach($tests[$panel] as $code => $array){
      $match = $icon[$matches[$code]];
      list($description,$class) = $array;
      $description = $desc[$code];
      $c = substr($code,1);
      echo '<div class="' . $classes[$class] . '"><div class="' . $match . '"></div><div class="inline">&#x2002;' .  $description .'</div><div class="types">' . $types[$class] . "</div></div><br/>\n";
    }
    echo "<div class=\"row\"><div class=\"plus\"></div> Patient Selected &#x2003;<div class=\"tblank\"></div> Not Selected</div></div>\n";

  }
  else{
    echo "<div id=\"EXP$panel\" class=\"expand\">No Tests Found </div>\n";
  }
}
$js = substr($js,0,-1) . "};\n";

echo <<<EOT
<br/>
<br/><hr/></div></div>
<div id="s18" class="col">
<h3>Full Request Form</h3>
<div id="s17">
<button class="link" type="button" >Foods</button>
<button class="link" type="button" >Inhalants</button>
<button class="link" type="button" >Trees</button>
<button class="link" type="button" >Weeds</button>
<button class="link" type="button" >Grasses</button>
<button class="link" type="button" >Mites</button>
<button class="link" type="button" >Epidermal</button>
<button class="link" type="button" >Dust</button>
<button class="link" type="button" >Ocupational</button>
<button class="link" type="button" >Molds</button>
<button class="link" type="button" >Mixes</button>
</div></div>
<div id="end"><h3>End</h3></div>
<input type="hidden" name="sub" value="3" />
<input type="submit" value="Create Request Form" class="btn" />
</div></form>
EOT;
}
$show = number_format(microtime(true) - $startTime,6);
//<form action="history.php" method="post"><div><button class="go" type="submit">History</button></div></form>';

echo <<<EOT


<div id="S1"><p>&#x2002;</p></div>

<script type="text/javascript"> //<![CDATA[
$js

var prev = null; 
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
bg[0] = '#144';
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


function swap(){
  var req = document.getElementById('s18');
  var panel = document.getElementById('s15');
  panel.style.display = flip[panel.style.display];
  req.style.display = flip[req.style.display];
  var btn = document.getElementById('b15');
  if(btn.innerHTML == 'Get Request Form'){
    btn.innerHTML = 'Get Food Panels';
  }
  else{
    btn.innerHTML = 'Get Request Form';
  }
}
EOT;
if($sub == 2){
echo <<<EOT
var ratedCount = $ratedCount;
document.getElementById('s0').style.display = 'none';
function ck(id){
  d[id].style.backgroundColor=bg[c[id].checked];
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
function pck(id){
 var checked = foodPanels[id][1].checked;
  foodPanels[id][0].style.backgroundColor=bg[checked];
  for (var r in Rated){
    Rated[r][0].style.backgroundColor=bg[false];
    Rated[r][1].checked=false;
    Rated[r][1].disabled=false;
    Rated[r][1].style.opacity=1;
  }
  for (var r in foodPanels){
    foodPanels[r][0].style.backgroundColor = bg[false];
    foodPanels[r][1].checked = false;
  } 
  if(checked){
    for (var div=0; div<panelCodes[id].length; div++){
      Rated[panelCodes[id][div]][0].style.backgroundColor=bg[Rated[panelCodes[id][div]][0].title];
      Rated[panelCodes[id][div]][1].disabled=true;
      Rated[panelCodes[id][div]][1].style.opacity=0;
    }
    var y=document.getElementById('s16').offsetTop;window.scrollTo(0, y+60);
  }
  foodPanels[id][1].checked=checked;
  foodPanels[id][0].style.backgroundColor=bg[checked]; 

}

function showtop(on,off){
  var ndx = 0;
  for (var r in Rated){
    if(ndx < off){
      Rated[r][0].style.backgroundColor=bg[true];
      Rated[r][1].checked=true;
      Rated[r][1].disabled=false;
      Rated[r][1].style.opacity=1;
    }
    else{
      Rated[r][0].style.backgroundColor=bg[false];
      Rated[r][1].checked=false;
      Rated[r][1].disabled=false;
      Rated[r][1].style.opacity=1;
    }
    ndx++;
  }
  ratedCount = off;
  document.getElementById('d003').style.backgroundColor=bg[false];
  document.getElementById('d004').style.backgroundColor=bg[false];
  document.getElementById('d005').style.backgroundColor=bg[false];
  document.getElementById('d006').style.backgroundColor=bg[false];
  document.getElementById('d007').style.backgroundColor=bg[false];
  document.getElementById('d008').style.backgroundColor=bg[false];
  document.getElementById('d009').style.backgroundColor=bg[false];
  document.getElementById('d' + on).style.backgroundColor=bg[true];
  for (var r in foodPanels){
    foodPanels[r][0].style.backgroundColor = bg[false];
    foodPanels[r][1].checked = false;
  } 
}


function clearIgX(on,off){
  var ndx = 1;
  for (var r in Rated){
    if((ndx & 1) == off){
      Rated[r][0].style.backgroundColor=bg[false];
      Rated[r][1].checked=false;
      Rated[r][1].disabled=false;
      Rated[r][1].style.opacity=1;
    }
    ndx = ndx + 1;
  }
  ratedCount = off;
  document.getElementById('d' + on).style.backgroundColor=bg[true];

}

function init(){
var checked,did,idType,i,chk;
var divs = document.getElementsByTagName("div");
//div.sort;
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "R"){
        i = did.substring(1,6);
        c[i] = document.getElementById('c' + i);
        Rated[i][1] = document.getElementById('c' + i);
        d[i] = document.getElementById('R' + i);
        Rated[i][0] =  document.getElementById('R' + i);
        Rated[i][0].style.backgroundColor=bg[Rated[i][1].checked];
      }
      else if (idType == "P" ){
        i = did.substring(1,6);
        foodPanels[i][0] = divs[div];
        foodPanels[i][1] = document.getElementById('c' + i);
        foodPanels[i][2] = document.getElementById('EXP' + i);
        foodPanels[i][2].style.display = 'none';
        foodPanels[i][0].style.backgroundColor=bg[foodPanels[i][1].checked];
      }
    }
  }
  
prev = document.getElementById('S1');

var foods = document.getElementById('b16');
var panel = document.getElementById('b15');
  if(foods != null){
    var foffset = foods.clientOffset;
    var poffset = panel.clientOffset;
    var diff = poffset - foffset;
  }
  if(diff > 10){
    document.getElementById('s15').style.display = 'none';
    document.getElementById('s16').style.display = 'none';
  }
  else{
    document.getElementById('s15').style.display = 'block';
    document.getElementById('s16').style.display = 'block';
  }
   document.getElementById('S1').style.display = 'block';
   document.getElementById('s18').style.display = 'none';
   foodPanels[9000][1].checked = false;
   pck(9000);
  if(ratedCount < 31){document.getElementById('d005').style.display = 'none';}
  if(ratedCount < 16){document.getElementById('d004').style.display = 'none';}
console.log('panelCodes');
console.log(panelCodes);
console.log('Rated');
console.log(Rated);
console.log('foodPanels');
console.log(foodPanels);
console.log('c');
console.log(c);
console.log('d');
console.log(d);
}
EOT;
}
else if ($sub == 1){
echo <<<EOT
function ck(id){
  var d = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  d.style.backgroundColor=bg[c.checked];
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  var did = prev.getAttribute("id");
  did = 'b' + did.substr(1,3);
  document.getElementById(did).style.color='#0ff';;
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
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
      }
      if (idType == "s"){
        divs[div].style.display = 'none';
      }
    }
  }
  document.getElementById('s0').style.display = 'block';
  document.getElementById('s1').style.display = 'block';
  prev = document.getElementById('s1');
}
EOT;
}
else{
echo <<<EOT

function ck(id){
  d[id].style.backgroundColor=bg[c[id].checked];
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
function init(){return;}
EOT;
}
echo <<<EOT
window.onload = init;

document.getElementById('post').style.display = 'block';
//]]>
</script>
<pre>$show</pre>
$ratedCount
<div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;
?>
