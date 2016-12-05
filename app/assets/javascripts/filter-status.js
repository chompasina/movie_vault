function filter(){
  $('.filter-by-status').on('click', function(e){
    var clicked = e.target;
    var clickedFilter = $(clicked).text();
    var clickedFilter = clickedFilter === "Watched" ? true : false;
    var $movies = $('.movie');
    $movies.each(function(){
      var status = ($(this).data("status"));
      if(status !== clickedFilter){
        $(this).hide();
      } else {
        $(this).show();
      }
    })
  })
}