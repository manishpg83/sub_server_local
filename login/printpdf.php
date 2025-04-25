<?php



echo <<<EOT
<!doctype html>
<html lang="en-US">
<head><style>.hide{display:none;}</style>
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width">
<title>Print PDF</title>

<div class="hide">
<iframe id='abnG' src="http://dev.amxemr.com/login/abnG.pdf" height="200" width="300"></iframe>

<iframe id='abnE' src="http://dev.amxemr.com/login/abnE.pdf" height="200" width="300"></iframe>
</div>


<script>

</script>
</head><body>
<button onclick="document.getElementById('abnG').contentWindow.print()">Print IgG ABN PDF</button>
<button onclick="document.getElementById('abnG').contentWindow.print()">Print IgE ABN PDF</button>

</body>
</html>

EOT;
















?>