<?php
  set_time_limit(99);
//  error_reporting(E_ERROR);
  $ndx = 0;
  echo "<pre>";
  $states = array('AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY');
  foreach($states as $state){
	  echo "STATE: $state ----------------------------\n";
  $data = file_get_contents('https://npiregistry.cms.hhs.gov/api/?entity_type=NPI-1&limit=200&state=' . $state . '&taxonomy_description=PHLEBOTOMY&addressType=ANY&version=2.1');
  $json = json_decode($data,1);
  unset($data);

  foreach($json['results'] as $key => $value){
  	//var_export($value);
  	echo $value['basic']['name'] . ' ' . $value['basic']['credential'] . "\n";
  	echo $value['addresses'][0]['address_1'] . ', ' . $value['addresses'][0]['city'] . ', ' . $value['addresses'][0]['state'] . ' ' . substr($value['addresses'][0]['postal_code'],0,5) . ' ' . $value['addresses'][0]['telephone_number'] . "\n";
  	echo'';
  	echo $value['addresses'][1]['address_1'] . ', ' . $value['addresses'][1]['city'] . ', ' . $value['addresses'][1]['state'] . ' ' . substr($value['addresses'][1]['postal_code'],0,5) . ' ' . $value['addresses'][1]['telephone_number'] . "\n";
  	foreach($value['taxonomies'] as $tax){
  	  echo $tax['desc'] . "\n";
  	}
	$ndx++;
  	echo "$ndx --------------------------------------------\n";
  	//break;
    }
  }
  
?>