<?php
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


?>