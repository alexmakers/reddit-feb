# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.vote_button').on 'click', (event) ->
    event.preventDefault()
    url = $(this).closest('form').attr('action')
    votesCount = $(this).closest('.post').find('.votes_count')

    $.post url, (post) ->

      votesCount.html post.votes_count