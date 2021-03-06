package com.yonyou.iuap.poc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.poc.entity.FHVO;
import com.yonyou.iuap.poc.service.FHVOService;

/**
 * controller层
 */
@RestController
@RequestMapping(value = "/mobileFHVO")
public class MobileFHVOController extends BaseController {

    @Autowired
    private FHVOService service;

    /**
     * data table 列表查询
     *
     * @param pageRequest
     * @param searchParams
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object page(@RequestParam(value = "pageNumber", defaultValue = "0") int pageNumber,
                       @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                       @RequestParam(value = "sort", defaultValue = "auto") String sort,
                       SearchParams searchParams) {
        PageRequest pageRequest = new PageRequest(pageNumber, pageSize, new Sort(Sort.Direction.DESC, "ts"));
        Page<FHVO> result = service.selectAllByPage(pageRequest, searchParams.getSearchMap());
        return buildSuccess(result);
    }


}
