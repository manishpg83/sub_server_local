<?php

echo "Checking PDFs<br>\n";
include('/home/amx/Z/movePDF.php');
$data = file_get_contents('/home/amx/Z/check.txt');
$data = str_replace(' ','',$data);
$data = explode('|',$data);
foreach($data as $file){
  $found = "<span style=\"color:#f00;font-weight:bold;\" >&#9785;";
  if(file_exists($file)){
     $found = "<span>&#10004;";
  }
  echo "$found $file</span><br>\n";
}
?>