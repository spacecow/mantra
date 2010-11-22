// focus on the first text input field in the first field on the page
$(function(){
  $(":text:visible:enabled:first").focus();
});


$(function(){
  $("div#mangas div.pagination a").live("click", function(){
    $.getScript(this.href);
    return false;
  });
  $("form#manga_search input").keyup(function(){
    $.get($("form#manga_search").attr("action"), $("form#manga_search").serialize(), null, "script");
    return false;
  });
});
