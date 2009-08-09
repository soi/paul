<form action="index.php?site=complete_edit_match_settlement&match_id={$match_settlement_info.match_id}" method="post">
<h5>Date</h5>
<input type="input" name="date" value="{$match_settlement_info.date}"/>     &nbsp;&nbsp;
<select name="time_id">
    <option value="1" {if $match_settlement_info.time_id == 1} selected {/if}">16:00</option>
    <option value="2" {if $match_settlement_info.time_id == 2} selected {/if}>16:30</option>
    <option value="3" {if $match_settlement_info.time_id == 3} selected {/if}>17:00</option>
    <option value="4" {if $match_settlement_info.time_id == 4} selected {/if}>17:30</option>
    <option value="5" {if $match_settlement_info.time_id == 5} selected {/if}>18:00</option>
    <option value="6" {if $match_settlement_info.time_id == 6} selected {/if}>18:30</option>
    <option value="7" {if $match_settlement_info.time_id == 7} selected {/if}>19:00</option>
    <option value="8" {if $match_settlement_info.time_id == 8} selected {/if}>19:30</option>
    <option value="9" {if $match_settlement_info.time_id == 9} selected {/if}>20:00</option>
    <option value="10" {if $match_settlement_info.time_id == 10} selected {/if}>20:30</option>
    <option value="11" {if $match_settlement_info.time_id == 11} selected {/if}>21:00</option>
    <option value="12" {if $match_settlement_info.time_id == 12} selected {/if}>21:30</option>
    <option value="13" {if $match_settlement_info.time_id == 13} selected {/if}>22:00</option>
    <option value="14" {if $match_settlement_info.time_id == 14} selected {/if}>22:30</option>
    <option value="15" {if $match_settlement_info.time_id == 15} selected {/if}>23:00</option>
    <option value="16" {if $match_settlement_info.time_id == 16} selected {/if}>23:30</option>
    <option value="17" {if $match_settlement_info.time_id == 17} selected {/if}>0:00</option>
    <option value="18" {if $match_settlement_info.time_id == 18} selected {/if}>0:30</option>    
</select>
<br /> <br />
<h5>Map of {$match_info.team_name_1} {if $match_settlement_info.map_id_1 == 0} (not selected yet) {/if}</h5> 
<select name="map_id_1">
    {foreach from=$league_maps item=one_map}
        <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_id_1} selected {/if}">{$one_map.map_name}</option>
    {/foreach}
</select>
<br /> <br />
<h5>Map of {$match_info.team_name_2} {if $match_settlement_info.map_id_2 == 0} (not selected yet) {/if}</h5>
<select name="map_id_2">
    {foreach from=$league_maps item=one_map}
        <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_id_2} selected {/if}">{$one_map.map_name}</option>
    {/foreach}
</select>
<br /><br />
<h5>Chat (max. 100 characters)</h5>
<textarea name="chat"></textarea>
<br /><br />
<input type="submit" name="submit" value="Set the settlement"/>
<br /><br />
Log: <br /> 
{foreach from=$match_settlement_log item=one_log}
    {$one_log.date}:&nbsp;{$one_log.message} <br />
{/foreach}
</form>