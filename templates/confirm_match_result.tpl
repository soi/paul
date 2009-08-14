<form action="index.php?site=complete_confirm_match_result&match_id={$match_info.match_id}" method="post">
    Your oponent has set the following results. You can confirm it here or open a protest ticket.
    {foreach from=$match_results item=one_result}
        {$one_result.map_name}:&nbsp;{$one_result.result_1}-{$one_result.result_2}
        <br />
    {/foreach}
    <input type="submit" value="confirm"/>
</form>