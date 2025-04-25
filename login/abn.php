<?php
ob_start();
ob_clean();
$file = '/home/amx/public_html/login/abnG.pdf';
if(intval($_POST['pdf'] == 1)){$file = '/home/amx/public_html/login/abnE.pdf';}
if(file_exists($file)){
  header('HTTP/1.1 200 OK');
  header('Connection: Keep-Alive');
  header('Cache-Control: private, max-age=0');
  header('Content-Length: ' . filesize($file));
  header('Content-type: application/pdf');
  header('Content-Disposition: inline; filename="' . $file . '"');
  header('Accept-Ranges: bytes');
  header('Keep-Alive: ');
  readfile($file);
  ob_end_flush();
}
else{echo "does not exist: $file";}

?> 
