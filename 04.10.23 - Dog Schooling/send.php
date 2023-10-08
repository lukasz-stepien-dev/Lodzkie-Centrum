<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $host = 'localhost';
    $db = 'szkolenia';
    $user = 'root';
    $password = '';
    $dsn = "mysql:host=$host;dbname=$db;charset=UTF8";

    try {
        $pdo = new PDO($dsn, $user, $password);

        $queryOwner = "INSERT INTO wlasciciel (Imie, Nazwisko, AdresMail) values (?, ?, ?)";
        $stmtOwner = $pdo->prepare($queryOwner);
        $stmtOwner->execute([$_POST['name'], $_POST['surname'], $_POST['email']]);

        $ownerId = $pdo->lastInsertId();

        $unixBirthDate = strtotime($_POST['birth-date']);
        $mysqlDate = date('Y-m-d', $unixBirthDate);

        $queryDog = "INSERT INTO pies (Idwlasciciela, Imie, Rasa, DataUrodzenia) values (?, ?, ?, ?)";
        $stmtDog = $pdo->prepare($queryDog);
        $stmtDog->execute([$ownerId, $_POST['dog-name'], $_POST['breed'], $mysqlDate]);

        $dogId = $pdo->lastInsertId();

        $queryType = "INSERT INTO szkolenie (IdPsa, IdSzkolenia) values (?, ?)";
        $stmtType = $pdo->prepare($queryType);
        $stmtType->execute([$dogId, $_POST['schooling-type']]);

        $_SESSION['send'] = true;
        header("Location: index.php");
    } catch (PDOException $e) {
        echo "Nie udało się połączyć z bazą danych";
        echo $e->getMessage();
    }
}
