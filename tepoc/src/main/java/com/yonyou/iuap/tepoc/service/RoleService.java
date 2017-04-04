package com.yonyou.iuap.tepoc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.yonyou.iuap.tepoc.entity.RoleVO;
import com.yonyou.iuap.tepoc.repository.RoleDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

/**
 * <p>Title: CardTableMetaService</p>
 * <p>Description: </p>
 */
@Service
public class RoleService {
	
    @Autowired
    private RoleDao dao;
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
    
    
    public Page<RoleVO> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        Page<RoleVO> pageResult = dao.selectAllByPage(pageRequest, searchParams.getSearchMap()) ;
		return pageResult;
    }
    
    public void save(List<RoleVO> recordList) {
        List<RoleVO> addList = new ArrayList<>(recordList.size());
        List<RoleVO> updateList = new ArrayList<>(recordList.size());
        for (RoleVO meta : recordList) {
        	if (meta.getPk_role() == null) {
            	meta.setPk_role(UUID.randomUUID().toString());
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
    
    public void batchDeleteByPrimaryKey(List<RoleVO> list) {
    	dao.batchDelete(list);
    }
    
}
