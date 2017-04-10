package com.yonyou.iuap.invoice.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.yonyou.iuap.invoice.entity.Tsi18nVO;
import com.yonyou.iuap.invoice.repository.Tsi18nDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

/**
 * <p>Title: CardTableMetaService</p>
 * <p>Description: </p>
 */
@Service
public class Tsi18nService {
	
    @Autowired
    private Tsi18nDao dao;
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
    
    
    public Page<Tsi18nVO> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        Page<Tsi18nVO> pageResult = dao.selectAllByPage(pageRequest, searchParams.getSearchMap()) ;
		return pageResult;
    }
    
    public void save(List<Tsi18nVO> recordList) {
        List<Tsi18nVO> addList = new ArrayList<>(recordList.size());
        List<Tsi18nVO> updateList = new ArrayList<>(recordList.size());
        for (Tsi18nVO meta : recordList) {
        	if (meta.getId() == null) {
            	meta.setId(UUID.randomUUID().toString());
            	meta.setDr(0);
                addList.add(meta);
            } else {
                updateList.add(meta);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	dao.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	dao.batchUpdate(updateList);
        }
    }
    
    public void batchDeleteByPrimaryKey(List<Tsi18nVO> list) {
    	dao.batchDelete(list);
    }
    
}
