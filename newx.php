<?php
echo <<<EOT
<!DOCTYPE html>
<html><head><title>New AMX Portal</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="http://dev.amxemr.com/jquery.mobile-1.1.0.min.css" />
<style type="text/css" >
.mobile{width:90%;margin:0 auto 0;}
.tablet{width:80%;margin:0 auto 0;}
.desk{width:60%;margin:0 auto 0;}
.row1 {width:40%}
.row2 {width:30%}
.row3 {width:20%}
.center{text-align:center;margin:0 auto 0;}
.small {font-size:small;font-weight:400}
.max {max-width:400px;margin:0 auto 0}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>
<script type="text/javascript" src="http://dev.amxemr.com/jquery.mobile-1.1.0.min.js">
</script>
</head><body>
<div data-role="page"  data-theme="a" id="page1">
<div data-role="header" data-theme="a"  data-position="fixed">
<h2>Allermetrix<br>Authorized Users Only</h2>
<div>
<p class="center">
An Unauthorized Attempt to Access this Site is Violation of United States,  and International&nbsp;Law
</p>
</div>
</div>
<div data-role="content" data-theme="a"  class="desk">
<form  method="post"  action="http://dev.amxemr.com/enter.php" data-ajax="false">
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="id">
User ID
</label>
<input id="id" name="id" placeholder="" value="" type="text" />
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="pwh">
Unexposed Passcode
</label>
<input id="pwh" name="pwh" placeholder="" value="" type="password" />
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="pw">
Visible Passcode 
</label>
<input id="pw" name="pw" placeholder="" value="" type="text" />
</fieldset>
</div>

<div class="max">
<input type="submit" value="Login" />
</div>
</form>
<hr/>
<div>
<h1>HIPAA WARNING</h1>
<p>
Protected Health Information in this system is subject to Public Law 104-191,
the Health Insurance Portability and Accountability Act of 1996 and the
Final Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and 164
Information in this system may only be used and/or disclosed in strict conformance with these authorities.
</p><p>
Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to comply
with its policies and procedures.
</p></div></div>
<div data-role="footer" data-position="fixed"  data-theme="a"  >
<div class="mobile" ><p class="small">
</p></div>
</div>
</div>
</body>
</html>
EOT;
?>