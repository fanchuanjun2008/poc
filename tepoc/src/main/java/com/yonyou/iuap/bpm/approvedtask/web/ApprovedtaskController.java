package com.yonyou.iuap.bpm.approvedtask.web;

import java.util.List;
import java.util.Map;

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

import yonyou.bpm.rest.exception.RestException;
import yonyou.bpm.rest.response.historic.HistoricTaskInstanceResponse;

import com.yonyou.iuap.bpm.approvedtask.entity.Approvedtask;
import com.yonyou.iuap.bpm.approvedtask.service.ApprovedtaskService;
import com.yonyou.iuap.bpm.service.ProcessService;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.web.BaseController;

/**
 * <p>
 * Title: CardTableController
 * </p>
 * <p>
 * Description: 卡片表示例的controller层
 * </p>
 */
@RestController
@RequestMapping(value = "/approved")
public class ApprovedtaskController extends BaseController {
    
	private Logger logger = LoggerFactory.getLogger(ApprovedtaskService.class);
	
	@Autowired
	private ApprovedtaskService service;
	
	@Autowired
	private ProcessService processService;
    

    /**
     * 查询分页数据
     * 
     * @param pageRequest
     * @param searchParams
     * @return
     */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
		Page<HistoricTaskInstanceResponse> data = null;
		int  size =10;
		int start = 0 ;
		try {
		  data = processService.queryTaskList("73cf71e2-6d8d-11e6-af88-b8aeed2e916b","" , "", "", null, size, start, true, false,null);
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			logger.error("查询已办列表失败",e);
		}
        return buildSuccess(data);
    }

    /**
     * 保存数据
     * 
     * @param list
     * @return
     */
	@RequestMapping(value = "/unapprove", method = RequestMethod.POST)
    public @ResponseBody Object unapprove(@RequestBody List<Map<String,Object>> list) {
    	service.unapprove(list);
        return buildSuccess();
    }

    /**
     * 删除数据
     * 
     * @param list
     * @return
     */
	@RequestMapping(value = "/queryapp", method = RequestMethod.POST)
    public @ResponseBody Object queryapp(@RequestBody Approvedtask task) {
    	service.queryapp(task);
        return buildSuccess();
    }
    
}
