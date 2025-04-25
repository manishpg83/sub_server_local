<?php
$ip = explode('.',$_SERVER['REMOTE_ADDR']);
$id = array_sum($ip);

$tab = intval($_POST['tab']);
if($tab == 0){$tab = 1;}
$prior = intval($_POST['prior']);

$tabs = array('foods','food','pollen','environmental','chemicals','foods','',''); 
  $tf = array('',FALSE,TRUE);
  $excluded = intval($_POST['exclude']);
  if($excluded == 0){$excluded = 2;}
  $exclude = $tf[$excluded];
  $minTestCount = intval($_POST['minTestCount']);
  $minSummaryCount = intval($_POST['minSummaryCount']);

$inscore = '(';
if($prior > 0){
  $file = $tabs[$prior] . 'Base.jsn';
  $jsn = file_get_contents($file);
  $selected = json_decode($jsn,1);
  foreach($_POST as $code =>$value){// get posted checks
    $type = intval($value);
    if(substr($code,0,1) == 'a'){$selected[substr($code,1,4)][$value]=1;}
  }


  $jsn = json_encode($selected);
  $file = $id . $tabs[$prior] . '.jsn';
  file_put_contents($file,$jsn);
}
$score1 = array('','1,');
$score2 = array('','2,');
$score3 = array('','3,');
$score4 = array('','4,');
$score5 = array('','5,');
$checkmark = array('','checked');
  $check1 = intval($_POST['score1']);
  $check2 = intval($_POST['score2']);
  $check3 = intval($_POST['score3']);
  $check4 = intval($_POST['score4']);
  $check5 = intval($_POST['score5']);
$inscore = '(' . $score1[$check1] . $score2[$check2]  . $score3[$check3]  . $score4[$check4]  . $score5[$check5];
  $inscore = substr($inscore,0,-1) . ')';
  if(strlen($inscore) < 3){$inscore = '(1,2,3,4,5)';$check1 = 1;$check2 = 1;$check3 = 1;$check4 = 1;$check5 = 1;}
  
  $minScore = 1;
  if(intval($_POST['score1']) == 0){$minScore = 2;}
  if(intval($_POST['score2']) == 0){$minScore = 3;}
  if(intval($_POST['score3']) == 0){$minScore = 4;}
  if(intval($_POST['score4']) == 0){$minScore = 5;}
$rec = 1;


