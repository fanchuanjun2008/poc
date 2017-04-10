package com.yonyou.iuap.crm.yg.ywsub.dao;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_info;
import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_sub;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;


@SuppressWarnings("unused")
@Repository
public class Ygdemo_yw_infoDao {

    @Autowired
    @Qualifier("baseDAO")
    private BaseDAO dao;

	@Transactional
    public Ygdemo_yw_info save(Ygdemo_yw_info entity) {
    	if(entity.getId() ==null ){
    		 entity.setStatus(VOStatus.NEW);
    		 entity.setId(UUID.randomUUID().toString());
             entity.setDr(0);// 未删除标识         
    	}else{
    		entity.setStatus(VOStatus.UPDATED);
    	}
    	
		if(entity.getId_ygdemo_yw_sub()!=null && entity.getId_ygdemo_yw_sub().size()>0){
    		for(Ygdemo_yw_sub child : entity.getId_ygdemo_yw_sub() ){
    			if(child.getSub_id() == null ){
    				child.setStatus(VOStatus.NEW);
    				child.setDr(entity.getDr());
    			}else{
    				child.setStatus(VOStatus.UPDATED);
    			}
    		}
    		dao.save(entity, entity.getId_ygdemo_yw_sub().toArray(new Ygdemo_yw_sub[entity.getId_ygdemo_yw_sub().size()]));
    	}else{
    		dao.save(entity);
    	}
    	return entity ;
    }


    public int delete(Ygdemo_yw_info entity) throws Exception {

        if (null == entity) {
            return 0;
        }
        dao.remove(entity);
        return 1;
    }

    public Page<Ygdemo_yw_info> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) throws DAOException {

        String sql = " select * from iuaptraincrm_ygdemo_yw_info"; // user_name = ?
        SQLParameter sqlparam = new SQLParameter();

     	if (null != searchParams && !searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(Ygdemo_yw_info.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, Ygdemo_yw_info.class);
    }

    public void batchDelete(List<Ygdemo_yw_info> list) throws DAOException {

        dao.remove(list);
    }

    public void batchDelChild(List<Ygdemo_yw_info> list) throws DAOException {
        SQLParameter sqlparam = new SQLParameter();
		String deleteSQL = SQLHelper.createDeleteIn("iuaptraincrm_ygdemo_yw_sub", "fk_id_ygdemo_yw_sub", list.size());
        for (Ygdemo_yw_info item : list) {
            sqlparam.addParam(item.getId());
        }
        dao.update(deleteSQL, sqlparam);
    }     

	public List<com.yonyou.iuap.crm.corp.entity.BdCorpVO> findAllBdCorpVO() {
        return dao.queryAll(com.yonyou.iuap.crm.corp.entity.BdCorpVO.class);
    }
    
	public List<com.yonyou.iuap.crm.psn.entity.BdPsndocVO> findAllBdPsndocVO() {
        return dao.queryAll(com.yonyou.iuap.crm.psn.entity.BdPsndocVO.class);
    }
    
	public List<com.yonyou.iuap.crm.user.entity.ExtIeopUserVO> findAllExtIeopUserVO() {
        return dao.queryAll(com.yonyou.iuap.crm.user.entity.ExtIeopUserVO.class);
    }
    
    
}
