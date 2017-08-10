package com.yonyou.iuap.poc.service;

import com.yonyou.iuap.dao.DemoBdxxMapper;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.poc.entity.DemoBdxx;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class DemoBdxxService {
	@Autowired
	DemoBdxxMapper mapper;
	

    /**
     * Description:分页查询
     * Page<CardTable>
     */
    public Page<DemoBdxx> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return mapper.selectAllByPage(pageRequest, searchParams).getPage();
    }
    
    
    /**
     * Description:批量保存（包括新增和更新）
     * void
     */
    public void save(List<DemoBdxx> recordList) {
        List<DemoBdxx> addList = new ArrayList<>(recordList.size());
        List<DemoBdxx> updateList = new ArrayList<>(recordList.size());
        for (DemoBdxx cardTable : recordList) {

            if (cardTable.getPk() == null) {
            	cardTable.setPk(UUID.randomUUID().toString());
//            	cardTable.setDr(new Integer(0));
                addList.add(cardTable);
            } else {
                updateList.add(cardTable);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	mapper.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	mapper.batchUpdate(updateList);
        }
    }
    
    /**
     * Description:批量删除
     * void
     */
    public void batchDeleteByPrimaryKey(List<DemoBdxx> list) {
    	mapper.batchDeleteByPrimaryKey(list);
    }
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
}
