var qualities = ['swill', 'plausible', 'genius'];

var upvoteIdea = function(){
  $('#latest-ideas').delegate('#upvote-idea', 'click', function(){
    var $idea = $(this).closest('.idea');
    var $quality = $idea.find('.idea-quality');
    var qualityString = $quality.text();
    var qualityIndex = qualities.indexOf(qualityString);

    if(qualityIndex < 2){ qualityIndex += 1; }

    $.ajax({
      type: 'PUT',
      url: '/api/v1/ideas/' + $idea.attr('idea-id'),
      data: { idea: { quality: qualityIndex } },
      success: function(){
        $quality.text(qualities[qualityIndex]);
      },
      error: function(xhr){
        console.log(xhr.responseText);
      }
    });
  });
};
