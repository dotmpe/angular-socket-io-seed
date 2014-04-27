# Serve JSON to our AngularJS client
module.exports.name = ( req, res ) ->
	res.json
		name: 'Bob'
