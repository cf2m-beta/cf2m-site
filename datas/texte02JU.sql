-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 02 Juillet 2015 à 01:33
-- Version du serveur :  5.5.23
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `contenu`, `ordre`, `page_id`) VALUES
(1, 'div', 'formation_miniature web', 'Développeur Web', '<a href="" class="web1"></a>\n<h2><a href="">Développeur Web</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>\n', 1, 1),
(2, 'div', 'formation_miniature pao', 'PAO', '<a href="" class="pao1"></a>\n<h2><a href="">Infographiste Opérateur PAO</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 2, 1),
(7, 'div', 'formation_miniature amm', 'Animateur Multi Media', '<a href="" class="amm1"></a>\n<h2><a href="">Animateur Multi Media</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 3, 1),
(8, 'div', 'formation_miniature aide', 'Aide-Comptable', '<a href="" class="aide1"></a>\n<h2><a href="">Aide-Comptable</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 4, 1),
(9, 'div', 'formation_miniature rezo', 'Réseaux', '<a href="" class="rezo1"></a>\n<h2><a href="">Réseaux</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. \n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 5, 1),
(10, 'div', 'formation_miniature info', 'Information', '<ul>\n    <li><a href=""></a></li>\n    <li><a href="">Conditions d''accès</a></li>\n    <li><a href="">Inscription</a></li>\n    <li><a href="">Procédures d''entrée et Tests</a></li>\n</ul>\n', 6, 1),
(11, 'div', 'content_miniature bla', 'web content', '<h2>Métier</h2>\n<P>\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.\n</p>', 7, 4),
(12, 'div', 'content_miniature bla', 'web content', '<h2>Qualités</h2>\n<P>\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.\n</p>', 8, 4),
(13, 'div', 'content_miniature bla', 'web content', '<h2>Compétences</h2>\r\n<P>\r\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.\r\n</p>', 9, 4),
(14, 'div', 'content_miniature bla', 'web content', '<h2>Programmes de cours</h2>\r\n<P>\r\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.\r\n</p>', 10, 4);

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
