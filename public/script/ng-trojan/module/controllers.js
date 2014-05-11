'use strict';

define(['angularAMD'], function (angularAMD) {
	/* Angular Controllers */
	var appMod = angular.module('trojan.controllers', []);
	console.log(['appMod', appMod]);
	appMod.controller('AppCtrl', function ($scope, socket) {
			socket.on('send:name', function (data) {
				$scope.name = data.name;
			});
		});
	return appMod;
}); 


