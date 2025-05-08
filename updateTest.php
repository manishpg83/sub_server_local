<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width" />
<title>amx Update</title>
<style>body{font-size:.9em;margin-left:.7em;font-weight:400;background:#333;color:#fff} p{padding:0;margin:0;}.green{color:#0f0;}.red{color:#f00}.sm{font-size:.6em;color:#000}.bold{font-weight:700;}
.big{font-size:1.5em;}
.i{color:#f80;margin-left:.7em;font-size:1em;}
.w{color:#0f9;margin-left:.7em;font-size:1em;}
.v{color:#ff0;margin-left:.7em;font-size:1em;}
.c{color:#3bf;margin-left:.7em;font-weight:400;font-size:1em;}
.O{color:#FFF;margin-left:1em;font-family:Times,serif;font-size:1em;}
.times{font-family:Times,serif;}
.norm{font-weight:400;}
.inline{display:inline;}
#pdf{display:none;}
.link{display:inline;font-weight:700;background:#49f;text-align:center;padding:2px;border:0;margin:4px;}
.link:hover{background:#f00;color:#fff;}

h3{font:1em bold arial;margin:0;padding:0}
.err{font:1em bold arial,sans-serif; color:#f00;margin-bottom:0;padding:0;}
.warn{font:1em bold optima,arial; color:#ff0;margin-bottom:0;padding:0;}
.red{color:#f00;}
.yellow{color:#ff0;}
pre {margin-top:0;}
</style>
<body><pre><div id="page">
<?php
$fp = fopen("/home/amx/Z/buData/updateTest.sql","r");
$fpe = fopen("error.txt","a");
if ($fp ) {
  $dbc=mysqli_connect('localhost','amx_allermetrix','allermetrix510');
  mysqli_select_db($dbc, 'amx_portal');
  $error = mysqli_error($dbc);
  $sql = "SET time_zone = '-5:00';";
  @mysqli_query($dbc,$sql);
  echo mysqli_error($dbc);
  while (($text= fgets($fp , 4096)) !== false) {
    $sql = $text;
    $results = @mysqli_query($dbc,$sql);
    $error = mysqli_error($dbc); 
    if (strlen($error) > 0 ){
      if (substr($text,0,1) == 'I') {
        $insert = true;
        echo "<pre class=\"yellow\">No Ins: $text</pre>\n";
        $error = '';
      }
      else {
        $insert = false;
        $recErrors ++;
        print "</pre>\n<h3 class=\"err\"> Error: $error </h3><pre>";
        echo "<pre class=\"red\">$text</pre>";
        fwrite($fpe,$txt);
        $error = mysqli_error($dbc); 
        if (strlen($error) > 0){
        }
      }
    }  // end if error
    elseif (substr($text,0,1) == 'U') {  // no error on update
      if (mysqli_affected_rows($dbc) == 1) {
         $recUpdate++;
      }
      else {
        if ($insert) {
          print "</pre>\n<h3 class=\"err\">add updates: ERROR: No Add or Update </h3><pre>";
          echo "<pre class=\"red\">$text</pre>\n";
          $recErrors++;
        }
        else {
          print "</pre>\n<h3 class=\"warn\">add updates: WARNING: Record Not Updated </h3><pre>";
          echo "<pre class=\"yellow\">$text</pre>\n";
        }
      }
      $insert = false;
    }
    elseif (substr($text,0,1) == 'I') {
     echo "<pre>$text</pre>\n";
      $recAdded++;
      
    }
    else {
      print "</pre>\n<h3 class=\"err\">add updates: ERROR: Invalid Character: " . substr($text,0,1) . "</h3><pre>\n";
      echo "<pre class=\"red\">$text</pre>\n";
      $insert = false;
    }
  }
 if (!feof($fp )) {
    echo "Error: unexpected fgets() fail\n";
  }
  fclose($fp );
}
fclose($fpe );
?>
</body></html>