<?php  

    //|----------------------------------------------------|
    //|Basic functions each assigning one template variable|
    //|----------------------------------------------------|
    
    /**
     * Assignes the $division_info template variable with the information about one division
     *
     * @access public
     * @param $division_id related id
     * @return true
    */
    
    function assign_division_info($division_id) {
    
        global $smarty;
        global $db;    
        
        $sql = "get_division_info(".$division_id.")";
        $db->run($sql);
        if (!$db->empty_result) {
            $smarty->assign('division_info', $db->get_result_row());    
        }
        return true;
    }
    
    
    /**
     * Assignes the $division_last_matches template variable with the information the 10 last matches of this division
     *
     * @access public
     * @param $division_id related id
     * @return true
    */

    function assign_division_last_matches($division_id) {

        global $smarty;
        global $db;
        
        $sql = "get_division_last_matches(".$division_id.")";
        $db->run($sql);        

        $smarty->assign('division_last_matches', $db->get_result_array());
        return true;
    }
    
    
    /**
     * Assignes the $division_upcomming_matches template variable with the information the 10 next matches of this division
     *
     * @access public
     * @param $division_id related id
     * @return true
    */

    function assign_division_upcomming_matches($division_id) {

        global $smarty;
        global $db;

        $sql = "get_division_upcomming_matches(".$division_id.")";
        $db->run($sql);

        $smarty->assign('division_upcomming_matches', $db->get_result_array());
        return true;
    }
        
    
    /**
     * Assignes the $division_table template variable with the information about the teams of one division
     *
     * @access public
     * @param $division_id related id
     * @return true
    */
    
    function cmp_table_rows($a, $b) {
        if ($a['points'] == $b['points'])
            return 0;
        return ($a['points'] > $b['points']) ? -1 : 1;
    }
    
    function assign_division_table($division_id) {

        global $smarty;
        global $db;
        
        $sql = "get_div_teams(".$division_id.")";
        $db->run($sql);
        if (!$db->empty_result) {
            $team_ids = $db->get_result_array();
            $table_rows = array();
            foreach ($team_ids as $team_id) {
                $sql = "get_stats_team_div(".$team_id['team_id'].", 
                                           ".$division_id.", 
                                           3, 
                                           1, 
                                           0)";
                $db->run($sql);
                if (!$db->empty_result) 
                    $table_rows[] = $db->get_result_row();
            }   
            usort($table_rows, "cmp_table_rows");
        }
                
        $smarty->assign('division_table', $table_rows);
        return true;
    }
    
    /**
     * Assignes the $error_messages template variable with the given error messages
     *
     * @access public
     * @param array of integer $errors containing the error codes
     * @return true
    */

    function assign_error_messages($errors) {

        global $smarty;

        $error_messages = parse_ini_file(ERROR_PATH);   // @todo what if file not exists
        $related_error_messages = array_values(array_intersect_key($error_messages, array_flip($errors)));  // @todo memcache that
        $smarty->assign('error_messages', $related_error_messages);
        return true;
    }
    
    /**
     * Assignes the $game_leagues template variable with some information about every league
     *
     * @access public
     * @param string $game_id related id
     * @return true
    */
    
    function assign_game_leagues($game_id) {
    
        global $smarty;
        global $db;    
        
        $sql = "get_game_leagues(".$game_id.")";
        
        $db->run($sql);
        $smarty->assign('game_leagues', $db->get_result_array());        
        
        return true;        
    }
    
    /**
     * Assignes the $game_info template variable full information about one given game
     *
     * @access public
     * @param string $game_id related id
     * @return true
    */

    function assign_game_info($game_id) {
        
        global $smarty;
        global $db;
        
        $sql = "get_game_info(".$game_id.")";
                
        $db->run($sql);
        $smarty->assign('game_info', $db->get_result_row());
        
        return true;
    }
    
    /**
     * Assignes the $games template variable with full information the games
     *
     * @access public
     * @return true
    */

    function assign_games() {

        global $smarty;
        global $db;

        //get guids and assign them

        $sql = "get_games()";
        
        $db->run($sql);
        $smarty->assign('games', $db->get_result_array());
        
        return true;
    }
    
    /**
     * Assignes the $guid_info template variable with full information one guid
     *
     * @access public
     * @return true
    */

    function assign_guid_info($guid_id) {

        global $smarty;
        global $db;

        //get guids and assign them

        $sql = "get_guid_info(".$guid_id.")";
        $db->run($sql);
        $smarty->assign('guid_info', $db->get_result_row());
        
        return true;
    }
    
    /**
     * Assignes the $guids template variable with full information about the guids
     *
     * @access public
     * @return true
    */

    function assign_guids() {

        global $smarty;
        global $db;

        //get guids and assign them

        $sql = "get_guids()";
        $db->run($sql);
        $smarty->assign('guids', $db->get_result_array());
        
        return true;
    }

    
    /**
     * Assignes the $league_info template variable full information about one given league
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_league_info($league_id) {
        
        global $smarty;
        global $db;

        $sql = "get_league_info(".$league_id.")";
        
        $db->run($sql);
        $smarty->assign('league_info', $db->get_result_row());
        
        return true;
    }
    
    /**
     * Assignes the $league_maps template variable 
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_league_maps($id, $by_match_id = false) {

        global $smarty;
        global $db;
        
        if ($by_match_id) {
            $sql = "get_league_id_from_match(".$id.")";
            $db->run($sql);
            $id_row = $db->get_result_row();
            $id = $id_row['league_id'];
        }

        $sql = "get_league_maps(".$id.")";

        $db->run($sql);
        $smarty->assign('league_maps', $db->get_result_array());

        return true;
    }
    
        
    /**
     * Assignes the $league_news template variable with the news according to one league
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_league_news($league_id) {

        global $smarty;
        global $db;

        $sql = "get_league_news(".$league_id.")"; //@todo news archive, letzte news anzeigen etc.
        
        $db->run($sql);
        $smarty->assign('league_news', $db->get_result_array());
        
        return true;
    }
    
    
    /**
     * Assignes the $league_seasons template variable with the seasons of the given league
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_league_seasons($league_id) {

        global $smarty;
        global $db;

        $sql = "get_league_seasons(".$league_id.")";

        $db->run($sql);
        $smarty->assign('league_seasons', $db->get_result_array());

        return true;
    }
    
    
    /**
     * Assignes the $maps template variable with info about all maps
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_maps() {

        global $smarty;
        global $db;

        $sql = "get_maps();";

        $db->run($sql);
        $smarty->assign('maps', $db->get_result_array());

        return true;
    }

    
    /**
     * Assignes the $match_details template variable with the basic info about a match (without results)
     *
     * @access public
     * @param string $match_id related id
     * @return true
    */

    function assign_match_info($match_id) {

        global $smarty;
        global $db;

        $sql = "get_match_info(".$match_id.")";

        $db->run($sql);
        $smarty->assign('match_info', $db->get_result_row());

        return true;
    }
    
    
    /**
     * Assignes the $match_results template variable with the results for one match
     * containing arrays each representing a result on one map and some info about it
     *
     * @access public
     * @param string $match_id related id
     * @return true
    */

    function assign_match_results($match_id) {

        global $smarty;
        global $db;

        $sql = "get_match_results(".$match_id.")";
        $db->run($sql);

        $smarty->assign('match_results', $db->get_result_array());
        return true;
    }
    
    
    /**
     * Assignes the $match_settlement template variable info about the current match settlement status
     *
     * @access public
     * @param string $match_id related id
     * @return true
    */

    function assign_match_settlement_info($match_id) {

        global $smarty;
        global $db;

        $sql = "get_match_settlement_info(".$match_id.");";
        $db->run($sql);
        $match_settlement_info = $db->get_result_row();
        
        // adding the related team_id of the user
        // is still in the $_GET array after the permission check
        if (!$_SESSION['admin'] && !$_SESSION['head_admin'])
            $match_settlement_info['user_team_id'] = $_GET['team_id'];
        
        $smarty->assign('match_settlement_info', $match_settlement_info);
        return true;
    }
    
    
    /**
     * Assignes the $match_settlement_log template variable filled with the log entries
     *
     * @access public
     * @param string $match_id related id
     * @return true
    */

    function assign_match_settlement_log($match_id) {

        global $smarty;
        global $db;

        $sql = "get_match_settlement_log(".$match_id.")";
        $db->run($sql);

        $smarty->assign('match_settlement_log', $db->get_result_array());
        return true;
    }
    
    
    
    /**
     * Assignes the $news template variable with full information the news
     * Assignes an array of associative arrays, each associative array representing on news
     * @access public
     * @return true
    */

    function assign_news() {
    
        global $smarty;
        global $db;

        $sql = "get_news()";
        $db->run($sql);

        //putting the news arrays into one master array
        $smarty->assign('news', $db->get_result_array());
        
        return true;
    }
    
    /**
     * Assignes the $season_info template variable with full information about the given season
     * assignes an associative array
     * @access public
     * @param string $season_id related id
     * @return true
    */

    function assign_season_info($season_id) {

        global $smarty;
        global $db;

        //get the team info except the players
        $sql = "get_season_info(".$season_id.");";

        $db->run($sql);
        $smarty->assign('season_info', $db->get_result_row());
        
        return true;
    }   
    
        /**
     * Assignes the $season_divisions template variable with some informations about the divisions of the given season
     * assignes an array of associative arrays
     * @access public
     * @param string $season_id related id
     * @return true
    */

    function assign_season_divisions($season_id) {

        global $smarty;
        global $db;

        //get the team info except the players
        $sql = "get_season_divisions(".$season_id.");";

        $db->run($sql);
        $smarty->assign('season_divisions', $db->get_result_array());
        return true;
    }

    
    /**
     * Assignes the $success_info template variable some information about the success
     * can contain a relates id to the action
     * gets the messages from "languages/en/succes.ini"
     *
     * @access public
     * @param string $succes_action success action name
     * @param string $relatedivision_id optional id
     * @return true
    */

    function assign_success_info($success_action, $related_id = 0) {

        global $smarty;

        $success_messages = parse_ini_file(SUCCESS_PATH, true); // @todo what if file not exists
        $related_success_messages = $success_messages[$success_action];  // @todo memcache that
        // array that is to be assigned
        $success = array();
        $success['action'] = $related_success_messages['action'];
        $success['message'] = $related_success_messages['message'];
        if ($related_id)
            $success['id'] = $related_id;

        $smarty->assign('success_info', $success);
        return true;
    }
    
    /**
     * Assignes the $team_divisions template variable with some information about the division the team is in
     *
     * @access public
     * @param string $team_id related id
     * @return true
    */

    function assign_team_divisions($team_id) {

        global $smarty;
        global $db;

        //get the team info except the players
        $sql = "get_team_divisions(".$team_id.");";
        $db->run($sql);
        
        $smarty->assign('team_divisions', $db->get_result_array());
        return true;
    }
    
    /**
     * Assignes the $team_info template variable with full information about the given team
     * assignes an associative array
     * @access public
     * @param string $team_id related id
     * @return true
    */

    function assign_team_info($team_id) {

        global $smarty;
        global $db;

        //get the team info except the players
        $sql = "get_team_info(".$team_id.");";

        $db->run($sql);
        $smarty->assign('team_info', $db->get_result_row());
        return true;
    }
    
    /**
     * Assignes the $teams_league_signup template variable with some information about the signed up teams of a league
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_teams_league_signup($league_id) {

        global $smarty;
        global $db;

        $sql = "get_teams_league_signup(".$league_id.");";

        $db->run($sql);
        $smarty->assign('teams_league_signup', $db->get_result_array());
        return true;
    }
    
     /**
     * Assignes the $team_players template variable with some information about the players in a team
     * like their permissions in the team
     *
     * @access public
     * @param string $team_id related id
     * @return true
    */

    function assign_team_players($team_id) {

        global $smarty;
        global $db;

        //get the player infos for the team members
        $sql = "get_team_players(".$team_id.");";

        $db->run($sql);

        //putting the player arrays into one master array
        $smarty->assign('team_players', $db->get_result_array());
        
        return true;
    }
    
     /**
     * Assignes the $team_season template variable with some information about the teams of a division
     *
     * @access public
     * @param string $league_id related id
     * @return true
    */

    function assign_teams_season($league_id) {

        global $smarty;
        global $db;

        $sql = "get_teams_season(".$league_id.");";
        $db->run($sql);
        
        $curr_div = -1;
        $season_div = array();
        do {
            if ($team = $db->get_result_row()) {
                if ($team['div_number'] > $curr_div) {
                    $curr_div = $team['div_number'];
                    $season_div[]['div_number'] = $curr_div;
                    if (isset($div)) {
                        $season_div[count($season_div) - 2]['teams'] = $div;
                        $div = array();
                    }
                }
                $div[] = $team;    
            } 
            else {
                if ($curr_div > -1) {
                    // insert the final division
                    $season_div[count($season_div) - 1]['teams'] = $div;    
                }                    
            }                                     
        } while ($team);
        //apply to the template        
        $smarty->assign('teams_season', $season_div);
        return true;
    }
    

    /**
     * Assignes the $team_short_info template variable with some information about the given team
     * assignes an associative array
     * @access public
     * @param string $team_id related id
     * @return true
    */

    function assign_team_short_info($team_id) {

        global $smarty;
        global $db;

        //get the team info except the players
        $sql = "get_team_short_info(".$team_id.");";

        $db->run($sql);
        $smarty->assign('team_short_info', $db->get_result_row());
        
        return true;
    }
        
    /**
     * Assignes the $team_status_types template variable containing the names of all available player status types
     * $user_info is an associative array
     *
     * @access public
     * @param string $team_id related id
     * @return true
    */
        
    function assign_team_status_types($team_id) {
    
        global $smarty;
        global $db;

        //get all team status types
        $sql = "get_team_status_types()";

        $db->run($sql);
        $smarty->assign('team_status_types', $db->get_result_array());
        
        return true;    
    }
    
    /**
     * Assignes the $user_guids template variable 
     *
     * @access public
     * @param string $user_id related id
     * @return true
    */

    function assign_user_guids($user_id) {

        global $smarty;
        global $db;

        //get the general player info
        $sql = "get_user_guids(".$user_id.");";  
        $db->run($sql);

        $smarty->assign('user_guids', $db->get_result_array());

        return true;
    }
    
      
    /**
     * Assignes the $user_info template variable with full information about the given user
     * $user_info is an associative array
     *
     * @access public
     * @param string $user_id related id
     * @return true
    */

    function assign_user_info($user_id) {

        global $smarty;
        global $db;

        //get the general player info
        $sql = "get_user_info(".$user_id.");";   // @ todo possibility to decide if e-mail can be displayed
        $db->run($sql);

        $smarty->assign('user_info', $db->get_result_row());
        
        return true;
    }
    
    /**
     * Assignes the $user_short_info template variable with some information about the given user
     * assignes an associative array
     * @access public
     * @param string $user_id related id
     * @return true
    */
    
    function assign_user_short_info ($user_id) {
    
        global $smarty;
        global $db;

        //get the general player info
        $sql = "get_user_short_info(".$user_id.");";   
        $db->run($sql);

        $smarty->assign('user_info', $db->get_result_row());
        return true;
    }

    /**
     * Assignes the $user_teams tenplate variable with basic information about the
     * $user_teams an array of assotiatve arrays
     *
     * @access public
     * @param string $user_id related id
     * @return true
    */

    function assign_user_teams($user_id) {

        global $smarty;
        global $db;

        $sql = "get_user_teams(".$user_id.");";

        $db->run($sql);
        $smarty->assign('user_teams', $db->get_result_array());        
        return true;
    }
    
    /**
     * Assignes the $visitor_info template variables containing basic visitor info
     *
     * @access public
     * @param  string $user_id related user identifer
     * @return boolean whether visitor is logged in
     */

     function assign_visitor_info()  {

        global $smarty;
        global $db;

        // logged in
        if (isset($_SESSION['user_id'])) {
            $sql = "get_visitor_info(".$_SESSION['user_id'].");";
            $db->run($sql);
            $user = $db->get_result_row();  
                      
            $user['logged_in'] = true;             // @todo USE IT
            $user['user_id'] =  $_SESSION['user_id'];    // @todo maybe NULL when not logged in?
            $user['admin'] = $_SESSION['admin'];
            $user['head_admin'] = $_SESSION['head_admin'];
            $smarty->assign('visitor_info', $user);
            return true;
        }
        else {
            $user['logged_in'] = false;
            $user['admin'] = false;
            $user['head_admin'] = false;
            $smarty->assign('visitor_info', $user);
            return false;
        }
     }

   
    
 ?>