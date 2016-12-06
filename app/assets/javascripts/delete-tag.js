function deleteTag(){
  $('.delete-tag').on('click', function(e){
    var tag = e.target
    var tagId = $(tag).data('id')
    var movieTagId = $(tag)[0].id.trim()
    $.ajax({
      method: "DELETE",
      url: "api/v1/movie_tags/" + movieTagId,
      dataType: "json",
      success: removeMovieTag(tag)
    });
  });
}

function removeMovieTag(button){
  $(button).prev().remove();
  $(button).remove();
}