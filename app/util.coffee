_ = require 'underscore'

module.exports.module_routes = (module) ->
	app = require('express')()
	require(module)(app, {})
	return _.filter(_.map(app._router.stack, (o) ->
		if o.route && o.route.path 
			o.route.path
	), (o) -> o ? o )


