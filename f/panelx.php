<?php
$startTime = microtime(true);
$ip = $_SERVER['REMOTE_ADDR'];
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx_allermetrix',$data);
mysql_select_db('amx_portal');
/*
$sql = "SELECT `panel` FROM `clientPanels` WHERE 1";
$result = mysql_query($sql);
while(list($panel,$newNumber) =  mysql_fetch_array($result, MYSQL_NUM)){
  $alphCheck = preg_replace('/[^A-Z]/','',$panel);
  if(strlen($alphCheck) > 0){$alpha[] = $panel;continue;}
  $parts = explode('-',$panel);
 // var_export($parts);
  if(strlen($parts[1]) == 2 && strlen($parts[0]) == 3 && intval($parts[1]) > 0 && substr($parts[0],1,1) == '0'){

    $number = substr($parts[0],0,1) . substr($parts[0],2,1) . $parts[1];
    $panels[$number] = $panel;
    
  }
}  

  $ndx++;
  if ($ndx > 100){break;}
  continue;
  $striped = str_replace('-','',$panel);
  $number = preg_replace('/[\D]/','',$striped);
  if($number > 9999 || intval($number) < 10 ){$digits[] = $panel;continue;} 
  
  $ndx++;
 // if ($ndx > 100){break;}
  if(strlen($number) == 2){$number .= '00';} 
  elseif(strlen($number) == 3 ){$number .= '0';}
  if($number == $panel){$equal[] = $panel;continue;}
//  echo "<tr><td> $panel </td><td> $striped </td><td> $number </td></tr>\n";
   $panels["$number "] = strval($panel);
}

echo '<pre>';
var_export($yes);exit;
asort($alpha);
asort($digits);
asort($equal);
//var_export($alpha);
//var_export($digits);
//var_export($equal);

foreach ($panels as $number => $panel){
$sql = "UPDATE `clientPanels` SET `number`='$number' WHERE `panel` = '$panel'";
$result = mysql_query($sql);
if(mysql_errno() > 0){echo mysql_error . "<br/>$sql";}
}

$sql = "SELECT `panel`,`number` FROM `clientPanels` WHERE `number` BETWEEN 999 AND 10000 GROUP BY `panel`";
$result = mysql_query($sql);
while(list($panel,$number) =  mysql_fetch_array($result, MYSQL_NUM)){$panels[$number] = $panel;}
foreach ($panels as $number => $panel){
$sql = "UPDATE `PanelTests` SET `panel`= '$number' WHERE `panel`='$panel'";
$result = mysql_query($sql);
if(mysql_errno() > 0){echo mysql_error . "<br/>$sql";}
}


*/

$clients = array(200001,200005,200007,200008,200014,200019,200020,200025,200029,200035,200043,200056,200064,200093,200099,200101,200102,200107,200108,200112,200115,200117,200203,200209,200212,200214,200218,200219,200220,200222,200224,200225,200241,200247,200249,200278,200280);
$id = intval($_POST['id']);
$c = strtoupper($_POST['c']);
if(strlen($c) == 4 && $id > 99999){
  $sql = "UPDATE `Client` SET `passcode` = '$c' WHERE `Number` = $id";
  $result = mysql_query($sql);
  $err = mysql_error();
  $show .= "$c\n$id\n$sql\n$err";
}
$rec = intval($_POST['rec']);

if($rec > 0){
  if(intval($_POST['sub']) == 2){
    $description = $_POST['description'];
    $sql = "UPDATE `clientPanels` SET `description` ='$description' WHERE `rec` = $rec";
    $result = mysql_query($sql);
  }
  else{
    $include = intval($_POST['include']) ^ 1;
    $sql = "UPDATE `amx_portal`.`clientPanels` SET `include` = '$include' WHERE `clientPanels`.`rec` =$rec;";
    $result = mysql_query($sql);
  }
}
if($id > 99999){
$sql = "SELECT `Name`,`City`,`State`,`passcode`   FROM `Client` WHERE `Number` = $id ";
$result = mysql_query($sql);
list($name,$city,$state,$c) =  mysql_fetch_array($result, MYSQL_NUM);
}
echo <<<EOT
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML Basic 1.1//EN"
    "http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en"><head><meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/><title>Panels</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style type="text/css">
