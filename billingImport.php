<?php
header('content-type: text/plain');
$invoices = explode("\n",file_get_contents('/home/amx/Z/Invoices/invoices.txt'));
$link = mysqli_connect('localhost','allergy_allermetrix','Allergy5656','allergy_billing');
echo  mysqli_error($link); 

$sql = "TRUNCATE `allergy_billing`.`invoices`";
$result = mysqli_query($link,$sql);
$result = mysqli_query($link,"SELECT * FROM `invoices`");
$num_rows = mysqli_num_rows($result);
$cnt = array(0,0,0,0);
$adj[-1] = 3;
$adj[0] = 0;
$adj[1] = 1;
$adj[2] = 2;
$adj[3] = 3;
$date = filemtime('/home/amx/Z/Invoices/invoices.txt');
$days = floor((time() - $date) / 86400);
if($days > 0){echo "\n*************************************\nWARNING:  Data is from $days days ago.\n*************************************\n\n\n";}
echo "invoices.txt Timestamp: " . date ("D m-d-y  g:i a",$date)  . "\n\n";
$out = '';
foreach($invoices as $text){
  $first = substr($text,0,1);
  if($first == 'R' || $first == 'I'){$cnt[1]++;continue;}
  list($invoice,$amount,$zip) =  explode("\t",$text);
//  $invoice = intval($invoice);
  if($invoice < 9999){$cnt[1]++;continue;}
  $zip = intval($zip);
  $amount = floatval(str_replace('$','',$amount));
  $sql = "INSERT INTO `invoices` (`invoice`, `amount`, `zip`) VALUES ('$invoice',$amount,$zip)ON DUPLICATE KEY UPDATE `amount`=$amount, `zip`='$zip';";
  $result = mysqli_query($link,$sql);
  $err = mysqli_error($link);
//  echo "ERR:$err SQL:$sql";
  if(strlen($err) > 0){$cnt[3]++;}
  $rows = mysqli_affected_rows($link);
  $cnt[2]++;
  
//  if($result == -1){echo"ERROR: $invoice $zip $amount $result\n$sql\n";continue;}
  $zip = substr('00000' . $zip,-5);
  $amount = number_format($amount,2);
  $amount = substr('      ' . $amount,-6);
  $out .= "$invoice, $zip, $amount " . $err . "\n";
}
  $summary = 'Lines: ' . (count($invoices) - 2) . ", Errors: $cnt[3], Added: $cnt[2], Skipped $cnt[1]\n";
  if($cnt[1] > 19){$summary .= "\n*************************************\nWARNING: $cnt[1] Records from invoice.txt were skipped,\nFix how you make invoice.txt\n*************************************\n\n";}
  echo $summary . $out;
  
  $mailheaders = "From: billingImportr@amx.com <> \n";
  $mailheaders .= "Reply-To: DoNotReply@amx.com\n\n";
  $to = 'patrick.young@patrick-young.com';
  
file_put_contents('/home/amx/Z/Invoices/import.log',"$summary $out");
//mail($to,$summary, $out, $mailheaders, "-fmailer@amx.com");

?>