<center> <h2>Пример 8: Вычислительные возможности Oracle</h2s> </center>

<?php
echo '<br>';
?>


<?php
$ip = dns_get_record('sql_server.g', DNS_A)[0]['ip'];

$db = "(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=" . $ip . ")(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=FREEPDB1)))";
$conn = oci_connect('root', 'root', $db);

if ($conn) {
    echo 'Successfully connected to Oracle. <br>';

    $stid = oci_parse($conn, 'SELECT sin(3.14) FROM dual');
    oci_execute($stid);

   while ($row = oci_fetch_array($stid, OCI_ASSOC+OCI_RETURN_NULLS)) {
        foreach ($row as $item) {
            echo sprintf('sin(3.14) = %.5f', $item);
        }
    }

} else {
    $err = oci_error();
    echo 'Oracle Connect Error: '. $err['message'];
    echo '<br>';
    var_dump($err);
}
?>
