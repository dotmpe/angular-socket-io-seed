Base = require('bookshelf').session

module.exports.User = Base.Model.extend(
	tableName: 'users'
)
module.exports.Users = Base.Collection.extend(
	model: module.exports.User
)

module.exports.UserTable = (table) ->
	console.log('init UserTable')
	table.uuid('id').primary()
	table.string('email')
	table.string('username')
	table.string('provider')
	table.string('hashed_password')
	table.string('salt')
	table.string('authToken')

