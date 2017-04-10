package com.yonyou.iuap.bpm.taskinfo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;

import yonyou.bpm.rest.RuntimeService;
import yonyou.bpm.rest.exception.RestException;
import yonyou.bpm.rest.response.historic.HistoricTaskInstanceResponse;
import yonyou.bpm.rest.response.runtime.process.AssignInfoItemResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.yonyou.iuap.bpm.approvedtask.entity.Approvedtask;
import com.yonyou.iuap.bpm.service.JsonResultService;
import com.yonyou.iuap.bpm.service.ProcessService;
import com.yonyou.iuap.bpm.taskinfo.entity.Taskinfo;

/**
 * <p>Title: CardTableMetaService</p>
 * <p>Description: </p>
 */
@Service
public class TaskinfoService {
	
	 private Logger logger = LoggerFactory.getLogger(TaskinfoService.class);
  
	@Autowired
	private ProcessService processService;
	
	@Autowired
	private JsonResultService jsonResultService;
 
    
	public void approve(List<Map<String,Object>> list) {
		String taskId =null;
		if(list == null ||list.size()==0)
		{
			return ; 
		}
		taskId = (String) list.get(0).get("id");
		try {
			processService.completeTask("userId", taskId, true, "同意");
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			 logger.error("审批任务失败!", e);
			//e.printStackTrace();
		}
	}
	public List<AssignInfoItemResponse> appback(List<Map<String,Object>> list) {
		String taskId =null;
		if(list == null ||list.size()==0)
		{
			return null; 
		}
		taskId = (String) list.get(0).get("id");
		List<AssignInfoItemResponse> activityList = new ArrayList<AssignInfoItemResponse>();
		  try {
	          	if(taskId!=null&&!taskId.isEmpty()) {
	          		JsonNode sss = (JsonNode) processService.bpmRestServices("18910949691").getTaskService().rejectCheck(taskId);
	          		ArrayNode rejectlist= (ArrayNode) sss.get("rejectInfo").get("assignInfoItems");
	          		if(rejectlist.size()==0){
	          			return null;
	          		}
	                  for (int i = 0; i <rejectlist.size() ; i++) {
		                          JsonNode jn = rejectlist.get(i);
		                          AssignInfoItemResponse assignInfo = jsonResultService.toObject(jn.toString(), AssignInfoItemResponse.class);
		                          activityList.add(assignInfo);
	                    	}
	                 
	          		}
	          	} catch (Exception e) {
	             logger.error("获取任务列表失败!", e);
	          	}
		  return activityList;
	}
		
	public Map<String,String> appback(String processInstanceId ,String activityId,String comment) {
		 Map<String,String> result = new HashMap<String,String>();
		if(activityId.isEmpty())
		{
			result.put("mes","请勾选要驳回的活动" );
			return result; 
		}
		RuntimeService runtimeService	= processService.bpmRestServices("").getRuntimeService();
		try {
			runtimeService.rejectToActivity(processInstanceId,activityId , comment);
			result.put("flag", "success");
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			 logger.error("驳回任务列表失败!", e);
			// e.printStackTrace();
			result.put("mes", "驳回任务列表失败!" +e.getMessage());
		}
		// TODO 自动生成的方法存根
	    return	result;
	}
	
	
	public Page<HistoricTaskInstanceResponse> queryapp(List<Map<String,Object>> list) {
		
		if(list == null ||list.size()==0)
		{
			return null; 
		}
		Page<HistoricTaskInstanceResponse> data =null;
		List<HistoricTaskInstanceResponse> listTasks = new ArrayList<HistoricTaskInstanceResponse>();
		String  processInstanceId  = (String) list.get(0).get("processInstanceId");
          try {
          	if(processInstanceId!=null&&!processInstanceId.isEmpty())
          	 listTasks = processService.queryInstanceAllHistoryTaskList("73cf71e2-6d8d-11e6-af88-b8aeed2e916b", processInstanceId);
          	 data = new PageImpl<HistoricTaskInstanceResponse>(listTasks,null,listTasks.size());
          } catch (Exception e) {
              logger.error("获取任务列表失败!", e);
          }
          return data;
		
	}
    
}
