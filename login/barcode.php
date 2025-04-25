<?php
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice</title>
<style>
button{display:inline-block;font-size:1em; font-weight:700; width:230px;padding:1px 0 4px 0;border:1px solid #2985EA;color: #fff;

background: linear-gradient(to bottom, #00f 0%, #004 100%);}
#bc{display:inline-block;height:30px;padding:0 0 0 0px;position:absolute;top:150px;left:200px;}
.nb{width:2px;height:100%;background:#000;display:inline-block;}
.wb{width:4px;height:100%;background:#000;display:inline-block;}
.ns{width:2px;height:100%;background:#fff;display:inline-block;}
.ws{width:4px;height:100%;background:#fff;display:inline-block;}
@media print{button{display:none;}.noprint{display:none;}}
</style></head>
<body><button class="noprint" onclick="window.print();">Print</button>

EOT;
$rec = '0123456789';
$bc = array(
0 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
1 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',
2 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',
3 => '<div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
4 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',
5 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
6 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
7 => '<div class="nb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div>',
8 => '<div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
9 => '<div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>',
'*' => '<div class="nb"></div><div class="ws"></div><div class="nb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="wb"></div><div class="ns"></div><div class="nb"></div><div class="ns"></div>');
$barcode = $bc['*'];
$digins = str_split("$rec");
foreach($digins as $digit){$barcode .= $bc[$digit];}
$barcode .= $bc['*'];

echo <<<EOT
<div id="bc">$barcode</div>

EOT;
exit;
echo <<<EOT
<svg xmlns="http://www.w3.org/2000/svg"
xmlns:xlink="http://www.w3.org/1999/xlink"
id="bc2"
width="166"
height="40"
style="background:#fff"
stroke="#000"
stroke-width="4"> <!--fat bar width (default)-->
<dews>
<g id="d0">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="5" x2="5"    y1="0" y2="30" stroke-width="2" /><!--thin bar -->
<line x1="12" x2="12"  y1="0" y2="30" />                 <!--fat bar -->
<line x1="18" x2="18"  y1="0" y2="30" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
<g id="d1">
<line x1="2" x2="2"    y1="0" y2="30"/>
<line x1="7" x2="7"    y1="0" y2="30" stroke-width="2" />
<line x1="13" x2="13"  y1="0" y2="30"  stroke-width="2" />
<line x1="17" x2="17"  y1="0" y2="30" stroke-width="2" />
<line x1="22" x2="22"  y1="0" y2="30" />
</g>
<g id="d2">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="6" x2="6"    y1="0" y2="30" />
<line x1="13" x2="13"  y1="0" y2="30"  stroke-width="2" />
<line x1="17" x2="17"  y1="0" y2="30" stroke-width="2" />
<line x1="22" x2="22"  y1="0" y2="30" />
</g>
<g id="d3">
<line x1="2" x2="2"    y1="0" y2="30" />
<line x1="8" x2="8"    y1="0" y2="30" />
<line x1="15" x2="15"  y1="0" y2="30" stroke-width="2" />
<line x1="19" x2="19"  y1="0" y2="30" stroke-width="2" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />

</g>
<g id="d4"> 
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="5" x2="5"    y1="0" y2="30" stroke-width="2" />
<line x1="12" x2="12"  y1="0" y2="30" />
<line x1="17" x2="17"  y1="0" y2="30" stroke-width="2" />
<line x1="22" x2="22"  y1="0" y2="30" />

</g>
<g id="d5"> 
<line x1="2" x2="2"    y1="0" y2="30" />
<line x1="7" x2="7"    y1="0" y2="30" stroke-width="2" />
<line x1="14" x2="14"  y1="0" y2="30" />
<line x1="19" x2="19"  y1="0" y2="30" stroke-width="2" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
<g id="d6">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="6" x2="6"    y1="0" y2="30" />
<line x1="14" x2="14"  y1="0" y2="30" />
<line x1="19" x2="19"  y1="0" y2="30" stroke-width="2" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
<g id="d7">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2"  />
<line x1="5" x2="5"    y1="0" y2="30" stroke-width="2" />
<line x1="11" x2="11"  y1="0" y2="30" stroke-width="2" />
<line x1="16" x2="16"  y1="0" y2="30" />
<line x1="22" x2="22"  y1="0" y2="30" />
</g>
<g id="d8">
<line x1="2" x2="2"    y1="0" y2="30"  />
<line x1="7" x2="7"    y1="0" y2="30" stroke-width="2" />
<line x1="13" x2="13"  y1="0" y2="30" stroke-width="2" />
<line x1="18" x2="18"  y1="0" y2="30" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
<g id="d9">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="6" x2="6"    y1="0" y2="30" />
<line x1="13" x2="13"  y1="0" y2="30" stroke-width="2" />
<line x1="18" x2="18"  y1="0" y2="30" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
<g id="ss">
<line x1="1" x2="1"    y1="0" y2="30" stroke-width="2" />
<line x1="7" x2="7"    y1="0" y2="30" stroke-width="2" />
<line x1="12" x2="12"  y1="0" y2="30" />
<line x1="18" x2="18"  y1="0" y2="30" />
<line x1="23" x2="23"  y1="0" y2="30" stroke-width="2" />
</g>
</dews>

EOT;

$bc = array();
$bc[0][0] = '<use x="';
$bc[0][1] = '" xlink:href="#d0" />';

$bc[1][0] = '<use x="';
$bc[1][1] = '" xlink:href="#d1" />';

$bc[2][0] = '<use x="';
$bc[2][1] = '" xlink:href="#d2" />';

$bc[3][0] = '<use x="';
$bc[3][1] = '" xlink:href="#d3" />';

$bc[4][0] = '<use x="';
$bc[4][1] = '" xlink:href="#d4" />';

$bc[5][0] = '<use x="';
$bc[5][1] = '" xlink:href="#d5" />';

$bc[6][0] = '<use x="';
$bc[6][1] = '" xlink:href="#d6" />';

$bc[7][0] = '<use x="';
$bc[7][1] = '" xlink:href="#d7" />';

$bc[8][0] = '<use x="';
$bc[8][1] = '" xlink:href="#d8" />';

$bc[9][0] = '<use x="';
$bc[9][1] = '" xlink:href="#d9" />';

$bc['*'][0] = '<use x="';
$bc['*'][1] = '" xlink:href="#ss" />';

$x = 0;
$y = 0;
$barcode = $bc['*'][0] . $x .  '" y="' . $y . $bc['*'][1] . "\n" ;
$digins = str_split("$rec");
foreach($digins as $digit){$x += 26;$barcode .= $bc[$digit][0] . $x .  '" y="' . $y . $bc[$digit][1] . "\n" ;}
$x += 26;
$barcode .= $bc['*'][0] . $x .  '" y="' . $y . $bc['*'][1] . "\n" ;

echo $barcode;

echo '</svg>'
?>























