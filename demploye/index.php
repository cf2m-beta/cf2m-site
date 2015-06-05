<?php
    //index D.Emploi
    include_once '../include/config.php';
    include_once '../modele/fonctions-db.php';
    include_once '../include/fonctions.php';
    /*
        $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
        $dossier_parent = array_pop($array_dirname);
    */
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
        include_once 'controleur/index.php';
    }else{
        foreach($pages AS $value){
            if($_GET['menu']===$value['id']){
                $content = 'affichage contenu par defaut de : '.$value['titre'];
                //pour l'affichage contenu html venant de la BD
                //AJOUTER HTML DECODE
                $mysqli_result_texte = select('texte', '*', "WHERE page_id='".$value['id']."'");
                if(!is_string($mysqli_result_texte)){
                    while($un_texte=  mysqli_fetch_assoc($mysqli_result_texte)){
                        $content.= '<h2>'.$un_texte['titre'].'</h2>';
                        $content.= '<p>'.$un_texte['contenu'].'</p>';
                    }
                }
                include 'controleur/index.php';
            }else{
                $content = 'affichage contenu par defaut Demmandeur d\'emploi<br> FAIL LOAD PAGE 2';
            }
        }
        include_once 'controleur/index.php';
    }