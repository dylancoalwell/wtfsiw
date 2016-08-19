$(document).ready(function() {
  $('#movie-input').on('submit', function(event) {
    event.preventDefault();
    var $this = $(this)
    var api = 'https://api-public.guidebox.com/v1.43/US/rK6f79iiE3O2Lx4QGNt3L9dqo1g9KLJ6/search/movie/title/'
    var input = $this.find('#movie-input-field').val();
    input = input.replace(/\s/g, "%20");
    $.getJSON( api + input + '/exact', function(data){
      var jsonObj = data.results[0].source[0];
      // $.ajax({
      //   url: '/games',
      //   method: 'POST',
      //   data: {data: jsonObj}
      // }).done(function(response){
      //   console.log(response);
      //   // $('#list').append(response);
      // });
      var li = '<li>'+jsonObj+'</li>'
      $('#list').append(li);
    });
  });
});
