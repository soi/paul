Name: {$division_info.season_name} Division: {$division_info.number} <br /> <br />

<table>
<th>Position</th>
<th>Team</th>
<th>Matches</th>
<th>Wins</th>
<th>Draws</th>
<th>Losses</th>
<th>Balance</th>
<th>Points</th>
{foreach from=$division_table item=one_team name=table_loop }
    <tr>
        <td>
            {$smarty.foreach.table_loop.iteration}   
        </td>
        <td>
            <a href="index.php?site=team&team_id={$one_team.team_id}">{$one_team.name}</a>
        </td>
        <td>
            {$one_team.match_count}
        </td>
        <td>
            {$one_team.wins}
        </td>
        <td>
            {$one_team.draws}
        </td>
        <td>
            {$one_team.losses}
        </td>
        <td>
            {$one_team.balance_pos}:{$one_team.balance_neg}
        </td>
        <td>
            {$one_team.points}
        </td>
    </tr>
{/foreach}
</table>

<br />
Last matches:
<br />
{foreach from=$division_last_matches item=one_match}
    <a href="index.php?site=match_details&match_id={$one_match.match_id}">{$one_match.team_1_name} </a>  &nbsp; 
    <a href="index.php?site=match_details&match_id={$one_match.match_id}"> {$one_match.team_1_result}:{$one_match.team_2_result}  </a> &nbsp; 
    <a href="index.php?site=match_details&match_id={$one_match.match_id}">{$one_match.team_2_name} </a> {$one_match.date}
    <br />
{/foreach}

<br />
Upcomming matches:
<br />
{foreach from=$division_upcomming_matches item=one_match}
    <a href="index.php?site=match_details&match_id={$one_match.match_id}">{$one_match.team_1_name} </a>  &nbsp; 
    <a href="index.php?site=match_details&match_id={$one_match.match_id}"> vs </a> &nbsp;
    <a href="index.php?site=match_details&match_id={$one_match.match_id}">{$one_match.team_2_name} </a> {$one_match.date}
    <br />
{/foreach}