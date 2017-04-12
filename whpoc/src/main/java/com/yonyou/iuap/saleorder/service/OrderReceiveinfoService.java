package com.yonyou.iuap.saleorder.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.saleorder.dao.SaleReceiveinfoDao;
import com.yonyou.iuap.saleorder.entity.Receiveinfo;

@Service
public class OrderReceiveinfoService {

	@Autowired
	private SaleReceiveinfoDao childDao;

	/**
	 * 需要处理searchParams
	 * @param searchParams
	 * @param pageRequest
	 * @return
	 */
	public Page<Receiveinfo> selectAllByPage(Map<String, Object> searchParams,
			PageRequest pageRequest) {		
		Page<Receiveinfo> pageResult = childDao.selectAllByPage(pageRequest,
				searchParams);
		return pageResult;
	}

	@Transactional
	public void deleteEntity(Receiveinfo entity) {
		childDao.delete(entity);
	}

}
