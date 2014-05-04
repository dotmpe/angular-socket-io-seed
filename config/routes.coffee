###
 Express Server-Side Routes
###

routes = require('../routes')
api = require('../routes/api')
user = require('../routes/user')

module.exports = ( app ) ->
	# serve index and view partials
	app.get '/', routes.index
	app.get '/partials/:name', routes.partials

	# JSON API
	app.get '/api/name', api.name

	# redirect all others to the index (HTML5 history)
	app.get '*', routes.index

	for name, prop in user
		app.get '/user/' + name, prop

