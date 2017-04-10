package com.yonyou.iuap.invoice.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.invoice.entity.Invoice_order;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;

@Repository
public class Invoice_orderDao {

    @Autowired
    private MetadataDAO dao;

    public Invoice_order findById(String id) throws DAOException {

        String sql = "select * from whpoc_invoice_order  where dr='0' and invoice_order_id=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(id);
        List<Invoice_order> list = dao.queryByClause(Invoice_order.class, sql, sqlparam);
        return list == null || list.isEmpty() ? null : list.get(0);
    }


    public void delete(Invoice_order entity) {

        if (null != entity) {
            dao.remove(entity);
        }
    }

    public Page<Invoice_order> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams)
            throws DAOException {

        String sql = " select * from whpoc_invoice_order";
        SQLParameter sqlparam = new SQLParameter();

        if (!searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(Invoice_order.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, Invoice_order.class);
    }

}
