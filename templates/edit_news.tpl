<h4>Edit news</h4>
<form method="post" action="index.php?site=complete_edit_news&news_id={$news_info.news_id}">
    <h5>Title</h5>
    <input type="text" name="title" value="{$news_info.title}" size="46"/>
    <h5>Text</h5>
    <script>edToolbar('desc'); </script>
    <textarea name="text" id="desc" class="ed">{$news_info.text}</textarea> <br />
    <input type="submit" value="submit"/>
</form>