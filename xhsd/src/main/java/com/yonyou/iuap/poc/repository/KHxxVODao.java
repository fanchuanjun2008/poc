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
import com.yonyou.iuap.poc.entity.KHxxVO;
import com.yonyou.iuap.poc.utils.InSqlUtil;

@Repository
public class KHxxVODao {

	@Autowired
	@Qualifier(value = "baseDAO")
    private BaseDAO dao;
	
	//根据某一非主键字段查询实体
	public List<KHxxVO> findByKhbh(String khbh){
		String sql = "select * from demo_khxx where khbh=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(khbh);
        List<KHxxVO> list = dao.queryByClause(KHxxVO.class, sql, sqlparam);
        return list;
	}

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<KHxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM khxx ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(KHxxVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
       
         
         return dao.queryPage(sql, sqlparam, pageRequest, KHxxVO.class);
    }
    
	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<KHxxVO> selectAllByPagekh(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM demo_khxx ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(KHxxVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
       
         
         return dao.queryPage(sql, sqlparam, pageRequest, KHxxVO.class);
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<KHxxVO> addList, List<KHxxVO> updateList, List<KHxxVO> removeList) {
        if (CollectionUtils.isNotEmpty(addList)) {
            for (KHxxVO obj : addList) {
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
            for (KHxxVO obj : addList) {
            	obj.setStatus(VOStatus.UPDATED);
//                // 从InvocationInfoProxy获取值
//                dictType.setModifier(InvocationInfoProxy.getUsername());
//                dictType.setModifierId(InvocationInfoProxy.getUserid());
//                dictType.setModifyTime(new Date());
            }
            dao.update(updateList) ;
        }
        if (CollectionUtils.isNotEmpty(removeList)) {
        	 for (KHxxVO obj : addList) {
             	obj.setStatus(VOStatus.DELETED);
             }
        	 dao.remove(removeList);
        }
        
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<KHxxVO> list) {
        if (CollectionUtils.isEmpty(list)) {
            throw new WebRuntimeException("当前没有选中数据!");
        }
        dao.remove(list);
    }
    
    //根据某一非主键字段查询实体
    public List<KHxxVO> findByKhbhs(String[] khbhs){
        String inSql = InSqlUtil.getInSubSql(khbhs);
        String sql = "select * from demo_khxx where khbh in "+inSql;
        List<KHxxVO> list = dao.queryByClause(KHxxVO.class, sql);
        return list;
    }

}
