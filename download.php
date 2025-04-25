<?php

echo <<<EOT
<!DOCTYPE html>
<html lang="en">
<head><title>Download PDF</title>
<style></style></head><body>
<iframe id='abnG' src="./pdfdl.php" height="200" width="300" onload="dlpdf()"></iframe>
<script>
function dlpdf(){
  document.getElementById('abnG').contentWindow.download();
}
</script>
</body></html>
EOT;


?>