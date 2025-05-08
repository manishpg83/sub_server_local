<?php ob_start();
$startTime = microtime(true);
header('Content-Type: text/plain; charset=utf-8');
$dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510'); @mysqli_select_db($dbc,'amx_portal');
  $num = 200;
    $sql = "SELECT `Code`, `description` FROM `Rast` WHERE `Code` LIKE'F%' ORDER BY `Code`";  
    $results = mysqli_query($dbc,$sql);
    while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$descriptions[$code][0] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[0][$code] = $num;$num++;}
//    $rank = unserialize(file_get_contents('/home/amx/public_html/rank.ser'));
    $rank[1] = array('F357'=>1,'F290'=>2,'F358'=>3,'F360'=>4,'F103'=>5,'F359'=>6,'F247'=>7,'F346'=>8,'F329'=>9,'F049'=>10,'F150'=>11,'F001'=>12,'F307'=>13,'F256'=>14,'F136'=>15,'F076'=>16,'F300'=>17,'F033'=>18,'F288'=>19,'F020'=>20,'F310'=>21,'F013'=>22,'F263'=>23,'F132'=>24,'F159'=>25,'F216'=>26,'F134'=>27,'F305'=>28,'F317'=>29,'F209'=>30,'F141'=>31,'F002'=>32,'F361'=>33,'F047'=>34,'FZ13'=>35,'F126'=>36,'F135'=>37,'F006'=>38,'F208'=>39,'F236'=>40,'F089'=>41,'F259'=>42,'F354'=>43,'F017'=>44,'F155'=>45,'F339'=>46,'F027'=>47,'F152'=>48,'F245'=>49,'F144'=>50,'F314'=>51,'F210'=>52,'F087'=>53,'F036'=>54,'F203'=>55,'F348'=>56,'F048'=>57,'F025'=>58,'F080'=>59,'F094'=>60,'F356'=>61,'F202'=>62,'F207'=>63,'F116'=>64,'F153'=>65,'F008'=>66,'F215'=>67,'F291'=>68,'F355'=>69,'F031'=>70,'F078'=>71,'F004'=>72,'F142'=>73,'F024'=>74,'F018'=>75,'F143'=>76,'F145'=>77,'F283'=>78,'F035'=>79,'F338'=>80,'F012'=>81,'F244'=>82,'F112'=>83,'F090'=>84,'F100'=>85,'F119'=>86,'F092'=>87,'F014'=>88,'F201'=>89,'F311'=>90,'F111'=>91,'F101'=>92,'F005'=>93,'F156'=>94,'F312'=>95,'F010'=>96,'F260'=>97,'F214'=>98,'F139'=>99,'F085'=>100,'F125'=>101,'F301'=>102,'F120'=>103,'F352'=>104,'F075'=>105,'F077'=>106,'F345'=>107,'F303'=>108,'F122'=>109,'F129'=>110,'F003'=>111,'F304'=>112,'F148'=>113,'F015'=>114,'F212'=>115,'F105'=>116,'F340'=>117,'F102'=>118,'F284'=>119,'F138'=>120,'F151'=>121,'F344'=>122,'F204'=>123,'F040'=>124,'F007'=>125,'F121'=>126,'F306'=>127,'F351'=>128,'F108'=>129,'F316'=>130,'F117'=>131,'F026'=>132,'F123'=>133,'F082'=>134,'F318'=>135,'F041'=>136,'F009'=>137,'F133'=>138,'F337'=>139,'F095'=>140,'F140'=>141,'F081'=>142,'F350'=>143,'F045'=>144,'F124'=>145,'F079'=>146,'F308'=>147,'F044'=>148,'F115'=>149,'F313'=>150,'F093'=>151,'F302'=>152,'F221'=>153,'F147'=>154,'F083'=>155,'F054'=>156,'F353'=>157,'F096'=>158,'F319'=>159,'F104'=>160,'F309'=>161,'F114'=>162,'F342'=>163,'F107'=>164,'F118'=>165,'F127'=>166,'F128'=>167,'F130'=>168,'F146'=>169,'F158'=>170,'F341'=>171,'F343'=>172,'F347'=>173,'F349'=>174,'F369'=>175);
	$rank[3] = array('F245'=>1,'F092'=>2,'F002'=>3,'F001'=>4,'F075'=>5,'F005'=>6,'F260'=>7,'F236'=>8,'F303'=>9,'F309'=>10,'F305'=>11,'F077'=>12,'F020'=>13,'F216'=>14,'F004'=>15,'F356'=>16,'F304'=>17,'F307'=>18,'F078'=>19,'F300'=>20,'F117'=>21,'F094'=>22,'F319'=>23,'F082'=>24,'F150'=>25,'F076'=>26,'F210'=>27,'F263'=>28,'F214'=>29,'F049'=>30,'F314'=>31,'F033'=>32,'F087'=>33,'F015'=>34,'F159'=>35,'F027'=>36,'F345'=>37,'F047'=>38,'F208'=>39,'F006'=>40,'F013'=>41,'F290'=>42,'F302'=>43,'F089'=>44,'F041'=>45,'F014'=>46,'F256'=>47,'F359'=>48,'F007'=>49,'F081'=>50,'F141'=>51,'F079'=>52,'F346'=>53,'F329'=>54,'F358'=>55,'F360'=>56,'F017'=>57,'F018'=>58,'F316'=>59,'F143'=>60,'F025'=>61,'F048'=>62,'F340'=>63,'F357'=>64,'F212'=>65,'F101'=>66,'F259'=>67,'F209'=>68,'F155'=>69,'F036'=>70,'F288'=>71,'F306'=>72,'F115'=>73,'F129'=>74,'F147'=>75,'F301'=>76,'F125'=>77,'F284'=>78,'F122'=>79,'F337'=>80,'F202'=>81,'F009'=>82,'F103'=>83,'F134'=>84,'F096'=>85,'F203'=>86,'F054'=>87,'F339'=>88,'F100'=>89,'F083'=>90,'F317'=>91,'F008'=>92,'F349'=>93,'F102'=>94,'F080'=>95,'F152'=>96,'F031'=>97,'F085'=>98,'F090'=>99,'F133'=>100,'F095'=>101,'F093'=>102,'F154'=>103,'F344'=>104,'F012'=>105,'F215'=>106,'F247'=>107,'F244'=>108,'F291'=>109,'F204'=>110,'F207'=>111,'F010'=>112,'F121'=>113,'F310'=>114,'F108'=>115,'F105'=>116,'F123'=>117,'F139'=>118,'F126'=>119,'F035'=>120,'F158'=>121,'F127'=>122,'F135'=>123,'F144'=>124,'F201'=>125,'F131'=>126,'F045'=>127,'F142'=>128,'F040'=>129,'F026'=>130,'F283'=>131,'F313'=>132,'F341'=>133,'F106'=>134,'F157'=>135,'F118'=>136,'F308'=>137,'F130'=>138,'F149'=>139,'F003'=>140,'F104'=>141,'F024'=>142,'F111'=>143,'F138'=>144,'F044'=>145,'F221'=>146,'F140'=>147,'F347'=>148,'F116'=>149,'F311'=>150,'F353'=>151,'F114'=>152,'F124'=>153,'F342'=>154,'F350'=>155,'F119'=>156,'F312'=>157,'F351'=>158,'F318'=>159,'F338'=>160,'F354'=>161,'F109'=>162,'F120'=>163,'F128'=>164,'F136'=>165,'F137'=>166,'F148'=>167,'F151'=>168,'F156'=>169,'F343'=>170,'F348'=>171,'F352'=>172,'F369'=>175);
  $data = array_diff_key($rank[0] ,$rank[1] );
  foreach($data as $code => $num){
    $rank[1][$code] =  $num;
  }
  $data = array_diff_key($rank[0] ,$rank[3] );
  foreach($data as $code => $num){
    $rank[3][$code] =  $num;
  }

