<?

header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>AMX EMR</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style> </style>
<body>
<form action="searchTextOrders.php" method="post"><input type="text" name="s" /><br><button>Submit</button></form>

EOT;
?>