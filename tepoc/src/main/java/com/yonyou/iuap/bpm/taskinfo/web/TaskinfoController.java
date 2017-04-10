package com.yonyou.iuap.bpm.taskinfo.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import yonyou.bpm.rest.exception.RestException;
import yonyou.bpm.rest.response.historic.HistoricTaskInstanceResponse;
import yonyou.bpm.rest.response.runtime.process.AssignInfoItemResponse;
import yonyou.bpm.rest.response.runtime.task.TaskResponse;

import com.yonyou.iuap.bpm.service.JsonResultService;
import com.yonyou.iuap.bpm.service.ProcessService;
import com.yonyou.iuap.bpm.taskinfo.service.TaskinfoService;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.web.BaseController;

/**
 * <p>
 * Title: CardTableController
 * </p>
 * <p>
 * Description: 卡片表示例的controller层
 * </p>
 */
@RestController
@RequestMapping(value = "/approve_taskinfo")
public class TaskinfoController extends BaseController {
    
    private Logger logger = LoggerFactory.getLogger(TaskinfoController.class);
	@Autowired
	private TaskinfoService service;
	@Autowired
	private ProcessService processService;
	@Autowired
	private JsonResultService jsonResultService;
    

    /**
     * 查询分页数据
     * 
     * @param pageRequest
     * @param searchParams
     * @return
     */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
		Page<TaskResponse> dataPage =null;
		
		int  size =10;
		int start = 0 ;
		try {
			dataPage = processService.queryTodoPage("73cf71e2-6d8d-11e6-af88-b8aeed2e916b", null, null, null, null, size, start);
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			logger.error("查询待办列表失败",e);
		}
        return buildSuccess(dataPage);
    }
	
	@RequestMapping(value = "/listToMobile", method = RequestMethod.GET)
    public @ResponseBody String listToMobile(PageRequest pageRequest, SearchParams searchParams) {
		Page<TaskResponse> dataPage =null;
		
		int  size =10;
		int start = 0 ;
		try {
			dataPage = processService.queryTodoPage("73cf71e2-6d8d-11e6-af88-b8aeed2e916b", null, null, null, null, size, start);
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			logger.error("查询待办列表失败",e);
		}
		List<TaskResponse> list=dataPage.getContent();
		String id = list.get(0).getId();
        return id;
    }

    /**
     * 保存数据
     * 
     * @param list
     * @return
     */
	@RequestMapping(value = "/approve", method = {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=utf-8")
    public @ResponseBody Object approve(@RequestBody List<Map<String,Object>> list) {
    	service.approve(list);
        return buildSuccess();
    }
	
	/**
	 * 供移动端使用的bpm审批动作
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/approveToMobile", method = {RequestMethod.GET,RequestMethod.POST},produces="application/json;charset=utf-8")
    public @ResponseBody Object approveBpmToMobile( Model model, ServletRequest request,ServletResponse response) {
    	logger.debug("execute data search.");
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    	Map<String,Object> map = new HashMap<String,Object>();
    	String id = request.getParameter("id");
    	map.put("id", id);
    	list.add(map);
    	service.approve(list);
        return buildSuccess();
    }
	
	  /**
     * 
     * 驳回确跳转
     * @param list
     * @return
     */
	@RequestMapping(value = "/appbackbefore", method = RequestMethod.POST)
    public @ResponseBody Object appbackbefore(@RequestBody List<Map<String,Object>> list) {
    	Page<AssignInfoItemResponse> data = new PageImpl<AssignInfoItemResponse>(service.appback(list),null,list.size());;
        return buildSuccess(data);
    }
	
    /**
     * 
     * 驳回确跳转[确定]
     * @param list
     * @return
     */
	@RequestMapping(value = "/appback", method = RequestMethod.POST)
    public @ResponseBody Object appback(@RequestBody Map<String,Object> rejectObject) {
		String comment ="";
		String processInstanceId = (String) rejectObject.get("processInstanceId");
		String activityId = (String) rejectObject.get("activityId");
	
    	Map<String,String> result =service.appback(processInstanceId,activityId,comment);
        return result;
    }
	
    /**
     * 删除数据
     * 
     * @param list
     * @return
     */
	@RequestMapping(value = "/queryapp", method = RequestMethod.POST)
    public @ResponseBody Object queryapp(@RequestBody List<Map<String,Object>> list) {
		Page<HistoricTaskInstanceResponse> data =service.queryapp(list);
        return buildSuccess(data);
    }
    
}
