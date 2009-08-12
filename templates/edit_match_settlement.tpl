<form action="index.php?site=complete_edit_match_settlement&match_id={$match_settlement_info.match_id}" method="post">
<h5>Date</h5>
<select name="day">
    <option value="1" {if $match_settlement_info.date|date_format:"%d" == 1} selected {/if}>1</option>
    <option value="2" {if $match_settlement_info.date|date_format:"%d" == 2} selected {/if}>2</option>
    <option value="3" {if $match_settlement_info.date|date_format:"%d" == 3} selected {/if}>3</option>
    <option value="4" {if $match_settlement_info.date|date_format:"%d" == 4} selected {/if}>4</option>
    <option value="5" {if $match_settlement_info.date|date_format:"%d" == 5} selected {/if}>5</option>
    <option value="6" {if $match_settlement_info.date|date_format:"%d" == 6} selected {/if}>6</option>
    <option value="7" {if $match_settlement_info.date|date_format:"%d" == 7} selected {/if}>7</option>
    <option value="8" {if $match_settlement_info.date|date_format:"%d" == 8} selected {/if}>8</option>
    <option value="9" {if $match_settlement_info.date|date_format:"%d" == 9} selected {/if}>9</option>
    <option value="10" {if $match_settlement_info.date|date_format:"%d" == 10} selected {/if}>10</option>
    <option value="11" {if $match_settlement_info.date|date_format:"%d" == 11} selected {/if}>11</option>
    <option value="12" {if $match_settlement_info.date|date_format:"%d" == 12} selected {/if}>12</option>
    <option value="13" {if $match_settlement_info.date|date_format:"%d" == 13} selected {/if}>13</option>
    <option value="14" {if $match_settlement_info.date|date_format:"%d" == 14} selected {/if}>14</option>
    <option value="15" {if $match_settlement_info.date|date_format:"%d" == 15} selected {/if}>15</option>
    <option value="16" {if $match_settlement_info.date|date_format:"%d" == 16} selected {/if}>16</option>
    <option value="17" {if $match_settlement_info.date|date_format:"%d" == 17} selected {/if}>17</option>
    <option value="18" {if $match_settlement_info.date|date_format:"%d" == 18} selected {/if}>18</option>
    <option value="19" {if $match_settlement_info.date|date_format:"%d" == 19} selected {/if}>19</option>
    <option value="20" {if $match_settlement_info.date|date_format:"%d" == 20} selected {/if}>20</option>
    <option value="21" {if $match_settlement_info.date|date_format:"%d" == 21} selected {/if}>21</option>
    <option value="22" {if $match_settlement_info.date|date_format:"%d" == 22} selected {/if}>22</option>
    <option value="23" {if $match_settlement_info.date|date_format:"%d" == 23} selected {/if}>23</option>
    <option value="24" {if $match_settlement_info.date|date_format:"%d" == 24} selected {/if}>24</option>
    <option value="25" {if $match_settlement_info.date|date_format:"%d" == 25} selected {/if}>25</option>
    <option value="26" {if $match_settlement_info.date|date_format:"%d" == 26} selected {/if}>26</option>
    <option value="27" {if $match_settlement_info.date|date_format:"%d" == 27} selected {/if}>27</option>
    <option value="28" {if $match_settlement_info.date|date_format:"%d" == 28} selected {/if}>28</option>
    <option value="29" {if $match_settlement_info.date|date_format:"%d" == 29} selected {/if}>29</option>
    <option value="30" {if $match_settlement_info.date|date_format:"%d" == 30} selected {/if}>30</option>
    <option value="31" {if $match_settlement_info.date|date_format:"%d" == 31} selected {/if}>31</option>    
</select>
<select name="month">
    <option value="1" {if $match_settlement_info.date|date_format:"%m" == 1} selected {/if}>1</option>
    <option value="2" {if $match_settlement_info.date|date_format:"%m" == 2} selected {/if}>2</option>
    <option value="3" {if $match_settlement_info.date|date_format:"%m" == 3} selected {/if}>3</option>
    <option value="4" {if $match_settlement_info.date|date_format:"%m" == 4} selected {/if}>4</option>
    <option value="5" {if $match_settlement_info.date|date_format:"%m" == 5} selected {/if}>5</option>
    <option value="6" {if $match_settlement_info.date|date_format:"%m" == 6} selected {/if}>6</option>
    <option value="7" {if $match_settlement_info.date|date_format:"%m" == 7} selected {/if}>7</option>
    <option value="8" {if $match_settlement_info.date|date_format:"%m" == 8} selected {/if}>8</option>
    <option value="9" {if $match_settlement_info.date|date_format:"%m" == 9} selected {/if}>9</option>
    <option value="10" {if $match_settlement_info.date|date_format:"%m" == 10} selected {/if}>10</option>
    <option value="11" {if $match_settlement_info.date|date_format:"%m" == 11} selected {/if}>11</option>
    <option value="12" {if $match_settlement_info.date|date_format:"%m" == 12} selected {/if}>12</option>
