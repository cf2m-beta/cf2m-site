-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 02 Septembre 2015 à 15:20
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
CREATE DATABASE IF NOT EXISTS `cf2m` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cf2m`;

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE IF NOT EXISTS `formateur` (
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
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`id`, `nom`, `prenom`, `nom_utilisateur`, `mot_passe`, `permission`) VALUES
(1, 'test_nom', 'test_prenom', 'admin', 'admin', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `titre`, `url`, `site`, `ordre`, `parent`) VALUES
(1, 'Formations', 'formation', 'demploye', 1, 0),
(2, 'Informations', 'info', 'demploye', 2, 0),
(3, 'Employeurs', 'employe', 'employe', 3, 0),
(4, 'Développeur Web', 'wdev', 'demploye', 1, 1),
(5, 'Infographiste Pao', 'pao', 'demploye', 2, 1),
(6, 'Animateur Multimédia', 'aam', 'demploye', 3, 1),
(7, 'Aide Comptable', 'acompt', 'demploye', 4, 1),
(8, 'Technicien Réseau', 'res', 'demploye', 5, 1),
(9, 'Inscription', 'inscr', 'demploye', 1, 2),
(10, 'Test', 'test', 'demploye', 2, 2),
(11, 'Horaire', 'hor', 'demploye', 3, 2),
(14, 'A propos', 'aprop', 'demploye', 4, 0),
(15, 'Modalités Stage', 'mostages', 'employe', 1, 3),
(16, 'Disponibilités', 'dispo', 'employe', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `texte`
--

CREATE TABLE IF NOT EXISTS `texte` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `element` varchar(100) NOT NULL,
  `classe` varchar(100) NOT NULL,
  `titre` varchar(500) DEFAULT NULL,
  `texte` text,
  `ordre` int(11) NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_texte_option_menu_idx` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `texte`, `ordre`, `page_id`) VALUES
