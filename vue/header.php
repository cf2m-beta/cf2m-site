<!--<div id="header">
    <img src="../images/new logo" alt="CF2M" title="CF2M">
    <div id='admin'>
        <span id="reponse_co"><?php// print $retour_header_texte?></span>
        
        <form method="POST" name="formateur">
        <?php// 
            if(!isset($_SESSION['formateur'])){
            print " <input type='text' name='ndc_formateur' placeholder='Identifiant' required>
                    <input type='password' name='pass_formateur' placeholder='Mot de passe' required>
                    <input type='submit' value='Connexion' class='admin'>
                  </form>";
            }else{
            print "
                </form>
                <a href='../include/logout.php' id='disconect'>
                    <img src='".RACINE."images/logout.png' alt='Déconnexion' title='Déconnexion'>
                    Déconnexion
                </a>";
            }

        ?>
    </div>
    <a href="?menu=plan" >Plan du site</a>
    <a href="?menu=contact" >Contactez-nous</a>
    
    <form method="post" name="recherche">
        <input type="text">
        <input type="submit" value="Rechercher">
    </form>
    <?php/
        print $menu_deroulant;
    ?>
    
</div>-->

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
                                <input name="search" type="search" class="searchInput" placeholder="Rechercher" title="Rechercher" />
                                <a href="#" onClick="document.fsearch.submit()">
                                    <img src="<?php print RACINE?>images/icones/reach.png" style="border: none;" alt="Search" />
                                </a>
                            </li>
                        </ul>
                        <input type="submit" style="display:none;"/>

                    </form>
                </div>
                <div class="cf2m">
                <!--<h2>cf2m c'est aussi</h2>-->
                <ul>
                    <li><img src="<?php print RACINE?>images/icones/logo-pixelandco.png" title="pixelco logo" /></li>
                    <li><img src="<?php print RACINE?>images/icones/CF2DNew_logo.png" title="cf2d logo" /></li>
                    <li><img src="<?php print RACINE?>images/icones/logo-pedagotheque.png" title="Pédagotheque logo" /></li>
                </ul>
            </div>
                <div class="clear"></div>
            </div>
            <div class="logo">
                <a href="<?php print RACINE?>" id="logo"><span class="hidden">Page d'accueil</span></a>
                <h2>Formations Professionnelles en Informatique</h2>
            </div>
          <div class="clear"></div>
           

        </div>
        <div class="noprint" style="z-index:9998; position:relative;">		
           <div id="smoothmenu1" class="ddsmoothmenu">
			 <?php
                 print $menu_deroulant;
             ?>
             <div class="clear"></div>
           </div>
        </div>
