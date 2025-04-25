<?php
unset($_COOKIE["amxc"]);
unset($_COOKIE["amxc"]);

$hipaa = <<<EOH
<h1>HIPAA WARNING</h1><p>Protected Health Information in this system is subject to Public Law 104-191,the Health Insurance Portability and Accountability Act of 1996 and theFinal Privacy Rule and Final Security Rule codified in 45 C.F.R. § 160 and 164Information in this system may only be used and/or disclosed in strict conformance with these authorities.</p><p>Allermetrix is required to, and will apply, appropriate sanctions against individuals who fail to complywith its policies and procedures.</p></div></div>
EOH;
$hipaaEs = <<<EOH
<h1>ADVERTENCIA HIPAA</h1><p>La informaci&oacute;n de salud protegida en este sistema est&aacute; sujeta a la Ley P&uacute;blica 104-191, la Ley de Portabilidad y Responsabilidad de Seguros de Salud de 1996 y la Regla de Privacidad Final y la Regla de Seguridad Final codificadas en 45 C.F.R.  160 y 164 La informaci&oacute;n en este sistema solo puede ser usada y / o divulgada en estricta conformidad con estas autoridades.</p><p>Allermetrix debe, y aplicar&aacute;, sanciones apropiadas contra las personas que no cumplan con sus pol&iacute;ticas y procedimientos.</p></div></div>
EOH;

echo <<<EOT
<!DOCTYPE html>
<html><head><title>Allermetrix Client Portal</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="jquery.mobile-1.1.0.min.css" />
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
.red{color:#ff0;font:700 .9em Arial,sans-serif;}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js">
</script>
<script type="text/javascript" src="jquery.mobile-1.1.0.min.js">
</script>
</head><body>
<div data-role="page"  data-theme="a" id="page1">
<div data-role="header" data-theme="a"  data-position="fixed">
<h2>Allermetrix<br>Authorized Users Only<br/>Solo usuarios autorizados</h2>
<div>
<p class="center">
An Unauthorized Attempt to Access this Site is Violation of United States and International&nbsp;Law<br>Un intento no autorizado de acceder a este sitio web es una violaci&oacute;n de los Estados Unidos y del derecho internacional
</p>
</div>
</div>
<div data-role="content" data-theme="a"  class="desk">
<form id="frm" name="frm" method="post"  action="enter.php" data-ajax="false">
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="id">
User ID<br/>ID de usuario
</label>
<input id="id" name="id" placeholder="" value="" type="text" onchange="changed()" /><span class="red"> &#x2731; Required</span>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="pwh">
<span id="up">Unexposed Passcode</span>
</label>
<input id="pwh" name="pwh" placeholder="" value="" type="password" />
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<label for="pw">
<span id="vp">Visible Passcode</span> 
</label>
<input id="pw" name="pw" placeholder="" value="" type="text" />
</fieldset>

<div class="max">
<input id="li" type="submit" value="Login / Iniciar sesi&oacute;n"  />
</div>
</form>
<hr/>
<div id="hipaa">
$hipaa

<div data-role="footer" data-position="fixed"  data-theme="a"  >
<div class="mobile" ><p class="small">
</p></div>
</div>
</div>
<script type="text/javascript">
//<![CDATA[
var id = document.getElementById('id');
var vp = document.getElementById('vp');
var up = document.getElementById('up');
var frm = document.getElementById('frm');
var li = document.getElementById('li');
var hipaa = document.getElementById('hipaa');
function changed(){
  var idvalue = id.value;
  idvalue = idvalue.trim();
  if (idvalue.substring(0,1) == '1'){
    vp.innerHTML = 'C&oacute;digo de acceso visible';
    up.innerHTML = 'C&oacute;digo de acceso no expuesto';
	hipaa.innerHTML = '$hipaaEs';
	frm.action = 'enter.php';
  }
else{
    vp.innerHTML = 'Visible Passcode';
    up.innerHTML = 'Unexposed Passcode';
    hipaa.innerHTML = '$hipaa';
	frm.action = 'enter.php';
  }
}
window.onload = changed;
//]]>
</script>
</body>
</html>
EOT;
?>