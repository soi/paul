<?php     
    //|-----------------------------------------------------------------|
    //|Functions to be called from index.php to display a whole content |
    //|The functions are calling assign functions to assign all template|
    //|variables needed for the content and are performing request error|
    //|checks                                                           |
    //|-----------------------------------------------------------------|
    
    require('assign_functions.php');
     
     /**
     * Assignes: $guids
     *
     * @access public
     * @return boolean true
     */

     function display_add_game() {
        
        global $smarty; 
            
        assign_guids();
        $smarty->assign('content', $smarty->fetch("add_game.tpl"));
        return true;
     }

     /**
     * Assignes: $games
     *
     * @access public
     * @return boolean true
     */

     function display_add_league() {
     
        global $smarty;
     
        assign_games();
        $smarty->assign('content', $smarty->fetch("add_league.tpl"));
        return true;
     }
     
     
     /**
     * Assignes: $maps
     *
     * @access public
     * @return boolean true
     */

     function display_add_map_to_league() {

        global $smarty;
        if (valid_request(array(isset($_GET['league_id'])))) {
            assign_maps();
            assign_league_info($_GET['league_id']);
            $smarty->assign('content', $smarty->fetch("add_map_to_league.tpl"));
        }
        return true;
     }
     
     /**
     * Assignes: $teams_season
     *
     * @access public
     * @return boolean true
     */

     function display_add_season() {

        global $smarty;

        if (valid_request(array(isset($_GET['league_id'])))) {
            assign_teams_season($_GET['league_id']);
            assign_teams_league_signup($_GET['league_id']);
            assign_league_info($_GET['league_id']);
            $smarty->assign('content', $smarty->fetch("add_season.tpl"));
        }
        return true;
     }
     
     /**
     * Assignes: $guids
     *
     * @access public
     * @return boolean true
     */

     function display_add_user_guid() {

        global $smarty;

        assign_guids();
        $smarty->assign('content', $smarty->fetch("add_user_guid.tpl"));
        return true;
     }
     
     
     /*
     * Shows the admin menu
     *
     * @return true
     */
    
     
     function display_admin_menu() {
     
        global $smarty;
     
        $smarty->assign('content', $smarty->fetch("admin_menu.tpl"));
        return true;    
     }
     
    
    /**
     * Assigned: $
     *
     * @access public
     * @return true
     */

    function display_division_details() {

        global $smarty;

        if (valid_request(array(isset($_GET['division_id'])))) {
            assign_division_info($_GET['division_id']);
            assign_division_table($_GET['division_id']);
            assign_division_last_matches($_GET['division_id']);
            assign_division_upcomming_matches($_GET['division_id']);
            $smarty->assign('content', $smarty->fetch("division_details.tpl"));
        }
        return true;
    }
     
     /**
     * Assigned: $game_info, $guids
     *
     * @access public
     * @return true
     */
     
     //games can be addressed by name or id
     //if both are given the id is taken
    //if (valid_request(array(isset($_GET['game_id']) || isset($_GET['name'])))) {
        //if (isset($_GET['game_id']))
            //assign_edit_game($_GET['game_id']);
        //else
            //assign_edit_game(NULL, $_GET['name']);
        //$smarty->assign('content', $smarty->fetch("edit_game.tpl"));
    //}

    function display_edit_game() {

        global $smarty;

        if (valid_request(array(isset($_GET['game_id'])))) {
            assign_game_info($_GET['game_id']);
            assign_guids();
            $smarty->assign('content', $smarty->fetch("edit_game.tpl"));
        }
        return true;
    }
    
    /**
     * Assigned: $guid_info
     *
     * @access public
     * @return true
     */

    function display_edit_guid() {

        global $smarty;

        if (valid_request(array(isset($_GET['guid_id'])))) {
            assign_guid_info($_GET['guid_id']);
            $smarty->assign('content', $smarty->fetch("edit_guid.tpl"));
        }
        return true;
    }
    
    
    /**
     * Assigned: $league_info, $games
     *
     * @access public
     * @return true
     */

    function display_edit_league() {

        global $smarty;

        if (valid_request(array(isset($_GET['league_id'])))) {
            assign_league_info($_GET['league_id']);
            assign_games();
            $smarty->assign('content', $smarty->fetch("edit_league.tpl"));
        }
        return true;
    }
    
    /**
     * Assignes: $match_info, $match_settlement
     *
     * @access public
     * @return true
     */

    function display_edit_match_settlement() {

        global $smarty;

        if (valid_request(array(isset($_GET['match_id'])))) { 
            assign_match_info($_GET['match_id']);
            assign_match_settlement_info($_GET['match_id']);
            assign_match_settlement_log($_GET['match_id']);
            assign_league_maps($_GET['match_id'], true);
            $smarty->assign('content', $smarty->fetch("edit_match_settlement.tpl"));
        }
        return true;
    }
    
     
     /**
     * Almost Same like assign_user_profile
     *
     * @access public
     * @param  string $user_id related user id
     * @return boolean true
     */

    function display_edit_user_profile() {

        global $smarty;

        if (valid_request(array(isset($_GET['user_id'])))) {
            assign_user_info($_GET['user_id']);
            assign_user_teams($_GET['user_id']);
            $smarty->assign('content', $smarty->fetch("edit_user_profile.tpl"));
        }
        return true;
    }
    
     /**
     * Assigned: $team_info, $team_players, $team_status_types
     *
     * @access public
     * @return true
     */
    
    function display_edit_team() {
    
        global $smarty;
    
        if (valid_request(array(isset($_GET['team_id'])))) {
            assign_team_info($_GET['team_id']);
            assign_team_players($_GET['team_id']);
            assign_team_status_types($_GET['team_id']);            
            $smarty->assign('content', $smarty->fetch("edit_team.tpl"));
        }
        return true;
    }
    
    /**
     * Displays the given errors
     *
     * @access public
     * @return what assign_errors() returns
     */

      function display_errors($errors) {

        global $smarty;

        if (!is_array($errors))
            $errors = array($errors);
        if (assign_error_messages($errors)) {
            $smarty->assign('content', $smarty->fetch("errors.tpl"));
            return true;
        }
        else
            return false;
     }
     
     /*
      * Shows the game overview
      * Assigned: $games
      *
      * @access public
      * @return true
     */

     function display_games_overview() {

        global $smarty;

        assign_games();
        $smarty->assign('content', $smarty->fetch("games_overview.tpl"));
     }
     
     /*
      * Shows the game details
      * Assigned: $game_info, $game_leagues
      *
      * @access public
      * @return true
     */

     function display_game_details() {

        global $smarty;
        
        if (valid_request(array(isset($_GET['game_id'])))) {
            assign_game_info($_GET['game_id']);
            assign_game_leagues($_GET['game_id']);
            $smarty->assign('content', $smarty->fetch("game_details.tpl"));    
        }
     }
     
     /*
      * Shows the guid deatils
      * Assigned: $guid_info
      *
      * @access public
      * @return true
     */
     
     // @todo show games which use that guid

     function display_guid_details() {

        global $smarty;

        if (valid_request(array(isset($_GET['guid_id'])))) {
            assign_guid_info($_GET['guid_id']);
            $smarty->assign('content', $smarty->fetch("guid_details.tpl"));
        }
     }
     
     /*
      * Shows the guid overview
      * Assigned: $guids
      *
      * @access public
      * @return true
     */
     
     function display_guids_overview() {
     
        global $smarty;
        
        assign_guids();
        $smarty->assign('content', $smarty->fetch("guids_overview.tpl"));    
     }
     
     /*
     * Shows the head admin menu
     *
     * @return true
     */


     function display_head_admin_menu() {
     
        global $smarty;
     
        $smarty->assign('content', $smarty->fetch("head_admin_menu.tpl"));
        return true;
     }
     
     /**
     * Assigned: $user_teams, $league_info
     *
     * @access public
     * @return boolean true
     */

    function display_join_league() {

        global $smarty;

        if (valid_request(array(isset($_GET['league_id'])))) {
            assign_user_teams($_SESSION['user_id']);
            assign_league_info($_GET['league_id']);
            $smarty->assign('content', $smarty->fetch("join_league.tpl"));
        }
        return true;
    }
    
    
    /**
     * Assigned: $team_short_info
     *
     * @access public
     * @return boolean true
     */

    function display_join_team() {

        global $smarty;

        if (valid_request(array(isset($_GET['team_id'])))) {
            assign_team_short_info($_GET['team_id']);
            $smarty->assign('content', $smarty->fetch("join_team.tpl"));
        }
        return true;
    }
    
    /**
     * Assigned: $league_info, $league_news, $league_divisions
     *
     * @access public
     * @return boolean true
     */

    function display_league_details() {

        global $smarty;

        if (valid_request(array(isset($_GET['league_id'])))) {
            assign_league_info($_GET['league_id']);
            assign_league_news($_GET['league_id']);
            assign_league_seasons($_GET['league_id']);
            $smarty->assign('content', $smarty->fetch("league_details.tpl"));
        }
        return true;
    }
    
    
    /**
     * Assignes: $match_info
     *
     * @access public
     * @return boolean true
     */

    function display_match_details() {

        global $smarty;

        if (valid_request(array(isset($_GET['match_id'])))) {
            assign_match_info($_GET['match_id']);
            assign_match_results($_GET['match_id']);
            $smarty->assign('content', $smarty->fetch("match_details.tpl"));
        }
        return true;
    }
    

    /**
     * Assignes: $news
     *
     * @access public
     * @return boolean true
     */

    function display_news() {
    
        global $smarty;
    
        assign_news();
        $smarty->assign('content', $smarty->fetch("news.tpl"));
        return true;
    }

    /**
     * Display the registration form if the user isn't logged in
     *
     * @access public
     * @return true
     */  
     
    function display_registration() {

        global $registered;
        global $smarty;

        if (!$registered)
            $smarty->assign('content', $smarty->fetch("registration.tpl"));
        else
            display_errors(51);
            
        return true;
    }
    
    /**
     * Assignes: $season_details
     *
     * @access public
     * @return true
     */

    function display_season_details() {

        global $smarty;
        
        if (valid_request(array(isset($_GET['season_id'])))) {
            assign_season_info($_GET['season_id']);
            assign_season_divisions($_GET['season_id']);
            $smarty->assign('content', $smarty->fetch("season_details.tpl"));
        }
        return true;
    }

    /**
     * Assignes: $succes_info
     *
     * @access public
     * @param  $string $success_action name of the action; defines a section in the ini file
     * @return true
     */

    function display_success($success_action, $related_id = 0) {
        assign_success_info($success_action, $related_id = 0);
        return true;
    }
    
    
    /**
     * Assigned: $team_info, $team_players
     * Shows search function if invalid request
     *
     * @access public
     * @param  string $team_id the related team id
     * @return boolean true
     */

    function display_team() {

        global $smarty;

        if (isset($_GET['team_id'])) {
            assign_team_info($_GET['team_id']);
            assign_team_players($_GET['team_id']);
            assign_team_divisions($_GET['team_id']);
            $smarty->assign('content', $smarty->fetch("team.tpl"));
        }
        else {
            // @todo show search function
        }
        return true;
    }
    
    /**
     * Assignes: $user_info, $user_teams
     *
     *
     * @access public
     * @param  string $user_id related user id
     * @return boolean true
     */

    function display_user_profile() {

        global $smarty;

        if (isset($_GET['user_id'])) {
            assign_user_info($_GET['user_id']);
            assign_user_teams($_GET['user_id']);
            assign_user_guids($_GET['user_id']);
            $smarty->assign('content', $smarty->fetch("user.tpl"));
        }
        else {
            // @todo show search function
        }
        return true;
    }
    
    /*
     * Assignes: $visitor_info
     *
     * @access public
     * @return boolean
     * true -> logged in
     * false-> not logged in
     */

     function display_visitor_data() {
        return assign_visitor_info();
     }
    
    /**
     * Checks if every element of the give array 'true' is.
     * If not it will assign the 'errors.tpl' with the message for 'invalid request'
     *
     * @access public
     * @param  array of boolean $required_vars array that yould come from 'array(isset($var1), isset($var2), ...)'
     * @return boolean
     * true -> valid request
     * false-> no valid request, error template assigned
     */

    function valid_request($required_vars) {

        global $smarty;

        foreach($required_vars as $val)
            if (!$val) {
                display_errors(2);
                return false;
            }
        return true;
    }
    
?>