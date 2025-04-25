<?php
header('Content-Type: text/plain; charset=UTF-8');
$decode = false;
foreach (getallheaders() as $name => $value) {
	if(strpos($value,'urlenc')){$decode = true;};
    echo "$name: $value\n";
}
echo "\nBODY\n";
$body = file_get_contents('php://input');
//if($decode){$body = urldecode($body);}
echo $body;

echo "\n\n\$_SERVER['QUERY_STRING'])\n";
echo urldecode($_SERVER['QUERY_STRING']);
echo "\n\nargv\n";
foreach($_SERVER['argv']as $key=>$value){
  echo "\n$key = " . urldecode($value) . "\n";
}
echo "\n\$_POST\n";
var_export($_POST);

echo "\n\$_GET\n";
var_export($_GET);

echo "\n\$_REQUEST\n";
var_export($_REQUEST);

echo "\n\$_FILES\n";
var_export($_FILES);
echo "\n\$_SERVER\n";
var_export($_SERVER);
exit;
/*
echo <<<EOT
<!DOCTYPE html> 
<html lang="en">
<head><title>TTT</title>
<meta name="viewport" content="width=265, initial-scale=1.0" />
<style></style></head><body><pre>

EOT;
file_get_contents('cipher.txt');
//list($ciphertext,$iv,$tag) = $_POST['cookie'];
list($iv,$tag,$text,$text2) = explode('|',file_get_contents('cipher.txt'));
echo "fgc=$iv,$tag,$text,$text2\n";
$siv = htmlspecialchars($iv,ENT_NOQUOTES);
$stag = htmlspecialchars($tag,ENT_NOQUOTES);
$div = base64_decode($iv);
$dtag = base64_decode($tag);

echo "iv=$iv siv=$siv div=$div tag=$tag stag=$stag dtag=$dtag\n";
//list($ciphertext,$iv,$tag) = 
$cipher ='aes-128-gcm';
$key = 'ab86d144,';

    $original_plaintext = openssl_decrypt($ciphertext, $cipher, $key, $options=0, $iv, $tag);
    echo "OTY:$original_plaintext\n";

echo "\n$original_plaintext\n";

*/
?>