package com.yonyou.iuap.crm.yg.ywsub.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import yonyou.bpm.rest.exception.RestException;
import yonyou.bpm.rest.request.RestVariable;
import yonyou.bpm.rest.response.historic.HistoricProcessInstanceResponse;

import com.yonyou.iuap.bpm.service.ProcessService;
import com.yonyou.iuap.crm.yg.ywsub.dao.Ygdemo_yw_infoDao;
import com.yonyou.iuap.crm.yg.ywsub.entity.Ygdemo_yw_info;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.jdbc.meta.access.DASFacade;

@Service
public class Ygdemo_yw_infoService {
    private Logger logger = LoggerFactory.getLogger(Ygdemo_yw_infoService.class);

    @Autowired
    private Ygdemo_yw_infoDao dao;

	@Autowired
    private Ygdemo_yw_subService childService;
	
    @Autowired
    protected ProcessService processService;
    
    @Transactional
    public Ygdemo_yw_info save(Ygdemo_yw_info entity) {
    	logger.debug("execute  Ygdemo_yw_info save .");
        return	dao.save(entity) ;
    }

    /**
     * 批量删除数据
     * 
     * @param list
     */
    @Transactional
    public void batchDeleteEntity(List<Ygdemo_yw_info> list) {
        this.batchDelChild(list);
        dao.batchDelete(list);
    }

    /**
     * 删除主表下面的子表数据
     * 
     * @param list
     * @throws DAOException
     */
    private void batchDelChild(List<Ygdemo_yw_info> list) throws DAOException {
        dao.batchDelChild(list);
    }

    /**参照id和显示字段 这里进行转换 */
	private Page<Ygdemo_yw_info> setRefName(Page<Ygdemo_yw_info> pageResult){
		if(pageResult!=null && pageResult.getContent()!=null &&pageResult.getContent().size()>0){
			/**
			 * 下面的 xx.xxx, xx表示参照对应的外键属性名， xxx是参照实体对应的属性名，
			 * */	 
			Map<String, Map<String, Object>> refMap =
                    DASFacade.getAttributeValueAsPKMap(new String[] {
                    		"zr_dw.unitname", 
                    		"zrr.psnname", 
                    		"xb_dw.unitname", 
                    		"xbr.psnname", 
                    		"qt_ld.psnname", 
                    		"zbr.psnname", 
                    		"dbr.psnname", 
                    		"create_name.name", 
                    		"update_name.name", 
                    		"unitid.unitname", 
                    		}, pageResult
                            .getContent().toArray(new Ygdemo_yw_info[] {}));
            for (Ygdemo_yw_info item : pageResult.getContent()) {
                String id = item.getId();
                Map<String, Object> itemRefMap = refMap.get(id);
                if (itemRefMap != null) {
                    item.setZr_dw_name((String) itemRefMap.get("zr_dw.unitname"));
                    item.setZrr_name((String) itemRefMap.get("zrr.psnname"));
                    item.setXb_dw_name((String) itemRefMap.get("xb_dw.unitname"));
                    item.setXbr_name((String) itemRefMap.get("xbr.psnname"));
                    item.setQt_ld_name((String) itemRefMap.get("qt_ld.psnname"));
                    item.setZbr_name((String) itemRefMap.get("zbr.psnname"));
                    item.setDbr_name((String) itemRefMap.get("dbr.psnname"));
                    item.setCreate_name_name((String) itemRefMap.get("create_name.name"));
                    item.setUpdate_name_name((String) itemRefMap.get("update_name.name"));
                    item.setUnitid_name((String) itemRefMap.get("unitid.unitname"));
                }
            }
		}
		return pageResult ;
	}
    
    /**
     * 根据传递的参数，进行分页查询
     */
    public Page<Ygdemo_yw_info> selectAllByPage(Map<String, Object> searchParams, PageRequest pageRequest) {
      	Page<Ygdemo_yw_info> pageResult = dao.selectAllByPage(pageRequest, searchParams) ;
		//this.setRefName(pageResult);
		return pageResult;
    }
 
	public List<com.yonyou.iuap.crm.corp.entity.BdCorpVO> findAllBdCorpVO() {
        return dao.findAllBdCorpVO();
    }
    
	public List<com.yonyou.iuap.crm.psn.entity.BdPsndocVO> findAllBdPsndocVO() {
        return dao.findAllBdPsndocVO();
    }
    
    
	public List<com.yonyou.iuap.crm.user.entity.ExtIeopUserVO> findAllExtIeopUserVO() {
        return dao.findAllExtIeopUserVO();
    }


	public void batchSubmitEntity(List<Ygdemo_yw_info> objs) {
		Ygdemo_yw_info yg = objs.get(0);
		try {
			List<RestVariable> variable = new ArrayList<RestVariable>();
			HistoricProcessInstanceResponse historicProcessInstanceResponse=processService.startProcessByKey("", "gsonprocess222", "6666", variable);
			yg.setState(1);
			dao.save(yg);
		} catch (RestException e) {
			// TODO 自动生成的 catch 块
			logger.error(" 流程启动失败 ");
			e.printStackTrace();
		}//bpmRestServices("").getRuntimeService().startProcessInstanceByKey(arg0, arg1)
		//gsonprocess
		
		
	}

	public void batchUnsubmitEntity(List<Ygdemo_yw_info> objs) {
		// TODO 自动生成的方法存根
		
	}
    
    
}
