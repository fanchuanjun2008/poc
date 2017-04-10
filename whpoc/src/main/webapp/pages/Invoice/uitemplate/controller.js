'use strict';

define(function(){
	var uitemplateCtr = {};
	uitemplateCtr.extendViewModel = function(viewModel, params, app) {
		viewModel.headform_isEditable(true);
		viewModel.headTitleOper(false) ;
		viewModel.headBtnOper(false);
		viewModel.gridTitleOper(false);
	}
	
	uitemplateCtr.beforeInit = function(app,viewModel,templateModel){
		//添加grid的形式
		templateModel.setAllGridBtnDisplay();
		var params = {};
		initData(viewModel,params,app,templateModel)
	}
/*	uitemplateCtr.init = function(viewModel,params,app,templateModel){
		initData(viewModel,params,app,templateModel);
/!*		if(id){//如果有id说明是编辑
			initData(viewModel,params,app,templateModel,id);
		}else{
		var dts = app.getDataTables();
		for(var key in dts){
			var dt = dts[key];
			var row = dt.createEmptyRow();
			row.status = 'nrm';
			dt.setRowSelect(0);
		}
	}*!/
	}*/
	
	uitemplateCtr.save = function(app, viewModel,templateModel,datatableId){
		//添加验证
		var checked = uiCompValidate(app,datatableId);
		//特殊处理图片必输字段
		$('.validateimage').each(function(index, ele){
			var fieldId = ele.getAttribute('fieldid');
			var dtid = ele.getAttribute('datatableid');
			var required = app.getDataTable(dtid).getMeta(fieldId).required;
			if(required && required=='true'){//必输
				var vrow = app.getDataTable(dtid).getCurrentRow();
				if(vrow && vrow.data[fieldId].value == undefined){
					checked = false;
				}
			}
		})
		if(!checked){
			return false;
		}
		//新增一个空白行
		var dt = app.getDataTable(datatableId);
		var cr = dt.getCurrentRow();
		
		var data = dt.meta;
		for(var field in data){
			if(typeof data[field].isTotal !="undefined" && data[field].isTotal=="true"){//如果是合计功能
				var mainfieldid = data[field].mainTableField;
				var dtvalue = row.data[field].value;
				var maincr = viewModel.headform.getCurrentRow();
				var oldtotalval = maincr.data[mainfieldid].value;
				maincr.data[mainfieldid].value=oldtotalval+dtvalue;
			}
		}
		uitemplateCtr.app =app;
		uitemplateCtr.viewModel = viewModel;
		uitemplateCtr.templateModel = templateModel;
		var headData = templateModel.getValue(datatableId);
		//执行保存逻辑
		var param = {};
		param.templateInfo = viewModel.getTemplateInfo();

		//添加同的表单不同的提交方式
		var vcls,vurl;
		if(datatableId=="headform"){
			vcls = "com.yonyou.iuap.eiap.entity.ReimburseBill";
			vurl = "/iuap-eiap-example/billform/save";
		}else{
			vcls = "com.yonyou.iuap.eiap.entity.ReimburseItem";
			vurl = "/iuap-eiap-example/billform/saveItem";
		}
		param.headData = JSON.stringify(headData);
		param.cls= vcls;
		$.ajax({
			type: "POST", 
			url: vurl,  
			data:param, 
			async:true,
			dataType: "json" ,
			success: function(result) {
				 //清理数据
				 //设置数据
				if(datatableId ==="headform"){//表头
					//templateModel.setItemCodeValue(datatableId,"billform.id",result.body.id,"");
					templateModel.init(result.body,"");
				}else{
					var data = templateModel.getEditRowData(datatableId);
					templateModel.updateRowData(data.body);
				}
			}
		});
		return true;
	}
	
	uitemplateCtr.cancel = function(app, viewModel,templateModel,datatableId){
		var dataTable = app.getDataTable(datatableId);
		var row = dataTable.getCurrentRow();
		if(row.status == u.Row.STATUS.NEW && "headform" != datatableId){
			var row = dataTable.getRow(0);
			templateModel.clearRowData(row);
		}
	}
	uitemplateCtr.rowDelete = function(app, viewModel,templateModel,datatableId,delRowIndex){
		uitemplateCtr.app =app;
		uitemplateCtr.viewModel = viewModel;
		uitemplateCtr.templateModel = templateModel;
		var datatable = app.getDataTable(datatableId);
		var row = datatable.getRow(delRowIndex);
		datatable.removeRow(delRowIndex);
		//合计字段处理
		var data = datatable.meta;
		for(var field in data){
			if(typeof data[field].isTotal !="undefined" && data[field].isTotal=="true"){//如果是合计功能
				var mainfieldid = data[field].mainTableField;
				var dtvalue =row.data[field].value;
				var maincr = viewModel.headform.getCurrentRow();
				if(maincr){
					var oldtotalval = maincr.data[mainfieldid].value;
					if(oldtotalval){
						oldtotalval = parseInt(oldtotalval)-parseInt(dtvalue);
					}else{
						oldtotalval = parseInt(dtvalue);
					}
					maincr.setValue(mainfieldid,oldtotalval);
				}
			}
		}
	}
	
	uitemplateCtr.afterInit = function(viewModel,params,app,templateModel){	

	}
	
	uitemplateCtr.fresh= function(){
		
	}
	uitemplateCtr.add = function(viewModel,e, app,templateModel,datatableId){
		if(e==undefined || e.target==undefined || e.target.id==undefined){
			return;
		}
		var id = e.target.id;
		if(id.indexOf("dtadd_") == 0){
			var bodyFormId = e.target.id.substring(6);
			var bodyId = bodyFormId.replace("_add","").replace("_form","");
			var body = viewModel[bodyId];
			if(body==undefined){
				return;
			}
			var row = body.createEmptyRow();
			row.status = 'nrm';
			// templateUI.addEditClick(bodyId);
		}
	}
	uitemplateCtr.del = function(viewModel,e){
		if(e==undefined || e.target==undefined || e.target.id==undefined){
			return;
		}
		var id = e.target.id;
		if(id.indexOf("dtdel_") == 0){
			var bodyFormId = id.substring(6);
			var bodyId = bodyFormId.replace("_add","").replace("_form","");
			var body = viewModel[bodyId];
			if(body==undefined){
				return;
			}
			var focusIndex = body.getFocusIndex();
			if(focusIndex == -1){
				focusIndex = body.getSelectedIndex();
			}
			if(focusIndex != -1){
				body.removeRow(focusIndex);
			}else{
				$.showMessageDialog({type:"info",title:"请选择删除行！",msg:"",backdrop:true});
			}
			if(body.getAllRows.length > 0){//设置
				//body.setRowSelect(0);
			}
		}
	}
	uitemplateCtr.draw = function(templateModel){
		$('.form_before_picture').each(function(){
			var $ele = $(this);
			var entityId = $ele[0].getAttribute('entityid');
			if(entityId ==='b5500f4e-2a90-46b5-a9d7-f0e0788aae21'){//任职信息实体ID
				var width = $ele[0].offsetWidth - 10;
				var datatableId = $ele[0].getAttribute('datatableid');
				var datatable = app.getDataTable(datatableId);
				if(datatable){
					var startDate = 'staff.staff_job.begindate';
					var endDate = 'staff.staff_job.enddate';
					var trnstype = 'staff.staff_job.trnstype';
					var infoJSonArray = JSON.parse(viewModel.getTemplateInfo());
					var startFieldId = getFieldIdByItemCode(templateModel,infoJSonArray,startDate);
					var endFieldId = getFieldIdByItemCode(templateModel,infoJSonArray,endDate);
					var trnstypeFieldId = getFieldIdByItemCode(templateModel,infoJSonArray,trnstype);
					var rows = datatable.getAllRows();
					var data = [];
					for(var index =0; index< rows.length; index++){
						var row = rows[index];
						if(row.status === 'new'){
							continue;
						}
						var rowPushData = {};
						var rowData = row.data;
						rowPushData['fromDate'] = dateFormat(rowData[startFieldId].meta.display);
						rowPushData['toDate'] = dateFormat(rowData[endFieldId].meta.display);
						rowPushData['event'] = rowData[trnstypeFieldId].meta.display;
						data.push(rowPushData);
					}
					var row = datatable.getCurrentRow();
					var selectIndex = rows.length -1;
					if(row && row.status != 'new'){
						selectIndex = datatable.getRowIndex(row);
					}
					if(data.length > 0){
						var id = datatableId + "_before";
//						$('#'+ id).show();
//						var lc = new lineChart(id, data, width, 200, '晋升', '降职', selectIndex -1,function (index){
//							index++;
//							datatable.setRowSelect(index);
//						});
//						lc.draw();
					}
					datatable.setRowSelect(selectIndex);
				}
			}else if(entityId == 'fc2b36e0-4ea3-4b87-a6d3-446c6116fb89'){//组织关系
				var datatableId = $ele[0].getAttribute('datatableid');
				var id = datatableId.substring(9);
				$('#div_' + id).find('.template_add').each(function(){
					$(this).remove();
				})
				var datatable = app.getDataTable(datatableId);
				if (datatable) {
					datatable.setRowSelect(datatable.getAllRows().length-1);
				}
			}
		});
		
		function getFieldIdByItemCode(templateModel,infoJSonArray,queryCode){
			var fieldId;
			if(infoJSonArray && infoJSonArray.length>0){
				for(var index =0 ; index < infoJSonArray.length; index++){
					var jsonObject = infoJSonArray[index];
					if(jsonObject == undefined){
						continue;
					}
					for(var key in jsonObject){
						var fieldObj = jsonObject[key];
						if(fieldObj){
							var itemCode = fieldObj['itemCode'];
							if(itemCode == queryCode){
								return key;
							}
						}
					}
				}
			}
			return fieldId;
		}
		
		function dateFormat(value){
			if(value){
				var values = value.split('-');
				return values[0] + '年' + values[1] + '月';
			}
		}

		
	}
	//初始化数据
	function initData(viewModel,params,app,templateModel,id){
		uitemplateCtr.app =app;
		uitemplateCtr.viewModel = viewModel;
		uitemplateCtr.templateModel = templateModel;
		//初始化数据
		var param = {};
		param.templateInfo = viewModel.getTemplateInfo();
		param.id = id;
		$.ajax({
			type: "get", 
			url: "/whpoc/ui_invoice/render",
			data:param, 
			async:true,
			dataType: "json" ,
			success: function(result) {
				//清理数据
				//设置数据
				templateModel.init(result,"");			
			}
		});
	}
	//获取url的参数
	function getUrlParam(name){
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
	}
	
	return uitemplateCtr;
});