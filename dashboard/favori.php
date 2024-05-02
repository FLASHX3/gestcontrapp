<?php
session_start();
$serveurname = "localhost";
$username = "root";
$password = "";
$dbname = "gestcontrapp";

$favori = isset($_GET["favori"]) ? strip_tags(htmlspecialchars($_GET["favori"])) : null;
$id = isset($_GET['id']) ? strip_tags(htmlspecialchars($_GET['id'])) : null;

if($favori == null){
    header('location: index.php?erreurFavori=Erreur lors de l\'ajout en favori#main2');
}

try {
    $bdd = new PDO("mysql:host=$serveurname;dbname=$dbname;charset=utf8", $username, $password);
    $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
} catch (PDOException $e) {
    die('Erreur : ' . $e->getMessage());
}

$updateModeoperatoire = $bdd->prepare("UPDATE mode_operatoire SET favori = ? WHERE id = ?");
$updateModeoperatoire->execute(array($favori, $id));
$updateModeoperatoire->closeCursor();

$req = $bdd->prepare("SELECT favori FROM mode_operatoire WHERE id = ?");
$req->execute(array($id));
$res = $req->fetchAll(PDO::FETCH_ASSOC);

// var_dump($res);
echo json_encode($res);