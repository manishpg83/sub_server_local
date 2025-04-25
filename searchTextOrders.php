<?

//header('Content-Type: text/plain; charset=utf-8');
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$search = $_POST['s'];
echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>AMX EMR</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style> </style>
<body>
<form action="searchTextOrders.php" method="post"><input type="text" name="s" value="$search"/><br><button>Submit</button></form>
<div id="total">total</div><div id="cnt">cnt</div><div id="ttime">ttime</div>
EOT;
$time = microtime();
$search = $_POST['s'];
$files = scandir('/home/amx/orders');
$cnt = 0;
$total = 0;
foreach ($files as $file) {                      
  if($file == '..' OR $file == '.' ){continue;}

$total++;
$text = str_replace("\n","<br>\n",file_get_contents("/home/amx/orders/$file"));
if (stripos($text,$search) !== false) {$cnt++;
      echo "<br>\n$context<br>\n$file<br>\n$text<br>\n-----------------------------------------\n";
	}
}
$time = (microtime() - $time)/$total * 1000 . ' µS';
echo "\n<br>Number files:  $total<br>Number found: $cnt<br>Time (µS): $time<br><br>";


echo <<<EOT
<script>
var total = $total;
console.log(total + " total=" + total);

</script>
EOT;

/*
console.log('t=' + total);
var cnt = $cnt;
var ttime = $time;
document.getElementById('total').innerHTML = $total;
document.getElementById('cnt').innerHTML = $cnt;
document.getElementById('ttime').innerHTML = $time;
console.log("Total=$total " + total + "cnt="cnt + "time=" + ttime);
*/


















?>