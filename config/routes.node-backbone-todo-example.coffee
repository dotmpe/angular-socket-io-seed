
module.exports = (app, io, module) ->
	app
		.route('/examples/backbone-todo')
		.all((req, res, next) ->
			console.log module.name
			console.log module.handlers
			next()
		)
		.all(module.handlers.backbone_todo_example)


