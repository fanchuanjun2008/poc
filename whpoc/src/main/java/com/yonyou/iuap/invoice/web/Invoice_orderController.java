package com.yonyou.iuap.invoice.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.entity.Invoice_order;
import com.yonyou.iuap.invoice.service.Invoice_orderService;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.example.entity.meta.EnumVo;
import com.yonyou.iuap.example.utils.EnumUtils;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

@RestController
@RequestMapping(value = "/invoice_order")
public class Invoice_orderController extends BaseController{
    private Logger logger = LoggerFactory.getLogger(Invoice_orderController.class);
    
    @Autowired
    private Invoice_orderService service;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(PageRequest pageRequest, @FrontModelExchange(modelType = InvoiceVO.class) SearchParams searchParams) {
        logger.debug("execute data search.");
        Page<Invoice_order> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest) ;
        Map<String,Object> map = new HashMap<String,Object>() ;
        map.put("data", page) ;        
        return super.buildMapSuccess(map) ;
    }
    
    @RequestMapping(value="/del", method= RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestBody Invoice_order child, HttpServletRequest request) {
    	
    	service.deleteEntity(child);
    	return super.buildSuccess(child) ;
    	
    }

}
