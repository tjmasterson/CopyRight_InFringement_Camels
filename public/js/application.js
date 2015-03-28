$(document).ready(function() {
  $(".view_more").click(function(e){
    e.preventDefault();
    var button = $(this);


    $.ajax({
      url:"/",
      method: "get",
      success: function(response){
        var p = button.closest(".description");
        $("p").append(response);
      }
    })

  });
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
