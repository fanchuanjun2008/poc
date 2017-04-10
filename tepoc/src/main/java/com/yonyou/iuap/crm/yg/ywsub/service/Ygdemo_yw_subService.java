package com.yonyou.iuap.crm.yg.ywsub.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yonyou.iuap.crm.yg.ywsub.dao.Ygdemo_yw_infoDao;
import com.yonyou.iuap.crm.yg.ywsub.dao.Ygdemo_yw_subDao;
import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_sub;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;


@Service
public class Ygdemo_yw_subService {

    @Autowired
    private Ygdemo_yw_subDao childDao;

    @Autowired
    private Ygdemo_yw_infoDao dao;

    /**参照id和显示字段 这里进行转换 */
	private Page<Ygdemo_yw_sub> setRefName(Page<Ygdemo_yw_sub> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"zbr.psnname", 
                    		"create_name.name", 
                    		"update_name.name", 
                    		}, pageResult.getContent().toArray(new Ygdemo_yw_sub[] {}));
            for (Ygdemo_yw_sub item : pageResult.getContent()) {
                String id = item.getSub_id();
                Map<String, Object> itemRefMap = refMap.get(id);
                if (itemRefMap != null) {
                    item.setZbr_name((String) itemRefMap.get("zbr.psnname"));
                    item.setCreate_name_name((String) itemRefMap.get("create_name.name"));
                    item.setUpdate_name_name((String) itemRefMap.get("update_name.name"));
                }
            }
		}
		return pageResult ;
	}
    
    public Page<Ygdemo_yw_sub> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
		Page<Ygdemo_yw_sub> pageResult = childDao.selectAllByPage(pageRequest, searchParams) ;
		//this.setRefName(pageResult);
		return pageResult;
	}

    @Transactional
    public void deleteEntity(Ygdemo_yw_sub entity) {
        childDao.delete(entity);
    }

	public List<com.yonyou.iuap.crm.psn.entity.BdPsndocVO> findAllBdPsndocVO() {
        return childDao.findAllBdPsndocVO();
    }
    
	public List<com.yonyou.iuap.crm.user.entity.ExtIeopUserVO> findAllExtIeopUserVO() {
        return childDao.findAllExtIeopUserVO();
    }
    
}
