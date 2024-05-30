-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 21 mai 2024 à 07:57
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

DELIMITER $$
--
-- Fonctions
--
DROP FUNCTION IF EXISTS `INITCAP`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `INITCAP` (`str` TEXT) RETURNS TEXT CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci  BEGIN
    DECLARE c CHAR(1);
    DECLARE s TEXT;
    DECLARE i INT DEFAULT 1;
    DECLARE bool INT DEFAULT 1;
    DECLARE punct CHAR(17) DEFAULT ' ()[]{},.-_!@;:?/';
    SET s = LCASE(str);
    WHILE i <= CHAR_LENGTH(str) DO
        BEGIN
            SET c = SUBSTRING(s, i, 1);
            IF LOCATE(c, punct) > 0 THEN
                SET bool = 1;
            ELSEIF bool = 1 THEN
                BEGIN
                    IF c >= 'a' AND c <= 'z' THEN
                        BEGIN
                            SET s = CONCAT(LEFT(s, i - 1), UCASE(c), SUBSTRING(s, i + 1));
                            SET bool = 0;
                        END;
                    ELSE
                        SET bool = 0;
                    END IF;
                END;
            END IF;
            SET i = i + 1;
        END;
    END WHILE;
    RETURN s;
END$$

DELIMITER ;

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adhesion`
--

INSERT INTO `adhesion` (`id_adhesion`, `id_operatoire`, `negoce`, `validation_offre`, `info_client`, `elaboration_contrat`, `transmition_contrat_client`, `finalisation_dossier`, `control_final`, `validation_dossier`, `transmition_contrat_remise`, `transmition_decharge`, `reception_dossier`, `archivage`, `date_ajout`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(6, 6, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, '2024-05-11'),
(5, 5, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(7, 7, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, '2024-05-11'),
(8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(11, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-11'),
(12, 12, 1, 1, 1, 1, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-11'),
(13, 13, 1, 1, 1, 1, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-11'),
(14, 14, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-11'),
(15, 15, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, '2024-05-11'),
(16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-13'),
(17, 17, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-13'),
(18, 18, 1, 1, 1, 1, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-14'),
(19, 19, 1, 1, 1, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-15'),
(20, 20, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-16'),
(21, 21, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, '2024-05-16'),
(22, 22, 1, 1, 1, 1, 1, 0, NULL, 0, 0, 0, 0, 0, '2024-05-16'),
(23, 23, 1, 1, 1, 1, 1, 1, NULL, 0, 0, 0, 0, 0, '2024-05-17'),
(24, 24, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-17'),
(25, 25, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-17'),
(26, 26, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17'),
(27, 27, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17'),
(28, 28, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, '2024-05-17'),
(29, 29, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-17'),
(30, 30, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-17'),
(31, 31, 1, NULL, 0, NULL, 0, 0, NULL, 0, 0, 0, 0, 0, '2024-05-17');

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
(1, 'Immeuble Residence Blue Sky ', 'CMIC', 'Douala', 'Bessengue'),
(2, 'Usine Bassa ', 'CMIC', 'Douala', 'Bassa'),
(3, 'Usine Yassa', 'CMIC', 'Douala', 'Yassa'),
(4, 'Ancienne Usine Colpast', 'CMIC', 'Douala', 'Dogsibi'),
(5, 'Terrain Face Usine Colpast', 'CMIC', 'Douala', 'Dogsibi'),
(6, 'Terrain Parallèle À Usine Colpast', 'CMIC', 'Douala', 'Dogsibi'),
(7, 'Magasin M100', 'CMIC', 'Douala', 'Bonabekombo'),
(8, 'Immeuble Camp Yabassi', 'Djemmo Lucas', 'Douala', 'Camp Yabassi'),
(9, 'Immeuble Nkonmondo', 'Djemmo Lucas', 'Douala', 'Nkonmondo'),
(10, 'Villa Ndogbong', 'Djemmo Lucas', 'Douala', 'Ndogbong'),
(11, 'Magasin Pk5', 'Djemmo Lucas', 'Douala', 'PK5'),
(12, 'Villa Bonanjo', 'Mme Djommo', 'Douala', 'Bonanjo'),
(13, 'Booutique Nestle', 'Sci Djems', 'Douala', 'Bonaberi'),
(14, 'Terrain Bonaloka(Razel)', 'Sci Djems', 'Douala', 'Bonaloka'),
(15, 'Villa Cattelo', 'Sci Djems & Son', 'Douala', 'Bonapriso'),
(16, 'Villa Hydro Carbure', 'Sci Emergence', 'Douala', 'Bonapriso'),
(17, 'Immeuble Mboppi M20', 'Sci Emergence', 'Douala', 'Mboppi'),
(18, 'Magasin Rue Mermoz', 'Sci Emergence', 'Douala', 'Akwa'),
(19, 'Terrain À Cote Ccc', 'Sci Emergence', 'Douala', 'Ndogssibi'),
(20, 'Magasin Staval Dla', 'Sci Emergence', 'Douala', 'Marché Sandaga'),
(21, 'Terrain Carrefour Arno', 'Sci Emergence', 'Douala', 'Akwa'),
(22, 'Terrain Rw King', 'Sci Emergence', 'Douala', ''),
(23, 'Terrain Derrière Mairie Dla 1er', 'Sotradic', 'Douala', ''),
(24, 'Usine Bonaberi', 'Setrabo', 'Douala', 'Bonaberi'),
(25, 'Immeuble Mboppi M20', 'Sorepco', 'Douala', 'Mboppi'),
(26, 'Immeuble Face Centrale Voyage', 'Sorepco', 'Douala', 'Akwa'),
(27, 'Immeuble Sodiko', 'Sorepco', 'Douala', 'Bonaberi'),
(28, 'Immeuble Agence Ndogpassi', 'Sorepco', 'Douala', 'Ndogpassi'),
(29, 'Terrain Borne 10', 'Sorepco', 'Douala', 'Ndogpassi'),
(30, 'Immeuble Hotel De L\'air', 'Sorepco', 'Douala', 'Bonapriso'),
(31, 'Immeuble Agence Mboppi', 'Sorepco', 'Douala', 'Mboppi'),
(32, 'Immeuble Agence Sorepco Sadi', 'Sorepco', 'Douala', 'Bonamoussadi'),
(33, 'Terrain Pack Agence Srpc Sadi', 'Sorepco', 'Douala', 'Bonamoussadi'),
(34, 'Immeuble Agence Srpc Grand Hangar', 'Sorepco', 'Douala', 'Bonaberi'),
(35, 'Terrain Bepanda', 'Sorepco', 'Douala', 'Bepanda'),
(36, 'Immeuble Srpc Beach', 'Sorepco', 'Douala', ''),
(37, 'Immeuble Carat Degaulle', 'Sotradic', 'Douala', 'Bonapriso'),
(38, 'Immeuble Salle Des Fêtes', 'Sotradic', 'Douala', 'Akwa'),
(39, 'Villa Rue Njo Njo', 'Sotradic', 'Douala', 'Bonapriso'),
(40, 'Terrain Japoma', 'Sotradic', 'Douala', 'Japoma'),
(41, 'Terrain Japoma', 'Sotradic', 'Douala', 'Japoma'),
(42, 'Terrain Japoma', 'Sotradic', 'Douala', 'Japoma'),
(43, 'Terrain Bodjongo', 'Sotradic', 'Douala', 'Bonaberi'),
(44, 'Villa Mballa III', 'Djemmo Lucas', 'Yaoundé', 'Santa Barbara'),
(45, 'Terrain Omnisport', 'Djemmo Lucas', 'Yaoundé', 'Fandena'),
(46, 'Immeuble Monté Anne Rouge', 'Sci Emergence', 'Yaoundé', ''),
(47, 'Immeuble Consulat De Suisse', 'Sci Emergence', 'Yaoundé', 'Bastos'),
(48, 'Terrain Bastos', 'Sci Emergence', 'Yaoundé', 'Bastos'),
(49, 'Villa Bastos', 'Sci Emergence', 'Yaoundé', 'Bastos'),
(50, 'Centre Commercial Djems', 'Sorepco', 'Yaoundé', 'MOKOLO'),
(51, 'Immeuble Coron', 'Sorepco', 'Yaoundé', 'CORON'),
(52, 'Immeuble Agence Srpc Coron', 'Sorepco', 'Yaoundé', 'CORON'),
(53, 'Immeuble Mvog Mbi', 'Sorepco', 'Yaoundé', 'MVOG MBI'),
(54, 'Immeuble Messassi', 'Sorepco', 'Yaoundé', 'MESSASSI'),
(55, 'Terrain Odza', 'Sorepco', 'Yaoundé', 'ODZA'),
(56, 'Terrain À Coté Du Centre Ccial Djems', 'Sorepco', 'Yaoundé', 'MOKOLO'),
(57, 'Immeuble Direction Régional Srpc Ydé', 'Sorepco', 'Yaoundé', 'MOKOLO'),
(58, 'Magasin Derrière Dr Srpc', 'Sorepco', 'Yaoundé', 'MOKOLO'),
(59, 'Terrain Emana ', 'Sorepco', 'Yaoundé', 'EMANA'),
(60, 'Terrain Elig Edzoa', 'Sorepco', 'Yaoundé', ''),
(61, 'Terrain Camp Sci Nlongkac', 'Sorepco', 'Yaoundé', 'NLONGKAK'),
(62, 'Immeuble Centre Commercial Marie Goker', 'Sotradic', 'Yaoundé', 'ELIG ESSONO'),
(63, 'Immeuble Anor', 'Sotradic', 'Yaoundé', 'Bastos'),
(64, 'Terrain Rond Point Nlongkak', 'Sotradic', 'Yaoundé', 'NLONGKAK'),
(65, 'Immeuble Golf', '', 'Yaoundé', ''),
(66, 'Terrain Mefou Et Afamba', 'Sotradic', 'Soa', 'ESSESSALAKOK'),
(67, 'Immeuble Mefou Et Afamba Mfou', 'Sorepco', 'Mfou', 'MEHANDA II'),
(68, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(69, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(70, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(71, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(72, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(73, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(74, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(75, 'Terrain Obala', 'Sci Emergence', 'Obala', 'MFOMAKAP'),
(76, 'Immeuble Kyossi', 'Djemmo Lucas', 'Kyossi', ''),
(77, 'Villa Djeleng 2', 'Djemmo Lucas', 'Bafoussam', 'DJELENG'),
(78, 'Immeuble Tamdja Derrière Camtel', 'Djemmo Lucas', 'Bafoussam', 'TAMDJA'),
(79, 'Terrain Lotissement Sango', 'Djemmo Lucas', 'Bafoussam', ''),
(80, 'Terrain Lotissement Sango', 'Djemmo Lucas', 'Bafoussam', ''),
(81, 'Terrain Djeleng 3', 'Djemmo Lucas', 'Bafoussam', 'DJELENG'),
(82, 'Terrain Kamkop', 'Djemmo Lucas', 'Bafoussam', 'KAMKOP'),
(83, 'Terrain Kamkopii', 'Djemmo Lucas', 'Bafoussam', 'KAMKOP'),
(84, 'Terrain Famla ', 'Djemmo Lucas', 'Bafoussam', 'FAMLA'),
(85, 'Immeuble Agence Srpc Djeleng', 'Sorepco', 'Bafoussam', 'DJELENG'),
(86, 'Immeuble Agence Srpctamdja', 'Sotradic', 'Bafoussam', 'TAMDJA'),
(87, 'Immeuble Centre Commercial Bafoussam', 'Sotradic', 'Bafoussam', 'DJELENG'),
(88, 'Immeuble Agence Srpcsonac Street', 'Sorepco', 'Bamenda', 'MANKON'),
(89, 'Terrain Mille II', 'Sorepco', 'Bamenda', 'NKWEN'),
(90, 'Terrain Sonac Street', 'Sorepco', 'Bamenda', 'MANKON'),
(91, 'Terrain Nkwen Bamenda Iii', 'Sorepco', 'Bamenda', 'NKWEN'),
(92, 'Immeuble Commercial Avenue', 'Sotradic', 'Bamenda', 'MANKON'),
(93, 'Centre Commercial Avenue', 'Sotradic', 'Bamenda', 'MANKON'),
(94, 'Terrain Nkwen Bamenda Iii', 'Sotradic', 'Bamenda', 'NKWEN'),
(95, 'Immeuble Agence Sorepco', 'Sorepco', 'Béua', 'MILLE 16'),
(96, 'Terrain Nu', 'Sorepco', 'Béua', 'MILLE 17'),
(97, 'Terrain Nu', 'Sorepco', 'Limbé', 'CARR ESTATE'),
(98, 'Terrain Nu', 'Sorepco', 'Limbé', 'CARR ESTATE'),
(99, 'Immeuble Agence  sorepco', 'Sotradic', 'Ngaoundéré', 'MADAGASCAR'),
(100, 'Terrain Nu', 'Sorepco', 'Ngaoundéré', 'SABONGARI'),
(101, 'Immeuble Agence Sorepco', 'Sorepco', 'Kribi', 'Ngoyè'),
(102, 'Terrain Nu', 'Sorepco', 'Kribi', 'Lokoundjé'),
(103, 'Terrain Bartir', 'Djemmo Lucas', 'Kumbo', 'Corner water'),
(104, 'Immeuble Agence Sorepco', 'Sotradic', 'Bertoiua', '');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `name_user` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse_ip` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_log` int NOT NULL,
  `message_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_logs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `logs`
