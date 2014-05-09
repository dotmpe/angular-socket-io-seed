# Serve JSON to our AngularJS client
module.exports = (module) ->
	name: ( req, res ) ->
		res.json
			name: 'Bob'

