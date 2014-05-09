module.exports = 
	schema: (table) ->
		table.string('label').unique()
		table.text('title').unique()
		table.timestamps() # created_at, updated_at
		table.text('href').unique()

	define: (Base) -> 
		Location = Base.Model.extend(
			tableName: 'locations'
		)
		Locations = Base.Collection.extend(
			model: Location
		)
		Base.model('Location', Location)
		Base.collection('Locations', Locations)

