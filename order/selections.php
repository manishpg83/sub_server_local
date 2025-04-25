<?php
$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$tab = intval($_POST['tab']);
if($tab == 0){$tab = intval($_GET['tab']);}
$prior = intval($_POST['prior']);
$tabs = array('foods','food','pollen','environmental','chemicals','panels','','');

$bc = array(0 => '<div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="fs"></div><div class="fb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>',1 => '<div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div>',2 => '<div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div>',3 => '<div class="fb"></div><div class="ts"></div><div class="fb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>',4 => '<div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="fs"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div>',5 => '<div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="fs"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>',6 => '<div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="fs"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>',7 => '<div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div>',8 => '<div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>',9 => '<div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>','*' => '<div class="tb"></div><div class="fs"></div><div class="tb"></div><div class="ts"></div><div class="fb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div><div class="tb"></div><div class="ts"></div>');

if($prior > 1 && $prior < 6){
  if($prior == 5){
    $file = $id . $tabs[5] . '.jsn';
    $selected = json_decode(file_get_contents($file),1);
//	echo '<pre>';var_export($selected);
    foreach($selected[0] as $panel => $property){$selected[0][$panel][0] = 0;} //echo "<br>$panel => " . $selected[$panel][0] . $selected[$panel][1] . $selected[$panel][3] . $selected[$panel][3] . $selected[$panel][4] ;}
    foreach($selected[1] as $panel => $property){$selected[1][$panel][0] = 0;} //echo "<br>$panel => " . $selected[$panel][0] . $selected[$panel][1] . $selected[$panel][3] . $selected[$panel][3] . $selected[$panel][4] ;}
    foreach($_POST as $code =>$value){
      if(substr($code,0,1) == 'a'){
		$code = substr($code,1);
		if(array_key_exists($code,$selected[0])){$selected[0][$code][0] = 1;}
		if(array_key_exists($code,$selected[1])){$selected[1][$code][0] = 1;}
	  }
    }
//	echo '<pre>';var_export($selected);exit;
    file_put_contents($file,json_encode($selected));
  }
  else{
    $file = $tabs[$prior] . 'Base.jsn';
    $selected = json_decode(file_get_contents($file),1);
    foreach($_POST as $code =>$value){
      $type = intval($value);
      if(substr($code,0,1) == 'a'){$selected[substr($code,1,4)][$type]=1;$selected[substr($code,1,4)][0]=1;}
    }
  }
  $file = $id . $tabs[$prior] . '.jsn';
  file_put_contents($file,json_encode($selected));
}
if($prior < 2){
  $file = 'foodsBase.jsn';
  $foods = json_decode(file_get_contents($file),1);
  $file = 'foodBase.jsn';
  $food = json_decode(file_get_contents($file),1);
  foreach($_POST as $code =>$value){
    $type = intval($value);
    if(substr($code,0,1) == 'a'){$foods[substr($code,1,4)][$type]=1;$foods[substr($code,1,4)][0]=1;$food[substr($code,1,4)][$type]=1;$food[substr($code,1,4)][0]=1;}
  }
  foreach($food as $code => $property){$food[0] = 1;}
  $file = $id .  'foods.jsn';
  file_put_contents($file,json_encode($foods)); 
  $file = $id .  'food.jsn';
  file_put_contents($file,json_encode($food)); 
}
if($tab == 5){include('panels.php');exit;}
if($tab == 6){include('review.php');exit;}


