package com.yonyou.iuap.tepoc.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.xml.bind.JAXBElement;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.itf.mdm07.sharing.IMdSharingCenterService;
import com.yonyou.itf.mdm07.sharing.MdmRetVO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;
import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.repository.UserDeptDao;
import com.yonyou.iuap.tepoc.repository.UserPsnDao;
import com.yonyou.uap.ieop.busilog.config.annotation.BusiLogConfig;

@Service
public class UserPsnService {
	private Logger logger = LoggerFactory.getLogger(UserPsnService.class);

	@Autowired
	private UserPsnDao dao;

	@Autowired
	private UserDeptDao userDeptDao;

	@Autowired
	private UserRoleService childService;

	@Transactional
	@BusiLogConfig("UserPsnService_save")
	public UserPsnVO save(UserPsnVO entity) {
		logger.debug("execute  UserPsnVO save .");
		return dao.save(entity);
	}
	
	/**
	 * 主表删除不走这里的逻辑，这里只处理新增保存和修改保存
	 * @param entity
	 * @return
	 */
	@Transactional
	@BusiLogConfig("UserPsnService_save")
    public UserPsnVO merge(UserPsnVO entity) {
//		if(entity.getPk_user() == null ){
//	   		 entity.setStatus(VOStatus.NEW);
//	   		 entity.setPk_user(UUID.randomUUID().toString());
//	         entity.setDr(0);// 未删除标识         
//	   	}else{
//    		entity.setStatus(VOStatus.UPDATED);
//    	}
		dao.save(entity);
		
		List<UserDeptVO> children = entity.getId_userdept();
        List<UserDeptVO> insertList = new ArrayList<UserDeptVO>();
        List<UserDeptVO> updateList = new ArrayList<UserDeptVO>();
        List<UserDeptVO> deleleList = new ArrayList<UserDeptVO>();
        for (UserDeptVO child : children) {
            if (child.getPk_user_dept() == null || child.getStatus() == VOStatus.NEW) {
            	child.setPk_user_dept(UUID.randomUUID().toString());
            	child.setFk_id_userdept(entity.getPk_user());
            	child.setDr(0);
                insertList.add(child);
            } else if (child.getStatus() == VOStatus.UPDATED) {
                updateList.add(child);
            } else if (child.getStatus() == VOStatus.DELETED) {
            	child.setDr(1);
                deleleList.add(child);
            } else {
                if (logger.isDebugEnabled()) {
                    logger.debug("Child entity {} status is unchanged,will not modify data", child);
                }
            }
        }
        if (CollectionUtils.isNotEmpty(insertList)) {
        	userDeptDao.batchInsert(insertList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	userDeptDao.batchUpdate(updateList);
        }
        if (CollectionUtils.isNotEmpty(deleleList)) {
        	//真删除，假删除可以使用update
        	userDeptDao.batchDelete(deleleList);
        }
    	return entity ;
    }

	/**
	 * 批量删除数据
	 * 
	 * @param list
	 */
	@Transactional
	public void batchDeleteEntity(List<UserPsnVO> list) {
		this.batchDelChild(list);
		//add by fanchj1
		userDeptDao.batchDelChild(list);
		dao.batchDelete(list);
	}

	/**
	 * 删除主表下面的子表数据
	 * 
	 * @param list
	 * @throws DAOException
	 */
	private void batchDelChild(List<UserPsnVO> list) throws DAOException {
		dao.batchDelChild(list);
	}

	/** 参照id和显示字段 这里进行转换 */
	private Page<UserPsnVO> setRefName(Page<UserPsnVO> pageResult) {
		if (pageResult != null && pageResult.getContent() != null
				&& pageResult.getContent().size() > 0) {
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */
			Map<String, Map<String, Object>> refMap = DASFacade
					.getAttributeValueAsPKMap(new String[] { "pk_corp.orgname",
							"pk_dept.deptname", }, pageResult.getContent()
							.toArray(new UserPsnVO[] {}));
			for (UserPsnVO item : pageResult.getContent()) {
				String id = item.getPk_user();
				Map<String, Object> itemRefMap = refMap.get(id);
				if (itemRefMap != null) {
					item.setPk_corp_name((String) itemRefMap
							.get("pk_corp.orgname"));
					item.setPk_dept_name((String) itemRefMap
							.get("pk_dept.deptname"));
				}
			}
		}
		return pageResult;
	}

	/**
	 * 根据传递的参数，进行分页查询
	 */
	@BusiLogConfig("UserPsnService_query")
	public Page<UserPsnVO> selectAllByPage(Map<String, Object> searchParams,
			PageRequest pageRequest) {
		Page<UserPsnVO> pageResult = dao.selectAllByPage(pageRequest,
				searchParams);
//		this.setRefName(pageResult);
		return pageResult;
	}
	
	/**
	 * 使用主数据提供的webservice接口获取数据
	 * @param searchParams
	 * @param pageRequest
	 * @return
	 */
	@BusiLogConfig("UserPsnService_querybymdm")
	public Page<UserPsnVO> selectByMdmByPage(Map<String, Object> searchParams,
			PageRequest pageRequest) {
		MdmRetVO result = new IMdSharingCenterService().getIMdSharingCenterServiceSOAP11PortHttp().queryMdById("mysys", "userid02", "1990", true);
		JAXBElement<String> retData = result.getData();
		System.out.println(retData.getValue());
		String mdmStr = retData.getValue();
		//对返回数据进行处理
		List retlist = this.translateMdmStrToUserPsnList(mdmStr);
		Page<UserPsnVO> pageResult = new PageImpl(retlist);
		return pageResult;
	}
	
	private List translateMdmStrToUserPsnList(String mdmStr){
		List retlist = new ArrayList();
		JSONArray jsonarry = JSONArray.fromObject(mdmStr);
		if(jsonarry.size()>0){
			for(int i=0; i<jsonarry.size(); i++){
				JSONObject json = (JSONObject) jsonarry.get(i);
				String code = getStrValue(json,"code");
				String description = getStrValue(json,"description");
				String mdm_pk = getStrValue(json,"mdm_pk");
				String id = getStrValue(json,"id");
				String mdm_seal = getStrValue(json,"mdm_seal");
				String mdm_duplicate = getStrValue(json,"mdm_duplicate");
				String mdm_code = getStrValue(json,"mdm_code");
				String mdm_version = getStrValue(json,"mdm_version");
				UserPsnVO uservo = new UserPsnVO();
				String entity_data_status = getStrValue(json,"entity_data_status");
				if("UNCHANGED".equalsIgnoreCase(entity_data_status)){
					uservo.setStatus(VOStatus.UNCHANGED);
				}else if("UPDATED".equalsIgnoreCase(entity_data_status)){
					uservo.setStatus(VOStatus.UPDATED);
				}else if("NEW".equalsIgnoreCase(entity_data_status)){
					uservo.setStatus(VOStatus.NEW);
				}else if("DELETED".equalsIgnoreCase(entity_data_status)){
					uservo.setStatus(VOStatus.DELETED);
				}
				uservo.setSex(getStrValue(json,"sex"));
				uservo.setIdcard(getStrValue(json,"idcard"));
				uservo.setTelphone(getStrValue(json,"telphone"));
				uservo.setEmail(getStrValue(json,"email"));
//				try {
//					String brithdate = getStrValue(json,"brithdate");
//					uservo.setBrithdate(brithdate!=null?SimpleDateFormat.getInstance().parse(brithdate):null);
//					String work_date = getStrValue(json,"work_date");
//					uservo.setWork_date(work_date!=null?SimpleDateFormat.getInstance().parse(work_date):null);
//				} catch (ParseException e) {
//					logger.error("日期转换出错");
//					e.printStackTrace();
//				}
				uservo.setEdution(getStrValue(json,"edutoin"));
				uservo.setMajor(getStrValue(json,"major"));
				uservo.setPk_corp(getStrValue(json,"pk_corp"));
				uservo.setPk_dept(getStrValue(json,"pk_dept"));
				uservo.setUsername(getStrValue(json,"name"));
				String ts = getStrValue(json,"ts");
				uservo.setTs(Timestamp.valueOf(ts));
				retlist.add(uservo);
			}
		}
		return retlist;
	}
	
	private String getStrValue(JSONObject json, String key){
		return (json.containsKey(key)?json.getString(key):null);
	}
	
	public List<com.yonyou.iuap.example.entity.meta.Org> findAllOrg() {
		return dao.findAllOrg();
	}

	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
		return dao.findAllDept();
	}

}
