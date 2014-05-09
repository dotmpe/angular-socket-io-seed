path = require 'path'

module.exports = (app, io, module) ->
	app
		.route('/mpe/x-coffeescript')
		.all(module.handlers.mpe_x_coffeescript)
		.all((req, res, next) ->
			console.log module.name
			console.log module.handlers
		)


