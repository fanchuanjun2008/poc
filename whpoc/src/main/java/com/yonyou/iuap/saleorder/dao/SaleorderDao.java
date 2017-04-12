package com.yonyou.iuap.saleorder.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;
import com.yonyou.iuap.saleorder.entity.Orderdetail;
import com.yonyou.iuap.saleorder.entity.Saleorder;
//import com.yonyou.train_api.itf.ITrainInterface;


@Repository
public class SaleorderDao {

	@Resource(name="baseDAO")
    private BaseDAO dao;
	
	@Autowired
	private SaleReceiveinfoDao infodao;

	@Transactional
    public Saleorder save(Saleorder entity) {
    	if(entity.getPk_projectapp() ==null ){
    		 entity.setStatus(VOStatus.NEW);
    		 entity.setPk_projectapp(UUID.randomUUID().toString());    		
             entity.setDr(0);// 未删除标识         
    	}else{
    		entity.setStatus(VOStatus.UPDATED);
    	}
    	
    	if(entity.getId_receiveinfo()!=null&&entity.getId_receiveinfo().size()>0){
    		infodao.saveEntity(entity);
    	}
		if(entity.getId_orderdetail()!=null && entity.getId_orderdetail().size()>0){
    		for(Orderdetail child : entity.getId_orderdetail() ){
    			if(child.getPk_orderdetail() == null ){
    				child.setStatus(VOStatus.NEW);
    				child.setDr(entity.getDr());
    				child.setPk_orderdetail(UUID.randomUUID().toString());
    				child.setFk_id_orderdetail(entity.getPk_projectapp());
    				child.setTs(new Date());
    			}else{
    				child.setStatus(VOStatus.UPDATED);
    			}
    		}
    		dao.save(entity, entity.getId_orderdetail().toArray(new Orderdetail[entity.getId_orderdetail().size()]));
    	}else{
    		dao.save(entity);
    	}
    	return entity ;
    }


    public int delete(Saleorder entity) throws Exception {

        if (null == entity) {
            return 0;
        }
        dao.remove(entity);
        return 1;
    }

    public Page<Saleorder> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) throws DAOException {
    	//check.checkMyTest();
        String sql = " select * from train_saleorder"; // user_name = ?
        SQLParameter sqlparam = new SQLParameter();

     	if (null != searchParams && !searchParams.isEmpty()) {
            sql = sql + " where ";
            for (String key : searchParams.keySet()) {
                sql = sql + FastBeanHelper.getColumn(Saleorder.class, key) + " like ? AND ";
                sqlparam.addParam("%" + searchParams.get(key) + "%");
            }
            sql = sql.substring(0, sql.length() - 4);
        }
        return dao.queryPage(sql, sqlparam, pageRequest, Saleorder.class);
    }

    public void batchDelete(List<Saleorder> list) throws DAOException {

        dao.remove(list);
    }

    public void batchDelChild(List<Saleorder> list) throws DAOException {
        SQLParameter sqlparam = new SQLParameter();
		String deleteSQL = SQLHelper.createDeleteIn("train_orderdetail", "fk_id_orderdetail", list.size());
        for (Saleorder item : list) {
            sqlparam.addParam(item.getPk_projectapp());
        }
        dao.update(deleteSQL, sqlparam);
    }     
  
	public List<Saleorder> findByProjectcode(String projectcode) throws DAOException {

        String sql = "SELECT * FROM train_saleorder where projectcode=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(projectcode);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
    }
    
    public List<Saleorder> findByProjectcode(String projectcode, String id) {
        String sql = " SELECT * FROM train_saleorder where projectcode=? AND pk_projectapp !=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(projectcode);
        sqlparam.addParam(id);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
    }
  
	public List<Saleorder> findByPk_org(String pk_org) throws DAOException {
        String sql = "SELECT * FROM train_saleorder where pk_org=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(pk_org);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
    }
    
    public List<Saleorder> findByPk_org(String pk_org, String id) {
        String sql = " SELECT * FROM train_saleorder where pk_org=? AND pk_projectapp !=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(pk_org);
        sqlparam.addParam(id);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
    }

	public List<com.yonyou.iuap.example.entity.meta.Org> findAllOrg() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.Org.class);
    }
    
	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.Dept.class);
    }
    
//	public List<Customer> findAllCustomer() {
//        return dao.queryAll(Customer.class);
//    }
//    
//	public List<com.yonyou.iuap.example.entity.Currtype> findAllCurrtype() {
//        return dao.queryAll(com.yonyou.iuap.example.entity.Currtype.class);
//    }
    
	public List<com.yonyou.iuap.example.entity.meta.SysUser> findAllSysUser() {
        return dao.queryAll(com.yonyou.iuap.example.entity.meta.SysUser.class);
    }
    
	public List<Saleorder> findByCode(String code){
		String sql = " SELECT * FROM train_saleorder where projectcode=? ";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(code);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
	}
	
	public List<Saleorder> findByCodeandID(String code,String id){
		String sql = " SELECT * FROM train_saleorder where projectcode=? and pk_projectapp !=?";
        SQLParameter sqlparam = new SQLParameter();
        sqlparam.addParam(code);
        sqlparam.addParam(id);
        return  dao.queryByClause(Saleorder.class, sql, sqlparam);
	}
}
