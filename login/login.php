<?php
header('Content-Type: text/plain; charset=utf-8');
$data = file_get_contents('page1.txt');
$data = explode("\n",$data);
var_export($data);

?>