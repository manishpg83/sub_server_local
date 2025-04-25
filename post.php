<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
echo <<<EOT
<!DOCTYPE HTML>
<html lang="en"><head><title>CPL Patient Verify</title>
<meta name="viewport" content="width=1200, initial-scale=1.0" />
<style>
body {font:700 1.2em Arial;}
td,tr {border: 1px solid black;padding:4px;}
.mono{font-family:courier, courier new, serif;padding:0;margin:0;white-space: nowrap;}
h3{margin-bottom:0;}
h4{margin:0 0 .5em 0;}
table{margin-left:5em;}
p{margin:0 0 0 5em;}
.red{color:#f00;}
</style></head><body>

EOT;
$text = '';
$overwrite = 0;
$types = array('','IgE','IgG','IgG4');
$id = $_GET['id'];
$assession = $_GET['assession'];

$sql = "SELECT  COUNT(*),`accession`,`jsn` FROM `orders` WHERE `id`='$id'";
$results = mysqli_query($link,$sql);
if(mysqli_errno($link)){ echo  "err1: " . mysqli_error($link) . "\n$sql\n";}
list($cnt,$patient,$jsn) = mysqli_fetch_array($results, MYSQLI_NUM);
if(mysqli_errno($link)){ echo  "err2: " . mysqli_error($link) . "\n";}
if($cnt == 1){
  if($patient == 0){
    $sql = "UPDATE `orders` SET `accession`=$assession WHERE `id`='$id'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ 
      echo  "<h2>Record Not Updated: " . mysqli_error($link) . "</h2>\n$sql\n";
    }
  }
  elseif($accession != $patient){
    $text = "<h3 class=\"red\">ERROR: Attempt to Overwrite accession: $patient with $assession for Record $id</h3>";
	$overwrite = 1;
  }
}
$selections = json_decode($jsn,1);

foreach($selections as $code){
  echo "$code<br>\n";

}





?>




























