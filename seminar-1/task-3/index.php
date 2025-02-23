<div style="width: 100%; height: 40px; background:rgb(234, 189, 7);"><center><h2>Главный тополог</h2></center></div>

<form action="index.php" method="post">

    <div style="width: 200; height: 40px; background:rgb(255, 255, 255);">
        Топология<br>
        <input name="topology" placeholder="Введите имя топологии" method="POST"></input>
    </div><br>

    <div style="width: 200; height: 40px; background:rgb(255, 255, 255);">
        Приоритет<br>
        <input name="priority" placeholder="Приоритет изменение" method="POST"></input>
    </div><br>

    <div style="width: 200; height: 40px; background:rgb(255, 255, 255);">
        Изменение<br>
        <input name="name" placeholder="Имя изменения" method="POST"></input>
    </div><br>

    <div style="width: 200; height: 40px; background:rgb(255, 255, 255);">
        Описание<br>
        <input name="about" placeholder="Описание" method="POST"></input>
    </div><br>

    <input type="submit" value="Утвердить" style="background:rgb(38, 156, 27);">

</form>

<?php
    if($_POST['topology'] == null or $_POST['priority'] == null or $_POST['name'] == null or $_POST['about'] == null)
        echo '<div style="width: 100%; height: 40px; background:rgb(234, 7, 7);">Не все данные введены</div>';
    else
        echo '<div style="width: 100%; height: 40px; background:rgb(52, 234, 7);">
            Задача зарегистрирована
        </div>';
?>