header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Allermetrix eOffice Select</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{width:100%;font:100 0.9em Arial,sans-serif;margin:0;color:#004;padding:0;background:#f7f7fb;}
#page{margin:0 auto;padding:1em 0 1em 10px;border:0;min-width:1120px;max-width:1120px;background:#f7f7fb;}
.bold{font-weight:700;}
form,button,.inline{display:inline;}
.small{font-size:.9em;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
table{padding:0;margin:0;display:inline-block;min-width:200px;}
td,tr{padding:0;margin:0;}
.link{width:16%;font:700 1em Arial,sans-serif;cursor:pointer;padding:6px 0 6px 7px;border:1px solid #69B5B3;color: #fff;background-color:#144;font-weight:700;
      background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
pre{padding:0;margin:0;color:#333;}
#alpha{margin-left:1em;width:15em;}
.alert{background:#f00;color:#fff;}
.col{columns: 4 auto;margin:20px 0 0 0;}
.col{columns: 4 auto;margin:20px 0 0 0;}
.cat{margin:2px 0 1px 0;font:700 1.1em Arial;display:inline-block;}
.gray{color:#aaa;}
table{}
caption{font:700 1em Arial;text-align: left;}
.row{margin:0;padding:0;}
.cap{font:700 1em Arial,sans-serif;margin: 0 0 2px 2.5em;}
.cat{}
.none{margin:0 0 0 4.3em;font:400 .7em Arial,sans-serif;}
.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
.dchk{text-align:left;}
.chk {margin: 0;display: inline-block;height:0;cursor: pointer;position: relative;}
.chk > span {color: #fff; padding: 0; margin:0; height:0; display: inline-block;}
.chk > input {height: 1.3em;width: 1.5em;margin:0;padding:4px 0 0 0 ;appearance: none; border: 1px solid #000;border-radius: 4px;outline: none;transition-duration: 0.3s;cursor: pointer;}
.chk > input:checked {border: 1px solid #000;}
.chk > input:checked + span::before {font-weight:700;content: '✓';color: #fff; display: block;text-align: center;position: absolute;left: 0.34rem;top: -0.02rem;}
.chk > input:active {border: 2px solid #000;}
.e  > input:not(:checked){background-color: #f7f7fb;}
.e  > input:checked{background-color: #f00;}
.e  > input + span::before {font-weight:700;content: 'E';color:#004;display: block;text-align: center;position: absolute;left: 0.44rem;top: 0.12rem;}
.g4 > input:not(:checked){background-color: #f7f7fb;}
.g4 > input:checked{background-color: #ff0;}
.g4 > input + span::before {font-weight:700;content: 'G4';color:#004;display: block;text-align: center;position: absolute;left: 0.19rem;top: 0.12rem;}
.g  > input:not(:checked){background-color: #f7f7fb;}
.g  > input:checked{background-color: #00f;}
.g  > input + span::before {font-weight:700;content: 'G';color:#004;display: block;text-align: center;position: absolute;left: 0.36rem;top: 0.12rem;}
.g,.e > input:checked + span::before {color:#fff;}
.g4 > input:checked + span::before {color:#000;}
.dim{opacity: 0.25;}
#pat{margin:0 0 0 200px;display:inline-block;vertical-align:12px;}
</style>
</head><body><div id="page"><img src="logo.gif" alt="logo" /><div id="pat">$clientname Order: $rec $first $last</div>
<form action="#" method="post">

EOT;
ob_flush();

$file = $id . $tabs[$tab] . '.jsn';
if(file_exists($file)){
  $jsn = file_get_contents($file);
  $selected = json_decode($jsn,1);
}
else{
  $file = $tabs[$tab] . 'Base.jsn';
  $jsn = file_get_contents($file);
  $selected = json_decode($jsn,1);
  $file = $id . $tabs[$tab] . '.jsn';
  file_put_contents($file,$jsn);
}
echo <<<EOT

<br>
<button id="b0" class="link" name="tab" value="0">Food by Category</button><button id="b1" class="link" name="tab" value="1">Food Alphabetical</button><button id="b2" class="link" name="tab" value="2">Pollen</button><button id="b3" class="link" name="tab" value="3">Environmental</button><button id="b4" class="link" name="tab" value="4">Chemical</button><button id="b5" class="link" name="tab" value="5">Panels</button><button id="b6" class="link" name="tab" value="6">Review</button>

<div class="col">
 
EOT;
$jsdisable = "const dc = [";
$checkmark = array('','checked');
foreach($selected as $code => $types){
  $dim = '';
  $disable = '';
  if($tab == 4 && substr($code,0,1) == 'S'){
    $dim = ' class="dim"';
    $disable = 'disabled';
  }
  if($types[0] == 5){echo '<p class="cat">' . $selected[$code][4] . "</p>\n";$none = "<p class=\"none\">No " . $selected[$code][4] . '</p>';continue;}
  if(strlen($code) < 4){continue;}
  echo "<div class=\"row\">
<div class=\"dchk\"><label class=\"e chk\"> <input type=\"checkbox\" id=\"$code" . "1\" class=\"chk\" name=\"a$code" . "1\" value=\"1\" " . $checkmark[$types[1]] . "/><span></span></label></div>
<div class=\"dchk\"><label class=\"g4 chk\"><input type=\"checkbox\" id=\"$code" . "3\" class=\"chk\" name=\"a$code" . "3\" value=\"3\" " . $checkmark[$types[3]] . "$disable/><span $dim></span></label></div>
<div class=\"dchk\"><label class=\"g chk\"> <input type=\"checkbox\" id=\"$code" . "2\" class=\"chk\" name=\"a$code" . "2\" value=\"2\" " . $checkmark[$types[2]] . "$disable/><span $dim></span></label></div>
<div class=\"inline\">" . $types[4] . "</div></div>\n";

}
include('hidden.php');
echo <<<EOT
</div>
<input type="hidden" name="sub" value="41" />
<input type="hidden" name="prior" value="$tab"/>
</form><hr><br> <br></div>
<script>
const tab = $tab;
document.getElementById('b' + tab).style.display = 'none';
</script>
</body></html>

EOT;


ob_end_flush();

