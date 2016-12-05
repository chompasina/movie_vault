function search(){
  var $search = $("#search-bar")
  $search.on('keyup', function(){
    var $movies = $('.movie');
    var userInput = $search.val().toLowerCase();
    $movies.each(function(){
      var title = $(this).find(".title-field").text()
      var note = $(this).find(".note-field").text()
      if(title.toLowerCase().indexOf(userInput) === -1 && note.toLowerCase().indexOf(userInput) === -1){
        $(this).hide();
      } else {
        $(this).show();
      }
    });
  });
}