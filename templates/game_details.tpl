Name: {$game_info.name} <br />
Description: {$game_info.description} <br />
GUID: <a href="index.php?site=guid_details&guid_id={$game_info.guid_id}">{$game_info.guid_name}</a> <br />

<a href="index.php?site=edit_game&game_id={$game_info.game_id}">Edit Details</a> <br /> <br />

Leagues: <br />
{foreach from=$game_leagues item=one_league}
    <a href="index.php?site=league_details&league_id={$one_league.league_id}">{$one_league.name}</a> <br />
{/foreach}