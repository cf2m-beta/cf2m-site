-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 01 Juillet 2015 à 16:16
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

-- --------------------------------------------------------

--
-- Structure de la table `modification`
--

CREATE TABLE IF NOT EXISTS `modification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `texte_id` int(11) unsigned NOT NULL,
  `formateur_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_modification_texte_idx` (`texte_id`),
  UNIQUE KEY `fk_modification_formateur_idx` (`formateur_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `url` varchar(80) DEFAULT NULL,
  `site` varchar(80) NOT NULL,
  `ordre` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `titre`, `url`, `site`, `ordre`, `parent`) VALUES
(1, 'Formations', 'formation', 'demploye', 1, 0),
(2, 'Informations', 'info', 'demploye', 2, 0),
(3, 'Medias', 'media', 'demploye', 3, 0),
(4, 'Développeur Web', 'wdev', 'demploye', 1, 1),
(5, 'Infographiste PAO', 'pao', 'demploye', 2, 1),
(6, 'Animateur Multimédia', 'amm', 'demploye', 3, 1),
(7, 'Aide Comptable', 'acompt', 'demploye', 4, 1),
(8, 'Technicien Réseau', 'res', 'demploye', 5, 1),
(9, 'Inscription', 'inscr', 'demploye', 1, 2),
(10, 'Test', 'test', 'demploye', 2, 2),
(11, 'Horaire', 'hor', 'demploye', 3, 2),
(12, 'Galerie Image', 'gali', 'demploye', 1, 3),
(13, 'Galerie Vidéo', 'galv', 'demploye', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `texte`
--

CREATE TABLE IF NOT EXISTS `texte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `element` varchar(100) NOT NULL,
  `classe` varchar(100) NOT NULL,
  `titre` varchar(500) DEFAULT NULL,
  `contenu` text,
  `ordre` int(11) NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_texte_option_menu_idx` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `contenu`, `ordre`, `page_id`) VALUES
(1, 'div', 'formation_miniature web', 'Développeur Web', '<a href="" class="web1"></a>\n<h2><a href="">Développeur Web</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>\n', 1, 1),
(2, 'div', 'formation_miniature pao', 'PAO', '<a href="" class="pao1"></a>\n<h2><a href="">Infographiste Opérateur PAO</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 2, 1),
(7, 'div', 'formation_miniature amm', 'Animateur Multi Media', '<a href="" class="amm1"></a>\n<h2><a href="">Animateur Multi Media</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 3, 1),
(8, 'div', 'formation_miniature aide', 'Aide-Comptable', '<a href="" class="aide1"></a>\n<h2><a href="">Aide-Comptable</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 4, 1),
(9, 'div', 'formation_miniature rezo', 'Réseaux', '<a href="" class="rezo1"></a>\n<h2><a href="">Réseaux</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 5, 1),
(10, 'div', 'formation_miniature info', 'Information', '<ul>\n    <li><a href=""></a></li>\n    <li><a href="">Conditions d''accès</a></li>\n    <li><a href="">Inscription</a></li>\n    <li><a href="">Procédures d''entrée et Tests</a></li>\n</ul>\n', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) DEFAULT NULL,
  `prenom` varchar(80) DEFAULT NULL,
  `nom_utilisateur` varchar(30) NOT NULL,
  `mot_passe` varchar(30) DEFAULT NULL,
  `permission` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nom_utilisateur` (`nom_utilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `nom_utilisateur`, `mot_passe`, `permission`) VALUES
(1, 'test_nom', 'test_prenom', 'ndc', 'pass', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `modification`
--
ALTER TABLE `modification`
  ADD CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`texte_id`) REFERENCES `texte` (`id`),
  ADD CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`formateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `texte`
--
ALTER TABLE `texte`
  ADD CONSTRAINT `fk_texte_option_menu` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
