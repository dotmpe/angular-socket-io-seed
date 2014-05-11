cdn_paths = {
	app: "../x-bookshelf",
	jquery: "//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery",
	jqueryui: "//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui",
	underscore: "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore",
	"underscore.string": "//cdnjs.cloudflare.com/ajax/libs/underscore.string/2.3.3/underscore.string.min",
	backbone: "//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.2/backbone-min",
	'backbone.localstorage': "//raw.githubusercontent.com/jeromegn/Backbone.localStorage/master/backbone.localStorage",
	'coffee-script': '//cdnjs.cloudflare.com/ajax/libs/coffee-script/1.7.1/coffee-script.min',
	cs: '//raw.github.com/jrburke/require-cs/latest/cs'
}; 
local_dev_paths = {
	app: "../x-bookshelf",
	jquery: "/components/jquery/dist/jquery",
	underscore: "/components/underscore/underscore",
	"underscore.string": "/components/underscore.string/underscore.string",
	backbone: "/components/backbone/backbone",
	"backbone.localstorage": "/components/backbone.localstorage/backbone.localStorage",
	bootstrap: "/components/bootstrap/dist/js/bootstrap",
	"coffee-script": "/components/coffee-script/extras/coffee-script",
	cs: "/components/require-cs/cs",
	etch: "/components/etch/scripts/etch"
};
requirejs.config({
	baseUrl: "/script/lib",
	paths: local_dev_paths,
	shim: {
		backbone: {exports:"Backbone"},
    etch: { deps: ['backbone'], exports: 'etch' }
	}
});
require(["cs!app/main"]);

