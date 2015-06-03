<?php
    include_once '../include/config.php';
    include_once '../modele/fonctions-db.php';
    include_once '../include/fonctions.php';
    
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    $dossier_parent = array_pop($array_dirname);
    if(!is_string($pages = pages($dossier_parent, null))){
        //print_r($pages);
        $menu = [];
        while($result = mysqli_fetch_assoc($pages)){
            if($result['parent']==null){
                $menu[$result['id']] = $result;
            }
        }
        // TEST var_dump($menu);
    }else{
        print $pages;
    }
    
    $content= "affichage contenu par defaut Demmandeur d'emploi";
    
    if(!isset($_GET['menu'])){
        include 'controleur/index.php';
    }else{
        if(array_key_exists($_GET['menu'], $menu)){
            
            include 'controleur/'.$menu[$_GET['menu']]['url'].'.php';
        }else 
            include 'controleur/index.php';
    }
        
