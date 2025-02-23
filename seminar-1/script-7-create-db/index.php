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

    $cteate= oci_parse($conn, 'CREATE TABLE prototype{
        ID INTEGER NOT NULL,
        PROTO_NAME VARCHAR(20) NOT NULL,
        PANEL_NAME VARCHAR(20) NOT NULL,
        PANEL_NUMBER INTEGER NOT NULL,
        ROOM_NUMBER INTEGER NOT NULL
    }');
    $add= oci_parse($conn, 'INSERT INTO prototype (ID, PROTO_NAME, PANEL_NAME, PANEL_NUMBER, ROOM_NUMBER) VALUE (1, "TVGI.455695.018", "TVGI.455255.466", 4, 230');
    oci_execute($create);
    oci_execute($add);
} else {
    $err = oci_error();
    echo 'Oracle Connect Error: '. $err['message'];
    echo '<br>';
    var_dump($err);
}
?>
