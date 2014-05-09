express = require 'express'
path = require 'path'
express = require('express')
#  , mongoStore = require('connect-mongo')(express)
session = require('cookie-session')
flash = require('connect-flash')
winston = require('winston')
helpers = require('view-helpers')
pkg = require('../package.json')
bodyParser = require('body-parser')
cookieParser = require('cookie-parser')
methodOverride = require('method-override')
csrf = require('csurf')
logger = require('morgan')


env = process.env.NODE_ENV || 'development'

###
 * Express Configuration
###
module.exports = (app, config, passport) ->

	# all environments
	app.set 'port', process.env.PORT || 3000
	app.set('showStackError', true)

	# Logging
	# Use winston on production
	log
	if env != 'development'
		log = 
			stream: 
				write: (message, encoding) ->
					winston.info(message)
	else 
		log = 'dev'
	# Don't log during tests
	env != 'test' ? app.use(logger(log))
	#app.use express.logger 'dev'
	
	# set views path, template engine and default layout
	app.set 'views', path.join __dirname, '..', 'app', 'views'
	app.set 'view engine', 'jade'
	
	# expose package.json to views
	app.use((req, res, next)->
		res.locals.pkg = pkg
		next()
	)

	# cookieParser should be above session
	app.use(cookieParser())

	app.use bodyParser()
	app.use methodOverride()

	app.use(session(
		secret: 98172347812481231296319237812937#appConfig.site.salt
		keys: ['key1']
		cookie: 
			maxAge: 1000*60*60 
	))
# express/mongo session storage
#    app.use(express.session({
#      secret: pkg.name,
#      store: new mongoStore({
#        url: config.db,
#        collection : 'sessions'
#      })
#    }))

	# use passport session
	app.use(passport.initialize())
	app.use(passport.session())

	# connect flash for flash messages - should be declared after sessions
	app.use(flash())

	# should be declared after session and flash
	app.use(helpers(pkg.name))

	# adds CSRF support
	if env != 'test' 
		app.use(csrf())

		# This could be moved to view-helpers :-)
		app.use((req, res, next)->
			res.locals.csrf_token = req.csrfToken()
			next()
		)

	# XXX app.use(express.favicon())
	app.use express.static path.join __dirname, '..', 'public'
	#app.use app.router
	
	# should be placed before express.static
	app.use(require('compression')(
		filter: (req, res) ->
			return /json|text|javascript|css/.test(res.getHeader('Content-Type'))
		level: 9
	))

	# development only
	app.get 'env' == 'development' ?
		app.use express.errorHandler()
		app.locals.pretty = true
	
	# assume "not found" in the error msgs
	# is a 404. this is somewhat silly, but
	# valid, you can do whatever you like, set
	# properties, use instanceof etc.
	app.use((err, req, res, next)->
		# treat as 404
		if err.message && (~err.message.indexOf('not found') || (~err.message.indexOf('Cast to ObjectId failed')))
			return next()

		# log it
		# send emails if you want
		console.error(err.stack)

		# error page
		res.status(500).render('500', { error: err.stack })
	)
	
	# assume 404 since no middleware responded
	# XXX stopped working with express upgrade
	#app.use(function(req, res, next){
	#  res.status(404).render('404', {
	#    url: req.originalUrl,
	#    error: 'Not found'
	#  })
	#})
	
	# production only
	#if app.get 'env' == 'production'
		# TODO


