<?php ob_start("ob_gzhandler");
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<title>Get IdeaFit PT</title>
<style type="text/css">
#main{width:40em;margin-left:4%;min-height:100%;}
#content{width:100%;min-height:100%;margin-top:80px;}
#header{color:#afafaf;background:#414141;position: fixed;top: 0;height: 4em;width: 100%;z-index: 2;background-image: -ms-linear-gradient(top, #4d4d4d 0%, #3c3c3c 100%);background-image: -moz-linear-gradient(top, #4d4d4d 0%, #3c3c3c 100%);background-image: -o-linear-gradient(top, #4d4d4d 0%, #3c3c3c 100%);background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #515151), color-stop(1, #2A2A2A));background-image: -webkit-linear-gradient(top, #4d4d4d 0%, #3c3c3c 100%);background-image: linear-gradient(to bottom, #4d4d4d 0%, #3c3c3c 100%);}
img{border:0;vertical-align:middle;}
#heading{display:inline;margin-left:2em;border:0;}
#tag{margin-left:1em;display:inline;}
#nav{display:inline;}
td{padding:0 1em 0 1em;border:1px solid #afafaf;}
body{width:100%;font:400 1em/1.5 Arial,sans-serif;margin:0;padding:0;background:#303030;color:#eee; }
.headline{font-size:1.9em;}
.emp{font-weight:700;font-size:1.1em;}
.byline{text-align:right;}
.quote{font-style:italic;margin-left:10%;}
h1{color:#f00;}
h3{margin:2em 0 1em 5%;}
h4{margin:2em 0 1em 9%;}
li{font:700 1.5em/2 Arial,sans-serif; color:#ff0;}
.btn {text-decoration:none;border:2px solid #2985EA;border-radius: 4px;background:#2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding:.6em;text-align: center;}
p{font-size:.6em;font-weight:700;color:#0ff;padding:0;margin:0;}

</style><body>
<div id="content">
EOT;
ob_flush();
ignore_user_abort(true);

$fl = fopen('/home/amx/public_html/progressFL.txt','a+');
$fp = fopen('/home/amx/public_html/linksFL.txt','a+');
$ip = $_SERVER['REMOTE_ADDR'];
$h = '<!DOCTYPE html><html lang="en"><head><title>TX IdeaFit </title><style type="text/css">body{width:100%;font:400 1em/1.5 Arial,sans-serif;margin:0;padding:0;background:#303030;color:#eee;}.btn{color:#00f;padding:1em;margin:.4em;font:700 1em arial,sans-serif;}a:link{text-decoration:none;color:#0ff;border:4px solid #0ff;padding:1em 0;background-color:#303030;}a:visited{text-decoration:none;border:4px solid #f00;padding:1em 0;background-color:#303030;color:#00f;}</style></head><body>';
$now = date("F j, Y, g:i:s a"); 
$status = 'DONE';
fwrite($fl,"$now $ip START ideaFitFL.txt->linksFL.txt\n"); 
//fwrite($fp,"$h\n"); 
$cities = file_get_contents('/home/amx/public_html/ideaFitFL.txt');
$c = explode("\n",$cities);
$time = time() ;
$filter = false;
foreach ($c as $key=> $val){
  if ($filter && $val != 'http://www.ideafit.com//find-athletic-trainer-coach/fl/dowling-park/'){continue;}else{$filter = false;}
  if (!file_exists('getLink.key')){fwrite($fl,"$now BREAK ideaFitFL.txt->linksFL.txt\n");$status = 'BREAK'; break;}
  set_time_limit(10);
  $pg = 0;
  $now = date("F j, Y, g:i:s a");
  echo " found:$found<p>$now $val";
  $found = 0;  
    ob_flush();  
  while(true){
	if ($pg > 0){
      $link = $val . "?page=$pg";
	}
	else{
      $link = $val ;
	}
	$pg++;
	sleep(1);
	sleep(1);
	sleep(1);
	$second = time() - $time;
	$time = time() ;
    echo ".$pg\| $second:";
    ob_flush();
	$p = file_get_contents($link);
	$second = time() - $time;
	echo "$second |";
	$time = time() ;
    
	if (!$p){continue;}
	
	if ($pg > 20){break 2;}
    $e=0;
    $s=strpos($p,'class="image"><a href="',$e);
    if ($s==false){break;}
	$loops = 0;
    while(true){
      $s=strpos($p,'class="image"><a href="',$e);
	  $pro = '';
      if ($s == false){break;}
        $s += 23;
        $e = strpos($p,'"><img',$s);
        $pro = substr($p,$s,$e-$s);
//        fwrite($fp,'<div class="btn"><a href="http://www.ideafit.com'. $pro .'" target="_blank">&emsp;&emsp;' . $line . '&emsp;&emsp;</a></div><br>' . "\n");  
        fwrite($fp,"http://www.ideafit.com/$pro/\n");  
		$found++;
		$loops++;
		if ($loops > 15){
		  fwrite($fl,"$now ERROR: EXCESSIVE NUMBER OF TRAINERS:$link\n"); 
		  break;
		}
     }

  }
    


  fwrite($fl,"$now $link\n"); 
}
fwrite($fl,"$now DONE ideaFitFL.txt->linksFL.txt\n"); 
fclose($fl);
fclose($fp);
echo "<h1>$status</h1>'<h2>$cnt</h2>";




return;




$dbc=mysqli_connect('localhost','er','yes12yes');
@mysqli_select_db($dbc,'er_prescription');

$pt = explode("\n",trim($_POST['msg']));
$t = strpos($pt[0],"\t");
$name = substr($pt[0],0,$t);
$business = $pt[1];
$addr = $pt[2];
$city = $pt[3];
$exp = $pt[5];
$t = strpos($pt[5],"Websi");
$exp = substr($pt[5],0,$t);
$web = substr($pt[5],$t+8);
$email = substr($pt[6],5);
$note = htmlentities($pt[12],ENT_COMPAT,'utf-8');

$phone = ereg_replace("[^0-9]", "", $pt[7]);


if (strlen($phone) < 10){
echo "<h1 >phone:INVALID PHONE NUMBER $phone";
$phone = intval(time()/100); echo "$phone<br>";
echo "<br>$phone</h1>";
}

$sql = "INSERT INTO `er_prescription`.`Profile` (`Number`, `ip`, `business`, `addr`, `city`, `email`, `exp`, `web`, `name`, `note`, `age`, `sex`, `bodyweight`, `months`, `height1`, `height2`, `int`, `vol`, `activity`, `tape1`, `tape2`, `tape3`, `waist`, `hrr`, `minutes`, `seconds`, `hrs`, `spm`, `height`) VALUES ('$phone', '', '', '', '', '', '', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');";
@mysqli_query($dbc,$sql);
$x=  mysql_error() ;
if (strlen($x)>0){
  echo $x .'<br><textarea cols="60" rows="14" name="msg">' . $sql . '</textarea><br><br>';
}
//echo "e: $x<br>$sql";
$sql = "UPDATE `Profile` SET `ip`='$ip',`business`='$business',`addr`='$addr',`city`='$city',`email`='$email',`exp`='$exp',`web`='$web',`name`='$name',`note`='$note' WHERE `Number`= $phone";
@mysqli_query($dbc,$sql);
$x=  mysql_error() ;
if (strlen($x)>0){
  echo $x . '<br><textarea cols="60" rows="14" name="msg">' . $sql . '</textarea><br><br>';
}
//echo "E: $x<br>$sql";
echo <<<EOT
<p>phone: $phone
<p>email: $email
<p>web: $web
<p>name: $name
<p>business: $business
<p>addr: $addr
<p>city: $city
<p>exp: $exp


<br><p>

EOT;
// tudor bompa /find-personal-trainer/fl/alturas">Alturas href="/profile/carsten-rieger">Carsten Rieger</a>

foreach ($pt as $key=> $val){
  echo "$ndx) Key: $key &ensp; Val: $val<br>\n";
  $ndx++;

}
echo "</pre></body></html>";



?>