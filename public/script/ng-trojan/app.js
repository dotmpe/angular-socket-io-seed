'use strict';

// Declare app level module which depends on filters, and services

angular
  .module('trojan', [
    'ngRoute',

    'trojan.controllers',
    'trojan.filters',
    'trojan.services',
    'trojan.directives',

    // 3rd party dependencies
    'btford.socket-io' // angular-socket-io
  ])
  .config(function ($routeProvider, $locationProvider) {

    $routeProvider
      .when('/index', {
        templateUrl: '/trojan/view/home/home',
        controller: 'HomeCtrl'
      })
      .when('/account', {
        templateUrl: '/trojan/view/account/account',
        controller: 'AccountCtrl'
      })
      .when('/account/list', {
        templateUrl: '/trojan/view/account/list',
        controller: 'AccountCtrl'
      })
      .when('/post', {
        templateUrl: '/trojan/view/post/post',
        controller: 'PostCtrl'
      })
      .when('/*', {
      //.otherwise({
        redirectTo: '/index'
      });

    //$locationProvider.html5Mode(true);

    console.debug('angular client "trojan" init\'ed');
  });

  $(document).ready(function () {

    //$('#tags').tagsInput({
    //  'height':'60px',
    //  'width':'280px'
    //});

    console.debug('App jQuery inited');
  });

