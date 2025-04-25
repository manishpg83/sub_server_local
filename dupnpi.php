<?
header("Content-Type:text/html");
echo "<html><head><title></title><style>button,form{margin:0;display:inline-block;}.blue{color:#00f;font-weight:700;}</style></head><body>";
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$sql = "SELECT `client`,`npi`, COUNT(*) FROM `physicians` GROUP BY `client`,`npi` HAVING COUNT(*) > 1 ";
$results = mysqli_query($link,$sql);
while(list($client,$npi) =  mysqli_fetch_array($results, MYSQLI_NUM)){$npis[] = $npi;}
ksort($clients);

foreach($npis as $npi){
  $sql = "SELECT `client`,`npi`, `physician`, `first`, `last` FROM `physicians` WHERE `npi`=$npi ORDER BY `npi`";
  $results = mysqli_query($link,$sql);
  list($client, $npi, $physician, $first, $last) =  mysqli_fetch_array($results, MYSQLI_NUM);
  echo "<form action=\"https://npiregistry.cms.hhs.gov/api/?version=2.1&number=$npi\" method=\"get\" target=\"_blank\"><input type=\"hidden\" name=\"version\" value=\"2.1\" ><input type=\"hidden\" name=\"number\" value=\"$npi\" ><button>$npi</button></form>";

  $ch = curl_init("https://npiregistry.cms.hhs.gov/api/?version=2.1&number=$npi");
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
  $result = curl_exec($ch);
  $json = json_decode($result,1);
  echo $json['results'][0]['addresses'][0]['address_1'] . ', ';
  echo $json['results'][0]['addresses'][0]['city'] . ', ';
  echo $json['results'][0]['addresses'][0]['state'] . ', ';
  echo $json['results'][0]['basic']['first_name'] . ', ';
  echo $json['results'][0]['basic']['last_name'] . ', ';
  echo $json['results'][0]['basic']['credential'] . ', ';
  echo $json['results'][0]['taxonomies'][0]['desc'] . "<br>\n";

  $sql = "SELECT `Name`, `Address`,`City`,`State` FROM `Client` WHERE `Number`=$client";
  $result = mysqli_query($link,$sql);
  list($clientname,$address,$city,$state) = mysqli_fetch_array($result, MYSQLI_NUM);
  $sql = "SELECT COUNT(*) FROM `Test` WHERE `Client`=$client AND `Patient`> 230000";
  $result = mysqli_query($link,$sql);
  list($cnt) = mysqli_fetch_array($result, MYSQLI_NUM);
  echo "$client, $cnt <span class=\"blue\">$clientname, $address, $city $state, Phy: $physician</span>, First: $first, Last: $last<br>\n";  
  while(list($client, $npi, $physician, $first, $last) =  mysqli_fetch_array($results, MYSQLI_NUM)){
	$sql = "SELECT `Name`, `Address`,`City`,`State` FROM `Client` WHERE `Number`=$client";
	$result = mysqli_query($link,$sql);
	list($clientname,$address,$city,$state) = mysqli_fetch_array($result, MYSQLI_NUM);
  $sql = "SELECT COUNT(*) FROM `Test` WHERE `Client`=$client AND `Patient`> 230000";
  $result = mysqli_query($link,$sql);
  list($cnt) = mysqli_fetch_array($result, MYSQLI_NUM);
  echo "$client, $cnt <span class=\"blue\">$clientname, $address, $city $state, Phy: $physician</span>, First: $first, Last: $last<br>\n";  
  }
  echo "<br>\n";
}



exit;






$sql = "SELECT `client`,`npi`, COUNT(`npi`) FROM `physicians` GROUP BY `client` HAVING COUNT(`npi`) > 1 ";
$results = mysqli_query($link,$sql);
while(list($client,$npi,$cnt) =  mysqli_fetch_array($results, MYSQLI_NUM)){$npis[$npi] = "$client $npi $cnt";echo "$client $npi\n";}
asort($npis);
var_export($npis);
?>