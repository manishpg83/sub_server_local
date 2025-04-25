<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#logo{margin:0 auto 0;}
#content{max-width:640px;margin:0 auto 0 ;padding:20px;}
#col1,#col2,#col3{float:left;width:300px;}
#col2,#col3{margin-left:2em;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
.btn{margin:0;width: 400px;padding:10px 2em 10px 0;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font-weight:bolder;color:#00515a;font-size:1em;margin-bottom:10px;}
.center{text-align:center;}
h1,h2,h3{margin: 20px 0 0 5px;text-align:center;}
label{margin-top:10px;font-size:1.3em;}
textarea{border-radius: 4px;font-family:Arial;}
#comment{height:86px;}
input{padding:5px;font-size:1.1em;border-radius: 4px;}
.hide{display:none;}
.red{color:red;font:700 1.5em Arial;}
.big{font-size:1.3em;}
#patient{margin: 0 0 0 100px;}
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
#pID{font-style:italic;}
p{line-height:1.5;}
#providerId{font-weight:700;}
#eimages{width:480px;padding:0;margin:0 auto 0;}
</style></head> 

<body>
<div id="header">
<img src="allermetrix_E-office600.jpg" width="600" height="65" alt="Allermetrix eOffice" /><br>
<p>Your general allergy clinical history and dietary food selections will be analyzed by Allermetrix statistical software. Your doctor will review the summary, along with your clinical symptoms, and then choose the appropriate tests to be conducted.</p>
<p>The <span id="pID">Provider ID</span> is given to allergy patients by their health care provider.</p>
<p>As you progress, your information is stored in HIPAA compliant storage for the healthcare provider associated with the Provider ID.</p>
<p>The procedure has two quick and simple steps.<br>
&bull; Allergy Symptoms.  All you do is click the check boxes that apply to you.<br>
&bull; Foods.  Which foods you eat often? "Often" means three or more times per week.</p>
<p>This analysis was developed by two of the top allergy scientists.<br>
The analysis is based on science, peer reviewed studies published in reputable medical journals. 
</div>

<div id="content">
<form action="./" method="post">
<div id="patient">

<br><span id="providerId">Provider ID:</span> <br><input $lclass type="text" name="code" value="$code" required />

<p>Then Click Begin</p>
<input type="hidden" name="sub" value="11"/>
<button class="btn">Begin</button>
</div>
</form>





</div>
EOT;
?>