<center> <h2>Пример 6: Подключение к базе данных</h2> </center>

<?php
echo '<br>';
?>


<?php
$ip = dns_get_record('sql_server.g', DNS_A)[0]['ip'];

$db = "(DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=" . $ip . ")(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=FREEPDB1)))";
$conn = oci_connect('root', 'root', $db);

if ($conn) {
    echo 'Successfully connected to Oracle. <br>';

    $stid = oci_parse($conn, 'SELECT * FROM employees');
    oci_execute($stid);  
} else {
    $err = oci_error();
    echo 'Oracle Connect Error: '. $err['message'];
    echo '<br>';
    var_dump($err);
}
?>
