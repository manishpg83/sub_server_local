<?php
header('Content-Type: text/plain; charset=utf-8');


$string = <<<XML
<?xml version='1.0'?> 
<document>
 <title>Forty What?</title>
 <from>Joe</from>
 <to>Jane</to>
 <body>
  I know that's the answer -- but what's the question?
 </body>
</document>
XML;

$xml = simplexml_load_string($string);
var_export($xml);echo "\n\n\n";
$xml = json_encode($xml);
var_export($xml);echo "\n\n\n";
$xml = json_decode($xml, true);
var_export($xml);
exit;







$trans = array(false=>0,true=>1);
echo $trans[ini_get('browscap')];
echo ini_set('browscap',"/home/amx/php/browscap.ini")  ;

if (!ini_get('browscap')) {
 echo 'ini not found';
    // Not set, use other custom func to detect browser:
  //  $browser = get_browser_manually();
} else {
 echo 'ini found';
    // Browsecap.ini was set, use it:
    $browser = get_browser(null, true);
}


echo $_SERVER['HTTP_USER_AGENT'] . "\n\n";
$browser = get_browser(null, true);
print_r($browser);
print_r(ini_get_all());
?>


?>