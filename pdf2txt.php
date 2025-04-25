<?php
header('Content-type: text/plain');
include('/home/amx/php/class.pdf2text.php');
$a = new PDF2Text();
$a->setFilename('B&W to Searchable PDF_2020-02-29_1.PDF');
$a->decodePDF();
$data = $a->output();
echo $data;
?>