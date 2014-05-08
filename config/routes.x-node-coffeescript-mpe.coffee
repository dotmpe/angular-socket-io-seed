
module.exports = (app, config, controllers) ->
	app
		.route('/mpe/x-coffeescript')
		.all(controllers.index)


