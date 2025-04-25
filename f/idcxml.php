<?php
header('Content-Type: text/plain; charset=utf-8');

$icd = json_decode(file_get_contents('idcc.jsn'),true); // 4247240 4247161 4102037
//$icd = $icd['letter'];
 //   $fp = fopen('Index.jsn','w');
 //   fwrite($fp,json_encode($icd));
//var_export($icd);exit;
//foreach($icd['letter'][1]['mainTerm'] as $k => $v){
//$terms = array('code'=>1,'see'=>2,'seeAlso'=>3,'seeAlso'=>4,'seecat'=>5,'term'=>6);
foreach($icd as $k => $v){ $carry = '@';

//  $carry .= "$k  ";
  foreach($v as $k1 => $v1){
    if(is_array($v1)){
	  $carry = '';
	  foreach($v1 as $k2 => $v2){
	    if(is_array($v2)){
		 // $carry .= ".=$k2  ";
		  foreach($v2 as $k3 => $v3){
		    if(is_array($v3)){
			  if($k3 == 'term'){continue;}
			  $carry .= ".3: $k3  ";
			  foreach($v3 as $k4 => $v4){
			    if(is_array($v4)){
				  $carry .= ".4: $k4  ";
				  foreach($v4 as $k5 => $v5){
				    if(is_array($v5)){
					  $carry .= ".5: $k5  ";
					  foreach($v5 as $k6 => $v6){
					    if(is_array($v6)){
						  $carry .= ".6: $k6  ";
						  foreach($v6 as $k7 => $v7){
						    if(is_array($v7)){
							  $carry .= ".7: $k7  ";
							  foreach($v7 as $k8=> $v8){
							    if(is_array($v8)){
								  $carry .= ".8: $k8  ";
								  foreach($v8 as $k9=> $v9){
								    if(is_array($v9)){
									  $carry .= ".9: $k9  ";
									  foreach($v9 as $k10=> $v10){
									    if(is_array($v10)){
										  $carry .= ".10: $k10  ";
										  foreach($v10 as $k11=> $v11){
										    if(is_array($v11)){
											  $carry .= ".11: $k11  ";
											  foreach($v11 as $k12=> $v12){
											    if(is_array($v12)){
												  $carry .= ".12: $k12  ";
												  foreach($v12 as $k13=> $v13){
												    if(is_array($v13)){
													  $carry .= ".13: $k13  ";
													  foreach($v13 as $k14=> $v14){
													    if(is_array($v14)){
														  $carry .= ".14: $k14  ";
														  foreach($v14 as $k15=> $v15){
														    if(is_array($v15)){
															  $carry .= ".15: $k15  ";
															  foreach($v15 as $k16=> $v16){
															    if(is_array($v16)){
																  $carry .= ".16: $k16  ";
																  foreach($v16 as $k17=> $v17){
																    if(is_array($v17)){
																	  $carry .= ".17: $k17  ";
																	  foreach($v17 as $k18=> $v18){
																	    if(is_array($v18)){
																		  $carry .= ".18: $k18  ";
																		}
																		else{
																		  echo "\n                                 $carry $k18=$v18";$carry = '-';
																		}
																	  }
																	}
																	else{
																      echo "\n                               $carry $k17=$v17";$carry = '-';
																	}
																  }
																}
																else{
															      echo "\n                             $carry $k16=$v16";$carry = '-';
																}
															  }
															}
															else{
														      echo "\n                           $carry $k15=$v15";$carry = '-';
															}
														  }
														}
														else{
													      echo "\n                         $carry $k14=$v14";$carry = '-';
														}
													  }
													}
													else{
												      echo "\n                       $carry $k13=$v13";$carry = '-';
													}
												  }
												}
												else{
											      echo "\n                     $carry $k12=$v12";$carry = '-';
												}
											  }
											}
											else{
										      echo "\n                      $carry $k11=$v11";$carry = '-';
											}
										  }
										}
										else{
									       echo "\n                   $carry 10: $k10=$v10";$carry = '-';
										 }
									  }
									}
									else{
								      if($k9 == 'code'){echo " => $v9\n";}echo "\n                 $carry 9: $k9=$v9";$carry = '-';
									}
								  }
								}
								else{
							      echo "\n               $carry 8: $k8=$v8";$carry = '-';
								}
							  }
							}
							else{
							  if($k7 == 'level'){continue;}
							  if($k7 == 'code'){echo " =7> $v7\n";}else{echo "\n             $carry 7: $k7=$v7";};;$carry = '-';
							}
						  }
						 }
						 else{
					       if($k6 == 'code'){echo " =6> $v6\n";}else{echo "\n           $carry 6: $k6=$v6";};$carry = '-';
						 }
					   }
					 }
					 else{
					   if($k5 == 'level'){continue;}if($k5 == 'title'){echo "\n          5+$v5";continue;}
				       if($k5 == 'code'){echo " =5> $v5\n";}else{echo "\n          $carry 5: $k5=$v5";};$carry = '-';
					 }
				   }
				 }
				 else{
				   if($k4 == 'level'){continue;}
		           if($k4 == 'code'){echo " =4> $v4\n";}else{echo "\n        $carry 4: $k4=$v4";};$carry = '-';
				}
			  }
			}
			else{
			    if($k3 == 'level'){continue;}
				if($k3 == 'title'){echo " $k & $v3";continue;}
				if($k3 == 'see'){echo "\n                     SEE: $v3 # #\n";continue;}
			    if($k3 == 'code'){echo " =3> $v3\n";}else{echo "\n      $carry 3: $k3=$v3 ";};$carry = '-';
			}
		  }
		}
		else{
		  if($k2 == 'level'){continue;}
		  if($k2 == 'title'){echo " $k & $v2";continue;}
		 
	      if($k2 == 'code'){echo "$k [$k1] => $v2\n";}else{echo "\n    $carry 2: $k2=$v2";};$carry = '-';
		}
	  }
	}
	else{
	  if($k1 == 2){echo " ##$k; $v1 #\n";continue;}
	  if($k1 == 4){echo " ####$k; $v1 ##\n";continue;}
	  if($k1 == 'code' || $k1 == 1){echo "$k => $v1\n";}else{echo"\n  $carry 1: $k1=$v1";};$carry = '-';
	}
  }
}







exit;
$xml = simplexml_load_file('Index.xml');
normalizeSimpleXML($xml,$res) ;
//$data = var_export($res,true);
//$res = str_replace('      ','',$data);
    $fp = fopen('Index.jsn','w');
    fwrite($fp,json_encode($res));

    function normalizeSimpleXML($obj, &$result) { 
      $data = $obj;
      if (is_object($data)) {
        $data = get_object_vars($data);
      }
      if (is_array($data)) {
        foreach ($data as $key => $value) {
          $res = null;
          normalizeSimpleXML($value, $res);
          if (($key == '@attributes') && ($key)) {
            $result = $res;
          } else {
            $result[$key] = $res;
          }
        }
      } else {
        $result = $data;
      }
    }

?>