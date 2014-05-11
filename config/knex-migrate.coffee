module.exports = (dbname) ->
	(
		demo:
			database:
				client: 'sqlite3'
				connection:
					filename: './demo.sqlite3.db'
			directory: './migrations/demo/'
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

