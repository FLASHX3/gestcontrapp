<?php
session_start();
if (isset($_SESSION["id"])) {
    if (!isset($_POST["submit1"])) {
        $bdd = new PDO("mysql:host=localhost;dbname=gestcontrapp;charset=utf8", 'root', '');
        $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

        //main1
        $requeteville = $bdd->prepare("SELECT DISTINCT ville FROM immeubles_entites ORDER BY ville ASC");
        $requeteville->execute();
        $requetesite = $bdd->prepare("SELECT DISTINCT site FROM immeubles_entites ORDER BY site ASC");
        $requetesite->execute();
        $requeteEntite = $bdd->prepare("SELECT DISTINCT entite FROM immeubles_entites ORDER BY entite ASC");
        $requeteEntite->execute();

        //main3
        if (isset($_GET['searchMain3'])) {
            $searchMain3 = $_GET['searchMain3'];
            if (empty($searchMain3)) {
                $recherche = "SELECT mode_operatoire.nom_GI, mode_operatoire.entite, mode_operatoire.site, mode_operatoire.logement, mode_operatoire.nom_locataire, mode_operatoire.numero_dossier, mode_operatoire.date_fin_contrat, adhesion.* FROM adhesion, mode_operatoire WHERE mode_operatoire.id=adhesion.id_operatoire";
            } else {
                $recherche = "SELECT mode_operatoire.nom_GI, mode_operatoire.entite, mode_operatoire.site, mode_operatoire.logement, mode_operatoire.nom_locataire, mode_operatoire.numero_dossier, mode_operatoire.date_fin_contrat, adhesion.*  FROM mode_operatoire,  adhesion WHERE (CONVERT(`nom_locataire` USING utf8) LIKE '%$searchMain3%' OR CONVERT(`numero_dossier` USING utf8) LIKE '%$searchMain3%') AND mode_operatoire.id=adhesion.id_operatoire";
            }
        } else {
            $recherche = "SELECT mode_operatoire.nom_GI, mode_operatoire.entite, mode_operatoire.site, mode_operatoire.logement, mode_operatoire.nom_locataire, mode_operatoire.numero_dossier, mode_operatoire.date_fin_contrat, adhesion.* FROM adhesion, mode_operatoire WHERE mode_operatoire.id=adhesion.id_operatoire";
        }
?>

        <!DOCTYPE html>
        <html lang="fr">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="../css/dashboard.css">
            <link rel="shortcut icon" href="../images/logo_sci_sotradic.png" type="image/x-icon">
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
            <script src="../javascript/dashboard.js" defer></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js" defer></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js" defer></script>
            <title>Dashboard</title>
        </head>

        <body>
            <div id="container">
                <nav>
                    <h1><a href="index.php#main2">GestContrApp</a></h1>
                    <img src="../images/logo_sci_sotradic_2.png" alt="logosotradic" srcset="">
                    <div id="nav">
                        <ul>
                            <li onclick="activeLi(this);"><a href="#main1" class="on"> <ion-icon name="add-outline"></ion-icon> Ajouter un contrat</a></li>
                            <li onclick="activeLi(this);"><a href="#main2"> <ion-icon name="clipboard-outline"></ion-icon> Synthèse des contrats</a></li>
                            <li onclick="activeLi(this);"><a href="#main3"> <ion-icon name="bar-chart-outline"></ion-icon> Evolution des contrats </a></li>
                            <li onclick="activeLi(this);"><a href="#main4"> <ion-icon name="stats-chart-outline"></ion-icon> Statistiques</a></li>
                            <li onclick="activeLi(this);"><a href="#main5"> <ion-icon name="settings-outline"></ion-icon> Paramètres</a></li>
                            <li><a href="deconnexion.php"><ion-icon name="log-out-outline"></ion-icon>Se deconnecter</a></li>
                        </ul>
                    </div>
                </nav>
                <aside>
                    <div id="main1" class="main">
                        <form action="index.php" method="post">
                            <h2>Mode Opératoire</h2>
                            <div class="progressbar">
                                <div class="progress" id="progress"></div>

                                <div class="progress-step progress-step-active" data-title="Loyer"></div>
                                <div class="progress-step" data-title="Client"></div>
                                <div class="progress-step" data-title="Prix"></div>
                                <div class="progress-step" data-title="Details"></div>
                                <div class="progress-step" data-title="Finition"></div>
                            </div>
                            <div id="wrapper-list">
                                <div class="wrapper">
                                    <div class="input-group">
                                        <label for="site">Site <span class="obligatoire">*</span></label>
                                        <select name="site" id="site" required>
                                            <option value="">--Choisissez un site--</option>
                                            <?php
                                            while ($row = $requetesite->fetch()) {
                                            ?>
                                                <option value="<?php echo ucwords($row['site']); ?>"><?php echo ucwords($row['site']); ?></option>
                                            <?php
                                            }
                                            $requetesite->closeCursor();
                                            ?>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="entite">Entité <span class="obligatoire">*</span></label>
                                        <select name="entite" id="entite" required>
                                            <?php
                                            while ($rows = $requeteEntite->fetch()) {
                                            ?>
                                                <option value="<?php echo $rows['entite']; ?>"><?php echo $rows['entite']; ?></option>
                                            <?php
                                            }
                                            $requeteEntite->closeCursor();
                                            ?>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="ville">Ville <span class="obligatoire">*</span></label>
                                        <select name="ville" id="ville" required>
                                            <?php
                                            while ($sotradic = $requeteville->fetch()) {
                                            ?>
                                                <option value="<?php echo ucfirst(strtolower($sotradic['ville'])); ?>"><?php echo ucfirst(strtolower($sotradic['ville'])); ?></option>
                                            <?php
                                            }
                                            $requeteville->closeCursor();
                                            ?>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="natbail">Nature du bail <span class="obligatoire">*</span></label>
                                        <select name="natbail" id="natbail" required>
                                            <option value="Habitation">Habitation</option>
                                            <option value="Commerciale">Commerciale</option>
                                        </select>
                                    </div>
                                    <div class="">
                                        <a href="#" class="btn btn-next width-50 ml-auto">Next<ion-icon name="chevron-forward" size="large"></ion-icon></a>
                                    </div>
                                </div>
                                <div class="wrapper">
                                    <div class="input-group">
                                        <label for="nom">Nom locataire <span class="obligatoire">*</span></label>
                                        <input type="text" name="nom" id="nom" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="contact">Contact <span class="obligatoire">*</span></label>
                                        <input type="tel" name="contact" id="contact" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="logement">Logement <span class="obligatoire">*</span></label>
                                        <input type="text" name="logement" id="logement" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="time_c">Durée contrat (en mois) <span class="obligatoire">*</span></label>
                                        <input type="number" name="time_c" id="time_c" required>
                                    </div>
                                    <div class="btns-group">
                                        <a href="#" class="btn btn-prev"><ion-icon name="chevron-back" size="large"></ion-icon>Previous</a>
                                        <a href="#" class="btn btn-next">Next<ion-icon name="chevron-forward" size="large"></ion-icon></a>
                                    </div>
                                </div>
                                <div class="wrapper">
                                    <div class="input-group">
                                        <label for="loy_mens">Loyer mensuel (en fcfa) <span class="obligatoire">*</span></label>
                                        <input type="text" name="loy_mens" id="loy_mens" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="freq_paie">Fréquence de paiement <span class="obligatoire">*</span></label>
                                        <select name="freq_paie" id="freq_paie" required>
                                            <option value="Anuelle">Anuelle</option>
                                            <option value="Semestrielle">Semestrielle</option>
                                            <option value="Trimestrielle">Trimestrielle</option>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="mode_paie">Mode de paiement <span class="obligatoire">*</span></label>
                                        <select name="mode_paie" id="mode_paie" required>
                                            <option value="Chèque">Chèque</option>
                                            <option value="Carte">Carte</option>
                                            <option value="Espèces">Espèces</option>
                                            <option value="Momo">MoMo</option>
                                            <option value="OM">OM</option>
                                            <option value="Virement">Virement</option>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="nb_mois_paye">Nombre de mois payé <span class="obligatoire">*</span></label>
                                        <input type="number" name="nb_mois_paye" id="nb_mois_paye" required>
                                    </div>
                                    <div class="btns-group">
                                        <a href="#" class="btn btn-prev"><ion-icon name="chevron-back" size="large"></ion-icon>Previous</a>
                                        <a href="#" class="btn btn-next">Next<ion-icon name="chevron-forward" size="large"></ion-icon></a>
                                    </div>
                                </div>
                                <div class="wrapper">
                                    <div class="input-group">
                                        <label for="caution">Montant caution (en fcfa) <span class="obligatoire">*</span></label>
                                        <input type="number" name="caution" id="caution" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="rev_loyer">Révision loyer <span class="obligatoire">*</span></label>
                                        <select name="rev_loyer" id="rev_loyer" required>
                                            <option value="Biennale">Biennale</option>
                                            <option value="Triennale">Triennale</option>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="pen_retard">Pénalités de retard (en %) <span class="obligatoire">*</span></label>
                                        <input type="text" name="pen_retard" id="pen_retard" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="droit_reg">Droit d'enregistrement (en fcfa) <span class="obligatoire">*</span></label>
                                        <input type="number" name="droit_reg" id="droit_reg" required>
                                    </div>
                                    <div class="btns-group">
                                        <a href="#" class="btn btn-prev"><ion-icon name="chevron-back" size="large"></ion-icon>Previous</a>
                                        <a href="#" class="btn btn-next">Next<ion-icon name="chevron-forward" size="large"></ion-icon></a>
                                    </div>
                                </div>
                                <div class="wrapper">
                                    <div class="input-group">
                                        <label for="date_start">Date début de contrat <span class="obligatoire">*</span></label>
                                        <input type="date" name="date_start" id="date_start" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="date_end">Date fin de contrat <span class="obligatoire">*</span></label>
                                        <input type="date" name="date_end" id="date_end" required>
                                    </div>
                                    <div class="input-group">
                                        <label for="gi">Nom du GI <span class="obligatoire">*</span></label>
                                        <select name="gi" id="gi" required>
                                            <option value="Mme Kaptche">Mme Kaptche</option>
                                            <option value="Mr Thierry">Mr Thierry</option>
                                            <option value="Mr Yannick">Mr Yannick</option>
                                            <option value="Mr Tsafack">Mr Tsafack</option>
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <label for="num_doc">Numéro du dossier</label>
                                        <input type="text" name="num_doc" id="num_doc">
                                    </div>
                                    <div class="btns-group">
                                        <a href="#" class="btn btn-prev"><ion-icon name="chevron-back" size="large"></ion-icon>Previous</a>
                                        <input type="submit" name="submit1" value="Submit" class="btn" />
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div id="main2" class="main">
                        <h1>Contrats en cours</h1>
                        <div id="actionMain2">
                            <form action="searchMain2.php" method="post" id="formMain2">
                                <input type="search" name="searchMain2" id="searchMain2" value="<?php if (isset($_GET['searchMain2'])) {
                                                                                                    echo $_GET['searchMain2'];
                                                                                                } ?>" placeholder="search">
                                <button type="submit"><ion-icon name="search-outline"></ion-icon></button>
                                <label for="tri">Trier : </label>
                                <select name="tri" id="tri">
                                    <option value="id">&#8470;</option>
                                    <option value="site">Site</option>
                                    <option value="entite">Entité</option>
                                    <option value="ville">Ville</option>
                                    <option value="natureBail">Nature bail</option>
                                    <option value="nomLocataire">Nom Locataire</option>
                                    <option value="logement">Logement</option>
                                    <option value="dureeContrat">Duere contrat</option>
                                    <option value="loyerMensuel">Loyer mensuel</option>
                                    <option value="frequencePaiement">Frequence paiement</option>
                                    <option value="modePaiement">Montant loyer payer</option>
                                    <option value="montantLoyerPayer">Mode paiement</option>
                                    <option value="montantCaution">Montant caution</option>
                                    <option value="revisionLoyer">Revision loyer</option>
                                    <!-- <option value="dateDebut">Date Debut</option>
                                    <option value="dateFin">Date Fin</option> -->
                                    <option value="droitEnregistrement">Droit d'enregistrement</option>
                                    <option value="nomGi">Nom GI</option>
                                    <option value="numeroDossier">Numéro Dossier</option>
                                </select>
                                <label for="export">Exporter : </label>
                                <button type="button" id="export" onclick='confirmExport();'><ion-icon name="download-outline"></ion-icon></button>
                                <div id="customConfirm" class="custom-confirm">
                                    <div class="message"><ion-icon name="print-outline"></ion-icon>Exportez au format : </div><span class="close">&times;</span>
                                    <div id="buttonconfirm">
                                        <button type="button" id="excel"><img src="../ressources/logo excel.png" alt="logo excel">EXCEL</button>
                                        <button type="button" id="pdf"><img src="../ressources/logo pdf.jfif" alt="logo pdf">PDF</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table id="synthese">
                            <thead>
                                <tr>
                                    <th>&#8470;</th>
                                    <th>Site</th>
                                    <th>Entité</th>
                                    <th>Ville</th>
                                    <th>Nature bail</th>
                                    <th>Nom locataire</th>
                                    <th>Contact locataire</th>
                                    <th>Logement</th>
                                    <th>Durée_contrat (en mois)</th>
                                    <th>Loyer mensuel (en fcfa)</th>
                                    <th>Frequence paiement</th>
                                    <th>Mode paiement</th>
                                    <th>Montant_loyer payé (en fcfa)</th>
                                    <th>Montant caution (en fcfa)</th>
                                    <th>Revision loyer</th>
                                    <th>Pénalités de retard (en %)</th>
                                    <th>Date_debut contrat</th>
                                    <th>Date_de_fin contrat</th>
                                    <th>Droit d'enregistrement (en fcfa)</th>
                                    <th>Nom GI</th>
                                    <th>Numero dossier</th>
                                    <th>Etat_contrat</th>
                                    <th>Modification</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (isset($_GET['searchMain2'])) {
                                    $searchMain2 = $_GET['searchMain2'];
                                    if (empty($searchMain2)) {
                                        $affichage = "SELECT mode_operatoire.*, adhesion.* FROM mode_operatoire, adhesion WHERE mode_operatoire.id=adhesion.id_operatoire";
                                    } else {
                                        $affichage = "SELECT *  FROM `gestcontrapp`.`mode_operatoire`,  adhesion WHERE (CONVERT(`id` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`site` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`entite` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`ville` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`nature_bail` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`nom_locataire` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`contact` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`logement` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`duree_contrat` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`loyer_mensuel` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`frequence_paiement` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`mode_paiement` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`nombre_mois` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`montant_caution` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`revision_loyer` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`pénalites_retard` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`date_debut_contrat` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`date_fin_contrat` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`droit_enregistrement` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`nom_GI` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`numero_dossier` USING utf8) LIKE '%$searchMain2%' OR CONVERT(`etat` USING utf8) LIKE '%$searchMain2%') AND mode_operatoire.id=adhesion.id_operatoire";
                                    }
                                } else {
                                    $affichage = "SELECT mode_operatoire.*, adhesion.* FROM mode_operatoire, adhesion WHERE mode_operatoire.id=adhesion.id_operatoire";
                                }
                                $requete = $bdd->prepare($affichage);
                                $requete->execute();
                                $nbResultat = $requete->rowCount();
                                if ($nbResultat > 0) {
                                    while ($resultat = $requete->fetch()) {
                                ?>
                                        <tr>
                                            <td><?php echo $resultat['id']; ?></td>
                                            <td><?php echo $resultat['site']; ?></td>
                                            <td><?php echo $resultat['entite']; ?></td>
                                            <td><?php echo $resultat['ville']; ?></td>
                                            <td><?php echo $resultat['nature_bail']; ?></td>
                                            <td><?php echo $resultat['nom_locataire']; ?></td>
                                            <td><?php echo $resultat['contact']; ?></td>
                                            <td><?php echo $resultat['logement']; ?></td>
                                            <td><?php echo $resultat['duree_contrat']; ?></td>
                                            <td><?php $loyer_mensuel = number_format($resultat['loyer_mensuel'], 0, ',', '.');
                                                echo $loyer_mensuel; ?>
                                            </td>
                                            <td><?php echo $resultat['frequence_paiement']; ?></td>
                                            <td><?php echo $resultat['mode_paiement']; ?></td>
                                            <td><?php $loyer_paye = number_format($resultat['nombre_mois'] * $resultat['loyer_mensuel'], 0, ',', '.');
                                                echo $loyer_paye; ?>
                                            </td>
                                            <td><?php $caution = number_format($resultat['montant_caution'], 0, ',', '.');
                                                echo $caution; ?>
                                            </td>
                                            <td><?php echo $resultat['revision_loyer']; ?></td>
                                            <td><?php echo $resultat['pénalites_retard']; ?></td>
                                            <td><?php $dateStart = new DateTime($resultat['date_debut_contrat']);
                                                $dateStart = $dateStart->format('d-m-Y');
                                                echo $dateStart; ?>
                                            </td>
                                            <td><?php $dateEnd = new DateTime($resultat['date_fin_contrat']);
                                                $dateEnd = $dateEnd->format('d-m-Y');
                                                echo $dateEnd; ?>
                                            </td>
                                            <td><?php $droit_reg = number_format($resultat['droit_enregistrement'], 0, ',', '.');
                                                echo $droit_reg; ?>
                                            </td>
                                            <td><?php echo $resultat['nom_GI']; ?></td>
                                            <td>
                                                <form action="updateNumcontrat.php" method="post">
                                                    <input type="text" id="numDoc<?php echo $resultat['id']; ?>" class="numDoc" name="numDoc" value="<?php echo $resultat['numero_dossier']; ?>" disabled>
                                                    <input type="hidden" name="id_operatoire" value="<?php echo $resultat['id']; ?>">
                                                </form>
                                            </td>
                                            <td class="ft-w <?php echo $resultat['etat']; ?>" data-idClient="<?php echo $resultat['id_operatoire']; ?>">
                                                <a href="#main3">
                                                    <?php
                                                    $percent = 0;
                                                    $val_offre = ($resultat['validation_offre'] === 1 || $resultat['validation_offre'] === 0) ? 1 : 0;
                                                    $elab_contrat = ($resultat['elaboration_contrat'] === 1 || $resultat['elaboration_contrat'] === 0) ? 1 : 0;
                                                    $control_final = ($resultat['control_final'] === 1 || $resultat['control_final'] === 0) ? 1 : 0;
                                                    $percent = $resultat['negoce'] + $val_offre + $resultat['info_client'] + $elab_contrat + $resultat['transmition_contrat_client'] + $resultat['finalisation_dossier'] + $control_final + $resultat['validation_dossier'] + $resultat['transmition_contrat_remise'] + $resultat['transmition_decharge'] + $resultat['reception_dossier'] + $resultat['archivage'];
                                                    $percent = $percent * 100 / 12;
                                                    $percent = number_format($percent, 2);
                                                    ?>
                                                    <h5><?php echo "$percent%"; ?></h5>
                                                    <div class="evolutionBar">
                                                        <div class="evolution" style="width: <?php echo $percent; ?>%"></div>
                                                    </div>
                                                    <?php echo $resultat['etat']; ?>
                                                </a>
                                            </td>
                                            <td class="edition">
                                                <ion-icon name="create-outline" size="small" title="Modifiez" data-numDoc="numDoc<?php echo $resultat['id']; ?>"></ion-icon>
                                                <form action="favori.php" method="post" class="favoris">
                                                    <button type="submit" name="favori" value="1"><ion-icon name="<?php if ($resultat['favori'] == 0) {
                                                                                                                        echo "bookmark-outline";
                                                                                                                    } else {
                                                                                                                        echo "bookmark";
                                                                                                                    } ?>" size="small" title="Marquez comme important"></ion-icon></button>
                                                    <input type="hidden" name="id_operatoire" value="<?php echo $resultat['id']; ?>">
                                                </form>
                                                <ion-icon name="trash-outline" size="small" title="Supprimez"></ion-icon>
                                            </td>
                                        </tr>
                                <?php
                                    }
                                } else {
                                    echo '<p align="center">Aucun resultat</p>';
                                }
                                $requete->closeCursor();
                                ?>
                            </tbody>
                        </table>
                    </div>
                    <div id="main3" class="main">
                        <h1>Galeries de Contrats</h1>
                        <form action="searchMain3.php" method="post" id="form_search">
                            <input type="search" name="search" id="search" value="<?php if (isset($_GET['searchMain3'])) {
                                                                                        echo $_GET['searchMain3'];
                                                                                    } ?>" placeholder="search">
                            <ion-icon name="search-outline"></ion-icon>
                        </form>
                        <div id="table">
                            <?php
                            $adhesion = $bdd->prepare($recherche);
                            $adhesion->execute(array());
                            $nbContrats = $adhesion->rowCount();
                            if ($nbContrats > 0) {
                                while ($resultat = $adhesion->fetch()) {
                                    $percent = 0;   //pourcentage progression
                                    $val_offre = ($resultat['validation_offre'] === 1 || $resultat['validation_offre'] === 0) ? 1 : 0;
                                    $elab_contrat = ($resultat['elaboration_contrat'] === 1 || $resultat['elaboration_contrat'] === 0) ? 1 : 0;
                                    $control_final = ($resultat['control_final'] === 1 || $resultat['control_final'] === 0) ? 1 : 0;
                                    $choix = ["val_offre" => $resultat['validation_offre'], "elab_contrat" => $resultat['elaboration_contrat'], "control_final" => $resultat['control_final']];
                                    $percent = $resultat['negoce'] + $val_offre + $resultat['info_client'] + $elab_contrat + $resultat['transmition_contrat_client'] + $resultat['finalisation_dossier'] + $control_final + $resultat['validation_dossier'] + $resultat['transmition_contrat_remise'] + $resultat['transmition_decharge'] + $resultat['reception_dossier'] + $resultat['archivage'];
                                    $percent = $percent * 100 / 12;
                                    $percent = number_format($percent, 2);
                            ?>
                                    <div class="contrat" id="contrat<?php echo $resultat['id_operatoire']; ?>" title="<?php echo "$percent%" ?>" data-num_dossier="<?php echo $resultat['numero_dossier']; ?>" data-choix="<?php echo htmlspecialchars(json_encode($choix)); ?>" data-id_operatoire="<?php echo $resultat['id_operatoire']; ?>" data-logement="<?php echo $resultat['logement']; ?>" data-date_ajout="<?php echo $resultat['date_ajout']; ?>" data-date_fin="<?php echo $resultat['date_fin_contrat']; ?>" data-nom_client="<?php echo $resultat['nom_locataire']; ?>" data-site="<?php echo $resultat['site']; ?>" data-nom_Gi="<?php echo $resultat['nom_GI']; ?>" data-negoce="<?php echo $resultat['negoce']; ?>" data-validation_offre="<?php echo $resultat['validation_offre']; ?>" data-info_client="<?php echo $resultat['info_client']; ?>" data-elaboration_contrat="<?php echo $resultat['elaboration_contrat']; ?>" data-transmition_contrat_client="<?php echo $resultat['transmition_contrat_client']; ?>" data-finalisation_dossier="<?php echo $resultat['finalisation_dossier']; ?>" data-control_final="<?php echo $resultat['control_final']; ?>" data-validation_dossier="<?php echo $resultat['validation_dossier']; ?>" data-trans_contrat_remise="<?php echo $resultat['transmition_contrat_remise']; ?>" data-transmition_decharge="<?php echo $resultat['transmition_decharge']; ?>" data-reception_dossier="<?php echo $resultat['reception_dossier']; ?>" data-archivage="<?php echo $resultat['archivage']; ?>">
                                        <ion-icon name="folder-open" size="large"></ion-icon>
                                        <h5><?php if (!empty($resultat['numero_dossier'])) {
                                                echo "&#8470;: " . $resultat['numero_dossier'];
                                            } ?></h5>
                                        <h4 style="text-align: center"><?php echo $resultat['nom_locataire']; ?></h4>
                                        <p style="font-size: 12px; font-style: italic"><?php echo "$percent%"; ?></p>
                                        <div class="progressBar">
                                            <div class="progression" style="width: <?php echo $percent; ?>%"></div>
                                        </div>
                                    </div>
                            <?php
                                }
                            } else {
                                echo "<p style='text-align: center; width: 100%'>Aucun contrats</p>";
                            }
                            $adhesion->closeCursor();
                            ?>
                        </div>
                        <div id="checkliste">
                            <form action="updateAdhesion.php" method="post">
                                <h2>CHECKLIST D'ADHESION CONTRAT DE BAIL VS.N°4 <ion-icon name="pencil"></ion-icon></h2><span class="croix" onclick="close();">&times;</span>
                                <span class="mini-title">(Voir la note de service N°30 du 15 Avril 2021 portant implémentation de la check-list d'adhésion de bail)</span>
                                <table id="table1">
                                    <tr>
                                        <td id="dateAjout">Date : </td>
                                        <td>N° D'ESPACE : </td>
                                        <td id="numEspace"></td>
                                    </tr>
                                    <tr>
                                        <td id="nomClient">Nom client : </td>
                                        <td>CONTRAT N° : </td>
                                        <td id="numContrat"></td>
                                    </tr>
                                    <tr>
                                        <td id="nomGI">Nom gestionnaire : </td>
                                        <td>SITE : </td>
                                        <td id="nomSite"></td>
                                    </tr>
                                </table>
                                <table id="table2">
                                    <tr>
                                        <th>TACHES</th>
                                        <th>PILOTES</th>
                                        <th>ACTIONS</th>
                                    </tr>
                                    <tr>
                                        <td><label for="negoce">Négociation avec le client et recueil d'informations sur l'espace sollicité, grace à la fiche d'adhésion</label></td>
                                        <td><label for="negoce">GI</label></td>
                                        <td><input type="checkbox" name="negoce" id="negoce" value="1"></td>
                                    </tr>
                                    <tr cl>
                                        <td><label for="val_off">Validation de l'offre sur la fiche d'adhésion :</label></td>
                                        <td><label for="val_off">RGI</label></td>
                                        <td><input type="radio" name="val_off" id="val_off" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="val_off2">Offres non-conventionnelles</label></td>
                                        <td><label for="val_off2">DSF/DO</label></td>
                                        <td><input type="radio" name="val_off" id="val_off2" value="0"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="info_client">Recueillir les informations du client pour l'élaboration de son contrat</label></td>
                                        <td><label for="info_client">GI</label></td>
                                        <td><input type="checkbox" name="info_client" id="info_client" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="elab_contrat">Elaboration du contrat selon la fiche d'adhésion : Offres conventionnelles</label></td>
                                        <td><label for="elab_contrat">Assist.DSF</label></td>
                                        <td><input type="radio" name="elab_contrat" id="elab_contrat" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="elab_contrat2">Offres non-conventionnelles</label></td>
                                        <td><label for="elab_contrat2">JDQ</label></td>
                                        <td><input type="radio" name="elab_contrat" id="elab_contrat2" value="0"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="trans_contrat">Transmission du contrat au client pour signature</label></td>
                                        <td><label for="trans_contrat">GI</label></td>
                                        <td><input type="checkbox" name="trans_contrat" id="trans_contrat" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="final_dossier">Finalisation du dossier de bail : réunir tous les documents de la checklist éléments d'adhésion au contrat de bail ci-jointe</label></td>
                                        <td><label for="final_dossier">GI</label></td>
                                        <td><input type="checkbox" name="final_dossier" id="final_dossier" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">Contrôle final du dossier de bail avant transmission à la Direction</td>
                                        <td><label for="control_final">RAF</label></td>
                                        <td><input type="radio" name="control_final" id="control_final" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="control_final2">RGI</label></td>
                                        <td><input type="radio" name="control_final" id="control_final2" value="0"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="val_doss">Validation du dossier et signature du contrat</label></td>
                                        <td><label for="val_doss">DSF/DO</label></td>
                                        <td><input type="checkbox" name="val_doss" id="val_doss" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="trans_contrat_remise">Transmission du contrat et remise des clés au client</label></td>
                                        <td><label for="trans_contrat_remise"><label for="trans_contrat_remise">GI</label></label></td>
                                        <td><input type="checkbox" name="trans_contrat_remise" id="trans_contrat_remise" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="trans_decharge">Transmission contre décharge du dossier de bail au service fiscalite et service juridique</label></td>
                                        <td><label for="trans_decharge">Assist.DSF</label></td>
                                        <td><input type="checkbox" name="trans_decharge" id="trans_decharge" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="recept_doc">Réception et contrôle du dossier (SOREPCO)</label></td>
                                        <td><label for="recept_doc">Sce.JDQ/Fisc</label></td>
                                        <td><input type="checkbox" name="recept_doc" id="recept_doc" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="archivage">Archivage du contrat enregistré et enregistrement dans le tableau de bord</label></td>
                                        <td><label for="archivage">Assist.DSF</label></td>
                                        <td><input type="checkbox" name="archivage" id="archivage" value="1"></td>
                                    </tr>
                                </table>
                                <input type="hidden" name="id_operatoire">
                                <button type="submit" name="enregistrer" id="submit"><ion-icon name="save" size="small"></ion-icon>Enregistrer</button>
                            </form>
                        </div>
                        <audio id="notificationSound">
                            <source src="../ressources/699705__skyernaklea__notification-bell-and-water.wav" type="audio/wav">
                        </audio>
                    </div>
                    <div id="main4" class="main">
                        Statistiques
                    </div>
                    <div id="main5" class="main">
                        main5
                    </div>
                </aside>
            </div>
        </body>

        </html>

<?php
    } else if (isset($_POST["submit1"])) {
        $site = $_POST['site'];
        $entite = $_POST['entite'];
        $ville = $_POST['ville'];
        $natbail = $_POST['natbail'];
        $nom = $_POST['nom'];
        $contact = $_POST['contact'];
        $logement = $_POST['logement'];
        $time_c = $_POST['time_c'];
        $loy_mens = $_POST['loy_mens'];
        $freq_paie = $_POST['freq_paie'];
        $mode_paie = $_POST['mode_paie'];
        $nb_mois_paye = $_POST['nb_mois_paye'];
        $caution = $_POST['caution'];
        $rev_loyer = $_POST['rev_loyer'];
        $pen_retard = $_POST['pen_retard'];
        $droit_reg = $_POST['droit_reg'];
        $date_start = $_POST['date_start'];
        $date_end = $_POST['date_end'];
        $gi = $_POST['gi'];
        $num_doc = $_POST['num_doc'];

        $site = strip_tags(htmlspecialchars($site));
        $entite = strip_tags(htmlspecialchars($entite));
        $ville = strip_tags(htmlspecialchars($ville));
        $natbail = strip_tags(htmlspecialchars($natbail));
        $contact = strip_tags(htmlspecialchars($contact));
        $logement = strip_tags(htmlspecialchars($logement));
        $time_c = strip_tags(htmlspecialchars($time_c));
        $loy_mens = strip_tags(htmlspecialchars($loy_mens));
        $freq_paie = strip_tags(htmlspecialchars($freq_paie));
        $mode_paie = strip_tags(htmlspecialchars($mode_paie));
        $nb_mois_paye = strip_tags(htmlspecialchars($nb_mois_paye));
        $caution = strip_tags(htmlspecialchars($caution));
        $rev_loyer = strip_tags(htmlspecialchars($rev_loyer));
        $droit_reg = strip_tags(htmlspecialchars($droit_reg));
        $date_start = strip_tags(htmlspecialchars($date_start));
        $date_end = strip_tags(htmlspecialchars($date_end));
        $gi = strip_tags(htmlspecialchars($gi));
        $num_doc = strip_tags(htmlspecialchars($num_doc));

        $etat = "En-cours";

        try {
            $connexion = new PDO("mysql:host=localhost;dbname=gestcontrapp;charset=utf8", 'root', '');
            $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $connexion->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

            $requete = $connexion->prepare("INSERT INTO mode_operatoire VALUE ('',?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'',?,0)");
            $requete->execute(array($site, $entite, $ville, $natbail, $nom, $contact, $logement, $time_c, $loy_mens, $freq_paie, $mode_paie, $nb_mois_paye, $caution, $rev_loyer, $pen_retard, $date_start, $date_end, $droit_reg, $gi, $etat));

            //récupération de l'id du dernier élément ajouter
            $last_id = $connexion->lastInsertId();

            $checkliste = $connexion->prepare("INSERT INTO adhesion VALUE('',?,1,NULL,0,NULL,0,0,NULL,0,0,0,0,0,NOW())");
            $checkliste->execute(array($last_id));

            $requete->closeCursor();
            $checkliste->closeCursor();
            header("location: index.php#main2");
        } catch (PDOException $e) {
            die('Erreur: ' . $e->getMessage());
        }
    }
} else {
    header('location: ../index.php');
}
?>