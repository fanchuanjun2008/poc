package com.yonyou.iuap.saleorder.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.saleorder.entity.Orderdetail;

@Repository
public class OrderdetailDao {

	@Resource(name="baseDAO")
    private BaseDAO dao;

    public Orderdetail findById(String id) throws DAOException {
        String sql = "select * from train_orderdetail  where dr='0' and pk_orderdetail=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(id);
        List<Orderdetail> list = dao.queryByClause(Orderdetail.class, sql, sqlparam);
        return list == null || list.isEmpty() ? null : list.get(0);
    }


    public void delete(Orderdetail entity) {

        if (null != entity) {
            dao.remove(entity);
        }
    }

    public Page<Orderdetail> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams)
            throws DAOException {

        String sql = " select * from train_orderdetail";
        SQLParameter sqlparam = new SQLParameter();

        if (!searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(Orderdetail.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, Orderdetail.class);
    }

}
