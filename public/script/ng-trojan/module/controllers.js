'use strict';

/* Angular Controllers */

angular.module('trojan.controllers', []).
  controller('AppCtrl', function ($scope, socket) {
    socket.on('send:name', function (data) {
      $scope.name = data.name;
    });
  }).
  controller('HomeCtrl', function ($scope, socket) {
    socket.on('send:time', function (data) {
      $scope.time = data.time;
    });
  }).
  controller('AccountCtrl', function ($scope) {
    // write Ctrl here
  }).
  controller('PostCtrl', function ($scope) {
    // write Ctrl here
  });
