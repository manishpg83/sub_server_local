<?php ob_start("ob_gzhandler");
$startTime = microtime(true);
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$client = intval($_COOKIE['amxc']);
setcookie("amxc", $client,time()+86400);
$patient = preg_replace("/\D/", "", $_POST['p']);
if($_GET['t'] = 1360){$client= 888887; $patient = 100005;}
$sub = intval($_POST['sub']);
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Clinical History</title>
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:2em 0 0 0;padding:0;background:#fff;color:#000; }
#page1{width:480px;margin-left:10%;}
.red{color:#f00;}
#page{padding:0;width:480px;margin:0 auto;}
input[type="radio"],input[type="checkbox"]{width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin-left:4px;vertical-align: middle;position: relative;background:#333;color:#eee;}
.btn,.link{width:100%;padding: .5em;margin:.5em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.btn{border:1px solid #2985EA;color: #fff;background-color:#2985EA;background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.link{border:1px solid #69B5B3;color: #fff;background-color:#fff;
background-image: linear-gradient(to bottom, #164 0%, #033 100%);}
.dchk,.dchk2,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;}
.dchk,.dchk2,.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
p{margin:5px 0 5px 1em;font:700 1em Arial,sans-serif;}
.link {border: 1px solid #69B5B3;color: #fff;background-color: #144;background-image: linear-gradient(to bottom, #164 0%, #033 100%);width: 100%;padding: 0;margin: .7em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.dchk,#next{background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
.dchk{font:700 1em Arial,sans-serif;color:#fff;width:48%;display:inline-block;padding:8px 0 8px 0;margin:0 0 .5em;vertical-align: middle;position: relative;}
.col{background:#144;width:40em;margin:0 auto;}
.hide,#bs{background:#fff;color:#000;display:none;font-weight:400;margin:0 0 .5em;padding:.2em;text-align:center;}
#next{margin-top:1em;}
#header{margin:0 auto 0;width:640px;}
</style></head><body>
<div id="header">
<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>
</div>

<div id="page"><div id="col"><div>
<form action="#" method="post" name="SB-$sub">
EOT;
ob_flush();
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx','xD1GkuK7a7DK8!');
mysql_select_db('amx_portal');



  $today = date('Y-m-d');

$num = 200;
$sql = "SELECT `Code`, `shortdescription` FROM `Rast` WHERE `Code` LIKE'F%' ORDER BY `Code`";
$results = mysql_query($sql);
while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
$rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);
$data = array_diff_key($rank[10] ,$rank[1] );
foreach($data as $code => $num){
  $rank[1][$code] =  $num;
}
$data = array_diff_key($rank[10] ,$rank[3] );
foreach($data as $code => $num){
  $rank[3][$code] =  $num;
}
/*if($sub == 2){  // SAVE FOODS
  $rec = intval($_POST['rec']);
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
  $today = date('Y-m-d');
  $jsn = json_encode($foods);
  $jsn = mysql_real_escape_string($jsn);
  $sqlf = "UPDATE `history` SET `foods`='$jsn' WHERE `id` = $rec";
  mysql_query($sqlf);
  if(mysql_errno > 0){$err = "$sqlf\n" . mysql_error();}
}
*/
if(true){  // hide array init
 
 $checkbox = array('mother','father','brother','sister','grandparent','grandparent','chest tightness','coughing','frequent infections','shortness of  breath','swelling of throat','eczema','bloating','flushing','colic','hives','cramps','itching','diarrhea','rashes','nausea','wheezing','red bumps','vomiting','swelling of lips','headaches','ear infections','anaphylaxis','itchy, red, watery eyes','ear pain','cannot sleep','loss of smell','hearing loss','loss of consciousness','nasal congestion','itchy ears','low blood pressure','nasal pain','sinus infection','runny nose','sinus pressure','sinus pressure or pain','vertigo','sneezing','in morning','inside house','at bedtime','outside during morning','in afternoon','when cleaning','windy days','outside during night','in evening','after eating','warm days','during yard work','at work','in basement','cold days','near animals','at school','in bedroom','on clear days','near farms/barns','January','April','July','October','February','May','August','November','March','June','September','December','dog','cat','bird','horse','hamster','rabbit','goat','pig','chicken','sheep','guinea pig','duck','goose','parakeet','parrot','pigeon','cow');
 
 
  $checked = array_fill(0,92,'');
  $label = array('','Parents','Sibling','Grandparents','Respiratory','Skin','Digestive','Head','Whole Body','N/A','');
  $scores = array( 0, 2, 2, 1, 1, 0, 0, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 3, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  $categories = array( 9, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9);
  $category = array(0=>0,1=>0,2=>0,3=>0,4=>0,5=>0,6=>0,7=>0,8=>0,9=>0,10=>0);
  $inhalantFoodTitles = array('Inhalants and Foods','Inhalants','Foods');
  $inhalantFoods = array( 9, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 2, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
}
$inhalantFood = array(0,0,0);
foreach($_POST as $k => $v){  // GET CHECKED POST VALUES
  $type = substr($k,0,1);
  if($type != 'c'){continue;}
  if($type != 'a'){continue;}
  
  $checked[$v] = 'checked="checked"';
  $show .= "$v)&#x2003;$checkbox[$v]: ";
  $show .= $label[$categories[$v]] . ',&#x2003;' . $inhalantFoodTitles[$inhalantFoods[$v]]. "<br/>\n";
  $sql .= "chk$v=1,";
  $category[$categories[$v]] += 1; //$scores[$v];
  $inhalantFood[$inhalantFoods[$v]] += 1;
}
//$show = "<br/>$inhalantFoodTitles[0] = $inhalantFood[0]<br/>$inhalantFoodTitles[1] = $inhalantFood[1]<br/>$inhalantFoodTitles[2] = $inhalantFood[2]<hr/>$show";
echo <<<EOT
$clientName
<p class="bold center red">You must click the "Next" button to post to your physician after making your selections</p>
<p><br>Click Category to expand / contract.</p>
<button class="btn" type="button" onclick ="exp('s1')">Family History</button><div id="s1" class="hide">
<p>Do you  have any of your family members have allergies?<br/>&#x2002;</p>
<div id="d1" class="dchk"><input type="checkbox"  id="c1" class="chk" name="c1" value="1" onclick="ck(1)" $checked[1] />&#x2002;mother</div>
<div id="d2" class="dchk"><input type="checkbox"  id="c2" class="chk" name="c2" value="2" onclick="ck(2)" $checked[2] />&#x2002;father</div>
<div id="d3" class="dchk"><input type="checkbox"  id="c3" class="chk" name="c3" value="3" onclick="ck(3)" $checked[3] />&#x2002;brother</div>
<div id="d4" class="dchk"><input type="checkbox"  id="c4" class="chk" name="c4" value="4" onclick="ck(4)" $checked[4] />&#x2002;sister</div>
<div id="d5" class="dchk"><input type="checkbox"  id="c5" class="chk" name="c5" value="5" onclick="ck(5)" $checked[5] />&#x2002;grandparent mother</div>
<div id="d6" class="dchk"><input type="checkbox"  id="c6" class="chk" name="c6" value="6" onclick="ck(6)" $checked[6] />&#x2002;grandparent father</div>
</div><button class="btn" type="button" onclick ="exp('s9')">Respiratory Symptoms</button><div id="s9" class="hide">
<p>Do you  have any of these symptoms?<br/>&#x2002;</p>
<div id="d7" class="dchk"><input type="checkbox"  id="c7" class="chk" name="c7" value="7" onclick="ck(7)" $checked[7] />&#x2002; chest tightness</div>
<div id="d8" class="dchk"><input type="checkbox"  id="c8" class="chk" name="c8" value="8" onclick="ck(8)" $checked[8] />&#x2002; coughing</div>
<div id="d9" class="dchk"><input type="checkbox"  id="c9" class="chk" name="c9" value="9" onclick="ck(9)" $checked[9] />&#x2002; frequent infections</div>
<div id="d10" class="dchk"><input type="checkbox"  id="c10" class="chk" name="c10" value="10" onclick="ck(10)" $checked[10] />&#x2002; shortness of  breath</div>
<div id="d11" class="dchk"><input type="checkbox"  id="c11" class="chk" name="c11" value="11" onclick="ck(11)" $checked[11] />&#x2002; swelling of throat</div>
<div id="d12" class="dchk"><input type="checkbox"  id="c12" class="chk" name="c12" value="12" onclick="ck(12)" $checked[12] />&#x2002; wheezing</div>
</div><button class="btn" type="button" onclick ="exp('s2')">Skin Symptoms</button><div id="s2" class="hide">
<p>Do you  have any of these symptoms?<br/>&#x2002;</p>
<div id="d13" class="dchk"><input type="checkbox"  id="c13" class="chk" name="c13" value="13" onclick="ck(13)" $checked[13] />&#x2002;eczema</div>
<div id="d14" class="dchk"><input type="checkbox"  id="c14" class="chk" name="c14" value="14" onclick="ck(14)" $checked[14] />&#x2002;flushing</div>
<div id="d15" class="dchk"><input type="checkbox"  id="c15" class="chk" name="c15" value="15" onclick="ck(15)" $checked[15] />&#x2002;hives</div>
<div id="d16" class="dchk"><input type="checkbox"  id="c16" class="chk" name="c16" value="16" onclick="ck(16)" $checked[16] />&#x2002;itching</div>
<div id="d17" class="dchk"><input type="checkbox"  id="c17" class="chk" name="c17" value="17" onclick="ck(17)" $checked[17] />&#x2002;rashes</div>
<div id="d18" class="dchk"><input type="checkbox"  id="c18" class="chk" name="c18" value="18" onclick="ck(18)" $checked[18] />&#x2002;red bumps</div>
<div id="d19" class="dchk"><input type="checkbox"  id="c19" class="chk" name="c19" value="19" onclick="ck(19)" $checked[19] />&#x2002;swelling of lips</div>
</div><button class="btn" type="button" onclick ="exp('s3')">Digestive Symptoms</button><div id="s3" class="hide">
<p>Do you  have any of these symptoms?<br/>&#x2002;</p>
<div id="d20" class="dchk"><input type="checkbox"  id="c20" class="chk" name="c20" value="20" onclick="ck(20)" $checked[20] />&#x2002;bloating</div>
<div id="d21" class="dchk"><input type="checkbox"  id="c21" class="chk" name="c21" value="21" onclick="ck(21)" $checked[21] />&#x2002;colic</div>
<div id="d22" class="dchk"><input type="checkbox"  id="c22" class="chk" name="c22" value="22" onclick="ck(22)" $checked[22] />&#x2002;cramps</div>
<div id="d23" class="dchk"><input type="checkbox"  id="c23" class="chk" name="c23" value="23" onclick="ck(23)" $checked[23] />&#x2002;diarrhea</div>
<div id="d24" class="dchk"><input type="checkbox"  id="c24" class="chk" name="c24" value="24" onclick="ck(24)" $checked[24] />&#x2002;nausea</div>
<div id="d25" class="dchk"><input type="checkbox"  id="c25" class="chk" name="c25" value="25" onclick="ck(25)" $checked[25] />&#x2002;vomiting</div>
</div><button class="btn" type="button" onclick ="exp('s4')">Head Related Symptoms</button><div id="s4" class="hide">
<p>Do you  have any of these symptoms?<br/>&#x2002;</p>
<div id="d26" class="dchk"><input type="checkbox"  id="c26" class="chk" name="c26" value="26" onclick="ck(26)" $checked[26] />&#x2002; headaches</div>
<div id="d27" class="dchk"><input type="checkbox"  id="c27" class="chk" name="c27" value="27" onclick="ck(27)" $checked[27] />&#x2002; itchy, red, watery eyes</div>
<div id="d28" class="dchk"><input type="checkbox"  id="c28" class="chk" name="c28" value="28" onclick="ck(28)" $checked[28] />&#x2002; loss of smell</div>
<div id="d29" class="dchk"><input type="checkbox"  id="c29" class="chk" name="c29" value="29" onclick="ck(29)" $checked[29] />&#x2002; nasal congestion</div>
<div id="d30" class="dchk"><input type="checkbox"  id="c30" class="chk" name="c30" value="30" onclick="ck(30)" $checked[30] />&#x2002; nasal pain</div>
<div id="d32" class="dchk"><input type="checkbox"  id="c32" class="chk" name="c32" value="32" onclick="ck(32)" $checked[32] />&#x2002; sinus pressure or pain</div>
<div id="d33" class="dchk"><input type="checkbox"  id="c33" class="chk" name="c33" value="33" onclick="ck(33)" $checked[33] />&#x2002;sneezing</div>
<div id="d34" class="dchk"><input type="checkbox"  id="c34" class="chk" name="c34" value="34" onclick="ck(34)" $checked[34] />&#x2002;ear infections</div>
<div id="d35" class="dchk"><input type="checkbox"  id="c35" class="chk" name="c35" value="35" onclick="ck(35)" $checked[35] />&#x2002;ear pain</div>
<div id="d36" class="dchk"><input type="checkbox"  id="c36" class="chk" name="c36" value="36" onclick="ck(36)" $checked[36] />&#x2002;hearing loss</div>
<div id="d37" class="dchk"><input type="checkbox"  id="c37" class="chk" name="c37" value="37" onclick="ck(37)" $checked[37] />&#x2002;itchy ears</div>
<div id="d38" class="dchk"><input type="checkbox"  id="c38" class="chk" name="c38" value="38" onclick="ck(38)" $checked[38] />&#x2002;sinus infection</div>
<div id="d39" class="dchk"><input type="checkbox"  id="c39" class="chk" name="c39" value="39" onclick="ck(39)" $checked[39] />&#x2002;sinus pressure</div>
<div id="d31" class="dchk"><input type="checkbox"  id="c31" class="chk" name="c31" value="31" onclick="ck(31)" $checked[31] />&#x2002; runny nose</div>
<div id="d40" class="dchk"><input type="checkbox"  id="c40" class="chk" name="c40" value="40" onclick="ck(40)" $checked[40] />&#x2002;vertigo</div>
</div><button class="btn" type="button" onclick ="exp('s5')">Whole Body Symptoms</button><div id="s5" class="hide">
<p>Do you  have any of these symptoms?<br/>&#x2002;</p>
<div id="d41" class="dchk"><input type="checkbox"  id="c41" class="chk" name="c41" value="41" onclick="ck(41)" $checked[41] />&#x2002;anaphylaxis</div>
<div id="d42" class="dchk"><input type="checkbox"  id="c42" class="chk" name="c42" value="42" onclick="ck(42)" $checked[42] />&#x2002;cannot sleep</div>
<div id="d43" class="dchk"><input type="checkbox"  id="c43" class="chk" name="c43" value="43" onclick="ck(43)" $checked[43] />&#x2002;loss of consciousness</div>
<div id="d44" class="dchk"><input type="checkbox"  id="c44" class="chk" name="c44" value="44" onclick="ck(44)" $checked[44] />&#x2002;low blood pressure</div>
</div><button class="btn" type="button" onclick ="exp('s6')">Location of  Symptoms</button><div id="s6" class="hide">
<p>Where are symptoms the worst?<br/>&#x2002;</p> 
<div id="d45" class="dchk"><input type="checkbox"  id="c45" class="chk" name="c45" value="45" onclick="ck(45)" $checked[45] />&#x2002;in morning</div>
<div id="d50" class="dchk"><input type="checkbox"  id="c50" class="chk" name="c50" value="50" onclick="ck(50)" $checked[50] />&#x2002;inside house</div>
<div id="d55" class="dchk"><input type="checkbox"  id="c55" class="chk" name="c55" value="55" onclick="ck(55)" $checked[55] />&#x2002;at bedtime</div>
<div id="d60" class="dchk"><input type="checkbox"  id="c60" class="chk" name="c60" value="60" onclick="ck(60)" $checked[60] />&#x2002;outside during morning</div>
<div id="d46" class="dchk"><input type="checkbox"  id="c46" class="chk" name="c46" value="46" onclick="ck(46)" $checked[46] />&#x2002;in afternoon</div>
<div id="d51" class="dchk"><input type="checkbox"  id="c51" class="chk" name="c51" value="51" onclick="ck(51)" $checked[51] />&#x2002;when cleaning</div>
<div id="d56" class="dchk"><input type="checkbox"  id="c56" class="chk" name="c56" value="56" onclick="ck(56)" $checked[56] />&#x2002;windy days</div>
<div id="d61" class="dchk"><input type="checkbox"  id="c61" class="chk" name="c61" value="61" onclick="ck(61)" $checked[61] />&#x2002;outside during night</div>
<div id="d47" class="dchk"><input type="checkbox"  id="c47" class="chk" name="c47" value="47" onclick="ck(47)" $checked[47] />&#x2002;in evening</div>
<div id="d52" class="dchk"><input type="checkbox"  id="c52" class="chk" name="c52" value="52" onclick="ck(52)" $checked[52] />&#x2002;after eating</div>
<div id="d57" class="dchk"><input type="checkbox"  id="c57" class="chk" name="c57" value="57" onclick="ck(57)" $checked[57] />&#x2002;warm days</div>
<div id="d62" class="dchk"><input type="checkbox"  id="c62" class="chk" name="c62" value="62" onclick="ck(62)" $checked[62] />&#x2002;during yard work</div>
<div id="d48" class="dchk"><input type="checkbox"  id="c48" class="chk" name="c48" value="48" onclick="ck(48)" $checked[48] />&#x2002;at work</div>
<div id="d53" class="dchk"><input type="checkbox"  id="c53" class="chk" name="c53" value="53" onclick="ck(53)" $checked[53] />&#x2002;in basement</div>
<div id="d58" class="dchk"><input type="checkbox"  id="c58" class="chk" name="c58" value="58" onclick="ck(58)" $checked[58] />&#x2002;cold days</div>
<div id="d63" class="dchk"><input type="checkbox"  id="c63" class="chk" name="c63" value="63" onclick="ck(63)" $checked[63] />&#x2002;near animals</div>
<div id="d49" class="dchk"><input type="checkbox"  id="c49" class="chk" name="c49" value="49" onclick="ck(49)" $checked[49] />&#x2002;at school</div>
<div id="d54" class="dchk"><input type="checkbox"  id="c54" class="chk" name="c54" value="54" onclick="ck(54)" $checked[54] />&#x2002;in bedroom</div>
<div id="d59" class="dchk"><input type="checkbox"  id="c59" class="chk" name="c59" value="59" onclick="ck(59)" $checked[59] />&#x2002;on clear days</div>
<div id="d64" class="dchk"><input type="checkbox"  id="c64" class="chk" name="c64" value="64" onclick="ck(64)" $checked[64] />&#x2002;near farms/barns</div>
</div><button class="btn" type="button" onclick ="exp('s7')">Worst Months for Symptoms</button><div id="s7" class="hide">
<p>When are symptoms the worst or most frequent?<br/>&#x2002;</p>
<div id="d65" class="dchk"><input type="checkbox"  id="c65" class="chk" name="m1" value="0" onclick="ck(65)" $checked[65] />&#x2002;January</div>
<div id="d66" class="dchk"><input type="checkbox"  id="c66" class="chk" name="m2" value="1" onclick="ck(66)" $checked[66] />&#x2002;February</div>
<div id="d67" class="dchk"><input type="checkbox"  id="c67" class="chk" name="m3" value="2" onclick="ck(67)" $checked[67] />&#x2002;March</div>
<div id="d68" class="dchk"><input type="checkbox"  id="c68" class="chk" name="m4" value="3" onclick="ck(68)" $checked[68] />&#x2002;April</div>
<div id="d69" class="dchk"><input type="checkbox"  id="c69" class="chk" name="m5" value="4" onclick="ck(69)" $checked[69] />&#x2002;May</div>
<div id="d70" class="dchk"><input type="checkbox"  id="c70" class="chk" name="m6" value="5" onclick="ck(70)" $checked[70] />&#x2002;June</div>
<div id="d71" class="dchk"><input type="checkbox"  id="c71" class="chk" name="m7" value="6" onclick="ck(71)" $checked[71] />&#x2002;July</div>
<div id="d72" class="dchk"><input type="checkbox"  id="c72" class="chk" name="m8" value="7" onclick="ck(72)" $checked[72] />&#x2002;August</div>
<div id="d73" class="dchk"><input type="checkbox"  id="c73" class="chk" name="m9" value="8" onclick="ck(73)" $checked[73] />&#x2002;September</div>
<div id="d74" class="dchk"><input type="checkbox"  id="c74" class="chk" name="m10" value="9" onclick="ck(74)" $checked[74] />&#x2002;October</div>
<div id="d75" class="dchk"><input type="checkbox"  id="c75" class="chk" name="m11" value="10" onclick="ck(75)" $checked[75] />&#x2002;November</div>
<div id="d76" class="dchk"><input type="checkbox"  id="c76" class="chk" name="m12" value="11" onclick="ck(76)" $checked[76] />&#x2002;December</div>
</div><button class="btn" type="button" onclick ="exp('s8')">Animal Exposure</button><div id="s8" class="hide">
<p>To what animals are you exposed?<br/>&#x2002;</p>
<div id="d79" class="dchk"><input type="checkbox"  id="c79" class="chk" name="c79" value="79" onclick="ck(79)" $checked[79] />&#x2002; bird</div>
<div id="d87" class="dchk"><input type="checkbox"  id="c87" class="chk" name="c87" value="87" onclick="ck(87)" $checked[87] />&#x2002; guinea pig</div>
<div id="d78" class="dchk"><input type="checkbox"  id="c78" class="chk" name="c78" value="78" onclick="ck(78)" $checked[78] />&#x2002; cat</div>
<div id="d81" class="dchk"><input type="checkbox"  id="c81" class="chk" name="c81" value="81" onclick="ck(81)" $checked[81] />&#x2002; hamster</div>
<div id="d85" class="dchk"><input type="checkbox"  id="c85" class="chk" name="c85" value="85" onclick="ck(85)" $checked[85] />&#x2002; chicken</div>
<div id="d80" class="dchk"><input type="checkbox"  id="c80" class="chk" name="c80" value="80" onclick="ck(80)" $checked[80] />&#x2002; horse</div>
<div id="d93" class="dchk"><input type="checkbox"  id="c93" class="chk" name="c93" value="93" onclick="ck(93)" $checked[93] />&#x2002; cow</div>
<div id="d90" class="dchk"><input type="checkbox"  id="c90" class="chk" name="c90" value="90" onclick="ck(90)" $checked[90] />&#x2002; parakeet</div>
<div id="d77" class="dchk"><input type="checkbox"  id="c77" class="chk" name="c77" value="77" onclick="ck(77)" $checked[77] />&#x2002; dog</div>
<div id="d91" class="dchk"><input type="checkbox"  id="c91" class="chk" name="c91" value="91" onclick="ck(91)" $checked[91] />&#x2002; parrot</div>
<div id="d88" class="dchk"><input type="checkbox"  id="c88" class="chk" name="c88" value="88" onclick="ck(88)" $checked[88] />&#x2002; duck</div>
<div id="d84" class="dchk"><input type="checkbox"  id="c84" class="chk" name="c84" value="84" onclick="ck(84)" $checked[84] />&#x2002; pig</div>
<div id="d92" class="dchk"><input type="checkbox"  id="c92" class="chk" name="c92" value="92" onclick="ck(92)" $checked[92] />&#x2002; pigeon</div>
<div id="d83" class="dchk"><input type="checkbox"  id="c83" class="chk" name="c83" value="83" onclick="ck(83)" $checked[83] />&#x2002; goat</div>
<div id="d82" class="dchk"><input type="checkbox"  id="c82" class="chk" name="c82" value="82" onclick="ck(82)" $checked[82] />&#x2002; rabbit</div>
<div id="d89" class="dchk"><input type="checkbox"  id="c89" class="chk" name="c89" value="89" onclick="ck(89)" $checked[89] />&#x2002; goose</div>
<div id="d86" class="dchk"><input type="checkbox"  id="c86" class="chk" name="c86" value="86" onclick="ck(86)" $checked[86] />&#x2002; sheep</div>


</div>

<input type="hidden" name="rec" value="$rec" />
<input type="hidden" name="sub" value="32" />
<input id="next" type="submit" class="btn" value="Next" />
</form></div>
</div>
<div id="s888"></div>
</div>
<script> //<![CDATA[
var div=0;
var disp = '';
var prev = document.getElementById('s888');
var flip = new Array();
flip[''] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
function shownext(id){
  document.getElementById('a' + id).style.display = 'inline-block';
}
function exp(id){
  div = document.getElementById(id);
  disp = div.style.display;
  prev.style.display='none';
  div.style.display=flip[disp];
  prev=div;
  var y=div.offsetTop;window.scrollTo(0, y-64);
}
var c = new Array;
var d = new Array;
toggle = new Array;
toggle[true] = 'checked="checked"';
toggle[false] = '';
bg = new Array;
bg[true] = '#f00';
bg[false] = '#2985EA';
function ck(id){
  d[id].style.backgroundColor=bg[c[id].checked];
}
function init(){
var checked,did;
var divs = document.getElementsByTagName("div");
  for (div=0; div<divs.length; div++){
    did = divs[div].getAttribute("id");
    if (did != null){
	  var i = did.substring(1,4);
	  var type = did.substring(0,1);
      if (type == "d"){
        
		c[i] = document.getElementById('c' + i);
		d[i] = document.getElementById('d' + i);
		checked = c[i].checked;
		d[i].style.backgroundColor=bg[checked];
      }
    }
	if (type == "a"){
	  if(document.getElementById('at' + i).value.length > 0){document.getElementById('a' + i).style.display = 'inline-block';}
	}
  }
}
window.onload = init;
//]]>
</script>

<pre style="background:#fff;">
</pre></body></html>
EOT;
ob_end_flush();



?>
