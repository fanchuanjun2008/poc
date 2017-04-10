package com.yonyou.iuap.system.web.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.iuap.auth.session.SessionManager;
import com.yonyou.iuap.auth.token.ITokenProcessor;
import com.yonyou.iuap.system.service.AccountService;
import com.yonyou.iuap.system.service.CommonService;

/**
 * 默认登录逻辑示例，项目使用时候根据自己的需求，添加rsa加密、配置token生成参数等
 */
@Controller
@RequestMapping(value = "/ssologin")
public class SSOLoginController {
	
    private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	protected CommonService commonService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String login(Model model) {
		
		//return "login." + InvocationInfoProxy.getLocale()+".html";
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="formLogin")
	public String formLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
		
        try {
			Map loginparams = new HashMap();
			loginparams.put("requestopr", "post");
			loginparams.put("requesturl", "/malogin/formLogin2");
			loginparams.put("responseType", "java.lang.Object");
			loginparams.put("requestparam", "{'loginName':'" + userName
					+ "','password':'" + passWord + "'}");
			Object loginresult = commonService.service(loginparams);
			JSONObject json = new JSONObject();
			JSONObject resultjson = (JSONObject) json.toJSON(loginresult);
			JSONObject data = (JSONObject) resultjson.get("data");
			JSONObject sessionObj = (JSONObject) data.get("sessionObj");
			Cookie cookie = new Cookie("sessionObj", sessionObj.toString());
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch (Exception e) {
			logger.error("单点登录失败!");
			return "login";
		}
         return "redirect";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "login";
	}

}
