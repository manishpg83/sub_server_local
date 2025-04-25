<?php
$sub = intval($_POST['sub']);
$id = intval($_POST['id']);
if($sub == 14){
  header("Location: https://amxemr.com/requestForm.php?id=$id&sub=4");
}
else{
  header("Location: http://allermetrix.com/patient.html");
}
?>