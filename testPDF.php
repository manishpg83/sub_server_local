<?php 
if (!$update) {
header('Content-Type: text/html; charset=utf-8');
header('Cache-Control:max-age=0');
echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>Update PreCheck</title>
<style type="text/css">body{font-size:.9em;margin-left:.7em;font-weight:400;background:#333;color:#fff} p{padding:0;margin:0;}.green{color:#0f0;}.red{color:#f00}.sm{font-size:.6em;color:#000}.bold{font-weight:700;}
.big{font-size:1.5em;}
.i{color:#f80;margin-left:.7em;font-size:1em;}
.w{color:#0f9;margin-left:.7em;font-size:1em;}
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
</style>
</head>
<body>
EOT;
}
include('/home/amx/php/class.pdf2text.php');
$a = new PDF2Text();
date_default_timezone_set('America/Menominee');
echo '<div id="status"><h3>' . date('l jS \of F Y') . '<br/> Current Time (Central) ' . date( 'g:ia (H:i)') . "</h3>\n\n";
$today = date('d') ;
$filename = "/home/amx/Z/buData/patient.tps";
$match = match($filename);
echo "<p$match[0]>patient.tps: " . date ("F d Y H:i ( g:ia ) ", filemtime($filename)) . '  ' . substr($filename,31) . "</p>\n";

$filename = "/home/amx/Z/buData/Client.tps";
$match = match($filename);
echo "<p$match[0]>Client.tps: " . date ("F d Y H:i ( g:ia ) ", filemtime($filename)) . '  ' . substr($filename,31) . "</p>\n";

$filename = "/home/amx/Z/buData/test.tps";
$match = match($filename);
echo "<p$match[0]> test.tps:  " . date ("F d Y H:i ( g:ia ) ", filemtime($filename)) . '  ' . substr($filename,31) . "</p>\n<hr/>";


  $dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
  $error = mysql_error();
  if (strlen($error) > 0){
    print "DBC: $error <br/>";
  }
  mysqli_select_db($dbc,'amx_portal');
  $error = mysql_error();
  if (strlen($error) > 0){
    print "</pre>\n<h3>SEL: $error </h3><pre>\n";
  }
  $sql = "SET time_zone = '-5:00';";
  @mysqli_query($dbc,$sql);
  $sql = "SELECT * FROM `Updates` WHERE 1 ORDER BY `TimeStamp` DESC LIMIT 1";
  $results = @mysqli_query($dbc,$sql);
  echo mysql_error(); 
$row = mysqli_fetch_array($results , MYSQLI_NUM);
if ($update){
echo $row[1] . '<hr/>';
}
else{
$lastUpdate = strtotime($row[0]);
$day = date("d", $lastUpdate);
$hour = date("H",$lastUpdate);
$minute = date("i",$lastUpdate);
$match = array();
$update = array();
$update[0] = $day;
$update[1] = $hour;
$update[2] = $minute;
if ($update[0] == $today){$class = ' class="green" ';}else{$class = ' class="red norm" ';}
$filename = "/home/amx/Z/buData/amxUpdate.SQL";
$bytes = number_format(filesize($filename));
$match = match($filename);
  if (strlen($error) > 0){
    print "</pre>\n<h3>add updates: $error </h3><pre>\n";
  }
  else {
   
  }

     
  if (strlen($error) > 0){
    echo "Last Update Unknown<br/>\n";
  }
else {
  echo "<p>Last Update: <span $class>&emsp;" . date("g:ia",$lastUpdate) . '&emsp;'  . date("l M. jS ",$lastUpdate)  . "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; </span> $row[1]</p>\n";
}
echo  "<p>Update Data: <span$match[0]>&ensp;" . date ("g:ia", filemtime($filename)) . '&emsp;' .date ("l M. jS ", filemtime($filename)) . " size: $bytes</span></p>\n";
echo $match[1] . '<hr/>';
}





$df = disk_free_space("/");
//$ds = disk_total_space("/");
$df = number_format($df);
//$ds = number_format($ds);
print "<p class=\"bold\">Free Disk Space: $df </p><hr/><div id=\"pdf\">xxxxx</div>";

// #########################################
// look for missing patients in the past 30 days and get the first patient number from 30 days ago.
// #########################################
$sql = "SELECT `patient`, `Date`  FROM `Patient` WHERE `Patient` > 146000 ORDER BY `Patient` DESC  ";
$results = @mysqli_query($dbc,$sql);
$missing = 0;
$row = mysqli_fetch_array($results , MYSQLI_NUM);
$next = $row[0];
$first = $next;
 while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
  $next--;
  if ($next != $row[0]) {
     $missing++;
     echo '<p>MISSING PATIENT #' . $next ; 
     if ($next - $row[0] > 1) {
       echo ' &emsp; ' . date('D M jS ' ,strtotime($row[1])) . ' &emsp; + the Next ' . ($next - $row[0] -1).' </p>';
       $missing += ($next - $row[0] -1);
     }
     else {
       echo  ' &emsp; ' . date('D M jS ' ,strtotime($row[1])) . ' </p>';
     }
     $next = $row[0];
  }
  if ((time() - 691200) < strtotime($row[1])) {
    $week = $row[0];
  }
  if ((time() - 2592000) < strtotime($row[1])) {
    $month = $row[0];
  }
}
$max = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $first);
if ($missing == 1) {
  echo "\n<p><span class='big bold red'>1 Missing Record </span> &emsp; Between 146 000 and $max &emsp; Since 11-11-2012 </p>";
}
elseif ($missing > 1) {
  echo "\n<p><br/><span class='big bold red'>$missing Missing Records</span>&emsp; Between 146 000 and $max &emsp; Since 11-11-2012 </p>";

}


//echo "Week: $week <br/> Month: $month <br/>";
$sql = "SELECT MIN(`Patient`),MAX(`Patient`),COUNT(*) FROM `Patient` WHERE (`Status` != \'L\' AND `Status` != \'V\' AND `Status` != \'W\' AND `Status` != \'C\' AND `Status` != \'X\' AND `Status` != \'I\')";
$results = @mysqli_query($dbc,$sql);
$row = @mysqli_fetch_array($results , MYSQLI_NUM);
$first = $row[0];
$last = $row[1];
//$sql = "SELECT `Client` , `Patient`, `Date`, `Status`  FROM `Patient` WHERE `Patient` > $month  AND  (`Status` != 'L' AND `Status` != 'V' AND `Status` != 'W' AND `Status` != 'C' AND `Status` != 'X' AND `Status` != 'I') ORDER BY `Patient` DESC";
$sql = "SELECT `Client` , `Patient`, `Date`, `Status` FROM `Patient` WHERE (`Status` != \'L\' AND `Status` != \'V\' AND `Status` != \'W\' AND `Status` != \'C\' AND `Status` != \'X\' AND `Status` != \'I\') ORDER BY `Patient` DESC";
$results = @mysqli_query($dbc,$sql);
if (true) { //(@mysqli_num_rows($results)) {
  echo "\n<p>$row[2] Patients From: $first To: $last ( status &lt;&gt; C,W,V,I, or L )</p>";
  while ($row = @mysqli_fetch_array($results , MYSQLI_NUM)) {       
    $date = strtotime($row[2]);
    $row[0] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[0]);
    $row[1] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[1]);
    echo ' "\n" .<p class="O">' . " Client: $row[0] &emsp; Patient: $row[1] &emsp; " . date("D M-jS",$date) . " Status = $row[3] </p>";
  }
}
echo "\n" . "<p>Status From: $first To: $week </p>";

 echo "\n" . '<p class="i">Sendouts</p>'; 
 $sql = "SELECT `Client` , `Patient`, `Date`, `Status`  FROM `Patient` WHERE `Patient` > $week AND (`Status` = 'I') ORDER BY `Patient` DESC";
 $results = @mysqli_query($dbc,$sql);
 while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
   $date = strtotime($row[2]);
   $row[0] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[0]);
   $row[1] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[1]);
   echo "\n" .  '<p class="i">' . "$row[1] &emsp; $row[0] &emsp; <span class=\"times\">$row[3]</span> &emsp; " . date("D M jS",$date) . "</p>";
 }
 echo "\n" . '<p class="v"><br/>Received</p>'; 
 $sql = "SELECT `Client` , `Patient`, `Date`, `Status`  FROM `Patient` WHERE `Patient` > $week AND (`Status` = 'L' OR `Status` = 'V') ORDER BY `Patient` DESC";
 $results = @mysqli_query($dbc,$sql);
 while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
   $date = strtotime($row[2]);
   $row[0] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[0]);
   $row[1] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[1]);
   echo "\n" . '<p class="v">' . "$row[1] &emsp; $row[0] &emsp; $row[3] &emsp; " . date("D M jS",$date) . "</p>";
 }
 echo "\n" . '<br/><p class="w">Testing</p>'; 
 $sql = "SELECT `Client` , `Patient`, `Date`, `Status`  FROM `Patient` WHERE `Patient` > $week AND `Status` = 'W' ORDER BY `Patient` DESC";

 $results = @mysqli_query($dbc,$sql);
 while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
   $date = strtotime($row[2]);
   $row[0] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[0]);
   $row[1] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[1]);
   echo "\n" . '<p class="w">' . "$row[1] &emsp; $row[0] &emsp; " . date("D M jS",$date) . "</p>";
 }
 echo "\n" . '<br/><p class="c">Complete</p>';

