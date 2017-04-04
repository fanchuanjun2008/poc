package com.yonyou.iuap.tepoc.web;

import com.yonyou.iuap.tepoc.entity.TeBusilogVO;
import com.yonyou.iuap.tepoc.service.TeBusilogService;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.example.web.BaseController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * Title: CardTableController
 * </p>
 * <p>
 * Description: 卡片表示例的controller层
 * </p>
 */
@RestController
@RequestMapping(value = "/busilog")
public class TeBusilogController extends BaseController {
	@Autowired
	private TeBusilogService service;

    /**
     * 查询分页数据
     * 
     * @param pageRequest
     * @param searchParams
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
        Page<TeBusilogVO> data = service.selectAllByPage(pageRequest, searchParams);
        return buildSuccess(data);
    }

    /**
     * 保存数据
     * 
     * @param list
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<TeBusilogVO> list) {
    	service.save(list);
        return buildSuccess();
    }


    /**
     * 删除数据
     * 
     * @param list
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public @ResponseBody Object del(@RequestBody List<TeBusilogVO> list) {
    	service.batchDeleteByPrimaryKey(list);
        return buildSuccess();
    }
}
