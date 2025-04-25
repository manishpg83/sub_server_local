<?php   ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=3600');
header('Vary: Accept-Encoding');
echo <<<EOH
<!DOCTYPE html><html lang="en"><head><title>Pro YP FL</title><style type="text/css">
body{width:100%;font:400 9px/1 arial,sans-serif;margin:0;padding:0;margin:0;background:#333;color:#eee;}
form,button,p,.row,.nopad,.warn,#n,#p,#a,#w{margin:0;padding:0;border:0;font:400 9px/1 arial,sans-serif;}
form{display:in-line;}

p{overflow:hidden;color:#0ff;text-align:left;}
button{overflow:hidden;background:#333;color:#0ff;text-align:left;}
#n{width:10em;font:400 9px/1 arial,sans-serif;}
#p{width:7em;font:400 9px/1 arial,sans-serif;}
#a{width:30em;font:400 9px/1 arial,sans-serif;}
.warn{color:#ff0;}
</style></head><body><pre>
EOH;
ob_flush();
$dbc=mysql_connect('localhost','isl','yes12yes');
@mysql_select_db('isl_contact');

$cat[] = rawurlencode('Packing & Crating');
$cat[] = rawurlencode('Palletize Service');
$cat[] = rawurlencode('Movers/ Moving Company/ Moving Services');
$cat[] = rawurlencode('Freight Shipping Service');
$cat[] = rawurlencode('Automobile Transporters');






foreach ($cat as $k => $v){
if ($k > 5){
//$fp = fopen('cat' . $k,'w');
$pgNum = 1;
$ndx = 0;
$link = $page;
$pg = 1;
ob_flush();
$pgnum = '';
$listing = '';
$text = '';
while(false){
  $link = "http://www.yellowpages.com/search?search_terms=$v&geo_location_terms=Pompano+Beach%2C+FL&page=$pgNum";
  
  $p = file_get_contents($link);
  $len =  strlen($p);
  echo "<a href=\"$link\">$len) $link</a><br/>\n";
  ob_flush();
  $loops = 0;
  $start = 0;
  $s = strpos($p,'<h3 class="n">');
  if ($s < 1){break;}
  $e = strpos($p,'function load()',$s);
  $text = substr($p,$s,$e-$s);
  fwrite($fp,$text);
  if ($ndx++ > 25){break;}
  $pgNum++;
}
unset($p);
$num = 1;
$term = "<h3 class=\"n\">$num.";
$s = 0;
fclose($fp);

}
if ($k==1){continue;}
if ($k==4){continue;}
$data = file_get_contents('/home/isl/public_html/client/cat' . $k);
$len = strlen($data);
$num = 1;
$term = "<h3 class=\"n\">$num.";
$s = 0;
while(true){
$s = strpos($data,$term,$s);
if(!$s){echo "<h3>k=$k num=$num </h3>";break;}
$num++;
echo "$num-";
$term = "<h3 class=\"n\">$num.";
$e = strpos($data,$term,$s);
$listing = substr($data,$s,$e-$s);
$len = strlen($listing);
$ls = strpos($listing,'class="business-name">');
if ($ls > 0){
$ls += 22;
$le = strpos($listing,'<',$ls);
$name = substr($listing,$ls,$le-$ls);
}else {$name = " $ls-$le" ;}
$ls = strpos($listing,'class="street-address">');
if ($ls > 0){
$ls += 23;
$le = strpos($listing,'<',$ls);
$address = substr($listing,$ls,$le-$ls);
}
$ls = strpos($listing,'class="locality">');
if ($ls > 0){
$ls += 17;
$le = strpos($listing,'<',$ls);
$city = substr($listing,$ls,$le-$ls);
}
$ls = strpos($listing,'itemprop="addressRegion">');
if ($ls > 0){
$ls += 25;
$le = strpos($listing,'<',$ls);
$state = substr($listing,$ls,$le-$ls);
}
$ls = strpos($listing,'itemprop="postalCode">');
if ($ls > 0){
$ls += 22;
$le = strpos($listing,'<',$ls);
$zip = substr($listing,$ls,$le-$ls);
}
$ls = strpos($listing,'class="phones phone primary">');
if ($ls > 0){
$ls += 29;
$le = strpos($listing,'<',$ls);
$phone = substr($listing,$ls,$le-$ls);
}
$ls = strpos($listing,'LOC":"http://');
if ($ls > 0){
$ls += 13;
$le = strpos($listing,'"}',$ls);
$web = substr($listing,$ls,$le-$ls);  
$ls = strpos($web,'citygridmedia');
if ($ls > 0){
  $web = '';
}
else{
  $ls = strpos($web,'?');
  if ($ls > 0){$web = substr($web,0,$ls);}
}
}
echo "<p>$cat-$num) $name $address  $city $state $zip $phone $web</p>";
$sql = "INSERT INTO `isl_contact`.`moving` (`id`, `cat`, `name`, `address`, `city`, `state`, `zip`, `phone`, `web`) VALUES (NULL,$k, '$name', '$address ', '$city', '$state', '$zip', '$phone', '$web')";
mysql_query($sql);


$name = '';
$address  = '';
$city = '';
$state = '';
$zip = '';
$phone = '';
$web= '';
if ($ndx++ > 10000){exit;}

}

}
exit;
/*
   
$cities = array();
$cities[0] ='fort-lauderdale-fl';
//$cities[1] ='orlando-fl';
//$cities[2] ='jacksonville-fl';
//$cities[3] ='tampa-fl';
//$cities[4] ='tallahassee-fl';
//$cities[5] ='miami-fl';
//$cities[6] ='west-palm-beach-fl';
//$cities[7] ='ocala-fl';
//$cities[8] ='naples-fl';

//$cities[0] ='houston-tx';
//$cities[1] ='dallas-tx';
//$cities[2] ='san-antonio-tx';
//$cities[3] ='austin-tx';
//$cities[4] ='el-paso-tx';
//$cities[5] ='fort-worth-tx';
$fp = fopen('MOVERS.txt',"w");

if (false){
$ndx = 0;
$exp = array();
  while (($text= fgets($fp , 4096)) !== false) {
     $listing = explode('","', $text);
	 
	 foreach ($listing as $key => $val){
	   $fields = explode('":"',$val);
	   var_export($fields);
	     $id[$fields[0]] = $fields[1];
	 }
	 $line .= $id['name'] . "\n";
	 $line .= $id['city'] . " ";
	 $line .= $id['state'] . " ";
	 $line .= $id['zip'] . "\n\n";
	 $line .= $id[''] . "\n";
	 $line .= $id[''] . "\n";
	 $ndx++;
 
	 
	 var_export($listing);
  }
  var_export($id);
  exit;
}
*/
//$page = 'http://www.yellowpages.com/' . $val . '//computer-repair?g=coral%20springs%2C%20fl&q=computer%20repair';
//$page = 'http://www.yellowpages.com/pompano-beach-fl/computer-repair?g=pompano%20beach%2C%20fl&q=computer%20repair&s=relevance';

  while(true){
	$address = '';  $city = ''; $state = ''; $zip = ''; $phone = '';$web = '';
    $loops++;
    if ($loops > 35 || $loops == 0){break;}
	$s = strpos($p,'itemprop="name">',$e);
    if (!$s){break;}
    $s += 16;
    $e = strpos($p,'</span>',$s);
    $name = substr($p,$s,$e-$s);
	$end = strpos($p,'class="index"',$e);
	$start = $s;
    $s = strpos($p,'street-address">',$e);
	if ($s && $s < $end){
      $s += 16;
      $e = strpos($p,'</span>',$s);
      $address = substr($p,$s,$e-$s);
	}
    $s = strpos($p,'locality">',$e);
	if ($s && $s < $end){
      $s += 10;
      $e = strpos($p,'</span>',$s);
      $city = substr($p,$s,$e-$s);
	}
    $s = strpos($p,'addressRegion">',$e);
	if ($s && $s < $end){
      $s += 15;
      $e = strpos($p,'</span>',$s);
      $state = substr($p,$s,$e-$s);
	}
    $s = strpos($p,'postalCode">',$e);
	if ($s && $s < $end){
	$zipS = $s;
      $s += 12;
      $e = strpos($p,'</span>',$s);
      $zip = substr($p,$s,$e-$s);
	}
    $s = strpos($p,'phone primary">',$e);
	if ($s && $s < $end){
      $s += 15;
      $e = strpos($p,'</li>',$s);
	  $phone = intval(preg_replace("/[^0-9]/",'',substr($p,$s,$e-$s)));
	  
	}
    $s = strpos($p,'links"><li><a href="http',$e);
	if ($s && $s < $end){
      $s += 20;
      $e = strpos($p,'" ',$s);
      $web = substr($p,$s,$e-$s);
	}
	else{
	  $web = '';
    }
	if (!$end){break;}
	//if ($s < $start){break;}
//	if (strlen($web) < 8){continue;}
    $data =  "<p>$pg . $loops) $name $address  $city $state $zip $phone web: $web</p> \n";
    $name = mysql_escape_string($name);
    $web = mysql_escape_string($web);
	
	$sql = "INSERT INTO `isl_contact`.`Profile` (`number`, `TimeStamp`, `ip`, `business`, `addr`, `city`, `email`, `exp`, `web`, `name`, `note`, `link`, `contact`, `source`, `id`, `mobile`, `state`, `attributes`, `fuDate`, `fuTime`) VALUES ($phone, CURRENT_TIMESTAMP, '', '$name', '$address', '$city $state $zip', '', '', '$web', '', '', '', '', '', NULL, '', '0', '0', NULL, NULL);";
//	mysql_query($sql);
	if (mysql_errno() > 0 && mysql_errno() != 1062) {echo "<h3>" . mysql_error() . "<br/>$sql</h3>";}
	fwrite($fp,$data);
	echo $data;
	if (!$end){break;}
  
  if ($loops > 40){break;}
  $pg++;
  $pgnum = "&page=$pg";
  continue;
     $s=strpos($p,'{"listingID',$e); 
	 if (!$s){break;}
     $e = strpos($p,'}',$s);
     $s += 2;
	 $e -= 1;
     $line =  substr($p,$s,$e-$s) . "\n";
	 $data = explode(',',$line) . "\n";
	 $export = var_export($data,true);
	 fwrite($fp,"$line\n$export");
	 $loops++;if ($loops > 222){break;}
}

/*  
 {
  echo $link . '<br>';
  if (!$s){echo '<h3>BREAK NO PAGES</h3>';break;}
  
  echo strlen($p) . ' bytes </p><br><p>';
  $e = 0;
  $loops = 0;
  echo "<p>Page: $pg</p>";
  while(true){
    if ($loops++ > 32){echo '<h3>BREAK TOO MANY LOOPS</h3>';break;}
    ob_flush();
    $s=strpos($p,'supermedia&quot;:&quot;&quot;}" title="',$e);  
    if (!$s){echo '<h3>BREAK NO CONTACTS</h3>';break;}
    $name = '';
    $s += 39;
    $e = strpos($p,'">',$s);
    if($e > 0){
      $name = substr($p,$s,$e-$s);
    }
  //  echo "<p>$s  name: $name</p>";
    
    
    $s=strpos($p,'street-address">',$e); 
    $next = $s;  
    $addr = '';
    if ($s > 0){
      $s += 17;
      $e = strpos($p,'</span>',$s);
      if($e > 0){
      
        $addr = substr($p,$s,$e-$s-1);
      }
    }
   // echo "<p>$s  addr: $addr</p>";
    
    $s=strpos($p,'="locality">',$e);  
    $city = '';
    if ($s > 0){
      $s += 12;
      $e = strpos($p,'</span>',$s);
  	
      if($e > 0){
        $city = substr($p,$s,$e-$s);
      }
    }
  
    //  echo "<p>$s  city: $city</p>";
    
    $s=strpos($p,'="region">',$e);  
    $state = '';
    if ($s > 0){
      $s += 10;
      $e = strpos($p,'</span>',$s);
  	
      if($e > 0){
        $state = substr($p,$s,$e-$s);
      }
    } // echo "<p>$s  state: $state</p>";
    
    
    $s=strpos($p,'postal-code">',$e);  
    $zip = '';
    if ($s > 0){
      $s += 13;
      $e = strpos($p,'</span>',$s);
  	
      if($e > 0){
        $zip = substr($p,$s,$e-$s);
  	  $zip = ereg_replace("[^0-9]", "", $zip);
      }
    }
    
   // echo "<p>$s  zip: $zip</p>";
    
    $s=strpos($p,'ss-phone phone">',$e);
    $phone = '';
      if ($s > 0){
      $s += 16;
      $e = strpos($p,'</span>',$s);
      $phone = substr($p,$s,$e-$s);
      if(($e > 0)  && (($e-$s) < 20)){
        $phone = ereg_replace("[^0-9]", "", $phone);
      }
    }
    
    
    
    $s=strpos($p,',&quot;LOC&quot;:&quot;',$e);
    $web = '';
    if ((($s-$e)> 4098) || !$s){
    
      $web = 'No Website';
     // echo "<p class=\"warn\">";
    }
    else{
      
      $s += 23;
      $e = strpos($p,'&quot;}"',$s);
      if($e > 0){
        $web = substr($p,$s,$e-$s);
  	  if (strlen($web) > 128){$web='No Website';echo "<p class=\"warn\">";}else{echo "<p>";}
      }
  	
    }
   // echo "$s  web: $web</p><p>&emsp;<br>&emsp;</p>";
    $s=strpos($p,'supermedia&quot;:&quot;&quot;}" title="',$next); 
    if (!$s){echo '<h3>BREAK LAST CONTACT</h3>';break;}
    $e = $s;
    $e--;
	$pro = "$name\t$addr\t$city\t$state\t$zip\t$phone\t$web\n";
    fwrite($fp,$pro);
	echo "<p>$pro</p>";
  }
  $pg++;
  $link = "$page?page=$pg";
}
 } 
ob_flush();
fclose($fp);

?>
*/