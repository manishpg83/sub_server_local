<?

header('Content-Type: text/plain; charset=utf-8');



$id = 500258;
//$filename = $_GET["filename"];
//$filename =  date('Ymd') . '.hl7';
//$localfile = "/home/amx/HL7/500258/Results/$filename";
$file = "testResult.hl7";
//$host = "44.235.72.131/ResultsInbound/$filename";$port = 22;$username = "Allermetrix01";$password = "All3rm3tr1x#";
$host = "72.167.220.227/home/amx/public_html/HL7/500258/";$username = "amx";$password = "xD1GkuK7a7DK8!";
date_default_timezone_set('America/New_York');
$time =  date("F j, Y, g:i a");
//$fp = fopen($localfile, 'r');
$url = "sftp://@$host";
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_PROTOCOLS, CURLPROTO_SFTP);
//curl_setopt($ch, CURLOPT_INFILE, $fp);
//curl_setopt($ch, CURLOPT_INFILESIZE, filesize($localfile));
//curl_setopt($ch, CURLOPT_UPLOAD, 1);

curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");

curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
curl_setopt($ch, CURLOPT_TIMEOUT,10);
curl_setopt($ch, CURLOPT_FAILONERROR,true);
curl_setopt($ch, CURLOPT_VERBOSE, true);



curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_QUOTE, array("DELE testDelete.txt")); 

$response = curl_exec($ch); 
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$error = curl_error($ch);
curl_close($ch);
echo "error: $error\n";
echo "httpCode: $httpCode\n";
echo "response  $response\n";
echo "$time<br>";







?>