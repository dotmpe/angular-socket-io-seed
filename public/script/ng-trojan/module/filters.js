'use strict';

/* Filters */

define(['angularAMD'], function (angularAMD) {
	angular.module('trojan.filters', [ ])
		.filter('interpolate', function (version) {
			return function (text) {
				return String(text).replace(/\%VERSION\%/mg, version);
			}
		});
}); 



