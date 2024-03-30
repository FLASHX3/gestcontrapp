<?php
    session_start();
    $searchMain3 = isset($_POST["search"]) ? strip_tags(htmlspecialchars($_POST["search"])) : null;

    header("Location: index.php?searchMain3=$searchMain3#main3");
    exit;