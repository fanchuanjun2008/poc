package com.yonyou.iuap.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.PZxxVO;
import com.yonyou.iuap.example.repository.PZxxVODao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class PZxxVOService {

	
	@Autowired
    private PZxxVODao dao;
    

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<PZxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<PZxxVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<PZxxVO> addList, List<PZxxVO> updateList, List<PZxxVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<PZxxVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */
    public List<PZxxVO> findByPzbm(String code) {
        return dao.findByPzbm(code);
    }
    public List<PZxxVO> findByIsbn(String code) {
        return dao.findByIsbn(code);
    }


}
