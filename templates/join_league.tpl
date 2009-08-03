Join {$league_info.name} <br /> <br />

Note: You need at least {$league_info.min_players_team} players in the team with valid Guids <br /> <br />

With team: <br />
<form method="post" action="index.php?site=complete_join_league&league_id={$league_info.league_id}">
    <select name="team_id">
    {foreach from=$user_teams item=one_team}
        <option value="{$one_team.team_id}">{$one_team.name}</option>        
    {/foreach}
    </select>
    <br /> <br />
    <input type="submit" value="Join League"/>
</form>