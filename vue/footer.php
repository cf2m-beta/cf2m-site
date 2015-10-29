       
        <footer>
            <div class="footer-top">
               <section class="adresse">
                  <h4>Nous Contacter</h4>
                  <address>
                      Avenue du Parc, 89<br />
                      1060 Bruxelles<br />
                      Belgique
                  </address>
                  <ul>
                     <li>02/539.03.60</li>
                     <li>
                         administration@cf2m.be<br />
                         info@cf2m.be
                     </li>
                  </ul>
                  
                  
               </section>
               
               <section>
                    <h4>Nos Formations</h4> 
                    <ul>
                        <?php
                    
                            while($une_formation=  mysqli_fetch_assoc($formation)){
                                $url = RACINE.'demploye/?menu='.$une_formation['id'];
                                print '<li><a href="'.$url.'">'.html_entity_decode($une_formation['titre']).'</a></li>';
                            }

                        ?>
                    </ul>
               </section>
               
               <section>
                    <h4>Dernières Nouvelles</h4>
                    <?php
                    
                        while($une_news=  mysqli_fetch_assoc($news)){
                            print '<p>'. html_entity_decode($une_news['texte']).'</p>';
                        }
                    
                    ?>
               </section>
                <div class="clear"></div>
            </div>
            
            <div class="partenaires">
                 <ul>
                     <li>
                         <a href="http://www.bruxellesformation.be/" target="_blank">
                         <img src="<?php print RACINE?>images/icones/bruxelles-formation.png" />
                         </a>
                     </li>
                     <li>
                         <a href="http://www.actiris.be/" target="_blank">
                         <img src="<?php print RACINE?>images/icones/actiris.png" />
                         </a>
                     </li>
                     <li>
                         <a href="https://www.loterie-nationale.be" target="_blank">
                         <img src="<?php print RACINE?>images/icones/loterie-nationale.png" />
                         </a>
                     </li>
                     <li>
                         <a href="http://www.plushaut.be/" target="_blank">
                         <img src="<?php print RACINE?>images/icones/fsc.png" />
                         </a>
                     </li>
                     <li>
                         <a href="http://be.brussels/" target="_blank">
                         <img src="<?php print RACINE?>images/icones/Region-bruxelles.png" />
                         </a>
                     </li>
                 </ul>
            </div>
            
            <div class="copy">
               <section>
                 <h4>&copy; <?php echo DATE("Y")?> | Centre de Formation 2 Mille </h4>
                 <img src="<?php print RACINE?>images/icones/logo-simple-footer-.png" alt="logo cf2m" />
               </section>
               <section>
                 <P>Suivez-nous sur</P>
                 <ul>
                    <li>
                        <a href="https://www.facebook.com/groups/35535997008/" target="_blank"></a><!--facebook-->
                    </li>
                    <li>
                        <a href="https://plus.google.com/b/105339441842557242953/105339441842557242953/posts" target="_blank"></a><!--google+-->
                    </li>
                    <li>
                        <a href="https://twitter.com/MikeCF2m" target="_blank"></a><!--twitter-->
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/grp/home?gid=6974153" target="_blank"></a><!--Linkedin-->
                    </li>
                    <!--<li><a href=""></a></li>
                    <li><a href=""></a></li>-->
                 </ul>
               </section>
            </div>
            <span class="made"> 
                Site réalisé par <a href="">Andrei Pastrama</a>,
                <a href="http://sallartiste.com" target="_blank">Eric Salla</a>, 
                <a href="">Romuald Baldy</a>
            </span>
        </footer>

        <script src="<?php print RACINE?>js/jquery-1.9.1.min.js"></script>
        <script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
        <script type="text/javascript">bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
        <script src="<?php print RACINE?>js/script.js"></script>
        
        </div>
    </body>
</html>

