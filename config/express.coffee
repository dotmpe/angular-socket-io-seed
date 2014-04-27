express = require 'express'
path = require 'path'

###
 * Express Configuration
###
module.exports = (app, config) ->

	# all environments
	app.set 'port', process.env.PORT || 3000
	app.set 'views', path.join __dirname, '..', 'views'
	app.set 'view engine', 'jade'
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use express.static path.join __dirname, '..', 'public'
	app.use app.router
	
	# development only
	app.get 'env' == 'development' ?
		app.use express.errorHandler()
	
	# production only
	#if app.get 'env' == 'production'
		# TODO


