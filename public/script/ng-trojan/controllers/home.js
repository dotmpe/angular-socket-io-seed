'use strict';

define([
	'trojan/app', 
	"trojan/module/services", 
	'trojan/directives/navMenu'
], function (app) {
	app.register.controller('HomeCtrl', 
			function ($scope, socket) {
		$scope.message = "Message from HomeCtrl"; 
		socket.on('send:name', function (data) {
			$scope.name = data.name;
		});
		socket.on('send:time', function (data) {
			$scope.time = data.time;
		});
	});
}); 
