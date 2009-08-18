<h4>Show Pm</h4>
<a href="index.php?site=user&user_id={$pm_info.from}">{$pm_info.nick_sender}</a> -> <a href="index.php?site=user&user_id={$pm_info.to}">{$pm_info.nick_receiver}</a>
<br />
date: {$pm_info.date}
<br />
message {$pm_info.message}
<br />
{if $visitor_info.user_id == $pm_info.to}
    <a href="index.php?site=add_pm&to={$pm_info.from}">answer</a>
{/if}
{if $visitor_info.user_id == $pm_info.from}
    <a href="index.php?site=add_pm&to={$pm_info.to}">write another</a>
{/if}
