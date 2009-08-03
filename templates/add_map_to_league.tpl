<h4>Add map to league {$league_info.name}</h4>
<form action="index.php?site=complete_add_map_to_league&league_id={$league_info.league_id}" method="post">
<select name="map_id">
    {foreach from=$maps item=one_map}
        <option value="{$one_map.map_id}">{$one_map.map_name}</option>    
    {/foreach}
</select>
<br />
<input type="submit" name="submit" value="add map"/>
</form>