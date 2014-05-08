define(['jquery', 'underscore', 'underscore.string', 'd3', 'rickshaw'], function($, _) {
	var Rickshaw = require('rickshaw');
	var graph = new Rickshaw.Graph( require('graphdata').example1 );
	graph.render();
});

