{foreach from=$games item=one_game} 
    <a href="index.php?site=game_details&game_id={$one_game.game_id}">{$one_game.name}</a>
    <br />
{/foreach}