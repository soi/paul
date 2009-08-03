<a href="index.php?site=add_season&league_id={$league_info.league_id}">Start new Season</a>
<br />
<a href="index.php?site=add_map_to_league&league_id={$league_info.league_id}">Add Map to League</a> <br />
<br />
<br />

<form method="post" action="index.php?site=complete_edit_league&league_id={$league_info.league_id}">
    <h5 id="login_subhl">League Name</h4>
    <input type="text" name="name" value="{$league_info.name}"/>
    <h5 id="login_subhl">Related Game</h4>
    <select name="game_id">
        <option value="{$league_info.game_id}">{$league_info.game_name}</option>
        {foreach from=$games item=one_game}
            <option value="{$one_game.game_id}">{$one_game.name}</option>
        {/foreach}
    </select>
    <br />
    <h5 id="login_subhl">Maps played per matchday</h4>
    <select name="map_count">
        <option value="1" {if $league_info.map_count == 1} selected {/if}>1 map</option>
        <option value="2" {if $league_info.map_count == 2} selected {/if}>2 maps</option>
    </select>
    <br />
    <h5 id="login_subhl">Maximum Teams per Division</h4>
    <input type="text" name="max_teams_div" value="{$league_info.max_teams_div}"/>
    <br />
    <h5 id="login_subhl">Minimum Players per Team</h4>
    <input type="text" name="min_players_team" value="{$league_info.min_players_team}"/>
    <br />
    <h5 id="login_subhl">In Sign Up</h4>
    <input type="checkbox" name="in_sign_up" {if $league_info.in_sign_up == 1} checked {/if}/>
    <br />
    <h5 id="login_subhl">Description</h4>
    <textarea name="description">{$league_info.description}</textarea>
    <br />
    <input type="submit" value="edit"/>
</form>