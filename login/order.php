<?php
$today = date('Y-m-d');
echo <<<EOT
<!DOCTYPE html>
<html lang="en"><head><title>Request Form</title>
<style>
body{font-family:arial;border:0;padding:0;margin:0;}
#header{margin:10px 0px 10px 200px;}
#content{max-width:1024px;margin:0 auto 0 ;padding:20px;}
#col1,#col2,#col3{float:left;width:275px;}
#col2,#col3{margin-left:2em;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
.btn{margin:1em 0 0 2em;width: 200px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, #00f 0%, #004 100%);}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font-weight:bolder;color:#00515a;font-size:1em;margin-bottom:10px;}
.center{text-align:center;}
h1,h2,h3{text-align:center;color:#00515a;margin-bottom:0;}
h3{text-align:left;}
label{display:block;margin:0 0 0 0;font-size:1em;}
textarea{border-radius: 4px;font-family:Arial;width:100%;}
#comment{height:86px;}
input{padding:5px;font-size:1.1em;border-radius: 4px;}
.hide{display:none;}
.red{color:red;font:700 1.5em Arial;}
.big{font-size:1.3em;}
p{font-size:1.3em;}
.label{font-size:1em;margin: 10px 0 10px 0;}
.or{font-size:1em;margin: 10px 0 10px 1.9em;}


input[type="date"] {font:400 1em Arial, sans-serif;}
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
.note{font-size:.8em;margin:0px 0px 10px 0px;}

#hide{display:none;}
.textstyle0 {font-family:Arial Rounded MT Bold;font-weight:normal;font-style:normal;font-size:13px;text-decoration:none;color:#000000;}
.textstyle1 {font-family:Arial Rounded MT Bold;font-weight:bold;font-style:normal;font-size:13px;text-decoration:underline;color:#000000;}
.textstyle2 {display:block;font-family:Arial;font-weight:bold;font-style:italic;font-size:10px;text-decoration:none;color:#000000;}

</style></head><body>
<div id="header">
<img id="logo" src="logo.gif" alt="logo"/><p> </p>
</div>
<div id="content">
<form action="#" method="post">
<div id="col1">
<label>Patient Name<span class="red"> *</span>
<input  size="24" type="text" value="" name="first" required placeholder="First" />
<input  size="24" type="text" value="" name="last" required placeholder="Last"/>
</label><br>
<label>Patient Date of Birth<br>
<input size="24" type="date" value="" name="dob" /><span class="red"> *</span>
</label><br>
<label>Patient Gender<br>
<input class="bigger" type="radio" name="gender" value="1" /><span > Male </span>&emsp;
<input class="bigger" type="radio" name="gender" value="2" /><span > Female</span></label><br>
<br>
<label>Collection Date<br>
<input size="24" type="date" value="" name="collection" />
</label><br>
<label>Your Specimen ID
<input   size="24" type="text" value="" name="id" />
</label><br>
<div id="address" class="hide">
<label>Patient Address
  <input  size="24" type="text" value="" name="address1"  placeholder="Street" />
  <input  size="24" type="text" value="" name="address2"  placeholder="Apt, Ste" />
</label><br>
<label>Patient City, State, Zip
  <input  size="24" type="text" value="" name="city" placeholder="City"/><input  size="2" type="text" value="" name="state" placeholder="ST" /><input  size="4" type="text" value="" name="zip" placeholder="Zip"/>
  </label><br>
</div>


<br>
</div>

<div id="col2">
<label>Billing Information<span class="red"> *</span><br>
<input class="bigger" type="radio" name="medicare" value="5" onchange="ec(4);" required /><span > Client</span><br>
<input class="bigger" type="radio" name="medicare" value="3" onchange="ec(3);" /><span > Insurance </span><br>
<input class="bigger" type="radio" name="medicare" value="1" onchange="ec(1);" /><span > Medicare</span><br>
<input class="bigger" type="radio" name="medicare" value="2" onchange="ec(2);" /><span > Medicare through Insurance </span><br>
<input class="bigger" type="radio" name="medicare" value="1" onchange="ec(1);" /><span > Medicaid</span><br>
<input class="bigger" type="radio" name="medicare" value="4" onchange="ec(5);" /><span > Patient</span><br>
<input class="bigger" type="radio" name="medicare" value="6" onchange="ec(6);" /><span > Research / Eval</span></label>
<p><br><br><br></p>
<label>Comments
<textarea id="comment" name="comment" rows="5" cols="40"></textarea></label><p></p>
<button class="btn"> Select Tests </button>
</div>

<div id="col3">
<div id="medicare" class="hide"><p><br></p>
<p class="note">If you do not have the insurance info now, you may include a copy of the Medicare card (both sides) with the specimen.<br>
Or we can call your office to get the information.</p> 
  <label>Medicare ID</label>
  <input size="24" type="text" value="" name="MedicareID" />  
  <p class="or">Or</p>
  <input id="c1" class="bigger" type="radio" name="patient" value="1" /><span > Will be included with specimen</span><br>
  <input id="c2" class="bigger" type="radio" name="patient" value="2" /><span > Call office for insurance info</span><br>
</div>
<div id="mInsurance" class="hide"><p> </p>
<p class="note">If you do not have the insurance info now, you may include a copy of the insurance card (both sides) with the specimen.<br>
Or we can call your office to get the information.</p> 
  <label>Insurance Company</label>
  <input size="24" type="text" value="" name="mGroup" /><br>
  <label>Medicare ID</label>
  <input size="24" type="text" value="" name="mMemberID" />  
  <p class="or">Or</p>
  <input id="c4" class="bigger" type="radio" name="patient" value="4" /><span > Will be included with specimen</span><br>
  <input id="c5" class="bigger" type="radio" name="patient" value="5" /><span > Call office for insurance info</span><br>
</div>
<div id="insurance" class="hide"><p> </p>
<p class="note">If you do not have the patient or insurance info now, you may include a copy of the insurance card (both sides) with the specimen.<br>
Or we can call your office to get the information.</p> 
  <label>Insurance Company</label>
  <input size="24" type="text" value="" name="Group" /><br>
  <label>Member ID</label>
  <input size="24" type="text" value="" name="MemberID" /><br>
  <label>Insurance Payer ID</label>
  <input size="24" type="text" value="" name="PayerID" /><br>
<label>Patient Address
  <input  size="24" type="text" value="" name="address1"  placeholder="Street" />
  <input  size="24" type="text" value="" name="address2"  placeholder="Apt, Ste" />
</label><br>
<label>Patient City, State, Zip
  <input  size="24" type="text" value="" name="city" placeholder="City"/><input  size="2" type="text" value="" name="state" placeholder="ST" /><input  size="4" type="text" value="" name="zip" placeholder="Zip"/>
  </label><br>
  <p class="or">Or</p>
  <input id="c7" class="bigger" type="radio" name="patient" value="7" /><span > Will be included with specimen</span><br>
  <input id="c8" class="bigger" type="radio" name="patient" value="8" /><span > Call office for insurance info</span><br>
</div>
<div id="patient" class="hide"><p><br><br><br></p>
<p class="note">If you do not have the patient address or credit card now, you may include it with the specimen.<br>
Or we can call your office to get the information.</p> 
<label>Patient Address
  <input  size="24" type="text" value="" name="address1"  placeholder="Street" />
  <input  size="24" type="text" value="" name="address2"  placeholder="Apt, Ste" />
</label><br>
<label>Patient City, State, Zip
  <input  size="24" type="text" value="" name="city" placeholder="City"/><input  size="2" type="text" value="" name="state" placeholder="ST" /><input  size="4" type="text" value="" name="zip" placeholder="Zip"/>
  </label><br>




<input id="c10" class="bigger" type="radio" name="patient" value="10" /><span > Will be included with specimen</span><br>
<input id="c11" class="bigger" type="radio" name="patient" value="11" /><span > Call office for patient info</span><br>
</div>
</div>
<input type="hidden" name="client" value="$client" />
<input type="hidden" name="sub" value="41" />
</form>
</div>

<div id="footer"><img src="logo_web.gif"  alt="" width="197" height="60"><br>
<span class="textstyle2"> improving allergy outcomes</span>
<img src="CAP_Cert_Small_WEB_Color.gif"  alt="" width="107" height="60">
<div><br>
<span class="textstyle1"><a href="mailto:info@allermetrix.com?subject=Information%20Request">info@allermetrix.com<br></a></span>
<span class="textstyle0"> 
Tel 615-599-4100 * Fax 615-599-4648 * Toll Free 877-992-4100<br>$text
<br>
</span></div></div>


<script>
var col1 = document.getElementById("col1");
var medicare = document.getElementById("medicare");
var mInsurance = document.getElementById("mInsurance");
var insurance = document.getElementById("insurance");
var patient = document.getElementById("patient");
var c1 = document.getElementById("c1");
var c2 = document.getElementById("c2");
//var c3 = document.getElementById("c3");
var c4 = document.getElementById("c4");
var c5 = document.getElementById("c5");
//var c6 = document.getElementById("c6");
var c7 = document.getElementById("c7");
var c8 = document.getElementById("c8");
//var c9 = document.getElementById("c9");
var c10 = document.getElementById("c10");
var c11 = document.getElementById("c11");
var address = document.getElementById("e1");
function ec(type){
  medicare.style.display='none';
  mInsurance.style.display='none';
  insurance.style.display='none';
 
  patient.style.display='none';
  c1.checked = false;  
  c2.checked = false;  
//  c3.checked = false;  
  c4.checked = false;  
  c5.checked = false;  
//  c6.checked = false;  
  c7.checked = false;  
  c8.checked = false;  
//  c9.checked = false;  
  c10.checked = false;  
  c11.checked = false;  
  if (type == 1){
    medicare.style.display='inline-block';
  }
  else if(type == 2){
    mInsurance.style.display='inline-block';
  }
  else if(type == 3){
    insurance.style.display='inline-block';
  }
  else if(type == 5){
    patient.style.display='inline-block';
  }
}
</script>

</body></html>
EOT;
?>