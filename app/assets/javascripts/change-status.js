function changeStatus(){
  $('#movies-list').on('click', '#toggle-movie-status', function(e){
    console.log("hit")
    var button = e.target;
    toggleStatus(button);
  });
}

function toggleStatus(button){
  var status = $(button).data('status');
  console.log(status)
  var newStatus = (!status);
  console.log(newStatus);
  storeNewStatus(button, newStatus);
}

function storeNewStatus(button, newStatus){
  var movieId = $(button).data('id')
    $.ajax({
      method: "PUT",
      url: "/api/v1/movies/" + movieId + '.json',
      data: {id: movieId, watched: newStatus},
      success: function(){
        var id = $(button).data('id');
        var row = $('.movie-row[data-id="' + id +'"]');
        updateButton(id, row);
      }
    })
}

function updateButton(id, row){
  var $button = $('.button[data-id="' + id + '"]')
  var $title = $('.title-field[data-id="' + id + '"]')
  var $movieWatched = $('#movie-status-'+ id + '' )
  if($button.text() === 'Mark as Unwatched'){
      $button.text("Mark as Watched");
      $movieWatched.text("Watched? false");
      $title[0].style['cssText'] = 'text-decoration: none;'
  } else {
    $button.text("Mark as Unwatched");
    $title[0].style['cssText'] = 'text-decoration: line-through;';
    $movieWatched.text("Watched? true")
  }
}