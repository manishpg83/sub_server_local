<?php
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$t = microtime(1);
$ndx = 0;
$recs = 0;

mysqli_query($link,"TRUNCATE `amx_portal`.`physicians`");
$data = explode("\r\n",file_get_contents('/home/amx/update/updatephysicians.txt'));
foreach($data as $line){
  list($client,$physician,$npi,$degree,$first,$last) = explode('|',$line);
  
 // $physician = str_replace("'",' ',$physican);
  $last = str_replace("'",' ',$last);
  $first = str_replace("'",' ',$first);
  $physician = mysqli_real_escape_string($link,$physician);
  $last = mysqli_real_escape_string($link,$last);
  $first = mysqli_real_escape_string($link,$first);
  $sql = "INSERT INTO `physicians`(`rec`, `client`, `physician`, `npi`, `degree`, `first`, `last`) VALUES (NULL,'$client','$physician','$npi','$degree','$first','$last')";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){$err1++;}
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
 // echo "$sql\n"; break;
}



echo "Physicians Errors: $err1<br>\n";















$err1 = 0;
$data = explode("\r\n",file_get_contents('/home/amx/update/updateclient.txt'));

foreach($data as $line){
  
  list($Number, $Name, $Address, $City, $State, $PostalCode, $Contact, $Phone, $Email, $Fax, $Diet) = explode('|',$line);
  $Email = mysqli_real_escape_string($link,$Email);
  $Name = mysqli_real_escape_string($link,$Name);
  $Contact = mysqli_real_escape_string($link,$Contact);
  $Address = mysqli_real_escape_string($link,$Address);
  $City = mysqli_real_escape_string($link,$City);
  
  $sql = "INSERT INTO `Client`(`Number`,`Name`,`Address`,`City`,`State`,`PostalCode`,`Contact`,`Phone`,`Email`,`Fax`,`Diet`) VALUES('$Number', '$Name', '$Address', '$City', '$State', '$PostalCode', '$Contact', '$Phone', '$Email', '$Fax', '$Diet')ON DUPLICATE KEY UPDATE  `Name`='$Name', `Address`='$Address', `City`='$City', `State`='$State', `PostalCode`='$PostalCode', `Contact`='$Contact', `Phone`='$Phone', `Email`='$Email', `Fax`='$Fax', `Diet`='$Diet'";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
//  echo "$sql\n"; exit;
}



$data = explode("\r\n",file_get_contents('/home/amx/update/updatepatient.txt'));
$patients = 0;
foreach($data as $key => $line){
  list($Patient, $Status, $Date, $Client, $Last, $First, $DoB, $Sex, $ClientID, $address, $address2, $city, $state, $zip, $phone, $email, $physician, $NPI, $Volume, $Billing, $Collection, $Guarantor, $PlanName, $PlanID, $MemberID, $DiagCode1, $DiagCode2, $DiagCode3) = explode('|',$line);
  $Last = mysqli_real_escape_string($link,$Last);
  $First = mysqli_real_escape_string($link,$First);
  if(strlen(trim($Patient)) != 6){continue;}
//  echo "$Patient, $Status, $Date, $Client, $Last, $First, $DoB, $Sex, $ClientID, $address, $address2, $city, $state, $zip, $phone, $email, $physician, $NPI, $Volume, $Volume, $Collection, $Guarantor, $PlanName, $PlanID, $MemberID, $DiagCode1, $DiagCode2, $DiagCode3<br>";
//  echo "<tr><td>$Patient</td><td>$Status</td><td>$Date</td><td>$Client</td><td>$Last</td><td>$First</td><td>$DoB</td><td>$Sex</td><td>$ClientID</td><td>$address</td><td>$address2</td><td>$city</td><td>$state</td><td>$zip</td><td>$phone</td><td>$email</td><td>$physician</td><td>$NPI</td><td>$Volume</td><td>$Billing</td><td>$Collection</td><td>$Guarantor</td><td>$PlanName</td><td>$PlanID</td><td>$MemberID</td><td>$DiagCode1</td><td>$DiagCode2</td><td>$DiagCode3</td></tr>\n";
  $zip = intval($zip);
  $phone = intval($phone);
  $sql = "INSERT INTO `Patient`(`rec`, `Patient`, `Status`, `Date`, `Client`, `Last`, `First`, `DoB`, `Sex`, `ClientID`, `Updated`, `address`, `address2`, `city`, `state`, `zip`, `phone`, `email`, `physician`, `NPI`, `Volume`,`Billing`, `Collection`, `Guarantor`, `PlanName`, `PlanID`, `MemberID`, `DiagCode1`, `DiagCode2`, `DiagCode3`) VALUES(NULL,'$Patient', '$Status', '$Date', '$Client', '$Last', '$First', '$DoB', '$Sex', '$ClientID', CURRENT_TIMESTAMP, '$address', '$address2', '$city', '$state', '$zip', '$phone', '$email', '$physician', '$NPI', '$Volume','$Billing', '$Collection', '$Guarantor', '$PlanName', '$PlanID', '$MemberID', '$DiagCode1', '$DiagCode2', '$DiagCode3') ON DUPLICATE KEY UPDATE  `Status` = '$Status',`Client`=$Client, `Last` = '$Last', `First` = '$First', `DoB` = '$DoB', `Sex` = '$Sex', `ClientID` = '$ClientID', `address` = '$address', `address2` = '$address2', `city` = '$city', `state` = '$state', `zip` = '$zip', `phone` = '$phone', `email` = '$email', `physician` = '$physician', `NPI` = '$NPI', `Volume` = '$Volume',`Billing`='$Billing', `Collection` = '$Collection', `Guarantor` = '$Guarantor', `PlanName` = '$PlanName', `PlanID` = '$PlanID', `MemberID` = '$MemberID', `DiagCode1` = '$DiagCode1', `DiagCode2` = '$DiagCode2', `DiagCode3` = '$DiagCode3';";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}

  $patients++;
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
}
unset($data);
 
$tests = 0;
$fp = @fopen("/home/amx/update/updatetest.txt", "r");
while (($line = fgets($fp, 4096)) !== false) {
  list($Client, $Patient, $Status, $Code, $Type, $Conc, $Score) = explode('|',$line);
 // echo "$Client, $Patient, $Status, $Code, $Type, $Conc, $Score<br>";
  if(strlen(trim($Code)) != 4){continue;}
  $sql = "INSERT INTO `Test` (`Client`, `Patient`, `Status`, `Code`, `Type`, `Conc`, `Score`, `Attributes`, `Exclude`) VALUES ('$Client', '$Patient', '$Status', '$Code', '$Type', '$Conc', '$Score',0,0) ON DUPLICATE KEY UPDATE `Client`=$Client, `Status` = '$Status', `Conc` = '$Conc', `Score` = '$Score'";
  mysqli_query($link,$sql);
  if(mysqli_errno($link) > 0){echo mysqli_error($link) . "  <br>$sql<br>\n";$err1++; if($err1>10){exit;}}

  $tests++;
  if($ndx++ == 1000){$recs += 1000;echo "$recs<br>\n";ob_flush();$ndx = 0;}
}
//unlink('/home/amx/update/updatetest.txt');
//unlink('/home/amx/update/updatepatient.txt');


$message = "Patients: $patients, Tests: $tests, Time: " . number_format(microtime(1) - $t,3);
$update = false;


include('/home/amx/Z/movePDF.php');
include('/home/amx/public_html/disk.php');



exit;

?>