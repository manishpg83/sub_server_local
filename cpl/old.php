<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"/><meta name="viewport" content="width=800"><title>CPL Patient Status</title>
<style>
table,td,tr{border:1px solid #000;border-collapse: collapse;}
.warn{color:#f00;font-size:1em;margin:0;padding:0;}
pre{margin:0;}
p{margin:0;padding:0;}
h2{margin:5px 0 5px 0;}
button{margin:0;padding:0;width:65px;}
form{display:inline-block;}
</style></head><body><pre>

EOT;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$cnts = array(0 ,23 ,35 ,47 ,59 ,71 ,83 ,95 ,107 ,119 ,131 ,143);


$sql = "SELECT `ClientID`,`Patient` FROM `cplPatient` WHERE 1";
$results = mysqli_query($link,$sql);
while(list($id,$accession ) = mysqli_fetch_array($results, MYSQLI_NUM)){$ids[$id] = $accession;}

$results = scandir('/home/amx/Z/PATRICK/apps/Results/');
foreach($results as $id){
  if(file_exists("/home/amx/Z/PATRICK/apps/Results/$id/upload.log")){
    $hl7 = glob("/home/amx/Z/PATRICK/apps/Results/$id/*.hl7");
    $cntFiles = count($hl7);
    $data = file_get_contents("/home/amx/Z/PATRICK/apps/Results/$id/upload.log");
    $size = strlen($data);
    $cnt = substr_count($data, $id);
    $patients[$cntFiles][] = array($id,$cntFiles,$cnt,$size);
//    echo "$id $cntFiles $size $cnt<br>\n";
  }
}
  
  foreach($patients as $cnt => $array){
    echo "<hr><h2>$cnt Expected $cnts[$cnt]</h2>\n";
    foreach($array as $data){
      if($data[2] == $cnts[$data[1]]){continue;}
      if(substr($data[0],0,1) == 'T'){continue;}
      echo "<p><form action=\"check.php\" method=\"post\"><button name=\"id\" value=\"$data[0]\" >$data[0]</button></form> $data[1] $data[2] $data[3] $data[4] " . $ids[$data[0]];
    }
  }

//var_export($patients);
exit;





$startTime = microtime(true);

date_default_timezone_set('America/Chicago');
$types = array('','IgE','IgG','IgG4');
$old = array('LJ638001' => 53,'FR169860' => 9,'UN316099' => 9,'FR104257' => 9,'FR169888' => 9,'CV743436' => 9,'BN026473' => 9,'BR935032' => 9,'QR784617' => 8,'MH610574' => 8,'BR971404' => 8,'LV339290' => 8,'M3544623' => 8);
arsort($old);
if(count($old) > 0){
  echo '</pre><table><tr><td>Client ID</td><td>Days</td><td>Accession</td><td>Status</td><td>HL7</td></tr>';
  foreach($old as $id => $days){
    $sql = "SELECT  `Patient`  FROM `cplPatient` WHERE `ClientID` = '$id'";
    //echo"$sql<br>";
    $results = mysqli_query($link,$sql);
    list($accession) = mysqli_fetch_array($results, MYSQLI_NUM);
    $accessions[$id] = $accession;
    if($accession > 200000){
      $sql = "SELECT  `Status` FROM `Patient` WHERE `Patient` = $accession";
    //  echo"$sql<br>";
      $results = mysqli_query($link,$sql);
      list($status) = mysqli_fetch_array($results, MYSQLI_NUM);
    }
    $path = "Results/$id/*.hl7";
    $results = glob($path);
    $cntFiles = count($results);
    echo "<tr><td>$id</td><td>$days</td><td>$accession</td><td>$status</td><td>$cntFiles</td></tr>";
  }
  echo '</table>';
}
echo '<pre>';
foreach($old as $id => $days){

  $path = "Results/$id/*.hl7";
  $results = glob($path);
  $cntFiles = count($results);
  echo "$id  $accessions[$id]\n";
  if($cntFiles == 0){
   echo " <span class=\"warn\"> No HL7 Results</span><pre>\n";
  }
  foreach($results as $filename){
    $text =  "  $filename\n";
    $text = str_replace('/',' ',$text);
    echo $text;
  }
  $sql = "SELECT `Code`,`Type`,`Conc`,`Score`,`filename`,`obr` FROM `cplTest` WHERE `ClientID` LIKE '$id' ";
  $results = mysqli_query($link,$sql);
  $cnt = 0;
  while(list($Code,$Type,$Conc,$Score,$filename,$obr ) = mysqli_fetch_array($results, MYSQLI_NUM)){
    $text =  "  Order $Code,$types[$Type],conc:$Conc,score:$Score,$filename,$obr\n";
    $text = str_replace('/',' ',$text);
    echo $text;
    $cnt++;
  }
  if($cnt == 0){$text = "No Orders Found\n";}
}

/*
$file = '/home/amx/cpl/public_html/cpl/Results/$id/upload.log';
$data = file_get_contents($file);
echo substr_count($data, 'J7074258') . " $file<br>\n";
echo str_replace('<DIR>','',$data);
echo "<hr>\n<br>\n<br>\n";
$file = '/home/amx/Z/PATRICK/apps/Results/MH610574/upload.log';
$data = file_get_contents($file);
echo substr_count($data, 'MH610574') . " $file<br>\n";
echo str_replace('<DIR>','',$data);
$file = '/home/amx/Z/PATRICK/apps/Results/QR784617/upload.log';
$data = file_get_contents($file);
echo "<hr><br><br>\n";
echo substr_count($data, 'QR784617') . " $file<br>\n";
echo str_replace('<DIR>','',$data);
echo "<hr>\n<br>\n<br>\n";
exit;
*/






?>





















