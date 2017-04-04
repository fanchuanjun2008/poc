package com.yonyou.iuap.tepoc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.tepoc.entity.DeptVO;
import com.yonyou.iuap.tepoc.repository.DeptDao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class DeptService {

	
	@Autowired
    private DeptDao dao;
    
    /**参照id和显示字段 这里进行转换 */
	private Page<DeptVO> setRefName(Page<DeptVO> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"parentid.name", 
                    		}, pageResult
                            .getContent().toArray(new DeptVO[] {}));
            for (DeptVO item : pageResult.getContent()) {
                String id = item.getPk_dept();
                Map<String, Object> itemRefMap = refMap.get(id);
                if (itemRefMap != null) {
                    item.setParentid_name((String) itemRefMap.get("parentid.name"));
                }
            }
		}
		return pageResult ;
	}

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<DeptVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<DeptVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
//		this.setRefName(pageResult);
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<DeptVO> addList, List<DeptVO> updateList, List<DeptVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<DeptVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */


}
