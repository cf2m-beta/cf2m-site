<?php
    //INDEX formations
    
    if(!isset($_GET['menu2'])){
        $content= "affichage contenu par defaut FORMATIONS";
    }else{
        $menu2 = ['Web développeur'=>'wdev','Opérateur PAO / Infographiste'=>'pao','Animateur multimédia'=>'amult','Aide comptable'=>'acompt','Technicien reseaux'=>'res'];
        $menu2_get=$_GET['menu2'];
        $menu2_titre = array_search ($menu2_get,$menu2);
        
        if(in_array($menu2_get, $menu2))
            $content= "affichage contenu page de la formation ".$menu2_titre;
    }
    
    include 'vue/index.php';
