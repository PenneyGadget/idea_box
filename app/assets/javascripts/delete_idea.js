var deleteIdea = function(){
  $('#latest-ideas').delegate('#delete-idea', 'click', function(){
    var $idea = $(this).closest('.idea');

    $.ajax({
      type: 'DELETE',
      url: '/api/v1/ideas/' + $idea.attr('idea-id'),
      success: function(){
        $idea.remove();
      },
      error: function(xhr){
        console.log(xhr.responseText);
      }
    });
  });
};
