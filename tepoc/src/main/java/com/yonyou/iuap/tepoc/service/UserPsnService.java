package com.yonyou.iuap.tepoc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public List<com.yonyou.iuap.example.entity.meta.Org> findAllOrg() {
		return dao.findAllOrg();
	}

	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
		return dao.findAllDept();
	}

}
