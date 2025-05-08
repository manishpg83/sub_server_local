<?php
$start = microtime(1);
session_name('amxs');
session_start();
$id = $_COOKIE['amxc'];
$name = $_POST['name'];
$code= $_POST['code'];
$days = intval($_POST['days']);
$daysOn = $_POST['daysOn'];
settype($days,"integer");
if ($days == 0) {
   $days = 7;
}
$sid = session_id();
$pass = false ;
settype($id,"integer");
if (is_numeric($id) && $id > 99999 && $id < 1000000) {

  $passcode = $_POST['pw'];
  $passcode = stripcslashes($passcode);
  $dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
  $error = mysqli_error($dbc);
  if (strlen($error) == 0) {
    mysqli_select_db($dbc,'amx_portal');
    $error = mysqli_error($dbc);
    if (strlen($error) == 0){
      $sql = "SELECT `ip`, `Session`,`Updated`,`Name`  FROM `Client` WHERE `Number` = $id ";
      $results = @mysqli_query($dbc,$sql);
      $error = mysqli_error($dbc);
      $rows = mysqli_num_rows($results);
      $validID = false ;
      if (strlen($error == 0 && $rows == 1)) {
        $validID = true ;
        $row = mysqli_fetch_array($results, MYSQLI_NUM);
        $client = $row[3];
        if ( true) {  // $row[18] == $sid ||
          $pass = true ;
          $_SESSION['amxs'] = $sid ;
          setcookie("amxc", $id,time()+900);
       //   echo '<p>PASS</p>' ;
        }
        else {
          $pass = false ;
          $y = "No password match";
          $sql = "SELECT *  FROM `Client` WHERE `Number` = 1 ";
   //       echo "<p>PW: $error</p>\n";
        }
      }
      else{
        $y = "id not found";
   //     echo "<p>CLI: $error</p>\n";
        $pass = false ;
      }
    }
    else {
  //    echo "<p>SEL: $error</p>\n";
      $y = "table error";
      $pass = false ;
    }
  }
  else {
  //  print "DBC: $error <br/>";
    $pass = false ;
    $y = "db error";
  }
}
$ip =  $_SERVER['REMOTE_ADDR'];
if ($ip == '99.3.150.55' || $ip == '173.162.23.21' ){
  $admin = true;
}
else{
  $admin = false;
}

echo '<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>
</title>
<link rel="stylesheet" href="https://dev.amxemr.com/jquery.mobile-1.1.0.min.css" />
        <style>