//$data = json_decode(file_get_contents('/home/amx/public_html/f/food.jsn'),1);
$data = array_diff_key($rank[0] ,$rank[1] );
var_export($data);
$data = array_diff_key($rank[0] ,$rank[3] );
var_export($data);
exit;
$sql = "SELECT `code`  FROM `PanelTests` WHERE `panel` LIKE '9503' AND `type` = 1";
$results = mysqli_query($dbc,$sql);
while(list($code) =  mysqli_fetch_array($results, MYSQLI_NUM)){
//mysqli_query($dbc,"INSERT INTO `PanelTests`(`panel`, `code`, `type`) VALUES (9505,'$code',1);");
//if (mysqli_errno($dbc) > 0){echo "<p>$sql<br/>" . mysqli_error($dbc);}
mysqli_query($dbc,"INSERT INTO `PanelTests`(`panel`, `code`, `type`) VALUES (9504,'$code',3);");
if (mysqli_errno($dbc) > 0){echo "<p>$sql<br/>" . mysqli_error($dbc);}
}
exit;
$rankE = unserialize(file_get_contents('/home/amx/public_html/IgE.ser'));
$rankG4 = unserialize(file_get_contents('/home/amx/public_html/IgG4.ser'));
var_export($rankE);
//SELECT `Patient`, `Date` FROM `Patient` WHERE `Date` >= '2013-01-01' ORDER BY `Date` ASC, `Patient` ASC LIMIT 1
//SELECT `Patient`, `Date` FROM `Patient` WHERE `Date` < '2014-1-1' ORDER BY `Patient` DESC LIMIT 1
$total = 0;
$startTime = microtime(true) ;
    $sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `Code`";
    $results = mysqli_query($dbc,$sql);
    while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$descriptions[$code] = $description;}
