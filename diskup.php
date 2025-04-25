<?php ob_start(NULL,11,PHP_OUTPUT_HANDLER_FLUSHABLE);
header('Content-Type: text/plain; charset=utf-8');
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
mysql_select_db('amx_portal');
include('/home/amx/php/class.pdf2text.php');
$a = new PDF2Text();
$ndx = 0;
$checked = 0;
$missingPDF = 0;
$checkPDF = 0;
 $sql = "SELECT `Client`,`Patient` FROM `Patient` WHERE `Patient` > 145000 AND `Status` = 'C' AND `PDF` = 0 ORDER BY `Patient` ASC";
 $results = @mysql_query($sql);
while ($row = mysql_fetch_array($results , MYSQL_NUM)){
  set_time_limit ( 65535 );
  $search = $row[1];
  if ($row[0] > 199999) { 
    $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]e.PDF";
  }
  else {
    $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]s.PDF";
  }
  if (!file_exists ( $pdf)){
    $date = strtotime($row[2]);
    $missingPDF += 1;
    echo "nf: $row[1]\n";
    ob_flush();
  }
  else{
    $checkPDF++;
    $a->setFilename($pdf);
    $a->decodePDF();
    $data = $a->output();
    $len = strlen($data);
    $pos = strpos($data,$search);
    if (pos){
       $checked++;
	   $sql = "UPDATE `Patient` SET `PDF`= 1 WHERE `Patient`= $row[1]";
	   mysql_query($sql);
	   
     }
     else{
	     echo "wp: $row[1]\n";
		 ob_flush();
       $missingPDF += 1;
     }
  }
}
echo "$checkPDF PDFs checked, $checked OK\n";
ob_end_flush();


?>
