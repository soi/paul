<form action="index.php?site=complete_add_head_admin" method="post">
    <h5>Select Admin</h5>
    <select name="user_id">
        {foreach from=$admins item=one_admin }
            <option value="{$one_admin.user_id}">{$one_admin.nick}</option>
        {/foreach}   
    </select>
    <br />
    <input type="submit" value="Make him head admin"/>
</form>