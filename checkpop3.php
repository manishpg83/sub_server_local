<?php
header('Content-Type: text/plain; charset=utf-8');
//$mbox = imap_open ("{mail.allermetrix.com:110/pop3}", "gk@allermetrix.com", "service3");
$mbox = imap_open("{allermetrix.com:110/pop3/tls/novalidate-cert/user=\"gk@allermetrix.com\"}INBOX", "gk@allermetrix.com", "service1");

if ($mbox == false){
  echo "open mailbox failed\n";
  echo var_export(imap_errors(),true);
}
else{
$imap_obj = imap_check($mbox);
var_dump($imap_obj);
//$header = imap_header($mbox, $messageid);
imap_close($mbox);
}
?>