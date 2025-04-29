<?php
ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$dbc=mysql_connect('localhost','amx',$data);
mysql_select_db('amx_portal');
$id = intval($_POST['id']);
//if($id == 0){$id = intval($_COOKIE['amxc']);}
//if($id == 0){$id = intval($_COOKIE['amxp']);}
//setcookie("amxc", $id,time()+86400,'/');
$rec = intval($_POST['rec']);
$genders = array('Not Given','Male','Female');
$gender = $genders[intval($_POST['gender'])];
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
$billing = intval($_POST['billing']);
$last = $_POST['last'];
$first = $_POST['first'];
$strdob = $_POST['dob'];
$icd = $_POST['icd'];
$physician = $_POST['physician'];
$date = strtotime($_POST['collect']);
if($date == 0){
  $collect = '';
}
else{
  $collect = date('m/d/Y',$date);
}
$specimen = $_POST['specimen'];
//if (strlen($specimen) < 1){$specimen = substr($first,0,1) . substr($last,0,1) . date('mdy',strtotime($strdob));}
$billingType = array('','Client','Medicare','Medicaid','Patient','Insurance');
$billingCheck = $billingType[$billing];


echo <<<EOT
<!DOCTYPE html><html lang="en">
<head>
<title>Print Request Form</title>
<style>
body{width:100%;font:700 1em Arial,sans-serif;margin:0;background:#fff;color:#000;padding:0;background:#6cc; }
#page{max-width:1990px;margin:0 auto;padding:0;border:0;background:#144;}
body,#page{width:768px;background:#fff;}
pre{color:#ff0;}
#end,#s888{float:none;color:#144;}
#summary{display:block;}
.box {border: 1px solid #000;margin:0 0 0 0;padding:4px .25em 0 .25em;}
.verbage{border: 1px solid #000;padding:.1em .5em .1em .5em;margin:.2em 0 .2em;font:400 1em/1 Arial,sans-serif;}
.text{padding:2px 6px;margin-bottom:2px;font:400 1em/1 Arial,sans-serif;}
.text1{padding:2px 6px;margin-bottom:2px;font:400 1em Arial,sans-serif;}
.red{color:#f00;}
.warn{padding:.2em;margin:6em 0 .2em 0;font:700 1em Arial,sans-serif;color:#f00;}
.hf{font:400 1em/1.1 Arial,sans-serif;}
.pgHdr,.hd{font-size:1em;font-weight:400;padding:2px 0 2px 1px; margin:0 0 1px 0;}
.hd{color:#fff;background:#000;}
.pgHdr{display:inline-block;}
.pgNumber{text-align:right;display:inline-block;}
.right{display:inline-block;text-align:right;}
.divide{width:75%;margin:2px 0 4px 12%;padding:0;}
.pozBox{width:48em;padding:1em;margin:1em;}
.pozCheck{width:50em;padding:0 .3em 0;margin:0 0 1px 0;border:1px groove #eee;}
.pozComponent{width:48em;padding:0 .3em 0 2em;margin:0 0 1px 0;border:1px groove #eee;color:#fff;background:#043234;}
.code{width:6em;display:inline-block;}
.score{width:3em;display:inline-block;text-align:center;font-weight:700;}
#bg,fieldset{background:#6cc;}
#bg{padding:1em;}
input[type="number"]{width:2em;}
legend{font:700 1em Arial,sans-serif;}
h1,h2,h3{text-align:left;margin:20px 0 0 0;}
#hd,.noPrint{max-width:60em;margin:0 auto 0;}
.pgBrkB4,.pgBrk {display:none;}

@media print{
.pgBrkB4 {page-break-before:always;display:block;margin:3em 0 0;}
.pgBrk {page-break-after:always;display:block;padding:100px 0 0 0;}
.noPrint{display:block;}
#nav{display:none;}
#i1,#i2,#i3,#i4,#i5,#i6{display:none;}
}
.emp{font:700 1em/1 Arial,sans-serif;}
.inline,form{display:inline;}
.right{text-align:right;}
.center{text-align:center;margin:0 auto;}
.left,.selected{text-align:left;}
.selected{color:#0f0;}
.break{clear:both;}
.widthWide{width:18em;padding-top:0;}
.widthInside{width:24em;padding-top:2em;}
.pozIcon{display:inline-block;width:2em;font-weight:700;}
.pg,.title{font-weight:700;font-size:1em;color:#fff;background:#000;padding:2px;}
.pg,.title{margin:2px 0 2px 0;}
.hidden{font-weight:700;}
.bold{font-weight:700;}
table{padding:0;margin:0;}
td,tr{padding:0;margin:0;}
#cover{text-align:center;font-size:2em;padding-top:2em;}
#name{text-align:left;margin:3em 0 5em 7em;}
.btn,.link,.go{width:100%;padding:0;margin:.7em 0 0 0;border-radius: 3px 3px 3px 3px;font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;}
.link{border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.go{border:1px solid #f00;color: #fff;
background-image: -o-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -moz-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -webkit-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: -ms-linear-gradient(bottom, #fc6 0%, #f60 100%);
background-image: linear-gradient(to bottom, #fc6 0%, #f60 100%);}
.btn{border:1px solid #2985EA;color: #fff;background-color:#2985EA;
background-image: -o-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -moz-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -webkit-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: -ms-linear-gradient(bottom, #2ef 0%, #02f 100%);
background-image: linear-gradient(to bottom, #2ef 0%, #02f 100%);}
.expand,#bs{display:block;font-weight:700;margin:0 0 .5em;padding:.5em;text-align:left;}
#post{width:480px;margin:0 auto;background:#144;}
#warn{width:450px;background:#111;color:#fff;padding:1em;border-style:groove;margin:1em auto;}
.cHeader{font:700 1em Arial,sans-serif;padding:.5em .5em .5em 2em;color:#fff;background:#2985EA;margin-top:1em;}
.dchk,.dchk3,.dchk4{font:700 .8em Arial,sans-serif;color:#fff;display:inline-block;padding:2px 0 2px 2px;margin:0 0 .5em;vertical-align: middle;position: relative;max-width:14em;}
.dchk{width:100%}
.dchk3{width:31.7%;display:inline-block;}
.dchk4{width:23.5%;display:inline-block;}
.chk{color:#fff;display:inline;padding:6px 0 6px 6px;margin-bottom:6px;outline:2px solid #000;}
.dchk,.dchk3,.dchk4,.chk,.component{background:#2985EA;text-align:left;position:relative;}
pre{padding:0;margin:0;color:#333;}
input[type="radio"],input[type="checkbox"]{opacity:1;width:2em;height:2em;border:2px solid #eee;outline:2px solid #eee;display: inline;margin:1px;margin:4px 0 4px 4px;vertical-align: middle;position: relative;color:#eee;   display: inline;vertical-align: middle;position: relative;}   
input[type="text"]{font:700 1em Arial,sans-serif;}
.hit{color:#f00;}
.grp{float:left;padding:.1em;width:19em;}
.fchk{position:relative;text-align:left;background:#2985EA;padding:0;margin:.1em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
.pchk{text-align:left;background:#2985EA;width:90%;padding:0;margin:.1em 0;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;;}
.pnumber{width:3em;display:inline-block;}
.descE,.descG4{font-size:.9em;width:12em;display:inline-block;font-weight:700;padding:.3em 0;margin-right:.4em;}
.col{width:480px;margin:0;border:0;float:left;}
.columns2{margin:0 0 .3em .3em;padding-top:1em;-webkit-column-count: 2;-moz-column-count: 2;-ms-column-count: 2;-o-column-count: 2;column-count: 2;}
p{font:700 .9em Arial,sans-serif;}
.msg{font:400 1.2em/1.4 "New Times",times,serif;margin:.4em 0 0;}
.half,.halfg4{font:700 1em Arial,sans-serif;text-align:center;color:#ff0;display:inline-block;width:48%;}
.halfg4{color:#0ff;}
.pige,.pigg4,.total,.nototal{font:700 .8em Arial,sans-serif;text-align:center;width:2em;height:1.5em;display:inline-block;margin:0 .2em .3em 0;padding:.3em 0 0 0;}
.legend{padding-left:13em;display:inline-block;font-wight:700;}
.row{padding:0;margin:0;}
.both{background-color:#fff;}
.igg4{background-color:#fff;}
.ige{background-color:#fff;}
.panel{background:#5dade2 ;color:#000;padding:0.5em;width:250px;font-weight:700;}
img{vertical-align: top;}
.both,.ige,.igg4,{vertical-align: top;display:inline-block;font-weight:700;margin:0;border:1px solid #144;text-align:left;width:70%;}
.types{float:right;display:inline-block;width:6em;}
.plus{ vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJEAAPZIAPv+/AAxAGUAdywAAAAADAAMAAACFISPqZsRDNxb8jh78atNTsVB4igWADs=');}
.downarrow{margin:3px 0 0 .2em;color:#fff;background-color:#000;padding:0;vertical-align:top;border:2px outset #fff;display:inline-block;width:25px;height:25px;background-image: url('arrow-down.svg');}
.tblankx{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background:#ccc;}
.tblanky{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AOQAE////wAxAGUAdywAAAAADAAMAAACFISPqQsRbBxsT7l7EcZLQs+A05gUADs=');}
.tblank{margin:0 1em;vertical-align: text-top;margin:0;display:inline-block;width:12px;height:12px;border:0;border:1px solid #fff;background-image: url('data:image/gif;base64,R0lGODlhDAAMAJH/AABuAP///wAxAGUAdywAAAAADAAMAAACDoSPqcvtG6KMaM6Hs8YFADs=');}
#patient{padding:1em;}
.nototal{background:#00f;color:#00f;}
.halfhead{width:13.25em;display:inline-block;position:relative;margin:.4em 0 ;color:#fff;display:inline-block;font:700 1em Arial,sans-serif;}
hr{background:#fff;color:#fff;border-color:#fff;}
legend{margin-top:.4em;}
#tests{width:60%;margin:0 auto;}
#form{display:inline-block;position:absolute;top:0;left:190px;}
#leftcolumn{padding:1em 0 0 1em;width:190px;height:270px;display:inline-block;}
#ins{padding: 0 0 0 1em;margin-left:1em;display:none;margin:0;}
legend{display:inline-block;}
.hide{display:none;}
.link,#specimen{width:8em;}
.name{width:8em;}
.date{width:8em;}
#inscard{color:#f00;text-align:center;}
#physician,#icd{width:30em;display:inline-block;}
.label{width:10em;text-align:right;padding-right:3px;display:inline-block;}
.E{margin:0 0 3px 0;padding:0 0 3px 0;height:16px;width:20px;text-align:center;background:#fff;color:#000;font-weight:700;display:inline-block;border: solid #f00;}
.G4{margin:0 0 3px 0;padding:0 0 3px 0;height:16px;width:20px;text-align:center;background:#fff;color:#000;font-weight:700;display:inline-block;border: solid #00b;}
.G{margin:0 0 3px 0;padding:0 0 3px 0;height:16px;width:20px;text-align:center;background:#fff;color:#000;font-weight:700;display:inline-block;border: solid #ff0;}
.table{font:400 1em Times,serif;}
tr {padding:0;margin:0;}
td {text-align:center;padding:3px 0 0 0;}
.icdButton{font: 700 1em Arial,sans-serif;width:280px;color:#fff;text-align:left;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#i1,#i2,#i3,#i4,#i5,#i6{font:400 .9em Times,serif;margin:0; padding:0;}
#icdb{margin:0 0 0 170px;}



</style></head><body><div id="page">














<div id="leftcolumn">
<img width="166" height="50" alt="amx logo"  src="data:image/gif;base64,R0lGODlhpQAyAKIAAAQyNP7+/om5v0qLlQlqe9nm57zV2WypsiwAAAAApQAyAAAD/hi63P4wykmrvThrVbb/YCiOjzGcp1AZQisYHSnPNHkMBjcAgyQcB9cvmKsZj8jHzTEg9BwGYoMFVCWvWJKB8GgSiouo1VEIBrPodGbZEBDeT84B/Pj96Oq8ftGMKbZvTgwtE2I/fnuJaU0DLyaBcGFzE3Z2ipdoB5CbkQqHE0ChB4iYpTRunJBjnxGVLZOmsTReqVxysHVmLriyvSGAqWBld1B2Qbt4vsoaBbRwdMN2BtNUukK8y9kZVC+5r6LHx9fJ2uUhxkKv6cak5u4eYuLr6Wfv9oU3Au2u87vE9wDbABhIEMCYAIbk0bMUsGEAAgAOMNjBY1C4dRcdNoTY/mVgnABD+jHUeO8AgHYgCR6sBg4IOZLlKnYkWCzdS5jaDESEUBDATZwaBQCwxaBAT4NAky4QyiNGmaM7RRSgNi0G1WlKLWDNwBTq0YMfvgagSJAozCgUNH3Z5hXqTwtGeyog6xHnU4kTvGxoe3RE14G2xMIUujbviQ1/24L1QLdi3IIoAXqJLKPx0Y8gIBZUkRgAUEZZLBPE7EDACUgpHBzN0RizCVoDRpVON/eNRGp/bvD6EXsxwhu9p6DCkaNAN5ApcOOGwiJyZwK+l/IdOEan3Ic9q/M1G6AngcdDsQ9oBviNChPlo/5pUtBJEcKBwpvs4YXHDi5M8UpvKsF4/gvKnkxHUAwmtafAanMJ6NkfPTUGAxw7xEbLcDcEUgQwjfxgIXJenCBREzcM1YRpgoz1hh/AAIgBeNM90RpCfY2loEyilQUSJGDABoZaKhQQyEqdmEiUj4HINo1tniAZAJGFjdDYdwkW9IRYieF3WYA9dVAjdQGoBeUCao03iHlCLqZWDKD9UeSY0PHxRm1tzjBVCx+x2AOLJ8koZXcNTpQdn0cdAydYXoB1JpGkIfRGDoDoN1wDaoGBioYE6GeEcRVe2dmB2eGJyItQNYAoEyVO9CaPBaSqqnFkTupmk7Vh5kyiIrihoAov4qnnjBF1RkqjUyjJQCTO1NJmpG5i/jYqm6XK4COvOWhGkESbbumVad6VtmgbZDIArLGbsFYqkZYqGmcYG9IgbXuxxSjWk7vO+GxB5QpJCrJsRuvEqvymqkCQqOARcFGQ1BsCno5mqyt2ezYWHQNHtZOmqaSd+VCzRaFbKZgnNjCZqZCoyFWfC2iaLaAqpWTgUhn6uzDBGJtIWpoTM4Csq7GS+lGhwMrg65LrcplrxEtelqplLZzsbbcal7usFwJ3YnHOMMcRJpwiX4AnX9H+uakCBQpIH8n5cnuumnECU0QZgaC5rblgAWLF1UluXBm0KA+kJdnxevVE0It9bHPHZYMdyGnpCmnbwIOvhcqXcL6VgWXfUjm8MOACeRWnpzp37jHhdUMEByLAGGQS5HCaC+uNMR88hGx/TCU7QrLDwMFVEGAaij5TUIXS7KLaHjxKLPwHAQvFCV+U7VMp763zWUUv/fQjJAAAOw=="/>
<p>400 Sugartree Ln.<br/>Suite 510<br/>Franklin TN 37064</p>
<p>Tel :(877) 992-4100<br/>
Fax:(615) 599-4648</p>
<br/>Client: $id<br/>Billing:$billingCheck<br/>
</div><div id="form">
<div id="nav"><button class="link" onclick="prn()">Print</button> <form action="https://dev.amxemr.com/requestForm.php" method="post"><input type="hidden" name="id" value="$id" /><input type="hidden" name="rec" value="$rec" /><input type="hidden" name="sub" value="6" /> <button class="link">Complete</button></form></div>
<br/><input type="text" name="last" value="$last" class="name"  placeholder="Last Name" />
<input type="text" name="first" class="name" value="$first"  placeholder="First Name" />
<legend>DoB:</legend><input class="date" type="date" name="dob" value="$strdob" placeholder="m/d/yyyy" />
&#x2003;Gender: $gender
<br/><legend>  Specimen ID:</legend><input id="specimen" type="text" name="specimen" value="$specimen"  />
<legend>  Collection Date:</legend><input class="date" type="text" name="collect" value="$collect" placeholder="m/d/yyyy" /><br/><br/>
<img id="hdr" width="590"  src="requestHead590.gif" />
</div>
<p>.&#x2003;<br/>&#x2003;&#x2003;Phys. Signature: x___________________________________________________
<br/>&#x2003;</p>
<div class="label">Physician Name:</div> <input id="physician" type="text" name="first" value="$physician"  placeholder="Physician Name" />
<br/><div class="label">ICD-10 Code:</div> <input id="icd" type="text" class="name" name="icd" value="$icd"  placeholder="ICD-10 Code" />
<div id="icdb">
<button type="button" class="icdButton" onclick="icdexp('1')">Asthma ICD-10 Codes</button><br>
<div id="i1">
<div class="icd">J45.2 Mild intermittent asthma</div>
<div class="icd">J45.20 Mild intermittent asthma, uncomplicated</div>
<div class="icd">J45.21 Mild intermittent asthma with (acute) exacerbation</div>
<div class="icd">J45.22 Mild intermittent asthma with status asthmaticus</div>
<div class="icd">J45.3 Mild persistent asthma</div>
<div class="icd">J45.30 Mild persistent asthma uncomplicated</div>
<div class="icd">J45.31 Mild persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.32 Mild persistent asthma with status asthmaticus</div>
<div class="icd">J45.4 Moderate persistent asthma</div>
<div class="icd">J45.40 Moderate persistent asthma, uncomplicated</div>
<div class="icd">J45.41 Moderate persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.42 Moderate persistent asthma with status asthmaticus</div>
<div class="icd">J45.5 Severe persistent asthma</div>
<div class="icd">J45.50 Severe persistent asthma, uncomplicated</div>
<div class="icd">J45.51 Severe persistent asthma with (acute) exacerbation</div>
<div class="icd">J45.52 Severe persistent asthma with status asthmaticus</div>
<div class="icd">J45.9 Other and unspecified asthma</div>
<div class="icd">J45.90 Unspecified asthma</div>
<div class="icd">J45.901 Unspecified asthma with (acute) exacerbation</div>
<div class="icd">J45.902 Unspecified asthma with status asthmaticus</div>
<div class="icd">J45.909 Unspecified asthma uncomplicated</div>
<div class="icd">J45.99 Other asthma</div>
<div class="icd">J45.990 Exercise induced bronchospasm</div>
<div class="icd">J45.991 Cough variant asthma</div>
<div class="icd">J45.998 Other asthma</div>
</div>
<button type="button" class="icdButton" onclick="icdexp('2')">Ear Related ICD-10 Codes</button><br>
<div id="i2">
<div class="icd">H65.11 Acute and subacute allergic otitis media (mucoid)</div>
<div class="icd">(sanguinous) (serous)</div>
<div class="icd">H65.111 Acute and subacute allergic otitis media, right ear</div>
<div class="icd">H65.112 Acute and subacute allergic otitis media, left ear</div>
<div class="icd">H65.113 Acute and subacute allergic otitis media, bilateral</div>
<div class="icd">H65.114 Acute and subacute allergic otitis media, recurrent, right ear</div>
<div class="icd">H65.115 Acute and subacute allergic otitis media, recurrent, left ear</div>
<div class="icd">H65.116 Acute and subacute allergic otitis media, recurrent, bilateral</div>
<div class="icd">H65.117 Acute and subacute allergic otitis media, recurrent, unspecified ear</div>
<div class="icd">H65.119 Acute and subacute allergic otitis media, unspecified ear</div>
<div class="icd">H65.20 Chronic serous otitis media, unspecified ear</div>
<div class="icd">H65.21 Chronic serous otitis media, right ear</div>
<div class="icd">H65.22 Chronic serous otitis media, left ear</div>
<div class="icd">H65.23 Chronic serous otitis media, bilateral</div>
<div class="icd">H65.30 Chronic mucoid otitis media, unspecified ear</div>
<div class="icd">H65.31 Chronic mucoid otitis media, right ear</div>
<div class="icd">H65.32 Chronic mucoid otitis media, left ear</div>
<div class="icd">H65.33 Chronic mucoid otitis media, bilateral</div>
<div class="icd">H69.80 Other specified disorders of Eustachian tube,unspecified ear</div>
<div class="icd">H69.81 Other specified disorders of Eustachian tube, right ear</div>
<div class="icd">H69.82 Other specified disorders of Eustachian tube, left ear</div>
<div class="icd">H69.30 Other specified disorders of Eustachian tube, bilateral</div>
</div>
<button type="button" class="icdButton" onclick="icdexp('3')">Eye Related ICD-10 Codes</button><br>
<div id="i3">
<div class="icd">H10.10 Acute atopic conjunctivitis, unspecified eye</div>
<div class="icd">H10.11 Acute atopic conjunctivitis, right eye</div>
<div class="icd">H10.12 Acute atopic conjunctivitis, left eye</div>
<div class="icd">H10.13 Acute atopic conjunctivitis, bilateral</div>
<div class="icd">H10.45 Other chronic allergic conjunctivitis</div>
</div>
<button type="button" class="icdButton" onclick="icdexp('4')">Gastrointestinal ICD-10 Codes</button><br>
<div id="i4">
<div class="icd">K52 Other and unspecified noninfective gastroenteritis and colitis Allergy, allergic (reaction) (to)colitis </div>
<div class="icd">K52.2 gastrointestinal </div>
<div class="icd">K52.2 milk protein </div>
<div class="icd">K52.2 Colitis (acute) (catarrhal) (chronic) (noninfective) (hemorrhagic) </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Diarrhea, diarrheal (disease) (infantile) (inflammatory) </div>
<div class="icd">R19.7 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Enteritis (acute) (diarrheal) (hemorrhagic) (noninfective) (septic) </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 due to food hypersensitivity </div>
<div class="icd">K52.2 Gastroenteritis (acute) (chronic) (noninfectious)-see also Enteritis </div>
<div class="icd">K52.9 allergic </div>
<div class="icd">K52.2 dietetic </div>
<div class="icd">K52.2 food hypersensitivity </div>
<div class="icd">K52.2 Hypersensitive, hypersensitiveness, hypersensitivity gastrointestinal </div>
</div>
<button type="button" class="icdButton" onclick="icdexp('5')">Nasal/Sinus ICD-10 Codes</button><br>
<div id="i5">
<div class="icd">J30.1 Allergic rhinitis due to pollen</div>
<div class="icd">J30.2 Other seasonal allergic rhinitis</div>
<div class="icd">J30.5 Allergic rhinitis due to food</div>
<div class="icd">J30.81 Allergic rhinitis due to animal (cat) (dog) hair and dander</div>
<div class="icd">J30.89 Other allergic rhinitis</div>
<div class="icd">J30.9 Allergic rhinitis, unspecified</div>
<div class="icd">J31.0 Chronic rhinitis</div>
<div class="icd">J31.1 Chronic nasopharyngitis</div>
<div class="icd">J31.2 Chronic pharyngitis</div>
<div class="icd">J32.0 Chronic maxillary sinusitis</div>
<div class="icd">J32.1 Chronic frontal sinusitis</div>
<div class="icd">J32.2 Chronic ethmoidal sinusitis</div>
<div class="icd">J32.3 Chronic sphenoidal sinusitis</div>
<div class="icd">J32.4 Chronic pansinusitis</div>
<div class="icd">J32.8 Other chronic sinusitis</div>
<div class="icd">J32.9 Chronic sinusitis, unspecified</div>
<div class="icd">J33.0 Polyp of nasal cavity</div>
<div class="icd">J33.1 Polypoid sinus degeneration</div>
<div class="icd">J33.8 Other polyp of sinus</div>
<div class="icd">J33.9 Nasal polyp, unspecified</div>
<div class="icd">J35.0 Chronic tonsillitis and adenoiditis</div>
<div class="icd">J35.01 Chronic tonsillitis</div>
<div class="icd">J35.02 Chronic adenoiditis</div>
<div class="icd">J35.03 Chronic tonsillitis and adenoiditis</div>
<div class="icd">J35.1 Hypertrophy of tonsils</div>
<div class="icd">J35.2 Hypertrophy of adenoids</div>
<div class="icd">J35.3 Hypertrophy of tonsils with hypertrophy of adenoids</div>
<div class="icd">J35.8 Other chronic diseases of tonsils and adenoids</div>
<div class="icd">J35.9 Chronic disease of tonsils and adenoids, unspecified</div>
<div class="icd">J37.0 Chronic laryngitis</div>
<div class="icd">J37.1 Chronic laryngotracheitis</div>
<div class="icd">J38.4 Edema of larynx</div>
<div class="icd">J38.5 Laryngeal spasm</div>
<div class="icd">J38.6 Stenosis of larynx</div>
<div class="icd">J38.7 Other diseases of larynx</div>
<div class="icd">J39.2 Other diseases of pharynx</div>
</div>
<button type="button" class="icdButton" onclick="icdexp('6')">Skin Related ICD-10 Codes</button><br>
<div id="i6">
<div class="icd">L23 Allergic contact dermatitis</div>
<div class="icd">L23.3 Allergic contact dermatitis due to drugs in contact with skin</div>
<div class="icd">L23.4 Allergic contact dermatitis due to dyes</div>
<div class="icd">L23.5 Allergic contact dermatitis due to other chemical products</div>
<div class="icd">L23.6 Allergic contact dermatitis due to food in contact with the skin</div>
<div class="icd">L23.81 Allergic contact dermatitis due to animal (cat) (dog) dander</div>
<div class="icd">L23.89 Allergic contact dermatitis due to other agents</div>
<div class="icd">L23.9 Allergic contact dermatitis, unspecified cause</div>
<div class="icd">L27.0 Generalized skin eruption due to drugs and medicaments taken internally</div>
<div class="icd">L27.1 Localized skin eruption due to drugs and medicaments taken internally</div>
<div class="icd">L27.2 Dermatitis due to ingested food</div>
<div class="icd">L27.8 Dermatitis due to other substances taken internally</div>
<div class="icd">L27.9 Dermatitis due to unspecified substance taken internally</div>
<div class="icd">L50.0 Allergic urticaria</div>
<div class="icd">L50.1 Idiopathic urticaria</div>
<div class="icd">L50.2 Urticaria due to cold and heat</div>
<div class="icd">L50.3 Dermatographic urticaria</div>
<div class="icd">L50.4 Vibratory urticaria</div>
<div class="icd">L50.5 Cholinergic urticaria</div>
<div class="icd">L50.6 Contact urticaria</div>
<div class="icd">L50.8 Other urticaria</div>
<div class="icd">L50.9 Urticaria, unspecified</div>
</div></div>
<div class="hide">
<div id="d003" class="dchk"><input id="c003" type="radio" class="chk" name="billing" value="1" onclick="exp('003')" $checked[0]/>&#x2002;
Bill Client </div><br/><div id="s003"></div> 
<div id="d004" class="dchk"><input id="c004" type="radio" class="chk" name="billing" value="2" onclick="exp('004')" $checked[1]/>&#x2002;
Bill Medicare</div><br/><div id="s004"></div>
<div id="d005" class="dchk"><input id="c005" type="radio" class="chk" name="billing" value="3" onclick="exp('005')" $checked[2]/>&#x2002;
Bill Medcaid </div><br/><div id="s005"></div> 
<div id="d006" class="dchk"><input id="c006" type="radio" class="chk" name="billing" value="4" onclick="exp('006')" $checked[3]/>&#x2002;
Bill Patient</div><br/>
<div id="s006" class="expand hide">
<br/><legend>Patient Last:</legend><input type="text" name="blast" value="$plast" size="40" />
<br/><legend>Patient First:</legend><input type="text" name="bfirst" value="$pfirst" size="40" />
<br/><legend>Patient DoB: (m/d/yyyy)</legend><input type="text" name="pDoB " value="$pstrdob" placeholder="m/d/yyyy"  size="40"/>
<br/><br/><legend>Patient Address:</legend><input type="text" name="address" value="$paddress" size="40"/>
<br/><legend>Patient City State Zip:</legend><input type="text" name="city" value="$pcity" size="40" />
<br/><legend>Patient Phone: (with Area Code)</legend><input type="text" name="address" value="$pphone" size="40"/>
<br/><legend>Patient SSN:</legend><input type="text" name="address" value="$pssn" size="40"/>
<br/><legend>Patient Email:</legend><input type="text" name="email" value="$pemal" size="40"/>
<br/><br/>Must complete Credit Card Payment section or CONTACT 877-992-4100 prior to shipping)-*

</div>
<div id="d007" class="dchk">
<input id="c007" type="radio" class="chk" name="billing" value="5" onclick="exp('007')" $checked[1]/>&#x2002;Bill Insurance</div>
<br/><div id="s007" class="expand hide">
<br/><legend>Insured Last:</legend><input type="text" name="blast" value="$blast" size="40" />
<br/><legend>Insured First:</legend><input type="text" name="bfirst" value="$bfirst" size="40" />
<br/><legend>Insured DoB: (m/d/yyyy)</legend><input type="text" name="dob" value="$strdob" placeholder="m/d/yyyy"  size="40"/>
<br/><legend>Insured Address:</legend><input type="text" name="address" value="$address" size="40"/>
<br/><legend>Insured City State Zip:</legend><input type="text" name="city" value="$city" size="40" />
<br/><legend>Insured Phone: (with Area Code)</legend><input type="text" name="address" value="$phone" size="40"/>
<br/><legend>Insured SSN:</legend></legend><input type="text" name="address" value="$ssn" size="40"/>
</div><br/><br/><hr/></div>
<div id="inscard"><p>Please attach a photo copy of the front and back of the insurance card</p></div>
<div id="ins">
<p>I understand that if I elect to receive the services and my healthcare insurance company determines that the services are Out-of-Network, are Investigational Services, are not Covered Services, are not considered to be Medically Necessary or Medically Appropriate, I will be responsible to pay for all costs associated with the laboratory services that are not paid by my insurance policy. I authorize the use of my credit/HSA card and understand that I will be informed of the costs prior to Allermetrix withdrawing funds via my choice indicated below: </p>
<p>Patient Signature (Required) x___________________________________________________
<p>[&#x2003;] telephone (ok to leave voice mail) 
<p>[&#x2003;] e-mail _________________________@_______________________________
</div>
<hr/>
<div id="tests">

EOT;
$sql = "SELECT `Code`, `description` FROM `Rast` WHERE  1 ORDER BY `description`";  
$results = mysql_query($sql);
while(list($code,$description) =  mysql_fetch_array($results, MYSQL_NUM)){$sort[] = $code;$desc[$code] = $description;$descriptions[$code][1] = 0;$matches[$code] = 0;$rank[10][$code] = $num;$num++;}
$sort = array_flip($sort);
$cnt = 0;

$countTests = $panels[$pdx][3][0];
$countIgE = $panels[$pdx][3][1];
$countIgG = $panels[$pdx][3][2];
$countIgG4 = $panels[$pdx][3][3];
$typeE  = array('<tr><td></td>' , '<tr><td><div class="E">&#10004;</div></td>');
$typeG4 = array('<td><div class="G4"></div></td>' , '<td><div class="G4">&#10004;</div></td>');
$typeG  = array('<td><div class="G" style="color:#fff;">&#10004;</div></td>' , '<td ><div class="G">&#10004;</div></td>');


$selected = array();
$inputs = '';
foreach($_POST as $key => $value){
  $post = substr($key,0,1);
  if($post == 'P'){
    $panels[] ="<button type=\"button\" class=\"panel\">$key $value</button><br>\n";
	continue;
  }
  if($post == 'G'){
	$code = substr($key,1,4);
	$selected[$code][3] = 1;
//	echo "G$code $desc[$code]<br>";
  }
  elseif($post == 'E'){
	$code = substr($key,1,4);
	$selected[$code][1] = 1;
  }
}
if(count($panels) > 0){
  echo "<h3>Panels Ordered</h3>";
  foreach($panels as $text){echo $text;}
}

if(count($selected) > 0){
  echo "<h3>Tests Ordered</h3><div class=\"table\"><table><tr style=\"font-weight:700\"><td>&thinsp;IgE&thinsp;</div></td><td>&thinsp;IgG<sub>4&thinsp;</sub></div></td><td>IgG<td style=\"font-family:Arial,sans-serif;\">Allergens</td></tr>";
  foreach($selected as $code => $array){
	$types[1] = intval($selected[$code][1]);
	$types[3] = intval($selected[$code][3]);
    $tests[$sort[$code]] = $typeE[$types[1]] . $typeG4[$types[3]]  . $typeG[0] . "<td style=\"text-align:left;\">&ensp;$desc[$code]</td></tr>\n";
  }
  ksort($tests);
  foreach($tests as $row){echo $row;}
  echo '</table></div>';
}

echo $inputs;



echo '<div style="min-height:10em;"><p>&#x2003;<br/>&#x2003;</p></div></div></div>';
echo <<<EOT
<script> //<![CDATA[';
var buttons = {1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};
var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
function icdexp(id){
  buttons[id][0].style.display = flip[buttons[id][0].style.display];
}
function prn(){
  document.getElementById('icdb').style.display = 'none';
  window.print()

}
EOT;

if($billing == 1){ // patient submits foods
$id = intval($_POST['id']);
echo <<< EOT

var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';

var c = new Array;
var d = new Array;
var p = new Array;
var billing = $billing;

function init(){
document.getElementById('ins').style.display = 'none';
document.getElementById('inscard').style.display = 'none';
document.getElementById('hdr').style.display = 'none';
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }
  console.log('buttons');
  console.log(buttons);
}


window.onload = init;
//]]> 
</script>
EOT;
}
elseif($billing < 4){  // medicare medicad

echo <<< EOT
var buttons = {1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};

var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
function icdexp(id){
  buttons[id][0].style.display = flip[buttons[id][0].style.display];
}
var c = new Array;
var d = new Array;
var p = new Array;
var billing = $billing;


function init(){
document.getElementById('ins').style.display = 'none';
document.getElementById('inscard').style.display = 'block';
document.getElementById('hdr').style.display = 'none';
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }
  console.log('buttons');
  console.log(buttons);

}
window.onload = init;
//]]> 
</script>
EOT;
}

elseif($billing == 4){  // patient

echo <<< EOT


var c = new Array;
var d = new Array;
var p = new Array;
var billing = $billing;
var buttons = {1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};
function icdexp(id){
  buttons[id][0].style.display = flip[buttons[id][0].style.display];
}

function init(){
document.getElementById('ins').style.display = 'block';
document.getElementById('inscard').style.display = 'none';
document.getElementById('hdr').style.display = 'block';
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }
}
window.onload = init;
//]]> 
</script>
EOT;
}
else{  // insurance
echo <<< EOT
var billing = $billing;

var buttons = {1:[null],2:[null],3:[null],4:[null],5:[null],6:[null]};

var flip = new Array();
flip[''] = 'block';
flip[null] = 'block';
flip['none'] = 'block';
flip['block'] = 'none';
function icdexp(id){
  buttons[id][0].style.display = flip[buttons[id][0].style.display];
}
function init(){
document.getElementById('ins').style.display = 'block';
document.getElementById('inscard').style.display = 'block';
document.getElementById('hdr').style.display = 'block';
  for (var id in buttons){
	 buttons[id][0] = document.getElementById('i' + id);
	 buttons[id][0].style.display = 'none'
  }

}
function exp(id){
  var div = document.getElementById('d' + id);
  var c = document.getElementById('c' + id);
  var ex = document.getElementById('s' + id);
  div.style.backgroundColor=bg[c.checked];
  disp = ex.style.display;
  prev.style.display='none';
  ex.style.display=flip[disp];
  prev=ex;
  radio6(id);
}

icdb
window.onload = init;
//]]> 
</script>
EOT;
}
$specimen = mysql_real_escape_string($specimen);
$physician = mysql_real_escape_string($physician);
$request = mysql_real_escape_string(json_encode($ordered));
$sql = "UPDATE `history` SET `specimen`='$specimen', `collection` = '$collection',`physician` = '$physician',`idc` = '$idc', `request` = '$request' WHERE `id` = '$rec'";
mysql_query($sql);
if(mysql_errno() > 0){echo mysql_error() . "<br/>\n$sql";}

echo '</body></html>';
?>