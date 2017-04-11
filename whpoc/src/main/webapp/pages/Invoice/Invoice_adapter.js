/**
 * Created by Administrator on 2017/3/27.
 */
define(['/whpoc/config/require.config.js','/whpoc/pages/Invoice/Invoice.js'],function(config,Invoice){
    require('/whpoc/config/require.config.js');
    whctx="/whpoc";
//    var content = document.getElementById("content");
    return {
    	
//        init:Invoice.init(content);
	    init:function(content){
	    	Invoice.init(content);
	    }
    }
})