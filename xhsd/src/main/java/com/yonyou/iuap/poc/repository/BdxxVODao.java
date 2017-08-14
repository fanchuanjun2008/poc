package com.yonyou.iuap.poc.repository;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.iweb.exception.WebRuntimeException;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;
import com.yonyou.iuap.poc.entity.BdxxVO;

@Repository
public class BdxxVODao {

	@Autowired
	@Qualifier(value = "baseDAO")
	private BaseDAO dao;
	
	//根据某一非主键字段查询实体
	public List<BdxxVO> findByZddh(String zddh){
		String sql = "select * from demo_bdxx where zddh=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(zddh);
        List<BdxxVO> list = dao.queryByClause(BdxxVO.class, sql, sqlparam);
        return list;
	}
	
	//根据征订客户编码查出该客户下的报订单数据
	public List<BdxxVO> findByKhbm(String khbm){
		String sql = "select * from demo_bdxx where zddwbm=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(khbm);
        List<BdxxVO> list = dao.queryByClause(BdxxVO.class, sql, sqlparam);
        return list;
	}
	
	//根据品种编码查出该品种的报订单数据
		public List<BdxxVO> findByPzbm(String pzbm){
			String sql = "select * from demo_bdxx where pzbm=?";
	        SQLParameter sqlparam = new SQLParameter();
	        sqlparam.addParam(pzbm);
	        List<BdxxVO> list = dao.queryByClause(BdxxVO.class, sql, sqlparam);
	        return list;
		}
	

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<BdxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM bdxx ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(BdxxVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
         return dao.queryPage(sql, sqlparam, pageRequest, BdxxVO.class);
    }
    
	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<BdxxVO> selectAllByPagefor(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM demo_bdxx ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(BdxxVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
         return dao.queryPage(sql, sqlparam, pageRequest, BdxxVO.class);
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<BdxxVO> addList, List<BdxxVO> updateList, List<BdxxVO> removeList) {
        if (CollectionUtils.isNotEmpty(addList)) {
            for (BdxxVO obj : addList) {
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
            for (BdxxVO obj : updateList) {
            	obj.setStatus(VOStatus.UPDATED);
//                // 从InvocationInfoProxy获取值
//                dictType.setModifier(InvocationInfoProxy.getUsername());
//                dictType.setModifierId(InvocationInfoProxy.getUserid());
//                dictType.setModifyTime(new Date());
            }
            dao.update(updateList) ;
        }
        if (CollectionUtils.isNotEmpty(removeList)) {
        	 for (BdxxVO obj : removeList) {
             	obj.setStatus(VOStatus.DELETED);
             }
        	 dao.remove(removeList);
        }
        
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<BdxxVO> list) {
        if (CollectionUtils.isEmpty(list)) {
            throw new WebRuntimeException("当前没有选中数据!");
        }
        dao.remove(list);
    }
    

}
