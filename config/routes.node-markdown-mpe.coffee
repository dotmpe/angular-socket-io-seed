
module.exports = (app, config, controllers) ->
	app
		.route('/mpe/markdown')
		.all(controllers.index)

