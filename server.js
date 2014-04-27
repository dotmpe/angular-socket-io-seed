
/*!
 * See LICENSE.txt for full copyright notice.
 *
 * Copyright(c) 2013 Madhusudhan Srinivasa <madhums8@gmail.com>
 * MIT Licensed
 *
 * Copyright (C) 2014 Berend van Berkum (.mpe) <dev@dotmpe.com>
 * GNU GPL v3
 */

//require('server/main')

/**
 * Module dependencies.
 */

/* Enable coffeescript */
require('coffee-script/register');
/* Enable LiveScript */
require('LiveScript')
// XXX just testing formats, not sure how ls turns out


var express = require('express')
	, passport = require('passport')


/**
 * Main application entry file.
 * Please note that the order of loading is important.
 */

// Load configurations
// if test env, load example file
var env = process.env.NODE_ENV || 'development'
	, config = require('./config/config')[env]

// boostrap database
require('./config/mongoose')(config)
require('./config/data')(config)

// bootstrap passport config
require('./config/passport')(passport, config)

// create express and socket server
var app = module.exports = express()
var server = require('http').createServer(app)
var io = require('socket.io').listen(server)

// Initialize Socket.io Communication: 
// as soon as client connects set up backend messages (push events)
io.sockets.on('connection', require('./config/ng/socket'));

// express settings
require('./config/express')(app, config, passport)

// Bootstrap routes
require('./config/routes')(app, passport)

// Start ...
server.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + app.get('port'));
});

// expose app
exports = module.exports = app
