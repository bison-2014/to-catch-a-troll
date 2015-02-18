// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  $('.panel').on("click", '.foundicon-flag', function(event){
    event.preventDefault();
    $(this).toggleClass('alert');
    var my_div=$(this).parent();
    var this_page = {
      "url": $(my_div).find('a').attr('href'),
      "highlight": $(my_div).find('dt.high').text().replace(/(\r\n|\n|\r|\s+)/gm," "),
      "score": $(my_div).find('.score').text().slice(11),
      "hit-number": $(this).attr('id').slice(9)
    }

    var url = "/flags"
    $.ajax({
      url: url,
      type: 'POST',
      data: this_page
    }).done(function(response){
    })
  });
})
