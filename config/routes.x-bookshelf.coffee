module.exports = (app, io, module)->
	app.route('/mpe/x-bookshelf').all(module.handlers.x_bookshelf)
