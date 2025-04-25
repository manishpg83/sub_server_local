<?
header('Content-Type: text/plain; charset=utf-8');
chdir('/home/amx/');
$dir[0] = "/home/amx/";
$level = 0;
$elements = glob('*');
echo "\nElements $level\n";
$elements = glob($dir[$level] . '*');
foreach($elements as $element){ 
  $perm = fileperms($element) & 0x007; 
  if($perm < 1){continue;}  //echo "$perm skipped\n";
  if(is_dir($element)){$folders[$element] = $perm;}
  else{
    if(substr($element,-3) == 'tps'){
      $tps[] = $element;}
	}  //  else{$other[] = $element;}
}
//var_export($elements);




//echo"$level --------------------\nfolders\n";
//var_export($folders);
//echo"$level--------------------\nPDF\n";

//var_export($tps);

//echo"$level--------------------\Other\n";
//var_export($other);

echo "*********************\n\n";



foreach($folders as $folder => $f){  $more[] = array();
  $level++;
 // if($f > 18){break;}
 echo "FLF $f $level $folder|\n";
  $elements[$level] = glob($folder . '/*');
  $folders[$level] = glob($folder . '/*');
   
   foreach($elements[$level] as $ndx => $element){       $more[$folder] = $f;
	 $perm = fileperms($element) & 0x007;
    
     if($perm < 5){continue;}  //echo "$perm Skipped\n";
   //  echo "e $level $element $perm\n";
     if(is_dir($element)){
		$folders[$element] = $perm;
     //  $folders[$element] = $level;
     //  $folders[$element] = $level;
	 //  $perms[$element] .= " $perm";
     }
     else{
       if(substr($element,-3) == 'tps'){
         $tps[] = "$element";
       }
       else{
     //    $other[] = "$element";
       }
     }
   }
   $folders = $more;
}

var_export($perms);

echo"PERMS\n--------------------\nfolders\n";
var_export($folders);
echo"--------------------\nelements\n";

var_export($elements);

echo"--------------------\Other\n";
//var_export($other);
//echo"--------------------\n Other\n";
exit;
$level = 0;
//var_export($other[$level]);
foreach($folders as $folder => $level){break;
  echo "$level=>$folder\n";
}


?>