#result {color:#ff0;}
.mobile{width:90%;margin:0 auto 0;}
.tablet{width:80%;margin:0 auto 0;}
.desk{width:80%;margin:0 auto 0;}
.head1 {width:25%;}
.head2 {width:20%;}
.head3 {width:20%;}
.head4 {width:34%;}
.row1 {width:25%;background:none;text-align:left;}
.row2c {width:20%;background:none;color:#ff0;}
.row2a {width:20%;background:none;color:#0ff;}
.row3 {width:20%;background:none;}
.row4t {width:34%;color:#0f9;background:none;}
.row4r {width:34%;color:#ff0;background:none;}
.row4a {width:34%;color:#f00;background:#000;}
.row4c {width:34%;color:#3bf;}
.center{text-align:center;margin:0 auto 0;}
.left {text-align:left;}
.small {font-size:small;font-weight:400 padding:0;margin:0;}
.max {max-width:400px;margin:0 auto 0}
.ui-btn-text {text-align:left;font-size:.9em;}
form{display:inline;}
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
        </script>
        <script src="https://dev.amxemr.com/jquery.mobile-1.1.0.min.js">
        </script>
</head>
<body>
<div data-role="page" data-theme="a" id="page1">
 <div data-theme="a" data-role="header" data-position="fixed">
  <h3>Allermetrix</h3>
  <a data-role="button"  rel="external" data-ajax="false" href="https://dev.amxemr.com/logout.php">
  Logout
  </a>
  </div>
  <div data-role="content" class="desk">';

if ($pass) { 
  
  echo '
<div id="clsp" data-role="collapsible" data-collapsed="true">
<h2>Search &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;' . $client   . '</h2>
<form action="https://dev.amxemr.com/search.php" method="POST" data-ajax="false">
<div  class="left">

<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="code">
  Patient ID
  </label>
  <input id="code" name="code" placeholder="Begins With" value="" type="search" />
 </fieldset>
</div>
<hr/>
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="name">
  Patient Last Name
  </label>
  <input id="name" name="name" placeholder="Leave Blank for All" value="" type="search" />
 </fieldset>
</div>

<hr/>


<div class="max">
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup" data-type="vertical">
 <input name="daysOn" id="daysOn" type="checkbox" checked/>

 <label for="daysOn">Use Days for Search</label>
</fieldset>
</div></div>

<div class="max">
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="days">
  Days
  </label>
  <input type="range" name="days" id="days" value="' . "$days" . '" min="1" max="60" data-highlight="true" data-theme="" data-track-theme="d" />
 </fieldset>
</div>
<input type="hidden" name="L1" value="0" />
<input type="hidden" name="L2" value="100" />
 <input type="submit" data-icon="check" data-iconpos="left" value="Submit" />
</div>
</div>
</form>
<p><br/></p>
<hr/>
</div>
' ;
}
else {
}
if (true) {  //$pass
   
  $saveDays = $days;
  if ($daysOn == 'on') {
    $daysOn = true;
    $saveDays = $days;
    $d = time() - (($saveDays + 1) * 86400);
    $searchDate = date('Y-m-d', $d);
    $range = " in the Past $days day";
    if ($days > 1) {
     $range .= 's';
    } 

  }
  else {
    $days = 4096;
    $daysOn = false;
    $saveDays = 0;
    $d = mktime(0, 0, 0, 3, 3, 2006);
    $searchDate = date('Y-m-d', $d);
    $range = ' in all Patients';
 }

  if (isset($_POST['L1'])) {
    $L1 = $_POST['L1'];
  }
  else {
    $L1 = 0;
  }
  if (isset($_POST['L2'])) {
    $L2 = $_POST['L2'];
  }
  else {
    $L2 = 100;
  }
 if ($L1 > 0) {
   $sql = urldecode($_POST['sql']) . ' ' . $L1 . ', ' . $L2 . ';' ;
   $code = $_POST['term'];
   $termLength = strlen($code);
   if ($termLength == 0) {
      $termLength = 1;
    }
 }
 elseif (strlen($name) > 0 ) {
  $sql = "SELECT SQL_CALC_FOUND_ROWS *  FROM `Patient` WHERE `Client` = $id AND `last` LIKE '$name%' AND  `Date` > '$searchDate' ORDER BY `Last` ASC LIMIT $L1, $L2 ";
  $searchType = 1;
  $type = "Name: $name ";
  $termLength = 1;
}
elseif (strlen($code) > 0) {
  $sql = "SELECT SQL_CALC_FOUND_ROWS * FROM Patient WHERE `Client` = $id   AND `Date` > '$searchDate'   AND  (`ClientID` LIKE '$code%' || `Patient` LIKE '$code%')  LIMIT $L1, $L2 ";
  $searchType = 2;
  $type = "Patient ID: $code ";
  $termLength = strlen($code);
}
 elseif ($daysOn) {
  $sql = "SELECT SQL_CALC_FOUND_ROWS  *  FROM `Patient` WHERE `Client` = $id  AND `Date` > '$searchDate' ORDER BY  `Last` ASC, `First` ASC LIMIT $L1, $L2 ";
  $searchType = 4;
  $type = "";
  $termLength = 1;

}
else {
  $not = 'Patient Last Name or ID not Entered';
  $found = 'Recortd found with no query??';
  $sql = " SELECT SQL_CALC_FOUND_ROWS *  FROM `Patient` WHERE `Client` = $id AND `Date` > '2006-03-03'  ORDER BY `Last` LIMIT $L1, $L2 ";
  $termLength = 1;
}
$results = array(); 
$results = @mysqli_query($dbc,$sql);
$error = mysqli_error($dbc);
$el = strlen($error);
$rows = @mysqli_num_rows($results);

if ($el > 0) {
  $recs = "None Found ";
}
else {
  $rows = mysqli_num_rows($results);
}
if ($rows == 0 || $rows == false){
  $recs = "None Found";
}
elseif ($rows == 1) {
  $recs = "1 Record Found ";
}
elseif ($rows == 100) {
  $more = @mysqli_query($dbc,"SELECT FOUND_ROWS()");
  $moreRows = mysqli_fetch_array($more, MYSQLI_NUM);
  $moreRows[0] -= $L1;
  if ($moreRows[0]  > $rows) {
    $recs = $moreRows[0]  . " Records Found, 100 Shown ";
  }
  else {
    $recs = "100 Records Found ";
  }
}
else {
  $recs = "$rows Records Found ";
}
echo "<h2>$recs $type $range</h2>";
echo '<div data-role="controlgroup" data-type="horizontal"   class="para">
<a class="head1" href="#" data-role="button" data-inline="true" data-theme="e" >Name</a>
<a class="head2" href="#" data-role="button" data-inline="true" data-theme="e">Patient ID</a>
<a class="head3" href="#" data-role="button" data-inline="true" data-theme="e">Date</a>
<a class="head4" href="#"  data-role="button" data-inline="true" data-theme="e">Status</a></div>';
while ($row = @mysqli_fetch_array($results, MYSQLI_NUM)) {
  $positive = "";
  $details = '<a href="amxemr.php?code=' . "$row[1]" . '"><img src="view.jpg" width="24" height="24" /></a>' ;
  $d = strtotime($row[2]);
  $patientDate = date( 'm-d-y',$d);
  if ($row[8] != 'C' && time() - strtotime($row[2]) > 2592000) {
    $call = true;
  }
  elseif ($row[8] == 'L' OR  $row[8] == 'V') {
    $status = "Received";
	$pdf = 'row4r" href="#"  data-icon="check" ' ;
  }
  elseif ($row[8] == 'I'){
    $status = "Sendout  Due " . date('m-d-y',($d + 7 * 86400));
	$pdf = 'row4t" href="#"  data-icon="gear" ' ;
  }
  elseif ($row[8] == 'W'){
    if (date(N,$d) > 3 ) {
      $status = "Testing  Due " . date('m-d-y',($d + 4 * 86400));
    }
    else {
      $status = "Testing  Due " . date('m-d-y',($d + 2 * 86400));
    }
    $pdf = 'row4t" href="#"  data-icon="gear" ' ;
	;
  }
  elseif ($row[8] == 'C'){
    $status = "Complete PDF";
    $path = "pdf.php?p=$row[1]";
	$pdf = 'row4c"  data-icon="plus" href="https://dev.amxemr.com/' . "$path" . ' " target="_blank" ' ;
    $tresults = @mysqli_query($dbc,$sql);
	$positive = number_format(mysqli_num_rows($tresults),0);
  }
  elseif ($row[8] == 'Q'){
    $pdf = 'row4a" href="#"  data-icon="delete" ' ;
    $status = "QNS";
  }
  elseif ($row[8] == 'X'){
    $pdf = 'row4a" href="#"  data-icon="delete" ' ;
    $status = "Void";
  }
  elseif ($row[8] == 'H'){
    $pdf = 'row4a" href="#"  data-icon="delete"  ' ;
    $status = "On Hold";
  }
  if (strlen(trim($row[9])) < $termLength) {
    $clientID = 'Not Given'; //substr($row[1],0,3) . ' ' . substr($row[1],3,3);
    $class = 'a';
  }
  else {
    if ($searchType & 2) {
      if (substr(strtoupper(trim($row[9])),0,$termLength) == strtoupper($code)) {
         $clientID = $row[9];
         $class = 'c';
      }
      else {
        $clientID = substr($row[1],0,3) . ' ' . substr($row[1],3,3);
        $class = 'a';
      }
    }
    else {
      $clientID = $row[9];
      $class = 'c';
    }
  }
echo <<<EOT
<div data-role="controlgroup" data-type="horizontal"  class="para">
<a class="row1" href="#" data-role="button" data-inline="true">$row[3], $row[4]</a>
EOT;
if (true){ //$admin){
  echo '<a class="row2' . $class . '" href="https://dev.amxemr.com/diet.php?sub=1&amp;p=' . $row[1] . '" data-role="button" data-inline="true"  target="_blank" data-ajax="false" rel="external" >' . $clientID . '</a>';
}
  else{ 
  echo '<a class="row2' . $class . '" href="#" data-role="button" data-inline="true">' . $clientID . '</a>';
}

echo '<a class="row3" href="#" data-role="button" data-inline="true">' . $patientDate . '</a>';

if ($d < mktime(0, 0, 0, 7, 27, 2009) || $call == true) {
  $call = false;
 echo '<a class="row4a"data-icon="alert" data-role="button" data-inline="true"   >Call Allermetrix</a>';
}
else {
  echo '<a class=" ' . "$pdf " . ' data-role="button" data-inline="true"  target="_blank" data-ajax="false" rel="external" >' . "$status " . '</a>';
}
echo '</div>';                                                                       
//echo '<form method="post" data-ajax="false" rel="external" action="pdf.php"><input type="submit" name="submit" value="' . $status . '"><input type="hidden" name="c" value="' . $row[0] . '"><input type="hidden" name="p" value="' . $row[1] . '"></form>';
//<form method="post" action="pdf.php"><input class="row4c"  data-icon="plus"  data-inline="true" type="submit" name="submit" value="' . $status . '"></form>

//<input type="hidden" name="c" value="' . $row[0] . '"><input type="hidden" name="p" value="' . $row[1] . '">
//

}

if ($moreRows[0] > 1) {
$time = (microtime(1) - $start) / 1000;
  $L1 += 100;
  $L2 = 100;
  $sql = urlencode(preg_replace('/LIMIT.*$/i', 'LIMIT',$sql)); 
echo '<form method="post" action="https://dev.amxemr.com/search.php">
<input type="hidden" name="term" value="' . $code . '"/>
<input type="hidden" name="L1" value="' . $L1 . '"/>
<input type="hidden" name="L2" value="' . $L2 . '"/>
<input type="hidden" name="sql" value="' . $sql . '"/>
<p class="small">Query Results Time ' . number_format($time,6) . ' Seconds<br>' . $admin . ': ' . $ip . '</p>
<input type="submit" name="submit" value="Next">
</form>
';
}

}
else { echo'
<div class="head1">
<h2 class="center">Session Expired</h2>
<a data-role="button" data-transition="fade" rel="external" data-ajax="false" href="https://dev.amxemr.com/logout.php" data-icon="delete" data-iconpos="left">Allermetrix Website</a>
<a data-role="button" data-transition="fade" href="https://dev.amxemr.com/" data-icon="star" data-iconpos="left">Log In</a>
</div>
';
}
if (false) {
  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL $days DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
  $results = @mysqli_query($dbc,$sql);
  $error = mysqli_error($dbc);
  if (strlen($error) == 0){
    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
    while ($row = mysqli_fetch_array($results, MYSQLI_NUM) AND $row[0] > 3) {
      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
    }
  }
}
//}
//  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL 333 DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
//  $results = @mysqli_query($dbc,$sql);
//  $error = mysqli_error($dbc);
//  if (strlen($error) == 0){
//    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
//    WHILE ($row = mysqli_fetch_array($results, MYSQLI_NUM) AND $row[0] > 3) {
//      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
//    }
// }
  echo '
</div></div>
 <script>' . "
 $( '#clsp' ).expand(function() {
  alert('expand');
  //if ($rows == 0) {
  //  $('#result').css('color', '#fff');
 // }
   });
        </script>
  </body></html>";
if ($pass) {
  $sql = "UPDATE `Client` SET `days` = $saveDays,`LastVisit` = CURRENT_TIMESTAMP, `ip` = '" . $_SERVER['REMOTE_ADDR'] . "' WHERE `Number` = $id";
  $results = @mysqli_query($dbc,$sql);

}

?>
