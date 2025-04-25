<?php

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$passcode = trim($_GET['p']);
$passcodeh = trim($_POST['pwh']);
$passcode = trim($_POST['pw']);
if (strlen($passcodeh) > strlen($passcode)){
  $passcode = $passcodeh;
}
$SAVE_ID = $_POST['id'];
if ($id == 0 && strlen($SAVE_ID) == 0  && strlen($passcode) == 12  ) {
  $id = substr($passcode,3,6);
}
else {
  $id = $SAVE_ID;  
}
settype($id,int);
$ip =  $_SERVER['REMOTE_ADDR'];

if ((hash('ripemd320',$passcode) == '6732f3c024fe3c3c1ccd7dbe5d0fa7d4a53c516f800707bb86a9017c1e1646d9d4a2d7adc56a505d') && (substr($ip,0,11)  == '128.30.52.7' || $ip == '99.3.150.55' || $ip == '173.162.23.21' )){
  $admin = true;
}
$pass = check($id,$passcode);
if ($admin === true) {
  $row[1] = 'Allermetrix EMR, ' . $row[1];
  $pass = true ;
}
if ($pass === true) {

$terms = 'true';

  $days = $row[13];
  if ($days == 0) {
    $days = 7;
  }
  $client = $row[1];
  $d =  date('DMjYHisa') .  microtime(true);
  $seed = $_SERVER['REMOTE_ADDR'] . $d;
  $sid = substr(hash('ripemd320',$seed),1,16);
  session_cache_limiter('private');
  session_cache_expire(5);
  session_name('amxs');
  session_id($sid);
  session_start( );
  setcookie("amxc", $id,time()+900);
  setcookie(session_name('amxs'), '', time() + 900);
  $link = "https://amxemr.com/logout.php";
  $action = "Log Out";
  $address= trim($row[3]);
  if (strlen($address) > 3){ $address .= '<br/>';}
   $address .=  trim($row[4]) . ' ' . trim($row[5]) . ' ' . trim($row[6]);
   $client = "<p id='client'>$row[1]<br>$row[2]<br/>$address</p>";
}
else {
 $link = "https://amxemr.com/";
 $action = "Log In";
 $terms = 'false';
 $admin = false;
}

echo <<<EOT
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>
        </title>
<link rel="stylesheet" href="https://amxemr.com/jquery.mobile-1.1.0.min.css" />

 <style>
#client{margin-bottom:0px;padding-bottom:0}
#address{margin-top:0px;padding-top:0}
.mobile{width:90%;margin:0 auto 0;}
.tablet{width:80%;margin:0 auto 0;}
.desk{width:80%;margin:0 auto 0;padding:0;}

.center{text-align:center;margin:0 auto 0;width:100%;}
.left {text-align:left;}
.small {font-size:small;font-weight:400}
.max {max-width:400px;margin:0 auto 0}
.red {color:red}
.xui-field-contain{margin:6px 0 6px 0;height:28px}
</style>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
        </script>
        <script src="https://amxemr.com/jquery.mobile-1.1.0.min.js">
        </script>
</head>
<body>
<div data-role="page" data-theme="a" id="page1">
<div data-theme="a" data-role="header" data-position="fixed">
<h3>Allermetrix</h3><a data-role="button" data-transition="fade" rel="external" data-ajax="false" href="$link">$action</a>
</div>
<div data-role="content" data-theme="a"  class="desk">
<div class="center">
EOT;


if ($pass === true) {
 $link = "https://amxemr.com/logout.php";
 $action = "Log Out";
}
else {
 $link = "https://amxemr.com/";
 $action = "Log In";
}

