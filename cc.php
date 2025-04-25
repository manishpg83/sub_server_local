<?php
header('Content-Type: text/plain; charset=utf-8');
$client = $_GET['c'];
$patient = $_GET['p'];
echo "$client, $patient\n";
//exit;
//$args = $_SERVER['argv'];
$src = '1615-599-4444';  //$args[1];
$dst = $_GET['n'];  //'1615-599-4648';  //$args[2];
$filename = $_GET['f'];  
echo "$dst\n";
//$dst = '1615-599-4648';  //$args[2];
if(strlen($filename) > 0){
  $file = $filename;
}
else{
  $file = 'z:\ResultsNoEncrypt\\' . $client . '/fax.PDF'; //$args[3];
}
$username = "Allermetrix";
$company = "91075";
$password = "Allermetrix510!";
$tagname="From Allermetrix";
$tagnumber="1615-599-4648";

$fh = fopen($file, "r");
$data = fread($fh, filesize($file));
fclose($fh);
echo "\nPDF Size=" . number_format(strlen($data)) . "\n";
$b64data = base64_encode($data);
unset($data);
echo "b64 Size=" . number_format(strlen($b64data)) . "\n";
$post_data = "username=$username&company=$company&password=$password&";
$post_data .= "callerid=$src&faxno=$dst&recipname=$patient, $client&operation=sendfax&";
$post_data .= "tagname=$tagname&tagnumber=$tagnumber&faxfilenames[0]=$file&";
$post_data .= "faxfiledata[0]=$b64data";

echo "Post Size=" . number_format(strlen($post_data)) . "\n";

$url = "https://api.faxage.com/httpsfax.php";
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
curl_setopt($ch, CURLOPT_ENCODING,"");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLINFO_HEADER_OUT, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_FILETIME, true);
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 100);
curl_setopt($ch, CURLOPT_VERBOSE, true);
curl_setopt($ch, CURLOPT_AUTOREFERER, true);
curl_setopt($ch, CURLOPT_TIMEOUT,100);
curl_setopt($ch, CURLOPT_FAILONERROR,true);

$data = curl_exec($ch);
if (curl_errno($ch)){
  $data .= 'Base Page Error: ' . curl_error($ch);
}
else {
  $headerSize = intval(curl_getinfo($ch, CURLINFO_HEADER_SIZE));
  $responseHeader = substr($data,0,$headerSize);
  $data = substr($data,$headerSize);
  $info = var_export(curl_getinfo($ch),true);
}
//echo "\nResponse=" . $data;
//echo "\n\nResponse Header=\n" . $responseHeader;
//echo "\n\nCurl Info Array=" . $info;


?>