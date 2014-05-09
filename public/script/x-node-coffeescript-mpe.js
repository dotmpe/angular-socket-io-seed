paths = {
	app: "../x-node-coffeescript-mpe",
	jquery: "//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery",
	jqueryui: "//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui",
	underscore: "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore",
	"underscore.string": "//cdnjs.cloudflare.com/ajax/libs/underscore.string/2.3.3/underscore.string.min",
  backbone: "//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min",
	'backbone.localstorage': "//raw.githubusercontent.com/jeromegn/Backbone.localStorage/master/backbone.localStorage",
  'coffee-script': '//cdnjs.cloudflare.com/ajax/libs/coffee-script/1.7.1/coffee-script.min',
  'cs': '//raw.github.com/jrburke/require-cs/latest/cs'
}; 
requirejs.config({
	baseUrl: "/script/lib",
	paths: paths,
	shim: {
		backbone: {exports:"Backbone"}
	}, 
	packages: [
	]
});
require(["cs!/script/x-node-coffeescript-mpe/main"])
