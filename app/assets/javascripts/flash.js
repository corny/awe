$(function(){
  $(".flash").each(function(){
    var flash = $(this).closest(".flash");
    window.setTimeout(function(){
      flash.fadeOut();
    }, 1500)
  });
})
