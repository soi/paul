{foreach from=$guids item=one_guid}
    <a href="index.php?site=guid_details&guid_id={$one_guid.guid_id}">{$one_guid.name}</a>
    <br />
{/foreach}