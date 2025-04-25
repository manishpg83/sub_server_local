<?php
header('Content-Type: text/plain; charset=utf-8');
$new = array();
$json = json_decode(file_get_contents('idc.jsn'),true);
$ndx = 0;
$terms = array('code'=>1,'see'=>2,'seeAlso'=>3,'seeAlso'=>4,'seecat'=>5,'term'=>6);
foreach ($json as $key => $array){
foreach ($array as $k => $v){ // var_export( $json[$key][$k]); echo "\n----------------------------\n";
$arr =array();
foreach ($json[$key][$k] as $term => $value){
  if($term == 'title'){continue;}
  $arr[$terms[$term]] = $value;
 // echo $terms[$term] . "key=$key k=$k term=$term val=$value\n";
}

$new[$json[$key][$k]['title']] = $arr;
//$json[$key][$k]['code'],
//$json[$key][$k]['see'],
//$json[$key][$k]['seeAlso'],
//$json[$key][$k]['manif'],
//$json[$key][$k]['subcat'],
//$json[$key][$k]['seecat'],

//$ndx++;
//if ($ndx > 100){exit;}
}
}
    $fp = fopen('idcc.jsn','w');
    fwrite($fp,json_encode($new));
	var_export($new);
























	
	
	
exit;
$new = array();
$json = json_decode(file_get_contents('idc.jsn'),true);
$ndx = 0;
foreach ($json as $key => $array){
foreach ($array as $k => $v){

$new[$ndx] = array(
$json[$key][$k]['code'],
$json[$key][$k]['see'],
$json[$key][$k]['seeAlso'],
$json[$key][$k]['manif'],
$json[$key][$k]['subcat'],
$json[$key][$k]['seecat'],
$json[$key][$k]['term']);
foreach ($new[$ndx] as $num => $value){
  if(is_null($value)){$new[$ndx][$num] = ''; }
} 
$ndx++;
}
}
    $fp = fopen('idcc.jsn','w');
    fwrite($fp,json_encode($new));

?>