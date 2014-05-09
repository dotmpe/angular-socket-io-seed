module.exports = (dbname) ->
	(
		test:
			database:
				client: 'sqlite3'
				connection:
					filename: './test.sqlite3.db'
			directory: './migrations/test/'
			tableName: 'migrations'
			extension: 'coffee'
		bookmarks:
			database:
				client: 'sqlite3'
				connection:
					filename: './bookmarks.sqlite3.db'
			directory: './migrations/bookmarks/'
			tableName: 'migrations'
			extension: 'coffee'
	)[dbname]

