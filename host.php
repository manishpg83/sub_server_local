<?php
header('Content-Type: text/plain; charset=utf-8');
$src = array('HTTP_X_FORWARDED_HOST', 'HTTP_HOST', 'SERVER_NAME', 'SERVER_ADDR');

foreach($src as $host){
echo  $_SERVER[$host] . "  $host\n";

}
?>