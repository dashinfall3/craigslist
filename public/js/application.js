$(document).ready(function(){

  $('#edit_post').submit(function(e) {
    e.preventDefault()
    var userInput = $('#edit_post').serialize();
    var secretKey = $('#edit_post').find('#secret_key').attr("value");
    $.post('/post/' + secretKey, userInput, function(post){
      $('.post_title').html(post['post'].title);
      $('.post_body').html(post['post'].body);
      $('#location').html(post['post'].location);
      $('#price').html(post['post'].price);
      $('#contact').html(post['post'].contact_name);
      $('#email').html(post['post'].email);

    });
 
  });

});
