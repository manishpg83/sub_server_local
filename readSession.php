<?php session_name('amxs');
session_start();
  $id = $_COOKIE['amxc'];
echo '<br/>Session ID: ' . session_id();
echo '<br/>Session Globals: ';
print_r($_SESSION);
$params = array();
$parms = session_get_cookie_params();
echo '<pre>';
print_r($parms); 
print_r($_SERVER);
echo '</pre><br/>Request: ';
print_r($_REQUEST);

echo '</pre>';
$cache_expire = session_cache_expire();   
echo '<br/>Expires: ' . $cache_expire ;

$cache_limiter = session_cache_limiter();
echo '<br/>Limiter: ' . $cache_limiter;
echo "\n id=" .  $id;
?> 