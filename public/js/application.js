$(document).ready(function() {
  $(".view_more").click(function(e){
    e.preventDefault();

    var $container = $(e.target).closest("#individual_survey");
    var viewMore = "view more";
    var viewLess = "view less";

    var moreLess = $container.find("a.view_more");
    $(".description").css("hidden");
    $(moreLess).text(viewMore);
    var desc = $container.find(".description");

    $(desc).toggle(function(){
      $(moreLess).text(viewLess);
    });


    // $.ajax({
    //   url:"/",
    //   method: "get",
    //   success: function(response){

    //     // var $desc = $container.find(".description");
    //     // $desc.html(response);
    //     // var $currClass = $container.find(".view_more")
    //     // $currClass.text("view less");
    //     // $currClass.attr("class", "view_less");
    //   }
    // });

  });

});
