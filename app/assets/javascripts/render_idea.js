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
