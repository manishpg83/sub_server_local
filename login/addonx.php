<?php
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=1800');
$lookuplast = trim($_POST['lookuplast']);
echo <<<EOT
<!DOCTYPE html><html lang="en"><head><title>Test Allermetrix eOffice New Request</title>
<meta name="viewport" content="width=480, initial-scale=1.0" />
<style>
body{font-family:arial;border:0;padding:0;margin:0;background:#f7f7fb;}
#logo{margin:0 auto 0;}
#content{max-width:640px;margin:0 auto 0 ;padding:20px;}
#col1,#col2,#col3{float:left;width:300px;}
#col2,#col3{margin-left:2em;display:none;}
#footer{text-align:center;padding-top:8em;clear: left;}
#menu{display:inline-block;}
#copyright{padding-top:1.5em;font-size:0.8em;}
.white{color:#fff;}
.bold{font-weight:bolder;color:#00515a;font-size:1em;margin-bottom:10px;}
.center{text-align:center;}
h1,h2,h3{margin: 20px auto 0;}
h2{text-align:center;}
label{margin-top:10px;font-size:1.3em;}
textarea{border-radius: 4px;font-family:Arial;}
#comment{height:86px;}
input{padding:5px;font-size:1.1em;border-radius: 4px;width:227px;}
.hide{display:none;}
.red{color:red;font:700 .7em Arial;}
.big{font-size:1.3em;}

.select{color:#fff;background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
#lookup,.btn{margin:5px 0 0 0;width: 100%;height:40px;padding:5px 2em 5px 2em;border-radius: 3px 3px 3px 3px;box-shadow: #999 0 2px 5px;
font: 700 1em Arial,Helvetica,Calibri,sans-serif;overflow: visible;
border:1px solid #69B5B3;color: #fff;background-color:#144;
background-image: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}
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
rt{background:#f00;color:#fff;}
#autofill{font-size:.8em}
#header{margin:0 auto 0;width:640px;}
p{line-height:1.5;font:400 1em/1.3 Arial,sans-serif;}
#cap{display:block; margin:50px auto 0;}
#billing{margin:20px 0 0 0;}
.p{margin:50px 0 0 0;}
#caption{font-style: italic;font:700 13px Arial,sans-serif;margin:0 0 0 20px;}
#logo{width:197px;margin:20px 0 20px 0;}
#buttons{margin:0 auto;width:400px;}
#look{margin:0 auto 0;width:475px;}
#entry{width:240px;margin:0 auto;}
</style></head><body>
<div id="header">
<img src="allermetrix_E-office600.jpg" alt="Allermetrix E-Office" /><br>$clientname<br>
 
</div>
EOT;
$cnt = 0;
echo <<<EOT
<h2>Create Request Form</h2>

<div id="content">
<div id="buttons">
<form action="./indexx.php" method="post">
<button class="btn">Create Request Form For a Patient</button><br>
<input type="hidden" name="sub" value="56" />
<input type="hidden" name="client" value="$client" />
</form>
<br>
<button id="b" class="btn" onclick="addon()">Create An Add On Request Form </button><br>
<p>Add-on testing is available for patients who have been tested by Allermetrix within the last 6 months.</p>
<p>IgG & IgG4 testing must be performed within 2 months.</p>
<p>IgE specimens are viable for up to 6 months.

</div>
<div id="look"><div id="entry">
<p>Enter Patient's Last Name<br>or first letter(s) of last name</p>
<form action="./indexx.php" method="post"><input type="hidden" name="sub" value="53" />

<br>Patient Last: <br><input $lclass type="text" name="lookuplast" value="$lookuplast" autocomplete="off" /><br><br><button id="lookup">Lookup past 6 months</button>
</div><br>
<input type="hidden" name="client" value="$client" />
</form>$loouplast<table>
$tablehead
EOT;
$hide = "b.style.display = 'none';";
$patients = array();
$buttons = '';
$found = 0;
$celiac = 0;
$in = '(';
if(strlen($lookuplast) > 0){
	
  $buttons = "document.getElementById('buttons').style.display = 'none';";
  $hide = "b.style.display = 'block';";
  $time = date('Y-m-d',time() - 15550000); 
  $sql = "SELECT `rec`,`Patient`,`Date`,`Last`,`First`,`DoB`,`address`,`city`,`state`,`zip`,`phone`,`email`,`Collection`,`Volume` FROM `Patient` WHERE `Client`= $client AND `Date` > '$time' AND `Last` LIKE '$lookuplast%' ORDER BY `Last`,`First` ";  //SELECT `Patient`,`Date`,`Last`,`First`,`DoB`,`Collection`,`Volume`,MAX(`Patient`)  FROM `Patient` WHERE `Client`= $client AND `Date` > '$time' AND `Last` LIKE '$lookuplast%' GROUP BY `Last`,`First`,`DoB` ORDER BY `Last`,`DoB`";
//echo $sql;exit;
  $results = mysqli_query($link,$sql);
  $ndx = 0;
  $t = microtime(1);
  $times = array();
  while (list($rec,$accession,$date,$last,$first,$dob,$address,$city,$state,$zip,$phone,$email,$collection,$volume) = mysqli_fetch_array($results, MYSQLI_NUM)){$times[intval((microtime(1) - $t) * 1000000)] = 'fetch patient';$found++; $in .= " $accession,";
	$sql = "SELECT COUNT(*) FROM `Test` WHERE `Patient` = $accession AND `Code`LIKE 'S114' LIMIT 1";
	$result = mysqli_query($link,$sql);
	list($cnt) = mysqli_fetch_array($result, MYSQLI_NUM);$times[intval((microtime(1) - $t) * 1000000)] = 'fetch codes';
	if($cnt == 1){$celiacs[] = "$accession $last $first";$celiac++;continue;}//echo $cnt . $sql;exit;
	if($savelast != $last || $savefirst != $first || $savedob != $dob){$ndx++;$name = '';}
	$patients[$ndx][] = $accession;
	$name .= ", $accession";
	$names[$ndx] = "$last, $first$name";
	$savelast = $last;
	$savefirst = $first;
	$savedob = $dob;
  }
  echo '<tr><td></td><td>&emsp;Name</td><td>&emsp;DoB</td><td>&emsp;Accession</td></tr>';
  foreach($patients as $ndx => $accessions){
    $accession = max($accessions);
	$sql = "SELECT `rec`,`Patient`,`Date`,`Last`,`First`,`DoB`,`Collection`,`Volume` FROM `Patient` WHERE `Patient` = $accession LIMIT 1"; // `Client`= $client AND `Date` > '$time' AND `Last` LIKE '$lookuplast%' ORDER BY `Last`,`First` ";  //SELECT `Patient`,`Date`,`Last`,`First`,`DoB`,`Collection`,`Volume`,MAX(`Patient`)  FROM `Patient` WHERE `Client`= $client AND `Date` > '$time' AND `Last` LIKE '$lookuplast%' GROUP BY `Last`,`First`,`DoB` ORDER BY `Last`,`DoB`";
    $results = mysqli_query($link,$sql);//echo $cnt . $sql;exit;
	list($rec,$accession,$date,$last,$first,$dob,$collection,$volume) = mysqli_fetch_array($results, MYSQLI_NUM);
	$volume = number_format($volume,1);
    if($dob == '0000-00-00'){$dob = 'Not Given';}
	$volume = number_format($volume,1);
    echo "<tr><td><form action=\"./indexx.php\" method=\"post\"><button class=\"select\">Select</button><input type=\"hidden\" name=\"client\" value=\"$client\" /><input type=\"hidden\" name=\"Accession\" value=\"$accession\" /><input type=\"hidden\" name=\"dob\" value=\"$dob\" /><input type=\"hidden\" name=\"volume\" value=\"$volume\" /><input type=\"hidden\" name=\"sub\" value=\"55\" /></form></td><td>&emsp;$last, $first</td><td>&emsp;$dob</td><td>&emsp;$accession</td></tr>\n"; //<td>&emsp;$collection</td><td>&emsp;$volume</td><td>$accession</td></tr>\n";
  }
 //   $DOB = strtotime($dob);
 //   $dob = date('m-d-Y',$DOB);
//	echo $sql;exit;
  $in = trim($in,' ,') . ')';
}
echo <<<EOT
</table></div></div><br>

<script>
var b =  document.getElementById('look');

var toggle = [];
toggle['block'] = 'none';
toggle['none'] = 'block';
$hide
$buttons
function addon(){
	b.style.display = toggle[b.style.display];
	document.getElementById('buttons').style.display = 'none';
}
console.log(b);




</script>

EOT;

//SELECT `Patient`,`Date`,`Last`,`First`,`DoB`,`Age`,`Sex`,`ClientID` FROM `Patient` WHERE `Client`=200014 AND `DoB` = '0000-00-00' 
/*$x = rand(0,299);
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
</table></div>




