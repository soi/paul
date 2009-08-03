<form action="index.php?site=complete_edit_match_settlement&match_settlement_id={$match_settlement_info.match_settlement_id}&team_id={$match_settlement_info.user_team_id}" method="post">
<h5>Date</h5>
<input type="input" name="date" value="{$match_settlement_info.date}"/>
<br /> <br />
<h5>Map of {$match_info.team_name_1} {if $match_settlement_info.map_id_1 == 0} (not selected yet) {/if}</h5> 
<select name="map_id_1">
    {foreach from=$league_maps item=one_map}
        <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_1_id} selected {/if}">{$one_map.map_name}</option>
    {/foreach}
</select>
<br /> <br />
<h5>Map of {$match_info.team_name_2} {if $match_settlement_info.map_id_2 == 0} (not selected yet) {/if}</h5>
<select name="map_id_1">
    {foreach from=$league_maps item=one_map}
        <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_1_id} selected {/if}">{$one_map.map_name}</option>
    {/foreach}
</select>
<br /><br />
<h5>Chat (max. 140 characters)</h5>
<textarea> </textarea>
<br /><br />
<input type="submit" name="submit" value="Set the settlement"/>
</form>