$sql = "SELECT COUNT(*) AS `cnt`,`Code`,`Type` FROM `Test` WHERE `Type`= 1 AND `Client` < 888880 AND `Patient` > 146996 AND `Patient` < 155389 AND `Code` LIKE 'F%'  GROUP BY`Type`, `Code` ORDER BY `Type` ASC,`cnt` DESC";
echo $sql ."\n";
  $results = mysqli_query($dbc,$sql);
  if (mysqli_errno($dbc) > 0){echo "<p>$sql<br/>" . mysqli_error($dbc);}
  while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
    list($count,$code,$type) = $row;
  //  $code = substr($code,1);
    $foods[$code] = array(0,$count,0);
	$total += $count;
  }

$sql = "SELECT COUNT(*) AS `cnt`,`Code`,`Type` FROM `Test` WHERE `Type`= 1 AND `Patient` > 146996 AND `Patient` < 155389 AND `Client` < 888880 AND `Code` LIKE 'F%' AND `Score` NOT LIKE '%0%'   GROUP BY `Type`, `Code` ORDER BY `Type` ASC,`cnt` DESC";
echo $sql ."\n";
$results = mysqli_query($dbc,$sql);
if (mysqli_errno($dbc) > 0){echo "<p>$sql<br/>" . mysqli_error($dbc);}
while ($row = mysqli_fetch_array($results, MYSQLI_NUM)){
  list($count,$code,$type) = $row;
  if($count < 21){continue;}
 // $code = substr($code,1);
  $foods[$code][2] = $count;
  $foods[$code][0] = $count/$foods[$code][1];
}
echo "Total: $total\n";
arsort($foods);
foreach($foods as $code => $array){
  list($percent,$total,$poz) = $array;
  $desc =  substr($descriptions[$code] . '                                        ',0,24);
  $poz = substr("      $poz",-5);
  $percent *= 100;
  $percent = number_format($percent,1);
  $total = substr("     $total",-5);
  $percent = substr("     $percent",-5);
  echo "$code  $desc  $total  $poz  $percent\n";
}  
exit;


$show = '';
$igE = $food[0][1];
arsort($igE);

$ecount = count($patients[1]);
$g4count = count($patients[3]);
foreach($igE as $code => $cnt){
  $topE[] = array($code,$cnt,$desc[$code]);
}
foreach($topE as $k => $v){
  if($v[2] == NULL){continue;}
  $rankE[$v[0]] = array($k+1,$v[1],$v[2]);
}
$igG4 = $food[0][3];
arsort($igG4);
foreach($igG4 as $code => $cnt){
  $topG4[] = array($code,$cnt,$desc[$code]);
}
foreach($topG4 as $k => $v){
  if($v[2] == NULL){continue;}
  $rankG4[$v[0]] = array($k+1,$v[1],$v[2]);
}
$class= array();
$class[NULL] = 'class="reg"';
$class[1] = 'class="hit"';

$grp = 99;
$saveGrp = 88;

$rankE = unserialize(file_get_contents('/home/amx/public_html/IgE.ser'));
$rankG4 = unserialize(file_get_contents('/home/amx/public_html/IgG4.ser'));
foreach ($showGrp as $key => $val){
//  echo "<div class=\"grp\"><h4>$cat[$key]</h4>";
  echo "<h4>$cat[$key]</h4>";
  foreach ($val as $k => $v){
    $IgE = $rankE[$k][0];
    $IgG4 = $rankG4[$k][0];
	echo "<p>$k $v</p>";
/*
    echo <<<EOT
<div id="$k" class="fchk"><input type="checkbox"  id="$k" class="chk" name="$k" value="$k" onclick="ck('$k')" [370]/><div class="igg4">$IgG4</div><input type="checkbox"  id="$k" class="chk" name="$k" value="$k" onclick="ck('$k')" [370]/><div class="ige">$IgE</div><div class="desc">$v</div></div><br>
EOT;
*/
  }
  echo '</div>';
}
/*
$fp = fopen("/home/amx/public_html/IgE.ser",'w');
fwrite($fp,serialize($rankE));
fclose($fp);
$fp = fopen("/home/amx/public_html/IgG4.ser",'w');
fwrite($fp,serialize($rankG4));
fclose($fp);
*/

$show = '';
//$show .= number_format(microtime(true) - $startTime,6);
//echo <<<EOT
echo '<pre></pre><div id="s888"></div>';
/*
<script type="text/javascript"> //<![CDATA[
var div=0;
var disp = '';
var prev = document.getElementById('s888');
var flip = new Array();
flip[''] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
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
      if (did.substring(0,1) == "d"){
        var i = did.substring(1,4);
		c[i] = document.getElementById('c' + i);
		d[i] = document.getElementById('d' + i);
		checked = c[i].checked;
		d[i].style.backgroundColor=bg[checked];
      }
    }
  }
}
window.onload = init;

//]]>
</script>

<div style="height:20em" ><p>&#x2002;</p></div><div style="height:20em" ><p>&#x2002;</p></div></body></html>
EOT;
$ndx = 2;
$fp = fopen('history.sql','w');
while($ndx < 92){
$ndx++;
  $data = "`chk$ndx` int($ndx) NOT NULL,\n";
  fwrite($fp,$data);

}
fclose($fp);
*/
?>
</body></html>