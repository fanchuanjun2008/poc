package com.yonyou.iuap.example.web;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import yonyou.bpm.rest.exception.RestException;
import yonyou.bpm.rest.request.RestVariable;
import yonyou.bpm.rest.response.historic.HistoricProcessInstanceResponse;

import com.yonyou.iuap.bpm.service.ProcessService;
import com.yonyou.iuap.example.entity.BdxxVO;
import com.yonyou.iuap.example.entity.KHxxVO;
import com.yonyou.iuap.example.entity.PZxxVO;
import com.yonyou.iuap.example.service.BdxxVOService;
import com.yonyou.iuap.example.service.KHxxVOService;
import com.yonyou.iuap.example.service.PZxxVOService;
import com.yonyou.iuap.iweb.datatable.annotation.IWebParameter;
import com.yonyou.iuap.iweb.entity.DataTable;
import com.yonyou.iuap.iweb.entity.Row;
import com.yonyou.iuap.iweb.event.EventResponse;
import com.yonyou.iuap.mvc.type.JsonResponse;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;

/**
 * controller层
 */
@RestController
@RequestMapping(value = "/BdxxVO")
public class BdxxVOController extends BaseController {

	@Autowired
	private BdxxVOService service;
	
	@Autowired
	private KHxxVOService khservice;
	
	@Autowired
	private PZxxVOService pzService;
	@Autowired
	private ProcessService proservice;

	/**
	 * data table 列表查询
	 * @param sysDictTypeDataTable
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public EventResponse page(@IWebParameter(id = "BdxxVODa") DataTable<BdxxVO> dataTable, @IWebParameter EventResponse response) {
		int pageNumber = 0;
		if (dataTable.getPageIndex() != null) {
			pageNumber = dataTable.getPageIndex();
		}
		Map<String, Object> searchParamMap = createSearchParamsStartingWith(dataTable, "search_");

		Page<BdxxVO> result = service.selectAllByPage(new PageRequest(pageNumber, dataTable.getPageSize(), new Sort(Sort.Direction.DESC, "ts")),
				searchParamMap);
		List<BdxxVO> list=result.getContent();
		for(int i=0;i<list.size();i++){
			List<KHxxVO> listkh=khservice.findByKhbh(list.get(i).getZddwbm());
			List<PZxxVO> listpz= pzService.findByPzbm(list.get(i).getPzbm());
			if(listkh!=null && listkh.size()>0){
				list.get(i).setZddwbmName(listkh.get(0).getKhmc());
				
			}
			if(listpz!=null && listpz.size()>0){
				list.get(i).setPzbmName(listpz.get(0).getSm());
			}
			if(list.get(i).getYfsl()==null){
				list.get(i).setYfsl(new BigDecimal(0));
			}
		}

		dataTable.setPageData(pageNumber, result.getContent(), result.getTotalPages(), result.getTotalElements());
		return response;
	}
	
	/**
	 * data table 列表查询
	 * @param sysDictTypeDataTable
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/listfor", method = RequestMethod.POST)
	@ResponseBody
	public EventResponse pagefan(@IWebParameter(id = "BdxxVODa") DataTable<BdxxVO> dataTable, @IWebParameter EventResponse response) {
		int pageNumber = 0;
		if (dataTable.getPageIndex() != null) {
			pageNumber = dataTable.getPageIndex();
		}
		Map<String, Object> searchParamMap = createSearchParamsStartingWith(dataTable, "search_");

		Page<BdxxVO> result = service.selectAllByPagefor(new PageRequest(pageNumber, dataTable.getPageSize(), new Sort(Sort.Direction.DESC, "ts")),
				searchParamMap);
		List<BdxxVO> list=result.getContent();
		for(int i=0;i<list.size();i++){
			List<KHxxVO> listkh=khservice.findByKhbh(list.get(i).getZddwbm());
			List<PZxxVO> listpz= pzService.findByPzbm(list.get(i).getPzbm());
			if(listkh!=null && listkh.size()>0){
				list.get(i).setZddwbmName(listkh.get(0).getKhmc());
				
			}
			if(listpz!=null && listpz.size()>0){
				list.get(i).setPzbmName(listpz.get(0).getSm());
			}
		}

		dataTable.setPageData(pageNumber, result.getContent(), result.getTotalPages(), result.getTotalElements());
		return response;
	}
	
	
	/**
	 *放单处理
	 * @param data
	 * @return
	 */
	@RequestMapping(value = "/fangdan", method = RequestMethod.POST)
	@ResponseBody
	public JsonResponse fangdan(@RequestBody List<BdxxVO> datas){
		try{
			service.fangdan(datas);
		//	this.startBpm();
			return super.buildSuccess("放单成功");
		}catch (BusinessException e){
			return super.buildGlobalError(e.getMessage());
		}
	}
	

