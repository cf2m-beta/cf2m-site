<?php
    //index D.Emploi
    include_once '../include/config.php';
    include_once '../modele/fonctions-db.php';
    include_once '../include/fonctions.php';
    
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    setcookie('dossier_parent', array_pop($array_dirname));
    
    $pages = array();
    $pages_db = select('page', '*', 'ORDER BY ordre ASC');
    $i=0;
    while($une_page= mysqli_fetch_assoc($pages_db)){
        $pages[$i]=$une_page;
        $i++;
    }
    
    $content= "affichage contenu par defaut Demandeur d'emploi";
    
    if(!isset($_GET['menu'])){
        //!!!!!!!!!!!!!!!!!!!!! affichage page id 1 (formation)    
        $content = '<h1 class="title-cata">CATALOGUE DES FORMATIONS</h1>';
        //pour l'affichage contenu html venant de la BD
        //AJOUTER HTML DECODE
        $mysqli_result_texte = select('texte', '*', "WHERE page_id=1");
        if(!is_string($mysqli_result_texte)){
            while($un_texte=  mysqli_fetch_assoc($mysqli_result_texte)){
                $content.= '<'.$un_texte['element'].' class="'.$un_texte['classe'].'">';
                $content.= $un_texte['contenu'];
                $content.= '</'.$un_texte['element'].'>';
            }
        }
        include_once 'controleur/index.php';
    }else{
        
        foreach($pages AS $value){
            if($_GET['menu']===$value['id']){
                $content =($_GET['menu']==1)? '<h1 class="title-cata">CATALOGUE DES FORMATIONS</h1>':'';
                //pour l'affichage contenu html venant de la BD
                //AJOUTER HTML DECODE
                $mysqli_result_texte = select('texte', '*', "WHERE page_id='".$value['id']."'");
                if(!is_string($mysqli_result_texte)){
                    while($un_texte=  mysqli_fetch_assoc($mysqli_result_texte)){
                        $content.= '<'.$un_texte['element'].' class="'.$un_texte['classe'].'">';
                        $content.= $un_texte['contenu'];
                        $content.= '</'.$un_texte['element'].'>';
                    }
                }
                include 'controleur/index.php';
            }else{
                $content = 'affichage contenu par defaut Demmandeur d\'emploi<br> FAIL LOAD PAGE 2';
            }
        }
        include_once 'controleur/index.php';
    }