<?php ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$client = intval($_COOKIE['amxc']);
setcookie("amxc", $client,time()+86400);
$patient = preg_replace("/\D/", "", $_POST['p']);
if($_GET['t'] = 1360){$client= 888887; $patient = 100005;}
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/><title>Food Exposure</title>
<meta name="viewport" content="width=640, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:400 1em Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0;background:#6cc; }
#page1{width:80%;margin-left:10%;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1.1em/1.2 Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1.25em/1 Arial,sans-serif;color:#f00;}

p{margin:0 0 1px 0;padding:0;font:400 1em/.9 Arial,sans-serif;}
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
.desc{width:16em;display:inline-block;font-weight:700;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}

h1{text-align:center;}
h2{margin:.2em;}
h3{margin:.8em .2em 0;}
h4{margin:0  0 .3em 0;padding-left:1em;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
button{width:7em;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:none;}
}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1.2em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go{width:100%;padding: .5em;margin:.5em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1.6em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: -o-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -moz-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -webkit-linear-gradient(bottom, #164 0%, #033 100%);
background-image: -ms-linear-gradient(bottom, #164 0%, #033 100%);
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
.go{border:1px solid #0f0;color: #fff;padding:.1em;
background-image: -o-linear-gradient(bottom, #3d5 0%, #370 100%);
background-image: -moz-linear-gradient(bottom, #3d5 0%, #370 100%);
background-image: -webkit-linear-gradient(bottom, #3d5 0%, #370 100%);
background-image: -ms-linear-gradient(bottom, #3d5 0%, #370 100%);
background-image: linear-gradient(to bottom, #3d5 0%, #370 100%);}
.btn{border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: -o-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -moz-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -ms-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.hide,#bs{background:#144;display:none;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk{font:700 1.2em Arial,sans-serif;color:#fff;width:48%;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.chk,.component{background:#2985EA;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;background:#144;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
#page{width:100%;padding:0;width:40em;margin:0 auto;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{background:#2985EA;width:48%;padding:0;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1.2em Arial,sans-serif;;}
.ige,.igg4{font:400 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 0 .3em 0;padding:.3em 0 0 0;background:#6cc;color:#000;}
.desc{width:12em;padding:0 .1em 0 .1em;}
.col{background:#144;width:40em;margin:0 auto;}
h3{color:#ff0;}
</style></head><body><div id="page"><div id="col">
<form action="fd.php" method="post"><div>
EOT;
ob_flush();
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510'); @mysqli_select_db($dbc,'amx_portal');
$checked = array();
/*
$desc = array();
$grp = array();
$sql= "SELECT `Code`,`Description`,`alpha` FROM `Foods` WHERE `Code` LIKE 'F%' ORDER BY `Code` ASC";
$results = mysqli_query($dbc,$sql);
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  $num = substr($row[0],1);
  $desc[$row[0]] = "$row[1]";
  $grp[$row[0]] = $row[2];
}

*/


$rank = unserialize(file_get_contents('/home/amx/public_html/rank.ser'));
foreach($_POST as $k => $v){
  if(substr($k,0,1) == 'F'){
    $checked["$v"] = 'checked="checked"';
    $showE[$k] = $rank[1][$k];
    $showG4[$k] = $rank[3][$k];
  }
}
$desc = $rank[0];
echo <<<EOT
<button class="link" type="button" onclick ="exp('s1')">Meat &amp; Eggs</button><div id="s1" class="hide">
<div id="d027" class="dchk"><input type="checkbox"  id="c027" class="chk" name="F027" value="027" onclick="ck('027')" $checked[027]/>&#x2002;Beef </div>
<div id="d083" class="dchk"><input type="checkbox"  id="c083" class="chk" name="F083" value="083" onclick="ck('083')" $checked[083]/>&#x2002;Chicken</div>
<div id="d106" class="dchk"><input type="checkbox"  id="c106" class="chk" name="F106" value="106" onclick="ck('106')" $checked[106]/>&#x2002;Duck </div>
<div id="d001" class="dchk"><input type="checkbox"  id="c001" class="chk" name="F001" value="001" onclick="ck('001')" $checked[001]/>&#x2002;Egg, White </div>
<div id="d245" class="dchk"><input type="checkbox"  id="c245" class="chk" name="F245" value="245" onclick="ck('245')" $checked[245]/>&#x2002;Egg, Whole </div>
<div id="d075" class="dchk"><input type="checkbox"  id="c075" class="chk" name="F075" value="075" onclick="ck('075')" $checked[075]/>&#x2002;Egg, Yolk </div>
<div id="d158" class="dchk"><input type="checkbox"  id="c158" class="chk" name="F158" value="158" onclick="ck('158')" $checked[158]/>&#x2002;Lamb </div>
<div id="d026" class="dchk"><input type="checkbox"  id="c026" class="chk" name="F026" value="026" onclick="ck('026')" $checked[026]/>&#x2002;Pork</div>
<div id="d284" class="dchk"><input type="checkbox"  id="c284" class="chk" name="F284" value="284" onclick="ck('284')" $checked[284]/>&#x2002;Turkey</div>

</div><button class="link" type="button" onclick ="exp('s2')">Dairy</button><div id="s2" class="hide">
<div id="d081" class="dchk"><input type="checkbox"  id="c081" class="chk" name="F081" value="081" onclick="ck('081')" $checked[081]/>&#x2002;Cheese, Cheddar </div>
<div id="d082" class="dchk"><input type="checkbox"  id="c082" class="chk" name="F082" value="082" onclick="ck('082')" $checked[082]/>&#x2002;Cheese, Mold </div>
<div id="d307" class="dchk"><input type="checkbox"  id="c307" class="chk" name="F307" value="307" onclick="ck('307')" $checked[307]/>&#x2002;Cheese, Processed Amer </div>
<div id="d117" class="dchk"><input type="checkbox"  id="c117" class="chk" name="F117" value="117" onclick="ck('117')" $checked[117]/>&#x2002;Cheese, Swiss    </div>
<div id="d002" class="dchk"><input type="checkbox"  id="c002" class="chk" name="F002" value="002" onclick="ck('002')" $checked[002]/>&#x2002;Milk, Cow's </div>
<div id="d236" class="dchk"><input type="checkbox"  id="c236" class="chk" name="F236" value="236" onclick="ck('236')" $checked[236]/>&#x2002;Milk, Cow's Whey</div>
<div id="d147" class="dchk"><input type="checkbox"  id="c147" class="chk" name="F147" value="147" onclick="ck('147')" $checked[147]/>&#x2002;Milk, Goat's</div>
<div id="d319" class="dchk"><input type="checkbox"  id="c319" class="chk" name="F319" value="319" onclick="ck('319')" $checked[319]/>&#x2002;Yogurt </div>

</div><button class="link" type="button" onclick ="exp('s3')">Fish</button><div id="s3" class="hide">
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

</div><button class="link" type="button" onclick ="exp('s4')">Fruit</button><div id="s4" class="hide">
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
<div id="d369" class="dchk"><input type="checkbox"  id="c369" class="chk" name="F369" value="369" onclick="ck('369')" $checked[369]/>&#x2002;Quinoa  </div>
<div id="d129" class="dchk"><input type="checkbox"  id="c129" class="chk" name="F129" value="129" onclick="ck('129')" $checked[129]/>&#x2002;Raspberry  </div>
<div id="d044" class="dchk"><input type="checkbox"  id="c044" class="chk" name="F044" value="044" onclick="ck('044')" $checked[044]/>&#x2002;Strawberry</div>
<div id="d155" class="dchk"><input type="checkbox"  id="c155" class="chk" name="F155" value="155" onclick="ck('155')" $checked[155]/>&#x2002;Tangerine </div>
<div id="d025" class="dchk"><input type="checkbox"  id="c025" class="chk" name="F025" value="025" onclick="ck('025')" $checked[025]/>&#x2002;Tomato </div>
<div id="d329" class="dchk"><input type="checkbox"  id="c329" class="chk" name="F329" value="329" onclick="ck('329')" $checked[329]/>&#x2002;Watermelon </div>

</div><button class="link" type="button" onclick ="exp('s5')">Bread, Cereal, Rice, &amp; Grains</button><div id="s5" class="hide">
<div id="d006" class="dchk"><input type="checkbox"  id="c006" class="chk" name="F006" value="006" onclick="ck('006')" $checked[006]/>&#x2002;Barley </div>
<div id="d304" class="dchk"><input type="checkbox"  id="c304" class="chk" name="F304" value="304" onclick="ck('304')" $checked[304]/>&#x2002;Bran, Wheat </div>
<div id="d102" class="dchk"><input type="checkbox"  id="c102" class="chk" name="F102" value="102" onclick="ck('102')" $checked[102]/>&#x2002;Buckwheat  </div>
<div id="d008" class="dchk"><input type="checkbox"  id="c008" class="chk" name="F008" value="008" onclick="ck('008')" $checked[008]/>&#x2002;Corn </div>
<div id="d125" class="dchk"><input type="checkbox"  id="c125" class="chk" name="F125" value="125" onclick="ck('125')" $checked[125]/>&#x2002;Hops  </div>
<div id="d090" class="dchk"><input type="checkbox"  id="c090" class="chk" name="F090" value="090" onclick="ck('090')" $checked[090]/>&#x2002;Malt</div>
<div id="d157" class="dchk"><input type="checkbox"  id="c157" class="chk" name="F157" value="157" onclick="ck('157')" $checked[157]/>&#x2002;Millet</div>
<div id="d007" class="dchk"><input type="checkbox"  id="c007" class="chk" name="F007" value="007" onclick="ck('007')" $checked[007]/>&#x2002;Oat </div>
<div id="d009" class="dchk"><input type="checkbox"  id="c009" class="chk" name="F009" value="009" onclick="ck('009')" $checked[009]/>&#x2002;Rice</div>
<div id="d005" class="dchk"><input type="checkbox"  id="c005" class="chk" name="F005" value="005" onclick="ck('005')" $checked[005]/>&#x2002;Rye </div>
<div id="d131" class="dchk"><input type="checkbox"  id="c131" class="chk" name="F131" value="131" onclick="ck('131')" $checked[131]/>&#x2002;Tapioca  </div>
<div id="d004" class="dchk"><input type="checkbox"  id="c004" class="chk" name="F004" value="004" onclick="ck('004')" $checked[004]/>&#x2002;Wheat </div>
<div id="d079" class="dchk"><input type="checkbox"  id="c079" class="chk" name="F079" value="079" onclick="ck('079')" $checked[079]/>&#x2002;Wheat, Gluten </div>

</div><button class="link" type="button" onclick ="exp('s6')">Yeast</button><div id="s6" class="hide">
<div id="d318" class="dchk"><input type="checkbox"  id="c318" class="chk" name="F318" value="318" onclick="ck('318')" $checked[318]/>&#x2002;Yeast, Bakers  </div>
<div id="d045" class="dchk"><input type="checkbox"  id="c045" class="chk" name="F045" value="045" onclick="ck('045')" $checked[045]/>&#x2002;Yeast, Brewers</div>

</div><button class="link" type="button" onclick ="exp('s7')">Peas, Beans, &amp; Legumes</button><div id="s7" class="hide">
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

</div><button class="link" type="button" onclick ="exp('s8')">Seeds &amp; Spices</button><div id="s8" class="hide">
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

</div><button class="link" type="button" onclick ="exp('s9')">Shellfish</button><div id="s9" class="hide">
<div id="d207" class="dchk"><input type="checkbox"  id="c207" class="chk" name="F207" value="207" onclick="ck('207')" $checked[207]/>&#x2002;Clam</div>
<div id="d310" class="dchk"><input type="checkbox"  id="c310" class="chk" name="F310" value="310" onclick="ck('310')" $checked[310]/>&#x2002;Crab, Blue </div>
<div id="d339" class="dchk"><input type="checkbox"  id="c339" class="chk" name="F339" value="339" onclick="ck('339')" $checked[339]/>&#x2002;Crab, Alaskan </div>
<div id="d354" class="dchk"><input type="checkbox"  id="c354" class="chk" name="F354" value="354" onclick="ck('354')" $checked[354]/>&#x2002;Crab,Dungeness </div>
<div id="d080" class="dchk"><input type="checkbox"  id="c080" class="chk" name="F080" value="080" onclick="ck('080')" $checked[080]/>&#x2002;Lobster, Maine</div>
<div id="d136" class="dchk"><input type="checkbox"  id="c136" class="chk" name="F136" value="136" onclick="ck('136')" $checked[136]/>&#x2002;Lobster, Spiny </div>
<div id="d290" class="dchk"><input type="checkbox"  id="c290" class="chk" name="F290" value="290" onclick="ck('290')" $checked[290]/>&#x2002;Oyster </div>
<div id="d338" class="dchk"><input type="checkbox"  id="c338" class="chk" name="F338" value="338" onclick="ck('338')" $checked[338]/>&#x2002;Scallop</div>
<div id="d024" class="dchk"><input type="checkbox"  id="c024" class="chk" name="F024" value="024" onclick="ck('024')" $checked[024]/>&#x2002;Shrimp</div>

</div><button class="link" type="button" onclick ="exp('s10')">Sugar</button><div id="s10" class="hide">
<div id="d247" class="dchk"><input type="checkbox"  id="c247" class="chk" name="F247" value="247" onclick="ck('247')" $checked[247]/>&#x2002;Honey </div>
<div id="d350" class="dchk"><input type="checkbox"  id="c350" class="chk" name="F350" value="350" onclick="ck('350')" $checked[350]/>&#x2002;Sugar, Cane</div>

</div><button class="link" type="button" onclick ="exp('s11')"> Nuts</button><div id="s11" class="hide">
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

</div><button class="link" type="button" onclick ="exp('s12')">Vegatables</button><div id="s12" class="hide">
<div id="d122" class="dchk"><input type="checkbox"  id="c122" class="chk" name="F122" value="122" onclick="ck('122')" $checked[122]/>&#x2002;Artichoke   </div>
<div id="d135" class="dchk"><input type="checkbox"  id="c135" class="chk" name="F135" value="135" onclick="ck('135')" $checked[135]/>&#x2002;Asparagus</div>
<div id="d096" class="dchk"><input type="checkbox"  id="c096" class="chk" name="F096" value="096" onclick="ck('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="d152" class="dchk"><input type="checkbox"  id="c152" class="chk" name="F152" value="152" onclick="ck('152')" $checked[152]/>&#x2002;Beet </div>
<div id="d145" class="dchk"><input type="checkbox"  id="c145" class="chk" name="F145" value="145" onclick="ck('145')" $checked[145]/>&#x2002;Beet, Sugar</div>
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

</div><button class="link" type="button" onclick ="exp('s13')">Food Components</button><div id="s13" class="hide">
<div id="d078" class="dchk"><input type="checkbox"  id="c078" class="chk" name="F078" value="078" onclick="ck('078')" $checked[078]/>&#x2002;Casein</div>
<div id="d109" class="dchk"><input type="checkbox"  id="c109" class="chk" name="F109" value="109" onclick="ck('109')" $checked[109]/>&#x2002;Gum, Acacia </div>
<div id="d110" class="dchk"><input type="checkbox"  id="c110" class="chk" name="F110" value="110" onclick="ck('110')" $checked[110]/>&#x2002;Gum, Karaya  </div>
<div id="d076" class="dchk"><input type="checkbox"  id="c076" class="chk" name="F076" value="076" onclick="ck('076')" $checked[076]/>&#x2002;Lactalbumin, Alpha </div>
<div id="d077" class="dchk"><input type="checkbox"  id="c077" class="chk" name="F077" value="077" onclick="ck('077')" $checked[077]/>&#x2002;Lactoglobulin, Beta </div>
</div>
<input type="submit" value="Submit" class="btn" /></div></form>
</div>
EOT;
ob_flush();
$checkbox = array();
$checkbox[1] = 'mother';
$checkbox[2] = 'father';
$checkbox[3] = 'brother';
$checkbox[4] = 'sister';
$checkbox[5] = 'grandparent';
$checkbox[6] = 'grandparent';
$checkbox[7] = 'chest tightness';
$checkbox[13] = 'eczema';
$checkbox[20] = 'bloating';
$checkbox[8] = 'coughing';
$checkbox[14] = 'flushing';
$checkbox[21] = 'colic';
$checkbox[9] = 'frequent infections';
$checkbox[15] = 'hives';
$checkbox[22] = 'cramps';
$checkbox[10] = 'shortness of  breath';
$checkbox[16] = 'inching';
$checkbox[23] = 'diarrhea';
$checkbox[11] = 'swelling of throat';
$checkbox[17] = 'rashes';
$checkbox[24] = 'nausea';
$checkbox[12] = 'wheezing';
$checkbox[18] = 'red bumps';
$checkbox[25] = 'vomiting';
$checkbox[19] = 'swelling of lips';
$checkbox[26] = 'headaches';
$checkbox[34] = 'ear infections';
$checkbox[41] = 'anaphylaxis';
$checkbox[27] = 'itchy, red, watery eyes';
$checkbox[35] = 'ear pain';
$checkbox[42] = 'cannot sleep';
$checkbox[28] = 'loss of smell';
$checkbox[36] = 'hearing loss';
$checkbox[43] = 'loss of consciousness';
$checkbox[29] = 'nasal congestion';
$checkbox[37] = 'itchy ears';
$checkbox[44] = 'low blood pressure';
$checkbox[30] = 'nasal pain';
$checkbox[38] = 'sinus infection';
$checkbox[31] = 'runny nose';
$checkbox[39] = 'sinus pressure';
$checkbox[32] = 'sinus pressure or pain';
$checkbox[40] = 'vertigo';
$checkbox[33] = 'sneezing';
$checkbox[45] = 'in morning';
$checkbox[50] = 'inside house';
$checkbox[55] = 'at bedtime';
$checkbox[60] = 'outside during morning';
$checkbox[46] = 'in afternoon';
$checkbox[51] = 'when cleaning';
$checkbox[56] = 'windy days';
$checkbox[61] = 'outside during night';
$checkbox[47] = 'in evening';
$checkbox[52] = 'after eating';
$checkbox[57] = 'warm days';
$checkbox[62] = 'during yard work';
$checkbox[48] = 'at work';
$checkbox[53] = 'in basement';
$checkbox[58] = 'cold days';
$checkbox[63] = 'near animals';
$checkbox[49] = 'at school';
$checkbox[54] = 'in bedroom';
$checkbox[59] = 'on clear days';
$checkbox[64] = 'near farms/barns';
$checkbox[65] = 'January';
$checkbox[68] = 'April';
$checkbox[71] = 'July';
$checkbox[74] = 'October';
$checkbox[66] = 'February';
$checkbox[69] = 'May';
$checkbox[72] = 'August';
$checkbox[75] = 'November';
$checkbox[67] = 'March';
$checkbox[70] = 'June';
$checkbox[73] = 'September';
$checkbox[76] = 'December';
$checkbox[77] = 'dog';
$checkbox[78] = 'cat';
$checkbox[79] = 'bird';
$checkbox[80] = 'horse';
$checkbox[81] = 'hamster';
$checkbox[82] = 'rabbit';
$checkbox[83] = 'goat';
$checkbox[84] = 'pig';
$checkbox[85] = 'chicken';
$checkbox[86] = 'sheep';
$checkbox[87] = 'guinea pig';
$checkbox[88] = 'duck';
$checkbox[89] = 'goose';
$checkbox[90] = 'parakeet';
$checkbox[91] = 'parrot';
$checkbox[91] = 'pigeon';
asort($showE);
asort($showG4);
$show = var_export($rank,true);
$show .= var_export($showE,true);
$show .= var_export($showG4,true);
reset($showE);
reset($showG4);
$ndx = 0;
$cnt = count($showE);
echo '<button class="link" type="button" onclick ="exp(\'s14\')">Summary</button><div id="s14" class="hide"><h3>Foods to Consider</h3>';
while($ndx < $cnt){
  $e  = current($showE);
  $g4 = current($showG4);
  $ndx++;
  $ke = key($showE);
  $kg4 = key($showG4);
 // echo "<p>$ke=>$e | $kg4=>$g4</p> ";
 $num = substr($ke,1);
 $idde = "d$num" . '1';
 $iddg4 = "d$num" . '3';
 $idce = "c$num" . '1';
 $idcg4 = "c$num" . '3';
 $ce = $num . '1';
 $cg4 = $num . '3';
  echo <<<EOT
<div id="$idde" class="fchk"><input type="checkbox"  id="$idce" class="chk" name="$ke" value="$ke" onclick="ck('$ce')" /><div class="desc">&#x2002;$desc[$ke]</div><div class="ige">$e</div></div>&#x2003;  
<div id="$iddg4" class="fchk"><input type="checkbox"  id="$idcg4" class="chk" name="$kg4" value="$kg4" onclick="ck('$cg4')" /><div class="desc">&#x2002;$desc[$kg4]</div><div class="igg4">$g4</div></div> <br/> 
EOT;
  next($showE);
  next($showG4);

}
$rankE = $rank[1];
$rankG4 = $rank[3];

$ndx = 0;
foreach($rankE as $k => $v){
  if(array_key_exists($v,$showE)){continue;}
  $ndx++;
//  echo "<p>$k $desc[$k]</p>";
  $topE[] = $k;
  if($ndx > 9){break;}
}
echo '<hr/><h3>Next Top 10</h3>';
$ndx = 0;
foreach($rankG4 as $k => $v){
  if(in_array($v,$showG4)){continue;}
  $ndx++;
  $topG4[] = $k;

//  echo "<p>$k $desc[$k]</p>";
  if($ndx > 9){break;}
}
foreach($topE as $k => $v){
 $num = substr($v,1);
 $idde = "d$num" . '1';
 $idce = "c$num" . '1';
 $ce = $num . '1';
 $e = $rank[1][$v];
 $kg4 = $topG4[$k];
 $num = substr($g4,1);
 $idcg4 = "c$num" . '3';
 $iddg4 = "d$num" . '3';
 $cg4 = $num . '3';
 $g4 = $rank[3][$kg4];

  echo <<<EOT
<div id="$idde" class="fchk"><input type="checkbox"  id="$idce" class="chk" name="$ke" value="$ke" onclick="ck('$ce')" /><div class="desc">&#x2002;$desc[$v]</div><div class="ige">$e</div></div>&#x2003;  
<div id="$iddg4" class="fchk"><input type="checkbox"  id="$idcg4" class="chk" name="$kg4" value="$kg4" onclick="ck('$cg4')" /><div class="desc">&#x2002;$desc[$kg4]</div><div class="igg4">$g4</div></div> <br/> 
EOT;

}






$show = '';

/*

//$cat = array('','Fruit','Grain','Vegetables','Tree Nuts','Spices/Seeds','Meats / Dairy','Fish &#x26; Shellfish','Drinks');

//$sql = "SELECT `Patient` FROM `Patient` WHERE `Client` = 200220";
//$results = mysqli_query($dbc,$sql);
//while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
//  $p[] = $row[0];
//}
// accession   1/2013 146997 1/2014 155389 1/2105 163401

//foreach($p as $patient){
//  $sql = "SELECT `Code`,`Type` FROM `Test` WHERE `Patient`=$patient AND `Code` LIKE 'F%' AND `Score` NOT LIKE '0' GROUP BY `Code`,`Type`";
  //$sql = "SELECT `Code`,`Type`,`Patient` FROM `Test` WHERE`Code` LIKE 'F%' AND `Score` NOT LIKE '%0%'  AND `Patient` > 146997 AND `Patient` < 155389";
  $sql = "SELECT `Code`,`Type`,`Score` FROM `Test` WHERE `Code` LIKE 'F%' AND `Patient` > 155389 AND `Patient` < 163401";
  $results = mysqli_query($dbc,$sql);
  if (mysqli_errno($dbc) > 0){echo "<p>$sql<br/>" . mysql_error();}
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
    $food[$row[1]][$row[0]][$row[2]] = intval($food[$row[1]][$row[0]][$row[2]]) + 1;
  }

$ige = $food[1];
foreach($ige as $k => $v){
  $poz = $v[1] + $v[2] + $v[3] + $v[4] + $v[5]  + $v[6] ;
  $all = $poz + $v[0] + $v['0/1'];
  $topE[$k] = intval($poz/$all*10000);
}
arsort($topE);
$ndx = 0;
foreach($topE as $k => $v){
  
  if($desc[$k] == NULL){continue;}
  $ndx++;
  echo "<p>$ndx $k $v $desc[$k]</p>";
  $rankE[$k] = $ndx;
}
$show = '';
$igg4 = $food[3];
foreach($igg4 as $k => $v){
  $poz = $v[1] + $v[2] + $v[3] + $v[4] + $v[5]  + $v[6] ;
  $all = $poz + $v[0] + $v['0/1'];
  $topG4[$k] = intval($poz/$all*10000);
}
arsort($topG4);
$ndx = 0;
foreach($topG4 as $k => $v){
  if($desc[$k] == NULL){continue;}
  $ndx++;
  echo "<p>$ndx $k $v $desc[$k]</p>";
  $rankG4[$k] = $ndx;
}
$show .= var_export($topE,true);
$show .= var_export($rankE,true);
$show .= var_export($topG4,true);
$show .= var_export($rankG4,true);




$igE = $food[0][1];
arsort($igE);

$ecount = count($patients[1]);
$g4count = count($patients[3]);
foreach($igE as $code => $cnt){
  $topE[] = array($code,$cnt,$desc[$code]);
}
foreach($topE as $k => $v){
  if($v[2] == NULL){continue;}
  $rankE[$v[0]] = array($k+1,$v[1],$v[2]);
}
$igG4 = $food[0][3];
arsort($igG4);
foreach($igG4 as $code => $cnt){
  $topG4[] = array($code,$cnt,$desc[$code]);
}
foreach($topG4 as $k => $v){
  if($v[2] == NULL){continue;}
  $rankG4[$v[0]] = array($k+1,$v[1],$v[2]);
}
$class= array();
$class[NULL] = 'class="reg"';
$class[1] = 'class="hit"';

$grp = 99;
$saveGrp = 88;

//$rankE = unserialize(file_get_contents('/home/amx/public_html/IgE.ser'));
//$rankG4 = unserialize(file_get_contents('/home/amx/public_html/IgG4.ser'));
foreach ($showGrp as $key => $val){
//  echo "<div class=\"grp\"><h4>$cat[$key]</h4>";
  echo "<h4>$cat[$key]</h4>";
  foreach ($val as $k => $v){
    $IgE = $rankE[$k][0];
    $IgG4 = $rankG4[$k][0];
	echo "<p>$k $v</p>";

    echo <<<EOT
<div id="$k" class="fchk"><input type="checkbox"  id="$k" class="chk" name="$k" value="$k" onclick="ck('$k')" [370]/><div class="igg4">$IgG4</div><input type="checkbox"  id="$k" class="chk" name="$k" value="$k" onclick="ck('$k')" [370]/><div class="ige">$IgE</div><div class="desc">$v</div></div><br>
EOT;

  }
  echo '</div>';
}

$rank[0] = $desc;
$rank[1] = $rankE;
$rank[3] = $rankG4;
$fp = fopen("/home/amx/public_html/rank.ser",'w');
fwrite($fp,serialize($rank));
fclose($fp);
*/
$show .= number_format(microtime(true) - $startTime,6);
echo <<<EOT
<pre>$show</pre></div></div><div id="s888"></div>

<script type="text/javascript"> //<![CDATA[
var div=0;
var disp = '';
var prev = document.getElementById('s888');
var flip = new Array();
flip[''] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
function exp(id){ 
  div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
var c = new Array;
var d = new Array;
toggle = new Array;
toggle[true] = 'checked="checked"';
toggle[false] = '';
bg = new Array;
bg[true] = '#f00';
bg[false] = '#2985EA';
var show = '';
function cb(id){
  div = document.getElementById(id)
  div.style.backgroundColor=bg[div.checked];
}
function ck(id){
  d[id].style.backgroundColor=bg[c[id].checked];
}
function init(){
var checked,did;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      if (did.substring(0,1) == "d"){
        var i = did.substring(1,5);
		c[i] = document.getElementById('c' + i);
		d[i] = document.getElementById('d' + i);
		checked = c[i].checked;
		d[i].style.backgroundColor=bg[checked];
		show = show + i + ',';
      }
    }
  }
  console.log(show);
}

window.onload = init;

//]]>
</script>

<div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;
$ndx = 2;
$fp = fopen('history.sql','w');
while($ndx < 92){
$ndx++;
  $data = "`chk$ndx` int($ndx) NOT NULL,\n";
  fwrite($fp,$data);

}
fclose($fp);

?>
</body></html>