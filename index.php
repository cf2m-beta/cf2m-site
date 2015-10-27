<?php
    include_once 'include/config.php';
    include_once 'modele/fonctions-db.php';
    include_once 'include/fonctions.php';
    include 'include/html-head.php';
    @session_start();
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    $dossier_parent = array_pop($array_dirname);
    
    $apropos = select('texte', 'texte', 'WHERE page_id = 14');
    $apropos = mysqli_fetch_assoc($apropos);
    $apropos = $apropos['texte'];
?>
<body>
    <div id="wrapper">
        
        <?php include_once 'controleur/header.php';?>
        
        <div id="content">
          <div class="middle-content">
              <h2 class="intro">Vous êtes...</h2>
               <aside class="demploi">
                 <article>
                    <a href="demploye">Demandeur d'emploi</a>
                    <a href="demploye"></a>
                    Et vous cherchez une formation...
                 </article>
                 <div class="toggle" style="display:none;">
                      Vous êtes demandeur d’emploi inscrit chez Actiris, vous n’avez pas terminé 
                      vos humanités et vous habitez la région bruxelloise ?
                 </div>
               </aside>
               
               <aside class="patron">
                <article>
                    <a href="employe/">Employeur</a>
                    <a class="picto" href="employe"></a>
                    Et vous recherchez des personnes <br />
                    qualifiées pour un stage.
                 </article>
                 <div class="toggle" style="display:none;">
                       Vous êtes prêt à accueillir un de nos stagiaires pour une période de 6 semaines 
                       dans votre entreprise ?
                 </div>
               </aside>
               <div class="clear"></div>
               <div class="descript">
                    <p>
                        <?php
                            print truncateHtml(html_entity_decode($apropos),318, '');
                        ?>
                       
                        <a class="liremore" href="<?php echo RACINE.'demploye/?menu=14' ?>">Pour plus d’infos... [+]</a>
                    </p>
               </div>
           </div>
        </div>
        <?php
        include 'include/footer.php';
        ?>
