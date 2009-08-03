<form action="index.php?site=complete_add_season&league_id={$league_info.league_id}" method="post">
    <input type="hidden" name="max_teams_div" value="{$league_info.max_teams_div}"/>   
    
    <h5 id="login_subhl">Name</h4>
    <input name="name" value=""/>
    
    <h5 id="login_subhl">Start</h4>
    <input name="start" value="2000-12-31" size="10"/>
    
    <h5 id="login_subhl">Schedule</h4>
    <select name="schedule">
        <option value="7">every week</option>
        <option value="14">every second week</option>
        <option value="1">every day</option>
    </select>
    
    <h5 id="login_subhl">Current teams</h4> 
    {foreach from=$teams_season item=one_division}
        <h5 id="login_subhl">Division: {$one_division.div_number}</h4>
            {foreach from=$one_division.teams item=one_team}
                <a href="index.php?site=team&team_id={$one_team.team_id}">{$one_team.name}</a> 
                <input name="team{$one_team.team_id}" value="{$one_division.div_number}" size="1"/>
                <br />
            {/foreach}
    {/foreach}
    
    <br />
    <h5 id="login_subhl">New signed up teams</h4> 
    {foreach from=$teams_league_signup item=one_team}
        <a href="index.php?site=team&team_id={$one_team.team_id}">{$one_team.name}</a>
        <input name="team{$one_team.team_id}" value="0" size="1"/>
        <br />
    {/foreach}
    <br />
    
    <input type="submit" value="Create Season"/>
</form> 
