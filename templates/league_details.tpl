Name: {$league_info.name} <br />
Description: {$league_info.description} <br />

<a href="index.php?site=edit_league&league_id={$league_info.league_id}">Edit Details</a> <br /> 
{if $league_info.in_sign_up} <a href="index.php?site=join_league&league_id={$league_info.league_id}">Sign Up NOW!</a> <br /><br />{/if}

News: <br />
{foreach from=$league_news item=one_news}
    <a href="index.php?site=news_details&news_id={$one_news.news_id}">{$one_news.title}</a> <br />
    <p>
        {$one_news.text}    
    </p>
{/foreach}
<br />

Seasons: <br />
{foreach from=$league_seasons item=one_season}
    <a href="index.php?site=season_details&season_id={$one_season.season_id}">Season {$one_season.number}</a> <br />
{/foreach}