--

INSERT INTO `logs` (`id_log`, `id_user`, `name_user`, `adresse_ip`, `level_log`, `message_log`, `date_logs`) VALUES
(1, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 08:34:07'),
(2, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 3', '2024-05-11 08:39:23'),
(3, 4, 'Mr Tsafack', '::1', 3, 'Modification du contrat № 3', '2024-05-11 08:39:47'),
(4, 4, 'Mr Tsafack', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 08:41:57'),
(5, 5, 'Mr Yannick', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 08:42:51'),
(6, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 4', '2024-05-11 09:07:03'),
(7, 5, 'Mr Yannick', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 09:07:14'),
(8, 6, 'Mme Kapche', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 09:09:50'),
(9, 6, 'Mme Kapche', '::1', 2, 'Ajout du nouveau contrat № 5', '2024-05-11 09:16:16'),
(10, 6, 'Mme Kapche', '::1', 2, 'Ajout du nouveau contrat № 6', '2024-05-11 09:42:38'),
(11, 6, 'Mme Kapche', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 6', '2024-05-11 09:49:47'),
(12, 6, 'Mme Kapche', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 1', '2024-05-11 10:03:11'),
(13, 6, 'Mme Kapche', '::1', 6, 'Ajout du dossier № 1 en résiliation', '2024-05-11 10:10:39'),
(14, 6, 'Mme Kapche', '::1', 3, 'Modification du contrat № 1', '2024-05-11 10:11:23'),
(15, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 11:05:10'),
(16, 6, 'Mme Kapche', '::1', 2, 'Ajout du nouveau contrat № 7', '2024-05-11 11:20:09'),
(17, 6, 'Mme Kapche', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 11:20:26'),
(18, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 11:20:42'),
(19, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 8', '2024-05-11 11:26:42'),
(20, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 9', '2024-05-11 11:30:54'),
(21, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 9', '2024-05-11 11:31:49'),
(22, 3, 'Mr Thierry', '::1', -5, 'Mise à jour de la checkliste de résiliation № 1', '2024-05-11 11:33:22'),
(23, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 11:33:29'),
(24, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 11:33:36'),
(25, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 11:38:09'),
(26, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 11:38:53'),
(27, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 10', '2024-05-11 11:42:26'),
(28, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 11', '2024-05-11 11:47:00'),
(29, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 11', '2024-05-11 11:53:56'),
(30, 4, 'Mr Tsafack', '::1', 3, 'Modification du contrat № 9', '2024-05-11 11:54:53'),
(31, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 12', '2024-05-11 12:12:43'),
(32, 4, 'Mr Tsafack', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 12:13:02'),
(33, 5, 'Mr Yannick', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 12:13:15'),
(34, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 13', '2024-05-11 12:16:39'),
(35, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 14', '2024-05-11 12:34:11'),
(36, 5, 'Mr Yannick', '::1', 6, 'Ajout du dossier № 9 en résiliation', '2024-05-11 12:34:42'),
(37, 5, 'Mr Yannick', '::1', 6, 'Ajout du dossier № 14 en résiliation', '2024-05-11 12:35:09'),
(38, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 3', '2024-05-11 12:35:44'),
(39, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 6', '2024-05-11 12:36:29'),
(40, 5, 'Mr Yannick', '::1', 6, 'Ajout du dossier № 6 en résiliation', '2024-05-11 12:36:56'),
(41, 5, 'Mr Yannick', '::1', 6, 'Ajout du dossier № 3 en résiliation', '2024-05-11 12:37:27'),
(42, 5, 'Mr Yannick', '::1', -5, 'Mise à jour de la checkliste de résiliation № 14', '2024-05-11 12:37:48'),
(43, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 14', '2024-05-11 12:38:16'),
(44, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 3', '2024-05-11 12:38:34'),
(45, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 11', '2024-05-11 12:38:51'),
(46, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 6', '2024-05-11 12:39:14'),
(47, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 15', '2024-05-11 12:41:12'),
(48, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 2', '2024-05-11 12:42:04'),
(49, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 5', '2024-05-11 12:42:12'),
(50, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 8', '2024-05-11 12:42:30'),
(51, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 10', '2024-05-11 12:42:45'),
(52, 5, 'Mr Yannick', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 12:42:50'),
(53, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 12:42:55'),
(54, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 15', '2024-05-11 12:43:16'),
(55, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 12', '2024-05-11 12:43:31'),
(56, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-11 12:45:45'),
(57, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-11 12:46:02'),
(58, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 7', '2024-05-11 12:47:44'),
(59, 1, 'Ntep', '::1', -5, 'Mise à jour de la checkliste de résiliation № 1', '2024-05-11 13:00:54'),
(60, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 1', '2024-05-11 13:03:12'),
(61, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-11 13:03:13'),
(62, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-11 13:03:14'),
(63, 1, 'Ntep', '::1', 3, 'Modification du contrat № 1', '2024-05-11 13:03:18'),
(64, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 1', '2024-05-11 13:07:38'),
(65, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 2', '2024-05-11 13:07:40'),
(66, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 3', '2024-05-11 13:07:41'),
(67, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 07:53:13'),
(68, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 08:46:43'),
(69, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 10:13:50'),
(70, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 16', '2024-05-13 11:59:17'),
(71, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 17', '2024-05-13 14:45:57'),
(72, 1, 'Ntep', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 17', '2024-05-13 14:47:38'),
(73, 1, 'Ntep', '::1', 3, 'Modification du contrat № 1', '2024-05-13 15:17:40'),
(74, 1, 'Ntep', '::1', 3, 'Modification du contrat № 2', '2024-05-13 15:18:15'),
(75, 1, 'Ntep', '::1', 3, 'Modification du contrat № 3', '2024-05-13 15:18:42'),
(76, 1, 'Ntep', '::1', 3, 'Modification du contrat № 17', '2024-05-13 15:54:04'),
(77, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 15:55:34'),
(78, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 15:58:08'),
(79, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 16:05:41'),
(80, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 16:09:57'),
(81, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 16:12:15'),
(82, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 16:33:37'),
(83, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 16:41:49'),
(84, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 21:13:21'),
(85, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-13 22:40:52'),
(86, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 8', '2024-05-13 22:59:18'),
(87, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 11', '2024-05-13 22:59:22'),
(88, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 08:25:06'),
(89, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 08:56:25'),
(90, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 08:57:45'),
(91, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:14:43'),
(92, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:15:24'),
(93, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:26:06'),
(94, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:26:08'),
(95, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:26:10'),
(96, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:27:16'),
(97, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:27:18'),
(98, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:28:35'),
(99, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:28:36'),
(100, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:28:37'),
(101, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:28:52'),
(102, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:29:21'),
(103, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:29:21'),
(104, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:29:22'),
(105, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:29:23'),
(106, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 5', '2024-05-14 09:30:10'),
(107, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-14 09:30:17'),
(108, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-14 09:30:18'),
(109, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-14 09:30:19'),
(110, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-14 09:30:19'),
(111, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-14 09:30:26'),
(112, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 6', '2024-05-14 09:30:28'),
(113, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 6', '2024-05-14 09:30:29'),
(114, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № null', '2024-05-14 09:36:40'),
(115, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 11:09:26'),
(116, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 11:23:16'),
(117, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-14 14:53:40'),
(118, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 14:53:46'),
(119, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 14:54:15'),
(120, 2, 'Mme Gadeu', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 14:58:38'),
(121, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 21:51:55'),
(122, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 18', '2024-05-14 22:32:31'),
(123, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-14 23:01:40'),
(124, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-14 23:15:40'),
(125, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 00:16:44'),
(126, 4, 'Mr Tsafack', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-15 00:19:28'),
(127, 2, 'Mme Gadeu', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 00:19:36'),
(128, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 07:05:50'),
(129, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-15 15:32:45'),
(130, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 15:35:32'),
(131, 4, 'Mr Tsafack', '::1', -5, 'Mise à jour de la checkliste de résiliation № 3', '2024-05-15 16:41:26'),
(132, 4, 'Mr Tsafack', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-15 16:41:35'),
(133, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 16:41:40'),
(134, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-15 16:47:06'),
(135, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 16:48:56'),
(136, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 19', '2024-05-15 16:50:12'),
(137, 1, 'Ntep', '::1', 3, 'Modification du contrat № 19', '2024-05-15 16:50:57'),
(138, 1, 'Ntep', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 19', '2024-05-15 16:51:24'),
(139, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 2', '2024-05-15 16:52:40'),
(140, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 2', '2024-05-15 16:52:41'),
(141, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 2', '2024-05-15 16:52:44'),
(142, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 5', '2024-05-15 16:52:46'),
(143, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-15 16:52:47'),
(144, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-15 16:54:31'),
(145, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-15 16:58:50'),
(146, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 2', '2024-05-15 17:10:44'),
(147, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 2', '2024-05-15 17:10:46'),
(148, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 8', '2024-05-15 17:11:06'),
(149, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 8', '2024-05-15 17:14:03'),
(150, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 8', '2024-05-15 17:14:31'),
(151, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 8', '2024-05-15 17:14:34'),
(152, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 5', '2024-05-15 17:16:16'),
(153, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 5', '2024-05-15 17:16:17'),
(154, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 6', '2024-05-15 17:16:32'),
(155, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 6', '2024-05-15 17:16:41'),
(156, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 8', '2024-05-15 17:17:05'),
(157, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 8', '2024-05-15 17:17:07'),
(158, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 7', '2024-05-15 17:17:10'),
(159, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 7', '2024-05-15 17:17:11'),
(160, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 2', '2024-05-15 17:17:26'),
(161, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 14', '2024-05-15 17:17:30'),
(162, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 14', '2024-05-15 17:17:31'),
(163, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 08:28:42'),
(164, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 08:31:39'),
(165, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 08:31:47'),
(166, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 20', '2024-05-16 08:35:29'),
(167, 4, 'Mr Tsafack', '::1', 3, 'Modification du contrat № 20', '2024-05-16 08:45:30'),
(168, 4, 'Mr Tsafack', '::1', 3, 'Modification du contrat № 20', '2024-05-16 08:46:03'),
(169, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 13', '2024-05-16 08:54:14'),
(170, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 17 en résiliation', '2024-05-16 09:06:34'),
(171, 4, 'Mr Tsafack', '::1', -5, 'Mise à jour de la checkliste de résiliation № 1', '2024-05-16 09:06:54'),
(172, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 11 en résiliation', '2024-05-16 09:07:55'),
(173, 4, 'Mr Tsafack', '::1', -5, 'Mise à jour de la checkliste de résiliation № 11', '2024-05-16 09:08:14'),
(174, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 5', '2024-05-16 09:10:51'),
(175, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 5 en résiliation', '2024-05-16 09:11:14'),
(176, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 21', '2024-05-16 09:13:13'),
(177, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 21', '2024-05-16 09:13:34'),
(178, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 21 en résiliation', '2024-05-16 09:14:01'),
(179, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 09:14:38'),
(180, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 22', '2024-05-16 09:15:40'),
(181, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 10', '2024-05-16 09:17:09'),
(182, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 16', '2024-05-16 09:17:27'),
(183, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 16 en résiliation', '2024-05-16 09:17:49'),
(184, 4, 'Mr Tsafack', '::1', -5, 'Mise à jour de la checkliste de résiliation № 16', '2024-05-16 09:18:12'),
(185, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 10 en résiliation', '2024-05-16 09:19:56'),
(186, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 15', '2024-05-16 09:20:36'),
(187, 4, 'Mr Tsafack', '::1', 6, 'Ajout du dossier № 15 en résiliation', '2024-05-16 09:20:49'),
(188, 6, 'Mme Kapche', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 09:22:29'),
(189, 6, 'Mme Kapche', '::1', 6, 'Ajout du dossier № 12 en résiliation', '2024-05-16 09:23:28'),
(190, 6, 'Mme Kapche', '::1', 3, 'Modification du contrat № 21', '2024-05-16 09:24:45'),
(191, 6, 'Mme Kapche', '::1', 3, 'Modification du contrat № 5', '2024-05-16 09:25:06'),
(192, 6, 'Mme Kapche', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 8', '2024-05-16 09:25:32'),
(193, 6, 'Mme Kapche', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 2', '2024-05-16 09:25:47'),
(194, 6, 'Mme Kapche', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 10:11:05'),
(195, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 10:11:09'),
(196, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 10:15:23'),
(197, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 14:07:49'),
(198, 1, 'Ntep', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 18', '2024-05-16 14:29:07'),
(199, 1, 'Ntep', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 22', '2024-05-16 14:29:23'),
(200, 1, 'Ntep', '::1', 3, 'Modification du contrat № 10', '2024-05-16 14:31:28'),
(201, 1, 'Ntep', '::1', 3, 'Modification du contrat № 13', '2024-05-16 14:32:39'),
(202, 1, 'Ntep', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 19', '2024-05-16 14:34:19'),
(203, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 14:43:25'),
(204, 2, 'Mme Gadeu', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 14:43:32'),
(205, 2, 'Mme Gadeu', '::1', 3, 'Modification du contrat № 2', '2024-05-16 14:45:35'),
(206, 2, 'Mme Gadeu', '::1', 3, 'Modification du contrat № 8', '2024-05-16 14:46:00'),
(207, 2, 'Mme Gadeu', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 7', '2024-05-16 14:46:38'),
(208, 2, 'Mme Gadeu', '::1', 3, 'Modification du contrat № 7', '2024-05-16 14:48:05'),
(209, 2, 'Mme Gadeu', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 14:52:08'),
(210, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 14:52:13'),
(211, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 15:02:53'),
(212, 1, 'Ntep', '::1', 3, 'Modification du contrat № 7', '2024-05-16 15:04:28'),
(213, 1, 'Ntep', '::1', 3, 'Modification du contrat № 11', '2024-05-16 15:08:22'),
(214, 1, 'Ntep', '::1', 3, 'Modification du contrat № 18', '2024-05-16 15:12:22'),
(215, 1, 'Ntep', '::1', 3, 'Modification du contrat № 18', '2024-05-16 15:13:16'),
(216, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 16:05:08'),
(217, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 16:05:14'),
(218, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 16:22:08'),
(219, 2, 'Mme Gadeu', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 16:22:21'),
(220, 2, 'Mme Gadeu', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-16 16:22:44'),
(221, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 16:22:51'),
(222, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-16 16:50:12'),
(223, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 00:30:37'),
(224, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 00:42:44'),
(225, 1, 'Ntep', '::1', 3, 'Modification du contrat № 3', '2024-05-17 00:46:37'),
(226, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 21', '2024-05-17 00:47:43'),
(227, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:47:45'),
(228, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:49:52'),
(229, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:51:40'),
(230, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:52:54'),
(231, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 00:53:30'),
(232, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-17 00:54:15'),
(233, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-17 00:55:45'),
(234, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-17 00:56:39'),
(235, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 21', '2024-05-17 00:57:03'),
(236, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:57:05'),
(237, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 21', '2024-05-17 00:57:36'),
(238, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 21', '2024-05-17 00:57:37'),
(239, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 22', '2024-05-17 00:58:10'),
(240, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 22', '2024-05-17 00:58:11'),
(241, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 21', '2024-05-17 00:58:12'),
(242, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 06:56:05'),
(243, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 07:01:51'),
(244, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 07:02:37'),
(245, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 07:53:32'),
(246, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 07:55:44'),
(247, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 08:53:27'),
(248, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 08:53:59'),
(249, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 09:00:36'),
(250, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 09:00:50'),
(251, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 23', '2024-05-17 09:04:20'),
(252, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 23', '2024-05-17 09:04:44'),
(253, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 24', '2024-05-17 09:07:21'),
(254, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 24', '2024-05-17 09:08:00'),
(255, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 09:09:02'),
(256, 3, 'Mr Thierry', '::1', 6, 'Ajout du dossier № 24 en résiliation', '2024-05-17 09:10:11'),
(257, 3, 'Mr Thierry', '::1', -5, 'Mise à jour de la checkliste de résiliation № 24', '2024-05-17 09:10:40'),
(258, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 24', '2024-05-17 09:29:58'),
(259, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 09:30:20'),
(260, 4, 'Mr Tsafack', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 09:30:34'),
(261, 4, 'Mr Tsafack', '::1', 2, 'Ajout du nouveau contrat № 25', '2024-05-17 09:33:46'),
(262, 4, 'Mr Tsafack', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 25', '2024-05-17 09:35:56'),
(263, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 16', '2024-05-17 09:44:46'),
(264, 4, 'Mr Tsafack', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 09:45:03'),
(265, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 09:45:06'),
(266, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 11', '2024-05-17 09:45:44'),
(267, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 23', '2024-05-17 09:45:49'),
(268, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 23', '2024-05-17 09:46:09'),
(269, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 23', '2024-05-17 09:46:25'),
(270, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 23', '2024-05-17 09:46:26'),
(271, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 23', '2024-05-17 09:46:27'),
(272, 1, 'Ntep', '::1', 2, 'Ajout du nouveau contrat № 26', '2024-05-17 10:02:36'),
(273, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 27', '2024-05-17 10:29:47'),
(274, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 15', '2024-05-17 10:35:13'),
(275, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 3', '2024-05-17 11:04:21'),
(276, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 21', '2024-05-17 11:06:27'),
(277, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 11:09:51'),
(278, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 11:09:55'),
(279, 5, 'Mr Yannick', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 11:10:05'),
(280, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 11:10:20'),
(281, 2, 'Mme Gadeu', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 11:40:40'),
(282, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-17 11:58:24'),
(283, 1, 'Ntep', '::1', -4, 'Suppression en favori du contrat № 1', '2024-05-17 11:58:44'),
(284, 1, 'Ntep', '::1', 4, 'Mise en favori du contrat № 1', '2024-05-17 11:58:45'),
(285, 2, 'Mme Gadeu', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 13', '2024-05-17 12:06:56'),
(286, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 28', '2024-05-17 14:57:08'),
(287, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 28', '2024-05-17 14:58:06'),
(288, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 28', '2024-05-17 15:00:26'),
(289, 5, 'Mr Yannick', '::1', 3, 'Modification du contrat № 28', '2024-05-17 15:00:46'),
(290, 5, 'Mr Yannick', '::1', 2, 'Ajout du nouveau contrat № 29', '2024-05-17 15:08:55'),
(291, 5, 'Mr Yannick', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 29', '2024-05-17 15:09:20'),
(292, 5, 'Mr Yannick', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 15:10:37'),
(293, 3, 'Mr Thierry', '::1', 1, 'Connexion sur la plateforme!', '2024-05-17 15:11:42'),
(294, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 30', '2024-05-17 15:15:29'),
(295, 3, 'Mr Thierry', '::1', 5, 'Mise à jour de la checkliste d\'adhésion № 30', '2024-05-17 15:16:14'),
(296, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 30', '2024-05-17 15:17:29'),
(297, 3, 'Mr Thierry', '::1', 6, 'Ajout du dossier № 30 en résiliation', '2024-05-17 15:19:20'),
(298, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 29', '2024-05-17 15:27:32'),
(299, 3, 'Mr Thierry', '::1', 3, 'Modification du contrat № 25', '2024-05-17 15:28:19'),
(300, 3, 'Mr Thierry', '::1', 2, 'Ajout du nouveau contrat № 31', '2024-05-17 16:20:53'),
(301, 3, 'Mr Thierry', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 16:59:38'),
(302, 2, 'Mme Gadeu', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 16:59:49'),
(303, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-17 17:01:15'),
(304, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-18 07:50:31'),
(305, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-18 08:28:02'),
(306, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-18 08:28:09'),
(307, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-18 09:11:38'),
(308, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-18 09:52:17'),
(309, 1, 'Ntep', '::1', -1, 'Déconnexion de la plateforme!', '2024-05-18 09:57:28'),
(310, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-18 12:55:53'),
(311, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-18 12:56:53'),
(312, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-20 13:22:51'),
(313, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-20 13:41:00'),
(314, 1, 'Ntep', '::1', 1, 'Connexion sur la plateforme!', '2024-05-21 07:05:19');

-- --------------------------------------------------------

--
-- Structure de la table `mode_operatoire`
--

DROP TABLE IF EXISTS `mode_operatoire`;
CREATE TABLE IF NOT EXISTS `mode_operatoire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entite` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nature_bail` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_locataire` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` int NOT NULL,
  `logement` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duree_contrat` int NOT NULL,
  `loyer_mensuel` int NOT NULL,
  `frequence_paiement` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode_paiement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_mois` int NOT NULL,
  `montant_caution` int NOT NULL,
  `revision_loyer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pénalites_retard` int NOT NULL,
  `date_debut_contrat` date NOT NULL,
  `date_fin_contrat` date NOT NULL,
  `droit_enregistrement` int NOT NULL,
  `nom_GI` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_dossier` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `favori` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `mode_operatoire`
--

INSERT INTO `mode_operatoire` (`id`, `site`, `entite`, `ville`, `nature_bail`, `nom_locataire`, `contact`, `logement`, `duree_contrat`, `loyer_mensuel`, `frequence_paiement`, `mode_paiement`, `nombre_mois`, `montant_caution`, `revision_loyer`, `pénalites_retard`, `date_debut_contrat`, `date_fin_contrat`, `droit_enregistrement`, `nom_GI`, `numero_dossier`, `etat`, `favori`) VALUES
(1, 'Booutique Nestle', 'Sotradic', 'Douala', 'Commerciale', 'Bruce Wayne', 698234512, 'Boutique 20', 12, 550000, 'Annuelle', 'Chèque', 12, 1100000, 'Biennale', 7, '2023-05-18', '2024-05-18', 160000, 'Mr Thierry', 'BN001', 'En-Résiliation', 1),
(2, 'Immeuble Agence Mboppi', 'Sotradic', 'Douala', 'Habitation', 'Sélina Cayle', 620784105, 'Appart 01', 12, 600000, 'Semestrielle', 'Carte', 12, 1200000, 'Triennale', 7, '2024-05-10', '2025-05-10', 165000, 'Mme Kapche', 'IAM001', 'Actif', 1),
(3, 'Immeuble Direction Régional Srpc Ydé', 'CMIC', 'Yaoundé', 'Commerciale', 'Alfred Pénnyworth', 625849541, 'Immeuble 01', 6, 70000, 'Trimestrielle', 'Espèces', 6, 140000, 'Autre', 7, '2024-05-11', '2025-05-11', 175000, 'Mr Tsafack', 'IDRS001', 'En-Résiliation', 1),
(6, 'Immeuble Hotel De L\'air', 'CMIC', 'Bafoussam', 'Commerciale', 'Mme Tabata', 658521728, 'Chambre 12', 12, 600000, 'Semestrielle', 'Carte', 12, 1200000, 'Biennale', 7, '2024-05-18', '2025-05-18', 165000, 'Mme Kapche', 'IHDA001', 'En-Résiliation', 0),
(5, 'Magasin Rue Mermoz', 'Sci Djems', 'Douala', 'Commerciale', 'Osvalde', 675421086, 'Boutique 9', 12, 12, 'Semestrielle', 'OM', 12, 24, 'Biennale', 7, '2024-05-09', '2025-05-09', 156000, 'Mme Kapche', 'IDRS002', 'En-Résiliation', 0),
(7, 'Immeuble Anor', 'Sci Djems &amp; Son', 'Douala', 'Habitation', 'Mme Lee', 678429562, 'Studio 02', 12, 600000, 'Annuelle', 'Virement', 12, 1200000, 'Biennale', 7, '2024-05-25', '2025-05-25', 160000, 'Mme Kapche', 'IA001', 'Actif', 0),
(8, 'Immeuble Camp Yabassi', 'Djemmo Lucas', 'Douala', 'Habitation', 'Mr Harvey', 694184548, 'Studio 03', 6, 700000, 'Annuelle', 'Carte', 6, 1400000, 'Triennale', 7, '2024-05-13', '2025-05-13', 250000, 'Mr Thierry', 'ICY001', 'Actif', 0),
(9, 'Villa Rue Njo Njo', 'Sotradic', 'Douala', 'Habitation', 'Mr Thomas', 689228452, 'Appart 05', 12, 500000, 'Autre', 'Chèque', 12, 1000000, 'Biennale', 7, '2023-05-17', '2024-05-17', 175000, 'Mr Thierry', 'VRNN001', 'En-Résiliation', 0),
(10, 'Ancienne Usine Colpast', 'Sci Djems', 'Bafoussam', 'Habitation', 'Mr Maroni', 692121842, 'Appart 07', 12, 450000, 'Annuelle', 'Carte', 12, 900000, 'Biennale', 7, '2023-05-19', '2024-05-19', 121500, 'Mr Tsafack', 'AUC001', 'En-Résiliation', 0),
(11, 'Villa Mballa III', 'Sotradic', 'Yaoundé', 'Habitation', 'Mr Falcon', 674828452, 'Villa 06', 12, 450000, 'Trimestrielle', 'OM', 12, 900000, 'Biennale', 7, '2023-05-11', '2024-05-11', 120000, 'Mr Tsafack', 'VM001', 'En-Résiliation', 1),
(12, 'Terrain Bepanda', 'Setrabo', 'Kyossi', 'Habitation', 'Jérome', 694512898, 'terrain b1', 12, 850000, 'Annuelle', 'Virement', 12, 1700000, 'Triennale', 7, '2024-05-03', '2025-05-03', 450000, 'Mme Kapche', '', 'En-Résiliation', 0),
(13, 'Terrain Rw King', 'Sci Emergence', 'Douala', 'Commerciale', 'Martha', 689451285, 'Salle 058', 12, 650000, 'Semestrielle', 'Chèque', 12, 1300000, 'Biennale', 7, '2024-04-29', '2025-04-29', 190000, 'Mr Yannick', 'TRK001', 'En-cours', 0),
(14, 'Terrain Kamkop', 'Djemmo Lucas', 'Kribi', 'Habitation', 'Mme mouni', 657587412, 'Terrain 04', 6, 1000000, 'Annuelle', 'Chèque', 6, 2000000, 'Biennale', 7, '2024-05-12', '2024-05-12', 500000, 'Mr Yannick', 'TK001', 'En-Résiliation', 0),
(15, 'Terrain Mille II', 'Sotradic', 'Kribi', 'Habitation', 'Mme Ivy', 692345515, 'Terrain 09', 12, 400000, 'Trimestrielle', 'Virement', 12, 800000, 'Biennale', 7, '2024-05-22', '2025-05-22', 122000, 'Mr Yannick', '', 'En-Résiliation', 0),
(16, 'Ancienne Usine Colpast', 'Sci Djems', 'Bafoussam', 'Commerciale', 'Jérémiah', 692215472, 'Boutique 01', 12, 600000, 'Trimestrielle', 'Carte', 12, 1200000, 'Biennale', 7, '2024-05-10', '2024-05-10', 250000, 'Mme Kapche', 'AUC002', 'En-Résiliation', 0),
(17, 'Villa Ndogbong', 'Mme Djommo', 'Douala', 'Habitation', 'Victor Zaz', 695236520, 'Villa de luxe', 6, 455000, 'Annuelle', 'Chèque', 6, 910000, 'Biennale', 7, '2023-05-19', '2024-05-19', 100000, 'Mr Yannick', 'VN002', 'En-Résiliation', 0),
(20, 'Immeuble Carat Degaulle', 'Sci Djems', 'Douala', 'Habitation', 'Ntep', 237, 'Appart 10', 12, 700000, 'Trimestrielle', 'Virement', 12, 1400000, 'Biennale', 7, '2023-05-31', '2024-05-31', 150000, 'Mr Tsafack', '', 'En-cours', 0),
(18, 'Terrain Obala', 'Sotradic', 'Obala', 'Habitation', 'James Gordon', 237, 'Villa 03', 12, 750000, 'Annuelle', 'Virement', 12, 1500000, 'Biennale', 7, '2023-07-14', '2024-07-14', 300000, 'Mr Thierry', '', 'En-cours', 0),
(19, 'Ancienne Usine Colpast', 'Mme Djommo', 'Ngaoundéré', 'Habitation', 'Adolph', 237, 'Appart 08', 12, 600000, 'Semestrielle', 'Virement', 12, 1200000, 'Biennale', 7, '2023-06-25', '2024-06-25', 155000, 'Mme Kapche', '', 'En-cours', 0),
(21, 'Immeuble Agence Sorepco Sadi', 'Sorepco', 'Yaoundé', 'Habitation', 'Adolph', 696164848, 'Studio 27', 12, 500000, 'Trimestrielle', 'Carte', 12, 1000000, 'Biennale', 7, '2023-05-25', '2024-05-25', 150000, 'Mr Tsafack', 'IASS001', 'En-Résiliation', 1),
(22, 'Terrain Odza', 'Sci Emergence', 'Bafoussam', 'Habitation', 'Bernard', 652952626, 'Studio 15', 12, 500000, 'Annuelle', 'Carte', 12, 1000000, 'Biennale', 7, '2023-05-26', '2024-05-26', 145000, 'Mr Tsafack', '', 'En-cours', 0),
(28, 'Immeuble Mefou Et Afamba Mfou', 'Sci Emergence', 'Mfou', 'Habitation', 'Marie', 697960314, 'Studio prime 01', 12, 350000, 'Semestrielle', 'Espèces', 12, 700000, 'Triennale', 7, '2023-05-10', '2024-05-10', 120000, 'Mr Yannick', 'IMAM001', 'Actif', 0),
(23, 'Magasin M100', 'Sotradic', 'Bafoussam', 'Habitation', 'Chanel', 656525645, 'Studio 20', 6, 520000, 'Trimestrielle', 'Carte', 6, 1040000, 'Biennale', 7, '2023-05-26', '2024-05-26', 110000, 'Mr Thierry', '', 'En-cours', 1),
(24, 'Terrain Bepanda', 'Setrabo', 'Bafoussam', 'Habitation', 'Kimberly', 685562956, 'Studio 44', 12, 450000, 'Autre', 'OM', 12, 900000, 'Biennale', 7, '2023-05-21', '2024-05-21', 210000, 'Mr Thierry', 'TB001', 'En-Résiliation', 0),
(25, 'Immeuble Residence Blue Sky ', 'Sotradic', 'Douala', 'Habitation', 'Ornella', 665368525, 'Chambre 205', 12, 400000, 'Trimestrielle', 'Chèque', 12, 800000, 'Biennale', 7, '2023-05-17', '2024-05-17', 120000, 'Mr Tsafack', 'IRBS001', 'Actif', 0),
(26, 'Centre Commercial Avenue', 'Setrabo', 'Soa', 'Commerciale', 'Jason Tod', 2147483647, 'Salle 12', 12, 150000, 'Annuelle', 'Momo', 6, 300000, 'Biennale', 7, '2023-05-30', '2024-05-30', 150500, 'Mr Thierry', '', 'En-cours', 0),
(27, 'Magasin Rue Mermoz', 'CMIC', 'Ngaoundéré', 'Commerciale', 'Mr Lucuis Fox', 685254533, 'Salle 25', 6, 220000, 'Semestrielle', 'Momo', 6, 440000, 'Biennale', 7, '2023-06-21', '2024-06-21', 280000, 'Mr Thierry', '', 'En-cours', 0),
(29, 'Immeuble Consulat De Suisse', 'Djemmo Lucas', 'Bamenda', 'Habitation', 'Pamela', 659292986, 'Appart 120', 6, 405000, 'Trimestrielle', 'Espèces', 6, 810000, 'Triennale', 7, '2023-05-23', '2024-05-23', 130000, 'Mr Yannick', 'ICS001', 'Actif', 0),
(30, 'Immeuble Agence Sorepco Sadi', 'Djemmo Lucas', 'Limbé', 'Habitation', 'Mme Christelle', 659529623, 'Appart 90', 12, 350000, 'Annuelle', 'Chèque', 12, 700000, 'Autre', 7, '2023-05-16', '2024-05-16', 200000, 'Mr Thierry', 'IASS002', 'En-Résiliation', 0),
(31, 'Immeuble Hotel De L\'air', 'CMIC', 'Kribi', 'Habitation', 'Marck', 659595596, 'Studio 20', 6, 500000, 'Semestrielle', 'Chèque', 6, 1000000, 'Triennale', 7, '2023-07-12', '2024-07-12', 180000, 'Mr Tsafack', '', 'En-cours', 0);

-- --------------------------------------------------------

--
-- Structure de la table `resiliation`
--

DROP TABLE IF EXISTS `resiliation`;
CREATE TABLE IF NOT EXISTS `resiliation` (
  `id_resiliation` int NOT NULL AUTO_INCREMENT,
  `id_mode` int NOT NULL,
  `lettre_preavis` int NOT NULL,
  `transmition_elements` int NOT NULL,
  `prevalidation_dossier` int NOT NULL,
  `validation_provisoire` int NOT NULL,
  `transmition_element_provisoire` int NOT NULL,
  `transmition_reponse` int NOT NULL,
  `etat_lieux` int NOT NULL,
  `transmition_elements_complet` int NOT NULL,
  `controle_validation_dossier` int DEFAULT NULL,
  `approbation_dossier` int NOT NULL,
  `paiement_locataire` int NOT NULL,
  `archivage_resiliation` int NOT NULL,
  `date_activation_resiliation` date NOT NULL,
  `date_resiliation` date NOT NULL,
  PRIMARY KEY (`id_resiliation`),
  UNIQUE KEY `id_mode` (`id_mode`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resiliation`
--

INSERT INTO `resiliation` (`id_resiliation`, `id_mode`, `lettre_preavis`, `transmition_elements`, `prevalidation_dossier`, `validation_provisoire`, `transmition_element_provisoire`, `transmition_reponse`, `etat_lieux`, `transmition_elements_complet`, `controle_validation_dossier`, `approbation_dossier`, `paiement_locataire`, `archivage_resiliation`, `date_activation_resiliation`, `date_resiliation`) VALUES
(1, 1, 1, 1, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-11', '2024-11-01'),
(2, 9, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-11', '2024-11-10'),
(3, 14, 1, 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-11', '2024-09-10'),
(4, 6, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-11', '2024-11-01'),
(5, 3, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-11', '2024-12-01'),
(6, 17, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-11-11'),
(7, 11, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-09-01'),
(8, 5, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-09-01'),
(9, 21, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-08-01'),
(10, 16, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-08-01'),
(11, 10, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-09-01'),
(12, 15, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-12-01'),
(13, 12, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-16', '2024-09-01'),
(14, 24, 1, 1, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-17', '2024-09-01'),
(15, 30, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, '2024-05-17', '2024-06-21');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `login` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `type`, `login`, `password`) VALUES
(1, 'Ntep', 'super admin', 'Walter', '123456789'),
(2, 'Mme Gadeu', 'admin', 'DonaBarbara', '147258369'),
(3, 'Mr Thierry', 'user', 'Douanla', '000000000'),
(4, 'Mr Tsafack', 'user', 'Arnaud', '111111111'),
(5, 'Mr Yannick', 'user', 'Yannick', '222222222'),
(6, 'Mme Kapche', 'user', 'Kapche', '333333333');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
