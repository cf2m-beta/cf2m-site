-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 03 Juin 2015 à 15:49
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `cf2m`
--
CREATE DATABASE IF NOT EXISTS `cf2m` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cf2m`;

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `site` varchar(80) NOT NULL,
  `enfant` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `titre`, `url`, `site`, `enfant`, `parent`) VALUES
(0, 'Formations', 'formation', 'demploye', NULL, NULL),
(1, 'Infos', 'info', 'demploye', NULL, NULL),
(2, 'Medias', 'media', 'demploye', NULL, NULL),
(3, 'Développeur Web', 'wdev', 'demploye', NULL, 0),
(4, 'Pao', 'pao', 'demploye', NULL, 0),
(5, 'AAM', 'aam', 'demploye', NULL, 0),
(6, 'Aide Comptable', 'acompt', 'demploye', NULL, 0),
(7, 'Réseau', 'res', 'demploye', NULL, 0),
(8, 'Inscription', 'inscr', 'demploye', NULL, 1),
(9, 'Test', 'test', 'demploye', NULL, 1),
(10, 'Horaire', 'hor', 'demploye', NULL, 1),
(11, 'Galerie Image', 'gali', 'demploye', NULL, 2),
(12, 'Galerie Vidéo', 'galv', 'demploye', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `texte`
--

CREATE TABLE IF NOT EXISTS `texte` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(500) DEFAULT NULL,
  `contenu` text,
  `page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_texte_option_menu_idx` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `texte`
--
ALTER TABLE `texte`
  ADD CONSTRAINT `fk_texte_option_menu` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
