define(['text!pages/ywsub/ygdemo_yw_info/ygdemo_yw_info_sub.html','pages/ywsub/ygdemo_yw_info/meta','css!pages/ywsub/ygdemo_yw_info/ygdemo_yw_info.css', 'uuitree', 'uuigrid', 'config/sys_const'], function (template) {
   
  //开始初始页面基础数据
    var init =  function (element, params) {
        var viewModel = {
            draw: 1,//页数(第几页)
            pageSize: 5,
            searchURL: window.cturl + '/ygdemo_yw_info/list',
            addURL: window.cturl + "/ygdemo_yw_info/add",
            updateURL: window.cturl + "/ygdemo_yw_info/update",
            delURL: window.cturl + "/ygdemo_yw_info/delBatch",
            //审批流添加功能
            submiturl:window.cturl + '/ygdemo_yw_info/submit',
            unsubmiturl:window.cturl + '/ygdemo_yw_info/unsubmit',
            formStatus: _CONST.FORM_STATUS_ADD, 
            ygdemo_yw_infoDa: new u.DataTable(metaDt),
            ygdemo_yw_infoFormDa: new u.DataTable(metaDt),
			ygdemo_yw_info_ly_code:[{value:'1', name:'领导交办'},{value:'2', name:'会议纪要'},{value:'3', name:'其他'}],
			ygdemo_yw_info_zy_cd:[{value:'1', name:'重要'},{value:'2', name:'一般'}],
			ygdemo_yw_info_kpi_flag:[{value:'0', name:'否'},{value:'1', name:'是'}],
			ygdemo_yw_info_kpi_level:[{value:'1', name:'一级'},{value:'2', name:'二级'}],
			ygdemo_yw_info_state:[{value:'0', name:'待确认'},{value:'1', name:'执行中'},{value:'2', name:'已办结'},{value:'3', name:'终止'}],

           
            ygdemo_yw_subDa: new u.DataTable(metaygdemo_yw_sub),
            ygdemo_yw_subFormDa: new u.DataTable(metaygdemo_yw_sub),

			refBdCorpVODa_zr_dw: new u.DataTable({
				meta: {
                    'pk_corp': {},
                    'unitname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa_zrr: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refBdCorpVODa_xb_dw: new u.DataTable({
				meta: {
                    'pk_corp': {},
                    'unitname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa_xbr: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa_qt_ld: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa_zbr: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa_dbr: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refExtIeopUserVODa_create_name_master: new u.DataTable({
				meta: {
                    'id': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refExtIeopUserVODa_update_name_master: new u.DataTable({
				meta: {
                    'id': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refBdCorpVODa_unitid: new u.DataTable({
				meta: {
                    'pk_corp': {},
                    'unitname': {},
                    'parentid': {}
                }
            }),
            
			refBdPsndocVODa: new u.DataTable({
				meta: {
                    'pk_psndoc': {},
                    'psnname': {},
                    'parentid': {}
                }
            }),
            
			refExtIeopUserVODa_create_name_sub: new u.DataTable({
				meta: {
                    'id': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refExtIeopUserVODa: new u.DataTable({
				meta: {
                    'id': {},
                    'name': {},
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
                                        viewModel.event.clearDa(viewModel.ygdemo_yw_infoDa);
                                        viewModel.event.clearDa(viewModel.ygdemo_yw_subDa);
                                        viewModel.ygdemo_yw_infoDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
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
                    viewModel.child_list_pcomp.on('pageChange', function (pageIndex) {
                    	viewModel.childdraw = pageIndex + 1;
                    	viewModel.event.getUserJobList();
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
                    viewModel.child_list_pcomp.on('sizeChange', function (arg) {
                    	//数据库分页
                    	viewModel.pageSize = parseInt(arg);
                    	viewModel.childdraw = 1;
                    	viewModel.event.getUserJobList();
                    });
                    viewModel.child_card_pcomp.on('sizeChange', function (arg) {
                    	viewModel.pageSize = parseInt(arg);
                    	viewModel.childdraw = 1;
                    	viewModel.event.getUserJobList();
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
                    $('#child_list_pagination').hide(); //隐藏子表的分页层
                },

                addClick: function () {
                    viewModel.formStatus = _CONST.FORM_STATUS_ADD;
                    //只显示返回和保存按钮
                    viewModel.event.userCardBtn();
                    viewModel.event.clearDa(viewModel.ygdemo_yw_infoFormDa);
                    viewModel.ygdemo_yw_infoFormDa.createEmptyRow();
                    viewModel.ygdemo_yw_infoFormDa.setRowSelect(0);
                    viewModel.event.clearDa(viewModel.ygdemo_yw_subFormDa);
                    //设置业务操作逻辑
                    var row = viewModel.ygdemo_yw_infoFormDa.getCurrentRow();
                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },
                editClick: function () {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    var selectArray = viewModel.ygdemo_yw_infoDa.selectedIndices();
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
                    viewModel.ygdemo_yw_infoDa.setRowSelect(selectArray);
                    viewModel.ygdemo_yw_infoFormDa.clear();
                    viewModel.ygdemo_yw_subFormDa.clear();
                    viewModel.ygdemo_yw_infoFormDa.setSimpleData(viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'}));
                    viewModel.ygdemo_yw_subFormDa.setSimpleData(viewModel.ygdemo_yw_subDa.getSimpleData(), {unSelect: true});

                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },

                saveClick: function () {
                    // compsValidate是验证输入格式。
//                  if (! app.compsValidate($(element).find('#user-form')[0])) {
//                      return;
//                  }
                   
                    var user = viewModel.ygdemo_yw_infoFormDa.getSimpleData();
                    var userJob = viewModel.ygdemo_yw_subFormDa.getSimpleData();
                    var jsondata =user[0];
                    jsondata.id_ygdemo_yw_sub = userJob;
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
                        },
	                    error: function(XMLHttpRequest, textStatus, errorThrown) {
							errors.error(XMLHttpRequest);
						}
                    });
                },
                /**删除选中行*/
                delRow: function () {
                    var selectArray = viewModel.ygdemo_yw_infoDa.selectedIndices();
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
                    var jsonDel = viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'});
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
               
                //审批流添加功能----提交审批
                submit: function () {
                    var jsonDel = viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'});
                    if(jsonDel[0].state &&	jsonDel[0].state !='0'){ //状态不为待确认
                    	 u.showMessage({
                             msg: '<i class="fa fa-times-circle margin-r-5"></i>该单据已经使用关联流程，不能启动',
                             position: "bottom",
                             msgType: "error",
                             showSeconds:1
                         });
                    	 return 
                    }
                    $.ajax({
                        type: "post",
                        url: viewModel.submiturl,
                        contentType: 'application/json;charset=utf-8',
                        data: JSON.stringify(jsonDel),
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    u.showMessage({
                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>流程启动成功",
                                        position: "center"
                                    })
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
              //审批流添加功能----取消提交
                unsubmit: function () {
                    var jsonDel = viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'});
                    $.ajax({
                        type: "post",
                        url: viewModel.unsubmiturl,
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
                rowClick: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.ygdemo_yw_infoDa.setRowFocus(parseInt(ri));
                        viewModel.ygdemo_yw_infoDa.setRowSelect(parseInt(ri));
                    }
                    viewModel.ygdemo_yw_infoFormDa.setSimpleData(viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'}));
                    var userId = viewModel.ygdemo_yw_infoFormDa.getValue("id");
                    if (userId == null || userId == "") {
                        viewModel.ygdemo_yw_subDa.removeAllRows();
                        viewModel.ygdemo_yw_subDa.clear();
                    } else {
                        viewModel.event.getUserJobList();
                    }
                },
                selectUserJob: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.ygdemo_yw_subDa.setRowFocus(parseInt(ri));
                        viewModel.ygdemo_yw_subDa.setRowSelect(parseInt(ri));
                    }
                },
                //选择参照（树）
                selectBdCorpVO_ygdemo_yw_info_zr_dw: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdCorpVO/listall';
                    viewModel.event.showBdCorpVOTreeDiv_ygdemo_yw_info_zr_dw(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdCorpVOTreeDiv_ygdemo_yw_info_zr_dw: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdCorpVODa_zr_dw.setSimpleData(res.detailMsg.data);
                                $("#org_testForygdemo_yw_infoTree_zr_dw")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-org_testForygdemo_yw_info_zr_dw',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdCorpVOToygdemo_yw_info_zr_dw'), null, viewModel.event.confirmSelectBdCorpVOToygdemo_yw_info_zr_dw);
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
                confirmSelectBdCorpVOToygdemo_yw_info_zr_dw: function () {
                    var zTree = $("#org_testForygdemo_yw_infoTree_zr_dw")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdCorpVODa_zr_dw.getRowByField('pk_corp', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('zr_dw', node.pk_corp)
                        viewModel.ygdemo_yw_infoFormDa.setValue('zr_dw_name', node.unitname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdPsndocVO_ygdemo_yw_info_zrr: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdPsndocVO/listall';
                    viewModel.event.showBdPsndocVOTreeDiv_ygdemo_yw_info_zrr(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdPsndocVOTreeDiv_ygdemo_yw_info_zrr: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdPsndocVODa_zrr.setSimpleData(res.detailMsg.data);
                                $("#psndocForygdemo_yw_infoTree_zrr")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-psndocForygdemo_yw_info_zrr',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_info_zrr'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_info_zrr);
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
                confirmSelectBdPsndocVOToygdemo_yw_info_zrr: function () {
                    var zTree = $("#psndocForygdemo_yw_infoTree_zrr")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa_zrr.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('zrr', node.pk_psndoc)
                        viewModel.ygdemo_yw_infoFormDa.setValue('zrr_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdCorpVO_ygdemo_yw_info_xb_dw: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdCorpVO/listall';
                    viewModel.event.showBdCorpVOTreeDiv_ygdemo_yw_info_xb_dw(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdCorpVOTreeDiv_ygdemo_yw_info_xb_dw: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdCorpVODa_xb_dw.setSimpleData(res.detailMsg.data);
                                $("#org_testForygdemo_yw_infoTree_xb_dw")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-org_testForygdemo_yw_info_xb_dw',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdCorpVOToygdemo_yw_info_xb_dw'), null, viewModel.event.confirmSelectBdCorpVOToygdemo_yw_info_xb_dw);
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
                confirmSelectBdCorpVOToygdemo_yw_info_xb_dw: function () {
                    var zTree = $("#org_testForygdemo_yw_infoTree_xb_dw")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdCorpVODa_xb_dw.getRowByField('pk_corp', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('xb_dw', node.pk_corp)
                        viewModel.ygdemo_yw_infoFormDa.setValue('xb_dw_name', node.unitname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdPsndocVO_ygdemo_yw_info_xbr: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdPsndocVO/listall';
                    viewModel.event.showBdPsndocVOTreeDiv_ygdemo_yw_info_xbr(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdPsndocVOTreeDiv_ygdemo_yw_info_xbr: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdPsndocVODa_xbr.setSimpleData(res.detailMsg.data);
                                $("#psndocForygdemo_yw_infoTree_xbr")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-psndocForygdemo_yw_info_xbr',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_info_xbr'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_info_xbr);
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
                confirmSelectBdPsndocVOToygdemo_yw_info_xbr: function () {
                    var zTree = $("#psndocForygdemo_yw_infoTree_xbr")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa_xbr.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('xbr', node.pk_psndoc)
                        viewModel.ygdemo_yw_infoFormDa.setValue('xbr_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdPsndocVO_ygdemo_yw_info_qt_ld: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdPsndocVO/listall';
                    viewModel.event.showBdPsndocVOTreeDiv_ygdemo_yw_info_qt_ld(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdPsndocVOTreeDiv_ygdemo_yw_info_qt_ld: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdPsndocVODa_qt_ld.setSimpleData(res.detailMsg.data);
                                $("#psndocForygdemo_yw_infoTree_qt_ld")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-psndocForygdemo_yw_info_qt_ld',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_info_qt_ld'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_info_qt_ld);
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
                confirmSelectBdPsndocVOToygdemo_yw_info_qt_ld: function () {
                    var zTree = $("#psndocForygdemo_yw_infoTree_qt_ld")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa_qt_ld.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('qt_ld', node.pk_psndoc)
                        viewModel.ygdemo_yw_infoFormDa.setValue('qt_ld_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdPsndocVO_ygdemo_yw_info_zbr: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdPsndocVO/listall';
                    viewModel.event.showBdPsndocVOTreeDiv_ygdemo_yw_info_zbr(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdPsndocVOTreeDiv_ygdemo_yw_info_zbr: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdPsndocVODa_zbr.setSimpleData(res.detailMsg.data);
                                $("#psndocForygdemo_yw_infoTree_zbr")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-psndocForygdemo_yw_info_zbr',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_info_zbr'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_info_zbr);
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
                confirmSelectBdPsndocVOToygdemo_yw_info_zbr: function () {
                    var zTree = $("#psndocForygdemo_yw_infoTree_zbr")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa_zbr.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('zbr', node.pk_psndoc)
                        viewModel.ygdemo_yw_infoFormDa.setValue('zbr_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdPsndocVO_ygdemo_yw_info_dbr: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdPsndocVO/listall';
                    viewModel.event.showBdPsndocVOTreeDiv_ygdemo_yw_info_dbr(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdPsndocVOTreeDiv_ygdemo_yw_info_dbr: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdPsndocVODa_dbr.setSimpleData(res.detailMsg.data);
                                $("#psndocForygdemo_yw_infoTree_dbr")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-psndocForygdemo_yw_info_dbr',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_info_dbr'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_info_dbr);
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
                confirmSelectBdPsndocVOToygdemo_yw_info_dbr: function () {
                    var zTree = $("#psndocForygdemo_yw_infoTree_dbr")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa_dbr.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('dbr', node.pk_psndoc)
                        viewModel.ygdemo_yw_infoFormDa.setValue('dbr_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectExtIeopUserVO_ygdemo_yw_info_create_name_master: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/ExtIeopUserVO/listall';
                    viewModel.event.showExtIeopUserVOTreeDiv_ygdemo_yw_info_create_name_master(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showExtIeopUserVOTreeDiv_ygdemo_yw_info_create_name_master: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refExtIeopUserVODa_create_name_master.setSimpleData(res.detailMsg.data);
                                $("#ieop_userForygdemo_yw_infoTree_create_name_master")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-ieop_userForygdemo_yw_info_create_name_master',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_ExtIeopUserVOToygdemo_yw_info_create_name_master'), null, viewModel.event.confirmSelectExtIeopUserVOToygdemo_yw_info_create_name_master);
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
                confirmSelectExtIeopUserVOToygdemo_yw_info_create_name_master: function () {
                    var zTree = $("#ieop_userForygdemo_yw_infoTree_create_name_master")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refExtIeopUserVODa_create_name_master.getRowByField('id', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('create_name', node.id)
                        viewModel.ygdemo_yw_infoFormDa.setValue('create_name_name', node.name);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectExtIeopUserVO_ygdemo_yw_info_update_name_master: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/ExtIeopUserVO/listall';
                    viewModel.event.showExtIeopUserVOTreeDiv_ygdemo_yw_info_update_name_master(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showExtIeopUserVOTreeDiv_ygdemo_yw_info_update_name_master: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refExtIeopUserVODa_update_name_master.setSimpleData(res.detailMsg.data);
                                $("#ieop_userForygdemo_yw_infoTree_update_name_master")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-ieop_userForygdemo_yw_info_update_name_master',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_ExtIeopUserVOToygdemo_yw_info_update_name_master'), null, viewModel.event.confirmSelectExtIeopUserVOToygdemo_yw_info_update_name_master);
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
                confirmSelectExtIeopUserVOToygdemo_yw_info_update_name_master: function () {
                    var zTree = $("#ieop_userForygdemo_yw_infoTree_update_name_master")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refExtIeopUserVODa_update_name_master.getRowByField('id', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('update_name', node.id)
                        viewModel.ygdemo_yw_infoFormDa.setValue('update_name_name', node.name);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectBdCorpVO_ygdemo_yw_info_unitid: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = window.cturl + '/ygdemo_yw_info/BdCorpVO/listall';
                    viewModel.event.showBdCorpVOTreeDiv_ygdemo_yw_info_unitid(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showBdCorpVOTreeDiv_ygdemo_yw_info_unitid: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refBdCorpVODa_unitid.setSimpleData(res.detailMsg.data);
                                $("#org_testForygdemo_yw_infoTree_unitid")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-org_testForygdemo_yw_info_unitid',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_BdCorpVOToygdemo_yw_info_unitid'), null, viewModel.event.confirmSelectBdCorpVOToygdemo_yw_info_unitid);
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
                confirmSelectBdCorpVOToygdemo_yw_info_unitid: function () {
                    var zTree = $("#org_testForygdemo_yw_infoTree_unitid")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdCorpVODa_unitid.getRowByField('pk_corp', id).getSimpleData();
                        viewModel.ygdemo_yw_infoFormDa.setValue('unitid', node.pk_corp)
                        viewModel.ygdemo_yw_infoFormDa.setValue('unitid_name', node.unitname);
                    }
                    viewModel.event.mdClose();
                },               
               

				addygdemo_yw_sub_selectBdPsndocVO: function (obj) {
                    var gridObj = obj.gridObj;
                    var viewModel = gridObj.viewModel;
                    var field = obj.field;
                    var ele = obj.element;
                    var dataTableId = gridObj.dataTable.id;
                    var objValue = obj.value;

                    //组织row
                    var innerStr = '<div class="u-input-group u-has-feedback">'
                        + '<input type="text" class="u-form-control" id="" >'
                        + '<span class="u-form-control-feedback fa fa-list-ul" id="addygdemo_yw_sub_selectBdPsndocVO"></span>'
                        + '</div>';
                    var innerDom = u.makeDOM(innerStr);
                    ele.innerHTML = '';
                    ele.appendChild(innerDom);

                    //赋原值
                    ele.querySelector('input').value = objValue;
                    //用户任职,选择所属组织
                    u.on(ele.querySelector('#addygdemo_yw_sub_selectBdPsndocVO'), 'click', function () {
                        $.ajax({
                            type: "GET",
                            url: window.cturl + '/ygdemo_yw_sub/BdPsndocVO/listall',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            success: function (res) {
                                if (res) {
                                    $(element).find('#tree-title').html("请选择参照值");
                                    viewModel.refBdPsndocVODa.setSimpleData(res.detailMsg.data);
                                    $("#psndocForygdemo_yw_subTree")[0]['u-meta'].tree.expandAll(true);
                                    window.md = u.dialog({
                                        id: 'commonShowDialog',
                                        content: '#tree-psndocForygdemo_yw_sub',
                                        hasCloseMenu: true
                                    });
                                    viewModel.event.bindClickButton($('#confirm_select_BdPsndocVOToygdemo_yw_sub'), null, viewModel.event.confirmSelectBdPsndocVOToygdemo_yw_sub);
                                } else {
                                    u.showMessage({msg: '无数据', position: "bottom", msgType: "error"});
                                }
                            } 
                        });
                    });
                },
                
                /**选中某一个参照到子表 */
                confirmSelectBdPsndocVOToygdemo_yw_sub: function () {
                    var zTree = $("#psndocForygdemo_yw_subTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refBdPsndocVODa.getRowByField('pk_psndoc', id).getSimpleData();
                        viewModel.ygdemo_yw_subFormDa.setValue('zbr', node.pk_psndoc);
                        viewModel.ygdemo_yw_subFormDa.setValue('zbr_name', node.psnname);
                    }
                    viewModel.event.mdClose();
                },
                
                
				addygdemo_yw_sub_selectExtIeopUserVO_create_name_sub: function (obj) {
                    var gridObj = obj.gridObj;
                    var viewModel = gridObj.viewModel;
                    var field = obj.field;
                    var ele = obj.element;
                    var dataTableId = gridObj.dataTable.id;
                    var objValue = obj.value;

                    //组织row
                    var innerStr = '<div class="u-input-group u-has-feedback">'
                        + '<input type="text" class="u-form-control" id="" >'
                        + '<span class="u-form-control-feedback fa fa-list-ul" id="addygdemo_yw_sub_selectExtIeopUserVO_create_name_sub"></span>'
                        + '</div>';
                    var innerDom = u.makeDOM(innerStr);
                    ele.innerHTML = '';
                    ele.appendChild(innerDom);

                    //赋原值
                    ele.querySelector('input').value = objValue;
                    //用户任职,选择所属组织
                    u.on(ele.querySelector('#addygdemo_yw_sub_selectExtIeopUserVO_create_name_sub'), 'click', function () {
                        $.ajax({
                            type: "GET",
                            url: window.cturl + '/ygdemo_yw_sub/ExtIeopUserVO/listall',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            success: function (res) {
                                if (res) {
                                    $(element).find('#tree-title').html("请选择参照值");
                                    viewModel.refExtIeopUserVODa_create_name_sub.setSimpleData(res.detailMsg.data);
                                    $("#ieop_userForygdemo_yw_subTree_create_name_sub")[0]['u-meta'].tree.expandAll(true);
                                    window.md = u.dialog({
                                        id: 'commonShowDialog',
                                        content: '#tree-ieop_userForygdemo_yw_sub_create_name_sub',
                                        hasCloseMenu: true
                                    });
                                    viewModel.event.bindClickButton($('#confirm_select_ExtIeopUserVOToygdemo_yw_sub_create_name_sub'), null, viewModel.event.confirmSelectExtIeopUserVOToygdemo_yw_sub_create_name_sub);
                                } else {
                                    u.showMessage({msg: '无数据', position: "bottom", msgType: "error"});
                                }
                            } 
                        });
                    });
                },
                
                /**选中某一个参照到子表 */
                confirmSelectExtIeopUserVOToygdemo_yw_sub_create_name_sub: function () {
                    var zTree = $("#ieop_userForygdemo_yw_subTree_create_name_sub")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refExtIeopUserVODa_create_name_sub.getRowByField('id', id).getSimpleData();
                        viewModel.ygdemo_yw_subFormDa.setValue('create_name', node.id);
                        viewModel.ygdemo_yw_subFormDa.setValue('create_name_name', node.name);
                    }
                    viewModel.event.mdClose();
                },
                
                
				addygdemo_yw_sub_selectExtIeopUserVO: function (obj) {
                    var gridObj = obj.gridObj;
                    var viewModel = gridObj.viewModel;
                    var field = obj.field;
                    var ele = obj.element;
                    var dataTableId = gridObj.dataTable.id;
                    var objValue = obj.value;

                    //组织row
                    var innerStr = '<div class="u-input-group u-has-feedback">'
                        + '<input type="text" class="u-form-control" id="" >'
                        + '<span class="u-form-control-feedback fa fa-list-ul" id="addygdemo_yw_sub_selectExtIeopUserVO"></span>'
                        + '</div>';
                    var innerDom = u.makeDOM(innerStr);
                    ele.innerHTML = '';
                    ele.appendChild(innerDom);

                    //赋原值
                    ele.querySelector('input').value = objValue;
                    //用户任职,选择所属组织
                    u.on(ele.querySelector('#addygdemo_yw_sub_selectExtIeopUserVO'), 'click', function () {
                        $.ajax({
                            type: "GET",
                            url: window.cturl + '/ygdemo_yw_sub/ExtIeopUserVO/listall',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            success: function (res) {
                                if (res) {
                                    $(element).find('#tree-title').html("请选择参照值");
                                    viewModel.refExtIeopUserVODa.setSimpleData(res.detailMsg.data);
                                    $("#ieop_userForygdemo_yw_subTree")[0]['u-meta'].tree.expandAll(true);
                                    window.md = u.dialog({
                                        id: 'commonShowDialog',
                                        content: '#tree-ieop_userForygdemo_yw_sub',
                                        hasCloseMenu: true
                                    });
                                    viewModel.event.bindClickButton($('#confirm_select_ExtIeopUserVOToygdemo_yw_sub'), null, viewModel.event.confirmSelectExtIeopUserVOToygdemo_yw_sub);
                                } else {
                                    u.showMessage({msg: '无数据', position: "bottom", msgType: "error"});
                                }
                            } 
                        });
                    });
                },
                
                /**选中某一个参照到子表 */
                confirmSelectExtIeopUserVOToygdemo_yw_sub: function () {
                    var zTree = $("#ieop_userForygdemo_yw_subTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refExtIeopUserVODa.getRowByField('id', id).getSimpleData();
                        viewModel.ygdemo_yw_subFormDa.setValue('update_name', node.id);
                        viewModel.ygdemo_yw_subFormDa.setValue('update_name_name', node.name);
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
                    var userId = viewModel.ygdemo_yw_infoFormDa.getValue("id");
                    var jsonData = {
                        pageIndex: 0,
                        pageSize: viewModel.pageSize,
                        sortField: "ts",
                        sortDirection: "asc"
                    };
                    jsonData['search_fk_id_ygdemo_yw_sub'] = userId;
                    $.ajax({
                        type: 'GET',
                        url: window.cturl + '/ygdemo_yw_sub/list',
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        viewModel.ygdemo_yw_subDa.removeAllRows();
                                        viewModel.ygdemo_yw_subDa.clear();
                                        viewModel.ygdemo_yw_subDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
                                        
                                        viewModel.ygdemo_yw_subFormDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
                                        var totleCount = res.detailMsg.data.totalElements;
                                        var totlePage = res.detailMsg.data.totalPages;
                                        viewModel.child_list_pcomp.update({ //列表页子表的分页信息
                                            totalPages: totlePage,
                                            pageSize: viewModel.pageSize,
                                            currentPage: viewModel.childdraw,
                                            totalCount: totleCount
                                        });
                                        viewModel.child_card_pcomp.update({ //卡片页子表的分页信息
                                        	totalPages: totlePage,
                                        	pageSize: viewModel.pageSize,
                                        	currentPage: viewModel.childdraw,
                                        	totalCount: totleCount
                                        });
                                        if(totleCount > viewModel.pageSize ){//根据总条数，来判断是否显示子表的分页层
                                        	$('#child_card_pagination').show();
                                        	$('#child_list_pagination').show();
                                        }else{
                                        	$('#child_card_pagination').hide();
                                        	$('#child_list_pagination').hide();
                                        }

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
                    viewModel.ygdemo_yw_subFormDa.createEmptyRow();
                },
                delUserJob: function () {
                    var userJobs = viewModel.ygdemo_yw_subFormDa.getSimpleData({type: 'select'})
                    if (userJobs.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                    if (confirm("确定要删除吗?")) {
                        var jsonDel = viewModel.ygdemo_yw_subFormDa.getSimpleData({type: 'focus'});
                        var index = viewModel.ygdemo_yw_subFormDa.getFocusIndex();
                        if (jsonDel[0].sub_id == null) {
                            viewModel.ygdemo_yw_subFormDa.removeRows(index);
                            return;
                        }
                        $.ajax({
                            type: "post",
                            url: window.cturl + "/ygdemo_yw_sub/del",
                            contentType: 'application/json;charset=utf-8',
                            data: JSON.stringify(jsonDel[0]),
                            success: function (res) {
                                if (res) {
                                    if (res.success == 'success') {
                                       /* u.showMessage({
                                            msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                            position: "center"
                                        })*/
                                        viewModel.ygdemo_yw_subFormDa.removeRows(index);
                                    } else {
                                        u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
                                    }
                                } else {
                                    u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
                                }
                            } 
                        });
                    }
                },              
                
				/**枚举类型渲染 */
				changeygdemo_yw_infoly_code: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.ygdemo_yw_info_ly_code.length;i++ ){
                    	if(v == viewModel.ygdemo_yw_info_ly_code[i].value ){
                    		return viewModel.ygdemo_yw_info_ly_code[i].name ;
                    	} 
                    }
                },
				/**枚举类型渲染 */
				changeygdemo_yw_infozy_cd: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.ygdemo_yw_info_zy_cd.length;i++ ){
                    	if(v == viewModel.ygdemo_yw_info_zy_cd[i].value ){
                    		return viewModel.ygdemo_yw_info_zy_cd[i].name ;
                    	} 
                    }
                },
				/**枚举类型渲染 */
				changeygdemo_yw_infokpi_flag: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.ygdemo_yw_info_kpi_flag.length;i++ ){
                    	if(v == viewModel.ygdemo_yw_info_kpi_flag[i].value ){
                    		return viewModel.ygdemo_yw_info_kpi_flag[i].name ;
                    	} 
                    }
                },
				/**枚举类型渲染 */
				changeygdemo_yw_infokpi_level: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.ygdemo_yw_info_kpi_level.length;i++ ){
                    	if(v == viewModel.ygdemo_yw_info_kpi_level[i].value ){
                    		return viewModel.ygdemo_yw_info_kpi_level[i].name ;
                    	} 
                    }
                },
				/**枚举类型渲染 */
				changeygdemo_yw_infostate: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.ygdemo_yw_info_state.length;i++ ){
                    	if(v == viewModel.ygdemo_yw_info_state[i].value ){
                    		return viewModel.ygdemo_yw_info_state[i].name ;
                    	} 
                    }
                },
 


            } // end  event

        };
        //end viewModel


        $(element).html(template);
        var app = u.createApp({
        	el:"#content",
        	//el: '#'+params,
            model: viewModel
        });
        viewModel.md = $(element).find('#user-mdlayout')[0]['u.MDLayout'];
        var paginationDiv = $(element).find('#pagination')[0];
        viewModel.comps = new u.pagination({el: paginationDiv, jumppage: true});
        
        viewModel.child_list_pcomp = new u.pagination({el: $(element).find('#child_list_pagination')[0], jumppage: true});
        viewModel.child_card_pcomp = new u.pagination({el: $(element).find('#child_card_pagination')[0], jumppage: true});
        viewModel.childdraw=1 ;

        viewModel.event.initUerList();
        viewModel.event.pageChange();
        viewModel.event.sizeChange();

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
