Name: {$season_info.name} <br />
League: <a href="index.php?site=league_details&league_id={$season_info.league_id}">{$season_info.league_name}</a>

<a href="index.php?site=edit_season&season_id={$season_info.season_id}">Edit Details</a> <br /> <br />

Divisions: <br />
{foreach from=$season_divisions item=one_division}
    <a href="index.php?site=division_details&division_id={$one_division.division_id}">Division {$one_division.number}</a> <br />
{/foreach}