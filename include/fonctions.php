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
        if(!is_string($select)){
            
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
            
        }else{
            $return .= $select;
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
    
    
    //http://www.deefuse.fr/blog/developpeur-php-tronquer-vos-textes-html-de-maniere-propre/
    
    function truncateHtml($text, $length = 100, $ending = '...', $exact = false, $considerHtml = true) {
    if ($considerHtml) {
        // if the plain text is shorter than the maximum length, return the whole text
        if (strlen(preg_replace('/<.*?>/', '', $text)) <= $length) {
            return $text;
        }
        // splits all html-tags to scanable lines
        preg_match_all('/(<.+?>)?([^<>]*)/s', $text, $lines, PREG_SET_ORDER);
        $total_length = strlen($ending);
        $open_tags = array();
        $truncate = '';
        foreach ($lines as $line_matchings) {
            // if there is any html-tag in this line, handle it and add it (uncounted) to the output
            if (!empty($line_matchings[1])) {
                // if it's an "empty element" with or without xhtml-conform closing slash
                if (preg_match('/^<(\s*.+?\/\s*|\s*(img|br|input|hr|area|base|basefont|col|frame|isindex|link|meta|param)(\s.+?)?)>$/is', $line_matchings[1])) {
                    // do nothing
                    // if tag is a closing tag
                } else if (preg_match('/^<\s*\/([^\s]+?)\s*>$/s', $line_matchings[1], $tag_matchings)) {
                    // delete tag from $open_tags list
                    $pos = array_search($tag_matchings[1], $open_tags);
                    if ($pos !== false) {
                        unset($open_tags[$pos]);
                    }
                    // if tag is an opening tag
                } else if (preg_match('/^<\s*([^\s>!]+).*?>$/s', $line_matchings[1], $tag_matchings)) {
                    // add tag to the beginning of $open_tags list
                    array_unshift($open_tags, strtolower($tag_matchings[1]));
                }
                // add html-tag to $truncate'd text
                $truncate .= $line_matchings[1];
            }
            // calculate the length of the plain text part of the line; handle entities as one character
            $content_length = strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', ' ', $line_matchings[2]));
            if ($total_length+$content_length> $length) {
                // the number of characters which are left
                $left = $length - $total_length;
                $entities_length = 0;
                // search for html entities
                if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', $line_matchings[2], $entities, PREG_OFFSET_CAPTURE)) {
                    // calculate the real length of all entities in the legal range
                    foreach ($entities[0] as $entity) {
                        if ($entity[1]+1-$entities_length <= $left) {
                            $left--;
                            $entities_length += strlen($entity[0]);
                        } else {
                            // no more characters left
                            break;
                        }
                    }
                }
                $truncate .= substr($line_matchings[2], 0, $left+$entities_length);
                // maximum lenght is reached, so get off the loop
                break;
            } else {
                $truncate .= $line_matchings[2];
                $total_length += $content_length;
            }
            // if the maximum length is reached, get off the loop
            if($total_length>= $length) {
                break;
            }
        }
    } else {
        if (strlen($text) <= $length) {
            return $text;
        } else {
            $truncate = substr($text, 0, $length - strlen($ending));
        }
    }
    // if the words shouldn't be cut in the middle...
    if (!$exact) {
        // ...search the last occurance of a space...
        $spacepos = strrpos($truncate, ' ');
        if (isset($spacepos)) {
            // ...and cut the text in this position
            $truncate = substr($truncate, 0, $spacepos);
        }
    }
    // add the defined ending to the text
    $truncate .= $ending;
    if($considerHtml) {
        // close all unclosed html-tags
        foreach ($open_tags as $tag) {
            $truncate .= '</' . $tag . '>';
        }
    }
    return $truncate;
}