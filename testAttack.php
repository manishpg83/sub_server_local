<?php
$url = "http://terketme.com/bdysm.html";


$data = @file_get_contents($url);
echo $data;

?>