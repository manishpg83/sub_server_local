<?php
header('Content-type: text/plain');
echo number_format(disk_free_space("/home/amx/"));
echo "\n";
echo number_format(disk_free_space("/home/"));
echo "\n";
echo number_format(disk_total_space("/home/amx/"));
echo "\n";

echo number_format(disk_total_space("/home/"));

// Open a known directory, and proceed to read its contents
$total = 0;
$dir = "/home/amx/Z";

    if ($dh = opendir($dir)) {
      
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
 foreach($folders as $dir){
  $dh = opendir($dir);
        while (($file = readdir($dh)) !== false) {
          if(is_dir("$dir/$file")){
            if (substr($file,0,1) == '.'){continue;}
            $folders[] = "$dir/$file";
          }
        }
        closedir($dh);
    }
$folders = array_unique($folders);
//file_put_contents('disk.csv','');
 foreach($folders as $dir){
  $dh = opendir($dir);
        $dirsize = 0;
        while (($file = readdir($dh)) !== false) {
          if(!is_dir("$dir/$file")){
            $bytes = filesize("$dir/$file") ;
            $total += $bytes;
            $dirsize += $bytes;
            
          //  $txt =  "$dir/$file\t" . number_format($bytes) .  "\t" . number_format($total) . "\n"; //: filetype: " . filetype($dir . $file) . "\n";
          //  file_put_contents('disk.csv',$txt,FILE_APPEND);
          }
        }
        $dirsizes[$dir] = $dirsize; 
        closedir($dh);
    }
file_put_contents('folders.csv','');
 foreach($dirsizes as $dir => $bytes){
  $txt = "$dir\t" . number_format($bytes) . "\n";
  file_put_contents('folders.csv',$txt,FILE_APPEND);
//  echo "$dir\t" . number_format($bytes) . "\n";
}

var_export($dirsizes);
exit;
$files1 = scandir("/home/amx/Z/buData");
var_export($files1);

exit;

//-rw-r--r--   1 amx amx 2.6M Aug  2  2017 Janus-1 X.xlsm
echo system('ls -R --sort=size -la -h "/home/amx/Z"');

?>