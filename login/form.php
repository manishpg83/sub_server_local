<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=120');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title> Form</title>
<style type="text/css">
</style</head><body>
EOT;
ob_flush();
flush();
$sql = "SELECT  `Date`,`Last`,`First`,`DoB`,`address`,`city`,`state`,`zip`,`phone`,`email` FROM `customer` WHERE `id` = $id";
$results = mysqli_query($link,$sql);
list($id,$date,$last,$first,$dob,$address,$city,$state,$zip,$phone,$email) = mysqli_fetch_array($results, MYSQLI_NUM);
echo <<<EOT
<form action="./" method="post">
<br>Last: <br><input type="text" name="last" value="$last"  required />
<br>First: <br><input type="text" name="first" value="$first" required  />
<br>DoB: <br><input type="date" name="dob" value="$dob" required  />

<br><br><div id="add">Address is needed for Insurance<br>and Patient Pay</div>
<br>Address: <br><input name="Address" type="text" value="$address" /><br>
City: <br><input name="city" type="text" value="$city" /><br>
State: (2 character)<br><input name="state" type="text" value="$state" /><br>
Zip: <br><input name="zip" type="text" value="$zip" /><br>
</form>
</body></html>
EOT;
ob_end_flush();
?>