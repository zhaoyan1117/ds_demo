# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#source').autocomplete
  	source: $('#source').data('autocomplete-source')

jQuery ->
  $('#target').autocomplete
  	source: $('#target').data('autocomplete-source')
