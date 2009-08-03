<form method="post" action="index.php?site=complete_add_user_guid">
    <h5 id="login_subhl">GUID Type</h4>
    <select name="guid_id">
        {foreach from=$guids item=one_guid}
            <option value="{$one_guid.guid_id}">{$one_guid.name}</option>
        {/foreach}
    </select>
    <br />
    <h5 id="login_subhl">GUID</h4>
    <input type="input" name="guid" size="40" />
    <br />
    <input type="submit" value="Add"/>
</form>