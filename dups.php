<?php
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');




$ndx = 0;
$sql = "SELECT `rec`,`Date`,`Client`,`Status`,`Patient` FROM `Patient` WHERE 1 ORDER BY `Patient` , `Client`";
$results = mysqli_query($link,$sql);
while(list($rec,$Date,$Client,$Status,$Patient) =  mysqli_fetch_array($results, MYSQLI_NUM)){
//echo "$rec,$Date,$Client,$Patient<br>\n";
//echo "$Date == $savDate &&  $Client == $savClient && $Patient == $savPatient<br>\n";


  if($Date == $savDate &&  $Client == $savClient && $Patient == $savPatient && $Status == $savStatus){
	$sql = "DELETE FROM `Patient` WHERE `rec` = $rec";
    $ndx++;
	mysqli_query($link,$sql);
	echo "$ndx: $Date == $savDate &&  $Client == $savClient && $Patient == $savPatient && $Status == $savStatus => $sql<br>\n";
  }
	$savDate = $Date;  
	$savClient = $Client;
	$savPatient = $Patient;
	$savStatus = $Status;

}




exit;












$sql = "SELECT `Patient`,COUNT(*) AS CNT FROM `Patient` WHERE 1  GROUP BY `Patient` ORDER BY `CNT` DESC ";
$results = mysqli_query($link,$sql);
while(list($accession,$count) =  mysqli_fetch_array($results, MYSQLI_NUM)){$patient[$accession] = $count;}


foreach($patient as $accession => $count){
$sql = "SELECT `Date`,`Client`,`Patient`,`Status`,`First`,`Last` FROM `Patient` WHERE `Patient`=$accession ";
$results = mysqli_query($link,$sql);
echo "<br>\n";
while(list($Date,$Client,$Patient,$Status,$First,$Last) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $date = date('D M j',strtotime($Date));
  echo "$count $accession $count $date, $Client, $STATUS[$Status],  $First $Last<br>\n";
}





$ndx++;
if($ndx == 500){exit;}
}

exit;

$STATUS = array(
'C' => 'COMPLETE',
'X' => 'VOID',
'H' => 'HOLD',
'Q' => 'QNS',
'W' => 'WORKPOOL',
'V' => 'VERIFIED',
'I' => 'SENDOUT',
'' => 'BLANK',
'L' => 'LOGIN');


$ndx = 0;




$sql = "SELECT `Date`,`Client`,`Patient`,`Updated`  FROM `Patient` WHERE `Last` ='' AND `First`= '' ORDER BY `Client`,`Patient`";
$results = mysqli_query($link,$sql);
while(list($Date,$Client,$Patient,$Updated) =  mysqli_fetch_array($results, MYSQLI_NUM)){
echo "  $Date | $Client | $Patient | $Updated<br>\n";

}
exit;



exit;











/*
$dbc=mysqli_connect('localhost','amx_amx','xD1GkuK7a7DK82');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysqli_connect('localhost','amx_allermetrix',$data);
echo  mysqli_errno($dbc) . ', ' . mysql_error() . "\n<br>\n";
mysqli_select_db($dbc,'amx_test');
echo  mysqli_errno($dbc) . ', <br>' . mysql_error() . "\n<br>\n";

$sql = "SELECT `patient`,`code`, `type`,COUNT(*) as cnt, GROUP_CONCAT(`patient`,`code`,`type`) AS ids
FROM test
GROUP BY `patient`, `code`, `type`
HAVING cnt > 1";
$results = mysqli_query($dbc,$sql);
echo 'query: ' . mysqli_errno($dbc) . ', ' . mysql_error();
while(list($patient,$code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){
echo "$patient,$code,$type<br>";
}
*/
?>