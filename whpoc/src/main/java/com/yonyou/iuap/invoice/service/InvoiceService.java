package com.yonyou.iuap.invoice.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.invoice.company.CompanyVO;
import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.entity.Tsi18nVO;
import com.yonyou.iuap.invoice.repository.InvoiceDao;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class InvoiceService {
	private Logger logger = LoggerFactory.getLogger(InvoiceService.class);

	@Autowired
	private InvoiceDao dao;

	@Autowired
	private Invoice_orderService childService;

	@Transactional
	public InvoiceVO save(InvoiceVO entity) {
		logger.debug("execute  InvoiceVO save .");
		return dao.save(entity);
	}

	/**
	 * 批量删除数据
	 * 
	 * @param list
	 */
	@Transactional
	public void batchDeleteEntity(List<InvoiceVO> list) {
		this.batchDelChild(list);
		dao.batchDelete(list);
	}

	/**
	 * 删除主表下面的子表数据
	 * 
	 * @param list
	 * @throws DAOException
	 */
	private void batchDelChild(List<InvoiceVO> list) throws DAOException {
		dao.batchDelChild(list);
	}

	/** 参照id和显示字段 这里进行转换 */
	private Page<InvoiceVO> setRefName(Page<InvoiceVO> pageResult) {
		if (pageResult != null && pageResult.getContent() != null && pageResult.getContent().size() > 0) {
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 */
			Map<String, Map<String, Object>> refMap = DASFacade.getAttributeValueAsPKMap(
					new String[] { "companycode.company_name", "invoicetype.zh_value", },
					pageResult.getContent().toArray(new InvoiceVO[] {}));
			for (InvoiceVO item : pageResult.getContent()) {
				String id = item.getTsid();
				Map<String, Object> itemRefMap = refMap.get(id);
				if (itemRefMap != null) {
					item.setCompanycode_name((String) itemRefMap.get("companycode.company_name"));
					item.setInvoicetype_name((String) itemRefMap.get("invoicetype.zh_value"));
				}
			}
		}
		return pageResult;
	}

	/**
	 * 根据传递的参数，进行分页查询
	 */
	public Page<InvoiceVO> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
		Page<InvoiceVO> pageResult = dao.selectAllByPage(pageRequest, searchParams);
		this.setRefName(pageResult);
		return pageResult;
	}

	public List<CompanyVO> findAllCompany() {
		return dao.findAllCompany();
	}

	public List<Tsi18nVO> findAllTsi18n() {
		return dao.findAllTsi18n();
	}

	public InvoiceVO getByTsid(String tsid) {
		InvoiceVO result = dao.getByTsid(tsid);
		return result;
	}

}
