<div id="header">
    <img src="../images/new logo" alt="CF2M" title="CF2M">
    <div id='admin'>
        <span id="reponse_co"></span>
        <form method="POST" name="admin">
            <input type="text" name="user" placeholder="Identifiant" required>
            <input type="password" name="password" placeholder="Mot de passe" required>

        <?php 

            if(!isset($_SESSION['formateur'])){
            print "<input type='submit' value='Connexion' class='admin'>
                  </form>";
            }else{
            print "
                </form>
                <a href='includes/logout.php' id='disconect'>
                    <img src='images/logout.png' alt='Déconnexion' title='Déconnexion'>
                    Déconnexion
                </a>";
            }

        ?>
        
        <a href="./?menu=contact">
            <img src="images/contact.png" alt="Contacter" title="Contacter">
            Contact
        </a>
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
