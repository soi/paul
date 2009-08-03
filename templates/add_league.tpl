<form method="post" action="index.php?site=complete_add_league">
    <h5 id="login_subhl">League Name</h4>
    <input type="text" name="name"/>
    <h5 id="login_subhl">Related Game</h4>
    <select name="game_id">
        {foreach from=$games item=one_game}
            <option value="{$one_game.game_id}">{$one_game.name}</option>
        {/foreach}       
    </select>
    <br />
    <input type="submit" value="Add"/>
</form>