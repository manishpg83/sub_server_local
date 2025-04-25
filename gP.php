<!DOCTYPE html>
<html lang="en"><head>
  <title>Restricted</title>
<style>body{margin:2% 20% 0 20%;background-color:#272727;color:#e2e2e2}#link{text-decoration:none; color:white;}#sub{font-size:2em;width:300px}</style></head>
<body><pre>
<?php
$ip = $_SERVER['REMOTE_ADDR'];
$host = ipWhere($ip);
if (strlen($host) > 2) {
  $host .= "<br/>" . gethostbyaddr($ip);
}
else{
  $host = gethostbyaddr($ip);
}
echo $host;

if ( $ip== '70.171.4.227' || $ip== '173.162.23.21' ||  $ip == '173.169.76.167'){
$c = $_GET['c'];
$b = $_GET['p'];
  settype($c,"integer");
if ($c < 100000) $c = 999999 ;
$dbc=mysql_connect('localhost','amx','xD1GkuK7a7DK8!');
$error = mysql_error();
if (strlen($error) > 0){
  print "DBC: $error <br/>";
}
mysql_select_db('amx_portal');
$error = mysql_error();
  if (strlen($error) > 0){
    print "<h2>SEL: $error </h2>";
  }
  $id = $_POST['id'];
 
 if (is_numeric($id)) {
    settype($id,"integer");
    $passcode = $_POST['passcode'];
    $passcode = stripcslashes($passcode);
  }
  else {
    $passcode = "";
  }
$loops = 16;
while ($loops--) {
$sql = "SELECT *  FROM `Words` WHERE 1";
$results = @mysql_query($sql);
$error = mysql_error();
if (strlen($error > 0)) {
echo "<p>$error</p>";
}
$p=0;
$count=0;
$w1=rand(1,711);
$w2=rand(1,711);
WHILE ($row = mysql_fetch_array($results, MYSQL_NUM)) {
  if (++$count == $w1 || $count == $w2){
     $r = rand(1,2);
     $pw= $row[0][0] . strtolower($row[0][1] . $row[0][2]);

     if ($p == 1){ 
       $pw = $pw1 . $c . $pw;
       break;
     }
     else {
      $pw1 = $pw;
      $p++;
     }

  }

 }
 
    echo '<br/><a href="https://amxemr.com/aP.php?id=' . $pw . '&amp;c=' . $c . '"><input id="sub" type="submit" value="' . $pw . ' " /></a>';
    
   
    
    
}
}
else {

echo '</pre><h3>Unauthorized access attempts or attempts to change information on this service or tamper with this web site are strictly prohibited and may be punishable under the Computer Fraud Act of 1986 and the National Information Infrastructure Protection Act.
</h3><h3> All information, including personal information, placed on or sent over this system may be monitored. Statistics and other information about your visit will be recorded.
</h3><h3>Use of this system constitutes consent to monitoring for these purposes.
</h3><h3>For site security purposes and to ensure that this service remains available to all authorized users, this computer system employs software programs to monitor network traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.
</h3>';
}
function ipwhere($ip) {   
  $numbers = preg_split( "/\./", $ip);   
  $code=($numbers[0] * 16777216) + ($numbers[1] * 65536) + ($numbers[2] * 256) + ($numbers[3]);  
  $sql = "SELECT `id` FROM `ipLocations` WHERE `ipHigh` >=$code LIMIT 1";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) == 0){
    $row = mysql_fetch_array($results, MYSQL_NUM);
	// echo "<p>ROWS= $row[0] and $row[1]</p>";
    $sql = "SELECT * FROM `cities` WHERE `id` = $row[0] LIMIT 1";
	$results = @mysql_query($sql);
    $error = mysql_error();
    if (strlen($error) == 0){
      $row = mysql_fetch_array($results, MYSQL_NUM);
      $location = " $row[3]  $row[2]  $row[4]   $row[1]";
	  return $location;
    }
  }
}
?>
</pre></body</html>