<?php
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$client = intval($_POST['client']);
if($client == 0){$client = intval($_GET['client']);}
if($client == 0){$client = intval($_COOKIE['amxc']);}

$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$testpath = false;
if($id == 17316976167 ){
  $file = "/home/amx/$id.admin";
  file_put_contents($file,rand(100000,999999));
  $testpath = false;
}

setcookie("amxc", $client,time()+86400,'/');

$sub = intval($_POST['sub']);
$billingType = array('','Client','Medicare','Medicaid','Patient','Insurance');
$billing = intval($_POST['billing']);
$first = trim($_POST['first']);
$last = trim($_POST['last']);

$dob = date('Y-m-d',strtotime($_POST['dob']));

$address = trim($_POST['Address']);
$city = trim($_POST['city']);
$state = trim($_POST['state']);
$zip = trim($_POST['zip']);
$collection = $_POST['collection'];
$onhold = intval($_POST['onhold']);
$celiac = intval($_POST['celiac']);
$gender = intval($_POST['gender']);
$rec = intval($_POST['rec']);
settype($_POST['volume'],"double");
$volume = number_format($_POST['volume'],1);
$Accession = intval($_POST['Accession']);
$phone = $_POST['phone'];
$phone1 = $phone; 
$phone = intval(preg_replace('/\D/','',$phone));
$phone2 = $phone;
if($phone == 0){$phone = '';}
$phone3 = $phone;
$email = $_POST['email'];
$history = intval($_POST['history']);
 
if($sub == 70){
    $_POST['prior'] = 6;
	$_POST['tab'] = 0;
	$sql = "SELECT `client`, `last`, `first`, `dob`, `address`, `city`, `state`, `zip`, `gender` FROM `history` WHERE `id`=$history ";
    $results = mysqli_query($link,$sql);
    list($client, $last, $first, $dob, $address, $city, $state, $zip, $gender) =  mysqli_fetch_array($results, MYSQLI_NUM);
    $sql = "INSERT INTO `orders` (`id`,`date`, `status`,`client`, `first`, `last`, `address`, `city`, `state`,`zip`,`phone`, `dob`, `collection`,`volume`, `physician`, `icd101`, `icd102`, `icd103`, `clientID`, `jsn`) VALUES (NULL,NULL,'E', '$client', '$first', '$last', '$address', '$city', '$state','$zip','$phone', '$dob', '$collect','$volume', '$physician', '$icd1', '$icd2', '$icd3', '$specimen', '$jsn')";
    mysqli_query($link,$sql);
    $err = mysqli_error($link);
    if(strlen($err) > 0){$err = ' Error: ' & $err;}
    $rec = mysqli_insert_id($link);
}

if($sub == 60){
  $code = rand(100000,999999);
  file_put_contents('/home/amx/public_html/order/done.txt',"$code|$client");
  header("Location: https://dev.amxemr.com/enter.php?Accession=$code");
  exit;
}
ob_start("ob_gzhandler");


$sql = "SELECT `Name` FROM `Client` WHERE `Number` = $client LIMIT 1";
$results = mysqli_query($link,$sql);
list($clientname) =  mysqli_fetch_array($results, MYSQLI_NUM);


if($sub == 55){include('/home/amx/public_html/order/profile.php');exit;}
if($sub == 56){include('/home/amx/public_html/order/profile.php');exit;}
if($sub == 51){
  if($testpath){include('/home/amx/public_html/order/requestTest.php');exit;}
  include('/home/amx/public_html/order/request.php');exit;
}
if($sub == 52){include('/home/amx/public_html/order/printRequest.php');exit;}
if($sub == 57){
  if($phone > 0 && strlen($phone) != 10){$err = 1;include('/home/amx/public_html/order/profile.php');exit;}
  include('/home/amx/public_html/order/panels.php');exit;
}
if($sub == 41){include('/home/amx/public_html/order/selections.php');exit;}
if($sub == 50){include('/home/amx/public_html/order/selections.php');exit;}
if($sub == 70){include('/home/amx/public_html/order/selections.php');exit;}


if($sub == 40){$lookuplast = '';include('/home/amx/public_html/order/addon.php');exit;}
if($sub == 53){include('/home/amx/public_html/order/addon.php');exit;}
if($sub == 58){
  $icd = trim($_POST['icd']);
  $specimen = trim($_POST['specimen']);
  $needed = $_POST['needed'];
  $collect = $_POST['collect'];
  $physician = $_POST['physican'];
  if($testpath){include('/home/amx/public_html/order/requestTest.php');exit;}
  include('/home/amx/public_html/order/request.php');
  exit;
}
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#logo{margin:0 auto 0;}
#content{max-width:640px;margin:0 auto 0 ;padding:20px;}
#col1,#col2,#col3{float:left;width:300px;}
#col2,#col3{margin-left:2em;display:none;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
.btn{margin:30px 0 0 0;width: 200px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font-weight:bolder;color:#00515a;font-size:1em;margin-bottom:10px;}
.center{text-align:center;}
h1,h2,h3{margin: 20px auto 0;}
h2{text-align:center;}
label{margin-top:10px;font-size:1.3em;}
textarea{border-radius: 4px;font-family:Arial;}
#comment{height:86px;}
input{padding:5px;font-size:1.1em;border-radius: 4px;}
.hide{display:none;}
.red{color:red;font:700 1.5em Arial;}
.big{font-size:1.3em;}
#patient{margin: 0 0 0 200px;}
.label{font-size:1em;margin: 10px 0 10px 0;}
.or{font-size:1em;margin: 10px 0 10px 1.9em;}
input[type="radio"], input[type="checkbox"] {
    width: 1.3em;
    height: 1.3em;
    display: inline;
    margin: 1px;
    margin-left: 4px;
    vertical-align: middle;
    position: relative;
    background: #333;
    background-color: rgb(51, 51, 51);
    color: #eee;
}
.note{font-size:1em;margin-top:0;padding-top:0;}

#hide{display:none;}
.textstyle0 {font-family:Arial Rounded MT Bold;font-weight:normal;font-style:normal;font-size:13px;text-decoration:none;color:#000000;}
.textstyle1 {font-family:Arial Rounded MT Bold;font-weight:bold;font-style:normal;font-size:13px;text-decoration:underline;color:#000000;}
.textstyle2 {display:block;font-family:Arial;font-weight:bold;font-style:italic;font-size:10px;text-decoration:none;color:#000000;}
rt{background:#f00;color:#fff;}
#autofill{font-size:.8em}
#header{margin:0 auto 0;width:640px;}
p{line-height:1.5;font:400 1em Arial,sans-serif;}
#cap{display:block; margin:100px auto 0;}
#patient{margin:0 auto 0;width:250px;}
</style></head><body>
<img src="allermetrix_E-office600.jpg" width="600" height="85" alt="Allermetrix eOffice" />
</div>

EOT;
?>


































