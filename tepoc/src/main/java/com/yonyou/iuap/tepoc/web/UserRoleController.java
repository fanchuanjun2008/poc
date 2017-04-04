package com.yonyou.iuap.tepoc.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.tepoc.entity.RoleVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;
import com.yonyou.iuap.tepoc.service.UserRoleService;

@RestController
@RequestMapping(value = "/UserRole")
public class UserRoleController extends BaseController{
    private Logger logger = LoggerFactory.getLogger(UserRoleController.class);
    
    @Autowired
    private UserRoleService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(PageRequest pageRequest, @FrontModelExchange(modelType = UserPsnVO.class) SearchParams searchParams) {
        logger.debug("execute data search.");
        Page<UserRoleVO> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest) ;
        Map<String,Object> map = new HashMap<String,Object>() ;
        map.put("data", page) ;        
        return super.buildMapSuccess(map) ;
    }
    
    @RequestMapping(value="/del", method= RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestBody UserRoleVO child, HttpServletRequest request) {
    	
    	service.deleteEntity(child);
    	return super.buildSuccess(child) ;
    	
    }

	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Role/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllRole() {
        logger.info("后台数据模拟查询");
        List<RoleVO> list = service.findAllRole();
        return super.buildSuccess(list);
    }
    
}
