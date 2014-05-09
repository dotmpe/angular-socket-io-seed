path = require 'path'

module.exports = (module) ->
	mpe_x_coffeescript: (req, res, next) ->
		res.render(path.join module.viewPath,'index')

