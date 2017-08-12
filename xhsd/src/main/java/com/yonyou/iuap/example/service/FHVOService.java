package com.yonyou.iuap.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.FHVO;
import com.yonyou.iuap.example.repository.FHVODao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class FHVOService {

	
	@Autowired
    private FHVODao dao;
    

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<FHVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<FHVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<FHVO> addList, List<FHVO> updateList, List<FHVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<FHVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */
    public List<FHVO> findByYwbm(String code) {
        return dao.findByYwbm(code);
    }
    public List<FHVO> findByZddwbm(String code) {
        return dao.findByZddwbm(code);
    }
    public List<FHVO> findByZddh(String code) {
        return dao.findByZddh(code);
    }


}
