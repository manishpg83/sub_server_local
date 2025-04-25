<?

//$host = "72.167.220.227/home/amx/public_html/";$username = "amx";$password = "xD1GkuK7a7DK8!";

//$host = "44.235.72.131/ResultsInbound/";$port = 22;$username = "Allermetrix01";$password = "All3rm3tr1x#";
$host = "44.235.72.131/OrdersOutbound/";$port = 22;$username = "Allermetrix01";$password = "All3rm3tr1x#";
date_default_timezone_set('America/New_York');
$time =  date("F j, Y, g:i a");

//$host = "72.000.000.111/home/amx/public_html/";$username = "user";$password = "pass!";

$url = "sftp://@$host";
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_PROTOCOLS, CURLPROTO_SFTP);
curl_setopt($ch, CURLOPT_DIRLISTONLY, '1L');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
curl_setopt($ch, CURLOPT_TIMEOUT,10);
curl_setopt($ch, CURLOPT_FAILONERROR,true);
curl_setopt($ch, CURLOPT_VERBOSE, true);
//curl_setopt($ch, CURLOPT_QUOTE, array("rm " . escapeshellarg("/ResultsInbound/testResult.hl7")));
curl_setopt($ch, CURLOPT_QUOTE, array("rm " . escapeshellarg("/OrdersOutbound/allermetrixorders.txt2023-03-28")));
$response = curl_exec($ch); 
$error = curl_error($ch);
curl_close($ch);
echo "error: $error<br>\n";
echo "response <PRE>$response<br>";
echo "$time<br>";
//echo $url;
//$url = "sftp://$username:$password@$host";
?>
