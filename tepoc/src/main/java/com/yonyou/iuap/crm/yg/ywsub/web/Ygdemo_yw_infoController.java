package com.yonyou.iuap.crm.yg.ywsub.web;

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

import com.yonyou.iuap.crm.corp.entity.BdCorpVO;
import com.yonyou.iuap.crm.psn.entity.BdPsndocVO;
import com.yonyou.iuap.crm.user.entity.ExtIeopUserVO;
import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_info;
import com.yonyou.iuap.crm.yg.ywsub.service.Ygdemo_yw_infoService;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.web.BaseController;

@RestController
@RequestMapping(value = "/ygdemo_yw_info")
public class Ygdemo_yw_infoController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(Ygdemo_yw_infoController.class);

    @Autowired
    private Ygdemo_yw_infoService service;

    /**
     * 前端传入参数，查询数据，列表展示
     * 
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(PageRequest pageRequest, @FrontModelExchange(modelType = Ygdemo_yw_info.class) SearchParams searchParams) {
        logger.debug("execute data search.");
        Page<Ygdemo_yw_info> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest);
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
    public Object add(@RequestBody Ygdemo_yw_info obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        Ygdemo_yw_info u = service.save(obj) ;
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
    public Object update(@RequestBody Ygdemo_yw_info obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        Ygdemo_yw_info u = service.save(obj) ;
        return super.buildSuccess(u); 
    }

    /** 批量删除实体类 */
    @RequestMapping(value = "/delBatch", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteBatch(@RequestBody List<Ygdemo_yw_info> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchDeleteEntity(objs);
        return super.buildSuccess(objs);
    }
    
    
    
    /** 提交审批 */
    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    @ResponseBody
    public Object submit(@RequestBody List<Ygdemo_yw_info> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchSubmitEntity(objs);
        return super.buildSuccess(objs);
    }
    
    
    /** 提交审批 */
    @RequestMapping(value = "/unsubmit", method = RequestMethod.POST)
    @ResponseBody
    public Object unsubmit(@RequestBody List<Ygdemo_yw_info> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchUnsubmitEntity(objs);
        return super.buildSuccess(objs);
    }
    
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/BdCorpVO/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllBdCorpVO() {
        logger.info("后台数据模拟查询");
        List<BdCorpVO> list = service.findAllBdCorpVO();
        return super.buildSuccess(list);
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/BdPsndocVO/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllBdPsndocVO() {
        logger.info("后台数据模拟查询");
        List<BdPsndocVO> list = service.findAllBdPsndocVO();
        return super.buildSuccess(list);
    }
    
    
    
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/ExtIeopUserVO/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllExtIeopUserVO() {
        logger.info("后台数据模拟查询");
        List<ExtIeopUserVO> list = service.findAllExtIeopUserVO();
        return super.buildSuccess(list);
    }
    
    
}
