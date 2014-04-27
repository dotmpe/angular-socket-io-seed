
/*!
 * See LICENSE.txt for full copyright notice.
 *
 * Copyright (C) 2014 Berend van Berkum (.mpe) <dev@dotmpe.com>
 * GNU GPL v3
 */

/* Enable coffeescript */
require('coffee-script/register');
/* Enable LiveScript */
require('LiveScript')

// XXX just testing formats, not sure how everything turns out

var express = require('express')

// Load configurations
// if test env, load example file
var env = process.env.NODE_ENV || 'dev'
	, config = require('./config/config')[env]

// bootstrap <module>
//require('./config/module')(module, config)

// create express and socket server
var app = module.exports = express()
var server = require('http').createServer(app)
var io = require('socket.io').listen(server)

// Initialize Socket.io Communication: 
// as soon as client connects set up backend messages (push events)
io.sockets.on('connection', require('./config/ng/socket'));

// express settings
require('./config/express')(app, config)

// Bootstrap routes
require('./config/routes')(app)

// Start ...
server.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + app.get('port'));
});



// expose app
exports = module.exports = app
