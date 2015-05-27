<?php
    //INDEX media
    
    if(!isset($_GET['menu2'])){
        $content= "affichage contenu par defaut MEDIA";
    }else{
        $menu2 = ['Galerie Image'=>'gal','Video'=>'vid'];
        $menu2_get=$_GET['menu2'];
        $menu2_titre = array_search ($menu2_get,$menu2);
        
        if(in_array($menu2_get, $menu2))
            $content= "affichage contenu page de la formation ".$menu2_titre;
    }
    
    include 'vue/index.php';
