'use strict'

# Maybe convert another version to RequireJs first
# http://www.startersquad.com/blog/angularjs-requirejs/
angular.module( 'ng-trojan-cs', [
		'ngRoute'
		'ng-trojan-cs.controllers'
		'ng-trojan-cs.services'
		'ng-trojan-cs.filters'
		'ng-trojan-cs.directives'
		# 3rd party dependencies
		'btford.socket-io' # angular-socket-io
	])
	.config(($routeProvider, $locationProvider) ->
		$routeProvider
			.when('/index', 
				templateUrl: '/trojan/view/home/home'
				controller: 'HomeCtrl'
			)
			.when('/account',
				templateUrl: '/trojan/view/account/account'
				controller: 'AccountCtrl'
			)
			.when('/account/list',
				templateUrl: '/trojan/view/account/list'
				controller: 'AccountCtrl'
			)
			.when('/post',
				templateUrl: '/trojan/view/post/post'
				controller: 'PostCtrl'
			)
			.otherwise(
				redirectTo: '/index'
			)

		# locationProvider.html5Mode(true);
		console.debug('angular client "trojan" init\'ed')
	)

$(document).ready(() ->

	#$('#tags').tagsInput(
	#  'height':'60px',
	#  'width':'280px'
	#)

	console.debug('App jQuery inited')
)



