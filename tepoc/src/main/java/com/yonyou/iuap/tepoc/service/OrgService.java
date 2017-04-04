package com.yonyou.iuap.tepoc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.tepoc.entity.OrgVO;
import com.yonyou.iuap.tepoc.repository.OrgDao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class OrgService {

	
	@Autowired
    private OrgDao dao;
    
    /**参照id和显示字段 这里进行转换 */
	private Page<OrgVO> setRefName(Page<OrgVO> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"parentid.name", 
                    		}, pageResult
                            .getContent().toArray(new OrgVO[] {}));
            for (OrgVO item : pageResult.getContent()) {
                String id = item.getOrgid();
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
    public Page<OrgVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<OrgVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
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
    public void save(List<OrgVO> addList, List<OrgVO> updateList, List<OrgVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<OrgVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */


}
