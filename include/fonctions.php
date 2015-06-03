<?php
    function pages($dossier_parent, $db_parent){
        if($db_parent || is_numeric($db_parent))
            $pages = select('page', '*', "WHERE site='$dossier_parent' AND parent = '$db_parent'");
        else
            $pages = select('page', '*', "WHERE site='$dossier_parent'");
        
        if(get_class($pages) == 'mysqli_result'){
            if(mysqli_num_rows($pages)){
                return $pages;
            }else{
                return "Aucune page.";
            }
        }else{
            return 'FAIL : '.$pages;
        }
    }
