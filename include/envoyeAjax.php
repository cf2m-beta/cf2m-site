<?php

include_once '../modele/fonctions-db.php';
$reponse = '';
// traitement formulaire envoye AJAX
if(isset($_POST['value'])) {
    if($_POST['value'] !== '') {
        $value = $_POST['value'];
        $table = $_POST['table'];
        $colonne = $_POST['colonne'];
        $conddition = $_POST['condition'];
        $return = update("$table", "$colonne = '$value'", " id=$conddition");
        $reponse = 'Tentative update : '.$return.mysqli_error($db);
    } else {
        $reponse = 'Les champs sont vides';
    }
} else {
    $reponse = 'Tous les champs ne sont pas parvenus';
}

print $reponse;