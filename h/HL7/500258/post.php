<?
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

header('Content-Type: text/html; charset=utf-8');
$filename = $_GET['filename'];
echo "<pre>";
//$filename = 'postHL72304201952.txt';
//$logfile = "/home/amx/public_html/HL7/500258/log.txt";
//file_put_contents($logfile,"");
$clients = array();
echo 'filename=/home/amx/HL7/500258/' . "$filename\n<br>";
$data = file_get_contents('/home/amx/HL7/500258/' . $filename);
str_replace("\r",'',$data);
$hl7 = explode("\n",$data);

$t = microtime();
var_export($hl7); echo "\nEnd Export HL7 500258\n";
$logfile = "/home/amx/HL7/500258/log.txt" ;
file_put_contents($logfile,"" );

foreach($hl7 as $details){	
  echo " HL7 as Details 500258<br>\n";var_export($details); echo "\n--------------------------\n";
   list($client,$accession,$specimen) = explode('|',$details);
   echo "\nlist = $client,$accession,$specimen\n";
 //  if(strlen($specimen) > 10){echo "\nspecimen=$specimen\n";continue;}
  $logfile = "/home/amx/public_html/HL7/$client/log.txt";
  file_put_contents($logfile,"Post amen: $client => $accession => $specimen $t\n", FILE_APPEND);
  if($client > 99999 AND $accession > 100000){
	file_put_contents($logfile,"Post b: $client => $accession => $specimen $t\n", FILE_APPEND);
	chdir("/home/amx/HL7/$client/");
	echo "\nInclude $client\n";
    include "/home/amx/HL7/$client/makehl7.php";
	$clients[$client] = $client;
  }
}
/*
foreach($clients as $client){
  if($client != 500258){continue;}
  $filename = "/home/amx/HL7/$client/Results/" .  date('Ymd') . '.hl7';
  file_put_contents($filename, "\n", FILE_APPEND);
  echo "\nResults: $filename\n" . file_get_contents($filename);
}
*/
chdir("/home/amx/HL7/$client/");
$filename = "/home/amx/HL7/$client/Results/" .  date('Ymd') . '.hl7';
include("/home/amx/HL7/500258/sftpUpload.php?filename=$filename");



var_export($clients);
echo file_get_contents($logfile);
$t =  microtime(true) - $t;
echo $t;



exit;


















/*
Updating FTP related packages
[2023-01-30 13:10:35 -0700]   
[2023-01-30 13:10:35 -0700]   Problems were detected with cPanel-provided files which are controlled by packages.
[2023-01-30 13:10:35 -0700]   If you did not make these changes intentionally, you can correct them by running:
[2023-01-30 13:10:35 -0700]   
[2023-01-30 13:10:35 -0700]   > /usr/local/cpanel/scripts/check_cpanel_pkgs --fix
[2023-01-30 13:10:35 -0700]   The following packages are missing from your system:
[2023-01-30 13:10:35 -0700]   cpanel-proftpd-1.3.6c-1.cp11104
[2023-01-30 13:10:35 -0700]    
[2023-01-30 13:10:35 -0700]   The following packages are unneeded on your system and should be uninstalled:
[2023-01-30 13:10:35 -0700]   cpanel-pure-ftpd-1.0.50-1.cp11104
[2023-01-30 13:10:35 -0700]   Maximum sync children set to 16 based on 3600M available memory.
[2023-01-30 13:10:35 -0700]   Downloading http://httpupdate.cpanel.net/RPM/11.104/centos/7/x86_64/sha512
[2023-01-30 13:10:35 -0700]   Successfully verified signature for cpanel (key types: release).
[2023-01-30 13:10:35 -0700]   Downloading http://httpupdate.cpanel.net/RPM/11.104/centos/7/x86_64/cpanel-proftpd-1.3.6c-1.cp11104.x86_64.rpm
[2023-01-30 13:10:37 -0700]   Disabling service monitoring.
[2023-01-30 13:10:37 -0700]   Hooks system enabled.
[2023-01-30 13:10:37 -0700]   Checking for and running RPM::Versions 'pre' hooks for any Packages about to be installed
[2023-01-30 13:10:37 -0700]   All required 'pre' hooks have been run
[2023-01-30 13:10:37 -0700]   Uninstalling unneeded rpms: cpanel-pure-ftpd
[2023-01-30 13:10:38 -0700]   [systemctl] /usr/bin/systemctl stop pure-ftpd.service
[2023-01-30 13:10:38 -0700]   disable was successful
[2023-01-30 13:10:38 -0700]   warning: /etc/pure-ftpd.conf saved as /etc/pure-ftpd.conf.rpmsave
[2023-01-30 13:10:38 -0700]   Installing new rpms: cpanel-proftpd-1.3.6c-1.cp11104.x86_64.rpm
[2023-01-30 13:10:38 -0700]   Preparing packages...
[2023-01-30 13:10:39 -0700]   cpanel-proftpd-1.3.6c-1.cp11104.x86_64
[2023-01-30 13:10:40 -0700]   Ignoring leading “-” on signal name “-9” …
[2023-01-30 13:10:40 -0700]   0 processes (pure-ftpd) sent signal 9
[2023-01-30 13:10:40 -0700]   enable was successful
*/


