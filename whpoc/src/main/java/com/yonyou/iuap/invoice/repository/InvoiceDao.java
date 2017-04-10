package com.yonyou.iuap.invoice.repository;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.invoice.company.CompanyVO;
import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.entity.Invoice_order;
import com.yonyou.iuap.invoice.entity.Tsi18nVO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.persistence.vo.pub.VOStatus;

@Repository
public class InvoiceDao {

	@Autowired
	private MetadataDAO dao;

	@Transactional
	public InvoiceVO save(InvoiceVO entity) {
		if (entity.getTsid() == null) {
			entity.setStatus(VOStatus.NEW);
			entity.setTsid(UUID.randomUUID().toString());
			entity.setDr(0);// 未删除标识
		} else {
			entity.setStatus(VOStatus.UPDATED);
		}

		if (entity.getId_invoice_order() != null && entity.getId_invoice_order().size() > 0) {
			for (Invoice_order child : entity.getId_invoice_order()) {
				if (child.getInvoiceorderid() == null) {
					child.setStatus(VOStatus.NEW);
					child.setDr(entity.getDr());
				} else {
					child.setStatus(VOStatus.UPDATED);
				}
			}
			dao.save(entity,
					entity.getId_invoice_order().toArray(new Invoice_order[entity.getId_invoice_order().size()]));
		} else {
			dao.save(entity);
		}
		return entity;
	}

	public int delete(InvoiceVO entity) throws Exception {

		if (null == entity) {
			return 0;
		}
		dao.remove(entity);
		return 1;
	}

	public Page<InvoiceVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams)
			throws DAOException {

		String sql = " select * from whpoc_Invoice"; // user_name = ?
		SQLParameter sqlparam = new SQLParameter();

		if (null != searchParams && !searchParams.isEmpty()) {
			sql = sql + " where ";
			for (String key : searchParams.keySet()) {
				sql = sql + FastBeanHelper.getColumn(InvoiceVO.class, key) + " like ? AND ";
				sqlparam.addParam("%" + searchParams.get(key) + "%");
			}
			sql = sql.substring(0, sql.length() - 4);
		}
		return dao.queryPage(sql, sqlparam, pageRequest, InvoiceVO.class);
	}

	public InvoiceVO getByTsid(String tsid) throws DAOException {
		return dao.queryByPK(InvoiceVO.class, tsid);
	}

	public void batchDelete(List<InvoiceVO> list) throws DAOException {

		dao.remove(list);
	}

	public void batchDelChild(List<InvoiceVO> list) throws DAOException {
		SQLParameter sqlparam = new SQLParameter();
		String deleteSQL = SQLHelper.createDeleteIn("whpoc_invoice_order", "fk_id_invoice_order", list.size());
		for (InvoiceVO item : list) {
			sqlparam.addParam(item.getTsid());
		}
		dao.update(deleteSQL, sqlparam);
	}

	public List<CompanyVO> findAllCompany() {
		return dao.queryAll(CompanyVO.class);
	}

	public List<Tsi18nVO> findAllTsi18n() {
		return dao.queryAll(Tsi18nVO.class);
	}

}
