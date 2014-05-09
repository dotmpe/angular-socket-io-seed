path = require 'path'
module.exports = (module) ->
	backbone_todo_example: (req, res, next) ->
		res.render(path.join module.viewPath,'index')


