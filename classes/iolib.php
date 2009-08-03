<?php 
    function connect_to_db($address, $user, $pw, $db) {
        $db = @new mysqli($address, $user, $pw, $db);
        if (mysqli_connect_errno()) {
            die ('Konnte keine Verbindung zur Datenbank aufbauen: '.mysqli_connect_error().'('.mysqli_connect_errno().')');
        }
        return $db;
    }  
    
    function run_db_command($mysqli_conn, $command) {
        $result = $mysqli_conn->query($command);
        if (!$result) {
            die ('Etwas stimmte mit dem Query nicht: '.$mysqli_conn->error);
        }
        return $result;
    }
 ?>