package com.yonyou.iuap.tepoc.repository;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;
import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;


@Repository
public class UserPsnDao {

    @Autowired
    @Qualifier("baseDAO")
    private BaseDAO dao;

	@Transactional
    public UserPsnVO save(UserPsnVO entity) {
    	if(entity.getPk_user() ==null ){
    		 entity.setStatus(VOStatus.NEW);
    		 entity.setPk_user(UUID.randomUUID().toString());
             entity.setDr(0);// 未删除标识         
    	}else{
    		entity.setStatus(VOStatus.UPDATED);
    	}
    	
		if(entity.getId_userrole()!=null && entity.getId_userrole().size()>0){
    		for(UserRoleVO child : entity.getId_userrole() ){
    			if(child.getPk_user_role() == null ){
    				child.setStatus(VOStatus.NEW);
    				child.setDr(entity.getDr());
    			}/*else{//默认生成的代码，不支持子表删除的逻辑，去掉
    				child.setStatus(VOStatus.UPDATED);
    			}*/
    		}
    		dao.save(entity, entity.getId_userrole().toArray(new UserRoleVO[entity.getId_userrole().size()]));
    	}else{
    		dao.save(entity);
    	}
    	return entity ;
    }
	
    public int delete(UserPsnVO entity) throws Exception {

        if (null == entity) {
            return 0;
        }
        dao.remove(entity);
        return 1;
    }

    public Page<UserPsnVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) throws DAOException {

        String sql = " select * from userpsn"; // user_name = ?
        SQLParameter sqlparam = new SQLParameter();

     	if (null != searchParams && !searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(UserPsnVO.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, UserPsnVO.class);
    }
    
    public void batchDelete(List<UserPsnVO> list) throws DAOException {

        dao.remove(list);
    }

    public void batchDelChild(List<UserPsnVO> list) throws DAOException {
        SQLParameter sqlparam = new SQLParameter();
		String deleteSQL = SQLHelper.createDeleteIn("user_role", "fk_id_userrole", list.size());
        for (UserPsnVO item : list) {
            sqlparam.addParam(item.getPk_user());
        }
        dao.update(deleteSQL, sqlparam);
    }     

	public List<com.yonyou.iuap.example.entity.meta.Org> findAllOrg() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.Org.class);
    }
    
	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.Dept.class);
    }
    
}
