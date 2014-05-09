module.exports = 
	schema: (table) ->
		table.text('descr').nullable()
		table.timestamps() # created_at, updated_at
		table.string('tags').nullable()
		table.uuid('location')
			.references('id')
			.inTable('locators')

	define: (Base) -> 
		Bookmark = Base.Model.extend(
			tableName: 'bookmarks'
		)
		Bookmarks = Base.Collection.extend(
			model: Bookmark
		)
		Base.model('Bookmark', Bookmark)
		Base.collection('Bookmarks', Bookmarks)

