<a href="index.php?site=edit_match_settlement&match_id={$match_info.match_id}"> View match settlement</a>
<br />
<br />
Game: {$match_info.game_name} <br />
League: {$match_info.league_name}   <br />
Season: {$match_info.season_name}   <br />
Division: {$match_info.division_number}    <br />
<br />

<a href="index.php?site=team&team_id={$match_info.team_id_1}">{$match_info.team_name_1}</a>
&nbsp;vs&nbsp;
<a href="index.php?site=team&team_id={$match_info.team_id_2}">{$match_info.team_name_2}</a>
<br />
Results:
<br />
{foreach from=$match_results item=one_result}
    {$one_result.map_name}:&nbsp;{$one_result.result_1}-{$one_result.result_2}
    <br />
{/foreach}

