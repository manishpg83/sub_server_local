<?
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice</title></head><body>

EOT;
$file = '244148e.PDF';
$data = file_get_contents($file);
$base64 =  base64_encode($data);
echo '';
echo '<embed type="application/pdf" width="800" height="1200" src="data:application/pdf;base64,' . $base64 . '" />';
$data = base64_decode($base64);
file_put_contents('test.pdf',$data);

?>
