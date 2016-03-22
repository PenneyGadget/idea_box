function createIdea(){
  $('#create-idea').on('click', function(){
    var ideaTitle = $('#idea-title').val();
    var ideaDescription = $('#idea-description').val();

    var ideaParams = {
      idea: {
        title: ideaTitle,
        body: ideaDescription
      }
    };

    $('#idea-title').val('');
    $('#idea-description').val('');

    $.ajax({
      type: 'POST',
      url: '/api/v1/ideas.json',
      data: ideaParams,
      success: function(idea){
        renderIdea(idea);
      }
    });
  });
}
