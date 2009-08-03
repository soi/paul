name: {$user_info.last_name} <br />
first_name: {$user_info.first_name} <br />
nick: {$user_info.nick} <br />
description: {$user_info.description} <br />
nationiality: {$user_info.nation} <br />
since: {$user_info.date} <br />

{foreach from=$user_teams item=one_team name=team_loop}
    <a href="index.php?site=team&team_id={$one_team.team_id}">{$one_team.name }</a>
    {if $smarty.foreach.player_loop.last == false}
        ,&nbsp;
    {/if}
{/foreach}

<br />
GUID's:
<br />

{foreach from=$user_guids item=one_guid }
    {$one_guid.name}: {$one_guid.guid} from {$one_guid.date}<br />
{/foreach}