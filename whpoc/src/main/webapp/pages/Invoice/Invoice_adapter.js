/**
 * Created by Administrator on 2017/3/27.
 */
define(['/whpoc/config/require.config_iuap.js','./Invoice.js'],function(config,Invoice){
    require('/whpoc/config/require.config_iuap.js');
    ctx="/whpoc";
    return {
        init:Invoice.init()
    }
})