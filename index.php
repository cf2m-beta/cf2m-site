<?php
    include_once 'include/config.php';
    include_once 'modele/fonctions-db.php';
    include_once 'include/fonctions.php';
    include 'include/html-head.php';
    @session_start();
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    $dossier_parent = array_pop($array_dirname);
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
                      <span style="color:#C30; font-weight:bold">Le Centre de Formation 2 mille (CF2m)</span>, implanté à Saint-Gilles, 
                      propose des formations professionnelles en informatique pour demandeurs d’emploi. 
                      Il a pour mission de lutter contre toutes les formes d’exclusion sociale 
                      et culturelle et contre les discriminations dans l’accès à la formation et à l’emploi.<br />

                      Le CF2m est actif dans le secteur de l’insertion sociale et professionnelle pour demandeurs.<br /> 
                      <span style="display:block; text-align:right"><a class="liremore" href="<?php echo RACINE.'demploye/?menu=14' ?>">Pour plus d’infos... [+]</a> </span>
                   </p>
               </div>
           </div>
        </div>
        <?php
        include 'include/footer.php';
        ?>
