package com.yonyou.iuap.system.web.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import com.yonyou.iuap.auth.shiro.AuthConstants;
import com.yonyou.iuap.auth.token.ITokenProcessor;
import com.yonyou.iuap.auth.token.TokenParameter;
import com.yonyou.iuap.system.entity.MgrUser;
import com.yonyou.iuap.system.service.AccountService;
import com.yonyou.iuap.utils.PropertyUtil;

/**
 * 移动端默认登录逻辑示例，项目上根据与用户中心或者自己的用户管理服务进行修改
 */
@RestController
@RequestMapping(value = "/malogin")
public class MaLoginController {
	
    private final Logger logger = LoggerFactory.getLogger(getClass());
    
    public static final int HASH_INTERATIONS = 1024;
    
    /*
            用户中心给出的status表示状态，
    0表示失败，1表示成功，2表示虽然密码正确，但是还需要修改密码，3表示密码正确，但是密码快失效了
            对于返回为0的，会给出失败信息，返回值为2的，会给一个提示信息，一个url字段，目前都注释掉了，等后面有了这个接口在放开
            返回值为3的，会给一个提示信息，一个url字段，需要提示用户是否去修改密码，如果修改的话，则按url进行跳转，如果不修改，则正常登录
    */
    public static final String STATUS_FAILED = "0";
    public static final String STATUS_SUCCESS = "1";
    public static final String STATUS_FAILED1 = "2";
    public static final String STATUS_FAILED2 = "3";
    
	//移动的指定为maTokenProcessor
	@Autowired()
	protected ITokenProcessor maTokenProcessor;
	
	@Autowired
	protected AccountService accountService;
	
	@RequestMapping(method = RequestMethod.POST,value="formLogin")
	public String formLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        JSONObject result = new JSONObject();
		
