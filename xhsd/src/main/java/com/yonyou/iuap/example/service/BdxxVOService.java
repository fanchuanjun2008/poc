package com.yonyou.iuap.example.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.example.entity.BdxxVO;
import com.yonyou.iuap.example.entity.FHVO;
import com.yonyou.iuap.example.entity.KCVO;
import com.yonyou.iuap.example.entity.KHxxVO;
import com.yonyou.iuap.example.repository.BdxxVODao;
import com.yonyou.iuap.example.utils.ConstanstUtils;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;

@Service
public class BdxxVOService {

	
	@Autowired
    private BdxxVODao dao;
	
	@Autowired
    private KCVOService kcvoServicedao;

    @Autowired
    private KHxxVOService kHxxVOService;
    
    @Autowired
    private FHVOService fhvoService;
    
	  /**
     * 分页查询方法
     * @param pageRequest
     * @param searchParams
     * @return
     */
    public Page<BdxxVO> selectAllByPage(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<BdxxVO> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
        this.setRefName(pageResult);
		return pageResult;
    }
    
    public Page<BdxxVO> selectAllByPagefor(PageRequest pageRequest, Map<String, Object> searchParams) {
        Page<BdxxVO> pageResult = dao.selectAllByPagefor(pageRequest, searchParams) ;
        this.setRefName(pageResult);
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
    
    @Transactional
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
            List<FHVO> listfh=new ArrayList<FHVO>();
            List<KCVO> listupdate=new ArrayList<KCVO>();
            List<BdxxVO> listBdxxVOs=new ArrayList<BdxxVO>();
            Set<String> pzs=new HashSet<String>();
            for(BdxxVO vo:datas){
            	FHVO fhvo=new FHVO();
            	BdxxVO bdxxVO= findByZddh(vo.getZddh()).get(0);
            	fhvo.setYwbm(vo.getYwbm());
            	fhvo.setZddwbm(vo.getZddwbm());
            	fhvo.setZddh(vo.getZddh());
            	fhvo.setPzbm(vo.getPzbm());
            	fhvo.setFhsl(vo.getFhsl());
            	fhvo.setFhzk(vo.getFhzk());
            	fhvo.setFdrq(new Date());
            	fhvo.setFdr("admin");
            	fhvo.setClzt("b");
            	fhvo.setBz("新华书店发货");
            	bdxxVO.setFhsl(bdxxVO.getFhsl().add(vo.getFhsl()));
            	listfh.add(fhvo);
            	pzs.add(vo.getPzbm());
            	listBdxxVOs.add(bdxxVO);
            }
            for(String pz:pzs){
            	List<KCVO> listkc=kcvoServicedao.findKCVO(pz);
            	KCVO kcvo=listkc.get(0);
            	BigDecimal add=new BigDecimal(0);
            	for(BdxxVO vo:datas){
            		if(vo.getPzbm().equalsIgnoreCase(pz)){
            			add=add.add(vo.getFhsl());
            		}
            	}
            	
            	if(kcvo.getKcsl().compareTo(add)<=0){
            		 throw new BusinessException("品种编码为"+kcvo.getPzbm()+"的品种发货数量不能大于库存数量");
            	}else{
            		kcvo.setKcsl(kcvo.getKcsl().subtract(add));
            		listupdate.add(kcvo);
            	}
            	
            	
            }
            this.save(null, listBdxxVOs, null);
            kcvoServicedao.save(null, listupdate, null);
            fhvoService.save(listfh, null, null);
        }
    }
    
    /**进行code与name翻译**/
    private Page<BdxxVO> setRefName(Page<BdxxVO> pageResult) {
        if (pageResult != null && pageResult.getContent() != null && pageResult.getContent().size() > 0) {

			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {"zddwbm.khmc", "pzbm.sm"}, pageResult
                            .getContent().toArray(new BdxxVO[] {}));
            for (BdxxVO bdvo : pageResult.getContent()) {
                String pk = bdvo.getId_bdxx();
                Map<String, Object> jobRefMap = refMap.get(pk);
                if (jobRefMap != null) {
                	bdvo.setZddwbmName((String) jobRefMap.get("zddwbm.khmc"));
                	bdvo.setPzbmName((String) jobRefMap.get("pzbm.sm"));
                }
            }
        }

        return pageResult;
    }

}
