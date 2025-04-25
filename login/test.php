<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$alpha = intval($_POST['Alpha']);
$tab = 5;
$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$t = microtime(1);
$clients = array(200014,200005,200229,200225,200006,500251);
$client = intval($_POST['client']);
if($client < 100000){$client = $clients[rand(0,5)];}
$tabs = array('foods','food','pollen','environmental','chemicals','panels','','');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Test Save Selections</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
</style>
</head><body><div id="page">
<form action="./" method="post">
<input type ='text' name="client" value="" size="8" />
<input type="hidden" name="sub" value="50" />
<input type="hidden" name="tab" value="0" />
<input type="hidden" name="prior" value="7" />
</form>
<pre>
EOT;

$EG = array('','E','','G');
$input = array(0=>array('',"\n<input type=\"text\" name=\""),1=>array('',"\" value=\""),2=>array('',"\" size=\"50\" />"));
echo '<form action="./" method="post"><input type="hidden" name="client" value="888888" ><input type="hidden" name="sub" value="51" >';
for($tab=1;$tab<5;$tab++){
  $file = $id . $tabs[$tab] . '.jsn';
  $selected = json_decode(file_get_contents($file),1);
  foreach($selected as $code => $type){
    if($type[1] + $type[2] + $type[3] == 0 || $type[0] == 5){continue;}
    for($ig=1;$ig<4;$ig++){
      $name = array('',$EG[$ig] . $code);
      $value = array('',"$EG[$ig]$code $ig $type[4]");
      echo $input[0][$type[$ig]] . $name[$type[$ig]] . $input[1][$type[$ig]] . $value[$type[$ig]] . $input[2][$type[$ig]];
    }
  }
}
$file = $id . $tabs[5] . '.jsn';
$selected = json_decode(file_get_contents($file),1);
foreach($selected[1] as $code => $type){
  if($type[0] == 0){continue;}
  $panels[$code] =  "$type[4]";
}
foreach($selected[0] as $code => $type){
  if($type[0] == 0){continue;}
  $panels[$code] = "$type[4]";
}
foreach($panels as $panel => $text){
  echo "\n<input type=\"text\"  name=\"P$panel\" value=\"$text\" size=\"40\" />";
}
echo <<<EOT
<button>Submit</button>
</form></div></body></html>
EOT;
?>
