package com.yonyou.iuap.tepoc.common.ref;

import iuap.ref.ref.RefClientPageInfo;
import iuap.ref.sdk.refmodel.model.AbstractTreeRefModel;
import iuap.ref.sdk.refmodel.vo.RefViewModelVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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

import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.processor.MapListProcessor;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;
import com.yonyou.iuap.tepoc.common.utils.Constant;
import com.yonyou.iuap.tepoc.entity.OrgVO;
import com.yonyou.iuap.tepoc.service.OrgService;

@RequestMapping({"/ref/corpref"})
@Controller
public class CorpRefController extends AbstractTreeRefModel implements IRefModelRestEx{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OrgService orgService;
	
	@Autowired
	@Qualifier("baseDAO")
	private BaseDAO dao;

	public CorpRefController() {}

	@Override
	public RefViewModelVO getRefModelInfo(@RequestBody RefViewModelVO refViewModel) {
		refViewModel = super.getRefModelInfo(refViewModel);
		refViewModel.setRefName("公司");
		refViewModel.setRefCode("corpref");
		refViewModel.setRootName("公司");
		refViewModel.setStrHiddenFieldCode(new String[]{"refpk","refname"});
		refViewModel.setStrFieldCode(new String[]{"refcode","refshortname"});
		refViewModel.setStrFieldName(new String[]{"公司编码","公司显示名称"});
		//refViewModel.setRefCodeNamePK(new String[]{"code","name"});
		return refViewModel;
	}

	@Override
	public Map<String, Object> getCommonRefData(
			@RequestBody RefViewModelVO paramRefViewModelVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Map<String, Object> searchParams = new HashMap<String, Object>();
		String condition =  paramRefViewModelVO.getContent();//获取查询条件
		if(condition!=null && !StringUtils.isEmpty(condition)){
			searchParams.put("condition", condition);			
		}
		RefClientPageInfo refClientPageInfo = paramRefViewModelVO.getRefClientPageInfo();
		int currPageIndex = refClientPageInfo.getCurrPageIndex();
		PageRequest pageRequest = new PageRequest(currPageIndex, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<OrgVO> categoryPage = null;
		try {
			categoryPage = orgService.selectAllByPage(pageRequest, searchParams);
			int pageCount = categoryPage.getTotalPages();
			int pageSize = categoryPage.getSize();
			refClientPageInfo.setPageCount(pageCount);
			refClientPageInfo.setPageSize(pageSize);
			paramRefViewModelVO.setRefClientPageInfo(refClientPageInfo);
			
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
			List<OrgVO> vos = categoryPage.getContent();
			for(OrgVO vo : vos){
				HashMap<String, String> user = new HashMap();
				user.put("refpk", vo.getOrgid());
				user.put("refcode", vo.getOrgcode());
				user.put("refname", vo.getOrgname());
				user.put("refshortname", vo.getShortname());
				user.put("id", vo.getOrgid());
				user.put("pid", vo.getParentid());
				list.add(user);
			}
			result.put("dataList", list);
			result.put("refViewModel", paramRefViewModelVO);
			return result;
		} catch (BusinessException e) {
			logger.error("公司参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String,String>> getIntRefData(
			String pks) throws Exception {
		String sql = "select org_id as pk,org_name as name from org where org_id in ("+pks+");";
		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
		return results;
	}

	@Override
	public List<Map<String, String>> filterRefJSON(@RequestBody RefViewModelVO arg0) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(0, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<OrgVO> categoryPage = null;
		String condition =  arg0.getContent();//获取查询条件
		if(condition!=null && !StringUtils.isEmpty(condition)){
			searchParams.put("condition", condition);			
		}
		try {
			categoryPage = orgService.selectAllByPage(pageRequest, searchParams);
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			List<OrgVO> vos = categoryPage.getContent();
			for(OrgVO vo : vos){
				HashMap<String, String> user = new HashMap();
				user.put("refpk", vo.getOrgid());
				user.put("refcode", vo.getOrgcode());
				user.put("refname", vo.getOrgname());
				user.put("refshortname", vo.getShortname());
				user.put("id", vo.getOrgid());
				user.put("pid", vo.getParentid());
				list.add(user);
			}
			return list;
		} catch (BusinessException e) {
			logger.error("公司参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String, String>> matchPKRefJSON(@RequestBody RefViewModelVO pks) {
		String sql = "select org_id as pk,org_name as name from org where org_id in ("+pks+");";
		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
		return results;
	}

	@Override
	public List<Map<String, String>> matchBlurRefJSON(
			@RequestBody RefViewModelVO paramRefViewModelVO) {
		String[] pks = paramRefViewModelVO.getPk_val();
		String pk = "";
		List<Map<String, String>> results = new ArrayList();
		try {
			if(pks!=null&&pks.length>0) {
				pk = pks[0];
				OrgVO vo = dao.queryByPK(OrgVO.class, pk);
				HashMap<String, String> user = new HashMap();
				user.put("refpk", vo.getOrgid());
				user.put("refcode", vo.getOrgcode());
				user.put("refname", vo.getOrgname());
				user.put("refshortname", vo.getShortname());
				user.put("id", vo.getOrgid());
				user.put("pid", vo.getParentid());
				results.add(user);
			}
		} catch (DAOException e) {
			e.printStackTrace();
			logger.error("公司参照获取错误",e);
		}
		return results;
		
//		String[] pks = paramRefViewModelVO.getPk_val();
//		String pk = "";
//		Map<String, Object> searchParams = new HashMap<String, Object>();
//		PageRequest pageRequest = new PageRequest(0, Constant.pagesize, new Sort(Direction.ASC, "ts"));
//		Page<OrgVO> categoryPage = null;
//		try {
//			categoryPage = orgService.selectAllByPage(pageRequest, searchParams);
//			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
//			List<OrgVO> vos = categoryPage.getContent();
//			for(OrgVO vo : vos){
//				HashMap<String, String> user = new HashMap<String, String>();
//				user.put("refpk", vo.getOrgid());
//				user.put("refcode", vo.getOrgcode());
//				user.put("refname", vo.getOrgname());
//				user.put("refshortname", vo.getShortname());
//				list.add(user);
//			}
//			
//			return list;
//		} catch (Exception e) {
//			logger.error("公司参照获取错误",e);
//			e.printStackTrace();
//			return null;
//		}
	}
	
}
