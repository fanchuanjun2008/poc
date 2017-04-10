package com.yonyou.iuap.system.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.UnknownHttpStatusCodeException;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.iuap.context.InvocationInfoProxy;
import com.yonyou.iuap.crm_mobile.common.utils.ReferRestTemplate;

@Service
public class CommonService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
    private ReferRestTemplate template;
	
	public Object service( Map<String,String> params){
		Map resultmap = new HashMap();
		String opr = params.get("requestopr");
		String url = params.get("requesturl");
		url = "http://127.0.0.1:8090/tepoc"+url;
		String responseType = params.get("responseType");
		String urlVariables = params.get("requestparam");
		String requestcallback = params.get("requestcallback");
		String sessionObj = params.get("sessionObj");
		String deviceinfo = params.get("deviceinfo");
		InvocationInfoProxy.setExtendAttribute("sessionObj", sessionObj);
		Map args = new HashMap();
		if(StringUtils.isNotEmpty(urlVariables)){
			JSONObject urlVariablesObj = new JSONObject();
			JSONObject appSessionObj = urlVariablesObj.parseObject(urlVariables);
			for(String keyitem : appSessionObj.keySet()){				
				args.put(keyitem, appSessionObj.get(keyitem));
				logger.error("args key={},name={}", keyitem, appSessionObj.get(keyitem));
			}
		}
		Object result = null;
		try{
			if(opr.equals("get")){
				result = this.template.getForObject(url, Class.forName(responseType),args);
			}else if(opr.equals("post")){
				result = this.template.postForObject(url, args, Class.forName(responseType), new Object[0]);
			}else if(opr.equals("delete")){
				this.template.delete(url, args);
			}
			resultmap.put("requestcallback", requestcallback);
			resultmap.put("status", "success");
			resultmap.put("data", result);
		}catch(RestClientException | ClassNotFoundException e){
			logger.error("Mobile Service {} Invoker Error",url);
			logger.error(e.getMessage(), e);
			resultmap.put("status", "failed");
			int status = 200;
			if(e instanceof HttpStatusCodeException){
				HttpStatusCodeException err = (HttpStatusCodeException) e;
				status = err.getStatusCode().value();
			}else if(e instanceof UnknownHttpStatusCodeException){
				UnknownHttpStatusCodeException err = (UnknownHttpStatusCodeException) e;
				status = err.getRawStatusCode();
			}else if(e instanceof ResourceAccessException){
				ResourceAccessException err = (ResourceAccessException) e;
				status = 500;
			}else{
				status = 500;
			}
			if(status == 306){
				resultmap.put("data", "请先登录，再操作");
			}else{
				resultmap.put("data", "服务器端发生错误");
			}
		}
		return resultmap;
	}
}
