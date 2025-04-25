<?php
ob_start();
ob_clean();
$c = $_COOKIE['amxc'];
$p = $_GET['p'];
//$c = $_POST['c'];
$filename = "$p" . 'e.PDF';
$file1 = "/home/amx/Z/ResultsNoEncrypt/$c/$filename";
$file2 = "/home/amx/Z/Results/$c/$filename";
if (file_exists($file1)){
$file = $file1;
}
elseif (file_exists($file2)){
$file = $file2;
}
else {
  $file = './NotFound.pdf';
}
header('HTTP/1.1 200 OK');
header('Connection: Keep-Alive');
header('Cache-Control: max-age=31536000');
header('Content-Length: ' . filesize($file));
header('Server: Apache/2.2.22 (Unix) mod_ssl/2.2.22 OpenSSL/0.9.8e-fips-rhel5 mod_bwlimited/1.4');
header('Content-type: application/pdf');
header('Content-Disposition: inline; filename="' . $file . '"');
header('Accept-Ranges: bytes');
header('Keep-Alive: timeout=5, max=100');
@readfile($file);
ob_end_flush();
exit;
?> 
