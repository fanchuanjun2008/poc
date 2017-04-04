package com.yonyou.iuap.tepoc.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.service.UserDeptService;
import com.yonyou.iuap.example.entity.meta.Dept;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.example.entity.meta.EnumVo;
import com.yonyou.iuap.example.utils.EnumUtils;
import com.yonyou.iuap.mvc.type.SearchParams;

/**
 * <p>
 * Title: CardTableController
 * </p>
 * <p>
 * Description: 卡片表示例的controller层
 * </p>
 */
@RestController
@RequestMapping(value = "/UserDept")
public class UserDeptController extends BaseController {
    
	@Autowired
	private UserDeptService service;
    

    /**
     * 查询分页数据
     * 
     * @param pageRequest
     * @param searchParams
     * @return
     */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
        Page<UserDeptVO> data = service.selectAllByPage(pageRequest, searchParams);
        return buildSuccess(data);
    }

    /**
     * 保存数据
     * 
     * @param list
     * @return
     */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<UserDeptVO> list) {
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
    public @ResponseBody Object del(@RequestBody List<UserDeptVO> list) {
    	service.batchDeleteByPrimaryKey(list);
        return buildSuccess();
    }
    
	/**
     * 前端树形展示，当数据量小的时候，可以全部查询出来
     * @return
     */  
    @RequestMapping(value = "/Dept/listall", method = RequestMethod.GET)
    public @ResponseBody Object listAllDept() {
        List<Dept> list = service.findAllDept();
        return super.buildSuccess(list);
    }
    
}
