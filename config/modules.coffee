#
# Module boostrap
#
util = require '../app/util'
path = require 'path'
fs = require 'fs'
_ = require 'underscore'


class Module
	# Object to hold paths and loaded controllers
	constructor: (@name, @config) ->
	configure: (extroot) ->
		@moduleRoot = path.join extroot, @name
		@viewPath = path.join @moduleRoot, 'views'
		@modelPath = path.join @moduleRoot, 'models'
		@controllerPath = path.join @moduleRoot, 'controllers'
	apply: (app, io) ->
		@handlers = _.extend(
			# load module controller
			require( @controllerPath )(@)
			# extend with convenience function
			redirect: (path) ->
				(req, res) ->
					res.redirect(path)
		)
		# initialize route config for this module
		require('./routes.'+@name)(app, io, @)


module.exports = (config, app, io) ->

	modules = []
	extroot = path.join config.root, 'app', 'ext'
	fs.readdir extroot, (files, dirs) ->
		for name in dirs
			module = new Module( name, config )
			module.configure extroot
			module.apply app, io 
			modules.push module
	return modules

