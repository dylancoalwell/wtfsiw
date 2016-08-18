$(document).ready(function() {
  $('#movie-input').on('submit', function(event) {
    event.preventDefault();
    var $this = $(this)
    var api = 'https://api-public.guidebox.com/v1.43/US/rK6f79iiE3O2Lx4QGNt3L9dqo1g9KLJ6/search/movie/title/'
    var input = $this.find('#movie-input-field').val();
    input = input.replace(/\s/g, "%20");
    $.getJSON( api + input + '/exact', function(data){
      jsonObj = data;
    });
  });
});
