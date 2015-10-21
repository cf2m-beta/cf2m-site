<?php
    
    function afficher_menu($parent, $niveau, $array) {
        
        $html = "";
        $niveau_precedent = 0;
        
        if (!$niveau && !$niveau_precedent) $html .= "\n<ul id ='menu-deroulant' class='menu'>\n";

        foreach ($array AS $noeud) {

                if ($parent == $noeud['parent']) {

                    if ($niveau_precedent < $niveau) $html .= "\n<ul>\n";
                    if($noeud['url']=='employe'){
                        $html .= "<li><a href='".RACINE.$noeud['url'].'/'."'>" . $noeud['titre']."</a>";
                    }else{
                        //if($noeud['droit']>0 && isset($_SESSION['permission']) && ($noeud['droit']==$_SESSION['permission']) || $_SESSION['permission']==1 ){
                            $html .=  "<li><a href='?menu=".$noeud['id']."'>" . $noeud['titre']."</a>";
                        //}else{
                           // $html = "";
                        //}
                    }
                    $niveau_precedent = $niveau;

                    $html .= afficher_menu($noeud['id'], ($niveau + 1), $array);

                }
        }
        
        if (($niveau_precedent == $niveau) && ($niveau_precedent != 0)) $html .= "</ul>\n</li>\n";
        else if ($niveau_precedent == $niveau) $html .= "</ul>\n";
        else $html .= "</li>\n";

        return $html;
    }
    
    function admin($select){
        $return ="";
        
        $return .= "<div class='all-admin-elements'>";
        while($element = mysqli_fetch_assoc($select)){
            $return .= "<div class='one-admin-element'>";
                $return .= "<form action='' method='post' enctype='multipart/form-data'>";
                    $return .= "<label for='new_titre'>Titre: </label><input id='new_ordre' name='new_titre' type='text' value='". html_entity_decode($element['titre'])."'>";
                    $return .= "<textarea name ='new_texte'>".nl2br(html_entity_decode($element['texte']))."</textarea>";
                    $return .= "<label for='new_image'>Lien image: </label><input id='new_image' type='file' name='new_image'>";
                    $return .= "<label for='new_ordre'>Ordre: </label><input id='new_ordre' name='new_ordre' type='number' value='".$element['ordre']."' required>";
                    $return .= "<input name='id' type='hidden' value='".$element['id']."'>";
                    $return .= "<input type='submit' value='Modifier'>";
                    $return .="<input type='button' class='delete' data-id='".$element['id']."' data-titre='".html_entity_decode($element['titre'])."' value='Supprimer' title='Supprimer définitivement ".html_entity_decode($element['titre'])."'>" ;          
                $return .= "</form>";
            $return .= "</div>";
        }
        $return .= "</div>";
        
        return $return;
    }
    
    function form_insert($titre, $type){
        $return = "";
        
        $return .= "<div class='form_insert'>";
            $return .= "<h2>$titre</h2>";
            $return .= "<form action='' method='post' enctype='multipart/form-data'>";
                    $return .= "<input type='hidden' name='type' value='$type'>";
                    $return .= "<input name='titre' type='text' placeholder='Titre' required>";
                    $return .= "<textarea name ='texte'></textarea>";
                    $return .= "<input type='file' name='image'>";
                    $return .= "<input type='submit' value='Inserer'>";
            $return .= "</form>";
        $return .= "</div>";
        
        return $return;
    }
    /*
    function form_insert_element($titre, $type, $id){
        
        $return = "";
        
        $return .= "<div class='form_insert'>";
            $return .= "<h2>$titre</h2>";
            $return .= "<form action='' method='post' enctype='multipart/form-data'>";
                    $return .= "<input type='hidden' name='id_page' value='$id'>";
                    $return .= "<input type='hidden' name='type' value='$type'>";
                    $return .= "<input name='titre' type='text' placeholder='Titre' required>";
                    $return .= "<textarea name ='texte'></textarea>";
                    $return .= "<input type='file' name='image'>";
                    $return .= "<input type='submit' value='Inserer'>";
            $return .= "</form>";
        $return .= "</div>";
        
        return $return;
        
    }
    */
    function liste_formations(){
        $return = "";
        
        $liste = select('texte', '*', "WHERE url_group='form' AND ordre=1 ORDER BY page_id ASC");
        
        $return .= "<div class='form_select_formation'><h2>Liste de Formations</h2><table>";
        
        while ($row = mysqli_fetch_assoc($liste)){
            
            $titre_page = select('page','titre', 'WHERE id='.$row['page_id']);
            $titre_page = mysqli_fetch_assoc($titre_page);
            $titre_page = html_entity_decode($titre_page['titre']);
            
            $return .= "<tr>";
            $return .= "<td>".$titre_page."</td><td><button class='edit' data-titre='".$titre_page."' data-id='".$row['page_id']."' name='Modifier'>Modifier</button></td>
                        <td><button class='delete_form' data-titre='".$titre_page."' data-id='".$row['page_id']."' name='Supprimer'>Supprimer</button></td>";
            $return .= "</tr>";
        }
        
        $return .= "</table></div>";
        
        return $return;
    }
    
    function title_to_url($str){
        
            $return = str_replace(' ','', strtolower($str));
            $return = str_replace("'",'', strtolower($return));
            $return = str_replace('"','', strtolower($return));
            $return = strtr($return,'àáâãäçèéêëìíîïñòóôõöùúûüýÿÀÁÂÃÄÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝ','aaaaaceeeeiiiinooooouuuuyyAAAAACEEEEIIIINOOOOOUUUUY');
        return $return;
    }