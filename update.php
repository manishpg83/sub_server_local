<!DOCTYPE html>



<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>amx Update</title>
<style>body{font-size:.9em;margin-left:.7em;font-weight:400;background:#333;color:#fff} p{padding:0;margin:0;}.green{color:#0f0;}
.red{color:#f00;margin-top:0;}.yellow{color:#ff0;}
.sm{font-size:.6em;color:#000}
.bold{font-weight:700;}
.big{font-size:1.5em;}
.i{color:#f80;margin-left:.7em;font-size:1em;}
.w{color:#0f9;margin-left:.7em;font-size:1em;}
.v{color:#ff0;margin-left:.7em;font-size:1em;}
.c{color:#3bf;margin-left:.7em;font-weight:400;font-size:1em;}
.O{color:#FFF;margin-left:1em;font-family:Times,serif;font-size:1em;}
.times{font-family:Times,serif;}
.norm{font-weight:400;}
.inline{display:inline;}
#pdf,.hide{display:none;}
.link{display:inline;font-weight:700;background:#49f;text-align:center;padding:2px;border:0;margin:4px;}
.link:hover{background:#f00;color:#fff;}
h3{font:1em bold arial;margin:0;padding:0}
.err{font:1em bold arial,sans-serif; color:#f00;margin-bottom:0;padding:0;}
.warn{font:700 1em arial,sans-serif; color:#0ff;}
#page{color:#fff;}
pre {margin-top:0;}
</style>
<body><div id="page"><pre>
<?php
echo '<h2>TAKEN OUT OF SERVICE SEPT 17, 2022 REPLACED WITH importupdate.php</h2>';
exit;
set_time_limit (600);
date_default_timezone_set('America/Menominee');
$data = system('ls -R /home/amx/Z/ResultsNoEncrypt > /home/amx/Z/ls.txt');
$recs = 0;
$errors = 0;5
$recErrors = array();
$cnt = array('I'=>0,'U'=>0);
$fp = fopen("/home/amx/Z/buData/amxUpdate.SQL","r");
if ($fp ) {
  $data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php'); 
  $link = mysqli_connect('localhost','amx',$data,'amx_portal');
  $sql = "SET time_zone = '-5:00';";
  mysqli_query($link,$sql);
  $types = array('','INSERT:','UPDATE:');
  $class[0] = 'class="yellow"';
  $class[1062] = 'class="yellow"';
  

  while (($text= fgets($fp , 4096)) !== false) {
    $sql = str_replace('INSERT INTO','INSERT IGNORE INTO',$text);
    $recs  += 1;
    $results = mysqli_query($link,$sql);
	$str = substr($sql,0,1);
	$affected = mysqli_affected_rows($link);
	$cnt[$str] += $affected;
	echo "affected = $affected $sql";
  }
}
echo '</div>';
$recs /= 2;
//echo $show;
  echo "<p><br>RECS: $recs INSERTS: " . $cnt['I'] . ", UDATES: " . $cnt['U'] . "<br><br> \n"; 
  if ($errors > 0){echo "<h2 class=\"red\" onclick=\"showUpdate()\">$errors Update Errors</h2>";}
  $sql='INSERT INTO `amx_portal`.`Updates` (`TimeStamp`, `Message`) VALUES ( CURRENT_TIMESTAMP ,"RECS: $recs INSERTS: ' . $cnt['I'] . ', UDATES: ' . $cnt['U'] . ' )';
  mysqli_query($link,$sql);
$update = true;

include('/home/amx/Z/movePDF.php');
include('/home/amx/public_html/disk.php');
?>
