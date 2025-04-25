<?php
$codes[] = array('T003','T146','T008','T107','T108','T100','T101','T153','F363'); 
$codes[] = array('T140');
$codes[] = array('W006'); 
$codes[] = array('W111'); 
$codes[] = array('W001'); 
$codes[] = array('K082');
$codes[] = array('F020','F049','F138','F096','F092','F343','F288','F018','F031','F085','F100','43','F341','32','F259','F017','F153','F208','F134','F351','F132','F033','F283','F112','F144','F095','F013','F094','F263','F313','F314','F011','F150','F210','F128','F035','F115','F129','F014','F044','F025','F256','F317','F329','F004');
$codes[]=array('F049','F288','F142','F008','43','F017','F208','F215','F134','F351','F033','F095','F013','F210','32','F129','F044','F329');
$codes[]=array('F356','F301','F302','F303','F015','F288','F007','F008','F304','F004','FZ11','F009','F350','43','F153','F208','F134','F351','F087','F033','F013','F012','F355','F147','F210','32','F129','F014','F044','F025','F329','FOO4');
$codes[]=array('F049','F096','F092','F031','F085','F103','F153','F087','F305','F329','F127','F035','F025');

$ndx = 0;
$dbc=mysql_connect('localhost','amx_allermetrix','allermetrix510'); @mysql_select_db('amx_portal');
$crossSQL = array('`Birch`','`Sycamore`','`Grasses`','`Latex`');
  $fp = fopen("/home/amx/public_html/crossx.txt","w");
  while(true){
    $sql = "SELECT `id`FROM `Foods` WHERE $crossSQL[$ndx] = 1  ORDER BY `Description` ASC";
    $results = @mysql_query($sql);
    $error = mysql_error();
    $data = $crossSQL[$ndx] . ' = array(';
    while($row = mysql_fetch_array($results, MYSQL_NUM)){
      $data .= "$row[0],";
    }
	$data .= "\n";
    fwrite($fp,$data);
    if ($ndx > 2){break;}
    $ndx++;
  }
    $sql = "SELECT `id`,`Code`,`Description` FROM `Foods` WHERE `Code` LIKE 'G%' ORDER BY `Description` ";
    $results = @mysql_query($sql);
    $error = mysql_error();
    $data = 'grass = array(';
	$desc = 'grassCodes = array(';
    while($row = mysql_fetch_array($results, MYSQL_NUM)){
      $data .= "$row[0],";
      $desc .= "'$row[2]',";
    }
	$data .= "\n";
	$desc .= "\n\n########\n\n";
    fwrite($fp,$data);
    fwrite($fp,$desc);
$trans = array(1,1,1,1,1,1,1,1,1,1,1,1);
	
    foreach ($codes as $val ){
	  asort($val);
	  $sql = "SELECT `id`,`Description` FROM `Foods` WHERE";
      foreach ($val as $code ){
	    $sql .= " `Code` LIKE '$code' OR";
      }
	  $sql = substr($sql,0,-2);
	  $SQL[] = $sql;
	  $sql .= "\n";
	  fwrite($fp,$sql);
    }
	$ndx = 1;
	foreach ($SQL as $sql){
      $results = @mysql_query($sql);
	  $rows = mysql_num_rows($results);
      $error = mysql_error();
	  $data = "$sql\n";
	  fwrite($fp,$data);
      $data ="$rows codes[$ndx] ";
	  $desc = "$rows  desc[$ndx] ";
      while($row = mysql_fetch_array($results, MYSQL_NUM)){
        $data .= "$row[0],";
        $desc .= "'$row[1]',";
      }
	  $data .= "\n";
	  $desc .= "\n";
      fwrite($fp,$data);
      fwrite($fp,$desc);
      $ndx += $trans[$ndx];
	}
	fclose($fp);
  ?>
