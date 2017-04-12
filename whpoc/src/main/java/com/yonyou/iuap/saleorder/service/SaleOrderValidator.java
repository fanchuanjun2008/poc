package com.yonyou.iuap.saleorder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.yonyou.iuap.persistence.vo.pub.ValidationException;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;
import com.yonyou.iuap.saleorder.dao.SaleorderDao;
import com.yonyou.iuap.saleorder.entity.Orderdetail;
import com.yonyou.iuap.saleorder.entity.Saleorder;

@Component
public class SaleOrderValidator {

	@Autowired
	private SaleorderDao dao;
//	@Autowired
//	private ICustomerPubService service;

	public void validate(Saleorder entity) {
		List<Orderdetail> list = entity.getId_orderdetail();
		StringBuffer errorbuf = new StringBuffer();

		// 校验客户
		String customerid = entity.getCcustomerid();
		if (!StringUtil.isEmpty(customerid)) {
//			Customer cust = service.queryCustomer(customerid);
//			if (cust.getEnablestatus().equals("1")) {
//				errorbuf.append("客户" + cust.getVcustomername() + "不合法");
//			}
		}

		// 子表校验
		if (list != null) {
			for (Orderdetail detail : list) {
				String materid = detail.getCmaterialid();
				if (StringUtil.isEmpty(materid)) {
					errorbuf.append("编码不能为空,\n");
				}

				// 主数量>0价格>0
				Integer num = detail.getNastnum();
				if (num != null) {
					if (num.intValue() <= 0) {
						errorbuf.append("数量应该大于0,\n");
					}
				}
				Double price = detail.getNqtorigprice();
				if (price != null && price.doubleValue() < 0) {
					errorbuf.append("价格应该大于等于0,\n");
				}
			}
		}

		if (errorbuf.length() > 0) {
			throw new ValidationException(errorbuf.toString());
		}
	}

}
