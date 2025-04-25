<?php
$sub = intval($_POST['sub']);
if($sub == 1){
  unlink('geo.txt');
  file_put_contents('geo.txt','');
}
header('Content-Type: text/html; charset=utf-8');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>geolocation</title>
<style>
body{font:700 1em Arial,sans-serif;}
button{font:700 1.5em Times;}
#page{font:700 8em Arial,sans-serif;width:100%;height:100%;border:2px #aaa groove;}
#req{height:1em;}
#cnt{height:1em;}
#err{height:1em;}
#ajx{height:1em;}

input[type="submit"] {display:none;}
</style></head>
<body><div id="page">

<button onclick="history.back()">STOP</button>

<div id="req">0</div>
<div id="cnt">0</div>
<div id="err">No Errors</div>
<div id="ajx">No Errors</div>
<p>
</p></div></br>
</div>
<script type="text/javascript">
var t = Date.now();
var requests = 0;
var responses = 0;
var ajxErr = 0;
var errors = 0;
var geo = null;
var err = document.getElementById('err');
var req = document.getElementById('req');
var cnt = document.getElementById('cnt');
var ajx = document.getElementById('ajx');
var nIntervId;
clearInterval(nIntervId);
function handlePosition(pos){postLatLng(pos.coords.latitude,pos.coords.longitude);};
function showError(error) {
  var err = '<h2 class="err">no corrdinates: ' + error.message + '</h2>';
  response.innerHTML = err;
  response.backgroundColor = '#f00';
  response.color = '#000';
};

function getPos(){
  if ( navigator.geolocation ){
    options = {
      enableHighAccuracy: false,
      timeout: 20000,
      maximumAge: 0
    }
    geo = navigator.geolocation.getCurrentPosition(handlePosition,showError,options);
	t = Date.now();
  }
  else{ 
    response.innerHTML = '<h2 class="err">No Location</h2>';
  }
}
function postLatLng(lat,lng){
  if(parseInt(lat) == 0 || parseInt(lng) == 0){
	 errors += 1;
	 err.innerHTML = errors;
     return;
  }
  xmlhttp=null;
  var url="geoPos.php"
  if (window.XMLHttpRequest){  // Fuckin\' Microsoft!
    xmlhttp=new XMLHttpRequest();
  }
  else if (window.ActiveXObject){ // Fuck Fuckin\' Microsoft!
    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  if (xmlhttp!=null){
    xmlhttp.onreadystatechange=getResponse;
    xmlhttp.open("post", url, true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
    xmlhttp.send( 'lat=' + lat + '&lng=' + lng + '&time=' + t);
	requests += 1;
	req.innerHTML = requests;
  }else{
	  ajxErr += 1;
	  ajx.innerHTML = ajxErr;
  }
};
function  getResponse(){
  if (xmlhttp.readyState==4){
    if (xmlhttp.status==200){
      var json = JSON.parse(xmlhttp.responseText);
	  responses += 1;
	  cnt.innerHTML = responses;
    //  response.innerHTML = 'Response: ' + json[0] + '&#x2003;' + json[1]  + '&#x2003;' + json[2] + '<br/>' ;
    }
    else{
	  ajxErr += 1;
	  ajx.innerHTML = ajxErr;
    //  response.innerHTML = "UNEXPECTED AJAX ERROR: : " + xmlhttp.statusText + "HTTP Status: " + xmlhttp.status;
   }
  }
};
function init(){nIntervId=window.setInterval(function(){getPos()},333)}
window.onload = init;
</script>
</body></html>
EOT;
?>