(1, 'div', 'formation_miniature web', 'Développeur Web', 'Le développeur Web réalise l’ensemble des fonctionnalités d’un site internet. Après analyse des besoins du client', 1, 1),
(2, 'div', 'formation_miniature pao', 'Infographiste Pao', 'L’opérateur PAO est chargé de la conception graphique de projets pour divers types d’imprimés(livres, catalogues, logos, affiches,…).', 2, 1),
(7, 'div', 'formation_miniature amm', 'Animateur Multimédia', 'L’animateur multimédia accompagne et initie des publics différents (des enfants, des adultes, mais aussi des personnes du 3e âge).', 3, 1),
(8, 'div', 'formation_miniature aide', 'Aide Comptable', 'L’aide-comptable collecte, contrôle, enregistre et traite les pièces justificatives comptables, financières et administratives.', 4, 1),
(9, 'div', 'formation_miniature rezo', 'Technicien Réseaux', 'Le technicien réseaux spécialiste en téléphonie IP installe des réseaux, détecte des pannes, effectue des tests chez les clients.', 5, 1),
(10, 'div', 'formation_miniature info', 'information', '<ul>\n    <li><a href=""></a></li>\n    <li><a href=""></a></li>\n    <li><a href=""></a></li>\n    <li><a href=""></a></li>\n</ul>', 6, 1),
(11, 'div', 'content_miniature page-web', 'Métier', 'Le développeur Web réalise l’ensemble des fonctionnalités d’un site internet. \nAprès analyse des besoins du client, il préconise et met en œuvre une solution technique pour concevoir des sites sur mesure ou adapter des solutions techniques existantes.\n\nLe développeur Web se différencie du  Web Designer : si ce dernier définit et met en place la charte graphique d’un site internet en le rendant attractif, le développeur, quant à lui, assure une navigation et des interfaces agréables pour les utilisateurs en trouvant l’équilibre entre esthétique et possibilité techniques.', 1, 4),
(12, 'div', 'content_miniature page-web', 'Qualités', 'Généralement statique durant de longues heures, le développeur web devra faire preuve de sang-froid : déceler des erreurs (dans les lignes de code par exemple) et les résoudre tout en se montrant à l’écoute de son client fait partie de son quotidien. \nCalme, minutieux et précis, le développeur Web devra en outre être capable de transmettre à ce dernier le savoir nécessaire à l’utilisation de son site. \n\nCes qualités ne sont pas nécessairement innées ; le stagiaire veillera donc à les développer.', 2, 4),
(13, 'div', 'content_miniature page-web', 'Compétences', '- Concevoir l’architecture du site après analyse technique\n- Développer les modules techniques et les intégrer\n- Vérifier le bon fonctionnement par des tests\n- Mettre le site en ligne\n- Référencer le site\n- Former le client pour les mises à jour\n- Assurer le support technique\n- Adapter des sites pour mobiles\n- Créer des applications pour mobiles\n- Assurer le support technique du serveur dédié', 3, 4),
(14, 'div', 'content_miniature page-web', 'Programmes de cours', 'Web pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 4, 4),
(15, 'div', ' 	apropos', 'A propos', 'Le Centre de Formation 2 mille (CF2m), implanté à Saint-Gilles, propose des formations \n\nprofessionnelles en informatique pour demandeurs d’emploi. Il a pour mission de lutter contre \n\ntoutes les formes d’exclusion sociale et culturelle et contre les discriminations dans l’accès à la \n\nformation et à l’emploi.\n\nLe CF2m est donc actif dans le secteur de l’insertion sociale et professionnelle pour demandeurs \n\nd''emploi. (« lire la suite ici »)\n\nA partir d’ici, l’ensemble du texte (c-à-d de cette page-ci) se trouve dans l’onglet « à \n\npropos\n\nEgalement acteur dans les secteurs de l’éducation permanente, des réseaux de savoirs et de \n\nl’économie sociale, le Centre de Formation 2mille propose aux demandeurs d’emploi des \n\nformations professionnelles en informatique et plus particulièrement dans le secteur des TIC \n\n(Technologies de l’Information et de la Communication). \n\nCes formations sont réactualisées chaque année en fonction de l’évolution des technologies \n\net du marché de l’emploi.\n\nEn partenariat avec Bruxelles-Formation et Actiris\n\nVisant l’insertion professionnelle dans des secteurs porteurs, ces formations sont dispensées \n\nen cours du jour en partenariat avec Bruxelles-Formation et Actiris. Elles se clôturent par un \n\nstage en entreprise de 6 semaines. \n\nEnfin, un accompagnement social et une aide à la recherche d’emploi complètent les \n\nservices offerts aux demandeurs d’emploi.\n\nLe CF2m, un acteur de l''économie sociale à Bruxelles\n\nLe Centre de Formation 2mille est également actif dans le secteur de l’économie sociale : \n\nd’une part dans le réemploi informatique et la dématérialisation de déchets électriques et \n\nélectroniques, et d’autre part, dans la communication numérique (services graphiques : pré-\n\npresse, imprimerie et création de sites web).\n\nEn outre, le CF2m est doté d’un pôle recherche et développement dans le secteur \n\nenvironnemental pour l''accès aux ressources et à l''entreprenariat social.', 1, 14),
(16, 'div', 'content_miniature page-web', 'Boite 3 onglets', 'sfqsfsffsfqffq\n\n', 5, 4),
(17, 'div', 'content_miniature page-pao', 'Métier', 'L’opérateur PAO est chargé de la conception graphique de projets pour divers types d’imprimés(livres, catalogues, logos, affiches,…). \n\nIl dispose harmonieusement les textes, les illustrations, les photos, et agence l’ensemble en accord avec la demande du client. \n\nIl a une bonne connaissance technique des outils graphiques sur ordinateur ; il sait créer un style, un « look » adapté au produit à réaliser.', 1, 5),
(18, 'div', 'content_miniature page-pao', 'Qualités', 'Rigueur, précision, organisation, patience, sens de l’esthétique : l’opérateur PAO jongle permanence entre sa réflexion quant à la conception graphique du travail à réaliser (sa relation au client) et le suivi de l’ensemble de la chaine graphique (sa relation à l’imprimeur). \n\nEn outre, il devra être capable de parfois aller au-delà de ses propres critères esthétiques : la finalité première restant la satisfaction de son client.', 2, 5),
(19, 'div', 'content_miniature page-pao', 'Compétences', '- Créer et modifier des visuels à des fins de communication ;\n- Concevoir des projets graphiques destinés à l’impression ;\n- Traiter, retoucher et optimiser des images ;  \n- Réaliser la mise en page et l’habillage graphique de différents types de documents (dépliants, flyers,lettres, affiches, brochures,…) ;\n- Créer un document à des fins de publication électronique', 3, 5),
(21, 'div', 'content_miniature page-pao', 'Programmes de cours', 'PAO pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 4, 5),
(22, 'div', 'content_miniature page-pao', 'Boite 3 onglets', 'PAO pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 5, 5),
(23, 'div', 'content_miniature page-aam', 'Métier', 'L’animateur multimédia accompagne et initie des publics différents (des enfants, des adultes, mais aussi des personnes du 3e âge) à l’outil informatique et aux usages de l’Internet et du multimédia au travers d’activités d’animation techniques, citoyennes, éducatives, souvent ludiques et faisant appel à la créativité artistique.', 1, 6),
(24, 'div', 'content_miniature page-aam', 'Qualités', 'Attiré par la variété du travail, curieux et désireux de transmettre ses connaissances, l’animateur est un équilibriste ; en effet, son rôle de passeur de savoir(s) implique à la fois un savoir-faire pédagogique et une maitrise de compétences techniques. \n\nIl devra aussi apprendre à adapter ses méthodes en fonction de son public.', 2, 6),
(25, 'div', 'content_miniature page-aam', 'Compétences', '- Concevoir, préparer et planifier des projets d’animation\n- Animer des ateliers dans le cadre d’un projet multimédia\n- Initier le public à l’utilisation des outils et usages des TIC (Technologies de l’information et de la communication)\n- Effectuer la gestion courante d’un parc informatique\n- Assurer les conseils aux formateurs et utilisateurs', 3, 6),
(26, 'div', 'content_miniature page-aam', 'Programmes de cours', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 4, 6),
(27, 'div', 'content_miniature page-aam', 'Boite 3 onglets', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 5, 6),
(28, 'div', 'content_miniature page-aide', 'Métier', 'L’aide-comptable collecte, contrôle, enregistre et traite les pièces justificatives comptables, financières et administratives. Il gère les documents relatifs à la TVA et assiste le comptable dans les travaux de fin d’exercice et/ou les clôtures intermédiaires.', 1, 7),
(29, 'div', 'content_miniature page-aide', 'Qualités', 'Aimant les chiffres et doté d’une capacité de concentration importante, l’aide-comptable est rigoureux, organisé et… discret ; en effet, sa capacité à respecter le secret professionnel est une condition sine qua non à la réussite de son métier.', 2, 7),
(30, 'div', 'content_miniature page-aide', 'Compétences', '- Tenir la comptabilité en utilisant l’informatique, ce qui implique la création et l’encodage des factures ainsi que la modification et l’enregistrement de celles-ci, la gestion des entrées et des sorties comptables,…\n- Participer à la gestion des documents relatifs aux impôts directs et indirects (cf. la TVA) ;\n- Assurer le suivi des paiements et des transferts financiers et tenir à jour les échéanciers ;\n- Effectuer les opérations diverses courantes \n- Organiser un secrétariat, à savoir l’accueil du client, la gestion du planning, le traitement du courrier, etc.', 3, 7),
(31, 'div', 'content_miniature page-aide', 'Programmes de cours', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 4, 7),
(32, 'div', 'content_miniature page-aide', 'Boite 3 onglets', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 5, 7),
(33, 'div', 'content_miniature page-rezo', 'Métier', 'Le technicien réseaux spécialiste en téléphonie IP installe des réseaux, détecte des pannes, effectue des tests chez les clients, installe une plate-forme standard de communication basée sur la technologie Open Source et met en place des centraux téléphoniques intégrés : téléphonie et transmission de données.', 1, 8),
(34, 'div', 'content_miniature page-rezo', 'Qualités', 'A l’écoute, analytique et organisé, le technicien réseau respecte les procédures ; il est capabletrouver une information et met un point d’honneur à résoudre les problèmes. Au service de son client, il est aussi doté d’une grande curiosité, ce qui lui permet d’apprendre continuellement et d’être ainsi à jour dans sa profession.', 2, 8),
(35, 'div', 'content_miniature page-rezo', 'Compétences', '-  Diagnostiquer et résoudre une panne (hardware, software, réseaux)\n-  Fournir un support à distance à l’utilisateur\n-  Déployer et gérer un réseau\n-  Planifier et configurer l’IP\n-  Installer un configurer un central téléphonique IP et en effectuer le support et la maintenance', 3, 8),
(36, 'div', 'content_miniature page-rezo', 'Programmes de cours', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 4, 8),
(37, 'div', 'content_miniature page-rezo', 'Boite 3 onglets', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', 5, 8);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `modification`
--
ALTER TABLE `modification`
  ADD CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`texte_id`) REFERENCES `texte` (`id`),
  ADD CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`formateur_id`) REFERENCES `formateur` (`id`);

--
-- Contraintes pour la table `texte`
--
ALTER TABLE `texte`
  ADD CONSTRAINT `fk_texte_option_menu` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
