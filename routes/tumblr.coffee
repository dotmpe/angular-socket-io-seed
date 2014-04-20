{Blog, User} = require 'tumblr'
opts = require '../tumblr'

endpoint_auth = "https://www.tumblr.com/oauth/authorize"
endpoint_reqtoken = "https://www.tumblr.com/oauth/request_token"

module.exports
	info: (req, res) ->
		res.send 'foo'

	auth: (req, res) ->
		qs =
			response_type: "code"
			client_id: opts.client_id
			redirect_uri: opts.redirect_uri
			scope: scope
		uri = endpoint_auth + "?" + querystring.stringify(qs)
		res.redirect uri
	
	callback: (req, res) ->
		client.set 'oauth2_code', req.query.code
		res.json
			callback: opts
			code: req.query.code
	
	code: (req, res) ->
		client.get('oauth2_code', (err, reply) -> res.json(code: reply))


