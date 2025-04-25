<?php

echo '<pre>';
    //  $fp = fopen('/home/amx/Z/ls.txt', "w+");
//echo system('ps auxww');
$data = system('ls -R /home/amx/Z/ResultsNoEncrypt > /home/amx/Z/ls.txt');

    //  fwrite($fp,$data);
	//.  fclose($fp);


?>