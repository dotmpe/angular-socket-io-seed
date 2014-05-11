'use strict';

define([
		'angularAMD', 
		"angular-route", 
//		"trojan/module/directives", 
		"trojan/module/filters", 
		"trojan/module/services", 
//		"trojan/module/controllers", 
], function(angularAMD) {

	console.info("Loading 'trojan' Angular app");

	var app = angular.module("trojan", [
//		'trojan.directives',
		'trojan.filters',
		'trojan.services',
		'ngRoute',
	]);
	app.config(function ($routeProvider) {
		$routeProvider
			.when("/index", angularAMD.route({
				//templateUrl: '/clients/views/home.html', 
				templateUrl: '/trojan/view/home/home',
				controller: 'HomeCtrl', 
				//controllerUrl: 'app/controllers/home'
				navTab: 'home'
			}))
			.when('/map', angularAMD.route({
				templateUrl: '/trojan/view/map/map',
				controller: 'MapCtrl',
				navTab: 'map'
			}))
			.when('/account', angularAMD.route({
				templateUrl: '/trojan/view/account/account',
				controller: 'AccountCtrl',
				//controllerUrl: 'app/controllers/account'
				navTab: 'account'
			}))
			.when('/account/list', angularAMD.route({
				templateUrl: '/trojan/view/account/list',
				controller: 'AccountCtrl',
				navTab: 'account'
			}))
			.when('/account/post', angularAMD.route({
				templateUrl: '/trojan/view/post/post',
				controller: 'PostCtrl',
				navTab: 'account'
			}))
			.otherwise({redirectTo: "/index" });
		//function ($routeProvider, $locationProvider) {
		// Enable to get rid of hash-URL's
		// I like them however while I am devving, as there is no framework in place
		// that transparently routes server-side routes to the client here.
		//$locationProvider.html5Mode(true);
	});

	// used for GoogleAnalytics in navMenu
	app.constant("SiteName", "/trojan");

	console.debug("Bootstrapping 'trojan'");
	angularAMD.bootstrap(app);
	return app;
});

