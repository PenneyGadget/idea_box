var getIdeas = function(){
  var newestIdeaID = parseInt($(".idea").first().data("id"));

  $.ajax({
    type: 'GET',
    url: '/api/v1/ideas',
    success: function(ideas){
      $.each(ideas, function(index, idea){
        if (isNaN(newestIdeaID) || idea.id > newestIdeaID) {
          renderIdea(idea);
        }
      });
      searchFilter();
    }
  });
};
