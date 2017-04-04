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

import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.repository.UserDeptDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

/**
 * <p>Title: CardTableMetaService</p>
 * <p>Description: </p>
 */
@Service
public class UserDeptService {
	
    @Autowired
    private UserDeptDao dao;
    
    /**
     * Description:通过非主键字段查询
     * List<CardTable>
     * @param str
     */
    
    /**参照id和显示字段 这里进行转换 */
	private Page<UserDeptVO> setRefName(Page<UserDeptVO> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"pk_dept.deptname", 
                    		}, pageResult
                            .getContent().toArray(new UserDeptVO[] {}));
            for (UserDeptVO item : pageResult.getContent()) {
                String id = item.getPk_user_dept();
                Map<String, Object> itemRefMap = refMap.get(id);
                if (itemRefMap != null) {
                    item.setPk_dept_name((String) itemRefMap.get("pk_dept.deptname"));
                }
            }
		}
		return pageResult ;
	}
    
    public Page<UserDeptVO> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        Page<UserDeptVO> pageResult = dao.selectAllByPage(pageRequest, searchParams.getSearchMap()) ;
//		this.setRefName(pageResult);
		return pageResult;
    }
    
    public void save(List<UserDeptVO> recordList) {
        List<UserDeptVO> addList = new ArrayList<>(recordList.size());
        List<UserDeptVO> updateList = new ArrayList<>(recordList.size());
        for (UserDeptVO meta : recordList) {
        	if (meta.getPk_user_dept() == null) {
            	meta.setPk_user_dept(UUID.randomUUID().toString());
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
    
    public void batchDeleteByPrimaryKey(List<UserDeptVO> list) {
    	dao.batchDelete(list);
    }
    
	public List<com.yonyou.iuap.example.entity.meta.Dept> findAllDept() {
        return dao.findAllDept();
    }
    
}
