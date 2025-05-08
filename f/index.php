<?php
//header('Content-Type: text/plain; charset=utf-8');var_export($_POST);exit;
$startTime = microtime(true);
$err = '';
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=@mysqli_connect('localhost','amx',$data);
@mysqli_select_db($dbc,'amx_portal');
$ip = $_SERVER['REMOTE_ADDR'];
$sub = intval($_POST['sub']);
if($sub == 0){$sub = intval($_GET['sub']);}
file_put_contents('food.export',"sub=$sub\n",FILE_APPEND);
$rec = intval($_POST['rec']);
if($rec == 0){$rec = intval($_GET['rec']);}
if($rec == 0){
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');

echo <<<EOT
<!DOCTYPE html><head><style>h1{color:#f00;}</style></head><body>
<h1 style="color:#000;">Under Construction</h1>;
<img src="underConstruction.jpg" />

</body></html>
EOT;
exit;


}
$client = intval($_POST['client']);
if($client == 0){$client = intval($_POST['id']);}
if($client == 0){$client = intval($_GET['id']);}
if($client == 0){$client = intval($_GET['c']);}


  $sql = "SELECT `client`,`date`,`last`,`first`,`dob`,`address`,`city`,`state`,`zip`,`gender`,`history`,`foods` FROM `history` WHERE `id` = $rec";
  $results = mysqli_query($dbc,$sql);
  $sqlf .= "\n" . mysqli_error($dbc);
  list($client,$date,$last,$first,$dob,$address,$city,$state,$zip,$gender,$history,$foods ) = @mysqli_fetch_array($results, MYSQLI_NUM);  


  $sql = "SELECT `Name`,`passcode`  FROM `Client` WHERE `Number` LIKE '$client' LIMIT 1";
  $results = mysqli_query($dbc,$sql);
  if(mysqli_errno($dbc) == 0 && mysqli_num_rows($results) == 1){
    list($name,$passcode) = mysqli_fetch_array($results, MYSQLI_NUM);
    if($passcode == $c){$match = true;}
  }

$clientName = "<h3>$client, $name</h3>";
if($sub == 3){include('/home/amx/public_html/f/request.php');exit;}
if($sub == 6){chdir('/home/amx/public_html'); include('/home/amx/public_html/requestForm.php');exit;}
if($sub == 14){chdir('/home/amx/public_html'); include('/home/amx/public_html/h/dashboard.php');exit;}
$action = intval($_POST['action']);
if ($action == 0){$action = intval($_GET['action']);}
$c = strtoupper(trim($_POST['c']));
$match = false; //passcode match
if(strlen($c)== 4){
  $sql = "SELECT `Name`,`passcode`,`Number`  FROM `Client` WHERE `passcode` LIKE '$c' LIMIT 1";
  $results = mysqli_query($dbc,$sql);
  if(mysqli_errno($dbc) == 0 && mysqli_num_rows($results) == 1){
    list($name,$passcode,$client) = mysqli_fetch_array($results, MYSQLI_NUM);
    if($passcode == $c){$match = true;}
  }
}
elseif($client > 199999 && $client < 1000000){
    if($passcode == $c){$match = true;}
    if($sub == 0 && $match){$sub = 16;}
}
else{
  $client = 0;
}
if( $sub == 64){   // PATIENT DONE WITH FOODS, SAVE
  file_put_contents('food.export',"Saving Food\n",FILE_APPEND);
  foreach($_POST as $code => $v){
    if(substr($code,0,1) == 'F'){
      $showE[$code] = $rank[1][$code]; //intval($rank[1][$code]);
      $showG4[$code] = $rank[3][$code]; // intval($rank[3][$code]);
      $ratedCount++;
      $descriptions[$code][1] = 1;
      $matches[$code] = 1;
    }
    elseif($k == 'C'){
      $limit = intval($v);
    }
  }  
  $save = var_export($showE,TRUE);
  file_put_contents('food.export',"showE: $save\n\n",FILE_APPEND);
  $save = var_export($showG4,TRUE);
  file_put_contents('food.export',"showG4: $save\n\n",FILE_APPEND);
  $food = array();
  $food['time'] = date("F j, Y, g:i a");
  $food['rec'] =  $rec; 
  $food[0] = $showE;
  $food[1] = $showG4;
  $food[2] = $desc;
  $food[3] = $matches;
  $food['post'] = $_POST;
  $save = var_export($food,TRUE);
  file_put_contents('food.export',"food: $save\n\n",FILE_APPEND);
  $foods = $food;
  $foods['limit'] = $limit;
  $save = var_export($foods,TRUE);
  file_put_contents('food.export',"foods: $save\n\n",FILE_APPEND);
  $today = date('Y-m-d');
  $jsn = json_encode($foods);
  switch (json_last_error()){
    case JSON_ERROR_NONE:$save = ' - No errors';  break;
    case JSON_ERROR_DEPTH:$save = ' - Maximum stack depth exceeded';  break;
    case JSON_ERROR_STATE_MISMATCH:$save = ' - Underflow or the modes mismatch';  break;
    case JSON_ERROR_CTRL_CHAR:$save = ' - Unexpected control character found';  break;
    case JSON_ERROR_SYNTAX:$save = ' - Syntax error, malformed JSON';break;
    case JSON_ERROR_UTF8:$save = ' - Malformed UTF-8 characters, possibly incorrectly encoded';break;
    default:$save = ' - Unknown error';break;
  }


  file_put_contents('food.export',"json error: $save\n\n",FILE_APPEND);
  file_put_contents('food.export',"jsn: $jsn\n\n",FILE_APPEND);
  $jsnFood = json_decode($jsn,1);
  $save = var_export($jsnFood,TRUE);
  file_put_contents('food.export',"jsnArray: $save\n\n",FILE_APPEND);
  $foods = mysqli_real_escape_string($dbc,$jsn);
  $sqlf = "UPDATE `history` SET `foods`='$foods' WHERE `id` = '$rec' ";
  mysqli_query($dbc,$sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysqli_error($dbc);}
  file_put_contents('food.log',"$ip $sqlf\n$err\n$jsn\n",FILE_APPEND);
  include('/home/amx/public_html/h/dashboard.php');
  exit;
  
}
if($sub == 32){  // Done with History, Save

  $posted = array();
  $posted['time'] = date("F j, Y, g:i a");
  foreach($_POST as $k => $v){
    $type = substr($k,0,1);
    if($type == 'a' && strlen($v) > 0){$animals[] = $v;$posted[$k] = $v;continue;}
    if($type == 'm'){$month[$v] = 'emp';$posted[$k] = $v;continue;}
    if($type != 'c'){continue;}
    $symptomtxt[$categories[$v]] .= $checkbox[$v] . '<br>';
    $category[$categories[$v]] += 1; //$scores[$v];
    $inhalantFood[$inhalantFoods[$v]] += 1;
    $inhalantFoodTxt[$inhalantFoods[$v]] .= "$checkbox[$v]<br>\n";
    $posted[$k] = $v;
  }
  $cnt = count($posted);
  $posted['cnt'] = $cnt;
  $jsn = json_encode($posted);
  $history = mysqli_real_escape_string($dbc,$jsn);
  $sqlf = "UPDATE `history` SET `history`='$history' WHERE `id` = '$rec' ";
  mysqli_query($dbc,$sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysqli_error($dbc);echo $err;}
  file_put_contents('history.log',"$ip $sqlf\n$err\n$jsn\n\n",FILE_APPEND);
}
if($sub == 0){
  $date = trim(urldecode($_POST['dob']));
  $strdob = preg_replace('/ /','',$date);
  $strdob = preg_replace('/-|\./','/',$strdob);
  $date = strtotime($strdob);
  if($date == 0){
    $strdob = '';
    $dobOK = false;
  }
  else{
    $strdob = date('m/d/Y',strtotime($strdob));
    $dobOK = true;
  }
  $tf = array();
  $tf[true] = 'true';
  $tf[false] = 'false';
  $tf[NULL] = 'null';
  $stateOK = false;
  $lastOK = false;
  if($dobOK === true || $sub == 16){$dobid='';}else{$dobid='id="dob"';}
  $gender = intval($_POST['gender']);
  $first = trim(urldecode($_POST['first']));
  $last = trim(urldecode($_POST['last']));
  if(strlen($last) > 1){$lastOK = true;};
  $address = trim(urldecode($_POST['address']));
  $city = trim(urldecode($_POST['city']));
  $states = array('X'=>false,'AK'=>'AK','AL'=>'AL','AR'=>'AR','AZ'=>'AZ','CA'=>'CA','CO'=>'CO','CT'=>'CT','DC'=>'DC','DE'=>'DE','FL'=>'FL','GA'=>'GA','HI'=>'HI','IA'=>'IA','ID'=>'ID','IL'=>'IL','IN'=>'IN','KS'=>'KS','KY'=>'KY','LA'=>'LA','MA'=>'MA','MD'=>'MD','ME'=>'ME','MI'=>'MI','MN'=>'MN','MO'=>'MO','MS'=>'MS','MT'=>'MT','NC'=>'NC','ND'=>'ND','NE'=>'NE','NH'=>'NH','NJ'=>'NJ','NM'=>'NM','NV'=>'NV','NY'=>'NY','OH'=>'OH','OK'=>'OK','OR'=>'OR','PA'=>'PA','RI'=>'RI','SC'=>'SC','SD'=>'SD','TN'=>'TN','TX'=>'TX','UT'=>'UT','VA'=>'VA','VT'=>'VT','WA'=>'WA','WI'=>'WI','WV'=>'WV','WY'=>'WY');
  $state = $states[strtoupper(trim(urldecode($_POST['state'])))];
//  $zip = intval($_POST['zip']);
//  if($zip > 9999 && $zip < 100000){$zipOK = true;}else{$zipOK = false;}
//  list($zstate) = mysqli_fetch_array(mysqli_query($dbc,"SELECT `state` FROM `zip` WHERE `zip` = $zip ORDER BY `longitude` ASC "), MYSQLI_NUM);
  if(strlen($state) == 2){
    $stateOK = true;
  //  if($zstate == $state){$stateOK = true;}
  }
}

if($sub == 0 && $match && $gender > 0  && $dobOK && $stateOK && $lastOK){
  $dob = date('Y-m-d',strtotime($strdob));
  $today = date('Y-m-d');
  $time = date('Y-m-d g:i a');
  $sqlf = "INSERT INTO `history` (`id`, `client`, `date`, `last`, `first`, `dob`,`address`,`city`,`state`,`zip`, `gender`) VALUES (NULL, $client, '$today', '$last', '$first', '$dob','$address','$city','$state','$zip', '$gender')";
  mysqli_query($dbc,$sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysqli_error($dbc);}
  $ndx = intval(mysql_insert_id());
  if($ndx > 0){$rec = $ndx;}
  $err = $sqlf . "\n" . mysqli_error($dbc);
  file_put_contents('history.log',"$ip $time $err\n\n",FILE_APPEND);

  include('/home/amx/public_html/h/index.php');
  exit;
}

if($sub == 4){  // DOC SELECT TESTS
$rank = array(array(),array(),array(),array());
$rankTxt = file_get_contents('rankIgE.txt');
$rankIgX = explode("\n",$rankTxt);
$cnt = 0;
foreach($rankIgX as $code ){
    $cnt++;
    $rank[1][$code] = $cnt;
}
//echo "<pre>Rank:  ";var_export($rank[1]);exit;
$rankTxt = file_get_contents('rankIgG4.txt');
$rankIgX = explode("\n",$rankTxt);
$cnt = 0;
foreach($rankIgX as $code ){
    $cnt++;
    $rank[3][$code] = $cnt;
}
  $food = json_decode($foods,true);
//echo "<pre>\nRank\n";var_export($rank);
  foreach($food[0] as  $code => $x){
    $showE[$code] = $rank[1][$code];
    $showG4[$code] = $rank[3][$code];
  }
  asort($showE);
  asort($showG4);
//echo "<pre>\nSE\n"; var_export($showE); var_export($showG4);exit;
//  $showE = $food[0];
//  $showG4 = $food[1];
  $desc = $food[2];
  $matches = $food[3];
  $_POST = $food[4];
  $diff = date_diff(date_create(),date_create($dob),true);
  $age = $diff->format('%y');
}
$s14 = 'none';
$s15 = 'none';
$s16 = 'none';
$checked[$gender] = 'checked="checked"';
$sex = array('','M','F');

$patient = "$last, $first $sex[$gender] $age";
$checked[$gender] = 'checked="checked"';
$num = 200;

/*

$sql = "SELECT `Code`, `description`,`shortdescription` FROM `Rast` WHERE 1 ORDER BY `Code`";
$results = mysqli_query($dbc,$sql);
while(list($code,$description,$shortdescription) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $desc[$code] = $description;
  $descriptions[$code][1] = 0;
//  $rank[0][$code] = $num;
//  $rank[1][$code] = 0;
//  $rank[3][$code] = 0;
//  $num++;
*/

/*
//$rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
//$rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);

//$rank[1] = array('F245'=>1,'F075'=>2,'F002'=>3,'F236'=>4,'F001'=>5,'F015'=>6,'F092'=>7,'F300'=>8,'F302'=>9,'F319'=>10,'F153'=>11,'F020'=>12,'F210'=>13,'F303'=>14,'F356'=>15,'F314'=>16,'F079'=>17,'F011'=>18,'F117'=>19,'F304'=>20,'F004'=>21,'F263'=>22,'F305'=>23,'F143'=>24,'F291'=>25,'F345'=>26,'F370'=>27,'F129'=>28,'F013'=>29,'F005'=>30,'F089'=>31,'F141'=>32,'F087'=>33,'F259'=>34,'F150'=>35,'F096'=>36,'F112'=>37,'F025'=>38,'F209'=>39,'F047'=>40,'F006'=>41,'F363'=>42,'F346'=>43,'F288'=>44,'F105'=>45,'F202'=>46,'F369'=>47,'F100'=>48,'F152'=>49,'F122'=>50,'F247'=>51,'F033'=>52,'F094'=>53,'F108'=>54,'F208'=>55,'F081'=>56,'F132'=>57,'F306'=>58,'F307'=>59,'F329'=>60,'F138'=>61,'F216'=>62,'F317'=>63,'F316'=>64,'F155'=>65,'F361'=>66,'F049'=>67,'F115'=>68,'F121'=>69,'F203'=>70,'F159'=>71,'F201'=>72,'F014'=>73,'F137'=>74,'F301'=>75,'F095'=>76,'F103'=>77,'F135'=>78,'F017'=>79,'F031'=>80,'F123'=>81,'F145'=>82,'F114'=>83,'F027'=>84,'F212'=>85,'F018'=>86,'F214'=>87,'F007'=>88,'F127'=>89,'F008'=>90,'F048'=>91,'F284'=>92,'F010'=>93,'F244'=>94,'F054'=>95,'F125'=>96,'F140'=>97,'F009'=>98,'F260'=>99,'F083'=>100,'F085'=>101,'F124'=>102,'F012'=>103,'F344'=>104,'F142'=>105,'F283'=>106,'F343'=>107,'F126'=>108,'F215'=>109,'F036'=>110,'F044'=>111,'F035'=>112,'F045'=>113,'F351'=>114,'F024'=>115,'F342'=>116,'F003'=>117,'F093'=>118,'F110'=>119,'F040'=>120,'F104'=>121,'F147'=>122,'F016'=>123,'F026'=>124,'F353'=>125,'F308'=>126,'F318'=>127,'F021'=>128,'F022'=>129,'F023'=>130,'F028'=>131,'F030'=>132,'F032'=>133,'F041'=>134,'F080'=>135,'F082'=>136,'F090'=>137,'F101'=>138,'F102'=>139,'F106'=>140,'F107'=>141,'F109'=>142,'F111'=>143,'F116'=>144,'F118'=>145,'F119'=>146,'F120'=>147,'F128'=>148,'F130'=>149,'F131'=>150,'F133'=>151,'F134'=>152,'F136'=>153,'F139'=>154,'F144'=>155,'F146'=>156,'F148'=>157,'F149'=>158,'F151'=>159,'F154'=>160,'F156'=>161,'F157'=>162,'F158'=>163,'F204'=>164,'F207'=>165,'F221'=>166,'F290'=>167,'F309'=>168,'F310'=>169,'F311'=>170,'F312'=>171,'F313'=>172,'F337'=>173,'F338'=>174,'F339'=>175,'F340'=>176,'F341'=>177,'F347'=>178,'F348'=>179,'F349'=>180,'F350'=>181,'F352'=>182,'F354'=>183,'F355'=>184,'F373'=>185,'F374'=>186,'F376'=>187,'F378'=>188,'F379'=>189,'F380'=>190,'F381'=>191,'F382'=>192,'F387'=>193,'F388'=>194,'F392'=>195,'F393'=>196,'F394'=>197,'F396'=>198,'F398'=>199,'F404'=>200,'F406'=>201,'F407'=>202,'F408'=>203,'F409'=>204,'F410'=>205,'F411'=>206,'F414'=>207,'F415'=>208,'F416'=>209,'F417'=>210);
//$rank[3] = array('F290'=>1,'F107'=>2,'F346'=>3,'F337'=>4,'F032'=>5,'F361'=>6,'F101'=>7,'F116'=>8,'F306'=>9,'F146'=>10,'F247'=>11,'F110'=>12,'F015'=>13,'F209'=>14,'F122'=>15,'F317'=>16,'F095'=>17,'F263'=>18,'F150'=>19,'F329'=>20,'F092'=>21,'F354'=>22,'F089'=>23,'F021'=>24,'F080'=>25,'F025'=>26,'F033'=>27,'F305'=>28,'F085'=>29,'F203'=>30,'F210'=>31,'F047'=>32,'F259'=>33,'F302'=>34,'F111'=>35,'F310'=>36,'F349'=>37,'F020'=>38,'F202'=>39,'F027'=>40,'F312'=>41,'F017'=>42,'F002'=>43,'F013'=>44,'F370'=>45,'F159'=>46,'F201'=>47,'F031'=>48,'F082'=>49,'F351'=>50,'F125'=>51,'F204'=>52,'F133'=>53,'F075'=>54,'F119'=>55,'F129'=>56,'F314'=>57,'F054'=>58,'F152'=>59,'F345'=>60,'F148'=>61,'F049'=>62,'F208'=>63,'F114'=>64,'F018'=>65,'F153'=>66,'F343'=>67,'F144'=>68,'F100'=>69,'F096'=>70,'F311'=>71,'F103'=>72,'F138'=>73,'F008'=>74,'F260'=>75,'F134'=>76,'F151'=>77,'F318'=>78,'F118'=>79,'F236'=>80,'F300'=>81,'F035'=>82,'F353'=>83,'F216'=>84,'F044'=>85,'F004'=>86,'F308'=>87,'F001'=>88,'F030'=>89,'F155'=>90,'F340'=>91,'F319'=>92,'F115'=>93,'F132'=>94,'F245'=>95,'F024'=>96,'F288'=>97,'F022'=>98,'F041'=>99,'F048'=>100,'F149'=>101,'F158'=>102,'F355'=>103,'F369'=>104,'F036'=>105,'F123'=>106,'F009'=>107,'F014'=>108,'F342'=>109,'F003'=>110,'F207'=>111,'F012'=>112,'F128'=>113,'F313'=>114,'F127'=>115,'F105'=>116,'F135'=>117,'F045'=>118,'F010'=>119,'F104'=>120,'F028'=>121,'F117'=>122,'F126'=>123,'F157'=>124,'F040'=>125,'F214'=>126,'F339'=>127,'F079'=>128,'F283'=>129,'F348'=>130,'F356'=>131,'F350'=>132,'F154'=>133,'F142'=>134,'F007'=>135,'F023'=>136,'F083'=>137,'F316'=>138,'F352'=>139,'F093'=>140,'F141'=>141,'F156'=>142,'F143'=>143,'F006'=>144,'F094'=>145,'F363'=>146,'F130'=>147,'F307'=>148,'F347'=>149,'F221'=>150,'F291'=>151,'F147'=>152,'F026'=>153,'F011'=>154,'F284'=>155,'F341'=>156,'F215'=>157,'F109'=>158,'F120'=>159,'F212'=>160,'F005'=>161,'F121'=>162,'F304'=>163,'F303'=>164,'F244'=>165,'F136'=>166,'F108'=>167,'F081'=>168,'F090'=>169,'F102'=>170,'F087'=>171,'F139'=>172,'F016'=>173,'F301'=>174,'F140'=>175,'F145'=>176,'F124'=>177,'F112'=>178,'F344'=>179,'F106'=>180,'F131'=>181,'F137'=>182,'F309'=>183,'F338'=>184,'F373'=>185,'F374'=>186,'F376'=>187,'F378'=>188,'F379'=>189,'F380'=>190,'F381'=>191,'F382'=>192,'F387'=>193,'F388'=>194,'F392'=>195,'F393'=>196,'F394'=>197,'F396'=>198,'F398'=>199,'F404'=>200,'F406'=>201,'F407'=>202,'F408'=>203,'F409'=>204,'F410'=>205,'F411'=>206,'F414'=>207,'F415'=>208,'F416'=>209,'F417'=>210);

//echo "<pre>";var_export($rank);exit;
//ranks = $rank[1];

$data = array_diff_key($rank[0] ,$rank[1] );

foreach($data as $code => $num){
  $rank[1][$code] =  $num;
}
$data = array_diff_key($rank[0] ,$rank[3] );
foreach($data as $code => $num){
  $rank[3][$code] =  $num;
}
*/

$ratedCount = 0;
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
body{width:100%;font:700 1em Arial,sans-serif;margin:0;color:#000;padding:0;background:#fff; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#fff;}
pre{color:#ff0;}
#end,#s888{float:none;color:#fff;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1em Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
input[type="submit"]{padding:.5em;}
input[type="text"]{font:700 1em Arial,sans-serif;}
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:center;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
@media print{
.pgBrk {page-break-after:always;}
.noPrint{display:block;}
}
.emp{font:700 1em/1 Arial,sans-serif;}
.inline{display:inline;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{padding:0;margin:0;width:640px}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go{width:100%;padding:0.5em;margin:.3em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #69B5B3;color: #fff;background-color:#fff;background: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.go {
color : #fff;
background : rgb(170, 198, 147);
background : linear-gradient(to bottom, rgb(101, 152, 59, 1) 0%, rgb(45, 72, 31) 100%);
} 
.select{ background: rgb(119,119,167);background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);}
.expand,#bs{width:640px;display:block;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;background:#fff;}
#post{width:640px;margin:0 auto;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.dchk{width:100%;max-width:200px;}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}

.dchk{background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
.dchk{font:700 1em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}

.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.pchk{text-align:left;width:98%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pnumber{width:3em;display:inline-block;}
.panel{width:18em;padding:.3em .1em .25em .1em;display:inline-block;font-weight:700;}



.col{width:640px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:400 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:4em;height:1.5em;display:inline-block;margin:0;padding:.3em 0 0 0;}
.legend{padding-left:20.4em;}
.row{padding:0;margin:0;}
.ige,.pige,.IgE,.descE{background:#ff0;color:#000;font-weight:700;}
.igg4,.pigg4,.IgG4,.descG4{background:#0ff;color:#000;font-weight:700;}



.both{background:#fA4;color:#000;}
.both,.IgE,.IgG4{display:inline-block;font-weight:700;margin:0;border:1px solid #fff;padding:.2em 0 0 .4em;text-align:left;width:70%;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:1.5em;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:1.7em;height:1.5em;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
.total{background:#00f;color:#fff;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
#patient{width:15em;margin:0 auto;}

.ige{display:inline-block;width: 19.3em;margin: 5px 0 3px 0;font-size: .9em;  padding: 9.5px 0 9.5px 0;background:#ff0;text-align:center;}
.igg{display:inline-block;width:19.3em;margin: 5px 1em 3px .85em;font-size: .9em;  padding: 9.5px 0 9.5px 0;; background:#0ff;text-align:center;}
display: inline-block;





.fchk{cursor:pointer;position:relative;text-align:left;background:#2985EA;padding:0;margin:2px;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.echk{cursor:pointer;position:relative;text-align:left;background-color:#ff0;background:#ff0;   padding:0;margin:2px 0 2px 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.gchk{cursor:pointer;position:relative;text-align:left;background:#0ff;   padding:0;margin:0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;outline:2px solid #000;margin:0;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:1.77em;height:1.77em;border:1px solid #eee;outline:2px solid #eee;display: inline-block;margin:1px;margin:5px 0 5px 5px;vertical-align: middle;position: relative;color:#eee;vertical-align: middle;position: relative;}   
.descE,.descG4{font-size:.9em;width:17em;display:inline-block;font-weight:700;padding: 4.7px 0 6.3px 0;margin: 5px 5px 5px 0;}

.titlebutton,.typebutton,.select,.valuebutton,.valuebutton{margin:3px 0 0 .2em;border:0;color:#fff;font:700 1em Arial;height:2em;background: linear-gradient(to bottom, rgb(154, 154, 215) 0%, rgb(2, 2, 36) 100%);padding:0;display:inline-block;}

.titlebutton,.typebutton,.select,.valuebutton,.blueLG{background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);} 
redLG{background: linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%);} 

.typehead,.typebutton,.typebuttonx{width:50px;;font:700 1em Arial;}
.titlehead,.titlebuttonx,.titlebutton{width:250px;font:700 1em Arial;}
.titlehead,.typehead{color:#000;background:#fff;border:0;}
.select{width:9.2em;}
.titlebuttonx,.typebuttonx{background:#fff;border:0;}




#pnum{width:4em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#fff;}
#pname{width:18em;border:0;margin:0;text-align:left;font:700 1em Arial;background-color:#fff;}
#pigE{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#ff0;}
#pigG4{width:3em;border:0;margin:0;text-align:center;font:700 1em Arial;background-color:#0ff;}
#dob{background:#f00;color:#fff;}
#b1000,#b1001,#b1002,#b1003,#b1004{display:none;}
.alert{background:#f00;color:#fff;}
</style></head><body><div id="page"><div id="sub: $sub"></div>$err
EOT;
$t = number_format(microtime(true) - $startTime,3);
ob_flush();

/*if($sub == 64){  // PATIENT DONE EXIT
  echo <<<EOT
  $err
<div class="center">
<h4><br>Your diet history has been sent to your doctor's office<br>&#x2003;</h4>
</div></div></body></html>
EOT;
  exit;
}
*/
if($sub == 0){  // NEW PATIENT OR MISSING VALUES
if($match){
  $code='<input type="hidden" name="c" value="' . $c . '"/>';
  $alerts = array(true=>'',false=>'class="alert"',0=>'class="alert"',1=>'',2=>'');
  $gclass = $alerts[$gender];
  $dclass = $alerts[$dobOK];
  $sclass = $alerts[$stateOK];
  $lclass = $alerts[$lastOK];
}
else {
  if(strlen($c) > 0){$class='class="alert"';}
  $code = '<br>Code: <input ' . $class . ' type="text" name="c" value="' . $c . '" />';
}

echo <<<EOT

<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="post">

<form action="#" method="post"><div id="patient">
$code<br>
<br>Last: <br><input $lclass type="text" name="last" value="$last" />
<br>First: <br><input type="text" name="first" value="$first" />
<br><br>DoB: m&thinsp;/&thinsp;d&thinsp;/&thinsp;yyyy&#x2003;<input $dclass $dobid type="text" name="dob" value="$strdob" placeholder="m/d/yyyy" /><br><br>
<div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $checked[1]/>&#x2002;Male </div><br>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $checked[2]/>&#x2002;Female</div><br>
<br><br>Address: <br><input name="address" type="text" value="$address" /><br>
City: <br><input name="city" type="text" value="" /><br>
State: (2 character)<br><input $sclass name="state" type="text" value="$state" />&#x2002;<br>
Zip: <br><input name="zip" type="text" value="$zip" /><br>
<p>&#x2003;<br>Enter Your Name, Date of Birth, Gender, and Address<br>
<p>Then Click Begin</p>
<input type="hidden" name="rec" value="0"/>
<input type="submit" value="Begin" class="btn" />
</div></form></div>
<div id="warn">
<h3 class="red">HIPAA WARNING</h3>
<p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and  § 164
</p><p>Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p>
<p>For site security purposes and to ensure that this service remains available to all authorized users, this computer system employs software programs to monitor network traffic to identify unauthorized attempts to access, upload, or change information, or otherwise cause damage.</p>
<p>Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply with its policies and procedures.</p>
</div></div>
EOT;
ob_flush();
}
if($sub == 32){  // SELECT FOODS NEXT HISTORY
  echo'<div id="col"><form action="#" method="post"><div id="post">';
  $showE = array();
  $showG4 = array();
  $checked = array();
  $today = date('Y-m-d');
  $dob = date('Y-m-d',strtotime($strdob));



echo <<<EOT
<div id="b15" class="inline"></div>
<div id="b16" class="inline"></div>
<div id="msg">
$err
<button id="b0" class="link" type="button" onclick ="exp('s0')">Patient Instructions:</button><div id="s0">
<p class="bold center red">You must click the "Next" button to post to your physician after making your selections</p>
<p>Click Food Category to expand / contract.</p>
<p>Check off the foods you currently eat <span class="bold">at least three times per week.</span></p>
<p>Complete all Categories</p>
<p>When finished, select the "Next" button.</p></div>
<p class="bold center red"><br>Check ONLY foods you eat AT LEAST THREE TIMES per week.</p>
<button id="b1" class="link" type="button" onclick ="exp('s1')">Meat &amp; Eggs</button>
<div id="s1" class="columns2">

<div id="d027" class="dchk"><input type="checkbox"  id="c027" class="chk" name="F027" value="027" onclick="ck('027')" $checked[027]/>&#x2002;Beef </div>
<div id="d083" class="dchk"><input type="checkbox"  id="c083" class="chk" name="F083" value="083" onclick="ck('083')" $checked[083]/>&#x2002;Chicken</div>
<div id="d106" class="dchk"><input type="checkbox"  id="c106" class="chk" name="F106" value="106" onclick="ck('106')" $checked[106]/>&#x2002;Duck </div>
<div id="d001" class="dchk"><input type="checkbox"  id="c001" class="chk" name="F001" value="001" onclick="ck('001')" $checked[001]/>&#x2002;Egg, White </div>
<div id="d245" class="dchk"><input type="checkbox"  id="c245" class="chk" name="F245" value="245" onclick="ck('245')" $checked[245]/>&#x2002;Egg, Whole </div>
<div id="d075" class="dchk"><input type="checkbox"  id="c075" class="chk" name="F075" value="075" onclick="ck('075')" $checked[075]/>&#x2002;Egg, Yolk </div>
<div id="d158" class="dchk"><input type="checkbox"  id="c158" class="chk" name="F158" value="158" onclick="ck('158')" $checked[158]/>&#x2002;Lamb </div>
<div id="d026" class="dchk"><input type="checkbox"  id="c026" class="chk" name="F026" value="026" onclick="ck('026')" $checked[026]/>&#x2002;Pork</div>
<div id="d416" class="dchk"><input type="checkbox"  id="c416" class="chk" name="F416" value="416" onclick="ck('416')" $checked[416]/>&#x2002;Rabbit</div>
<div id="d284" class="dchk"><input type="checkbox"  id="c284" class="chk" name="F284" value="284" onclick="ck('284')" $checked[284]/>&#x2002;Turkey</div>
<div id="d410" class="dchk"><input type="checkbox"  id="c410" class="chk" name="F410" value="410" onclick="ck('410')" $checked[410]/>&#x2002;Venison</div>

</div><button id="b2" class="link" type="button" onclick ="exp('s2')">Dairy</button><div id="s2" class="columns2">
<div id="d307" class="dchk"><input type="checkbox"  id="c307" class="chk" name="F307" value="307" onclick="ck('307')" $checked[307]/>&#x2002;Cheese, American</div>
<div id="d376" class="dchk"><input type="checkbox"  id="c376" class="chk" name="F376" value="376" onclick="ck('376')" $checked[376]/>&#x2002;Butter</div>
<div id="d081" class="dchk"><input type="checkbox"  id="c081" class="chk" name="F081" value="081" onclick="ck('081')" $checked[081]/>&#x2002;Cheese, Cheddar </div>
<div id="d411" class="dchk"><input type="checkbox"  id="c411" class="chk" name="F411" value="411" onclick="ck('411')" $checked[411]/>&#x2002;Cheese, Goat's </div>
<div id="d379" class="dchk"><input type="checkbox"  id="c379" class="chk" name="F379" value="379" onclick="ck('379')" $checked[379]/>&#x2002;Cheese, Gouda </div>
<div id="d082" class="dchk"><input type="checkbox"  id="c082" class="chk" name="F082" value="082" onclick="ck('082')" $checked[082]/>&#x2002;Cheese, Mold </div>
<div id="d380" class="dchk"><input type="checkbox"  id="c380" class="chk" name="F380" value="380" onclick="ck('380')" $checked[380]/>&#x2002;Cheese, Parmesan</div>
<div id="d117" class="dchk"><input type="checkbox"  id="c117" class="chk" name="F117" value="117" onclick="ck('117')" $checked[117]/>&#x2002;Cheese, Swiss </div>
<div id="d002" class="dchk"><input type="checkbox"  id="c002" class="chk" name="F002" value="002" onclick="ck('002')" $checked[002]/>&#x2002;Milk, Cow's </div>
<div id="d236" class="dchk"><input type="checkbox"  id="c236" class="chk" name="F236" value="236" onclick="ck('236')" $checked[236]/>&#x2002;Milk, Cow's Whey</div>
<div id="d147" class="dchk"><input type="checkbox"  id="c147" class="chk" name="F147" value="147" onclick="ck('147')" $checked[147]/>&#x2002;Milk, Goat's</div>
<div id="d319" class="dchk"><input type="checkbox"  id="c319" class="chk" name="F319" value="319" onclick="ck('319')" $checked[319]/>&#x2002;Yogurt </div>

</div><button id="b3" class="link" type="button" onclick ="exp('s3')">Fish</button><div id="s3" class="columns2">
<div id="d032" class="dchk"><input type="checkbox"  id="c032" class="chk" name="F032" value="032" onclick="ck('032')" $checked[032]/>&#x2002;Anchovy</div>
<div id="d101" class="dchk"><input type="checkbox"  id="c101" class="chk" name="F101" value="101" onclick="ck('101')" $checked[101]/>&#x2002;Bass, Black</div>
<div id="d306" class="dchk"><input type="checkbox"  id="c306" class="chk" name="F306" value="306" onclick="ck('306')" $checked[306]/>&#x2002;Catfish</div>
<div id="d378" class="dchk"><input type="checkbox"  id="c378" class="chk" name="F378" value="378" onclick="ck('378')" $checked[378]/>&#x2002;Carp</div>
<div id="d003" class="dchk"><input type="checkbox"  id="c003" class="chk" name="F003" value="003" onclick="ck('003')" $checked[003]/>&#x2002;Cod</div>
<div id="d107" class="dchk"><input type="checkbox"  id="c107" class="chk" name="F107" value="107" onclick="ck('107')" $checked[107]/>&#x2002;Eel</div>
<div id="d311" class="dchk"><input type="checkbox"  id="c311" class="chk" name="F311" value="311" onclick="ck('311')" $checked[311]/>&#x2002;Flounder</div>
<div id="d312" class="dchk"><input type="checkbox"  id="c312" class="chk" name="F312" value="312" onclick="ck('312')" $checked[312]/>&#x2002;Haddock</div>
<div id="d119" class="dchk"><input type="checkbox"  id="c119" class="chk" name="F119" value="119" onclick="ck('119')" $checked[119]/>&#x2002;Halibut</div>
<div id="d111" class="dchk"><input type="checkbox"  id="c111" class="chk" name="F111" value="111" onclick="ck('111')" $checked[111]/>&#x2002;Mackerel</div>
<div id="d394" class="dchk"><input type="checkbox"  id="c394" class="chk" name="F394" value="394" onclick="ck('394')" $checked[394]/>&#x2002;Octopus</div>
<div id="d120" class="dchk"><input type="checkbox"  id="c120" class="chk" name="F120" value="120" onclick="ck('120')" $checked[120]/>&#x2002;Perch, Lake</div>
<div id="d396" class="dchk"><input type="checkbox"  id="c396" class="chk" name="F396" value="396" onclick="ck('396')" $checked[396]/>&#x2002;Pike</div>
<div id="d041" class="dchk"><input type="checkbox"  id="c041" class="chk" name="F041" value="041" onclick="ck('041')" $checked[041]/>&#x2002;Salmon, Atlantic</div>
<div id="d353" class="dchk"><input type="checkbox"  id="c353" class="chk" name="F353" value="353" onclick="ck('353')" $checked[353]/>&#x2002;Salmon, Pacific</div>
<div id="d123" class="dchk"><input type="checkbox"  id="c123" class="chk" name="F123" value="123" onclick="ck('123')" $checked[123]/>&#x2002;Snapper, Red</div>
<div id="d398" class="dchk"><input type="checkbox"  id="c398" class="chk" name="F398" value="398" onclick="ck('398')" $checked[398]/>&#x2002;Sardine</div>
<div id="d337" class="dchk"><input type="checkbox"  id="c337" class="chk" name="F337" value="337" onclick="ck('337')" $checked[337]/>&#x2002;Sole</div>
<div id="d116" class="dchk"><input type="checkbox"  id="c116" class="chk" name="F116" value="116" onclick="ck('116')" $checked[116]/>&#x2002;Squid </div>
<div id="d118" class="dchk"><input type="checkbox"  id="c118" class="chk" name="F118" value="118" onclick="ck('118')" $checked[118]/>&#x2002;Swordfish</div>
<div id="d361" class="dchk"><input type="checkbox"  id="c361" class="chk" name="F361" value="361" onclick="ck('361')" $checked[361]/>&#x2002;Tilapia</div>
<div id="d204" class="dchk"><input type="checkbox"  id="c204" class="chk" name="F204" value="204" onclick="ck('204')" $checked[204]/>&#x2002;Trout</div>
<div id="d040" class="dchk"><input type="checkbox"  id="c040" class="chk" name="F040" value="040" onclick="ck('040')" $checked[040]/>&#x2002;Tuna</div>
<div id="d121" class="dchk"><input type="checkbox"  id="c121" class="chk" name="F121" value="121" onclick="ck('121')" $checked[121]/>&#x2002;Whitefish</div>

</div><button id="b4" class="link" type="button" onclick ="exp('s4')">Fruit</button><div id="s4" class="columns2">
<div id="d049" class="dchk"><input type="checkbox"  id="c049" class="chk" name="F049" value="049" onclick="ck('049')" $checked[049]/>&#x2002;Apple </div>
<div id="d138" class="dchk"><input type="checkbox"  id="c138" class="chk" name="F138" value="138" onclick="ck('138')" $checked[138]/>&#x2002;Apricot</div>
<div id="f096" class="dchk"><input type="checkbox"  id="cf096" class="chk" name="F096" value="096" onclick="ckf('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="d092" class="dchk"><input type="checkbox"  id="c092" class="chk" name="F092" value="092" onclick="ck('092')" $checked[092]/>&#x2002;Banana </div>
<div id="d139" class="dchk"><input type="checkbox"  id="c139" class="chk" name="F139" value="139" onclick="ck('139')" $checked[139]/>&#x2002;Blackberry</div>
<div id="d288" class="dchk"><input type="checkbox"  id="c288" class="chk" name="F288" value="288" onclick="ck('288')" $checked[288]/>&#x2002;Blueberry </div>
<div id="d305" class="dchk"><input type="checkbox"  id="c305" class="chk" name="F305" value="305" onclick="ck('305')" $checked[305]/>&#x2002;Cantaloupe  </div>
<div id="d100" class="dchk"><input type="checkbox"  id="c100" class="chk" name="F100" value="100" onclick="ck('100')" $checked[100]/>&#x2002;Cherry, Bing</div>
<div id="d104" class="dchk"><input type="checkbox"  id="c104" class="chk" name="F104" value="104" onclick="ck('104')" $checked[104]/>&#x2002;Cranberry  </div>
<div id="d105" class="dchk"><input type="checkbox"  id="c105" class="chk" name="F105" value="105" onclick="ck('105')" $checked[105]/>&#x2002;Date </div>
<div id="d259" class="dchk"><input type="checkbox"  id="c259" class="chk" name="F259" value="259" onclick="ck('259')" $checked[259]/>&#x2002;Grape/Raisin </div>
<div id="d209" class="dchk"><input type="checkbox"  id="c209" class="chk" name="F209" value="209" onclick="ck('209')" $checked[209]/>&#x2002;Grapefruit </div>
<div id="d087" class="dchk"><input type="checkbox"  id="c087" class="chk" name="F087" value="087" onclick="ck('087')" $checked[087]/>&#x2002;Honeydew </div>
<div id="d153" class="dchk"><input type="checkbox"  id="c153" class="chk" name="F153" value="153" onclick="ck('153')" $checked[153]/>&#x2002;Kiwi </div>
<div id="d208" class="dchk"><input type="checkbox"  id="c208" class="chk" name="F208" value="208" onclick="ck('208')" $checked[208]/>&#x2002;Lemon </div>
<div id="d134" class="dchk"><input type="checkbox"  id="c134" class="chk" name="F134" value="134" onclick="ck('134')" $checked[134]/>&#x2002;Lime </div>
<div id="d351" class="dchk"><input type="checkbox"  id="c351" class="chk" name="F351" value="351" onclick="ck('351')" $checked[351]/>&#x2002;Mango</div>
<div id="d132" class="dchk"><input type="checkbox"  id="c132" class="chk" name="F132" value="132" onclick="ck('132')" $checked[132]/>&#x2002;Nectarine</div>
<div id="f124" class="dchk"><input type="checkbox"  id="cf124" class="chk" name="F124" value="124" onclick="ckf('124')" $checked[124]/>&#x2002;Olive, Black </div>
<div id="f342" class="dchk"><input type="checkbox"  id="cf342" class="chk" name="F342" value="342" onclick="ckf('342')" $checked[342]/>&#x2002;Olive, Green</div>
<div id="d033" class="dchk"><input type="checkbox"  id="c033" class="chk" name="F033" value="033" onclick="ck('033')" $checked[033]/>&#x2002;Orange </div>
<div id="d127" class="dchk"><input type="checkbox"  id="c127" class="chk" name="F127" value="127" onclick="ck('127')" $checked[127]/>&#x2002;Papaya </div>
<div id="d095" class="dchk"><input type="checkbox"  id="c095" class="chk" name="F095" value="095" onclick="ck('095')" $checked[095]/>&#x2002;Peach</div>
<div id="d094" class="dchk"><input type="checkbox"  id="c094" class="chk" name="F094" value="094" onclick="ck('094')" $checked[094]/>&#x2002;Pear </div>
<div id="d210" class="dchk"><input type="checkbox"  id="c210" class="chk" name="F210" value="210" onclick="ck('210')" $checked[210]/>&#x2002;Pineapple </div>
<div id="d128" class="dchk"><input type="checkbox"  id="c128" class="chk" name="F128" value="128" onclick="ck('128')" $checked[128]/>&#x2002;Plum/Prune  </div>
<div id="d021" class="dchk"><input type="checkbox"  id="c021" class="chk" name="F021" value="021" onclick="ck('021')" $checked[021]/>&#x2002;Pomegranate  </div>
<div id="d129" class="dchk"><input type="checkbox"  id="c129" class="chk" name="F129" value="129" onclick="ck('129')" $checked[129]/>&#x2002;Raspberry  </div>
<div id="d044" class="dchk"><input type="checkbox"  id="c044" class="chk" name="F044" value="044" onclick="ck('044')" $checked[044]/>&#x2002;Strawberry</div>
<div id="d155" class="dchk"><input type="checkbox"  id="c155" class="chk" name="F155" value="155" onclick="ck('155')" $checked[155]/>&#x2002;Tangerine </div>
<div id="f025" class="dchk"><input type="checkbox"  id="cf025" class="chk" name="F025" value="025" onclick="ckf('025')" $checked[025]/>&#x2002;Tomato </div>
<div id="d404" class="dchk"><input type="checkbox"  id="c404" class="chk" name="F404" value="404" onclick="ck('404')" $checked[404]/>&#x2002;Vinegar, Wine </div>
<div id="d329" class="dchk"><input type="checkbox"  id="c329" class="chk" name="F329" value="329" onclick="ck('329')" $checked[329]/>&#x2002;Watermelon </div>
<div id="d406" class="dchk"><input type="checkbox"  id="c406" class="chk" name="F406" value="406" onclick="ck('406'\)" $checked[406]/>&#x2002;Wine, Red </div>
<div id="d407" class="dchk"><input type="checkbox"  id="c407" class="chk" name="F407" value="407" onclick="ck('407'\)" $checked[407]/>&#x2002;Wine, White </div>
<div id="d408" class="dchk"><input type="checkbox"  id="c408" class="chk" name="F408" value="408" onclick="ck('408'\)" $checked[408]/>&#x2002;Yeast, Wine </div>
   
</div><button id="b5" class="link" type="button" onclick ="exp('s5')">Bread, Cereal, Rice, &amp; Grains</button><div id="s5" class="columns2">
<div id="d006" class="dchk"><input type="checkbox"  id="c006" class="chk" name="F006" value="006" onclick="ck('006')" $checked[006]/>&#x2002;Barley </div>
<div id="d304" class="dchk"><input type="checkbox"  id="c304" class="chk" name="F304" value="304" onclick="ck('304')" $checked[304]/>&#x2002;Bran, Wheat </div>
<div id="d102" class="dchk"><input type="checkbox"  id="c102" class="chk" name="F102" value="102" onclick="ck('102')" $checked[102]/>&#x2002;Buckwheat  </div>
<div id="d008" class="dchk"><input type="checkbox"  id="c008" class="chk" name="F008" value="008" onclick="ck('008')" $checked[008]/>&#x2002;Corn </div>
<div id="d125" class="dchk"><input type="checkbox"  id="c125" class="chk" name="F125" value="125" onclick="ck('125')" $checked[125]/>&#x2002;Hops</div>
<div id="d090" class="dchk"><input type="checkbox"  id="c090" class="chk" name="F090" value="090" onclick="ck('090')" $checked[090]/>&#x2002;Malt</div>
<div id="d157" class="dchk"><input type="checkbox"  id="c157" class="chk" name="F157" value="157" onclick="ck('157')" $checked[157]/>&#x2002;Millet</div>
<div id="d007" class="dchk"><input type="checkbox"  id="c007" class="chk" name="F007" value="007" onclick="ck('007')" $checked[007]/>&#x2002;Oat </div>
<div id="d369" class="dchk"><input type="checkbox"  id="c369" class="chk" name="F369" value="369" onclick="ck('369')" $checked[369]/>&#x2002;Quinoa</div>
<div id="d009" class="dchk"><input type="checkbox"  id="c009" class="chk" name="F009" value="009" onclick="ck('009')" $checked[009]/>&#x2002;Rice</div>
<div id="d005" class="dchk"><input type="checkbox"  id="c005" class="chk" name="F005" value="005" onclick="ck('005')" $checked[005]/>&#x2002;Rye </div>
<div id="d131" class="dchk"><input type="checkbox"  id="c131" class="chk" name="F131" value="131" onclick="ck('131')" $checked[131]/>&#x2002;Tapioca  </div>
<div id="d004" class="dchk"><input type="checkbox"  id="c004" class="chk" name="F004" value="004" onclick="ck('004')" $checked[004]/>&#x2002;Wheat </div>
<div id="d079" class="dchk"><input type="checkbox"  id="c079" class="chk" name="F079" value="079" onclick="ck('079')" $checked[079]/>&#x2002;Wheat, Gluten </div>

</div><button id="b6" class="link" type="button" onclick ="exp('s6')">Yeast</button><div id="s6" class="columns2">
<div id="d318" class="dchk"><input type="checkbox"  id="c318" class="chk" name="F318" value="318" onclick="ck('318')" $checked[318]/>&#x2002;Yeast, Bakers  </div>
<div id="d045" class="dchk"><input type="checkbox"  id="c045" class="chk" name="F045" value="045" onclick="ck('045')" $checked[045]/>&#x2002;Yeast, Brewers</div>

</div><button id="b7" class="link" type="button" onclick ="exp('s7')">Peas, Beans, &amp; Legumes</button><div id="s7" class="columns2">
<div id="d356" class="dchk"><input type="checkbox"  id="c356" class="chk" name="F356" value="356" onclick="ck('356')" $checked[356]/>&#x2002;Bean, Black </div>
<div id="d022" class="dchk"><input type="checkbox"  id="c022" class="chk" name="F022" value="022" onclick="ck('022')" $checked[022]/>&#x2002;Bean, Carob </div>
<div id="d417" class="dchk"><input type="checkbox"  id="c417" class="chk" name="F417" value="417" onclick="ck('417')" $checked[417]/>&#x2002;Bean, Green </div>
<div id="d300" class="dchk"><input type="checkbox"  id="c300" class="chk" name="F300" value="300" onclick="ck('300')" $checked[300]/>&#x2002;Bean, Kidney </div>
<div id="d301" class="dchk"><input type="checkbox"  id="c301" class="chk" name="F301" value="301" onclick="ck('301')" $checked[301]/>&#x2002;Bean, Lima</div>
<div id="d302" class="dchk"><input type="checkbox"  id="c302" class="chk" name="F302" value="302" onclick="ck('302')" $checked[302]/>&#x2002;Bean, Pinto </div>
<div id="d303" class="dchk"><input type="checkbox"  id="c303" class="chk" name="F303" value="303" onclick="ck('303')" $checked[303]/>&#x2002;Bean, Wax String </div>
<div id="d015" class="dchk"><input type="checkbox"  id="c015" class="chk" name="F015" value="015" onclick="ck('015')" $checked[015]/>&#x2002;Bean, White/Navy </div>
<div id="d355" class="dchk"><input type="checkbox"  id="c355" class="chk" name="F355" value="355" onclick="ck('355')" $checked[355]/>&#x2002;Pea, Black-Eyed</div>
<div id="d142" class="dchk"><input type="checkbox"  id="c142" class="chk" name="F142" value="142" onclick="ck('142')" $checked[142]/>&#x2002;Pea, Chick</div>
<div id="d012" class="dchk"><input type="checkbox"  id="c012" class="chk" name="F012" value="012" onclick="ck('012')" $checked[012]/>&#x2002;Pea, Green</div>
<div id="d126" class="dchk"><input type="checkbox"  id="c126" class="chk" name="F126" value="126" onclick="ck('126')" $checked[126]/>&#x2002;Lentil</div>
<div id="d014" class="dchk"><input type="checkbox"  id="c014" class="chk" name="F014" value="014" onclick="ck('014')" $checked[014]/>&#x2002;Soybean </div>

</div><button id="b8" class="link" type="button" onclick ="exp('s8')">Seeds, Spices &amp; Peppers</button><div id="s8" class="columns2">
<div id="d373" class="dchk"><input type="checkbox"  id="c373" class="chk" name="F373" value="373" onclick="ck('373')" $checked[373]/>&#x2002;Allspice</div>
<div id="d374" class="dchk"><input type="checkbox"  id="c374" class="chk" name="F374" value="374" onclick="ck('374')" $checked[374]/>&#x2002;Aniseed</div>
<div id="d343" class="dchk"><input type="checkbox"  id="c343" class="chk" name="F343" value="343" onclick="ck('343')" $checked[343]/>&#x2002;Basil</div>
<div id="d347" class="dchk"><input type="checkbox"  id="c347" class="chk" name="F347" value="347" onclick="ck('347')" $checked[347]/>&#x2002;Bay leaf</div>
<div id="d159" class="dchk"><input type="checkbox"  id="c159" class="chk" name="F159" value="159" onclick="ck('159')" $checked[159]/>&#x2002;Canola Seed </div>
<div id="d023" class="dchk"><input type="checkbox"  id="c023" class="chk" name="F023" value="023" onclick="ck('023')" $checked[023]/>&#x2002;Chives </div>
<div id="d308" class="dchk"><input type="checkbox"  id="c308" class="chk" name="F308" value="308" onclick="ck('308')" $checked[308]/>&#x2002;Cinnamon</div>
<div id="d146" class="dchk"><input type="checkbox"  id="c146" class="chk" name="F146" value="146" onclick="ck('146')" $checked[146]/>&#x2002;Cloves</div>
<div id="d309" class="dchk"><input type="checkbox"  id="c309" class="chk" name="F309" value="309" onclick="ck('309')" $checked[309]/>&#x2002;Cottonseed  </div>
<div id="d140" class="dchk"><input type="checkbox"  id="c140" class="chk" name="F140" value="140" onclick="ck('140')" $checked[140]/>&#x2002;Cumin</div>
<div id="d141" class="dchk"><input type="checkbox"  id="c141" class="chk" name="F141" value="141" onclick="ck('141')" $checked[141]/>&#x2002;Curry powder </div>
<div id="d341" class="dchk"><input type="checkbox"  id="c341" class="chk" name="F341" value="341" onclick="ck('341')" $checked[341]/>&#x2002;Dill</div>
<div id="d382" class="dchk"><input type="checkbox"  id="c382" class="chk" name="F382" value="382" onclick="ck('382')" $checked[382]/>&#x2002;Fennel (Fresh)</div>
<div id="d143" class="dchk"><input type="checkbox"  id="c143" class="chk" name="F143" value="143" onclick="ck('143')" $checked[143]/>&#x2002;Flaxseed</div>
<div id="d345" class="dchk"><input type="checkbox"  id="c345" class="chk" name="F345" value="345" onclick="ck('345')" $checked[345]/>&#x2002;Ginger </div>
<div id="d387" class="dchk"><input type="checkbox"  id="c387" class="chk" name="F387" value="387" onclick="ck('387')" $checked[387]/>&#x2002;Horseradish</div>
<div id="d392" class="dchk"><input type="checkbox"  id="c392" class="chk" name="F392" value="392" onclick="ck('392')" $checked[392]/>&#x2002;Mint</div>
<div id="d089" class="dchk"><input type="checkbox"  id="c089" class="chk" name="F089" value="089" onclick="ck('089')" $checked[089]/>&#x2002;Mustard </div>
<div id="d148" class="dchk"><input type="checkbox"  id="c148" class="chk" name="F148" value="148" onclick="ck('148')" $checked[148]/>&#x2002;Nutmeg</div>
<div id="d283" class="dchk"><input type="checkbox"  id="c283" class="chk" name="F283" value="283" onclick="ck('283')" $checked[283]/>&#x2002;Oregano</div>
<div id="d391" class="dchk"><input type="checkbox"  id="c391" class="chk" name="F391" value="391" onclick="ck('391')" $checked[391]/>&#x2002;Orris Root</div>
<div id="d112" class="dchk"><input type="checkbox"  id="c112" class="chk" name="F112" value="112" onclick="ck('112')" $checked[112]/>&#x2002;Paprika </div>
<div id="d144" class="dchk"><input type="checkbox"  id="c144" class="chk" name="F144" value="144" onclick="ck('144')" $checked[144]/>&#x2002;Parsley </div>
<div id="d263" class="dchk"><input type="checkbox"  id="c263" class="chk" name="F263" value="263" onclick="ck('263')" $checked[263]/>&#x2002;Pepper, Green/Bell </div>
<div id="d313" class="dchk"><input type="checkbox"  id="c313" class="chk" name="F313" value="313" onclick="ck('313')" $checked[313]/>&#x2002;Pepper, Black/White</div>
<div id="d314" class="dchk"><input type="checkbox"  id="c314" class="chk" name="F314" value="314" onclick="ck('314')" $checked[314]/>&#x2002;Pepper, Chili </div>
<div id="d011" class="dchk"><input type="checkbox"  id="c011" class="chk" name="F011" value="011" onclick="ck('011')" $checked[011]/>&#x2002;Pepper, Jalapeno</div>
<div id="d150" class="dchk"><input type="checkbox"  id="c150" class="chk" name="F150" value="150" onclick="ck('150')" $checked[150]/>&#x2002;Pepper, Red </div>
<div id="d137" class="dchk"><input type="checkbox"  id="c137" class="chk" name="F137" value="137" onclick="ck('137')" $checked[137]/>&#x2002;Poppy Seed</div>
<div id="d352" class="dchk"><input type="checkbox"  id="c352" class="chk" name="F352" value="352" onclick="ck('352')" $checked[352]/>&#x2002;Rosemary</div>
<div id="d349" class="dchk"><input type="checkbox"  id="c349" class="chk" name="F349" value="349" onclick="ck('349')" $checked[349]/>&#x2002;Safflower seed</div>
<div id="d151" class="dchk"><input type="checkbox"  id="c151" class="chk" name="F151" value="151" onclick="ck('151')" $checked[151]/>&#x2002;Sage</div>
<div id="d010" class="dchk"><input type="checkbox"  id="c010" class="chk" name="F010" value="010" onclick="ck('010')" $checked[010]/>&#x2002;Sesame Seed</div>
<div id="d316" class="dchk"><input type="checkbox"  id="c316" class="chk" name="F316" value="316" onclick="ck('316')" $checked[316]/>&#x2002;Sunflower Seed </div>
<div id="d340" class="dchk"><input type="checkbox"  id="c340" class="chk" name="F340" value="340" onclick="ck('340')" $checked[340]/>&#x2002;Tea, Black</div>

<div id="d409" class="dchk"><input type="checkbox"  id="c409" class="chk" name="F409" value="409" onclick="ck('409')" $checked[409]/>&#x2002;Tea, Camomile</div>
<div id="d156" class="dchk"><input type="checkbox"  id="c156" class="chk" name="F156" value="156" onclick="ck('156')" $checked[156]/>&#x2002;Thyme</div>
<div id="d016" class="dchk"><input type="checkbox"  id="c016" class="chk" name="F016" value="016" onclick="ck('016')" $checked[016]/>&#x2002;Turmeric</div>

</div><button id="b9" class="link" type="button" onclick ="exp('s9')">Shellfish</button><div id="s9" class="columns2">
<div id="d207" class="dchk"><input type="checkbox"  id="c207" class="chk" name="F207" value="207" onclick="ck('207')" $checked[207]/>&#x2002;Clam</div>
<div id="d310" class="dchk"><input type="checkbox"  id="c310" class="chk" name="F310" value="310" onclick="ck('310')" $checked[310]/>&#x2002;Crab, Blue </div>
<div id="d339" class="dchk"><input type="checkbox"  id="c339" class="chk" name="F339" value="339" onclick="ck('339')" $checked[339]/>&#x2002;Crab, Alaskan </div>
<div id="d354" class="dchk"><input type="checkbox"  id="c354" class="chk" name="F354" value="354" onclick="ck('354')" $checked[354]/>&#x2002;Crab,Dungeness </div>
<div id="d381" class="dchk"><input type="checkbox"  id="c381" class="chk" name="F381" value="381" onclick="ck('381')" $checked[381]/>&#x2002;Crayfish </div>
<div id="d080" class="dchk"><input type="checkbox"  id="c080" class="chk" name="F080" value="080" onclick="ck('080')" $checked[080]/>&#x2002;Lobster, Maine</div>
<div id="d136" class="dchk"><input type="checkbox"  id="c136" class="chk" name="F136" value="136" onclick="ck('136')" $checked[136]/>&#x2002;Lobster, Spiny </div>
<div id="d393" class="dchk"><input type="checkbox"  id="c393" class="chk" name="F393" value="393" onclick="ck('393')" $checked[393]/>&#x2002;Mussel </div>
<div id="d290" class="dchk"><input type="checkbox"  id="c290" class="chk" name="F290" value="290" onclick="ck('290')" $checked[290]/>&#x2002;Oyster </div>
<div id="d338" class="dchk"><input type="checkbox"  id="c338" class="chk" name="F338" value="338" onclick="ck('338')" $checked[338]/>&#x2002;Scallop</div>
<div id="d024" class="dchk"><input type="checkbox"  id="c024" class="chk" name="F024" value="024" onclick="ck('024')" $checked[024]/>&#x2002;Shrimp</div>

</div><button id="b10" class="link" type="button" onclick ="exp('s10')">Sugar</button><div id="s10" class="columns2">
<div id="d145" class="dchk"><input type="checkbox"  id="c145" class="chk" name="F145" value="145" onclick="ck('145')" $checked[145]/>&#x2002;Beet, Sugar</div>
<div id="d247" class="dchk"><input type="checkbox"  id="c247" class="chk" name="F247" value="247" onclick="ck('247')" $checked[247]/>&#x2002;Honey </div>
<div id="d388" class="dchk"><input type="checkbox"  id="c388" class="chk" name="F388" value="388" onclick="ck('388')" $checked[388]/>&#x2002;Maple Syrup </div>
<div id="d350" class="dchk"><input type="checkbox"  id="c350" class="chk" name="F350" value="350" onclick="ck('350')" $checked[350]/>&#x2002;Sugar, Cane</div>

</div><button id="b11" class="link" type="button" onclick ="exp('s11')"> Nuts</button><div id="s11" class="columns2">
<div id="d020" class="dchk"><input type="checkbox"  id="c020" class="chk" name="F020" value="020" onclick="ck('020')" $checked[020]/>&#x2002;Almond </div>
<div id="d018" class="dchk"><input type="checkbox"  id="c018" class="chk" name="F018" value="018" onclick="ck('018')" $checked[018]/>&#x2002;Brazil Nut </div>
<div id="d202" class="dchk"><input type="checkbox"  id="c202" class="chk" name="F202" value="202" onclick="ck('202')" $checked[202]/>&#x2002;Cashew </div>
<div id="d103" class="dchk"><input type="checkbox"  id="c103" class="chk" name="F103" value="103" onclick="ck('103')" $checked[103]/>&#x2002;Chestnut </div>
<div id="d093" class="dchk"><input type="checkbox"  id="c093" class="chk" name="F093" value="093" onclick="ck('093')" $checked[093]/>&#x2002;Chocolate/Cacao</div>
<div id="d036" class="dchk"><input type="checkbox"  id="c036" class="chk" name="F036" value="036" onclick="ck('036')" $checked[036]/>&#x2002;Coconut </div>
<div id="d221" class="dchk"><input type="checkbox"  id="c221" class="chk" name="F221" value="221" onclick="ck('221')" $checked[221]/>&#x2002;Coffee</div>
<div id="d348" class="dchk"><input type="checkbox"  id="c348" class="chk" name="F348" value="348" onclick="ck('348')" $checked[348]/>&#x2002;Cola nut </div>
<div id="d017" class="dchk"><input type="checkbox"  id="c017" class="chk" name="F017" value="017" onclick="ck('017')" $checked[017]/>&#x2002;Hazelnut </div>
<div id="d363" class="dchk"><input type="checkbox"  id="c363" class="chk" name="F363" value="363" onclick="ck('363')" $checked[363]/>&#x2002;Macadamia</div>
<div id="d013" class="dchk"><input type="checkbox"  id="c013" class="chk" name="F013" value="013" onclick="ck('013')" $checked[013]/>&#x2002;Peanut </div>
<div id="d201" class="dchk"><input type="checkbox"  id="c201" class="chk" name="F201" value="201" onclick="ck('201')" $checked[201]/>&#x2002;Pecan</div>
<div id="d114" class="dchk"><input type="checkbox"  id="c114" class="chk" name="F114" value="114" onclick="ck('114')" $checked[114]/>&#x2002;Pine Nut </div>
<div id="d203" class="dchk"><input type="checkbox"  id="c203" class="chk" name="F203" value="203" onclick="ck('203')" $checked[203]/>&#x2002;Pistachio </div>
<div id="d130" class="dchk"><input type="checkbox"  id="c130" class="chk" name="F130" value="130" onclick="ck('130')" $checked[130]/>&#x2002;Vanilla  </div>
<div id="d256" class="dchk"><input type="checkbox"  id="c256" class="chk" name="F256" value="256" onclick="ck('256')" $checked[256]/>&#x2002;Walnut, Black </div>
<div id="d317" class="dchk"><input type="checkbox"  id="c317" class="chk" name="F317" value="317" onclick="ck('317')" $checked[317]/>&#x2002;Walnut, English </div>

</div><button id="b12" class="link" type="button" onclick ="exp('s12')">Vegatables</button><div id="s12" class="columns2">
<div id="d122" class="dchk"><input type="checkbox"  id="c122" class="chk" name="F122" value="122" onclick="ck('122')" $checked[122]/>&#x2002;Artichoke   </div>
<div id="d135" class="dchk"><input type="checkbox"  id="c135" class="chk" name="F135" value="135" onclick="ck('135')" $checked[135]/>&#x2002;Asparagus</div>
<div id="v096" class="dchk"><input type="checkbox"  id="cv096" class="chk" name="F096" value="096" onclick="ckv('096')" $checked[096]/>&#x2002;Avocado</div>
<div id="d152" class="dchk"><input type="checkbox"  id="c152" class="chk" name="F152" value="152" onclick="ck('152')" $checked[152]/>&#x2002;Beet </div>
<div id="d260" class="dchk"><input type="checkbox"  id="c260" class="chk" name="F260" value="260" onclick="ck('260')" $checked[260]/>&#x2002;Broccoli </div>
<div id="d154" class="dchk"><input type="checkbox"  id="c154" class="chk" name="F154" value="154" onclick="ck('154')" $checked[154]/>&#x2002;Brussel Sprouts</div>
<div id="d216" class="dchk"><input type="checkbox"  id="c216" class="chk" name="F216" value="216" onclick="ck('216')" $checked[216]/>&#x2002;Cabbage Mix </div>
<div id="d031" class="dchk"><input type="checkbox"  id="c031" class="chk" name="F031" value="031" onclick="ck('031')" $checked[031]/>&#x2002;Carrot</div>
<div id="d291" class="dchk"><input type="checkbox"  id="c291" class="chk" name="F291" value="291" onclick="ck('291')" $checked[291]/>&#x2002;Cauliflower</div>
<div id="d085" class="dchk"><input type="checkbox"  id="c085" class="chk" name="F085" value="085" onclick="ck('085')" $checked[085]/>&#x2002;Celery</div>
<div id="d030" class="dchk"><input type="checkbox"  id="c030" class="chk" name="F030" value="030" onclick="ck('030')" $checked[030]/>&#x2002;Cilantro</div>
<div id="d244" class="dchk"><input type="checkbox"  id="c244" class="chk" name="F244" value="244" onclick="ck('244')" $checked[244]/>&#x2002;Cucumber</div>
<div id="d108" class="dchk"><input type="checkbox"  id="c108" class="chk" name="F108" value="108" onclick="ck('108')" $checked[108]/>&#x2002;Eggplant  </div>
<div id="d047" class="dchk"><input type="checkbox"  id="c047" class="chk" name="F047" value="047" onclick="ck('047')" $checked[047]/>&#x2002;Garlic </div>
<div id="d133" class="dchk"><input type="checkbox"  id="c133" class="chk" name="F133" value="133" onclick="ck('133')" $checked[133]/>&#x2002;Gelatin </div>
<div id="d370" class="dchk"><input type="checkbox"  id="c370" class="chk" name="F370" value="370" onclick="ck('370')" $checked[370]/>&#x2002;Kale</div>
<div id="d414" class="dchk"><input type="checkbox"  id="c414" class="chk" name="F414" value="414" onclick="ck('414')" $checked[414]/>&#x2002;Leek</div>

<div id="d215" class="dchk"><input type="checkbox"  id="c215" class="chk" name="F215" value="215" onclick="ck('215')" $checked[215]/>&#x2002;Lettuce</div>
<div id="d212" class="dchk"><input type="checkbox"  id="c212" class="chk" name="F212" value="212" onclick="ck('212')" $checked[212]/>&#x2002;Mushroom</div>
<div id="d028" class="dchk"><input type="checkbox"  id="c028" class="chk" name="F028" value="028" onclick="ck('028')" $checked[028]/>&#x2002;Okra</div>

<div id="v124" class="dchk"><input type="checkbox"  id="cv124" class="chk" name="F124" value="124" onclick="ckv('124')" $checked[124]/>&#x2002;Olive, Black </div>
<div id="v342" class="dchk"><input type="checkbox"  id="cv342" class="chk" name="F342" value="342" onclick="ckv('342')" $checked[342]/>&#x2002;Olive, Green</div>

<div id="d048" class="dchk"><input type="checkbox"  id="c048" class="chk" name="F048" value="048" onclick="ck('048')" $checked[048]/>&#x2002;Onion </div>
<div id="d054" class="dchk"><input type="checkbox"  id="c054" class="chk" name="F054" value="054" onclick="ck('054')" $checked[054]/>&#x2002;Potato, Sweet</div>
<div id="d035" class="dchk"><input type="checkbox"  id="c035" class="chk" name="F035" value="035" onclick="ck('035')" $checked[035]/>&#x2002;Potato, White</div>
<div id="d115" class="dchk"><input type="checkbox"  id="c115" class="chk" name="F115" value="115" onclick="ck('115')" $checked[115]/>&#x2002;Pumpkin  </div>
<div id="d149" class="dchk"><input type="checkbox"  id="c149" class="chk" name="F149" value="149" onclick="ck('149')" $checked[149]/>&#x2002;Radish</div>
<div id="d415" class="dchk"><input type="checkbox"  id="c415" class="chk" name="F415" value="415" onclick="ck('415')" $checked[415]/>&#x2002;Rhubarb</div>
<div id="d214" class="dchk"><input type="checkbox"  id="c214" class="chk" name="F214" value="214" onclick="ck('214')" $checked[214]/>&#x2002;Spinach </div>
<div id="d346" class="dchk"><input type="checkbox"  id="c346" class="chk" name="F346" value="346" onclick="ck('346')" $checked[346]/>&#x2002;Squash, Yellow </div>
<div id="d344" class="dchk"><input type="checkbox"  id="c344" class="chk" name="F344" value="344" onclick="ck('344')" $checked[344]/>&#x2002;Squash, Zucchini</div>
<div id="v025" class="dchk"><input type="checkbox"  id="cv025" class="chk" name="F025" value="025" onclick="ckv('025')" $checked[025]/>&#x2002;Tomato </div>
</div>

<input type="hidden" name="sub" value="64" />
<input type="hidden" name="rec" value="$rec" />
<input type="submit" value="Next" class="btn" /></div></form>

</div>
EOT;

ob_flush();
}


elseif($sub == 4){        // DOCS SELECT TESTS
  $ratedCount = 0;
  $matches = array();
  $s14 = 'block';
    $sql = "SELECT `Code`, `description` FROM `Rast` WHERE `Code` LIKE'F%' ORDER BY `Code`";  
    $results = mysqli_query($dbc,$sql);
    while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){
        //$desc[$code] = $description;

    }
/*
//    $rank = unserialize(file_get_contents('/home/amx/public_html/rank.ser'));
  //  $rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
  //  $rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);

$rankTxt = file_get_contents('rankIgE.txt');
$rankIgX = explode("\n",$rankTxt);
foreach($rankIgX as $v => $k){
    $v++;
    $rank[1][$k] = $v;
}
//var_export($rank[1]);

$rankTxt = file_get_contents('rankIgG4.txt');
$rankIgX = explode("\n",$rankTxt);
foreach($rankIgX as $v => $k){
    $rank[3][$k] = ++$v;
}
*/
  
/*  if($sub == 2){
    foreach($_POST as $code => $v){
      if(substr($code,0,1) == 'F'){
        $showE[$code] = $rank[1][$code]; //intval($rank[1][$code]);
        $showG4[$code] = $rank[3][$code]; // intval($rank[3][$code]);
        $ratedCount++;
        $descriptions[$code][1] = 1;
        $matches[$code] = 1;
      }
      elseif($k == 'C'){
        $limit = intval($v);
      }
    }
    $food[0] = $showE;
    $food[1] = $showG4;
    $food[2] = $desc;
    $food[3] = $matches;
    $food[4] = $_POST;
    $foods = $food;

    $foods['limit'] = $limit;
    $fp = fopen($client . 'food.jsn','w');
    $jsn = mysqli_real_escape_string($dbc,json_encode($foods));
    fwrite($fp,$jsn);
  }
*/
$strdob = date('m/d/Y',strtotime($dob));

echo <<<EOT
<div id="post">
$clientName
$t
<form action="#" method="post">
<div>
<input type="hidden" name="rec" value="$rec"/>
<button class="link" type="button" onclick ="exp('s0')">$patient</button><br><div id="s0">
<br>Last:<br><input type="text" name="last" value="$last" />
<br>First:<br><input type="text" name="first" value="$first" />
<br><br>DoB:<br><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy" /><br><br>
<div id="d001" class="dchk"><input id="c001" type="radio" class="chk" name="gender" value="1" onclick="radio('001','002')" $checked[1]/>&#x2002;Male </div><br>
<div id="d002" class="dchk"><input id="c002" type="radio" class="chk" name="gender" value="2" onclick="radio('002','001')" $checked[2]/>&#x2002;Female</div><br>
Address:<br><input name="address" type="text" value="$address" /></p>
Zip:<br><input name="zip" type="text" value="$zip" /></p>
City:<br><input name="city" type="text" value="$city" />&#x2002;</p>
State:<br><input name="state" type="text" value="$state" />&#x2002;</p>
<br><hr/>$rec<br></div></div>



EOT;

//var_export($showE);exit;
$rated = array();
$js = 'var Rated = {';
$jsort =  'var checkBoxes = {';
$Checks = 'var Checks = {';
$icon = array('tblankx','plus');
$cnt = count($showE);
if ($cnt > 0){
  reset($showE);
  reset($showG4);
  $ndx = 0;
  while($ndx < $cnt){
    $g4 = current($showG4);
    $e  = current($showE);
    $ndx++;
    $ke = key($showE);  
    $rank1 = $rank[1][$ke];
    $numE = substr($ke,1); // checkboxes allergen code 
    $clientde = "d1$numE";
    $clientce = "c1$numE";
    $ce = "1$numE";
    $js .= "$ce:[null,null],";
    $rated[$ce] = true;
    $jsort .= "$ce:[10,null,null,false,false,false,false,false,false,false],";
    $checkBoxes .= 
    $kg4 = key($showG4);
    $rank3 = $rank[3][$kg4];
    $numG4 = substr($kg4,1);
    $clientcg4 = "c3$numG4";
    $clientdg4 = "d3$numG4";
    $cg4 = "3$numG4";
    $rated[$cg4] = true;
    $jsort .= "$cg4:[30,null,null,false,false,false,false],";
 
    $list .= <<<EOT

<div class="row"><div id="$clientde" class="echk" title="1"><input type="checkbox"  id="$clientce" class="chk" value="$ke" name="E$numE" onclick="ck('$ce')" $checkedE[$ke] /><div class="descE" onclick="clickit($ce)">&#x2002;$ndx&#x2002;$ke $desc[$ke]</div>
</div>&#x2003;<div id="$clientdg4" class="gchk" title="3"><input type="checkbox"  id="$clientcg4" class="chk" value="$kg4" name="G$numG4" onclick="ck('$cg4')" $checkedG[$kg4] /><div class="descG4" onclick="clickit($cg4)">&#x2002;$ndx&#x2002;$desc[$kg4]
</div></div><br></div>


EOT;
    next($showE);
    next($showG4);
  }
}

}


$pdx = 100;
$ndx = 0;
$types = array('','IgE','IgG','IgG4');
$jspc = "var panelCodes = {";
$panels = array();
$sqlcp = "SELECT `rec`, `description`,`panel` FROM `clientPanels` WHERE `include` = 1 AND `client` = $client";
$results = mysqli_query($dbc,$sqlcp);
$cnt = 0;
while(list($number,$description,$panel) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $cnt++;
  $p[$pdx] = $description;
  $TestTypeCount = array(0,0,0,0,0,0,0,0,0);
  $codes = '';
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
  $result = mysqli_query($dbc,$sql);
  $hits = 0;
  $cp = array();
  while(list($code,$type) =  mysqli_fetch_array($result, MYSQLI_NUM)){
  //  if(substr($code,0,1) != 'F'){continue;}
    $cp[$pdx] = $desc[$code];
    $jsort .= "$pdx:[0,null,null,false,false,false,false],";
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$pdx][$code] = array($desc[$code],intval($tests[$pdx][$code][1]) + pow(2,$type));}
    $TestTypeCount[$type]++;
    $hits++;
    $c = intval($type . substr($code,1));
    if($rated[$c]){
      $codes .=  "$c,";
    }
  }
  $panels[0][$pdx] =array("$panel $description","$TestTypeCount[1]","$TestTypeCount[3]",$hits,$panel);
  $codes = substr($codes,0,-1) . ']';
  $jspc .= "$pdx:[$codes,";
  $pdx++;
  //if($pdx > 1005){break;}
}
$cfp = '';
if($cnt > 0){
  $cfp = 'Custom Food Panels';
}
echo <<<EOT
<div class="col"><div class="col">
<button id="b16" class="link" type="button" onclick ="panels('s16')">Panels</button>
<div id="s16" class="expand">
<table><tr><td><button type="button" class="titlehead">IgE and IgG4</button></td><td><button type="button" class="typehead">Only</button></td><td><button type="button" class="typehead">Only</button></td><td></td><td><button class="titlehead">$cfp</button></td></tr>
<tr>
<td><div id="d200"</div><button id="b200" type="button" class="titlebutton" onclick="showPanel('200')">Comprehensive</button></td>
<td><div id="d201"</div><button id="b201" type="button" class="typebutton"  onclick="showPanel('201')">IgE</button></td>
<td><div id="d202"</div><button id="b202" type="button" class="typebutton"  onclick="showPanel('202')">IgG4</button></td>
<td>&#x2003;</td>
<td><button id="d100" type="button" class="titlebutton" onclick="showPanel('100')">$p[100]</button></td>
</tr>
<tr>
<td><div id="d203"</div><button id="b203" type="button" class="titlebutton" onclick="showPanel('203')">Standard</button></td>
<td><div id="d204"</div><button id="b204" type="button" class="typebutton"  onclick="showPanel('204')">IgE</button></td>
<td><div id="d205"</div><button id="b205" type="button" class="typebutton"  onclick="showPanel('205')">IgG4</button></td>
<td>&#x2003;</td>
<td><button id="d101" type="button" class="titlebutton" onclick="showPanel('101')">$p[101]</button></td>
</tr>
<tr>
<td><div id="d206"</div><button id="b206" type="button" class="titlebutton" onclick="showPanel('206')">Mini</button></td>
<td><div id="d207"</div><button id="b207" type="button" class="typebutton"  onclick="showPanel('207')">IgE</button></td>
<td><div id="d208"</div><button id="b208" type="button" class="typebutton"  onclick="showPanel('208')">IgG4</button></td>
<td>&#x2003;</td>
<td><button id="d102" type="button" class="titlebutton" onclick="showPanel('102')">$p[102]</button></td>
</tr>
<tr>
<td><div id="d209"</div><button id="b209" type="button" class="titlebutton" onclick="showPanel('209')">IBS</button></td>
<td><div id="d210"</div><button id="b210" type="button" class="typebutton"  onclick="showPanel('210')">IgE</button></td>
<td><div id="d211"</div><button id="b211" type="button" class="typebutton"  onclick="showPanel('211')">IgG4</button></td>
<td>&#x2003;</td>
<td><button id="d103" type="button" class="titlebutton" onclick="showPanel('103')">$p[103]</button></td>
</tr>
<tr>
<td><div id="d212"</div><button id="b212" type="button" class="titlebutton" onclick="showPanel('212')">Hidden Foods</button></td>
<td><div id="d213"</div><button id="b213" type="button" class="typebutton" onclick="showPanel('213')">IgE</button></td>
<td><div id="d214"</div><button id="b214" type="button" class="typebutton" onclick="showPanel('214')">IgG4</button></td>
<td>&#x2003;</td>
<td><button id="d104" type="button" class="titlebutton" onclick="showPanel('104')">$p[104]</button></td>
</tr>
EOT;
$cnt = count($cp) - 5;
$pdx = 105;
while($cnt > 0){
  $cnt--;
  echo <<<EOT
<td><button type="button" class="titlebuttonx"></button></td>
<td><button type="button" class="typebuttonx" "></button></td>
<td><button type="button" class="typebuttonx" ></button></td>
<td>&#x2003;</td>
<td><button id="b$pdx" type="button" class="titlebutton" onclick="showPanel('$pdx')">$desc[$pdx]</button></td>
</tr>

EOT;
$pdx++;
}

  echo <<<EOT
</table>

<button id="pname"></button>
<button id="pigE"></button>
<button id="pigG4"></button>




EOT;
ob_flush();

echo <<<EOT
<button id="b15" class="link" type="button" onclick ="panels('s15')">Panel Details</button>
<div id="s15" class="expand">

EOT;
$pdx = 200;
$ndx = 0;
$fp = fopen("/home/amx/public_html/f/amxpanels.txt", "r");
//$fp = fopen("/home/isl/public_html/amx/f/panels.txt", "r");
while (($text= fgets($fp , 72)) !== false) {
  $ndx++;
  if($ndx > 30){break;}
  $panel = trim(substr($text,0,5));
  $description = trim(substr($text,8,128));
  $TestTypeCount = array(0,0,0,0,0,0,0);
  $codes = '';
  $show = "$panel: $text\n";
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
  $results = mysqli_query($dbc,$sql);
  $hits = 0;
  while(list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if($type > 0){$tests[$pdx][$code] = array($desc[$code],intval($tests[$pdx][$code][1]) + pow(2,$type));}
    $TestTypeCount[$type]++;
    $hits++;
    $c = intval($type . substr($code,1));
    if($rated[$c]){
      $codes .= "$c,";
    }
  }
  $panels[1][$pdx] = array($description,"$TestTypeCount[1]","$TestTypeCount[3]",$hits,$panel);
  $codes = substr($codes,0,-1) . ']';
  $jsort .= "$pdx:[0,null,null,false,false,false,false],";
  $pdx++;
  $savePanels = var_export($panels,1);
}
$jspc = substr($jspc,0,-1) . "};\n";
$classes = array();
$classes[0] = 'left';
$classes[1] = 'left';
$classes[2] = 'IgE';
$classes[4] = 'left';
$classes[6] = 'IgE';
$classes[12] = 'left';
$classes[8] = 'IgG4';
$classes[10] = 'both';
$types = array();
$types[0] = '';
$types[1] = '';
$types[2] = 'IgE';
$types[4] = 'IgG';
$types[6] = 'IgE IgG';
$types[12] = 'IgG IgG4';
$types[8] = 'IgG4';
$types[10] = 'IgE IgG4';
$ndx = 0;
$panelTitle = array('<h3>Your Custom Food Panels</h3>','<h3>Allermetrix Food Panels</h3>');
$panelType = array('C','P');
ksort($panels);
$savType = 0;
$matches = $food[3];
//echo '<div class="left"><pre>' . "$sqlcp\n";
//var_export($panels); exit;
foreach($panels as $type => $array){
  echo $panelTitle[$type] . '<div class="legend"><div class="pige" style="width:2.4em">IgE</div><div class="pigg4" style="width:2.4em">IgG4</div></div>';
  foreach($array as $number => $v){
  $title = $panels[$type][$number][0];
  $cntE = $panels[$type][$number][1];
  $cntG4 = $panels[$type][$number][2];
  $panel = $panels[$type][$number][4];
  echo <<<EOT
<div id="d$number" class="pchk">
<input type="checkbox"  id="c$number" class="chk" name="$panelType[$type]$type$panel" value="$panel" onclick="pck('$number')" />
<div class="panel">&#x2002;$v[0]</div>
<div class="inline" onclick="exp('EXP$number')">
<div class="pige">$cntE</div><div class="pigg4">$cntG4</div><div class="downarrow"></div>
</div>
<br>
</div>
EOT;
   // $panel = intval(preg_replace('/^D/','',$panel));
    if(count($tests[$number]) > 0){
      asort($tests[$number]);
      echo "<div id=\"EXP$number\" class=\"expand\">\n";
      foreach($tests[$number] as $code => $array){
        $match = $icon[$matches[$code]];
        list($description,$class) = $array;
        $description = $array[0];
        $c = substr($code,1);
        echo '<div class="' . $classes[$class] . '"><div class="' . $match . '"></div><div class="inline">&#x2002;' .  $description .'</div><div class="types">' . $types[$class] . "</div></div><br>\n";
      }
      echo "<div class=\"row\"><div class=\"plus\"></div> Patient Selected &#x2003;<div class=\"tblank\"></div> Not Selected</div></div>\n";
    }
    else{
      echo "<div id=\"EXP$panel\" class=\"expand\">No Tests Found </div>\n";
    }
  }
}
$js = substr($js,0,-1) . "};\n";
echo <<<EOT
</div><br><br></div><hr></div>
<button id="c003" type="button" class="select" name="C" value="15" onclick="showtop('003',15)" >&#x2002;Top 15</button>
<button id="c010" type="button" class="select" name="C" value="20" onclick="showtop('010',20)" >&#x2002;Top 20</button>
<button id="c004" type="button" class="select" name="C" value="30" onclick="showtop('004',30)">&#x2002;Top 30</button>
<button id="c005" type="button" class="select" name="C" value="40" onclick="showtop('005',40)">&#x2002;Top 40</button><br>
<button id="c007" type="button" class="select" name="C" value="999" onclick="showtop('007',999)">&#x2002;Select All</button>
<button id="c006" type="button" class="select" name="C" value="0" onclick="clearAll()" >&#x2002;Clear All</button>
<button id="c008" type="button" class="select" name="C" value="999" onclick="clearIgX(1)" >&#x2002;Clear IgE</button>
<button id="c009" type="button" class="select" name="C" value="999" onclick="clearIgX(3)" >&#x2002;Clear IgG4</button>
<div class="ige">&#x2003;&#x2003;IgE </div> <div class="igg">&#x2003;&#x2003;IgG4 </div>
  $list
<br></div>
<input type="hidden" name="sub" value="3" />
<input type="hidden" name="client" value="$id" />
<input type="hidden" name="rec" value="$rec" />
<input type="hidden" name="zip" value="$zip" />
<input type="hidden" name="address" value="$address" />
<input type="hidden" name="city" value="$city" />
<input type="hidden" name="state" value="$state" />
<hr>
<input type="submit" value="Create Request Form" class="go" />
</div></form></div></div><pre>

EOT;
ob_flush();
if($ip == '70.171.18.10'){echo "<pre>. $show</pre> ";}
$jsort = substr($jsort,0,-1) . "};\n";
echo <<<EOT




















<script> //<![CDATA[

$jsort
$jspc
$js
console.log('checkBoxes');
console.log(checkBoxes);


//var panelCodes = {999:[null,false,false,false,false]};
var checkObj = {1329:[null,null,null,null]};

var ip = '$ip';
var prev = null;
var previousPanel = 200;
var div=0;
var disp = '';
var show = '';
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';

var id = 0;
var c = {};
var d = {};
var b = new Array;
var p = new Array;

var bg = {1:[false,true],10:[false,true],3:[false,true],30:[false,true]};

console.log('bg');
console.log(bg);



var idType = 0;
toggle = {};
toggle[true] = false;
toggle[false] = true;
var panelButtons = {};
var idTypes = 0;
var pnum = document.getElementById('pnum');
var pname = document.getElementById('pname');
var pigE = document.getElementById('pigE');
var pigG4 = document.getElementById('pigG4');
var togglePanel = [];
togglePanel[false]  = 'linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%)';
togglePanel[true]   = 'linear-gradient(to bottom, rgba(255,0,0,1) 0%, rgba(128,0,0,1) 100%)';
console.log('panelCodes');
console.log(panelCodes);
//console.log('checkBoxes');
//console.log(checkBoxes);
console.log('checkBoxes');
console.log(checkBoxes);
console.log('Rated');
console.log(Rated);

//const ANTIBODY_TYPE = 1;
//const CHECKED = 3;
//console.log(CHECKED=' +  CHECKED);
//console.log('ANTIBODY_TYPE=' + ANTIBODY_TYPE);

console.log(bg);


//1:[false,true]
//3:[false,true]
//10:[false,true]
//30:[false,true]
function init(){
  var i;
  for (var p in checkBoxes){  // panels [p] are less than 300
    if(p > 299){
	
	for (var p in checkBoxes){
		console.log(checkBoxes[p][1])
	}
     // document.getElementById('d' + p).style.backgroundColor =  '#f0f';
      //document.getElementById('c' + p).style.backgroundColor =  '#f0f';
      //checkBoxes[p][1] = '<input id="c" + p +" class="chk" type="checkbox" value=F"' + substr(p,1) + '" name="G002" onclick="ck(' + p +')';
    }
    checkBoxes[p][1] =  document.getElementById('d' + p);
    checkBoxes[p][2] =  document.getElementById('c' + p);
    if(p > 999 ){
      checkBoxes[p][1].style.backgroundColor = bg[checkBoxes[p][1][Number(false)]]; // colors checkbox 
    }
	
    else{
      checkBoxes[p][1].style.backgroundColor = bg[checkBoxes[p][1][false]];
    }
  }
} 
function ck(id){
  checkBoxes[id][3] = toggle[checkBoxes[id][3]];
  checkBoxes[id][1].style.backgroundColor = bg[checkBoxes[id][3]];
}

function clickit(id){
  if(!Rated[id][1].disabled){
    Rated[id][1].checked=toggle[Rated[id][1].checked];
    ck(id);
  }
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}






window.onload = init;
</script>
EOT;
/*
function panels(id){
  div = document.getElementById(id);
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}
function summary(id){
  div = document.getElementById('post');
  div.style.display=flip[div.style.display];
  div = document.getElementById('s14');
  div.style.display=flip[div.style.display];
//  var y=div.offsetTop;window.scrollTo(0, y-64);
  
}


function cb(id){
  div = document.getElementById(id);
  div.style.backgroundColor=bg[div.checked][idType];
}

function radio(on,off){
  document.getElementById('d' + on).style.backgroundColor=bg[true][idType];
  document.getElementById('d' + off).style.backgroundColor=bg[false][idType];
}


function swap(){
  var req = document.getElementById('s18');
  var panel = document.getElementById('s15');
  panel.style.display = flip[panel.style.display];
  req.style.display = flip[req.style.display];
  var btn = document.getElementById('b15');
  if(btn.innerHTML == 'Get Request Form'){
    btn.innerHTML = 'Get Food Panels';
  }
  else{
    btn.innerHTML = 'Get Request Form';
  }
}

EOT;
*/

if($sub == 9999){  //  DOCS SELECT TESTS
//if($sub == 4){  //  DOCS SELECT TESTS

echo <<<EOT

function pck(id){console.log('pck' + id);
  var checked = checkBoxes[id][1].checked;
  checkBoxes[id][0].style.backgroundColor=bg[checked][idType];
  checkBoxes[id][3].style.backgroundColor=bg[checked][idType];
  for (var r in checkBoxes){
    checkBoxes[r][0].style.backgroundColor=bg[false][idType];
    checkBoxes[r][4].checked=false;
    checkBoxes[r][4].disabled=false;
  }
  for (var r in checkBoxes){
    if (document.getElementById('b' + r) == null){continue;}
    checkBoxes[r][3].style.backgroundColor = '#006';
    checkBoxes[r][0].style.backgroundColor = bg[false][idType];
    checkBoxes[r][1].checked = false;
  } 
  if(checked){
    checkBoxes[id][3].style.backgroundColor = '#f00';
//    pname.innerHTML = checkBoxes[id][4];
//    pigE.innerHTML = checkBoxes[id][5];
//    pigG4.innerHTML = checkBoxes[id][6];
    for (var div=0; div<panelCodes[id].length; div++){
      checkBoxes[div][0].style.backgroundColor=bg[checkObj[panelCodes[id][div]][0].title][idType];
      checkBoxes[div][3].checked=true;
      checkBoxes[div][3].style.backgroundColor=bg[checkObj[panelCodes[id][div]][0].title][idType];
    }
    var y=foods.offsetTop;
    window.scrollTo(0, y);
  }
  else{
    pname.innerHTML = '';
    pigE.innerHTML = '';
    pigG4.innerHTML = '';
  }
  checkBoxes[id][1].checked=checked;
  checkBoxes[id][0].style.backgroundColor=bg[checked][idType];
}


function ck2(id){
  idType = id.substring(0,1);
  f[id].style.backgroundColor=bg[cf[id].checked][idType];
  v[id].style.backgroundColor=bg[cv[id].checked][idType];
}


function showPanel(id){
  if (b[id] == null){return;}
  var check = checkBoxes[id].checked;
  b[previousPanel].style.background = togglePanel[false];
  checkBoxes[previousPanel].checked = false;
  checkBoxes[id].checked = toggle[check];
  b[id].style.background = togglePanel[checkBoxes[id].checked];
  previousPanel = id;
  pck(id);
}

function showtop(on,off){
  for (var idType=1; idType<4; idType+=2){
    var ndx = 0;
    for (var div=0; div<checkBoxes.length; div++){
     if(checkBoxes[div[idType]][1].disabled){ndx++;continue;};
     if(ndx < off){
        checkBoxes[div][idType]][0].style.backgroundColor=bg[true][idType];
        checkBoxes[div][idType]][1].checked=true;
        checkBoxes[div][idType]][1].disabled=false;
        checkBoxes[div[idType]][1].style.opacity=1;
      }
      else{
        checkBoxes[div][idType]][0].style.backgroundColor=bg[false][idType];
        checkBoxes[div][idType]][1].checked=false;
        checkBoxes[div][idType]][1].disabled=false;
        checkBoxes[div][idType]][1].style.opacity=1;
      }
      ndx++;
    }
  }
  ratedCount = off;
 // C.style.backgroundColor=bg[false][idType];




var foods = document.getElementById('s16');
var panel = document.getElementById('s15');
var ratedCount = $ratedCount;
document.getElementById('s0').style.display = 'none';

var panelname = [['','','','',''],['','900','950','950-1','255'],['','900-5','950-3','950-5','255-2'],['','900-6','950-4','950-6','255-1']];


function clearIgX(X){
  for (var div=0; div<checkBoxes.length; div++){
      if(checkObj[div][X]][1].disabled){continue;};
      checkBoxes[div[X]][0].style.backgroundColor=bg[false][X];
      checkBoxes[div[X]][1].checked=false;
      checkBoxes[div[X]][1].disabled=false;
      checkBoxes[div[X]][1].style.opacity=1;
  }
}



function clearAll(){ 
  for (var r in checkBoxes){
    if (document.getElementById('b' + r) == null){console.log('continue ' + r);continue;}
    idType = r.substring(0,1);
    checkBoxes[r][0].style.backgroundColor = bg[false][idType];
    checkBoxes[r][3].style.backgroundColor = bg[false][idType];
    
 //   if(checkBoxes[r][3] == null){alert('panel=' + r);continue;}
    if(checkBoxes[r][3] == null){continue;}
    checkBoxes[r][3].style.backgroundColor = '#006';    
  }
  console.log('end checkBoxes');
  checkBoxes[r][1].checked = false;
  pck(r);

}




//c[id] checkboxes object
//var checkObj = {id:[false,false]

//checkBoxes.checked (true or false)) 
//checkBoxes.background (true or false)
// checkBoxes = {id:[false,false]}
//checkBoxes.[id].checked (true or false)
//togglePanel[checkBoxes.checked[id]]
//checkBoxes.background (true or false)
// var checkBoxes[id] = {id:[checked],[back]}

/*

  var divs = document.getElementsByTagName("button");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "b"){
          i = did.substring(1,6);
          b[i] = document.getElementById('b' + i);
        if (checkBoxes[i] != null){
          checkBoxes[i][3] = divs[div]; 
        }
      }
      else if(idType == 'p'){document.getElementById('p' + i);
        p[i] = document.getElementById('p' + i);
      }
    }
  }
  prev = document.getElementById('S1');

  if(foods != null){
    var foffset = foods.clientOffset;
    var poffset = panel.clientOffset;
    var diff = poffset - foffset;
    foods.style.display = 'none';
  }
  if(diff > 10){
    // foods.style.display = 'none';
  }
  else{
    panel.style.display = 'none';
    foods.style.display = 'block';
  }
   document.getElementById('S1').style.display = 'block';
 //  document.getElementById('s18').style.display = 'none';
//   checkBoxes[9000][1].checked = false;
//   pck(9000);
//  if(ratedCount < 31){document.getElementById('d005').style.display = 'none';}
//  if(ratedCount < 16){document.getElementById('d004').style.display = 'none';}
  document.getElementById('d001').style.backgroundColor = '#008';
  document.getElementById('d002').style.backgroundColor = '#008';

  //  var y=foods.offsetTop;
    window.scrollTo(0, 0);
  
  clearAll();
  panel.style.display = 'none';
  foods.style.display = 'none';
  previousPanel == 200;
}


*/
echo <<<EOT


window.onload = init;
</script>

EOT;


} //end of sub == 4
else if ($sub == 32){
if ($sub == 32){
echo <<<EOT
  d.style.backgroundColor=bg[true][idType];
  var d = document.getElementById('d' + id);
function ck(id){
  var d = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  d.style.backgroundColor=bg[checkBoxes.checked][idType];
}
function ckf(id){
  var df = document.getElementById('f' + id);
  var cf = document.getElementById('cf' + id);
  df.style.backgroundColor=bg[cf.checked][idType];
  document.getElementById('v' + id).style.backgroundColor=bg[cf.checked][idType];
  document.getElementById('cv' + id).checked = cf.checked;
}
function ckv(id){
  var dv = document.getElementById('v' + id);
  var cv = document.getElementById('cv' + id);
  dv.style.backgroundColor=bg[cv.checked][idType];
  document.getElementById('f' + id).style.backgroundColor=bg[cv.checked][idType];
  document.getElementById('cf' + id).checked = cv.checked;
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  var did = prev.getAttribute("id");
  did = 'b' + did.substr(1,3);
  document.getElementById(did).style.color='#0ff';
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
EOT;

//c[id] checkboxes object
//var checkObj = {id:[false,false]

//checkBoxes.checked (true or false)) 
//checkBoxes.background (true or false)
// checkBoxes = {id:[false,false]}

//checkBoxes.[id].checked (true or false)
//togglePanel[checkBoxes.checked[id]]
//checkBoxes.background (true or false)
// var checkBoxes[id] = {id:[checked],[back]}
echo <<<EOT
function init(){
var checked,did,idType,i,chk;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
      idType = did.substring(0,1);
      if (idType == "d"){
        i = did.substring(1,6);
        checkBoxes[i] = document.getElementById('c' + i);
        d[i] = divs[div];
      }
      if (idType == "s"){
        divs[div].style.display = 'none';
      }
    }
  }
  prev = document.getElementById('s0');
  prev.style.display = 'block';
  console.log(checkBoxes);
}
</script>
echo <<<EOT


function ck(id){
  var c = document.getElementById('c' + id)
  var d = document.getElementById('d' + id)
  c.style.backgroundColor=bg[checkBoxes.checked][idType];
}
function exp(id){
  var div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}


function zip(zipcode){
    xmlhttp=null;
    var Url="zip.php"
  if (window.XMLHttpRequest){  // Fuckin\' Microsoft!
    xmlhttp=new XMLHttpRequest();
  }
  else if (window.ActiveXObject){ // Fuck Fuckin\' Microsoft!
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (xmlhttp!=null){
    xmlhttp.onreadystatechange=getCity;
    xmlhttp.open("POST", Url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xmlhttp.send( 'zc=' + zipcode);
    
  }else{
    alert("UNEXPECTED ERROR: XMLHttpRequest not supported");
  }
};
function  getCity(){
  var retVals = '';
  if (xmlhttp.readyState==4){
    if (xmlhttp.status==200){
      var retVal=xmlhttp.responseText;
      if(retVal == 1){document.getElementById('m' + mp3).style.display = 'none';if(current == mp3){next();}}else{alert('WTF:' + retVal);}
      
    }
    else{
      alert("UNEXPECTED AJAX ERROR: : " + xmlhttp.statusText + "HTTP Status: " + xmlhttp.status);
    }
  }
};





function init(){
  document.getElementById('post').style.display = 'block';
  ck('001');
  ck('002');
}




EOT;
}
}
echo <<<EOT
var id = $client;
window.onload = init;
//]]>
</script><pre style="color:#fff">
EOT;
//var_export($panels);
//var_export($tests);
echo <<<EOT

</pre><div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;
ob_end_flush();

?>
