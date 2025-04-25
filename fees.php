<?

echo "<pre>\n";
$row = 1;
if (($handle = fopen("fees.csv", "r")) !== FALSE) {
  while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
    
    $num = count($data);
 //   echo "<p> $num fields in line $row: <br /></p>\n";
	$string = '';
    $row++;
  //  for ($c=0; $c < $num; $c++) {
      
	
		
  //    echo $c . '. ' . $data[$c] . "<br />\n";
      echo  "
      FEE:Client = $data[0]
      GET(Fees,FEE:OrderKey)
      FEE:TIgE =    $data[1]
      FEE:IgE =     $data[2]
      FEE:IgG =     $data[2]
      FEE:IgG4 =    $data[2]
      FEE:mxIgE =   $data[3]
      FEE:mxIgG =   $data[3];
      FEE:mxIgG4 =  $data[3];
      FEE:hyIgE =   $data[4];
      FEE:hyIgG =   $data[4];
      FEE:hyIgG4 =  $data[4];
      FEE:occIgE =  $data[5];
      FEE:occIgG =  $data[5];
      FEE:occIgG4 = $data[5];
      FEE:chemIgE = $data[6];
      FEE:chemIgG = $data[6];
      FEE:chemIgG4 = $data[6];
      FEE:ComponentIgE =  $data[7];
      FEE:ComponentIgG =  $data[7];
      FEE:ComponentIgG4 = $data[7];
      PUT(FEES)
	  ";

	  

  //  }
    


  }
  fclose($handle);
}
?>


