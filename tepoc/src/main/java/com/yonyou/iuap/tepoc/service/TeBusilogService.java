package com.yonyou.iuap.tepoc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import com.yonyou.iuap.tepoc.entity.TeBusilogVO;
import com.yonyou.iuap.tepoc.repository.TeBusilogMapper;
import com.yonyou.iuap.mvc.type.SearchParams;

@Component
public class TeBusilogService {
	@Autowired
	TeBusilogMapper mapper;
	

    /**
     * Description:分页查询
     * Page<CardTable>
     * @param str
     */
    public Page<TeBusilogVO> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return mapper.selectAllByPage(pageRequest, searchParams).getPage();
    }
    
    
    /**
     * Description:批量保存（包括新增和更新）
     * void
     * @param str
     */
    public void save(List<TeBusilogVO> recordList) {
        List<TeBusilogVO> addList = new ArrayList<>(recordList.size());
        List<TeBusilogVO> updateList = new ArrayList<>(recordList.size());
        for (TeBusilogVO cardTable : recordList) {

            if (cardTable.getId() == null) {
            	cardTable.setId(UUID.randomUUID().toString());
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
    public void batchDeleteByPrimaryKey(List<TeBusilogVO> list) {
    	mapper.batchDeleteByPrimaryKey(list);
    }
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
}
