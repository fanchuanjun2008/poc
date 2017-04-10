package com.yonyou.iuap.crm_mobile.common.utils;

import java.io.IOException;
import java.net.URI;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.iuap.context.InvocationInfoProxy;

public class ReferRestTemplate extends RestTemplate {

	public ReferRestTemplate() {}

	public ReferRestTemplate(ClientHttpRequestFactory requestFactory) {
		super(requestFactory);
	}

	protected ClientHttpRequest createRequest(URI url, HttpMethod method)
			throws IOException {
		ClientHttpRequest request = super.createRequest(url, method);
		
		String sessionStr = (String) InvocationInfoProxy.getExtendAttribute("sessionObj");
		
		StringBuilder sb = new StringBuilder();
		if(!StringUtils.isEmpty(sessionStr)){
			JSONObject sessionObj = new JSONObject();
			JSONObject appSessionObj = sessionObj.parseObject(sessionStr);
			if (appSessionObj != null) {
				for (String name : appSessionObj.keySet()) {
					sb.append(name).append("=")
					.append(appSessionObj.get(name)).append(";");
				}
			}
		}

		request.getHeaders().add("Cookie",
				"SERVERID=Mobile_Server;" + sb.toString());
		request.getHeaders().add("X-Requested-With","XMLHttpRequest");
		return request;
	}
	
}
