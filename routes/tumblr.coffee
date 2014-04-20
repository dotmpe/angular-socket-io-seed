{Blog, User} = require 'tumblr'
opts = require '../tumblr-config'

endpoint_reqtoken = "https://www.tumblr.com/oauth/request_token"
endpoint_auth = "https://www.tumblr.com/oauth/authorize"
endpoint_acctoke = "http://www.tumblr.com/oauth/access_token"

module.exports =
	info: (req, res) ->
		res.send 'foo'

	auth: (req, res) ->
		request_token = _.extend( opts,
			oauth_signature_method: ''
			oauth_signature: ''
			oauth_timestamp: ''
			oauth_nonce: ''
			#redirect_uri: opts.redirect_uri
		)
		uri = endpoint_auth + "?" + querystring.stringify(qs)
		res.redirect uri
	
	callback: (req, res) ->
		client.set 'oauth2_code', req.query.code
		res.json
			callback: opts
			code: req.query.code
	
	code: (req, res) ->
		client.get('oauth2_code', (err, reply) -> res.json(code: reply))


