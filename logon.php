<?php
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
$error = mysqli_error($dbc);
if (strlen($error) > 0){
  print "DBC: $error <br/>";
}
mysqli_select_db($dbc,'amx_portal');
$error = mysqli_error($dbc);
  if (strlen($error) > 0){
    print "<2>SEL: $error </h2>";
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

$sql = "SELECT *  FROM `iClient` WHERE `Number` = $id ";
print "<p>$sql</p>";
$results = @mysqli_query($dbc,$sql);
$error = mysqli_error($dbc);
if (strlen($error > 0)) {
echo "<p>$error</p>";
}
$row = mysqli_fetch_array($results, MYSQLI_NUM);
if (strlen($error) > 0 or $row[12] <> $passcode ){
  $ch = curl_init();
  curl_setopt($ch, CURLOPT_URL, "http://www.amxemr.com/");
  curl_setopt($ch, CURLOPT_HEADER, 0);
  curl_exec($ch);
  curl_close($ch);     
}
else {
  $adays = $_POST['adays'];
  $sdays = 14;
  $ip     = $row[14];
  $visit  = $row[15];
  $client = $row[1];
  $email  = $row[9];

  if (strlen($row[10]) > 4) {
    $mobile ="Txt: " . $row[10];
  }
  else {
    $mobile ="";
  }

  

  echo '<?xml version="1.0" encoding="utf-8"?>

  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>
</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
<style type="text/css">
.mobile{width:90%;margin:0 auto 0;}
.tablet{width:80%;margin:0 auto 0;}
.desk{width:60%;margin:0 auto 0;}
.row1 {width:30%;text-align:left;}
.row2 {width:20%}
.row3 {width:20%}
.row4 {width:20%}
.center{text-align:center;margin:0 auto 0;}           
.small {font-size:small;font-weight:400}
.max {max-width:400px;margin:0 auto 0}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
</head>
<body>
<div data-role="page" datafullscreen="true" data-theme="a" id="page1">
 <div data-theme="a" data-role="header" data-position="fixed">
  <h3>Allermetrix</h3>
  <a data-role="button" data-transition="fade" href="#page1">
  Logout
  </a>
  <a data-role="button" data-transition="fade" href="#page1" data-icon="gear" data-iconpos="left">
  Settings
  </a>
  </div>
<div data-role="content" class="tablet">
<div data-role="collapsible" data-collapsed="true">
<h2>Search</h2>
<form url="amxemr.php" action="POST" data-ajax="false">
<div  class="left">
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="name">
  Patient Last Name
  </label>
  <input id="name" placeholder="Leave Blank for All" value="" type="search" />
 </fieldset>
</div>
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="id">
  Patient ID
  </label>
  <input id="id" placeholder="" value="" type="search" />
 </fieldset>
</div>
<div class="max">
<div data-role="fieldcontain">
 <fieldset data-role="controlgroup">
  <label for="days">
  Days
  </label>
  <input type="range" name="day" id="slider1" value="7" min="1" max="30" data-highlight="true" data-theme="" data-track-theme="d" />
 </fieldset>
</div>
 <input type="submit" data-icon="check" data-iconpos="left" value="Submit" />
</div>
</div>
</form>
<p><br/></p>
<hr/>
</div>';
print "\n";
$sql = 'SELECT *  FROM `iPatient` WHERE `Client` = ' . "$id" . ' AND  DATE_SUB( CURDATE( ) , INTERVAL ' . "$adays" . ' DAY ) <= `Date`ORDER BY `Last` ASC, `First` ASC, `Date` ASC ';
$results = @mysqli_query($dbc,$sql);
$rows = mysqli_num_rows($results);
$error = mysqli_error($dbc);
if ($rows == 0){
   echo '<h2>No Activity in the Past ' . $adays . ' Days</h2>';
}
else {  
    
    echo '<h2>Recent Activity </h2><h4>' . $rows . ' Records Found in Past ' . "$sdays" . ' Days</h4> 
          <form method="post" action="amxemr.php">
          <table class="cntr">';
  

  
WHILE ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
  $pdf = "-" ;
  $positive = "";
  $details = '<a href="amxemr.php?code=' . "$row[1]" . '"><img src="view.jpg" width="24" height="24" /></a>' ;
  
  if ($row[8] == 'L' OR  $row[8] == 'V') {
    $status = "In Process";
  }
  elseif ($row[8] == 'W'){
    $status = "Testing";
  } 
  elseif ($row[8] == 'C'){
    $status = "View PDF";
	$pdf = 'href="' . "$row[1].pdf" . '"target="_blank" ' ; 
    $sql = "SELECT count(*) as `rows`, `Code` FROM `iTest` WHERE `Assession` = " . "$row[1]" . " AND  `Status` = 'C' and `Score` between '1' and '6' group by `Code` order by `rows`";
    $tresults = @mysqli_query($dbc,$sql);
	$positive = number_format(mysqli_num_rows($tresults),0);
  } 
  elseif ($row[8] == 'Q'){
    $status = "QNS";
  } 
  elseif ($row[8] == 'H'){
    $status = "On Hold";
  }
  $date = date ( "F j, Y" , $row[1] );
   //   echo '<tr><td class="details">' . "$pdf " . '</td><td class="status">' . " $status " . '</td><td>' . "$positive" . '</td><td class="date">' . "$row[2]" . '</td><td>' . "$row[9]" . '</td><td class="pat">' . "$row[3] $row[4]</td></tr>\n" ;
echo '<div data-role="controlgroup" data-type="horizontal"  class="para">
<a class="row1" href="#" data-role="button" data-inline="true">' . "$row[3] $row[4]" . '</a>
<a class="row2" href="#" data-role="button" data-inline="true">' . "$row[9]" . '</a>
<a class="row3" href="#" data-role="button" data-inline="true">' . "$row[2]" . '</a>
<a class="row4" ' . "$pdf " . '" data-role="button" data-inline="true">' . "$status " . '</a>
</div>';

  
}
  echo '</table><p><br/></p></div>';
  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL 333 DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
  $results = @mysqli_query($dbc,$sql);
  $error = mysqli_error($dbc);
  if (strlen($error) == 0){
    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
    WHILE ($row = mysqli_fetch_array($results, MYSQLI_NUM) AND $row[0] > 3) {
      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
    }  
  }
  echo '</table><p><br/></p></div>';
}
}  
//  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL 333 DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
//  $results = @mysqli_query($dbc,$sql);
//  $error = mysqli_error($dbc);
//  if (strlen($error) == 0){
//    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
//    WHILE ($row = mysqli_fetch_array($results, MYSQLI_NUM) AND $row[0] > 3) {
//      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
//    }  
  // }
  echo '<p><br/></p></div>';

  
  $sql = "UPDATE `Client` SET `LastVisit` = CURRENT_TIMESTAMP, `ip` = '" . $_SERVER['REMOTE_ADDR'] . "' WHERE `Number` = $id";
  $results = @mysqli_query($dbc,$sql);
  $error = mysqli_error($dbc);
  echo '</div></body></html>';

?>