if($tab == 5){
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Allergen Association</title>
<style>
body{font:400 .7em Arial,sans-serif;}
#page,.ec{width:1010px;display:block;margin: 0 auto 0;}

input[type="number"] {width: 60px;font:700 2em Arial,sans-serif;text-align:center;}
legend{margin-top:10px;font-size:1.3em;}
input{font-size:1.1em;border-radius: 4px;}
input[type="radio"], input[type="checkbox"] {
    width: 1.3em;
    height: 1.3em;
    display: inline;
    margin: 1px;
    vertical-align: middle;
    position: relative;
    background: #333;
    background-color: rgb(51, 51, 51);
    color: #eee;
}
.neg{color:#000;background:#fff;font-weight:400;text-align:right;}
.food{color:#fff;background:#f00;}
.pollen{color:#000;background:#ff0;}
.mold{color:#000;background:#25d1df;}
.epithelium{color:#000;background:#25d1df;}
.dust{color:#000;background:#25d1df;}
.insect,.envir{color:#000;background:#25d1df;text-align:center;font-family:Times,serif;}
.ec{margin:1em 0 0 2em;width: 400px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, #99d2e5 0%, #191c6b 100%);}
.black{color:#000;}
.blue{color:#2577df;font-weight:700;}
.green{color:#1d8348;font-weight:700;} 
.orange{color:#e16d2d;font-weight:700;}
.red{color:#f00;font-weight:700;}
.darkred{color:#c22b21;font-weight:700;}
.hide{display: none;}
.center{text-align:center;}
.right{text-align:right;}
.inline{display:inline-block;}
.col{columns: 3 auto;max-width:1024px;margin:0 auto 0;}
.table{display:inline;}
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
.cw{width:170px;overflow:hidden;}
.box{display:inline;border: 1px solid blue;}
#checkboxes{padding-top:10px;}
.try{border:1px solid #f00;color: #fff;background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.link,.try{width: 250px;padding:0;margin:.7em 0 0 0;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;font: 700 2em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, #99d2e5 0%, #191c6b 100%);}
td{padding:0 4px 0 4px;}
.ledgend{width:20px;height:20px;display:inline-block;padding:2px 0 0 0;text-align:center; font-weight:700;}
.float{float:left;margin:20px 0 0 30px;font:700 1.1em Arial,sans-serif;}
.clear{clear:both;}
#grp{margin: 0 auto 0;height:208px;width:440px;}
</style><body><div id="page"><div><div class="box">

EOT;
//<button class="ec" onclick="ec('ec$rec')">Click for Patient Detail</button>
//<div id="ec$rec" class="col hide">

  ob_flush();
  $t = microtime(1);
  $classes = array(0=>'"black"',1=>'"blue"',2=>'"green"',3=>'"orange"',4=>'"darkred"',5=>'"red"',6=>'"red"',7=>'"red"','F'=>'"food"','G'=>'"pollen"','W'=>'"pollen"','T'=>'"pollen"','M'=>'"mold"','D'=>'"dust"','H'=>'"dust"','E'=>'"epithelium"','I'=>'"insect"','Z'=>'"dust"');
  $allergens = array();
  $data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
  $link = mysqli_connect('localhost','amx',$data,'amx_portal');
  $sql = "SELECT `Code`,`description` FROM `Rast` WHERE 1 ORDER BY `Code` ASC";
  $results = mysqli_query($link,$sql);
  while (list($code,$description) = mysqli_fetch_array($results, MYSQLI_NUM)){
    $allergens[$code] = $description;
  }
  $find = array();
  $must = array();
  $match = array();
  $tabs = array('','food','pollen','environmental','chemicals','foods','','');
  for($tab=1;$tab<4;$tab++){
    $file = $id . $tabs[$tab] . '.jsn';
    $jsn = file_get_contents($file);
    $selected = json_decode($jsn,1);
	foreach($selected as $code => $checks){
      if($checks[1] == 1){$find[]  = $code;$compare[$code] = 0;$checks[3] = 0;}
	  if($checks[3] == 1){$must[]  = $code;$compare[$code] = 0;}
	  if($checks[2] == 1){$match[] = $code;$compare[$code] = 0;}
	}
  }
  $counts = $compare;
  

$group=array('C005'=>'C','C006'=>'C','C007'=>'C','D001'=>'D','D002'=>'D','E001'=>'E','E004'=>'E','E005'=>'E','E008'=>'E','E009'=>'E','E010'=>'E','E011'=>'E','E012'=>'E','E013'=>'E','E014'=>'E','E015'=>'E','E070'=>'E','E071'=>'E','E072'=>'E','E073'=>'E','E082'=>'E','E085'=>'E','E086'=>'E','E100'=>'E','E101'=>'E','E102'=>'E','E103'=>'E','E111'=>'E','EZ04'=>'E','EZ06'=>'D','EZ07'=>'E','EZ12'=>'E','F001'=>'A','F002'=>'R','F003'=>'F','F004'=>'K','F005'=>'K','F006'=>'K','F007'=>'K','F008'=>'K','F009'=>'K','F010'=>'S','F011'=>'S','F012'=>'L','F013'=>'L','F014'=>'L','F015'=>'L','F016'=>'S','F017'=>'N','F018'=>'N','F019'=>'O','F020'=>'N','F021'=>'U','F022'=>'L','F023'=>'V','F024'=>'H','F025'=>'U','F026'=>'A','F027'=>'A','F028'=>'V','F029'=>'U','F030'=>'V','F031'=>'V','F032'=>'F','F033'=>'U','F034'=>'R','F035'=>'V','F036'=>'N','F037'=>'A','F040'=>'F','F041'=>'F','F044'=>'U','F045'=>'Y','F047'=>'V','F048'=>'V','F049'=>'U','F054'=>'V','F075'=>'A','F076'=>'R','F077'=>'R','F078'=>'R','F079'=>'K','F080'=>'H','F081'=>'R','F082'=>'R','F083'=>'A','F085'=>'V','F087'=>'U','F089'=>'S','F090'=>'K','F092'=>'U','F093'=>'N','F094'=>'U','F095'=>'U','F096'=>'V','F100'=>'U','F101'=>'F','F102'=>'K','F103'=>'N','F104'=>'U','F105'=>'U','F106'=>'A','F107'=>'F','F108'=>'V','F109'=>'O','F110'=>'O','F111'=>'F','F112'=>'S','F114'=>'N','F115'=>'V','F116'=>'H','F117'=>'R','F118'=>'F','F119'=>'F','F120'=>'F','F121'=>'F','F122'=>'V','F123'=>'F','F124'=>'U','F125'=>'K','F126'=>'L','F127'=>'U','F128'=>'U','F129'=>'U','F130'=>'N','F131'=>'K','F132'=>'U','F133'=>'A','F134'=>'U','F135'=>'V','F136'=>'H','F137'=>'S','F138'=>'U','F139'=>'U','F140'=>'S','F141'=>'S','F142'=>'L','F143'=>'S','F144'=>'S','F145'=>'V','F146'=>'S','F147'=>'R','F148'=>'S','F149'=>'V','F150'=>'S','F151'=>'S','F152'=>'V','F153'=>'U','F154'=>'L','F155'=>'U','F156'=>'S','F157'=>'K','F158'=>'A','F159'=>'S','F201'=>'N','F202'=>'N','F203'=>'N','F204'=>'F','F207'=>'H','F208'=>'U','F209'=>'U','F210'=>'U','F212'=>'V','F214'=>'V','F215'=>'V','F216'=>'V','F221'=>'N','F236'=>'R','F244'=>'V','F245'=>'A','F247'=>'H','F256'=>'N','F259'=>'U','F260'=>'V','F263'=>'S','F283'=>'S','F284'=>'A','F288'=>'U','F290'=>'H','F291'=>'V','F300'=>'L','F301'=>'L','F302'=>'L','F303'=>'L','F304'=>'K','F305'=>'U','F306'=>'F','F307'=>'R','F308'=>'S','F309'=>'S','F310'=>'H','F311'=>'F','F312'=>'F','F313'=>'S','F314'=>'S','F316'=>'S','F317'=>'N','F318'=>'Y','F319'=>'R','F329'=>'U','F337'=>'F','F338'=>'H','F339'=>'H','F340'=>'S','F341'=>'S','F342'=>'U','F343'=>'S','F344'=>'V','F345'=>'S','F346'=>'V','F347'=>'S','F348'=>'N','F349'=>'S','F350'=>'H','F351'=>'U','F352'=>'S','F353'=>'F','F354'=>'H','F355'=>'L','F356'=>'L','F357'=>'A','F358'=>'R','F359'=>'L','F360'=>'L','F361'=>'F','F363'=>'N','F364'=>'O','F365'=>'O','F366'=>'O','F369'=>'K','F370'=>'V','F372'=>'L','F373'=>'S','F374'=>'S','F376'=>'R','F378'=>'F','F379'=>'R','F380'=>'R','F381'=>'H','F382'=>'V','F387'=>'V','F388'=>'H','F392'=>'S','F393'=>'H','F394'=>'H','F395'=>'A','F396'=>'H','F398'=>'H','F404'=>'U','F406'=>'U','F407'=>'U','F408'=>'Y','F409'=>'S','F410'=>'A','F411'=>'R','F414'=>'V','F415'=>'V','F416'=>'A','F417'=>'L','F418'=>'U','FZ03'=>'O','FZ11'=>'K','FZ13'=>'N','FZ16'=>'N','G002'=>'G','G003'=>'G','G004'=>'G','G005'=>'G','G006'=>'G','G008'=>'G','G009'=>'G','G010'=>'G','G013'=>'G','G014'=>'G','G015'=>'G','G017'=>'G','G020'=>'G','G021'=>'G','G022'=>'G','G023'=>'G','G024'=>'G','G025'=>'G','G026'=>'G','GGG'=>'G','GZ08'=>'G','H001'=>'D','H002'=>'D','H010'=>'D','HZ05'=>'D','I001'=>'I','I002'=>'I','I003'=>'I','I004'=>'I','I005'=>'I','I006'=>'I','I007'=>'I','I010'=>'I','I011'=>'I','I012'=>'I','I014'=>'I','I016'=>'I','I070'=>'I','I206'=>'I','IZ17'=>'I','K001'=>'O','K002'=>'O','K082'=>'O','M001'=>'M','M002'=>'M','M003'=>'M','M004'=>'M','M006'=>'M','M008'=>'M','M009'=>'M','M010'=>'M','M011'=>'M','M012'=>'M','M013'=>'M','M014'=>'M','M016'=>'M','M018'=>'M','M019'=>'M','M020'=>'M','M021'=>'M','M022'=>'M','M023'=>'M','M024'=>'M','M025'=>'M','M026'=>'M','M027'=>'M','M030'=>'M','M031'=>'M','M032'=>'M','M033'=>'M','M034'=>'M','M035'=>'M','M036'=>'M','M037'=>'M','M038'=>'M','M039'=>'M','M040'=>'M','M041'=>'M','M042'=>'M','M043'=>'M','M044'=>'M','M045'=>'M','M046'=>'M','M047'=>'M','M048'=>'M','M049'=>'M','M050'=>'M','M052'=>'M','M061'=>'M','M062'=>'M','M063'=>'M','MZ02'=>'M','MZ15'=>'M','MZ17'=>'M','S001'=>'C','S002'=>'C','S003'=>'C','S004'=>'C','S006'=>'C','S007'=>'C','S008'=>'C','S009'=>'C','S010'=>'C','S011'=>'C','S013'=>'C','S015'=>'C','S016'=>'C','S017'=>'C','S018'=>'C','S020'=>'C','S021'=>'C','S022'=>'C','S023'=>'C','S024'=>'C','S025'=>'C','S026'=>'C','S027'=>'C','S028'=>'C','S029'=>'C','S030'=>'C','S032'=>'C','S033'=>'C','S034'=>'C','S035'=>'C','S036'=>'C','S037'=>'C','S038'=>'C','S042'=>'C','S043'=>'C','S044'=>'C','S045'=>'C','S046'=>'C','S049'=>'C','S051'=>'C','S052'=>'C','S053'=>'C','S054'=>'C','S055'=>'C','S056'=>'C','S057'=>'C','S058'=>'C','S059'=>'C','S060'=>'C','S061'=>'C','S062'=>'C','S072'=>'C','S073'=>'C','S074'=>'C','S075'=>'C','S078'=>'C','S079'=>'C','S080'=>'C','S081'=>'C','S082'=>'C','S083'=>'C','S085'=>'C','S086'=>'C','S087'=>'C','S089'=>'C','S090'=>'C','S091'=>'C','S093'=>'C','S114'=>'C','S115'=>'C','S124'=>'C','S125'=>'C','S130'=>'C','S145'=>'C','S214'=>'C','S215'=>'C','S216'=>'C','T001'=>'T','T002'=>'T','T003'=>'T','T004'=>'T','T005'=>'T','T006'=>'T','T007'=>'T','T008'=>'T','T009'=>'T','T010'=>'T','T011'=>'T','T012'=>'T','T013'=>'T','T014'=>'T','T015'=>'T','T016'=>'T','T017'=>'T','T018'=>'T','T019'=>'T','T020'=>'T','T021'=>'T','T022'=>'T','T023'=>'T','T072'=>'T','T100'=>'T','T101'=>'T','T102'=>'T','T103'=>'T','T104'=>'T','T105'=>'T','T106'=>'T','T107'=>'T','T108'=>'T','T109'=>'T','T110'=>'T','T111'=>'T','T112'=>'T','T114'=>'T','T115'=>'T','T116'=>'T','T117'=>'T','T118'=>'T','T119'=>'T','T120'=>'T','T121'=>'T','T122'=>'T','T123'=>'T','T124'=>'T','T125'=>'T','T126'=>'T','T127'=>'T','T128'=>'T','T130'=>'T','T131'=>'T','T132'=>'T','T133'=>'T','T134'=>'T','T136'=>'T','T137'=>'T','T138'=>'T','T139'=>'T','T140'=>'T','T141'=>'T','T142'=>'T','T143'=>'T','T144'=>'T','T145'=>'T','T146'=>'T','T147'=>'T','T148'=>'T','T149'=>'T','T150'=>'T','T151'=>'T','T152'=>'T','T153'=>'T','T154'=>'T','T155'=>'T','TZ01'=>'T','TZ09'=>'T','TZ13'=>'T','W001'=>'W','W002'=>'W','W003'=>'W','W004'=>'W','W005'=>'W','W006'=>'W','W007'=>'W','W009'=>'W','W010'=>'W','W011'=>'W','W013'=>'W','W014'=>'W','W015'=>'W','W016'=>'W','W018'=>'W','W019'=>'W','W020'=>'W','W021'=>'W','W100'=>'W','W101'=>'W','W102'=>'W','W104'=>'W','W105'=>'W','W106'=>'W','W107'=>'W','W109'=>'W','W111'=>'W','W112'=>'W','W113'=>'W','W114'=>'W','W115'=>'W','W116'=>'W','W117'=>'W','W118'=>'W','W119'=>'W','W121'=>'W','W122'=>'W','W123'=>'W','W124'=>'W','W125'=>'W','W126'=>'W','WZ10'=>'W','WZ16'=>'W');
$groupcounts = array('A'=>0,'C'=>0,'D'=>0,'E'=>0,'F'=>0,'G'=>0,'H'=>0,'I'=>0,'K'=>0,'L'=>0,'M'=>0,'N'=>0,'O'=>0,'R'=>0,'S'=>0,'T'=>0,'U'=>0,'V'=>0,'W'=>0,'Y'=>0);  
$groupnames = array('A'=>'Animal','C'=>'Chemical','D'=>'Dust','E'=>'Epithelium','F'=>'Fish','G'=>'Grass','H'=>'Shellfish','I'=>'Insect','K'=>'Grain','L'=>'Legume','M'=>'Mold','N'=>'Tree Nuts','O'=>'Misc','R'=>'Dairy','S'=>'Seeds Spices','T'=>'Tree Pollen','U'=>'Fruit','V'=>'Vegetable','W'=>'Weeds','Y'=>'Yeast');
$groupcat = array('A'=>'"food"','C'=>'"chem"','D'=>'"dust"','E'=>'"envir"','F'=>'"food"','G'=>'"pollen"','H'=>'"food"','I'=>'"envir"','K'=>'"food"','L'=>'"food"','M'=>'"envir"','N'=>'"food"','O'=>'"food"','R'=>'"food"','S'=>'"food"','T'=>'"pollen"','U'=>'"food"','V'=>'"food"','W'=>'"pollen"','Y'=>'"food"');  
  

if($minTestCount == 0){$minTestCount = 20;}
if($minSummaryCount == 0){$minSummaryCount = 10;}

  $sql = 'SELECT `accession`,`Code`,`Score`,`Code` FROM `AllergyTests2` WHERE `Type`=1 AND `Score` IN ' . $inscore . ' AND (';


//echo "<p>Finding elevated IgE antibodies for these allergens</p>\n";
$codes = '';
$or = '';
$saveFind = '';
foreach($find as $code){
  $saveFind .= "$allergens[$code], ";
  $codes .= "$or `Code`='$code'";
  $or = ' OR';
}
$saveFind = trim($saveFind," ,");
$saveMust = '';
foreach($must as $code){
  $saveMust .= "$allergens[$code],";
}
$saveMust = trim($saveMust,',');
$sql .= $codes;
$sql .= ')   ORDER BY `AllergyTests2`.`accession` ASC ';
//echo $sql;
$results = mysqli_query($link,$sql);
while (list($accession,$score,$code) = mysqli_fetch_array($results, MYSQLI_NUM)){
  $patients[$accession][0] = intval($patients[$accession]) + 1;
  $patients[$accession][1][] = $code;
  $patients[$accession][2][] = $score;
}
$TotalPatients = count($patients);
if($TotalPatients > 10000){
echo <<<EOT
</div>
$TotalPatients is too many, raise the Min Score<br> 
<form action="#" method="post">


<legend>Min Score</legend>
<input type="number" name="minScore" value="$minScore" min="0" max="6"/><br>

<legend>Min Test/Patient</legend>
<input type="number" name="minTestCount" value="$minTestCount" min="1" max="100"/> <br> 

<br><legend>Exclude Normal Results</legend>
<input type="radio" name="exclude" value="1" checked /> Exclude &emsp;&emsp;
<input type="radio" name="exclude" value="0" /> Show<br>

<input type="hidden" name="tab" value="5"/> 
<input type="hidden" name="prior" value="0"/>
<br><button>Try Again</button>
$saveFind
</form></div>
EOT;
exit;
}

if(count($match) > 0 ){
  echo "Checking these patients for these allergens:<br>";
  foreach($match as $code){
    echo "$code $allergens[$code]</br>";
    $codes .= "$or `Code`='$code'";
  }
}
if(count($must) > 0 ){$mText = "These allergens must be in results<br>";
  foreach($must as $code){
    $mText .= "$code $allergens[$code]</br>";
    $codes .= "$or `Code`='$code'";
  }
  $mustFind = count($must);
}

$c = 0;
$scores = array(0,0,0,0,0,0,0);
$unfiltered = 0;
$tcnt = 1;
$table = 'table';
foreach($patients as $accession => $value){
  $sql = "SELECT `Code`,`Concentration`,`Score`  FROM `AllergyTests2` WHERE `accession` = $accession AND `Type` = 1 AND (";
  $sql .= $codes;
  $sql .= ') ORDER BY `Code` ASC';
  $sql = "SELECT `Code`,`Concentration`,`Score`  FROM `AllergyTests2` WHERE `accession` = $accession  AND `Type` = 1";
  $results = mysqli_query($link,$sql);
  $found = array();
  $cnt = 0;
  $mustFound = 0;
  $patientScores = array();
  
  while (list($code,$conc,$score) = mysqli_fetch_array($results, MYSQLI_NUM)){
	if(substr($code,0,3) == '100'){continue;}
    $code = strtoupper($code);
    $found[] = array('code'=>$code,'conc'=>$conc,'score'=>$score);
	if(@in_array($code,$must)){$mustFound++;}
	$cnt++;
	$patientScores[$code] = $score;
  }
  if($mustFound < count($must)){continue;}
  if($cnt < $minTestCount){continue;}
  foreach($patientScores as $code => $score){
    $compare[$code] += $score;
	if($score > 0){
      $counts[$code] += 1;
	}
	else{
	 $negatives[$code] += 1;
	}
  }
  
  /*$sum = array_sum($scores) - $scores[0];
  if($sum < 40){$scores = array(0,0,0,0,0,0,0);continue;}
  if($mustFind > $mustFound){$scores = array(0,0,0,0,0,0,0);continue;}

 // if($cnt < 50){$scores = array(0,0,0,0,0,0,0);continue;}
  $percent = intval($sum / $cnt * 100);
  echo "<tr><td>$cnt</td><td>$sum</td><td>$percent</td><td>$scores[0]</td><td>$scores[1]</td><td>$scores[2]</td><td>$scores[3]</td><td>$scores[4]</td><td>$scores[5]</td><td>$scores[6]</td></tr>\n";
  $scores = array(0,0,0,0,0,0,0); 
  continue;
*/  
  
  $sum = 0;
  $c++;
  echo "<table class=\"$table\"><tr><td>$cnt Allergens $accession $tcnt</td><td>Class </td><td class=\"right\"> kU/L</td></tr>\n";
  $ACCESSIONS .= ", $accession";
  ksort($found);
  $text = '';
  foreach($found as $values){
	$score = $values['score']; 
	$code = $values['code'];
	$conc = $values['conc'];
	$sum += $score;
//continue;
	if($score == 0){
      if($exclude){continue;}
      $text .= "<tr id=\"$code" . "$type\" class=$classes[$score]><td class=\"cw\">" . $group[$code] . " $allergens[$code]</td><td class=\"center\">$score</td><td class=\"right\">$conc</td></tr>\n";
    }
	else{
      echo "<tr id=\"$code" . "$type\" class=$classes[$score]><td class=\"cw\">" .  $group[$code] . " $allergens[$code]</td><td class=\"center\">$score</td><td class=\"right\">$conc</td></tr>\n";
    }
  }

  echo "$text</table>\n";
 // if($tcnt == 3){$table = '';}
  if($tcnt == 4){echo "</div><div class=\"box\">";$tcnt=0;$table = 'table';}
  $tcnt++;

  ob_flush();
  if($c % 50 == 0){
	$rec++;
//    echo "</div>\n<button class=\"ec\" onclick=\"ec('ec$rec')\">Click for Patient Detail</button>\n<div id=\"ec$rec\" class=\"col hide\">";
  }
  $text = '';
  echo " ";
  $unfiltered++;
}

foreach($compare as $code => $score){
  $scores[$code] = $score;
  //$avg = number_format($score/$counts[$code],1);



 // $sort[$code] = $counts[$code];
  $sort[$code] = intval($counts[$code] / ($negatives[$code] + $counts[$code]) * 100);







}
$c = 0;
arsort($sort);

echo "</div></div><br><hr><p><br></p><div class=\"center\"><h3>$unfiltered $saveFind</h3></div><div class=\"col\">";

echo "<table>\n<tr><td> </td><td>Allergen</td><td class=\"center\">Class<br>0</td><td class=\"center\">Class<br>$minScore+</td><td>Class<br>Sum</td><td>Class<br>Avg</td><td>%</td></tr>\n";
foreach($sort as $code => $avg){
  if($counts[$code] < $minSummaryCount){continue;}
  $percent = intval($counts[$code] / ($negatives[$code] + $counts[$code]) * 100);
  if($percent <  $minSummaryCount){continue;}
  if($c++ > 98){break;}
  if($c == 34 OR $c == 67){echo "</table><table>\n<tr><td></td><td> Allergen</td><td class=\"center\">Class<br>0</td><td class=\"center\">Class<br>$minScore+</td><td>Class<br>Sum</td><td>Class<br>Avg</td><td>%</td></tr>\n";}
  $avg = number_format($scores[$code]/$counts[$code],1);
  $class = round($avg) + 1;
  $cat =  substr($code,0,1);
  $grp = $group[$code];
  $groupcount[$grp]++;
  $groupcounts[$grp] += $counts[$code];
  $groupavg[$grp] += $avg;  
 
  echo "<tr id=\"$code\" class=$classes[$class]><td class=$classes[$cat]>$grp</td><td> $allergens[$code]</td><td class=\"neg\">" . $negatives[$code] . "</td><td class=\"right\">" . $counts[$code] . "</td><td class=\"right\">" . $scores[$code] . "</td><td class=\"right\">$avg</td><td>$percent</td></tr>\n";
}                                                                                                                                    
$summaryRecs = $c;
 // var_export($compare);


echo "</table><br><br><br></div><div id=\"grp\"><div class=\"float\"><table>";

$t = number_format(microtime(1) - $t,3);
$ndx = 0;
$filtered = $TotalPatients - $unfiltered;
if(strlen($saveMust)>8){$saveMust = "Patient must have also been tested for: $saveMust";}
$noshow = array('','','checked');
$show = array('','checked','');
arsort($groupcounts);
foreach($groupcounts as $group => $counts){
  $groupavg[$group] = number_format($groupavg[$group] / $groupcount[$group],1);
  echo "<tr><td class=$groupcat[$group]>$group</td><td>$groupnames[$group]</td><td>" . intval($groupcount[$group]) . "</td><td>$counts</td><td>$groupavg[$group]</td></tr>\n";
  $ndx++;
  if($ndx == 10){echo "</table></div><div class=\"float\"><table>";$ndx = -2;}
}
echo <<<EOT
</table></div></div></div><div class="clear"></div>

<p> </p><div class="center">$saveMust<br>
$TotalPatients patients  with a Class of $minScore or greater for $saveFind were found.<br>
$filtered were Filtered for insufficient number of tests,<br> leaving $unfiltered to be analyzed taking $t seconds<br>$summaryRecs summary records 
<form action="#" method="post">
<legend>Include these class scores for $saveFind</legend> 
$check1 1 <input type="checkbox" name="score1" value="1" $checkmark[$check1]/><br>
$check2 2 <input type="checkbox" name="score2" value="1" $checkmark[$check2]/><br>
$check3 3 <input type="checkbox" name="score3" value="1" $checkmark[$check3]/><br>
$check4 4 <input type="checkbox" name="score4" value="1" $checkmark[$check4]/><br>
$check5 5 <input type="checkbox" name="score5" value="1" $checkmark[$check5]/><br>

<legend>Minimum Antigens Tested<br>for patient to be included.</legend>
<input type="number" name="minTestCount" value="$minTestCount" min="1" max="100"/> <br> 

<legend>To be included in the Summary<br>The antigen must have at least<br>this many Class $minScore+ positive results. </legend>
<input type="number" name="minSummaryCount" value="$minSummaryCount" min="1" max="1500"/> <br> 

<br><legend>Exclude or Show Negitive Results</legend>
<input type="radio" name="exclude" value="2" $noshow[$excluded] /> Exclude &emsp;&emsp;
<input type="radio" name="exclude" value="1" $show[$excluded]/> Show<br>

<input type="hidden" name="prior" value="0"/>
<br><button class="try" name="tab" value="5">Try Again</button><br>
<div id="checkboxes">
<br>Find: $saveFind<br>
$saveMust<br>
<button class="link" name="tab" value="1">Food</button>
<button class="link" name="tab" value="2">Pollen</button>
<button class="link" name="tab" value="3">Environmental</button>
</div>
</form></div><p> <br>  <br> <br>  <br>  <br> </p></div></body>";
<div id="ec"></div>
<script>
var prior = document.getElementById('ec');
var toggle = {'':"inline-block",none:"inline-block",'inline-block':"none"};
var disp = '';
function ec(id){
  var el = document.getElementById(id);
  disp = el.style.display;
  prior.style.display = 'none';
  el.style.display = toggle[disp];
  prior = el;
}
</script><pre>
EOT;
$ledgend = array('A'=>array('Animal','#d48e48'),'C'=>array('Chemical','#709cb7'),'D'=>array('Dust','#5d4b39'),'E'=>array('Epithelium','#d96e94'),'F'=>array('Fish','#d0985f'),'G'=>array('Grass','#ff0'),'H'=>array('Shellfish','#e9b69e'),'I'=>array('Insect','#03c8e6'),'K'=>array('Grains','#fed5a5'),'L'=>array('Legumes','#751e1e'),'M'=>array('Mold','#809374'),'N'=>array('Nuts,Tree','#ff0'),'O'=>array('Miscellaneous','#fff'),'R'=>array('Dairy','#cccacd'),'S'=>array('Seed and Spices','#a17f76'),'T'=>array('Trees','#ff0'),'U'=>array('Fruit','#e95d01'),'V'=>array('Vegtables','#589627'),'W'=>array('Weeds','#ff0'),'Y'=>array('Yeast','#ddc7a7'));
 foreach($ledgend as $group => $property){break;
    echo "<div class=\"ledgend\" style=\"background:$property[1];color:#000\"> $group </div class=\"inline\"> $property[0]</div><br>\n";
  
  }
//  var_export($groupcount); 
  echo '</body></html>';
  ob_flush();
  exit;
}


//   end of tab 5 ████████████████████████████████████████████████████████████████████████████████████████████████████
























 //save checked allergens from previous tab

ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$alpha = intval($_POST['Alpha']);
$ip = $_SERVER['REMOTE_ADDR'];
$id = str_replace('.','',$ip);

$tab = intval($_POST['tab']);
if($tab == 0){$tab = 1;}


echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Allergen Association</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{width:100%;font:400 0.8em Arial,sans-serif;margin:0;color:#000;padding:0;background:#fff; }
#page{margin:0 auto 0;padding:1em 0 0 1em;border:0;max-width:1366px;}
button{width:24%;}
button,.bold{font-weight:700;}
form,button,.inline{display:inline;}
.small{font-size:.9em;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto 0;}
.left,.selected{text-align:left;}
#left{width:135px;}
.selected{color:#0f0;}
.break{clear:both;}
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
.top20{border:1px solid #0f0;}
.btn,.link,.go{padding:0;margin:.7em 0 0 0;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, #99d2e5 0%, #191c6b 100%);}
.go{border:1px solid #f00;color: #fff;background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}

pre{padding:0;margin:0;color:#333;}
#alpha{margin-left:1em;width:15em;}
.alert{background:#f00;color:#fff;}
.col{columns: 4 auto;}
.cat{margin: 0 0 0 3em;font:700 1em Arial;display:inline-block;}
.gray{color:#aaa;}
table{display: inline-block;padding-right:2em;}
caption{font:700 1em Arial;text-align: left;}
.row{margin:0;padding:0;}
.cap{font:700 1em Arial,sans-serif;margin: 0 0 2px 2.5em;}
.cat{margin:2px 0 0 2.5em;}
.none{margin:0 0 0 4.3em;font:400 .7em Arial,sans-serif;}
.plusY{border-radius: 3px 3px 3px 3px;font:700 .7em Arial,sans-serif;margin:0 2px 0 0;padding:0 0 0 0;text-align:center;display:inline-block;width:12px;border:1px solid #ff0;background-color:#ff0;color:#000;}
.plusR{border-radius: 3px 3px 3px 3px;font:700 .7em Arial,sans-serif;margin:0 2px 0 0;padding:0 0 0 0;text-align:center;display:inline-block;width:12px;border:1px solid #f00;background-color:#f00;color:#fff;}
.blankR{border-radius: 3px 3px 3px 3px;font:700 .7em Arial,sans-serif;margin:0 2px 0 0;padding:0 0 0 0;display:inline-block;width:12px;border:1px solid #fff;background-color:#fff;color:#fff;}
.blankY{border-radius: 3px 3px 3px 3px;font:700 .7em Arial,sans-serif;margin:0 2px 0 0;padding:0 0 0 0;display:inline-block;width:12px;border:1px solid #fff;background-color:#fff;color:#fff;}
.row{margin:0;padding:0;}

.dchk{font:700 .8em Arial,sans-serif;display:inline-block;padding:0;margin:0;vertical-align: middle;position: relative;}
.dchk{text-align:left;}


.chk {margin: 0;display: inline-block;height:0;cursor: pointer;position: relative;}
.chk > span {color: #fff; padding: 0; margin:0; height:0; display: inline-block;}
.chk > input {height: 1.3em;width: 1.5em;margin:0 1px 0 1px;padding:4px 0 0 0 ;appearance: none; border: 1px solid #000;border-radius: 4px;outline: none;transition-duration: 0.4s;cursor: pointer;}
.chk > input:checked {border: 1px solid #000;}
.chk > input:checked + span::before {font-weight:700;content: '✓';color: #fff; display: block;text-align: center;position: absolute;left: 0.4rem;top: .15rem;}
.chk > input:active {border: 2px solid #000;}

.e  > input{background-color: #fff;}
.e  > input:checked{background-color: #f00;}
.e  > input + span::before {font:700 .8em Times,serif;content: 'F';color:#999;display: block;text-align: center;position: absolute;left: 0.5rem;top: 0.2rem;}

.g4 > input{background-color: #fff;}
.g4 > input:checked{background-color: #00f;}
.g4 > input + span::before {font:700 .8em Times,serif;content: 'I';color:#999;display: block;text-align: center;position: absolute;left: 0.5rem;top: 0.2rem;}

.g  > input{background-color: #fff;}
.g  > input:checked{background-color: #ff0;}
.g  > input + span::before {font:700 .8em Times,serif;content: 'M';color:#999;display: block;text-align: center;position: absolute;left: 0.35rem;top: 0.2rem;}

.g4,.e > input:checked + span::before {color: #fff;}
.g > input:checked + span::before {color: #000;}
</style>
</head><body><div id="page">$ip[0].$ip[1].$ip[2].$ip[3] $id $tab
<form action="#" method="post">
EOT;
ob_flush();
$file = $id . $tabs[$tab] . '.jsn';
if(file_exists($file)){
  $jsn = file_get_contents($file);
}
else{
  $jsn = file_get_contents($tabs[$tab] . 'Base.jsn');
  file_put_contents($file,$jsn);
}
$selected = json_decode($jsn,1);
$cnt = count($selected);
if($cnt < 63){echo "No selected jsn: $tabs[$tab] $cnt $tab $file";exit;}

$top = array('F019','F357','H002','F395','H001','F372','F360','F290','W007','F359','E005','G006','E001','E004','W118','G005','E103','S034','G021','E011','G004','G008','GZ08','G022','T006','G003','G009','T148','G023','I005','HZ05','F247','I004','G010','M011','MZ17','F346','D001','T100','G024','F329','EZ06','D002','G002','T120','G017','I003','W101','F358','F076','F300','E102','T146','F001','E082','W117','G014','F013','W011','T102','F101','W016','F381','I070','WZ10','TZ01','WZ16','T108','F256','F017','E072','E010','T021','E073','W001','T133','T144','T132','F027','T116','F033','T105','W111','I001','F203','G015','FZ13','M030','F089','F078','M025','F305','M006','M016','M018','W010','W125','F107','T149','F129');

echo <<<EOT
<br>
<button class="link" name="tab" value="1">Food</button>
<button class="link" name="tab" value="2">Pollen</button>
<button class="link" name="tab" value="3">Environmental</button>
<button class="go"   name="tab" value="5">Next</button>
<div class="col">
EOT;
  echo "<p class=\"cap\">$caption</p>\n";
  foreach($selected as $code => $types){//var_export($types);continue;
      if($types[0] == 5){echo '<p class="cat">' . $selected[$code][4] . "</p>\n";$none = "<p class=\"none\">No " . $selected[$code][4] . '</p>';continue;}
      $pick = 'blankR';
      $pick2 = 'blankY';
      $rank = array_search($code, $top);
	  if($rank){$pick = 'plusR';}
      echo "<div class=\"row\"><div class=\"" . $pick . "\">$rank</div>
	    <div class=\"dchk\"><label class=\"e chk\"><input type=\"checkbox\" id=\"$code" . "1\" class=\"chk\" name=\"a$code" . "\" value=\"1\" " . $checkmark[$types[1]] . "/><span></span></label></div>
        <div class=\"dchk\"><label class=\"g chk\"><input type=\"checkbox\" id=\"$code" . "3\" class=\"chk\" name=\"a$code" . "\" value=\"3\" " . $checkmark[$types[3]] . "/><span></span></label></div>
        <div class=\"dchk\"><label class=\"g4 chk\"><input type=\"checkbox\" id=\"$code" . "2\" class=\"chk\" name=\"a$code" . "\" value=\"2\" " . $checkmark[$types[2]] . "/><span></span></label></div>
        <div class=\"inline\">&nbsp;" . $types[4] . $checkmark[$types[4]] . "</div></div>\n\n";
      $none = '';
  }
  
  

  
echo <<<EOT
<input type="hidden" name="prior" value="$tab"/>
<input type="hidden" name="exclude" value="$excluded"/>
<input type="hidden" name="minTestCount" value="$minTestCount"/>
<input type="hidden" name="minSummaryCount" value="$minSummaryCount"/>
<input type="hidden" name="minScore" value="$minScore"/>
<input type="hidden" name="score1" value="$check1"/>
<input type="hidden" name="score2" value="$check2"/>
<input type="hidden" name="score3" value="$check3"/>
<input type="hidden" name="score4" value="$check4"/>
<input type="hidden" name="score5" value="$check5"/>
</div></form><hr><br><br></div></div></div></body></html>
<script>
wait(1000);
window.scrollTo(0, document.body.scrollHeight);
function ec{
  
}
</script>
EOT;
ob_end_flush();
?>













