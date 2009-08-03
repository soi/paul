<form method="post" action="index.php?site=complete_add_game">
    <h5 id="login_subhl">Game Name</h4>
    <input type="text" name="name"/>
    <h5 id="login_subhl">Related GUID</h4>
    <select name="guid_id">
        {foreach from=$guids item=one_guid}
            <option value="{$one_guid.guid_id}">{$one_guid.name}</option>
        {/foreach}
    </select>
    <a href="index.php?site=add_guid">Insert new GUID</a> 
    <br />
    <input type="submit" value="Add"/>
</form>