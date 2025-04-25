<?php ob_start();
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html><head><title>Food Selections</title><style>
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;color:#000;padding:0;background:#fff; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#fff;}
pre{color:#ff0;}
#end,#s888{float:none;color:#fff;}
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
input[type="submit"]{padding:.5em;}
input[type="text"]{font:700 1em Arial,sans-serif;}
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:center;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:block;}
}
.emp{font:700 1em Arial,sans-serif;}
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
table{padding:0;margin:0;width:640px}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go{width:100%;padding:0.5em;margin:.3em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#fff;background: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.go {
color : #fff;
background : rgb(170, 198, 147);
background : linear-gradient(to bottom, rgb(101, 152, 59, 1) 0%, rgb(45, 72, 31) 100%);
} 
.select{ background: rgb(119,119,167);background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);}
.expand,#bs{width:640px;display:block;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;background:#fff;}
#post{width:640px;margin:0 auto;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}

.dchk{background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
.dchk{width:100%;font:700 1em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}

.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.pchk{text-align:left;width:98%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pnumber{width:3em;display:inline-block;}
.panel{width:18em;padding:.3em .1em .25em .1em;display:inline-block;font-weight:700;}



.col{width:640px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 1em Arial,sans-serif;margin:5px 0 5px 35px;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:4em;height:1.5em;display:inline-block;margin:0;padding:.3em 0 0 0;}
.legend{padding-left:20.4em;}
.row{padding:0;margin:0;}
.ige,.pige,.IgE,.descE{background:#ff0;color:#000;font-weight:700;}
.igg4,.pigg4,.IgG4,.descG4{background:#0ff;color:#000;font-weight:700;}



.both{background:#fA4;color:#000;}
.both,.IgE,.IgG4{display:inline-block;font-weight:700;margin:0;border:1px solid #fff;padding:.2em 0 0 .4em;text-align:left;width:70%;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:1.5em;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:1.7em;height:1.5em;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.total{background:#00f;color:#fff;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
#patient{width:15em;margin:0 auto;}

.ige{display:inline-block;width: 19.3em;margin: 5px 0 3px 0;font-size: .9em;  padding: 9.5px 0 9.5px 0;background:#ff0;text-align:center;}
.igg{display:inline-block;width:19.3em;margin: 5px 1em 3px .85em;font-size: .9em;  padding: 9.5px 0 9.5px 0;; background:#0ff;text-align:center;}
display: inline-block;





.fchk{cursor:pointer;position:relative;text-align:left;background:#2985EA;padding:0;margin:2px;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.echk{cursor:pointer;position:relative;text-align:left;background-color:#ff0;background:#ff0;   padding:0;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#0ff;   padding:0;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;outline:2px solid #000;margin:0;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:1.77em;height:1.77em;border:1px solid #eee;outline:2px solid #eee;display: inline-block;margin:1px;margin:5px 0 5px 5px;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
.descE,.descG4{font-size:.9em;width:17em;display:inline-block;font-weight:700;padding: 4.7px 0 6.3px 0;margin: 5px 5px 5px 0;}

.titlebutton,.typebutton,.select,.valuebutton,.valuebutton{margin:3px 0 0 .2em;border:0;color:#fff;font:700 1em Arial;height:2em;background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);padding:0;display:inline-block;}

.titlebutton,.typebutton,.select,.valuebutton,.blueLG{background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);} 
redLG{background: linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%);} 

.typehead,.typebutton,.typebuttonx{width:50px;;font:700 1em Arial;}
.titlehead,.titlebuttonx,.titlebutton{width:250px;font:700 1em Arial;}
.titlehead,.typehead{color:#000;background:#fff;border:0;}
.select{width:9.2em;}
.titlebuttonx,.typebuttonx{background:#fff;border:0;}




#pnum{width:4em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#fff;}
#pname{width:18em;border:0;margin:0;text-align:left;font:700 1em Arial;background-color:#fff;}
#pigE{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#ff0;}
#pigG4{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#0ff;}
#dob{background:#f00;color:#fff;}
#b1000,#b1001,#b1002,#b1003,#b1004{display:none;}
.alert{background:#f00;color:#fff;}
</style></head><body><div id="page"><div id="sub: 32"></div><div id="col"><form action="#" method="post"><div id="post"><div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="msg">

<button id="b0" class="link" type="button" onclick ="exp('0')">Patient Instructions:</button><div id="s0">
<p class="bold center red" style="font-size:.9em;padding:5px;">You must click the "Next" button to post to your physician after making your selections</p>
<p>	&bull; Click Food Category to expand / contract.</p>
<p>	&bull; Check off the foods you currently eat <span class="bold">at least three times per week.</span></p>
<p>	&bull; Complete all Categories</p>
<p>	&bull; When finished, select the "Next" button.</p></div>
<p class="bold center red" style="font-size:1.2em;"><br>Check ONLY foods you eat AT LEAST THREE TIMES per week.</p>
<button id="b1" class="link" type="button" onclick ="exp('1')">Meat &amp; Eggs</button>
<div id="s1" class="columns2">

<div id="d027" class="dchk"><input type="checkbox"  id="c027" class="chk" name="F027" value="027" onclick="ck('027')" />&#x2002;Beef </div>
<div id="d083" class="dchk"><input type="checkbox"  id="c083" class="chk" name="F083" value="083" onclick="ck('083')" />&#x2002;Chicken</div>
<div id="d106" class="dchk"><input type="checkbox"  id="c106" class="chk" name="F106" value="106" onclick="ck('106')" />&#x2002;Duck </div>
<div id="d001" class="dchk"><input type="checkbox"  id="c001" class="chk" name="F001" value="001" onclick="ck('001')" />&#x2002;Egg, White </div>
<div id="d245" class="dchk"><input type="checkbox"  id="c245" class="chk" name="F245" value="245" onclick="ck('245')" />&#x2002;Egg, Whole </div>
<div id="d075" class="dchk"><input type="checkbox"  id="c075" class="chk" name="F075" value="075" onclick="ck('075')" />&#x2002;Egg, Yolk </div>
<div id="d158" class="dchk"><input type="checkbox"  id="c158" class="chk" name="F158" value="158" onclick="ck('158')" />&#x2002;Lamb </div>
<div id="d026" class="dchk"><input type="checkbox"  id="c026" class="chk" name="F026" value="026" onclick="ck('026')" />&#x2002;Pork</div>
<div id="d416" class="dchk"><input type="checkbox"  id="c416" class="chk" name="F416" value="416" onclick="ck('416')" />&#x2002;Rabbit</div>
<div id="d284" class="dchk"><input type="checkbox"  id="c284" class="chk" name="F284" value="284" onclick="ck('284')" />&#x2002;Turkey</div>
<div id="d410" class="dchk"><input type="checkbox"  id="c410" class="chk" name="F410" value="410" onclick="ck('410')" />&#x2002;Venison</div>

</div><button id="b2" class="link" type="button" onclick ="exp('2')">Dairy</button><div id="s2" class="columns2">
<div id="d307" class="dchk"><input type="checkbox"  id="c307" class="chk" name="F307" value="307" onclick="ck('307')" />&#x2002;Cheese, American</div>
<div id="d376" class="dchk"><input type="checkbox"  id="c376" class="chk" name="F376" value="376" onclick="ck('376')" />&#x2002;Butter</div>
<div id="d081" class="dchk"><input type="checkbox"  id="c081" class="chk" name="F081" value="081" onclick="ck('081')" />&#x2002;Cheese, Cheddar </div>
<div id="d411" class="dchk"><input type="checkbox"  id="c411" class="chk" name="F411" value="411" onclick="ck('411')" />&#x2002;Cheese, Goat's </div>
<div id="d379" class="dchk"><input type="checkbox"  id="c379" class="chk" name="F379" value="379" onclick="ck('379')" />&#x2002;Cheese, Gouda </div>
<div id="d082" class="dchk"><input type="checkbox"  id="c082" class="chk" name="F082" value="082" onclick="ck('082')" />&#x2002;Cheese, Mold </div>
<div id="d380" class="dchk"><input type="checkbox"  id="c380" class="chk" name="F380" value="380" onclick="ck('380')" />&#x2002;Cheese, Parmesan</div>
<div id="d117" class="dchk"><input type="checkbox"  id="c117" class="chk" name="F117" value="117" onclick="ck('117')" />&#x2002;Cheese, Swiss </div>
<div id="d002" class="dchk"><input type="checkbox"  id="c002" class="chk" name="F002" value="002" onclick="ck('002')" />&#x2002;Milk, Cow's </div>
<div id="d236" class="dchk"><input type="checkbox"  id="c236" class="chk" name="F236" value="236" onclick="ck('236')" />&#x2002;Milk, Cow's Whey</div>
<div id="d147" class="dchk"><input type="checkbox"  id="c147" class="chk" name="F147" value="147" onclick="ck('147')" />&#x2002;Milk, Goat's</div>
<div id="d319" class="dchk"><input type="checkbox"  id="c319" class="chk" name="F319" value="319" onclick="ck('319')" />&#x2002;Yogurt </div>

</div><button id="b3" class="link" type="button" onclick ="exp('3')">Fish</button><div id="s3" class="columns2">
<div id="d032" class="dchk"><input type="checkbox"  id="c032" class="chk" name="F032" value="032" onclick="ck('032')" />&#x2002;Anchovy</div>
<div id="d101" class="dchk"><input type="checkbox"  id="c101" class="chk" name="F101" value="101" onclick="ck('101')" />&#x2002;Bass, Black</div>
<div id="d306" class="dchk"><input type="checkbox"  id="c306" class="chk" name="F306" value="306" onclick="ck('306')" />&#x2002;Catfish</div>
<div id="d378" class="dchk"><input type="checkbox"  id="c378" class="chk" name="F378" value="378" onclick="ck('378')" />&#x2002;Carp</div>
<div id="d003" class="dchk"><input type="checkbox"  id="c003" class="chk" name="F003" value="003" onclick="ck('003')" />&#x2002;Cod</div>
<div id="d107" class="dchk"><input type="checkbox"  id="c107" class="chk" name="F107" value="107" onclick="ck('107')" />&#x2002;Eel</div>
<div id="d311" class="dchk"><input type="checkbox"  id="c311" class="chk" name="F311" value="311" onclick="ck('311')" />&#x2002;Flounder</div>
<div id="d312" class="dchk"><input type="checkbox"  id="c312" class="chk" name="F312" value="312" onclick="ck('312')" />&#x2002;Haddock</div>
<div id="d119" class="dchk"><input type="checkbox"  id="c119" class="chk" name="F119" value="119" onclick="ck('119')" />&#x2002;Halibut</div>
<div id="d111" class="dchk"><input type="checkbox"  id="c111" class="chk" name="F111" value="111" onclick="ck('111')" />&#x2002;Mackerel</div>
<div id="d394" class="dchk"><input type="checkbox"  id="c394" class="chk" name="F394" value="394" onclick="ck('394')" />&#x2002;Octopus</div>
<div id="d120" class="dchk"><input type="checkbox"  id="c120" class="chk" name="F120" value="120" onclick="ck('120')" />&#x2002;Perch, Lake</div>
<div id="d396" class="dchk"><input type="checkbox"  id="c396" class="chk" name="F396" value="396" onclick="ck('396')" />&#x2002;Pike</div>
<div id="d041" class="dchk"><input type="checkbox"  id="c041" class="chk" name="F041" value="041" onclick="ck('041')" />&#x2002;Salmon, Atlantic</div>
<div id="d353" class="dchk"><input type="checkbox"  id="c353" class="chk" name="F353" value="353" onclick="ck('353')" />&#x2002;Salmon, Pacific</div>
<div id="d123" class="dchk"><input type="checkbox"  id="c123" class="chk" name="F123" value="123" onclick="ck('123')" />&#x2002;Snapper, Red</div>
<div id="d398" class="dchk"><input type="checkbox"  id="c398" class="chk" name="F398" value="398" onclick="ck('398')" />&#x2002;Sardine</div>
<div id="d337" class="dchk"><input type="checkbox"  id="c337" class="chk" name="F337" value="337" onclick="ck('337')" />&#x2002;Sole</div>
<div id="d116" class="dchk"><input type="checkbox"  id="c116" class="chk" name="F116" value="116" onclick="ck('116')" />&#x2002;Squid </div>
<div id="d118" class="dchk"><input type="checkbox"  id="c118" class="chk" name="F118" value="118" onclick="ck('118')" />&#x2002;Swordfish</div>
<div id="d361" class="dchk"><input type="checkbox"  id="c361" class="chk" name="F361" value="361" onclick="ck('361')" />&#x2002;Tilapia</div>
<div id="d204" class="dchk"><input type="checkbox"  id="c204" class="chk" name="F204" value="204" onclick="ck('204')" />&#x2002;Trout</div>
<div id="d040" class="dchk"><input type="checkbox"  id="c040" class="chk" name="F040" value="040" onclick="ck('040')" />&#x2002;Tuna</div>
<div id="d121" class="dchk"><input type="checkbox"  id="c121" class="chk" name="F121" value="121" onclick="ck('121')" />&#x2002;Whitefish</div>

</div><button id="b4" class="link" type="button" onclick ="exp('4')">Fruit</button><div id="s4" class="columns2">
<div id="d049" class="dchk"><input type="checkbox"  id="c049" class="chk" name="F049" value="049" onclick="ck('049')" />&#x2002;Apple </div>
<div id="d138" class="dchk"><input type="checkbox"  id="c138" class="chk" name="F138" value="138" onclick="ck('138')" />&#x2002;Apricot</div>
<div id="f096" class="dchk"><input type="checkbox"  id="cf096" class="chk" name="F096" value="096" onclick="ckf('096')" />&#x2002;Avocado</div>
<div id="d092" class="dchk"><input type="checkbox"  id="c092" class="chk" name="F092" value="092" onclick="ck('092')" />&#x2002;Banana </div>
<div id="d139" class="dchk"><input type="checkbox"  id="c139" class="chk" name="F139" value="139" onclick="ck('139')" />&#x2002;Blackberry</div>
<div id="d288" class="dchk"><input type="checkbox"  id="c288" class="chk" name="F288" value="288" onclick="ck('288')" />&#x2002;Blueberry </div>
<div id="d305" class="dchk"><input type="checkbox"  id="c305" class="chk" name="F305" value="305" onclick="ck('305')" />&#x2002;Cantaloupe  </div>
<div id="d100" class="dchk"><input type="checkbox"  id="c100" class="chk" name="F100" value="100" onclick="ck('100')" />&#x2002;Cherry, Bing</div>
<div id="d104" class="dchk"><input type="checkbox"  id="c104" class="chk" name="F104" value="104" onclick="ck('104')" />&#x2002;Cranberry  </div>
<div id="d105" class="dchk"><input type="checkbox"  id="c105" class="chk" name="F105" value="105" onclick="ck('105')" />&#x2002;Date </div>
<div id="d259" class="dchk"><input type="checkbox"  id="c259" class="chk" name="F259" value="259" onclick="ck('259')" />&#x2002;Grape/Raisin </div>
<div id="d209" class="dchk"><input type="checkbox"  id="c209" class="chk" name="F209" value="209" onclick="ck('209')" />&#x2002;Grapefruit </div>
<div id="d087" class="dchk"><input type="checkbox"  id="c087" class="chk" name="F087" value="087" onclick="ck('087')" />&#x2002;Honeydew </div>
<div id="d153" class="dchk"><input type="checkbox"  id="c153" class="chk" name="F153" value="153" onclick="ck('153')" />&#x2002;Kiwi </div>
<div id="d208" class="dchk"><input type="checkbox"  id="c208" class="chk" name="F208" value="208" onclick="ck('208')" />&#x2002;Lemon </div>
<div id="d134" class="dchk"><input type="checkbox"  id="c134" class="chk" name="F134" value="134" onclick="ck('134')" />&#x2002;Lime </div>
<div id="d351" class="dchk"><input type="checkbox"  id="c351" class="chk" name="F351" value="351" onclick="ck('351')" />&#x2002;Mango</div>
<div id="d132" class="dchk"><input type="checkbox"  id="c132" class="chk" name="F132" value="132" onclick="ck('132')" />&#x2002;Nectarine</div>
<div id="f124" class="dchk"><input type="checkbox"  id="cf124" class="chk" name="F124" value="124" onclick="ckf('124')" />&#x2002;Olive, Black </div>
<div id="f342" class="dchk"><input type="checkbox"  id="cf342" class="chk" name="F342" value="342" onclick="ckf('342')" />&#x2002;Olive, Green</div>
<div id="d033" class="dchk"><input type="checkbox"  id="c033" class="chk" name="F033" value="033" onclick="ck('033')" />&#x2002;Orange </div>
<div id="d127" class="dchk"><input type="checkbox"  id="c127" class="chk" name="F127" value="127" onclick="ck('127')" />&#x2002;Papaya </div>
<div id="d095" class="dchk"><input type="checkbox"  id="c095" class="chk" name="F095" value="095" onclick="ck('095')" />&#x2002;Peach</div>
<div id="d094" class="dchk"><input type="checkbox"  id="c094" class="chk" name="F094" value="094" onclick="ck('094')" />&#x2002;Pear </div>
<div id="d210" class="dchk"><input type="checkbox"  id="c210" class="chk" name="F210" value="210" onclick="ck('210')" />&#x2002;Pineapple </div>
<div id="d128" class="dchk"><input type="checkbox"  id="c128" class="chk" name="F128" value="128" onclick="ck('128')" />&#x2002;Plum/Prune  </div>
<div id="d021" class="dchk"><input type="checkbox"  id="c021" class="chk" name="F021" value="021" onclick="ck('021')" />&#x2002;Pomegranate  </div>
<div id="d129" class="dchk"><input type="checkbox"  id="c129" class="chk" name="F129" value="129" onclick="ck('129')" />&#x2002;Raspberry  </div>
<div id="d044" class="dchk"><input type="checkbox"  id="c044" class="chk" name="F044" value="044" onclick="ck('044')" />&#x2002;Strawberry</div>
<div id="d155" class="dchk"><input type="checkbox"  id="c155" class="chk" name="F155" value="155" onclick="ck('155')" />&#x2002;Tangerine </div>
<div id="f025" class="dchk"><input type="checkbox"  id="cf025" class="chk" name="F025" value="025" onclick="ckf('025')" />&#x2002;Tomato </div>
<div id="d404" class="dchk"><input type="checkbox"  id="c404" class="chk" name="F404" value="404" onclick="ck('404')" />&#x2002;Vinegar, Wine </div>
<div id="d329" class="dchk"><input type="checkbox"  id="c329" class="chk" name="F329" value="329" onclick="ck('329')" />&#x2002;Watermelon </div>
<div id="d406" class="dchk"><input type="checkbox"  id="c406" class="chk" name="F406" value="406" onclick="ck('406'\)" />&#x2002;Wine, Red </div>
<div id="d407" class="dchk"><input type="checkbox"  id="c407" class="chk" name="F407" value="407" onclick="ck('407'\)" />&#x2002;Wine, White </div>
<div id="d408" class="dchk"><input type="checkbox"  id="c408" class="chk" name="F408" value="408" onclick="ck('408'\)" />&#x2002;Yeast, Wine </div>
   
</div><button id="b5" class="link" type="button" onclick ="exp('5')">Bread, Cereal, Rice, &amp; Grains</button><div id="s5" class="columns2">
<div id="d006" class="dchk"><input type="checkbox"  id="c006" class="chk" name="F006" value="006" onclick="ck('006')" />&#x2002;Barley </div>
<div id="d304" class="dchk"><input type="checkbox"  id="c304" class="chk" name="F304" value="304" onclick="ck('304')" />&#x2002;Bran, Wheat </div>
<div id="d102" class="dchk"><input type="checkbox"  id="c102" class="chk" name="F102" value="102" onclick="ck('102')" />&#x2002;Buckwheat  </div>
<div id="d008" class="dchk"><input type="checkbox"  id="c008" class="chk" name="F008" value="008" onclick="ck('008')" />&#x2002;Corn </div>
<div id="d125" class="dchk"><input type="checkbox"  id="c125" class="chk" name="F125" value="125" onclick="ck('125')" />&#x2002;Hops</div>
<div id="d090" class="dchk"><input type="checkbox"  id="c090" class="chk" name="F090" value="090" onclick="ck('090')" />&#x2002;Malt</div>
<div id="d157" class="dchk"><input type="checkbox"  id="c157" class="chk" name="F157" value="157" onclick="ck('157')" />&#x2002;Millet</div>
<div id="d007" class="dchk"><input type="checkbox"  id="c007" class="chk" name="F007" value="007" onclick="ck('007')" />&#x2002;Oat </div>
<div id="d369" class="dchk"><input type="checkbox"  id="c369" class="chk" name="F369" value="369" onclick="ck('369')" />&#x2002;Quinoa</div>
<div id="d009" class="dchk"><input type="checkbox"  id="c009" class="chk" name="F009" value="009" onclick="ck('009')" />&#x2002;Rice</div>
<div id="d005" class="dchk"><input type="checkbox"  id="c005" class="chk" name="F005" value="005" onclick="ck('005')" />&#x2002;Rye </div>
<div id="d131" class="dchk"><input type="checkbox"  id="c131" class="chk" name="F131" value="131" onclick="ck('131')" />&#x2002;Tapioca  </div>
<div id="d004" class="dchk"><input type="checkbox"  id="c004" class="chk" name="F004" value="004" onclick="ck('004')" />&#x2002;Wheat </div>
<div id="d079" class="dchk"><input type="checkbox"  id="c079" class="chk" name="F079" value="079" onclick="ck('079')" />&#x2002;Wheat, Gluten </div>

</div><button id="b6" class="link" type="button" onclick ="exp('6')">Yeast</button><div id="s6" class="columns2">
<div id="d318" class="dchk"><input type="checkbox"  id="c318" class="chk" name="F318" value="318" onclick="ck('318')" />&#x2002;Yeast, Bakers  </div>
<div id="d045" class="dchk"><input type="checkbox"  id="c045" class="chk" name="F045" value="045" onclick="ck('045')" />&#x2002;Yeast, Brewers</div>

</div><button id="b7" class="link" type="button" onclick ="exp('7')">Peas, Beans, &amp; Legumes</button><div id="s7" class="columns2">
<div id="d356" class="dchk"><input type="checkbox"  id="c356" class="chk" name="F356" value="356" onclick="ck('356')" />&#x2002;Bean, Black </div>
<div id="d022" class="dchk"><input type="checkbox"  id="c022" class="chk" name="F022" value="022" onclick="ck('022')" />&#x2002;Bean, Carob </div>
<div id="d417" class="dchk"><input type="checkbox"  id="c417" class="chk" name="F417" value="417" onclick="ck('417')" />&#x2002;Bean, Green </div>
<div id="d300" class="dchk"><input type="checkbox"  id="c300" class="chk" name="F300" value="300" onclick="ck('300')" />&#x2002;Bean, Kidney </div>
<div id="d301" class="dchk"><input type="checkbox"  id="c301" class="chk" name="F301" value="301" onclick="ck('301')" />&#x2002;Bean, Lima</div>
<div id="d302" class="dchk"><input type="checkbox"  id="c302" class="chk" name="F302" value="302" onclick="ck('302')" />&#x2002;Bean, Pinto </div>
<div id="d303" class="dchk"><input type="checkbox"  id="c303" class="chk" name="F303" value="303" onclick="ck('303')" />&#x2002;Bean, Wax String </div>
<div id="d015" class="dchk"><input type="checkbox"  id="c015" class="chk" name="F015" value="015" onclick="ck('015')" />&#x2002;Bean, White/Navy </div>
<div id="d355" class="dchk"><input type="checkbox"  id="c355" class="chk" name="F355" value="355" onclick="ck('355')" />&#x2002;Pea, Black-Eyed</div>
<div id="d142" class="dchk"><input type="checkbox"  id="c142" class="chk" name="F142" value="142" onclick="ck('142')" />&#x2002;Pea, Chick</div>
<div id="d012" class="dchk"><input type="checkbox"  id="c012" class="chk" name="F012" value="012" onclick="ck('012')" />&#x2002;Pea, Green</div>
<div id="d126" class="dchk"><input type="checkbox"  id="c126" class="chk" name="F126" value="126" onclick="ck('126')" />&#x2002;Lentil</div>
<div id="d014" class="dchk"><input type="checkbox"  id="c014" class="chk" name="F014" value="014" onclick="ck('014')" />&#x2002;Soybean </div>

</div><button id="b8" class="link" type="button" onclick ="exp('8')">Seeds, Spices &amp; Peppers</button><div id="s8" class="columns2">
<div id="d373" class="dchk"><input type="checkbox"  id="c373" class="chk" name="F373" value="373" onclick="ck('373')" />&#x2002;Allspice</div>
<div id="d374" class="dchk"><input type="checkbox"  id="c374" class="chk" name="F374" value="374" onclick="ck('374')" />&#x2002;Aniseed</div>
<div id="d343" class="dchk"><input type="checkbox"  id="c343" class="chk" name="F343" value="343" onclick="ck('343')" />&#x2002;Basil</div>
<div id="d347" class="dchk"><input type="checkbox"  id="c347" class="chk" name="F347" value="347" onclick="ck('347')" />&#x2002;Bay leaf</div>
<div id="d159" class="dchk"><input type="checkbox"  id="c159" class="chk" name="F159" value="159" onclick="ck('159')" />&#x2002;Canola Seed </div>
<div id="d023" class="dchk"><input type="checkbox"  id="c023" class="chk" name="F023" value="023" onclick="ck('023')" />&#x2002;Chives </div>
<div id="d308" class="dchk"><input type="checkbox"  id="c308" class="chk" name="F308" value="308" onclick="ck('308')" />&#x2002;Cinnamon</div>
<div id="d146" class="dchk"><input type="checkbox"  id="c146" class="chk" name="F146" value="146" onclick="ck('146')" />&#x2002;Cloves</div>
<div id="d309" class="dchk"><input type="checkbox"  id="c309" class="chk" name="F309" value="309" onclick="ck('309')" />&#x2002;Cottonseed  </div>
<div id="d140" class="dchk"><input type="checkbox"  id="c140" class="chk" name="F140" value="140" onclick="ck('140')" />&#x2002;Cumin</div>
<div id="d141" class="dchk"><input type="checkbox"  id="c141" class="chk" name="F141" value="141" onclick="ck('141')" />&#x2002;Curry powder </div>
<div id="d341" class="dchk"><input type="checkbox"  id="c341" class="chk" name="F341" value="341" onclick="ck('341')" />&#x2002;Dill</div>
<div id="d382" class="dchk"><input type="checkbox"  id="c382" class="chk" name="F382" value="382" onclick="ck('382')" />&#x2002;Fennel (Fresh)</div>
<div id="d143" class="dchk"><input type="checkbox"  id="c143" class="chk" name="F143" value="143" onclick="ck('143')" />&#x2002;Flaxseed</div>
<div id="d345" class="dchk"><input type="checkbox"  id="c345" class="chk" name="F345" value="345" onclick="ck('345')" />&#x2002;Ginger </div>
<div id="d387" class="dchk"><input type="checkbox"  id="c387" class="chk" name="F387" value="387" onclick="ck('387')" />&#x2002;Horseradish</div>
<div id="d392" class="dchk"><input type="checkbox"  id="c392" class="chk" name="F392" value="392" onclick="ck('392')" />&#x2002;Mint</div>
<div id="d089" class="dchk"><input type="checkbox"  id="c089" class="chk" name="F089" value="089" onclick="ck('089')" />&#x2002;Mustard </div>
<div id="d148" class="dchk"><input type="checkbox"  id="c148" class="chk" name="F148" value="148" onclick="ck('148')" />&#x2002;Nutmeg</div>
<div id="d283" class="dchk"><input type="checkbox"  id="c283" class="chk" name="F283" value="283" onclick="ck('283')" />&#x2002;Oregano</div>
<div id="d391" class="dchk"><input type="checkbox"  id="c391" class="chk" name="F391" value="391" onclick="ck('391')" />&#x2002;Orris Root</div>
<div id="d112" class="dchk"><input type="checkbox"  id="c112" class="chk" name="F112" value="112" onclick="ck('112')" />&#x2002;Paprika </div>
<div id="d144" class="dchk"><input type="checkbox"  id="c144" class="chk" name="F144" value="144" onclick="ck('144')" />&#x2002;Parsley </div>
<div id="d263" class="dchk"><input type="checkbox"  id="c263" class="chk" name="F263" value="263" onclick="ck('263')" />&#x2002;Pepper, Green/Bell </div>
<div id="d313" class="dchk"><input type="checkbox"  id="c313" class="chk" name="F313" value="313" onclick="ck('313')" />&#x2002;Pepper, Black/White</div>
<div id="d314" class="dchk"><input type="checkbox"  id="c314" class="chk" name="F314" value="314" onclick="ck('314')" />&#x2002;Pepper, Chili </div>
<div id="d011" class="dchk"><input type="checkbox"  id="c011" class="chk" name="F011" value="011" onclick="ck('011')" />&#x2002;Pepper, Jalapeno</div>
<div id="d150" class="dchk"><input type="checkbox"  id="c150" class="chk" name="F150" value="150" onclick="ck('150')" />&#x2002;Pepper, Red </div>
<div id="d137" class="dchk"><input type="checkbox"  id="c137" class="chk" name="F137" value="137" onclick="ck('137')" />&#x2002;Poppy Seed</div>
<div id="d352" class="dchk"><input type="checkbox"  id="c352" class="chk" name="F352" value="352" onclick="ck('352')" />&#x2002;Rosemary</div>
<div id="d349" class="dchk"><input type="checkbox"  id="c349" class="chk" name="F349" value="349" onclick="ck('349')" />&#x2002;Safflower seed</div>
<div id="d151" class="dchk"><input type="checkbox"  id="c151" class="chk" name="F151" value="151" onclick="ck('151')" />&#x2002;Sage</div>
<div id="d010" class="dchk"><input type="checkbox"  id="c010" class="chk" name="F010" value="010" onclick="ck('010')" />&#x2002;Sesame Seed</div>
<div id="d316" class="dchk"><input type="checkbox"  id="c316" class="chk" name="F316" value="316" onclick="ck('316')" />&#x2002;Sunflower Seed </div>
<div id="d340" class="dchk"><input type="checkbox"  id="c340" class="chk" name="F340" value="340" onclick="ck('340')" />&#x2002;Tea, Black</div>

<div id="d409" class="dchk"><input type="checkbox"  id="c409" class="chk" name="F409" value="409" onclick="ck('409')" />&#x2002;Tea, Camomile</div>
<div id="d156" class="dchk"><input type="checkbox"  id="c156" class="chk" name="F156" value="156" onclick="ck('156')" />&#x2002;Thyme</div>
<div id="d016" class="dchk"><input type="checkbox"  id="c016" class="chk" name="F016" value="016" onclick="ck('016')" />&#x2002;Turmeric</div>

</div><button id="b9" class="link" type="button" onclick ="exp('9')">Shellfish</button><div id="s9" class="columns2">
<div id="d207" class="dchk"><input type="checkbox"  id="c207" class="chk" name="F207" value="207" onclick="ck('207')" />&#x2002;Clam</div>
<div id="d310" class="dchk"><input type="checkbox"  id="c310" class="chk" name="F310" value="310" onclick="ck('310')" />&#x2002;Crab, Blue </div>
<div id="d339" class="dchk"><input type="checkbox"  id="c339" class="chk" name="F339" value="339" onclick="ck('339')" />&#x2002;Crab, Alaskan </div>
<div id="d354" class="dchk"><input type="checkbox"  id="c354" class="chk" name="F354" value="354" onclick="ck('354')" />&#x2002;Crab,Dungeness </div>
<div id="d381" class="dchk"><input type="checkbox"  id="c381" class="chk" name="F381" value="381" onclick="ck('381')" />&#x2002;Crayfish </div>
<div id="d080" class="dchk"><input type="checkbox"  id="c080" class="chk" name="F080" value="080" onclick="ck('080')" />&#x2002;Lobster, Maine</div>
<div id="d136" class="dchk"><input type="checkbox"  id="c136" class="chk" name="F136" value="136" onclick="ck('136')" />&#x2002;Lobster, Spiny </div>
<div id="d393" class="dchk"><input type="checkbox"  id="c393" class="chk" name="F393" value="393" onclick="ck('393')" />&#x2002;Mussel </div>
<div id="d290" class="dchk"><input type="checkbox"  id="c290" class="chk" name="F290" value="290" onclick="ck('290')" />&#x2002;Oyster </div>
<div id="d338" class="dchk"><input type="checkbox"  id="c338" class="chk" name="F338" value="338" onclick="ck('338')" />&#x2002;Scallop</div>
<div id="d024" class="dchk"><input type="checkbox"  id="c024" class="chk" name="F024" value="024" onclick="ck('024')" />&#x2002;Shrimp</div>

</div><button id="b10" class="link" type="button" onclick ="exp('10')">Sugar</button><div id="s10" class="columns2">
<div id="d145" class="dchk"><input type="checkbox"  id="c145" class="chk" name="F145" value="145" onclick="ck('145')" />&#x2002;Beet, Sugar</div>
<div id="d247" class="dchk"><input type="checkbox"  id="c247" class="chk" name="F247" value="247" onclick="ck('247')" />&#x2002;Honey </div>
<div id="d388" class="dchk"><input type="checkbox"  id="c388" class="chk" name="F388" value="388" onclick="ck('388')" />&#x2002;Maple Syrup </div>
<div id="d350" class="dchk"><input type="checkbox"  id="c350" class="chk" name="F350" value="350" onclick="ck('350')" />&#x2002;Sugar, Cane</div>

</div><button id="b11" class="link" type="button" onclick ="exp('11')"> Nuts</button><div id="s11" class="columns2">
<div id="d020" class="dchk"><input type="checkbox"  id="c020" class="chk" name="F020" value="020" onclick="ck('020')" />&#x2002;Almond </div>
<div id="d018" class="dchk"><input type="checkbox"  id="c018" class="chk" name="F018" value="018" onclick="ck('018')" />&#x2002;Brazil Nut </div>
<div id="d202" class="dchk"><input type="checkbox"  id="c202" class="chk" name="F202" value="202" onclick="ck('202')" />&#x2002;Cashew </div>
<div id="d103" class="dchk"><input type="checkbox"  id="c103" class="chk" name="F103" value="103" onclick="ck('103')" />&#x2002;Chestnut </div>
<div id="d093" class="dchk"><input type="checkbox"  id="c093" class="chk" name="F093" value="093" onclick="ck('093')" />&#x2002;Chocolate/Cacao</div>
<div id="d036" class="dchk"><input type="checkbox"  id="c036" class="chk" name="F036" value="036" onclick="ck('036')" />&#x2002;Coconut </div>
<div id="d221" class="dchk"><input type="checkbox"  id="c221" class="chk" name="F221" value="221" onclick="ck('221')" />&#x2002;Coffee</div>
<div id="d348" class="dchk"><input type="checkbox"  id="c348" class="chk" name="F348" value="348" onclick="ck('348')" />&#x2002;Cola nut </div>
<div id="d017" class="dchk"><input type="checkbox"  id="c017" class="chk" name="F017" value="017" onclick="ck('017')" />&#x2002;Hazelnut </div>
<div id="d363" class="dchk"><input type="checkbox"  id="c363" class="chk" name="F363" value="363" onclick="ck('363')" />&#x2002;Macadamia</div>
<div id="d013" class="dchk"><input type="checkbox"  id="c013" class="chk" name="F013" value="013" onclick="ck('013')" />&#x2002;Peanut </div>
<div id="d201" class="dchk"><input type="checkbox"  id="c201" class="chk" name="F201" value="201" onclick="ck('201')" />&#x2002;Pecan</div>
<div id="d114" class="dchk"><input type="checkbox"  id="c114" class="chk" name="F114" value="114" onclick="ck('114')" />&#x2002;Pine Nut </div>
<div id="d203" class="dchk"><input type="checkbox"  id="c203" class="chk" name="F203" value="203" onclick="ck('203')" />&#x2002;Pistachio </div>
<div id="d130" class="dchk"><input type="checkbox"  id="c130" class="chk" name="F130" value="130" onclick="ck('130')" />&#x2002;Vanilla  </div>
<div id="d256" class="dchk"><input type="checkbox"  id="c256" class="chk" name="F256" value="256" onclick="ck('256')" />&#x2002;Walnut, Black </div>
<div id="d317" class="dchk"><input type="checkbox"  id="c317" class="chk" name="F317" value="317" onclick="ck('317')" />&#x2002;Walnut, English </div>

</div><button id="b12" class="link" type="button" onclick ="exp('12')">Vegatables</button><div id="s12" class="columns2">
<div id="d122" class="dchk"><input type="checkbox"  id="c122" class="chk" name="F122" value="122" onclick="ck('122')" />&#x2002;Artichoke   </div>
<div id="d135" class="dchk"><input type="checkbox"  id="c135" class="chk" name="F135" value="135" onclick="ck('135')" />&#x2002;Asparagus</div>
<div id="v096" class="dchk"><input type="checkbox"  id="cv096" class="chk" name="F096" value="096" onclick="ckv('096')" />&#x2002;Avocado</div>
<div id="d152" class="dchk"><input type="checkbox"  id="c152" class="chk" name="F152" value="152" onclick="ck('152')" />&#x2002;Beet </div>
<div id="d260" class="dchk"><input type="checkbox"  id="c260" class="chk" name="F260" value="260" onclick="ck('260')" />&#x2002;Broccoli </div>
<div id="d154" class="dchk"><input type="checkbox"  id="c154" class="chk" name="F154" value="154" onclick="ck('154')" />&#x2002;Brussel Sprouts</div>
<div id="d216" class="dchk"><input type="checkbox"  id="c216" class="chk" name="F216" value="216" onclick="ck('216')" />&#x2002;Cabbage Mix </div>
<div id="d031" class="dchk"><input type="checkbox"  id="c031" class="chk" name="F031" value="031" onclick="ck('031')" />&#x2002;Carrot</div>
<div id="d291" class="dchk"><input type="checkbox"  id="c291" class="chk" name="F291" value="291" onclick="ck('291')" />&#x2002;Cauliflower</div>
<div id="d085" class="dchk"><input type="checkbox"  id="c085" class="chk" name="F085" value="085" onclick="ck('085')" />&#x2002;Celery</div>
<div id="d030" class="dchk"><input type="checkbox"  id="c030" class="chk" name="F030" value="030" onclick="ck('030')" />&#x2002;Cilantro</div>
<div id="d244" class="dchk"><input type="checkbox"  id="c244" class="chk" name="F244" value="244" onclick="ck('244')" />&#x2002;Cucumber</div>
<div id="d108" class="dchk"><input type="checkbox"  id="c108" class="chk" name="F108" value="108" onclick="ck('108')" />&#x2002;Eggplant  </div>
<div id="d047" class="dchk"><input type="checkbox"  id="c047" class="chk" name="F047" value="047" onclick="ck('047')" />&#x2002;Garlic </div>
<div id="d133" class="dchk"><input type="checkbox"  id="c133" class="chk" name="F133" value="133" onclick="ck('133')" />&#x2002;Gelatin </div>
<div id="d370" class="dchk"><input type="checkbox"  id="c370" class="chk" name="F370" value="370" onclick="ck('370')" />&#x2002;Kale</div>
<div id="d414" class="dchk"><input type="checkbox"  id="c414" class="chk" name="F414" value="414" onclick="ck('414')" />&#x2002;Leek</div>

<div id="d215" class="dchk"><input type="checkbox"  id="c215" class="chk" name="F215" value="215" onclick="ck('215')" />&#x2002;Lettuce</div>
<div id="d212" class="dchk"><input type="checkbox"  id="c212" class="chk" name="F212" value="212" onclick="ck('212')" />&#x2002;Mushroom</div>
<div id="d028" class="dchk"><input type="checkbox"  id="c028" class="chk" name="F028" value="028" onclick="ck('028')" />&#x2002;Okra</div>

<div id="v124" class="dchk"><input type="checkbox"  id="cv124" class="chk" name="F124" value="124" onclick="ckv('124')" />&#x2002;Olive, Black </div>
<div id="v342" class="dchk"><input type="checkbox"  id="cv342" class="chk" name="F342" value="342" onclick="ckv('342')" />&#x2002;Olive, Green</div>

<div id="d048" class="dchk"><input type="checkbox"  id="c048" class="chk" name="F048" value="048" onclick="ck('048')" />&#x2002;Onion </div>
<div id="d054" class="dchk"><input type="checkbox"  id="c054" class="chk" name="F054" value="054" onclick="ck('054')" />&#x2002;Potato, Sweet</div>
<div id="d035" class="dchk"><input type="checkbox"  id="c035" class="chk" name="F035" value="035" onclick="ck('035')" />&#x2002;Potato, White</div>
<div id="d115" class="dchk"><input type="checkbox"  id="c115" class="chk" name="F115" value="115" onclick="ck('115')" />&#x2002;Pumpkin  </div>
<div id="d149" class="dchk"><input type="checkbox"  id="c149" class="chk" name="F149" value="149" onclick="ck('149')" />&#x2002;Radish</div>
<div id="d415" class="dchk"><input type="checkbox"  id="c415" class="chk" name="F415" value="415" onclick="ck('415')" />&#x2002;Rhubarb</div>
<div id="d214" class="dchk"><input type="checkbox"  id="c214" class="chk" name="F214" value="214" onclick="ck('214')" />&#x2002;Spinach </div>
<div id="d346" class="dchk"><input type="checkbox"  id="c346" class="chk" name="F346" value="346" onclick="ck('346')" />&#x2002;Squash, Yellow </div>
<div id="d344" class="dchk"><input type="checkbox"  id="c344" class="chk" name="F344" value="344" onclick="ck('344')" />&#x2002;Squash, Zucchini</div>
<div id="v025" class="dchk"><input type="checkbox"  id="cv025" class="chk" name="F025" value="025" onclick="ckv('025')" />&#x2002;Tomato </div>
</div>

<input type="hidden" name="sub" value="64" />
<input type="hidden" name="rec" value="1026" />
<input type="submit" value="Next" class="btn" /></div></form>


<script>
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
var expButtons = {0:[null,null],1:[null,null],2:[null,null],3:[null,null],4:[null,null],5:[null,null],6:[null,null],7:[null,null],8:[null,null],9:[null,null],10:[null,null],11:[null,null],12:[null,null]};
console.log(expButtons);
function init(){
  for (var id in expButtons){
    expButtons[id][0] = document.getElementById('s' + id);
    expButtons[id][0].style.display = 'none';
  }
  expButtons[0][0].style.display = 'block';
}
function exp(id){
  var disp = flip[expButtons[id][0].style.display];
  var i = id;
  for (var id in expButtons){
    expButtons[id][0].style.display = 'none'
  }
  expButtons[i][0].style.display=disp;
}
function ck(id){
}


window.onload = init;
</script></body></html>

EOT;

?>