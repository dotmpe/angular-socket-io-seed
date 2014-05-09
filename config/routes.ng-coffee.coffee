
module.exports = (app, io, module) ->

	app.route('/trojan-cs/:page').all(module.handlers.main)
	app.route('/trojan-cs/').all(module.handlers.main)
	app.route('/trojan-cs').all(module.handlers.redirect('/trojan-cs/'))
	# Angular app (server-side) views */
	app.route('/trojan-cs/view/:view/:action').all(module.handlers.partials)



