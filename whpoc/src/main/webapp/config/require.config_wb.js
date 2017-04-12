require.config({
	baseUrl: ".",
	paths: {
		text: "/whpoc/vendor/requirejs/text",
		css: "/whpoc/vendor/requirejs/css",
		jquery: "/whpoc/vendor/jquery/jquery-1.11.2",
		bootstrap: '/whpoc/vendor/bootstrap/js/bootstrap',
		knockout: "/whpoc/vendor/knockout/knockout-3.2.0.debug",
		uui: "/whpoc/vendor/uui/js/u",
		uuigrid: "/whpoc/vendor/uui/js/u-grid",
		uuitree: "/whpoc/vendor/uui/js/u-tree",
		director:"/whpoc/vendor/director/director",
		biz: "/whpoc/vendor/uui/js/u.biz",
		pages:"pages",
		scrollbarmin:"/whpoc/vendor/jquery.mCustomScrollbar.concat",
	},
	shim: {
		'uui':{
			deps:["knockout"]
		},
		'uuigrid':{
			deps:["uui","css!/whpoc/vendor/uui/css/grid.css"]
		},
		'bootstrap': {
			deps: ["jquery"]
		},
		'uuitree':{
			deps: ["uui","css!/whpoc/vendor/uui/css/tree.css"]
		}
	}
});
