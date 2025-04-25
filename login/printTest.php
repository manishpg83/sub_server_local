<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$alpha = intval($_POST['Alpha']);
$tab = 5;
$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
$t = microtime(1);
$clients = array(200014,200005,200229,200225,200006,500251);
$client = intval($_POST['client']);
if($client < 100000){$client = $clients[rand(0,5)];}
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Panels</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
</style>
</head><body><div id="page">



<button onclick="window.print()">Print</button>


<h2>Test Print</h2>










EOT;














echo <<<EOT
</div>
<script>
window.onafterprint = (event) => {
  console.log('On After print');
};
window.addEventListener('afterprint', (event) => {
  console.log('After print');
});
</script>
</body></html>

EOT;
?>





