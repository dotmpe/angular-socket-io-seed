path = require 'path'

module.exports = (app, io, module) ->
	app
		.route('/mpe/markdown')
		.all(module.handlers.mpe_markdown)
		.all((req, res, next) ->
			console.log module.name
			console.log module.handlers
		)

