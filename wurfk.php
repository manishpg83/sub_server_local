<?php ob_start();
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=3600');
header('Vary: Accept-Encoding');

$t = microtime(1);
echo <<< EOT
<!DOCTYPE html>
<html lang="en">
<head>
<title>Validations </title>
<style type="text/css">
body{-ms-text-size-adjust:100%;text-align:left;background:#111;font:400 1em Arial,sans-serif;color:#ffe;width:100%;padding:2% 0 0 2%;margin:0;}
a,a:link,a:visited,a:hover{text-decoration:none;color:#ffe;}
.cntr{text-align:center;}
.left{text-align:left}
.right{text-align:right}
.chk {overflow:visible;cursor:pointer;border:0;background:#2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align: center;-ms-text-size-adjust:100%;}
.btn {overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
.num {display:inline-block;width:6em;text-align:center;overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #0f0;color: #000;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #ffe;outline:2px solid #ffe;color:#aaa;margin:1px;vertical-align: middle;position: relative;}
input[type="text"]{width:90%;font:700 .8em Arial,sans-serif;}
.reg{font:400 .8em Arial,sans-serif;}
.emp{font:700 1.2em Arial,sans-serif;padding:0;margin:0;}
h3,h2{margin:4px 0 0 0;}
p{margin:4px 0 0 0;}
.text{width:400px;}
.red{color:#f00;font-weight:700;padding:0;margin:0;}
.grn{color:#0f0;padding:0;margin:0;}
.yellow{color:#ff0;}
.note{font:400 .8em Arial,sans-serif;}
#html,#css{display:none;}
.small{font-size:.8em;}
.nopad{padding:0;}
.link{text-align:left;}
th{font-size:.9em;text-align:center;}
td{text-align:right;padding:0 4px 0 4px;}
tr{font-size:.8em;padding:0 8px 0 4px;}
#h,#s,#x{display:none;}
#h,#he,#s,#se{width:16em;}
#t{font:700 1.3em Arial,sans-serif;}
.line,.col{text-align:left;width:8px;}
.cap{margin-left:2em;}
.pcap{color:#0ff;font-weight:700;}
</style></head><body>
EOT;
set_time_limit(25);
//phpinfo(); 
ob_flush();
ini_set('memory_limit','1024M');
ob_flush();
$display['resolution_width'] = 0; 
$display['resolution_height'] = 1;

$phones = array();
$len = strlen($xurl);
 $xml = simplexml_load_file('/home/amx/public_html/wurfl.xml');
$ndx = 0;
$resolution = array();
foreach($xml->devices->device as $device){
  $ua = (string)$device['user_agent'];
  if (substr($ua,0,8) == 'DO_NOT_M'){continue;}
  $id = (string)$device['id'];
//  $unit =  "<hr><h3>&#x2003;<br>$ndx UA: $ua  id: $id</h3>  ";
  
  foreach($device->group as $group){
    $groupname = (string)$group['id'];
	if ($groupname != 'display'){continue;}
    foreach($group->capability as $cap){
      $capname = (string)$cap['name'];
      $val = (string)$cap['value'];
	  $resolution[$display[$capname]] = $val;
 //     echo "<p>$index <span class=\"pcap\">$capname</span> = $val</p>" ;
    }
    $phones[$ua] = array($resolution[0],$resolution[1]);
    $phones[$id] = array($resolution[0],$resolution[1]);
	continue;
	$grp = get_object_vars($group );
	echo '<pre>display: ';
	 print_r($grp); 
	 echo 'GROUP:</pre>';
	 $capability = $grp['capability'][0]->name;
	echo '<pre>CAPABILITY: ';
	 print_r($capability); 
	 echo '</pre>';
	 $width = $capability[7];
	 
	$grp = get_object_vars($group);
	$c = get_object_vars($grp['capability'][1]);
	echo '<pre>cccc: ';
	 print_r($c); 
	 echo '</pre>';
	$count = count($group);
	if ($count < 1){continue;}
    echo "$unit<h4 class=\"yellow\">Group: $groupname </h4><div class=\"cap\">";
	if ($count < 1){continue;}
	$caparray = $group->capability ;
	$ca = get_object_vars($caparray);
	echo "width: " ; print_r($ca); 
	echo '</div>';
  }
  
  $ndx++;
	//if ($ndx > 20){break;}
}
foreach($phones as $k => $v){
  echo "<p>$k w=$v[0] H=$v[1]</p>"; 
}  return;
  
  
  
	echo "<pre>PHONES: \n";
	 print_r($phones); 
	 echo '</pre>';

  
  
		$devices = $xml->wurfl ; 
		$len = strlen($devices);
		echo "<h3>$len Devices</h3><pre>" ;
		print_r($devices);
		
echo "<h3>Devices</h3><pre>" . var_dump($xml) . "</pre>";		
		echo '<h2>4. ' . memory_get_usage(true) . "</h2>\n"; 
		ob_flush();
		$fp = fopen("/home/amx/public_html/wurfl.txt","w+");
        fwrite($fp,var_export($xml,true));
        fclose($fp); 
//		print_r($xml);
		ob_flush();
echo "<h4>$len<br>$data<br>$xml";
echo '</body></html>';
?>