	/**
	 * 行编辑datatable 实现。增删改实现。
	 * 
	 * @param sysDictTypeDataTable
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public EventResponse save(@IWebParameter(id = "BdxxVODa") DataTable<BdxxVO> dataTable, @IWebParameter EventResponse response) {
		List<BdxxVO> addList = new ArrayList<>();
		List<BdxxVO> updateList = new ArrayList<>();
		List<BdxxVO> removeList = new ArrayList<>();
		List<Row> addRows = new ArrayList<>();
		Row[] rows = dataTable.getAllPagesRow();
		for (int i = 0; i < rows.length; i++) {
			String status = rows[i].getStatus();

			// 此处调用asDataTransferObject，会在字段修改的时候，联动修改datatable的row的值
			BdxxVO item = dataTable.asDataTransferObject(rows[i]);
			if (Row.STATUS_NEW.equals(status)) {
				addRows.add(rows[i]);						
				item.setId_bdxx(UUID.randomUUID().toString() );			
				addList.add(item);
				rows[i].setStatus(Row.STATUS_UPD);
			} else if (Row.STATUS_UPD.equals(status)) {
				updateList.add(item);
			} else if (Row.STATUS_FDEL.equals(status) || Row.STATUS_DEL.equals(status)) {
				removeList.add(item);
				rows[i].setStatus(Row.STATUS_DEL);
			}
		}
		service.save(addList, updateList, removeList);
		return response;
	}

	/**
	 * datatable 多行删除实现。
	 * @param sysDictTypeDataTable
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public EventResponse delete(@IWebParameter(id = "BdxxVODa") DataTable<BdxxVO> dataTable, @IWebParameter EventResponse response) {
		List<BdxxVO> removeList = new ArrayList<>();
		Row[] rows = dataTable.getAllSelectRows();
		for (int j = 0; j < rows.length; j++) {
			BdxxVO item = dataTable.toBean(rows[j]);
			removeList.add(item);
			rows[j].setStatus(Row.STATUS_DEL);
		}
		service.batchDeleteByPrimaryKey(removeList);
		return response;
	}

	/**
	 * 后端创建行
	 * 
	 * @param sysDictTypeDataTable
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/createRow", method = RequestMethod.POST)
	@ResponseBody
	public EventResponse createRow(@IWebParameter(id = "BdxxVODa") DataTable<BdxxVO> dataTable, @IWebParameter EventResponse response) {
		BdxxVO item = new BdxxVO();
//		item.setCreateTime(new Date() );
		dataTable.add(item);
		return response;
	}

	/**
	 * 获取datatable的查询过滤条件
	 * @param sysDictTypeDataTable
	 * @param prefix
	 * @return
	 */
	private Map<String, Object> createSearchParamsStartingWith(DataTable dataTable, String prefix) {
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, Object> dtParam = dataTable.getParams();
		Set<Map.Entry<String, Object>> set = dtParam.entrySet();
		for (Map.Entry<String, Object> entry : set) {
			String key = entry.getKey();
			if (key.startsWith(prefix)) {
				String unprefixed = key.substring(prefix.length());
				params.put(unprefixed, entry.getValue().toString());
			}
		}
		return params;
	}
	
	
	
	private void startBpm(){
		List<RestVariable> variables=new ArrayList<RestVariable>();
    	  RestVariable customerStatus = new RestVariable();
    	  customerStatus.setName("customerStatus");
    	  customerStatus.setValue(true);
    	  RestVariable storeStatus = new RestVariable();
    	  storeStatus.setName("storeStatus");
    	  storeStatus.setValue(true);
    	  variables.add(storeStatus);
    	  variables.add(customerStatus);
    	  
    	  try {
			HistoricProcessInstanceResponse json= this.proservice.startProcessByKey("35fa8dc0-6f48-11e6-bcf3-0242ac110003", "XHBOOKFORM-V20170814", "text", variables);
			
		System.out.println(JSONObject.fromObject(json));
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	

}
