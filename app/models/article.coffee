module.exports = 
	schema: (table) ->
		table.string('title')
		table.timestamps() # created_at, updated_at
		table.string('body')
		table.uuid('user').references('id').inTable('users')

	define: (Base) -> 
		Article = Base.Model.extend(
			tableName: 'users'
		)
		Articles = Base.Collection.extend(
			model: Article
		)
		Base.model('Article', Article)
		Base.collection('Articles', Articles)



