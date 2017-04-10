define(['text!./approved_task.html','pages/approved_task/meta','css!pages/approved_task/approved_task.css','uuitree','uuigrid'],function(html){
	var init=function(element){
		var listUrl = window.cturl+'/approved/list';
		var unapproveUrl = window.cturl+'/approved/unapprove/';
		var queryappUrl = window.cturl+'/approved/queryapp';
		
		var viewModel = {
				/* 数据模型 */
				draw:1,
				totlePage:0,
				pageSize:5,
				totleCount:0,
	            dt1: new u.DataTable(metaCardTable),
				dtnew:new u.DataTable(metaCardTable),
				approvalView:new u.DataTable(approvalView),
				
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
					unapprove:function(){
						var jsondata = viewModel.dt1.getSimpleData({type: 'select'});
	                    $.ajax({
	                        type: "post",
	                        url: unapproveUrl,
	                        contentType: 'application/json;charset=utf-8',
	                        data: JSON.stringify(jsondata),
	                        success: function (res) {
	                            if (res) {
	                                if (res.success == 'success') {
	                                    u.showMessage({
	                                        msg: "<i class=\"fa fa-check-circle margin-r-5\"></i>弃审成功",
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
					},
					queryapp:function(){
						 var title = '查看审批情况';
		                  var url = window.cturl + '/approve_taskinfo/queryapp';
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
		                var selectData = viewModel.dt1.getSimpleData({type: 'select'});
	                    $.ajax({
	                        type: "post",
	                        url: ajaxurl,
	                        contentType: 'application/json;charset=utf-8',
	                        data: JSON.stringify(selectData),
	                        success: function (res) {
	                            if (res) {
	                                $(element).find('#table-title').html(title);
	                                viewModel.approvalView.setSimpleData(res.detailMsg.data.content);
	                                $("#approvedGraph").attr({"src":"vendor/diagram-viewer/index.html?processDefinitionId="+selectData[0].processDefinitionId+"&processInstanceId="+selectData[0].processInstanceId});
	                                window.md = u.dialog({
	                                    id: 'approvalViewDialog',
	                                    content: '#table-approvedView',
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
					//页面按钮事件绑定
					searchClick:function(){
						viewModel.draw = 1; 
						viewModel.event.initCardTableList();
					}

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

