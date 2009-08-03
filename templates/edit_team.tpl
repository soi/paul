<form method="post" action="index.php?site=complete_edit_team&team_id={$team_info.team_id}">
    <h5 id="login_subhl">Name</h4>
    <input type="text" name="name" size="29" value="{$team_info.name}"/><br /> <br />
    <h5 id="login_subhl">Shorthandle</h4>
    <input type="text" name="shorthandle" size="29" value="{$team_info.shorthandle}"/><br /> <br />
    <h5 id="login_subhl">Description</h4>
    <textarea name="description">{$team_info.description}</textarea>
    <h5 id="login_subhl">Join Password</h4>
    <input type="text" name="join_password" size="29" value="{$team_info.join_password}"/><br /> <br />
    <table border="0">
        {foreach from=$team_players item=one_player name=player_loop}
            <tr>
                <td>
                    <a href="index.php?site=user&user_id={$one_player.user_id}">{$one_player.nick}</a> 
                </td>
                <td>
                    <select name="players-{$one_player.user_id}-team_status_type_id">
                        {foreach from=$team_status_types item=one_team_status_type }
                            <option value="{$one_team_status_type.team_status_type_id}" {if $one_team_status_type.team_status_type_id == $one_player.team_status_type_id} selected {/if} >
                                {$one_team_status_type.status_name}
                            </option>
                        {/foreach}
                    </select>
                </td>
                <td>
                    <input type="checkbox" name="players-{$one_player.user_id}-admin_permission" {if $one_player.admin_permission == 1} checked {/if}/>     
                </td>
                <td>
                    <input type="checkbox" name="players-{$one_player.user_id}-write_permission" {if $one_player.write_permission == 1} checked {/if}/>
                </td>                           
            </tr>
            
        {/foreach}
    </table>
    
    <input type="submit" value="Edit" size="15"/>

</form>




