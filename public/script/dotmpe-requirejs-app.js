// XXX Configured to run from static page in media/template
// loading modules from the lib directory,
// except 'app' ones, 
var paths = {
	"app": "../dotmpe-requirejs-app",
		
	//"jquery": "//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min",
	"jquery": "//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min",
	"jqueryui": "//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min",
	"underscore": "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore-min",
	"underscore.string": "//cdnjs.cloudflare.com/ajax/libs/underscore.string/2.3.3/underscore.string.min",
	"d3": "//cdnjs.cloudflare.com/ajax/libs/d3/3.4.2/d3.min",
	"rickshaw": "//cdnjs.cloudflare.com/ajax/libs/rickshaw/1.4.6/rickshaw.min",
	"markdown" : "/script/markdown"
}
devPaths = {
	"app": "../dotmpe-requirejs-app",
		
	"jquery": "//cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery",
	"jqueryui": "//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.3/jquery-ui",
	"underscore": "//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.6.0/underscore",
	"underscore.string": "//cdnjs.cloudflare.com/ajax/libs/underscore.string/2.3.3/underscore.string.min",
	"d3": "//cdnjs.cloudflare.com/ajax/libs/d3/3.4.2/d3",
	"rickshaw": "//cdnjs.cloudflare.com/ajax/libs/rickshaw/1.4.6/rickshaw",
	"markdown" : "/script/markdown"
}; 
requirejs.config({
	baseUrl: "/script/lib",
//	paths: paths,
	paths: devPaths,
	shim: {
		"d3": { exports: "d3", },
		"rickshaw": { exports: "Rickshaw", deps: [ "d3" ] },
		"markdown": { exports: "exports" }
	}
});
requirejs(["graphdata"]);
requirejs(["markdown-editor"]);
requirejs(["app/toolkit"]);
requirejs(["app/d3"]);
requirejs(["app/dashboard"]);
