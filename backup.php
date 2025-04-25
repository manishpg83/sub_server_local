<?php
header("Content-Type: text/plain; UTF-8");
$data = file_get_contents('/home/amx/Z/portal/PgAvfHpU.php');
define("BACKUP_PATH", "/home/amx/sqlbu/");

$server_name   = "localhost";
$username      = "amx";
$password      = $data;
$database_name = "amx_portal";
$date_string   = date("Ymd");

$table_name    = "Patient";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd;
exec($cmd);

echo "$table_name\n";
$table_name    = "Test";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql"; 
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";

$table_name    = "Client";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";
$table_name    = "cplPatient";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";
$table_name    = "cplTest";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";
$table_name    = "orders";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";
$table_name    = "Rast";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";
$table_name    = "physicians";
$cmd = "mysqldump --routines -h {$server_name} -u {$username} -p{$password} {$database_name} {$table_name} > " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
exec($cmd);
$cmd = "gzip " . BACKUP_PATH . "{$date_string}_{$table_name}.sql";
echo $cmd . "\n";
exec($cmd);
echo "$table_name\n";



exit;
unlink('/home/amx/' . $date_string . 'archive.tar.gz');
$pd = new PharData('/home/amx/' . $date_string . 'archive.tar');
$dir = realpath("/home/amx/sqlbu/");

$pd->buildFromDirectory("/home/amx/sqlbu/");

$pd->compress(Phar::GZ);

sleep(5);
//unlink('/home/amx/' . $date_string . 'archive.tar');
?>