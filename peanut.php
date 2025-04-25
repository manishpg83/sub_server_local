<?php
error_reporting(E_ERROR);
header('Content-Type: text/plain; charset=utf-8');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
//$data = file_get_contents('test.csv');echo "1\n";
//$data = explode("\n",$data);echo "2\n";
$types = array('',' IgE','#IgG','*IgG4');
$counts = array('F010'=> array(0,0,0,0),'F013'=> array(0,0,0,0),'F017'=> array(0,0,0,0),'F018'=> array(0,0,0,0),'F020'=> array(0,0,0,0),'F095'=> array(0,0,0,0),'F103'=> array(0,0,0,0),'F201'=> array(0,0,0,0),'F202'=> array(0,0,0,0),'F203'=> array(0,0,0,0),'F317'=> array(0,0,0,0),'F359'=> array(0,0,0,0),'F360'=> array(0,0,0,0),'F372'=> array(0,0,0,0),'G006'=> array(0,0,0,0),'T146'=> array(0,0,0,0),'W006'=> 0);
$count = array();
$codes = array('100','100-1','100-2','100-3','100-4','100-5','F010','F013','F017','F018','F020','F095','F103','F201','F202','F203','F317','F359','F360','F372','G006','T146','W006');
$totals = array('100','100-1','100-2','100-3','100-4','100-5');
$risks = array('F360','F359','F013','F095','F020','F018','F372');
foreach($codes as $code){ if (in_array($code, $totals)){continue;}
  $tests0[$code] = 0;
  $tests1[$code] = 0;
  $tests2[$code] = 0;
  $tests3[$code] = 0;
  $tests4[$code] = 0;
  $tests5[$code] = 0;
}
$patients = array();
$sql = "SELECT `accession` FROM `AllergyTests` WHERE `Code` LIKE 'F013' AND `Type`=1  ";
$results = mysqli_query($link,$sql);
while (list($accession) = mysqli_fetch_array($results, MYSQLI_NUM)){
  $patients[] = $accession;
}
$patients = array_unique($patients);
$included = count($patients);
foreach($patients as $accession){
  $accession = intval($accession);
  $allergens = array(); 
  $cnt = 0;
  $panel = 0;
  $total = 0;
  $sql = "SELECT `Code`,`Type`,`Score`,`Concentration`, Rast.description FROM `AllergyTests` JOIN Rast USING(`Code`)WHERE  `accession` = $accession AND `Type`=1;    ";
  $results = mysqli_query($link,$sql);
  if(mysqli_errno($link)){echo mysqli_error($link);echo "<br>$sql<br>";exit;}
  while (list($Code, $Type,$Score,$Concentration,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){
	 // if($Type != 1){continue;}
	  $Score = intval($Score);
	  
	//if($Code == 'F013'){
    //  if($Score < 1){$skip = TRUE; break;}
	//  $h2=$Concentration;
	//}
	$plus = ' ';
    if (in_array($Code, $risks) AND $Type == 1 AND $Score > 0) {$plus = '+';$panel++;}
    $pplus = ' ';
    if($Code == 'F013' AND $Type == 1 AND $Concentration > 14.99){$panel++; $pplus = '+';}
	
	if (in_array($Code, $totals)) {$total=$Concentration;continue;}
    if (in_array($Code, $codes)) {
	  $score = "$Score";
	  if($Score == 0){$score=' ';}
	  $allergens[] = "Class: $score$plus$pplus$types[$Type] $description $Code $Concentration ";
	  $descriptions[$Code] = $description;
	  $cnt++;
	  if($Score > 0){
	    $count0[$Code][$Type] = 1;
	  }
	  if($Score > 1){
	    $count1[$Code][$Type] = 1;
	  }
	  if($Score > 2){
	    $count2[$Code][$Type] = 1;
	  }
	  if($Score > 3){
	    $count3[$Code][$Type] = 1;
	  }
	  if($Score > 4){
	    $count4[$Code][$Type] = 1;
	  }
	  if($Score > 5){
	    $count5[$Code][$Type] = 1;
	  }

	}
  } //END OF ALLERGEN LOOKUP
  if($skip){$skip = FALSE;continue;}
  if($cnt > 16){
	$tplus = '';
	if($total > 0){
	  $sa = number_format($h2 / $total*100,1);
	  if($sa > 2){$panel++;$tplus = '+';$allergens[] = 'SA       +                             ';}
      $risk[] = array("Accession: $accession ","No. Tests: $cnt ","Total: $total kU/L ","SA: $sa% ","Risk Score: $panel",$allergens);
	}
	else{
      $risk[] = array("Accession: $accession ","No. Tests: $cnt ","Risk Score: $panel",$allergens);
 	}
	foreach($count0 as $code => $type){
	  $tests0[$code] += $type[1];
	}
	foreach($count1 as $code => $type){
	  $tests1[$code] += $type[1];
	}
	foreach($count2 as $code => $type){
	  $tests2[$code] += $type[1];
	}
	foreach($count3 as $code => $type){
	  $tests3[$code] += $type[1];
	}
	foreach($count4 as $code => $type){
	  $tests4[$code] += $type[1];
	}
	foreach($count5 as $code => $type){
	  $tests5[$code] += $type[1];
	}
  }
  
  $count0 = array();
  $count1 = array();
  $count2 = array();
  $count3 = array();
  $count4 = array();
  $count5 = array();
} //END OF PATIENT LOOK UP
//var_export($tests);
echo "$included Patients Compared\n";
echo "Patients with Ara h2 Class 2+\n\nAllergens with Class 1+\n";
foreach($tests0 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\nAllergens with Class 2+\n";
foreach($tests1 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\nAllergens with Class 3+\n";
foreach($tests2 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\nAllergens with Class 4+\n";
foreach($tests3 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\nAllergens with Class 5+\n";
foreach($tests4 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\nAllergens where Class = 6\n";
foreach($tests5 as $code => $count){
	$padded = '  ' . $count;
	$padded = substr($padded,-3);
	if($count == 0){$padded= '--';}
  echo "$padded $code $descriptions[$code] \n";
}
echo "\n\n";
var_export($risk);
?>