
module.exports = (app, config, controllers) ->
	app
		.route('/examples/backbone-todo')
		.all(controllers.index)


