
module.exports = (app, io, module) ->
	# Angular server-side routes

	# XXX: html5 routing means we have two routers? client vs. server.. 
	# thus need to find proper redirect method, ie /client/index?redir=<name> 
	# also, refreshing/requesting client-side routes result in request to server 
	# and thus default redirect(s) ... 
	# Front end is not the exciting, just need one page. */
	app.route('/trojan/:page').all(module.handlers.main)
	app.route('/trojan/').all(module.handlers.main)
	app.route('/trojan').all(module.handlers.redirect('/trojan/'))
	# Angular app (server-side) views */
	app.route('/trojan/view/:view/:action').all(module.handlers.partials)
	# angular api
	app.route('/api/client/name').all(module.handlers.name)
	app.route('/api/module/name').all((req, res, next) ->
		res.json name: module.name )

	# Initialize Socket.io Communication: 
	# as soon as client connects set up backend messages (push events)
	io.sockets.on('connection', module.handlers.socket)


