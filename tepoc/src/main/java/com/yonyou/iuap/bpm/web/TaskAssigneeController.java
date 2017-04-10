package com.yonyou.iuap.bpm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springside.modules.web.Servlets;

import yonyou.bpm.rest.request.identity.UserQueryParam;
import yonyou.bpm.rest.response.identity.UserResponse;
import yonyou.bpm.rest.utils.BaseUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.yonyou.iuap.bpm.service.JsonResultService;
import com.yonyou.iuap.bpm.service.ProcessService;

/**
 * BPM改派、加签管理
 * Created by gaoshja on 2016/9/7.
 */
@RestController
@RequestMapping("/assignee")
public class TaskAssigneeController {

	//日志
		private final Logger logger = LoggerFactory.getLogger(getClass());
		@Autowired
		private ProcessService processService;
		@Autowired
		private JsonResultService jsonResultService;
	    
		
    /**
     * 获取列表信息
     */
    @RequestMapping("/loadUsers")
    public Object loadUsersData(@RequestParam(value = "pageIndex", defaultValue = "0") int pageNumber, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize, @RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model, ServletRequest request) {
        logger.debug("加载人员列表");
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            Map<String, Object> searchParams = new HashMap<String, Object>();
            searchParams = Servlets.getParametersStartingWith(request, "search_");
            UserQueryParam paramUserQueryParam = new UserQueryParam();
            String key = null;
            String likeName = (String) searchParams.get("LIKE_name");
            if (StringUtils.isNotBlank(likeName)) {
                key = likeName;
                paramUserQueryParam.setNameLike("%"+likeName+"%");
                paramUserQueryParam.setCodeLikeIgnoreCase("%"+likeName+"%");
            }
            try {
                JsonNode jsonNode =	(JsonNode) processService.bpmRestServices("").getIdentityService().queryUsers(paramUserQueryParam);
                ArrayNode arrayNode = BaseUtils.getData(jsonNode);
                int dataSize = arrayNode == null ? 0 : arrayNode.size();
                List<UserResponse> list = new ArrayList<UserResponse>(dataSize);
                for (int i = 0; i < dataSize; i++) {
                    JsonNode jn = arrayNode.get(i);// {"data":[],"total":0,"start":0,"sort":"taskInstanceId","order":"asc","size":0}这样的数据size居然不是0
                    UserResponse userResp = jsonResultService.toObject(jn.toString(), UserResponse.class);
                    list.add(userResp);
                }
                result.put("data", list);
                result.put("flag", "success");
                result.put("msg", "查询数据成功!");

            } catch (Exception e) {
                logger.error("获取待办列表失败!", e);
            }
        } catch (Exception e) {
            logger.error("查询数据失败!", e);

        }
        return result;
    }

    /***
     * 加签
     */
    @RequestMapping("/asignAddCommit")
    public Object asignAddCommit(@RequestBody Map<String,Object> assignInfo){
        logger.debug("G[加签]");
        String taskId = (String) assignInfo.get("taskId");
        Map<String,Object> result = new HashMap<String,Object>();
        List<JSONObject> jsonStr = (List<JSONObject>) assignInfo.get("data");
        try {
            if(jsonStr != null){
                JSONArray jsonArray = JSONArray.fromObject(jsonStr);
                List<String> paramList = new ArrayList<String>();
                for (int i = 0; i < jsonArray.size(); i++) {
                    net.sf.json.JSONObject jb = (net.sf.json.JSONObject)jsonArray.get(i);
                    String pid = jb.getString("id");
                    paramList.add(pid);
                }
                long t1 = System.currentTimeMillis();
                processService.bpmRestServices("").getTaskService().counterSignAdd(taskId, paramList);
                long t2 = System.currentTimeMillis();
                logger.debug("调用流程加签的时间为: " + (t2 - t1) + " 毫秒!");
                result.put("flag", "success");
                result.put("msg", "加签成功!");
            } else {
                result.put("flag", "fail");
                result.put("msg", "请选择要加签的数据!");
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            result.put("flag", "fail");
            result.put("msg", "加签失败!");
        }
        return result;
    }

    /***
     * 改派
     */
    @RequestMapping("/delegateCommit")
    public Object delegateCommit(@RequestParam String taskId,ServletRequest request){
        logger.debug("G[改派]");
        Map<String,Object> result = new HashMap<String,Object>();
        String jsonStr = request.getParameter("data");
        try {
            long t1 = System.currentTimeMillis();
            processService.bpmRestServices("").getTaskService().delegateTaskCompletely(taskId, jsonStr);
            long t2 = System.currentTimeMillis();
            logger.error("调用流程改派的时间为: " + (t2 - t1) + " 毫秒!");
            result.put("flag", "success");
            result.put("msg", "改派成功!");
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            result.put("flag", "fail");
            result.put("msg", "改派失败!");
        }
        return result;
    }
}
