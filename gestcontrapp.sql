-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 30 mars 2024 à 09:35
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestcontrapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `adhesion`
--

DROP TABLE IF EXISTS `adhesion`;
CREATE TABLE IF NOT EXISTS `adhesion` (
  `id_adhesion` int NOT NULL AUTO_INCREMENT,
  `id_operatoire` int NOT NULL,
  `negoce` int NOT NULL,
  `validation_offre` int DEFAULT NULL,
  `info_client` int NOT NULL,
  `elaboration_contrat` int DEFAULT NULL,
  `transmition_contrat_client` int NOT NULL,
  `finalisation_dossier` int NOT NULL,
  `control_final` int DEFAULT NULL,
  `validation_dossier` int NOT NULL,
  `transmition_contrat_remise` int NOT NULL,
  `transmition_decharge` int NOT NULL,
  `reception_dossier` int NOT NULL,
  `archivage` int NOT NULL,
  `date_ajout` date NOT NULL,
  PRIMARY KEY (`id_adhesion`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adhesion`
--

INSERT INTO `adhesion` (`id_adhesion`, `id_operatoire`, `negoce`, `validation_offre`, `info_client`, `elaboration_contrat`, `transmition_contrat_client`, `finalisation_dossier`, `control_final`, `validation_dossier`, `transmition_contrat_remise`, `transmition_decharge`, `reception_dossier`, `archivage`, `date_ajout`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-03-16'),
(2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-03-16'),
(3, 3, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, '2024-03-16'),
(4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, '2024-03-16'),
(5, 5, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, '2024-03-16'),
(6, 6, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, '2024-03-16'),
(7, 7, 1, 1, 1, 0, 1, 1, NULL, 0, 0, 0, 0, 0, '2024-03-16'),
(8, 8, 1, 1, 1, 0, 1, 0, NULL, 0, 0, 0, 0, 0, '2024-03-16'),
(9, 9, 1, 1, 1, 1, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-16'),
(10, 10, 1, 1, 1, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-16'),
(11, 11, 1, 1, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-16'),
(12, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '2024-03-16'),
(13, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-03-16'),
(14, 14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-03-21'),
(15, 15, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-21'),
(16, 16, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, '2024-03-22'),
(17, 17, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-03-23'),
(18, 18, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, '2024-03-26');

-- --------------------------------------------------------

--
-- Structure de la table `immeubles_entites`
--

DROP TABLE IF EXISTS `immeubles_entites`;
CREATE TABLE IF NOT EXISTS `immeubles_entites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entite` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quartier` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `immeubles_entites`
--

INSERT INTO `immeubles_entites` (`id`, `site`, `entite`, `ville`, `quartier`) VALUES
(1, 'Immeuble Residence blue Sky ', 'CMIC', 'DOUALA', 'Bessengue'),
(2, 'Usine bassa ', 'CMIC', 'DOUALA', 'Bassa'),
(3, 'Usine yassa', 'CMIC', 'DOUALA', 'Yassa'),
(4, 'Ancienne usine colpast', 'CMIC', 'DOUALA', 'Dogsibi'),
(5, 'terrain face usine colpast', 'CMIC', 'DOUALA', 'Dogsibi'),
(6, 'terrain parallèle à usine colpast', 'CMIC', 'DOUALA', 'Dogsibi'),
(7, 'Magasin M100', 'CMIC', 'DOUALA', 'Bonabekombo'),
(8, 'immeuble camp yabassi', 'Djemmo Lucas', 'DOUALA', 'Camp Yabassi'),
(9, 'immeuble nkonmondo', 'Djemmo Lucas', 'DOUALA', 'Nkonmondo'),
(10, 'villa ndogbong', 'Djemmo Lucas', 'DOUALA', 'Ndogbong'),
(11, 'magasin PK5', 'Djemmo Lucas', 'DOUALA', 'PK5'),
(12, 'villa bonanjo', 'Mme Djommo', 'DOUALA', 'Bonanjo'),
(13, 'booutique Nestle', 'Sci Djems', 'DOUALA', 'Bonaberi'),
(14, 'terrain bonaloka(razel)', 'Sci Djems', 'DOUALA', 'Bonaloka'),
(15, 'villa cattelo', 'Sci Djems & Son', 'DOUALA', 'Bonapriso'),
(16, 'villa hydro carbure', 'Sci Emergence', 'DOUALA', 'Bonapriso'),
(17, 'immeuble mboppi M20', 'Sci Emergence', 'DOUALA', 'Mboppi'),
(18, 'magasin rue mermoz', 'Sci Emergence', 'DOUALA', 'Akwa'),
(19, 'terrain à cote CCC', 'Sci Emergence', 'DOUALA', 'Ndogssibi'),
(20, 'magasin staval dla', 'Sci Emergence', 'DOUALA', 'Marché Sandaga'),
(21, 'terrain carrefour Arno', 'Sci Emergence', 'DOUALA', 'Akwa'),
(22, 'terrain RW King', 'Sci Emergence', 'DOUALA', ''),
(23, 'terrain derrière mairie dla 1er', 'Sotradic', 'DOUALA', ''),
(24, 'usine Bonaberi', 'Setrabo', 'DOUALA', 'Bonaberi'),
(25, 'immeuble mboppi M20', 'Sorepco', 'DOUALA', 'Mboppi'),
(26, 'immeuble face centrale voyage', 'Sorepco', 'DOUALA', 'Akwa'),
(27, 'immeuble sodiko', 'Sorepco', 'DOUALA', 'Bonaberi'),
(28, 'immeuble agence ndogpassi', 'Sorepco', 'DOUALA', 'Ndogpassi'),
(29, 'terrain borne 10', 'Sorepco', 'DOUALA', 'Ndogpassi'),
(30, 'immeuble hotel de l\'air', 'Sorepco', 'DOUALA', 'Bonapriso'),
(31, 'immeuble agence mboppi', 'Sorepco', 'DOUALA', 'Mboppi'),
(32, 'immeuble agence sorepco sadi', 'Sorepco', 'DOUALA', 'Bonamoussadi'),
(33, 'terrain pack agence srpc Sadi', 'Sorepco', 'DOUALA', 'Bonamoussadi'),
(34, 'immeuble agence srpc Grand Hangar', 'Sorepco', 'DOUALA', 'Bonaberi'),
(35, 'terrain Bepanda', 'Sorepco', 'DOUALA', 'Bepanda'),
(36, 'immeuble srpc Beach', 'Sorepco', 'DOUALA', ''),
(37, 'immeuble carat Degaulle', 'Sotradic', 'DOUALA', 'Bonapriso'),
(38, 'immeuble salle des fêtes', 'Sotradic', 'DOUALA', 'Akwa'),
(39, 'villa rue njo njo', 'Sotradic', 'DOUALA', 'Bonapriso'),
(40, 'terrain japoma', 'Sotradic', 'DOUALA', 'Japoma'),
(41, 'terrain japoma', 'Sotradic', 'DOUALA', 'Japoma'),
(42, 'terrain japoma', 'Sotradic', 'DOUALA', 'Japoma'),
(43, 'terrain bodjongo', 'Sotradic', 'DOUALA', 'Bonaberi'),
(44, 'villa mballa III', 'Djemmo Lucas', 'YAOUNDE', 'Santa Barbara'),
(45, 'Terrain omnisport', 'Djemmo Lucas', 'YAOUNDE', 'Fandena'),
(46, 'immeuble monté anne rouge', 'Sci Emergence', 'YAOUNDE', ''),
(47, 'immeuble consulat de suisse', 'Sci Emergence', 'YAOUNDE', 'Bastos'),
(48, 'terrain bastos', 'Sci Emergence', 'YAOUNDE', 'Bastos'),
(49, 'villa bastos', 'Sci Emergence', 'YAOUNDE', 'Bastos'),
(50, 'centre commercial Djems', 'Sorepco', 'YAOUNDE', 'MOKOLO'),
(51, 'immeuble coron', 'Sorepco', 'YAOUNDE', 'CORON'),
(52, 'immeuble agence srpc Coron', 'Sorepco', 'YAOUNDE', 'CORON'),
(53, 'Immeuble Mvog Mbi', 'Sorepco', 'YAOUNDE', 'MVOG MBI'),
(54, 'immeuble Messassi', 'Sorepco', 'YAOUNDE', 'MESSASSI'),
(55, 'Terrain Odza', 'Sorepco', 'YAOUNDE', 'ODZA'),
(56, 'terrain à coté du centre ccial Djems', 'Sorepco', 'YAOUNDE', 'MOKOLO'),
(57, 'immeuble direction régional srpc Ydé', 'Sorepco', 'YAOUNDE', 'MOKOLO'),
(58, 'Magasin derrière DR srpc', 'Sorepco', 'YAOUNDE', 'MOKOLO'),
(59, 'Terrain Emana ', 'Sorepco', 'YAOUNDE', 'EMANA'),
(60, 'Terrain Elig Edzoa', 'Sorepco', 'YAOUNDE', ''),
(61, 'Terrain camp Sci Nlongkac', 'Sorepco', 'YAOUNDE', 'NLONGKAK'),
(62, 'Immeuble centre commercial Marie Goker', 'Sotradic', 'YAOUNDE', 'ELIG ESSONO'),
(63, 'immeuble Anor', 'Sotradic', 'YAOUNDE', 'Bastos'),
(64, 'Terrain rond point Nlongkak', 'Sotradic', 'YAOUNDE', 'NLONGKAK'),
(65, 'immeuble Golf', '', 'YAOUNDE', ''),
(66, 'terrain Mefou et Afamba', 'Sotradic', 'SOA', 'ESSESSALAKOK'),
(67, 'immeuble Mefou et Afamba Mfou', 'Sorepco', 'MFOU', 'MEHANDA II'),
(68, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(69, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(70, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(71, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(72, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(73, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(74, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(75, 'terrain obala', 'Sci Emergence', 'OBALA', 'MFOMAKAP'),
(76, 'Immeuble Kyossi', 'Djemmo Lucas', 'KYOSSI', ''),
(77, 'villa Djeleng 2', 'Djemmo Lucas', 'BAFOUSSAM', 'DJELENG'),
(78, 'immeuble Tamdja derrière Camtel', 'Djemmo Lucas', 'BAFOUSSAM', 'TAMDJA'),
(79, 'Terrain lotissement Sango', 'Djemmo Lucas', 'BAFOUSSAM', ''),
(80, 'Terrain lotissement Sango', 'Djemmo Lucas', 'BAFOUSSAM', ''),
(81, 'Terrain Djeleng 3', 'Djemmo Lucas', 'BAFOUSSAM', 'DJELENG'),
(82, 'terrain Kamkop', 'Djemmo Lucas', 'BAFOUSSAM', 'KAMKOP'),
(83, 'terrain kamkopII', 'Djemmo Lucas', 'BAFOUSSAM', 'KAMKOP'),
(84, 'terrain Famla ', 'Djemmo Lucas', 'BAFOUSSAM', 'FAMLA'),
(85, 'immeuble agence srpc Djeleng', 'Sorepco', 'BAFOUSSAM', 'DJELENG'),
(86, 'immeuble agence srpcTamdja', 'Sotradic', 'BAFOUSSAM', 'TAMDJA'),
(87, 'immeuble centre commercial Bafoussam', 'Sotradic', 'BAFOUSSAM', 'DJELENG'),
(88, 'Immeuble agence srpcSonac Street', 'Sorepco', 'BAMENDA', 'MANKON'),
(89, 'Terrain Mille II', 'Sorepco', 'BAMENDA', 'NKWEN'),
(90, 'Terrain Sonac Street', 'Sorepco', 'BAMENDA', 'MANKON'),
(91, 'Terrain Nkwen Bamenda III', 'Sorepco', 'BAMENDA', 'NKWEN'),
(92, 'Immeuble commercial avenue', 'Sotradic', 'BAMENDA', 'MANKON'),
(93, 'Centre commercial avenue', 'Sotradic', 'BAMENDA', 'MANKON'),
(94, 'Terrain Nkwen Bamenda III', 'Sotradic', 'BAMENDA', 'NKWEN'),
(95, 'Immeuble agence Sorepco', 'Sorepco', 'BUEA', 'MILLE 16'),
(96, 'Terrain nu', 'Sorepco', 'BUEA', 'MILLE 17'),
(97, 'Terrain nu', 'Sorepco', 'LIMBE', 'CARR ESTATE'),
(98, 'Terrain nu', 'Sorepco', 'LIMBE', 'CARR ESTATE'),
(99, 'immeuble agence  Sorepco', 'Sotradic', 'NGAOUNDERE', 'MADAGASCAR'),
(100, 'Terrain nu', 'Sorepco', 'NGAOUNDERE', 'SABONGARI'),
(101, 'Immeuble agence Sorepco', 'Sorepco', 'KRIBI', 'Ngoyè'),
(102, 'Terrain nu', 'Sorepco', 'KRIBI', 'Lokoundjé'),
(103, 'Terrain bartir', 'Djemmo Lucas', 'KUMBO', 'Corner water'),
(104, 'immeuble agence Sorepco', 'Sotradic', 'BERTOUA', '');

-- --------------------------------------------------------

--
-- Structure de la table `mode_operatoire`
--

DROP TABLE IF EXISTS `mode_operatoire`;
CREATE TABLE IF NOT EXISTS `mode_operatoire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entite` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nature_bail` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_locataire` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` int NOT NULL,
  `logement` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree_contrat` int DEFAULT NULL,
  `loyer_mensuel` int DEFAULT NULL,
  `frequence_paiement` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode_paiement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_mois` int DEFAULT NULL,
  `montant_caution` int DEFAULT NULL,
  `revision_loyer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pénalites_retard` int DEFAULT NULL,
  `date_debut_contrat` date DEFAULT NULL,
  `date_fin_contrat` date DEFAULT NULL,
  `droit_enregistrement` int DEFAULT NULL,
  `nom_GI` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_dossier` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favori` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `mode_operatoire`
--

INSERT INTO `mode_operatoire` (`id`, `site`, `entite`, `ville`, `nature_bail`, `nom_locataire`, `contact`, `logement`, `duree_contrat`, `loyer_mensuel`, `frequence_paiement`, `mode_paiement`, `nombre_mois`, `montant_caution`, `revision_loyer`, `pénalites_retard`, `date_debut_contrat`, `date_fin_contrat`, `droit_enregistrement`, `nom_GI`, `numero_dossier`, `etat`, `favori`) VALUES
(1, 'Terrain Nu', 'Sorepco', 'Douala', 'Habitation', 'Tamack', 612457823, 'Appart 1', 12, 600000, 'Anuelle', 'Chèque', 12, 1200000, 'Biennale', 7, '2023-03-23', '2024-03-23', 125532, 'Mme Kaptche', 'CTN001', 'Actif', 1),
(2, 'Booutique Nestle', 'Sotradic', 'Douala', 'Commercial', 'Brayann', 695214789, 'Boutique 01', 12, 500000, 'Semestrielle', 'Virement', 12, 1000000, 'Triennale', 7, '2023-03-25', '2024-03-25', 123125, 'Mr Thierry', 'BN001', 'Actif', 1),
(3, 'Immeuble Anor', 'Sci Emergence', 'Yaounde', 'Habitation', 'Adolph', 681578521, 'Appart 09', 12, 600000, 'Trimestrielle', 'OM', 12, 1200000, 'Triennale', 7, '2024-03-03', '2025-03-03', 131131, 'Mr Yannick', '', 'En-cours', 0),
(4, 'Usine Yassa', 'Setrabo', 'Douala', 'Commercial', 'Marie Jeanne', 693874152, 'Appart 05', 6, 180000, 'Anuelle', 'Momo', 12, 360000, 'Biennale', 7, '2024-03-04', '2025-03-04', 80000, 'Mr Tsafack', '', 'En-cours', 0),
(5, 'Terrain RW King', 'Sotradic', 'Douala', 'Commercial', 'Midorima', 689632584, 'Studio 04', 6, 500000, 'Anuelle', 'Chèque', 6, 500000, 'Biennale', 7, '2024-03-05', '2025-03-05', 100000, 'Mr Thierry', '', 'En-cours', 0),
(6, 'Immeuble Agence Mboppi', 'Sci Djems &amp;', 'Douala', 'Habitation', 'Donald', 645325789, 'Studio 09', 12, 600000, 'Trimestrielle', 'Carte', 12, 1200000, 'Triennale', 7, '2024-03-06', '2025-03-06', 151050, 'Mr Yannick', '', 'En-cours', 0),
(7, 'Immeuble Carat Degaulle', 'CMIC', 'Douala', 'Habitation', 'Mr Paul', 675558693, 'Appart 03', 24, 1000000, 'Anuelle', 'Espèces', 24, 2000000, 'Triennale', 7, '2024-03-07', '2025-03-07', 161223, 'Mr Tsafack', '', 'En-cours', 0),
(8, 'Villa Rue Njo Njo', 'CMIC', 'Kribi', 'Commercial', 'Landry', 678451293, 'Boutique 25', 12, 800000, 'Anuelle', 'Virement', 12, 160000, 'Biennale', 7, '2024-03-08', '2025-03-08', 200000, 'Mme Kaptche', '', 'En-cours', 0),
(9, 'Centre Commercial Avenue', 'Djemmo Lucas', 'Bafoussam', 'Commercial', 'Mr Franklin', 623786321, 'Boutique 205', 12, 750000, 'Semestrielle', 'Virement', 12, 150000, 'Triennale', 7, '2024-03-09', '2025-03-09', 210000, 'Mr Thierry', '', 'En-cours', 0),
(10, 'Magasin M100', 'Sci Djems', 'Bafoussam', 'Habitation', 'Mr Brice', 631457812, 'Appart 07', 6, 200000, 'Semestrielle', 'OM', 6, 400000, 'Triennale', 7, '2024-03-10', '2025-03-10', 80000, 'Mr Tsafack', '', 'En-cours', 0),
(11, 'Immeuble Agence srpc Djeleng', 'Djemmo Lucas', 'Ngaoundere', 'Habitation', 'Mme Béatrice', 697854125, 'Appart 205', 12, 100000, 'Trimestrielle', 'OM', 12, 200000, 'Biennale', 7, '2024-03-11', '2025-03-11', 121123, 'Mr Yannick', '', 'En-cours', 0),
(12, 'Immeuble Agence srpcTamdja', 'Mme Djommo', 'Yaounde', 'Commercial', 'Marie', 615457845, 'Boutique 05', 6, 500000, 'Trimestrielle', 'Carte', 6, 1000000, 'Biennale', 7, '2024-03-12', '2025-03-12', 12200, 'Mr Tsafack', '', 'En-cours', 0),
(13, 'Terrain Sonac Street', 'Sci Emergence', 'Bamenda', 'Habitation', 'Mme Laura', 645223366, 'Appart 101', 24, 600000, 'Semestrielle', 'Chèque', 24, 120000, 'Biennale', 7, '2023-03-30', '2024-03-30', 80000, 'Mme Kaptche', 'TSS001', 'Actif', 0),
(14, 'Ancienne Usine Colpast', 'Mme Djommo', 'Limbe', 'Commercial', 'Taïsen', 652426694, 'Salle 03', 12, 1000000, 'Anuelle', 'Momo', 12, 2000000, 'Triennale', 7, '2023-03-22', '2024-03-22', 230110, 'Mr Thierry', 'AUC001', 'Actif', 1),
(15, 'Ancienne Usine Colpast', 'Setrabo', 'Douala', 'Habitation', 'Adolph', 625225852, 'Appart 11', 12, 600000, 'Anuelle', 'Chèque', 12, 1200000, 'Biennale', 7, '2024-03-30', '2025-03-30', 125230, 'Mme Kaptche', '', 'En-cours', 0),
(16, 'Immeuble Kyossi', 'Sorepco', 'Kyossi', 'Habitation', 'Mme Esther', 689453025, 'Studio 07', 6, 500000, 'Trimestrielle', 'Virement', 6, 1000000, 'Triennale', 5, '2023-03-22', '2024-03-22', 100200, 'Mr Tsafack', 'IK001', 'Actif', 0),
(17, 'Immeuble Agence Ndogpassi', 'Sci Djems', 'Douala', 'Commercial', 'Mr Lopez', 695123265, 'Studio 25', 12, 600000, 'Semestrielle', 'OM', 12, 1200000, 'Triennale', 7, '2024-03-23', '2025-03-23', 131100, 'Mme Kaptche', '', 'En-cours', 0),
(18, 'Centre Commercial Djems', 'Sotradic', 'Bafoussam', 'Commercial', 'Mr Tchakounté', 649523578, 'Salle 001', 12, 500000, 'Semestrielle', 'Carte', 12, 1000000, 'Biennale', 7, '2023-03-26', '2024-03-26', 145225, 'Mr Thierry', 'CCD001', 'Actif', 0);

-- --------------------------------------------------------

--
-- Structure de la table `resiliation`
--

DROP TABLE IF EXISTS `resiliation`;
CREATE TABLE IF NOT EXISTS `resiliation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_operatoire` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `type`, `login`, `password`) VALUES
(1, 'Walter', 'admin', 'Walter', '123456789'),
(2, 'Mme Gadeu', 'user', 'DonaBarbara', '147258369');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
