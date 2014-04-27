
exports.up = (knex, Promise) -> 
	knex.schema.createTable 'users', require('../app/models/user').schema.user
	knex.schema.createTable 'articles', require('../app/models/article').schema.article

exports.down = (knex, Promise) -> 
	knex.schema.dropTable 'users'
	knex.schema.dropTable 'articles'

