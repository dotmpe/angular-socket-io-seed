module.exports = 
	database:
		client: 'sqlite3'
		connection:
			filename: './test.sqlite3.db'
	directory: './migrations'
	tableName: 'migrations'
	extension: 'coffee'

