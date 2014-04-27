'use strict';

// Declare app level module which depends on filters, and services

angular
  .module('base', [
    'ngRoute',

    'base.controllers',
    'base.filters',
    'base.services',
    'base.directives',

    // 3rd party dependencies
    'btford.socket-io' // angular-socket-io
  ])
  .config(function ($routeProvider, $locationProvider) {

    $routeProvider
      .when('/client/index', {
        templateUrl: '/client/view/home/home',
        controller: 'HomeCtrl'
      })
      .when('/client/account', {
        templateUrl: '/client/view/account/account',
        controller: 'AccountCtrl'
      })
      .when('/client/account/list', {
        templateUrl: '/client/view/account/list',
        controller: 'AccountCtrl'
      })
      .when('/client/post', {
        templateUrl: '/client/view/post/post',
        controller: 'PostCtrl'
      })
      .when('/client/*', {
      //.otherwise({
        redirectTo: '/client/index'
      });

    $locationProvider.html5Mode(true);

    console.debug('angular "base" client inited');
  });

  $(document).ready(function () {

    //$('#tags').tagsInput({
    //  'height':'60px',
    //  'width':'280px'
    //});

    console.debug('App jQuery inited');
  });

