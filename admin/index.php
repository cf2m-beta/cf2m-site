<?php
    //index Admin
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
    
    $url = '';
    
    if(isset($_GET['menu'])){
        $url = mysqli_fetch_assoc(select('page', 'url', 'WHERE id ='.$_GET['menu']));
        $url = $url['url'];
    }
    
    $content = "affichage contenu par defaut Admin";
    
    // SUPRESSION ELEMENT
    if(isset($_GET['delete'])
        && isset($_SESSION['login'])
        && $_SESSION['permission'] >0
        && $_SESSION['permission'] <4) {
        
        delete('texte', 'WHERE id='.$_GET['delete']);
        //print 'deleted1';
    }else{
        //print 'nope';
    }
    
    // SUPRESSION FORMATION
    if(isset($_GET['delete_form'])
        && isset($_SESSION['login'])
        && (int)$_SESSION['permission'] >0
        && (int)$_SESSION['permission'] <4) {
        
        delete('page', 'WHERE id='.$_GET['delete_form']);
        
        //print 'deleted2';
    }else{
        //print 'nope';
        //var_dump($_SESSION);
    }
    
    // mise à jour
    if(isset($_POST['new_titre'])){
        
        $file_url = '';
        
        //image upload
        if(isset($_FILES['image']) && $_FILES['image']['name'] != ''){
            $file_name = $_FILES['image']['name'];
            $file_url = "../images/".$file_name;
            move_uploaded_file($_FILES['image']['tmp_name'], $file_url);
        } ///MANQUE LA SUPRESSION DE L'ANCIENNE IMAGE
        
        //recup données, préparation données
        $titre = htmlentities($_POST['new_titre'], ENT_QUOTES, "UTF-8");
        $texte = htmlentities($_POST['new_texte'], ENT_QUOTES, "UTF-8");
        $image = htmlentities($file_url, ENT_QUOTES, "UTF-8");
        $ordre = $_POST['new_ordre'];
        $id = $_POST['id'];
        
        if($image){
            
            $reponse = update('texte', "titre = '$titre', texte = '$texte', ordre= '$ordre', url_image='image'", "WHERE id=$id");
        }else{
            
            $reponse = update('texte', "titre = '$titre', texte = '$texte', ordre= '$ordre'", "WHERE id=$id");
        }
        
        print $reponse;
    }
    
    //insertion
    if(isset($_POST['titre'])){
        //ajout element
        if($_POST['type']=="element"){
            $file_url = '';
            $ordre = 99;
            $page_id = $_GET['edit'];
            $classe = $url.'-element';

            //image upload
            if($_FILES['image']['name'] != ''){
                $file_name = $_FILES['image']['name'];
                $file_url = "../images/".$file_name;
                move_uploaded_file($_FILES['image']['tmp_name'], $file_url);
            }
            //recup données, préparation données
            $titre = htmlentities($_POST['titre'], ENT_QUOTES, "UTF-8");
            $texte = htmlentities($_POST['texte'], ENT_QUOTES, "UTF-8");
            $image = htmlentities($file_url, ENT_QUOTES, "UTF-8");


            $select_ordre = select('texte', 'MAX(ordre) as ordre', 'WHERE page_id = '.$page_id);
            while ($row = mysqli_fetch_assoc($select_ordre)){
                $ordre=$row['ordre'] +1;
            }

            //insertion BD --- A FAIRE AFFICHAGE REPONSE
            print $insert = insert('texte',
                            'element, classe, titre, texte, url_image, ordre, page_id, url_group',
                            "'div', '$classe', '$titre', '$texte', '$image', $ordre, $page_id, '$url'");
            $return = $insert;
            //ajout page (dans formations)
        }else {
            /*
             * 1- ajout dans page
             * 2- créer une url pour page
             * 3- site demploye
             * 4- parent 1
             * 5- ordre max (page)
             * ---------------
             * 6- ajout d'un 1er element(texte) avec url_group = form  
             * 7- + titre venant du formulaire 
             * 8- + texte //
             * 9- + image // 
             * 10- ordre 1  
             * 11- page_id - lien avec table page
             */
            
            $file_url = '';
            $ordre = 99;
            $page_id = 99;
            
            $classe = $url.'-element';
            
            //image upload
            if($_FILES['image']['name'] != ''){
                $file_name = $_FILES['image']['name'];
                $file_url = "../images/".$file_name;
                move_uploaded_file($_FILES['image']['tmp_name'], $file_url);
            }
            
            //recup data
            $titre = htmlentities($_POST['titre'], ENT_QUOTES, "UTF-8");
            $texte = htmlentities($_POST['texte'], ENT_QUOTES, "UTF-8");
            $image = htmlentities($file_url, ENT_QUOTES, "UTF-8");
            //transformation du titre en url
            $url = title_to_url($_POST['titre']);
            print $url;
            
            //5
            
            $select_ordre = select('page', 'MAX(ordre) as ordre', 'WHERE parent =1');
            while ($row = mysqli_fetch_assoc($select_ordre)){
                $ordre=$row['ordre'] +1;
            }
            
            //1
            print $insert = insert('page', 
                                    'titre, url, site, ordre, parent, droit', 
                                    "'$titre', '$url', 'demploye', $ordre, 1, 0");
            $return = $insert;
            
            //11
            $select_page_id = select('page', 'id', "WHERE url='$url'");
            while ($row = mysqli_fetch_assoc($select_page_id)){
                $page_id=$row['id'];
            }
            
            //6
            print $insert2 = insert('texte',
                            'element, classe, titre, texte, url_image, ordre, page_id, url_group',
                            "'div', '$classe', '$titre', '$texte', '$image', 1, $page_id, 'form'");
            $return .= $insert2;
        }
    }
    
    if(isset($_SESSION['login'])){
        
        if(!isset($_GET['menu'])){
            $content = '<h1 class="title-cata">Administration</h1>';
            include_once 'controleur/index.php';
        }else{
            $content = '<h1 class="title-cata">Administration</h1>'; 
            
            if($url =='pagesd' || $url =='pagese'){
                //affichage pages stagiaire et employeur
                
            }
            else{
                //si le formulaire des formations a été envoyé
                if(isset($_GET['edit'])){
                    print $url;
                    //affichage formulaire d'insertion, d'un element pour une formation ciblée (3)
                    $content .= form_insert("Ajout d'un élement dans la formation choisie", 'element');
                    $content .= '<hr class="separation_admin">';

                    $page_id_locale = $_GET['edit'];
                    $select = select('texte', '*', "WHERE page_id =$page_id_locale ORDER BY ordre ASC");
                    $content .= admin($select);
                    
                }else{
                    foreach($pages AS $value){

                        if($value['id'] == $_GET['menu']){
                            //pour la page des formations 
                            if($_GET['menu']==ID_FORMATIONS_ADMIN && !isset($_POST['form'])){
                                print $url;
                                //ajout d'formulaire d'insertion de formations(1)
                                $content .= form_insert("Ajout d'une formation", 'page');
                                $content .= '<hr class="separation_admin">';
                                
                                //ajout formulaire de selection de formation à modifier
                                $content .= liste_formations();
                            }//pour les autres pages
                            else{
                                //affichage formulaire d'insertion (2)
                                $content .= form_insert("Ajout d'un élement dans la page", 'element');
                                $content .= '<hr class="separation_admin">';

                                $select = select('texte', '*', "WHERE url_group ='$url' ORDER BY ordre ASC");
                                $content .= admin($select);
                            }
                        }
                    }
                }
                
            }
            
            include_once 'controleur/index.php';   
        }
    
    }else{
        $content .= 'Vous devez vous identifier.';
    }