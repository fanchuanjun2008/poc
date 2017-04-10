define(['text!./approve_taskinfo.html','pages/approve_taskinfo/meta','css!pages/approve_taskinfo/approve_taskinfo.css','uuitree','uuigrid'],function(html){
	var init=function(element){
		var listUrl = window.cturl+'/approve_taskinfo/list';
		var approveURL = window.cturl+'/approve_taskinfo/approve/';
		var approveURLsecond = window.cturl+'/approve_taskinfo/approve/second';
		var signAddURL= window.cturl+'/assignee/loadUsers/';
		var rejectURL= window.cturl+'/approve_taskinfo/appbackbefore/';
		var rejectSubmitURL= window.cturl+'/approve_taskinfo/appback/';
		var signAddSubmitURL= window.cturl+'/assignee/asignAddCommit/';
		var queryappURL = window.cturl+'/approve_taskinfo/queryapp/';

		
		
		
		var viewModel = {
				/* 数据模型 */
				draw:1,
				totlePage:0,
				pageSize:5,
				totleCount:0,
	            dt1: new u.DataTable(metaCardTable),
				dtnew:new u.DataTable(metaCardTable),
				approvalView:new u.DataTable(approvalView),
				rejectView:new u.DataTable(rejectView),
				signAddView:new u.DataTable(signAddView),

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
					
					 rowClick: function (row, e) {
		                    var ri = e.target.parentNode.getAttribute('rowindex')
		                    if (ri != null) {
		                        viewModel.rejectView.setRowFocus(parseInt(ri));
		                        viewModel.rejectView.setRowSelect(parseInt(ri));
		                    }
		                 //   viewModel.ygdemo_yw_infoFormDa.setSimpleData(viewModel.ygdemo_yw_infoDa.getSimpleData({type: 'select'}));
		                },
					//清除datatable数据
	                clearDt: function (dt) {
	                	dt.removeAllRows();
	                	dt.clear();
	                },
					// 卡片表数据读取
					initCardTableList:function(){
						var jsonData={
								pageIndex:viewModel.draw-1,
								pageSize:viewModel.pageSize,
//								sortField:"createtime",
//								sortDirection:"asc"
						};
						$(element).find("#search").each(function(){
							if(this.value == undefined || this.value =='' || this.value.length ==0 ){
								//不执行操作
							}else{
								jsonData['search_searchParam'] =  this.value.replace(/(^\s*)|(\s*$)/g, "");  //去掉空格
							}
						});
						$.ajax({
							type:'get',
							url:listUrl,
							datatype:'json',
							data:jsonData,
							contentType: 'application/json;charset=utf-8',
							success:function(res){
								if(res){
									if( res.success =='success'){
										if(res.detailMsg.data){
											viewModel.totleCount=res.detailMsg.data.totalElements;
											viewModel.totlePage=res.detailMsg.data.totalPages;
											viewModel.event.comps.update({totalPages:viewModel.totlePage,pageSize:viewModel.pageSize,currentPage:viewModel.draw,totalCount:viewModel.totleCount});
											viewModel.dt1.removeAllRows();
											viewModel.dt1.clear();
											viewModel.dt1.setSimpleData(res.detailMsg.data.content,{unSelect:true});
										}
									}else{
										var msg = "";
										if(res.success == 'fail_global'){
											msg = res.message;
										}else{
											for (var key in res.detailMsg) {
												msg += res.detailMsg[key] + "<br/>";
											}
										}
										u.messageDialog({msg:msg,title:'请求错误',btnText:'确定'});
									}
								}else{
									u.messageDialog({msg:'后台返回数据格式有误，请联系管理员',title:'数据错误',btnText:'确定'});
								}
							},
							error:function(er){
								u.messageDialog({msg:'请求超时',title:'请求错误',btnText:'确定'});
							}
						});
					},
					//组装list
					genDataList:function(data){
						var datalist = [];
						datalist.push(data);
						return datalist ;
					},

					//删除方法
					deleteData: function(data) {
						var datalist = viewModel.event.genDataList(data);
						var json = JSON.stringify(datalist);
						$.ajax({
							url: delUrl,
							data: json,
							dataType: 'json',
							type: 'post',
							contentType: 'application/json',
							success: function (res) {
								//md.close();
								if(res){
									if (res.success == 'success') {
										u.messageDialog({msg:'删除成功',title:'操作提示',btnText:'确定'});
									} else {
										var msg = "";
										for(var key in res.message){
											msg +=res.message[key]+"<br/>";
										}
										u.messageDialog({msg:'msg',title:'操作提示',btnText:'确定'});
									}
								}else{
									u.messageDialog({msg:'无返回数据',title:'操作提示',btnText:'确定'});
								}
								
							},
							error:function(er){
								u.messageDialog({msg:'操作请求失败，'+er,title:'操作提示',btnText:'确定'});
							}
						});
					},

					//分页相关
					pageChange:function(){
						viewModel.event.comps.on('pageChange', function (pageIndex) {
							viewModel.draw = pageIndex + 1;
							viewModel.event.initCardTableList();
						});
					},
					sizeChange:function(){
						viewModel.event.comps.on('sizeChange', function (arg) {
							viewModel.pageSize = parseInt(arg);
							viewModel.draw = 1;
							viewModel.event.initCardTableList();
						});
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
                
					
					//页面初始化
					pageInit: function () {		       
						$(element).html(html) ;
						app = u.createApp({
							el: element,
							model: viewModel
						});
						
						var paginationDiv = $(element).find('#pagination')[0];
						this.comps=new u.pagination({el:paginationDiv,jumppage:true});
						this.initCardTableList();
						viewModel.event.pageChange();
						viewModel.event.sizeChange();
						
	                    //回车搜索
	                    $('.input_enter').keydown(function(e){
	                        if(e.keyCode==13){
	                            $('#searchBtn').trigger('click');

	                        }
	                    });
					},
					
					approve:function(){
						 window.md = u.dialog({
                             id: 'approvalViewDialog',
                             content: '#dialog_content',
                             hasCloseMenu: true,
                             width:"800px"
                         });
						 $("#u-button-xx").click(function (){
							 md.close(); 
						 });
						 $("#u-button-aa").click(function (){
							 md.close();
							 var jsondata = viewModel.dt1.getSimpleData({type: 'select'});
			                    $.ajax({
			                        type: "post",
			                        url: approveURL,
			                        contentType: 'application/json;charset=utf-8',
			                        data: JSON.stringify(jsondata),
			                        success: function (res) {
			                            if (res) {
			                                if (res.success == 'success') {
			                                    u.showMessage({
			                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>审批成功",
			                                        position: "center"
			                                    })
			                                    viewModel.event.initCardTableList();
			                                } else {
			                                    u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
			                                }
			                            } else {
			                                u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
			                            }
			                        }, 
			                    	error: function error(XMLHttpRequest, textStatus, errorThrown) {
			    						errors.error(XMLHttpRequest);
			    					}
			                        
			                    });
						 });
//						var jsondata = viewModel.dt1.getSimpleData({type: 'select'});
//	                    $.ajax({
//	                        type: "post",
//	                        url: approveURL,
//	                        contentType: 'application/json;charset=utf-8',
//	                        data: JSON.stringify(jsondata),
//	                        success: function (res) {
//	                            if (res) {
//	                                if (res.success == 'success') {
//	                                    u.showMessage({
//	                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>审批成功",
//	                                        position: "center"
//	                                    })
//	                                    viewModel.event.initCardTableList();
//	                                } else {
//	                                    u.messageDialog({msg: res.message, title: '操作提示', btnText: '确定'});
//	                                }
//	                            } else {
//	                                u.messageDialog({msg: '无返回数据', title: '操作提示', btnText: '确定'});
//	                            }
//	                        }, 
//	                    	error: function error(XMLHttpRequest, textStatus, errorThrown) {
//	    						errors.error(XMLHttpRequest);
//	    					}
//	                        
//	                    });
					},
					signAdd:function(){
						var title = '加签';
		                var url = signAddURL;
		                viewModel.event.showAddlView(url, title);
					},
					showAddlView: function (ajaxurl, title) {
						 var selectArray = viewModel.dt1.selectedIndices();
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
		                    var  selectData = viewModel.dt1.getSimpleData({type: 'select'});
		                    $.ajax({
		                        type: "post",
		                        url: ajaxurl,
		                        contentType: 'application/json;charset=utf-8',
		                        data: JSON.stringify(selectData),
		                        success: function (res) {
		                            if (res) {
		                                $(element).find('#table-signAdd-title').html(title);
		                                viewModel.signAddView.setSimpleData(res.data);
		                                window.md = u.dialog({
		                                    id: 'signAddlViewDialog',
		                                    content: '#table-signAddView',
		                                    hasCloseMenu: true
		                                });
		                                viewModel.event.bindClickButton($('#confirm_select_rejectView'), null, viewModel.event.confirmSelectRejectView);
		                            } else {
		                                u.showMessage({
		                                    msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
		                                    position: "bottom",
		                                    msgType: "error"
		                                });
		                            }
		                        } 
		                    });
					}
					,
					reject:function(){
						var title = '驳回';
		                var url = rejectURL;
		                viewModel.event.showRejectlView(url, title);
					},
					
					showRejectlView: function (ajaxurl, title) {
						 var selectArray = viewModel.dt1.selectedIndices();
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
		                //var selectData = viewModel.dt1.getRowByRowId(selectArray[0]);
//		                var selectData = viewModel.dt1.getData();
//		                if(selectData[0] != null){
//		                	selectData = selectData[0].data;
//		                }
//		               
		              var  selectData = viewModel.dt1.getSimpleData({type: 'select'});
	                    $.ajax({
	                        type: "post",
	                        url: ajaxurl,
	                        contentType: 'application/json;charset=utf-8',
	                        data: JSON.stringify(selectData),
	                        success: function (res) {
	                            if (res) {
	                                $(element).find('#table-title').html(title);
	                                viewModel.rejectView.setSimpleData(res.detailMsg.data.content);
	                                window.md = u.dialog({
	                                    id: 'approvalViewDialog',
	                                    content: '#table-rejectView',
	                                    hasCloseMenu: true
	                                });
	                                viewModel.event.bindClickButton($('#confirm_select_rejectView'), null, viewModel.event.confirmSelectRejectView);
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
	                signAddSubmit:function(){
	                	    var selectData ={};
	                	    selectData.taskId =  viewModel.dt1.getSimpleData({type: 'select'})[0].id;
	                	    selectData.data = viewModel.signAddView.getSimpleData({type: 'select'});
	                	    
		                    $.ajax({
		                        type: "post",
		                        url: signAddSubmitURL,
		                        contentType: 'application/json;charset=utf-8',
		                        data: JSON.stringify(selectData),
		                        success: function (res) {
		                            if (res) { if (res.flag == 'success') {
		                            	 viewModel.event.mdClose();
	                                    u.showMessage({
	                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>加签成功",
	                                        position: "center"
	                                    });
	                                    viewModel.event.initCardTableList();
		                                  }
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
	                confirmSelectRejectView:function () {
	                	 var selectArray = viewModel.rejectView.selectedIndices();
		                    if (selectArray.length < 1) {
		                        u.messageDialog({
		                            msg: "请选择要驳回的活动!",
		                            title: "提示",
		                            btnText: "OK"
		                        });
		                        return;
		                    }
		                    if (selectArray.length > 1) {
		                        u.messageDialog({
		                            msg: "一次只能驳回到一个活动，请选择要驳回的记录!",
		                            title: "提示",
		                            btnText: "OK"
		                        });
		                        return;
		                    }
		                    var  selectTaskData = viewModel.dt1.getSimpleData({type: 'select'})[0];
		                    var selectActivityData = viewModel.rejectView.getSimpleData({type: 'select'})[0];
		                    var selectData= { 
		                    		    	activityId:selectActivityData.activityId,
		                    		    	processInstanceId:selectTaskData.processInstanceId};
		                    $.ajax({
		                        type: "post",
		                        url: rejectSubmitURL,
		                        contentType: 'application/json;charset=utf-8',
		                        data: JSON.stringify(selectData),
		                        success: function (res) {
		                        	 viewModel.event.mdClose();
		                            if (res) { if (res.flag == 'success') {
		                            	
	                                    u.showMessage({
	                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>驳回成功",
	                                        position: "center"
	                                    });
	                                    viewModel.event.initCardTableList();
		                                  }
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
	                approvalRowClick: function (row, e) {
	                  	 var ri = e.target.parentNode.getAttribute('rowindex')
	                	 viewModel.approvalView.setRowSelect(parseInt(ri));
	                },
					queryapp:function(){
						var title = '查看审批情况';
		                var url = queryappURL;
		                viewModel.event.showApprovalView(url, title);
					},

					showApprovalView: function (ajaxurl, title) {
						 var selectArray = viewModel.dt1.selectedIndices();
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
		                var  selectData = viewModel.dt1.getSimpleData({type: 'select'});
	                    $.ajax({
	                        type: "post",
	                        url: ajaxurl,
	                        contentType: 'application/json;charset=utf-8',
	                        data: JSON.stringify(selectData),
	                        success: function (res) {
	                            if (res) {
	                                $(element).find('#table-title').html(title);
	                                viewModel.approvalView.setSimpleData(res.detailMsg.data.content);
	                                $("#historyGraph").attr({"src":"vendor/diagram-viewer/index.html?processDefinitionId="+selectData[0].processDefinitionId+"&processInstanceId="+selectData[0].processInstanceId});
	                               
	                                window.md = u.dialog({
	                                    id: 'approvalViewDialog',
	                                    content: '#table-approvalView',
	                                    hasCloseMenu: true,
	                                    width:"800px"
	                                });
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
	                
					searchClick:function(){
						viewModel.draw = 1; 
						viewModel.event.initCardTableList();
					},
					 //signAddView模态框表格以下用于check checkbox
	                afterAdd: function (element, index, data) {
	                    if (element.nodeType === 1) {
	                        u.compMgr.updateComp(element);
	                    }
	                },

				}
		}
		
		$(element).html(html) ;
		viewModel.event.pageInit();
	}
    return{
		'template': html,
        init:init
    }
});

