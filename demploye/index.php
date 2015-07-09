<?php
    //index D.Emploi
    include_once '../include/config.php';
    include_once '../modele/fonctions-db.php';
    include_once '../include/fonctions.php';
    session_start();
    $array_dirname = explode(DIRECTORY_SEPARATOR, dirname(__FILE__));
    $dossier_parent = array_pop($array_dirname);
    
    $pages = array();
    $pages_db = select('page', '*', 'ORDER BY ordre ASC');
    $i=0;
    while($une_page= mysqli_fetch_assoc($pages_db)){
        $pages[$i]=$une_page;
        $i++;
    }
    
    $content = "affichage contenu par defaut Demandeur d'emploi";
    
    $editable = isset($_SESSION['login']) && isset($_GET['admin']) ? (($_SESSION['permission'] == 1 && $_SESSION['permission'] == $_GET['admin']) || ($_SESSION['permission']== 2 && $_SESSION['permission'] == $_GET['admin'])) ? ' editable'
                                                                                                      : '' 
                                          : '';
            
    if(!isset($_GET['menu'])){
        //!!!!!!!!!!!!!!!!!!!!! affichage page id 1 (formation)    
        $content = '<h1 class="title-cata">CATALOGUE DES FORMATIONS</h1>';
        //pour l'affichage contenu html venant de la BD
        //AJOUTER HTML DECODE
        $mysqli_result_texte = select('texte t',
                                    'p.id, t.element, t.classe, t.titre, t.contenu',
                                    "INNER JOIN page p ON t.titre = p.titre
                                     WHERE t.page_id = 1
                                     ORDER BY t.ordre");
        if(!is_string($mysqli_result_texte)){
            while($un_texte=  mysqli_fetch_assoc($mysqli_result_texte)){
                $content.= '<div class="element_global"><'.$un_texte['element'].' class="'.$un_texte['classe'].$editable.'">';
                $content.= $un_texte['titre'] != '' ? '<a href="?menu='.$un_texte['id'].'"></a><h2><a href="?menu='.$un_texte['id'].'">'.$un_texte['titre'].'</a></h2>' :'';
                $content.= '<p>'.$un_texte['contenu'].'</p>';
                $content.= '<span><a class="liremore" href="?menu='.$un_texte['id'].'">Pour plus ici... [+]</a> </span>';
                $content.= '</'.$un_texte['element'].'></div>';
            }
        }
        include_once 'controleur/index.php';
    }else{
        foreach($pages AS $value){
            if($_GET['menu']===$value['id']){
                $content =($_GET['menu']==1)? '<h1 class="title-cata">CATALOGUE DES FORMATIONS</h1>':'';
                //pour l'affichage contenu html venant de la BD
                //AJOUTER HTML DECODE
                $mysqli_result_texte = select('texte t',
                                            'p.id, t.element, t.classe, t.titre, t.contenu',
                                            "INNER JOIN page p ON t.titre = p.titre
                                            WHERE t.page_id = ".$value['id']."
                                            ORDER BY t.ordre");
                if(!is_string($mysqli_result_texte)){
                    while($un_texte=  mysqli_fetch_assoc($mysqli_result_texte)){
                        $content.= '<div class="element_global"><'.$un_texte['element'].' class="'.$un_texte['classe'].$editable.'">';
                        $content.= $un_texte['titre'] != '' ? '<a href="?menu='.$un_texte['id'].'"></a><h2><a href="?menu='.$un_texte['id'].'">'.$un_texte['titre'].'</a></h2>' :'';
                        $content.= '<p>'.$un_texte['contenu'].'</p>';
                        $content.= '<span><a class="liremore" href="?menu='.$un_texte['id'].'">Pour plus ici... [+]</a> </span>';
                        $content.= '</'.$un_texte['element'].'></div>';
                    }
                }
                include 'controleur/index.php';
            }else{
                $content = 'affichage contenu par defaut Demmandeur d\'emploi<br> FAIL LOAD PAGE 2';
            }
        }
        include_once 'controleur/index.php';
    }
