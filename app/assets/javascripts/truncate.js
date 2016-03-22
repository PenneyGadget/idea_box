var truncate = function(string){
  if(string.length > 100){
    return string.substr(0, string.lastIndexOf(' ', 100)) + '...';
  } else {
    return string;
  }
};
