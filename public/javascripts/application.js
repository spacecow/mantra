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

/*
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  var x1,x2,y1,y2;
  x1 = -10;
  $(document).mousedown(function(e) {
    if( e.pageX >= 47 && e.pageX <= 442 && e.pageY >= 92 && e.pageY <= 720 ){
      if( x1 < 0 ){
        $("#current").attr({ id: '' })
        box = $('<div style="border:1px #FF00FF solid;position:fixed;">').hide();
        $(document.body).append(box);
        x1 = e.pageX;
        y1 = e.pageY;
        $("#translation_x1").val(x1);
        $("#translation_y1").val(y1);
        box.attr({id: 'current'}).css({
          top: e.pageY , //offsets
          left: e.pageX //offsets
        }).fadeIn();
      }
      else{
        $("#current").attr({ id: ''})
        $("#translation_x2").val(e.pageX);
        $("#translation_y2").val(e.pageY);
        x1 = -10;
        //window.location.reload();
      }
    }
  });
  $(document).mousemove(function(e) {
    $("#current").css({
      width:Math.abs(Math.min(e.pageX,442) - x1), //offsets
      height:Math.abs(Math.min(e.pageY,770) - y1),//offsets
      'border-radius':Math.abs(Math.abs(e.pageX - x1) / 2),
      '-moz-border-radius':Math.abs(Math.abs(e.pageX - x1) / 2),
      '-webkit-border-radius':Math.abs(Math.abs(e.pageX - x1) / 2)
    }).fadeIn();
  });
  //  $(document).mouseup(function() {

  // });
});
*/
