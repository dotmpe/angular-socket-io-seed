"use strict"

angular.module 'myApp.controllers' []
	.controller 'AppCtrl' ($scope, socket) ->
		socket.on 'send:name' (data) ->
			$scope.name = data.name
	.controller 'MyCtrl1' ($scope, socket) ->
		socket.on 'send:time' (data) ->
			$scope.time = data.time
	.controller 'MyCtrl2' ($scope, socket) ->

