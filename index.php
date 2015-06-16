<?php
include_once 'include/config.php';
include 'include/html-head.php';
session_start();
?>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="nav-bottom">
                <nav>
                    <ul>
                        <li><a href="#">Accueil</a></li>
                        <li><a href="#">Plan du site</a></li>
                        <li><a href="#">Contactez-nous</a></li>
                        <li><a href="#">Connexion</a></li>
                    </ul>
                    <div class="clear"></div>
                </nav>
                <div class="search">
                    <form action="" method="post" name="recherche">
                        <ul id="searchbar">
                            <li>
                                <input id="i-search" name="search" type="search" class="searchInput" value="" restorable="Rechercher" title="Rechercher" />
                                <a href="#" onClick="document.fsearch.submit()">
                                    <img src="images/icones/reach.png" style="border: none;" alt="Search" /></a>
                            </li>
                        </ul>
                        <input type="submit" style="display:none;"/>

                    </form>
                </div>
                <div class="cf2m">
                <h2>cf2m c'est aussi</h2>
                <ul>
                    <li><img src="images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                    <li><img src="images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                    <li><img src="images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                    <li><img src="images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                </ul>
            </div>
                <div class="clear"></div>
            </div>
            <div class="logo">
                <a href="index.php" id="logo"><span class="hidden">Page d'accueil</span></a>
                <h2>Formations Professionnelles en Informatique</h2>
            </div>
          <div class="clear"></div>
           

        </div>

        <div id="content">
            <a href="./demploye/">Demandeur d'emploi</a>
            <a href="./employe/">Employeur</a>
        </div>
        <?php
        include 'include/footer.php';
        ?>
