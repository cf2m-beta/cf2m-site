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
                    $html .= "<li><a href='?menu=".$noeud['id']."'>" . $noeud['titre']."</a>";
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