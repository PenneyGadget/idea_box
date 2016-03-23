var searchFilter = function(){
  var $ideas = $('#latest-ideas');
  $('#search-box-field').keyup(function(){
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase;

    $ideas.show().filter(function(){
      var text = $(this).text().replace(/\s+/g, ' ').toLowerCase;
      return !~text.indexOf(val);
    }).hide();
  });
};
