package com.yonyou.iuap.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.BdxxVO;
import com.yonyou.iuap.example.repository.BdxxVODao;
import com.yonyou.iuap.example.repository.FHVODao;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class BdxxVOService {

	
	@Autowired
    private BdxxVODao dao;
	
	@Autowired
    private FHVODao fddao;
    

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<BdxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<BdxxVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
    }
    
    public Page<BdxxVO> selectAllByPagefor(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<BdxxVO> pageResult = dao.selectAllByPagefor(pageRequest, searchParams) ;
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<BdxxVO> addList, List<BdxxVO> updateList, List<BdxxVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<BdxxVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */
    public List<BdxxVO> findByZddh(String code) {
        return dao.findByZddh(code);
    }
    
    /*
     * 根据客户编码查出报订单数据
     */
    public List<BdxxVO> findByKhbm(String khbm){
    	return dao.findByKhbm(khbm);
    	
    }
    
    /**
     * 根据品种编码查询该品种下的报订单数据
     * @param pzbm
     * @return
     */
    public List<BdxxVO> findByPzbm(String pzbm){
    	
    	return dao.findByPzbm(pzbm);
    }
    
    public void fangdan(String data){
    	
    	
    }


}
