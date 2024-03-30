<?php
    session_start();
    $numDoc = isset($_POST["numDoc"]) ? strip_tags(htmlspecialchars($_POST["numDoc"])) : null;
    $id_operatoire = isset($_POST["id_operatoire"]) ? strip_tags(htmlspecialchars($_POST["id_operatoire"])) : null;

    try {
        $bdd = new PDO("mysql:host=localhost;dbname=gestcontrapp;charset=utf8", 'root', '');
        $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

        $updateModeoperatoire = $bdd->prepare("UPDATE mode_operatoire SET numero_dossier = ? WHERE id = ?");
        $updateModeoperatoire->execute(array($numDoc, $id_operatoire)); 
        $updateModeoperatoire->closeCursor();

        header("Location: index.php#main2"); // Correcte le format de l'en-tête
        exit; // Assurez-vous de terminer l'exécution du script après la redirection
    }
    catch (PDOException $e) {
        die('Erreur : '. $e->getMessage());
    }
