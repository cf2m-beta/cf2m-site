<?php
    //index D.Emploi
    include_once '../include/config.php';
    include_once '../modele/fonctions-db.php';
    include_once '../include/fonctions.php';
    
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    $dossier_parent = array_pop($array_dirname);
    
    $pages = [];
    $pages_db = select('page', '*', 'ORDER BY ordre ASC');
    $i=0;
    while($une_page= mysqli_fetch_assoc($pages_db)){
        $pages[$i]=$une_page;
        $i++;
    }
    $menu_deroulant = afficher_menu(0, 0, $pages);
    
    $content= "affichage contenu par defaut Demmandeur d'emploi";
    
    if(!isset($_GET['menu'])){
        include 'controleur/index.php';
    }else{
        foreach($pages AS $value){
            if($_GET['menu']===$value['id']){
                $content= 'affichage contenu par defaut de : '.$value['titre'] ;
                include 'controleur/index.php';
            }else{
                $content = 'affichage contenu par defaut Demmandeur d\'emploi<br> FAIL LOAD PAGE 2';
            }
        }
        include 'controleur/index.php';
    }
    
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
