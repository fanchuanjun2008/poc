package com.yonyou.iuap.invoice.web;

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

import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.invoice.company.CompanyVO;
import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.entity.Tsi18nVO;
import com.yonyou.iuap.invoice.service.InvoiceService;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;

@RestController
@RequestMapping(value = "/Invoice")
public class InvoiceController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(InvoiceController.class);

    @Autowired
    private InvoiceService service;

    /**
     * 前端传入参数，查询数据，列表展示
     * 
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(PageRequest pageRequest, @FrontModelExchange(modelType = InvoiceVO.class) SearchParams searchParams) {
        logger.debug("execute data search.");
        Page<InvoiceVO> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest);
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
    public Object add(@RequestBody InvoiceVO obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        InvoiceVO u = service.save(obj) ;
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
    public Object update(@RequestBody InvoiceVO obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        InvoiceVO u = service.save(obj) ;
        return super.buildSuccess(u); 
    }

    /** 批量删除实体类 */
    @RequestMapping(value = "/delBatch", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteBatch(@RequestBody List<InvoiceVO> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchDeleteEntity(objs);
        return super.buildSuccess(objs);
    }
    
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Company/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllCompany() {
        logger.info("后台数据模拟查询");
        List<CompanyVO> list = service.findAllCompany();
        return super.buildSuccess(list);
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Tsi18n/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllTsi18n() {
        logger.info("后台数据模拟查询");
        List<Tsi18nVO> list = service.findAllTsi18n();
        return super.buildSuccess(list);
    }
    
}
