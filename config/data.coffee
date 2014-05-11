sqlite3 = require 'sqlite3'
Bookshelf = require 'bookshelf'
warehouse = require 'warehousejs'


module.exports = ( app, config ) ->

	SQLiteBase = Bookshelf.initialize(
		client: 'sqlite'
		connection:
			filename: './demo.sqlite3.db'
	)

	Bookshelf.session = SQLiteBase
	models = require '../app/models'
	SQLiteBase.plugin 'registry'
	models.user.define(SQLiteBase)
	models.article.define(SQLiteBase)

	# Set up barebone CRUD for SQLite3 records
	SqlBackend = require 'warehousejs/backend/sql'

	demo = new SqlBackend
		driver: 'sqlite3'
		filename: './demo.sqlite3.db'
	demo.open()
	warehouse.applyRoutes app, '/data/users', demo.objectStore 'users'
	warehouse.applyRoutes app, '/data/articles', demo.objectStore 'articles'

	bookmarks = new SqlBackend
		driver: 'sqlite3'
		filename: '/Users/berend/htdocs/.cllct/bms.sqlite'
	bookmarks.open()
	warehouse.applyRoutes app, '/data/locations', bookmarks.objectStore 'ids_lctr'
	warehouse.applyRoutes app, '/data/bookmarks', bookmarks.objectStore 'bm'

