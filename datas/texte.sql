-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 23 Juin 2015 à 11:14
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `contenu`, `ordre`, `page_id`) VALUES
(1, 'div', 'formation_miniature', 'Développeur Web', '<a href=""></a>\n<h2><a href="">Développeur Web</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. Ut dolor ante, semper sit amet venenatis et, dictum nec tellus. Sed id dapibus dui, quis feugiat erat. Etiam lacus ex, elementum ut ex vitae, aliquet pellentesque odio.\n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>\n', 1, 1),
(2, 'div', 'formation_miniature', 'PAO', '<a href=""></a>\n<h2><a href="">PAO</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. Ut dolor ante, semper sit amet venenatis et, dictum nec tellus. Sed id dapibus dui, quis feugiat erat. Etiam lacus ex, elementum ut ex vitae, aliquet pellentesque odio.\n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 2, 1),
(7, 'div', 'formation_miniature', 'Animateur Multi Media', '<a href=""></a>\n<h2><a href="">Animateur Multi Media</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. Ut dolor ante, semper sit amet venenatis et, dictum nec tellus. Sed id dapibus dui, quis feugiat erat. Etiam lacus ex, elementum ut ex vitae, aliquet pellentesque odio.\n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 3, 1),
(8, 'div', 'formation_miniature', 'Aide-Comptable', '<a href=""></a>\n<h2><a href="">Aide-Comptable</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. Ut dolor ante, semper sit amet venenatis et, dictum nec tellus. Sed id dapibus dui, quis feugiat erat. Etiam lacus ex, elementum ut ex vitae, aliquet pellentesque odio.\n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 4, 1),
(9, 'div', 'formation_miniature', 'Réseaux', '<a href=""></a>\n<h2><a href="">Réseaux</a></h2>\n<p>\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse finibus pulvinar nisi, sit amet volutpat nulla dapibus eu. Ut dolor ante, semper sit amet venenatis et, dictum nec tellus. Sed id dapibus dui, quis feugiat erat. Etiam lacus ex, elementum ut ex vitae, aliquet pellentesque odio.\n</p>\n<span><a class="liremore" href="">Pour plus ici... [+]</a> </span>', 5, 1);

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
