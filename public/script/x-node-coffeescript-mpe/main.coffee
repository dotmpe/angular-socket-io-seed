
MainModule = ($) ->
	console.log('CoffeeScript started.')
	$('body').append('Hello World! from Coffee-Script.<br/>(See console)')

define ['jquery'], MainModule

