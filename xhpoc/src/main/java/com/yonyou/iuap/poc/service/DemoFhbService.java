package com.yonyou.iuap.poc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import com.yonyou.iuap.poc.entity.DemoFhb;
import com.yonyou.iuap.poc.dao.DemoFhbMapper;
import com.yonyou.iuap.mvc.type.SearchParams;

@Component
public class DemoFhbService {
	@Autowired
	DemoFhbMapper mapper;
	

    /**
     * Description:分页查询
     * Page<CardTable>
     * @param str
     */
    public Page<DemoFhb> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return mapper.selectAllByPage(pageRequest, searchParams).getPage();
    }
    
    
    /**
     * Description:批量保存（包括新增和更新）
     * void
     * @param str
     */
    public void save(List<DemoFhb> recordList) {
        List<DemoFhb> addList = new ArrayList<>(recordList.size());
        List<DemoFhb> updateList = new ArrayList<>(recordList.size());
        for (DemoFhb cardTable : recordList) {

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
     * @param str
     */
    public void batchDeleteByPrimaryKey(List<DemoFhb> list) {
    	mapper.batchDeleteByPrimaryKey(list);
    }
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */

}