$sql = "SELECT MAX(`Patient`) FROM `Patient` WHERE `Status`='W' OR `Status`='V' OR `Status`='L'";
$results = @mysqli_query($dbc,$sql);
$row = mysqli_fetch_array($results , MYSQLI_NUM);
$last = $row[0];
$sql = "SELECT `Date`  FROM `Patient` WHERE `Patient` < $last LIMIT 1";
$results = @mysqli_query($dbc,$sql);
$row = mysqli_fetch_array($results , MYSQLI_NUM);
$date = strtotime($row[0]);
$days = array(10,9,9,8,8,8,10);
$dow = intval(date("w",$date));
$dy = $days[$dow] * 86400;
$dy2 = time()-$dy;
$date = date('Y-m-d',$dy2);

$sql = "SELECT `Patient` FROM `Patient` WHERE `Date` > '$date' ORDER BY `Patient` ASC LIMIT 1 ";
$results = @mysqli_query($dbc,$sql);
$row = mysqli_fetch_array($results , MYSQLI_NUM);
$first = $row[0] ;
//echo "<h4>dow:$dow<br/>dy: $dy<br/>date: $date<br/>1st: $first: $sql</h4>\n";

$checked = 0;
$in = ' `Patient` IN(';
//echo "<p>$sql<br/>GB=$goBack<br>1st=$first<br>check=$check</p>";
$missingPDF = 0;
$checkPDF = 0;
 $sql = "SELECT `Client` , `Patient`, `Date`,`PDF`  FROM `Patient` WHERE `Patient` > $first AND `Status` = 'C' ORDER BY `Patient` DESC";
 $results = @mysqli_query($dbc,$sql);
 if (mysqli_errno($dbc) > 0){echo mysql_error() . "<h4>$sql</h4>";}
  while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
    $date = strtotime($row[2]);
    if ($row[0] > 199999) { 
      $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]e.PDF";
    }
    else {
      $pdf = "/home/amx/Z/ResultsNoEncrypt/$row[0]/$row[1]s.PDF";
    }
    $search = $row[1];
    if ($row[1] > $week) {
      $row[0] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[0]);
      $row[1] = preg_replace('/(\d\d\d)(\d\d\d)/',"$1 $2" , $row[1]);
      echo "\n" . '<p class="c">' . "$row[1] &emsp; $row[0] &emsp; " . date("D M jS",$date) . "</p>";
    }
    if (!file_exists ( $pdf)){
      $date = strtotime($row[2]);
       $missingPDF += 1;
      echo "\n<p>&emsp;<span class='bold red'>PDF Not Found: </span>Patient: $row[1]&emsp; Client: $row[0] &emsp; File Name: " . substr($pdf,10) . "<br/><br/></p>";
    }
    else{
      if ($row[3] == 1){continue;}
      $checkPDF++;
	  echo "<p>pdf#: $checkPDF</p>";
       $a->setFilename($pdf);
      $a->decodePDF();
      $data = $a->output();
       $len = strlen($data);
       $pos = strpos($data,$search);
       if (pos){
         $in .= "$search,";
         $checked++;
       }
       else{
         $missingPDF += 1;echo "\n<p>&emsp;<span class='bold red'>INCORRECT ACCESSION NUMBER c=$row[0] p=$row[1]</span>\n";
       }
    }
  }

 if ($missingPDF > 1) {
   echo "\n" .  '<script type="text/javascript">function exp(){var box=document.getElementById("pdf");box.innerHTML = \'<h2 class="red">&emsp;' . $missingPDF . ' Missing PDFs Found</h2><hr/>\';box.style.display = "block";};exp();';  

 }
  elseif ($missingPDF == 1) {
    echo "\n" . '<script type="text/javascript">function exp(){var box=document.getElementById(\'pdf\');box.innerHTML = "<h2 class=\'red\'>&emsp;1 Missing PDF Found</h2><hr/>";box.style.display = \'block\';};exp();';   
  }
  else{
    echo "\n" . '<script type="text/javascript">';
  }
