<?php 
//|----------------------------------------------------|
//|Class to handle the mysqli connections              |
//|----------------------------------------------------|

class mysql_connection {
    
    var $mysqli;    
    var $result;
    var $affected_rows;
    var $empty_result;
    var $error_result;
    var $last_proc;
    
    function mysql_connection($address, $user, $pw, $db) {
        $this->mysqli = @new mysqli($address, $user, $pw, $db);
        if (mysqli_connect_errno()) {
            die ('Couldn\'t establish connection to db:'.mysqli_connect_error().'('.mysqli_connect_errno().')');
        }
    }
    
    function run($proc) {
        // test if there are still results to kill
        if (get_class($this->result) == 'mysqli_result') 
            $this->close();
        
        // run the proc
        $this->result = $this->mysqli->query('CALL '.$proc);
        $this->last_proc = $proc;
        
        // set variables to determine what happened
        if ($this->mysqli->affected_rows == -1) {
            $this->error_result = true; 
            $this->empty_result = true;    
            $this->affected_rows = 0;
        }             
        elseif ($this->mysqli->affected_rows == 0) {
            $this->error_result = false;
            $this->empty_result = true; 
            $this->affected_rows = 0;               
        }            
        else {
            $this->error_result = false;
            $this->empty_result = false; 
            $this->affected_rows = $this->mysqli->affected_rows;  
        }             
    }
    
    function close() {
        $this->result->close();
        $this->mysqli->next_result();
    }
    
    function get_result_array() { 
        if ($this->error_result)
            die ('mysql.connection.error: previous call of \''.$this->last_proc.'\' returned an error, cannot fetch');
     
        $all = array();  
        while ($row = $this->result->fetch_assoc()) 
            $all[] = $row;           
        return $all;
    }
    
    function get_result_row() {
        if ($this->error_result)
            die ('mysql.connection.error: previous call of \''.$this->last_proc.'\' returned an error, cannot fetch');
        if ($this->empty_result)
            return false;
        return $this->result->fetch_assoc();       
    }
}

?>