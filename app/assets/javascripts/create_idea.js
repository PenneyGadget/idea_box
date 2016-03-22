var createIdea = function(){
  $('#create-idea').on('click', function(){
    var ideaParams = {
      idea: {
        title: $('#idea-title').val(),
        body: $('#idea-description').val()
      }
    };

    $('#idea-title').val('');
    $('#idea-description').val('');

    $.ajax({
      type: 'POST',
      url: '/api/v1/ideas',
      data: ideaParams,
      success: function(idea){
        renderIdea(idea);
      }
    });
  });
};
