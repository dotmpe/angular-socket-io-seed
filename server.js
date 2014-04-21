
/*!
 * See LICENSE.txt for full copyright notice.
 *
 * Copyright(c) 2013 Madhusudhan Srinivasa <madhums8@gmail.com>
 * MIT Licensed
 *
 * Copyright (C) 2014 Berend van Berkum (.mpe) <dev@dotmpe.com>
 * GNU GPL v3
 */

/**
 * Module dependencies.
 */

var express = require('express')
	, fs = require('fs')
	, passport = require('passport')

/**
 * Main application entry file.
 * Please note that the order of loading is important.
 */

// Load configurations
// if test env, load example file
var env = process.env.NODE_ENV || 'development'
	, config = require('./config/config')[env]
	, mongoose = require('mongoose')

// Bootstrap db connection
// Connect to mongodb
var connect = function () {
	var options = { server: { socketOptions: { keepAlive: 1 } } }
	mongoose.connect(config.db, options)
}
connect()

// Error handler
mongoose.connection.on('error', function (err) {
	console.log(err)
})

// Reconnect when closed
mongoose.connection.on('disconnected', function () {
	connect()
})

// Bootstrap models
var models_path = __dirname + '/app/models'
fs.readdirSync(models_path).forEach(function (file) {
	if (~file.indexOf('.js')) require(models_path + '/' + file)
})

// bootstrap passport config
require('./config/passport')(passport, config)

var app = module.exports = express();
var server = require('http').createServer(app);
var io = require('socket.io').listen(server);

// express settings
require('./config/express')(app, config, passport)

// Bootstrap routes
require('./config/routes')(app, passport)

io.sockets.on('connection', require('./routes/socket'));

// Start the app by listening on <port>
//app.listen(app.get('port'))
//console.log('Express app started on port '+port)

server.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + app.get('port'));
});

// expose app
exports = module.exports = app
