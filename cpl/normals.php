<?php
header('Content-Type: text/plain; charset=utf-8');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
date_default_timezone_set('America/Chicago');
$data = file_get_contents('Normals.txt');
$data = explode("\r\n",$data);
$type = $_GET['type'];
if($type == 1){
  foreach($data as $key => $line){
	echo "$line\n";
	if($key == 0){$sql = "UPDATE `TABLE 75` SET `e0`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 1){$sql = "UPDATE `TABLE 75` SET `ee`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 2){$sql = "UPDATE `TABLE 75` SET `e1`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 3){$sql = "UPDATE `TABLE 75` SET `e2`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 4){$sql = "UPDATE `TABLE 75` SET `e3`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 5){$sql = "UPDATE `TABLE 75` SET `e4`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 6){$sql = "UPDATE `TABLE 75` SET `e5`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 7){$sql = "UPDATE `TABLE 75` SET `e6`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 8){$sql = "UPDATE `TABLE 75` SET `off Scale Low E`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 9){$sql = "UPDATE `TABLE 75` SET `off Scale Hi E`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
  }
}

if($type == 2){
  $label = array('G Class 0 ','G Equiv   ','G Class 1 ','G Class 2 ','G Class 3 ','G Class 4 ','G Class 5 ','G Class 6 ','G OS High ','G OS Low  ' );
  foreach($data as $key => $line){
	echo "$label[$key] $line\n";
	if($key == 0){$sql = "UPDATE `TABLE 75` SET `g0`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 1){$sql = "UPDATE `TABLE 75` SET `ge`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 2){$sql = "UPDATE `TABLE 75` SET `g1`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 3){$sql = "UPDATE `TABLE 75` SET `g2`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 4){$sql = "UPDATE `TABLE 75` SET `g3`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 5){$sql = "UPDATE `TABLE 75` SET `g4`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 6){$sql = "UPDATE `TABLE 75` SET `g5`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 7){$sql = "UPDATE `TABLE 75` SET `g6`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 8){$sql = "UPDATE `TABLE 75` SET `off Scale Low G`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
	if($key == 9){$sql = "UPDATE `TABLE 75` SET `off Scale Hi G`='$line' WHERE `Rec No` = 1";$results = mysqli_query($link,$sql);}
  }
}




?>