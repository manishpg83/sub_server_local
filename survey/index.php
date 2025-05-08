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
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/><title>Survey</title>
<meta name="viewport" content="width=640, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:400 1em Arial,sans-serif;margin:0;background:#fff;padding:0;background:#6cc; }
#page1{width:80%;margin-left:10%;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1.1em/1.2 Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1.25em/1 Arial,sans-serif;color:#f00;}
.col{margin:0 0 .3em .3em ;-webkit-column-count: 4;-moz-column-count: 4;-ms-column-count: 4;-o-column-count: 4;column-count: 4;background:#144;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.hide{display:none;color:#ff0;}
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.desc{width:12em;display:inline-block;font-weight:700;}
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
table{width:100%;padding:0;margin:0 auto 0}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk2,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.dchk2{width:100%}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.dchk2,.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;background:#144;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
#page{width:100%;padding:0;width:40em;margin:0 auto;}
.btn,.link,.go{width:100%;padding: .5em;margin:.5em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1.6em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
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
.hide,#bs{background:#144;color:#ff0;display:none;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk{font:700 1.2em Arial,sans-serif;color:#fff;width:32%;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.c2chk{font:700 1.2em Arial,sans-serif;color:#fff;display:inline-block;width:100%;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.chk,c2chk,.component{background:#2985EA;text-align:left;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;background:#144;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
#page{width:100%;padding:0;width:40em;margin:0 auto;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{background:#2985EA;width:48%;padding:0;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1.2em Arial,sans-serif;;}
.ige,.igg4{font:400 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 0 .3em 0;padding:.3em 0 0 0;background:#6cc;color:#000;}
.desc{text-align:left;width:12em;padding:0 .1em 0 .1em;}
.col{background:#144;width:40em;margin:0 auto;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
.c2check
p{padding:.4em;margin:0;font:700 1.2em Arial,sans-serif;}
h3{color:#ff0;}
.summary{background:#144;color:#ff0;font:700 1.2em Arial,sans-serif;margin-top:2em;padding:1em;}
.bar{width:9%;margin:0;border:1px solid #000;display:inline-block;padding:0;height:20em;background:#f00;}
.label{width:9%;margin:0;border:1px solid #6cc;display:inline-block;height:2em;background:#6cc;text-align:center;font:700 1em Arial,sans-serif;}

.clear0{height:20em;background:#6cc;width:100%;}
.clear1{height:18em;background:#6cc;width:100%;}
.clear2{height:16em;background:#6cc;width:100%;}
.clear3{height:14em;background:#6cc;width:100%;}
.clear4{height:12em;background:#6cc;width:100%;}
.clear5{height:10em;background:#6cc;width:100%;}
.clear6{height:8em;background:#6cc;width:100%;}
.clear7{height:6em;background:#6cc;width:100%;}
.clear8{height:4em;background:#6cc;width:100%;}
.clear8{height:2em;background:#6cc;width:100%;}
.question{font:700 1.2em Arial,sans-serif;}
</style></head><body><div id="page"><div id="col">
EOT;
$sub = $_POST['sub'];
if($sub == 2){
echo '<h1>Thank You</h1></div></div></body></html>';
ob_flush();
exit;
}
$section = array(
'<h2> <br/>Testing Related Questions</h2><br/>',
'',
'',
'',
'',
'<div class="question">I would like Allermetrix to offer the following new foods:</div> <input type="text"style="width:90%;" name="foods" /><hr/><h2> <br/>Allergy Business Related Questions</h2><br/>',
'',
'<h2> <br/>CLOUD Related Questions</h2><br/>',
'<div id="ec1">',
'</div>',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'',
'');
$script = array(
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'onclick="ec(1,0)"',2=>'onclick="ec(1,1)"',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
array(1=>'',2=>'',3=>''),
);
echo '<form action="#" method="post"><div>' . "\n$section[0]\n";
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx_allermetrix',$data);
mysqli_select_db($dbc,'amx_portal');
$sql = "SELECT `id`,`question`, `check1`, `check2`, `check3` FROM `Survey` WHERE 1 ORDER BY `id`";
$results = mysqli_query($dbc,$sql);
while(list($id,$question,$check1,$check2,$check3) = mysqli_fetch_array($results, MYSQLI_NUM)){
$s1 = $script[$id][1] ;
$s2 = $script[$id][2] ;
echo <<<EOT
  <div class="row"><div class="question"> $question</div>
  <div class="dchk"><input type="radio"  class="chk" name="r$id" value="1" $s1/> $check1</div>
  <div class="dchk"><input type="radio"  class="chk" name="r$id" value="2" $s2 /> $check2</div>
EOT;
if (strlen($check3) > 2){$s1 = $script[$id][3] ;echo " <div class=\"dchk\"><input type=\"radio\"  class=\"chk\" name=\"r$id\" value=\"3\" $s1/> $check3</div>\n";}else{echo "<div id=\"r$id\"></div>";}
echo "\n<hr/></div>\n$section[$id]\n";
}





echo <<<EOT
<input type="hidden" name="sub" value="2" />
<input class="btn" type="submit" value="Submit" />
</div></form>
<script type="text/javascript"> //<![CDATA[
var disp = new Array;
disp[0] = 'none';
disp[1] = 'block';
function ec(id,visability){
document.getElementById('ec' + id).style.display=disp[visability];

}
function init(){}
window.onload = init;
//]]>
</script><pre>
EOT;
?>














</pre></div></div></body></html>