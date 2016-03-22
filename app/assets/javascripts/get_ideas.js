function getIdeas() {
  $.ajax({
    type: 'GET',
    url: '/api/v1/ideas.json',
    success: function(ideas){
      $.each(ideas, function(index, idea){
        $('#latest-ideas').append(
          "<div class='idea'><h3>"
          + idea.title + "</h3><p>"
          + truncate(idea.body)
          + "</p><p>Quality: "
          + qualities[idea.quality]
          + "</p></div>"
        );
      });
    }
  });
}
