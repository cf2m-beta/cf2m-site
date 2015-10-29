<?php
    $formation = select('page', 'id, titre', 'WHERE parent = 1');
    $news = select('texte', '*', 'WHERE page_id = 26 ORDER BY id DESC LIMIT 3');
    
    include_once ($dossier_parent=='cf2m-site')? 'vue/footer.php': '../vue/footer.php';