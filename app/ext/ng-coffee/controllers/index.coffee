path = require 'path'

module.exports = (module) ->
	
	# Angular, server-side pages
	main: (req, res, next) ->
		page = req.params.page || 'index'
		res.render(path.join(module.viewPath, 'index', page))

	partials: (req, res, next) ->
		view = req.params.view
		action = req.params.action || view
		res.render(path.join(
				module.viewPath, 'client', view, action))


