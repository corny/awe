$("#development_bar select").change(function(){
  $(this.form).find("input[type=submit]").click();
})
