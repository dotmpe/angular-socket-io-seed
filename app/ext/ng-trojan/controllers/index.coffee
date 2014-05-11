path = require 'path'
_ = require 'underscore'

module.exports = (module) ->
	
	# Angular, server-side pages
	main: (req, res, next) ->
		page = req.params.page || 'index'
		res.render path.join( module.viewPath, 'index', page),
				page: title: "NCARS 0001"
				lib: module.config.lib
				url: base: '/trojan/'
	
	partials: (req, res, next) ->
		view = req.params.view
		action = req.params.action || view
		res.render path.join(module.viewPath, 'client', view, action),
			url: base: '/trojan/'
	
	name: require('./api')(module).name
	
	socket: require('./socket')

