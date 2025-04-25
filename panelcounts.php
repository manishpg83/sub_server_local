<?php
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$totals = array('','TIgE');
$panelTest = array();
$panels = array();
$notest = array();
$mixes = array('IZ17','EZ06','HZ05','EZ06','EZ04','EZ07','EZ12','FZ03','FZ11','FZ13','FZ16','GZ08','IZ17','MZ02','MZ15','TZ01','TZ13','TZ09','WZ16','WZ10');
$sql = "SELECT `description`,`number` FROM `Panels` WHERE 1";
$result = mysqli_query($link,$sql);
while (list($description,$panel) = mysqli_fetch_array($result, MYSQLI_NUM)){$panels[$panel] = $description;}
$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE 1";
$result = mysqli_query($link,$sql);
while (list($description,$panel) = mysqli_fetch_array($result, MYSQLI_NUM)){$panels[$panel] = $description;}
ksort($panels);
$err1 = 0;
foreach($panels as $panel => $description){
  $sql = "SELECT `code`,`type` FROM `PanelTests` WHERE `number` = '$panel' ORDER BY `sort`";
  $results = mysqli_query($link,$sql);
  $types = array(0,0,0,0);
  $total = 0;
  $mix = 0;
  while (list($code,$type) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if(substr($code,0,3) == '100'){$total = 1;continue;}
	$types[intval($type)]++;
	if(in_array($code,$mixes)){$mix++;}
  }
  $sql = "UPDATE `clientPanels` SET `e`=$types[1],`g`=$types[2],`g4`=$types[3],`total`=$total, `mixes` = $mix WHERE  `panel` = '$panel'";
  mysqli_query($link,$sql);  
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}

  $sql = "UPDATE `Panels` SET `e`=$types[1],`g`=$types[2],`g4`=$types[3],`total`=$total, `mixes` = $mix WHERE  `number` = '$panel'";                                       
  mysqli_query($link,$sql);  
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}
}
//echo "</table><hr><h2>err=$err1<br>Sorted by Panel Number</h2><table>";

$sql = "DELETE FROM `clientPanels` WHERE (`e` = 0 AND `g` = 0 AND `g4` = 0 AND `total` = 0) OR CHAR_LENGTH(`description`) = 0 ";
$result = mysqli_query($link,$sql);






exit;

$sql = "SELECT `description`,`panel` FROM `clientPanels` WHERE 1";
$result = mysqli_query($link,$sql);
while (list($description,$panel) = mysqli_fetch_array($result, MYSQLI_NUM)){$panels[$panel] = $description;}

//$sql = "SELECT `description`,`number` FROM `Panels` WHERE 1";
//$result = mysqli_query($link,$sql);
//while (list($description,$panel) = mysqli_fetch_array($result, MYSQLI_NUM)){$panels[$panel] = $description;}
$err1 = 0;
asort($panels);
foreach($panels as $panel => $description){
  $sql = "SELECT `code`,`type` FROM `PanelTests` WHERE `number` = '$panel' ORDER BY `sort`";
  $results = mysqli_query($link,$sql);
  $types = array(0,0,0,0);
  $total = 0;
  while (list($code,$type) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if(substr($code,0,3) == '100'){$total = 1;continue;}
	$types[intval($type)]++;
  }
  
  if($types[1] + $types[2] + $types[3] > 0){
    echo "<tr><td>$panel</td><td>$description </td><td class=\"ige\">$types[1]</td><td class=\"igg\">$types[2]</td><td class=\"igg4\">$types[3]</td><td>$totals[$total]</td></tr>\n";
    $sql = "UPDATE `clientPanels` SET `e`=$types[1],`g`=$types[2],`g4`=$types[3],`total`=$total WHERE  `panel` = '$panel'";
    mysqli_query($link,$sql);  }
    if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}
}
//echo "</table><hr><h2>err=$err1<br>Sorted by Panel Number</h2><table>";

ob_flush();


ksort($panels);
foreach($panels as $panel => $description){
  $sql = "SELECT `code`,`type` FROM `PanelTests` WHERE `number` = '$panel' ORDER BY `sort`";
  $results = mysqli_query($link,$sql);
  $types = array(0,0,0,0);
  $total = 0;
  while (list($code,$type) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if(substr($code,0,3) == '100'){$total = 1;continue;}
	$types[intval($type)]++;
  }
  if($types[1] + $types[2] + $types[3] > 0){
  //  echo "<tr><td>$panel</td><td>$description </td><td class=\"ige\">$types[1]</td><td class=\"igg\">$types[2]</td><td class=\"igg4\">$types[3]</td><td>$totals[$total]</td></tr>\n";
  }
  else{
    $notest[$panel] = $description;
  }
}
echo '</table><hr><h2>Panels with No Tests</h2><table>';
foreach($notest as $panel => $description){
  echo "<tr><td>$panel</td><td>$description </td></tr>\n";
}
?>


















