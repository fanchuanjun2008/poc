/**
 * Created by Administrator on 2017/3/27.
 */
define(['/whpoc/config/require.config_wb.js','/whpoc/pages/Invoice_wb/Invoice.js'],function(config,Invoice){
    require('/whpoc/config/require.config_wb.js');
    whctx="/whpoc";
//    var content = document.getElementById("content");
    return {
    	
//        init:Invoice.init(content);
	    init:function(content){
	    	Invoice.init(content);
	    }
    }
})