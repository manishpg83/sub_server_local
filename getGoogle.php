<?php  ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
if (isset($_POST['s'])){$s = $_POST['s'];}
echo <<< EOT
<!DOCTYPE html>
<html lang="en">
<head>
<title>Get Links</title>
<style type="text/css">
body{-ms-text-size-adjust:100%;text-align:left;background:#111;font:700 1em Arial,sans-serif;color:#ffe;width:100%;padding:10% 0 0 0;margin:0;}
a,a:link,a:visited,a:hover{text-decoration:none;color:#ffe;}
.cntr{text-align:center;}
.chk {overflow:visible;cursor:pointer;border:0;background:#2985EA;color: #ffe;font: 700 1.8em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align: center;-ms-text-size-adjust:100%;}
.btn {overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #2985EA;color: #ffe;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;text-align:center;-ms-text-size-adjust:180%;}
.num {display:inline-block;width:6em;text-align:center;overflow:visible;cursor:pointer;display:inline;border:0;background:none repeat scroll 0 0 #0f0;color: #000;font: 700 1em Arial,Helvetica,Calibri,sans-serif;margin: 0;min-width: 4em;overflow: visible;padding: 0;text-align:center;-ms-text-size-adjust:180%;}
input[type="radio"],input[type="checkbox"]{margin-left:4px;width:2em;height:2em;border:2px solid #ffe;outline:2px solid #ffe;color:#aaa;margin:1px;vertical-align: middle;position: relative;}
input[type="text"]{width:90%;font:700 .8em Arial,sans-serif;}
.reg{font:400 .8em Arial,sans-serif;}
.hit{color:#ff0;}
.miss{color:#f00;}
</style>
</head><body>
<form action="getLinks.php" method="POST"><div class="head">
<input class="btn" type="submit" value="Next" />
</form>
EOT;
//<input type="text" name="s" value="$s" />
ob_flush();


/******
$dbc=mysql_connect('localhost','isl','yes12yes');
mysql_select_db('isl_search');

$sql = "SELECT `CATEGORY` FROM `Industries` WHERE `USED` = 0 LIMIT 0, 1 ";
$results = @mysql_query($sql);
$row = mysql_fetch_array($results, MYSQL_NUM); 
$term = $row[0];
$sql = "UPDATE `Industries` SET `USED`= `USED` + 1 WHERE `CATEGORY` = '$term'";
@mysql_unbuffered_query($sql);
$term = 'COMPUTER REPAIR FORT LAUDERDALE';
$term = urlencode($term);
*****/
echo "<h2>term=$term</h2>";
  $ip = $_SERVER['REMOTE_ADDR'];
    set_time_limit (0);
 //   require_once ("commonfuncs.php");
    $all = 0; 
 //   extract (getHttpVars());
    require_once ("conf.php");
    include "messages.php";
    include "spiderfuncs.php";
    error_reporting (E_ALL ^ E_NOTICE ^ E_WARNING);
  $s = 0;

   $url[0] = "http://www.google.com/search?q=COMPUTER+REPAIR+FORT+LAUDERDALE";
   $url[0] = "https://www.google.com/search?hl=en&as_q=$term&as_epq=Lauderdale&as_oq=FL+Ft+fort&as_eq=&as_nlo=33000&as_nhi=33999&lr=&num=100&cr=&as_qdr=all&as_sitesearch=&as_occt=body&safe=images&tbs=&as_filetype=&as_rights=";
   $url[1] = "https://www.google.com/search?hl=en&as_q=$term&as_epq=Lauderdale&as_oq=FL+Ft+fort&as_eq=&as_nlo=33000&as_nhi=33999&lr=&num=100&cr=&as_qdr=all&as_sitesearch=&as_occt=body&safe=images&tbs=&as_filetype=&as_rights=&start=100";
   $url[0] = "http://www.google.com/search?q=COMPUTER+REPAIR+FORT+LAUDERDALE";
  //$url = $POST['url'];
  $rank = 0;
  $file = array();
  $links = array();
  $ndx = 0;
  while ($ndx < 1) {
    $geturl = $url[$ndx++];

    $file = getFileContents($geturl);
    $len = strlen($file['file']);
    $data = array();
    $links = get_links($file['file'], $geturl, 1, $data['base']);
    $size = count($links);


    echo "<p>$geturl</p>";
    if ($size < 2){echo $file['file'];break;}
    foreach ($links as $val) {
      $c = strpos($val,'webcache.g');
      if ($c > 0) {continue;}
      $s = strpos($val,'url?q=http',22);
      if ($s < 1) {continue;}
      $s += 6;
    
      $e = strpos($val,'sa=',$s);
      
      if ($s > 0 && $e > 0){
        $e -= ($s + 5);
        $link = substr($val,$s,$e);
        $urlparts = parse_url($link);
        $host = $urlparts['host'];
        
        $sql = "INSERT INTO `isl_search`.`links` (`Timestamp`, `link`, `host`, `Rec`,`Hits`) VALUES (CURRENT_TIMESTAMP, '$link', '$host',NULL,0)";
        @mysql_unbuffered_query($sql);
        $rec = mysql_insert_id() ;
        ++$line;
        echo "<p class=\"hit\">$rec of $line.) $host</p>";
        ob_flush();
        if ($rec == 0){
          $sql = "UPDATE `links` SET `Hits`= `Hits` + 1 WHERE `host` = '$host'";
          @mysql_unbuffered_query($sql);

/****
          $page = getFileContents($link);


          if (strpos($page,'954')> 0){
            echo "<p class=\"hit\">$rec of $line.) $host<br>\n";
          }
          else{
            echo "<p class=\"miss\">$rec of $line.) $host<br>\n";
          }

*////


        }
  
      }
    }
    if (!strpos($file['file'],'>Next<')){break;}
  }

return;
  if (is_array($link1)) {
    while ($link2 = each($link1)) {


      if (is_array($link2)) {
        while ($link3 = each($link2)) {
          if (is_array($link3)) {
            foreach ($link3 as $link4) {
             if (strpos($link4,'google.com/sea')>0 && strpos($link4,'start=')>0) {
               $url = '';
               foreach ($parts as $val) {
   
                 if (substr($val,0,2) == 'ht'){
                   $url = $val;
//                   echo $val ."\n";
                 }
                 elseif (substr($val,0,2) == 'q='){
                  $url .= '?' . $val;
//                   echo $val ."\n";
                 }
                 elseif (substr($val,0,2) == 'hl'){
                  $url .= '&amp;' . $val;
//                   echo $val ."\n";
                 }
               
                 elseif (substr($val,0,2) == 'ie'){
                  $url .= '&amp;' . $val;
//                   echo $val ."\n";
                 }
               
                 elseif (substr($val,0,2) == 'sa'){
                  $url .= '&amp;' . $val;
//                   echo $val ."\n";
                 }
                 elseif (substr($val,0,2) == 'st'){
                   $s = preg_replace('/^.*=(\d+)/',"$1",$val);
                   if ($s > $start) {
                     if ($start > 0) {
                       $start = $s;
                       break 4;
                     }
                     $start = $s;
                   }
                   echo $start . " s=$s  $val \n";
                 }
             //    echo "\n |" .substr($val,0,2). "  $url\n\n";              
               
                  
                 
                }
                 $next = $url;

              }
              if (strpos($link4,'ttp://www.google.com/gwt')>0) {
                echo "- $link4\n";
                $parts= preg_split('/\x3f|&amp;|\x26/',$link4);
                foreach ($parts as $val) {
                  if (substr($val,0,1) == 'u'){
                    echo substr($val,2) ." +\n";
                    $urlparts = parse_url(substr($val,2));
                    $host = $urlparts['host'];
                    echo "$host\n-------------------------------------------------------------\n";
                    $rank++;
                    $sql = "INSERT INTO `ft_search`.`Rank` (`Term`, `Rank`, `Host`) VALUES ('$term', $rank, '$host');";
                    $results = @mysql_unbuffered_query($sql);
                    break 4;
                  }
 

       //  if ($host == 'www.pointofsuccess.com') {
              $sql = "INSERT INTO `ft_search`.`LinkQueue` (`TimeStamp`, `Link`, `Host`) VALUES (CURRENT_TIMESTAMP, '$link4', '$host')";
              @mysql_unbuffered_query($sql);

                }
                
              }
            }
          }
          else {
            echo $link3 . "\n";
          }
        }
      }
      else {
        echo $link2 . "\n";

        }
   }
  }
  else {
    echo $link1 . "\n";
  }

$next .= "&amp;start=$start&amp;num=100";
echo "\n###################################\n";
echo $next;
echo "\n###################################\n";
print_r($start);
$sql = "INSERT INTO `ft_search`.`LinkQueue` (`TimeStamp`, `Link`, `Host`) VALUES (CURRENT_TIMESTAMP, '$next', 'start=$start')";
@mysql_unbuffered_query($sql);

?>















