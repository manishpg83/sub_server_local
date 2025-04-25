<?php
$err1= 0;
$err2 = 0;
$err3 = 0;
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$sort = array();
$rast = array();
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE 1 ORDER BY `description` ASC";
$results = mysqli_query($link,$sql);
//if(mysqli_errno($link) > 0){$err1++;echo mysqli_error($link) . "  <br>$err1 $sql<br>\n"; if($err1>10){exit;}}
while(list($code,$description) =  mysqli_fetch_array($results, MYSQLI_NUM)){$sort[] = $code; $rast[$code] = $description; $matches[$code] = 0;}
//foreach($foods as $code){$matches[$code] = 1;}
$sort = array_flip($sort);


//echo'<pre>';
  $sql = "SELECT `code`, `type`,`rec` FROM `PanelTests` WHERE 1" ; //`code` NOT LIKE 'T100";
  $results = mysqli_query($link,$sql);
  while(list($code,$type,$rec) =  mysqli_fetch_array($results, MYSQLI_NUM)){if($sort[$code])
    $sql = "UPDATE `PanelTests` SET `sort` = " . intval($sort[$code]) . " WHERE `rec` = $rec";
	//echo "$code, $sql\n";
    mysqli_query($link,$sql);
	//if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}
  }



?>