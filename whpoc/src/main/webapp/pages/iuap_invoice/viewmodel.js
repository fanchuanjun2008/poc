define(function(require, module, exports){
    //var templetutils = require('./uitemplate/templetutils');
    // 引入相关的功能插件或模块
    var html = require('text!./invoice.html');
    require('/uitemplate_web/static/js/rt/templetutils.js');
    require('/whpoc/pages/iuap_invoice/uitemplate/controller.js');
    require('css!/uitemplate_web/static/trd/bootstrap-table/src/bootstrap-table.css');
    var saveurl='/whpoc/ui_invoice/add';
    require('/uitemplate_web/static/js/uiref/reflib.js');
    require('/uitemplate_web/static/js/uiref/refer.js');
    require('/uitemplate_web/static/js/uiref/refGrid.js');
    require('/uitemplate_web/static/js/uiref/refGridtree.js');
    require('/uitemplate_web/static/js/uiref/refTree.js');
    require('/uitemplate_web/static/js/uiref/refcommon.js');
    require('/uitemplate_web/static/js/uiref/uiReferComp.js');
    var dialogmin=require('dialogmin');
    var controler = {
        invoiceId:ko.observable(),
        events:{
            goback:function(){
                window.history.go(-1);
                return false;
            },
            grid_save:function(){
                var templateModel = new TemplateModel(app);
                var data = templateModel.getAllValue();
                var param = {};
                //app.getDataTable('headform').parent datatable的上一级就是viewModel
                param.templateInfo = templateModel.getTemplateInfo();
                param.headData = JSON.stringify(data);
                param.body = JSON.stringify()
                var cls = "com.yonyou.iuap.eiap.entity.Reimbursebill";
                var icls = "com.yonyou.iuap.eiap.entity.Reimburseitem";
                param.cls = cls;
                param.icls = icls;
                $.ajax({
                    type: "POST",
                    url: saveurl,
                    data:param,
                    async:true,
                    dataType: "json" ,
                    success: function(result) {
                        //清理数据
                        //设置数据
                        if(result.flag=="success"){
                            //app.getDataTable('headform').parent.headform_isEditable(false);
                            alert('保存成功！');
                            controler.invoiceId(result.body.id);
                        }
                    }
                });

            },
            cancel:function () {
                app.getDataTable('headform').parent.headform_isEditable(false);
            }
        },
        pageInit:function(){
            var app = u.createApp({
                el: '#inovoice',
                model: controler
            });
            //app.init(controler,null,false);
            //window.app = app;
            require(['/uitemplate_web/static/js/rt/templetutils.js','/whpoc/pages/iuap_invoice/uitemplate/controller.js'],function () {
                var templetUtils = new TempletUtils(app);
                templetUtils.initTemplateComponent('template-invoice', 'invoice', 'invoices','/whpoc/pages/iuap_invoice/uitemplate/controller.js',true);
                // templetUtils.initTemplateComponent('template-deptref', 'organization_ref', 'org','/wbalone/pages/dept/uitemplate/controller.js',true);

            });
        }
    } ;
    return {
        init: function (content) {
            // 插入内容
            content.innerHTML = html;
            // 执行主逻辑
            controler.pageInit();
            // 获取节点配置模型中的模板信息
            // 调用模板工具初始化模板
        }
    }
});

