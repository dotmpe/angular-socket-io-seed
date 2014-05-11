'use strict';

/* Services */

// Demonstrate how to register services
// In this case it is a simple value service.
define([
	'angularAMD', 
	'socket.io', 
	'angular.socket-io', 
], function (angularAMD) {
	angular
		.module('trojan.services', [
			// 3rd party dependencies:
			'btford.socket-io' // angular-socket-io
		])
		.factory('socket', function (socketFactory) {
			return socketFactory();
		})
		.value('version', '0.1');
}); 

