<?php

    /**
     * Returns if the user has the permission to upload match media
     *
     * My permission handling is completly awfull i know
     *
     * @return true/false
     */

    function get_upload_permission() {
        if (isset($_GET['match_id']) && $_GET['match_id'] != '') {
        
            global $db;
            
            if ($_SESSION['admin'] || $_SESSION['head_admin']) {
                return true;
            }

            // figuring out in which team the user is
            $sql = "get_user_teams(".$_SESSION['user_id'].")";
            $db->run($sql);
            if ($db->empty_result) {
                return false;
            }
            $user_teams = $db->get_result_array();
    
            // getting the teams of the match
            $sql = "get_match_teams(".$_GET['match_id'].")";
            $db->run($sql);
            if ($db->empty_result) {
                return false;
            }
            $match_teams = $db->get_result_row();
    
            // is one of the match team in the user team array?
            foreach($user_teams as $key => $user_team) {
                if ($user_team['team_id'] == $match_teams['team_id_1']) {
                    return true;
                }
                elseif ($user_team['team_id'] == $match_teams['team_id_2']) {
                    return true;
                }
            }
        }
        return false;         
    }
    
    /**
     * If the user wants to enter a site that requires team admin or team writer
     * permission an this site is identified by a match_id (like edit_match_settlement)
     * it has to be tested if the user is in one of those teams
     *
     * @access public
     * @return integer team_id or '0' if an unvaliud condition appears
     */
     
    function get_team_id_from_match_id($match_id) {
    
        global $db;
           
        // figuring out in which team the user is
        $sql = "get_user_teams(".$_SESSION['user_id'].")";
        $db->run($sql);
        if ($db->empty_result) {
            return 0;
        }
        $user_teams = $db->get_result_array();

        // getting the teams of the match
        $sql = "get_match_teams(".$_GET['match_id'].")";
        $db->run($sql);
        if ($db->empty_result) {
            return 0;
        }
        $match_teams = $db->get_result_row();
        
        // is one of the match team in the user team array?
        foreach($user_teams as $key => $user_team) {
            if ($user_team['team_id'] == $match_teams['team_id_1']) {
                $_GET['team_id'] = $match_teams['team_id_1'];
                return $_GET['team_id'];
            }
            elseif ($user_team['team_id'] == $match_teams['team_id_2']) {
                $_GET['team_id'] = $match_teams['team_id_2'];
                return $_GET['team_id'];
            }
        }
        return 0;
   }
    
    
    /**
     * Checks what permission the user has in a given team
     * Permissions are stored in db. And hold after initial request in the $_SESSION - Array for session duration
     *
     * @access public
     * @return array of boolean array(['team_admin'], ['team_writer'])
     */

    function team_permissions() {
        
        global $db;
    
        $ret_arr = array();
        // admins can do anything
        if ($_SESSION['admin'] || $_SESSION['head_admin']) {
            $ret_arr['team_admin'] = true;
            $ret_arr['team_writer'] = true;
            return $ret_arr;
        }
        else {
            $ret_arr['team_admin'] = false;
            $ret_arr['team_writer'] = false;
            // access to a match site that requires team rights?
            if (isset($_GET['match_id']) && $_GET['match_id'] != '') {                
                if(!get_team_id_from_match_id($_GET['match_id'])) {
                    return $ret_arr;          
                }                                                      
            } 
            // otherwise there has to be a team_id field
            elseif (!isset($_GET['team_id']) || !$_GET['team_id']) {
                return $ret_arr;    
            }
            
            // are the admin permission already in the $_SESSION array?
            if ($ret_arr['team_admin'] = in_array($_GET['team_id'], $_SESSION['team_admin']) 
                || $ret_arr['team_writer'] = in_array($_GET['team_id'], $_SESSION['team_writer'])) {
                return $ret_arr;        
            }
               
            //look in db otherwise
            $sql = "get_team_perm(".$_GET['team_id'].", ".$_SESSION['user_id'].")";
            $db->run($sql);
            if (!$db->empty_result) {
                $row = $db->get_result_row();
                if ($row['admin_permission']) {
                    $_SESSION['team_admin'][] = $_GET['team_id'];
                    $ret_arr['team_admin'] = true;
                }
                else
                    $ret_arr['team_admin'] = false;

                if ($row['write_permission']) {         
                    $_SESSION['team_writer'][] = $_GET['team_id'];
                    $ret_arr['team_writer'] = true;
                }
                else
                    $ret_arr['team_writer'] = false;
            }
            else {
                $ret_arr['team_admin'] = false;
                $ret_arr['team_writer'] = false;                
            }            
            return $ret_arr;  
        }
    }    
    
        
    /*
     * Return the sites the user is permitted to see
     *
     * @access public
     * @return array of string containing the permitted site names
     */

     // @todo put this into the $_SESSION - Array for faster access
     // @todo memcache?
    function get_permitted_sites() {
         //visible for everyone
        $perm_sites = array('match_details',
                            'news', 
                            'user', 
                            'team',
                            'league_details',
                            'division_details', 
                            'season_details',
                            'login', 
                            'register', 
                            'complete_login', 
                            'complete_registration');
        //all logged in users
        if (isset($_SESSION['user_id'])) {
            $area_login_all = array('join_team', 
                                    'create_team',
                                    'join_league', 
                                    'logout',
                                    'add_user_guid', 
                                    'complete_join_team', 
                                    'complete_create_team',
                                    'complete_join_league', 
                                    'complete_logout', 
                                    'complete_add_user_guid');
            $perm_sites = array_merge($perm_sites, $area_login_all);
 
            // all member of one team            
            $area_team_member_all = array('upload_match_media', 
                                          'complete_upload_match_media');
            if (in_array($_GET['site'], $area_team_member_all) && get_upload_permission()) {
                $perm_sites = array_merge($perm_sites, $area_team_member_all);       
            }
            // team admin / write admin tests
            $area_team_admin_all = array('confirm_match_result',
                                         'edit_team',
                                         'edit_match_settlement',
                                         'edit_match_result',
                                         'complete_confirm_match_result', 
                                         'complete_edit_team',                                         
                                         'complete_edit_match_settlement', 
                                         'complete_edit_match_result');
            $area_team_writer_all = array('confirm_match_result',
                                          'edit_match_settlement',
                                          'edit_match_result',
                                          'complete_confirm_match_result',
                                          'complete_edit_match_settlement', 
                                          'complete_edit_match_result');  
            if (in_array($_GET['site'], $area_team_admin_all)) {
                $team_permissions = team_permissions();
                if ($team_permissions['team_admin']) {
                    $perm_sites = array_merge($perm_sites, $area_team_admin_all);    
                }
                elseif ($team_permissions['team_writer']) {                    
                    $perm_sites = array_merge($perm_sites, $area_team_writer_all);
                }                    
            }
            // user specific sites
            if (isset($_GET['user_id']) && (($_SESSION['user_id'] == $_GET['user_id'])
                                        || ($_SESSION['admin'] || $_SESSION['head_admin']))) {
                $area_login = array ('edit_user_profile', 
                                     'complete_edit_user_profile');
                $perm_sites = array_merge($perm_sites, $area_login);
            } 
            // admin sites
            if ($_SESSION['admin']) {
                $area_admin = array('admin_menu', 
                                    'add_map',
                                    'add_map_to_league',
                                    'add_news',
                                    'edit_game',
                                    'edit_league',
                                    'edit_guid',
                                    'edit_news', 
                                    'complete_add_map',
                                    'complete_add_map_to_league',
                                    'complete_add_news',
                                    'complete_edit_game',
                                    'complete_edit_league',
                                    'complete_edit_guid',
                                    'complete_edit_news',
                                    'games_overview',
                                    'game_details',
                                    'guid_details',
                                    'guids_overview');
                $perm_sites = array_merge($perm_sites, $area_admin);
                // head_admin sites
                if ($_SESSION['head_admin']) {
                    $area_head_admin = array('head_admin_menu', 
                                             'add_league', 
                                             'add_game', 
                                             'add_guid',
                                             'add_season',
                                             'add_admin', 
                                             'add_head_admin',  
                                             'complete_add_game', 
                                             'complete_add_league', 
                                             'complete_add_guid',                                              
                                             'complete_add_season', 
                                             'complete_add_admin',
                                             'complete_add_head_admin'); 
                    $perm_sites = array_merge($perm_sites, $area_head_admin);    
                }    
            }               
        }
        return $perm_sites;    
    }
    
     // @todo name convention 'position' <--> 'number' <--> 'division'
     // @todo php/mysql logging
     // @todo complete functions: test if rows where affected an display proper error message
     // @todo max char count for description -> no text
     // @todo regex all nams (also league/team/game etc. : see what is harmful, allow as much as possible)
     // @todo when database error return real error message from mysql
     // @todo normal INT in stored proc... -> unsigned int
     // @todo what if user-id/team-id etc not exists?
     // @todo all function names with prefixes (SHOW_games_overview etc.) -> names conventions
     // @todo access leagues/games by name
     // @todo no extra rows in ddb -> set selected by id
     // @todo pictures for teams / users / games
     // @todo not beeing able to join a team if already in
     // @todo datatruncated when NOW() -> other function in mysql
     // @todo add season preview
     // @todo keep team permissions in $_SESSION Array? Dessision needed.
     // match->div->...->game as view
    
    /******************
     Main part
     ******************/

    // @todo delete when release
    error_reporting(E_ALL);
    ini_set('display_errorss', 1);

    require('constants.php');
    require(CLASS_PATH.SMARTY_CON_PATH);
    require('display_functions.php');
    require('complete_functions.php');
    require(CLASS_PATH.'class.mysql.connection.php');
    
    //main db connection
    $db = new mysql_connection('ripersoi.dyndns.org', 'paul_usr', 'YsvQz8SfV9', 'paul');
    //$db_connection = connect_to_db('localhost', 'paul_dbo', 'BN6uMqvPyv', 'paul');
    
    //main smarty instance        
    $smarty = new smarty_connect;         
    $smarty->debugging_ctrl = ($_SERVER['SERVER_NAME'] == 'localhost') ? 'URL' : 'NONE';
    
    $registered = display_visitor_data();       
    //display the news by default
    if (!isset($_GET['site'])){
        assign_news($smarty);
        $smarty->assign('content', $smarty->fetch("news.tpl"));
    }
    else {      
        //has the user permission to visit the site? 
        $perm_sites = get_permitted_sites();
        if (in_array($_GET['site'], $perm_sites)) {
            switch ($_GET['site']) { 
               
                case 'add_admin' :
                    $smarty->assign('content', $smarty->fetch("add_admin.tpl"));
                    break;
            
                case 'add_game' :
                    display_add_game();
                    break;
                
                case 'add_guid' :
                    $smarty->assign('content', $smarty->fetch("add_guid.tpl"));
                    break;
                    
                case 'add_head_admin' :
                    display_add_head_admin();
                    break;
                    
                case 'add_league' :
                    display_add_league();                    
                    break;
                    
                case 'add_map' :
                    $smarty->assign('content', $smarty->fetch("add_map.tpl"));
                    break;
                    
                case 'add_map_to_league' :
                    display_add_map_to_league();
                    break;
                    
                case 'add_news' :
                    $smarty->assign('content', $smarty->fetch("add_news.tpl"));
                    break;
                
                case 'add_season' :
                    display_add_season();
                    break;
                
                case 'add_season_summary' :
                    display_add_season_summary();
                    break;
                    
                case 'add_user_guid' :
                    display_add_user_guid();
                    break;
                    
                case 'admin_menu':
                    display_admin_menu();
                    break; 
                    
                case 'complete_add_admin':
                    complete_add_admin();
                    break;
                    
                case 'complete_add_league':
                    complete_add_league();
                    break;
                    
                case 'complete_add_game':
                    complete_add_game();
                    break;                

                case 'complete_add_guid':
                    complete_add_guid();
                    break;
                    
                case 'complete_add_head_admin':
                    complete_add_head_admin();
                    break;
                    
                case 'complete_add_map':
                    complete_add_map();
                    break;
                    
                case 'complete_add_map_to_league':
                    complete_add_map_to_league();
                    break;
                    
                case 'complete_add_news' :
                    complete_add_news();
                    break;
                    
                case 'complete_add_season':
                    complete_add_season();
                    break;
                    
                case 'complete_add_user_guid' :
                    complete_add_user_guid();
                    break;
                    
                case 'complete_confirm_match_result' :
                    complete_confirm_match_result();
                    break;
                    
                case 'complete_create_team':
                    complete_create_team();
                    break;
                    
                case 'complete_edit_game':
                    complete_edit_game();
                    break;
                    
                case 'complete_edit_guid':
                    complete_edit_guid();
                    break;
                    
                case 'complete_edit_league':
                    complete_edit_league();
                    break;
                    
                case 'complete_edit_match_result' :
                    complete_edit_match_result();
                    break;
                    
                case 'complete_edit_match_settlement' :
                    complete_edit_match_settlement();
                    break;
                    
                case 'complete_edit_news':
                    complete_edit_news();
                    break;
                    
                case 'complete_edit_team':
                    complete_edit_team();
                    break;
                
                case 'complete_edit_user_profile':
                    complete_edit_user_profile();
                    break;   
                    
               case 'complete_join_league':
                    complete_join_league();
                    break;  
                       
                case 'complete_join_team':
                    complete_join_team();
                    break;
                    
                case 'complete_login':
                    complete_login();
                    break;

                case 'complete_logout':
                    complete_logout();
                    break;
                    
                case 'complete_registration':
                    complete_registration();
                    break;
                    
                case 'complete_upload_match_media':
                    complete_upload_match_media();
                    break;
                    
                case 'confirm_match_result':
                    display_confirm_match_result();
                    break;
                    
                case 'create_team':
                    $smarty->assign('content', $smarty->fetch("create_team.tpl"));
                    break;   
                    
                case 'division_details': 
                    display_division_details();
                    $smarty->assign('content', $smarty->fetch("division_details.tpl"));
                    break;         
                    
                case 'edit_game' :
                    display_edit_game();
                    break;
                    
                case 'edit_league' :
                    display_edit_league();
                    break;

                case 'edit_guid' :
                    display_edit_guid();
                    break;
                    
               case 'edit_match_result' :
                    display_edit_match_result();
                    break; 
                    
                case 'edit_match_settlement' :
                    display_edit_match_settlement();
                    break;
                    
                case 'edit_news' :
                    display_edit_news();
                    break;
                    
                case 'edit_team':
                    display_edit_team();
                    break;
                    
                case 'edit_user_profile':
                    display_edit_user_profile();
                    break;
                
                case 'games_overview':
                    display_games_overview();
                    break;
                    
                case 'game_details':     
                    display_game_details();
                    break;
                    
                case 'guid_details':
                    display_guid_details();
                    break;
                    
                case 'guids_overview':
                    display_guids_overview();
                    break;
                    
                case 'head_admin_menu':
                    display_head_admin_menu();
                    break;
                    
                case 'league_details':
                    display_league_details();
                    break;
                    
                case 'login':
                    $smarty->assign('content', $smarty->fetch("login.tpl"));
                    break;
                    
                case 'join_league':
                    display_join_league();
                    break;
                    
                case 'join_team':
                    display_join_team();
                    break;
                    
                case 'match_details':
                    display_match_details();
                    break;
    
                case 'news':
                    display_news();
                    break;
                    
                case 'register':
                    display_registration();
                    break;
                    
                case 'season_details':
                    display_season_details();
                    break;                    
    
                case 'team':
                    display_team();
                    break;
                
                case 'upload_match_media':
                    display_upload_match_media();
                    break;
                    
                case 'user':
                    display_user_profile();
                    break;                
            }
        }
        else
            display_errors(250);   // permission denied
    }  
    
    //assigning page parts that are always visible
    $smarty->assign('head', $smarty->fetch("head.tpl"));
    $smarty->assign('left_navi', $smarty->fetch("left_navi.tpl"));
    $smarty->assign('right_navi', $smarty->fetch("right_navi.tpl"));
    $smarty->assign('footer', $smarty->fetch("footer.tpl"));
    
    $smarty->display('index.tpl');

?>
