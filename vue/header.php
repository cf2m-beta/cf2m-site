<div id="header">
    <div class="nav-bottom">
        <nav>
            <ul>
                <li><a href="?menu=1">Accueil</a></li>
                <li><a href="">Plan du site</a></li>
                <li><a href="">Contactez-nous</a></li>
                <li><a href="">Blog</a></li>
                <?php print isset($_SESSION['login'])? '<li><a href="'.RACINE.'/include/logout.php" >Déconnexion</a></li' : '<li><a href="" class="connexion">Connexion</a></li'?>
            </ul>
            <div class="clear"></div>
        </nav>
        <div class="login animated bounceInDown" style="display:none" >
            <form method="POST">
                <input type="text" id="user" name="user" placeholder="Nom d'utilisateur" required="">
                <input type="password" id="password" name="password" placeholder="Mot de passe" required="">
                <input type="submit" value="OK">
            </form>
            <!--<span  style="font-size:.85em">Se souvenir de moi</span>&nbsp;&nbsp;&nbsp;
            <span  style="font-size:.85em">Mot de pass oublié</span>-->
        </div>
        <div id="message">
            <?php print $connexion?>
        </div>
        
        <div class="cf2m">
            <!--<h2>cf2m c'est aussi</h2>-->
            <ul>
                <li><img src="<?php print RACINE ?>images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                <li><img src="<?php print RACINE ?>images/icones/CF2DNew_logo.png" title="cf2d logo" /></li>
                <li><img src="<?php print RACINE ?>images/icones/logo-pedagotheque.png" title="Pédagotheque logo" /></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="logo">
        <a href="<?php print RACINE ?>" id="logo"><span class="hidden">Page d'accueil</span></a>
        <h2>Formations Professionnelles en Informatique</h2>
    </div>
    <div class="clear"></div>

    <?php print isset($_SESSION['login'])? '<a href="">Administration</a> | <a href="">Espace Formateur</a>' : ''?>
</div>
<div class="noprint" style="z-index:9998; position:relative;">		
        <?php
            print $menu_deroulant;
            
            if($dossier_parent == 'demploye'):
        ?>
        
                <div class="search">
                    <form action="" method="post" name="recherche">
                        <ul id="searchbar">
                            <li>
                                <input name="search" type="search" class="searchInput" placeholder="Rechercher" title="Rechercher" />
                                <a href="#" onClick="document.fsearch.submit()">
                                    <img src="<?php print RACINE ?>images/icones/reach.png" style="border: none;" alt="Search" />
                                </a>
                            </li>
                        </ul>
                        <input type="submit" style="display:none;"/>

                    </form>
                </div>
        <?php endif;?>
        
        <div class="clear"></div>
</div>

<?php
    print ($dossier_parent == 'demploye')? $banner : '';
?>
