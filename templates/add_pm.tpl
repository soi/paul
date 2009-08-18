<h4>Send pm</h4>
<a href="index.php?site=pm_overview">my pm overview</a> <br />
<form method="post" action="index.php?site=complete_add_pm&to={$last_pm_info.to}">
    {if $last_pm_info.available == true}
        <h5>Last message from {$last_pm_info.nick}</h5>
        from: {$last_pm_info.date} <br />
        <p>
            {$last_pm_info.message}
        </p>    
    {/if}
    <br />
    <br />
    
    <h5>Message for {$last_pm_info.nick}</h5>
    <script>edToolbar('desc'); </script>
    <textarea name="message" id="desc" class="ed"></textarea> <br />
    <input type="submit" value="submit"/>
</form>