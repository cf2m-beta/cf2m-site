<?php
    $content= "affichage contenu par defaut Demmandeur d'emploi";
    if(!isset($_GET['menu'])){
        include 'controleur/index.php';
    }else{
        $menu = ['formation','info','media', 'plan', 'contact'];
        if(in_array($_GET['menu'], $menu)){
            include 'controleur/'.$_GET['menu'].'.php';
        }else 
            include 'controleur/index.php';
    }
        
