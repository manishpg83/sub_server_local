<?php
$lat = number_format($_POST['lat'],15);
$lng = number_format($_POST['lng'],15);
$time = intval($_POST['time']);
$out[] = $time;
$out[] = number_format($lat,7);
$out[] = number_format($lng);
echo json_encode($out);
$ms = substr('00' . $time % 1000,-3);
$t = $time / 1000;
$t = date('h:i:s',$t);
file_put_contents('geo.txt',"$time $t $lat         $lng\n",FILE_APPEND);
?>