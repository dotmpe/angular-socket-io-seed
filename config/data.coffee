sqlite3 = require 'sqlite3'
Bookshelf = require 'bookshelf'

module.exports = ( config ) ->

	SQLiteBase = Bookshelf.initialize(
		client: 'sqlite'
		connection:
			filename: './test.sqlite3.db'
	)

	Bookshelf.session = SQLiteBase
	models = require '../app/models'

	SQLiteBase.plugin 'registry'

	SQLiteBase.model('User', models.User)
	SQLiteBase.collection('Users', models.Users)

	SQLiteBase.model('Article', models.Article)
	SQLiteBase.collection('Articles', models.Articles)

	return session: SQLiteBase

	###
		knex = Bookshelf.initialize(
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


