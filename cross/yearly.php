<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Top Allergens</title>
<style>
body{font:400 1em Arial,sans-serif;}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table{break-after: always;}
td{padding:0 4px 0 4px;}
.black{color:#000;}
.blue{color:#00f;}
.green{color:#05a011;font-weight:700;}
.orange{color:#ff4b09;font-weight:700;}
.red{color:#f00;font-weight:700;}
.center{text-align:center;}
.right{text-align:right;}
.col{width:45%;float:left;}
.ore{text-align:right;padding: 0 10px 0 0;}
input[type="date"]{font:400 20px Arial;width:130px;}
input[type="number"]{font:400 20px Arial;width:60px;text-align:center;margin:0 0 0 0;}
button{color:#fff;font:400 1.2em Arial;width:200px;margin: 10px 10px 10px 10px;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
.float{float:left;margin:0 0 0 10px;}
</style><body>

EOT;
ob_flush();
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$jsn = file_get_contents('dates.jsn');
$dates = json_decode($jsn,1); 
if(strlen($start) < 8){$start = '2021-01-01';}
if(strlen($end) < 8){$end = '2021-12-31';}
if(strlen($start2) < 8){$start2 = '2020-01-01';}
if(strlen($end2) < 8){$end2 = '2020-01-01';}
$t = microtime(1);
$startdate = strtotime($start);
foreach($dates as $time => $accession1){
  if($time >= $startdate ){break;}
}
echo microtime(1) - $t . "<br>\n";
$t = microtime(1);
$enddate = strtotime($end);
foreach($dates as $time => $accession2){
  if($time >= $enddate ){break;}
}
echo microtime(1) - $t . "<br>\n";

$t = microtime(1);
$startdate = strtotime($start);
foreach($dates as $time => $accession1){
  if($time >= $startdate ){break;}
}
echo microtime(1) - $t . "<br>\n";
$t = microtime(1);
$enddate = strtotime($end);
foreach($dates as $time => $accession2){
  if($time >= $enddate ){break;}
}
echo microtime(1) - $t . "<br>\n";
echo count($dates) . "<br>\n";
var_export($dates);

/*
SELECT `Patient`,`Date` FROM `Patient` 
WHERE `Date` > '2021-12-31'AND `Patient`<300000
ORDER BY `Date` ASC
LIMIT 1

SELECT `Patient`,`Date` FROM `Patient` 
WHERE `Date` < '2021-01-01'AND `Patient`<300000
ORDER BY `Date` DESC ,`Patient`
LIMIT 1

*/









?>