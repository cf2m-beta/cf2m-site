<?php
    //INDEX media

    if(!isset($_GET['menu2'])){
        $content= "affichage contenu par defaut MEDIAS";
    }else{
        $menu2_get=$_GET['menu2'];
        
        if(!is_string($pages = pages($dossier_parent, $_GET['menu']))){
            $menu2 = [];
            while($result = mysqli_fetch_assoc($pages)){
                $menu2[$result['id']] = $result;
            }
            var_dump($menu2);
        }else{
            print $pages;
        }
        if(array_key_exists($menu2_get, $menu2)){
            
            $menu2_titre = $menu2[$menu2_get]['titre'];
            $content= "affichage contenu page de la formation ".$menu2_titre;
        }
    }
    
    include 'vue/index.php';
