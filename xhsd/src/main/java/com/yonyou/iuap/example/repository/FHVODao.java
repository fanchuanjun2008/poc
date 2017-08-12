package com.yonyou.iuap.example.repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.context.InvocationInfoProxy;
import com.yonyou.iuap.example.entity.FHVO;
import com.yonyou.iuap.iweb.exception.WebRuntimeException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;

@Repository
public class FHVODao {

	@Autowired
	private MetadataDAO dao;
	
	//根据某一非主键字段查询实体
	public List<FHVO> findByYwbm(String ywbm){
		String sql = "select * from demo_fhb where ywbm=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(ywbm);
        List<FHVO> list = dao.queryByClause(FHVO.class, sql, sqlparam);
        return list;
	}
	//根据某一非主键字段查询实体
	public List<FHVO> findByZddwbm(String zddwbm){
		String sql = "select * from demo_fhb where zddwbm=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(zddwbm);
        List<FHVO> list = dao.queryByClause(FHVO.class, sql, sqlparam);
        return list;
	}
	//根据某一非主键字段查询实体
	public List<FHVO> findByZddh(String zddh){
		String sql = "select * from demo_fhb where zddh=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(zddh);
        List<FHVO> list = dao.queryByClause(FHVO.class, sql, sqlparam);
        return list;
	}

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<FHVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM demo_fhb ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(FHVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
         return dao.queryPage(sql, sqlparam, pageRequest, FHVO.class);
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<FHVO> addList, List<FHVO> updateList, List<FHVO> removeList) {
        if (CollectionUtils.isNotEmpty(addList)) {
            for (FHVO obj : addList) {
            	obj.setStatus(VOStatus.NEW);
            	obj.setDr(0); 
//            	if(obj.getCreateTime() == null ){
//            		obj.setCreateTime(new Date()); 
//            	}
//            	obj.setModifyTime(dictType.getCreateTime());
//                // 从InvocationInfoProxy获取值
//            	obj.setCreator(InvocationInfoProxy.getUsername());
//            	obj.setCreatorId(InvocationInfoProxy.getUserid());
            }
            dao.insert(addList) ;
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
            for (FHVO obj : addList) {
            	obj.setStatus(VOStatus.UPDATED);
//                // 从InvocationInfoProxy获取值
//                dictType.setModifier(InvocationInfoProxy.getUsername());
//                dictType.setModifierId(InvocationInfoProxy.getUserid());
//                dictType.setModifyTime(new Date());
            }
            dao.update(updateList) ;
        }
        if (CollectionUtils.isNotEmpty(removeList)) {
        	 for (FHVO obj : addList) {
             	obj.setStatus(VOStatus.DELETED);
             }
        	 dao.remove(removeList);
        }
        
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<FHVO> list) {
        if (CollectionUtils.isEmpty(list)) {
            throw new WebRuntimeException("当前没有选中数据!");
        }
        dao.remove(list);
    }
    

}
