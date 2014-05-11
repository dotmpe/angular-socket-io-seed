devPaths = {
	app: "./ng-coffee/module",
	'socket.io': '/socket.io/socket.io',
	angular: '/components/angular/angular',
	'angular.route': '/components/angular-route/angular-route',
	'angular.socket-io': '/components/angular-socket-io/socket',
	jquery: '/components/jquery/dist/jquery',
	bootstrap: '/components/bootstrap/dist/js/bootstrap',
	'coffee-script': '//cdnjs.cloudflare.com/ajax/libs/coffee-script/1.7.1/coffee-script.min',
	cs: '//raw.github.com/jrburke/require-cs/latest/cs'
}; 
requirejs.config({
	baseUrl: "/script/",
	paths: devPaths,
	shim: { 
		angular: { exports: 'angular' },
	},
	deps: [
		"cs!./ng-coffee/app"
	]
});
//require([ 
//		"jquery", "socket.io", 
//		"angular",
//		"angular.route", 
//		"angular.socket-io",
//		"cs!app/controllers",
//		"cs!app/services",
//		"cs!app/filters",
//		"cs!app/directives",
//	]);
/*"bootstrap",*/ 
/*
, "angular.route", "angular.socket-io" ])
*/
