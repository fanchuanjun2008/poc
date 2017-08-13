package com.yonyou.iuap.example.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.BdxxVO;
import com.yonyou.iuap.example.entity.KCVO;
import com.yonyou.iuap.example.entity.KHxxVO;
import com.yonyou.iuap.example.repository.BdxxVODao;
import com.yonyou.iuap.example.utils.ConstanstUtils;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;

@Service
public class BdxxVOService {

	
	@Autowired
    private BdxxVODao dao;
	
	@Autowired
    private KCVOService kcvoServicedao;

    @Autowired
    private KHxxVOService kHxxVOService;
    

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
     * @param code
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
    
    public void fangdan(List<BdxxVO> datas) throws BusinessException{
        if(CollectionUtils.isNotEmpty(datas)){
            List<String> pzbms = new ArrayList<String>();
            List<String> khbhs = new ArrayList<String>();
            for(BdxxVO bdxxVO : datas){
                pzbms.add(bdxxVO.getPzbm());
                khbhs.add(bdxxVO.getZddwbm());
            }
            List<KCVO> kcvos = kcvoServicedao.selectAllByPzbms(pzbms);
            if(CollectionUtils.isNotEmpty(kcvos)){
                for(KCVO kcvo:kcvos){
                    String kczt = kcvo.getKczt();
                    if(ConstanstUtils.KCLOCK.equals(kczt)){
                        throw new BusinessException("品种锁定，需解锁才能放单");
                    }
                }
            }
            List<KHxxVO> khvos = kHxxVOService.selectAllByPzbms(khbhs);
            if(CollectionUtils.isNotEmpty(khvos)){
                for(KHxxVO khvo:khvos){
                    String kyzt = khvo.getKyzt();
                    if(ConstanstUtils.KHDISABLE.equals(kyzt)){
                        throw new BusinessException("客户状态为不可用，不允许放单");
                    }
                }
            }

            //进行转换为发货单逻辑

        }
    }

}