$host = ipWhere($ip);
if (strlen($host) > 2) {
  $host .= "<br/>" . gethostbyaddr($ip);
}
else{
  $host = gethostbyaddr($ip);
}
if (!($pass === true)) {

  print "$ip $host</h2><h4>Exit this site If you are not an authorized agent</h4><p class=red>Alert Sent: $error</p><p>$p<br/>$pb<br/></p>";
  $c = "false";
  $sc = "true";
}
else {
   echo <<< EOT
<div data-role="content" data-theme="a"  class="desk">
<div data-role="collapsible" data-collapsed="" data-mini="true" ><h2>Search</h2>
 <form action="search.php" method="post" data-ajax="false">
<div style="display: none;">
   <input name="l" type="text" />
   <input name="p" type="password" />
</div>
 <div  class="left">
 <div data-role="fieldcontain">
  <fieldset data-role="controlgroup">
   <label for="code">
   Patient ID
   </label>
     <input id="code" name="code" placeholder="Begins With" value="" type="search" />
  </fieldset>
 </div>
<hr class="max" />
  <div data-role="fieldcontain">
  <fieldset data-role="controlgroup">
   <label for="name">
   Patient Last Name
   </label>
  <input id="name" name="name" placeholder="Leave Blank for All" value="" type="search" />
  </fieldset>
 </div>

 <div class="max">
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup" data-type="vertical" data-mini="true" >
  <label for="daysOn">Use Days for Name Search</label>
  <input name="daysOn" id="daysOn" type="checkbox" checked/>
 </fieldset>
</div>
<hr/>
 <div data-role="fieldcontain">
  <fieldset data-role="controlgroup">
   <label for="days">
   Days
   </label>
   <input type="range" name="days" id="days" value="$days" min="1" max="60" data-highlight="true" data-theme="" data-track-theme="d" />
  </fieldset>
 </div>
 By submitting
 <ol>
 <li>You confirm that you are an authorized agent of the firm listed below
 <li>You agree to the terms and conditions
 </ol>
<input type="hidden" name="L1" value="0" />
<input type="hidden" name="L2" value="100" />

 <input type="submit" data-icon="check" data-iconpos="left" value="Submit" />

 </div>
</div>
</form>
  <div class="center">
EOT;
if ($admin){
echo <<<EOT
<form action="row.php" method="post" data-ajax="false">
<input type="hidden" name="c" value="$SAVE_ID" />
<input type="hidden" name="d" value="$days" />
<button>New Submit</button>
</form>
EOT;

}
  print "<h4>Exit this site If you are not an authorized agent of</h4>$client";
  $c = "true";
  $sc = "false";

}
  print "<div data-role='collapsible' data-collapsed='$cs'>";
print "</div></div></div>";
    $ipCount = 0;
    $timeCount = 0;

if (!$pass) {
$timeMin = 999999;
$timeMax = 0;
  $sql = "SELECT COUNT(*)  FROM `access` WHERE `ip` LIKE '$ip' AND `Attributes` = 1'";
  $results = @mysql_query($sql);
  $row = @mysql_fetch_array($results, MYSQL_NUM);
  if ($row[0] > 0) {
    $isClient = true;
  }
  else { 
    $isClient = false;
  }
  if ($rows == 1) {
    $ipCount = 1;
    $timeCount = abs(strtotime($row[1]) - time());
    $timeMin = $time;
    $timeMax = $time;
  }
  $row = @mysql_fetch_array($results, MYSQL_NUM);
  if ($rowCount > 1) {
  }

//  $sql = "SELECT COUNT(*),`ip`,`TimeStamp` FROM `access` WHERE `ip` LIKE '$ip' AND `Pass` = 0 AND `TimeStamp` > CURRENT_TIMESTAMP ORDER BY `TimeStamp`";
  $sql = "SELECT `ip`,`TimeStamp` FROM `access` WHERE `ip` LIKE '$ip' AND `TimeStamp` > SUBTIME(CURRENT_TIMESTAMP, '24:00:00') order by `TimeStamp` ASC";
  $results = @mysql_query($sql);
 // echo mysql_error() . $sql;
  $rows = mysql_num_rows($results);

  $sql = "SELECT `ip`,`TimeStamp`  FROM `access` WHERE `ip` LIKE '$ip'  AND `TimeStamp`  > CURRENT_TIMESTAMP order by `TimeStamp` ASC";
  $results = @mysql_query($sql);
 // echo mysql_error() . $sql;
  $rows = mysql_num_rows($results);
  if ($rows == 1) {
    $ipCount = 1;
    $timeCount = abs(strtotime($row[1]) - time());
    $timeMin = $time;
    $timeMax = $time;
  }
  $row = @mysql_fetch_array($results, MYSQL_NUM);
  if ($rowCount > 1) {
    $saveIP[$ipCount++] = $row[0];
    $saveTime[$timeCount++] = strtotime($row[1]);
    while ($row = mysql_fetch_array($results, MYSQL_NUM)) {
      $saveTime[$timeCount] = strtotime($row[1]);
      $time = $saveTime[$timeCount] - $saveTime[$timeCount - 1];
      if ($time > $timeMax){
         $timeMax = $time;
       }
      if ($time < $timeMin){
         $timeMin = $time;
       }
      $rowCount += $row[0];
      if ( !in_array($row[0],$saveIP)) {
         $saveIP[$ipCount++] = $row[0];
         $saveIP = $row[0];
         $ipCount++;
         
      }
    }     
  }
  
  elseif ($rows == 1) {
  //  $rowCount = 1;
  } 
}

