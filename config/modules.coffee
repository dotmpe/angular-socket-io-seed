#
# Module boostrap
#
util = require '../app/util'
path = require 'path'
fs = require 'fs'
_ = require 'underscore'


class Module
	constructor: (@name, @config) ->
	configure: (extroot) ->
		@moduleRoot = path.join extroot, @name
		@viewPath = path.join @moduleRoot, 'views'
		@controllerPath = path.join @moduleRoot, 'controllers'
	apply: (app, io) ->
		@handlers = _.extend(
			redirect: (path) ->
				(req, res) ->
					res.redirect(path)
			require( @controllerPath )(@)
		)
		@routes = require('./routes.'+@name)(app, io, @)


module.exports = (config, app, io) ->

	# XXX could insert some middleware to look up module, assuming we could
	# 	update the router while its running.
	#app.use (req, res, next) ->
	#	routes = util.module_routes('../config/routes.node-markdown-mpe')
	#	console.log(routes)
	#	next()

	s = []
	extroot = path.join config.root, 'app', 'ext'
	fs.readdir extroot, (files, dirs) ->
		for name in dirs
			module = new Module( name, config )
			module.configure extroot
			module.apply app, io 
			s.push module

	#console.log [this,s]

	return s
