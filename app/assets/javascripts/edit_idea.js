var editIdea = function(){
  $('#latest-ideas').delegate('#edit-idea', 'click', function(){
    var $idea = $(this).closest('.idea');
    var $oldTitle = $idea.find('.idea-title').text();
    var $oldDescription = $idea.find('.idea-body').text();

    $idea.append(
      "<div class='form-group edit-form'>" +
      "<label for='new-idea-title'>title:</label>" +
      "<input class='form-control' type='text' id='new-idea-title' value='" + $oldTitle + "'>" +
      "<label for='new-idea-description'>description:</label>" +
      "<input class='form-control' type='text' id='new-idea-description' value='" + $oldDescription + "'>" +
      "<br>" +
      "<button id='update-idea' name='button-edit' class='btn btn-default'>Save this new better version</button>" +
      "</div>"
    );
  });
};

var updateIdea = function(idea){
  $('#latest-ideas').delegate('#update-idea', 'click', function(){
    var $idea = $(this).closest('.idea');
    var $oldTitle = $idea.find('.idea-title');
    var $oldDescription = $idea.find('.idea-body');
    var $newTitle = $idea.find('#new-idea-title').val();
    var $newDescription = $idea.find('#new-idea-description').val();

    $.ajax({
      type: 'PUT',
      url: '/api/v1/ideas/' + $idea.attr('idea-id'),
      data: { idea: { title: $newTitle,
                      body: $newDescription } },
      success: function(){
        $oldTitle.text($newTitle);
        $oldDescription.text($newDescription);
        $idea.find('.edit-form').remove();
      },
      error: function(xhr){
        console.log(xhr.responseText);
      }
    });
  });
};
