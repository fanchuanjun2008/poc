define(['text!pages/demo/demo.html','pages/demo/meta','css!pages/demo/demo.css','uui','uuigrid'], function(template) {

	//初始化方法,页面加载后被 调用
	var init=function  (element) {
		 viewModel = {
				listurl : '/KHxxVO/list', //客户查询
				listbdurl : '/BdxxVO/list',  //报订单表查询
				listpzurl : '/PZxxVO/list', //品种信息
				saveurl : '/FHVO/save',
				fangdanurl : '/BdxxVO/fangdan',
				KHxxVODa: new u.DataTable(KHxxVOmeta),//客户
				BdxxVODa:new u.DataTable(BdxxVOmeta),//报订单表
				FHVODa: new u.DataTable(FHVOmeta),//发货信息
				PZxxVODa:new u.DataTable(PZxxVOmeta),//品种信息
				  event: {
					  //初始化加载客户信息
					  initList: function () {
		                    var nowPageIndex = viewModel.KHxxVODa.pageIndex();
		                    if (viewModel.KHxxVODa.hasPage(nowPageIndex)) {
		                        viewModel.KHxxVODa.setCurrentPage(nowPageIndex)
		                    } else {
		                        var queryData = {};
		                        queryData["search_khbh"]="";
		                        viewModel.KHxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("KHxxVODa").fire({
		                            url: ctx + viewModel.listurl,
		                            success: function (data) {
		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        });
		                    }
		                    
		                },
		                //按品种放单点击事件
		                pzClick: function(){
		                	viewModel.event.initPZList();
		                },
		                //品种分页
		                pagepzChange: function (index) {
		                    viewModel.PZxxVODa.pageIndex(index);
		                    viewModel.event.initPZList();
		                },
		                //品种每页大小改变事件
		                sizepzChange: function (size) {
		                    viewModel.PZxxVODa.clear();
		                    viewModel.PZxxVODa.pageSize(size);
		                    viewModel.event.initPZList();
		                },
		                //初始化加载品种信息
		                initPZList: function () {
		                    var nowPageIndex = viewModel.PZxxVODa.pageIndex();
		                    if (viewModel.PZxxVODa.hasPage(nowPageIndex)) {
		                        viewModel.PZxxVODa.setCurrentPage(nowPageIndex)
		                    } else {
		                        var queryData = {};
		                        $(".form-search").find(".input_search").each(function () {
		                            queryData[this.name] = this.value;
		                        });
		                        viewModel.PZxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("PZxxVODa").fire({
		                            url: ctx + viewModel.listpzurl,
		                            success: function (data) {

		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        });
		                    }
		                    
		                },
		                //品种的搜索请求
		                searchPZList: function () {
		                   /* var nowPageIndex = viewModel.PZxxVODa.pageIndex();
		                    if (viewModel.PZxxVODa.hasPage(nowPageIndex)) {
		                        viewModel.PZxxVODa.setCurrentPage(nowPageIndex)
		                    } else {*/
		                        var queryData = {};
		                        $(".form-search").find(".input_search").each(function () {
		                            queryData[this.name] = this.value;
		                        });
		                        viewModel.PZxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("PZxxVODa").fire({
		                            url: ctx + viewModel.listpzurl,
		                            success: function (data) {

		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        });
		                   // }
		                    
		                },
		                //按客户编码查询客户信息，模糊查询
		                serachList : function(khbm){
		                	  var queryData = {};
		                	  queryData["search_khbh"]=khbm;
		                        viewModel.KHxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("KHxxVODa").fire({
		                            url: ctx + viewModel.listurl,
		                            success: function (data) {
		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        })
		                },
		                //初始化报订单表数据，根据点击行的客户编码进行过滤
		                initbdList: function (khbh) {
		                	 viewModel.BdxxVODa.clear();
		                	 var nowPageIndex = viewModel.BdxxVODa.pageIndex();
		                        var queryData = {};
		                        queryData["search_zddwbm"] = khbh;
		                        queryData["search_pzbm"] = "";
		                        viewModel.BdxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("BdxxVODa").fire({
		                            url: ctx + viewModel.listbdurl,
		                            success: function (data) {
		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        })
		                },
		              //初始化报订单表数据，根据点击行的品种编码进行过滤
		                initbdListforpz: function (pzbm) {
		                	 viewModel.BdxxVODa.clear();
		                	 var nowPageIndex = viewModel.BdxxVODa.pageIndex();
		                        var queryData = {};
		                        queryData["search_pzbm"] = pzbm;
		                        queryData["search_zddwbm"] = "";
		                        viewModel.BdxxVODa.addParams(queryData);
		                        app.serverEvent().addDataTable("BdxxVODa").fire({
		                            url: ctx + viewModel.listbdurl,
		                            success: function (data) {
		                            },
		                            error:function(er){
		                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
		                            }
		                        })
		                },
		                //按客户放单的行点击事件
		                rowDoubleClick: function(object){
		                	console.log(object);
		                	console.log(object.rowObj.value);
		                	var object=object.rowObj.value;//行数据对象；
		                	var khbh=object.khbh;//客户编号
		                	window.md = u.dialog({
		                        id: 'commonShowDialog',
		                        content: '#table-CityForCustomer',
		                        hasCloseMenu: true,
		                    });
		                	
		                	$("#commonShowDialog").addClass('bdxx');
		                	
		                	 viewModel.event.initbdList(khbh);	
		                	
		                },
		                //按品种放单的双击品种的点击事件
		                rowpzDoubleClick:function(object){
		                	console.log(object.rowObj.value);
		                	var object=object.rowObj.value;//行数据对象
		                	var pzbm=object.pzbm;//品种编码
		                	window.md = u.dialog({
		                        id: 'commonShowDialog',
		                        content: '#table-CityForCustomer',
		                        hasCloseMenu: true
		                    });
		                	$("#commonShowDialog").addClass('bdxx');
		                	 viewModel.event.initbdListforpz(pzbm);
		                	
		                },
		                //报订单分页查询事件
		                pagebdChange: function (index) {
		                    viewModel.BdxxVODa.pageIndex(index);
		                    viewModel.event.initList();
		                },
		                //报订单的每页大小改变事件
		                sizebdChange: function (size) {
		                    viewModel.BdxxVODa.clear();
		                    viewModel.BdxxVODa.pageSize(size);
		                    viewModel.event.initList();
		                },
		                
		                //客户的分页查询事件
		                pageChange: function (index) {
		                    viewModel.KHxxVODa.pageIndex(index);
		                    viewModel.event.initList();
		                },
		                //客户的每页数据条数大小修改事件
		                sizeChange: function (size) {
		                    viewModel.KHxxVODa.clear();
		                    viewModel.KHxxVODa.pageSize(size);
		                    viewModel.event.initList();
		                },
		                //弹出层的关闭事件
		                mdClose:function(e){
		                	window.md.close();
		                },
		                //按店放单的查询客户点击事件
		                search_kh:function(){
		                	window.md = u.dialog({
		                        id: 'commonShowDialog',
		                        content: '#table-search_kh',
		                        hasCloseMenu: true
		                    });
		                	$("#commonShowDialog").addClass('search');
		                },
		                //查询品种的点击事件
		                search_pz:function(){
		                	window.md = u.dialog({
		                        id: 'commonShowDialog',
		                        content: '#table-search_pz',
		                        hasCloseMenu: true
		                    });
		                	$("#commonShowDialog").addClass('search');
		                	
		                },
		                //行数据选中事件
		                myrowClick:function(object){
		                	var value=object.rowObj.value;
		                },
		                //根据客户编码搜索客户
		                searchKH:function(){
		                	viewModel.KHxxVODa.clear();
		                	var khbm= $("#khbm").val().trim();
		                	if(khbm.length==0){
		                		 viewModel.event.initList();
		                	}else{
		                		   viewModel.event.serachList(khbm);
		                	}
		                	viewModel.event.mdClose();
		                	
		                },
		                search_kh_more:function(){
		                	 viewModel.BdxxVODa.clear();
		                	var selectedDatas=viewModel.KHxxVODa.getSelectedDatas();
		                	var queryData = {};
		                	var kh="";
		                	for(var i=0;i<selectedDatas.length;i++){
		                		kh+=selectedDatas[i].data.khbh.value+",";
		                	}
		                	console.log(kh);
		                       queryData["search_zddwbm"] = kh;
		                        viewModel.BdxxVODa.addParams(queryData);
		                    app.serverEvent().addDataTable("BdxxVODa").fire({
	                            url: ctx + viewModel.listbdurl,
	                            success: function (data) {
	                            },
	                            error:function(er){
	                            	  u.messageDialog({msg: '请求失败，请检查。', title: '请求错误', btnText: '确定'});
	                            }
	                        })
		                	console.log(selectedDatas);
		                	
		                },
		                //根据客户编码搜索客户
		                searchPZ:function(){
		                	viewModel.PZxxVODa.clear();
		                	viewModel.event.searchPZList();
		                	viewModel.event.mdClose();
		                	
		                },
		                //放单事件
		                fangdan: function () {
		               	 $.ajax({
	                         type: "POST",
	                         url: ctx + viewModel.fangdanurl,
	                         contentType: 'application/json;charset=utf-8',
	                         dataType: 'json',
	                         data: JSON.stringify({
	                        		 pk:"dedede"
	                             
	                         }),
	                         success: function (res) {
	                             if (res) {
	                            	 //viewModel.event.myRefresh();
	                             } else {
	                            	// viewModel.event.initList();
	                                 u.showMessage({
	                                     msg: '<i class="fa fa-times-circle margin-r-5"></i>' + res.message,
	                                     position: "bottom",
	                                     msgType: "error"
	                                 });
	                             }
	                         } 
	                     });
		                }
				  }
		};	
		$(element).html(template);
		 var test =function(e){
			 var temp = '<div class="u-grid-header-multi-select  checkbox check-success" style="width: 40px">\
					<span id="poccheckbox" class="u-grid-checkbox-outline">\
						<span class="u-grid-checkbox-tick-outline"></span>\
					</span>\
				</div>';
			 e.element.innerHTML = temp;
			 if(parseInt(e.value) === 1){
				 $("#poccheckbox").addClass("is-checked");
			 }
		 }
		 
		 window.test = test;
		app = u.createApp({
			el:element,
			model:viewModel
		});
		 viewModel.event.initList();
		 

	};
	return {
       
        'template': template,
        'init': init
    };
});