package com.yonyou.iuap.example.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.KCVO;
import com.yonyou.iuap.example.repository.KCVODao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class KCVOService {

	
	@Autowired
    private KCVODao dao;
    

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<KCVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<KCVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<KCVO> addList, List<KCVO> updateList, List<KCVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<KCVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */
    public List<KCVO> findByYwbm(String code) {
        return dao.findByYwbm(code);
    }

    /**
     * 查询方法
     * @param pzbms
     * @return
     */
    public List<KCVO> selectAllByPzbms(List<String> pzbms) {
        if(CollectionUtils.isNotEmpty(pzbms)){
            String[] pzbmstr = pzbms.toArray(new String[pzbms.size()]);
            List<KCVO> list = dao.findByPzbms(pzbmstr);
            return list;
        }
        return null;
    }

}
