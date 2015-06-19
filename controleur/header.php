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
    include_once ($_COOKIE['dossier_parent']=='cf2m-site')? '/vue/header.php': '../vue/header.php';
