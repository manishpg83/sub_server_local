<?php
header('Content-Type: text/plain; charset=utf-8');

    $request = array();
    $request[] = "Host: www.realtor.com";
    $request[] = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,* / *;q=0.8";
    $request[] = "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0";
    $request[] = "Accept-Language: en-US,en;q=0.5";
    $request[] = "Connection: keep-alive";
    $request[] = "Cache-Control: no-cache";
    $request[] = "Pragma: no-cache";
  
$counties = array('Hillsborough-County_FL','Pasco-County_FL','Pinellas-County_FL','Polk-County_FL','Manatee-County_FL','Osceola-County_FL','Hardee-County_FL','Sarasota-County_FL','DeSoto-County_FL','Charlotte-County_FL','Glades-County_FL','Highlands-County_FL','Hendry-County_FL','Collier-County_FL');

foreach($counties as $county){echo "$county\n";
$url = "https://www.realtor.com/apartments/$county/type-single-family-home/price-na-2150/sqft-1250/available-na-08_31_2022";
echo "$url\n";
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_POST, false);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $request);
    curl_setopt($ch, CURLOPT_ENCODING,"");
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    curl_setopt($ch, CURLOPT_TIMEOUT,10);
    curl_setopt($ch, CURLOPT_FAILONERROR,true);
    curl_setopt($ch, CURLOPT_ENCODING,"");
    curl_setopt($ch, CURLOPT_VERBOSE, true);
    curl_setopt($ch, CURLINFO_HEADER_OUT, true);
    curl_setopt($ch, CURLOPT_HEADER, true);
    $data = curl_exec($ch);
//	var_export(curl_getinfo($ch));
//	echo  curl_error($ch);
    file_put_contents("$county.html",$data);
	
	$start = strpos($data,'{"props":{') ;
    $end = strpos($data,'</scr',$start); 
	if($end === false){echo "No End";exit; }
	$jsn = substr($data,$start,$end-$start);
    file_put_contents("$county.txt",$jsn);



}
















?>