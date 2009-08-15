<?php 
    // @todo all regex as define's
    
    /**
     * Checks if a game that is about to be inserted already exists
     * if not it is inserted
     *
     * @access public
     * @return true
     */

    function complete_add_game() {
        if (valid_request(array(isset($_POST['guid_id']), isset($_POST['name'])))) {
        
            global $db;
            global $smarty; 
            
            if (strlen($_POST['name']) > 50 || strlen($_POST['name']) < 3) {
                display_errors(301);
                return true;
            }                                               
                   
            $sql = "add_game('".$_POST['name']."', ".$_POST['guid_id'].")";                    
            $db->run($sql); 
            if ($db->error_result)
                display_errors(300);
            else {
                display_success("add_game");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }                                                                      
        }     
        return true;       
    }
    
    /**
     * Checks if a guid that is about to be inserted already exists
     * if not it is inserted
     *
     * @access public
     * @return true
     */

    function complete_add_guid() {    
        if (valid_request(array(isset($_POST['name'])))) {
                
            global $db;
            global $smarty;
            
            if (strlen($_POST['name']) > 20 || strlen($_POST['name']) < 3) {
                display_errors(401);
                return true;
            }
            
            $sql = "add_guid('".$_POST['name']."')";
            $db->run($sql);
    
            if ($db->error_result)
                display_errors(400);
            else {
                display_success("add_guid");                              
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
        return true;
    }
    
    /**
     * Checks if a league that is about to be inserted already exists
     * if not it is inserted
     *
     * @access public
     * @return true
     */

    function complete_add_league() {
    
        if (valid_request(array(isset($_POST['game_id']), isset($_POST['name'])))) {
                    
            global $smarty;
            global $db;
            
            if (strlen($_POST['name']) > 100 || strlen($_POST['name']) < 3) {
                display_errors(351);
                return true;
            }
                
            $sql = "add_league('".$_POST['name']."', ".$_POST['game_id'].")";
            $db->run($sql);    
            if (!$db->affected_rows)
                display_errors(350);
            else {
                display_success("add_league");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    
    /**
     * Inserts a map in the general map pool. If this map is already in, db raises an error due to an unique key
     *
     * @access public
     * @return true
     */

    function complete_add_map() {

        if (valid_request(array(isset($_POST['map_name'])))) {

            global $smarty;
            global $db;

            if (strlen($_POST['map_name']) > 50 || strlen($_POST['map_name']) < 1) {
                display_errors(600);
                return true;
            }

            $sql = "add_map('".$_POST['map_name']."')";
            $db->run($sql);
            if ($db->error_result)
                display_errors(601);
            else {
                display_success("add_map");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    
    /**
     * Inserts a map in the league map pool. If this map is already in, db raises an error due to an unique key
     *
     * @access public
     * @return true
     */

    function complete_add_map_to_league() {

        if (valid_request(array(isset($_POST['map_id']), isset($_GET['league_id'])))) {

            global $smarty;
            global $db;

            $sql = "add_map_to_league(".$_POST['map_id'].", ".$_GET['league_id'].")";
            $db->run($sql);
            if ($db->error_result)
                display_errors(602);
            else {
                display_success("add_map_to_league");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    
    /**
     * Inserts a news if everything went right
     *
     * @access public
     * @return true
     */

    function complete_add_news() {
        if (valid_request(array(isset($_POST['title']), isset($_POST['text'])))) {

            global $smarty;
            global $db;
            
            if (strlen($_POST['title']) > 150 || strlen($_POST['title']) < 3) {
                display_errors(800);
                return true;
            }

            $sql = "add_news('".$_POST['title']."', 
                             '".$_POST['text']."', 
                              ".$_SESSION['user_id'].")";
            $db->run($sql);
            if ($db->error_result)
                display_errors(1);
            else {
                display_success("add_news");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    /**
     * Checks an add season request and adds the season, division and matches if everything is alright
     *
     * @access public
     * @return true
     */

    // @todo can be heavily improved by only using one stored proc
    // @todo when db error occures -> rollback
    function complete_add_season() {
        if (valid_request(array(isset($_GET['league_id']),
                                isset($_POST['name']),
                                isset($_POST['start']), 
                                isset($_POST['schedule']), 
                                isset($_POST['max_teams_div'])))) {

            global $smarty;
            global $db; 
            
            if (!preg_match(DATE_REGEX, $_POST['start'])) {
                display_errors(554);
                return true;
            }
            
            if (strlen($_POST['name']) > 100 || strlen($_POST['name']) < 1) {
                display_errors(552);
                return true;
            }
            
            if ($_POST['schedule'] > 255 || $_POST['schedule'] < 1) {
                display_errors(553);
                return true;
            }            

            $new_div = array();
            foreach ($_POST as $team => $div) {
                //did we hit a team id?
                if (strpos($team, 'team') === 0) 
                    $new_div[$div][] = substr($team, 4);
            }
                        
            // test for valid conditions
            foreach ($new_div as $div => $teams) {
                if ($div < 1) {
                    display_errors(551);
                    return true;
                }
                if (count($teams) > $_POST['max_teams_div']) {
                    display_errors(550);
                    return true;                    
                }
                if (count($teams) < 2) {
                    display_errors(555);
                    return true;
                }
                $div_nums[] = $div;
            }
            
            //creating the season and divisions
            $sql = "add_season_with_divisions(".$_GET['league_id'].", 
                                              '".$_POST['name']."',
                                              ".$_POST['schedule'].", 
                                              '".implode(',', $div_nums)."')";
            $db->run($sql);
            
            // creating the matches
            require_once('classes/class.roundrobin.php');
            $rr = new roundrobin();
            $rr->free_ticket = false; 
            
            //iterating over the divisions           
            foreach ($new_div as $div => $teams) {
                // getting the division_id of the related division that was just inserted
                $sql = "get_div_id(".$_GET['league_id'].",
                                   ".$div.")";
                $db->run($sql);
                $division_id = $db->get_result_row();
                
                // putting the teams in the new divisions
                $sql = "add_teams_div(".$division_id['division_id'].", 
                                      '".implode(',', $teams)."')";
                $db->run($sql);
                
                //deleting all signed up teams for this league
                $sql = "delete_signed_up_teams(".$_GET['league_id'].")";
                $db->run($sql);
                
                // inserting the matches of this division one by one...
                shuffle($teams);
                $rr->pass_teams($teams);
                $rr->create_matches();
                
                if ($rr->finished) {
                    $matchday = 1;
                    while ($rr->next_matchday()) {
                        while ($match = $rr->next_match()) {                            
                            $sql = "add_match (".$division_id['division_id'].", 
                                               ".$match[0].", 
                                               ".$match[1].",
                                               ".$matchday.", 
                                               '".$_POST['start']."', 
                                               ".$_POST['schedule'].")";
                            $db->run($sql);
                        }
                        $matchday++;
                    }
                }
            }
            unset($rr);
            display_success("add_season");
            $smarty->assign('content', $smarty->fetch("succes.tpl"));                
        }
    }
    
    
    /**
     * Perform an add user guid action
     *
     * @access public
     * @return true
     */

    function complete_add_user_guid() {
        if (valid_request(array(isset($_POST['guid_id']), isset($_POST['guid'])))) {

            global $smarty;
            global $db;

            if (strlen($_POST['guid']) < 4) {
                display_errors(500);
                return true;
            }

            $sql = "add_user_guid(".$_SESSION['user_id'].", 
                                  ".$_POST['guid_id'].", 
                                  '".$_POST['guid']."')";
            $db->run($sql);
            if ($db->error_result)
                display_errors(1);
            else {
                display_success("add_user_guid");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    /**
     * Confirms a match result which basicly means that the match status wil be increased from 1 to 2
     *
     * @access public
     * @return true
     */
    
    function complete_confirm_match_result() {
        if (valid_request(array(isset($_GET['match_id'])))) {
            
            global $smarty;
            global $db; 
            
            $sql = "get_match_status(".$_GET['match_id'].")";
            $db->run($sql);
            if ($db->error_result) {
                display_errors(1);
                return true;
            }
            else {
                $status = $db->get_result_row();
                if ($status['status'] != 1) {
                    display_errors(702);
                    return true;
                }
            } 
            
            $sql = "confirm_match_result(".$_GET['match_id'].")";
            $db->run($sql);
            
            if ($db->error_result)
                display_errors(1);
            else {
                display_success("confirm_match_result", $_GET['match_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
            
        }      
        
      
    }

    
    /**
     * Checks a create_team request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true
     */

    function complete_create_team() {
        if (valid_request(array(isset($_POST['name'])))) {
                    
            global $smarty;
            global $db;       
            
            //test if name fits into name conventions
            if (!preg_match('/^[a-zA-Z0-9-. ]+$/', $_POST['name'])){
                display_errors(200);       
            }
            elseif (strlen($_POST['name']) > 50) {
                display_errors(201);
            } 
            else {                           
                //insert team 
                //create password
                require_once('classes/class.password.php');
                $password = new password(8);
                $password->uppercase = false;
                
                $sql = "add_team('".$_POST['name']."', '".$password->generate()."', ".$_SESSION['user_id'].");";
                $db->run($sql);
                               
                if ($db->error_result)
                    display_errors(203);
                else {             
                    $row = $db->get_result_row();      
                    display_success("create_team", $row['team_id']);
                    $smarty->assign('content', $smarty->fetch("succes.tpl"));                        
                }
            }
        }
        return true;       
    }
    
    
     /**
     * Checks a edit_game request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true
     */
     
     function complete_edit_game() {
        if (valid_request(array(isset($_POST['name']), isset($_POST['description']), isset($_POST['guid_id']), isset($_GET['game_id'])))) {
            
            global $smarty;
            global $db;
            
            if (strlen($_POST['name']) > 50 || strlen($_POST['name']) < 3) {
                display_errors(301);
                return true;
            }
            
            $sql = "edit_game('".$_POST['name']."',
                              '".$_POST['description']."',
                               ".$_POST['guid_id'].", 
                               ".$_GET['game_id'].")";
            $db->run($sql);
            
            if ($db->error_result)
                display_errors(300);
            else {
                display_success("edit_game", $_GET['game_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }           
        }
        return true;   
     }
     
    /**
     * Checks a edit_guid request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true
     */

     function complete_edit_guid() {
        if (valid_request(array(isset($_POST['name']), isset($_GET['guid_id'])))) {

            global $smarty;
            global $db;

            if (strlen($_POST['name']) > 20 || strlen($_POST['name']) <3 ) {
                display_errors(401);
                return true;
            }

            $sql = "edit_guid('".$_POST['name']."', ".$_GET['guid_id'].")";
            $db->run($sql);
            if ($db->error_result)
                display_errors(400);
            else {
                display_success("edit_guid", $_GET['guid_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
        return true;
     }
     
     /**
     * Checks a edit_league request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true
     */
     
     
     function complete_edit_league() {
        if (valid_request(array(isset($_GET['league_id']), 
                                isset($_POST['game_id']),
                                isset($_POST['map_count']),
                                isset($_POST['name']), 
                                isset($_POST['description']), 
                                isset($_POST['max_teams_div']), 
                                isset($_POST['min_players_team'])))) {
                                
            global $smarty;
            global $db; 
  
            if (strlen($_POST['name']) > 100 || strlen($_POST['name']) < 3) {
                $errors[] = 351;                
            } 
            if (strlen($_POST['max_teams_div']) > 65535 || strlen($_POST['max_teams_div']) < 1) {
                $errors[] = 352;
            } 
            if (strlen($_POST['min_players_team']) > 255 || strlen($_POST['min_players_team']) < 1) {
                $errors[] = 353;
            }
            if ($_POST['map_count'] > 2 || $_POST['map_count'] < 1) {
                $errors[] = 355;
            }            
            
            if (isset($errors)) {
                display_errors($errors);
                return true;
            }
            // sign in checkbox checked?
            if (isset($_POST['in_sign_up']))
                $in_sign_up = 1;
            else
                $in_sign_up = 0;
            
            $sql = "edit_league(".$_GET['league_id'].",
                                ".$_POST['game_id'].",
                                '".$_POST['name']."',
                                '".$_POST['description']."',
                                 ".$_POST['map_count'].",
                                 ".$_POST['max_teams_div'].",
                                 ".$_POST['min_players_team'].", 
                                 ".$in_sign_up.")";
            $db->run($sql);
            if (!$db->error_result) {
                display_success("edit_league", $_GET['league_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));            
            }
            else {
                display_errors(354);
                return true;
            }                                         
        }    
        return true;
     }
     
     /**
     * Checks a edit_match_result request for invalid inputs if the matchn is in state 0
     *
     * 0 -> no match activity so far
     * 1 -> the match result was entered by one party
     * 2 -> the match result was cofirmed
     * 3 -> the match is in protest state
     *
     * @access public
     * @return true
     */
     
     function complete_edit_match_result() {
        if (valid_request(array(isset($_GET['match_id']),
                                isset($_POST['result_1_1']),
                                isset($_POST['result_1_2']),
                                isset($_POST['result_2_1']),
                                isset($_POST['result_2_2'])))) {
            
            global $smarty;
            global $db;
            
            $sql = "get_match_status(".$_GET['match_id'].")";            
            $db->run($sql);
            if ($db->error_result) {
                display_errors(1);
                return true;
            }
            else {
                $status = $db->get_result_row();
                if ($status['status'] != 0) {
                    display_errors(701);
                    return true;    
                }     
            } 
                        
            $regex = '/^\d+$/';
            if (!preg_match($regex, $_POST['result_1_1']) ||
                !preg_match($regex, $_POST['result_1_2']) ||
                !preg_match($regex, $_POST['result_2_1']) ||
                !preg_match($regex, $_POST['result_2_2'])) {
                
                display_errors(700);
                return true;    
            }
            
            $sql = "edit_match_result(".$_GET['match_id'].", 
                                      ".$_POST['result_1_1'].", 
                                      ".$_POST['result_1_2'].",
                                      ".$_POST['result_2_1'].",
                                      ".$_POST['result_2_2'].")";
            $db->run($sql);
            if ($db->error_result) {
                display_errors(1);
                return true;
            }
            else {
                display_success("edit_match_result", $_GET['match_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));    
            }
        }
     }
     
     /**
     * Checks a edit_match_settlement request for invalid inputs and performs all
     * actions if no (permission) error occurs
     *
     * @access public
     * @return true
     */
     
     function complete_edit_match_settlement() {
        if (valid_request(array(isset($_GET['match_id']),
                                isset($_POST['day']),
                                isset($_POST['month']),
                                isset($_POST['year']),
                                isset($_POST['hour']),
                                isset($_POST['minute']),
                                isset($_POST['map_id_1']),
                                isset($_POST['map_id_2']),
                                isset($_POST['chat'])))) {
                                
            global $smarty;
            global $db; 
            
            if (strlen($_POST['chat']) > 100) {
                display_errors(650);
                return true;
            }                    
            
            //checking for which map the user has rights; only setting this map
            $sql = "get_match_teams(".$_GET['match_id'].")";
            $db->run($sql);
            if ($db->empty_result) {
                display_errors(1);
                return true;
            }            
            $match_teams = $db->get_result_row();
            
            //getting current settlement state
            $sql = "get_match_settlement_info(".$_GET['match_id'].")";
            $db->run($sql);
            if ($db->empty_result) {
                display_errors(1);
                return true;
            }
            $match_settlement_info = $db->get_result_row();
            
            $sql = "edit_match_settlement(".$_GET['match_id'].", ";
            
            //the right team id is in the $_GET array due to the permission checks
            if ($_SESSION['admin'] || $_SESSION['head_admin']) {
                $sql .= $_POST['map_id_1'].", ".$_POST['map_id_2'].", ";    
            } 
            else {
                if ($_GET['team_id'] == $match_teams['team_id_1']) {
                    $sql .= $_POST['map_id_1'].", ".$match_settlement_info['map_id_2'].", ";
                }
                elseif ($_GET['team_id'] == $match_teams['team_id_2']) {
                    $sql .= $match_settlement_info['map_id_1'].", ".$_POST['map_id_2'].", ";
                }
                else {
                    display_errors(1);
                    return true;
                }    
            }           
            $date = date('Y-m-d H:i:s', mktime($_POST['hour'], $_POST['minute'],0 , $_POST['month'], $_POST['day'], $_POST['year']));
            $sql.= "'".$date."')";
            $db->run($sql);
            if ($db->error_result) 
                display_errors(1);
            else {                
                // logging the actions
                
                // the users name
                $sql = "get_user_nick(".$_SESSION['user_id'].")";
                $db->run($sql);
                $result = $db->get_result_row();
                $user_nick = $result['nick'];
                
                //the name of the related team
                if ($_SESSION['admin'] || $_SESSION['head_admin']) { 
                    $team_name = "Admin staff";
                } 
                else {
                    $sql = "get_team_name(".$_GET['team_id'].")";
                    $db->run($sql);
                    $result = $db->get_result_row();
                    $team_name = $result['name'];    
                }
                
                if ($date != $match_settlement_info['date']) {                    
                    $sql = "add_settlement_log(".$_GET['match_id'].", '".$user_nick." from ".$team_name." changed the date to ".$date.".')";
                    $db->run($sql);
                }
                
                // maps changed?                
                if (($_POST['map_id_1'] != $match_settlement_info['map_id_1']) && ($_SESSION['admin'] || $_SESSION['head_admin'] || ($_GET['team_id'] == $match_teams['team_id_1']))) {
                    $sql = "get_map_name(".$_POST['map_id_1'].")";
                    $db->run($sql);
                    $map_name = $db->get_result_row();
                    $sql = "add_settlement_log(".$_GET['match_id'].", '".$user_nick." from ".$team_name." changed the map to ".$map_name['name'].".')";
                    $db->run($sql);    
                }
                if (($_POST['map_id_2'] != $match_settlement_info['map_id_2']) && ($_SESSION['admin'] || $_SESSION['head_admin'] || ($_GET['team_id'] == $match_teams['team_id_2']))) {
                    $sql = "get_map_name(".$_POST['map_id_2'].")";
                    $db->run($sql);
                    $map_name = $db->get_result_row();
                    $sql = "add_settlement_log(".$_GET['match_id'].", '".$user_nick." from ".$team_name." changed the map to ".$map_name['name'].".')";
                    $db->run($sql);
                }
                
                // chat added?                
                if (strlen($_POST['chat']) > 0) { 
                    $sql = "add_settlement_log(".$_GET['match_id'].", '".$user_nick." from ".$team_name." said: ".$_POST['chat'].".')";
                    $db->run($sql);    
                }
                
                display_success("edit_match_settlement", $_GET['match_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
                                
        }
                                    
     }
     
    /**
     * Checks a edit newsa request and performs it if everything is ok
     *
     * @access public
     * @return true
     */
     
     function complete_edit_news() {
        if (valid_request(array(isset($_GET['news_id']),
                                isset($_POST['title']),
                                isset($_POST['text'])))) {
                                
            global $smarty;
            global $db;

            if (strlen($_POST['title']) > 150 || strlen($_POST['title']) < 3) {
                display_errors(800);
                return true;
            }

            $sql = "edit_news(".$_GET['news_id'].",
                             '".$_POST['title']."',
                             '".$_POST['text']."')";
            $db->run($sql);
            if ($db->error_result)
                display_errors(1);
            else {
                display_success("edit_news");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }                        
        }    
     }
    
    
    /**
     * Checks a edit_team request for invalid inputs and performs all
     * actions if no error occurs
     *
     * @access public
     * @return true
     */
    
    
    function complete_edit_team() {
        if (valid_request(array(isset($_GET['team_id']), 
                                isset($_POST['name']), 
                                isset($_POST['shorthandle']), 
                                isset($_POST['description']), 
                                isset($_POST['join_password'])))) {
                                                    
            global $smarty;
            global $db;
        
            if (!preg_match('/^[a-zA-Z0-9-. ]+$/', $_POST['name'])) {
                display_errors(200);
                return true;    
            }           
            if (strlen($_POST['name']) > 50) {
                display_errors(201);
                return true;    
            }            
            if (strlen($_POST['shorthandle']) > 20) {
                display_errors(202);
                return true;   
            }   
            
            //all tests passed
            //glueing the sql update string together
            $sql = "edit_team('".$_POST['name']."',
                              '".$_POST['shorthandle']."',
                              '".$_POST['description']."', 
                              '".$_POST['join_password']."',
                              ".$_GET['team_id'].")";
            $db->run($sql);
            if ($db->error_result) {
                display_errors(203);
                return true;    
            }                
    
            //get the updated player information out of the $_POST-Array
            $player_info = array();
            foreach($_POST as $key => $val) {
                // is this a player field?
                if (strstr($key, 'player')) {
                    $parts = explode("-", $key);
                    $player_info[$parts[1]][$parts[2]] = $val;     
                }
            } 
            
            //adding the infos for unchecked checkboxes  / change "on" for checked boxes to "1"
            foreach($player_info as $user_id => $user_id_val) {
                if (!isset($user_id_val['admin_permission']))
                    $player_info[$user_id]['admin_permission'] = 0;
                else    
                    $player_info[$user_id]['admin_permission'] = 1;
                if (!isset($user_id_val['write_permission']))
                    $player_info[$user_id]['write_permission'] = 0;
                else
                    $player_info[$user_id]['write_permission'] = 1;                   
            }
            
            //glueing the sql strings together and add into db
            foreach($player_info as $user_id => $user_id_val) {
                $sql_update = "edit_user_in_team(".$user_id_val['team_status_type_id'].",
                                                 ".$user_id_val['admin_permission'].", 
                                                 ".$user_id_val['write_permission'].", 
                                                 ".$user_id.",
                                                 ".$_GET['team_id'].")";
                $db->run($sql_update);
                if ($db->error_result) {
                    display_errors(1);
                    return true;    
                }
            }   
            display_success("edit_team", $_GET['team_id']);
            $smarty->assign('content', $smarty->fetch("succes.tpl"));
        }
        return true;
    }
    
    /**
     * Checks a edit_user_profile request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true;
     */
    
    function complete_edit_user_profile() {
        if (valid_request(array(isset($_GET['user_id']), isset($_POST['last_name']), isset($_POST['first_name']), isset($_POST['description']), isset($_POST['nation'])))) {
                                          
            global $smarty;
            global $db;
            
            if (strlen($_POST['last_name']) < 4 || strlen($_POST['last_name']) > 50 )
                $errors[] = 54;
            if (strlen($_POST['first_name']) < 3 ||strlen($_POST['first_name']) > 50)
                $errors[] = 55;
            if (strlen($_POST['nick']) < 2 ||strlen($_POST['nick']) > 50)     
                $errors[] = 56;
            if (strlen($_POST['nation']) > 50)
                $errors[] = 57;
            
            // if errors occured return with them
            if (isset($errors)) {
                display_errors($errors);
                return true;    
            }
              
            // All tests are passed - time to insert the profile into the db    
            $sql = "edit_user_profile('".$_POST['last_name']."', 
                                      '".$_POST['first_name']."',  
                                      '".$_POST['nick']."',
                                      '".$_POST['description']."', 
                                      '".$_POST['nation']."', 
                                      ".$_GET['user_id'].")";
            $db->run($sql);
            if ($db->error_result)
                display_errors(203);
            else {
                display_success("edit_user_profile", $_GET['user_id']);
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }                        
        }
        return true;         
    }
    
        
    /**
     * Performs a logout
     *
     * @access public
     * @return true
     */
    
     function complete_logout() {
     
        global $smarty;
     
        session_unset();
        $_SESSION = array();
        
        display_visitor_data(); //show user related stuff
        display_success("logout");
        $smarty->assign('content', $smarty->fetch("succes.tpl"));
        return true;
    } 
    
    
    /**
     * Checks a login request for invalid inputs and performs all
     * SQL actions if no error occurs
     * also fills the $_SESSION-Array with account related information
     *
     * @access public
     * @return true
     */

    function complete_login() {
        if (valid_request(array(isset($_POST['login']), isset($_POST['password'])))) {

            global $db;
            global $smarty;
            
            //session_start();      session.auto_start = 1
    
            //see if we hit the right email/nick -password pair
            $sql = "get_user_id_login('".$_POST['login']."', '".md5($_POST['password'])."')";
            $db->run($sql);    
            if (!$db->empty_result) {
                $_SESSION['accepted'] = true;
    
                //store the user informations for further actions
                $row = $db->get_result_row();                
                $_SESSION['user_id'] = $row['user_id'];
    
                //is the user admin
                $sql = "get_admin_id(".$_SESSION['user_id'].")";
                $db->run($sql);
                if (!$db->empty_result)
                    $_SESSION['admin'] = true;
                else
                    $_SESSION['admin'] = false;                    
                                
                //is the user head admin
                $sql = "get_head_admin_id(".$_SESSION['user_id'].")";
                $db->run($sql);
                if (!$db->empty_result)
                    $_SESSION['head_admin'] = true;
                else
                    $_SESSION['head_admin'] = false;
                                
                //will be filled when trying to access the areas
                $_SESSION['team_admin'] = array();
                $_SESSION['team_writer'] = array();
    
                if ($_SERVER['SERVER_PROTOCOL'] == 'HTTP/1.1') {
                    if (php_sapi_name() == 'cgi') {
                        header('Status: 303 See Other');
                    }
                    else {
                        header('HTTP/1.1 303 See Other');
                    }
                }
                display_success("login");
                display_visitor_data(); //show user related stuff
                $smarty->assign('content', $smarty->fetch("succes.tpl"));   
            }
            else  {                 
                // invalid login
                display_errors(100);
            }
        }
        return true;
    }
    
    /**
     * Performs a join league request, displays errors if the action is invalid
     *
     * @access public
     * @return true
     */

    function complete_join_league() {
        if (valid_request(array(isset($_GET['league_id']), isset($_POST['team_id'])))) {

            global $db;
            global $smarty;
            
            //test if enough players are in the team
            $sql = "get_players_valid_ids(".$_POST['team_id'].",
                                          ".$_GET['league_id'].")";
            
            $db->run($sql);
            $row = $db->get_result_row();
            if ($row['player_count'] < $row['min_count']) {
                display_errors(450);
                return true;
            }
            
            //perform the sign in
            $sql = "join_league(".$_POST['team_id'].",
                                ".$_GET['league_id'].")";
            $db->run($sql);
            if ($db->empty_result)
                display_errors(451);
            else {
                display_success("join_league");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }
        }
    }
    
    
    /**
     * Checks a join team request for invalid inputs and performs all
     * SQL actions if no error occurs
     *
     * @access public
     * @return true
     */
     

    function complete_join_team() {
        if (valid_request(array(isset($_GET['team_id']), isset($_POST['password'])))) {
                       
            global $db;
            global $smarty;
   
            $sql = "join_team(".$_SESSION['user_id'].",
                              ".$_GET['team_id'].",
                              '".$_POST['password']."')";
            $db->run($sql);           
            if ($db->empty_result)
                display_errors(150);
            else {
                display_success("join_team");
                $smarty->assign('content', $smarty->fetch("succes.tpl"));
            }                        
        }
    }
        
    /**
     * Checks a registration request for invalid inputs
     *
     * @access public
     * @return true
     */

    function complete_registration() {
        if (valid_request(array(isset($_POST['last_name']), isset($_POST['first_name']), isset($_POST['login']), isset($_POST['nation']), isset($_POST['email']), isset($_POST['password']), isset($_POST['password_retype'])))) {
                    
            global $db;
            global $smarty;
    
            //Looking for invalid user inputs
            if ($_POST['password'] != $_POST['password_retype'])
                $errors[] = 52;
            if (strlen($_POST['password']) < 6)
                $errors[] = 53;
            if (strlen($_POST['last_name']) < 4 || strlen($_POST['last_name']) > 50 )
                $errors[] = 54;
            if (strlen($_POST['first_name']) < 3 || strlen($_POST['first_name']) > 50)
                $errors[] = 55;
            if (strlen($_POST['login']) < 2 || strlen($_POST['login']) > 50)     //@ todo regex nick (no spaces, special chars etc.)
                $errors[] = 56;
            if (strlen($_POST['nation']) > 50)
                $errors[] = 57;
            if (strlen($_POST['email']) > 100)
                $errors[] = 58;
            if (!preg_match('/^[a-z0-9_.-]+@[a-z0-9.-]{2,63}\.[a-z]{2,10}$/i', $_POST['email']))
                $errors[] = 59;
    
            // @todo icq, msn usw hinzu
    
            //Testing if nick name or email already exists
            $sql = "get_login_email('".$_POST['login']."',
                                    '".$_POST['email']."')";
            $db->run($sql);    
            if (!$db->empty_result) {
                $row = $db->get_result_row();
                if ($row['login'] == $_POST['login'])
                    $errors[] = 60;
                else
                    $errors[] = 61;    
            }
                    
            // if errors occured return with them
            if (isset($errors)) {
                display_errors($errors);
                return true;    
            }
                
    
            //All tests are passed - Time to insert the profile into the db
            $sql = "add_user('".$_POST['last_name']."', 
                             '".$_POST['first_name']."',
                             '".$_POST['login']."',
                             '".$_POST['nation']."',
                             '".$_POST['email']."',
                             '".md5($_POST['password'])."')";   
            $db->run($sql);
            if ($db->error_result) {
                display_errors(1);
                return true;    
            }                     
    
            /**********************
            Sending the Mail to complete the registration
            **********************/
    
            // @todo test email stuff
            // @todo globale variablen: sitename, admin mail addi etc etc...
            // @todo good text for registration email
    
            mail($_POST['email'], 'Registration successfull!', 'Click this Link to complete Registration: http://localhost/test/certify_email.php', 'From: admin@example.com\r\nReply-To: nobody@noone.com');
    
            // this array should always be empty, final return if everything passed
            display_success("registration");
            $smarty->assign('content', $smarty->fetch("succes.tpl"));
        }
        return true;
    }
    
    /**
     * Checks a registration request for invalid inputs
     *
     * @access public
     * @return true
     */
    
    function complete_upload_match_media() {
        if (valid_request(array(isset($_GET['match_id']), 
                                isset($_FILES['match_media']), 
                                isset($_POST['description'])))) {
            
            require(CLASS_PATH.'class.upload.php');

            global $db;
            global $smarty;                    
            
            if (strlen($_POST['description']) < 2 || strlen($_POST['description']) > 20 ) {
                display_errors(751);
                return true;
            }               
            
            $upload = new Upload($_FILES['match_media']);
            if ($upload->uploaded) {
                //getting the internal file name out of the current time
                $name = microtime();
                $name = substr($name, 2, 8).substr($name, 11);                
                $upload->file_new_name_body = $name;
                $upload->allowed = array('application/zip', 'image/*');
                $upload->process(MATCH_MEDIA_PATH);
                if ($upload->processed) {
                    $sql = "add_match_media(".$_GET['match_id'].",
                                            ".$_SESSION['user_id'].",
                                            '".$_POST['description']."',
                                            '".$upload->file_dst_name."', 
                                            ".filesize($upload->file_dst_pathname).")";
                    $db->run($sql);
                    if ($db->error_result) {                        
                        display_errors(750);
                    }    
                    else {
                        display_success("upload_match_media");
                        $smarty->assign('content', $smarty->fetch("succes.tpl"));    
                    }    
                }
                else {
                    display_errors(750);    
                }
                $upload->clean();    
            }
            else {
                display_errors(750);
                return true;
            }        
        }    
        return true;
    }

    
 ?>