var qualities = ['swill', 'plausible', 'genius'];

var downvoteIdea = function(){
  $('#latest-ideas').delegate('#downvote-idea', 'click', function(){
    var $idea = $(this).closest('.idea');
  });
};
