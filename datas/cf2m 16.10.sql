-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 16 Octobre 2015 à 14:15
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_texte_option_menu_idx` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Contenu de la table `texte`
--

INSERT INTO `texte` (`id`, `element`, `classe`, `titre`, `texte`, `url_image`, `ordre`, `page_id`, `url_group`) VALUES
(10, 'div', 'form-element', 'Télécharger brochure', '', '../images/download.png', 6, 1, ''),
(11, 'div', 'form-element', 'D&eacute;veloppeur Web', '&lt;h2&gt;M&eacute;tier&lt;/h2&gt;\r\n&lt;br&gt;\r\nLe d&eacute;veloppeur Web r&eacute;alise l&rsquo;ensemble des fonctionnalit&eacute;s d&rsquo;un site internet.&lt;br&gt;\r\n&lt;br&gt;\r\nApr&egrave;s analyse des besoins du client, il pr&eacute;conise et met en &oelig;uvre une solution technique pour concevoir des sites sur mesure ou adapter des solutions techniques existantes.&lt;br&gt;\r\n&lt;br&gt;\r\nLe d&eacute;veloppeur Web se diff&eacute;rencie du Web Designer : si ce dernier d&eacute;finit et met en place la charte graphique d&rsquo;un site internet en le rendant attractif, le d&eacute;veloppeur, quant &agrave; lui, assure une navigation et des interfaces agr&eacute;ables pour les utilisateurs en trouvant l&rsquo;&eacute;quilibre entre esth&eacute;tique et possibilit&eacute; techniques.', '../images/web.jpg', 1, 4, 'form'),
(12, 'div', 'form-element', '', '<h2>Qualités</h2>\n\nGénéralement statique durant de longues heures, le développeur web devra faire preuve de sang-froid : déceler des erreurs (dans les lignes de code par exemple) et les résoudre tout en se montrant à l’écoute de son client fait partie de son quotidien. \nCalme, minutieux et précis, le développeur Web devra en outre être capable de transmettre à ce dernier le savoir nécessaire à l’utilisation de son site. \n\nCes qualités ne sont pas nécessairement innées ; le stagiaire veillera donc à les développer.', '', 2, 4, ''),
(13, 'div', 'form-element', '', '<h2>Compétences</h2>\n\n- Concevoir l’architecture du site après analyse technique\n- Développer les modules techniques et les intégrer\n- Vérifier le bon fonctionnement par des tests\n- Mettre le site en ligne\n- Référencer le site\n- Former le client pour les mises à jour\n- Assurer le support technique\n- Adapter des sites pour mobiles\n- Créer des applications pour mobiles\n- Assurer le support technique du serveur dédié', '', 3, 4, ''),
(14, 'div', 'form-element', '', '<h2>Programmes de cours</h2>\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra velit ut leo efficitur, at ultrices erat tempus. Sed diam ligula, dignissim eu nulla quis, cursus iaculis arcu. Praesent lectus augue, blandit sed tempus ut, vestibulum at odio. Mauris et ligula ultrices, consectetur ligula eget, convallis ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae', '', 4, 4, ''),
(15, 'div', 'avant apropos', 'A propos', '&lt;b&gt;Le Centre de Formation 2 mille (CF2m), implant&eacute; &agrave; Saint-Gilles, propose des formations professionnelles en informatique pour demandeurs d&rsquo;emploi. Il a pour mission de lutter contre toutes les formes d&rsquo;exclusion sociale et culturelle et contre les discriminations dans l&rsquo;acc&egrave;s &agrave; la formation et &agrave; l&rsquo;emploi.&lt;/b&gt;\n\nLe CF2m est donc actif dans le secteur de l&rsquo;insertion sociale et professionnelle pour demandeurs d&#039;emploi.\n\n&Eacute;galement acteur dans les secteurs de l&rsquo;&eacute;ducation permanente, des r&eacute;seaux de savoirs et de l&rsquo;&eacute;conomie sociale, le Centre de Formation 2mille propose aux demandeurs d&rsquo;emploi des formations professionnelles en informatique et plus particuli&egrave;rement dans le secteur des TIC (Technologies de l&rsquo;Information et de la Communication). \n\nCes formations sont r&eacute;actualis&eacute;es chaque ann&eacute;e en fonction de l&rsquo;&eacute;volution des technologies et du march&eacute; de l&rsquo;emploi.\n\n&lt;b&gt;En partenariat avec Bruxelles-Formation et Actiris&lt;/b&gt;\n\nVisant l&rsquo;insertion professionnelle dans des secteurs porteurs, ces formations sont dispens&eacute;es en cours du jour en partenariat avec Bruxelles-Formation et Actiris. Elles se cl&ocirc;turent par un stage en entreprise de 6 semaines. \n\nEnfin, un accompagnement social et une aide &agrave; la recherche d&rsquo;emploi compl&egrave;tent les services offerts aux demandeurs d&rsquo;emploi.\n\n&lt;b&gt;Le CF2m, un acteur de l&#039;&eacute;conomie sociale &agrave; Bruxelles&lt;/b&gt;\n\nLe Centre de Formation 2mille est &eacute;galement actif dans le secteur de l&rsquo;&eacute;conomie sociale : d&rsquo;une part dans le r&eacute;emploi informatique et la d&eacute;mat&eacute;rialisation de d&eacute;chets &eacute;lectriques et &eacute;lectroniques, et d&rsquo;autre part, dans la communication num&eacute;rique (services graphiques : pr&eacute;-presse, imprimerie et cr&eacute;ation de sites web).\n\nEn outre, le CF2m est dot&eacute; d&rsquo;un p&ocirc;le recherche et d&eacute;veloppement dans le secteur environnemental pour l&#039;acc&egrave;s aux ressources et &agrave; l&#039;entreprenariat social.', '', 1, 14, 'aprop'),
(16, 'div', 'form-element', '', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum viverra velit ut leo efficitur, at ultrices erat tempus. Sed diam ligula, dignissim eu nulla quis, cursus iaculis arcu. Praesent lectus augue, blandit sed tempus ut, vestibulum at odio. Mauris et ligula ultrices, consectetur ligula eget, convallis ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae\n', '', 5, 4, 'boite_3_onglets'),
(17, 'div', 'form-element', 'Infographiste Pao', '&lt;h2&gt;M&eacute;tier&lt;/h2&gt;&lt;br&gt;\r\nL&rsquo;op&eacute;rateur PAO est charg&eacute; de la conception graphique de projets pour divers types d&rsquo;imprim&eacute;s(livres, catalogues, logos, affiches,&hellip;). &lt;br&gt;&lt;br&gt;\r\nIl dispose harmonieusement les textes, les illustrations, les photos, et agence l&rsquo;ensemble en accord avec la demande du client. &lt;br&gt;&lt;br&gt;\r\nIl a une bonne connaissance technique des outils graphiques sur ordinateur ; il sait cr&eacute;er un style, un &laquo; look &raquo; adapt&eacute; au produit &agrave; r&eacute;aliser.', '../images/pao.jpg', 1, 5, 'form'),
(18, 'div', 'form-element', '', '<h2>Qualités</h2>\n\nRigueur, précision, organisation, patience, sens de l’esthétique : l’opérateur PAO jongle permanence entre sa réflexion quant à la conception graphique du travail à réaliser (sa relation au client) et le suivi de l’ensemble de la chaine graphique (sa relation à l’imprimeur). \n\nEn outre, il devra être capable de parfois aller au-delà de ses propres critères esthétiques : la finalité première restant la satisfaction de son client.', '', 2, 5, ''),
(19, 'div', 'form-element', '', '<h2>Compétences</h2>\n\n- Créer et modifier des visuels à des fins de communication ;\n- Concevoir des projets graphiques destinés à l’impression ;\n- Traiter, retoucher et optimiser des images ;  \n- Réaliser la mise en page et l’habillage graphique de différents types de documents (dépliants, flyers,lettres, affiches, brochures,…) ;\n- Créer un document à des fins de publication électronique', '', 3, 5, ''),
(21, 'div', 'form-element', '', '<h2>Programmes de cours</h2>\n\n<b>1. Cours généraux</b>\nGestion de projet, Communication visuelle, Communication visuelle, Typographie, Devis et coûts de production, Techniques de recherche d’emploi.\n\n<b>2. Cours informatiques</b> \nIllustrator CS 6, Photoshop CS 6, Indesign CS 6, Gestion des couleurs, charte graphique, Chaîne graphique, Travaux pratiques : réalisation d’un book, ateliers créatifs, Acrobat (création de PDF), Ergonomie, Tablette graphique, Photo numérique\nInitiations HTML, CSS, CMS WordPress', '', 4, 5, ''),
(22, 'div', 'form-element', '', 'PAO pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 5, 'boite_3_onglets'),
(23, 'div', 'form-element', 'Animateur Multim&eacute;dia', '&lt;h2&gt;M&eacute;tier&lt;/h2&gt;&lt;br&gt;\r\nL&rsquo;animateur multim&eacute;dia accompagne et initie des publics diff&eacute;rents (des enfants, des adultes, mais aussi des personnes du 3e &acirc;ge) &agrave; l&rsquo;outil informatique et aux usages de l&rsquo;Internet et du multim&eacute;dia au travers d&rsquo;activit&eacute;s d&rsquo;animation techniques, citoyennes, &eacute;ducatives, souvent ludiques et faisant appel &agrave; la cr&eacute;ativit&eacute; artistique.', '../images/amm.jpg', 1, 6, 'form'),
(24, 'div', 'form-element', '', 'Qualités\n\nAttiré par la variété du travail, curieux et désireux de transmettre ses connaissances, l’animateur est un équilibriste ; en effet, son rôle de passeur de savoir(s) implique à la fois un savoir-faire pédagogique et une maitrise de compétences techniques. \n\nIl devra aussi apprendre à adapter ses méthodes en fonction de son public.', '', 2, 6, ''),
(25, 'div', 'form-element', '', 'Compétences\n\n- Concevoir, préparer et planifier des projets d’animation\n- Animer des ateliers dans le cadre d’un projet multimédia\n- Initier le public à l’utilisation des outils et usages des TIC (Technologies de l’information et de la communication)\n- Effectuer la gestion courante d’un parc informatique\n- Assurer les conseils aux formateurs et utilisateurs', '', 3, 6, ''),
(26, 'div', 'form-element', '', 'Programmes de cours\n\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 4, 6, ''),
(27, 'div', 'form-element', 'Boite 3 onglets', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 6, 'boite_3_onglets'),
(28, 'div', 'form-element', 'Aide Comptable', '&lt;h2&gt;M&eacute;tier&lt;/h2&gt;&lt;br&gt;\nL&rsquo;aide-comptable collecte, contr&ocirc;le, enregistre et traite les pi&egrave;ces justificatives comptables, financi&egrave;res et administratives. Il g&egrave;re les documents relatifs &agrave; la TVA et assiste le comptable dans les travaux de fin d&rsquo;exercice et/ou les cl&ocirc;tures interm&eacute;diaires.', '../images/aide.jpg', 1, 7, 'form'),
(29, 'div', 'form-element', '', 'Qualités\n\nAimant les chiffres et doté d’une capacité de concentration importante, l’aide-comptable est rigoureux, organisé et… discret ; en effet, sa capacité à respecter le secret professionnel est une condition sine qua non à la réussite de son métier.', '', 2, 7, ''),
(30, 'div', 'form-element', '', 'Compétences\n\n- Tenir la comptabilité en utilisant l’informatique, ce qui implique la création et l’encodage des factures ainsi que la modification et l’enregistrement de celles-ci, la gestion des entrées et des sorties comptables,…\n- Participer à la gestion des documents relatifs aux impôts directs et indirects (cf. la TVA) ;\n- Assurer le suivi des paiements et des transferts financiers et tenir à jour les échéanciers ;\n- Effectuer les opérations diverses courantes \n- Organiser un secrétariat, à savoir l’accueil du client, la gestion du planning, le traitement du courrier, etc.', '', 3, 7, ''),
(31, 'div', 'form-element', '', 'Programmes de cours\n\n<b>Cours généraux</b>\nAtelier pédagogique, Arithmétique, Logique, Orientation professionnelle, Communication, Dactylographie, Français, Néerlandais, Comptabilité générale, Documents commerciaux et correspondance commerciale, Techniques de secrétariat, Législation sociale, Droit fiscal, civil et commercial, Techniques de recherche d’emploi.\n\n<b>Cours informatiques</b>\nSystème d’exploitation Windows\nOffice : Word, Excel, Access, Power-Point\nLogiciel comptable Winbooks', '', 4, 7, ''),
(32, 'div', 'form-element', '', 'Donec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 5, 7, 'boite_3_onglets'),
(33, 'div', 'form-element', 'Technicien R&eacute;seaux', '&lt;h2&gt;M&eacute;tier&lt;/h2&gt;&lt;br&gt;\nLe technicien r&eacute;seaux sp&eacute;cialiste en t&eacute;l&eacute;phonie IP installe des r&eacute;seaux, d&eacute;tecte des pannes, effectue des tests chez les clients, installe une plate-forme standard de communication bas&eacute;e sur la technologie Open Source et met en place des centraux t&eacute;l&eacute;phoniques int&eacute;gr&eacute;s : t&eacute;l&eacute;phonie et transmission de donn&eacute;es.', '../images/rezo.jpg', 1, 8, 'form'),
(36, 'div', 'form-element', '', 'Programmes de cours\n\nDonec pulvinar tempor consequat. Aenean porttitor lorem lectus, sed posuere ipsum mattis quis. Donec vitae quam vitae tellus semper finibus. Suspendisse fermentum nisl nec tortor pharetra suscipit. Integer porta diam vel nulla euismod, eu egestas metus sodales. Praesent dapibus rutrum diam. Suspendisse non egestas ligula. Fusce cursus, nulla et mollis pellentesque, dui nibh mattis tortor.', '', 4, 8, ''),
(38, 'div', 'avant information', 'Informations', '<b>Nos formations sont accessibles</b>\n \n- Aux demandeurs d’emploi  (indemnisés ou non)\n- résidant en région bruxelloise\n- inscrits à Actiris \n- et qui n’ont pas obtenu de diplôme secondaire supérieur (CESS)\n\nLes personnes qui ont terminé les humanités complètes ne sont pas prioritaires. Elles peuvent cependant s’inscrire, et ne seront acceptées que s''il reste des places dans le module de formation.\n\n<b>Nos formations sont gratuites</b>\n\nOrganisées dans le cadre du statut de stagiaire en formation de Bruxelles Formation, elles donnent droit à une indemnité horaire ainsi qu’au remboursement des frais de transports.\n\n<b>Outre les conditions d''ordre administratif, les candidats doivent</b>\n\n- assister à une séance d''information \n- passer des tests de prérequis \n- participer à un entretien de motivation et défendre son projet professionnel de façon convaincante. \n\n\n<b style="color:#C00">Inscription aux séances d''info: 02/539.03.60</b>', '', 2, 2, 'info'),
(39, 'div', 'avant procedures', 'Proc&eacute;dure d&rsquo;entr&eacute;e et tests', '&lt;b&gt;Voici les pr&eacute;requis g&eacute;n&eacute;raux pr&eacute;alables &agrave; toute formation au CF2m :&lt;/b&gt;\n\n- R&eacute;ussir les tests d&eacute;terminants de la batterie de tests psychotechniques\n- Reconna&icirc;tre les homonymes dans un texte suivi\n- R&eacute;pondre &agrave; une s&eacute;rie de questions concernant son projet professionnel\n- R&eacute;pondre &agrave; un questionnaire sp&eacute;cifique &agrave; la formation choisie\n\n&lt;b&gt;Tests psychotechniques: &lt;/b&gt;\n\nCes tests informatis&eacute;s chronom&eacute;tr&eacute;s sont au nombre de 9 (dur&eacute;e moyenne : 1h40) et visent &agrave; &eacute;valuer les connaissances en fran&ccedil;ais, en calcul et en logique.\n\nLa r&eacute;ussite de ces tests est une condition pr&eacute;alable &agrave; l&rsquo;entr&eacute;e en formation au CF2m. \n\nLes r&eacute;sultats sont &eacute;talonn&eacute;s sur une &eacute;chelle de 1 &agrave; 9. Le minimum requis est 4. La moyenne se situe de 4 &agrave; 6.\n\n&lt;b style=&quot;color:#C00;&quot;&gt;Tous les candidats passent les m&ecirc;mes tests. Nous accordons une importance diff&eacute;rente \naux r&eacute;sultats des tests en fonction du projet.&lt;/b&gt;', '', 1, 10, 'test'),
(40, 'div', 'nigga modstage', 'Modalit&eacute;s de stage', 'Votre entreprise est pr&ecirc;te &agrave; accueillir un de nos stagiaires pour une p&eacute;riode de 6 semaines d&#039;exp&eacute;rience professionnelle ? Ce stage est non r&eacute;mun&eacute;r&eacute;, couvert par une assurance et une convention de stage Bruxelles Formation.\n\n&lt;b&gt;Premier contact&lt;/b&gt;\nLe premier contact a dans la plupart des cas &eacute;t&eacute; &eacute;tabli par le stagiaire. Si la p&eacute;riode de stage convient (voir tableau: disponibilit&eacute;s de stage), il sera demand&eacute; &agrave; l&#039;employeur de compl&eacute;ter un formulaire de coordonn&eacute;es (voir pdf t&eacute;l&eacute;chargeable). Formulaire de coordonn&eacute;es de l&#039;entreprise &agrave; t&eacute;l&eacute;charger.\n\n&lt;b&gt;Convention de stage&lt;/b&gt;\nLa responsable du partenariat entreprise du CF2m, Madame Corinne Henry prendra ensuite rendez-vous pour &eacute;tablir avec l&#039;employeur et le stagiaire, une convention de stage tripartite dans laquelle seront pr&eacute;cis&eacute;es:\n- les t&acirc;ches\n- les horaires de travail\n- ainsi que les obligations respectives de chacun.\nL&#039;employeur d&eacute;signera un ma&icirc;tre de stage qui accueillera le stagiaire dans votre entreprise, l&#039;informera des pratiques de l&#039;entreprise, lui fournira le mat&eacute;riel n&eacute;cessaire &agrave; l&#039;accomplissement des t&acirc;ches d&eacute;finies. \n\n&lt;b&gt;Evaluation de fin de stage&lt;/b&gt;\nAvant la fin du stage, la responsable accompagnera le stagiaire et participera &agrave; l&#039;&eacute;valuation du stage avec le ma&icirc;tre de stage.\n\n&lt;b&gt;Visites d&#039;entreprises&lt;/b&gt;\nVous &ecirc;tes dispos&eacute;s &agrave; nous faire d&eacute;couvrir votre entreprise, son organisation, ses services en accueillant des groupes de stagiaires (8 &agrave; 15 personnes) afin qu&#039;ils aient une meilleure repr&eacute;sentation de ce qu&#039;est le travail dans le secteur professionnel qu&#039;ils ont choisi? Contactez la responsable du partenariat &agrave; l&#039;adresse mail suivante: corinne.henry@cf2m.be\nVous ne pouvez pas accueillir de groupes de stagiaires au sein de votre entreprise mais votre m&eacute;tier vous passionne et vous souhaitez partager votre exp&eacute;rience avec nos stagiaires?\n \nNous vous accueillerons dans nos locaux pour une s&eacute;ance d&#039;information et d&#039;&eacute;change sur votre parcours, votre m&eacute;tier. \n&lt;b style=&quot;color:#C00;&quot;&gt;Prenez contact avec corinne.henry@cf2m.be&lt;/b&gt;\n\n&lt;b&gt;Participation &agrave; des jurys d&#039;&eacute;valuation&lt;/b&gt;\nLes formations que nous dispensons se terminent par un travail d&#039;int&eacute;gration. Si vous souhaitez faire partie du jury d&#039;&eacute;valuation (il faut compter une demi-journ&eacute;e) et vous rendre compte des comp&eacute;tences acquises en formation, \n&lt;b style=&quot;color:#C00;&quot;&gt;contactez Martine Colot par mail &agrave; l&#039;adresse suivante:&lt;/b&gt;\n\n&lt;b&gt;Offres d&#039;emploi&lt;/b&gt;\nVous recherchez des profils up-to-date sans exigence de dipl&ocirc;me. Contactez-nous et nous pourrons vous conseiller et vous aider concr&egrave;tement pour l&#039;obtention d&#039;aides &agrave; l&#039;embauche \n\n&lt;b style=&quot;color:#C00;&quot;&gt;concernant nos stagiaires. corinne.henry@cf2m.be&lt;/b&gt;', '', 1, 15, 'mostages'),
(41, 'div', 'nigga dispostage', 'Tableau disponibilités de stage', 'Stage de 6 semaines en entreprise: non rémunéré, couvert par assurances et convention de stage Bruxelles Formation', '', 1, 16, 'dispo'),
(48, 'div', 'news', 'News', 'test blabla news', '', 1, 33, 'news');

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