td{border:1px solid #000;padding:0 .3em;}
table {border-spacing: 0;border-collapse: collapse;}
body{font-weight:700;padding:2em;}
input[type="text"]{font:700 1em Arial,sans-serif;width:24em;pading:0 0 0 1em;}
.red{background:#f00;color:#fff;border:2px groove #000;font-weight:700;width:6em;}
.grn{background:#0f0;color:#000;border:2px groove #000;font-weight:700;width:6em;}
.blue{background:#2985EA;}
.hide{display:none;}

form{display:inline;}
</style></head><body><div id="page">
<div id="post"><form action="#" method="post">
<input type="hidden" name="rec" value="$rec"/>
EOT;
foreach($clients as $client){
 echo <<<EOT
 
<form action="#" method="post">
<input type="hidden" name="sub" value="0" />
<input type="hidden" name="id" value="$client" />
<button>$client</button></form>
EOT;
}
echo <<<EOT
<form action="#" method="post">
<br/><br/><br/>ID: <input type="text" name="id" value="$id" style="width:4em;"/>
<input type="submit" value="Submit ID"/></form><br/>
<form action="#" method="post">
<input type="hidden" name="id" value="$id" />
<br/><br/><br/>Passcode: <input type="text" name="c" value="$c" style="width:4em;"/>
<input type="submit" value="Submit Passcode"/></form>
<p>$err</p>
<p>&#x2003;</p>
EOT;
ob_flush();
$sub = intval($_POST['sub']);
if($sub == 4){
  foreach($_POST as $k => $v){
    if(substr($k,0,1) == 'r'){
    mysql_query("DELETE FROM `history` WHERE `id` =$v");
    }
  }
}
elseif($sub == 7){
  $addPanel = true;
  $description = '???';
  $pnum = intval($_POST['pnum']);
  $panel = $_POST['panel'];
  $sql = "SELECT `rec`,`description` FROM `clientPanels` WHERE `client` = '$id' AND `panel` LIKE '$panel' LIMIT 1";
  $results = mysql_query($sql);
  $rows =  mysql_num_rows($results);
  
  if($rows == 1){
    list($rec,$description) = mysql_fetch_array($results, MYSQL_NUM);
    if($rec < 1000 || $rec > 9999){
      $sql = "DELETE FROM `clientPanels` WHERE `client` = '$id' AND `panel` = '$panel'";
      $results = mysql_query($sql);
    }
    else{
      $addPanel = false;
      $pnum = $rec;
    }
  }
  $show .= "\nRows=$rows, number=$pnum, $sql\n" .  mysql_error();
  if(strlen($description) < 4){
    $sql = "SELECT `description`  FROM `Panels` WHERE `number` LIKE '$panel' LIMIT 1";
    $results = mysql_query($sql);
    $rows =  mysql_num_rows($results);
    $show .= "\nRows=$rows, number=$pnum, $sql\n" .  mysql_error();
    if($rows == 1){list($description) = mysql_fetch_array($results, MYSQL_NUM);}
    else{
      $sql = "SELECT `description`  FROM `importpanels` WHERE `number` LIKE '$panel' LIMIT 1";
      $results = mysql_query($sql);
      $rows =  mysql_num_rows($results);
      $show .= "\nRows=$rows, $sql\n" .  mysql_error();
      if($rows == 1){list($description) = mysql_fetch_array($results, MYSQL_NUM);}
    }
  }
  if($addPanel){
    $sql = "INSERT INTO `amx_portal`.`clientPanels` (`rec`, `include`, `client`, `panel`, `number`, `description`, `fee`) VALUES (NULL, '0', '$id', '$panel', '$pnum', '$description', '0') ON DUPLICATE KEY UPDATE `number`='$pnum';";
    $results = mysql_query($sql);
    $rows =  mysql_affected_rows($results);
    if($rows == 1){$pnum = mysql_insert_id($results);}
    $show .= "\nRows=$rows, number=$pnum, $sql\n" .  mysql_error();
    $sql = "INSERT INTO `amx_portal`.`Panels` (`id`, `number`, `description`, `fee`, `tests`, `ige`, `igg4`) VALUES (NULL, '$panel', '$description', '0', '0', '0', '0');";
    $results = mysql_query($sql);
    $rows =  mysql_affected_rows($results);
    $show .= "\nRows=$rows, number=$pnum, $sql\n" .  mysql_error();
    $sql = "INSERT INTO `amx_portal`.`clientPanels` (`rec`, `include`, `client`, `panel`, `number`, `description`, `fee`) VALUES (NULL, '0', '$id', '$panel', '0', '$description', '0');";
    $results = mysql_query($sql);
    $rows =  mysql_affected_rows($results);
    if($rows == 1){$pnum = mysql_insert_id($results);}
    $show .= "\nRows=$rows, number=$pnum, $sql\n" .  mysql_error();
  }
  $sql = "UPDATE `clientPanels` SET `number`='$pnum',`description`='$description' WHERE `client`='$id' AND `panel`='$panel'";
  $results = mysql_query($sql);
  $rows =  mysql_affected_rows($results);
  $show .= "\n202->Rows=$rows, number=$pnum, $sql\n" .  mysql_error();
  $sql = "SELECT `code`,`type`  FROM `importpaneltests` WHERE `number` LIKE '$panel'";
  $results = mysql_query($sql);
  $rows =  mysql_num_rows($results);
  $show .= "\n206->Rows=$rows, number=$pnum, $sql\n" .  mysql_error();
  while(list($code,$type) =  mysql_fetch_array($results, MYSQL_NUM)){
    $ptests[$code][$type] = $type;
  }
  if(count($ptests) > 0){
    $sql = "DELETE FROM `PanelTests` WHERE `panel` LIKE '$panel'";
    mysql_query($sql);
    $sql = "DELETE FROM `PanelTests` WHERE `number` = '$pnum'";
    mysql_query($sql);
  }
  foreach($ptests as $k => $array){
    foreach($array as  $v){
      $sql = "INSERT INTO `amx_portal`.`PanelTests` (`id`, `panel`, `code`, `type`, `number`) VALUES (NULL, '$pnum', '$k', '$v', '$pnum');";
      mysql_query($sql);
    }
  }
}
$actions = array('Incude','Exclude');
$classes = array(' class="grn" ', ' class="red" ');

if($id > 99999){
echo "<h3>$name $city $state</h3><table>";
$sql = "SELECT `rec`,`client`,`include`,`number`,`panel`,`description` FROM `clientPanels` WHERE `client` = $id";
$result = mysql_query($sql);
while(list($rec,$client,$include,$number,$panel,$description) =  mysql_fetch_array($result, MYSQL_NUM)){
 if($number == 0){$class=' class="hide" ';}else{$class = $classes[$include];}
 $action = $actions[$include];
 if($number == 0 && intval($panel) > 999 && intval($panel) < 10000){
   $sql = "UPDATE `amx_portal`.`clientPanels` SET `number` = '$panel' WHERE `clientPanels`.`rec` =$rec;";
   mysql_query($sql);
 }
  echo "<tr><td style=\"padding:0;\"><form action=\"#\" method=\"post\" ><input type=\"hidden\" name=\"id\" value=\"$id\"/><input type=\"hidden\" name=\"rec\" value=\"$rec\"/><input type=\"hidden\" name=\"include\" value=\"$include\"/><button$class>$action</button> </form></td>
  <td>$client </td><td> $include </td>
  <td> $panel </td><td> $number </td><td><form action=\"#\" method=\"post\" ><input type=\"hidden\" name=\"id\" value=\"$id\"/><input type=\"hidden\" name=\"sub\" value=\"2\"/><input type=\"hidden\" name=\"rec\" value=\"$rec\"/>&#x2003;<input class=\"desc\" type=\"text\" name=\"description\" value=\"$description\"/>&#x2003;<button class=\"grn\">Update</button>&#x2003; </form></td></tr>\n";
}

  $sql = "SELECT `id`,`date`, `last`, `first`, `dob`, `gender` FROM `history` WHERE `client` = $id ORDER BY `client` ASC,`last` ASC, `first` ASC";
  $results = mysql_query($sql);
  echo '</table><hr/><h2>Delete Checked Patients in History</h2><form action="#" method="post"><input type="hidden" name="id" value="' . $id . '" /><input type="hidden" name="sub" value="4" /><table>';
  while($row = @mysql_fetch_array($results, MYSQL_NUM)) {
  list($rec,$date, $last, $first, $dob, $gender) = $row;
  echo <<<EOT
<tr><td><input type="checkbox" name="r$rec" value="$rec" /></td><td>$last, $first</td><td>$dob</td><td>$date</td></tr>

EOT;
  }
  echo '</table><button>Delete Checked</button></form>';
  
  
  echo <<<EOT
  
<br/><hr/>
<form action="#" method="post" >
<input type="text" name="panel" value="" style="width:4em;"/>
<input type="hidden" name="id" value="$id" />
<input type="hidden" name="sub" value="7" />
<button>Add Panel</button></form>
EOT;
}
if($ip == '70.171.10.12' ){ echo "<pre>\n$show</pre>";}
//SELECT *  FROM `PanelTests` WHERE `panel` LIKE '2012'
//

?>