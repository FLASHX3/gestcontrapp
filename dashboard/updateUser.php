<?php
require_once('log.php');
if ($_SESSION['type'] == "admin" || $_SESSION['type'] == "super admin") {
    if (isset($_POST['update']) && !empty($_POST['update'])) {
        $nom = isset($_POST['updnom']) ? strip_tags(htmlspecialchars($_POST['updnom'])) : null;
        $login = isset($_POST['updatelogin']) ? strip_tags(htmlspecialchars($_POST['updatelogin'])) : null;
        $password = isset($_POST['updatePassword']) ? strip_tags(htmlspecialchars($_POST['updatePassword'])) : null;
        $cpassword = isset($_POST['updateCPassword']) ? strip_tags(htmlspecialchars($_POST['updateCPassword'])) : null;

        if ($nom == null || $login == null || $password == null || $cpassword == null) {
            header('location: index.php?compte=Erreur lors de la création du compte#main7');
        }else if($password !== $cpassword){
            header('location: index.php?compte=Les mots de passe ne sont pas identiques#main7');
        }
    
        try {
            $bdd = new PDO("mysql:host=localhost;dbname=gestcontrapp;charset=utf8", 'root', '');
            $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
        } catch (PDOException $e) {
            die("Error: " . $e->getMessage());
        }

        $update = $bdd->prepare("UPDATE users SET nom = ?, login = ?, password = ? WHERE `users`.`nom` = ?");
        $resultat = $update->execute(array($nom, $login, $password, $nom));

        if ($resultat) {
            setlog($_SESSION['id'], 9, "Modification du compte de $nom");
            header("location: index.php?compte=Modification du compte de $nom réussie#main7");
        } else {
            header("location: index.php?compte=Erreur lors de la modification du compte#main7");
        }
    }
}
    