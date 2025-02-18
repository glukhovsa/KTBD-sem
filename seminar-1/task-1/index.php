<center> <h1>Задание 1: select</h1> </center>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    echo ('Машина с процесссором <i>' . $_POST['proto'] . '</i> зарегистрирована в комнате "'. $_POST['location'] .'"<br>');
    echo ('<b>Не забывайте обновлять информацию о машине!!!</b>');
}
?>
<P>
<H2>Введите параметры регистрируемой машины:</H2>
<form action="index.php" method="post">
    <i>Выберите процессор регистрируемой машины - </i>
    <select name='proto' size=1>
        <option value="2C3">2C3</option>
        <option value="8CV">8CV</option>
        <option value="E16C">E16C</option>
        <option value="E32C">E32C</option>
    </select><br>

    <i>Выберите дальнейшее место нахождение машины - </i>
    <select name='location' size=1>
        <option value="warehouse">Склад</option>
        <option value="serverroom">Серверная</option>
        <option value="stand">Стенд тестирования</option>
    </select><br>
<p>
<input type='submit' value='Зарегистрировать машину'>
</form>
