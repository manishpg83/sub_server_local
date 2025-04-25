<?php
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510');
$error = mysql_error();
if (strlen($error) > 0){
  print "DBC: $error <br/>";
}
mysql_select_db('amx_portal');
$error = mysql_error();
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
$results = @mysql_query($sql);
$error = mysql_error();
if (strlen($error > 0)) {
echo "<p>$error</p>";
}
$row = mysql_fetch_array($results, MYSQL_NUM);
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

  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN" "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="application/xhtml+xml;charset=utf-8"/>
<meta http-equiv="cache-control" content="max-age=300" />
<title>Allermetrix EMR Portal</title>
<style type="text/css">
body {background:#09768a; font-size:1em;font-family:Arial,serif;line-height:1.7em;margin:0;border:0;padding:0;}
h1 {color:#C32021;text-align:center;margin:0;padding:0;line-height:1.1em;font-size:1em;font-family:Arial,serif;}
h2 {color:#003230;text-align:center;font-size:1.7em;font-family:Arial,serif;}
h3 {color:#003230;text-align:right;font-size:1.4em;font-family:Arial,serif;border:0;margin:0 2% 0 0;padding:0;line-height:1.1em;}
h4 {color:#900000;text-align:center;font-size:1.4em;font-family:Arial,serif;border:0;margin:0;padding:0 0 1em;}
h5 {color:#003230;text-align:right;font-size:0.8em;font-family:Arial,serif;border:0;margin:0 2% 0 0;padding:0;line-height:1.1em;}

hr {color:#C32021;margin:0;padding:0;}
p{margin-left:10%; text-align:left;margin-right:10%;}
ul{list-style: none;padding:0;margin: 0;}

a {text-decoration:none;font-family:Arial,serif; font-size:1.8em;}

#head {background:#fff; width:100%; height:110px; text-align: left; padding:10px 0 10px;margin:0; border:1px; }
#search{background:#c6dfe3; width: 90%; text-align: center;  padding:20px 0 20px 0; margin:0 auto 0; }
img { float:left;border:0;}
.main {background:#c6dfe3; width: 90%; text-align: left;  padding:20px 0 20px 0; margin:30px auto 0; }


.color{ text-align:center;margin:0.1em;font-size:0.1em; }
#menu{background-color:#c6dfe3;margin:0 0 0 0;width:100%;font-size:1.5em;}
#menu ul {	 list-style: none; margin:0; padding:0;}
#menu li {display: inline;margin:0;padding:0;}
#menu a {	text-align: center;	color: #003230;	font-size: 1.4em;	float:left;	width: 33%;	display: block;	margin:0;	padding:5px 0 5px 0;	border-top:thick solid #C8D6BF;	border-bottom:thick solid #C8D6BF;}
#menu a:hover{background-color:#fff;color:#00f;font-weight: bold;text-decoration:underline;}
.left{text-align:left; margin-left:5%;}
.cntr{ text-align:center;margin:0 auto 0;}
input[type="text"] {font-size:1.4em;}
input.days {width:20%;font-size:1.4em; background-color:#80FFFF;text-align:left;}
table
{
border-collapse:collapse;
}

td
{
border:1px solid #000;
border-left:0;
border-right-color:#000;
border-bottom-color:#000;
text-align:center;

}
.yellow {background-color:#FFFF80; }
.blue { background-color:#80FFFF;text-align:left; }
#search td, th{border:0; }
.pick{width:2em;border-color:#9ec8cf; }
.status{width:5em; margin:0 auto 0;text-align:left;}
.date{width:10em; padding-left:0.5em;}
.pat{width:15em; padding-left:0.5em;}
.label{text-align:right; width:10em; padding:0;  font-weight:700; border-left-color:#9ec8cf;}
.button {
    border: none;
	margin:10px 2% 0;
    padding: 2px 0;
    width:6em;
}
.refresh{
    border: none;
	margin-left:40%;
    padding: 2px 0;
    width:10em; 
	font-size:1.2em; }
.search{
    border: none;
	margin:1em;
    padding: 2px 0;
    width:10em; 
	font-size:1.2em; }
.break{margin:0; padding:0;}
fieldset{border:0;margin:0;padding:0; }
#links {background:#9ec8cf; width: 90%; text-align: center;  padding:0; margin:5% auto 5%;border:0; }
#links img{border:0;margin:0;padding:0; }
#links td{margin:0;padding:0 0 0 10px; }
#links tr{border:0;margin:0;padding:0; }
#links th{font-size:0.9em;margin:0;padding:0; }
#links table{border:0;margin:0 auto 0;padding:0; }
#links form{border:0;margin:0;padding:0; }
#links input[type="image"]{border:0;margin:0;padding:0; }
#links input[type="hidden"]{border:0;margin:0;padding:0; }
.view{width:1.8em;text-align:center;padding:0; }
.details{ text-align:center;width:3em;border-bottom:1px solid #000;}
#menu a {	text-align: center;	display: block;	padding:0;	}
</style>  

</head>
<body>
<div id="head">
<a href="allermetrix.com">
<img src="amxlogo.jpg" width="332" height="100" alt="logo" title="Allermetrix"  /></a>' . "<h5>$client</h5><h5>$row[2]</h5><h5>$row[4] $row[5]</h5><h5>Last Login: $visit from $ip" . '</h5>
</div>
<div>
<p><br/></p>
</div>
<div id="search">
<p><br/></p>
<h2>Search</h2>
<form method="post" action="amxemr.php">
<table class="cntr" >
<tr><td class="label">Patient Last Name:</td><td class="left"><input class="blue" type="text" name="last" value="' . "$last" . '"  />1st letter(s) of Last</td></tr>
<tr><td class="label">Search Going Back:</td><td class="left"><input class="days"  type="text" name="sdays" value="14" /> Days</td></tr>
<tr><td class="label"></td><td></td></tr>
<tr><td class="label">Patient ID:</td><td class="left"><input type="text" name="code" value="" class="yellow" /></td></tr>

</table>
<fieldset>
<input type="hidden" name="id" value="' . "$id" . '" />
<input type="hidden" name="adays" value="' . "$adays" . '" />
<div class="cntr">
<input type="submit" name="submit" value="  Search  " class="search" />
</div>
</fieldset>
</form>
</div>
<div class="main">
<p><br/></p>';
print "\n";
$sql = 'SELECT *  FROM `iPatient` WHERE `Client` = ' . "$id" . ' AND  DATE_SUB( CURDATE( ) , INTERVAL ' . "$adays" . ' DAY ) <= `Date`ORDER BY `Last` ASC, `First` ASC, `Date` ASC ';
$results = @mysql_query($sql);
$rows = mysql_num_rows($results);
$error = mysql_error();
if ($rows == 0){
   echo '<h2>No Activity in the Past ' . $adays . ' Days</h2>';
}
else {  
    
    echo '<h2>Recent Activity </h2><h4>' . $rows . ' Records Found in Past ' . "$sdays" . ' Days</h4> 
          <form method="post" action="amxemr.php">
          <table class="cntr">
          <tr><th>View</th><th class="status">Status</th><th>Pos</th><th class="date">Expected/Complete</th><th>ID</th><th class="pat">Patient Name
		  </th></tr>' ;
  
WHILE ($row = mysql_fetch_array($results, MYSQL_NUM)) {
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
    $status = "Complete";
	$pdf = '<a href="' . "$row[1].pdf" . '"target="_blank"><img src="pdf.jpg" width="24" height="24" /></a>' ; 
    $sql = "SELECT count(*) as `rows`, `Code` FROM `iTest` WHERE `Assession` = " . "$row[1]" . " AND  `Status` = 'C' and `Score` between '1' and '6' group by `Code` order by `rows`";
    $tresults = @mysql_query($sql);
	$positive = number_format(mysql_num_rows($tresults),0);
  } 
  elseif ($row[8] == 'Q'){
    $status = "QNS";
  } 
  elseif ($row[8] == 'H'){
    $status = "On Hold";
  }
  $date = date ( "F j, Y" , $row[1] );
      echo '<tr><td class="details">' . "$pdf " . '</td><td class="status">' . " $status " . '</td><td>' . "$positive" . '</td><td class="date">' . "$row[2]" . '</td><td>' . "$row[9]" . '</td><td class="pat">' . "$row[3] $row[4]</td></tr>\n" ;
  
}
  echo '</table><p><br/></p></div>';
  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL 333 DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) == 0){
    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
    WHILE ($row = mysql_fetch_array($results, MYSQL_NUM) AND $row[0] > 3) {
      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
    }  
  }
  echo '</table><p><br/></p></div>';
}
}  
  $sql="SELECT COUNT(*) AS `ROWS`, `Test`.`Score`,  SUBSTR( `Test`.`Code`,1,1) FROM Patient, Test WHERE ((`Patient`.`Client` =$id) AND (`Patient`.`Date` > DATE_SUB( CURDATE( ) , INTERVAL 333 DAY) AND (`Patient`. `Status` = 'C')) AND (`Test`.`Assession` =`Patient`.`Patient`) AND   (`Test`.`Type` = 1 ) AND (`Test`.`Score`  BETWEEN '1' AND '6')) GROUP BY SUBSTR( `Test`.`Code`,1,1) ,  `Test`.`Score` ORDER BY  `ROWS`  DESC LIMIT 20";
  $results = @mysql_query($sql);
  $error = mysql_error();
  if (strlen($error) == 0){
    echo '</div><div class="main"><h2>Past Year IgE Results</h2><h2> with Score 1+</h2><table class="cntr"><tr ><th># = Score</th><th  class="cntr">Score</th><th  class="status">Allergen</th></tr>';
    WHILE ($row = mysql_fetch_array($results, MYSQL_NUM) AND $row[0] > 3) {
      print "<tr><td class='status'>$row[0]</td><td>$row[1]</td><td>$row[2]</td></tr>";
    }  
  }
  echo '</table><p><br/></p></div>';

  
  $sql = "UPDATE `Client` SET `LastVisit` = CURRENT_TIMESTAMP, `ip` = '" . $_SERVER['REMOTE_ADDR'] . "' WHERE `Number` = $id";
  $results = @mysql_query($sql);
  $error = mysql_error();
  echo '</div></body></html>';

?>


