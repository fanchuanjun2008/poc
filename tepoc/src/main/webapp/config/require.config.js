require.config({
	baseUrl: ".",
	paths: {
		text: "vendor/requirejs/text",
		css: "vendor/requirejs/css",
		jquery: "vendor/jquery/jquery-1.11.2",
		ajaxfileupload: "vendor/jquery/ajaxfileupload",
		bootstrap: 'vendor/bootstrap/js/bootstrap',
		knockout: "vendor/knockout/knockout-3.2.0.debug",
		uui: "vendor/uui/js/u",
		uuigrid: "vendor/uui/js/u-grid",
		uuitree: "vendor/uui/js/u-tree",
		director:"vendor/director/director",
		biz: "vendor/uui/js/u.biz",
		pages:"pages",
		scrollbarmin:"vendor/jquery.mCustomScrollbar.concat",
		'refComp': "/uitemplate_web/static/js/uiref/refComp",
		'ossupload': "/iuap-saas-filesystem-service/resources/js/ossupload",
		'interfaceFile': "/iuap-saas-filesystem-service/resources/js/interface.file",
		'interfaceFileImpl': "/iuap-saas-filesystem-service/resources/js/interface.file.impl",
		'iReferComp':"pages/tools/iReferComp",
	},
	shim: {
		'uui':{
			deps:["knockout"]
		},
		'uuigrid':{
			deps:["uui","refComp","css!vendor/uui/css/grid.css"]
		},
		'bootstrap': {
			deps: ["jquery"]
		},
		'uuitree':{
			deps: ["uui","refComp","css!vendor/uui/css/tree.css"]
		},
		'ajaxfileupload':{
			deps: ["refComp"]
		},
		refComp:{
        	deps: ["css!/uitemplate_web/static/css/ref/ref.css","css!/uitemplate_web/static/css/ref/jquery.scrollbar.css","css!/uitemplate_web/static/trd/bootstrap-table/src/bootstrap-table.css"]
        }
	}
});
