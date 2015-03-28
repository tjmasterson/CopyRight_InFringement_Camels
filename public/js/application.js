$(document).ready(function() {
  $(".view_more").click(function(e){
    e.preventDefault();

    var button = $(this);
    var $container = $(e.target).closest("td");


    $.ajax({
      url:"/",
      method: "get",
      success: function(response){
        $container.html(response);
        var $desc = $container.find(".description");
        $desc.append(response);
        // var p = container.find("p");
       // console.log(button.find(".description"))
       //  $(".view_more").text("view less");
      }
    })

  });
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
