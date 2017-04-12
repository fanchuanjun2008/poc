define(['text!./saleorder.html','./meta.js','css!./saleorder.css','uuitree','uuigrid','./config/sys_const.js'], function (template) {
	
	var ctx = "/train";
   
  //开始初始页面基础数据
    var init =  function (element, params) {
        var viewModel = {
            draw: 1,//页数(第几页)
            pageSize: 5,
            searchURL: ctx + '/saleorder/list',
            addURL: ctx + "/saleorder/add",
            updateURL: ctx + "/saleorder/update",
            delURL: ctx + "/saleorder/delBatch",
            formStatus: _CONST.FORM_STATUS_ADD, 
            saleorderDa: new u.DataTable(metaDt),
            saleorderFormDa: new u.DataTable(metaDt),
			saleorder_cchanneltypeid:[{value:'inner', name:'内部客户'},{value:'outer', name:'外部渠道'},{value:'email', name:'电商销售'}],
			saleorder_fstatusflag:[{value:'0', name:'待审批'},{value:'1', name:'已审批'}],
           
            orderdetailDa: new u.DataTable(metaorderdetail),
            orderdetailFormDa: new u.DataTable(metaorderdetail),            
            
            orderreceiveDa: new u.DataTable(Receiveinfo),
            orderreceiveFormDa: new u.DataTable(Receiveinfo),

			refOrgDa: new u.DataTable({
				meta: {
                    'orgid': {},
                    'orgname': {},
                    'parentid': {}
                }
            }),
            
			refCustomerDa: new u.DataTable({
				meta: {
                    'pk_customer': {},
                    'customername': {},
                    'customercode':{}
                }
            }),
            
			refDeptDa: new u.DataTable({
				meta: {
                    'pk_dept': {},
                    'dept_name': {},
                    'parentid': {}
                }
            }),
                      
			refCurrtypeDa: new u.DataTable({
				meta: {
                    'pk_currtype': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refSysUserDa: new u.DataTable({
				meta: {
                    'id': {},
                    'user_name': {},
                    'parentid': {}
                }
            }),
            

            /**树默认设置 */
            treeSetting: {
                view: {
                    showLine: false,
                    selectedMulti: false
                },
                callback: {
                    onClick: function (e, id, node) {
                        var rightInfo = node.name + '被选中';
                        /*u.showMessage({msg: rightInfo, position: "topright",darkType:"dark",width:"420px"})*/
                    }
                }
            },
            
            event: {
                /**20161205修改最外层框架按钮组的显示与隐藏 */
                userListBtn: function () {  //显示user_list_button_2
                    $('#user_list_button_2').parent('.u-mdlayout-btn').removeClass('hide');
                    $('.form-search').removeClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').addClass('hide');

                },
                userCardBtn: function () {   //显示user_card_button
                    $('#user_list_button_2').parent('.u-mdlayout-btn').addClass('hide');
                    $('.form-search').addClass('hide');
                    $('#user_card_button').parent('.u-mdlayout-btn').removeClass('hide');
                },
                /**判断对象的值是否为空 */
                isEmpty: function (obj) {
                    if (obj.value == undefined || obj.value == '' || obj.value.length == 0) {
                        return true;
                    } else {
                        return false;
                    }
                },
                /**清除 datatable的数据  */
                clearDa: function (da) {
                    da.removeAllRows();
                    da.clear();
                },

                //加载初始列表
                initUerList: function () {
                    var jsonData = {
                        pageIndex: viewModel.draw - 1,
                        pageSize: viewModel.pageSize,
                        sortField: "ts",
                        sortDirection: "desc"
                    };
                    $(element).find(".input_search").each(function () {
                        if (!viewModel.event.isEmpty(this)) {
                            jsonData['search_' + $(this).attr('name')] = removeSpace(this.value);
                        }
                    });

                    $.ajax({
                        type: 'get',
                        url: viewModel.searchURL,
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        var totleCount = res.detailMsg.data.totalElements;
                                        var totlePage = res.detailMsg.data.totalPages;
                                        viewModel.comps.update({
                                            totalPages: totlePage,
                                            pageSize: viewModel.pageSize,
                                            currentPage: viewModel.draw,
                                            totalCount: totleCount
                                        });
                                        viewModel.event.clearDa(viewModel.saleorderDa);
                                        viewModel.event.clearDa(viewModel.orderdetailDa);
                                        viewModel.saleorderDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
                                    }
                                } else {
                                    var msg = "";
                                    for (var key in res.detailMsg) {
                                        msg += res.detailMsg[key] + "<br/>";
                                    }
                                    u.messageDialog({msg: msg, title: '请求错误', btnText: '确定'});
                                }
                            } else {
                                u.messageDialog({msg: '后台返回数据格式有误，请联系管理员', title: '数据错误', btnText: '确定'});
                            }
                        } 
                    });
                    //end ajax
                },

                pageChange: function () {
                    viewModel.comps.on('pageChange', function (pageIndex) {
                        viewModel.draw = pageIndex + 1;
                        viewModel.event.initUerList();
                    });
                },
                //end pageChange
                sizeChange: function () {
                    viewModel.comps.on('sizeChange', function (arg) {
                        //数据库分页
                        viewModel.pageSize = parseInt(arg);
                        viewModel.draw = 1;
                        viewModel.event.initUerList();
                    });
                },
                //end sizeChange

                search: function () {
                    viewModel.draw = 1;
                    viewModel.event.initUerList();
                },
                cleanSearch: function () {
                    $(element).find('.form-search').find('input').val('');
                },
                //以下用于check checkbox
                afterAdd: function (element, index, data) {
                    if (element.nodeType === 1) {
                        u.compMgr.updateComp(element);
                    }
                },
                goBack: function () {
                    //只显示新增编辑删除按钮
                    viewModel.event.userListBtn();
                    viewModel.md.dBack();
                    viewModel.event.initUerList();
                },

                addClick: function () {
                    viewModel.formStatus = _CONST.FORM_STATUS_ADD;
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    viewModel.event.clearDa(viewModel.saleorderFormDa);
                    viewModel.saleorderFormDa.createEmptyRow();
                    viewModel.saleorderFormDa.setRowSelect(0);
                    viewModel.event.clearDa(viewModel.orderdetailFormDa);
                    //设置业务操作逻辑
                    var row = viewModel.saleorderFormDa.getCurrentRow();
                    $('#ordertab')[0]['u.Tabs'].show('poorder_detailPage')
                    var myDate = new Date();    
                    viewModel.saleorderFormDa.setValue("dbilldate",myDate.toLocaleDateString());
                    viewModel.orderdetailFormDa.on("valueChange", viewModel.event.orderdetailValueChange)
                    viewModel.saleorderFormDa.on("valueChange", viewModel.event.saleorderValueChange)
                    document.getElementById('fstatusflag')['u.Combo'].setName("待审批");
                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },
                editClick: function () {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    var selectArray = viewModel.saleorderDa.selectedIndices();
                    if (selectArray.length < 1) {
                        u.messageDialog({
                            msg: "请选择要编辑的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    if (selectArray.length > 1) {
                        u.messageDialog({
                            msg: "一次只能编辑一条记录，请选择要编辑的记录!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    //获取选取行数据
                    viewModel.saleorderDa.setRowSelect(selectArray);
                    viewModel.saleorderFormDa.clear();
                    viewModel.orderdetailFormDa.clear();
                    viewModel.orderreceiveFormDa.clear();
                    viewModel.saleorderFormDa.setSimpleData(viewModel.saleorderDa.getSimpleData({type: 'select'}));
                    viewModel.orderdetailFormDa.setSimpleData(viewModel.orderdetailDa.getSimpleData(), {unSelect: true});
                    viewModel.orderreceiveFormDa.setSimpleData(viewModel.orderreceiveDa.getSimpleData(), {unSelect: true});
                    $('#ordertab')[0]['u.Tabs'].show('poorder_detailPage')
                    var myDate = new Date();    
                    viewModel.saleorderFormDa.setValue("dbilldate",myDate.toLocaleDateString());
                    viewModel.orderdetailFormDa.on("valueChange", viewModel.event.orderdetailValueChange)
                    viewModel.saleorderFormDa.on("valueChange", viewModel.event.saleorderValueChange)
                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },

                saveClick: function () {
                    // compsValidate是验证输入格式。
                    if (! app.compsValidate($(element).find('#user-form')[0])) {
                        return;
                    }
                   
                    var user = viewModel.saleorderFormDa.getSimpleData();
                    var userJob = viewModel.orderdetailFormDa.getSimpleData();
                    var reinfo = viewModel.orderreceiveFormDa.getSimpleData();
                    
                    var jsondata =user[0];
                    jsondata.id_orderdetail = userJob;
                    jsondata.id_receiveinfo = reinfo;
                    var sendurl = viewModel.addURL;
                    if (viewModel.formStatus === _CONST.FORM_STATUS_EDIT) {
                        sendurl = viewModel.updateURL;
                    }
                    $.ajax({
                        type: "post",
                        url: sendurl,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsondata),//将对象序列化成JSON字符串
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    u.showMessage({
                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>操作成功",
                                        position: "bottom"
                                    });
                                    viewModel.event.goBack();
                                } else {
                                    var msg = "";
                                    if (res.success == 'fail_global') {
                                        msg = res.message;
                                    } else {
                                        for (var key in res.detailMsg) {
                                            msg += res.detailMsg[key] + "<br/>";
                                        }
                                    }
                                    u.messageDialog({msg: msg, title: '请求错误', btnText: '确定'});
                                }
                            } else {
                                u.messageDialog({msg: '没有返回数据', title: '操作提示', btnText: '确定'});
                            }
                        } 
                    });
                },
                /**删除选中行*/
                delRow: function () {
                    var selectArray = viewModel.saleorderDa.selectedIndices();
                    if (selectArray.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                        return;
                    }
                    u.confirmDialog({
                        msg: '<div class="pull-left col-padding" >' +
                        '<i class="fa fa-exclamation-circle margin-r-5 fa-3x orange" style="vertical-align:middle"></i>确认删除这些数据数据吗？</div>',
                        title: '警告',
                        onOk: function () {
                            viewModel.event.delConfirm();
                        }
                    });
                },
                /**确认删除*/
                delConfirm: function () {
                    var jsonDel = viewModel.saleorderDa.getSimpleData({type: 'select'});
                    $.ajax({
                        type: "post",
                        url: viewModel.delURL,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsonDel),
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    /*u.showMessage({
                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                        position: "center"
                                    })*/
                                    viewModel.event.initUerList();
                                } else {
                                    u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
                                }
                            } else {
                                u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
                            }
                        }
                        
                    });
                },
                customerRowClick: function (row, e) {
               	 var ri = e.target.parentNode.getAttribute('rowindex')
               	 viewModel.refCityDa.setRowSelect(parseInt(ri));
               },
                rowClick: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.saleorderDa.setRowFocus(parseInt(ri));
                        viewModel.saleorderDa.setRowSelect(parseInt(ri));
                    }
                    viewModel.saleorderFormDa.setSimpleData(viewModel.saleorderDa.getSimpleData({type: 'select'}));
                    var userId = viewModel.saleorderFormDa.getValue("pk_projectapp");
                    if (userId == null || userId == "") {
                        viewModel.orderdetailDa.removeAllRows();
                        viewModel.orderdetailDa.clear();
                    } else {
                        viewModel.event.getUserJobList();
                    }
                },
                selectUserJob: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.orderdetailDa.setRowFocus(parseInt(ri));
                        viewModel.orderdetailDa.setRowSelect(parseInt(ri));
                    }
                },
                //选择参照（树）
                selectOrg_saleorder: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/saleorder/Org/listall';
                    viewModel.event.showOrgTreeDiv_saleorder(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showOrgTreeDiv_saleorder: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refOrgDa.setSimpleData(res.detailMsg.data);
                                $("#orgForsaleorderTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-orgForsaleorder',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_OrgTosaleorder'), null, viewModel.event.confirmSelectOrgTosaleorder);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        } 
                    });
                },
                
                /**选中某一个参照到主表 */
                confirmSelectOrgTosaleorder: function () {
                    var zTree = $("#orgForsaleorderTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refOrgDa.getRowByField('orgid', id).getSimpleData();
                        viewModel.saleorderFormDa.setValue('pk_org', node.orgid)
                        viewModel.saleorderFormDa.setValue('pk_org_name', node.orgname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照
                selectCustomer_saleorder: function () {
                    var title = '请选择参照值';
                    var url = ctx + '/saleorder/Customer/listall';
                    viewModel.event.showCustomerTreeDiv_saleorder(null, url, title);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 */
                showCustomerTreeDiv_saleorder: function (sendjson, ajaxurl, title) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#table-title').html(title);
                                viewModel.refCustomerDa.setSimpleData(res.detailMsg.data);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-customerForsaleorder',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_CustomerTosaleorder'), null, viewModel.event.confirmSelectCustomerTosaleorder);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        } 
                    });
                },
                     
               
                //选择参照（树）
                selectDept_saleorder: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/saleorder/Dept/listall';
                    viewModel.event.showDeptTreeDiv_saleorder(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showDeptTreeDiv_saleorder: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refDeptDa.setSimpleData(res.detailMsg.data);
                                $("#deptForsaleorderTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-deptForsaleorder',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_DeptTosaleorder'), null, viewModel.event.confirmSelectDeptTosaleorder);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        } 
                    });
                },
                
                /**选中某一个参照到主表 */
                confirmSelectDeptTosaleorder: function () {
                    var zTree = $("#deptForsaleorderTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refDeptDa.getRowByField('pk_dept', id).getSimpleData();
                        viewModel.saleorderFormDa.setValue('cdeptvid', node.pk_dept)
                        viewModel.saleorderFormDa.setValue('cdeptvid_name', node.dept_name);
                    }
                    viewModel.event.mdClose();
                },               

                

                /**选中某一个参照到主表 */
                confirmSelectCustomerTosaleorder: function () {
                	var node = viewModel.refCustomerDa.getCurrentRow().getSimpleData();
                    viewModel.saleorderFormDa.setValue('cinvoicecustid', node.pk_customer)
                    viewModel.saleorderFormDa.setValue('cinvoicecustid_name', node.name);
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectCurrtype_saleorder: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/saleorder/Currtype/listall';
                    viewModel.event.showCurrtypeTreeDiv_saleorder(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showCurrtypeTreeDiv_saleorder: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refCurrtypeDa.setSimpleData(res.detailMsg.data);
                                $("#currtypeForsaleorderTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-currtypeForsaleorder',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_CurrtypeTosaleorder'), null, viewModel.event.confirmSelectCurrtypeTosaleorder);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        } 
                    });
                },
                
                /**选中某一个参照到主表 */
                confirmSelectCurrtypeTosaleorder: function () {
                    var zTree = $("#currtypeForsaleorderTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refCurrtypeDa.getRowByField('pk_currtype', id).getSimpleData();
                        viewModel.saleorderFormDa.setValue('corigcurrencyid', node.pk_currtype)
                        viewModel.saleorderFormDa.setValue('corigcurrencyid_name', node.name);
                    }
                    viewModel.event.mdClose();
                },               
               

                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showSysUserTreeDiv_saleorder: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refSysUserDa.setSimpleData(res.detailMsg.data);
                                $("#sysUserForsaleorderTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-sysUserForsaleorder',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_SysUserTosaleorder'), null, viewModel.event.confirmSelectSysUserTosaleorder);
                            } else {
                                u.showMessage({
                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
                                    position: "bottom",
                                    msgType: "error"
                                });
                            }
                        } 
                    });
                },
             
               
                //选择参照（树）
                selectSysUser_saleorder: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/saleorder/SysUser/listall';
                    viewModel.event.showSysUserTreeDiv_saleorder(null, url, title, this.treeSetting);
                },
                
                
                /**选中某一个参照到主表 */
                confirmSelectSysUserTosaleorder: function () {
                    var zTree = $("#sysUserForsaleorderTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refSysUserDa.getRowByField('id', id).getSimpleData();
                        viewModel.saleorderFormDa.setValue('modifier', node.id)
                        viewModel.saleorderFormDa.setValue('modifier_name', node.user_name);
                    }
                    viewModel.event.mdClose();
                },               
               

                /**
                 * 树弹窗公共方法中取消按钮
                 */

                mdClose: function () {
                    md.close();
                },                

                /**绑定弹出层 树的按钮 */
                bindClickButton: function (ele, data, functionevent) { //对某一个按钮进行  点击事假绑定 ele:被绑定的元素，  data：需要传递的数据，functionevent：绑定的方法
                    $(ele).unbind('click'); //取消之前的绑定
                    $(ele).bind('click', data, functionevent); //重新绑定
                },

                /**子表列表 */
                getUserJobList: function () {
                    var userId = viewModel.saleorderFormDa.getValue("pk_projectapp");
                    var jsonData = {
                        pageIndex: 0,
                        pageSize: viewModel.pageSize,
                        sortField: "ts",
                        sortDirection: "asc"
                    };
                    jsonData['search_fk_id_orderdetail'] = userId;
                    $.ajax({
                        type: 'GET',
                        url: ctx + '/orderdetail/list',
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg) {
                                        viewModel.orderdetailDa.removeAllRows();
                                        viewModel.orderdetailDa.clear();
                                        viewModel.orderdetailDa.setSimpleData(res.detailMsg.detaildata.content, {unSelect: true});
                                        viewModel.orderdetailFormDa.setSimpleData(res.detailMsg.detaildata.content, {unSelect: true});
                                       
                                        viewModel.orderreceiveDa.removeAllRows();
                                        viewModel.orderreceiveDa.clear();
                                        viewModel.orderreceiveDa.setSimpleData(res.detailMsg.infodata.content, {unSelect: true});
                                        viewModel.orderreceiveFormDa.setSimpleData(res.detailMsg.infodata.content, {unSelect: true});
                                    }
                                } else {
                                    var msg = "";
                                    for (var key in res.message) {
                                        msg += res.message[key] + "<br/>";
                                    }
                                    u.messageDialog({msg: msg, title: '请求错误', btnText: '确定'});
                                }
                            } else {
                                u.messageDialog({msg: '后台返回数据格式有误，请联系管理员', title: '数据错误', btnText: '确定'});
                            }
                        } 
                    });
                },
                //
                addUserJob: function () {
                	var ordertab = document.getElementById("ordertab").childNodes;
                	for(var i=0; i<ordertab.length;i++){
                		if(ordertab[i].className!=null && ordertab[i].className.indexOf("is-active")>=0){
                			if(ordertab[i].id == "poorder_detailPage"){
                				 viewModel.orderdetailFormDa.createEmptyRow();
                			}else
                				viewModel.orderreceiveFormDa.createEmptyRow();
                		}
                	}
                   
                },
                orderdetailValueChange: function (e){
                	if(e.field=="nnum"){
                		viewModel.orderdetailFormDa.setValue("nastnum",e.newValue);
                	}
                	if(e.field=="nqtorigprice"){
                		nastnum = viewModel.orderdetailFormDa.getValue("nastnum")
                		nqtorigprice = e.newValue
                		viewModel.orderdetailFormDa.setValue("norigtaxmny",Number(nastnum)*Number(nqtorigprice));
                	}
                	
                },
                saleorderValueChange: function (e){
                	if(e.field=="cchanneltypeid" && e.newValue=="inner"){
                		 document.getElementById('ctransporttypeid').disabled = true;
                	}else{
                		document.getElementById('ctransporttypeid').disabled = false;
                	}
                	
                },
                delUserJob: function () {
                	var ordertab = document.getElementById("ordertab").childNodes;
                	for(var i=0; i<ordertab.length;i++){
                		if(ordertab[i].className!=null && ordertab[i].className.indexOf("is-active")>=0){
                			if(ordertab[i].id == "poorder_detailPage"){
                				 var userJobs = viewModel.orderdetailFormDa.getSimpleData({type: 'select'})
                                 if (userJobs.length < 1) {
                                     u.messageDialog({
                                         msg: "请选择要删除的行!",
                                         title: "提示",
                                         btnText: "OK"
                                     });
                                 }

                                 if (confirm("确定要删除吗?")) {
                                     var jsonDel = viewModel.orderdetailFormDa.getSimpleData({type: 'focus'});
                                     var index = viewModel.orderdetailFormDa.getFocusIndex();
                                     if (jsonDel[0].pk_orderdetail == null) {
                                         viewModel.orderdetailFormDa.removeRows(index);
                                         return;
                                     }
                                     $.ajax({
                                         type: "post",
                                         url: ctx + "/orderdetail/del",
                                         contentType: 'application/json;charset=utf-8',
                                         data: JSON.stringify(jsonDel[0]),
                                         success: function (res) {
                                             if (res) {
                                                 if (res.success == 'success') {
                                                    /* u.showMessage({
                                                         msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                                         position: "center"
                                                     })*/
                                                     viewModel.orderdetailFormDa.removeRows(index);
                                                 } else {
                                                     u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
                                                 }
                                             } else {
                                                 u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
                                             }
                                         } 
                                     });
                                 }
                			}else
                				 var userJobs = viewModel.orderreceiveFormDa.getSimpleData({type: 'select'})
                                 if (userJobs.length < 1) {
                                     u.messageDialog({
                                         msg: "请选择要删除的行!",
                                         title: "提示",
                                         btnText: "OK"
                                     });
                                 }

                                 if (confirm("确定要删除吗?")) {
                                     var jsonDel = viewModel.orderreceiveFormDa.getSimpleData({type: 'focus'});
                                     var index = viewModel.orderreceiveFormDa.getFocusIndex();
                                     if (jsonDel[0].pk_receiveinfo == null) {
                                         viewModel.orderreceiveFormDa.removeRows(index);
                                         return;
                                     }
                                     $.ajax({
                                         type: "post",
                                         url: ctx + "/receive/del",
                                         contentType: 'application/json;charset=utf-8',
                                         data: JSON.stringify(jsonDel[0]),
                                         success: function (res) {
                                             if (res) {
                                                 if (res.success == 'success') {
                                                    /* u.showMessage({
                                                         msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                                         position: "center"
                                                     })*/
                                                     viewModel.orderreceiveFormDa.removeRows(index);
                                                 } else {
                                                     u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
                                                 }
                                             } else {
                                                 u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
                                             }
                                         } 
                                     });
                                 }
                		}
                	}
                   
                },              
                
				/**枚举类型渲染 */
				changesaleordercchanneltypeid: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.saleorder_cchanneltypeid.length;i++ ){
                    	if(v == viewModel.saleorder_cchanneltypeid[i].value ){
                    		return viewModel.saleorder_cchanneltypeid[i].name ;
                    	} 
                    }
                },
                changesaleorderfstatusflag: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.saleorder_fstatusflag.length;i++ ){
                    	if(v == viewModel.saleorder_fstatusflag[i].value ){
                    		return viewModel.saleorder_fstatusflag[i].name ;
                    	} 
                    }
                },


            } // end  event

        };
        //end viewModel


        $(element).html(template);
        var app = u.createApp({
            el: '#content',
            model: viewModel
        });
        viewModel.md = $(element).find('#user-mdlayout')[0]['u.MDLayout'];
        var paginationDiv = $(element).find('#pagination')[0];
        viewModel.comps = new u.pagination({el: paginationDiv, jumppage: true});
        
        viewModel.childdraw=1 ;

        viewModel.event.initUerList();
        viewModel.event.pageChange();
        viewModel.event.sizeChange();
        $('#otab')[0]['u.Tabs'].show('detailPage')

    }  //end init

    return {
        'model': init.viewModel,
        'template': template,
        init: function (params, arg) {
            init(params, arg);
            /*回车搜索*/
            $('.search-enter').keydown(function (e) {
                if (e.keyCode == 13) {
                    $('#user-action-search').trigger('click');

                }
            });
        }
    }
});
//end define