		String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        String sysId = PropertyUtil.getPropertyByKey("sysid");
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(passWord) || StringUtils.isBlank(sysId)){
    		String message = "参数不正确!";
	        result.put("flag", "fail");
	        result.put("msg", message);
	        logger.error("params error!, reason is {}!", message);
	        return result.toString();
        }
        
        /*
                        用户中心认证成功返回结果如下：
        {
          "status" : 1,
          "msg" : "认证成功",
          "tenant" : "租户一",
          "usertype" : 1,
          "user" : {
            "companyId" : "",
            "departmentId" : "",
            "loginTs" : 0,
            "pwdstarttime" : "",
            "registerDate" : "2016-02-02 10:10:05",
            "soureceId" : "",
            "systemId" : "",
            "tenantId" : "JHOFdSdP",
            "typeId" : "管理员",
            "userAvator" : "",
            "userCode" : "test001",
            "userEmail" : "test001@yonyou.com",
            "userId" : "b7196a7f-04db-44b4-ac2a-5da9e1b9aab8",
            "userMobile" : "",
            "userName" : "test001",
            "userStates" : 1
          }
        }
	    */
        
        try {
        	// 调用用户中心的sdk验证用户
        	// String verifyResult = UserCenter.verifyUser(userName, passWord, sysId);
        	
        	//模拟一个结果集
        	MgrUser user = accountService.findUserByLoginName(userName);
    		if (passWord!=null && user != null) {
    			byte[] hashPassword = Digests.sha1(passWord.getBytes(), Encodes.decodeHex(user.getSalt()), HASH_INTERATIONS);
    			String checkPwd = Encodes.encodeHex(hashPassword);
    			if(checkPwd.equals(user.getPassword())){
    				String verifyResult = "{\"status\":1,\"msg\":\"认证成功\",\"tenant\":\"JHOFdSdP\"}";
    				
    				if(StringUtils.isNotBlank(verifyResult) && !JSONObject.fromObject(verifyResult).isEmpty()){
    					JSONObject json = JSONObject.fromObject(verifyResult);
    					
    					String status = String.valueOf(json.get("status"));
    					String message = json.getString("msg");
    					
    					// 状态为1是成功，2、3是带提示信息，0为失败
    					if(STATUS_SUCCESS.equals(status)){
    						JSONObject sessionObj = process(request, response, userName, user, json);
    						result.put("sessionObj", sessionObj.toString());
    						logger.info("user login from mobile success, username is {}!", userName);
    						result.put("flag", "success");
    						result.put("msg", "登录成功!");
    						
    					} else if(STATUS_FAILED1.equals(status) || STATUS_FAILED2.equals(status)) {
    						JSONObject sessionObj = process(request, response, userName, user, json);
    						result.put("sessionObj", sessionObj.toString());
    						result.put("flag", "success");
    						result.put("msg", "登录成功!");
    						logger.info("{} login success, tip is {}!", userName, message);
    					} else {
    						result.put("flag", "fail");
    						result.put("msg", message);
    						logger.info("{} login fail, reason is {}!", userName, message);
    					}
    				} else {
    					String message = "调用用户中心返回结果为空!";
    					result.put("flag", "fail");
    					result.put("msg", message);
    					logger.error("get result from usercenter failed, reason is {}!", message);
    				}
    			}
    		}
		} catch (Exception e) {
    		String message = "调用用户中心认证服务错误!";
	        result.put("flag", "fail");
	        result.put("msg", message);
	        logger.error("user login from mobile failed, reason is {}!" + message, e);
		}

		return result.toString();
		
	}
	
	@RequestMapping(method = RequestMethod.POST,value="formLogin2")
	public @ResponseBody JSONObject formLogin2(@RequestBody MgrUser params) throws IOException {
        JSONObject result = new JSONObject();
        String userName = (String) params.getLoginName();
        String passWord = (String) params.getPassword();
        String sysId = PropertyUtil.getPropertyByKey("sysid");
        if(StringUtils.isBlank(userName) || StringUtils.isBlank(passWord) || StringUtils.isBlank(sysId)){
    		String message = "参数不正确!";
	        result.put("flag", "fail");
	        result.put("msg", message);
	        logger.error("params error!, reason is {}!", message);
	        return result;
        }
        try {
        	// 调用用户中心的sdk验证用户
        	// String verifyResult = UserCenter.verifyUser(userName, passWord, sysId);
        	//模拟一个结果集
        	MgrUser user = accountService.findUserByLoginName(userName);
    		if (passWord!=null && user != null) {
    			byte[] hashPassword = Digests.sha1(passWord.getBytes(), Encodes.decodeHex(user.getSalt()), HASH_INTERATIONS);
    			String checkPwd = Encodes.encodeHex(hashPassword);
    			if(checkPwd.equals(user.getPassword())){
    				String verifyResult = "{\"status\":1,\"msg\":\"认证成功\",\"tenant\":\"JHOFdSdP\"}";
    				if(StringUtils.isNotBlank(verifyResult) && !JSONObject.fromObject(verifyResult).isEmpty()){
    					JSONObject json = JSONObject.fromObject(verifyResult);
    					String status = String.valueOf(json.get("status"));
    					String message = json.getString("msg");
    					// 状态为1是成功，2、3是带提示信息，0为失败
    					if(STATUS_SUCCESS.equals(status)){
    						JSONObject sessionObj = process2(userName, user, json);
    						result.put("sessionObj", sessionObj.toString());
    						logger.info("user login from mobile success, username is {}!", userName);
    						result.put("flag", "success");
    						result.put("msg", "登录成功!");
    						
    					} else if(STATUS_FAILED1.equals(status) || STATUS_FAILED2.equals(status)) {
    						JSONObject sessionObj = process2(userName, user, json);
    						result.put("sessionObj", sessionObj.toString());
    						result.put("flag", "success");
    						result.put("msg", "登录成功!");
    						logger.info("{} login success, tip is {}!", userName, message);
    					} else {
    						result.put("flag", "fail");
    						result.put("msg", message);
    						logger.info("{} login fail, reason is {}!", userName, message);
    					}
    				} else {
    					String message = "调用用户中心返回结果为空!";
    					result.put("flag", "fail");
    					result.put("msg", message);
    					logger.error("get result from usercenter failed, reason is {}!", message);
    				}
    			}
    		}
		} catch (Exception e) {
    		String message = "调用用户中心认证服务错误!";
	        result.put("flag", "fail");
	        result.put("msg", message);
	        logger.error("user login from mobile failed, reason is {}!" + message, e);
		}

		return result;
		
	}

	private JSONObject process(HttpServletRequest request,
			HttpServletResponse response,String userName, MgrUser user,
			JSONObject json) {
		JSONObject sessionObj = new JSONObject();
		TokenParameter tp = new TokenParameter();
		tp.setUserid(userName);
		tp.setLogints(String.valueOf(System.currentTimeMillis()));

		String tennantid = json.getString("tenant");
		// 如果有租户信息，设置，目前用户同意认证中心返回的的tenant是名称
		tp.getExt().put(AuthConstants.PARAM_TENANTID, tennantid);

		try {
			tp.getExt().put("userCNName" , URLEncoder.encode(user.getName(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			logger.error("encode error!", e);
		}
        tp.getExt().put("pk_user" , user.getId().toString());
        tp.getExt().put("username" , user.getName());
        //tp.getExt().put("pk_dept" , user.getPkDept());
		Cookie[] cookies = maTokenProcessor.getCookieFromTokenParameter(tp);
		for (Cookie cookie : cookies) {
			response.addCookie(cookie);
			sessionObj.put(cookie.getName(), cookie.getValue());
		}
		return sessionObj;
	}
	
	private JSONObject process2(String userName, MgrUser user,
			JSONObject json) {
		JSONObject sessionObj = new JSONObject();
		TokenParameter tp = new TokenParameter();
		tp.setUserid(userName);
		tp.setLogints(String.valueOf(System.currentTimeMillis()));

		String tennantid = json.getString("tenant");
		// 如果有租户信息，设置，目前用户同意认证中心返回的的tenant是名称
		tp.getExt().put(AuthConstants.PARAM_TENANTID, tennantid);

		try {
			tp.getExt().put("userCNName" , URLEncoder.encode(user.getName(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			logger.error("encode error!", e);
		}
        tp.getExt().put("pk_user" , user.getId().toString());
        tp.getExt().put("username" , user.getName());
        //tp.getExt().put("pk_dept" , user.getPkDept());
		Cookie[] cookies = maTokenProcessor.getCookieFromTokenParameter(tp);
		for (Cookie cookie : cookies) {
			sessionObj.put(cookie.getName(), cookie.getValue());
		}
		return sessionObj;
	}
}
