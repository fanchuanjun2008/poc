package com.yonyou.iuap.bpm.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yonyou.bpm.rest.RuntimeService;

import com.fasterxml.jackson.databind.node.ObjectNode;
import com.yonyou.iuap.bpm.service.ProcessService;


@Controller
@RequestMapping(value = "/process")
public class ProcessTaskController {
	//日志
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProcessService bpmServioce;
	
	//流程目录服务
	
	
	@RequestMapping(value = "processInstancediagram", method = RequestMethod.GET)
	 protected void getProcessInstanceDiagramJson(HttpServletRequest req, HttpServletResponse resp)
	    		throws  IOException{
		 try{
	    	Map map = req.getParameterMap();
			Map<String, Object> values = new HashMap<String, Object>();
			if(map!=null){
				Iterator<String> keys = map.keySet().iterator();
				while(keys.hasNext()){
					String key = keys.next();
					values.put(key, req.getParameter(key));
				}
				
			}
			RuntimeService runtimeService=bpmServioce.bpmRestServices("bfb6b052-11c1-11e6-afae-b888e3f5dbd6").getRuntimeService();
			ObjectNode img=(ObjectNode) runtimeService.getProcessInstanceDiagramJson((String)values.get("processDefinitionId"),(String)values.get("processInstanceId"));
			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print(img);
			
	 } 
		catch (Throwable t) {
			logger.error("caught throwable at top level", t);
		}
	 }
	
	

	@RequestMapping(value = "highlightsprocessInstance", method = RequestMethod.GET)
	protected void getHighlightsProcessInstance(HttpServletRequest req, HttpServletResponse resp)
    		throws  IOException{
		
		try{
    	Map map = req.getParameterMap();
    	Map<String, Object> values = new HashMap<String, Object>();
    	if(map!=null){
    		
    		Iterator<String> keys = map.keySet().iterator();
    		while(keys.hasNext()){
    			String key = keys.next();
    			values.put(key, req.getParameter(key));
    		}
    	}
    	RuntimeService runtimeService=bpmServioce.bpmRestServices("bfb6b052-11c1-11e6-afae-b888e3f5dbd6").getRuntimeService();
	    ObjectNode obj=(ObjectNode) runtimeService.getHighlightsProcessInstance((String)values.get("processInstanceId"));
		resp.setCharacterEncoding("UTF-8");
	    resp.getWriter().print(obj);
	 }
	catch (Throwable t) {
		logger.error("caught throwable at top level", t);
	}
 }

	
}
