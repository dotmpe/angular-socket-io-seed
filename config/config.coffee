path = require('path')
rootPath = path.normalize(__dirname + '/..')

module.exports =
	test:
		root: rootPath
		app: name: 'Nodejs Express Socket IO Demo (test)'
	development:
		root: rootPath
		app: name: 'Nodejs Express Socket IO Demo (dev)'
		lib:
			js:
				requirejs: "//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.10/require.js"
			css: [
				'/components/bootstrap/dist/css/bootstrap.css',
				'/components/bootstrap/dist/css/bootstrap-theme.css',
				'/style/app.css'
			]
		facebook:
			clientID: "APP_ID"
			clientSecret: "APP_SECRET"
			callbackURL: "http://localhost:3000/auth/facebook/callback"
		twitter:
			clientID: "CONSUMER_KEY"
			clientSecret: "CONSUMER_SECRET"
			callbackURL: "http://localhost:3000/auth/twitter/callback"
		github:
			clientID: '18cbfb56550549f9dcef'
			clientSecret: 'c85adc2c361c20d2a3231fb1ee1637e369e59e3d'
			callbackURL: 'http://localhost:3000/auth/github/callback'
		google:
			clientID: "APP_ID"
			clientSecret: "APP_SECRET"
			callbackURL: "http://localhost:3000/auth/google/callback"
		linkedin:
			clientID: "CONSUMER_KEY"
			clientSecret: "CONSUMER_SECRET"
			callbackURL: "http://localhost:3000/auth/linkedin/callback"

