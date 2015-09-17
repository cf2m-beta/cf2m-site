<?php
    //variable de conexion base de données
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname="cf2m";

    $db = mysqli_connect($servername, $username, $password, $dbname);
        if (mysqli_connect_errno()) 
            print "Failed to connect to MySQL: " . mysqli_connect_error();
    
    mysqli_set_charset($db, "utf8");
        
    function select($table, $colonne, $condition){

        global $db;
        $query = "SELECT $colonne FROM $table $condition";
        //var_dump($query); //TEST QUERRY
        if(mysqli_query($db, $query)){
            if(mysqli_num_rows(mysqli_query($db, $query))>0){
                return mysqli_query($db, $query);
            }
            else{ 
                return "Aucun résultat.";
            }
        }
        else{
            return $query.  mysqli_error($db);
        }
    }

    function insert($table, $colonne, $condition){

        global $db;
        
        if($colonne)
            $query = "INSERT INTO $table ($colonne) VALUES ($condition)";
        else 
            $query = "INSERT INTO $table VALUES ($condition)";
        
        var_dump($query); //TEST QUERRY
        if(mysqli_query($db,$query))
            return "Ajout réussi!";
        else
            return "Ajout echoué.".  mysqli_error($db);
    }

    function update($table, $colonne_valeur, $condition){

        global $db;
        $query = "UPDATE $table SET $colonne_valeur $condition";
        //var_dump($query); //TEST QUERRY
        if(mysqli_query($db,$query)){
            return 'Mise à jour réussie';
        }else{
            return 'Mise à jour echouée :'.$query.mysqli_error($db);
        }
    }

    function delete($table, $condition){

        global $db;
        $query = "DELETE FROM $table $condition";
        //var_dump($query); //TEST QUERRY
        if(mysqli_query($db,$query)){
            return 'Suppression réussie';
        }else{
            return 'Suppression echouée';
        }
    }
    

