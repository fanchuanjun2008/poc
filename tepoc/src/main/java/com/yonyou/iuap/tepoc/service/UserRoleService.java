package com.yonyou.iuap.tepoc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;
import com.yonyou.iuap.tepoc.entity.RoleVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;
import com.yonyou.iuap.tepoc.repository.UserPsnDao;
import com.yonyou.iuap.tepoc.repository.UserRoleDao;
import com.yonyou.uap.ieop.busilog.config.annotation.BusiLogConfig;


@Service
public class UserRoleService {

    @Autowired
    private UserRoleDao childDao;

    @Autowired
    private UserPsnDao dao;

    /**参照id和显示字段 这里进行转换 */
	private Page<UserRoleVO> setRefName(Page<UserRoleVO> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"pk_role.rolename", 
                    		}, pageResult
                            .getContent().toArray(new UserPsnVO[] {}));
            for (UserRoleVO item : pageResult.getContent()) {
                String id = item.getPk_user_role();
                Map<String, Object> itemRefMap = refMap.get(id);
                if (itemRefMap != null) {
                    item.setPk_role_name((String) itemRefMap.get("pk_role.rolename"));
                }
            }
		}
		return pageResult ;
	}
    
	@BusiLogConfig("UserRoleService_query")
    public Page<UserRoleVO> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
		Page<UserRoleVO> pageResult = childDao.selectAllByPage(pageRequest, searchParams) ;
//		this.setRefName(pageResult);
		return pageResult;
	}

    @Transactional
    public void deleteEntity(UserRoleVO entity) {
        childDao.delete(entity);
    }

	public List<RoleVO> findAllRole() {
        return childDao.findAllRole();
    }
    
}
