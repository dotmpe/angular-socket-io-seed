
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

var express = require('express'),
	passport = require('passport')

// Load configurations
// if test env, load example file
var env = process.env.NODE_ENV || 'dev'
	, config = require('./config/config')[env]

// bootstrap passport config
//require('./config/passport')(passport, config)

// create express and socket server
var app = module.exports = express()
var server = require('http').createServer(app)
var io = require('socket.io').listen(server)

require('./config/data')(app, config)

// express settings
require('./config/express')(app, config, passport)

// Bootstrap routes
require('./config/routes')(app, passport)

// Module try-out
var modules = require('./config/modules')(config, app, io)
// XXX want to look for some middleware to do dynamic routing/loading
// ie. to prevent loading unneeded parts and keeping everything in memory,
// to have a server footprint that adapts to current requests.
// This should allow unused parts, ie. nice for prototyping and development

app.route('/admin').all(function(req, res, next) {
  console.log(modules);
});

// Start ...
server.listen(app.get('port'), function () {
	console.log('Express server listening on port ' + app.get('port'));
});


// expose app
exports = module.exports = app
