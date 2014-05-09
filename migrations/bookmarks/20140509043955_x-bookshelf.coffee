models = require '../../app/ext/x-bookshelf/models'

exports.up = (knex, Promise) ->
	return Promise.all([
		knex.schema.createTable 'locations', models.location.schema
		knex.schema.createTable 'bookmarks', models.bookmark.schema
	])

exports.down = (knex, Promise) ->
	return Promise.all([
		knex.schema.dropTable 'locations'
		knex.schema.dropTable 'bookmarks'
	])

