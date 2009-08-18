<h4>Pm Overview</h4>
<br />
<h5>Received</h5> 
{foreach from=$pm_received item=one_pm}
    <a href="index.php?site=pm&pm_id={$one_pm.pm_id}">
        {if $one_pm.read == 0} <b> {$one_pm.nick}:{$one_pm.date} </b>
        {else}  {$one_pm.nick}:{$one_pm.date}
        {/if}
    </a>
    <br />
    message: {$one_pm.message}
    <br />       
    <a href="index.php?site=add_pm&to={$one_pm.from}">answer</a> 
    <br />
    <br />
{/foreach}
<br />
<h5>Send</h5> 
{foreach from=$pm_send item=one_pm}
    <a href="index.php?site=pm&pm_id={$one_pm.pm_id}">
          {$one_pm.nick}:{$one_pm.date}
    </a>
    <br />
    message: {$one_pm.message}
    <br />
    <a href="index.php?site=add_pm&to={$one_pm.to}">write another</a>
    <br />
    <br />
{/foreach}
