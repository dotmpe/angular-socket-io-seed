ArticleSchema = (table) ->
	console.log('init ArticleSchema')
	table.string('title')
	table.timestamps() # created_at, updated_at
	table.string('body')
	table.uuid('user').references('id').inTable('users')

###
DB = require('knex').knex

createSchema = () ->
	DB.schema.createTable('articles', ArticleSchema).then () ->
		console.log 'Create articles table'
###

module.exports = 
	schema:
		article: ArticleSchema

