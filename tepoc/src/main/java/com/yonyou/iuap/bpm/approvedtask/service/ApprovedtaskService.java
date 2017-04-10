package com.yonyou.iuap.bpm.approvedtask.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yonyou.bpm.rest.exception.RestException;

import com.yonyou.iuap.bpm.approvedtask.entity.Approvedtask;
import com.yonyou.iuap.bpm.service.JsonResultService;
import com.yonyou.iuap.bpm.service.ProcessService;

/**
 * <p>Title: CardTableMetaService</p>
 * <p>Description: </p>
 */
@Service
public class ApprovedtaskService {
	
	private Logger logger = LoggerFactory.getLogger(ApprovedtaskService.class);
    
	@Autowired
	private ProcessService processService;
	
	@Autowired
	private JsonResultService jsonResultService;
    
  
	public void queryapp(Approvedtask task) {
		
	}
	public void unapprove(List<Map<String,Object>> list) {
		String taskId =null;
		if(list == null ||list.size()==0)
		{
			return ; 
		}
		taskId = (String) list.get(0).get("id");	
		try {
			processService.bpmRestServices("").getTaskService().withdrawTask(taskId);
		} catch (RestException e) {
			logger.error("任务弃审失败", e);
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
    
}
