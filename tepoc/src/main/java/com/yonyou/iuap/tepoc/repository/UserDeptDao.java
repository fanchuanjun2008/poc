package com.yonyou.iuap.tepoc.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;

/**
 * <p>Title: CardTableMetaDao</p>
 * <p>Description: </p>
 */
@Repository
public class UserDeptDao {
	
	@Qualifier("baseDAO")
	@Autowired
	private BaseDAO dao;
	
    
    public Page<UserDeptVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        String sql = " select * from user_dept"; 
        SQLParameter sqlparam = new SQLParameter();
        if (!searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                if (key.equalsIgnoreCase("searchParam")) {
                    sql =sql + "() AND";
                    for (int i = 0; i < 2; i++) {
                        sqlparam.addParam("%" + searchParams.get(key) + "%");
                    }
                }
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, UserDeptVO.class);
    }
    
    
    public void batchInsert(List<UserDeptVO> addList) throws DAOException {
        dao.insert(addList);
    }

    public void batchUpdate(List<UserDeptVO> updateList) {
        dao.update(updateList);
    }

    public void batchDelete(List<UserDeptVO> list) {
        dao.remove(list);
    }
    
    //add by fanchj1
    public void batchDelChild(List<UserPsnVO> list) throws DAOException {
        SQLParameter sqlparam = new SQLParameter();
		String deleteSQL = SQLHelper.createDeleteIn("user_dept", "fk_id_userdept", list.size());
        for (UserPsnVO item : list) {
            sqlparam.addParam(item.getPk_user());
        }
        dao.update(deleteSQL, sqlparam);
    } 
    
	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.Dept.class);
    }
    

}
