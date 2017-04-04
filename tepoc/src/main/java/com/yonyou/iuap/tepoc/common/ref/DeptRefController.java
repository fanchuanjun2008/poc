package com.yonyou.iuap.tepoc.common.ref;

import iuap.ref.ref.RefClientPageInfo;
import iuap.ref.sdk.refmodel.model.AbstractTreeGridRefModel;
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
import com.yonyou.iuap.tepoc.entity.DeptVO;
import com.yonyou.iuap.tepoc.entity.OrgVO;
import com.yonyou.iuap.tepoc.service.DeptService;
import com.yonyou.iuap.tepoc.service.OrgService;

@RequestMapping({"/ref/deptref"})
@Controller
public class DeptRefController extends AbstractTreeGridRefModel/* implements IRefModelRestEx*/{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private DeptService deptService;
	
	@Autowired
	private OrgService orgService;
	
	@Autowired
	@Qualifier("baseDAO")
	private BaseDAO dao;

	public DeptRefController() {}

	@Override
	public RefViewModelVO getRefModelInfo(@RequestBody RefViewModelVO refViewModel) {
		refViewModel = super.getRefModelInfo(refViewModel);
		refViewModel.setRefName("部门");
		refViewModel.setRefCode("deptref");
		refViewModel.setRootName("部门");
		refViewModel.setStrHiddenFieldCode(new String[]{"refpk"});
		refViewModel.setStrFieldCode(new String[]{"refcode","refname"});
		refViewModel.setStrFieldName(new String[]{"部门编码","部门名称"});
		refViewModel.setIsMultiSelectedEnabled(true);
		//refViewModel.setRefCodeNamePK(new String[]{"code","name"});
		return refViewModel;
	}
	
	//左侧树
	@Override
	public List<Map<String, String>> blobRefClassSearch(@RequestBody RefViewModelVO paramRefViewModelVO) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		String condition =  paramRefViewModelVO.getContent();//获取查询条件
		if(condition!=null || !StringUtils.isEmpty(condition)){
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
			return list;
		} catch (BusinessException e) {
			logger.error("公司参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}
	
	//右侧数据
	@Override
	public Map<String, Object> blobRefSearch(@RequestBody RefViewModelVO paramRefViewModelVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Map<String, Object> searchParams = new HashMap<String, Object>();
		String condition = paramRefViewModelVO.getContent();// 获取查询条件
		if(condition!=null || !StringUtils.isEmpty(condition)){
			searchParams.put("condition", condition);			
		}
		RefClientPageInfo refClientPageInfo = paramRefViewModelVO.getRefClientPageInfo();
		int currPageIndex = refClientPageInfo.getCurrPageIndex();
		PageRequest pageRequest = new PageRequest(currPageIndex, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<DeptVO> categoryPage = null;
		String deptname="";
		String pk_corp="";
		try {
			String[] param =paramRefViewModelVO.getPk_val();
			for(int i=0;param!=null && i<param.length;i++){
				String parm1 = "";
				parm1 = param[i];
				if(parm1.startsWith("deptname")){
					deptname=parm1.substring(parm1.indexOf("deptname=")+9, parm1.length());
					searchParams.put("like&@&@deptname", deptname);
				}else if(parm1.startsWith("pk_corp")){
					pk_corp=parm1.substring(parm1.indexOf("pk_corp=")+8, parm1.length());
					searchParams.put("=&@&@pk_corp", pk_corp);
				}
			}
			categoryPage = deptService.selectAllByPage(pageRequest , searchParams);
			int pageCount = categoryPage.getTotalPages();
			int pageSize = categoryPage.getSize();
			refClientPageInfo.setPageCount(pageCount);
			refClientPageInfo.setPageSize(pageSize);
			paramRefViewModelVO.setRefClientPageInfo(refClientPageInfo);
			
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			List<DeptVO> vos = categoryPage.getContent();
			for(DeptVO vo : vos){
				HashMap<String, String> dept = new HashMap<String, String>();
				dept.put("refpk", vo.getPk_dept());
				dept.put("refcode", vo.getDeptcode());
				dept.put("refname", vo.getDeptname());
				list.add(dept);
			}
			result.put("dataList", list);
			result.put("refViewModel", paramRefViewModelVO);
			return result;
		} catch (BusinessException e) {
			logger.error("部门参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

//	@Override
//	public List<Map<String,String>> getIntRefData(
//			String pks) throws Exception {
//		String sql = "select pk_dept as pk,deptname as name from bd_dept where pk_dept in ("+pks+");";
//		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
//		return results;
//	}

	@Override
	public List<Map<String, String>> filterRefJSON(@RequestBody RefViewModelVO arg0) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(0, Constant.pagesize, new Sort(Direction.ASC, "ts"));
		Page<DeptVO> categoryPage = null;
		try {
			String deptname="";
			String pk_corp="";
			String[] param =arg0.getPk_val();
			for(int i=0;param!=null && i<param.length;i++){
				String parm1 = "";
				parm1 = param[i];
				if(parm1.startsWith("deptname")){
					deptname=parm1.substring(parm1.indexOf("deptname=")+9, parm1.length());
					searchParams.put("like&@&@deptname", deptname);
				}else if(parm1.startsWith("pk_corp")){
					pk_corp=parm1.substring(parm1.indexOf("pk_corp=")+8, parm1.length());
					searchParams.put("=&@&@pk_corp", pk_corp);
				}
			}
			categoryPage = deptService.selectAllByPage(pageRequest , searchParams);
			RefClientPageInfo refClientPageInfo = new RefClientPageInfo();
			int pageCount = categoryPage.getTotalPages();
			int pageSize = categoryPage.getSize();
			refClientPageInfo.setPageCount(pageCount);
			refClientPageInfo.setPageSize(pageSize);
			arg0.setRefClientPageInfo(refClientPageInfo);
			
			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
			List<DeptVO> vos = categoryPage.getContent();
			for(DeptVO vo : vos){
				HashMap<String, String> dept = new HashMap<String, String>();
				dept.put("refpk", vo.getPk_dept());
				dept.put("refcode", vo.getDeptcode());
				dept.put("refname", vo.getDeptname());
				list.add(dept);
			}
			return list;
		} catch (BusinessException e) {
			logger.error("部门参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String, String>> matchPKRefJSON(@RequestBody RefViewModelVO pks) {
		String sql = "select pk_dept as pk,dept_name as name from dept where pk_dept in ("+pks+");";
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
				DeptVO vo = dao.queryByPK(DeptVO.class, pk);
				Map<String, String> map = new HashMap();
				map.put("refpk", vo.getPk_dept()); 
				map.put("refcode", vo.getDeptcode()); 
				map.put("refname", vo.getDeptname()); 
				results.add(map);
			}
		} catch (DAOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return results;
	}

}