</select>
<select name="year">
    <option value="2009" {if $match_settlement_info.date|date_format:"%Y" == 2009} selected {/if}>2009</option>
    <option value="2010" {if $match_settlement_info.date|date_format:"%Y" == 2010} selected {/if}>2010</option>
</select>
&nbsp;&nbsp;&nbsp;
<select name="hour">
    <option value="00" {if $match_settlement_info.date|date_format:"%H" == 00} selected {/if}>0</option>
    <option value="01" {if $match_settlement_info.date|date_format:"%H" == 01} selected {/if}>1</option>
    <option value="02" {if $match_settlement_info.date|date_format:"%H" == 02} selected {/if}>2</option>
    <option value="03" {if $match_settlement_info.date|date_format:"%H" == 03} selected {/if}>3</option>
    <option value="04" {if $match_settlement_info.date|date_format:"%H" == 04} selected {/if}>4</option>
    <option value="05" {if $match_settlement_info.date|date_format:"%H" == 05} selected {/if}>5</option>
    <option value="06" {if $match_settlement_info.date|date_format:"%H" == 06} selected {/if}>6</option>
    <option value="07" {if $match_settlement_info.date|date_format:"%H" == 07} selected {/if}>7</option>
    <option value="08" {if $match_settlement_info.date|date_format:"%H" == 08} selected {/if}>8</option>
    <option value="09" {if $match_settlement_info.date|date_format:"%H" == 09} selected {/if}>9</option>
    <option value="10" {if $match_settlement_info.date|date_format:"%H" == 10} selected {/if}>10</option>
    <option value="11" {if $match_settlement_info.date|date_format:"%H" == 11} selected {/if}>11</option>
    <option value="12" {if $match_settlement_info.date|date_format:"%H" == 12} selected {/if}>12</option>
    <option value="13" {if $match_settlement_info.date|date_format:"%H" == 13} selected {/if}>13</option>
    <option value="14" {if $match_settlement_info.date|date_format:"%H" == 14} selected {/if}>14</option>
    <option value="15" {if $match_settlement_info.date|date_format:"%H" == 15} selected {/if}>15</option>
    <option value="16" {if $match_settlement_info.date|date_format:"%H" == 16} selected {/if}>16</option>
    <option value="17" {if $match_settlement_info.date|date_format:"%H" == 17} selected {/if}>17</option>
    <option value="18" {if $match_settlement_info.date|date_format:"%H" == 18} selected {/if}>18</option>
    <option value="19" {if $match_settlement_info.date|date_format:"%H" == 19} selected {/if}>19</option>
    <option value="20" {if $match_settlement_info.date|date_format:"%H" == 20} selected {/if}>20</option>
    <option value="21" {if $match_settlement_info.date|date_format:"%H" == 21} selected {/if}>21</option>
    <option value="22" {if $match_settlement_info.date|date_format:"%H" == 22} selected {/if}>22</option>
    <option value="23" {if $match_settlement_info.date|date_format:"%H" == 23} selected {/if}>23</option>    
</select>
:
<select name="minute">
    <option value="00" {if $match_settlement_info.date|date_format:"%M" == 00} selected {/if}>00</option>
    <option value="15" {if $match_settlement_info.date|date_format:"%M" == 15} selected {/if}>15</option>
    <option value="30" {if $match_settlement_info.date|date_format:"%M" == 30} selected {/if}>30</option>
    <option value="45" {if $match_settlement_info.date|date_format:"%M" == 45} selected {/if}>45</option>
</select>
<br /> <br />
<h5>Map of {$match_info.team_name_1}  {if $match_settlement_info.map_id_1 == 0} (not selected yet) {/if}</h5>
{if $visitor_info.admin || $visitor_info.admin || $match_settlement_info.user_team_id == $match_info.team_id_1 } 
    <select name="map_id_1">
        {foreach from=$league_maps item=one_map}
            <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_id_1} selected {/if}">{$one_map.map_name}</option>
        {/foreach}
    </select>
    <br /> <br />
{else}
    {$match_settlement_info.map_name_1}
{/if}
<h5>Map of {$match_info.team_name_2} {if $match_settlement_info.map_id_2 == 0} (not selected yet) {/if}</h5>
{if $visitor_info.admin || $visitor_info.admin || $match_settlement_info.user_team_id == $match_info.team_id_2}
    <select name="map_id_2">
        {foreach from=$league_maps item=one_map}
            <option value="{$one_map.map_id}" {if $one_map.map_id == $match_settlement_info.map_id_2} selected {/if}">{$one_map.map_name}</option>
        {/foreach}
    </select>
{else}
    {$match_settlement_info.map_name_2}
{/if}
<br /><br />
<h5>Chat (max. 100 characters)</h5>
<textarea name="chat"></textarea>
<br /><br />
<input type="submit" name="submit" value="Set the settlement"/>
<br /><br />
Log: <br /> 
{foreach from=$match_settlement_log item=one_log}
    {$one_log.date}:&nbsp;{$one_log.message} <br />
{/foreach}
</form>