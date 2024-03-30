<?php
    session_start();
    $searchMain2 = isset($_POST["searchMain2"]) ? strip_tags(htmlspecialchars($_POST["searchMain2"])) : null;

    header("Location: index.php?searchMain2=$searchMain2#main2");
    exit;