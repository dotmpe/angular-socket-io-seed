sqlite3 = require 'sqlite3'
Knex = require 'knex'

module.exports = ( config ) ->

	Knex.knex = Knex.initialize(
		client: 'sqlite'
		connection:
			filename: './test.sqlite3.db'
	)

	###
		knex = Knex.initialize(
			client: 'mysql'
			connection:
				host     : '127.0.0.1'
				user     : 'your_database_user'
				password : 'your_database_password'
				database : 'myapp_test'
				charset  : 'utf8'

    client: 'mysql',
    connection: {
      host     : process.env.APP_DB_HOST     || '127.0.0.1',
      user     : process.env.APP_DB_USER     || 'user',
      password : process.env.APP_DB_PASSWORD || 'password',
      database : process.env.APP_DB_NAME     || 'database'
    }
		)
	###


