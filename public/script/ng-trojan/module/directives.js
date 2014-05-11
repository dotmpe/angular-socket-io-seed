'use strict';

/* Directives */

define(['angularAMD'], function (angularAMD) {
	angular.module('trojan.directives', [ ])
		.directive('appVersion', function (version) {
			return function(scope, elm, attrs) {
				elm.text(version);
			};
		});
}); 


