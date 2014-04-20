'user strict'

redis = require("redis")
querystring = require("querystring")
client = redis.createClient()

endpoint_auth = "https://accounts.google.com/o/oauth2/auth"
endpoint_token = "https://accounts.google.com/o/oauth2/token"

opts = require '../google-oauth'
goauth2 = require("google-oauth2")(opts)
scope = "https://www.googleapis.com/auth/userinfo.profile"

module.exports = 
	
	name: (req, res) ->
		res.json name: opts
	
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

