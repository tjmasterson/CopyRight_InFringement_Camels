$(document).ready(function() {
  $(".view_more").click(function(e){
    e.preventDefault();

    var $container = $(e.target).closest(".individual_survey");

    var moreLess = $container.find("a.view_more");

    var desc = $container.find(".description");
    var $desc = $(desc); //this is caching the search for desc

    $desc.slideToggle(function(){
        if ($desc.is(":visible")) {
            $(moreLess).text("view less");
        }
        else {
            $(moreLess).text("view more");
        }
    });
  });
    $(".add_question").click(function(e){
        e.preventDefault();
        var button = $(this);

        var request = $.ajax({
            url: button.attr("href"),
            method: "POST",
            data: button.serialize()
          });

        request.done(function(response){
            var content = response;
            console.log(content)
            $(".survey_creation").append(content.form);
        });

    });

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
