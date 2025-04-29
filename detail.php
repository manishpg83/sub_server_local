<?php  ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
if (isset($_POST['p'])){$p = $_POST['p'];}else{$p=0;}
echo <<< EOT
<!DOCTYPE html>
<html lang="en">
<head>
<title>Nutrition Food Details</title>
<style type="text/css">
body{-ms-text-size-adjust:100%;text-align:left;background:#111;font:700 .9em Arial,sans-serif;color:#ffe;width:100%;padding:1% 0 0 4%;margin:0;}
a,a:link,a:visited,a:hover{text-decoration:none;color:#ffe;}
.cntr{text-align:center;}
.chk {overflow:visible;cursor:pointer;border:0;background:#2985EA;color: #ffe;font: 700 1.8em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align: center;-ms-text-size-adjust:100%;}
.btn {overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
.num {display:inline-block;width:6em;text-align:center;overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #0f0;color: #000;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #ffe;outline:2px solid #ffe;color:#aaa;margin:1px;vertical-align: middle;position: relative;}
input[type="text"]{width:90%;font:700 .8em Arial,sans-serif;}
.reg{font:400 .8em Arial,sans-serif;}
.alert{color:#0ff;}
.red{color:#f00;}
td{width:10em;padding:0;margin:0;border:0;}
</style>
</head><body>

EOT;




if (isset($_POST['sort']) && strlen($_POST['sort']) > 0){
  $sort = intval($_POST['sort']);
  $transort = array(1,15,8,10,11,20,25,31,32,40,41,27,14,36,45,47,16);
  $class = array();
  $class[$transort[$sort]] = ' class ="alert" ';

  

}
else {
 $sort = '0';
}


if (isset($_POST['n']) && strlen($_POST['n']) > 1){
  $n = intval($_POST['n']);
}
if (isset($_POST['r']) && strlen($_POST['r']) > 1){
  $rows = $_POST['r'];
}
if (isset($_POST['s']) && strlen($_POST['s']) > 1){
  $s = strtoupper($_POST['s']);
}
$id=$_POST['id'];
$name = array('','Description', 'Water',
  'Calories' ,
  'Protein' ,
  'Fats' ,
  'Ash',
  'Carbohydrates' ,
  'Fiber' ,
  'Sugar',
  'Calcium' ,
  'Iron' ,
  'Magnesium' ,
  'Phosphorus' ,
  'Potassium' ,
  'Sodium' ,
  'Zinc' ,
  'Copper' ,
  'Manganese',
  'Selenium' ,
  'Vitimin C' ,
  'Thiamin' ,
  'Riboflavin' ,
  'Niacin' ,
  'Pantothenic' ,
  'Vitamin B6',
  'Folate',
  'Folic Acid',
  'Food Folate',
  'Folate DFE',
  'Choline',
  'Vitamin B12',
  'Vitamin A' ,
  'Vitamin A RAE' ,
  'Retinol' ,
  'Alphacarotene' ,
  'Beta Carotene' ,
  'Beta Cryptoxanthin' ,
  'Lycopene' ,
  'Lutein and Zeaxanthin',
  'Vitamin E' ,
  'Vitamin D ug',
  'Vitamin D IU',
  'Vitamin K' ,
  'Saturated Fat' ,
  'Monounsaturated Fats' ,
  'Polyunsaturated Fats',
  'Cholesterol' ,
  'Serving Weight',
  'Serving Size' ,
  'Weight2' ,
  'Weight2Desc',
  'Waste');
$labels = array("","","g",
"Kcal",
"g",
"g",
"g",
"g",
"g",
"g",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"μg",
"mg",
"mg",
"mg",
"mg",
"mg",
"mg",
"μg",
"μg",
"μg",
"mg",
"μg",
"IU",
"mg",
"μg",
"μg",
"μg",
"μg",
"μg",
"μg",
"μg",
"mg",
"μg",
"IU",
"μg",
"g",
"g",
"g",
"mg");
date_default_timezone_set ('America/New_York');
$dbc=mysql_connect('localhost','ps',"Yes12yeS");
mysql_select_db('ps_mobile');
$sql = "SET time_zone = '-4:00';";
@mysql_unbuffered_query($sql);

$sql = "SELECT * FROM `EAR` WHERE `id` = 8 LIMIT 1"; 
$results = @mysql_query($sql);
echo mysql_error();
$ear = mysql_fetch_array($results, MYSQL_NUM) ;
//echo '</div></div><div class="pgBrk"></div><br/>TPL<br/><pre>' . var_export($ear,true)  . '</pre><br/>';
$EAR[32] = $ear[4] ;
$EAR[20] = $ear[5] ;
$EAR[41] = $ear[6] ;
$EAR[40] = $ear[7] ;
$EAR[43] = $ear[8] ;
$EAR[21] = $ear[9] ;
$EAR[22] = $ear[10] ;
$EAR[23] = $ear[11] ;
$EAR[25] = $ear[12] ;
$EAR[26] = $ear[13] ;
$EAR[31] = $ear[14] ;
$EAR[24] = $ear[15] ;
$EAR[30] = $ear[17] ;
$v = array_fill(0,53,'');


$sql = "SELECT * FROM `NDB` WHERE `ID` = $id LIMIT 1";
$results = @mysql_query($sql);

if (strlen(mysql_error()) > 0){
  echo mysql_error() . '<br>'; 
  echo $sql . '<br>'; 
}

$ndx = 0;
echo '<p><form action="https://dev.amxemr.com/food.php" method="post">
<input type="hidden" name="r" value="' . $rows . '" />
<input type="hidden" name="s" value="' . $s . '" />
<input type="hidden" name="sort" value="' . $sort . '" />
<input type="hidden" name="n" value="' . $n . '" />
<input class="btn" type="submit" value="&emsp;Back&emsp;" />
</form><p>Nutrients per 100 grams</p><table>';
  $row = mysql_fetch_array($results, MYSQL_NUM) ;
  $factor = 2000 / $row[3] ; 
  echo "<h3>Factor:$factor</h3>";
  $percent[20] = $row[20] / $EAR[20];
  $percent[21] = $row[21] / $EAR[21];
  $percent[22] = $row[22] / $EAR[22];
  $percent[23] = $row[23] / $EAR[23];
  $percent[24] = $row[24] / $EAR[24];
  $percent[25] = $row[25] / $EAR[25];
  $percent[26] = $row[26] / $EAR[26];
  $percent[30] = $row[30] / $EAR[30];
  $percent[31] = $row[31] / $EAR[31];
  $percent[32] = $row[32] / $EAR[32];
  $percent[40] = $row[40] / $EAR[40];
  $percent[41] = $row[41] / $EAR[41];
  $percent[43] = $row[43] / $EAR[43];
  $v[20] = $EAR[20];
  $v[21] = $EAR[21];
  $v[22] = $EAR[22];
  $v[23] = $EAR[23];
  $v[24] = $EAR[24];
  $v[25] = $EAR[25];
  $v[26] = $EAR[26];
  $v[30] = $EAR[30];
  $v[31] = $EAR[31];
  $v[32] = $EAR[32];
  $v[40] = $EAR[40];
  $v[41] = $EAR[41];
  $v[43] = $EAR[43];
if ($percent[20] > 0){$v[20] .= '&#x2003;' . number_format($percent[20],2)  . '  ' . number_format($percent[20] * $factor,2);}
if ($percent[21] > 0){$v[21] .= '&#x2003;' . number_format($percent[21],2)  . '  ' . number_format($percent[21] * $factor,2);}
if ($percent[22] > 0){$v[22] .= '&#x2003;' . number_format($percent[22],2)  . '  ' . number_format($percent[22] * $factor,2);}
if ($percent[23] > 0){$v[23] .= '&#x2003;' . number_format($percent[23],2)  . '  ' . number_format($percent[23] * $factor,2);}
if ($percent[24] > 0){$v[24] .= '&#x2003;' . number_format($percent[24],2)  . '  ' . number_format($percent[24] * $factor,2);}
if ($percent[25] > 0){$v[25] .= '&#x2003;' . number_format($percent[25],2)  . '  ' . number_format($percent[25] * $factor,2);}
if ($percent[26] > 0){$v[26] .= '&#x2003;' . number_format($percent[26],2)  . '  ' . number_format($percent[26] * $factor,2);}
if ($percent[30] > 0){$v[30] .= '&#x2003;' . number_format($percent[30],2)  . '  ' . number_format($percent[30] * $factor,2);}
if ($percent[31] > 0){$v[31] .= '&#x2003;' . number_format($percent[31],2)  . '  ' . number_format($percent[31] * $factor,2);}
if ($percent[32] > 0){$v[32] .= '&#x2003;' . number_format($percent[32],2)  . '  ' . number_format($percent[32] * $factor,2);}
if ($percent[40] > 0){$v[40] .= '&#x2003;' . number_format($percent[40],2)  . '  ' . number_format($percent[40] * $factor,2);}
if ($percent[41] > 0){$v[41] .= '&#x2003;' . number_format($percent[41],2)  . '  ' . number_format($percent[41] * $factor,2);}
if ($percent[43] > 0){$v[43] .= '&#x2003;' . number_format($percent[43],2)  . '  ' . number_format($percent[43] * $factor);}

  while ($ndx++ < 52){
     $daily[$ndx] = $percent[$ndx] * $factor;
     echo '<tr ' . $class[$ndx] . '><td>'. $name[$ndx]   . '</td><td>' . $row[$ndx] . ' ' . $labels[$ndx] . "</td><td>$v[$ndx]</td></tr>\n";
  }
echo '</table>';
return;



$results = @mysql_query($sql);
if (strlen(mysql_error()) > 0){
  echo $sql;
}

  echo $sql;
echo '<pre>';
$ndx = 0;

  $row = mysql_fetch_array($results, MYSQL_NUM) ;




  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

?>

