<?
header('Content-Type: text/html');
echo '<html><head><style>#A,#B,#C,#D,#E,#F,#G,#F,#G,#H,#I,#J,#K,#L,#M,#N,#O,#P,#Q,#R,#S,#T,#U,#V,#W,#X,#Y,#Z{display:none;}div,table,button{;border-width: 2px;padding:0px;margin:0px 0px 0px 0px;}button{width:30px;color:#fff;background: linear-gradient(to bottom, rgba(0,0,255,1) 0%, rgba(0,0,64,1) 100%);}</style></head><body>';

$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
$time = date('Y-m-d',time() - 15550000); 


$client = 200032;


  

$name = "big JOHN o'dell-smIth SÃO JOÃO DOS SANTOS";
$name = ucWords(strtolower($name)," -'");
echo $name;exit;




$sql = "SELECT `Last`,`First`,`Patient`,`Date`,`DoB`,`Volume` FROM `Patient` WHERE `Client`= $client AND `Date` > '$time' ORDER BY `Last`";
$results = mysqli_query($link,$sql);


while (list($Last,$First,$Patient,$Date,$DoB,$Volume) = mysqli_fetch_array($results, MYSQLI_NUM)){
  $first = substr($Last,0,1);
  $patients[$first] += 1;
  $Last = ucWords(strtolower($Last)," -'");
  $First = ucWords(strtolower($First)," -'");
  $names[$first][] = "\n<tr><td>$Last, $First</td><td>$Volume</td><td>$Patient</td><td>$Date</td><td>$DoB</td></tr>";
  
}
ksort($patients);
ksort($names);
foreach($patients as $first => $cnt){
echo "<button onclick=\"view('$first');\"><span style=\"font:700 1em Arial\">$first</span> <div style=\"font-size:.7em;margin:0 0 3px 0;\"> $cnt</div></button>";
}
foreach($names as $letter => $patients){
  echo '<div id="' .$letter . '" ><table>';
  foreach($patients as $patient => $row){
    echo "$row\n";
  }
  echo '</table></div>';
}
echo <<<EOT
<script>
var saveLetter = 'A';
function view(letter){
  document.getElementById(saveLetter).style.display = 'none';
  document.getElementById(letter).style.display = 'block';
  saveLetter = letter;
}
</script>

EOT;

?>