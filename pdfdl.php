<?php
ob_start();
ob_clean();

  $file = "./abnG.pdf";

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
  
?> 
