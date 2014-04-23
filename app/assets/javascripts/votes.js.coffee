# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.vote_button').on 'click', (event) ->
    event.preventDefault()
    url = $(this).closest('form').attr('action')
    $.post url

    # votesCount = $(this).closest('.post').find('.votes_count')

    # , (post) ->
    #   votesCount.html post.votes_count


  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe 'votes'

  channel.bind 'new', (post) ->
    $(".votes_count[data-id=#{post.id}]").html(post.new_votes_count)
