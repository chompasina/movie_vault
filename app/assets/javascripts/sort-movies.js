function sort(){
  $('.sort-button').on('click', function(e){
    var $table = $('table')
    var movies = $('.movie');
    movies.sort(function(a, b){
      return $(a).children("td.title-field").text().toUpperCase().localeCompare($(b).children("td.title-field").text().toUpperCase());
    })
    $.each(movies, function(_i, movie) { $table.append(movie); });
  });
}