package com.yonyou.iuap.tepoc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springside.modules.web.Servlets;

import com.yonyou.iuap.example.entity.meta.Dept;
import com.yonyou.iuap.example.entity.meta.EnumVo;
import com.yonyou.iuap.example.entity.meta.Org;
import com.yonyou.iuap.example.entity.meta.Sex;
import com.yonyou.iuap.example.utils.EnumUtils;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;
import com.yonyou.iuap.tepoc.common.utils.ExcelWriterPoiWriter;
import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;
import com.yonyou.iuap.tepoc.service.UserPsnService;
import com.yonyou.iuap.tepoc.service.UserRoleService;

@RestController
@RequestMapping(value = "/UserPsn")
public class UserPsnController extends BaseController {
    private Logger logger = LoggerFactory.getLogger(UserPsnController.class);

    @Autowired
    private UserPsnService service;
    @Autowired
    private UserRoleService roleservice;
    
    @RequestMapping(value = "/findall", method = RequestMethod.GET)
    @ResponseBody
    public Page<UserPsnVO> testfindUserByUserMobile() throws DAOException {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(0,10);
		Page<UserPsnVO> result = service.selectAllByPage(searchParams, pageRequest);
		return result;
	}
    
    @RequestMapping(value = "/findone", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> testfindUserById() throws DAOException {
    	Map<String, Object> result = new HashMap<String, Object>();
    	
    	Map<String, Object> headsearchParams = new HashMap<String, Object>();
		PageRequest headpageRequest = new PageRequest(0,10);
		String pk_user = "ed631e6d-921e-46dc-ab3b-6970a3f2a06a";
		headsearchParams.put("pk_user", pk_user);
		Page<UserPsnVO> head = service.selectAllByPage(headsearchParams, headpageRequest);
		
		Map<String, Object> bodysearchParams = new HashMap<String, Object>();
		PageRequest bodypageRequest = new PageRequest(0,10);
		Page<UserRoleVO> body = roleservice.selectAllByPage(bodysearchParams, bodypageRequest);
		result.put("head", head.getContent().get(0));
		result.put("body", body);
		return result;
	}
    
    @RequestMapping(value = "/savelist", method = RequestMethod.GET)
    @ResponseBody
    public UserPsnVO testSaveUser() throws DAOException {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(1,10);
		UserPsnVO entity = new UserPsnVO();
		entity.setUsername("测试用户");
		entity.setSex("0");
		entity.setIdcard("xxxxxxxxxxxxxxxxxxxxx");
		entity.setEdution("大学");
		entity.setEmail("fanchuanjun2008@163.com");
		List<UserDeptVO> id_userdept = new ArrayList<UserDeptVO>();
		for(int i = 0; i<5; i++){
			UserDeptVO usrrole = new UserDeptVO();
			usrrole.setDeptname("test"+i);
			usrrole.setDeptcode("dept"+i);
			id_userdept.add(usrrole);
		}
		entity.setId_userdept(id_userdept);
		List<UserRoleVO> id_userrole = new ArrayList<UserRoleVO>();
		for(int i = 0; i<5; i++){
			UserRoleVO usrrole = new UserRoleVO();
			usrrole.setRolecode("role"+i);
			usrrole.setRolename("test"+i);
			usrrole.setRoletype("测试");
			id_userrole.add(usrrole);
		}
		entity.setId_userrole(id_userrole);
		UserPsnVO result = service.merge(entity);
		return result;
	}
    
    @RequestMapping(value = "/savecard", method = RequestMethod.POST)
    @ResponseBody
    public Object saveUserPsn(@RequestBody UserPsnVO entity) throws DAOException {
		UserPsnVO result = service.merge(entity);
		return super.buildSuccess(result);
	}

    /**
     * 前端传入参数，查询数据，列表展示
     * 
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(@RequestParam(value = "page", defaultValue = "0") int pageNumber,
			@RequestParam(value = "page.size", defaultValue = "10") int pageSize,
			@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
			Model model, ServletRequest request) {
        logger.debug("execute data search.");
        Map<String, Object> searchParams = new HashMap<String, Object>();
		searchParams = Servlets.getParametersStartingWith(request, "search_");
		PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, "auto");
        Page<UserPsnVO> page = service.selectAllByPage(searchParams, pageRequest);
        return super.buildSuccess(page);
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
    public Object add(@RequestBody UserPsnVO obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        UserPsnVO u = service.save(obj) ;
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
    public Object update(@RequestBody UserPsnVO obj, HttpServletRequest request) {
        logger.debug("execute add operate.");
        UserPsnVO u = service.save(obj) ;
        return super.buildSuccess(u); 
    }

    /** 批量删除实体类 */
    @RequestMapping(value = "/delBatch", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteBatch(@RequestBody List<UserPsnVO> objs, HttpServletRequest request) throws Exception {
        logger.debug("execute del operate.");
        service.batchDeleteEntity(objs);
        return super.buildSuccess(objs);
    }
    
    /**查询枚举值 */
    @RequestMapping(value = "/loadEnum", method = RequestMethod.GET)
    @ResponseBody
    public Object loadEnum() throws Exception {
    	 Map<String, List<EnumVo>> map = EnumUtils.loadEnum(Sex.class);
        return super.buildMapSuccess(map);
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
	 * 用户管理查询界面数据导出
	* TODO description
	* @author 
	* @date 2017年1月19日
	* @param model
	* @param request
	* @param response
	* @throws BusinessException
	 */
	@RequestMapping(value = "/excelExport", method = RequestMethod.POST)
	public void userExcelExport(
			ModelMap model,
			HttpServletRequest request,
			HttpServletResponse response) throws BusinessException {
		try {
			Map<String, Object> searchParams = new HashMap<String, Object>();
			PageRequest pageRequest = new PageRequest(0,10);
			Page<UserPsnVO> userpage = service.selectAllByPage(searchParams, pageRequest);
			
			List<List<Object>> list=new ArrayList<List<Object>>();
			List<Object> listTitle = new LinkedList<Object>();
			String[] titles = new String[]{"主键","姓名","身份证号","性别","出生日期","邮箱","手机","学历","专业","入职时间","所属公司","部门","头像"};
			for(String title : titles){
				listTitle.add(title);				
			}
			list.add(listTitle);
			List<UserPsnVO> userlist = userpage.getContent();
			for(int i=0; userlist!=null && userlist.size()>0 && i<userlist.size(); i++){
				UserPsnVO tempBean = userlist.get(i);
				List<Object> tempList = new LinkedList<Object>();
				tempList.add(tempBean.getPk_user());
				tempList.add(tempBean.getUsername());
				tempList.add(tempBean.getIdcard());
				tempList.add(StringUtils.isEmpty(tempBean.getSex())?null:(tempBean.getSex().equals("0")?"男":"女"));
				tempList.add(tempBean.getBrithdate());
				tempList.add(tempBean.getEmail());
				tempList.add(tempBean.getTelphone());
				tempList.add(tempBean.getEdution());
				tempList.add(tempBean.getMajor());
				tempList.add(tempBean.getWork_date());
				tempList.add(tempBean.getPk_corp());
				tempList.add(tempBean.getPk_dept());
				tempList.add(tempBean.getPhoto());
				list.add(tempList);
			}
			ExcelWriterPoiWriter.writeExcel(response,list,"用户管理","用户管理");
		} catch (Exception e) {
			throw new BusinessException(e.getMessage());
		}
	}
	
	/**
	 * 创建请求分页
	 * @param pageNumber
	 * @param pagzSize
	 * @param sortType
	 * @return
	 */
	private PageRequest buildPageRequest(int pageNumber, int pagzSize,
			String sortType) {
		Sort sort = null;
		if ("auto".equals(sortType)) {
			sort = new Sort(Direction.DESC, "ts");
		} else if ("creationtime".equals(sortType)) {
			sort = new Sort(Direction.DESC, "ts");
		} else if ("pk_projectapply".equals(sortType)) {
			sort = new Sort(Direction.ASC, "ts");
		}
		return new PageRequest(pageNumber, pagzSize, sort);
	}
    
}
