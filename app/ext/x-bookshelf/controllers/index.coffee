path = require 'path'

module.exports = (module)->
	x_bookshelf: (req, res, next)->
		res.render path.join(module.viewPath, 'index'),
			test: 'foo'

