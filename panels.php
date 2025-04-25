<?php


ob_start("ob_gzhandler");
header('Content-Type: text/html; charset=utf-8');
header('Connection: Keep-Alive');
header('Keep-Alive: timeout=5, max=100');
header('Cache-Control: max-age=0');
echo <<<EOT
<!DOCTYPE html><html lang="en">
<head><title>Panels</title>
<meta name="viewport" content="width=400, initial-scale=1.0" />
<style>
body{width:100%;font:400 1em Arial,sans-serif;margin:0;color:#004;padding:0;background:#f7f7fb;}
.row{font:700 1.2em Arial,sans-serif;margin:4px;}
.pnum{display:inline-block;width:75px;}
.clk{cursor:pointer;display:inline-block;margin: 0 0 0 0;padding:3.5px 2px 2.3px 10px;font: 700 .9em Arial,sans-serif;width:300px;color:#fff;text-align:left;background: linear-gradient(to bottom, #2bf 0%, #02f 100%);}
.ckback{display:inline-block;background: linear-gradient(to bottom, #2af 0%, #02f 100%);padding:2px 3px 0 2px;padding:2px 3px 0 2px;margin:0;}
.ige{color:#fff;background:#f00;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.igg{color:#fff;background:#00f;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.igg4{color:#000;background:#ff0;text-align:center;width:30px;display:inline-block;padding:2px 0 2px 0;margin:0;}
.total{color:#000;background:#ddd;text-align:center;width:30px;display:inline-block;border 2px solid #f00;padding:2px 0 2px 0;margin:0;}
</style></head><body>

<div id="page">
<img src="logo.gif" alt="logo" />$client $rec<br>
<form action="#" method="post">

<table>
EOT;










$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
$link = mysqli_connect('localhost','amx',$data,'amx_portal');
foreach($_POST as $panel => $description){
  $sql = "UPDATE `clientPanels` SET `description`='$description' WHERE `client` = $client AND `panel` LIKE '$panel'";
   mysqli_query($link,$sql);
}
$sql = "SELECT `description`,`panel`,`e`,`g`,`g4`,`total` FROM `clientPanels` WHERE `client` = $client  ORDER BY `clientPanels`.`description` ASC";
$panelTest = array();
$results = mysqli_query($link,$sql);
while (list($description,$panel,$e,$g,$g4,$total) = mysqli_fetch_array($results, MYSQLI_NUM)){
    echo <<<EOT
	<tr><td>$panel</td><td><input type="text"  name="$panel" value="$description" size="30"/></td><td class="ige">$e</td><td class="igg">$g</td><td class="igg4">$g4</td><td class="total">$total</td></tr>
EOT;
}


echo "</table><button>Update</button></form>"



















/*$panels['100T'] = 'Total IgE';
$panels['101T'] = 'High Dil.Total IgE';
$panels['201'] = 'Hymenoptera (5-IgE)';
$panels['200-PD'] = 'Ped (T-IgE/18IgE/10 IgG4)';
$panels['200-1C'] = 'MEX Z-1';
$panels['200-2C'] = 'MEX Z-2';
$panels['200-3C'] = 'MEX Z-3';
$panels['200-4C'] = 'MEX Z-4';
$panels['200-5C'] = 'MEX Z-5';
$panels['200-6C'] = 'MEX Z-6';
$panels['200-7C'] = 'MEX Z-7';
$panels['200-8C'] = 'MEX Z-8';
$panels['250'] = 'Aller food ID (IgE)';
$panels['250-G'] = 'Aller food ID (IgG)';
$panels['250-G4'] = 'Aller food ID (IgG4)';
$panels['252'] = 'Aller molds(IgG)';
$panels['200TN'] = 'Aller-ID TN';
$panels['200FL'] = 'Aller-ID FL';
$panels['200GA'] = 'Aller-ID GA';
$panels['200AZ'] = 'Aller-ID AZ';
$panels['200TX'] = 'Aller-ID TX';
$panels['200MO'] = 'Aller-ID MO';
$panels['700'] = 'Food Pnl (33IgE/IgG4)';
$panels['900'] = 'Food Pnl(40IgE/IgG4)';
$panels['901'] = 'Food Pnl(28IgE/22IgG4)';
$panels['900-1'] = 'Total IgG';
$panels['900-2'] = 'Total IgA';
$panels['900-3'] = 'Total IgM';
$panels['900-4'] = 'Immuno Pnl (TIgG/TIgA/TIgM)';
$panels['991'] = 'Gastro Pnl(46IgE/45IgG4)';
*/



?>
















