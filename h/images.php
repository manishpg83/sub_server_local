<?php
header('Content-Type: text/html; charset=utf-8');
$dir = "./";
$dh  = opendir($dir);
while (false !== ($filename = readdir($dh))) {
$bytes = intval(filesize($filename));
    if(pathinfo($filename,PATHINFO_EXTENSION) == 'svg'){$files[$bytes] = "<img width=\"200\" src=\"$filename\" /><br/>$bytes bytes<hr/>";}
}
ksort($files);
foreach($files as $pic){
  echo $pic;
}
?>