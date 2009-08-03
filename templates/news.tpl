<div id="news_main_wrap">
    {foreach from=$news item=one_news}
        <div class="news_wrap" align="left">
            <h4> {$one_news.title} </h4>
            <p>  {$one_news.text}</p>
            {$one_news.date} <br />
            by: {$one_news.creater}
        </div>        
    {/foreach}
</div>



