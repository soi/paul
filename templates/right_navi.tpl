hello {$visitor_info.nick}
{if $visitor_info.admin == true} <a href="index.php?site=admin_menu">admin menu</a> {/if}
{if $visitor_info.head_admin == true} <a href="index.php?site=head_admin_menu">head admin menu</a> {/if}