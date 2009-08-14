<form action="index.php?site=complete_edit_match_result&match_id={$match_settlement_info.match_id}" method="post">
    <table>
        <th>&nbsp;</th>
        <th>{$match_info.team_name_1}</th>
        <th>{$match_info.team_name_2}</th>
        <tr>
            <td>{$match_settlement_info.map_name_1}</td>
            <td><input type="text" name="result_1_1" size="5"/></td>
            <td><input type="text" name="result_1_2" size="5"/></td>
        </tr>
        <tr>
            <td>{$match_settlement_info.map_name_2}</td>
            <td><input type="text" name="result_2_1" size="5"/></td>
            <td><input type="text" name="result_2_2" size="5"/></td>
        </tr>
    </table>
    <input type="submit" value="Edit result"/>
</form>

