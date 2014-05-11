local_dev_paths = {
	jquery: 					"/components/jquery/dist/jquery",
	underscore: 				"/components/underscore/underscore",
	"underscore.string":		"/components/underscore.string/underscore.string",
	backbone:					"/components/backbone/backbone",
	"backbone.localstorage":"/components/backbone.localstorage/backbone.localStorage",
	bootstrap:					"/components/bootstrap/dist/js/bootstrap",
	"coffee-script":			"/components/coffee-script/extras/coffee-script",
	cs: 						"/components/require-cs/cs",
	etch: 						"/components/etch/scripts/etch",
	async:						"/components/requirejs-plugins/src/async",
	"socket.io":				'/socket.io/socket.io',
	'angular':					'/components/angular/angular',
	'angular-route':			'/components/angular-route/angular-route',
	'angular.socket-io':		'/components/angular-socket-io/socket',
	'angularAMD': 				'/components/angularAMD/angularAMD',

// see https://github.com/marcoslin/angularAMD
//        'ui-bootstrap': '../lib/angular-ui-bootstrap/ui-bootstrap-tpls',
//        'prettify': '../lib/google-code-prettify/prettify',
	
	HomeCtrl: 'ng-trojan/controllers/home',
	MapCtrl: 'ng-trojan/controllers/map',
	AccountCtrl: 'ng-trojan/controllers/account',
	PostCtrl: 'ng-trojan/module/controllers',
	
	trojan: "ng-trojan",
};
requirejs.config({
	paths: local_dev_paths,
	shim: {
		bootstrap:['jquery'],
//	backbone: {exports:"Backbone", deps: ['jquery', 'underscore']},
//	etch: { deps: ['backbone'], exports: 'etch' },
//		angular: { exports: 'angular' },
		'socket.io': ['angular'],
		'angular.socket-io': ['angular'],
		angularAMD: ['angular'],
		'angular-route': ['angular']
	},
	deps: [ 
		"trojan/app" 
	]
});

