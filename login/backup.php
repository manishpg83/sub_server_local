<?

$date = date('ymdHi',time());
$files = [];
$files[] = 'index';
$files[] = 'addon';
$files[] = 'profile';
$files[] = 'panels';
$files[] = 'selections';
$files[] = 'review';
$files[] = 'request';
$files[] = 'printRequest';
$files[] = 'hidden';
foreach($files as $filename){
  copy("/home/amx/public_html/login/$filename.php","/home/amx/backup/$filename$date.php");
}

?>