settype($strike3,double);
  $strike3 += abs(strlen($SAVE_ID) - 6);
  $strike3 += abs(strlen($passcode) - 12);
  $SAVE_ID .= $passcode;
  $strike1 = 1 + preg_match_all('/\x3F/',$SAVE_ID,$matches, PREG_SET_ORDER);  // )
  
//echo $strike1 . ' - ' . $strike3 . '<br>';
  $strike2 = preg_match_all('/[\x21-\x2F]|[\x3A-\x40]|[\x5B-\x60]|[\x7B-\x7F]/',$SAVE_ID,$matches, PREG_SET_ORDER);
  $strike3 += 128 * $strike2;
  $strike3 += pow($strike3,$strike1);
//echo $strike1 . ' - ' . $strike3 . '<br>';
  $strike1 = preg_match_all('/\x28/',$SAVE_ID,$matches, PREG_SET_ORDER);  // )
  $strike2 = preg_match_all('/\x29/',$SAVE_ID,$matches, PREG_SET_ORDER);  // ( 
//echo $SAVE_ID .$strike1 . ' - ' . $strike2 . '<br>';
  if ($strike1 + $strike2 > 0) {
    if (($strike1 == $strike2) || (($strike1 + $strike2) > 2)) {
       $strike3 += 128 * ($strike1 + $strike2) ;
//echo $strike3 . '  - 1<br>';
      if ($strike1 == $strike2) {
          $strike3 *= 4;
//echo $strike3 . '  - 2<br>';
      }
    }
  }
  $SAVE_ID .= $passcode;
  $strike1 = preg_match_all('/\x2C/',$SAVE_ID,$matches, PREG_SET_ORDER); // ' '
  if ($strike1 > 0) {
    $strike3 += 8;
    if (!($strike1&1)) {
       $strike3 += 128; 
       if($strike1 > 2) {
          $strike3 += 1024 * ($strike1 + $strike2) ;
       }
    }
  }

  $strike1 = preg_match_all('/\x22/',$SAVE_ID,$matches, PREG_SET_ORDER);  // " "
  if ($strike1 > 0) {
    $strike3 += 8;
    if (!($strike1&1)) {
       $strike3 += 128; 
       if($strike1 > 2) {
          $strike3 += 1024 * ($strike1 + $strike2) ;
       }
    }
  }

  $strike1 = preg_match_all('/x2C/',$SAVE_ID,$matches, PREG_SET_ORDER);  // ,,,,
     if ($strike1 > 0) {
       $strike3 *= $strike1; 
     }

  $strike1 = preg_match_all('/x27/',$SAVE_ID,$matches, PREG_SET_ORDER);  // ' '


  $strike1 = preg_match_all('/x60/',$SAVE_ID,$matches, PREG_SET_ORDER);  /// ` `
  $strike2 = preg_match_all('/x22/',$SAVE_ID,$matches, PREG_SET_ORDER);
  $strike1 =  preg_match_all('/COALESCE|0x|like|regex|mid|select|delete|drop|insert|do|call|replace|update|infile|lock|set|from|into|show|table|kill|reset/i',$SAVE_ID,$matches, PREG_SET_ORDER);
  $strike1 *= 1024;
   $strike3 *= $strike1;
//echo $strike1 . ' - ' . $strike3 . '<br>';
  $postCount = count($_POST) +  count($_GET) ;
  $strike3++;
 // $SAVE_ID = nl2br($SAVE_ID);
 // $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($id, CURRENT_TIMESTAMP, '$ip', 2, '0', $pass, '$SAVE_ID');";
 // @mysql_query($sql);
 // $sql = sprintf("INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`,`Strike3`,`Pass`) VALUES (%d, CURRENT_TIMESTAMP, '$ip',$strike3,$rows)",$id);
 // mysql_unbuffered_query($sql);
 // echo mysql_error();echo '<p>' . $sql;
 // mysql_unbuffered_query(sprintf("INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`,`Strike3`,`Pass`) VALUES (%d,ADDTIME(CURRENT_TIMESTAMP , '0:0:06') , '$ip',$strike3,$rows)",$id));
  // echo '<br>'.$sql .'<br>' . mysql_error();

 $find = preg_match_all('/[\x21-\x2F]|[\x3A-\x40]|[\x5B-\x60]|[\x7B-\x7F]/',$SAVE_ID,$matches, PREG_SET_ORDER);
