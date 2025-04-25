<?


date_default_timezone_set('America/New_York');
$time =  date("F j, Y, g:i a");


$host = "44.235.72.130/OrdersOutbound/allermetrixorders.txt2023-03-28";$password = "All3rm3tr1x#";$username = "Allermetrix01";$port = 22;
//$host = '72.167.220.227/home/amx/public_html/HL7';$username = "amx";$password = "xD1GkuK7a7DK8!";
//
//$password = "xD1GkuK7a7DK8!";
//';

//$host = "173.162.23.21/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/OrdersOutbound/";
//$url = 'sftp://' .  $username . ':' . $password  . "@$host" . '/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/OrdersOutbound/' . '/';
//$url = 'sftp://' .  $username . ':' . $password  . "@$host:$port" . "/OrdersOutbound/allermetrixorders.txt2023-03-28";
$url = "sftp://$username:$password@$host";
$ch = curl_init($url);
//curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_PROTOCOLS, CURLPROTO_SFTP);
//curl_setopt($ch, CURLOPT_DIRLISTONLY, '1L');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
//CURLOPT_CONNECTTIMEOUT 
curl_setopt($ch, CURLOPT_TIMEOUT,10);
curl_setopt($ch, CURLOPT_FAILONERROR,true);

curl_setopt($ch, CURLOPT_VERBOSE, true);
$response = curl_exec($ch); 
$error = curl_error($ch);
curl_close($ch);
echo "Error: $error<br>\n";
echo "response $response<br>";
echo "$time<br>";
echo $url;
exit;



?>