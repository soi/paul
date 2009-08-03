<form method="post" action="index.php?site=complete_edit_game&game_id={$game_info.game_id}">
    <h5 id="login_subhl">Game Name</h4>
    <input type="text" name="name" value="{$game_info.name}"/>
    <h5 id="login_subhl">Related GUID</h4>
    <select name="guid_id">
        {foreach from=$guids item=one_guid}
            <option value="{$one_guid.guid_id}" {if $one_guid.guid_id == $game_info.guid_id} selected {/if}> {$one_guid.name}</option>
        {/foreach}
    </select>
    <a href="index.php?site=edit_guid">Insert new GUID</a>
    <br />
    <textarea name="description">{$game_info.description}</textarea> <br />
    <input type="submit" value="edit"/>
</form>