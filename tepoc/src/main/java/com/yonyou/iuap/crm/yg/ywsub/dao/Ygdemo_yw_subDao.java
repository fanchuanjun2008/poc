package com.yonyou.iuap.crm.yg.ywsub.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_sub;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;

@Repository
public class Ygdemo_yw_subDao {

    @Autowired
    //private MetadataDAO dao;
    @Qualifier("baseDAO")
    private BaseDAO dao;

    public Ygdemo_yw_sub findById(String id) throws DAOException {

        String sql = "select * from iuaptraincrm_ygdemo_yw_sub  where dr='0' and sub_id=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(id);
        List<Ygdemo_yw_sub> list = dao.queryByClause(Ygdemo_yw_sub.class, sql, sqlparam);
        return list == null || list.isEmpty() ? null : list.get(0);
    }


    public void delete(Ygdemo_yw_sub entity) {

        if (null != entity) {
            dao.remove(entity);
        }
    }

    public Page<Ygdemo_yw_sub> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams)
            throws DAOException {

        String sql = " select * from iuaptraincrm_ygdemo_yw_sub";
        SQLParameter sqlparam = new SQLParameter();

        if (!searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(Ygdemo_yw_sub.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, Ygdemo_yw_sub.class);
    }

	public List<com.yonyou.iuap.crm.psn.entity.BdPsndocVO> findAllBdPsndocVO() {
        return dao.queryAll(com.yonyou.iuap.crm.psn.entity.BdPsndocVO.class);
    }
    
	public List<com.yonyou.iuap.crm.user.entity.ExtIeopUserVO> findAllExtIeopUserVO() {
        return dao.queryAll(com.yonyou.iuap.crm.user.entity.ExtIeopUserVO.class);
    }
    
}
