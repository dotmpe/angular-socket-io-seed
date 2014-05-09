module.exports = (module) ->
	mpe_markdown: (req, res, next) ->
		res.render(module.viewPath+'/index')

