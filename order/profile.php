<?php
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Allermetrix eOffice Profile</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#header{margin:0 auto 0;width:640px;}
#content{max-width:640px;margin:0 auto 0 ;}
#col1,#col2,#col3{float:left;width:300px;}
#col2,#col3{margin-left:2em;display:none;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
.btn{margin:10px 0 0 0;width: 200px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);display:block;}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font: 700 1.1em Arial,sans-serif;color:#000;}
.center{text-align:center;}
h1,h2,h3{margin: 0 auto 0;}
h2{text-align:center;}
label{margin-top:10px;font-size:1.3em;}
textarea{border-radius: 4px;font-family:Arial;}
#comment{height:86px;}
input{padding:5px;font:400 1.1em Atrial,sans-serif;border-radius: 4px;}
.hide{display:none;}
.red{color:#f00;}
.big{font-size:1.3em;}
#asteriskDOB,#asteriskLast,#asteriskFirst,#asteriskGender,.required,#asterisk1,#asterisk2,#asterisk3,#asterisk4{color:#f00;font-weight:700;font-size:1em;display:inline-block;}


#patient{margin: 0 0 0 200px;}
#billing{width:400px;}
.label{font-size:1em;margin: 10px 0 10px 0;}
.or{font-size:1em;margin: 10px 0 10px 1.9em;}
input[type="date"]{}
input[type="radio"], input[type="checkbox"] {width: 1.3em;height: 1.3em;display: inline;margin: 1px;margin-left: 4px;vertical-align: middle;position: relative;background: #333;background-color: rgb(51, 51, 51);color: #eee;}
.note{font-size:1em;margin-top:0;padding-top:0;}
#hide{display:none;}
rt{background:#f00;color:#fff;}
#autofill{font-size:.8em}

p{line-height:1.5;font:400 1em Arial,sans-serif;}
#cap{display:inline-block; margin:0 0 0 0;}
#cli{margin:0 0 0 118px;}
#patient{margin:0 auto 0;width:400px;}
#warning{color:#f00;font:700 1.2em Arial;margin:10px 0 15px 0;}
#address{display:none;}
#ao{margin:20px auto 0;width:400px;line-height:18px;}
#caption{font-style: italic;font:700 13px Arial,sans-serif;margin:0 0 0 20px;}
#logo{width:210px;margin:20px 0 20px 0;}
.err{color:#f00;font:700 1.2em Arial,sans-serif;margin:15px 0 5px 0;}
</style></head><body>
<div id="header"><img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /></div>
<h2>Create Patient Order</h2>
<div id="ao">
<span class="bold">$clientname</span>

EOT;
ob_flush();
$rec = 0;
$onhold = 0;
$err = intval($err);
//$genders = (0=>0,1=>1,2=>2,'M'=>1,'F'=>2);

$gender = 0;
$dob = '';
$errors = array('','<div class="err">Invalid Phone Number</div>');
$addon = false;
$collect = '<span>';
if($Accession > 100000){
  $addon = true;
  
  $sql = "SELECT  `Patient`,`Date`,`Last`,`First`,`DoB`,`address`,`city`,`state`,`zip`,`phone`,`email`,`Billing`,`Collection`,`Sex` FROM `Patient` WHERE `Patient` = $Accession ";
 $results = mysqli_query($link,$sql);
  list($Accession,$date,$last,$first,$dob,$address,$city,$state,$zip,$phone,$email,$billing,$collection,$gender) = mysqli_fetch_array($results, MYSQLI_NUM);
 // $gender = $genders[$gender];
//  echo "$Accession,$date,$last,$first,$dob,$address,$city,$state,$zip,$phone,$email,$volume,$billing,$collection";
 // if($dob == '1970-01-01'){$dob = '';}
  if($collection == '000-00-00'){$collect == '<span style="color:#f00;font:700 1.1em Arial;">';}
  $time = strtotime($date);
  $strdate = date('m/d/y',$time);
  $time = time() - $time;
  $days = ceil($time / 86400);
  $Etest = floor($volume * 1000 / 60);
  $IgG = '<br><span class="bold">100+ IgG/IgG<sub>4</sub> tests available</span>';
  if($days > 60) $IgG = '<br><span class="bold">IgG/IgG<sub>4</sub> testing is no longer viable</span>';
  $phone = intval(preg_replace('/\D/','',$phone));
  if($phone == 0){
    $phone = '';
  }
  else{
    if($phone > 0){$phone = substr($phone,0,3) . '-' . substr($phone,3,3) . '-' . substr($phone,6,4);}
  }
  $billiingcode = array('C'=>1,'M'=>2,'A'=>3,'P'=>4,'I'=>5,'E'=>0,'N'=>0);
  $billing = $billiingcode[$billing];
  echo <<<EOT
<br>
Patient: $first $last<br>
Allermetrix Accesssion: $Accession<br>
Test Date: $strdate<br>
Serum Volume on hand: $volume mL<br>
<span class="bold">$IgE</span>
$IgG
<span class="bold"><br>$Etest IgE tests available</span>
</div>

EOT;
}
$checked = array('','','','','','','','','');
$billing = intval($billing);
$checked[$billing] = 'checked';
$genders = [''=> 0,'M'=>1,'F'=>2];
$billingText = ['','','Address is required for Medicare  billing','Address is required for Medicaid  billing','Address is required for Patient  billing','Address is required for Insurance billing'];
$checked[$genders[$gender] + 6] = 'checked';
echo <<<EOT
<div id="content">

<div id="patient">
<form action="./index.php" method="post"  autocomplete="off">

<p id="required">Fields with <span class="required" > &#x2731;&#x2731;</span> are Required.</br>
Fields with <span class="required" > &#x2731;</span> are Needed.<br>
Needed fields, if blank, may put order on hold.
</p>
<div id="billing"> 

<div>Billing:<span id="asteriskBilling" class="required"> &#x2731;&#x2731;</span></div>

<div id="d003"><input id="c1" type="radio"  name="billing" value="1" onchange="chkAll()"  required />&#x2002;
Bill Client </div><div id="s003"></div> 

<div id="d004" ><input id="c2" type="radio"  name="billing" value="2"  onchange="chkAll()" />&#x2002;
Bill Medicare</div><div id="s004"></div>

<div id="d005"><input id="c3" type="radio" name="billing" value="3"  onchange="chkAll()" />&#x2002;
Bill Medcaid </div><div id="s005"></div> 

<div id="d006"><input id="c4" type="radio"  name="billing" value="4"  onchange="chkAll()" />&#x2002;
Bill Patient</div><div id="s006"></div>

<div id="d007"><input id="c5" type="radio" name="billing" value="5"  onchange="chkAll()"/>&#x2002;
Bill Insurance</div><div id="s007"></div> 
</div>
<br>Patient Last: <br><input id="last" $lclass type="text" name="last" value="$last"  autocomplete="off" required onchange="chkAll()"/><span id="asteriskLast"> &#x2731;&#x2731;</span>
<br>Patient First: <br><input id="first" type="text" name="first" value="$first" required autocomplete="off" onchange="chkAll()" /><span id="asteriskFirst" > &#x2731;&#x2731;</span>
<br>Patient DoB: <br><input id="dob" type="date" name="dob" value="$dob" autocomplete="off" onchange="chkAll()"/><span id="asteriskDOB" > &#x2731;</span>

<div><br>Gender:<span id="asteriskGender" class="required"> &#x2731;</span></div>
<div id="d008"><input id="g1" type="radio"  name="gender" value="1" $checked[7] onchange="chkAll()"/>&#x2002;
Male</div><div id="s008"></div>
<div id="d009"><input id="g2" type="radio"  name="gender" value="2" $checked[8] onchange="chkAll()"/>&#x2002;
Female</div><div id="s009"></div>
<div id="address">
<br><br>
Address: <br><input id="street" name="Address" type="text" value="$address"  autocomplete="off" onchange = "addressChange(1)" /><span id="asterisk1" > &#x2731;</span><br>
City: <br><input id="city" name="city" type="text" value="$city"  autocomplete="off" onchange = "addressChange(2)" /><span id="asterisk2" > &#x2731;</span><br>
State: (2 character)<br><input id="state" $sclass name="state" type="text" value="$state"  autocomplete="off" onchange = "addressChange(3)" /><span id="asterisk3" > &#x2731;</span><br> 
Zip: <br><input id="zip" name="zip" type="text" value="$zip"  autocomplete="off" onchange = "addressChange(4)" /><span id="asterisk4" > &#x2731;</span><br>
<div id="warning"> *Order may be put on hold.</div>
$errors[$err]
Phone: <br><input name="phone" type="tel" value="$phone"  autocomplete="off"/><br>
eMail: <br><input name="email" type="text" value="$email"  autocomplete="off"/><br>
</div>
<input type="hidden" name="client" value="$client"/>
<input type="hidden" name="rec" value="$rec" /> 
<input type="hidden" name="volume" value="$volume" /> 
<input type="hidden" name="Accession" value="$Accession"/> 
<input type="hidden" name="sub" value="57"/>
<input type="hidden" name="tab" value="5"/>
<input type="hidden" name="prior" value="6"/>
<input type="hidden" name="clientname" value="$clientname"/>

<input id="submit" type="submit" value="Create Order" class="btn" />
EOT;
echo <<<EOT
</form>
<div id="logo">
<img src="logo_web.gif" width="197" height="60" alt="Alermetrix Logo" />
<div id="caption" style="font-style:italic;">improving allergy outcomes</div>
</div></div>



<script>
const showit = ["none","inline-block"];
var address = document.getElementById("address");
var street = document.getElementById("street");
var city = document.getElementById('city');
var state = document.getElementById('state');
var zip = document.getElementById('zip');
var first = document.getElementById('first');
var last = document.getElementById('last');
var gender = document.getElementsByName('gender');
var billing = document.getElementsByName('billing');
var asteriskBilling = document.getElementById('asteriskBilling');
var asterisk1 = document.getElementById('asterisk1');
var asterisk2 = document.getElementById('asterisk2');
var asterisk3 = document.getElementById('asterisk3');
var asterisk4 = document.getElementById('asterisk4');
asterisk1.style.display = 'inline-block';
asterisk2.style.display = 'inline-block';
asterisk3.style.display = 'inline-block';
asterisk4.style.display = 'inline-block';
const display = ['none','none','block','block','block','block','block'];
var warning = document.getElementById('warning');
function init(){
  chkAll();
   address.style.display = 'none';
  
}
function showLabel(){
  submit.style.display = 'none';
  if(first.value.length > 1 && last.value.length > 2){submit.style.display = 'block';}
}
function chkAll(){
  it = 0;
  asteriskLast.style.display = 'none';
  asteriskFirst.style.display = 'none';
  asteriskDOB.style.display = 'none';
  if(last.value.length < 3){asteriskLast.style.display = 'inline-block';it=1;}
  if(first.value.length < 2){asteriskFirst.style.display = 'inline-block';it=1;}
  let age = Math.round((new Date() - (new Date(dob.value)))/31536000000);
  if (age < 1 || age > 100 ||isNaN(age) ) {asteriskDOB.style.display = 'inline-block';it=1;}
  if(gender[0].checked || gender[1].checked){asteriskGender.style.display='none';}else{it=1;}
  if(billing[1].checked || billing[2].checked || billing[3].checked || billing[4].checked || billing[0].checked){asteriskBilling.style.display='none';}else{it=1;}
  address.style.display = 'block';
  if(billing[0].checked){address.style.display = 'none';}
  required.style.display = showit[it];
}

function addressChange(id){
  onhold = false;
  if(street.value.length < 5){onhold = true;asterisk1.style.display = 'inline-block';}else{asterisk1.style.display = 'none';}
  if(city.value.length < 3 ){onhold = true;asterisk2.style.display = 'inline-block';}else{asterisk2.style.display = 'none';}
  if(state.value.length != 2) {onhold = true;asterisk3.style.display = 'inline-block';}else{asterisk3.style.display = 'none';}
  if(zip.value.length < 5){onhold = true;asterisk4.style.display = 'inline-block';}else{asterisk4.style.display = 'none';}
  warning.style.display = 'none';
  if(onhold == true){warning.style.display = 'block';}
  if(last.value.length > 1){asteriskLast.style.display = 'none';}
  if(first.value.length > 1){asteriskFirst.style.display = 'none';}

}
window.onload = init;
</script>

EOT;

$id = intval(str_replace('.','',$_SERVER['REMOTE_ADDR']));
foreach(glob("$id*.jsn") as $file){
  unlink($file);
}








/* $cnt = 0;
$x = rand(0,299);
$firsts = array('JAMES','JOHN','ROBERT','MICHAEL','WILLIAM','DAVID','RICHARD','CHARLES','JOSEPH','THOMAS','CHRISTOPHER','DANIEL','PAUL','MARK','DONALD','GEORGE','KENNETH','STEVEN','EDWARD','BRIAN','RONALD','ANTHONY','KEVIN','JASON','MATTHEW','GARY','TIMOTHY','JOSE','LARRY','JEFFREY','FRANK','SCOTT','ERIC','STEPHEN','ANDREW','RAYMOND','GREGORY','JOSHUA','JERRY','DENNIS','WALTER','PATRICK','PETER','HAROLD','DOUGLAS','HENRY','CARL','ARTHUR','RYAN','ROGER','JOE','JUAN','JACK','ALBERT','JONATHAN','JUSTIN','TERRY','GERALD','KEITH','SAMUEL','WILLIE','RALPH','LAWRENCE','NICHOLAS','ROY','BENJAMIN','BRUCE','BRANDON','ADAM','HARRY','FRED','WAYNE','BILLY','STEVE','LOUIS','JEREMY','AARON','RANDY','HOWARD','EUGENE','CARLOS','RUSSELL','BOBBY','VICTOR','MARTIN','ERNEST','PHILLIP','TODD','JESSE','CRAIG','ALAN','SHAWN','CLARENCE','SEAN','PHILIP','CHRIS','JOHNNY','EARL','JIMMY','ANTONIO','DANNY','BRYAN','TONY','LUIS','MIKE','STANLEY','LEONARD','NATHAN','DALE','MANUEL','RODNEY','CURTIS','NORMAN','ALLEN','MARVIN','VINCENT','GLENN','JEFFERY','TRAVIS','JEFF','CHAD','JACOB','LEE','MELVIN','ALFRED','KYLE','FRANCIS','BRADLEY','JESUS','HERBERT','FREDERICK','RAY','JOEL','EDWIN','DON','EDDIE','RICKY','TROY','RANDALL','BARRY','ALEXANDER','BERNARD','MARIO','LEROY','FRANCISCO','MARCUS','MICHEAL','THEODORE','CLIFFORD','MIGUEL','OSCAR','JAY','JIM','TOM','CALVIN','ALEX','JON','RONNIE','BILL','LLOYD','TOMMY','LEON','DEREK','WARREN','DARRELL','JEROME','FLOYD','LEO','ALVIN','TIM','WESLEY','GORDON','DEAN','GREG','JORGE','DUSTIN','PEDRO','DERRICK','DAN','LEWIS','ZACHARY','COREY','HERMAN','MAURICE','VERNON','ROBERTO','CLYDE','GLEN','HECTOR','SHANE','RICARDO','SAM','RICK','LESTER','BRENT','RAMON','CHARLIE','TYLER','GILBERT','GENE','MARC','REGINALD','RUBEN','BRETT','ANGEL','NATHANIEL','RAFAEL','LESLIE','EDGAR','MILTON','RAUL','BEN','CHESTER','CECIL','DUANE','FRANKLIN','ANDRE','ELMER','BRAD','GABRIEL','RON','MITCHELL','ROLAND','ARNOLD','HARVEY','JARED','ADRIAN','KARL','CORY','CLAUDE','ERIK','DARRYL','JAMIE','NEIL','JESSIE','CHRISTIAN','JAVIER','FERNANDO','CLINTON','TED','MATHEW','TYRONE','DARREN','LONNIE','LANCE','CODY','JULIO','KELLY','KURT','ALLAN','NELSON','GUY','CLAYTON','HUGH','MAX','DWAYNE','DWIGHT','ARMANDO','FELIX','JIMMIE','EVERETT','JORDAN','IAN','WALLACE','KEN','BOB','JAIME','CASEY','ALFREDO','ALBERTO','DAVE','IVAN','JOHNNIE','SIDNEY','BYRON','JULIAN','ISAAC','MORRIS','CLIFTON','WILLARD','DARYL','ROSS','VIRGIL','ANDY','MARSHALL','SALVADOR','PERRY','KIRK','SERGIO','MARION','TRACY','SETH','KENT','TERRANCE','RENE','EDUARDO','TERRENCE','ENRIQUE','FREDDIE','WADE');
$first = $firsts[$x];
$lasts = array('JOHNSON','WILLIAMS','BROWN','JONES','GARCIA','MILLER','DAVIS','RODRIGUEZ','MARTINEZ','HERNANDEZ','LOPEZ','GONZALEZ','WILSON','ANDERSON','THOMAS','TAYLOR','MOORE','JACKSON','MARTIN','LEE','PEREZ','THOMPSON','WHITE','HARRIS','SANCHEZ','CLARK','RAMIREZ','LEWIS','ROBINSON','WALKER','YOUNG','ALLEN','KING','WRIGHT','SCOTT','TORRES','NGUYEN','HILL','FLORES','GREEN','ADAMS','NELSON','BAKER','HALL','RIVERA','CAMPBELL','MITCHELL','CARTER','ROBERTS','GOMEZ','PHILLIPS','EVANS','TURNER','DIAZ','PARKER','CRUZ','EDWARDS','COLLINS','REYES','STEWART','MORRIS','MORALES','MURPHY','COOK','ROGERS','GUTIERREZ','ORTIZ','MORGAN','COOPER','PETERSON','BAILEY','REED','KELLY','HOWARD','RAMOS','KIM','COX','WARD','RICHARDSON','WATSON','BROOKS','CHAVEZ','WOOD','JAMES','BENNETT','GRAY','MENDOZA','RUIZ','HUGHES','PRICE','ALVAREZ','CASTILLO','SANDERS','PATEL','MYERS','LONG','ROSS','FOSTER','JIMENEZ','POWELL','JENKINS','PERRY','RUSSELL','SULLIVAN','BELL','COLEMAN','BUTLER','HENDERSON','BARNES','GONZALES','FISHER','VASQUEZ','SIMMONS','ROMERO','JORDAN','PATTERSON','ALEXANDER','HAMILTON','GRAHAM','REYNOLDS','GRIFFIN','WALLACE','MORENO','WEST','COLE','HAYES','BRYANT','HERRERA','GIBSON','ELLIS','TRAN','MEDINA','AGUILAR','STEVENS','MURRAY','FORD','CASTRO','MARSHALL','OWENS','HARRISON','FERNANDEZ','MCDONALD','WOODS','WASHINGTON','KENNEDY','WELLS','VARGAS','HENRY','CHEN','FREEMAN','WEBB','TUCKER','GUZMAN','BURNS','CRAWFORD','OLSON','SIMPSON','PORTER','HUNTER','GORDON','MENDEZ','SILVA','SHAW','SNYDER','MASON','DIXON','MUNOZ','HUNT','HICKS','HOLMES','PALMER','WAGNER','BLACK','ROBERTSON','BOYD','ROSE','STONE','SALAZAR','FOX','WARREN','MILLS','MEYER','RICE','SCHMIDT','GARZA','DANIELS','FERGUSON','NICHOLS','STEPHENS','SOTO','WEAVER','RYAN','GARDNER','PAYNE','GRANT','DUNN','KELLEY','SPENCER','HAWKINS','ARNOLD','PIERCE','VAZQUEZ','HANSEN','PETERS','SANTOS','HART','BRADLEY','KNIGHT','ELLIOTT','CUNNINGHAM','DUNCAN','ARMSTRONG','HUDSON','CARROLL','LANE','RILEY','ANDREWS','ALVARADO','RAY','DELGADO','BERRY','PERKINS','HOFFMAN','JOHNSTON','MATTHEWS','PENA','RICHARDS','CONTRERAS','WILLIS','CARPENTER','LAWRENCE','SANDOVAL','GUERRERO','GEORGE','CHAPMAN','RIOS','ESTRADA','ORTEGA','WATKINS','GREENE','NUNEZ','WHEELER','VALDEZ','HARPER','BURKE','LARSON','SANTIAGO','MALDONADO','MORRISON','FRANKLIN','CARLSON','AUSTIN','DOMINGUEZ','CARR','LAWSON','JACOBS','OBRIEN','LYNCH','SINGH','VEGA','BISHOP','MONTGOMERY','OLIVER','JENSEN','HARVEY','WILLIAMSON','GILBERT','DEAN','SIMS','ESPINOZA','HOWELL','LI','WONG','REID','HANSON','LE','MCCOY','GARRETT','BURTON','FULLER','WANG','WEBER','WELCH','ROJAS','LUCAS','MARQUEZ','FIELDS','PARK','YANG','LITTLE','BANKS','PADILLA','DAY','WALSH','BOWMAN','SCHULTZ','LUNA','FOWLER','MEJIA','DAVIDSON','ACOSTA','BREWER','MAY','HOLLAND','JUAREZ','NEWMAN','PEARSON','CURTIS','CORTEZ','DOUGLAS','SCHNEIDER','JOSEPH','BARRETT','NAVARRO','FIGUEROA','KELLER','AVILA','WADE','MOLINA','STANLEY','HOPKINS','CAMPOS','BARNETT','BATES','CHAMBERS','CALDWELL','BECK','LAMBERT','MIRANDA','BYRD','CRAIG','AYALA','LOWE','FRAZIER','POWERS','NEAL','LEONARD','GREGORY','CARRILLO','SUTTON','FLEMING','RHODES','SHELTON','SCHWARTZ','NORRIS','JENNINGS','WATTS','DURAN','WALTERS','COHEN','MCDANIEL','MORAN','PARKS','STEELE','VAUGHN','BECKER','HOLT','DELEON','BARKER','TERRY','HALE','LEON','HAIL','BENSON','HAYNES','HORTON','MILES','LYONS','PHAM','GRAVES','BUSH','THORNTON','WOLFE','WARNER','CABRERA','MCKINNEY','MANN','ZIMMERMAN','DAWSON','LARA','FLETCHER','PAGE','MCCARTHY','LOVE','ROBLES','CERVANTES','SOLIS','ERICKSON','REEVES','CHANG','KLEIN','SALINAS','FUENTES','BALDWIN','DANIEL','SIMON','VELASQUEZ','HARDY','HIGGINS','AGUIRRE','LIN','CUMMINGS','CHANDLER','SHARP','BARBER','BOWEN','OCHOA','DENNIS','ROBBINS','LIU','RAMSEY','FRANCIS','GRIFFITH','PAUL','BLAIR','OCONNOR','CARDENAS','PACHECO','CROSS','CALDERON','QUINN','MOSS','SWANSON','CHAN','RIVAS','KHAN','RODGERS','SERRANO','FITZGERALD','ROSALES','STEVENSON','CHRISTENSEN','MANNING','GILL','CURRY','MCLAUGHLIN','HARMON','MCGEE','GROSS','DOYLE','GARNER','NEWTON','BURGESS','REESE','WALTON','BLAKE','TRUJILLO','ADKINS','BRADY','GOODMAN','ROMAN','WEBSTER','GOODWIN','FISCHER','HUANG','POTTER','DELACRUZ','MONTOYA','TODD','WU','HINES','MULLINS','CASTANEDA','MALONE','CANNON','TATE','MACK','SHERMAN','HUBBARD','HODGES','ZHANG','GUERRA','WOLF','VALENCIA','SAUNDERS','FRANCO','ROWE','GALLAGHER','FARMER','HAMMOND','HAMPTON','TOWNSEND','INGRAM','WISE','GALLEGOS','CLARKE','BARTON','SCHROEDER','MAXWELL','WATERS','LOGAN','CAMACHO','STRICKLAND','NORMAN','PERSON','COLON','PARSONS','FRANK','HARRINGTON','GLOVER','OSBORNE','BUCHANAN','CASEY','FLOYD','PATTON','IBARRA','BALL','TYLER','SUAREZ','BOWERS','OROZCO','SALAS','COBB','GIBBS','ANDRADE','BAUER','CONNER','MOODY','ESCOBAR','MCGUIRE','LLOYD','MUELLER','HARTMAN','FRENCH','KRAMER','MCBRIDE','POPE','LINDSEY','VELAZQUEZ','NORTON','MCCORMICK','SPARKS','FLYNN','YATES','HOGAN','MARSH','MACIAS','VILLANUEVA','ZAMORA','PRATT','STOKES','OWEN','BALLARD','LANG','BROCK','VILLARREAL','CHARLES','DRAKE','BARRERA','CAIN','PATRICK','PINEDA','BURNETT','MERCADO','SANTANA','SHEPHERD','BAUTISTA','ALI','SHAFFER','LAMB','TREVINO','MCKENZIE','HESS','BEIL','OLSEN','COCHRAN','MORTON','NASH','WILKINS','PETERSEN','BRIGGS','SHAH','ROTH','NICHOLSON','HOLLOWAY','LOZANO','RANGEL','FLOWERS','HOOVER','SHORT','ARIAS','MORA','VALENZUELA','BRYAN','MEYERS','WEISS','UNDERWOOD','BASS','GREER','SUMMERS','HOUSTON','CARSON','MORROW','CLAYTON','WHITAKER','DECKER','YODER','COLLIER','ZUNIGA','CAREY','WILCOX','MELENDEZ','POOLE','ROBERSON','LARSEN','CONLEY','DAVENPORT','COPELAND','MASSEY','LAM','HUFF','ROCHA','CAMERON','JEFFERSON','HOOD','MONROE','ANTHONY','PITTMAN','HUYNH','RANDALL','SINGLETON','KIRK','COMBS','MATHIS','CHRISTIAN','SKINNER','BRADFORD','RICHARD','GALVAN','WALL','BOONE','KIRBY','WILKINSON','BRIDGES','BRUCE','ATKINSON','VELEZ','MEZA','ROY','VINCENT','YORK','HODGE','VILLA','ABBOTT','ALLISON','TAPIA','GATES','CHASE','SOSA','SWEENEY','FARRELL','WYATT','DALTON','HORN','BARRON','PHELPS','YU','DICKERSON','HEATH','FOLEY','ATKINS','MATHEWS','BONILLA','ACEVEDO','BENITEZ','ZAVALA','HENSLEY','GLENN','CISNEROS','HARRELL','SHIELDS','RUBIO','HUFFMAN','CHOI','BOYER','GARRISON','ARROYO','BOND','KANE','HANCOCK','CALLAHAN','DILLON','CLINE','WIGGINS','GRIMES','ARELLANO','MELTON','ONEILL','SAVAGE','HO','BELTRAN','PITTS','PARRISH','PONCE','RICH','BOOTH','KOCH','GOLDEN','WARE','BRENNAN','MCDOWELL','MARKS','CANTU','HUMPHREY','BAXTER','SAWYER','CLAY','TANNER','HUTCHINSON','KAUR','BERG','WILEY','GILMORE','RUSSO','VILLEGAS','HOBBS','KEITH','WILKERSON','AHMED','BEARD','MCCLAIN','MONTES','MATA','ROSARIO','VANG','WALTER','HENSON','ONEAL','MOSLEY','MCCLURE','BEASLEY','STEPHENSON','SNOW','HUERTA','PRESTON','VANCE','BARRY','JOHNS','EATON','BLACKWELL','DYER','PRINCE','MACDONALD','SOLOMON','GUEVARA','STAFFORD','ENGLISH','HURST','WOODARD','CORTES','SHANNON','KEMP','NOLAN','MCCULLOUGH','MERRITT','MURILLO','MOON','SALGADO','STRONG','KLINE','CORDOVA','BARAJAS','ROACH','ROSAS','WINTERS','JACOBSON','LESTER','KNOX','BULLOCK','KERR','LEACH','MEADOWS','ORR','DAVILA','WHITEHEAD','PRUITT','KENT','CONWAY','MCKEE','BARR','DAVID','DEJESUS','MARIN','BERGER','MCINTYRE','BLANKENSHIP','GAINES','PALACIOS','CUEVAS','BARTLETT','DURHAM','DORSEY','MCCALL','ODONNELL','STEIN','BROWNING','STOUT','LOWERY','SLOAN','MCLEAN','HENDRICKS','CALHOUN','SEXTON','CHUNG','GENTRY','HULL','DUARTE','ELLISON','NIELSEN','GILLESPIE','BUCK','MIDDLETON','SELLERS','LEBLANC','ESPARZA','HARDIN','BRADSHAW','MCINTOSH','HOWE','LIVINGSTON','FROST','GLASS','MORSE','KNAPP','HERMAN','STARK','BRAVO','NOBLE','SPEARS','WEEKS','CORONA','FREDERICK','BUCKLEY','MCFARLAND','HEBERT','ENRIQUEZ','HICKMAN','QUINTERO','RANDOLPH','SCHAEFER','WALLS','TREJO','HOUSE','REILLY','PENNINGTON','MICHAEL','CONRAD','GILES','BENJAMIN','CROSBY','FITZPATRICK','DONOVAN','MAYS','MAHONEY','VALENTINE','RAYMOND','MEDRANO','HAHN','MCMILLAN','SMALL','BENTLEY','FELIX','PECK','LUCERO','BOYLE','HANNA','PACE','RUSH','HURLEY','HARDING','MCCONNELL','BERNAL','NAVA','AYERS','EVERETT','VENTURA','AVERY','PUGH','MAYER','BENDER','SHEPARD','MCMAHON','LANDRY','CASE','SAMPSON','MOSES','MAGANA','BLACKBURN','DUNLAP','GOULD','DUFFY','VAUGHAN','HERRING','MCKAY','ESPINOSA','RIVERS','FARLEY','BERNARD','ASHLEY','FRIEDMAN','POTTS','TRUONG','COSTA','CORREA','BLEVINS','NIXON','CLEMENTS','FRY','DELAROSA','BEST','BENTON','LUGO','PORTILLO','DOUGHERTY','CRANE','HALEY','PHAN','VILLALOBOS','BLANCHARD','HORNE','FINLEY','QUINTANA','LYNN','ESQUIVEL','BEAN','DODSON','MULLEN','XIONG','HAYDEN','CANO','LEVY','HUBER','RICHMOND','MOYER','LIM','FRYE','SHEPPARD','MCCARTY','AVALOS','BOOKER','WALLER','PARRA','WOODWARD','JARAMILLO','KRUEGER','RASMUSSEN','BRANDT','PERALTA','DONALDSON','STUART','FAULKNER','MAYNARD','GALINDO','COFFEY','ESTES','SANFORD','BURCH','MADDOX','VO','OCONNELL','VU','ANDERSEN','SPENCE','MCPHERSON','CHURCH','SCHMITT','STANTON','LEAL','CHERRY','COMPTON','DUDLEY','SIERRA','POLLARD','ALFARO','HESTER','PROCTOR','LU','HINTON','NOVAK','GOOD','MADDEN','MCCANN','TERRELL','JARVIS','DICKSON','REYNA','CANTRELL','MAYO','BRANCH','HENDRIX','ROLLINS','ROWLAND','WHITNEY','DUKE','ODOM','DAUGHERTY','TRAVIS','TANG');
$x = rand(0,998);
$last = $lasts[$x];
$first = ucfirst(strtolower($first));
$last = ucwords(strtolower($last));
$cities = array('Washington','Springfield','Franklin','Greenville','Bristol','Clinton','Fairview','Salem','Madison','Georgetown','Aberdeen','Abilene','Akron','Albany','Albuquerque','Alexandria','Allentown','Amarillo','Anaheim','Anchorage','Ann Arbor','Antioch','Apple Valley','Appleton','Arlington','Arvada','Asheville','Athens','Atlanta','Atlantic City','Augusta','Aurora','Austin','Bakersfield','Baltimore','Barnstable','Baton Rouge','Beaumont','Bel Air','Bellevue','Berkeley','Bethlehem','Billings','Birmingham','Bloomington','Boise','Boise City','Bonita Springs','Boston','Boulder','Bradenton','Bremerton','Bridgeport','Brighton','Brownsville','Bryan','Buffalo','Burbank','Burlington','Cambridge','Canton','Cape Coral','Carrollton','Cary','Cathedral City','Cedar Rapids','Champaign','Chandler','Charleston','Charlotte','Chattanooga','Chesapeake','Chicago','Chula Vista','Cincinnati','Clarke County','Clarksville','Clearwater','Cleveland','College Station','Colorado Springs','Columbia','Columbus','Concord','Coral Springs','Corona','Corpus Christi','Costa Mesa','Dallas','Daly City','Danbury','Davenport','Davidson County','Dayton','Daytona Beach','Deltona','Denton','Denver','Des Moines','Detroit','Downey','Duluth','Durham','El Monte','El Paso','Elizabeth','Elk Grove','Elkhart','Erie','Escondido','Eugene','Evansville','Fairfield','Fargo','Fayetteville','Fitchburg','Flint','Fontana','Fort Collins','Fort Lauderdale','Fort Smith','Fort Walton Beach','Fort Wayne','Fort Worth','Frederick','Fremont','Fresno','Fullerton','Gainesville','Garden Grove','Garland','Gastonia','Gilbert','Glendale','Grand Prairie','Grand Rapids','Grayslake','Green Bay','GreenBay','Greensboro','Greenville','Gulfport-Biloxi','Hagerstown','Hampton','Harlingen','Harrisburg','Hartford','Havre de Grace','Hayward','Hemet','Henderson','Hesperia','Hialeah','Hickory','High Point','Hollywood','Honolulu','Houma','Houston','Howell','Huntington','Huntington Beach','Huntsville','Independence','Indianapolis','Inglewood','Irvine','Irving','Jackson','Jacksonville','Jefferson','Jersey City','Johnson City','Joliet','Kailua','Kalamazoo','Kaneohe','Kansas City','Kennewick','Kenosha','Killeen','Kissimmee','Knoxville','Lacey','Lafayette','Lake Charles','Lakeland','Lakewood','Lancaster','Lansing','Laredo','Las Cruces','Las Vegas','Layton','Leominster','Lewisville','Lexington','Lincoln','Little Rock','Long Beach','Lorain','Los Angeles','Louisville','Lowell','Lubbock','Macon','Madison','Manchester','Marina','Marysville','McAllen','McHenry','Medford','Melbourne','Memphis','Merced','Mesa','Mesquite','Miami','Milwaukee','Minneapolis','Miramar','Mission Viejo','Mobile','Modesto','Monroe','Monterey','Montgomery','Moreno Valley','Murfreesboro','Murrieta','Muskegon','Myrtle Beach','Naperville','Naples','Nashua','Nashville','New Bedford','New Haven','New London','New Orleans','New York','New York City','Newark','Newburgh','Newport News','Norfolk','Normal','Norman','North Charleston','North Las Vegas','North Port','Norwalk','Norwich','Oakland','Ocala','Oceanside','Odessa','Ogden','Oklahoma City','Olathe','Olympia','Omaha','Ontario','Orange','Orem','Orlando','Overland Park','Oxnard','Palm Bay','Palm Springs','Palmdale','Panama City','Pasadena','Paterson','Pembroke Pines','Pensacola','Peoria','Philadelphia','Phoenix','Pittsburgh','Plano','Pomona','Pompano Beach','Port Arthur','Port Orange','Port Saint Lucie','Port St. Lucie','Portland','Portsmouth','Poughkeepsie','Providence','Provo','Pueblo','Punta Gorda','Racine','Raleigh','Rancho Cucamonga','Reading','Redding','Reno','Richland','Richmond','Richmond County','Riverside','Roanoke','Rochester','Rockford','Roseville','Round Lake Beach','Sacramento','Saginaw','Saint Louis','Saint Paul','Saint Petersburg','Salem','Salinas','Salt Lake City','San Antonio','San Bernardino','San Buenaventura','San Diego','San Francisco','San Jose','Santa Ana','Santa Barbara','Santa Clara','Santa Clarita','Santa Cruz','Santa Maria','Santa Rosa','Sarasota','Savannah','Scottsdale','Scranton','Seaside','Seattle','Sebastian','Shreveport','Simi Valley','Sioux City','Sioux Falls','South Bend','South Lyon','Spartanburg','Spokane','Springdale','Springfield','St. Louis','St. Paul','St. Petersburg','Stamford','Sterling Heights','Stockton','Sunnyvale','Syracuse','Tacoma','Tallahassee','Tampa','Temecula','Tempe','Thornton','Thousand Oaks','Toledo','Topeka','Torrance','Trenton','Tucson','Tulsa','Tuscaloosa','Tyler','Utica','Vallejo','Vancouver','Vero Beach','Victorville','Virginia Beach','Visalia','Waco','Warren','Washington','Waterbury','Waterloo','West Covina','West Valley City','Westminster','Wichita','Wilmington','Winston','Winter Haven','Worcester','Yakima','Yonkers','York','Youngstown');
$x = rand(0,393);
$city = $cities[$x];
$direction =array('E','W','S','N','SE','SW','NE','NW');
$checked = array('','','','','','');
$checked[1] = 'checked';
$zip = rand(11111,99999);
$states= array ( 'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'IN', 'FL', 'GA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'MI', 'MO', 'MS', 'MT', 'NC', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'SC', 'TN', 'TX', 'VA', 'WA', 'WI', 'WV', 'WY');
$x = rand(0,39);
$state = "$states[$x]";

$streets = array('Main Street','Church Street','Main Street North','Main Street South','Elm Street','High Street','Main Street West','Washington Street','Main Street East','Park Avenue','2nd Street','Walnut Street','Chestnut Street','Maple Avenue','Maple Street','Broad Street','Oak Street','Center Street','Pine Street','River Road','Market Street','Water Street','Union Street','South Street','Park Street','3rd Street','Washington Avenue','Cherry Street','North Street','4th Street','Court Street','Highland Avenue','Mill Street','Franklin Street','Prospect Street','School Street','Spring Street','Central Avenue','1st Street','State Street','Front Street','West Street','Jefferson Street','Cedar Street','Jackson Street','Park Place','Bridge Street','Locust Street','Madison Avenue','Meadow Lane','Spruce Street','Grove Street','Ridge Road','5th Street','Pearl Street','Lincoln Street','Madison Street','Dogwood Drive','Lincoln Avenue','Pennsylvania Avenue','Pleasant Street','4th Street West','Adams Street','Jefferson Avenue','3rd Street West','7th Street','Academy Street','11th Street','2nd Avenue','East Street','Green Street','Hickory Lane','Route 1','Summit Avenue','Virginia Avenue','12th Street','5th Avenue','6th Street','9th Street','Charles Street','Cherry Lane','Elizabeth Street','Hill Street','River Street','10th Street','Colonial Drive','Monroe Street','Valley Road','Winding Way','1st Avenue','Fairway Drive','Liberty Street','2nd Street West','3rd Avenue','Broadway','Church Road','Delaware Avenue','Prospect Avenue','Route 30','Sunset Drive','Vine Street','Woodland Drive','6th Street West','Brookside Drive','Hillside Avenue','Lake Street','13th Street','4th Avenue','5th Street North','College Street','Dogwood Lane','Mill Road','7th Avenue','8th Street','Beech Street','Division Street','Harrison Street','Heather Lane','Lakeview Drive','Laurel Lane','New Street','Oak Lane','Primrose Lane','Railroad Street','Willow Street','4th Street North','5th Street West','6th Avenue','Berkshire Drive','Buckingham Drive','Circle Drive','Clinton Street','George Street','Hillcrest Drive','Hillside Drive','Laurel Street','Park Drive','Penn Street','Railroad Avenue','Riverside Drive','Route 32','Route 6','Sherwood Drive','Summit Street','2nd Street East','6th Street North','Cedar Lane','Creek Road','Durham Road','Elm Avenue','Fairview Avenue','Front Street North','Grant Street','Hamilton Street','Highland Drive','Holly Drive','King Street','Lafayette Avenue','Linden Street','Mulberry Street','Poplar Street','Ridge Avenue','7th Street East','Belmont Avenue','Cambridge Court','Cambridge Drive','Clark Street','College Avenue','Essex Court','Franklin Avenue','Hilltop Road','James Street','Magnolia Drive','Myrtle Avenue','Route 10','Route 29','Shady Lane','Surrey Lane','Walnut Avenue','Warren Street','Williams Street','Wood Street','Woodland Avenue');
$address = rand(100,9999) . ' ' . $direction[rand(0,count($direction))] . ' ' .  $streets[rand(0,count($streets))];
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
*/
?>


