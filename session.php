<?php 
$d =  date('DMjYHisa') .  microtime(true);
$seed = $_SERVER['REMOTE_ADDR'] . $d;
$sid = substr(hash('ripemd320',$seed),1,16);
     $oldSID = session_name();
     session_cache_limiter('private');
     session_cache_expire(5);
     session_name('amxs');
      session_id($sid);
     session_start( );
     $id = 200013;
     setcookie("amxc", $id,time()+900);     
    echo 'Old SID ID: ' . $oldSID;
    echo '<br/>Session ID: ' . session_id();
echo '<br/>Session Globals: ';
print_r($_SESSION);
$params = array();
$parms = session_get_cookie_params();
echo '<pre>';
print_r($parms); 
echo '</pre>';
echo 'Session Name: ' . session_name();

?> 