<?

header('Content-Type: text/plain');
/*
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

echo "Ordered by Allergen Code\nIgE\tIgG\tIgG4\tDescription\n";
$sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `Code`";
$results = mysqli_query($link,$sql);
while (list($code, $description) = mysqli_fetch_array($results, MYSQLI_NUM)){
  echo "$code" . '1' . "\t$code" . '2' . "\t$code" . '3' . "\t$description\n";
}

echo "\n\nOrdered by Description\nIgE\tIgG\tIgG4\tDescription\n";
$sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `description`";
$results = mysqli_query($link,$sql);
while (list($code, $description) = mysqli_fetch_array($results, MYSQLI_NUM)){
  echo "$code" . '1' . "\t$code" . '2' . "\t$code" . '3' . "\t$description\n";
}
*/
$tabs = array('foods','food','pollen','environmental','chemicals');

$header =  array('Food by Category','Food Alphabetical','Pollens','Environmental','Chemicals');

foreach($tabs as $key => $tab){
  echo "\n\n$header[$key]\n";
  $file = '/home/amx/public_html/login/' . $tab . 'Base.jsn';
  $jsn = file_get_contents($file);
  $selected = json_decode($jsn,1);
  
  foreach($selected as $code => $types){
	if($types[0] == 5){echo "\n\n" . $selected[$code][4] . "\nIgE\tIgG\tIgG4\tDescription\n"; continue;}
    if(strlen($code) < 4){continue;}
	echo $code . "1\t" . $code . "2\t" . $code . "3\t" .  str_replace('&copy;-',' ', $selected[$code][4])  . "\n";
	$rast[$code] = str_replace('&copy;-',' ', $selected[$code][4]);
  }
}
ksort($rast);
echo "\n\nAll Allergtens Sorted by Code\n";
echo "IgE\tIgG\tIgG4\tDescription\n";
foreach($rast as $code => $description){
  echo "$code" . '1' . "\t$code" . '2' . "\t$code" . '3' . "\t$description\n";
}
asort($rast);
echo "\n\nAll Allergtens Sorted by Description\n";
echo "IgE\tIgG\tIgG4\tDescription\n";
foreach($rast as $code => $description){
  echo "$code" . '1' . "\t$code" . '2' . "\t$code" . '3' . "\t$description\n";
}

exit;

  $file = '/home/amx/public_html/login/pollenBase.jsn';
  $jsn = file_get_contents($file);
  $selected = json_decode($jsn,1);
  var_export($selected);










?>