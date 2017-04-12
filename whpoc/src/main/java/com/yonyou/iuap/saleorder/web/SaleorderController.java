package com.yonyou.iuap.saleorder.web;

import java.util.List;

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

import com.yonyou.iuap.example.entity.meta.Dept;
import com.yonyou.iuap.example.entity.meta.Org;
import com.yonyou.iuap.example.entity.meta.SysUser;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.saleorder.entity.Saleorder;
import com.yonyou.iuap.saleorder.service.SaleOrderBPMService;
import com.yonyou.iuap.saleorder.service.SaleorderService;

@RestController
@RequestMapping(value = "/saleorder")
public class SaleorderController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(SaleorderController.class);

    @Autowired
    private SaleorderService service;
    
    @Autowired
    private SaleOrderBPMService bpmservice;

    /**
     * 前端传入参数，查询数据，列表展示
     * 
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(PageRequest pageRequest, @FrontModelExchange(modelType = Saleorder.class) SearchParams searchParams) {
        logger.debug("execute data search.");
        Page<Saleorder> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest);
        return buildSuccess(page);
    }

    /**
     * 增加主子表数据保存，传入json数据
     * 
     * @param userAndUserJob
     * @param request
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@RequestBody Saleorder obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        Saleorder u = service.save(obj) ;
        return super.buildSuccess(u);
    }


    /**
     * 更新主子表数据更新，传入json数据
     * 
     * @param userAndUserJob
     * @param request
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestBody Saleorder obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        Saleorder u = service.save(obj) ;
        return super.buildSuccess(u); 
    }

    /** 批量删除实体类 */
    @RequestMapping(value = "/delBatch", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteBatch(@RequestBody List<Saleorder> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchDeleteEntity(objs);
        return super.buildSuccess(objs);
    }
    
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Org/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllOrg() {
        logger.info("后台数据模拟查询");
        List<Org> list = service.findAllOrg();
        return super.buildSuccess(list);
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Dept/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllDept() {
        logger.info("后台数据模拟查询");
        List<Dept> list = service.findAllDept();
        return super.buildSuccess(list);
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Customer/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllCustomer() {
        logger.info("后台数据模拟查询");
//        List<Customer> list = service.findAllCustomer();
//        return super.buildSuccess(list);
        return null;
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Currtype/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllCurrtype() {
        logger.info("后台数据模拟查询");
//        List<Currtype> list = service.findAllCurrtype();
//        return super.buildSuccess(list);
        return null;
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/SysUser/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllSysUser() {
        logger.info("后台数据模拟查询");
        List<SysUser> list = service.findAllSysUser();
        return super.buildSuccess(list);
    }
    
    @RequestMapping("/approve")
    public @ResponseBody Object approve(@RequestBody List<Saleorder> objs, HttpServletRequest request)throws Exception {
    	logger.info("审批开始，调用BPM");
    	List<Saleorder> returnobj = service.approve(objs);
    	return super.buildSuccess(returnobj);
    }
    
    @RequestMapping("/unapprove")
    public @ResponseBody Object unapprove(@RequestBody List<Saleorder> objs, HttpServletRequest request)throws Exception {
    	logger.info("取消审批开始，调用BPM");
    	List<Saleorder> returnobj = service.unapprove(objs);
    	return super.buildSuccess(returnobj);
    }
    
}
