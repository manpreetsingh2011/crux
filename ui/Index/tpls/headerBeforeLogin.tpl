<!DOCTYPE html>
<html lang="en" dir="ltr">
<script type="text/javascript" src="/library/jquery/js/jquery.js"></script>
<script type="text/javascript" src="/library/jquery/js/jqueryui.js"></script>
<link type="text/css" rel="stylesheet" href="/library/jquery/css/jqueryui.css">
<link rel="stylesheet" type="text/css" href="/ui/Index/css/main.css">

<div class="header-div" >
    <br>
    <form name="searchform" class="searchform" action="/search" method="get">
        <span class="header-left-div">
            <span class="main-logo-text"><a href="/">{$APP_NAME}</a></span>
        </span>
    <!--    <span class="header-middle-div">
            <input type="text" class="searchbox txtbox ui-widget" autocomplete="off" id="searchbox" name="q" placeholder="Search" value="{$SEARCH_KEY}">
            <input type="button" class="upload-button" onclick="window.location.href='/upload';" value="Upload">
        </span>
        <span class="header-right-div">
            <span class="side-main-link">
                <a id="upper-logout-link" href="/auth/logout">Logout</a>
            </span>
        </span> -->
    </form>
</div>
<div id="jquery-autocomplete-results">
    
</div>
<script>
    {literal}
    var searchDataSource = {
        Category : ['Strings', 'Arrays', 'Basic', 'Hashing', 'Linked List', 'Tree', 'Stack', 'Queue', 'Sorting', 'Searching', 'Graph', 'Mathematics'],
        Language : ['C Language', 'C++', 'Java', 'PHP', 'Python', 'JavaScript', 'Ruby', 'Scala', 'Microsoft C#'],
        User     : ['shekhar', 'shubham']    
    };
    
    var searchSuggestions = [];
    for (type in searchDataSource) {
        for (key in searchDataSource[type]) {
            searchSuggestions.push(type + ':' + searchDataSource[type][key]);
        }
    }
    searchSuggestions.sort();
    $( "#searchbox" ).autocomplete({
      source: searchSuggestions,
      appendTo : '#jquery-autocomplete-results',
      position: {my:'right top', at:'center'},
      select: function( event, ui ) {
        $('.searchform').submit();
      }
    });
    {/literal}
</script>
<script type="text/javascript" src="/ui/Index/js/header.js"></script>