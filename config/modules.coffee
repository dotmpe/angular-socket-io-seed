#
# Module boostrap
#
util = require '../app/util'
path = require 'path'
fs = require 'fs'
_ = require 'underscore'


module.exports = (config, app) ->

	# XXX could insert some middleware to look up module, assuming we could
	# 	update the router while its running.
	#app.use (req, res, next) ->
	#	routes = util.module_routes('../config/routes.node-markdown-mpe')
	#	console.log(routes)
	#	next()

	extroot = path.join config.root, 'app', 'ext'
	fs.readdir extroot, (files, dirs) ->
		for name in dirs
			config = _.extend( config, moduleRoot: path.join extroot, name )
			controllers = require(path.join(config.moduleRoot, 'controllers'))
			require('./routes.'+name)(app, config, controllers)




