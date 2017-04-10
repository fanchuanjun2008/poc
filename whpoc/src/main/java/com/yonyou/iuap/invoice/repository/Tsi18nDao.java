package com.yonyou.iuap.invoice.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.invoice.entity.Tsi18nVO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;

/**
 * <p>Title: CardTableMetaDao</p>
 * <p>Description: </p>
 */
@Repository
public class Tsi18nDao {
	
	@Qualifier("mdBaseDAO")
	@Autowired
	private MetadataDAO dao;
	
    
    public Page<Tsi18nVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        String sql = " select * from whpoc_Tsi18n"; 
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
        return dao.queryPage(sql, sqlparam, pageRequest, Tsi18nVO.class);
    }
    
    
    public void batchInsert(List<Tsi18nVO> addList) throws DAOException {
        dao.insert(addList);
    }

    public void batchUpdate(List<Tsi18nVO> updateList) {
        dao.update(updateList);
    }

    public void batchDelete(List<Tsi18nVO> list) {
        dao.remove(list);
    }
    

}
