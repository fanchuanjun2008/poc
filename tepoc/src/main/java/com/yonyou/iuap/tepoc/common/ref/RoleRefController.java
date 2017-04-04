package com.yonyou.iuap.tepoc.common.ref;

import iuap.ref.ref.RefClientPageInfo;
import iuap.ref.sdk.refmodel.model.AbstractGridRefModel;
import iuap.ref.sdk.refmodel.vo.RefViewModelVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.processor.MapListProcessor;
import com.yonyou.iuap.tepoc.common.utils.Constant;
import com.yonyou.iuap.tepoc.entity.RoleVO;
import com.yonyou.iuap.tepoc.service.RoleService;

@RequestMapping({"/ref/roleref"})
@Controller
public class RoleRefController extends AbstractGridRefModel/* implements IRefModelRestEx*/{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	@Qualifier("baseDAO") private  BaseDAO dao;

	public RoleRefController() {}

	@Override
	public RefViewModelVO getRefModelInfo(@RequestBody RefViewModelVO refViewModel) {
		refViewModel = super.getRefModelInfo(refViewModel);
		refViewModel.setRefName("角色");
		refViewModel.setRefCode("roleref");
		refViewModel.setRootName("角色");
		refViewModel.setStrHiddenFieldCode(new String[]{"refpk"});
		refViewModel.setStrFieldCode(new String[]{"refcode","refname","roletype"});
		refViewModel.setStrFieldName(new String[]{"角色编码","角色名称","角色类型"});
		refViewModel.setDefaultFieldCount(3);
		refViewModel.setIsMultiSelectedEnabled(true);
		//refViewModel.setRefCodeNamePK(new String[]{"code","name"});
		return refViewModel;
	}

	@Override
	public Map<String, Object> getCommonRefData(
			@RequestBody RefViewModelVO paramRefViewModelVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		SearchParams searchParams = new SearchParams();
		String condition =  paramRefViewModelVO.getContent();//获取查询条件
		searchParams.addCondition("condition", condition);
		RefClientPageInfo refClientPageInfo = paramRefViewModelVO.getRefClientPageInfo();
		int currPageIndex = refClientPageInfo.getCurrPageIndex();
		PageRequest pageRequest = new PageRequest(currPageIndex, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<RoleVO> categoryPage = null;
		try {
			categoryPage = roleService.selectAllByPage(pageRequest, searchParams);
			int pageCount = categoryPage.getTotalPages();
			int pageSize = categoryPage.getSize();
			refClientPageInfo.setCurrPageIndex(currPageIndex);
			refClientPageInfo.setPageCount(pageCount);
			refClientPageInfo.setPageSize(pageSize);
			paramRefViewModelVO.setRefClientPageInfo(refClientPageInfo);
			
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
			List<RoleVO> vos = categoryPage.getContent();
			for(RoleVO vo : vos){
				HashMap<String, String> user = new HashMap();
				user.put("refpk", vo.getPk_role());
				user.put("refcode", vo.getRolecode());
				user.put("refname", vo.getRolename());
				user.put("roletype", vo.getRoletype());
				list.add(user);
			}
			
			result.put("dataList", list);
			result.put("refViewModel", paramRefViewModelVO);
			return result;
		} catch (Exception e) {
			logger.error("角色参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

//	@Override
//	public List<Map<String,String>> getIntRefData(
//			String pks) throws Exception {
//		String sql = "select id as pk,role_name as name from ieop_role where id in ("+pks+");";
//		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
//		return results;
//	}

	@Override
	public List<Map<String, String>> filterRefJSON(@RequestBody RefViewModelVO arg0) {
		SearchParams searchParams = new SearchParams();
		PageRequest pageRequest = new PageRequest(0, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<RoleVO> categoryPage = null;
		try {
			categoryPage = roleService.selectAllByPage(pageRequest,searchParams);
			
			List<Map<String, String>> list = new ArrayList();
			
			List<RoleVO> vos = categoryPage.getContent();
			for(RoleVO vo : vos){
				HashMap<String, String> user = new HashMap();
				user.put("refpk", vo.getPk_role());
				user.put("refcode", vo.getRolecode());
				user.put("refname", vo.getRolename());
				user.put("roletype", vo.getRoletype());
				list.add(user);
			}
			
			return list;
		} catch (Exception e) {
			logger.error("角色参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String, String>> matchPKRefJSON(@RequestBody RefViewModelVO pks) {
		String sql = "select pk_role as pk,rolename as name from role where pk_role in ("+pks+");";
		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
		return results;
	}

	@Override
	public List<Map<String, String>> matchBlurRefJSON(@RequestBody 
			RefViewModelVO paramRefViewModelVO) {
		String[] pks = paramRefViewModelVO.getPk_val();
		String pk = "";
		List<Map<String, String>> results = new ArrayList();
		try {
			if(pks!=null&&pks.length>0) {
				pk = pks[0];
				RoleVO vo = dao.queryByPK(RoleVO.class, pk);
				Map<String, String> user = new HashMap();
				user.put("refpk", vo.getPk_role());
				user.put("refcode", vo.getRolecode());
				user.put("refname", vo.getRolename());
				user.put("roletype", vo.getRoletype());
				results.add(user);
			}
		} catch (DAOException e) {
			e.printStackTrace();
			logger.error("角色参照获取错误",e);
		}
		return results;
//		SearchParams searchParams = new SearchParams();
//		PageRequest pageRequest = new PageRequest(0, Constant.pagesize, new Sort(Direction.ASC, "ts"));
//		Page<RoleVO> categoryPage = null;
//		try {
//			categoryPage = roleService.selectAllByPage(pageRequest,searchParams);
//			
//			List<Map<String, String>> list = new ArrayList();
//			
//			List<RoleVO> vos = categoryPage.getContent();
//			for(RoleVO vo : vos){
//				HashMap<String, String> user = new HashMap();
//				user.put("refpk", vo.getPk_role());
//				user.put("refcode", vo.getRolecode());
//				user.put("refname", vo.getRolename());
//				user.put("roletype", vo.getRoletype());
//				list.add(user);
//			}
//			
//			return list;
//		} catch (Exception e) {
//			logger.error("角色参照获取错误",e);
//			e.printStackTrace();
//			return null;
//		}
	}
	
}
