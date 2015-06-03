<div id="header">
    <img src="../images/new logo" alt="CF2M" title="CF2M">
    <a href="?menu=plan" >Plan du site</a>
    <a href="?menu=contact" >Contactez-nous</a>

    <form method="post" name="recherche">
        <input type="text">
        <input type="submit" value="Rechercher">
    </form>

    <ul id="menu_deroulant">
        
        <?php
            $menu_deroulant = "";
            foreach ($menu as $key => $value) {
                
                    $menu_deroulant .= "<li><a href='?menu=".$value['id']."'>".$value['titre']."</a>";
                
                if(!is_string($pages =  pages($dossier_parent, $value['id']))){
                    
                    $menu_deroulant .= "<ul>";
                    
                    while($result = mysqli_fetch_assoc($pages)){
                        if($result['parent']==$value['id']){
                            $menu_deroulant .= "<li><a href='?menu=".$value['id']."&menu2=".$result['id']."'>".$result['titre']."</a></li>";
                        }    
                    }
                    
                    $menu_deroulant .= "</ul>";
                    
                }else{//si pas d'enfant
                    print $pages;
                }
                
                $menu_deroulant .= "</li>";
            }
            print $menu_deroulant;
        ?>
       
    </ul>
    
</div>
