# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`jQuery( function($) {
      $('tbody tr[data-href]').addClass('clickable').click( function() {
        window.location = $(this).attr('data-href');
      }).find('a').hover( function() {
        $(this).parents('tr').unbind('click');
      }, function() {
        $(this).parents('tr').click( function() {
          window.location = $(this).attr('data-href');
        });
      });
    });`