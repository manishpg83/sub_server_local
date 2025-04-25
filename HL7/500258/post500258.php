<?
$postFile = "/home/amx/HL7/500258/postResults.txt";

file_put_contents($postFile, "");

$filename = $_GET['filename'];
echo "<pre>Begin makehl7.php Filename = $filename \n";
chdir("/home/amx/HL7/500258/");
file_put_contents($postFile, "include('/home/amx/HL7/500258/makehl7.php filename=$filename');",FILE_APPEND);


include('/home/amx/HL7/500258/makehl7.php');


$time =  date("F j, Y, g:i:s a");
$fsize = filesize("/home/amx/HL7/SanJuan/Results/" .  date('Ymd') . '.hl7');
$time_start =  microtime(true);
echo "\nUPLOAD HL7 file size=$fsize\n";
echo "Begin wait: $time, micro start time=$time_start Sleep\n";

file_put_contents($postFile, "makehl7 done, Begin wait: $time, micro start time=$time_start Sleep\n",FILE_APPEND);
$time =  date("F j, Y, g:i:s a");
$file = "/home/amx/HL7/SanJuan/Results/" .  date('Ymd') . '.hl7';
$fsize =  filesize($file);
echo "$time: File = $file, size = $fsize\n";
file_put_contents($postFile, "10 makehl7.php filename=$filename, filesize /home/amx/HL7/500258/Results/=$fsize');\n');",FILE_APPEND);
$microTime =  microtime(true);
file_put_contents($postFile, "End wait: $time, micro end time=$microTime \n",FILE_APPEND);
 
echo "1\n";
echo "$time: filesize /home/amx/HL7/SanJuan/Results/" .  date('Ymd') . '.hl7' . "\n";
echo "2\n";



$time_end = microtime(true);
$time_micro = $time_end - $time_start;

echo "\nEnd wait: $time, micro end time=$time_end, total wait time_micro=$time_micro, file, size=$fsize";
file_put_contents($postFile, "End wait: $time, micro end time=$time_end, total wait time_micro=$time_micro, file, size=$fsize ");
echo "\nSkipping HL7 via sftpUpload.php\n";
//include('/home/amx/HL7/500258/sftpUpload.php');
  $filename = "/home/amx/HL7/500258/Results/" . date('Ymd') . '.hl7';
  $copyname = "/home/amx/amxemr.com/SanJuan/Results/" . date('Ymd') . '.hl7';
  echo "rename($filename, $copyname)\n";
  copy($filename, $copyname);
?>