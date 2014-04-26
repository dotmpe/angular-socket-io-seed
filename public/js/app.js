'use strict';

// Declare app level module which depends on filters, and services

angular
  .module('myApp', [
    'ngRoute',

    'myApp.controllers',
    'myApp.filters',
    'myApp.services',
    'myApp.directives',

    // 3rd party dependencies
    'btford.socket-io' // angular-socket-io
  ])
  .config(function ($routeProvider, $locationProvider) {

    $routeProvider
      .when('/home', {
        templateUrl: '/partials/home',
        controller: 'HomeCtrl'
      })
      .when('/account', {
        templateUrl: '/partials/account',
        controller: 'AccountCtrl'
      })
      .otherwise({
        redirectTo: '/home'
      });

    $locationProvider.html5Mode(true);

    console.debug('angular myApp inited');
  });

  $(document).ready(function () {

    //$('#tags').tagsInput({
    //  'height':'60px',
    //  'width':'280px'
    //});

    console.debug('App jQuery inited');
  });

