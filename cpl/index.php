<?php ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
include('/home/amx/public_html/404.shtml');exit;
$types = array('','IgE','IgG','IgG4');
$startTime = microtime(true);
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
echo "<html><head><style>.list{margin:0 0 0 1em;}h4{margin-top:0;}</style></head><body>\n";
exit;
$path = "orders/*.hl7";
$orders = glob($path);
$files = array();
foreach ($orders as $key => $filename) {
    list(,,$id) = explode('-',$filename);
    $id = substr($id,0,-4);
    $files[$id][] = substr($filename,7);
}
//var_export($files);
//arsort($files);
//var_export($files);exit;
$filename = '';
$savDate = '';
if(count($files)== 0){
	echo "<h2><br> • No HL7 Orders to Process</h2>";
	exit;
}
$warning = '';
foreach ($files as $id => $filenames){//var_export($filenames);continue;
  $count = count($filenames);
  if($count == 0){
	$warning .= "No files for $id<br>\n";
    continue;
  }
  $hidden = '';
  $logins = 0;
//  $warning = '';
  $ProcessFiles = 0;
  $skipped = 0;
  $filelist = "<p class=\"list\">\n";
  foreach($filenames as $filename){
    $posted = 0;
	$patientRecord = 0;
	$loginFile = "login/$id.txt";
    if (file_exists($loginFile)){
      $data = file_get_contents($loginFile);
      $lines = explode("\r\n",$data);
      $logins = count($lines) - 5;
      if($logins < 0){$logins = 0;}
    } 
    $sql = "SELECT  COUNT(*) FROM `cplTest` WHERE `ClientID`='$id'";  
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo "$sql\nerr1: " . mysqli_error($link) . "\n$sql\n";}
    list($records) = mysqli_fetch_array($results, MYSQL_NUM);
    $sql = "SELECT `Patient`,`Lastname` FROM `cplPatient` WHERE `ClientID`='$id'";
    $results = mysqli_query($link,$sql);
    if(mysqli_errno($link)){ echo "$sql<br>\nerr1: " . mysqli_error($link) . "<br>\n$sql<br>\n";}
    list($accession,$Lastname) = mysqli_fetch_array($results, MYSQL_NUM);
    if($accession > 1024 | strlen($Lastname > 0)){
      $patientRecord = 1;
    }  
    if(file_exists("results/$filename")){
	  $posted = 1;
	}
	if($records > 0 | $posted == 1 | $logins > 0 | $patientRecord == 1){
	  $warning .= "$count $records|p $posted|L $logins|pr $patientRecord <br>\n ";
	  $ProcessFiles++;
	  if(file_exists("/home/amx/public_html/cpl/orders/back/$filename")){
        $return = unlink("/home/amx/public_html/cpl/orders/$filename");
		if($return == true){
		   $warning .= "1. Deleted orders/$filename<br>\n"; 
		}
		$skipped++;
		continue;
	  }
	  $return = rename("/home/amx/public_html/cpl/orders/$filename","/home/amx/public_html/cpl/orders/back/$filename");
      if($return == true){		
	    $warning .= "2. orders/$filename => orders/back/$filename sucessful<br>\n";
	  }
	  else{
        $warning .= "2. orders/$filename => orders/back/$filename failed<br>\n";
	  }
      $skipped++;	  
      continue;
    }
	$ProcessFiles++;
    $filelist .= "•$filename<br>\n";  
    $hidden .= "<input type=\"hidden\" name=\"files[]\"  value=\"$filename\"/>\n";
  }  // end of patient
  
  if($ProcessFiles == 0 | strlen($hidden) < 1){
	$warning .= "<h4>No files processed $id, skipped $skipped of $count<br> <br></h4>\n";
	continue;
  }
  list($date,,) = explode('-',$filename);
  //if($savDate != $date AND $savDate <> ''){$filelist .= "===============================<br>\n";}
  $savDate = $date;
  echo "<form action=\"order.php\" method=\"post\">\n";
  echo "<button name=\"id\" value=\"$id\">$id</button>\n";
  echo $hidden;  
  echo $filelist . "</p></form>\n";
} //end of all files
echo $warning;
echo '</body></html>';
exit;
  $filename = "login/$id-x.txt";
  if (file_exists($filename)){
      $data = file_get_contents($filename);
      $lines = explode("\r\n",$data);
      $logins = count($lines) - 5;
      if($logins < 0){$logins = 0;}
      $filelist .= "$logins records already imported<br>\n";
      $ndx = 0;
      foreach($lines as $line){
        $ndx++;
        if($ndx < 6){continue;}
        $Code = substr($line,0,4);
        $Type = intval(substr($line,4));
        $sql = "SELECT `Code`,`Type`,`filename` FROM `cplTest` WHERE `ClientID`='$id' AND `Code`='$Code' AND `Type`= '$Type'";
        $result = mysqli_query($link,$sql);
        if(mysqli_errno($link)){ echo "<br>\nerr2: " . mysqli_error($link) . "\n$sql<br>\n";}
        list($Code,$Type,$filename) = mysqli_fetch_array($result, MYSQL_NUM);
        if(mysqli_errno($link)){ echo "<br>\nerr3: " . mysqli_error($link) . "\n$sql<br>\n";}
        $filelist .= "$Code $types[$Type].........$filename <br>\n";
      }
    }

?>

