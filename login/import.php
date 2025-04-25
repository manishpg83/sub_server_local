<?php

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$data = explode("\n",file_get_contents('restore.txt'));
foreach ($data as $line){
  list($accession,$last,$first) = explode('|',$line);//,$state,$zip,$email,$phone) = explode('|',$line);

echo "$accession,$last,$first<br>\n";  //,$state,$zip,$email,$phone<br>\n";
//$sql = "UPDATE `Patient` SET `address`='$address',`city`='$city',`state`='$state',`zip`=$zip,`phone`=$phone,`email`='$email' WHERE `Patient`=$accession";
$sql = "UPDATE `Patient` SET `Last` = '$last', `First`='$first'  WHERE `Patient`=$accession"; // `address`='$address',`city`='$city',`state`='$state',`zip`=$zip,`phone`=$phone,`email`='$email' WHERE `Patient`=$accession";
//echo "$sql";exit;
mysqli_query($link,$sql);

}


exit;



echo '<table>';
$data = explode("\n",file_get_contents('patient.txt'));
foreach ($data as $line){
list($accession,$collection,$volume,$physician) = explode('|',$line);
$sql = "UPDATE `Patient` SET `Collection`='$collection',`Volume`=$volume, `physician`= '$physician' WHERE `Patient`=$accession";
//echo $sql;exit;
mysqli_query($link,$sql);
echo <<<EOT
<tr><td>$accession</td><td>$collection</td><td>$volume</td><td>$physician</td></tr>
EOT;
}

?>