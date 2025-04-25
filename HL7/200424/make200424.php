<?
header('Content-Type: text/plain; charset=UTF-8');
$x = 0;
//$entry = '0';
chdir("/home/amx/serolab/orders/");
$d = dir(".");
while (false !== ($entry = $d->read())) {
  if ($entry == '..'){continue;}
  if ($entry == '.'){continue;}
  if ($entry == 'back'){continue;}
  if ($entry == 'error_log'){echo "ERROR: error_log\n";exit;}
  $orders[] = $entry;
  copy("/home/amx/serolab/orders/$entry","/home/amx/HL7/200424/Orders/$entry");
  echo "$x => copy('/home/amx/serolab/orders/$entry','/home/amx/HL7/200424/Orders/$entry')\n";
  $x++;
}
chdir("/home/amx/HL7/200424/Orders/");
$cnt = count($orders);
echo "$x Orders = $cnt\n";
$x = 0;
foreach($orders as $z => $entry){
  $d = dir(".");
  $x++;
//  if($x > 3){exit;}
  if(strlen($entry) < 8){echo "Not Found; " . $entry; exit;}
  if (file_exists("/home/amx/HL7/200424/Orders/$entry")) {
    unlink("/home/amx/serolab/orders/$entry");
  }
  else{
    echo "/home/amx/HL7/200424/Orders/$entry Not Deleted\n";
    exit;
  }
}
chdir("/home/amx/HL7/200424/");
echo "Going to readHL7\n";
include('/home/amx/HL7/200424/readHL7.php');
?>
