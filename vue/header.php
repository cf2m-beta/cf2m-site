<div id="header">
    <img src="../images/new logo" alt="CF2M" title="CF2M">
    <div id='admin'>
        <span id="reponse_co"><?php print $retour_header_texte?></span>
        
        <form method="POST" name="formateur">
        <?php 
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
    <?php
        print $menu_deroulant;
    ?>
    
</div>