date_default_timezone_set('America/New_York');
$time =  date("F j, Y, g:i a");
//$host = "173.162.23.21";
$host = "44.235.72.131";
 
$port = 22;
$username = "Allermetrix01";
$password = "All3rm3tr1x#";
//Sol246soL#@amxermr.com
//$username = "amx";
//$password = "xD1GkuK7a7DK8!";
//$host = '72.167.220.227/home/amx/public_html/';
//$host = "44.235.72.130/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/OrdersOutbound/";
//$host = "173.162.23.21/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/OrdersOutbound/";
$url = 'sftp://' .  $username . ':' . $password  . "@$host" . '/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/OrdersOutbound/' . '/';
$url = 'sftp://' .  $username . ':' . $password  . "@$host:$port" . '/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/ResultsInbound' . '/file.txt';
$url = "sftp://$username:$password@$host";
$ch = curl_init($url);
//curl_setopt($ch, CURLOPT_USERPWD, "$username:$password");
curl_setopt($ch, CURLOPT_PROTOCOLS, CURLPROTO_SFTP);
curl_setopt($ch, CURLOPT_DIRLISTONLY, '1L');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 2);
//CURLOPT_CONNECTTIMEOUT 
curl_setopt($ch, CURLOPT_TIMEOUT,10);
//curl_setopt($ch, CURLOPT_FAILONERROR,true);

curl_setopt($ch, CURLOPT_VERBOSE, true);
//$response = curl_exec($ch); 
$error = curl_error($ch);
curl_close($ch);
echo "error: $error<br>\n";
echo "response $response<br>";
echo "$time<br>";
echo $url;
exit;




file_put_contents("/path/to/save/filename.txt", $response);



function my_ssh_disconnect($reason, $message, $language) {
  printf("Server disconnected with reason code [%d] and message: %s\n",
         $reason, $message);
}

$methods = array(
  'kex' => 'diffie-hellman-group1-sha1',
  'client_to_server' => array(
    'crypt' => '3des-cbc',
    'comp' => 'none'),
  'server_to_client' => array(
    'crypt' => 'aes256-cbc,aes192-cbc,aes128-cbc',
    'comp' => 'none'));

$callbacks = array('disconnect' => 'my_ssh_disconnect');

$connection = ssh2_connect($host, 22, $methods, $callbacks);
if (!$connection) die('Connection failed');



file_get_contents("ssh2.sftp://$username:$password@host:22/opt/HelpSystems/GoAnywhere/userdata/Allermetrix/ResultsInbound");
echo "\ndone";

?>