$(function(){
  $(".flash").prepend("<button>close</button>");
  $(".flash button").click(function(){
    $(this).closest(".flash").fadeOut();
    $(this).remove();
  });
})
