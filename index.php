<?php
include_once 'include/config.php';
include 'include/html-head.php';
session_start();
?>
<body>
    <div id="wrapper">
        
        <?php include_once 'controleur/header.php';?>
        
        <div id="content">
          <div class="middle-content">
              
               <aside class="demploi">
                 <article>
                    <h2>Vous êtes...</h2>
                    <a href="demploye/">Demandeur d'emploi</a>
                    Et vous cherchez une formation.
                 </article>
               </aside>
               
               <aside class="patron">
                <article>
                    <h2>Vous êtes...</h2>
                    <a href="employe/">Employeur</a>
                    Et vous recherchez des personnes <br />
                    qualifiées pour un stage.
                 </article>
               </aside>
               <div class="clear"></div>
               <div class="descript">
                   <p>
                      <strong>FC2M</strong>: Duis at rhoncus nisl. Donec sit amet risus quam. Phasellus neque nunc, consectetur vitae felis vel, 
                      dignissim vehicula quam. Donec ut varius odio. Etiam pretium tortor dui, id imperdiet mi sodales id. 
                      Duis semper dignissim facilisis. Curabitur nec eros laoreet, aliquet mi in, sollicitudin felis.<br /> 
                      <span><a class="liremore" href="">Pour plus ici... [+]</a> </span>
                   </p>
               </div>
           </div>
        </div>
        <?php
        include 'include/footer.php';
        ?>
