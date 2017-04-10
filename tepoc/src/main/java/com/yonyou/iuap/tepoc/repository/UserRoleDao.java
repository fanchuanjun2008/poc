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
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.tepoc.entity.RoleVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;

@Repository
public class UserRoleDao {

    @Autowired
    @Qualifier("baseDAO")
    private BaseDAO dao;

    public UserRoleVO findById(String id) throws DAOException {

        String sql = "select * from user_role  where dr='0' and pk_user_role=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(id);
        List<UserRoleVO> list = dao.queryByClause(UserRoleVO.class, sql, sqlparam);
        return list == null || list.isEmpty() ? null : list.get(0);
    }


    public void delete(UserRoleVO entity) {

        if (null != entity) {
            dao.remove(entity);
        }
    }

    public Page<UserRoleVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams)
            throws DAOException {

        String sql = " select * from user_role";
        SQLParameter sqlparam = new SQLParameter();

        if (!searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(UserRoleVO.class, key) + " like ? AND ";
                String value = (String) ((searchParams.get(key)==null||searchParams.get(key).equals(""))?null:searchParams.get(key));
                sqlparam.addParam("%" + value + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, UserRoleVO.class);
    }

	public List<RoleVO> findAllRole() {
        return dao.queryAll(RoleVO.class);
    }
    
}
