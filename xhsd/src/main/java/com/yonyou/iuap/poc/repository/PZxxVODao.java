package com.yonyou.iuap.poc.repository;

import com.yonyou.iuap.iweb.exception.WebRuntimeException;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;
import com.yonyou.iuap.poc.entity.PZxxExtVO;
import com.yonyou.iuap.poc.entity.PZxxVO;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
public class PZxxVODao {

	@Autowired
    @Qualifier(value = "baseDAO")
    private BaseDAO dao;
	
	//根据某一非主键字段查询实体
	public List<PZxxVO> findByPzbm(String pzbm){
		String sql = "select * from demo_pzxx where pzbm=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(pzbm);
        List<PZxxVO> list = dao.queryByClause(PZxxVO.class, sql, sqlparam);
        return list;
	}
	//根据某一非主键字段查询实体
	public List<PZxxVO> findByIsbn(String isbn){
		String sql = "select * from demo_pzxx where isbn=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(isbn);
        List<PZxxVO> list = dao.queryByClause(PZxxVO.class, sql, sqlparam);
        return list;
	}

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<PZxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
    	 String sql = " SELECT * FROM demo_pzxx ";   
         SQLParameter sqlparam = new SQLParameter();
         if (null != searchParams && !searchParams.isEmpty()) {
             sql = sql + " where ";
             for (String key : searchParams.keySet()) {
                 sql = sql + FastBeanHelper.getColumn(PZxxVO.class, key) + " like ? AND ";
                 sqlparam.addParam("%" + searchParams.get(key) + "%");
             }
             sql = sql.substring(0, sql.length() - 4);
         }
         return dao.queryPage(sql, sqlparam, pageRequest, PZxxVO.class);
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<PZxxVO> addList, List<PZxxVO> updateList, List<PZxxVO> removeList) {
        if (CollectionUtils.isNotEmpty(addList)) {
            for (PZxxVO obj : addList) {
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
            for (PZxxVO obj : addList) {
            	obj.setStatus(VOStatus.UPDATED);
//                // 从InvocationInfoProxy获取值
//                dictType.setModifier(InvocationInfoProxy.getUsername());
//                dictType.setModifierId(InvocationInfoProxy.getUserid());
//                dictType.setModifyTime(new Date());
            }
            dao.update(updateList) ;
        }
        if (CollectionUtils.isNotEmpty(removeList)) {
        	 for (PZxxVO obj : addList) {
             	obj.setStatus(VOStatus.DELETED);
             }
        	 dao.remove(removeList);
        }
        
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<PZxxVO> list) {
        if (CollectionUtils.isEmpty(list)) {
            throw new WebRuntimeException("当前没有选中数据!");
        }
        dao.remove(list);
    }

    /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<PZxxExtVO> selectAllByPageWithBd(PageRequest pageRequest, Map<String, Object> searchParams) {
        String sql = " SELECT * FROM demo_pzxxext ";
        SQLParameter sqlparam = new SQLParameter();
        if (null != searchParams && !searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(PZxxExtVO.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }

        return dao.queryPage(sql, sqlparam, pageRequest, PZxxExtVO.class);
    }
}
