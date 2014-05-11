'use strict';

define([
	'trojan/app', 
	"trojan/module/services", 
	'trojan/directives/navMenu',
	'trojan/services/mapServices'
], function (app) {
	app.register.controller('MapCtrl', 
			function ($scope, socket, MapService) {
		$scope.message = "Message from MapCtrl"; 
		socket.on('send:time', function (data) {
			$scope.time = data.time;
		});

		$scope.title = "Where is Colosseo?";
		$scope.latitude = 41.8902;
		$scope.longitude = 12.4923;

		// Set the location to be Colosseum
		MapService.initialize($scope, "map-canvas");
	});
}); 