if ($update){   
    echo "\n var el = document.getElementById('page');\nel.style.display='none';\n function showUpdate(){var el = document.getElementById('page');\nel.style.display='block';}\n
    </script> ";
 }
 elseif ($missingPDF > 0){
   echo "\n" .  '</script>';
 }
  
// 


$sql = "SELECT `Client`, `TimeStamp`, `ip`, `Value` FROM `access` ORDER BY `TimeStamp` DESC LIMIT 0, 32";
$results = @mysqli_query($dbc,$sql);
if (mysqli_errno($dbc) > 0){echo mysql_error() . "<h4>$sql</h4>";}


echo "<h3>Client Log In</h3>";
 while ($row = mysqli_fetch_array($results , MYSQLI_NUM)) {
   if ($row[3] == 1) {
     $login = 'pass';
   }
   else {
     $login = 'fail';
   }
   echo $row[0] . '&emsp;&emsp; ' . date('D M jS h:mA' ,strtotime($row[1])) . '&emsp;&emsp; ' . $login . '<br/>';
}
if ($checkPDF > 0){
  $in = substr($in,0,-1) . ')';
  $sql = "UPDATE `Patient` SET `PDF`=1 WHERE $in";
  mysqli_query($dbc,$sql);
  echo mysql_error() . "<h4>$sql</h4>";
  if (mysqli_errno($dbc) > 0){echo mysql_error() . "<h4>$sql</h4>";}
  echo "<span class='bold red'>$checkPDF PDFs checked, $checked OK</span></div><hr/><pre>";
}

