package com.yonyou.iuap.saleorder.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.saleorder.dao.OrderdetailDao;
import com.yonyou.iuap.saleorder.dao.SaleorderDao;
import com.yonyou.iuap.saleorder.entity.Orderdetail;


@Service
public class OrderdetailService {

    @Autowired
    private OrderdetailDao childDao;

    @Autowired
    private SaleorderDao dao;

    
    public Page<Orderdetail> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
		Page<Orderdetail> pageResult = childDao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
	}

    @Transactional
    public void deleteEntity(Orderdetail entity) {
        childDao.delete(entity);
    }

}
