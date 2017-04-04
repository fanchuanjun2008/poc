define(['text!pages/userpsn/userpsn.html'/*,'iReferComp','refComp'*/,'pages/userpsn/meta','css!pages/userpsn/userpsn.css', 'uuitree', 'uuigrid', 'config/sys_const'], function (template/*,iReferComp,refComp*/) {
   
  //开始初始页面基础数据
    var init =  function (element, params) {
        var viewModel = {
            draw: 1,//页数(第几页)
            pageSize: 5,
            searchURL: ctx + '/UserPsn/list',
            addURL: ctx + "/UserPsn/add",
            updateURL: ctx + "/UserPsn/update",
            delURL: ctx + "/UserPsn/delBatch",
            formStatus: _CONST.FORM_STATUS_ADD, 
            UserPsnDa: new u.DataTable(metaDt),
            UserPsnFormDa: new u.DataTable(metaDt),
			UserPsn_sex:[], //从后台拉取数据

           
            UserRoleDa: new u.DataTable(metaUserRole),
            UserRoleFormDa: new u.DataTable(metaUserRole),

			refOrgDa: new u.DataTable({
				meta: {
                    'orgid': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refDeptDa: new u.DataTable({
				meta: {
                    'pk_dept': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			refRoleDa: new u.DataTable({
				meta: {
                    'pk_role': {},
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
                                        viewModel.event.clearDa(viewModel.UserPsnDa);
                                        viewModel.event.clearDa(viewModel.UserRoleDa);
                                        viewModel.UserPsnDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
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
                    viewModel.event.clearDa(viewModel.UserPsnFormDa);
                    viewModel.UserPsnFormDa.createEmptyRow();
                    viewModel.UserPsnFormDa.setRowSelect(0);
                    viewModel.event.clearDa(viewModel.UserRoleFormDa);
                    //设置业务操作逻辑
                    var row = viewModel.UserPsnFormDa.getCurrentRow();
                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },
                editClick: function () {
                    viewModel.formStatus = _CONST.FORM_STATUS_EDIT;
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
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
                    viewModel.UserPsnDa.setRowSelect(selectArray);
                    viewModel.UserPsnFormDa.clear();
                    viewModel.UserRoleFormDa.clear();
                    viewModel.UserPsnFormDa.setSimpleData(viewModel.UserPsnDa.getSimpleData({type: 'select'}));
                    viewModel.UserRoleFormDa.setSimpleData(viewModel.UserRoleDa.getSimpleData(), {unSelect: true});

                    //显示操作卡片
                    viewModel.md.dGo('addPage');
                },

                saveClick: function () {
                    // compsValidate是验证输入格式。
                    if (! app.compsValidate($(element).find('#user-form')[0])) {
                        return;
                    }
                   
                    var user = viewModel.UserPsnFormDa.getSimpleData();
                    var userJob = viewModel.UserRoleFormDa.getSimpleData();
                    var jsondata =user[0];
                    jsondata.id_userrole = userJob;
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
                    var selectArray = viewModel.UserPsnDa.selectedIndices();
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
                    var jsonDel = viewModel.UserPsnDa.getSimpleData({type: 'select'});
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
                rowClick: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.UserPsnDa.setRowFocus(parseInt(ri));
                        viewModel.UserPsnDa.setRowSelect(parseInt(ri));
                    }
                    viewModel.UserPsnFormDa.setSimpleData(viewModel.UserPsnDa.getSimpleData({type: 'select'}));
                    var userId = viewModel.UserPsnFormDa.getValue("pk_user");
                    if (userId == null || userId == "") {
                        viewModel.UserRoleDa.removeAllRows();
                        viewModel.UserRoleDa.clear();
                    } else {
                        viewModel.event.getUserJobList();
                    }
                },
                selectUserJob: function (row, e) {
                    var ri = e.target.parentNode.getAttribute('rowindex')
                    if (ri != null) {
                        viewModel.UserRoleDa.setRowFocus(parseInt(ri));
                        viewModel.UserRoleDa.setRowSelect(parseInt(ri));
                    }
                },
                //选择参照（树）
                selectOrg_UserPsn: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/UserPsn/Org/listall';
                    viewModel.event.showOrgTreeDiv_UserPsn(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showOrgTreeDiv_UserPsn: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refOrgDa.setSimpleData(res.detailMsg.data);
                                $("#orgForUserPsnTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-orgForUserPsn',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_OrgToUserPsn'), null, viewModel.event.confirmSelectOrgToUserPsn);
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
                confirmSelectOrgToUserPsn: function () {
                    var zTree = $("#orgForUserPsnTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refOrgDa.getRowByField('orgid', id).getSimpleData();
                        viewModel.UserPsnFormDa.setValue('pk_corp', node.orgid)
                        viewModel.UserPsnFormDa.setValue('pk_corp_name', node.name);
                    }
                    viewModel.event.mdClose();
                },               
               
                //选择参照（树）
                selectDept_UserPsn: function () {
                    var treeSet = this.treeSetting;
                    var title = '请选择参照值';
                    var url = ctx + '/UserPsn/Dept/listall';
                    viewModel.event.showDeptTreeDiv_UserPsn(null, url, title, this.treeSetting);
                },
                
                /**
                 *  sendjosn 发送的数据
                 *  ajaxurl 请求的地址
                 *  title 弹窗标题
                 *  treeset 树控件的配置obj
                 */
                showDeptTreeDiv_UserPsn: function (sendjson, ajaxurl, treetitle, treeset) {
                    $.ajax({
                        type: "GET",
                        url: ajaxurl,
                        contentType: 'application/json;charset=utf-8',
                        dataType: 'json',
                        success: function (res) {
                            if (res) {
                                $(element).find('#tree-title').html(treetitle);
                                viewModel.refDeptDa.setSimpleData(res.detailMsg.data);
                                $("#deptForUserPsnTree")[0]['u-meta'].tree.expandAll(true);
                                window.md = u.dialog({
                                    id: 'commonShowDialog',
                                    content: '#tree-deptForUserPsn',
                                    hasCloseMenu: true
                                });
                                viewModel.event.bindClickButton($('#confirm_select_DeptToUserPsn'), null, viewModel.event.confirmSelectDeptToUserPsn);
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
                confirmSelectDeptToUserPsn: function () {
                    var zTree = $("#deptForUserPsnTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refDeptDa.getRowByField('pk_dept', id).getSimpleData();
                        viewModel.UserPsnFormDa.setValue('pk_dept', node.pk_dept)
                        viewModel.UserPsnFormDa.setValue('pk_dept_name', node.name);
                    }
                    viewModel.event.mdClose();
                },               
               

				addUserRole_selectRole: function (obj) {
                    var gridObj = obj.gridObj;
                    var viewModel = gridObj.viewModel;
                    var field = obj.field;
                    var ele = obj.element;
                    var dataTableId = gridObj.dataTable.id;
                    var objValue = obj.value;

                    //组织row
                    var innerStr = '<div class="u-input-group u-has-feedback">'
                        + '<input type="text" class="u-form-control" id="" >'
                        + '<span class="u-form-control-feedback fa fa-list-ul" id="addUserRole_selectRole"></span>'
                        + '</div>';
                    var innerDom = u.makeDOM(innerStr);
                    ele.innerHTML = '';
                    ele.appendChild(innerDom);

                    //赋原值
                    ele.querySelector('input').value = objValue;
                    //用户任职,选择所属组织
                    u.on(ele.querySelector('#addUserRole_selectRole'), 'click', function () {
                        $.ajax({
                            type: "GET",
                            url: ctx + '/UserRole/Role/listall',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            success: function (res) {
                                if (res) {
                                    $(element).find('#tree-title').html("请选择参照值");
                                    viewModel.refRoleDa.setSimpleData(res.detailMsg.data);
                                    $("#RoleForUserRoleTree")[0]['u-meta'].tree.expandAll(true);
                                    window.md = u.dialog({
                                        id: 'commonShowDialog',
                                        content: '#tree-RoleForUserRole',
                                        hasCloseMenu: true
                                    });
                                    viewModel.event.bindClickButton($('#confirm_select_RoleToUserRole'), null, viewModel.event.confirmSelectRoleToUserRole);
                                } else {
                                    u.showMessage({msg: '无数据', position: "bottom", msgType: "error"});
                                }
                            } 
                        });
                    });
                },
                
                /**选中某一个参照到子表 */
                confirmSelectRoleToUserRole: function () {
                    var zTree = $("#RoleForUserRoleTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refRoleDa.getRowByField('id', id).getSimpleData();
                        viewModel.UserRoleFormDa.setValue('pk_role', node.pk_role);
                        viewModel.UserRoleFormDa.setValue('pk_role_name', node.name);
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
                    var userId = viewModel.UserPsnFormDa.getValue("pk_user");
                    var jsonData = {
                        pageIndex: 0,
                        pageSize: viewModel.pageSize,
                        sortField: "ts",
                        sortDirection: "asc"
                    };
                    jsonData['search_fk_id_userrole'] = userId;
                    $.ajax({
                        type: 'GET',
                        url: ctx + '/UserRole/list',
                        datatype: 'json',
                        data: jsonData,
                        contentType: 'application/json;charset=utf-8',
                        success: function (res) {
                            if (res) {
                                if (res.success == 'success') {
                                    if (res.detailMsg.data) {
                                        viewModel.UserRoleDa.removeAllRows();
                                        viewModel.UserRoleDa.clear();
                                        viewModel.UserRoleDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
                                        
                                        viewModel.UserRoleFormDa.setSimpleData(res.detailMsg.data.content, {unSelect: true});
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
                    viewModel.UserRoleFormDa.createEmptyRow();
                },
                delUserJob: function () {
                    var userJobs = viewModel.UserRoleFormDa.getSimpleData({type: 'select'})
                    if (userJobs.length < 1) {
                        u.messageDialog({
                            msg: "请选择要删除的行!",
                            title: "提示",
                            btnText: "OK"
                        });
                    }

                    if (confirm("确定要删除吗?")) {
                        var jsonDel = viewModel.UserRoleFormDa.getSimpleData({type: 'focus'});
                        var index = viewModel.UserRoleFormDa.getFocusIndex();
                        if (jsonDel[0].pk_user_role == null) {
                            viewModel.UserRoleFormDa.removeRows(index);
                            return;
                        }
                        $.ajax({
                            type: "post",
                            url: ctx + "/UserRole/del",
                            contentType: 'application/json;charset=utf-8',
                            data: JSON.stringify(jsonDel[0]),
                            success: function (res) {
                                if (res) {
                                    if (res.success == 'success') {
                                       /* u.showMessage({
                                            msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>删除成功",
                                            position: "center"
                                        })*/
                                        viewModel.UserRoleFormDa.removeRows(index);
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
				changeUserPsnsex: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.UserPsn_sex.length;i++ ){
                    	if(v == viewModel.UserPsn_sex[i].value ){
                    		return viewModel.UserPsn_sex[i].name ;
                    	} 
                    }
                },
 
                /** 获取下拉框的枚举值*/
                loadEnum_UserPsn:function(){
                	 $.ajax({
                         type: "GET",
                         async : false,
                         url: ctx + '/UserPsn/loadEnum',
                         contentType: 'application/json;charset=utf-8',
                         dataType: 'json',
                         success: function (res) {
                             if (res) {
                            	 console.log(res) ;
                            	 viewModel.UserPsn_sex = res.detailMsg.sex ;
                             } else {
                            	 console.error('未获取到枚举值，请检查。') ;
                             }
                         } 
                     });
                },


            } // end  event

        };
        //end viewModel
        
	   /*$('.deptref').each(function(i,val){
	     	var $that=$(this);
	     	dom = $that;
			var options = {
					refCode:"deptref",
					selectedVals:'',
					isMultiSelectedEnabled:true
			};
			refComp.initRefComp($that,options);
			refid ='#refContainer' + $that.attr('id');
	 	});
	   $('.corpref').each(function(i,val){
	     	var $that=$(this);
	     	dom = $that;
			var options = {
					refCode:"corpref",
					selectedVals:'',
					isMultiSelectedEnabled:true
			};
			refComp.initRefComp($that,options);
			refid ='#refContainer' + $that.attr('id');
	 	});
	   $('.roleref').each(function(i,val){
	     	var $that=$(this);
	     	dom = $that;
			var options = {
					refCode:"roleref",
					selectedVals:'',
					isMultiSelectedEnabled:true
			};
			refComp.initRefComp($that,options);
			refid ='#refContainer' + $that.attr('id');
	 	});*/

        $(element).html(template);
        viewModel.event.loadEnum_UserPsn();// 去后台加载枚举值，ajax需设置为同步
        var app = u.createApp({
            el: '#content',
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
