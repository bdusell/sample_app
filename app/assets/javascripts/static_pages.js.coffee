# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

plural_s = (n) -> if n == 1 then '' else 's'

$(document).ready ->
  max_length = 140
  error_class = 'alert-error'
  success_class = 'alert-success'
  $('#micropost_content').on(
    'propertychange keyup input paste',
    (event) ->
      value = $(event.target).val()
      console.log value
      remaining = max_length - value.length
      $counter = $('#character_counter')
      if remaining < 0
        $counter.text(
          -remaining + ' character' + plural_s(-remaining) + ' too long.'
        ).addClass(error_class).removeClass(success_class)
      else
        $counter.text(
          remaining + ' character' + plural_s(remaining) + ' left.'
        ).removeClass(error_class)
        if remaining > 10
          $counter.addClass(success_class)
        else
          $counter.removeClass(success_class)
  ).keyup()

