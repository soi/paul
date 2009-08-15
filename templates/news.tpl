{foreach from=$news item=one_news}
    <h4> {$one_news.title} </h4>
    <p>  {$one_news.text}</p>
    {$one_news.date} <br />
    by: {$one_news.creater}     
    {if $visitor_info.admin || $visitor_info.head_admin} <a href="index.php?site=edit_news&news_id={$one_news.news_id}">edit</a>{/if}
{/foreach}




