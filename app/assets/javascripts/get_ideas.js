function getIdeas(){
  var newestIdeaID = parseInt($(".idea").first().data("id"));

  $.ajax({
    type: 'GET',
    url: '/api/v1/ideas.json',
    success: function(ideas){
      $.each(ideas, function(index, idea){
        if (isNaN(newestIdeaID) || idea.id > newestIdeaID) {
          renderIdea(idea);
        }
      });
    }
  });
}

function renderIdea(idea){
    $('#latest-ideas').prepend(
      "<div class='idea' idea-id='" +
      idea.id +
      "'><h3>" +
      idea.title +
      "</h3><p>" +
      truncate(idea.body) +
      "</p><p>Quality: " +
      qualities[idea.quality] +
      "</div>"
    );
  }
