var renderIdea = function(idea){
  $('#latest-ideas').prepend(
    "<div class='idea' idea-id='" +
    idea.id +
    "'><h3>" +
    idea.title +
    "</h3><p>" +
    truncate(idea.body) +
    "</p><h4><strong>This idea is: </strong>" +
    qualities[idea.quality] +
    "</h4>" +
    "<button type='button' id='upvote-idea' class='btn btn-default'><span class='glyphicon glyphicon-thumbs-up'></span></button>" +
    "<button type='button' id='downvote-idea' class='btn btn-default'><span class='glyphicon glyphicon-thumbs-down'></span></button>" +
    "<br><button id='delete-idea' name='button-delete' class='btn btn-default btn-xs'>Delete</button>" +
    "<button id='edit-idea' name='button-edit' class='btn btn-default btn-xs'>Edit</button>" +
    "<hr></div>"
  );
};
