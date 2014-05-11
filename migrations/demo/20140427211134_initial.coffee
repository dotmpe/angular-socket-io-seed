models = require '../../app/models'

exports.up = (knex, Promise) -> 
	return Promise.all([
		knex.schema.createTable 'users', models.user.schema
		knex.schema.createTable 'articles', models.article.schema
	])

exports.down = (knex, Promise) -> 
	return Promise.all([
		knex.schema.dropTable 'users'
		knex.schema.dropTable 'articles'
	])

