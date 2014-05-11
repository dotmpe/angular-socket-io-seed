define([
	'trojan/app'
], function (app) {
	// Add support for pretty print
	app.directive('prettyprint', function() {
		return {
			restrict: 'C',
			link: function postLink(scope, element, attrs) {
				element.html(prettyPrint(scope.dom));
			}
		};
	});
});
