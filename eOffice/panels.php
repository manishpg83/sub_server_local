<?php

$sub = intval($_POST['sub']);
if($sub == 86){
  $rec = intval($_POST['rec']);
  $_POST['sub'] = 20;
  $_POST['rec'] = $rec;
  include('index.php');
  exit;
} 
$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo "<!DOCTYPE html><html lang=\"en\"><head><title>Food Panels</title><style></style></head><body>";
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$id = intval($_POST['id']);
$c = strtoupper($_POST['c']);
if(strlen($c) == 4 && $id > 99999){
  $sql = "UPDATE `Client` SET `passcode` = '$c' WHERE `Number` = $id";
  $result = mysqli_query($link,$sql);
  $err = mysql_error();
  $show .= "$c\n$id\n$sql\n$err";
}
$rec = intval($_POST['rec']);



if($rec > 0){
  if(intval($_POST['sub']) == 2){
    $description = $_POST['description'];
    $sql = "UPDATE `clientPanels` SET `description` ='$description' WHERE `rec` = $rec";
    $result =  mysqli_query($link,$sql);
  }
  elseif(intval($_POST['sub']) == 3){
    $sql = "DELETE FROM `clientPanels` WHERE `rec`=$rec";
    $result =  mysqli_query($link,$sql);
  }
  elseif(intval($_POST['sub']) == 4){
    $sql = "DELETE FROM `history` WHERE `id`=$rec";
    $result =  mysqli_query($link,$sql);
  }
  else{
    $include = intval($_POST['include']) ^ 1;
    $sql = "UPDATE `amx_portal`.`clientPanels` SET `include` = '$include' WHERE `clientPanels`.`rec` =$rec;";
    $result =  mysqli_query($link,$sql);
  }
}
if($id > 99999){
  $sql = "SELECT `Name`,`City`,`State`,`passcode`   FROM `Client` WHERE `Number` = $id ";
  $result = mysqli_query($link,$sql);
  list($name,$city,$state,$c) =  mysqli_fetch_array($result, MYSQLI_NUM);
}
echo <<<EOT
<!DOCTYPE html>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
td{border:1px solid #000;padding:0 .3em;}
table {border-spacing: 0;border-collapse: collapse;}
body{font-weight:700;padding:2em;}
#page{width:840px;margin: 0 auto 0;}
input[type="text"]{font:700 1em Arial,sans-serif;min-width:4em;pading:0 0 0 1em;}
.red{background:#f00;color:#fff;border:2px groove #000;font-weight:700;}
.grn{background:#0f0;color:#000;border:2px groove #000;font-weight:700;}
.blue{background:#2985EA;color:#fff;border:2px groove #000;font-weight:700;width:6em;}
.desc{font-weight:700;color:#fff;background-color:#2985EA;text-align:left;width:100%;
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
#pnl{width:4em;}
.btn{width:120px;text-align:left;padding: 2px 6px 2px 20px;font:700 1em Arial,sans-serif;border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);}
.hide{display:none;}

form{display:inline;}
</style>

</head><body><div id="page">
<div id="post"><form action="#" method="post">
<input type="hidden" name="rec" value="$rec"/>
EOT;

$sql = "SELECT `client`,COUNT(*) FROM `history` WHERE 1 GROUP BY `client`ORDER BY `client` ";
$results = mysqli_query($link,$sql);
while(list($client,$count) =  mysqli_fetch_array($results, MYSQLI_NUM)){
  $buttons[] = $client;
  $counts[$client] = $count;
}
foreach($buttons as $client){
 echo <<<EOT
<form action="#" method="post">
<input type="hidden" name="sub" value="$sub" />
<input type="hidden" name="id" value="$client" />
<button class="btn" >$client $counts[$client]</button></form>
EOT;
}
echo <<<EOT






<form action="#" method="post">
<br/><br/><br/>ID: <input type="text" name="id" value="$id" style="width:4em;"/>
<input type="submit" value="Submit ID"/></form>
<form action="#" method="post">
<input type="hidden" name="id" value="$id" />
<br/><br/><br/>Passcode: <input type="text" name="c" value="$c" style="width:4em;"/>



<input type="submit" value="Submit Passcode"/></form>
<p>$err</p>

EOT;
ob_flush();
$sub = intval($_POST['sub']);

if($sub == 7){
  $panel = $_POST['panel'];
  $sql = "SELECT `description`  FROM `importPanels` WHERE `number` LIKE '$panel' LIMIT 1";
  $results = mysqli_query($link,$sql);
  $rows =  MYSQLI_NUM_rows($results);
  echo "<p>$description Rows=$rows</p>";
  if($rows == 1){
    list($description) = mysql_fetch_array($results, MYSQLI_NUM);
    $sql = "SELECT `code`,`type`  FROM `importPanelTest` WHERE `number` LIKE '$panel'";
    $results = mysqli_query($link,$sql);
    while( list($code,$type) =  mysql_fetch_array($results, MYSQLI_NUM)){$tests[$code][$type] = $type;}
    $sql = "INSERT INTO `amx_portal`.`clientPanels` (`rec`, `include`, `client`, `panel`, `number`, `description`, `fee`) VALUES (NULL, '0', '$id', '$panel', '$pnum', '$description', '0') ";
    $results = mysqli_query($link,$sql);
    $sql = "INSERT INTO `amx_portal`.`Panels` (`rec`, `number`, `description`, `fee`, `tests`, `ige`, `igg4`) VALUES (NULL, '$panel', '$description', '0', '0', '0', '0');";
    $results = mysqli_query($link,$sql);
	$sql = "DELETE FROM `PanelTests` WHERE `number` = '$panel'";
	$results = mysqli_query($link,$sql);
    foreach($tests as $code => $array){
	  foreach($array as $key => $type){
	    $show .= ", $type ";
        $sql = "INSERT INTO `amx_portal`.`PanelTests` (`rec`, `number`, `code`, `type`) VALUES (NULL, '$panel', '$code', '$type');";
        mysqli_query($link,$sql);
        echo mysqli_error($link). "<br>\n";
	  }
	} 
  }
  else{echo "<p>$panel Rows=$rows " . mysql_error() . '</p>'; }
}
$actions = array('Include','Exclude','Include','');
$classes = array(' class="grn" ', ' class="red" ',' class="grn"',' class="hide"');
$standard = array("900","900-5","900-6","950","950-3","950-4","950-1","950-5","950-6","255","255-2","255-1","253","253-1","253-2");
if($id > 99999){
echo "<h3>$name<br/>$city, $state</h3><p>Any panel below will be included in the 'Add On Panels' list<br/>Click Include to Include in the Foods Custom Panels<br/>Click Exclude to only show the panel in the 'Add On' list.</p><table><tr><td>Status</td><td> </td><td>Panel</td><td>F</td><td>E</td><td>G</td><td>G4</td><td></td><td></td><td></td></tr>";

$inv = array('Not In Food Panel List','In Food Panel List','No Foods In This Panel','Standard Food Panel');

$sql = "SELECT `rec`,`status`,`client`,`include`,`panel`,`description` FROM `clientPanels` WHERE `client` = $id";
$results = mysqli_query($link,$sql);
while(list($rec,$status,$client,$include,$panel,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){
	//  echo "<p>$rec,$client,$include,$panel,$description";
  if($include == 1 AND in_array($panel,$standard)){
    $sql = "UPDATE `amx_portal`.`clientPanels` SET `include` = 0 WHERE `clientPanels`.`rec` =$rec;";
    $result = mysqli_query($link,$sql);
  }
  $TestTypeCount = array(0,0,0,0);
  $foods = 0;
  $sql = "SELECT `code`, `type` FROM `PanelTests` WHERE `number` = '$panel'";
  $result = mysqli_query($link,$sql);
  while(list($code,$type) =  mysqli_fetch_array($result, MYSQLI_NUM)){
    if(substr($code,0,3) == '100'){$total = '1';continue;}
    if(substr($code,0,1) == 'F'){$foods++;}
    $TestTypeCount[$type]++;
  }
  if(in_array($panel,$standard)){$include = 3;$action = 3;}
  $class = $classes[$include];
  $action = $actions[$include];
  $ige = $TestTypeCount[1];
  $igg= $TestTypeCount[2];
  $igg4 = $TestTypeCount[3];
  echo <<<EOT
<tr>
<td> $inv[$include]</td>
<td style="padding:0;">
<form action="#" method="post" >
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="rec" value="$rec"/>
<input type="hidden" name="include" value="$include"/>
<button$class>$action</button> 
</form>
</td>
<td> $panel </td>
<td> $foods </td>
<td> $ige </td>
<td> $igg </td>
<td> $igg4 </td>
<td>
<form action="#" method="post" >
<input type="hidden" name="id" value="$id"/>
<input type="hidden" name="rec" value="$rec"/>
<input type="hidden" name="include" value="$include"/>
<input type="text" name="description" value="$description"/>
</td><td>
<button class="grn"  name="sub" value="2">Update Desc.</button>
</td><td>
<button class="blue" name="sub" value="3">Delete</button>
</form></td>
</tr>
EOT;
}
echo '</table>';

  echo <<<EOT

<br>
<form action="#" method="post" >
<input style="width:4em;" id="pnl" type="text" name="panel" size="4" />
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="sub" value="7" />
<button>Add Panel</button></form>
EOT;
  $cnt = 0;
  $sql = "SELECT `id`,`status`, `date`, `last`, `first`, `dob`, `gender`,`foods` FROM `history` WHERE `client` = $id ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysqli_query($link,$sql);
  $rows =  mysqli_num_rows($results);
  if($rows > 0){
  echo '<hr/><div id="del"><h2>Delete Checked Patients in History</h2><form action="#" method="post"><input type="hidden" name="id" value="' . $id . '" /><input type="hidden" name="sub" value="86" /></form><table>';
  while($row = @mysqli_fetch_array($results, MYSQLI_NUM)) {
    list($rec,$status,$date,$last, $first, $dob, $gender,$jsn) = $row;
    $cnt++;
	$array = json_decode($jsn,true);
    $cnt = count($array[0]);
	$selectedFoods = count($array[0]) + count($array[1]);
    echo <<<EOT

<tr><td><form action="#" method="post"><input type="hidden" name="id" value="$id" /><input type="hidden" name="rec" value="$rec" /><button type="submit" name="sub" value="4">Delete</button></form></td><td>$status</td>$<td>$last, $first</td><td>$dob</td><td>$date</td><td>
$cnt</td><td>$rec</td><td><form action="./" method="post"><button>Dashboard</button><input type="hidden" name="sub" value="30" /><input type="hidden" name="rec" value="$rec" /></form></td><td><form action="./" method="post"><button>Foods</button><input type="hidden" name="sub" value="20" /><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="client" value="$id" /></form></td></tr>
 
EOT;
  }
  echo '</table></div><hr>';
}





//<input type="text" name="panel" value="" style="width:4em;"/>
}  
if($sub == 28){
  $panel = trim($_POST['panel']);
  foreach($_POST as $k => $v){
    $post = substr($k,0,1);
    if($post == 't' && strlen($v) > 0){$code = $v;$new[$code] = array(0,0,0);}
	elseif($post == 'E' || $post == 'G'){$new[$code][$v] = $v;}
  }
  foreach($new as $code => $types){
    foreach($types as $k => $v){
	  if ($v == 0){continue;}
      $sql = "INSERT INTO `amx_portal`.`PanelTests` (`id`, `number`, `code`, `type`) VALUES (NULL, '$panel', '$code', '$v');";
	  mysqli_query($link,$sql);
	}
  }
  $sub = 21;
  $show .= '28=>';
  $show .= var_export($new,1);
}  
if($sub == 21){
  $panel = trim($_POST['panel']);
  $desc = trim($_POST['desc']);
  if(strlen($panel) > 1 && strlen($desc) > 5){
    $sql = "INSERT INTO `amx_portal`.`Panels` (`rec`, `number`, `description`, `fee`, `tests`) VALUES (NULL, '$panel', '$desc', '0', '0');";
    mysqli_query($link,$sql);
    if(mysql_errno() == 0){
	  echo <<<EOT
<form action="#" method="post" >$panel, <input style="width:16em;" id="desc" type="text" name="desc" value="$desc" /><br/>
<input type="hidden" name="panel" value="$panel" />
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="sub" value="28" /><br>

<br/>

EOT;
$checked = array('',' checked = "checked" ',' checked = "checked" ',' checked = "checked" ');
      $tests = array();
      $sql = "SELECT `code` , `type` FROM `PanelTests` WHERE `number` LIKE '$panel'";
      $results = mysqli_query($link,$sql);
      while( list($code,$type) =  mysqli_fetch_array($results, MYSQLI_NUM)){$tests[$code][$type] = $type;}
	  foreach($tests as $k => $codes){
	    echo 'Test# <input style="width:4em;" id="pnl" type="text" name="t' . $i . '" value="' . $k . '" size="4" />&#x2002;E <input type="checkbox" name="E' . $k . '" value="1"' .  $checked[$codes[1]] . ' />&#x2002;G4 <input type="checkbox" name="G4' . $k . '" value="3"' . $checked[$codes[3]] . '/>&#x2002;G <input type="checkbox" name="G' . $k . '" value="2"' . $checked[$codes[2]] . '/><br/>';
	  }
      for($i=0;$i<50;$i++){
	     echo 'Test# <input style="width:4em;" id="pnl" type="text" name="t' . $i . '" value="" size="4" />&#x2002;E <input type="checkbox" name="E' . $i . '" value="1"/>&#x2002;G4 <input type="checkbox" name="G4' . $i . '" value="3"/>&#x2002;G <input type="checkbox" name="G' . $i . '" value="2"/><br/>';
	  }
	}
  }
  echo '<button>Submit</button></form>';
}
echo <<<EOT

<hr/>
<form action="#" method="post" >
<input style="width:4em;" id="pnl" type="text" name="panel" size="4" />
<input style="width:16em;" id="desc" type="text" name="desc" />
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="sub" value="21" />
<button>New Panel</button></form><h1>&#x2003;<br/>&#x2003;<br/>&#x2003;<br/>&#x2003;<br/>&#x2003;<br/>&#x2003;<br/></h1>
EOT;
if($ip == '70.171.4.227' ){ echo "<pre>$sub, array=\n$show</pre>";}
//SELECT *  FROM `PanelTests` WHERE `panel` LIKE '2012'
//
echo '</body></html>';
?>