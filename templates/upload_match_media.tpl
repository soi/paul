<h3>Upload match media</h3>
{$match_info.team_name_1} vs {$match_info.team_name_2}<br />
<form action="index.php?site=complete_upload_match_media&match_id={$match_info.match_id}" method="post" enctype="multipart/form-data">
    <h5>Description</h5>
    <input type="text" name="description" size="10" value="screen"/> &nbsp;&nbsp;
    <h5>File</h5>
    <input type="file" value="" name="match_media"/> <br />
    <input type="submit" value="submit"/>
</form>