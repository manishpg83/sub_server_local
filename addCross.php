<?php
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
@mysql_select_db('amx_portal');
$codes[0] = array('T003','T146','T008','T107','T108','T100','T101','T153','T149'); 
$desc[0] = array(' Birch, Gray',' Birch, Red/River',' Elm, American',' Elm, Chinese ',' Elm,Scrub ',' Alder, European',' Alder,Red ',' Alder, Sitka ',' Hazelnut ');
$desc[1] = array('Sycamore');
$codes[1] = array('T140');
$codes[2] = array('W006','W111','W001'); 
$desc[2] = array('Mugwort','Sagebrush','Common Ragweed');
$codes[3] = array('G002','G003','G004','G005','G006','G008','G009','G010','G013','G014','G015','G017','G020','G021','G022','G023','G024','G025','GZ08','G026');
$desc[3] = array('Bermuda Grass','Orchard Grass','Fescue, Meadow Grass','Rye, perennial Grass','Timothy Grass','June Grass','Bent/Redtop Grass','Johnson Grass','Velvet Grass','Oat,CultivaRed','Wheat, Cultivated','Bahia Grass','Bluegrass,Canada','Brome, Smooth Grass','Canary/Reed Grass','Sweet Vernal Grass','Fescue, Red Grass','Corn Pollen','Grass Mix #1','Common Reed');
$desc[4] = array('Latex');
$codes[4] = array('K082');
$ndx = 0;
$counts = array(8,0,2,19,0);
do{
  $code = 0;
  do{
    $c = $codes[$ndx][$code];
    $d = $desc[$ndx][$code];
    $sql = "INSERT INTO `amx_portal`.`Allergens` (`id`, `alpha`, `Family`, `Type`, `Description`, `Group`, `Code`, `Day`, `Birch`, `Sycamore`, `Mugwort`, `Grasses`, `Latex`) VALUES (NULL, '0', '0', '0', '$d', '0', '$c', '9', '0', '0', '0', '0', '0');";
	mysql_query($sql);
	$sql = "UPDATE `Allergens` SET `Description`= $d WHERE `Code` = $c ";
	mysql_query($sql);
    $code++;
  }while($code < $counts[$ndx]);
  $ndx++;
}while ($ndx < 5);
echo <<<EOT
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>Rotation Diet</title>
<style type="text/css">
body{width:100%;font:400 .8em/1 Arial,sans-serif;margin-left:2%;background:#fff;color:#000;padding-bottom:10em; }
#content{width:90%;padding:0;margin:0;}
input[type="radio"],input[type="checkbox"]{
width:2em;
height:2em;
border:2px solid #eee;
outline:2px solid #eee;
display: inline;
margin:1px;
margin-left:4px;
vertical-align: middle;
position: relative;
background:#333;
color:#eee;}
.pozCheck{width:38em;}
fieldset{background:#6cc;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}
td{padding:2px 0 0 6px;border:0;margin:0;}
.hide{display:none;}
.item{color:#0ff;}
h1{text-align:center;}
h2,h3{margin-bottom:0;}
h4{margin-top:0;}
pre{padding:0;margin:0;}
.col{max-height:700px;-webkit-column-count: 4;-moz-column-count: 4;-ms-column-count: 4;-o-column-count: 4;column-count: 4;}
p{margin:0 0 1px 0;padding:0;font:400 1em/1 Arial,sans-serif;}
.hd{
font-size:1em;
font-weight:700;
padding:2px;
margin:4px 0 2px 0;color:#fff;background:#000;}
.s0,.s1,.s2,.s3,.s4,.s5,.tested{font-weight:700;padding:2px;}
.sz1{background:#ff8;color:#000;font-weight:700;padding:2px;}
.sz2{background:#fd0;color:#000;font-weight:700;padding:2px;}
.sz3{background:#fb5;color:#000;font-weight:700;padding:2px;}
.sz4{background:#e60;color:#fff;font-weight:700;padding:2px;}
.sz5{background:#f20;color:#fff;font-weight:700;padding:2px;}
.day{font-size:1.2em;}
.neg{font-weight:700;display:inline;}
.eq{background:#ffc;}
.pos{font-weight:700;display:inline;}
.tested{font-weight:700;display:inline;}
.yellow{background:#ff0;color:#000;display:inline;font-weight:700;}
.untested{padding-left:1em;}
#hd,.noPrint{background:#6AB4B3;color:#033;max-width:80em;}
button{width:7em;}
@media print
{

.pageBreak {page-break-after:always;}
.noPrint{display:none;}
}
.noPageBreak{}
.emp{font:700 1.2em/1 Arial,sans-serif;}
.inline{display:inline;}
.strike{text-decoration:line-through;font-weight:700;display:inline;}
.break{clear:both;}
.widthWide{width:26em;}
.widthInside{width:24em;}
.desc{width:14em;display:inline-block;font-weight:700;}
.score{width:2em;display:inline;text-align:center;font-weight:700;}
.plus      {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAANpFJe+0p+FsU/vu6ywAAAAADAAMAAACGoSPqQsRbMZYosoqUJB8vINd1SJBzceM5roUADs=');}
.minus     {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD2pS9Ds1PH68k2wWiwAAAAADAAMAAACFISPqcudAyNEQdg7aNg8uw+GIlAAADs=');}
.checkmark {margin:2px 0 0 1em;display:inline-block;width:12px;height:12px;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAD+wS7LfuPv+/F28ZywAAAAADAAMAAACGISPqcsc04IIaDwgaRVzrsFpS3A1UIOiBQA7');}
.divCheck,.divNoCheck{color:#fff;width:16em;
display:inline-block;
padding:6px 0 6px 6px;
margin-bottom:6px;
vertical-align: middle;
position: relative;}
.check,.nocheck{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.divNoCheck{background:#2985EA;}
.nocheck{background:#2985EA;}
.divCheck{background:#f00;}
.check{background:#f00;}
input[type="checkbox"],input[type="radio"] {margin-left:4px ;width:2em;height:2em;
display: inline;vertical-align: middle;position: relative;}
pre{font-size:2em;font-weight:700;}
.box{width:96%;border: 1px solid #000;margin:0 auto 0;padding:1em;}
.title{font-weight:700;font-size:1.2em;color:#fff;background:#000;padding:2px;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
.page{padding:8px 0 4px 0;font-weight:700;}
</style></head><body onload="init()">
<div id="header" class="noPrint" onclick="hideHeader()" >
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>

</div><div id="content">
<h2>$ndx<br>$code</h2>
</div>
</BODY></html>

EOT;
?>