//var_dump($_SERVER);
//echo "\n\n Z/buData folder contents: \n\n";
//$php = php_ini_loaded_file ();
//echo "<h4>$php</h4>";
//echo system('ls -oa -G -g  -s -S -Q -t "/home/amx/Z/"');
//echo system('ls -R --sort=size -la -h "/home/amx/"');
//$data = system('ls -R --sort=size -la -h /home/amx/Z/ > /home/amx/Z/ls.txt');
function match($filename) {
  global $update ;
  $day = date("d", filemtime($filename));
  $hour = date("H", filemtime($filename));
  $minutes = date("i", filemtime($filename)) ;

  $date = getdate();
  $today = $date[mday];
  $class = ' class="red" ';
  $now = time();
  $time = $now % 86400;
  $filetime = filemtime($filename);
  $delta = $time - $filetime;

  if ($delta > $time)  {
    $warning .= '<h3 class="red">Update Data  **Not Today\'s Date</h3>';

  }
  else {
    $delta %= 60;
    $class = ' class="green" ';
    $LastUpdate = ($update[1] * 60 + $update[2]);
    $sqlDate = ($hour * 60 + $minutes);
    $delta = $LastUpdate - $sqlDate ;
    if($delta > 0) {
      $warning .= '<p class="red">Update Data is ' . $delta . ' minutes Stale</p>';
      
    }
    else {
      
      $warning .= "<div><br/><h3 class=\"green inline\">&emsp;Update Ready</h3><form class=\"inline\" action=\"https://dev.amxemr.com/update.php\" method=\"POST\">&emsp;<input class=\"link inline\" type=\"submit\" value=\"&emsp;Update&emsp;\" /></form></div>";
    }
  }
  return array($class,$warning );
}
?>
</pre>

</body></html>

