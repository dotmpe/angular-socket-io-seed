exports.dir = (obj) ->
	for name, value of obj 
		name
exports.routesFromObj = (app, prefix, obj) ->
	for name, value of obj
		app.get prefix+name, value

