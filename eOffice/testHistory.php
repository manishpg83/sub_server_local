<?php ob_start("ob_gzhandler");
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$client = intval($_COOKIE['amxc']);
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Test History</title>
<style>body{font-size:1em;padding: 0 0 0 20em;}.head{font:700 1.1em Arial,sans-serif;margin:10px 0 2px 0;}</style><body>
EOT;


$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');


$html = array(1 => 'mother',2 => 'father',3 => 'brother',4 => 'sister',5 => 'grandparent mother',6 => 'grandparent father',7 => 'chest tightness',8 => 'coughing',9 => 'frequent infections',10 => 'shortness of  breath',11 => 'swelling of throat',12 => 'wheezing',13 => 'eczema',14 => 'flushing',15 => 'hives',16 => 'itching',17 => 'rashes',18 => 'red bumps',19 => 'swelling of lips',20 => 'bloating',21 => 'colic',22 => 'cramps',23 => 'diarrhea',24 => 'nausea',25 => 'vomiting',26 => 'headaches',27 => 'itchy, red, watery eyes',28 => 'loss of smell',29 => 'nasal congestion',30 => 'nasal pain',32 => 'sinus pressure or pain',33 => 'sneezing',34 => 'ear infections',35 => 'ear pain',36 => 'hearing loss',37 => 'itchy ears',38 => 'sinus infection',39 => 'sinus pressure',31 => 'runny nose',40 => 'vertigo',41 => 'anaphylaxis',42 => 'cannot sleep',43 => 'loss of consciousness',44 => 'low blood pressure',45 => 'in morning',50 => 'inside house',55 => 'at bedtime',60 => 'outside during morning',46 => 'in afternoon',51 => 'when cleaning',56 => 'windy days',61 => 'outside during night',47 => 'in evening',52 => 'after eating',57 => 'warm days',62 => 'during yard work',48 => 'at work',53 => 'in basement',58 => 'cold days',63 => 'near animals',49 => 'at school',54 => 'in bedroom',59 => 'on clear days',64 => 'near farms/barns',65 => 'January',66 => 'February',67 => 'March',68 => 'April',69 => 'May',70 => 'June',71 => 'July',72 => 'August',74 => 'October',75 => 'November',76 => 'December',79 => 'bird',87 => 'guinea pig',78 => 'cat',81 => 'hamster',85 => 'chicken',80 => 'horse',93 => 'cow',90 => 'parakeet',77 => 'dog',91 => 'parrot',88 => 'duck',84 => 'pig',92 => 'pigeon',83 => 'goat',82 => 'rabbit',89 => 'goose',86 => 'sheep');
$checkbox = array();
$checkbox[1] = 'mother';
$checkbox[2] = 'father';
$checkbox[3] = 'brother';
$checkbox[4] = 'sister';
$checkbox[5] = 'grandparent';
$checkbox[6] = 'grandparent';
$checkbox[7] = 'chest tightness';
$checkbox[8] = 'coughing';
$checkbox[9] = 'frequent infections';
$checkbox[10] = 'shortness of  breath';
$checkbox[11] = 'swelling of throat';
$checkbox[13] = 'eczema';
$checkbox[20] = 'bloating';
$checkbox[14] = 'flushing';
$checkbox[21] = 'colic';
$checkbox[15] = 'hives';
$checkbox[22] = 'cramps';
$checkbox[16] = 'itching';
$checkbox[23] = 'diarrhea';
$checkbox[17] = 'rashes';
$checkbox[24] = 'nausea';
$checkbox[12] = 'wheezing';
$checkbox[18] = 'red bumps';
$checkbox[25] = 'vomiting';
$checkbox[19] = 'swelling of lips';
$checkbox[26] = 'headaches';
$checkbox[34] = 'ear infections';
$checkbox[41] = 'anaphylaxis';
$checkbox[27] = 'itchy, red, watery eyes';
$checkbox[35] = 'ear pain';
$checkbox[42] = 'cannot sleep';
$checkbox[28] = 'loss of smell';
$checkbox[36] = 'hearing loss';
$checkbox[43] = 'loss of consciousness';
$checkbox[29] = 'nasal congestion';
$checkbox[37] = 'itchy ears';
$checkbox[44] = 'low blood pressure';
$checkbox[30] = 'nasal pain';
$checkbox[38] = 'sinus infection';
$checkbox[31] = 'runny nose';
$checkbox[39] = 'sinus pressure';
$checkbox[32] = 'sinus pressure or pain';
$checkbox[40] = 'vertigo';
$checkbox[33] = 'sneezing';
$checkbox[45] = 'in morning';
$checkbox[50] = 'inside house';
$checkbox[55] = 'at bedtime';
$checkbox[60] = 'outside during morning';
$checkbox[46] = 'in afternoon';
$checkbox[51] = 'when cleaning';
$checkbox[56] = 'windy days';
$checkbox[61] = 'outside during night';
$checkbox[47] = 'in evening';
$checkbox[52] = 'after eating';
$checkbox[57] = 'warm days';
$checkbox[62] = 'during yard work';
$checkbox[48] = 'at work';
$checkbox[53] = 'in basement';
$checkbox[58] = 'cold days';
$checkbox[63] = 'near animals';
$checkbox[49] = 'at school';
$checkbox[54] = 'in bedroom';
$checkbox[59] = 'on clear days';
$checkbox[64] = 'near farms/barns';
$checkbox[65] = 'January';
$checkbox[68] = 'April';
$checkbox[71] = 'July';
$checkbox[74] = 'October';
$checkbox[66] = 'February';
$checkbox[69] = 'May';
$checkbox[72] = 'August';
$checkbox[75] = 'November';
$checkbox[67] = 'March';
$checkbox[70] = 'June';
$checkbox[73] = 'September';
$checkbox[76] = 'December';
$checkbox[77] = 'dog';
$checkbox[78] = 'cat';
$checkbox[79] = 'bird';
$checkbox[80] = 'horse';
$checkbox[81] = 'hamster';
$checkbox[82] = 'rabbit';
$checkbox[83] = 'goat';
$checkbox[84] = 'pig';
$checkbox[85] = 'chicken';
$checkbox[86] = 'sheep';
$checkbox[87] = 'guinea pig';
$checkbox[88] = 'duck';
$checkbox[89] = 'goose';
$checkbox[90] = 'parakeet';
$checkbox[91] = 'parrot';
$checkbox[92] = 'pigeon';
$checkbox[93] = 'cow';
$checkbox = array(1 => 'mother',2 => 'father',3 => 'brother',4 => 'sister',5 => 'grandparent',6 => 'grandparent',7 => 'chest tightness',8 => 'coughing',9 => 'frequent infections',10 => 'shortness of  breath',11 => 'swelling of throat',13 => 'eczema',20 => 'bloating',14 => 'flushing',21 => 'colic',15 => 'hives',22 => 'cramps',16 => 'itching',23 => 'diarrhea',17 => 'rashes',24 => 'nausea',12 => 'wheezing',18 => 'red bumps',25 => 'vomiting',19 => 'swelling of lips',26 => 'headaches',34 => 'ear infections',41 => 'anaphylaxis',27 => 'itchy, red, watery eyes',35 => 'ear pain',42 => 'cannot sleep',28 => 'loss of smell',36 => 'hearing loss',43 => 'loss of consciousness',29 => 'nasal congestion',37 => 'itchy ears',44 => 'low blood pressure',30 => 'nasal pain',38 => 'sinus infection',31 => 'runny nose',39 => 'sinus pressure',32 => 'sinus pressure or pain',40 => 'vertigo',33 => 'sneezing',45 => 'in morning',50 => 'inside house',55 => 'at bedtime',60 => 'outside during morning',46 => 'in afternoon',51 => 'when cleaning',56 => 'windy days',61 => 'outside during night',47 => 'in evening',52 => 'after eating',57 => 'warm days',62 => 'during yard work',48 => 'at work',53 => 'in basement',58 => 'cold days',63 => 'near animals',49 => 'at school',54 => 'in bedroom',59 => 'on clear days',64 => 'near farms/barns',65 => 'January',68 => 'April',71 => 'July',74 => 'October',66 => 'February',69 => 'May',72 => 'August',75 => 'November',67 => 'March',70 => 'June',73 => 'September',76 => 'December',77 => 'dog',78 => 'cat',79 => 'bird',80 => 'horse',81 => 'hamster',82 => 'rabbit',83 => 'goat',84 => 'pig',85 => 'chicken',86 => 'sheep',87 => 'guinea pig',88 => 'duck',89 => 'goose',90 => 'parakeet',91 => 'parrot',92 => 'pigeon',93 => 'cow');
foreach($checkbox as $key => $text){
  $history['c' . $key] = $key;
}
/*

$food = $inhalantFoodTxt[2];
$inhalant = $inhalantFoodTxt[1];
$both = $inhalantFoodTxt[0];
$client = 301234;
$today = date('Y-m-d');
$last = 'smith';
$first = 'john';

  $jsn = json_encode($history);
  $history0 = mysqli_real_escape_string($link,$jsn);
  $sql = "INSERT INTO `history` (`id`, `client`, `date`, `last`, `first`, `dob`,`address`,`city`,`state`,`zip`,`history`) VALUES (NULL, $client, '$today', '$last', '$first', '$dob','$address','$city','$state','$zip','$history0')";
  mysqli_query($link,$sql);
  if(mysql_errno > 0){$err = "$sql\n" . mysqli_error($dbc);}
  $ndx = intval(mysqli_insert_id($link));
*/
$categories = array(9,1,1,2,2,3,3,4,4,4,4,4,4,5,5,5,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9);
$category = array(0=>0,1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0,9=>0,10=>0);
$inhalantFoodTitles = array('Inhalants and Foods','Inhalants','Foods');
$inhalantFoodTxt = array('','','');
$inhalantFoods = array(9,5,5,5,5,5,5,0,0,1,0,0,0,2,2,0,0,2,2,2,2,2,2,2,2,2,0,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
$month = array('month','month','month','month','month','month','month','month','month','month','month','month');
$today = date('Y-m-d');
$inhalantFood = array(0,0,0,0,0);
$animal = array('dog','cat','bird','horse',' hamster ','rabbit','goat','pig','chicken','sheep',' guinea pig ','duck','goose','parakeet','parrot','pigeon','cow');
$sub = intval($_POST['sub']);
$rec = intval($_POST['rec']);
if($rec == 0){$rec = intval($_GET['rec']);}
if($sub == 0 && $rec == 0){$sub = 4;$rec = 198;}

if($ip == '70.171.10.12' && $sub == 0){$bw = 'fff';$comment = '';$sub = 99;$rec = 198;}else{$bw = 'fff';$comment = '';}
  $sql = "SELECT `client`, `date`, `last`, `first`, `dob`,`state`, `gender`, `history` FROM `history` WHERE `id` = 2011";
  $results = mysqli_query($link,$sql);
  $sql .= "\n" . mysqli_error($link);
  list($client,$date,$last,$first,$dob,$state,$gender,$jsn) = mysqli_fetch_array($results, MYSQLI_NUM);
  $strdob = date('M j, Y',strtotime($dob));
  $date = date('M j, Y',strtotime($date));
  $history = json_decode($jsn,true);
  $diff = date_diff(date_create(),date_create($dob),true);
  $age = $diff->format('%y');
  if (count($history) > 0){
    foreach($history as $k => $v){
      $type = substr($k,0,1);
      if($type == 'a' && strlen($v) > 0){$animals[] = $v;continue;}
	  if($type == 'm'){$month[$v] = 'emp';continue;}
      $category[$categories[$v]] += 1; 
	  $symptomtxt[$categories[$v]] .= $checkbox[$v] . '<br/>';
      $inhalantFood[$inhalantFoods[$v]] += 1;
	  $inhalantFoodTxt[$inhalantFoods[$v]] .= "$checkbox[$v]<br/>\n";
	  $posted[$k] = $v;
    }
  }
//echo "$client,$date, $first $last, $dob, $state,\n$jsn";
$food = $inhalantFoodTxt[2];
$inhalant = $inhalantFoodTxt[1] ;
$both = $inhalantFoodTxt[0]; 
$symptoms[] = $inhalantFoodTxt[2];
$symptoms[] = $inhalantFoodTxt[1] ;
$symptoms[] = $inhalantFoodTxt[0]; 
$jsn = json_encode($symptoms);
$jsn = mysqli_real_escape_string($link,$jsn);
echo <<<EOT

<br>
<p class="head">Food Symptoms</p>
$food
<br>
<p class="head">Inhalant Symptoms</p>
$inhalant
<br>
<p class="head">Both Food and Inhalant Symptoms</p>
$both


EOT;
exit;
$checkboxes = array ( 1 => 'mother', 2 => 'father', 3 => 'brother', 4 => 'sister', 5 => 'grandparent', 6 => 'grandparent', 7 => 'chest tightness', 8 => 'coughing', 9 => 'frequent infections', 10 => 'shortness of breath', 11 => 'swelling of throat', 12 => 'wheezing', 13 => 'eczema', 14 => 'flushing', 15 => 'hives', 16 => 'itching', 17 => 'rashes', 18 => 'red bumps', 19 => 'swelling of lips', 20 => 'bloating', 21 => 'colic', 22 => 'cramps', 23 => 'diarrhea', 24 => 'nausea', 25 => 'vomiting', 26 => 'headaches', 27 => 'itchy, red, watery eyes', 28 => 'loss of smell', 29 => 'nasal congestion', 30 => 'nasal pain', 31 => 'runny nose', 32 => 'sinus pressure or pain', 33 => 'sneezing', 34 => 'ear infections', 35 => 'ear pain', 36 => 'hearing loss', 37 => 'itchy ears', 38 => 'sinus infection', 39 => 'sinus pressure', 40 => 'vertigo', 41 => 'anaphylaxis', 42 => 'cannot sleep', 43 => 'loss of consciousness', 44 => 'low blood pressure', 45 => 'in morning', 46 => 'in afternoon', 47 => 'in evening', 48 => 'at work', 49 => 'at school', 50 => 'inside house', 51 => 'when cleaning', 52 => 'after eating', 53 => 'in basement', 54 => 'in bedroom', 55 => 'at bedtime', 56 => 'windy days', 57 => 'warm days', 58 => 'cold days', 59 => 'on clear days', 60 => 'outside during morning', 61 => 'outside during night', 62 => 'during yard work', 63 => 'near animals', 64 => 'near farms/barns', 65 => 'January', 66 => 'February', 67 => 'March', 68 => 'April', 69 => 'May', 70 => 'June', 71 => 'July', 72 => 'August', 73 => 'September', 74 => 'October', 75 => 'November', 76 => 'December', 77 => 'dog', 78 => 'cat', 79 => 'bird', 80 => 'horse', 81 => 'hamster', 82 => 'rabbit', 83 => 'goat', 84 => 'pig', 85 => 'chicken', 86 => 'sheep', 87 => 'guinea pig', 88 => 'duck', 89 => 'goose', 90 => 'parakeet', 91 => 'parrot', 92 => 'pigeon', 93 => 'cow');
foreach($checkbox as $key => $text){
  echo "$text &nbsp&nbsp&nbsp;$html[$key]<br>\n";
}




foreach($history as $c => $key){
  echo "$key  $checkbox[$key]<br>\n";
}



