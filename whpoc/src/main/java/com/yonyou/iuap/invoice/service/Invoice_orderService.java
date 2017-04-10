package com.yonyou.iuap.invoice.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.entity.Invoice_order;
import com.yonyou.iuap.invoice.repository.InvoiceDao;
import com.yonyou.iuap.invoice.repository.Invoice_orderDao;


@Service
public class Invoice_orderService {

    @Autowired
    private Invoice_orderDao childDao;

    @Autowired
    private InvoiceDao dao;

    
    public Page<Invoice_order> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
		Page<Invoice_order> pageResult = childDao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
	}

    @Transactional
    public void deleteEntity(Invoice_order entity) {
        childDao.delete(entity);
    }

}