settype($find,int);
if ($find > 0) {
  $find = preg_match_all('/select|delete|drop|insert|do|call|replace|update|infile|lock|set|show|table|kill|reset/',$SAVE_ID,$matches, PREG_SET_ORDER);
  settype($find,int);
  if ($find > 0) {
    @mysql_unbuffered_query("INSERT INTO `amx_portal`.`Banned` (`ip`, `TimeStamp`,`Strike3`, `Attributes`) VALUES ('$ip', CURRENT_TIMESTAMP, $alert);");
  }
}

echo '
<div data-role="collapsible" data-collapsed="' . $terms . '"><h3>Terms and Conditions</h3>
<div class="left">
<p>
Only Allermetrix Clients and their authorized agents that have explicitly been granted permission by Allermetrix Labortories are permitted to access
and are restricted to the sections to which they are authorized
</p><p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and 164
Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p><p>
Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply
with its policies and procedures.
</p><p class="small">
This site is intended to be used for viewing and retrieving information only. 
Unauthorized access attempts or attempts to change information on this service or tamper with this 
web site are strictly prohibited and may be punishable under the
Computer Fraud Act of 1986 and the National Information Infrastructure Protection Act.
All information, including personal information, placed on or sent over this system may be monitored.
Statistics and other information about your visit will be recorded. Use of this system constitutes consent
to monitoring for these purposes. For site security purposes and to ensure that this service remains
available to all users, this computer system employs software programs to monitor network
traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.
</p>
</div></div></div></div></div></div>
<div data-role="footer" data-position="fixed">
 <h3>Unauthorized Access Forbidden</h3>
</div>
</body>  
</html>
';
if ($pass) {
  $sql = "UPDATE `Client` SET  `Session`='$sid' ,`LastVisit` = CURRENT_TIMESTAMP, `ip` = '" . $ip . "' WHERE `Number` = $id";
  @mysql_unbuffered_query($sql);

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
  else {
    return $error;
  }
}

function check($id,$passcode) {
global $row;
global $admin;
global $ip;
global $data;
global $hash;
   $dbc=mysql_connect('localhost','amx_allermetrix',$data);
   mysql_select_db('amx_portal');
   $sql = "SELECT COUNT(*)  FROM `Banned` WHERE `ip` LIKE 'ip'";
   $results = @mysql_query($sql);
   $rows = @mysql_num_rows($results);
   $pass = false;
   $error = 1;
   $hash = hash('ripemd320',$passcode);
      $sql =  sprintf("SELECT *  FROM `Client` WHERE `Number` = %d", $id);
      $results = @mysql_query($sql);
      $error = mysql_error();
      $rows = mysql_num_rows($results);
      $validID = false;
      if (strlen($error) == 0 && $rows == 1) {
        $row = mysql_fetch_array($results, MYSQL_NUM);
        $validID = true;
        if ($row[12] == $hash || $admin === true) {
          $pass = true;
          if (!$admin) {
            $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($id, CURRENT_TIMESTAMP, '$ip', 1, 0, 1, '');";
            @mysql_query($sql);
          }
          
        }
        else {
          $txt = $id . ' - ' . $passcode;
          $sql = "INSERT INTO `amx_portal`.`access` (`Client`, `TimeStamp`, `ip`, `Attributes`, `Strike3`, `Value`, `Text`) VALUES ($id, CURRENT_TIMESTAMP, '$ip', 1, 0, 0, '$txt');";
          @mysql_query($sql);
          $pass = false;
          $error = 4;
          $f = 1;
          $p = $passcode;
          $db = $row[12];
          $sql = "SELECT *  FROM `Client` WHERE `Number` = 1 ";
        //  echo "<p>PW: $error</p>\n";
        }
      }
      else{
     //   echo "<p>CLI: $error</p>\n";
        $pass = false;
        $error = 2;
        $f = 2;
      }

return($pass);
}




?>
