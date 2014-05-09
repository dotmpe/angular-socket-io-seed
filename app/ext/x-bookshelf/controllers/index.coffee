path = require 'path'
sqlite3 = require 'sqlite3'
Bookshelf = require 'bookshelf'

module.exports = (module)->
	# Prepare DB connection
	SQLiteBase = Bookshelf.initialize(
		client: 'sqlite'
		connection:
			filename: './bookmarks.sqlite3.db'
	)
	Bookshelf.session = SQLiteBase
	# Load model modules
	models = require module.modelPath
	# Prepare Bookshelf.{model,collection} registries
	SQLiteBase.plugin 'registry'
	# Define and register models
	models.location.define(SQLiteBase)
	models.bookmark.define(SQLiteBase)
	# Return hash with handlers
	x_bookshelf: (req, res, next)->
		res.render path.join(module.viewPath, 'index'),
			test: 'foo'

