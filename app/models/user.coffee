UserTable = (table) ->
	console.log('init UserTable')
	table.uuid('id').primary()
	table.string('email')
	table.string('username')
	table.string('provider')
	table.string('hashed_password')
	table.string('salt')
	table.string('authToken')

module.exports = 
	schema:
		user: UserTable

