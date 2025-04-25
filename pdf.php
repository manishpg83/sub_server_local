<?php
ob_start();
ob_clean();

$c = $_COOKIE['amxc'];
settype($c,"integer");
if (is_numeric($c) && $c > 99999 && $c < 1000000) {
  setcookie("amxc", $c,time()+900);
  $p = $_GET['p'];
  $filename = "$p" . 'e.PDF';
  $file1 = "/home/amx/Z/ResultsNoEncrypt/$c/$filename";
  $file2 = "/home/amx/Z/Results/$c/$filename";
  $filename = "$p" . 's.PDF';
  $file3 = "/home/amx/Z/ResultsNoEncrypt/$c/$filename";
  $file4 = "/home/amx/Z/Results/$c/$filename";
  if (file_exists($file1)){
    $file = $file1;
  }
  elseif (file_exists($file2)){
    $file = $file2;
  }
  elseif (file_exists($file3)){
    $file = $file3;
  }
  elseif (file_exists($file4)){
    $file = $file4;
  }
  else {
    $file = './NotFound.pdf';
    $notFound = true;
  }
 


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
  if ($notFound == true ) {
    $fp = fopen('pdfs.txt','a+');
    fwrite($fp,"\n##########################\n" . $_SERVER['REMOTE_ADDR'] . "\n" . date('M j Y g:ia',time()) . "\n" . $file1 . "\n" . $file2 . "\n" . $file3 . "\n" . $file4 . "\n" );
    fclose($fp);
  }
  exit;
}
else {
  $expired = true;
  include('/home/amx/public_html/index.php');
}
?> 
