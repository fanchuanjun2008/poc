define(['text!pages/dept/dept.html','pages/dept/meta','css!pages/dept/dept.css','uuitree','uuigrid'],function(html){

    var init = function (element, params) {
    	
    	ctxdept = '.'
        var viewModel = {
    		listurl : '/dept/list',   
        	addurl :  '/dept/createRow',
            saveurl : '/dept/save',
        	delurl  :  '/dept/del',
        	
			dept_depttype:[], //从后台拉取数据
			dept_shortname:[], //从后台拉取数据

			refDeptDa: new u.DataTable({
				meta: {
                    'pk_dept': {},
                    'name': {},
                    'parentid': {}
                }
            }),
            
			deptDa: new u.DataTable(deptmeta),
			
			/* 树设置 */
			treeSetting : {
				view : {
					showLine : false,
					selectedMulti : false
				},
				callback : {
					onClick : function(e, id, node) {
						var rightInfo = node.name + '被选中';
					}
				}
			
			},			
			
            event: {
                initList: function () {
                    var nowPageIndex = viewModel.deptDa.pageIndex();
                    if (viewModel.deptDa.hasPage(nowPageIndex)) {
                        viewModel.deptDa.setCurrentPage(nowPageIndex)
                    } else {
                        var queryData = {};
                        $(".form-search").find(".input_search").each(function () {
                            queryData[this.name] = this.value;
                        });
                        viewModel.deptDa.addParams(queryData);
                        app.serverEvent().addDataTable("deptDa").fire({
                            url: ctxdept + viewModel.listurl,
                            success: function (data) {

                            },
                            error:function(er){
                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
                            }
                        })
                    }
                },
                pageChange: function (index) {
                    viewModel.deptDa.pageIndex(index);
                    viewModel.event.initList();
                },
                sizeChange: function (size) {
                    viewModel.deptDa.clear();
                    viewModel.deptDa.pageSize(size);
                    viewModel.event.initList();
                },
                
                //选择参照（树）
                adddept_selectDept: function (obj) {
                    var gridObj = obj.gridObj;
                    var viewModel = gridObj.viewModel;
                    var field = obj.field;
                    var ele = obj.element;
                    var dataTableId = gridObj.dataTable.id;
                    var objValue = obj.value;

                    //组织row
                    var innerStr = '<div class="u-input-group u-has-feedback">'
                        + '<input type="text" class="u-form-control" id="" >'
                        + '<span class="u-form-control-feedback fa fa-list-ul" id="adddept_selectDept"></span>'
                        + '</div>';
                    var innerDom = u.makeDOM(innerStr);
                    ele.innerHTML = '';
                    ele.appendChild(innerDom);

                    //赋原值
                    ele.querySelector('input').value = objValue;
                    u.on(ele.querySelector('#adddept_selectDept'), 'click', function () {
                        $.ajax({
                            type: "GET",
                            url: ctxdept + '/dept/Dept/listall',
                            contentType: 'application/json;charset=utf-8',
                            dataType: 'json',
                            success: function (res) {
                                if (res) {
                                    $(element).find('#tree-title').html("请选择参照值");
                                    viewModel.refDeptDa.setSimpleData(res.detailMsg.data);
                                    $("#deptFordeptTree")[0]['u-meta'].tree.expandAll(true);
                                    window.md = u.dialog({
                                        id: 'commonShowDialog',
                                        content: '#tree-deptFordept',
                                        hasCloseMenu: true
                                    });
                                    viewModel.event.bindClickButton($('#confirm_select_DeptTodept'), null, viewModel.event.confirmSelectDeptTodept);
                                } else {
                                    u.showMessage({msg: '无数据', position: "bottom", msgType: "error"});
                                }
                            } 
                        });
                    });
                },
                
                /**选中某一个参照到主表 */
                confirmSelectDeptTodept: function () {
                    var zTree = $("#deptFordeptTree")[0]['u-meta'].tree;
                    var selectNode = zTree.getSelectedNodes();
                    if (selectNode) {
                        var id = zTree.getSelectedNodes()[0].id;
                        var node = viewModel.refDeptDa.getRowByField('pk_dept', id).getSimpleData();
                        viewModel.deptDa.setValue('parentid', node.pk_dept)
                        viewModel.deptDa.setValue('parentid_name', node.name);
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
                
				/**枚举类型渲染 */
				changedeptdepttype: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.dept_depttype.length;i++ ){
                    	if(v == viewModel.dept_depttype[i].value ){
                    		return viewModel.dept_depttype[i].name ;
                    	} 
                    }
                },
				/**枚举类型渲染 */
				changedeptshortname: function (id) {
                    var v = id();
                    for( var i= 0 ;i< viewModel.dept_shortname.length;i++ ){
                    	if(v == viewModel.dept_shortname[i].value ){
                    		return viewModel.dept_shortname[i].name ;
                    	} 
                    }
                },
                /** 获取下拉框的枚举值*/
                loadEnum_dept:function(){
                	 $.ajax({
                         type: "GET",
                         async : false,
                         url: ctxdept + '/dept/loadEnum',
                         contentType: 'application/json;charset=utf-8',
                         dataType: 'json',
                         success: function (res) {
                             if (res) {
                            	 console.log(res) ;
                            	 viewModel.dept_depttype = res.detailMsg.depttype ;
                            	 viewModel.dept_shortname = res.detailMsg.depttype ;
                             } else {
                            	 console.error('未获取到枚举值，请检查。') ;
                             }
                         } 
                     });
                },
                search: function () {
                    viewModel.deptDa.clear();
                    var queryData = {};
                    $(".form-search").find(".input_search").each(function () {
                        queryData[this.name] = this.value;
                    });
                    viewModel.deptDa.addParams(queryData);
                    app.serverEvent().addDataTable("deptDa").fire({
                        url: ctxdept + viewModel.listurl,
                        success: function (data) {

                        },
	                    error:function(er){
	                  	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
	                    }
                    })
                },
                cleanSearch: function () {
                    $(element).find('.form-search').find('input').val('');
                },
                addClick: function () {
                    app.serverEvent().addDataTable("deptDa").fire({
                        url: ctxdept + viewModel.addurl,
                        error:function(er){
                        	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
                         }
                    })
                    
                },
                getRowData: function (rows) {  //rows 表示行数据对象
                    var rowsdata = [];
                    for (var i = 0; i < rows.length; i++) {
                        var d = rows[i].getSimpleData();
                        rowsdata.push(d);
                    }
                    return rowsdata;
                },
                saveClick: function () {
                    //以下compsValidate是验证输入格式。开发调试，暂时不用
                    if (!app.compsValidate($(element).find('#list')[0])) {
                        return;
                    }

                    app.serverEvent().addDataTable("deptDa", 'change').fire({
                        url: ctxdept + viewModel.saveurl,
                        success: function (data) {
                            u.showMessage({msg: '操作完成'})
                        },
	                    error:function(er){
	                  	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
	                    }
                    })
                },

                delRow: function (data, index) {
                    if (typeof(data) == 'number') {
                        viewModel.deptDa.setRowSelect(index);
                    }
                    u.confirmDialog({
                        msg: '<div class="pull-left col-padding" >' +
                        '<i class="fa fa-exclamation-circle margin-r-5 fa-3x orange" style="vertical-align:middle"></i>确认删除这些数据数据吗？</div>',
                        title: '警告',
                        onOk: function () {
                            app.serverEvent().addDataTable("deptDa", 'allSelect').fire({
                                url: ctxdept + viewModel.delurl,
                                success: function (data) {
                                   /* u.showMessage({msg: '操作完成'})*/
                                },
	                            error:function(er){
	                          	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
	                            }
                            })
                        }
                    });
                }
            }
        }		//end viewModel

        viewModel.event.loadEnum_dept();// 去后台加载枚举值，ajax需设置为同步
        $(element).html(html);
        var app = u.createApp({
            el: '#content',
            el: element,
            model: viewModel
        });
        viewModel.event.initList();
        $('.search-enter').keydown(function (e) {
        	           if (e.keyCode == 13) {
        	                $('#user-action-search').trigger('click');
        	 
        	             }
         });
    }

    return {
        'template': html,
        init: init
    }
});//end define
