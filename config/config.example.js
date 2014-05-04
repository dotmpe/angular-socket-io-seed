
var path = require('path')
  , rootPath = path.normalize(__dirname + '/..')

module.exports = {
  dev: {
    root: rootPath,
    app: {
      name: 'Nodejs Express Socket IO Demo (dev)'
    },
  },
  test: {
    root: rootPath,
    app: {
      name: 'Nodejs Express Socket IO Demo'
    },
  },
  prod: {}
}
