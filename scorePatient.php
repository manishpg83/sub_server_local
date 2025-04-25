<?
ob_start("ob_gzhandler");
header('Content-Type: text/plain; charset=UTF-8');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

$ranges[1] = array('0' => '<0.04', '0/1' => '0.4', '1' => '0.05-0.19', '2' => '0.20-0.79','3' => '0.80-2.69','4' => '2.70-13.99','5' => '14.00-24.99','6' => '25+','na'=> '');
$ranges[2] = array('0' => '<1.00-3.99', '0/1' => '4.00-4.99', '1' => '5.00-8.74', '2' => '8.75-15.56','3' => '15.57-27.49','4' => '27.50-47.94','5' => '47.95-85.44','6' => '150+');
$ranges[3] = array('0' => '<0.73-1.59', '0/1' => '1.60-1.79', '1' => '1.80-2.92', '2' => '2.93-5.44','3' => '5.45-10.48','4' => '10.49-20.56','5' => '20.57-40.72','6' => '40.73+');

$patient = 300007;

$sql = "SELECT `Code`,`Type`,`Conc`,`Score` FROM `Test` WHERE `Patient`=$patient";
$results = mysqli_query($link,$sql);
while (list($Code,$Type) = mysqli_fetch_array($results, MYSQLI_NUM)) {
  $score = array_rand($ranges[$Type], 1);
  echo $score;
  echo "$Code, $Type\n";
}






?>