<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice</title>
<style> 
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#logo{margin:0 auto 0;}
#content{max-width:640px;margin:0 auto 0 ;padding:20px;}
#col1,#col2,#col3{float:left;width:300px;}
#col2,#col3{margin-left:2em;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
.btn{margin:1em 0 0 2em;width: 200px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font-weight:bolder;color:#00515a;font-size:1em;margin-bottom:10px;}
.center{text-align:center;}
h1,h2,h3{margin: 20px 0 0 0;}
h3{text-align:left;} 
label{margin-top:10px;font-size:1.3em;}
textarea{border-radius: 4px;font-family:Arial;}
#comment{height:86px;}
input{padding:5px;font-size:1.1em;border-radius: 4px;}
.hide{display:none;}
.red{color:red;font:700 1.5em Arial;}
.big{font-size:1.3em;}
#patient{margin: 0 0 0 200px;}
.label{font-size:1em;margin: 10px 0 10px 0;}
.or{font-size:1em;margin: 10px 0 10px 1.9em;}
input[type="radio"], input[type="checkbox"] {
    width: 1.3em;
    height: 1.3em;
    display: inline;
    margin: 1px;
    margin-left: 4px;
    vertical-align: middle;
    position: relative;
    background: #333;
    background-color: rgb(51, 51, 51);
    color: #eee;
}
.note{font-size:1em;margin-top:0;padding-top:0;}

#hide{display:none;}
.textstyle0 {font-family:Arial Rounded MT Bold;font-weight:normal;font-style:normal;font-size:13px;text-decoration:none;color:#000000;}
.textstyle1 {font-family:Arial Rounded MT Bold;font-weight:bold;font-style:normal;font-size:13px;text-decoration:underline;color:#000000;}
.textstyle2 {display:block;font-family:Arial;font-weight:bold;font-style:italic;font-size:10px;text-decoration:none;color:#000000;}
rt{background:#f00;color:#fff;}
#autofill{font-size:.8em}
#header{margin:0 auto 0;width:640px;}
p{line-height:1.5;font:400 1em Arial,sans-serif;}
</style></head><body>
<div id="header">
<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>
<p>We would NEVER discose ANY information you give here without your permission.</p>
<p>Your information will ONLY be posted to the secure account of the healthcare provider that gave you their Provider ID to enable you to use this site.</p>  
</p>
</div>
EOT;

if($match){
  $code='<input type="hidden" name="c" value="' . $c . '"/>';
  $alerts = array(true=>'',false=>'class="alert"',0=>'class="alert"',1=>'',2=>'');
  $dclass = $alerts[$dobOK];
  $sclass = $alerts[$stateOK];
  $lclass = $alerts[$lastOK];
}
else {
  if(strlen($c) > 0){$class='class="alert"';}
 // $code = '<br>Code: <input ' . $class . ' type="text" name="c" value="' . $c . '" />';
}
echo <<<EOT
<div id="content">

<form action="#" method="post">
<div id="patient">
<p>Fields with <span class="red" > *</span> are required.</p>
<br>Last <span id="autofill">(double click for auto fill.)</span>: <br><input $lclass type="text" name="last" value="$last"  required /><span class="red"> *</span>
<br>First: <br><input type="text" name="first" value="$first" required  /><span class="red"> *</span>
<br>DoB: <br><input $dclass $dobid type="date" name="dob" value="$strdob" required  /><span class="red"> *</span>
<br>Address: <br><input name="address" type="text" value="$address" /><br>
City: <br><input name="city" type="text" value="" /><br>
State: (2 character)<br><input $sclass name="state" type="text" value="$state" required  /><span class="red"> *</span>&#x2002;<br>
Zip: <br><input name="zip" type="text" value="$zip" /><br>
<p>&#x2003;<br>Enter Your Name, Date of Birth, and Address<br>
<p>Then Click Begin</p>
<input type="hidden" name="sub" value="12"/>
<input type="submit" value="Begin" class="btn" />
</div>
</form>
</div>
EOT;
?>