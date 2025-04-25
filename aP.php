<!DOCTYPE html>
<html lang="en"><head>
  <title>Restricted</title>
<style>body{margin:5% 20% 0 20%;background-color:#272727;color:#e2e2e2} #sub{font-size:2em;width:100%}</style></head>
<body>
<?php
$passcode = $_GET['id'];
$id =  $_GET['c'];
$passcode = stripcslashes($passcode);
$hash = hash('ripemd320',$passcode);
$ip = $_SERVER['REMOTE_ADDR'];

if ( $ip== '70.171.4.227' || $ip== '173.162.23.21' ||  $ip == '173.169.76.167'){
  settype($id,"integer");
  $dbc=mysql_connect('localhost','amx','xD1GkuK7a7DK8!');
  $error = mysql_error();
  if (strlen($error) == 0) {
    mysql_select_db('amx_portal');
    $error = mysql_error();
    if (strlen($error) == 0){
      $sql = "SELECT *  FROM `Client` WHERE `Number` = $id ";
      $results = @mysql_query($sql);
      $error = mysql_error();
      $rows = mysql_num_rows($results);
      $validID = false;
      if (strlen($error) == 0 && $rows == 1) {
        $row = mysql_fetch_array($results, MYSQL_NUM);
        $validID = true;
        $email = $row[9];

        $name = $row[1];
        $sql = "UPDATE  `Client` SET `RecordsCRC` = '" . $hash . "'  WHERE `Number` = '$id'";
        $results = @mysql_query($sql);
        $error = mysql_error();
        if (strlen($error) == 0) {
		  echo "<p>Record Updated</p>";
          $pass = true;
          $days = $row[13];
          $client = $row[1];
          echo '<a href="mailto:' . $email . "?subject=amxEMR Patient Portal&amp;body=" . $passcode . '"> <input id="sub" type="submit" value="  ' . $name . '" /></a>';
        }
        else {
		    echo "<p>Record NOT Updated</p>";
          $pass = false;
          $error = 4;
          $f = 1;
          $p = $passcode;
          $db = $row[12];
          $sql = "SELECT *  FROM `Client` WHERE `Number` = 1 ";
  //        echo "<p>PW: $error</p>\n";
        }
      }
      else{
  //      echo "<p>CLI: $error</p>\n";
        $pass = false;
        $error = 2;
        $f = 2;
      }
    }
    else {
 //     echo "<p>SEL: $error</p>\n";
      $pass = false;
      $error = 64;
      $f = 3;
    }
  }
  else {
 //   print "DBC: $error <br/>";
    $pass = false;
    $error = 128;
    $f = 4;
  }


}
else {
 echo '<h3>Unauthorized access attempts or attempts to change information on this service or tamper with this web site are strictly prohibited and may be punishable under the Computer Fraud Act of 1986 and the National Information Infrastructure Protection Act.
</h3><h3> All information, including personal information, placed on or sent over this system may be monitored. Statistics and other information about your visit will be recorded.
</h3><h3>Use of this system constitutes consent to monitoring for these purposes.
</h3><h3>For site security purposes and to ensure that this service remains available to all authorized users, this computer system employs software programs to monitor network traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.
</h3>';
}
   
?>