package com.yonyou.iuap.example.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.KHxxVO;
import com.yonyou.iuap.example.repository.KHxxVODao;

@Service
public class KHxxVOService {

	
	@Autowired
    private KHxxVODao dao;
    

	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<KHxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<KHxxVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		return pageResult;
    }
    
    /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<KHxxVO> selectAllByPagekh(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<KHxxVO> pageResult = dao.selectAllByPagekh(pageRequest, searchParams) ;
		return pageResult;
    }

    /**
     * 批量保存，更新，删除方法
     * @param addList
     * @param updateList
     * @param removeList
     */
    @Transactional
    public void save(List<KHxxVO> addList, List<KHxxVO> updateList, List<KHxxVO> removeList) {
    	dao.save(addList, updateList, removeList);
    }

    /**
     * 批量删除
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<KHxxVO> list) {
    	dao.batchDeleteByPrimaryKey(list);
    }

    /**
     * 用于保存时候的编码重复校验
     * @param dictTypeCode
     * @return
     */
    public List<KHxxVO> findByKhbh(String code) {
        return dao.findByKhbh(code);
    }

    /**
     * 查询方法
     * @param pzbms
     * @return
     */
    public List<KHxxVO> selectAllByPzbms(List<String> khbhs) {
        if(CollectionUtils.isNotEmpty(khbhs)){
            String[] khbhstr = khbhs.toArray(new String[khbhs.size()]);
            List<KHxxVO> list = dao.findByKhbhs(khbhstr);
            return list;
        }
        return null;
    }
    
}
