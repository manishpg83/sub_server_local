<?php
$file = './path/to/the.pdf';
$filename = 'Custom file name for the.pdf';
header('HTTP/1.1 200 OK');
header('Connection: Keep-Alive');
header('Content-Length: ' . filesize($file));
header('Server: Apache/2.2.22 (Unix) mod_ssl/2.2.22 OpenSSL/0.9.8e-fips-rhel5 mod_bwlimited/1.4');
header('Content-type: application/pdf');
header('Content-Disposition: inline; filename="' . $filename . '"');
header('Accept-Ranges: bytes');
header('Keep-Alive: timeout=5, max=100');
@readfile($file);
?>