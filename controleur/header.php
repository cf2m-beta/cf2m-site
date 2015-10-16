<?php
    $retour_header_texte = '';
    if(isset($_POST['ndc_formateur'])){
        $ndc=  strip_tags(trim($_POST['ndc_formateur']));
        $pass=  strip_tags(trim($_POST['pass_formateur']));
        if(!is_string($formateur = select('formateur', '*', "WHERE nom_utilisateur='$ndc' AND mot_passe='$pass'"))){
            $formateur = mysqli_fetch_assoc($formateur);
            $retour_header_texte = 'Bienvenue '.$formateur['prenom'];
            $_SESSION['formateur']=true;
            foreach($formateur as $key => $value){
                $_SESSION["$key"]=$value;
            }
        }else{
            $retour_header_texte = 'Nom d\'utilisateur ou mot de passe incorrect.'.$formateur;
        }
    }
    
    if(!isset($pages)){
        $pages = array();
        $pages_db = select('page', '*', 'ORDER BY ordre ASC');
        $i=0;
        while($une_page= mysqli_fetch_assoc($pages_db)){
            $pages[$i]=$une_page;
            $i++;
        }
    }

    $menu_deroulant = $dossier_parent == 'demploye' ? afficher_menu(0, 0, $pages):
                      ($dossier_parent == 'employe' ? afficher_menu(3, 0, $pages):
                       ($dossier_parent == 'admin' ? afficher_menu(24, 0, $pages): ''));
    
    //baniere
    $banner="<div id='banner' class='slide'>
                	
            </div>";
    if(isset($_GET['menu'])){
        if($_GET['menu']!=1){
            foreach ($pages as $key => $value){
                if($_GET['menu']==$pages[$key]['id']){
                    $banner ='<div id="banner" class="'.$pages[$key]['url'].'"><h1>'.$pages[$key]['titre'].'</h1>';
                }
            }
            $banner.='</div>';
        }
    }
    
    //formulaire de connexion
    $connexion="";
    if(isset($_POST['user'])){
        $user =  strip_tags(trim($_POST['user']));
        $password = strip_tags(trim($_POST['password']));
        if(!is_string($db_user = select('formateur', '*', "WHERE nom_utilisateur = '$user' AND mot_passe = '$password'"))){
            while ($one_db_user=  mysqli_fetch_assoc($db_user)){
                $_SESSION=$one_db_user;    
            }
            $_SESSION['login']=true;
        }else{
            $connexion="Mot de passe ou Identifiant, incorrect.";
        }
    }
    
    include_once ($dossier_parent=='cf2m-site')? 'vue/header.php': '../vue/header.php';
