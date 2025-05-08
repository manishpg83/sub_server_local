<?php
set_time_limit(30);
ini_set('max_execution_time', '30');
$t = microtime(true);
if (!$update) {
  header('Content-Type: text/html; charset=utf-8');
  header('Cache-Control:max-age=0');
  echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>Update PreCheck</title>
<style type="text/css">body{font-size:.9em;margin-left:.7em;font-weight:400;background:#333;color:#fff} p{padding:0;margin:0;}.green{color:#0f0;}.red{color:#f00}.white{color:#fff}.sm{font-size:.6em;color:#000}.bold{font-weight:700;}
.big{font-size:1.5em;}
.i{color:#f80;margin-left:.7em;font-size:1em;}
.w{color:#0f9;margin-left:.7em;font-size:1em;}
.e{color:#af4;margin-left:.7em;font-size:1em;}
.p{color:#f08;margin-left:.7em;font-size:1em;}
.v{color:#ff0;margin-left:.7em;font-size:1em;}
.c{color:#3bf;margin-left:.7em;font-weight:400;font-size:1em;}
.O{color:#FFF;margin-left:1em;font-family:Times,serif;font-size:1em;}
.times{font-family:Times,serif;}
.norm{font-weight:400;}
.inline{display:inline;}
#pdf{display:none;}
.bold{font-weight:700;}
.link{display:inline;font-weight:700;background:#49f;text-align:center;padding:2px;border:0;margin:4px;}
.link:hover{background:#f00;color:#fff;}
.hide{display:none;}
</style>
</head>
<body>
EOT;
}


$dbc = mysqli_connect('localhost', 'amx', 'xD1GkuK7a7DK8!');
$error = mysqli_error($dbc);
if (strlen($error) > 0) {
  print "DBC: $error <br/>";
}
mysqli_select_db($dbc, 'amx_portal');
$error = mysqli_error($dbc);
if (strlen($error) > 0) {
  print "</pre>\n<h3>SEL: $error </h3><pre>\n";
}
$clients = array();
$checked = 0;
$missingPDF = 0;
$checkPDF = 0;
$skipped = 0;
$copy = array();
$times['PDF loop begins'] = microtime(true) - $t;
//echo $times['PDF loop begins'] . " P first= $first<br>";
$sql = "SELECT `Client` , `Patient`, `Date`,`PDF`  FROM `Patient` WHERE `Patient` > 110000 AND `Status` = 'C' ORDER BY `Patient` DESC";
$results = @mysqli_query($dbc, $sql);
if (!$results) {
  die("Query failed: " . mysqli_error($dbc));
}
$num = 0;
if (mysqli_errno($dbc) > 0) {
  echo mysqli_error($dbc) . "<h4>$sql</h4>";
}
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)) {
  if ($row[0] == 999999) {
    continue;
  }
  //$date = strtotime($row[2]);
  $num++;
  if ($num >= 50000) {
    break;
  }

  $date = strtotime($row[2]);
  $p = $row[1];
  if ($row[0] > 199999) {
    $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]e.PDF";
  } else {
    $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]s.PDF";
  }

  if (!file_exists($pdf)) {
    $date = date('m-d-y', strtotime($row[2]));
    $missingPDF += 1;
    $copy[$row[1]] = $row[0];
    echo "\n<p>$row[1],$row[0],$date</p>";
    $clients[$row[0]] = $clients[$row[0]] + 1;
  }

}
$times['PDF loop ends'] = intval(microtime(true) - $t);
//  echo $times['PDF loop ends'] . " PE<br>";
echo "<pre>Missing $missingPDF of $num<br>";
// var_export($copy);
echo '</pre>';
foreach ($copy as $patient => $client) {
  $sql = "SELECT `Client` FROM `Patient` WHERE `Patient` = $patient";
  $results = @mysqli_query($dbc, $sql);
  $found = mysqli_num_rows($results);
  if ($found == 2) {
    while (list($clients) = mysqli_fetch_array($results, MYSQLI_NUM)) {
      if ($clients != $client) {
        copy("/home/amx/Z/ResultsNoEncrypt/$clients/$patient" . "e.PDF", "/home/amx/Z/ResultsNoEncrypt/$client/$patient" . "e.PDF");
        echo "$patient $client $clients<br>";
        break;
      }
    }
  }

}

?>
</pre>

</body>

</html>