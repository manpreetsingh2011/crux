{include file="ui/Index/tpls/header.tpl"}
<head>
  <meta charset="utf-8">
  <title>Code Me</title>
  <link rel="stylesheet" type="text/css" href="/ui/Index/css/index.css">
  <script src="/library/jquery/js/jquery.tablesorter.min.js" type="text/javascript"></script>
  {literal}
    <script>
    $(document).ready(function() { 
        $(".listview-table").tablesorter(); 
    });
  {/literal}
  </script>
</head>
<body>
        <table cellspacing="0" class="listview-table tablesorter">
           <thead>
               <tr>
                    <th scope="col" class="nobg">Language</th>
                    <th scope="col">Category</th>
                    <th scope="col">Title</th>
                    <th scope="col">Description</th>
                    <th scope="col">Level</th>
                    <th scope="col">Verified</th>
                    <th scope="col">Uploaded By</th>
                    <th scope="col">Uploaded On</th>
                    
               </tr>
           </thead>
           <tbody>
           {foreach from=$PROGRAM_LIST item=program}
                <tr>
                   <td class="alt"><a target="_blank" href="/{$program.fk_language}">{$program.language_name}</a></td>
                   <td class="alt"><a target="_blank" href="/{$program.fk_language}/{$program.fk_category}">{$program.category_name}</a></td>
                   <td class="alt"><a target="_blank" href="/{$program.fk_language}/{$program.fk_category}/{$program.id}">{$program.title}<a/></td>
                   <td class="alt">{$program.description|nl2br}</td>
                   <td class="alt">{$program.level}</td>
                   <td class="alt">
                        {if $program.is_verified eq '1'}
                            Yes
                        {else}
                            No
                        {/if}
                   </td>
                   <td class="alt">{$program.created_by}</td>
                   <td class="alt">{$program.created_on|date_format:"%d %b %Y"}</td>
                </tr>
           {/foreach}
           </tbody>
        </table>
    {include file="ui/Index/tpls/footer.tpl"}
 </body>