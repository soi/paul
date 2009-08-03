name : {$team_info.name} <br />
shorthandle : {$team_info.shorthandle} <br />
desc: {$team_info.description} <br />
date: {$team_info.date} <br />

Players: 
<br />
{foreach from=$team_players item=one_player name=player_loop}
    <a href="index.php?site=user&user_id={$one_player.user_id}">{$one_player.nick}</a>&nbsp;({$one_player.status_name})
    {if $smarty.foreach.player_loop.last == false}
        ,&nbsp; 
    {/if}        
{/foreach}
<br />
<br />

Divisions:
<br />
{foreach from=$team_divisions item=one_division}
    <a href="index.php?site=division_details&division_id={$one_division.division_id}">{$one_division.season_name} - Division {$one_division.division_number}</a> 
    <br />       
{/foreach}
<br />
<a href="index.php?site=join_team&team_id={$team_info.team_id}">Team beitreten</a>
<a href="index.php?site=edit_team&team_id={$team_info.team_id}">Team bearbeiten</a>

