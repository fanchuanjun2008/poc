package com.yonyou.iuap.saleorder.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;
import com.yonyou.iuap.saleorder.dao.SaleorderDao;
import com.yonyou.iuap.saleorder.entity.Saleorder;

@Service
public class SaleorderService {

	private Logger logger = LoggerFactory.getLogger(SaleorderService.class);

	@Autowired
	private SaleOrderValidator validator;

	@Autowired
	private SaleorderDao dao;

	@Autowired
	private OrderdetailService childService;

	@Transactional
	public Saleorder save(Saleorder entity) {
		logger.debug("execute  Saleorder save .");
		if (StringUtil.isEmpty(entity.getPk_projectapp()))
			fillDefaultData(entity);

		validator.validate(entity);
		return dao.save(entity);
	}

	/**
	 * 设置默认值
	 * 
	 * @param entity
	 */
	private void fillDefaultData(Saleorder entity) {
		entity.setFstatusflag(Integer.valueOf(0));
		entity.setDbilldate(new Date());
	}

	/**
	 * 批量删除数据
	 * 
	 * @param list
	 */
	@Transactional
	public void batchDeleteEntity(List<Saleorder> list) {
		this.batchDelChild(list);
		dao.batchDelete(list);
	}

	/**
	 * 删除主表下面的子表数据
	 * 
	 * @param list
	 * @throws DAOException
	 */
	private void batchDelChild(List<Saleorder> list) throws DAOException {
		dao.batchDelChild(list);
	}

	/** 参照id和显示字段 这里进行转换 */
	private Page<Saleorder> setRefName(Page<Saleorder> pageResult) {
		if (pageResult != null && pageResult.getContent() != null
				&& pageResult.getContent().size() > 0) {
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */
			Map<String, Map<String, Object>> refMap = DASFacade
					.getAttributeValueAsPKMap(new String[] { "pk_org.orgname",
							"ccustomerid.vcustomername", "cdeptvid.dept_name",
							"corigcurrencyid.name", "billmaker.user_name",
							"modifier.user_name", }, pageResult.getContent()
							.toArray(new Saleorder[] {}));
			for (Saleorder item : pageResult.getContent()) {
				String id = item.getPk_projectapp();
				Map<String, Object> itemRefMap = refMap.get(id);
				if (itemRefMap != null) {
					item.setPk_org_name((String) itemRefMap
							.get("pk_org.orgname"));
					item.setCcustomerid_name((String) itemRefMap
							.get("ccustomerid.vcustomername"));
					item.setCdeptvid_name((String) itemRefMap
							.get("cdeptvid.dept_name"));
					item.setCorigcurrencyid_name((String) itemRefMap
							.get("corigcurrencyid.name"));
					item.setBillmaker_name((String) itemRefMap
							.get("billmaker.user_name"));
					item.setModifier_name((String) itemRefMap
							.get("modifier.user_name"));
				}
			}
		}
		return pageResult;
	}

	/**
	 * 根据传递的参数，进行分页查询
	 */
	public Page<Saleorder> selectAllByPage(Map<String, Object> searchParams,
			PageRequest pageRequest) {
		Page<Saleorder> pageResult = dao.selectAllByPage(pageRequest,
				searchParams);
		this.setRefName(pageResult);
		return pageResult;
	}

	/**
	 * 根据编码查询
	 * 
	 * @param code
	 * @return
	 */
	public List<Saleorder> findByProjectcode(String projectcode) {
		return dao.findByProjectcode(projectcode);
	}

	/**
	 * 查询除某个id外，是否存在相同编码的 实体 ，用于更新实体时验证重复
	 * 
	 * @param code
	 * @param id
	 * @return
	 */
	public List<Saleorder> findByProjectcode(String projectcode,
			String pk_projectapp) {
		return dao.findByProjectcode(projectcode, pk_projectapp);
	}

	/**
	 * 根据编码查询
	 * 
	 * @param code
	 * @return
	 */
	public List<Saleorder> findByPk_org(String pk_org) {
		return dao.findByPk_org(pk_org);
	}

	/**
	 * 查询除某个id外，是否存在相同编码的 实体 ，用于更新实体时验证重复
	 * 
	 * @param code
	 * @param id
	 * @return
	 */
	public List<Saleorder> findByPk_org(String pk_org, String pk_projectapp) {
		return dao.findByPk_org(pk_org, pk_projectapp);
	}

	public List<com.yonyou.iuap.example.entity.meta.Org> findAllOrg() {
		return dao.findAllOrg();
	}

	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
		return dao.findAllDept();
	}

//	public List<Customer> findAllCustomer() {
//		return dao.findAllCustomer();
//	}
//
//	public List<com.yonyou.iuap.example.entity.Currtype> findAllCurrtype() {
//		return dao.findAllCurrtype();
//	}

	public List<com.yonyou.iuap.example.entity.meta.SysUser> findAllSysUser() {
		return dao.findAllSysUser();
	}

	/**
	 * 审批: 1、前校验 2、调用BPM 3、回写
	 * 
	 * @param objs
	 * @return
	 */
	public List<Saleorder> approve(List<Saleorder> objs) {
		if (objs.isEmpty()) {
			return objs;
		}

		return null;
	}

	/**
	 * 审批: 1、前校验 2、调用BPM 3、回写单据
	 * 
	 * @param objs
	 * @return
	 */
	public List<Saleorder> unapprove(List<Saleorder> objs) {
		
		return null;
	}

}
