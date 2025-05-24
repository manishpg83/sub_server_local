<?php
$sub = intval($_POST['sub']);
$id = intval($_POST['id']);
if($sub == 30){
  header("Location: https://dev.amxemr.com/requestForm.php?id=$id&sub=4");
}
if($sub == 14){
  header("Location: https://dev.allermetrix.com/patient.html");
}
?>