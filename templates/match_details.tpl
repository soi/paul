<a href="index.php?site=team&team_id={$match_info.team_id_1}">{$match_info.team_name_1}</a>
&nbsp;vs&nbsp;
<a href="index.php?site=team&team_id={$match_info.team_id_2}">{$match_info.team_name_2}</a>
<br />
<br />

{if $match_info.status == 0}
    <a href="index.php?site=edit_match_settlement&match_id={$match_info.match_id}"> View match settlement</a>
    <br />
    <a href="index.php?site=edit_match_result&match_id={$match_info.match_id}"> Edit match result</a>
{/if}
{if $match_info.status == 1}
    <a href="index.php?site=confirm_match_result&match_id={$match_info.match_id}"> Edit match result</a>
    <br />
{/if}
<a href="index.php?site=upload_match_media&match_id={$match_info.match_id}"> Upload screenshot/demo</a>
<br />
<br />
Game: {$match_info.game_name} <br />
League: {$match_info.league_name}   <br />
Season: {$match_info.season_name}   <br />
Division: {$match_info.division_number}    <br />
<br />

Status:
{if $match_info.status < 2} Upcomming {/if}
{if $match_info.status == 2} Finished {/if}
{if $match_info.status == 3} Protest {/if}
<br /><br />

Match_media:
<br />
{foreach from=$match_media item=one_media}
    {$one_media.date}:&nbsp; by {$one_media.user_nick}: <a href="{$match_info.match_media_folder}/{$one_media.media_name}">{$one_media.media_description}</a>
    <br />
{/foreach}


{if $match_info.status == 2}
    Results:
    <br />
    {foreach from=$match_results item=one_result}
        {$one_result.map_name}:&nbsp;{$one_result.result_1}-{$one_result.result_2}
        <br />
    {/foreach}
{/if}

