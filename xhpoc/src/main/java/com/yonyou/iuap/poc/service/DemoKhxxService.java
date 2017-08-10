package com.yonyou.iuap.poc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import com.yonyou.iuap.poc.entity.DemoKhxx;
import com.yonyou.iuap.poc.dao.DemoKhxxMapper;
import com.yonyou.iuap.mvc.type.SearchParams;

@Component
public class DemoKhxxService {
	@Autowired
	DemoKhxxMapper mapper;
	

    /**
     * Description:分页查询
     * Page<CardTable>
     * @param str
     */
    public Page<DemoKhxx> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return mapper.selectAllByPage(pageRequest, searchParams).getPage();
    }
    
    
    /**
     * Description:批量保存（包括新增和更新）
     * void
     * @param str
     */
    public void save(List<DemoKhxx> recordList) {
        List<DemoKhxx> addList = new ArrayList<>(recordList.size());
        List<DemoKhxx> updateList = new ArrayList<>(recordList.size());
        for (DemoKhxx cardTable : recordList) {

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
    public void batchDeleteByPrimaryKey(List<DemoKhxx> list) {
    	mapper.batchDeleteByPrimaryKey(list);
    }
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
}
