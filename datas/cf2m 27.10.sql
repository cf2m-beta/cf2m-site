-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 27 Octobre 2015 à 11:41
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `formateur`
--

INSERT INTO `formateur` (`id`, `nom`, `prenom`, `nom_utilisateur`, `mot_passe`, `permission`) VALUES
(1, 'test_nom', 'test_prenom', 'super-admin', 'admin', 1),
(2, 'test_nom', 'test_prenom', 'admin-stagiaire', 'admin', 2),
(3, 'test_nom', 'test_prenom', 'admin-employeur', 'admin', 3);

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
  `droit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id`, `titre`, `url`, `site`, `ordre`, `parent`, `droit`) VALUES
(1, 'Formations', 'form', 'demploye', 2, 0, 0),
(2, 'Conditions d’accès', 'info', 'demploye', 3, 0, 0),
(3, 'Employeurs', 'employe', 'employe', 6, 0, 0),
(4, 'Développeur Web', 'wdev', 'demploye', 1, 1, 0),
(5, 'Infographiste Pao', 'pao', 'demploye', 2, 1, 0),
(6, 'Animateur Multimédia', 'aam', 'demploye', 3, 1, 0),
(7, 'Aide Comptable', 'acompt', 'demploye', 4, 1, 0),
(8, 'Technicien Réseaux / Tél IP', 'res', 'demploye', 5, 1, 0),
(10, 'Procédure d’entrée et tests', 'test', 'demploye', 4, 0, 0),
(11, 'Horaire', 'hor', 'demploye', 3, 2, 0),
(14, 'A propos', 'aprop', 'demploye', 1, 0, 0),
(15, 'Modalités Stage', 'mostages', 'employe', 3, 3, 0),
(16, 'Disponibilités', 'dispo', 'employe', 4, 3, 0),
(21, 'Formations', 'formation', 'employe', 2, 3, 0),
(22, 'A propos', 'aprop', 'employe', 1, 3, 0),
(23, 'News', 'news', 'demploye', 5, 0, 0),
(24, 'Administration', 'admin', 'admin', 0, -1, 0),
(25, 'Pages stagiaire', 'pagesd', 'admin', 2, 24, 2),
(26, 'News', 'news', 'admin', 3, 24, 2),
(27, 'Formations', 'form', 'admin', 1, 25, 2),
(28, 'Conditions d''accès', 'info', 'admin', 2, 25, 2),
(29, 'Procédure d''entrée et tests', 'test', 'admin', 3, 25, 2),
(30, 'Modalités stage', 'mostages', 'admin', 4, 33, 3),
(31, 'Disponibilités', 'dispo', 'admin', 5, 33, 3),
(32, 'A propos', 'aprop', 'admin', 1, 24, 2),
(33, 'Pages employeur', 'pagese', 'admin', 3, 24, 3);

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
  `url_image` varchar(1000) NOT NULL,
  `ordre` int(11) NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `url_group` varchar(80) NOT NULL,
  `couleur` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_texte_option_menu_idx` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `texte`, `url_image`, `ordre`, `page_id`, `url_group`, `couleur`) VALUES
(10, 'div', 'form-element', 'Télécharger brochure', '', '../images/download.png', 6, 1, '', ''),
(11, 'div', 'form-element', 'M&eacute;tier', '&lt;h3&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;Le d&eacute;veloppeur Web r&eacute;alise l&rsquo;ensemble des fonctionnalit&eacute;s d&rsquo;un site internet.&lt;/span&gt;&lt;/h3&gt;\r\nApr&egrave;s analyse des besoins du client, il pr&eacute;conise et met en &oelig;uvre une solution technique pour concevoir des sites sur mesure ou adapter des solutions techniques existantes.&lt;br&gt;&lt;br&gt;&lt;br&gt;\r\nLe d&eacute;veloppeur Web se diff&eacute;rencie du Web Designer : si ce dernier d&eacute;finit et met en place la charte graphique d&rsquo;un site internet en le rendant attractif, le d&eacute;veloppeur, quant &agrave; lui, assure une navigation et des interfaces agr&eacute;ables pour les utilisateurs en trouvant l&rsquo;&eacute;quilibre entre esth&eacute;tique et possibilit&eacute; techniques.', '../images/web.jpg', 1, 4, 'form', '#F78B1F'),
(12, 'div', 'form-element', 'Qualit&eacute;s', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;G&eacute;n&eacute;ralement statique durant de longues heures, le d&eacute;veloppeur web devra faire preuve de sang-froid : d&eacute;celer des erreurs (dans les lignes de code par exemple) et les r&eacute;soudre tout en se montrant &agrave; l&rsquo;&eacute;coute de son client fait partie de son quotidien.&amp;nbsp;&lt;/span&gt;&lt;br&gt;&lt;/h2&gt;&lt;br&gt;\r\nCalme, minutieux et pr&eacute;cis, le d&eacute;veloppeur Web devra en outre &ecirc;tre capable de transmettre &agrave; ce dernier le savoir n&eacute;cessaire &agrave; l&rsquo;utilisation de son site. &lt;br&gt;&lt;br&gt;\r\nCes qualit&eacute;s ne sont pas n&eacute;cessairement inn&eacute;es ; le stagiaire veillera donc &agrave; les d&eacute;velopper.', '', 2, 4, '', ''),
(13, 'div', 'form-element', 'Comp&eacute;tences', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;- Concevoir l&rsquo;architecture du site apr&egrave;s analyse technique&lt;/span&gt;&lt;/h2&gt;\r\n- D&eacute;velopper les modules techniques et les int&eacute;grer&lt;br&gt;\r\n- V&eacute;rifier le bon fonctionnement par des tests&lt;br&gt;\r\n- Mettre le site en ligne&lt;br&gt;\r\n- R&eacute;f&eacute;rencer le site&lt;br&gt;\r\n- Former le client pour les mises &agrave; jour&lt;br&gt;\r\n- Assurer le support technique&lt;br&gt;\r\n- Adapter des sites pour mobiles&lt;br&gt;\r\n- Cr&eacute;er des applications pour mobiles&lt;br&gt;\r\n- Assurer le support technique du serveur d&eacute;di&eacute;', '', 3, 4, '', ''),
(14, 'div', 'form-element', 'Programmes de cours', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra velit ut leo efficitur, at ultrices erat tempus. Sed diam ligula, dignissim eu nulla quis, cursus iaculis arcu. Praesent lectus augue, blandit sed tempus ut, vestibulum at odio. Mauris et ligula ultrices, consectetur ligula eget, convallis ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae&lt;/span&gt;&lt;/h2&gt;', '', 4, 4, '', ''),
(15, 'div', 'avant apropos', 'A propos', '&lt;font color=&quot;#ff3300&quot; style=&quot;font-weight: bold;&quot;&gt;Le Centre de Formation 2 mille (CF2m)&lt;/font&gt;, implant&eacute; &agrave; Saint-Gilles, propose des formations professionnelles en informatique pour demandeurs d&rsquo;emploi. Il a pour mission de lutter contre toutes les formes d&rsquo;exclusion sociale et culturelle et contre les discriminations dans l&rsquo;acc&egrave;s &agrave; la formation et &agrave; l&rsquo;emploi.&lt;div&gt;&lt;br&gt;\r\nLe CF2m est donc actif dans le secteur de l&rsquo;insertion sociale et professionnelle pour demandeurs d&#039;emploi.&lt;br&gt;&lt;br&gt;\r\n&Eacute;galement acteur dans les secteurs de l&rsquo;&eacute;ducation permanente, des r&eacute;seaux de savoirs et de l&rsquo;&eacute;conomie sociale, le Centre de Formation 2mille propose aux demandeurs d&rsquo;emploi des formations professionnelles en informatique et plus particuli&egrave;rement dans le secteur des TIC (Technologies de l&rsquo;Information et de la Communication). &lt;br&gt;&lt;br&gt;\r\nCes formations sont r&eacute;actualis&eacute;es chaque ann&eacute;e en fonction de l&rsquo;&eacute;volution des technologies et du march&eacute; de l&rsquo;emploi.&lt;br&gt;&lt;br&gt;\r\n&lt;b&gt;En partenariat avec Bruxelles-Formation et Actiris&lt;/b&gt;&lt;br&gt;&lt;br&gt;\r\nVisant l&rsquo;insertion professionnelle dans des secteurs porteurs, ces formations sont dispens&eacute;es en cours du jour en partenariat avec Bruxelles-Formation et Actiris. Elles se cl&ocirc;turent par un stage en entreprise de 6 semaines. &lt;br&gt;&lt;br&gt;\r\nEnfin, un accompagnement social et une aide &agrave; la recherche d&rsquo;emploi compl&egrave;tent les services offerts aux demandeurs d&rsquo;emploi.&lt;br&gt;&lt;br&gt;\r\n&lt;b&gt;Le CF2m, un acteur de l&#039;&eacute;conomie sociale &agrave; Bruxelles&lt;/b&gt;&lt;br&gt;&lt;br&gt;\r\nLe Centre de Formation 2mille est &eacute;galement actif dans le secteur de l&rsquo;&eacute;conomie sociale : d&rsquo;une part dans le r&eacute;emploi informatique et la d&eacute;mat&eacute;rialisation de d&eacute;chets &eacute;lectriques et &eacute;lectroniques, et d&rsquo;autre part, dans la communication num&eacute;rique (services graphiques : pr&eacute;-presse, imprimerie et cr&eacute;ation de sites web).&lt;br&gt;&lt;br&gt;\r\nEn outre, le CF2m est dot&eacute; d&rsquo;un p&ocirc;le recherche et d&eacute;veloppement dans le secteur environnemental pour l&#039;acc&egrave;s aux ressources et &agrave; l&#039;entreprenariat social.&lt;/div&gt;', '', 1, 14, 'aprop', ''),
(16, 'div', 'form-element', 'test', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra velit ut leo efficitur, at ultrices erat tempus. Sed diam ligula, dignissim eu nulla quis, cursus iaculis arcu. Praesent lectus augue, blandit sed tempus ut, vestibulum at odio. Mauris et ligula ultrices, consectetur ligula eget, convallis ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae&lt;br&gt;\r\n', '', 5, 4, 'boite_3_onglets', ''),
(17, 'div', 'form-element', 'M&eacute;tier', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;L&rsquo;op&eacute;rateur PAO est charg&eacute; de la conception graphique de projets pour divers types d&rsquo;imprim&eacute;s(livres, catalogues, logos, affiches,&hellip;).&amp;nbsp;&lt;/span&gt;&lt;/h2&gt;\r\nIl dispose harmonieusement les textes, les illustrations, les photos, et agence l&rsquo;ensemble en accord avec la demande du client. &lt;br&gt;\r\nIl a une bonne connaissance technique des outils graphiques sur ordinateur ; il sait cr&eacute;er un style, un &laquo; look &raquo; adapt&eacute; au produit &agrave; r&eacute;aliser.', '../images/pao.jpg', 1, 5, 'form', '#B61E8B'),
(18, 'div', 'form-element', 'Qualit&eacute;s', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;Rigueur, pr&eacute;cision, organisation, patience, sens de l&rsquo;esth&eacute;tique : l&rsquo;op&eacute;rateur PAO jongle permanence entre sa r&eacute;flexion quant &agrave; la conception graphique du travail &agrave; r&eacute;aliser (sa relation au client) et le suivi de l&rsquo;ensemble de la chaine graphique (sa relation &agrave; l&rsquo;imprimeur).&amp;nbsp;&lt;/span&gt;&lt;/h2&gt;&lt;br&gt;\r\nEn outre, il devra &ecirc;tre capable de parfois aller au-del&agrave; de ses propres crit&egrave;res esth&eacute;tiques : la finalit&eacute; premi&egrave;re restant la satisfaction de son client.', '', 2, 5, '', ''),
(19, 'div', 'form-element', 'Comp&eacute;tences', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;- Cr&eacute;er et modifier des visuels &agrave; des fins de communication ;&lt;/span&gt;&lt;/h2&gt;\r\n- Concevoir des projets graphiques destin&eacute;s &agrave; l&rsquo;impression ;&lt;br&gt;\r\n- Traiter, retoucher et optimiser des images ;  &lt;br&gt;\r\n- R&eacute;aliser la mise en page et l&rsquo;habillage graphique de diff&eacute;rents types de documents (d&eacute;pliants, flyers,lettres, affiches, brochures,&hellip;) ;&lt;br&gt;\r\n- Cr&eacute;er un document &agrave; des fins de publication &eacute;lectronique', '', 3, 5, '', ''),
(21, 'div', 'form-element', 'Programmes de cours', '&lt;h2&gt;&lt;b style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif;&quot;&gt;1. Cours g&eacute;n&eacute;raux&lt;/b&gt;&lt;/h2&gt;\r\nGestion de projet, Communication visuelle, Communication visuelle, Typographie, Devis et co&ucirc;ts de production, Techniques de recherche d&rsquo;emploi.&lt;br&gt;&lt;br&gt;\r\n&lt;b&gt;2. Cours informatiques&lt;/b&gt; &lt;br&gt;\r\nIllustrator CS 6, Photoshop CS 6, Indesign CS 6, Gestion des couleurs, charte graphique, Cha&icirc;ne graphique, Travaux pratiques : r&eacute;alisation d&rsquo;un book, ateliers cr&eacute;atifs, Acrobat (cr&eacute;ation de PDF), Ergonomie, Tablette graphique, Photo num&eacute;rique&lt;br&gt;\r\nInitiations HTML, CSS, CMS WordPress', '', 4, 5, '', ''),
(22, 'div', 'form-element', '', 'PAO pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 5, 'boite_3_onglets', ''),
(23, 'div', 'form-element', 'Métier', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;L&rsquo;animateur multim&eacute;dia accompagne et initie des publics diff&eacute;rents (des enfants, des adultes, mais aussi des personnes du 3e &acirc;ge) &agrave; l&rsquo;outil informatique et aux usages de l&rsquo;Internet et du multim&eacute;dia au travers d&rsquo;activit&eacute;s d&rsquo;animation techniques, citoyennes, &eacute;ducatives, souvent ludiques et faisant appel &agrave; la cr&eacute;ativit&eacute; artistique.&lt;/span&gt;&lt;br&gt;&lt;/h2&gt;', '../images/amm.jpg', 1, 6, 'form', '#0089D1'),
(24, 'div', 'form-element', 'Qualit&eacute;s', 'Attir&eacute; par la vari&eacute;t&eacute; du travail, curieux et d&eacute;sireux de transmettre ses connaissances, l&rsquo;animateur est un &eacute;quilibriste ; en effet, son r&ocirc;le de passeur de savoir(s) implique &agrave; la fois un savoir-faire p&eacute;dagogique et une maitrise de comp&eacute;tences techniques. &lt;br&gt;\r\n&lt;br&gt;\r\nIl devra aussi apprendre &agrave; adapter ses m&eacute;thodes en fonction de son public.', '', 2, 6, '', ''),
(25, 'div', 'form-element', 'Comp&eacute;tences', '- Concevoir, pr&eacute;parer et planifier des projets d&rsquo;animation&lt;br&gt;\r\n- Animer des ateliers dans le cadre d&rsquo;un projet multim&eacute;dia&lt;br&gt;\r\n- Initier le public &agrave; l&rsquo;utilisation des outils et usages des TIC (Technologies de l&rsquo;information et de la communication)&lt;br&gt;\r\n- Effectuer la gestion courante d&rsquo;un parc informatique&lt;br&gt;\r\n- Assurer les conseils aux formateurs et utilisateurs', '', 3, 6, '', ''),
(26, 'div', 'form-element', 'Programmes de cours', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 4, 6, '', ''),
(27, 'div', 'form-element', 'Boite 3 onglets', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 6, 'boite_3_onglets', ''),
(28, 'div', 'form-element', 'Métier', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;L&rsquo;aide-comptable collecte, contr&ocirc;le, enregistre et traite les pi&egrave;ces justificatives comptables, financi&egrave;res et administratives. Il g&egrave;re les documents relatifs &agrave; la TVA et assiste le comptable dans les travaux de fin d&rsquo;exercice et/ou les cl&ocirc;tures interm&eacute;diaires.&lt;/span&gt;&lt;br&gt;&lt;/h2&gt;', '../images/aide.jpg', 1, 7, 'form', '#B4D435'),
(29, 'div', 'form-element', 'Qualit&eacute;s', 'Aimant les chiffres et dot&eacute; d&rsquo;une capacit&eacute; de concentration importante, l&rsquo;aide-comptable est rigoureux, organis&eacute; et&hellip; discret ; en effet, sa capacit&eacute; &agrave; respecter le secret professionnel est une condition sine qua non &agrave; la r&eacute;ussite de son m&eacute;tier.', '', 2, 7, '', ''),
(30, 'div', 'form-element', 'Comp&eacute;tences', '- Tenir la comptabilit&eacute; en utilisant l&rsquo;informatique, ce qui implique la cr&eacute;ation et l&rsquo;encodage des factures ainsi que la modification et l&rsquo;enregistrement de celles-ci, la gestion des entr&eacute;es et des sorties comptables,&hellip;&lt;br&gt;\r\n- Participer &agrave; la gestion des documents relatifs aux imp&ocirc;ts directs et indirects (cf. la TVA) ;&lt;br&gt;\r\n- Assurer le suivi des paiements et des transferts financiers et tenir &agrave; jour les &eacute;ch&eacute;anciers ;&lt;br&gt;\r\n- Effectuer les op&eacute;rations diverses courantes &lt;br&gt;\r\n- Organiser un secr&eacute;tariat, &agrave; savoir l&rsquo;accueil du client, la gestion du planning, le traitement du courrier, etc.', '', 3, 7, '', ''),
(31, 'div', 'form-element', 'Programmes de cours', '&lt;b&gt;Cours g&eacute;n&eacute;raux&lt;/b&gt;&lt;br&gt;\r\nAtelier p&eacute;dagogique, Arithm&eacute;tique, Logique, Orientation professionnelle, Communication, Dactylographie, Fran&ccedil;ais, N&eacute;erlandais, Comptabilit&eacute; g&eacute;n&eacute;rale, Documents commerciaux et correspondance commerciale, Techniques de secr&eacute;tariat, L&eacute;gislation sociale, Droit fiscal, civil et commercial, Techniques de recherche d&rsquo;emploi.&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;b&gt;Cours informatiques&lt;/b&gt;&lt;br&gt;\r\nSyst&egrave;me d&rsquo;exploitation Windows&lt;br&gt;\r\nOffice : Word, Excel, Access, Power-Point&lt;br&gt;\r\nLogiciel comptable Winbooks', '', 4, 7, '', ''),
(32, 'div', 'form-element', '', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 7, 'boite_3_onglets', ''),
(33, 'div', 'form-element', 'Métier', '&lt;h2&gt;&lt;span style=&quot;font-size: 12px; font-family: Verdana, Geneva, sans-serif; font-weight: normal;&quot;&gt;Le technicien r&eacute;seaux sp&eacute;cialiste en t&eacute;l&eacute;phonie IP installe des r&eacute;seaux, d&eacute;tecte des pannes, effectue des tests chez les clients, installe une plate-forme standard de communication bas&eacute;e sur la technologie Open Source et met en place des centraux t&eacute;l&eacute;phoniques int&eacute;gr&eacute;s : t&eacute;l&eacute;phonie et transmission de donn&eacute;es.&lt;/span&gt;&lt;br&gt;&lt;/h2&gt;', '../images/rezo.jpg', 1, 8, 'form', '#E31C17'),
(36, 'div', 'form-element', 'Programmes de cours', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 4, 8, '', ''),
(38, 'div', 'avant information', 'Informations', '<b>Nos formations sont accessibles</b>\n \n- Aux demandeurs d’emploi  (indemnisés ou non)\n- résidant en région bruxelloise\n- inscrits à Actiris \n- et qui n’ont pas obtenu de diplôme secondaire supérieur (CESS)\n\nLes personnes qui ont terminé les humanités complètes ne sont pas prioritaires. Elles peuvent cependant s’inscrire, et ne seront acceptées que s''il reste des places dans le module de formation.\n\n<b>Nos formations sont gratuites</b>\n\nOrganisées dans le cadre du statut de stagiaire en formation de Bruxelles Formation, elles donnent droit à une indemnité horaire ainsi qu’au remboursement des frais de transports.\n\n<b>Outre les conditions d''ordre administratif, les candidats doivent</b>\n\n- assister à une séance d''information \n- passer des tests de prérequis \n- participer à un entretien de motivation et défendre son projet professionnel de façon convaincante. \n\n\n<b style="color:#C00">Inscription aux séances d''info: 02/539.03.60</b>', '', 2, 2, 'info', ''),
(39, 'div', 'avant procedures', 'Proc&eacute;dure d&rsquo;entr&eacute;e et tests', '&lt;b&gt;Voici les pr&eacute;requis g&eacute;n&eacute;raux pr&eacute;alables &agrave; toute formation au CF2m :&lt;/b&gt;\n\n- R&eacute;ussir les tests d&eacute;terminants de la batterie de tests psychotechniques\n- Reconna&icirc;tre les homonymes dans un texte suivi\n- R&eacute;pondre &agrave; une s&eacute;rie de questions concernant son projet professionnel\n- R&eacute;pondre &agrave; un questionnaire sp&eacute;cifique &agrave; la formation choisie\n\n&lt;b&gt;Tests psychotechniques: &lt;/b&gt;\n\nCes tests informatis&eacute;s chronom&eacute;tr&eacute;s sont au nombre de 9 (dur&eacute;e moyenne : 1h40) et visent &agrave; &eacute;valuer les connaissances en fran&ccedil;ais, en calcul et en logique.\n\nLa r&eacute;ussite de ces tests est une condition pr&eacute;alable &agrave; l&rsquo;entr&eacute;e en formation au CF2m. \n\nLes r&eacute;sultats sont &eacute;talonn&eacute;s sur une &eacute;chelle de 1 &agrave; 9. Le minimum requis est 4. La moyenne se situe de 4 &agrave; 6.\n\n&lt;b style=&quot;color:#C00;&quot;&gt;Tous les candidats passent les m&ecirc;mes tests. Nous accordons une importance diff&eacute;rente \naux r&eacute;sultats des tests en fonction du projet.&lt;/b&gt;', '', 1, 10, 'test', ''),
(40, 'div', 'nigga modstage', 'Modalit&eacute;s de stage', 'Votre entreprise est pr&ecirc;te &agrave; accueillir un de nos stagiaires pour une p&eacute;riode de 6 semaines d&#039;exp&eacute;rience professionnelle ? Ce stage est non r&eacute;mun&eacute;r&eacute;, couvert par une assurance et une convention de stage Bruxelles Formation.\n\n&lt;b&gt;Premier contact&lt;/b&gt;\nLe premier contact a dans la plupart des cas &eacute;t&eacute; &eacute;tabli par le stagiaire. Si la p&eacute;riode de stage convient (voir tableau: disponibilit&eacute;s de stage), il sera demand&eacute; &agrave; l&#039;employeur de compl&eacute;ter un formulaire de coordonn&eacute;es (voir pdf t&eacute;l&eacute;chargeable). Formulaire de coordonn&eacute;es de l&#039;entreprise &agrave; t&eacute;l&eacute;charger.\n\n&lt;b&gt;Convention de stage&lt;/b&gt;\nLa responsable du partenariat entreprise du CF2m, Madame Corinne Henry prendra ensuite rendez-vous pour &eacute;tablir avec l&#039;employeur et le stagiaire, une convention de stage tripartite dans laquelle seront pr&eacute;cis&eacute;es:\n- les t&acirc;ches\n- les horaires de travail\n- ainsi que les obligations respectives de chacun.\nL&#039;employeur d&eacute;signera un ma&icirc;tre de stage qui accueillera le stagiaire dans votre entreprise, l&#039;informera des pratiques de l&#039;entreprise, lui fournira le mat&eacute;riel n&eacute;cessaire &agrave; l&#039;accomplissement des t&acirc;ches d&eacute;finies. \n\n&lt;b&gt;Evaluation de fin de stage&lt;/b&gt;\nAvant la fin du stage, la responsable accompagnera le stagiaire et participera &agrave; l&#039;&eacute;valuation du stage avec le ma&icirc;tre de stage.\n\n&lt;b&gt;Visites d&#039;entreprises&lt;/b&gt;\nVous &ecirc;tes dispos&eacute;s &agrave; nous faire d&eacute;couvrir votre entreprise, son organisation, ses services en accueillant des groupes de stagiaires (8 &agrave; 15 personnes) afin qu&#039;ils aient une meilleure repr&eacute;sentation de ce qu&#039;est le travail dans le secteur professionnel qu&#039;ils ont choisi? Contactez la responsable du partenariat &agrave; l&#039;adresse mail suivante: corinne.henry@cf2m.be\nVous ne pouvez pas accueillir de groupes de stagiaires au sein de votre entreprise mais votre m&eacute;tier vous passionne et vous souhaitez partager votre exp&eacute;rience avec nos stagiaires?\n \nNous vous accueillerons dans nos locaux pour une s&eacute;ance d&#039;information et d&#039;&eacute;change sur votre parcours, votre m&eacute;tier. \n&lt;b style=&quot;color:#C00;&quot;&gt;Prenez contact avec corinne.henry@cf2m.be&lt;/b&gt;\n\n&lt;b&gt;Participation &agrave; des jurys d&#039;&eacute;valuation&lt;/b&gt;\nLes formations que nous dispensons se terminent par un travail d&#039;int&eacute;gration. Si vous souhaitez faire partie du jury d&#039;&eacute;valuation (il faut compter une demi-journ&eacute;e) et vous rendre compte des comp&eacute;tences acquises en formation, \n&lt;b style=&quot;color:#C00;&quot;&gt;contactez Martine Colot par mail &agrave; l&#039;adresse suivante:&lt;/b&gt;\n\n&lt;b&gt;Offres d&#039;emploi&lt;/b&gt;\nVous recherchez des profils up-to-date sans exigence de dipl&ocirc;me. Contactez-nous et nous pourrons vous conseiller et vous aider concr&egrave;tement pour l&#039;obtention d&#039;aides &agrave; l&#039;embauche \n\n&lt;b style=&quot;color:#C00;&quot;&gt;concernant nos stagiaires. corinne.henry@cf2m.be&lt;/b&gt;', '', 1, 15, 'mostages', ''),
(41, 'div', 'nigga dispostage', 'Tableau disponibilités de stage', 'Stage de 6 semaines en entreprise: non rémunéré, couvert par assurances et convention de stage Bruxelles Formation', '', 1, 16, 'dispo', ''),
(48, 'div', 'news', 'News', 'test blabla news', '', 1, 33, 'news', '');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `texte`
--
ALTER TABLE `texte`
  ADD CONSTRAINT `fk_texte_option_menu` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
