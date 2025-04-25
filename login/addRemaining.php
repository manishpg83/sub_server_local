<?
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');

header('Content-Type: text/plain; charset=utf-8');
$text = file_get_contents("/home/amx/update/patient.txt");
$lines = explode("\r\n",$text);
foreach($lines as $line){
  list($patient,,$remaining,  ) = explode('|',$line);
  if($patient < 100000){continue;}
 // if($remaining * 10 < 2){$remaining = 0;}
  $sql = "UPDATE `Patient` SET `Remaining`= $remaining WHERE `Patient`=$patient";
  $result = mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){$err1++;}
   echo "$result $sql $err1\n";
}
echo $err1;
?>